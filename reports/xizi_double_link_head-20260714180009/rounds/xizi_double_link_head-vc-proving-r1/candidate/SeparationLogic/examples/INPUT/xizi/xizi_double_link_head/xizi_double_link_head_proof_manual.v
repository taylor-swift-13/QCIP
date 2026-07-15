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
From SimpleC.EE.INPUT.xizi.xizi_double_link_head Require Import xizi_double_link_head_goal.
From SimpleC.EE.INPUT.xizi.xizi_double_link_head Require Import xizi_double_link_head_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
Require Import SimpleC.EE.INPUT.xizi.xizi_double_link_head.xizi_double_link_head_lib.
Local Open Scope sac.

Lemma proof_of_xizi_double_link_head_return_wit_1 : xizi_double_link_head_return_wit_1.
Proof.
  unfold xizi_double_link_head_return_wit_1.
  right.
  intros linklist_pre last first nodes PreH1 PreH2.
  destruct nodes as [| node rest].
  - simpl in *.
    subst first.
    entailer!.
  - simpl in PreH2.
    subst first.
    unfold xizi_dllseg at 1.
    Intros next.
    destruct H as [_ Hneq].
    contradiction.
Qed.

Lemma proof_of_xizi_double_link_head_return_wit_2 : xizi_double_link_head_return_wit_2.
Proof.
  unfold xizi_double_link_head_return_wit_2.
  right.
  intros linklist_pre last first nodes PreH1 PreH2.
  destruct nodes as [| node rest].
  - simpl in PreH2.
    contradiction.
  - simpl in PreH2.
    subst first.
    entailer!.
Qed.
