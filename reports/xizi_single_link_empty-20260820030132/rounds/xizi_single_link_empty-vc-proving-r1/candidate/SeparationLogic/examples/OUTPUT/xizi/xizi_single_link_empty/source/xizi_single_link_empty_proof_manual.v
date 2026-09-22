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
From SimpleC.EE.OUTPUT.xizi.xizi_single_link_empty.source Require Import xizi_single_link_empty_goal.
From SimpleC.EE.OUTPUT.xizi.xizi_single_link_empty.source Require Import xizi_single_link_empty_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
From QCIPLib.xizi.xizi_single_link_common Require Import xizi_single_link_lib.
Local Open Scope sac.

Lemma proof_of_IsSingleLinkListEmpty_return_wit_1 : IsSingleLinkListEmpty_return_wit_1.
Proof.
  right.
  pre_process.
  subst l.
  split_pure_spatial.
  - unfold xizi_sll at 2.
    simpl.
    unfold xizi_addr_node_store, xizi_struct_name, xizi_next_field,
      sll_addr_store, sll_link.
    Exists q_2.
    entailer!.
  - dump_pre_spatial.
    discriminate.
Qed.

Lemma proof_of_IsSingleLinkListEmpty_return_wit_2 : IsSingleLinkListEmpty_return_wit_2.
Proof.
  right.
  pre_process.
  subst q.
  destruct l as [| node rest].
  - split_pure_spatial.
    + cancel (xizi_sll 0 nil).
    + dump_pre_spatial.
      reflexivity.
  - unfold xizi_sll.
    simpl.
    Intros next.
    Intros.
    contradiction.
Qed.
