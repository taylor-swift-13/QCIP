# Witness Ledger — B_TcProcess

goal.v 中 witness 定义共 66 个（含 split_goal / _pure / _aux 变体），
proof_auto.v 52 个引理 + proof_manual.v 12 个引理，
全部由 `reports/gen_proofs.py` 按模板生成，coqc 全部通过。

## B_TcProcessFun 的 7 个 return witness（proof_manual）

| witness | 路径 | new_wm | new_bs | 证明要点 |
|---|---|---|---|---|
| return_wit_1 | 帧有效 + recv[2]=0 | 0 (SAM_DAMP) | 1 | `valid_frame` 三个 eqb  rewrite + `decode_mode` |
| return_wit_2 | 帧有效 + recv[2]=1 | 51 (SAM_CRUISE) | 1 | 同上 |
| return_wit_3 | 帧有效 + recv[2]∉{0,1} | 68 (NOCTRL) | 1 | `Z.eqb_neq` 两次 |
| return_wit_4 | 帧头对但校验和错 | old_wm（不变） | 1 | `ulnb_sum3` 归约后 eqb_neq |
| return_wit_5 | recv[0]≠0xE1 但 ret=1 | old_wm | 1 | `final_bSucc = ret = 1` |
| return_wit_6 | recv[0]=0xE1 但 recv[1]≠0 | old_wm | 1 | header_ok 第二项为假 |
| return_wit_7 | recv[0]≠0xE1 且 ret≠1 | old_wm | ret | `final_bSucc = ret` |

每个 return witness 拆 8 个目标：3 个 sent 事实（`replace2`）、
`UartSendRecord`（`exact I`）、`Zlength l`（assumption）、
Post 两个合取（按路径 rewrite）、frame（`entailer!`）。

## safety witness（37 个）

- 常量 INT_MIN/INT_MAX 检查（34 个，proof_auto）：`_derivable1_andp_intros`
  + `derivable1s_coq_prop_r` + `lia`。
- safety_20 / 21：不可行路径（`recv[0]≠0xE1` 与 `recv[0]=0xE1` 矛盾），
  目标为 `|– “False”`，`derivable1s_coq_prop_r; lia`。
- safety_24 / 26：chksum 第 1/2 次累加的 INT 界，路径上已知
  `recv[0]=225`、`recv[1]=0`，`lia` 直接闭合。
- safety_28（proof_manual，+2 split_goal）：第 3 次累加的 INT 界，
  需要 `recv[2]` 的字节界：`UCharArray.full_split_to_missing_i` 拆出元素后
  `prop_apply (valid_store_uchar ...)` 提取 `0 <= v <= 255`（CheckCal08 套路）。

## partial_solve witness（15 个基础 + _pure/_aux 变体）

| witness | 内容 | 证法 |
|---|---|---|
| 1, 2 | 写 sendBuf[0]/[1] 前拆 `UCharArray.full` | `full_split_to_missing_i` + `store_uchar_undef_store_uchar` + `entailer!` |
| 3(_pure/_aux/base) | UartSend 调用前置：`Zlength (replace 链) = 2` | `Zlength_replace_Znth` rewrite + assumption |
| 4 | UartSend 调用后恢复 Record + frame | `exact I` / assumption / `entailer!` |
| 5(_pure/_aux/base) | UartRecv 调用前置：`Zlength rb_list = 4` | assumption |
| 6..15 | 读 recvBuf[k] 前拆 `UCharArray.full`（recv[0]×4、recv[1]×2、recv[2]×3、recv[3]×1） | `sep_apply_l_atomic (UCharArray.full_split_to_missing_i ...)` + `entailer!` |

## 无 Admitted / Abort

`grep -rn 'Admitted\.\|Abort\.' QCIPCases/SAMCodeSynthesis/B_TcProcess QCIPLib/SAMCodeSynthesis/B_TcProcess`
无输出。`Print Assumptions proof_of_B_TcProcessFun_return_wit_1/5` 仅含
SL 框架公理（`CNotation.sizeof_*`、`CNotation.eval_addr_expr`、
`FunctionalExtensionality`）。
