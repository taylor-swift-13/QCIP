# SendUartData 验证结果

## 功能说明

`SendUartDataFun` 是卫星软件中负责串口数据发送的 IP：它从结构体中取出串口号、
数据缓冲区指针和待发送字节数，调用底层驱动 `UartSend` 完成发送。

原始代码位于 `INPUT/SAMCodeSynthesis/SendUartData/IP_SendUartData.c`。

## 验证产物

```text
OUTPUT/SAMCodeSynthesis/SendUartData/
├── source/
│   └── IP_SendUartData.c          # 带 QCP annotation 的自包含验证用 C 源码
├── rocq/
│   ├── IP_SendUartData_lib.v      # 数学 spec / helper lemmas
│   ├── IP_SendUartData_goal.v     # symexec 生成的 VC（验证条件）
│   ├── IP_SendUartData_proof_auto.v   # 自动证明部分
│   ├── IP_SendUartData_proof_manual.v # 手动证明部分
│   └── IP_SendUartData_goal_check.v   # 总体验证模块
└── reports/
    ├── final_checklist.md         # final-check 检查清单
    └── timing_summary.md          # 各阶段耗时与技巧记录
```

对应正式工作区产物：

- `QCIPLib/SAMCodeSynthesis/SendUartData/IP_SendUartData_lib.v`
- `QCIPCases/SAMCodeSynthesis/SendUartData/IP_SendUartData_goal.v`
- `QCIPCases/SAMCodeSynthesis/SendUartData/IP_SendUartData_proof_auto.v`
- `QCIPCases/SAMCodeSynthesis/SendUartData/IP_SendUartData_proof_manual.v`
- `QCIPCases/SAMCodeSynthesis/SendUartData/IP_SendUartData_goal_check.v`

## 规格说明

由于 `SendUartDataFun` 本身只把参数透传给底层驱动，没有任何堆内存输出，本次验证采用最保守的安全规格：

- **前置条件**：`pIp` 的三个字段（`uartno`、`buf`、`sendsize`）可读写。
- **后置条件**：调用成功后返回，字段保持原值，并满足 `SendUartDataPost`（目前定义为 `True`）。
- **UartSend 处理**：把它建模为不改变任何分离逻辑资源的外部调用（`Require emp / Ensure emp`）。

如果后续需要证明“发送后缓冲区内容不变”或“硬件发送完成”，需要把 `SendUartDataPost` 增强为具体谓词，并给 `UartSend` 配上真实语义。

## 复现命令

```bash
# 1. 编译 lib
coqc $(cat _CoqProject) QCIPLib/SAMCodeSynthesis/SendUartData/IP_SendUartData_lib.v

# 2. 编译 goal / proof_auto / proof_manual / goal_check
coqc $(cat _CoqProject) QCIPCases/SAMCodeSynthesis/SendUartData/IP_SendUartData_goal.v
coqc $(cat _CoqProject) QCIPCases/SAMCodeSynthesis/SendUartData/IP_SendUartData_proof_auto.v
coqc $(cat _CoqProject) QCIPCases/SAMCodeSynthesis/SendUartData/IP_SendUartData_proof_manual.v
coqc $(cat _CoqProject) QCIPCases/SAMCodeSynthesis/SendUartData/IP_SendUartData_goal_check.v
```

## 关键技巧

1. **UartSend 没有声明**：原始 `IP.h` 只在 `__GCC_COMPILED__` 下包含 `DRV_UART.h`，验证分支里该函数未声明。在自包含 C 里为它写前向声明，并配上 QCP function spec。
2. **外部调用必须给 spec**：QCP 遇到函数调用时需要在当前翻译单元里找到函数规格。用 `Require emp / Ensure emp` 表示“不消耗/产生资源”。
3. **proof_auto 里残留的 Admitted**：symexec 对 `partial_solve_wit_1` 没给出自动证明，需要把 `proof_auto.v` 里的 `Admitted.` 替换成实际 tactic（本例只需 `entailer!`）。
4. **指针字段的建模**：`pIp->buf` 是 `unsigned char *`，在 QCP 注释中直接当作 `Z` 类型的地址值处理，使用 `store(&(pIp->buf), buf)` 描述字段存储。
