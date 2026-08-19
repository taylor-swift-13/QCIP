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
From QCIPCases.xizi.xizi_single_link_tail Require Import xizi_single_link_tail_goal.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
From QCIPLib.xizi.xizi_single_link_common Require Import xizi_single_link_lib.
Local Open Scope sac.

Lemma proof_of_xizi_single_link_tail_safety_wit_1 :
  xizi_single_link_tail_safety_wit_1.
Proof.
  pre_process.
  entailer!.
Qed.

Lemma proof_of_xizi_single_link_tail_entail_wit_1 : xizi_single_link_tail_entail_wit_1.
Proof.
  right.
  intros linklist_pre l q q_2 l0 PreH1 PreH2 PreH3.
  Exists l0.
  entailer!.
Qed.

Lemma proof_of_xizi_single_link_tail_entail_wit_2 : xizi_single_link_tail_entail_wit_2.
Proof.
  right.
  intros l next_2 first_2 linklist l1_2 current l2_2 q l0
    PreH1 PreH2 PreH3 PreH4 PreH5.
  pose (l1_new := l1_2 ++ (current :: nil)).
  Exists l1_new l0.
  entailer!.
  - fold xizi_struct_name.
    fold xizi_next_field.
    sep_apply (xizi_sllseg_len1 current next_2);
      [ | exact PreH3 ].
    sep_apply
      (xizi_sllseg_sllseg
        first_2 current next_2
        l1_2 (current :: nil)).
    entailer!.
  - subst l1_new.
    rewrite PreH2.
    rewrite PreH1.
    rewrite <- app_assoc.
    simpl.
    reflexivity.
Qed.

Lemma proof_of_xizi_single_link_tail_return_wit_1 : xizi_single_link_tail_return_wit_1.
Proof.
  left.
  intros linklist_pre l next first l1 current l2
    PreH1 PreH2 PreH3 PreH4.
  replace next with 0 by (symmetry; exact PreH4).
  sepcon_lift (xizi_sll 0 l2).
  sep_apply (xizi_sll_zero 0 l2); [ | reflexivity ].
  Intros.
  subst l2.
  apply _derivable1_andp_intros.
  - rewrite PreH1.
    rewrite xizi_sll_tail_value_app_last.
    entailer!.
  - fold xizi_struct_name.
    fold xizi_next_field.
    sepcon_lift
      ((&(current # xizi_struct_name ->ₛ xizi_next_field)) # Ptr |-> 0).
    sep_apply (xizi_sll_len1 current 0);
      [ | exact H | exact PreH2 ].
    sep_apply
      (xizi_sllseg_sll
        first current l1 (current :: nil)).
    unfold xizi_sll_head, generic_sll_head, xizi_head_store,
      sll_head_store, sll_link,
      xizi_struct_name, xizi_next_field.
    Exists first.
    rewrite PreH1.
    prop_apply valid_store_ptr.
    entailer!.
Qed.

Lemma proof_of_xizi_single_link_tail_return_wit_2 : xizi_single_link_tail_return_wit_2.
Proof.
  left.
  intros linklist_pre l q PreH1 PreH2.
  subst q.
  sep_apply (xizi_sll_zero 0 l); [ | reflexivity ].
  Intros.
  subst l.
  unfold xizi_sll_tail_value.
  simpl.
  unfold xizi_sll_head, generic_sll_head, xizi_head_store,
    sll_head_store, sll_link,
    xizi_struct_name, xizi_next_field.
  Exists 0.
  unfold xizi_sll, generic_sll.
  simpl.
  entailer!.
Qed.

Lemma proof_of_xizi_single_link_tail_partial_solve_wit_1 :
  xizi_single_link_tail_partial_solve_wit_1.
Proof.
  pre_process.
  unfold xizi_sll_head, generic_sll_head, xizi_head_store,
    sll_head_store, sll_link.
  Intros q.
  Exists q.
  entailer!.
Qed.
