# Case Brief — JetCtrlSend

## 目标函数

`INPUT/SAMCodeSynthesis/JetCtrlSend/IP_JetCtrlSend.c`

功能：读取 12 路推力器脉冲输入 `pulse[0..11]`，把 6 对脉冲信号打包成软件
喷气字节 `wPulse`（第 k 对中任意一路等于 1 则置位 `0x04 << k`），组帧
`[0xEB, 0x93, wPulse]` 后调用 `UartSend(uartno, sendBuf, 3)` 发出。

## 验证策略

- 自包含 C 文件，内联结构体，直接以 `JetCtrlSend*` 为入口参数。
- `pulse` 是 `unint32 *` 指针字段：`UIntArray::full(pulse_addr, 12, pulse_list)`。
- `sendBuf` 原为函数内局部数组 `unint08 sendBuf[10]`；当前 symexec 不支持
  局部 C 数组（裸声明即在 return 处报 `Unsupported array predicate`），
  建模为结构体指针字段 `sendBuf`（3 字节，`UCharArray::full`）。
- `UartSend` 建模为外部调用：`Require UCharArray::full(buf, sendsize, l)`、
  `Ensure UartSendRecord(uartno, l) && UCharArray::full(...)`，把驱动读到的
  字节序列记录下来。
- 6 个 `if (p[2k]==1 || p[2k+1]==1)` 块逐字抽取为 helper
  `JetCtrlSendPairStep`，其 spec 为 `__return == jet_step(p0, p1, w, mask)`；
  主函数顺序调用 6 次，只有 1 条返回路径。
- 后置条件：`sent = [0xEB, 0x93, pack_wPulse(pulse_list)]`，
  `pack_wPulse` 与 helper 嵌套调用形状一致。

## 主要难点

1. **位运算第一次进入本工作流**：`w | 0x04` 建模为 `Z.lor w 4`；
   uchar 截断为 `unsigned_last_nbits x 8`（即 `x mod 256`）。
   需要字节界引理 `lor_byte_bound` / `jet_step_byte_bound`（在 lib 中证明）。
2. **局部数组不支持**：见验证策略第 3 条。
3. **路径爆炸**：`||` 条件每对 3 条可行路径，内联形式共 `3^6 = 729` 条返回
   路径（实测 3642 个 witness）。helper 抽取后全 case 仅 82 个 witness。
4. **强 spec 的缝合**：主 return witness 中缓冲区是 `replace_Znth` 链；
   用 lib 引理 `replace3` 归约为 `[235; 147; retval_6]`，再沿 PreH 的
   retval 链 `rewrite` 到 `pack_wPulse` 的定义形状，`reflexivity` 闭合。

## 交付位置

- `QCIPLib/SAMCodeSynthesis/JetCtrlSend/IP_JetCtrlSend_lib.v`
- `QCIPCases/SAMCodeSynthesis/JetCtrlSend/IP_JetCtrlSend_goal.v`
- `QCIPCases/SAMCodeSynthesis/JetCtrlSend/IP_JetCtrlSend_proof_auto.v`
- `QCIPCases/SAMCodeSynthesis/JetCtrlSend/IP_JetCtrlSend_proof_manual.v`
- `QCIPCases/SAMCodeSynthesis/JetCtrlSend/IP_JetCtrlSend_goal_check.v`
- `OUTPUT/SAMCodeSynthesis/JetCtrlSend/`
- `doc/JetCtrlSend/`
