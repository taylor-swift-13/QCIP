Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
Require Import Coq.Strings.String.
From SimpleC.SL Require Import SeparationLogic.
Require Import Logic.LogicGenerator.demo932.Interface.
From QCIPLib.xizi.xizi_single_link_common Require Import xizi_single_link_lib.
From QCIPLib.xizi.xizi_single_link_common Require Import xizi_single_link_strategy_goal.
Import naive_C_Rules.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string.

Lemma xizi_single_link_strategy301_correctness : xizi_single_link_strategy301.
Proof.
  pre_process_default.
  unfold xizi_sll.
  simpl.
  entailer!.
Qed.

Lemma xizi_single_link_strategy302_correctness : xizi_single_link_strategy302.
Proof.
  pre_process_default.
  unfold xizi_sll.
  simpl.
  entailer!.
Qed.

Lemma xizi_single_link_strategy303_correctness : xizi_single_link_strategy303.
Proof.
  pre_process_default.
  entailer!.
  subst.
  unfold xizi_sll.
  simpl.
  entailer!.
Qed.

Lemma xizi_single_link_strategy304_correctness : xizi_single_link_strategy304.
Proof.
  pre_process_default.
  rewrite <- logic_equiv_coq_prop_or.
  Intros.
  assert (p <> 0) by (destruct H; congruence).
  sep_apply xizi_sll_not_zero; [ | tauto ].
  Intros q l0.
  unfold xizi_struct_name, xizi_next_field.
  Exists q l0.
  rewrite <- logic_equiv_coq_prop_or.
  entailer!.
  try rewrite <- derivable1_wand_sepcon_adjoint.
  entailer!.
Qed.

Lemma xizi_single_link_strategy305_correctness : xizi_single_link_strategy305.
Proof.
  pre_process_default.
  unfold xizi_sll_head, generic_sll_head, xizi_head_store,
    sll_head_store, sll_link,
    xizi_struct_name, xizi_next_field.
  Intros q.
  Exists q.
  entailer!.
  unfold xizi_sll, xizi_struct_name, xizi_next_field.
  entailer!.
  rewrite <- derivable1_wand_sepcon_adjoint.
  entailer!.
Qed.

Lemma xizi_single_link_strategy306_correctness : xizi_single_link_strategy306.
Proof.
  pre_process_default.
  unfold xizi_sll_head, generic_sll_head, xizi_head_store,
    sll_head_store, sll_link,
    xizi_struct_name, xizi_next_field.
  Exists q.
  entailer!.
Qed.

Lemma xizi_single_link_strategy307_correctness : xizi_single_link_strategy307.
Proof.
  pre_process_default.
  Intros.
  subst.
  unfold xizi_sllseg.
  simpl.
  entailer!.
Qed.

Lemma xizi_single_link_strategy308_correctness : xizi_single_link_strategy308.
Proof.
  pre_process_default.
  rewrite <- logic_equiv_coq_prop_or.
  Intros.
  assert (p <> q) by (destruct H; congruence).
  sep_apply xizi_sllseg_not_same; [ | tauto ].
  Intros r l0.
  unfold xizi_struct_name, xizi_next_field.
  Exists r l0.
  rewrite <- logic_equiv_coq_prop_or.
  entailer!.
  try rewrite <- derivable1_wand_sepcon_adjoint.
  entailer!.
Qed.

Lemma xizi_single_link_strategy309_correctness : xizi_single_link_strategy309.
Proof.
  pre_process_default.
  rewrite <- logic_equiv_coq_prop_or.
  Intros.
  assert (p <> q) by (destruct H; congruence).
  sep_apply xizi_sll_to_target_not_same; [ | tauto ].
  Intros r l0.
  unfold xizi_struct_name, xizi_next_field.
  Exists r l0.
  rewrite <- logic_equiv_coq_prop_or.
  entailer!.
  rewrite <- derivable1_wand_sepcon_adjoint.
  entailer!.
Qed.

Lemma xizi_single_link_strategy310_correctness : xizi_single_link_strategy310.
Proof.
  pre_process_default.
  Intros.
  subst.
  unfold xizi_sll_to_target.
  simpl.
  entailer!.
Qed.
