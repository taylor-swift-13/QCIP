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
From SimpleC.EE.INPUT.xizi.xizi_double_link_next Require Import xizi_double_link_next_goal.
From SimpleC.EE.INPUT.xizi.xizi_double_link_next Require Import xizi_double_link_next_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
Require Import SimpleC.EE.INPUT.xizi.xizi_double_link_next.xizi_double_link_next_lib.
Local Open Scope sac.

Lemma proof_of_xizi_double_link_next_return_wit_1 : xizi_double_link_next_return_wit_1.
Proof.
  unfold xizi_double_link_next_return_wit_1.
  right.
  intros linklist_node_pre linklist_pre last next before first suffix prefix
         PreH1 PreH2 PreH3 PreH4.
  destruct suffix as [| suffix_head suffix_tail].
  - simpl.
    entailer!.
  - simpl in PreH4.
    destruct PreH4 as [Hnext Hnot_head].
    congruence.
Qed.

Lemma proof_of_xizi_double_link_next_return_wit_2 : xizi_double_link_next_return_wit_2.
Proof.
  unfold xizi_double_link_next_return_wit_2.
  right.
  intros linklist_node_pre linklist_pre last next before first suffix prefix
         PreH1 PreH2 PreH3 PreH4.
  destruct suffix as [| suffix_head suffix_tail].
  - simpl in PreH4.
    congruence.
  - simpl in PreH4.
    destruct PreH4 as [Hnext Hnot_head].
    subst next.
    simpl.
    entailer!.
Qed.
