# UartInit 验证结果

## 功能说明

`UartInitFun` 是卫星软件中负责初始化串口的 IP：它从结构体中取出串口配置参数，调用底层驱动 `Drv_Uart_Init`。

原始代码位于 `INPUT/SAMCodeSynthesis/UartInit/IP_UartInit.c`。

## 验证产物

```text
OUTPUT/SAMCodeSynthesis/UartInit/
├── source/
│   └── IP_UartInit.c          # 带 QCP annotation 的自包含验证用 C 源码
├── rocq/
│   ├── IP_UartInit_lib.v      # 数学 spec / helper lemmas
│   ├── IP_UartInit_goal.v     # symexec 生成的 VC（验证条件）
│   ├── IP_UartInit_proof_auto.v   # 自动证明部分
│   ├── IP_UartInit_proof_manual.v # 手动证明部分
│   └── IP_UartInit_goal_check.v   # 总体验证模块
└── reports/
    ├── final_checklist.md     # final-check 检查清单
    └── timing_summary.md      # 各阶段耗时与技巧记录
```

对应正式工作区产物：

- `QCIPLib/SAMCodeSynthesis/UartInit/IP_UartInit_lib.v`
- `QCIPCases/SAMCodeSynthesis/UartInit/IP_UartInit_goal.v`
- `QCIPCases/SAMCodeSynthesis/UartInit/IP_UartInit_proof_auto.v`
- `QCIPCases/SAMCodeSynthesis/UartInit/IP_UartInit_proof_manual.v`
- `QCIPCases/SAMCodeSynthesis/UartInit/IP_UartInit_goal_check.v`

## 规格说明

由于 `UartInitFun` 本身只把参数透传给底层驱动，没有任何堆内存输出，本次验证采用最保守的安全规格：

- **前置条件**：`pIp` 的四个配置字段（`uartno`、`baud`、`even`、`stop`）可读写。
- **后置条件**：调用成功后返回，字段保持原值，并满足 `UartInitPost`（目前定义为 `True`）。
- **Drv_Uart_Init 处理**：把它建模为不改变任何分离逻辑资源的外部调用（`Require emp / Ensure emp`）。

如果后续需要证明“初始化后硬件寄存器处于某种状态”，需要把 `UartInitPost` 增强为具体谓词，并给 `Drv_Uart_Init` 配上真实硬件语义。

## 复现命令

```bash
# 1. 编译 lib
coqc $(cat _CoqProject) QCIPLib/SAMCodeSynthesis/UartInit/IP_UartInit_lib.v

# 2. 编译 goal / proof_auto / proof_manual / goal_check
coqc $(cat _CoqProject) QCIPCases/SAMCodeSynthesis/UartInit/IP_UartInit_goal.v
coqc $(cat _CoqProject) QCIPCases/SAMCodeSynthesis/UartInit/IP_UartInit_proof_auto.v
coqc $(cat _CoqProject) QCIPCases/SAMCodeSynthesis/UartInit/IP_UartInit_proof_manual.v
coqc $(cat _CoqProject) QCIPCases/SAMCodeSynthesis/UartInit/IP_UartInit_goal_check.v
```

## 关键技巧

1. **Drv_Uart_Init 没有声明**：原始 `IP.h` 只在 `__GCC_COMPILED__` 下包含 `DRV_UART.h`，验证分支里该函数未声明。在自包含 C 里为它写前向声明，并配上 QCP function spec。
2. **外部调用必须给 spec**：QCP 遇到函数调用时需要在当前翻译单元里找到函数规格。用 `Require emp / Ensure emp` 表示“不消耗/产生资源”。
3. **proof_auto 里残留的 Admitted**：symexec 对 `partial_solve_wit_1` 没给出自动证明，需要把 `proof_auto.v` 里的 `Admitted.` 替换成实际 tactic（本例只需 `entailer!`）。
4. **最小化 C 以绕开 parser 限制**：当前 symexec 对 `std_basal.h` 里的尖括号 include、`signed char`、位域等会报语法错。验证用 C 文件采用自包含最小形态，只保留本函数需要的类型和字段。
