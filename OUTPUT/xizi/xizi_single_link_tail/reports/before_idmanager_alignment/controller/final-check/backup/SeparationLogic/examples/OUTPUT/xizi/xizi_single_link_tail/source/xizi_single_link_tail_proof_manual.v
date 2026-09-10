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
From SimpleC.EE.OUTPUT.xizi.xizi_single_link_tail.source Require Import xizi_single_link_tail_goal.
From SimpleC.EE.OUTPUT.xizi.xizi_single_link_tail.source Require Import xizi_single_link_tail_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
From QCIPLib.xizi.xizi_single_link_common Require Import xizi_single_link_lib.
Local Open Scope sac.

Lemma proof_of_SingleLinkListGetTailNode_entail_wit_1 : SingleLinkListGetTailNode_entail_wit_1.
Proof.
  aggressive_pre_process.
  Exists l0.
  entailer!.
Qed.

Lemma proof_of_SingleLinkListGetTailNode_entail_wit_2 : SingleLinkListGetTailNode_entail_wit_2.
Proof.
  aggressive_pre_process.
  Exists (l1_2 ++ current :: nil) l0.
  sep_apply_l_atomic (xizi_sllseg_len1 current next_2 PreH3).
  sep_apply_l_atomic
    (xizi_sllseg_sllseg first_2 current next_2
      l1_2 (current :: nil)).
  entailer!.
  rewrite <- PreH1.
  rewrite <- app_assoc.
  simpl.
  exact PreH2.
Qed.

Lemma proof_of_SingleLinkListGetTailNode_return_wit_1 : SingleLinkListGetTailNode_return_wit_1.
Proof.
  aggressive_pre_process.
  - subst next.
    sep_apply_l_atomic (xizi_sll_zero 0 l2 eq_refl).
    Intros_p Hnil.
    subst l2.
    simpl in PreH1.
    subst l.
    sep_apply_l_atomic (xizi_sll_len1 current 0 PreH2 eq_refl).
    sep_apply_l_atomic
      (xizi_sllseg_sll first current l1 (current :: nil)).
    entailer!.
  - subst next.
    sep_apply_l_atomic (xizi_sll_zero 0 l2 eq_refl).
    Intros_p Hnil.
    subst l2.
    simpl in PreH1.
    subst l.
    dump_pre_spatial.
    rewrite xizi_sll_tail_value_app_last.
    reflexivity.
Qed.

Lemma proof_of_SingleLinkListGetTailNode_return_wit_2 : SingleLinkListGetTailNode_return_wit_2.
Proof.
  aggressive_pre_process.
  subst q.
  sep_apply_l_atomic (xizi_sll_zero 0 l eq_refl).
  Intros_p Hnil.
  subst l.
  unfold xizi_sll_tail_value.
  simpl.
  entailer!.
Qed.
