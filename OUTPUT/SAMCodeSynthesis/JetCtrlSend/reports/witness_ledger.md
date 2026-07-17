# Witness Ledger — JetCtrlSend

goal.v 中 witness 定义共 82 个（含 split_goal / _pure / _aux 变体），
proof_auto.v 与 proof_manual.v 中的 `proof_of_*` 引理共 75 个，
全部由 `reports/gen_proofs.py` 按模板生成，coqc 全部通过。

## JetCtrlSendPairStep（helper，8 个）

| witness | 数量 | 内容 | 证法 |
|---|---|---|---|
| safety_wit_1..2 | 2 | 常量 INT_MIN/INT_MAX 检查 | `_derivable1_andp_intros` + `derivable1s_coq_prop_r` + `lia` |
| return_wit_1(+split) | 2 | `p0 = 1` 路径：`Z.lor w mask = jet_step p0 p1 w mask` | `Z.eqb_eq` rewrite + `reflexivity` |
| return_wit_2(+split) | 2 | `p0 ≠ 1, p1 = 1` 路径 | `Z.eqb_neq` / `Z.eqb_eq` rewrite + `reflexivity` |
| return_wit_3(+split) | 2 | `p0 ≠ 1, p1 ≠ 1` 路径：`w = jet_step p0 p1 w mask` | `Z.eqb_neq` rewrite + `reflexivity` |

## JetCtrlSendFun（主函数，67 个引理）

| witness | 数量 | 内容 | 证法 |
|---|---|---|---|
| safety_wit_1..25 | 25 | 常量 INT_MIN/INT_MAX 检查 | 同 helper safety 模板 |
| return_wit_1(+split) | 2 | 函数返回：`exists sent, UartSendRecord ∧ JetCtrlSendPost ∧ 帧断言` | `Exists` replace 链 + `replace3` + retval 链 rewrite + `reflexivity` + `entailer!` |
| partial_solve_wit_1,2,4,5,7,8,10,11,13,14,16,17 | 12 | 读 `pulse[k]` 前拆 `UIntArray.full` | `sep_apply_l_atomic (UIntArray.full_split_to_missing_i ...)` + `entailer!` |
| partial_solve_wit_19,20,21 | 3 | 写 `sendBuf[k]` 前拆 `UCharArray.full` | `full_split_to_missing_i` + `store_uchar_undef_store_uchar` + `entailer!` |
| partial_solve_wit_3(_pure) | 1+1 | 第 1 次 helper 调用前置（常量界） | `derivable1s_coq_prop_r` + `lia` |
| partial_solve_wit_6,9,12,15,18(_pure + 2 split 各) | 5+10 | 第 2..6 次 helper 调用前置：`0 <= retval_k < 256` | 沿 retval 链 `rewrite` + 嵌套 `jet_step_byte_bound` |
| partial_solve_wit_22(_pure + split) | 1+1 | `UartSend` 调用前置：`Zlength (replace 链) = 3` | `Zlength_replace_Znth` rewrite + assumption |
| partial_solve_wit_3,6,9,12,15,18,22（base 蕴含式） | 7 | `wit_N_pure -> wit_N_aux` | 直接证 aux：同上证核心 + `entailer!` 收 frame |

## 无 Admitted / Abort

`grep -rn 'Admitted\.\|Abort\.' QCIPCases/SAMCodeSynthesis/JetCtrlSend QCIPLib/SAMCodeSynthesis/JetCtrlSend`
无输出。goal.v 尾部的 `Axiom proof_of_*` 是 symexec 标准生成结构
（与 SendUartData / ThrusterCtrlLogic 相同），由 proof 文件中的同名引理
经 `goal_check.v` 的 `Include` 闭合；`Print Assumptions` 显示除 SL 框架
自身的 `CNotation.sizeof_*` / `eval_addr_expr` 与
`FunctionalExtensionality` 外无其他公理。
