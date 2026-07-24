# FloatTest — 浮点 IP 的 Coq 计算测试方案

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
        tools/run_tests.sh（coqc 编译）
              全过 = 测试通过
```

**产物位置（2026-07-24 起）**：每个 case 的最终产物归档在
`OUTPUT/SAMCodeSynthesis/<X>/`（`source/` 参考驱动、`rocq/` spec+tests、
`reports/` 向量+检查单、根目录中文 README），与整数 IP 的交付惯例一致。
唯一的例外是 PseudoRate 试点，保留旧布局 `FloatTest/{ref,cases,vectors}/`。
`run_tests.sh` 与 `emit_tests.py` 按 `OUTPUT/SAMCodeSynthesis/<X>/`
是否存在自动识别两种布局，一键命令不变。

- `lib/FloatTestCommon.v`：公共包装（bits 注入/读出、布尔化比较、
  输出比较 `out_eq` 等公共 helper）。
- `<case>/source/<X>_main.c`：每个 IP 的 C 驱动（随机输入覆盖：
  均匀分布 + 边界值 + 特殊值），编译运行，把输入/输出的 IEEE bit
  pattern 落到 `reports/vectors.txt`。
- `tools/emit_tests.py`：把向量转成 `tests.v`（按 case 的 EMITTERS 登记
  发射函数，函数名登记在 `FUN_NAMES`）。
- `tools/run_tests.sh`：从仓库根用根 `_CoqProject` 调 coqc 依次编译
  公共库、spec、`tests.v`（与之前 case 的编译方式一致，不新增 build 配置；
  参考程序 exe 落在 `.tmp/floattest/`，不进交付物）。

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

进度：PseudoRate ✅ · ThreeAxisController ✅ · SAMSubModeRoll ✅ · 其余 6 个
（SAMSubModePitch/Damp、GyroPick、GyroStateGet、DSSDataGet、GyroAttiDetermine）
待做，建议按此顺序推进
（难度递增，GyroAttiDetermine 涉及矩阵求逆与跨调用状态，最重）。

试点按 §4 流程完整跑通：

| 步骤 | 产物 | 结果 |
|---|---|---|
| spec 转写 | `FloatTest/cases/PseudoRate/spec.v`（9 个 fp32 输入 → Yp/Yn/r′，常量为 bits 注入） | coqc 通过 |
| 参考程序 | `FloatTest/ref/PseudoRate_main.c`（gcc `-std=c11 -O0` 编译原始 `IP_PseudoRate.c`） | 构建通过 |
| 向量 | `FloatTest/vectors/PseudoRate.txt`（1000 条：随机均匀 + 7 类定向边界） | 生成 |
| 差分测试 | `FloatTest/cases/PseudoRate/tests.v`（1000 条 vm_compute 定理） | **1000/1000 通过，6.6s** |
| 阴性自检 | 故意改错一条期望值 | coqc 正确报错（工具链确实在测东西） |

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
