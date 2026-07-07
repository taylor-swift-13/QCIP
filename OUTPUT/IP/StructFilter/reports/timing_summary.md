# Timing Summary — IP_StructFilter

> 注：本次验证由主 agent 直接推进，未启动独立 subagent，因此无 subagent wait 时间。

## Phase 耗时（近似）

| Phase | 主要工作 | 耗时 |
|---|---|---|
| annotation review | 检查 C annotation 与 lib 定义 | ~5 min |
| symexec / goal gen | 运行 `win-binary/symexec.exe` 生成 VCs | ~30 s |
| safety witness proving | 批量填充 60+ safety witness | ~15 min |
| return witness proving | 填充 `StructFilter_return_wit_1` | ~10 min |
| coqc verification | 编译 lib → goal → auto → manual → goal_check | ~2 min |
| final-check | Admitted/Axiom/forbidden lemma 扫描 + 归档 | ~5 min |

## 关键命令

```bash
# symexec
./win-binary/symexec.exe --input-file=INPUT/IP/StructFilter/IP_StructFilter.c \
  --goal-file=QCIPCases/IP/StructFilter/IP_StructFilter_goal.v ...

# coqc chain
export PATH="/e/installs/Coq-Platform~8.20~2025.01/bin:$PATH"
coqc $(cat _CoqProject) QCIPLib/IP/StructFilter/IP_StructFilter_lib.v
coqc $(cat _CoqProject) QCIPCases/IP/StructFilter/IP_StructFilter_goal.v
coqc $(cat _CoqProject) QCIPCases/IP/StructFilter/IP_StructFilter_proof_auto.v
coqc $(cat _CoqProject) QCIPCases/IP/StructFilter/IP_StructFilter_proof_manual.v
coqc $(cat _CoqProject) QCIPCases/IP/StructFilter/IP_StructFilter_goal_check.v
```

## 失败重跑

- 无（首次 safety tactic 调试在临时 `.v` 文件中进行，未污染正式文件）。

## Timing gaps

- 未使用外部计时器，上表为估算。
- 无 subagent 等待时间。
