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
From QCIPCases.SAMCodeSynthesis.JetCtrlSend Require Import IP_JetCtrlSend_goal.
From QCIPCases.SAMCodeSynthesis.JetCtrlSend Require Import IP_JetCtrlSend_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
Require Import QCIPLib.SAMCodeSynthesis.JetCtrlSend.IP_JetCtrlSend_lib.
Local Open Scope sac.





Lemma proof_of_JetCtrlSendPairStep_return_wit_1_split_goal_1 : JetCtrlSendPairStep_return_wit_1_split_goal_1.
Proof.
  unfold JetCtrlSendPairStep_return_wit_1_split_goal_1. intros.
    unfold jet_step.
    rewrite (proj2 (Z.eqb_eq p0_pre 1) PreH1). simpl. reflexivity.
Qed.

Lemma proof_of_JetCtrlSendPairStep_return_wit_1 : JetCtrlSendPairStep_return_wit_1.
Proof.
  unfold JetCtrlSendPairStep_return_wit_1. left. intros.
  apply _derivable1_andp_intros.
  - apply derivable1s_coq_prop_r.
    unfold jet_step.
    rewrite (proj2 (Z.eqb_eq p0_pre 1) PreH1). simpl. reflexivity.
  - entailer!.
Qed.

Lemma proof_of_JetCtrlSendPairStep_return_wit_2_split_goal_1 : JetCtrlSendPairStep_return_wit_2_split_goal_1.
Proof.
  unfold JetCtrlSendPairStep_return_wit_2_split_goal_1. intros.
    unfold jet_step.
    rewrite (proj2 (Z.eqb_neq p0_pre 1) PreH2), (proj2 (Z.eqb_eq p1_pre 1) PreH1). simpl. reflexivity.
Qed.

Lemma proof_of_JetCtrlSendPairStep_return_wit_2 : JetCtrlSendPairStep_return_wit_2.
Proof.
  unfold JetCtrlSendPairStep_return_wit_2. left. intros.
  apply _derivable1_andp_intros.
  - apply derivable1s_coq_prop_r.
    unfold jet_step.
    rewrite (proj2 (Z.eqb_neq p0_pre 1) PreH2), (proj2 (Z.eqb_eq p1_pre 1) PreH1). simpl. reflexivity.
  - entailer!.
Qed.

Lemma proof_of_JetCtrlSendPairStep_return_wit_3_split_goal_1 : JetCtrlSendPairStep_return_wit_3_split_goal_1.
Proof.
  unfold JetCtrlSendPairStep_return_wit_3_split_goal_1. intros.
    unfold jet_step.
    rewrite (proj2 (Z.eqb_neq p0_pre 1) PreH2), (proj2 (Z.eqb_neq p1_pre 1) PreH1). simpl. reflexivity.
Qed.

Lemma proof_of_JetCtrlSendPairStep_return_wit_3 : JetCtrlSendPairStep_return_wit_3.
Proof.
  unfold JetCtrlSendPairStep_return_wit_3. left. intros.
  apply _derivable1_andp_intros.
  - apply derivable1s_coq_prop_r.
    unfold jet_step.
    rewrite (proj2 (Z.eqb_neq p0_pre 1) PreH2), (proj2 (Z.eqb_neq p1_pre 1) PreH1). simpl. reflexivity.
  - entailer!.
Qed.

Lemma proof_of_JetCtrlSendFun_return_wit_1_split_goal_1 : JetCtrlSendFun_return_wit_1_split_goal_1.
Proof.
  unfold JetCtrlSendFun_return_wit_1_split_goal_1. intros.
      unfold JetCtrlSendPost.
      rewrite (replace3 sb_list 235 147 retval_6 PreH9).
      rewrite PreH2, PreH3, PreH4, PreH5, PreH6, PreH7.
      unfold pack_wPulse. reflexivity.
Qed.

Lemma proof_of_JetCtrlSendFun_return_wit_1 : JetCtrlSendFun_return_wit_1.
Proof.
  unfold JetCtrlSendFun_return_wit_1. left. intros.
  Exists (replace_Znth 2 retval_6 (replace_Znth 1 147 (replace_Znth 0 235 sb_list))).
  apply _derivable1_andp_intros.
  - apply _derivable1_andp_intros.
    + apply derivable1s_coq_prop_r. exact PreH1.
    + apply derivable1s_coq_prop_r.
      unfold JetCtrlSendPost.
      rewrite (replace3 sb_list 235 147 retval_6 PreH9).
      rewrite PreH2, PreH3, PreH4, PreH5, PreH6, PreH7.
      unfold pack_wPulse. reflexivity.
  - entailer!.
Qed.

Lemma proof_of_JetCtrlSendFun_partial_solve_wit_6_pure_split_goal_1 : JetCtrlSendFun_partial_solve_wit_6_pure_split_goal_1.
Proof.
  unfold JetCtrlSendFun_partial_solve_wit_6_pure_split_goal_1. intros.
  apply derivable1s_coq_prop_r.
  assert (HB : 0 <= retval < 256).
  {
    rewrite PreH3.
    apply jet_step_byte_bound; lia.
  }
  lia.
Qed.

Lemma proof_of_JetCtrlSendFun_partial_solve_wit_6_pure_split_goal_2 : JetCtrlSendFun_partial_solve_wit_6_pure_split_goal_2.
Proof.
  unfold JetCtrlSendFun_partial_solve_wit_6_pure_split_goal_2. intros.
  apply derivable1s_coq_prop_r.
  assert (HB : 0 <= retval < 256).
  {
    rewrite PreH3.
    apply jet_step_byte_bound; lia.
  }
  lia.
Qed.

Lemma proof_of_JetCtrlSendFun_partial_solve_wit_6_pure : JetCtrlSendFun_partial_solve_wit_6_pure.
Proof.
  unfold JetCtrlSendFun_partial_solve_wit_6_pure. left. intros.
  assert (HB : 0 <= retval < 256).
  {
    rewrite PreH1.
    apply jet_step_byte_bound; lia.
  }
  repeat apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_JetCtrlSendFun_partial_solve_wit_9_pure_split_goal_1 : JetCtrlSendFun_partial_solve_wit_9_pure_split_goal_1.
Proof.
  unfold JetCtrlSendFun_partial_solve_wit_9_pure_split_goal_1. intros.
  apply derivable1s_coq_prop_r.
  assert (HB : 0 <= retval < 256).
  {
    rewrite PreH3.
    apply jet_step_byte_bound; [ | lia].
    rewrite PreH4.
    apply jet_step_byte_bound; lia.
  }
  lia.
Qed.

Lemma proof_of_JetCtrlSendFun_partial_solve_wit_9_pure_split_goal_2 : JetCtrlSendFun_partial_solve_wit_9_pure_split_goal_2.
Proof.
  unfold JetCtrlSendFun_partial_solve_wit_9_pure_split_goal_2. intros.
  apply derivable1s_coq_prop_r.
  assert (HB : 0 <= retval < 256).
  {
    rewrite PreH3.
    apply jet_step_byte_bound; [ | lia].
    rewrite PreH4.
    apply jet_step_byte_bound; lia.
  }
  lia.
Qed.

Lemma proof_of_JetCtrlSendFun_partial_solve_wit_9_pure : JetCtrlSendFun_partial_solve_wit_9_pure.
Proof.
  unfold JetCtrlSendFun_partial_solve_wit_9_pure. left. intros.
  assert (HB : 0 <= retval < 256).
  {
    rewrite PreH1.
    apply jet_step_byte_bound; [ | lia].
    rewrite PreH2.
    apply jet_step_byte_bound; lia.
  }
  repeat apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_JetCtrlSendFun_partial_solve_wit_12_pure_split_goal_1 : JetCtrlSendFun_partial_solve_wit_12_pure_split_goal_1.
Proof.
  unfold JetCtrlSendFun_partial_solve_wit_12_pure_split_goal_1. intros.
  apply derivable1s_coq_prop_r.
  assert (HB : 0 <= retval < 256).
  {
    rewrite PreH3.
    apply jet_step_byte_bound; [ | lia].
    rewrite PreH4.
    apply jet_step_byte_bound; [ | lia].
    rewrite PreH5.
    apply jet_step_byte_bound; lia.
  }
  lia.
Qed.

Lemma proof_of_JetCtrlSendFun_partial_solve_wit_12_pure_split_goal_2 : JetCtrlSendFun_partial_solve_wit_12_pure_split_goal_2.
Proof.
  unfold JetCtrlSendFun_partial_solve_wit_12_pure_split_goal_2. intros.
  apply derivable1s_coq_prop_r.
  assert (HB : 0 <= retval < 256).
  {
    rewrite PreH3.
    apply jet_step_byte_bound; [ | lia].
    rewrite PreH4.
    apply jet_step_byte_bound; [ | lia].
    rewrite PreH5.
    apply jet_step_byte_bound; lia.
  }
  lia.
Qed.

Lemma proof_of_JetCtrlSendFun_partial_solve_wit_12_pure : JetCtrlSendFun_partial_solve_wit_12_pure.
Proof.
  unfold JetCtrlSendFun_partial_solve_wit_12_pure. left. intros.
  assert (HB : 0 <= retval < 256).
  {
    rewrite PreH1.
    apply jet_step_byte_bound; [ | lia].
    rewrite PreH2.
    apply jet_step_byte_bound; [ | lia].
    rewrite PreH3.
    apply jet_step_byte_bound; lia.
  }
  repeat apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_JetCtrlSendFun_partial_solve_wit_15_pure_split_goal_1 : JetCtrlSendFun_partial_solve_wit_15_pure_split_goal_1.
Proof.
  unfold JetCtrlSendFun_partial_solve_wit_15_pure_split_goal_1. intros.
  apply derivable1s_coq_prop_r.
  assert (HB : 0 <= retval < 256).
  {
    rewrite PreH3.
    apply jet_step_byte_bound; [ | lia].
    rewrite PreH4.
    apply jet_step_byte_bound; [ | lia].
    rewrite PreH5.
    apply jet_step_byte_bound; [ | lia].
    rewrite PreH6.
    apply jet_step_byte_bound; lia.
  }
  lia.
Qed.

Lemma proof_of_JetCtrlSendFun_partial_solve_wit_15_pure_split_goal_2 : JetCtrlSendFun_partial_solve_wit_15_pure_split_goal_2.
Proof.
  unfold JetCtrlSendFun_partial_solve_wit_15_pure_split_goal_2. intros.
  apply derivable1s_coq_prop_r.
  assert (HB : 0 <= retval < 256).
  {
    rewrite PreH3.
    apply jet_step_byte_bound; [ | lia].
    rewrite PreH4.
    apply jet_step_byte_bound; [ | lia].
    rewrite PreH5.
    apply jet_step_byte_bound; [ | lia].
    rewrite PreH6.
    apply jet_step_byte_bound; lia.
  }
  lia.
Qed.

Lemma proof_of_JetCtrlSendFun_partial_solve_wit_15_pure : JetCtrlSendFun_partial_solve_wit_15_pure.
Proof.
  unfold JetCtrlSendFun_partial_solve_wit_15_pure. left. intros.
  assert (HB : 0 <= retval < 256).
  {
    rewrite PreH1.
    apply jet_step_byte_bound; [ | lia].
    rewrite PreH2.
    apply jet_step_byte_bound; [ | lia].
    rewrite PreH3.
    apply jet_step_byte_bound; [ | lia].
    rewrite PreH4.
    apply jet_step_byte_bound; lia.
  }
  repeat apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_JetCtrlSendFun_partial_solve_wit_18_pure_split_goal_1 : JetCtrlSendFun_partial_solve_wit_18_pure_split_goal_1.
Proof.
  unfold JetCtrlSendFun_partial_solve_wit_18_pure_split_goal_1. intros.
  apply derivable1s_coq_prop_r.
  assert (HB : 0 <= retval < 256).
  {
    rewrite PreH3.
    apply jet_step_byte_bound; [ | lia].
    rewrite PreH4.
    apply jet_step_byte_bound; [ | lia].
    rewrite PreH5.
    apply jet_step_byte_bound; [ | lia].
    rewrite PreH6.
    apply jet_step_byte_bound; [ | lia].
    rewrite PreH7.
    apply jet_step_byte_bound; lia.
  }
  lia.
Qed.

Lemma proof_of_JetCtrlSendFun_partial_solve_wit_18_pure_split_goal_2 : JetCtrlSendFun_partial_solve_wit_18_pure_split_goal_2.
Proof.
  unfold JetCtrlSendFun_partial_solve_wit_18_pure_split_goal_2. intros.
  apply derivable1s_coq_prop_r.
  assert (HB : 0 <= retval < 256).
  {
    rewrite PreH3.
    apply jet_step_byte_bound; [ | lia].
    rewrite PreH4.
    apply jet_step_byte_bound; [ | lia].
    rewrite PreH5.
    apply jet_step_byte_bound; [ | lia].
    rewrite PreH6.
    apply jet_step_byte_bound; [ | lia].
    rewrite PreH7.
    apply jet_step_byte_bound; lia.
  }
  lia.
Qed.

Lemma proof_of_JetCtrlSendFun_partial_solve_wit_18_pure : JetCtrlSendFun_partial_solve_wit_18_pure.
Proof.
  unfold JetCtrlSendFun_partial_solve_wit_18_pure. left. intros.
  assert (HB : 0 <= retval < 256).
  {
    rewrite PreH1.
    apply jet_step_byte_bound; [ | lia].
    rewrite PreH2.
    apply jet_step_byte_bound; [ | lia].
    rewrite PreH3.
    apply jet_step_byte_bound; [ | lia].
    rewrite PreH4.
    apply jet_step_byte_bound; [ | lia].
    rewrite PreH5.
    apply jet_step_byte_bound; lia.
  }
  repeat apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_JetCtrlSendFun_partial_solve_wit_22_pure_split_goal_1 : JetCtrlSendFun_partial_solve_wit_22_pure_split_goal_1.
Proof.
  unfold JetCtrlSendFun_partial_solve_wit_22_pure_split_goal_1. intros.
  apply derivable1s_coq_prop_r.
  repeat rewrite Zlength_replace_Znth. exact PreH10.
Qed.

Lemma proof_of_JetCtrlSendFun_partial_solve_wit_22_pure : JetCtrlSendFun_partial_solve_wit_22_pure.
Proof.
  unfold JetCtrlSendFun_partial_solve_wit_22_pure. left. intros.
  apply derivable1s_coq_prop_r.
  repeat rewrite Zlength_replace_Znth. exact PreH8.
Qed.
