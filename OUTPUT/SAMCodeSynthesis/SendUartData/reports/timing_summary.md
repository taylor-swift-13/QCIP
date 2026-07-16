# SendUartData Timing Summary

## 总览

本次验证与 `UartInit` 结构几乎完全相同，总耗时很短。

| 阶段 | 主要工作 | 耗时（约） |
|---|---|---|
| Annotation / Spec | 写自包含 C + lib spec | 数分钟 |
| Symbolic Execution | `win-binary/symexec.exe` 生成 VC | < 10 秒 |
| Proof Auto | 补证 `partial_solve_wit_1` | 数分钟 |
| Proof Manual | 补证 `return_wit_1` 与 `split_goal_1` | 数分钟 |
| Final Check | `coqc` 编译全部文件 | < 1 分钟 |
| OUTPUT 归档 | 复制产物 + 写 README/report | 数分钟 |

## 关键命令

```bash
# symbolic execution
./win-binary/symexec.exe \
  --goal-file=QCIPCases/SAMCodeSynthesis/SendUartData/IP_SendUartData_goal.v \
  --proof-auto-file=QCIPCases/SAMCodeSynthesis/SendUartData/IP_SendUartData_proof_auto.v \
  --proof-manual-file=QCIPCases/SAMCodeSynthesis/SendUartData/IP_SendUartData_proof_manual.v \
  --coq-logic-path=QCIPCases.SAMCodeSynthesis.SendUartData \
  --input-file=OUTPUT/SAMCodeSynthesis/SendUartData/source/IP_SendUartData.c \
  --no-exec-info

# final coqc check
COQ="E:/installs/Coq-Platform~8.20~2025.01/bin/coqc.exe"
COQOPTS="$(cat _CoqProject)"
$COQ $COQOPTS QCIPLib/SAMCodeSynthesis/SendUartData/IP_SendUartData_lib.v
$COQ $COQOPTS QCIPCases/SAMCodeSynthesis/SendUartData/IP_SendUartData_goal.v
$COQ $COQOPTS QCIPCases/SAMCodeSynthesis/SendUartData/IP_SendUartData_proof_auto.v
$COQ $COQOPTS QCIPCases/SAMCodeSynthesis/SendUartData/IP_SendUartData_proof_manual.v
$COQ $COQOPTS QCIPCases/SAMCodeSynthesis/SendUartData/IP_SendUartData_goal_check.v
```

## 技巧记录

1. **直接复用 UartInit 模式**：两者都是“从结构体取参数 → 调外部函数 → 返回”。函数名、字段名和外部函数签名稍作改动即可。
2. **指针字段当作 Z 值**：`pIp->buf` 在 annotation 中作为 `Z` 处理，用 `store(&(pIp->buf), buf)` 描述。
3. **外部函数前向声明**：在验证用 C 中显式声明 `UartSend` 并附 `Require emp / Ensure emp` 的 spec。
