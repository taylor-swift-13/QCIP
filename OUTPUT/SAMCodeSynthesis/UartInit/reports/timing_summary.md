# Timing Summary — UartInit

| 阶段 | 主要内容 | 耗时（约） |
|---|---|---|
| 目录与 spec 准备 | 创建 `QCIPLib/QCIPCases/OUTPUT` 目录，编写 `IP_UartInit_lib.v` | 较短 |
| C annotation | 为 `IP_UartInit.c` 添加 QCP annotation 与 `Drv_Uart_Init` function spec | 较短 |
| 符号执行 | 运行 `symexec` 生成 goal / auto / manual | 较短 |
| 文件迁移 | 将证明产物放入标准位置 | 较短 |
| Manual 证明 | 完成 `return_wit_1` 与 `partial_solve_wit_1` 证明 | 主要耗时 |
| final-check | 编译 `goal_check.v`，检查无 `Admitted` | 较短 |

## Manual 证明细分

| 目标 | 难点 | 解决方式 |
|---|---|---|
| `return_wit_1` | 需要证明 `UartInitPost uartno baud even stop` | `UartInitPost` 定义为 `True`，直接用 `exact I` |
| `partial_solve_wit_1` | 分离逻辑前提与结论相同 | `entailer!` 自动解决 |

## 编译命令

```bash
COQOPTS=$(cat _CoqProject)
coqc $COQOPTS QCIPLib/SAMCodeSynthesis/UartInit/IP_UartInit_lib.v
coqc $COQOPTS QCIPCases/SAMCodeSynthesis/UartInit/IP_UartInit_goal.v
coqc $COQOPTS QCIPCases/SAMCodeSynthesis/UartInit/IP_UartInit_proof_auto.v
coqc $COQOPTS QCIPCases/SAMCodeSynthesis/UartInit/IP_UartInit_proof_manual.v
coqc $COQOPTS QCIPCases/SAMCodeSynthesis/UartInit/IP_UartInit_goal_check.v
```

以上五步均编译通过。

## 可复用模式

- 对只调用外部驱动、无堆输出的 IP，最省事的规格是“安全返回 + 参数不变”。
- 外部函数调用必须在当前翻译单元里给出 QCP function spec；若未知函数不读写资源，可写 `Require emp / Ensure emp`。
- `proof_auto.v` 里 symexec 留下的 `Admitted.` 需要在同一位置补证，不能只写在 `proof_manual.v`（会出现重复定义）。
