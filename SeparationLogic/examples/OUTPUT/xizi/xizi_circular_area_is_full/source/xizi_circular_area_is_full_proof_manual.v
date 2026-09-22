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
From SimpleC.EE.OUTPUT.xizi.xizi_circular_area_is_full.source Require Import xizi_circular_area_is_full_goal.
From SimpleC.EE.OUTPUT.xizi.xizi_circular_area_is_full.source Require Import xizi_circular_area_is_full_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
Require Import SimpleC.EE.OUTPUT.xizi.xizi_circular_area_is_full.source.xizi_circular_area_is_full_lib.
Require Import QCIPLib.xizi.xizi_circular_area_common.xizi_circular_area_lib.
Local Open Scope sac.

Lemma proof_of_CircularAreaIsFull_entail_wit_1 : CircularAreaIsFull_entail_wit_1.
Proof.
  pre_process.
  unfold store_circular_area_or_null.
  Split.
  - Intros_p Hnull.
    exfalso; congruence.
  - Intros_p Hnonnull.
    unfold store_circular_area.
    Intros data_buffer operations readidx writeidx b_status physical.
    Exists operations readidx writeidx b_status physical data_buffer.
    entailer!.
Qed.

Lemma proof_of_CircularAreaIsFull_return_wit_1 : CircularAreaIsFull_return_wit_1.
Proof.
  pre_process.
  assert (Hresult : CircularAreaStateFullResult state 0).
  {
    unfold CircularAreaStateFullResult.
    right; split; [| reflexivity].
    unfold CircularAreaLogicalState in PreH4.
    destruct PreH4 as (_ & _ & _ & _ & _ & _ & _ & _ & Hfull & _ & _).
    intro Hlen.
    apply PreH1.
    exact (proj1 (proj2 Hfull Hlen)).
  }
  unfold store_circular_area.
  Exists data_buffer operations readidx writeidx b_status physical.
  entailer!.
Qed.

Lemma proof_of_CircularAreaIsFull_return_wit_2 : CircularAreaIsFull_return_wit_2.
Proof.
  pre_process.
  assert (Hresult : CircularAreaStateFullResult state 0).
  {
    unfold CircularAreaStateFullResult.
    right; split; [| reflexivity].
    unfold CircularAreaLogicalState in PreH5.
    destruct PreH5 as (Hcap & _ & _ & _ & _ & _ & _ & _ & _ & Hempty & _).
    pose proof (proj1 Hempty (conj PreH2 PreH1)) as Hlen0.
    lia.
  }
  unfold store_circular_area.
  Exists data_buffer operations readidx writeidx b_status physical.
  entailer!.
Qed.

Lemma proof_of_CircularAreaIsFull_return_wit_3 : CircularAreaIsFull_return_wit_3.
Proof.
  pre_process.
  assert (Hresult : CircularAreaStateFullResult state 1).
  {
    unfold CircularAreaStateFullResult.
    left; split; [| reflexivity].
    unfold CircularAreaLogicalState in PreH5.
    destruct PreH5 as (_ & _ & _ & _ & _ & _ & _ & Hstatus & Hfull & _ & _).
    assert (Hb1 : b_status = 1) by (destruct Hstatus; congruence).
    apply (proj1 Hfull).
    split; assumption.
  }
  unfold store_circular_area.
  Exists data_buffer operations readidx writeidx b_status physical.
  entailer!.
Qed.

Lemma proof_of_CircularAreaIsFull_return_wit_4 : CircularAreaIsFull_return_wit_4.
Proof.
  pre_process.
  unfold store_circular_area_or_null.
  Split.
  - Intros_p Hnull.
    entailer!.
  - Intros_p Hnonnull.
    exfalso; congruence.
Qed.

Lemma proof_of_CircularAreaIsFull_partial_solve_wit_1_pure : CircularAreaIsFull_partial_solve_wit_1_pure.
Proof.
  pre_process.
Qed.
