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
From SimpleC.EE.OUTPUT.xizi.xizi_circular_area_is_empty.source Require Import xizi_circular_area_is_empty_goal.
From SimpleC.EE.OUTPUT.xizi.xizi_circular_area_is_empty.source Require Import xizi_circular_area_is_empty_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
Require Import SimpleC.EE.OUTPUT.xizi.xizi_circular_area_is_empty.source.xizi_circular_area_is_empty_lib.
Require Import QCIPLib.xizi.xizi_circular_area_common.xizi_circular_area_lib.
Local Open Scope sac.

Lemma proof_of_CircularAreaIsEmpty_entail_wit_1 : CircularAreaIsEmpty_entail_wit_1.
Proof.
  pre_process.
  unfold store_circular_area_or_null, store_circular_area.
  Split.
  - Intros_p Hzero.
    exfalso.
    apply PreH1.
    exact Hzero.
  - Intros data_buffer operations readidx writeidx b_status physical.
    Exists operations readidx writeidx b_status physical data_buffer.
    entailer!.
Qed.

Lemma proof_of_CircularAreaIsEmpty_return_wit_1 : CircularAreaIsEmpty_return_wit_1.
Proof.
  pre_process.
  assert (Hnonnull : ca_contents state <> nil).
  { intro Hnil.
    apply (proj1
      (CircularAreaLogicalState_nil_iff__empty_query_unfold_and_repack
        readidx writeidx (ca_capacity state) b_status
        (ca_contents state) physical PreH4)) in Hnil.
    destruct Hnil as [Heq _].
    contradiction.
  }
  unfold store_circular_area, CircularAreaStateEmptyResult.
  Exists data_buffer operations readidx writeidx b_status physical.
  entailer!.
Qed.

Lemma proof_of_CircularAreaIsEmpty_return_wit_2 : CircularAreaIsEmpty_return_wit_2.
Proof.
  pre_process.
  assert (Hnonnull : ca_contents state <> nil).
  { intro Hnil.
    apply (proj1
      (CircularAreaLogicalState_nil_iff__empty_query_unfold_and_repack
        readidx writeidx (ca_capacity state) b_status
        (ca_contents state) physical PreH5)) in Hnil.
    destruct Hnil as [_ Hzero].
    contradiction.
  }
  unfold store_circular_area, CircularAreaStateEmptyResult.
  Exists data_buffer operations readidx writeidx b_status physical.
  entailer!.
Qed.

Lemma proof_of_CircularAreaIsEmpty_return_wit_3 : CircularAreaIsEmpty_return_wit_3.
Proof.
  pre_process.
  assert (Hnil : ca_contents state = nil).
  { apply (proj2
      (CircularAreaLogicalState_nil_iff__empty_query_unfold_and_repack
        readidx writeidx (ca_capacity state) b_status
        (ca_contents state) physical PreH5)).
    split; assumption.
  }
  unfold store_circular_area, CircularAreaStateEmptyResult.
  Exists data_buffer operations readidx writeidx b_status physical.
  entailer!.
Qed.

Lemma proof_of_CircularAreaIsEmpty_return_wit_4 : CircularAreaIsEmpty_return_wit_4.
Proof.
  pre_process.
  unfold store_circular_area_or_null, store_circular_area.
  Split.
  - Intros_p Hzero.
    entailer!.
  - Intros data_buffer operations readidx writeidx b_status physical.
    exfalso.
    apply H.
    exact PreH1.
Qed.

Lemma proof_of_CircularAreaIsEmpty_partial_solve_wit_1_pure : CircularAreaIsEmpty_partial_solve_wit_1_pure.
Proof.
  pre_process.
Qed.
