# B_TcProcess 验证结果

## 功能说明

`B_TcProcessFun` 是卫星软件中处理模式切换指令的 IP：它先经串口发送取数帧
`[0xEB, 0x94]`，延时后接收 4 字节应答帧；若应答帧头为 `[0xE1, 0x00]` 且
校验和正确（`recv[3] == (recv[0]+recv[1]+recv[2]) mod 256`），则按 `recv[2]`
把 `*workMode` 改写为对应模式字（`0 -> SAM_DAMP(0x00)`，`1 -> SAM_CRUISE(0x33)`，
其他 `-> NOCTRL(0x44)`）；`bSucc` 字段记录是否收到数据。

原始代码位于 `INPUT/SAMCodeSynthesis/B_TcProcess/IP_B_TcProcess.c`。

## 验证产物

```text
OUTPUT/SAMCodeSynthesis/B_TcProcess/
├── source/
│   └── IP_B_TcProcess.c          # 带 QCP annotation 的自包含验证用 C 源码
├── rocq/
│   ├── IP_B_TcProcess_lib.v      # 数学 spec / helper lemmas
│   ├── IP_B_TcProcess_goal.v     # symexec 生成的 VC（验证条件）
│   ├── IP_B_TcProcess_proof_auto.v   # 自动证明部分（safety + partial）
│   ├── IP_B_TcProcess_proof_manual.v # 手动证明部分（return + 特殊 safety）
│   └── IP_B_TcProcess_goal_check.v   # 总体验证模块
└── reports/
    ├── case_brief.md             # case 概述与验证策略
    ├── witness_ledger.md         # witness 分类台账
    ├── final_checklist.md        # final-check 检查清单
    ├── timing_summary.md         # 各阶段耗时
    └── gen_proofs.py             # 批量生成证明的脚本（可复现）
```

对应正式工作区产物：

- `QCIPLib/SAMCodeSynthesis/B_TcProcess/IP_B_TcProcess_lib.v`
- `QCIPCases/SAMCodeSynthesis/B_TcProcess/IP_B_TcProcess_goal.v`
- `QCIPCases/SAMCodeSynthesis/B_TcProcess/IP_B_TcProcess_proof_auto.v`
- `QCIPCases/SAMCodeSynthesis/B_TcProcess/IP_B_TcProcess_proof_manual.v`
- `QCIPCases/SAMCodeSynthesis/B_TcProcess/IP_B_TcProcess_goal_check.v`

## 规格说明

本 case 采用**强功能规格**：

- **前置条件**：`pIp` 各字段可读写；`workMode` 指向一个 `unint32`；
  `sendBuf` 指向 2 字节、`recvBuf` 指向 4 字节缓冲区，内容任意。
- **后置条件**：存在 `sent recv_l ret new_wm new_bs`，使得
  1. `sent` 恰为 `[0xEB, 0x94]`（`UartSendRecord` 记录的发送帧）；
  2. `recv_l` 为 `UartRecv` 写入的 4 字节应答（内容任意——stub 不假设内容）；
  3. `B_TcProcessPost(old_wm, recv_l, ret, new_wm, new_bs)`：
     - `new_wm = final_workMode old_wm recv_l`：帧有效（帧头 + 校验和）时为
       `decode_mode(recv[2])`，否则保持 `old_wm`；
     - `new_bs = final_bSucc ret recv_l`：`recv[0] == 0xE1` 时为 1，否则为
       `UartRecv` 的返回值。

也就是说，对**任意**应答帧内容，函数对 `*workMode` 和 `bSucc` 的最终影响
都被数学上完全刻画：帧有效时模式字被正确解码写入，帧无效时模式字不变。

- **外部函数 stub**：`UartSend`（记录发送内容）、`SYS_Delay`（emp/emp）、
  `UartRecv`（只保证输出形状：写满 4 字节、覆写 `len`/`numerror`、返回值在
  UInt 范围内）。stub 没有实现，spec 即语义假设。

### 验证模型与原始代码的差异（均为绕过当前工具限制的等价变形）

1. 结构体定义内联，入口由 `void *p` 强转变为直接接收 `B_TcProcess *pIp`。
2. 局部数组 `obdhSendData[2]` / `obdhRecvData[4]` 建模为结构体指针字段
   `sendBuf` / `recvBuf`（当前 symexec 不支持局部 C 数组）。
3. `numerror` 显式初始化为 0（原代码声明后未初始化即传地址给 UartRecv；
   UartRecv 语义上总会覆写它，行为等价，且避免读未初始化值的 UB）。
4. `for (i = 0; i < 3; i++) chksum += recv[i];` 是常数 3 次，手动展开。
5. `SAM_DAMP/SAM_CRUISE/NOCTRL` 宏直接写为字面值（`0x00/0x33/0x44`）。

## 复现命令

```bash
# 0. 生成 VC（可选；产物已在 QCIPCases 下）
./win-binary/symexec.exe \
  --goal-file=QCIPCases/SAMCodeSynthesis/B_TcProcess/IP_B_TcProcess_goal.v \
  --proof-auto-file=QCIPCases/SAMCodeSynthesis/B_TcProcess/IP_B_TcProcess_proof_auto.v \
  --proof-manual-file=QCIPCases/SAMCodeSynthesis/B_TcProcess/IP_B_TcProcess_proof_manual.v \
  --coq-logic-path=QCIPCases.SAMCodeSynthesis.B_TcProcess \
  --input-file=OUTPUT/SAMCodeSynthesis/B_TcProcess/source/IP_B_TcProcess.c \
  --no-exec-info

# 1. 重新批量生成证明（可选；会覆盖两个 proof 文件）
python -X utf8 OUTPUT/SAMCodeSynthesis/B_TcProcess/reports/gen_proofs.py

# 2. 编译验证（依赖顺序）
coqc $(cat _CoqProject) QCIPLib/SAMCodeSynthesis/B_TcProcess/IP_B_TcProcess_lib.v
coqc $(cat _CoqProject) QCIPCases/SAMCodeSynthesis/B_TcProcess/IP_B_TcProcess_goal.v
coqc $(cat _CoqProject) QCIPCases/SAMCodeSynthesis/B_TcProcess/IP_B_TcProcess_proof_auto.v
coqc $(cat _CoqProject) QCIPCases/SAMCodeSynthesis/B_TcProcess/IP_B_TcProcess_proof_manual.v
coqc $(cat _CoqProject) QCIPCases/SAMCodeSynthesis/B_TcProcess/IP_B_TcProcess_goal_check.v
```

## 关键技巧

1. **stub 外部函数**：`UartSend` / `SYS_Delay` / `UartRecv` 只写 spec 不写
   实现。`UartRecv` 这类"写调用者内存"的外部函数，spec 用
   `Ensure exists l ..., UCharArray::full(buf, 4, l) * store(len, _) * ...`，
   内容存在量化；返回值别忘了给 `0 <= __return <= UINT_MAX`，否则调用点的
   UInt store 安全性无法证明。
2. **裸地址的 typed store**：`*pIp->workMode` 的前置不能写
   `store(wm_addr, v)`（Z 逻辑变量无 C 类型，报
   `Cannot decide the type of data_at or store`），要用
   `data_at(wm_addr, unint32, v)`。
3. **局部标量取地址可以传给 stub**：`&len`、`&numerror` 直接匹配 callee
   spec 的 `store(ptr, v)`（但局部**数组**不行）。
4. **uchar 中间值不截断**：`chksum` 的中间存储保持未截断和式，截断
   `unsigned_last_nbits ... 8` 只在读取（比较）处出现；lib 引理
   `ulnb_sum3` 把 `ulnb(0+a+b+c, 8)` 归约为 `(a+b+c) mod 256`。
5. **数组元素的 uchar 界**：`INT_MAX` 类 safety VC 需要元素界，用
   CheckCal08 的套路：`sep_apply_l_atomic (UCharArray.full_split_to_missing_i ...)`
   拆出元素后 `prop_apply (valid_store_uchar ...)` 提取 `0 <= v <= 255`。
6. **不可行路径**：`&&` 求值产生的矛盾路径（如 `recv[0]≠0xE1` 后又
   `recv[0]==0xE1`）会生成 `|– “False”` 的 safety VC，
   `apply derivable1s_coq_prop_r; lia` 即可。
7. **`_derivable1_andp_intros` 会展开 spec 定义**：`B_TcProcessPost`
   这种透明 `Definition` 会被它一并拆成两个合取目标，return witness 的
   纯命题目标数要把 spec 定义内部的 `/\` 也算进去。
