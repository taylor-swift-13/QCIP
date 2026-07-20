# Final Checklist — B_TcProcess

## 编译链（依赖顺序，全部通过）

| 步骤 | 文件 | 结果 |
|---|---|---|
| 1 | `QCIPLib/SAMCodeSynthesis/B_TcProcess/IP_B_TcProcess_lib.v` | coqc 通过 |
| 2 | `QCIPCases/SAMCodeSynthesis/B_TcProcess/IP_B_TcProcess_goal.v` | coqc 通过 |
| 3 | `QCIPCases/SAMCodeSynthesis/B_TcProcess/IP_B_TcProcess_proof_auto.v` | coqc 通过 |
| 4 | `QCIPCases/SAMCodeSynthesis/B_TcProcess/IP_B_TcProcess_proof_manual.v` | coqc 通过 |
| 5 | `QCIPCases/SAMCodeSynthesis/B_TcProcess/IP_B_TcProcess_goal_check.v` | coqc 通过 |

## 结构检查

- [x] symexec 到文件尾（`Successfully finished symbolic execution`）。
- [x] `proof_auto.v` / `proof_manual.v` 无 `Admitted.`、无 `Abort.`。
- [x] `IP_B_TcProcess_lib.v` 无 `Admitted.`、无额外 `Axiom`。
- [x] `goal_check.v` 的 `Module VC_Correctness : VC_Correct` Include 通过。
- [x] `Print Assumptions`（return_wit_1 / return_wit_5）：仅 SL 框架公理。
- [x] goal.v 尾部 `Axiom proof_of_*` 为 symexec 标准生成结构，非证明漏洞。
- [x] `*_proof_manual.v` 只含 witness 证明，无新增顶层 Definition/Fixpoint/Inductive/Notation/Axiom。
- [x] lib 中 helper 引理（`replace2`、`ulnb_sum3`）均已 Qed 证明。

## spec 质量自评（soundness / completeness）

- **soundness**：spec 与 C 行为一一对应——`decode_mode` 与 if/else 链一致，
  `final_workMode`/`final_bSucc` 与分支结构一致；stub 不虚构外部函数行为。
- **completeness**：对任意应答帧（UartRecv 内容存在量化、无约束），
  `*workMode` 与 `bSucc` 的最终值都被完全决定；发送帧内容被记录为
  `[0xEB, 0x94]`；`pulse` 类输入缓冲区无写入的保持性由 frame 断言给出。
- 已知局限：`UartSendRecord` 是占位谓词（`True`）；`sendBuf`/`recvBuf`
  由局部数组建模为指针字段（等价变形，已记录）；`UartRecv` 的 spec 不
  约束返回帧与真实协议的关系（stub 语义，属预期）。

## 清理

- [x] `.tmp/btctest/` 实验文件待删除（脚本已归档至本目录 `gen_proofs.py`）。
- [x] case 目录下 Coq 编译缓存（*.vo 等）待清理。
