Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Strings.String.
Require Import Coq.Strings.Ascii.
Require Import Coq.Lists.List.
Require Import Coq.Classes.RelationClasses.
Require Import Coq.Classes.Morphisms.
Require Import Coq.micromega.Psatz.
Require Import Coq.Sorting.Permutation.
From AUXLib Require Import int_auto Axioms Feq Idents ListLib VMap.
Require Import SetsClass.SetsClass. Import SetsNotation.
From SimpleC.SL Require Import Mem SeparationLogic.
From QCIPCases.SAMCodeSynthesis.B_TcProcess Require Import IP_B_TcProcess_goal.
From QCIPCases.SAMCodeSynthesis.B_TcProcess Require Import IP_B_TcProcess_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
Require Import QCIPLib.SAMCodeSynthesis.B_TcProcess.IP_B_TcProcess_lib.
Local Open Scope sac.









Lemma proof_of_B_TcProcessFun_safety_wit_28_split_goal_1 : B_TcProcessFun_safety_wit_28_split_goal_1.
Proof.
  unfold B_TcProcessFun_safety_wit_28_split_goal_1. intros.
  pre_process_default.
  sep_apply_l_atomic (UCharArray.full_split_to_missing_i rb_addr 2 4 l 0).
  - dump_pre_spatial. lia.
  - prop_apply (valid_store_uchar (rb_addr + 2 * sizeof ( UCHAR )) (Znth 2 l 0)).
    Intros.
    apply derivable1s_coq_prop_r.
    unfold Byte.max_unsigned, Byte.modulus, Byte.wordsize in *.
    simpl in *. lia.
Qed.

Lemma proof_of_B_TcProcessFun_safety_wit_28_split_goal_2 : B_TcProcessFun_safety_wit_28_split_goal_2.
Proof.
  unfold B_TcProcessFun_safety_wit_28_split_goal_2. intros.
  pre_process_default.
  sep_apply_l_atomic (UCharArray.full_split_to_missing_i rb_addr 2 4 l 0).
  - dump_pre_spatial. lia.
  - prop_apply (valid_store_uchar (rb_addr + 2 * sizeof ( UCHAR )) (Znth 2 l 0)).
    Intros.
    apply derivable1s_coq_prop_r.
    unfold Byte.max_unsigned, Byte.modulus, Byte.wordsize in *.
    simpl in *. lia.
Qed.

Lemma proof_of_B_TcProcessFun_safety_wit_28 : B_TcProcessFun_safety_wit_28.
Proof.
  unfold B_TcProcessFun_safety_wit_28.
  left. intros.
  apply _derivable1_andp_intros.
  - pose proof (proof_of_B_TcProcessFun_safety_wit_28_split_goal_1 pIp_pre rb_list rb_addr sb_list sb_addr old_wm wm_addr uartno new_err new_len l retval PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9) as H.
    exact H.
  - pose proof (proof_of_B_TcProcessFun_safety_wit_28_split_goal_2 pIp_pre rb_list rb_addr sb_list sb_addr old_wm wm_addr uartno new_err new_len l retval PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9) as H.
    exact H.
Qed.

Lemma proof_of_B_TcProcessFun_return_wit_1 : B_TcProcessFun_return_wit_1.
Proof.
  unfold B_TcProcessFun_return_wit_1. left. intros.
  Exists retval. Exists 0. Exists 1. Exists l.
  Exists (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))).
  repeat apply _derivable1_andp_intros;
  [ apply derivable1s_coq_prop_r; rewrite (replace2 sb_list 235 148 PreH10); reflexivity
  | apply derivable1s_coq_prop_r; rewrite (replace2 sb_list 235 148 PreH10); reflexivity
  | apply derivable1s_coq_prop_r; rewrite (replace2 sb_list 235 148 PreH10); reflexivity
  | apply derivable1s_coq_prop_r; exact I
  | apply derivable1s_coq_prop_r; exact PreH6
  | apply derivable1s_coq_prop_r; unfold final_workMode, valid_frame, header_ok, checksum_ok, decode_mode; rewrite ulnb_sum3 in PreH2; rewrite (proj2 (Z.eqb_eq (Znth 2 l 0) 0) PreH1), (proj2 (Z.eqb_eq (Znth 1 l 0) 0) PreH3), (proj2 (Z.eqb_eq (Znth 0 l 0) 225) PreH4), (proj2 (Z.eqb_eq (Znth 3 l 0) ((Znth 0 l 0 + Znth 1 l 0 + Znth 2 l 0) mod 256)) PreH2); reflexivity
  | apply derivable1s_coq_prop_r; unfold final_bSucc; rewrite (proj2 (Z.eqb_eq (Znth 0 l 0) 225) PreH4); reflexivity
  | entailer! ].
Qed.

Lemma proof_of_B_TcProcessFun_return_wit_2 : B_TcProcessFun_return_wit_2.
Proof.
  unfold B_TcProcessFun_return_wit_2. left. intros.
  Exists retval. Exists 51. Exists 1. Exists l.
  Exists (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))).
  repeat apply _derivable1_andp_intros;
  [ apply derivable1s_coq_prop_r; rewrite (replace2 sb_list 235 148 PreH11); reflexivity
  | apply derivable1s_coq_prop_r; rewrite (replace2 sb_list 235 148 PreH11); reflexivity
  | apply derivable1s_coq_prop_r; rewrite (replace2 sb_list 235 148 PreH11); reflexivity
  | apply derivable1s_coq_prop_r; exact I
  | apply derivable1s_coq_prop_r; exact PreH7
  | apply derivable1s_coq_prop_r; unfold final_workMode, valid_frame, header_ok, checksum_ok, decode_mode; rewrite ulnb_sum3 in PreH3; rewrite (proj2 (Z.eqb_eq (Znth 2 l 0) 1) PreH1), (proj2 (Z.eqb_neq (Znth 2 l 0) 0) PreH2), (proj2 (Z.eqb_eq (Znth 1 l 0) 0) PreH4), (proj2 (Z.eqb_eq (Znth 0 l 0) 225) PreH5), (proj2 (Z.eqb_eq (Znth 3 l 0) ((Znth 0 l 0 + Znth 1 l 0 + Znth 2 l 0) mod 256)) PreH3); reflexivity
  | apply derivable1s_coq_prop_r; unfold final_bSucc; rewrite (proj2 (Z.eqb_eq (Znth 0 l 0) 225) PreH5); reflexivity
  | entailer! ].
Qed.

Lemma proof_of_B_TcProcessFun_return_wit_3 : B_TcProcessFun_return_wit_3.
Proof.
  unfold B_TcProcessFun_return_wit_3. left. intros.
  Exists retval. Exists 68. Exists 1. Exists l.
  Exists (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))).
  repeat apply _derivable1_andp_intros;
  [ apply derivable1s_coq_prop_r; rewrite (replace2 sb_list 235 148 PreH11); reflexivity
  | apply derivable1s_coq_prop_r; rewrite (replace2 sb_list 235 148 PreH11); reflexivity
  | apply derivable1s_coq_prop_r; rewrite (replace2 sb_list 235 148 PreH11); reflexivity
  | apply derivable1s_coq_prop_r; exact I
  | apply derivable1s_coq_prop_r; exact PreH7
  | apply derivable1s_coq_prop_r; unfold final_workMode, valid_frame, header_ok, checksum_ok, decode_mode; rewrite ulnb_sum3 in PreH3; rewrite (proj2 (Z.eqb_neq (Znth 2 l 0) 1) PreH1), (proj2 (Z.eqb_neq (Znth 2 l 0) 0) PreH2), (proj2 (Z.eqb_eq (Znth 1 l 0) 0) PreH4), (proj2 (Z.eqb_eq (Znth 0 l 0) 225) PreH5), (proj2 (Z.eqb_eq (Znth 3 l 0) ((Znth 0 l 0 + Znth 1 l 0 + Znth 2 l 0) mod 256)) PreH3); reflexivity
  | apply derivable1s_coq_prop_r; unfold final_bSucc; rewrite (proj2 (Z.eqb_eq (Znth 0 l 0) 225) PreH5); reflexivity
  | entailer! ].
Qed.

Lemma proof_of_B_TcProcessFun_return_wit_4 : B_TcProcessFun_return_wit_4.
Proof.
  unfold B_TcProcessFun_return_wit_4. left. intros.
  Exists retval. Exists old_wm. Exists 1. Exists l.
  Exists (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))).
  repeat apply _derivable1_andp_intros;
  [ apply derivable1s_coq_prop_r; rewrite (replace2 sb_list 235 148 PreH9); reflexivity
  | apply derivable1s_coq_prop_r; rewrite (replace2 sb_list 235 148 PreH9); reflexivity
  | apply derivable1s_coq_prop_r; rewrite (replace2 sb_list 235 148 PreH9); reflexivity
  | apply derivable1s_coq_prop_r; exact I
  | apply derivable1s_coq_prop_r; exact PreH5
  | apply derivable1s_coq_prop_r; unfold final_workMode, valid_frame, header_ok, checksum_ok, decode_mode; rewrite ulnb_sum3 in PreH1; rewrite (proj2 (Z.eqb_eq (Znth 1 l 0) 0) PreH2), (proj2 (Z.eqb_eq (Znth 0 l 0) 225) PreH3), (proj2 (Z.eqb_neq (Znth 3 l 0) ((Znth 0 l 0 + Znth 1 l 0 + Znth 2 l 0) mod 256)) PreH1); reflexivity
  | apply derivable1s_coq_prop_r; unfold final_bSucc; rewrite (proj2 (Z.eqb_eq (Znth 0 l 0) 225) PreH3); reflexivity
  | entailer! ].
Qed.

Lemma proof_of_B_TcProcessFun_return_wit_5 : B_TcProcessFun_return_wit_5.
Proof.
  unfold B_TcProcessFun_return_wit_5. left. intros.
  Exists retval. Exists old_wm. Exists retval. Exists l.
  Exists (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))).
  repeat apply _derivable1_andp_intros;
  [ apply derivable1s_coq_prop_r; rewrite (replace2 sb_list 235 148 PreH8); reflexivity
  | apply derivable1s_coq_prop_r; rewrite (replace2 sb_list 235 148 PreH8); reflexivity
  | apply derivable1s_coq_prop_r; rewrite (replace2 sb_list 235 148 PreH8); reflexivity
  | apply derivable1s_coq_prop_r; exact I
  | apply derivable1s_coq_prop_r; exact PreH4
  | apply derivable1s_coq_prop_r; unfold final_workMode, valid_frame, header_ok, checksum_ok, decode_mode; rewrite (proj2 (Z.eqb_neq (Znth 0 l 0) 225) PreH1); reflexivity
  | apply derivable1s_coq_prop_r; unfold final_bSucc; rewrite (proj2 (Z.eqb_neq (Znth 0 l 0) 225) PreH1); rewrite PreH2; reflexivity
  | entailer! ].
Qed.

Lemma proof_of_B_TcProcessFun_return_wit_6 : B_TcProcessFun_return_wit_6.
Proof.
  unfold B_TcProcessFun_return_wit_6. left. intros.
  Exists retval. Exists old_wm. Exists 1. Exists l.
  Exists (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))).
  repeat apply _derivable1_andp_intros;
  [ apply derivable1s_coq_prop_r; rewrite (replace2 sb_list 235 148 PreH8); reflexivity
  | apply derivable1s_coq_prop_r; rewrite (replace2 sb_list 235 148 PreH8); reflexivity
  | apply derivable1s_coq_prop_r; rewrite (replace2 sb_list 235 148 PreH8); reflexivity
  | apply derivable1s_coq_prop_r; exact I
  | apply derivable1s_coq_prop_r; exact PreH4
  | apply derivable1s_coq_prop_r; unfold final_workMode, valid_frame, header_ok, checksum_ok, decode_mode; rewrite (proj2 (Z.eqb_neq (Znth 1 l 0) 0) PreH1), (proj2 (Z.eqb_eq (Znth 0 l 0) 225) PreH2); reflexivity
  | apply derivable1s_coq_prop_r; unfold final_bSucc; rewrite (proj2 (Z.eqb_eq (Znth 0 l 0) 225) PreH2); reflexivity
  | entailer! ].
Qed.

Lemma proof_of_B_TcProcessFun_return_wit_7 : B_TcProcessFun_return_wit_7.
Proof.
  unfold B_TcProcessFun_return_wit_7. left. intros.
  Exists retval. Exists old_wm. Exists retval. Exists l.
  Exists (replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list)))).
  repeat apply _derivable1_andp_intros;
  [ apply derivable1s_coq_prop_r; rewrite (replace2 sb_list 235 148 PreH7); reflexivity
  | apply derivable1s_coq_prop_r; rewrite (replace2 sb_list 235 148 PreH7); reflexivity
  | apply derivable1s_coq_prop_r; rewrite (replace2 sb_list 235 148 PreH7); reflexivity
  | apply derivable1s_coq_prop_r; exact I
  | apply derivable1s_coq_prop_r; exact PreH3
  | apply derivable1s_coq_prop_r; unfold final_workMode, valid_frame, header_ok, checksum_ok, decode_mode; rewrite (proj2 (Z.eqb_neq (Znth 0 l 0) 225) PreH2); reflexivity
  | apply derivable1s_coq_prop_r; unfold final_bSucc; rewrite (proj2 (Z.eqb_neq (Znth 0 l 0) 225) PreH2); reflexivity
  | entailer! ].
Qed.

Lemma proof_of_B_TcProcessFun_partial_solve_wit_3_pure_split_goal_1 : B_TcProcessFun_partial_solve_wit_3_pure_split_goal_1.
Proof.
  unfold B_TcProcessFun_partial_solve_wit_3_pure_split_goal_1.
  intros.
  apply derivable1s_coq_prop_r.
  repeat rewrite Zlength_replace_Znth. exact PreH9.
Qed.

Lemma proof_of_B_TcProcessFun_partial_solve_wit_3_pure : B_TcProcessFun_partial_solve_wit_3_pure.
Proof.
  unfold B_TcProcessFun_partial_solve_wit_3_pure.
  left. intros.
  apply derivable1s_coq_prop_r.
  repeat rewrite Zlength_replace_Znth. exact PreH1.
Qed.
