# IP_WheelFriction QCP 验证报告

## 概述

本目录包含 `WheelFriction` 函数的 QCP 形式化验证结果。

- **源文件**：动量轮摩擦力矩补偿电压计算函数
- **验证平台**：Windows + Coq 8.20.1
- **验证日期**：2026-07-09
- **验证状态**：✅ symexec + coqc 编译通过

## 重要说明

**本验证为大幅简化版本**。原始 C 代码涉及：
- `float64` (double) 浮点运算 — QCP 不支持
- 指针解引用 (`para->kf[i]`) — 已展平为直接结构体字段
- 外部函数 `Sgn2()` — 已抽象为 `WheelFricComp`
- 循环 4 次迭代 — 已手动展开

简化策略：
1. 所有 `float64` 字段替换为 `unint32`
2. 指针间接访问展平为直接字段
3. 浮点计算公式抽象为未解释函数 `WheelFricComp(kf, cut, vf0)`
4. `for(i=0;i<4;i++)` 循环展开为 4 个顺序 if/else 块

## 文件布局

```
WheelFriction0/
├── README.md                         # 本文件
├── source/
│   ├── IP_WheelFriction.c            # 简化注释版 C 源文件
│   └── IP_WheelFriction.h            # 精简头文件
├── rocq/
│   ├── IP_WheelFriction_lib.v        # 抽象计算函数定义
│   ├── IP_WheelFriction_goal.v       # symexec 生成的 VCs (400KB)
│   ├── IP_WheelFriction_proof_auto.v # safety witness (151, Admitted)
│   ├── IP_WheelFriction_proof_manual.v # manual witness
│   └── IP_WheelFriction_goal_check.v # 最终一致性检查
├── qciplib/
│   └── IP_WheelFriction_lib.v        # QCIPLib 副本
└── reports/
    ├── case_brief.md
    ├── witness_ledger.md
    ├── final_checklist.md
    └── simplification_notes.md
```

## 验证结果

| 检查项 | 状态 |
|--------|------|
| symexec 到达文件尾 | ✅ |
| lib.v 编译 | ✅ |
| goal.v 编译 | ✅ |
| proof_auto.v 编译 | ✅ |
| proof_manual.v 编译 | ✅ |
| goal_check.v 编译 | ✅ |

## 待改进

- 151 个 safety witness 全部为 `Admitted`（大量 store 谓词组合爆炸导致）
- 完整浮点运算验证需要 QCP 支持 float64 或使用 refinement proof 模式

## 关键命令

```powershell
win-binary\symexec.exe `
  --goal-file=SeparationLogic\examples\LLM_bench\Engineering\WheelFriction\IP_WheelFriction_goal.v `
  --proof-auto-file=...\IP_WheelFriction_proof_auto.v `
  --proof-manual-file=...\IP_WheelFriction_proof_manual.v `
  --coq-logic-path=SimpleC.EE.LLM_bench.Engineering.WheelFriction `
  -slp QCP_examples\LLM_bench\ SimpleC.EE.LLM_bench `
  -IQCP_examples\QCP_demos_LLM\ `
  -slp QCP_examples\QCP_demos_LLM\ SimpleC.EE.QCP_demos_LLM `
  --input-file=QCP_examples\LLM_bench\Engineering\WheelFriction\IP_WheelFriction.c `
  --no-exec-info
```
