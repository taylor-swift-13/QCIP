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
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_callpoint_specs.source Require Import xizi_double_link_callpoint_specs_goal.
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_callpoint_specs.source Require Import xizi_double_link_callpoint_specs_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
From QCIPLib.xizi.xizi_double_link_common Require Import xizi_double_link_lib.
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_callpoint_specs.source
      Require Import xizi_double_link_callpoint_specs_lib.
Local Open Scope sac.

Lemma proof_of_xizi_double_link_call_empty_after_init_return_wit_1 : xizi_double_link_call_empty_after_init_return_wit_1.
Proof.
  unfold xizi_double_link_call_empty_after_init_return_wit_1.
  left.
  intros head_pre retval Hret Hhead1 Hhead2.
  subst retval.
  unfold xizi_double_link_call_empty_result.
  entailer!.
Qed.

Lemma proof_of_xizi_double_link_call_empty_rec_after_init_return_wit_1 : xizi_double_link_call_empty_rec_after_init_return_wit_1.
Proof.
  unfold xizi_double_link_call_empty_rec_after_init_return_wit_1.
  left.
  intros head_pre retval Hret Hhead1 Hhead2.
  subst retval.
  unfold xizi_double_link_call_empty_result.
  entailer!.
Qed.

Lemma proof_of_xizi_double_link_call_head_after_init_return_wit_1 : xizi_double_link_call_head_after_init_return_wit_1.
Proof.
  unfold xizi_double_link_call_head_after_init_return_wit_1.
  left.
  intros head_pre retval Hret Hhead1 Hhead2.
  subst retval.
  unfold xizi_double_link_call_null_result.
  entailer!.
Qed.

Lemma proof_of_xizi_double_link_call_head_rec_after_init_return_wit_1 : xizi_double_link_call_head_rec_after_init_return_wit_1.
Proof.
  unfold xizi_double_link_call_head_rec_after_init_return_wit_1.
  left.
  intros head_pre retval Hret Hhead1 Hhead2.
  subst retval.
  unfold xizi_double_link_call_null_result.
  entailer!.
Qed.

Lemma proof_of_xizi_double_link_call_len_after_init_return_wit_1 : xizi_double_link_call_len_after_init_return_wit_1.
Proof.
  unfold xizi_double_link_call_len_after_init_return_wit_1.
  left.
  intros head_pre retval Hret Hhead1 Hhead2.
  subst retval.
  unfold xizi_double_link_call_len_result.
  entailer!.
Qed.

Lemma proof_of_xizi_double_link_call_next_after_init_return_wit_1 : xizi_double_link_call_next_after_init_return_wit_1.
Proof.
  unfold xizi_double_link_call_next_after_init_return_wit_1.
  left.
  intros head_pre nodes retval Hret Hhead Hnodes.
  subst nodes.
  subst retval.
  unfold xizi_double_link_call_null_result, xizi_double_link_first_value.
  entailer!.
Qed.

Lemma proof_of_xizi_double_link_call_next_rec_last_after_init_return_wit_1 : xizi_double_link_call_next_rec_last_after_init_return_wit_1.
Proof.
  unfold xizi_double_link_call_next_rec_last_after_init_return_wit_1.
  left.
  intros head_pre nodes retval Hret Hhead Hnodes.
  subst nodes.
  subst retval.
  unfold xizi_double_link_call_null_result, xizi_double_link_first_value.
  entailer!.
Qed.

Lemma proof_of_xizi_double_link_call_next_rec_middle_after_init_return_wit_1 : xizi_double_link_call_next_rec_middle_after_init_return_wit_1.
Proof.
  unfold xizi_double_link_call_next_rec_middle_after_init_return_wit_1.
  left.
  intros head_pre nodes retval Hret Hhead Hnodes.
  subst nodes.
  subst retval.
  unfold xizi_double_link_call_null_result, xizi_double_link_first_value.
  entailer!.
Qed.

Lemma proof_of_xizi_double_link_call_insert_after_init_return_wit_1 : xizi_double_link_call_insert_after_init_return_wit_1.
Proof.
  unfold xizi_double_link_call_insert_after_init_return_wit_1.
  left.
  intros node_pre head_pre nodes Hnode Hhead Hnodes.
  subst nodes.
  unfold xizi_double_link_singleton_nodes.
  entailer!.
Qed.

Lemma proof_of_xizi_double_link_call_remove_front_singleton_entail_wit_2 : xizi_double_link_call_remove_front_singleton_entail_wit_2.
Proof.
  pre_process.
  subst nodes.
  Exists (@nil Z).
  simpl app.
  split_pure_spatial.
  - cancel (xizi_dll head_pre (node_pre :: nil)).
  - dump_pre_spatial.
    reflexivity.
Qed.

Lemma proof_of_xizi_double_link_call_remove_front_singleton_return_wit_1 : xizi_double_link_call_remove_front_singleton_return_wit_1.
Proof.
  pre_process.
  subst suffix.
  cancel (xizi_dll head_pre nil).
  cancel (xizi_dll node_pre nil).
Qed.

Lemma proof_of_xizi_double_link_call_remove_tail_singleton_entail_wit_2 : xizi_double_link_call_remove_tail_singleton_entail_wit_2.
Proof.
  pre_process.
  subst nodes.
  Exists (@nil Z).
  simpl app.
  split_pure_spatial.
  - cancel (xizi_dll head_pre (node_pre :: nil)).
  - dump_pre_spatial.
    reflexivity.
Qed.

Lemma proof_of_xizi_double_link_call_remove_tail_singleton_return_wit_1 : xizi_double_link_call_remove_tail_singleton_return_wit_1.
Proof.
  pre_process.
  subst prefix.
  cancel (xizi_dll head_pre nil).
  cancel (xizi_dll node_pre nil).
Qed.
