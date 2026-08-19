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
From QCIPCases.xizi.xizi_single_link_empty Require Import xizi_single_link_empty_goal.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
From QCIPLib.xizi.xizi_single_link_common Require Import xizi_single_link_lib.
Local Open Scope sac.

Lemma proof_of_xizi_single_link_empty_return_wit_1 : xizi_single_link_empty_return_wit_1.
Proof.
  right.
  intros linklist_pre l q q_2 l0 PreH1 PreH2 PreH3.
  subst l.
  apply _derivable1_andp_intros.
  - entailer!.
    discriminate.
  - unfold xizi_sll.
    simpl.
    unfold xizi_addr_node_store, sll_addr_store, sll_link,
      xizi_struct_name, xizi_next_field.
    Exists q_2.
    entailer!.
Qed.

Lemma proof_of_xizi_single_link_empty_return_wit_2 : xizi_single_link_empty_return_wit_2.
Proof.
  right.
  intros linklist_pre l q PreH1 PreH2.
  subst q.
  destruct l as [|node rest].
  - unfold xizi_sll, generic_sll.
    simpl.
    entailer!.
  - unfold xizi_sll, generic_sll.
    simpl.
    Intros next.
    entailer!.
Qed.
