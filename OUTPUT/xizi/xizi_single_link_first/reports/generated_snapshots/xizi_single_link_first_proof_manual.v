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
From SimpleC.EE.OUTPUT.xizi.xizi_single_link_first.source Require Import xizi_single_link_first_goal.
From SimpleC.EE.OUTPUT.xizi.xizi_single_link_first.source Require Import xizi_single_link_first_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
From QCIPLib.xizi.xizi_single_link_common Require Import xizi_single_link_lib.
Require Import SimpleC.EE.OUTPUT.xizi.xizi_single_link_first.source.xizi_single_link_first_lib.
Local Open Scope sac.

Lemma proof_of_SingleLinkListGetFirstNode_entail_wit_1 : SingleLinkListGetFirstNode_entail_wit_1.
Proof.
  pre_process.
  unfold xizi_sll_head_payload, generic_sll_head_payload,
    generic_sll_head, sll_head_store, sll_link,
    xizi_struct_name, xizi_next_field.
  Intros first.
  Exists first.
  split_pure_spatial.
  - unfold xizi_sll_payload, generic_sll_payload,
      xizi_struct_name, xizi_next_field.
    cancel.
  - dump_pre_spatial. assumption.
Qed. 

Lemma proof_of_SingleLinkListGetFirstNode_return_wit_1 : SingleLinkListGetFirstNode_return_wit_1.
Proof.
  pre_process.
  split_pure_spatial.
  - unfold xizi_sll_head_payload, generic_sll_head_payload,
      generic_sll_head, sll_head_store, sll_link,
      xizi_struct_name, xizi_next_field.
    Exists first.
    split_pure_spatial.
    + unfold xizi_sll_payload, generic_sll_payload,
        xizi_struct_name, xizi_next_field.
      cancel.
    + dump_pre_spatial. exact PreH1.
  - destruct l as [|node tail].
    + unfold xizi_sll_payload, generic_sll_payload,
        xizi_sll_first_value, xizi_sll_first_ptrs.
      simpl. Intros.
      dump_pre_spatial. assumption.
    + unfold xizi_sll_payload, generic_sll_payload,
        xizi_sll_first_value, xizi_sll_first_ptrs.
      simpl. unfold sll_payload_cell.
      Intros next. Intros.
      dump_pre_spatial. assumption.
Qed. 

