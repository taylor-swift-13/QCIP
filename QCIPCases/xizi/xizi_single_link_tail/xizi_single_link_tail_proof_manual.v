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

Lemma proof_of_xizi_single_link_tail_entail_wit_1 : xizi_single_link_tail_entail_wit_1.
Proof.
  pre_process.
  sep_apply xizi_sll_not_zero; [ | tauto ].
  Intros next l0.
  Exists next (@nil Z).
  Exists l0 l0.
  unfold xizi_sllseg.
  simpl.
  simpl app.
  entailer!.
Qed.

Lemma proof_of_xizi_single_link_tail_entail_wit_2 : xizi_single_link_tail_entail_wit_2.
Proof.
  pre_process.
  sep_apply xizi_sll_not_zero; [ | tauto ].
  Intros next l0.
  pose (l1_new := l1_2 ++ (linklist :: nil)).
  Exists next l1_new.
  Exists l0 l0_2.
  entailer!.
  - fold xizi_struct_name.
    fold xizi_next_field.
    sep_apply (xizi_sllseg_len1 linklist next_2); [ | tauto ].
    sep_apply (xizi_sllseg_sllseg linklist_pre linklist next_2 l1_2 (linklist :: nil)).
    entailer!.
  - subst l1_new.
    match goal with
    | Hsplit : l = app l1_2 (linklist :: l2_2),
      Htail : l2_2 = next_2 :: l0 |- _ =>
        rewrite Hsplit; rewrite Htail
    end.
    rewrite <- app_assoc.
    simpl.
    reflexivity.
Qed.

Lemma proof_of_xizi_single_link_tail_return_wit_1 : xizi_single_link_tail_return_wit_1.
Proof.
  pre_process.
  subst next.
  sep_apply (xizi_sll_zero 0 l2); [ | reflexivity ].
  Intros.
  subst l2.
  Exists 0 l1_2.
  entailer!.
Qed.
