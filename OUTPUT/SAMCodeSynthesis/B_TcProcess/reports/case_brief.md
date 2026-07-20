# Case Brief — B_TcProcess

## 目标函数

`INPUT/SAMCodeSynthesis/B_TcProcess/IP_B_TcProcess.c`

功能：经串口与 OBDH 交互，处理模式切换指令。发送取数帧 `[0xEB, 0x94]`，
延时后接收 4 字节应答；若帧头为 `[0xE1, 0x00]` 且校验和
`recv[3] == (recv[0]+recv[1]+recv[2]) mod 256` 正确，则按 `recv[2]`
改写 `*workMode`（0->SAM_DAMP，1->SAM_CRUISE，其他->NOCTRL）。

## 验证策略

- 自包含 C 文件，内联结构体，直接以 `B_TcProcess*` 为入口参数。
- 局部数组 `obdhSendData[2]` / `obdhRecvData[4]` 建模为结构体指针字段
  `sendBuf` / `recvBuf`（局部 C 数组不受支持）。
- 三个外部函数 stub：`UartSend`（记录发送内容）、`SYS_Delay`（emp/emp）、
  `UartRecv`（只保证输出形状，内容任意 → 主函数 spec 对任意应答帧成立）。
- `*workMode` 用 `data_at(wm_addr, unint32, v)` 描述（裸地址 typed store）。
- 常数 3 次的校验和循环手动展开。
- 后置：`new_wm = final_workMode old_wm recv_l`（帧有效则解码写入，否则不变），
  `new_bs = final_bSucc ret recv_l`。

## 主要难点

1. **stub 建模**：外部函数不实现，只给 spec；`UartRecv` 返回值必须声明
   `0 <= __return <= UINT_MAX`，否则调用点 UInt store 安全性不可证。
2. **局部标量取地址**：`&len` / `&numerror` 可以直接匹配 stub spec 的
   `store(ptr, v)`，无需建模为字段。
3. **uchar 中间值不截断**：中间存储是未截断和式，截断只在比较读取处出现；
   `ulnb_sum3` 引理完成归约。
4. **不可行路径**：`&&` 求值产生矛盾路径，对应 `|– “False”` 的 safety VC。
5. **`_derivable1_andp_intros` 展开透明 Definition**：`B_TcProcessPost`
   被拆成两个目标，return witness 按 8 个目标组织证明。

## 交付位置

- `QCIPLib/SAMCodeSynthesis/B_TcProcess/IP_B_TcProcess_lib.v`
- `QCIPCases/SAMCodeSynthesis/B_TcProcess/IP_B_TcProcess_goal.v`
- `QCIPCases/SAMCodeSynthesis/B_TcProcess/IP_B_TcProcess_proof_auto.v`
- `QCIPCases/SAMCodeSynthesis/B_TcProcess/IP_B_TcProcess_proof_manual.v`
- `QCIPCases/SAMCodeSynthesis/B_TcProcess/IP_B_TcProcess_goal_check.v`
- `OUTPUT/SAMCodeSynthesis/B_TcProcess/`
- `doc/B_TcProcess/`
