# CheckCal08 验证结果

本目录包含 `INPUT/SAMCodeSynthesis/CheckCal08/IP_CheckCal08.c` 的完整 QCP 验证产物。

## 功能

`CheckCal08Fun` 计算结构体中长度为 `len` 的无符号 8 位数组 `pkv` 的 8 位累加和，结果写回 `pIp->chksum`：

```c
chksum = (Σ pkv[i]) mod 256
```

## 目录结构

```
OUTPUT/SAMCodeSynthesis/CheckCal08/
├── source/                         # 带 QCP annotation 的 C 源码
│   └── IP_CheckCal08.c
├── rocq/                           # Rocq 证明产物
│   ├── IP_CheckCal08_lib.v         # spec / helper 定义
│   ├── IP_CheckCal08_goal.v        # 自动生成的验证条件
│   ├── IP_CheckCal08_proof_auto.v  # 自动可证部分（已填证明）
│   ├── IP_CheckCal08_proof_manual.v# 手动证明部分（已填证明）
│   └── IP_CheckCal08_goal_check.v  # 汇总校验
└── reports/                        # 检查报告与清单
    ├── final_checklist.md
    └── timing_summary.md
```

## 复现步骤

在仓库根目录下执行：

```bash
# 1. 按依赖顺序编译 Rocq 文件
export PATH="/e/installs/Coq-Platform~8.20~2025.01/bin:$PATH"
COQOPTS=$(cat _CoqProject)
coqc $COQOPTS QCIPLib/SAMCodeSynthesis/CheckCal08/IP_CheckCal08_lib.v
coqc $COQOPTS QCIPCases/SAMCodeSynthesis/CheckCal08/IP_CheckCal08_goal.v
coqc $COQOPTS QCIPCases/SAMCodeSynthesis/CheckCal08/IP_CheckCal08_proof_auto.v
coqc $COQOPTS QCIPCases/SAMCodeSynthesis/CheckCal08/IP_CheckCal08_proof_manual.v
coqc $COQOPTS QCIPCases/SAMCodeSynthesis/CheckCal08/IP_CheckCal08_goal_check.v
```

如果最后一步 `IP_CheckCal08_goal_check.v` 编译通过，说明所有验证条件均已证明，且无遗留 `Admitted`。

## 验证结论

- `IP_CheckCal08_goal_check.v`：**编译通过**
- `IP_CheckCal08_proof_manual.v` 中无 `Admitted`
- `IP_CheckCal08_lib.v` 中无 `Admitted`
- 未使用 forbidden lemma 列表中的任何 lemma
- 生成文件 `goal.v` / `proof_auto.v` / `proof_manual.v` 与当前 `IP_CheckCal08.c` 对应

## 备注

- 在证明过程中，为使得 `entail_wit_2` 与 `return_wit_1` 可证，将循环不变式 `CheckCal08Inv` 额外包含 `Zlength pkv = len`。
- `return_wit_1` 的原始生成目标中，postcondition 使用 `pIp_pre` 而 precondition 使用 `pIp`，已在 `IP_CheckCal08_goal.v` 中修正为一致。
