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
From SimpleC.EE.OUTPUT.xizi.xizi_circular_area_data_length.source Require Import xizi_circular_area_data_length_goal.
From SimpleC.EE.OUTPUT.xizi.xizi_circular_area_data_length.source Require Import xizi_circular_area_data_length_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
From SimpleC.EE.OUTPUT.xizi.xizi_circular_area_data_length.source Require Import xizi_circular_area_data_length_lib.
Local Open Scope sac.

Lemma proof_of_CircularAreaIsFull_entail_wit_1_state_spec : CircularAreaIsFull_entail_wit_1_state_spec.
Proof.
  pre_process.
  unfold store_circular_area.
  Intros data_buffer operations readidx writeidx b_status physical.
  subst area_addr_state_spec.
  Exists operations readidx writeidx b_status physical data_buffer.
  entailer!.
Qed.

Lemma proof_of_CircularAreaIsFull_return_wit_1_state_spec : CircularAreaIsFull_return_wit_1_state_spec.
Proof.
  pre_process.
  pose proof
    (circular_area_distinct_indices_imply_nonfull__is_full_contract
       readidx writeidx (ca_capacity state_state_spec) b_status
       (ca_contents state_state_spec) physical PreH4 PreH1) as Hnonfull.
  unfold store_circular_area, CircularAreaFullResult.
  Exists data_buffer operations readidx writeidx b_status physical.
  entailer!.
  destruct (Z.eq_dec (Zlength (ca_contents state_state_spec))
                     (ca_capacity state_state_spec)) as [Heq | Hneq].
  - lia.
  - reflexivity.
Qed.

Lemma proof_of_CircularAreaIsFull_return_wit_2_state_spec : CircularAreaIsFull_return_wit_2_state_spec.
Proof.
  pre_process.
  pose proof PreH5 as Hstate.
  unfold CircularAreaLogicalState in Hstate.
  destruct Hstate as
    (Hcapacity & Hread & Hwrite & Hlogical & Hphysical & Hbytes &
     Hwriteeq & Hstatus & Hfull & Hempty & Hlive).
  pose proof (proj1 Hempty (conj PreH2 PreH1)) as Hlength.
  unfold store_circular_area, CircularAreaFullResult.
  Exists data_buffer operations readidx writeidx b_status physical.
  entailer!.
  destruct (Z.eq_dec (Zlength (ca_contents state_state_spec))
                     (ca_capacity state_state_spec)) as [Heq | Hneq].
  - lia.
  - reflexivity.
Qed.

Lemma proof_of_CircularAreaIsFull_return_wit_3_state_spec : CircularAreaIsFull_return_wit_3_state_spec.
Proof.
  pre_process.
  pose proof PreH5 as Hstate.
  unfold CircularAreaLogicalState in Hstate.
  destruct Hstate as
    (Hcapacity & Hread & Hwrite & Hlogical & Hphysical & Hbytes &
     Hwriteeq & Hstatus & Hfull & Hempty & Hlive).
  assert (Hbstatus : b_status = 1) by
    (destruct Hstatus; [contradiction | assumption]).
  pose proof (proj1 Hfull (conj PreH2 Hbstatus)) as Hlength.
  unfold store_circular_area, CircularAreaFullResult.
  Exists data_buffer operations readidx writeidx b_status physical.
  entailer!.
  destruct (Z.eq_dec (Zlength (ca_contents state_state_spec))
                     (ca_capacity state_state_spec)) as [Heq | Hneq].
  - reflexivity.
  - contradiction.
Qed.

Lemma proof_of_CircularAreaIsFull_return_wit_4_null_spec : CircularAreaIsFull_return_wit_4_null_spec.
Proof.
  pre_process.
Qed.

Lemma proof_of_CircularAreaIsFull_partial_solve_wit_1_state_spec_pure : CircularAreaIsFull_partial_solve_wit_1_state_spec_pure.
Proof.
  pre_process.
Qed.

Lemma proof_of_CircularAreaGetDataLength_safety_wit_7_state_spec : CircularAreaGetDataLength_safety_wit_7_state_spec.
Proof.
  pre_process.
  unfold CircularAreaLogicalState in PreH4.
  destruct PreH4 as (Hcapacity & _).
  entailer!.
Qed.

Lemma proof_of_CircularAreaGetDataLength_safety_wit_8_state_spec : CircularAreaGetDataLength_safety_wit_8_state_spec.
Proof.
  pre_process.
  unfold CircularAreaLogicalState in PreH4.
  destruct PreH4 as (Hcapacity & Hread & Hwrite & _).
  entailer!.
Qed.

Lemma proof_of_CircularAreaGetDataLength_entail_wit_1_state_spec : CircularAreaGetDataLength_entail_wit_1_state_spec.
Proof.
  pre_process.
  subst area_addr_state_spec.
  assert (Hfull : Zlength (ca_contents state_state_spec) =
                  ca_capacity state_state_spec).
  {
    unfold CircularAreaFullResult in PreH1.
    destruct (Z.eq_dec (Zlength (ca_contents state_state_spec))
                         (ca_capacity state_state_spec)) as [Heq | Hneq].
    - exact Heq.
    - exfalso. apply PreH5. rewrite PreH1. reflexivity.
  }
  unfold store_circular_area.
  Intros data_buffer operations readidx writeidx b_status physical.
  Exists operations readidx writeidx b_status physical data_buffer.
  entailer!.
Qed.

Lemma proof_of_CircularAreaGetDataLength_entail_wit_2_state_spec : CircularAreaGetDataLength_entail_wit_2_state_spec.
Proof.
  pre_process.
  subst area_addr_state_spec.
  assert (Hnotfull : Zlength (ca_contents state_state_spec) <>
                     ca_capacity state_state_spec).
  {
    intro Heq.
    unfold CircularAreaFullResult in PreH1.
    destruct (Z.eq_dec (Zlength (ca_contents state_state_spec))
                         (ca_capacity state_state_spec)) as [Hyes | Hno].
    - rewrite PreH5 in PreH1. discriminate.
    - contradiction.
  }
  unfold store_circular_area.
  Intros data_buffer operations readidx writeidx b_status physical.
  pose proof H as Hbounds.
  destruct Hbounds as (_ & _ & Hlogical).
  unfold CircularAreaLogicalState in Hlogical.
  destruct Hlogical as (_ & _ & _ & Hlogical_length & _).
  assert (Hlt : Zlength (ca_contents state_state_spec) <
                ca_capacity state_state_spec) by lia.
  Exists operations readidx writeidx b_status physical data_buffer.
  entailer!.
Qed.

Lemma proof_of_CircularAreaGetDataLength_return_wit_1_state_spec : CircularAreaGetDataLength_return_wit_1_state_spec.
Proof.
  pre_process.
  split_pure_spatial.
  - unfold store_circular_area.
    Exists data_buffer operations readidx writeidx b_status physical.
    entailer!.
  - dump_pre_spatial.
    unfold CircularAreaDataLengthResult, unsigned_last_nbits.
    eapply circular_area_unsigned_nonfull_mod_length__data_length_query;
      eauto.
Qed.

Lemma proof_of_CircularAreaGetDataLength_return_wit_2_state_spec : CircularAreaGetDataLength_return_wit_2_state_spec.
Proof.
  pre_process.
  split_pure_spatial.
  - unfold store_circular_area.
    Exists data_buffer operations readidx writeidx b_status physical.
    entailer!.
  - dump_pre_spatial.
    unfold CircularAreaDataLengthResult.
    lia.
Qed.

Lemma proof_of_CircularAreaGetDataLength_return_wit_3_null_spec : CircularAreaGetDataLength_return_wit_3_null_spec.
Proof.
  pre_process.
Qed.
