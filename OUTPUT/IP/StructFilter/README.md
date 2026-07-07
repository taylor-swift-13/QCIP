# IP_StructFilter 验证结果

本目录包含 `INPUT/IP/StructFilter/IP_StructFilter.c` 的完整 QCP 验证产物。

## 目录结构

```
OUTPUT/IP/StructFilter/
├── source/                         # 原始 C 源码与头文件
│   ├── IP_StructFilter.c
│   ├── IP_StructFilter.h
│   ├── common.h
│   ├── UTILStd.h
│   └── compile.sh
├── rocq/                           # Rocq 证明产物
│   ├── IP_StructFilter_lib.v       # spec / helper 定义
│   ├── IP_StructFilter_goal.v      # 自动生成的验证条件
│   ├── IP_StructFilter_proof_auto.v# 自动可证部分（已填证明）
│   ├── IP_StructFilter_proof_manual.v # 手动证明部分（已填证明）
│   └── IP_StructFilter_goal_check.v # 汇总校验
└── reports/                        # 检查报告与清单
    ├── final_checklist.md
    └── timing_summary.md
```

## 复现步骤

在仓库根目录下执行：

```bash
# 1. 符号执行生成 VC（会覆盖 proof_auto / proof_manual，手写证明前请备份）
./win-binary/symexec.exe \
  --input-file=INPUT/IP/StructFilter/IP_StructFilter.c \
  --goal-file=QCIPCases/IP/StructFilter/IP_StructFilter_goal.v \
  --proof-auto-file=QCIPCases/IP/StructFilter/IP_StructFilter_proof_auto.v \
  --proof-manual-file=QCIPCases/IP/StructFilter/IP_StructFilter_proof_manual.v \
  --coq-logic-path=QCIPCases.IP.StructFilter \
  --gen-and-backup \
  --no-exec-info

# 2. 按依赖顺序编译 Rocq 文件
export PATH="/e/installs/Coq-Platform~8.20~2025.01/bin:$PATH"
coqc $(cat _CoqProject) QCIPLib/IP/StructFilter/IP_StructFilter_lib.v
coqc $(cat _CoqProject) QCIPCases/IP/StructFilter/IP_StructFilter_goal.v
coqc $(cat _CoqProject) QCIPCases/IP/StructFilter/IP_StructFilter_proof_auto.v
coqc $(cat _CoqProject) QCIPCases/IP/StructFilter/IP_StructFilter_proof_manual.v
coqc $(cat _CoqProject) QCIPCases/IP/StructFilter/IP_StructFilter_goal_check.v
```

如果最后一步 `IP_StructFilter_goal_check.v` 编译通过，说明所有验证条件均已证明，且无遗留 `Admitted`。

## 验证结论

- `IP_StructFilter_goal_check.v`：**编译通过**
- `IP_StructFilter_proof_manual.v` 中无 `Admitted`
- `IP_StructFilter_lib.v` 中无 `Admitted`
- 未使用 forbidden lemma 列表中的任何 lemma
- 生成文件 `goal.v` / `proof_auto.v` / `proof_manual.v` 与当前 `IP_StructFilter.c` 对应
