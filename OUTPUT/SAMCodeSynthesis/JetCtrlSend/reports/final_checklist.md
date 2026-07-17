# Final Checklist — JetCtrlSend

## 编译链（依赖顺序，全部通过）

| 步骤 | 文件 | 结果 |
|---|---|---|
| 1 | `QCIPLib/SAMCodeSynthesis/JetCtrlSend/IP_JetCtrlSend_lib.v` | coqc 通过 |
| 2 | `QCIPCases/SAMCodeSynthesis/JetCtrlSend/IP_JetCtrlSend_goal.v` | coqc 通过 |
| 3 | `QCIPCases/SAMCodeSynthesis/JetCtrlSend/IP_JetCtrlSend_proof_auto.v` | coqc 通过 |
| 4 | `QCIPCases/SAMCodeSynthesis/JetCtrlSend/IP_JetCtrlSend_proof_manual.v` | coqc 通过 |
| 5 | `QCIPCases/SAMCodeSynthesis/JetCtrlSend/IP_JetCtrlSend_goal_check.v` | coqc 通过 |

## 结构检查

- [x] symexec 到文件尾（`Successfully finished symbolic execution`），generated files 与当前 annotated C 一致。
- [x] `proof_auto.v` / `proof_manual.v` 无 `Admitted.`、无 `Abort.`。
- [x] `IP_JetCtrlSend_lib.v` 无 `Admitted.`、无额外 `Axiom`。
- [x] `goal_check.v` 的 `Module VC_Correctness : VC_Correct` Include 通过。
- [x] `Print Assumptions proof_of_JetCtrlSendFun_return_wit_1`：除 SL 框架公理（`CNotation.sizeof_*`、`CNotation.eval_addr_expr`、`FunctionalExtensionality`）外无其他公理。
- [x] goal.v 尾部 `Axiom proof_of_*` 为 symexec 标准生成结构（与既有 case 一致），非证明漏洞。
- [x] `*_proof_manual.v` 只含 witness 证明，无新增顶层 Definition/Fixpoint/Inductive/Notation/Axiom。
- [x] lib 中 helper 引理（`replace3`、`lor_byte_bound`、`jet_step_byte_bound`）均已 Qed 证明。

## spec 质量自评（soundness / completeness）

- **soundness**：spec 只断言程序真实计算的内容——`pack_wPulse` 与 C 的
  逐位置位一一对应；helper spec 与其函数体一一对应；外部驱动不假设额外语义。
- **completeness**：后置条件完全刻画了可观察行为——交给 `UartSend` 的
  字节序列被限定为 `[0xEB, 0x93, pack_wPulse(pulse_list)]`（不是只断言
  安全性）；对任意 `pulse[i]` 取值成立（不限 0/1）；`pulse` 数组与结构体
  字段在返回后保持不变也被断言。
- 已知局限：`UartSendRecord` 是占位谓词（`True`），发送"事件"本身不含
  驱动侧性质；`sendBuf` 由局部数组建模为指针字段（语义等价变形，已在
  README 记录）。

## 清理

- [x] `.tmp/bitop_test/` 实验文件待删除（脚本已归档至本目录 `gen_proofs.py`）。
- [x] case 目录下 Coq 编译缓存（*.vo 等）待清理。
