# FloatTest — 浮点 IP 的 Coq 计算测试方案

## cfg_target 当前 Rocq spec 状态

`INPUT/cfg_target` 的 12 道题现在分别在 `FloatTest/cases/<题名>/` 下包含：

- `spec.v`：实际的 binary64 算法/路径 spec；
- `tests.v`：由当前 C reference vectors 生成的正例定理，以及故意改错期望值的负例定理；
- `README.md`：说明 spec、通过原因、依赖隔离和覆盖边界；
- `spec_snapshot.json`：绑定当前 C、spec、driver、vector、emitter 和 runner 的 SHA-256。

当前合计 431 条正例和 12 条负例。统一检查：

```bash
bash FloatTest/tools/run_all_cfg_target_coq_specs.sh
```

聚合编译入口为 `FloatTest/cases/CfgTarget_all_tests.v`。这里的“通过”表示 Rocq
对 `spec.v` 实际求值后与当前 C 输出逐位一致，不是 Python 测试状态的再包装。

> 目标：对 `INPUT/SAMCodeSynthesis/` 下 9 个含浮点的 IP（PseudoRate、
> ThreeAxisController、SAMSubModeRoll/Pitch/Damp、GyroStateGet、GyroPick、
> GyroAttiDetermine、DSSDataGet），不走 QCP 分离逻辑全链路，改用
> **"Coq spec + 差分测试"** 的方式验证其纯功能行为。

---

## 1. 为什么不走 QCP 全链路（背景）

之前 4 个整数 IP（SendUartData、UartInit、JetCtrlSend、B_TcProcess）走的都是
symexec → 分离逻辑 VC → Coq 证明的全链路。浮点 IP 走不通，原因在工具侧，
不在数学侧（详见 `docs/float-verification-guide.md` §11）：

- QCP v2.0.4 对**纯值传递**的浮点函数支持良好（float_one、float_clamp 已验证）；
- 但**从内存/结构体里读浮点数**目前会把 bit pattern 当成 `Z` 处理，
  无法还原成 `fp32` 参与运算（`float_read`、`StructFilter_FP` 都卡在这里）。
- 而这 9 个 IP 恰恰全部是"从结构体读浮点数组 → 浮点运算 → 写回"。

因此采用测试路线：只关心纯功能（pure functional）行为，内存/分离逻辑部分不涉及。

## 2. 具体要验证的是什么（以及不验证什么）

这 9 个 IP 本质上都是**纯函数**：

```text
输入：若干 float32 数组（角度、角速度、阈值、控制参数）
输出：float32 数组 / 整数标志（控制量、模式字、脉冲标志）
```

例如：

- **PseudoRate**：每轴比较 `pu[i] - r[i]` 与阈值 `±h1[i]`，输出脉冲标志
  `Yp/Yn`（整数），并更新反馈 `r[i] = 0.9231f * r[i] ± 0.07688f`。
- **ThreeAxisController**：每轴 `Up = clamp(pAngle, ±8)`、
  `Ud = clamp(pRate - destRate, ±1.2)`、`fy = Up*Kp + Ud*Kd`、
  `u = clamp(fy, ±1.3)`。

测试验证的是：

1. **spec 忠实性**：我们为每个 IP 写的 Coq spec 函数（对 C 算法的逐行翻译）
   在采样输入上与真实 C 程序输出**逐位一致**（bit-exact）。
   这回答"我们理解的算法和代码实现是不是一回事"。
2. **算法健全性**：在采样输入上输出无 NaN/Inf、满足设计范围（如限幅
   `|u| ≤ 1.3`）、整数标志取值合法。

**不验证的**（诚实声明）：

- 不是全称证明：采样之外的输入没有覆盖（但有 `vm_compute` 背书的采样点
  是精确的 Coq 定理，不是模拟）。
- 内存安全、指针正确性、并发、时序——本来也不在范围内。
- 如果后续要全称性定理，简单性质（如限幅输出界）可以在 Coq 里真证，
  本方案的 spec 库可以直接复用。

## 3. 已实测确认的技术基础（2026-07 本仓库实测）

| 能力 | 结论 | 依据 |
|---|---|---|
| fp32 语义 | `SimpleC.SL.FloatLib`：`fp32 = binary32`（Flocq），`fp32_add/sub/mul/div = Bplus/Bminus/Bmult/Bdiv 24 128 mode_NE`，与 C 的 IEEE 单精度、最近舍入一致 | `SeparationLogic/SeparationLogic/FloatLib.v` |
| 可计算性 | `vm_compute` 可求值：`0.5+0.25` bits = `0x3F400000` ✓；`Bcompare 24 128` 给出 `Some Lt/Gt/Eq/None`（NaN→None，与 C 的比较为 false 一致） | `.tmp/floattest/spike3.v` |
| 位级注入 | `b32_of_bits : Z -> binary32` 从 C 的 bit pattern 构造值；`bits_of_b32` 读回 | `SeparationLogic/flocq/src/IEEE754/Bits.v` |
| 参考真值 | 本机有 gcc（TDM-GCC 10.3.0），可直接编译运行**原始 C 代码** + `std_utils.c` 输出参考 bit pattern，无需模拟（无双舍入风险） | `which gcc` |
| 测试即定理 | 每个测试点 = 一条 Coq 引理：`bits_of_b32 (spec_fn input) = expected`，`vm_compute; reflexivity` 判定。coqc 编译通过 = 全部测试通过 | spike 实测 |

浮点 IP 还共享 `std_utils.c`（LimitFloat、MatrixMultiF、ModPNHP 等约 285 行
的工具函数），参考侧直接编译即可，不需要 stub。

## 4. 工作流程（工具链）

```text
            ┌─────────────────────────────┐
            │ 原始 C（IP_*.c + std_utils.c）│
            └──────┬──────────────┬───────┘
              人工转写            │ gcc 编译 + 随机输入驱动
                   ▼              ▼
   OUTPUT/.../<X>/rocq/spec.v   OUTPUT/.../<X>/reports/vectors.txt
        （Coq 函数，fp32）        （输入/输出 bit patterns）
                   │              │
                   ▼              ▼
              tools/emit_tests.py 生成
        OUTPUT/.../<X>/rocq/tests.v
        （每条向量一条 vm_compute 定理）
                   │
                   ▼
        tools/run_tests.sh（固定 coq_tooling.py check）
              全过 = 测试通过
```

**产物位置（2026-07-24 起）**：每个 case 的最终产物归档在
`OUTPUT/<批次>/<X>/`（`source/` 参考驱动、`rocq/` spec+tests、
`reports/` 向量+检查单、根目录中文 README），与整数 IP 的交付惯例一致；
批次目录为 `SAMCodeSynthesis` 或 `iplib`（对应 `INPUT/<批次>/`）。
唯一的例外是 PseudoRate 试点，保留旧布局 `FloatTest/{ref,cases,vectors}/`。
`run_tests.sh` 与 `emit_tests.py` 自动识别三种布局，一键命令不变。
iplib 源码在 `INPUT/iplib/<X>/source/`（无 std_utils.c，部分 case 需要
`source/<X>_cflags.txt` 注入原项目缺失的宏，如 `-DWKMD_EIM=0x11`）。

- `lib/FloatTestCommon.v`：公共包装（bits 注入/读出、布尔化比较、
  输出比较 `out_eq` 等公共 helper）。
- `<case>/source/<X>_main.c`：每个 IP 的 C 驱动（随机输入覆盖：
  均匀分布 + 边界值 + 特殊值），编译运行，把输入/输出的 IEEE bit
  pattern 落到 `reports/vectors.txt`；旧布局则落到 `vectors/`。
- `tools/emit_tests.py`：把向量转成 `tests.v`（按 case 的 EMITTERS 登记
  发射函数，函数名登记在 `FUN_NAMES`）。
- `tools/run_tests.sh`：`OUTPUT` 布局沿用根 `_CoqProject`，旧 `FloatTest`
  布局通过固定 `coq_tooling.py check` 在隔离 build workspace 编译；
  参考程序 exe 落在 `.tmp/floattest/`。

### ThreeAxisController 实测

`ThreeAxisController` 已按上述 spec 测试流程接入：

- spec：`cases/ThreeAxisController/spec.v`
- C 参考驱动：`ref/ThreeAxisController_main.c`
- 向量与 Coq 定理：`vectors/ThreeAxisController.txt`、`cases/ThreeAxisController/tests.v`
- 复现命令：`bash FloatTest/tools/run_three_axis_tests.sh 30`
- 结果：30 条 bit-pattern 正例定理及 1 条错误期望负例定理全部通过。

参考驱动显式初始化 `CTRL_PARAM_SAM[].Kp/Kd`，以确保输入参数确实进入原始 C 函数。

两个 Flocq case 现在都有逐例说明：

- `cases/PseudoRate/README.md`：1000 条正例 + 1 条错误期望负例；
- `cases/ThreeAxisController/README.md`：30 条正例 + 1 条错误期望负例。

`INPUT/cfg_target` 的当前交付只以 `cases/<题名>/spec.v` 和
`cases/<题名>/tests.v` 为准；完整索引见 `cases/README.md`。旧的 C/Python
harness 运行结果不计作 Rocq spec 通过。

## 5. 工作量估计

| 部分 | 内容 | 估计 |
|---|---|---|
| 框架（一次性） | FloatTestCommon + run_reference + emit_tests + run_tests | ~0.5 天 |
| PseudoRate（试点） | 30 行、1 个阈值比较 + 3 条浮点更新式 | 1–2 小时 |
| ThreeAxisController | 35 行 + LimitFloat | 1–2 小时 |
| SAMSubModeRoll/Pitch/Damp | 各 ~45 行，结构类似 | 各 1–2 小时 |
| GyroStateGet / GyroPick | 38–74 行，有矩阵/查表逻辑 | 各 2–4 小时 |
| GyroAttiDetermine / DSSDataGet | 78–93 行，最重 | 各 3–4 小时 |
| **合计** | 框架 + 9 个 IP | **约 4–8 天**（可按 IP 逐个交付） |

主要成本在"读 C 并转写成 Coq 函数"——每个 IP 必须逐行核对类型
（`float` 还是 `double`、字面量带不带 `f`、整数/浮点混合运算的转换），
差分测试会立刻抓出转写错误。

## 6. 风险与注意事项

1. **编译器浮点收缩（FMA contraction）**：gcc 默认在非 ISO 模式会把
   `a*b+c` 合成 FMA（不同舍入）。参考侧用 `-std=c11`（与仓库
   `compile.sh` 一致，ISO 模式下收缩关闭），不开 `-ffast-math`。
2. **字面量精度**：`0.9231f`（float）与 `0.9231`（double）舍入不同，
   转写时严格按 C 后缀；混合精度表达式按 C 的 usual arithmetic
   conversions 插入显式转换。
3. **NaN 语义**：`Bcompare` 遇 NaN 返回 `None`；C 中 NaN 的 `<`/`>` 均
   为 false。spec 的布尔比较统一封装，保持与 C 短路语义一致。
4. **整数侧**：IP 中的整数输出（Yp/Yn、模式字）按 Z/bit pattern 直接
   对比，无需浮点语义。
5. **测试规模**：每 IP 计划 1000–10000 条向量（随机 + 定向边界）。
   `vm_compute` 在 fp32 上是整数运算，千级向量单文件编译在秒到分钟级，
   必要时按 1000 条/文件分片。

## 7. 与"学长的流程"的对应关系

- "生成测试用例然后带入 coq 规约" → vectors + emit_tests.py。
- "把分离逻辑的部分全扔掉" → 方案里根本没有分离逻辑：不写 annotation、
  不跑 symexec，spec 直接写 Coq 函数（spec 本来就是 Coq，无需解析
  VC 字符串；`/*@ Extern Coq */` 那套也不涉及）。
- "求解规约是不是 sat" → 每个采样点用 `vm_compute` 判定 spec 等式/
  谓词成立；这些判定结果是**精确的 Coq 定理**（不是近似）。

---

## 8. 试点结果（PseudoRate，2026-07-16）

进度：PseudoRate ✅ · ThreeAxisController ✅ · SAMSubModeRoll ✅ ·
SAMSubModePitch ✅ · SAMSubModeDamp ✅ · GyroPick ✅ · DSSDataGet ✅ ·
GyroStateGet ✅ · 仅剩 GyroAttiDetermine（矩阵求逆、fp64 floor、
跨调用状态，最重）待做。

试点按 §4 流程完整跑通：

| 步骤 | 产物 | 结果 |
|---|---|---|
| spec 转写 | `FloatTest/cases/PseudoRate/spec.v`（9 个 fp32 输入 → Yp/Yn/r′，常量为 bits 注入） | 固定 Coq 检查通过 |
| 参考程序 | `FloatTest/ref/PseudoRate_main.c`（gcc `-std=c11 -O0` 编译原始 `IP_PseudoRate.c`） | 构建通过 |
| 向量 | `FloatTest/vectors/PseudoRate.txt`（1000 条：随机均匀 + 7 类定向边界） | 生成 |
| 差分测试 | `FloatTest/cases/PseudoRate/tests.v`（1000 条 vm_compute 定理） | **1000/1000 通过，6.6s** |
| 阴性自检 | 故意改错一条期望值 | 证明真实结果不等于错误期望（工具链确实在测东西） |

一键复现：

```bash
bash FloatTest/tools/run_tests.sh PseudoRate 1000
# 输出 PASS: PseudoRate (1000 vectors)
```

试点结论：

1. **位级一致性成立**：Flocq fp32（`Bplus/Bmult ... mode_NE`）与 gcc
   `-std=c11` 下的原始 C 代码在 1000 条向量上逐位一致，包括阈值边界
   （`pu-r == ±h1`）、`h1=0`、全零输入等定向用例。
2. **成本符合预期**：spec 转写 + 调试约 1 小时/IP；1000 条向量全链路
   约 10 秒（生成 + 编译）。
3. 后续 IP 按同一套路铺开：`cases/<X>/spec.v` 转写 +
   `ref/<X>_main.c` 驱动 + `run_tests.sh <X>`。

---

## 9. 推广结果（ThreeAxisController，2026-07-24）

> 产物已归档 `OUTPUT/SAMCodeSynthesis/ThreeAxisController/`（含中文 README）。

| 步骤 | 产物 | 结果 |
|---|---|---|
| spec 转写 | `OUTPUT/SAMCodeSynthesis/ThreeAxisController/rocq/spec.v`（12 输入 → Up/Ud/fy/u 12 输出 bits；LimitFloat 与三轴 PD 结构，Z 轴无 Kp 项） | coqc 通过 |
| 参考程序 | `OUTPUT/SAMCodeSynthesis/ThreeAxisController/source/ThreeAxisController_main.c`（原始 C + std_utils.c） | 构建通过 |
| 向量 | `OUTPUT/SAMCodeSynthesis/ThreeAxisController/reports/vectors.txt`（1000 条：随机 + 限幅边界/全零/小信号/强制饱和等 8 类定向） | 生成 |
| 差分测试 | `OUTPUT/SAMCodeSynthesis/ThreeAxisController/rocq/tests.v`（1000 条 vm_compute 定理） | **1000/1000 通过** |
| 阴性自检 | 故意改错 t_0000 的一个期望 bits | coqc 正确报错（Unable to unify） |

一键复现：`bash FloatTest/tools/run_tests.sh ThreeAxisController 1000`

本次对工具链的两处小改动（对 PseudoRate 无影响，其 tests.v 重生成逐字节一致）：

1. `emit_tests.py` 改为 EMITTERS 分派表：每个 case 一个发射函数，
   列数与列序按该 case 参考程序的打印格式登记。
2. `run_tests.sh` 增加"编译公共库与 spec"步骤（现 5 步），
   新 case 从干净检出也能一键跑通。

转写要点（供后续 case 参考）：C 代码不读的输入（本例的 `pAngle[2]`、
`destRate[2]`、`CTRL_PARAM_SAM[2].Kp`）不进 spec 参数表，参考侧任意初始化、
不打印；`LimitFloat` 的 NaN 行为（两个比较均 false 时返回 `fin` 本身）
与 `c_gt/c_lt` 封装天然一致。

---

## 10. 推广结果（SAMSubModeRoll，2026-07-24）

> 产物已归档 `OUTPUT/SAMCodeSynthesis/SAMSubModeRoll/`（含中文 README）。

| 步骤 | 产物 | 结果 |
|---|---|---|
| spec 转写 | `OUTPUT/SAMCodeSynthesis/SAMSubModeRoll/rocq/spec.v`（royaw + 4 个 unint32 + outUp[3] → workMode/计数器/outUp；仅一次浮点比较） | coqc 通过 |
| 参考程序 | `OUTPUT/SAMCodeSynthesis/SAMSubModeRoll/source/SAMSubModeRoll_main.c` | 构建通过 |
| 向量 | `OUTPUT/SAMCodeSynthesis/SAMSubModeRoll/reports/vectors.txt`（1000 条：随机 + 12 类定向） | 生成 |
| 差分测试 | `OUTPUT/SAMCodeSynthesis/SAMSubModeRoll/rocq/tests.v`（1000 条 vm_compute 定理） | **1000/1000 通过** |
| 阴性自检 | 故意改错 t_0001 的期望 workMode | coqc 正确报错 |

一键复现：`bash FloatTest/tools/run_tests.sh SAMSubModeRoll 1000`

路径覆盖统计（1000 条）：转巡航 187、超时转俯仰 235、模式字透传 605、
清 outUp 271、countMode/countPublic 回绕各 83、NaN/+Inf 各 83。

转写要点：

1. **计数器按 unint32 真实语义建模**：自增模 2^32 回绕（spec 的 `u32_inc`），
   因此 `0xFFFFFFFF` 回绕边界可以直接进向量验证。
2. **分支顺序敏感**：`m_countPublic > 12` 比较的是自增后的值；超时判断用的是
   可能被巡航分支重置后的 `m_countMode`（mode 7 专门验证"巡航重置优先"）。
3. **转巡航分支不清 outUp**（只有"继续计数"分支才清），转写时容易看错。
4. SAM 前缀 case 的 spec 函数名不能靠"首字母小写"推导，`emit_tests.py`
   新增 `FUN_NAMES` 显式登记表。
5. spec/驱动注释里不要出现 `(*` 序列（如 `*flgSP`），Coq 注释嵌套会导致
   词法错误。

---

## 11. 推广结果（SAMSubModePitch，2026-07-24）

> 产物已归档 `OUTPUT/SAMCodeSynthesis/SAMSubModePitch/`（含中文 README）。

与 SAMSubModeRoll 同构（14 列布局，直接复用其发射器），差别：太阳角判断为
`Fabsx(piyaw) > 1.0f`，超时阈值 5625，超时目标 `SAM_ROLL(0x22)`。
**1000/1000 通过**，阴性自检正确报错。定向 13 类，新增 Fabsx 负边界
（`piyaw = -1.0f`）与 -Inf 用例。

转写要点：`Fabsx` 是 `std_basal.h` 宏 `fabs((float64)x)`——对 float32
输入 double 转换与 double fabs 均精确，结果即"清符号位"，与 1.0 的
double 比较等价于 fp32 比较；spec 按位实现
（`b32_of_bits (Z.land (bits_of_b32 x) 0x7FFFFFFF)`），
`-0.0 → +0.0`、NaN 清符号均与 C 逐位一致。

一键复现：`bash FloatTest/tools/run_tests.sh SAMSubModePitch 1000`

---

## 12. 推广结果（SAMSubModeDamp，2026-07-24）

> 产物已归档 `OUTPUT/SAMCodeSynthesis/SAMSubModeDamp/`（含中文 README）。

`TripleFabsMaxF(pRate[0..2]) < 0.15f` 计数 + 双阈值（`time_D2P` /
`time_D2P_overtime` 均为结构体输入）转移逻辑，11 列布局。
**1000/1000 通过**，阴性自检正确报错。

转写要点：`TripleFabsMaxF` 是手工 abs + 两次 max 比较，NaN 被 else 支
"丢弃"（单 NaN 不影响其余两轴结果；全 NaN 结果才是 NaN），spec 用同一
`c_lt/c_gt` 比较结构复刻即可；转移判断用的是自增后的计数器值
（mode 4–7 定向验证"越线即转 / 恰等不转"）。

一键复现：`bash FloatTest/tools/run_tests.sh SAMSubModeDamp 1000`

---

## 13. 推广结果（GyroPick，2026-07-24）

> 产物已归档 `OUTPUT/SAMCodeSynthesis/GyroPick/`（含中文 README）。

9 路独立剔野：`ABS(wa-wal) > waThr` 判野值，`countPick`（unint08）连记
`< pickThr` 次沿用旧值、否则采纳新值，56 列布局。**1000/1000 通过**
（9000 个元素级判定：沿用旧值 1332、采纳新值 6768），阴性自检正确报错。

转写要点：`ABS` 宏遇 NaN 取 `-(a)` 支（仍 NaN）→ 比较 false →
**NaN 被当作正常新值采纳**；`countPick` 是 unint08（`u8_inc` 模 256），
mode 8 验证 `255+1=0 < pickThr` 回绕语义；`< pickThr` 比较的是自增后的值。
驱动 printf 格式串曾多 2 个 `%u`（UB 垃圾列），被发射器列数断言当场
拦住——格式串列数 = 实参数 = 发射器断言数是必查点。

一键复现：`bash FloatTest/tools/run_tests.sh GyroPick 1000`

---

## 14. 推广结果（DSSDataGet，2026-07-24）

> 产物已归档 `OUTPUT/SAMCodeSynthesis/DSSDataGet/`（含中文 README）。

首个 UART case：stub `UartSend/UartRecv/SYS_Delay`，注入 11 字节帧；
校验和 + 错误计数 + 字节重组出 royaw/piyaw + flgSP，18 列布局。
**1000/1000 通过**，阴性自检正确报错。

转写要点：

1. **字节重组端序必须实测**：`USED_WORD.Byte` 位域在 gcc x86-64 上
   从 LSB 起分配，`Low_l` 落字最高字节 → 大端组装
   （`word = b0<<24|b1<<16|b2<<8|b3`）。endian spike 实测 + 向量独立复核。
2. 重组与错误记录**与通讯成败无关**（`bSucc=1` 时也重组），stub 建模为
   "总是填入向量字节"。
3. `debugDss` 是全局状态：`ErrCnt` 跨调用累计，spec 作为显式输入/输出
   参数（`u32_inc`）。
4. IP 源对 UART 函数是隐式声明调用，链接驱动内 stub；
   `-Wimplicit-function-declaration` 警告属预期。

一键复现：`bash FloatTest/tools/run_tests.sh DSSDataGet 1000`

---

## 15. 推广结果（GyroStateGet，2026-07-24）

> 产物已归档 `OUTPUT/SAMCodeSynthesis/GyroStateGet/`（含中文 README）。

48 字节帧 + `NumGyro` 变长循环：`wa[i] = float(b[2+4i..5+4i])`（大端
重组）、`stateFlag[i] = b[38+i]`，`i >= NumGyro` 的元素保持原值，
89 列布局。spec 全程在 bits 域（字节重组不含浮点运算）。
**1000/1000 通过**，阴性自检正确报错。

覆盖：numGyro 0–9 全覆盖；元素级更新 4852、透传 4148；重组与透传
独立复核 0 失配。**已知边界**：NumGyro > 9 会越界写（UB），不在被测
行为范围内，按 NumGyro ∈ [0,9] 建模并声明。

一键复现：`bash FloatTest/tools/run_tests.sh GyroStateGet 1000`

## 16. 历史 cfg_target C/Python 探索（非当前 spec 交付）

> 本节仅保留早期路径探索记录。下面的向量数和 mutation harness 结果不是
> `spec.v` 的证明证据，也不计入当前测试统计；旧临时 `cfg_target/` harness
> 不属于当前交付。当前权威入口只有 `cases/<题名>/spec.v`、
> `cases/<题名>/tests.v` 和 `tools/run_all_cfg_target_coq_specs.sh`。

`INPUT/cfg_target` 主要使用 `float64`，且若干顶层函数依赖未随目录提供的
姿态/矩阵公共实现。因此首批先测试两个可以独立链接的浮点辅助函数，使用原 C
实现和独立 Python oracle：

```bash
python3 FloatTest/cfg_target/run_cfg_target_tests.py
```

当前包含 120 条向量：`CS_ThrParamCfgX` 60 条（时间阈值及模式分支）和
`CS_FindMinMaxPos` 60 条（零值、负值、重复最大值、不同长度）。两项均通过。
这批是 cfg_target 的 C 差分测试，不冒充 `FloatLib` 的 fp32 Coq 位级证明；待
公共 double/姿态库可用后，再把可独立驱动的顶层 IP 纳入 Coq spec + reference
vector 流程。

随后增加了 `CS_Track_Atti/w2dEuler_temp1` 的 48 条向量，覆盖 123、132、213、
231、312、321 六种旋转序列。完整复现命令为：

```bash
bash FloatTest/cfg_target/run_all_cfg_target_tests.sh
```

前述 204 条 cfg_target 向量已包含 `CS_GyroData_Disposal` 历史值分支的 36 条，
覆盖停控条件与有效数据不足条件；该项明确只覆盖不进入矩阵求逆的历史值路径。

本轮又加入 `CS_AttCtrl_Propel/PhasePlaneJetControl` 的 60 条向量，覆盖 6 个
相平面区域（R11、R12、R13、R14、R15 以及零区），并检查喷气状态、脉冲时间和
姿态历史值。随后加入 `CS_OrbitComputation/SunEphemerisCalculate` 的 40 条
向量，按真实 `float32 ModPNHP` 调用边界建模太阳平近点角和方向向量。当前
cfg_target 总计 304 条向量。
随后加入 `CS_IRES_Attitude/IRES_DataProcess` 的 45 条向量，覆盖 0、1、2 个
有效传感器、角度融合、误差向量和速率限幅。当前 cfg_target 总计 349 条向量。

最后加入 `CS_PrecessionNutationCal` 的异常四元数分支 36 条向量，检查最大分量
阈值、单位矩阵回退和错误标志。当时完整 CPNCalc 天文计算路径尚未纳入；后续已
用独立角秒到弧度、多项式、旋转矩阵和矩阵乘法实现补测。
另加入 `CS_AttCtrl_Propel/CS_AttCtrl_JetCrossSub` 的 54 条向量，覆盖浮点乘积
阈值、喷嘴优先级和等值竞争分支。当前 cfg_target 总计 439 条向量。
另加入 `CS_Gyro_Att_Predict` 非法姿态序列分支 36 条向量，检查角速度限幅、
单精度角度归一化和非法序列速率清零。当前 cfg_target 总计 475 条向量；姿态
转换库驱动的六种合法序列在当时尚未纳入本批统计，后续已用独立标准旋转和角速度
转换实现补测。
另加入 `CS_Ctrl_Att_Rate/FS_ModeProc2` 的 30 条向量，覆盖传感器姿态、角速度
和控制偏置数据的浮点选择/复制路径。当前 cfg_target 总计 505 条向量。
另加入 `CS_TrgtAtt_EIM/zero-target-matrix` 的 36 条向量，覆盖六种序列选择下的
矩阵-向量计算、目标系角速度和零差值结果。当前 cfg_target 总计 541 条向量；
四元数转换仍由桩隔离，未计入断言。
另加入 `CS_TrgtAtt_NWM_USU/zero-drift-matrix` 的 30 条向量，覆盖六种序列选择
下的矩阵组合、漂移角速度传播和相对角速度计算。当前 cfg_target 总计 571 条
向量；四元数和角度反解仍未计入断言。
另加入 `CS_GyroData_Disposal/valid-3sensor` 的 30 条向量，覆盖三路有效数据、
单位标定矩阵路径、deltag 求解和 `wbi` 限幅。当前 cfg_target 总计 601 条向量；
本项使用单位标定矩阵，非单位矩阵求逆仍未覆盖。
另加入 `ModeConvert_EIM` 和 `ModeConvert_SBM` 各 30 条向量，覆盖模式切换浮点
阈值的小于、等于和大于边界。当前 cfg_target 总计 661 条向量。
另加入 `CS_IRES_Attitude/StaticIresConvert` 的 36 条向量，覆盖静态误差向量的
平方根补 z 分量、三种置换标定矩阵、`atan2`/`asin` 补偿和连续误差计数。当前
cfg_target 总计 697 条向量。
另加入 `CS_AttCtrl_Propel/CS_AttCtrl_Jet12Dis` 的 30 条向量，覆盖两路喷气分配、
剩余时间截断、选择索引切换、轴向加速度和力矩累积。当前 cfg_target 总计 727 条
向量。
另加入 `CS_OrbitComputation/OrbitCalculate` 的 24 条向量，覆盖平根数更新、偏心
迭代、摄动修正、角速度异常回退、坐标矩阵、位置和速度计算。当前 cfg_target 总计
751 条向量。
另加入 `CS_PrecessionNutationCal/CPNCalc` 的 20 条向量，覆盖岁差矩阵、章动
多项式、旋转矩阵转置和最终 CPN 矩阵计算。当前 cfg_target 总计 771 条向量。
另加入 `CS_Ctrl_Att_Rate/CS_Angle2CX_temp2` 的 35 条向量，覆盖 123、132、213、
231、312、321 及默认序列的角度到 DCM 分派和浮点矩阵乘法。当前 cfg_target 总计
806 条向量；旋转函数由 harness 提供标准轴旋转实现。
另加入 `CS_Gyro_Att_Predict/legal-sequence` 的 36 条向量，覆盖六种合法姿态序列的
角速度限幅、姿态预测、`w2dAngle` 转换、单精度角度归一化和 DCM 输出。当前
cfg_target 总计 842 条向量；角度转换使用标准轴旋转实现，公共姿态库本身仍不在
测试范围内。
另加入 `CS_TrgtAtt_EIM/nonzero-angle-matrix` 的 36 条向量，覆盖六种序列的非零
目标角度、偏置矩阵与轨道矩阵组合、角速度传播和相对角速度计算。当前 cfg_target
总计 878 条向量；四元数转换仍由桩隔离。
另加入 `CS_TrgtAtt_NWM_USU/nonzero-drift-matrix` 的 36 条向量，覆盖六种序列的
非零漂移角、漂移角速度、姿态矩阵组合和相对角速度传播。当前 cfg_target 总计
914 条向量；四元数和角度反解仍由桩隔离。
另加入 `CS_Track_Atti/full-state-torque` 的 36 条向量，覆盖姿态角速度差分、惯量
矩阵乘法、力矩缩放、力矩范数限幅和历史状态回写。当前 cfg_target 总计 950 条
向量；本项使用单位姿态矩阵隔离外部 DCM 反解。
另加入 `CS_AttCtrl_Propel/CS_AttCtrl_JetCrossCtrl` 的 36 条向量，覆盖 XY、XZ、
YZ 三种轴对冲突选择及默认不动作分支。当前 cfg_target 总计 986 条向量。
另加入 `CS_IRES_Attitude/CS_IRES_Modify` 的 30 条向量，覆盖 IRES 角度偏差限幅、
偏航余弦增益修正、陀螺常值/漂移偏置更新和最终限幅。并修正该函数循环中误用
未初始化索引的明确笔误。当前 cfg_target 总计 1016 条向量。
另加入 `CS_Ctrl_Att_Rate/FS_AttD-modes` 的 35 条向量，覆盖 `FS_AttD=0..4` 的
姿态源、速率源、偏置源选择和 BMC 模式下的 z 轴清零。当前 cfg_target 总计 1051
条向量。
另加入 `CS_IRES_Attitude/CS_IRES_ValidCheck_Convert` 的 30 条向量，覆盖周期触发、
有效/无效传感器、静态误差转换、姿态融合、速率滤波和输出限幅。当前 cfg_target
总计 1081 条向量。
另加入 `CS_AttCtrl_Propel/CS_Chose_Switching_Line` 的 30 条向量，覆盖 R0 与正/负
R11 的角度单位换算、死区阈值、符号处理、喷气标志和时间后处理。当前 cfg_target
总计 1111 条向量。
另加入 `CS_AttCtrl_Propel/CS_AttCtrl_PropelFun-stop` 的 30 条向量，覆盖完整停控
入口、喷气参数 DEG2RAD 换算、模式/相平面调用和喷气时间状态清零。当前 cfg_target
总计 1141 条向量。
另加入 `CS_OrbitComputation/CS_OrbitComputationFun-control` 的 30 条向量，覆盖
轨道有效性阈值、无轨道计数、太阳区回退、AAM 转向标志、`w0` 和地固系角度更新。
核心 `OrbitCalculate` / `SunEphemerisCalculate` 在本项由桩隔离，当前 cfg_target 总计
1171 条向量。
另加入 `CS_AttCtrl_Propel/CS_AttCtrl_JetPulseCalc` 的 30 条向量，覆盖喷气脉冲入口的
工作模式选择、地球/偏航捕获条件、卸载条件、切换线浮点换算和相平面结果后处理。
相平面输出由固定桩提供，当前 cfg_target 总计 1201 条向量。
另加入 `CS_AttCtrl_Propel/CS_AttCtrl_PropelFun-normal` 的 30 条向量，覆盖非停控入口
的 `DEG2RAD` 转换、喷气脉冲/交叉/分配调用链和 `t_AC` 回写。三个下游控制函数由固定
桩隔离，当前 cfg_target 总计 1231 条向量。
另加入 `CS_IRES_Attitude/CS_IRES_AttitudeFun-dispatch` 的 36 条向量，覆盖无传感器
失效回退、EIM 时间门限、`FS_AttD=3/4`、AHM 和太阳模式条件下的顶层调用分支及
浮点状态回写。IRES 子函数由调用标记桩隔离，当前 cfg_target 总计 1267 条向量。
另加入 `CS_GyroData_Disposal/valid-4sensor` 的 30 条向量，覆盖四传感器非单位标定
矩阵的最小二乘融合、角速度除法和限幅。矩阵运算由 harness 独立实现，当前 cfg_target
总计 1297 条向量。
另加入 `CS_Ctrl_Att_Rate/non-BMC-path` 的 35 条向量，覆盖非 BMC 模式下不同
`FS_AttD` 的姿态/速率源选择、`ModPNHP` 单精度角度归一化和速率差分。当前 cfg_target
总计 1332 条向量。
另加入 `CS_Ctrl_Att_Rate/antenna-history` 的 30 条向量，覆盖天线历史速率缓存
`0..20` 长度边界、倒序搬移和当前样本写回。当前 cfg_target 总计 1362 条向量。
另加入 `CS_AttCtrl_Propel/CS_AttCtrl_PropelFun-FU0` 的 30 条向量，覆盖 `FU==0`
回退分支、喷气参数 `DEG2RAD` 转换以及相位时间清零。当前 cfg_target 总计 1392 条向量。
另加入 `CS_Track_Atti/nonzero-C2Angle` 的 30 条向量，覆盖非零角度转换桩与六种
`w2dEuler` 序列、角加速度和力矩限幅的联动。当前 cfg_target 总计 1422 条向量。
另加入 `CS_Track_Atti/C2AngleX-dispatch` 的 36 条向量，覆盖 123、132、213、231、
312、321 及默认角度序列分派和浮点结果传递。角度反解由桩隔离，当前 cfg_target
总计 1458 条向量。
另加入 `CS_TrgtAtt_EIM/default-sequence` 的 30 条向量，覆盖非法姿态序列回退到 321
以及目标矩阵、轨道角速度传播。当前 cfg_target 总计 1488 条向量。
另加入 `CS_TrgtAtt_NWM_USU/default-sequence` 的 30 条向量，覆盖非法姿态序列回退到
321、漂移角矩阵和漂移/相对角速度传播。当前 cfg_target 总计 1518 条向量。

---

## 16. iplib 批次（2026-07-24 起）

`INPUT/iplib/` 新增 24 题（CS_* 与 ModeConvert_*），特点：**无 QCP
annotation**、多数为 **float64**、CS_* 调用的工具函数实现不在仓库
（`MixedTrack`、`CS_Angle2C` 等，仅头文件）、`WKMD_*` 模式常量无定义。
与 TeSpec（`.tmp/TeSpec`，学长工具，WSL 可用）评估对比后确认：对这批题
走本链路（gcc 真值 + Coq spec + vm_compute）成本更低、结果更强；
TeSpec 的甜区是已有 QCP spec 的整数/堆结构题，其浮点 case 按设计
就是 UNKNOWN + 人工 residual 证明（见 `tests/test_spectest.py`）。

批次基础（一次性）：`FloatTestCommon.v` 新增 fp64 helper（`f64`、
`c_lt64/c_gt64/c_eq64/c_le64/c_ge64`、`out_eq64`）；`run_tests.sh` /
`emit_tests.py` 支持 `INPUT/iplib/<X>/source` 源码布局、
`OUTPUT/iplib/<X>/` 产物布局和 per-case `source/<X>_cflags.txt`。

### ModeConvert 系列 6 题（2026-07-24 全部完成）

> 产物已归档 `OUTPUT/iplib/ModeConvert_{SBM,OCM,EIM,AHM,AMM,NWM}/`
> （各含中文 README）。

6 题全部 **1000/1000 通过**、阴性自检均正确报错，一键复现
`bash FloatTest/tools/run_tests.sh ModeConvert_<X> 1000`：

| case | 形状 | 要点 |
|---|---|---|
| SBM | `starTime - t0 >= dt` → 1 个目标 | fp64 首题；`WKMD_EIM=0x11` 替身 |
| OCM | `starTime > tpi + dtp` | 严格 `>` 恰等不触发；`WKMD_NWM=0x22` 替身 |
| EIM | `arr[wm] > dt`（fp64[14] 下标读） | 下标 [0,13] 全覆盖；越界 UB 声明 |
| AHM | 同 EIM，目标字面量 0x04 | 无宏替身；注释掉的旧字段不读 |
| AMM | 3 个顺序 if（目标 1/5/2） | mode 4 验证"后者覆盖前者" |
| NWM | 2 个顺序 if，开区间时间窗 | 活跃 21 行；后 190 行注释旧版不测；`WKMD_OCM/AMM=0x33/0x44` 替身 |

发射器复用率高：OCM 复用 SBM 的（5 列），EIM/AHM 共用（17 列），
新增仅 AMM（8 列）/NWM（7 列）两个。

### CS 系列难度重估与顺序（2026-07-24，按三角函数依赖分类）

对 18 个剩余 CS_* 逐题核查 callee 后，决定性因素不是行数而是
**是否依赖 libm 三角/反三角/exp**：`Sinx/Cosx/Tanx/Asinx/Acosx/Atanx/
Atan2x/Expx`（std_basal.h/std_utils.h 宏，包装 double 版 libm）以及
`Angle2C*`/`C2Angle*`/`CS_Angle2C` 等 callee 内部都是三角运算。
Flocq 只能计算 IEEE 四则运算与 sqrt（`Bsqrt`），**算不了三角函数**，
凡 trig 依赖题在 bit 级差分路线上当前做不了（此前按行数的建议顺序
作废，如 CS_TrgtAtt_EIM 虽只 65 行但走 Angle2C* → trig，归入不可做）。

- **可做（无 trig，按难度）**：
  1. CS_ObtCtrl_OrbJetOut ✅（2026-07-24，见下）
  2. CS_GyroData_Disposal ✅（2026-07-24，见下）
  3. CS_AttCtrl_Propel（614 行 + 多个缺失的 CS_AttCtrl_* callee 要补
     实现，纯算术，最重但非不可能）
- ~~做不了（trig/exp 依赖，15 题）~~ **三角题已破题（2026-08-05，
  见 §17）**：sin/cos 已用 musl 确定化移植解决，CS_TrgtAtt_AMM_Exp /
  EIM / AHM_USU / OCM / NWM_USU / CS_TrgtP2P_Tar_Init /
  CS_Track_Atti 七题完成；asin/atan2/exp 仍未移植，依赖它们的输出
  打桩规避。剩余 8 题：CS_TrgtP2P_Ini、CS_Track_Plan、
  CS_TrgtAtt_AMM_2NoSAR、
  CS_Gyro_Att_Predict、CS_Ctrl_Att_Rate、CS_PrecessionNutationCal、
  CS_IRES_Attitude、CS_OrbitComputation。

### CS_ObtCtrl_OrbJetOut（2026-07-24）

> 产物归档 `OUTPUT/iplib/CS_ObtCtrl_OrbJetOut/`（含中文 README）。

CS 系列第一题，**1000/1000 通过**，阴性自检正确报错。语义：到达轨控
开机时刻则 `t_OC[i] = FS_OC[i] * ΔT`（4 路），否则 `dto_OC = 0.0`；
未执行分支的字段透传（spec 建模为输入）。`NUM_THRGR_OC` 替身值 4
（`-D` 注入，结构体数组定长）。定向覆盖 NaN 比较、NaN/±Inf 透传、
`±0/±Inf × 正常数`、`有限 × ±0` 等 IEEE 精确边界；乘法路径刻意
不造 NaN（payload 传播与 Flocq 规范 NaN 不同，README 备注已声明）。

### CS_GyroData_Disposal（2026-07-24）

> 产物归档 `OUTPUT/iplib/CS_GyroData_Disposal/`（含中文 README）。

CS 系列第二题，**1000/1000 通过**，阴性自检正确报错。语义：停控或
可用陀螺数不足时用历史值，否则按有效陀螺数走 4 陀螺最小二乘
`(RᵀR)⁻¹Rᵀdg` 或 3 陀螺直接求逆，再 `wbi = LimitDouble(deltag/ΔT)`。
路径覆盖：历史 250 / n=3 主路径 250（含 det=0 奇异回退）/
n=4 主路径 500（含强限幅、±0、fsAttD=2 等定向）。

本题为 iplib 批次补了两个一次性先例（README 备注有完整声明）：

1. **组件库 helper 重建**：`MatrixTran/MatrixMulti/MatrixInv33/
   LimitDouble` 仓库无实现，驱动与 spec 双侧按 SAM fp32 同名函数
   算法重建为 fp64（运算顺序逐式对应）。测试覆盖 IP 层逻辑转写与
   两侧重建的一致性；helper 与原始实现的等价性不在范围内。
2. **`-include` 原型注入**：4 个 helper 连声明都没有（隐式 int 声明
   会使 fp64 返回值语义错误），以既有 `*_cflags.txt` 机制注入
   `source/*_decls.h`；`m_DeltaT` 全局量由驱动定义（std_utils.h
   只有 extern 声明）。

## 17. 三角题破题：musl sin/cos 确定化移植（2026-08-05）

§16 判定"做不了"的 15 道 trig 依赖题，破题方案是**把三角函数本身
变成确定性的**：将 musl libc 的 sin/cos（含 `__rem_pio2` 参数约减）
逐行移植到两侧——

- C 侧 `FloatTest/ref/ported_trig.c`：musl sin.c/cos.c/__sin.c/__cos.c/
  __rem_pio2.c 逐行移植（保留 Sun 版权头），参考程序链接时 shadow
  平台 libm 同名符号，全部 TU 加 `-fno-builtin-sin -fno-builtin-cos`；
  移植输入域 |x| < 2²⁰·(π/2)（small+medium 约减，砍掉 Payne-Hanek；
  越域有限输入返回 canonical NaN；Inf/NaN 不注入）。
- Coq 侧 `FloatTest/lib/FloatTrig.v`：同算法逐比特复刻
  （`ported_sin/ported_cos`，常数全部用 hex bits）。
- `FloatTest/lib/FloatTestCommon.v` 新增 `fp64_sqrt`（Flocq `Bsqrt`
  mode_NE，IEEE 正确舍入，与 libm sqrt 一致）。
- `run_tests.sh` 新增 `source/<X>_extra_srcs.txt` 机制（每行一个
  仓库相对路径的额外源文件）；[4/5] 步重编译 FloatTrig.v 保持
  .vo 摘要一致。

移植自身的独立自测：`bash FloatTest/tools/trig_selftest/run.sh 3000`
（176 定向 + 3000 随机 = 3176 向量，C 移植 vs Coq 复刻逐比特一致，
阴性自检通过）。与 msvcrt libm 对比：常规值 0 ulp 差，大参数差
~21 ulp（musl 更准）。**真值口径因此是"原始 IP + musl 移植三角"**，
复现命令固定使用同一移植，结论可复现。

姿态 helper 另有独立数学自测：
`bash FloatTest/tools/attitude_selftest/run.sh 10000`。它不复用展开式，
而是从基础 A1/A2/A3 矩阵相乘检查六个 Angle2C（6×10000 随机），并
用 I/Rx(pi)/Ry(pi)/Rz(pi) 检查 C2Q 四个精确锚点。2026-08-10 该检查
发现并促成修正四个 Angle2C 第一轴符号及两个 C2Q 对称项下标；EIM、
AHM_USU、P2P、OCM 随后全部重新生成并通过。

反三角/指数仍未移植；依赖它们的 callee 用**打桩 + 输入注入**规避
（打桩函数的输出变为直接输入，下游真实计算保持逐比特比对）。

### CS_TrgtAtt_AMM_Exp（2026-08-05）

> 产物归档 `OUTPUT/iplib/CS_TrgtAtt_AMM_Exp/`（含中文 README）。

三角题第一题、移植方案首次实战。**1049/1049 通过**（49 定向 +
1000 随机），阴性自检正确报错。语义：点对点机动期望轨迹，
`qrb0 = [e_xyz*sin(χ/2); cos(χ/2)]`、`wrb0 = e_xyz*dχ`，外加
F_Init 相对/绝对星时转换。`Track_Plan_hook` 为应用层钩子（仓库
无定义），打空操作桩并把 Chi_Ref/dChi_Ref 作为直接输入。
`tmpF=χ/2` 覆盖 kernel 143 / small-rem 906，定向网格命中
small-rem 各分支与 goto-medium 相消点 ±1ulp 邻域。

### CS_TrgtAtt_EIM（2026-08-05）

> 产物归档 `OUTPUT/iplib/CS_TrgtAtt_EIM/`（含中文 README）。

**1042/1042 通过**（42 定向 + 1000 随机），阴性自检正确报错。
语义：目标姿态解算（`Cro = Cbiasp*Angle2C<sv>(A_Trgt)`、`qri =
C2Q(Cro*coi)`、`wro = wri - Cro*w0i` 恒 +0.0）。组件库
Angle2C×6/MatrixMulti333/331/C2Q 仓库无实现，按教科书约定重建
（README 专节声明约定与真值口径）。6 转序全命中、非法转序
default 17 条、C2Q 四分支全命中。

### CS_TrgtAtt_AHM_USU（2026-08-05）

> 产物归档 `OUTPUT/iplib/CS_TrgtAtt_AHM_USU/`（含中文 README）。

**1023/1023 通过**（23 定向 + 1000 随机），阴性自检正确报错。
本批最重一题：5 个函数（主函数 + XX_Track_Atti + XX_RateForeDiff
+ XX_RateForeHybridTrace 9 段轨迹规划 + w2dEuler 6 转序），104 输入
→ 44 输出 bits。首次采用**打桩 + 输入注入**：CS_C2Angle/C2Angle123
内部是 asin/atan2（未移植），前者打桩为拷贝注入的 a_ref_in（下游
w2dEuler/ddA_Ref/TorqRef 全真实计算），后者空操作移出比较集。
裸全局 m_WorkMode/m_DeltaT/csCtrlerData.Js_Use/csMnvData.e_xyz
驱动定义为输入；WKMD_AMM=3 替身（<14 防 Seq_AttD 越界）。
9 个轨迹分段、6 转序、外层/FS/TorqRef 清零分支全部命中。

### musl sqrt 确定化移植（2026-08-09）

CS_TrgtAtt_NWM_USU 首轮跑出 **t_0861 一条** qri[0..3] 各差 ±1 ulp，
定位到本机 MinGW gcc 链接的老 MSVCRT 的 sqrt 存在罕见 1-ulp 误舍入
（x87 FSQRT 双舍入残留）。实例：x = 0x1.de63fa81fe9bcp+0
（bits 4611094754575247804），MSVCRT 给出 bits 4608835279482202034，
正确舍入为 4608835279482202033；Coq 侧 fp64_sqrt（Flocq Bsqrt）
是正确舍入，故不一致。此前三题约 3000 条向量未踩到纯属侥幸。

处理方案与三角同构：**把 sqrt 也变成确定性的**——将 musl
src/math/sqrt.c（纯整数 Goldschmidt 迭代 + 精确收尾判定，可证正确
舍入）逐行移植到 `FloatTest/ref/ported_sqrt.c`（含 sqrt_data.c 的
__rsqrt_tab 表；差异仅：去 predict_false/eval_as_double/FENV tiny
加法、__math_invalid 改为返回 canonical NaN 以对齐 fp64_unary_nan，
均不影响输出比特），链接时 shadow libm sqrt，全部 TU 加
`-fno-builtin-sqrt`；Coq 侧不动（fp64_sqrt 本就是正确舍入）。
EIM/AHM_USU/OCM/NWM_USU 四题统一接入后重跑全部 PASS；原三题向量
与 tests.v 逐字节未变（旧向量未踩到误舍入点）。

移植自身独立自测：`bash FloatTest/tools/sqrt_selftest/run.sh 2000`
（73 定向 + 2000 随机 = 2073 向量，含上述误舍入实例、次正规、
2^k/精确平方、特殊值，C 移植 vs Coq fp64_sqrt 逐比特一致——NaN 按
out_eq64 口径两侧均视为相等）。

### CS_TrgtAtt_NWM_USU（2026-08-09）

> 产物归档 `OUTPUT/iplib/CS_TrgtAtt_NWM_USU/`（含中文 README）。

**1025/1025 通过**（25 定向 + 1000 随机），阴性自检正确报错。
语义：姿态漂移角直接进旋转（`tmpCp = Angle2C<sv>(0,0,Psi_DA)`，
`Cro_si = tmpCp*(Csib*Cbias)`，`wri_si[2] += dPsi_DA`，
`qri = C2Q(Cro*coi)`），56 输入 → 31 输出 bits。三个先例之外的
新声明：default→321 是本 case 内嵌包装器 CS_Angle2CX_temp1 的
真实代码而非重建假设；m_WorkMode 是结构体字段真实使用（非裸全局）；
C2Angle123（asin/atan2 未移植）打空操作桩、A_Ref_si 移出比较集。
本题是 MSVCRT sqrt 误舍入的发现现场（见上节）。

### CS_TrgtP2P_Tar_Init（2026-08-10）

> 产物归档 `OUTPUT/iplib/CS_TrgtP2P_Tar_Init/`。

**5011/5011 通过**（11 定向 + 5000 随机），阴性自检正确报错。
覆盖四个顶层模式、六种 Angle2C 转序和非法转序；两个仓库缺失的无参
下游函数用可观察计数桩，调用次数进入输出。

### CS_TrgtAtt_OCM（2026-08-10）

> 产物归档 `OUTPUT/iplib/CS_TrgtAtt_OCM/`。

**5011/5011 通过**（11 定向 + 5000 随机），阴性自检正确报错。
复用 EIM 的 Angle2C/矩阵/C2Q 语义，六转序及非法转序全覆盖；缺失的
`CS_Track_Atti` 仅作调用计数桩。

### CS_Track_Atti（2026-08-10）

> 产物归档 `OUTPUT/iplib/CS_Track_Atti/`。

**5013/5013 通过**（13 定向 + 5000 随机），阴性自检正确报错。
缺失且依赖 asin/atan2 的 C2Angle 用角度注入桩；其后的六种 w2dEuler
sin/cos、差分、矩阵力矩、模限幅及状态更新均执行原始 C。力矩清零/
保留分别命中 2545/2468 条。
