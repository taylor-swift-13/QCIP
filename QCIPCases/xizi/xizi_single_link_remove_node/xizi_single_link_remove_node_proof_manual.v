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
From QCIPCases.xizi.xizi_single_link_remove_node Require Import xizi_single_link_remove_node_goal.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
From QCIPLib.xizi.xizi_single_link_common Require Import xizi_single_link_lib.
Local Open Scope sac.

Lemma proof_of_xizi_single_link_remove_node_safety_wit_1 :
  xizi_single_link_remove_node_safety_wit_1.
Proof.
  pre_process.
  entailer!.
Qed.

Lemma proof_of_xizi_single_link_remove_node_safety_wit_2 :
  xizi_single_link_remove_node_safety_wit_2.
Proof.
  pre_process.
  entailer!.
Qed.

Lemma proof_of_xizi_single_link_remove_node_safety_wit_3 :
  xizi_single_link_remove_node_safety_wit_3.
Proof.
  pre_process.
  entailer!.
Qed.

Lemma proof_of_xizi_single_link_remove_node_safety_wit_4 :
  xizi_single_link_remove_node_safety_wit_4.
Proof.
  pre_process.
  entailer!.
Qed.

Lemma proof_of_xizi_single_link_remove_node_entail_wit_1 :
  xizi_single_link_remove_node_entail_wit_1.
Proof.
  pre_process.
  sep_apply xizi_sll_to_target_not_same; [ | tauto ].
  Intros next rest.
  Exists (xizi_sll_first_value l2) next (@nil Z) l1 l1.
  unfold xizi_sllseg.
  simpl.
  entailer!.
Qed.

Lemma proof_of_xizi_single_link_remove_node_entail_wit_2 :
  xizi_single_link_remove_node_entail_wit_2.
Proof.
  pre_process.
  sep_apply xizi_sll_to_target_not_same; [ | tauto ].
  Intros next rest.
  pose (l1a_new := l1a_2 ++ (node :: nil)).
  Exists (xizi_sll_first_value l2) next l1a_new rest l1.
  entailer!.
  - fold xizi_struct_name.
    fold xizi_next_field.
    sep_apply (xizi_sllseg_len1 node next_2); [ | tauto ].
    sep_apply
      (xizi_sllseg_sllseg
        linklist_pre node next_2 l1a_2 (node :: nil)).
    entailer!.
  - subst l1a_new.
    match goal with
    | Hsplit :
        cons linklist_pre l1 =
          app l1a_2 (node :: l1b_2),
      Htail : l1b_2 = next_2 :: rest |- _ =>
        rewrite Hsplit; rewrite Htail
    end.
    rewrite <- app_assoc.
    simpl.
    reflexivity.
Qed.

Lemma proof_of_xizi_single_link_remove_node_return_wit_1 :
  xizi_single_link_remove_node_return_wit_1.
Proof.
  pre_process.
  subst node_node_next.
  fold xizi_struct_name.
  fold xizi_next_field.
  sep_apply
    (xizi_sll_cons
      node (xizi_sll_first_value l2) l2 PreH4).
  sep_apply
    (xizi_sllseg_sll
      linklist_pre node l1a (node :: l2)).
  replace (l1a ++ node :: l2)
    with (linklist_pre :: (l1 ++ l2)).
  - sep_apply
      (xizi_sll_head_from_cons linklist_pre (l1 ++ l2)).
    Exists (xizi_sll_first_value l2).
    entailer!.
  - match goal with
    | Hsplit :
        cons linklist_pre l1 =
          app l1a (node :: nil) |- _ =>
        rewrite Hsplit
    end.
    rewrite <- app_assoc.
    simpl.
    reflexivity.
Qed.

Lemma proof_of_xizi_single_link_remove_node_return_wit_2 :
  xizi_single_link_remove_node_return_wit_2.
Proof.
  pre_process.
  subst next.
  sep_apply xizi_sll_to_target_zero_nonzero; [ | tauto ].
  entailer!.
Qed.

Lemma proof_of_xizi_single_link_remove_node_partial_solve_wit_1_pure :
  xizi_single_link_remove_node_partial_solve_wit_1_pure.
Proof.
  pre_process.
  entailer!.
Qed.

Lemma proof_of_xizi_single_link_remove_node_partial_solve_wit_1 :
  xizi_single_link_remove_node_partial_solve_wit_1.
Proof.
  intros.
  pre_process.
  entailer!.
Qed.

Lemma proof_of_xizi_single_link_remove_node_partial_solve_wit_2 :
  xizi_single_link_remove_node_partial_solve_wit_2.
Proof.
  pre_process.
  subst next.
  entailer!.
Qed.

Lemma proof_of_xizi_single_link_remove_node_which_implies_wit_1 :
  xizi_single_link_remove_node_which_implies_wit_1.
Proof.
  right.
  intros l2 l1 l linklist_node linklist first
    Hhead Hlist.
  subst l.
  sep_apply
    (xizi_sll_head_split_target
      linklist first l1 linklist_node l2 Hhead).
  entailer!.
Qed.
