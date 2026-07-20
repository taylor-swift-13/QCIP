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
        FloatTest/cases/X/spec.v   FloatTest/vectors/X.txt
        （Coq 函数，fp32）         （输入/输出 bit patterns）
                   │              │
                   ▼              ▼
              tools/emit_tests.py 生成
        FloatTest/cases/X/tests.v
        （每条向量一条 vm_compute 定理 + 健全性检查）
                   │
                   ▼
        tools/run_tests.sh（coqc 编译）
              全过 = 测试通过
```

- `lib/FloatTestCommon.v`：公共包装（bits 注入/读出、布尔化比较、
  clamp 等公共 helper、健全性谓词 `noNaN`）。
- `tools/run_reference.py`：为每个 IP 生成 C 驱动（随机输入覆盖：
  均匀分布 + 边界值 + 特殊值），编译运行，把输入/输出的 IEEE bit
  pattern 落到 `vectors/`。
- `tools/emit_tests.py`：把向量转成 `tests.v`。
- `tools/run_tests.sh`：从仓库根用根 `_CoqProject` 调 coqc 编译所有
  `tests.v`（与之前 case 的编译方式一致，不新增 build 配置）。

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
