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
From SimpleC.EE.OUTPUT.xizi.xizi_circular_area_read.source Require Import xizi_circular_area_read_goal.
From SimpleC.EE.OUTPUT.xizi.xizi_circular_area_read.source Require Import xizi_circular_area_read_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
From SimpleC.EE.OUTPUT.xizi.xizi_circular_area_read.source Require Import xizi_circular_area_read_lib.
Local Open Scope sac.

Lemma proof_of_CircularAreaIsFull_entail_wit_1 : CircularAreaIsFull_entail_wit_1.
Proof.
  pre_process.
  unfold store_circular_area.
  Intros data_buffer operations readidx writeidx b_status physical.
  Exists operations readidx writeidx b_status physical data_buffer.
  entailer!.
Qed.

Lemma proof_of_CircularAreaIsFull_return_wit_1 : CircularAreaIsFull_return_wit_1.
Proof.
  pre_process.
  assert (Hresult : CircularAreaStateFullResult state 0).
  { unfold CircularAreaStateFullResult.
    eapply CircularArea_full_read_ne__query_state_results; eauto. }
  split_pure_spatial.
  - unfold store_circular_area.
    Exists data_buffer operations readidx writeidx b_status physical.
    entailer!.
  - dump_pre_spatial.
    exact Hresult.
Qed.

Lemma proof_of_CircularAreaIsFull_return_wit_2 : CircularAreaIsFull_return_wit_2.
Proof.
  pre_process.
  assert (Hresult : CircularAreaStateFullResult state 0).
  { unfold CircularAreaStateFullResult.
    eapply CircularArea_full_status_zero__query_state_results; eauto. }
  split_pure_spatial.
  - unfold store_circular_area.
    Exists data_buffer operations readidx writeidx b_status physical.
    entailer!.
  - dump_pre_spatial.
    exact Hresult.
Qed.

Lemma proof_of_CircularAreaIsFull_return_wit_3 : CircularAreaIsFull_return_wit_3.
Proof.
  pre_process.
  assert (Hresult : CircularAreaStateFullResult state 1).
  { unfold CircularAreaStateFullResult.
    eapply CircularArea_full_status_nonzero__query_state_results; eauto. }
  split_pure_spatial.
  - unfold store_circular_area.
    Exists data_buffer operations readidx writeidx b_status physical.
    entailer!.
  - dump_pre_spatial.
    exact Hresult.
Qed.

Lemma proof_of_CircularAreaIsEmpty_entail_wit_1 : CircularAreaIsEmpty_entail_wit_1.
Proof.
  pre_process.
  unfold store_circular_area.
  Intros data_buffer operations readidx writeidx b_status physical.
  Exists operations readidx writeidx b_status physical data_buffer.
  entailer!.
Qed.

Lemma proof_of_CircularAreaIsEmpty_return_wit_1 : CircularAreaIsEmpty_return_wit_1.
Proof.
  pre_process.
  assert (Hresult : CircularAreaStateEmptyResult state 0).
  { unfold CircularAreaStateEmptyResult.
    eapply CircularArea_empty_read_ne__query_state_results; eauto. }
  split_pure_spatial.
  - unfold store_circular_area.
    Exists data_buffer operations readidx writeidx b_status physical.
    entailer!.
  - dump_pre_spatial.
    exact Hresult.
Qed.

Lemma proof_of_CircularAreaIsEmpty_return_wit_2 : CircularAreaIsEmpty_return_wit_2.
Proof.
  pre_process.
  assert (Hresult : CircularAreaStateEmptyResult state 0).
  { unfold CircularAreaStateEmptyResult.
    eapply CircularArea_empty_status_nonzero__query_state_results; eauto. }
  split_pure_spatial.
  - unfold store_circular_area.
    Exists data_buffer operations readidx writeidx b_status physical.
    entailer!.
  - dump_pre_spatial.
    exact Hresult.
Qed.

Lemma proof_of_CircularAreaIsEmpty_return_wit_3 : CircularAreaIsEmpty_return_wit_3.
Proof.
  pre_process.
  assert (Hresult : CircularAreaStateEmptyResult state 1).
  { unfold CircularAreaStateEmptyResult.
    eapply CircularArea_empty_status_zero_equal__query_state_results; eauto. }
  split_pure_spatial.
  - unfold store_circular_area.
    Exists data_buffer operations readidx writeidx b_status physical.
    entailer!.
  - dump_pre_spatial.
    exact Hresult.
Qed.

Lemma proof_of_CircularAreaGetDataLength_safety_wit_4 : CircularAreaGetDataLength_safety_wit_4.
Proof.
  pre_process.
  unfold CircularAreaLogicalState in PreH4.
  entailer!.
Qed.

Lemma proof_of_CircularAreaGetDataLength_safety_wit_5 : CircularAreaGetDataLength_safety_wit_5.
Proof.
  pre_process.
  unfold CircularAreaLogicalState in PreH4.
  entailer!.
Qed.

Lemma proof_of_CircularAreaGetDataLength_entail_wit_1 : CircularAreaGetDataLength_entail_wit_1.
Proof.
  pre_process.
  unfold store_circular_area.
  Intros data_buffer operations readidx writeidx b_status physical.
  Exists operations readidx writeidx b_status physical data_buffer.
  unfold CircularAreaStateFullResult in PreH1.
  destruct (Z.eq_dec (Zlength (ca_contents state)) (ca_capacity state));
    entailer!.
Qed.

Lemma proof_of_CircularAreaGetDataLength_entail_wit_2 : CircularAreaGetDataLength_entail_wit_2.
Proof.
  pre_process.
  unfold store_circular_area.
  Intros data_buffer operations readidx writeidx b_status physical.
  Exists operations readidx writeidx b_status physical data_buffer.
  unfold CircularAreaStateFullResult in PreH1.
  destruct (Z.eq_dec (Zlength (ca_contents state)) (ca_capacity state))
    as [Heq | Hneq].
  - entailer!.
  - entailer!.
    unfold CircularAreaLogicalState in H.
    intuition lia.
Qed.

Lemma proof_of_CircularAreaGetDataLength_return_wit_1 : CircularAreaGetDataLength_return_wit_1.
Proof.
  pre_process.
  split_pure_spatial.
  - unfold store_circular_area.
    Exists data_buffer operations readidx writeidx b_status physical.
    entailer!.
  - dump_pre_spatial.
    unfold CircularAreaStateDataLengthResult.
    unfold CircularAreaLogicalState in PreH4.
    destruct PreH4 as
      (Harea & Hread & Hwriteidx & Hlength & Hphysical & Hbytes &
       Hwrite & Hstatus & Hfull & Hempty & Hlive).
    unfold unsigned_last_nbits.
    rewrite (CircularArea_unsigned_ring_sum__length_and_divide_results
      readidx writeidx (ca_capacity state)) by assumption.
    apply CircularArea_data_length_mod__length_and_divide_results.
    + exact Harea.
    + exact Hread.
    + exact Hwriteidx.
    + lia.
    + exact Hwrite.
Qed.

Lemma proof_of_CircularAreaGetDataLength_return_wit_2 : CircularAreaGetDataLength_return_wit_2.
Proof.
  pre_process.
  split_pure_spatial.
  - unfold store_circular_area.
    Exists data_buffer operations readidx writeidx b_status physical.
    entailer!.
  - dump_pre_spatial.
    unfold CircularAreaStateDataLengthResult.
    symmetry; exact PreH3.
Qed.

Lemma proof_of_CircularAreaGetDataLength_return_wit_3 : CircularAreaGetDataLength_return_wit_3.
Proof.
  pre_process.
  unfold store_circular_area.
  Intros data_buffer operations readidx writeidx b_status physical.
  entailer!.
Qed.

Lemma proof_of_CircularAreaDivideRdData_entail_wit_1 : CircularAreaDivideRdData_entail_wit_1.
Proof.
  pre_process.
  subst data_length_pre.
  unfold store_circular_area.
  Intros data_buffer operations readidx writeidx b_status physical.
  Exists operations writeidx b_status physical readidx data_buffer.
  unfold CircularAreaLogicalState in *.
  entailer!.
Qed.

Lemma proof_of_CircularAreaDivideRdData_return_wit_1 : CircularAreaDivideRdData_return_wit_1.
Proof.
  pre_process.
  Exists operations_2 writeidx_2 b_status_2 physical_2 readidx_2 data_buffer_2.
  split_pure_spatial.
  - entailer!.
  - split_pures.
    + dump_pre_spatial.
      exact PreH3.
    + dump_pre_spatial.
      exact PreH4.
    + dump_pre_spatial.
      unfold CircularAreaStateDivideRdDataResult, CircularAreaValid.
      unfold CircularAreaLogicalState in PreH8.
      intuition.
    + dump_pre_spatial.
      unfold CircularAreaDivideRdDataResult.
      unfold CircularAreaLogicalState in PreH8.
      unfold unsigned_last_nbits in PreH1.
      assert (Hinner : readidx_2 mod (2 ^ 32) = readidx_2).
      { apply Z.mod_small; lia. }
      rewrite Hinner in PreH1.
      rewrite Z.mod_small in PreH1 by lia.
      right; lia.
    + dump_pre_spatial.
      exact PreH8.
Qed.

Lemma proof_of_CircularAreaDivideRdData_return_wit_2 : CircularAreaDivideRdData_return_wit_2.
Proof.
  pre_process.
  Exists operations_2 writeidx_2 b_status_2 physical_2 readidx_2 data_buffer_2.
  split_pure_spatial.
  - entailer!.
  - split_pures.
    + dump_pre_spatial.
      exact PreH3.
    + dump_pre_spatial.
      exact PreH4.
    + dump_pre_spatial.
      unfold CircularAreaStateDivideRdDataResult, CircularAreaValid.
      unfold CircularAreaLogicalState in PreH8.
      intuition.
    + dump_pre_spatial.
      unfold CircularAreaDivideRdDataResult.
      unfold CircularAreaLogicalState in PreH8.
      unfold unsigned_last_nbits in PreH1.
      assert (Hinner : readidx_2 mod (2 ^ 32) = readidx_2).
      { apply Z.mod_small; lia. }
      rewrite Hinner in PreH1.
      rewrite Z.mod_small in PreH1 by lia.
      left; lia.
    + dump_pre_spatial.
      exact PreH8.
Qed.

Lemma proof_of_CircularAreaRead_entail_wit_2 : CircularAreaRead_entail_wit_2.
Proof.
  pre_process.
  subst.
  entailer!.
  unfold CircularAreaStateEmptyResult in *.
  destruct (ca_contents state); simpl in *; congruence.
Qed.

Lemma proof_of_CircularAreaRead_entail_wit_3_1 : CircularAreaRead_entail_wit_3_1.
Proof.
  pre_process.
  subst.
  Exists operations_2 writeidx_2 b_status_2 physical_2 readidx_2
    (ca_contents state) (ca_capacity state) data_buffer_2.
  entailer!.
  all: unfold CircularAreaStateDivideRdDataResult,
    CircularAreaDivideRdDataResult,
    CircularAreaStateDataLengthResult,
    CircularAreaStateEmptyResult,
    CircularAreaActualReadLength in *.
  all: destruct (ca_contents state); simpl in *; intuition; try (psatzl Z).
  rewrite Zlength_cons in PreH6.
  pose proof (Zlength_nonneg l).
  psatzl Z.
Qed.

Lemma proof_of_CircularAreaRead_entail_wit_3_2 : CircularAreaRead_entail_wit_3_2.
Proof.
  pre_process.
  subst.
  Exists operations_2 writeidx_2 b_status_2 physical_2 readidx_2
    (ca_contents state) (ca_capacity state) data_buffer_2.
  entailer!.
  all: unfold CircularAreaStateDivideRdDataResult,
    CircularAreaDivideRdDataResult,
    CircularAreaStateDataLengthResult,
    CircularAreaStateEmptyResult,
    CircularAreaActualReadLength in *.
  all: destruct (ca_contents state); simpl in *; intuition; try (psatzl Z).
Qed.

Lemma proof_of_CircularAreaRead_entail_wit_4 : CircularAreaRead_entail_wit_4.
Proof.
  pre_process.
  subst.
  pose proof PreH12 as Hstate.
  pose proof PreH11 as Hdivide.
  destruct PreH12 as
    (Harea & Hread & Hwrite & Hlogical & Hphysical & Hbytes & Hwriteidx &
     Hstatus & Hfull & Hempty & Hlive).
  destruct Harea as [Harea_pos Harea_max].
  destruct Hread as [Hread_nonneg Hread_lt].
  unfold CircularAreaDivideRdDataResult in PreH11.
  destruct PreH11 as [[Hfit Hresult] | [Hwrap Hresult]].
  - discriminate.
  - assert (Hdata_le_logical : data_length <= Zlength (ca_contents state)).
    { unfold CircularAreaActualReadLength in PreH8.
      rewrite PreH8.
      apply Z.le_min_r. }
    assert (Hdata_le_area : data_length <= ca_capacity state) by (psatzl Z).
    assert (Hread_u : unsigned_last_nbits readidx 32 = readidx).
    { apply unsigned_last_nbits_eq. simpl. psatzl Z. }
    assert (Hup_u :
        unsigned_last_nbits
          (ca_capacity state - unsigned_last_nbits readidx 32) 32 =
        ca_capacity state - readidx).
    { rewrite Hread_u.
      apply unsigned_last_nbits_eq. simpl. psatzl Z. }
    assert (Hdown_u :
        unsigned_last_nbits
          (data_length - unsigned_last_nbits
            (ca_capacity state - unsigned_last_nbits readidx 32) 32) 32 =
        data_length - unsigned_last_nbits
          (ca_capacity state - unsigned_last_nbits readidx 32) 32).
    { rewrite Hup_u.
      apply unsigned_last_nbits_eq. simpl. psatzl Z. }
    assert (Hslice :
        CircularAreaInitializedSlice physical_2 readidx (ca_capacity state)
          (sublist 0 (ca_capacity state - readidx) (ca_contents state))).
    { pose proof
        (CircularAreaInitializedSlice_nonwrap__read_copy_slices
          physical_2 (ca_contents state) readidx (ca_capacity state)
          (ca_capacity state - readidx)
          Harea_pos Hread_nonneg ltac:(psatzl Z) ltac:(psatzl Z)
          Hphysical Hlive) as Hslice0.
      replace (readidx + (ca_capacity state - readidx)) with
        (ca_capacity state) in Hslice0 by ring.
      exact Hslice0. }
  Exists operations_2 writeidx_2 b_status_2 physical_2 readidx
    (ca_contents state) (ca_capacity state) data_buffer_2.
  entailer!.
  + rewrite Hup_u.
    sep_apply_l_atomic
      (UCharArray.mixed_full_split_to_mixed_seg
        data_buffer_2 readidx (ca_capacity state) physical_2
        ltac:(psatzl Z)).
    unfold CircularAreaInitializedSlice in Hslice.
    unfold CircularAreaSomeBytes.
    rewrite Hslice.
    sep_apply_l_atomic
      (UCharArray.mixed_full_split_to_mixed_seg
        out0 (ca_capacity state - readidx) output_capacity output_before
        ltac:(psatzl Z)).
    sep_apply_l_atomic
      (UCharArray.mixed_seg_to_mixed_full
        out0 0 (ca_capacity state - readidx)
        (sublist 0 (ca_capacity state - readidx) output_before)).
    replace (out0 + 0 * sizeof(UCHAR)) with out0 by ring.
    replace (ca_capacity state - readidx - 0) with
      (ca_capacity state - readidx) by ring.
    entailer!.
  + rewrite Hup_u. exact Hslice.
Qed.

Lemma proof_of_CircularAreaRead_entail_wit_5 : CircularAreaRead_entail_wit_5.
Proof.
  pre_process.
  subst retval area_length_2 logical_2.
  pose proof PreH18 as Hstate.
  destruct PreH18 as
    (Harea & Hread & Hwrite & Hlogical & Hphysical & Hbytes & Hwriteidx &
     Hstatus & Hfull & Hempty & Hlive).
  destruct Harea as [Harea_pos Harea_max].
  destruct Hread as [Hread_nonneg Hread_lt].
  assert (Hdata_le_logical : data_length <= Zlength (ca_contents state)).
  { unfold CircularAreaActualReadLength in PreH9.
    rewrite PreH9.
    apply Z.le_min_r. }
  assert (Hdata_le_area : data_length <= ca_capacity state) by (psatzl Z).
  assert (Hdown_nonneg : 0 <= read_len_down) by (psatzl Z).
  assert (Hdown_le_read : read_len_down <= readidx_2) by (psatzl Z).
  assert (Hslice :
      CircularAreaInitializedSlice physical_2 0 read_len_down
        (sublist read_len_up data_length (ca_contents state))).
  { pose proof
      (CircularAreaInitializedSlice_wrap_head__read_copy_slices
        physical_2 (ca_contents state) readidx_2 (ca_capacity state)
        read_len_up read_len_down Harea_pos ltac:(psatzl Z) PreH14
        ltac:(psatzl Z) ltac:(psatzl Z) ltac:(psatzl Z) Hphysical Hlive)
      as Hslice0.
    replace (read_len_up + read_len_down) with data_length in Hslice0
      by (psatzl Z).
    exact Hslice0. }
  Exists operations_2 writeidx_2 b_status_2 physical_2 readidx_2
    (ca_contents state) (ca_capacity state) data_buffer_2.
  entailer!.
  - unfold CircularAreaInitializedSlice in PreH20, Hslice.
    unfold CircularAreaSomeBytes.
    rewrite <- PreH20.
    sep_apply_l_atomic
      (UCharArray.mixed_seg_split_to_mixed_seg
        data_buffer_2 0 read_len_down readidx_2
        (sublist 0 readidx_2 physical_2) ltac:(psatzl Z)).
    repeat rewrite Zsublist_Zsublist by (try rewrite Hphysical; psatzl Z).
    replace (0 + 0) with 0 by ring.
    replace (read_len_down - 0 + 0) with read_len_down by ring.
    replace (readidx_2 - 0 + 0) with readidx_2 by ring.
    rewrite Hslice.
    sep_apply_l_atomic
      (UCharArray.mixed_full_to_mixed_seg out0 read_len_up
        (sublist readidx_2 (ca_capacity state) physical_2)).
    sep_apply_l_atomic
      (UCharArray.mixed_seg_split_to_mixed_seg
        out0 read_len_up data_length output_capacity
        (sublist read_len_up output_capacity output_before)
        ltac:(psatzl Z)).
    repeat rewrite Zsublist_Zsublist by (try rewrite Hphysical; psatzl Z).
    replace (0 + read_len_up) with read_len_up by ring.
    replace (data_length - read_len_up + read_len_up) with data_length by ring.
    replace (output_capacity - read_len_up + read_len_up) with
      output_capacity by ring.
    sep_apply_l_atomic
      (UCharArray.mixed_seg_to_mixed_full out0 read_len_up data_length
        (sublist read_len_up data_length output_before)).
    replace (data_length - read_len_up) with read_len_down by (psatzl Z).
    entailer!.
Qed.

Lemma proof_of_CircularAreaRead_entail_wit_6_1 : CircularAreaRead_entail_wit_6_1.
Proof.
  pre_process.
  subst.
  pose proof PreH5 as Hstate.
  pose proof PreH4 as Hdivide.
  destruct PreH5 as
    (Harea & Hread & Hwrite & Hlogical & Hphysical & Hbytes & Hwriteidx &
     Hstatus & Hfull & Hempty & Hlive).
  destruct Harea as [Harea_pos Harea_max].
  destruct Hread as [Hread_nonneg Hread_lt].
  unfold CircularAreaDivideRdDataResult in PreH4.
  destruct PreH4 as [[Hfit Hresult] | [Hwrap Hresult]].
  - assert (Hdata_le_logical : retval <= Zlength (ca_contents state)).
    { unfold CircularAreaStateDataLengthResult in PreH6.
      psatzl Z. }
    assert (Hretval_pos : 0 < retval).
    { pose proof
        (CircularArea_empty_result_zero_length_pos__read_call_normalization
          (ca_contents state) 0 PreH9 eq_refl) as Hlenpos.
      unfold CircularAreaStateDataLengthResult in PreH6.
      psatzl Z. }
    assert (Hretval_le_output : retval <= output_capacity).
    { unfold CircularAreaStateDataLengthResult in PreH6, PreH8.
      psatzl Z. }
    assert (Hactual :
        CircularAreaActualReadLength (ca_contents state) requested retval).
    { unfold CircularAreaActualReadLength.
      unfold CircularAreaStateDataLengthResult in PreH6, PreH8.
      rewrite Z.min_r by (psatzl Z).
      exact PreH6. }
    assert (Hslice :
        CircularAreaInitializedSlice physical_2 readidx_2
          (readidx_2 + retval) (sublist 0 retval (ca_contents state))).
    { exact
        (CircularAreaInitializedSlice_nonwrap__read_copy_slices
          physical_2 (ca_contents state) readidx_2 (ca_capacity state) retval
          Harea_pos Hread_nonneg Hfit
          (conj (Z.lt_le_incl _ _ Hretval_pos) Hdata_le_logical)
          Hphysical Hlive). }
  Exists operations_2 writeidx_2 b_status_2 physical_2 readidx_2
    (ca_contents state) (ca_capacity state) data_buffer_2.
  entailer!.
  + sep_apply_l_atomic
      (UCharArray.mixed_full_split_to_mixed_seg data_buffer_2 readidx_2
        (ca_capacity state) physical_2 ltac:(psatzl Z)).
    sep_apply_l_atomic
      (UCharArray.mixed_seg_split_to_mixed_seg data_buffer_2 readidx_2
        (readidx_2 + retval) (ca_capacity state)
        (sublist readidx_2 (ca_capacity state) physical_2)
        ltac:(psatzl Z)).
    repeat rewrite Zsublist_Zsublist by (try rewrite Hphysical; psatzl Z).
    replace (0 + readidx_2) with readidx_2 by ring.
    replace (readidx_2 + retval - readidx_2 + readidx_2) with
      (readidx_2 + retval) by ring.
    replace (ca_capacity state - readidx_2 + readidx_2) with
      (ca_capacity state) by ring.
    unfold CircularAreaInitializedSlice in Hslice.
    unfold CircularAreaSomeBytes.
    rewrite Hslice.
    sep_apply_l_atomic
      (UCharArray.mixed_full_split_to_mixed_seg out0 retval output_capacity
        output_before
        (conj (Z.lt_le_incl _ _ Hretval_pos) Hretval_le_output)).
    sep_apply_l_atomic
      (UCharArray.mixed_seg_to_mixed_full out0 0 retval
        (sublist 0 retval output_before)).
    replace (out0 + 0 * sizeof(UCHAR)) with out0 by ring.
    replace (retval - 0) with retval by ring.
    entailer!.
  - discriminate.
Qed.

Lemma proof_of_CircularAreaRead_entail_wit_6_2 : CircularAreaRead_entail_wit_6_2.
Proof.
  pre_process.
  subst.
  pose proof PreH5 as Hstate.
  pose proof PreH4 as Hdivide.
  destruct PreH5 as
    (Harea & Hread & Hwrite & Hlogical & Hphysical & Hbytes & Hwriteidx &
     Hstatus & Hfull & Hempty & Hlive).
  destruct Harea as [Harea_pos Harea_max].
  destruct Hread as [Hread_nonneg Hread_lt].
  unfold CircularAreaDivideRdDataResult in PreH4.
  destruct PreH4 as [[Hfit Hresult] | [Hwrap Hresult]].
  - assert (Hrequested_nonneg : 0 <= requested) by (psatzl Z).
    assert (Hrequested_le_logical :
        requested <= Zlength (ca_contents state)).
    { unfold CircularAreaStateDataLengthResult in PreH7.
      psatzl Z. }
    assert (Hactual :
        CircularAreaActualReadLength (ca_contents state) requested requested).
    { unfold CircularAreaActualReadLength.
      rewrite Z.min_l by exact Hrequested_le_logical.
      reflexivity. }
    assert (Hslice :
        CircularAreaInitializedSlice physical_2 readidx_2
          (readidx_2 + requested)
          (sublist 0 requested (ca_contents state))).
    { exact
        (CircularAreaInitializedSlice_nonwrap__read_copy_slices
          physical_2 (ca_contents state) readidx_2 (ca_capacity state)
          requested Harea_pos Hread_nonneg Hfit
          (conj Hrequested_nonneg Hrequested_le_logical)
          Hphysical Hlive). }
  Exists operations_2 writeidx_2 b_status_2 physical_2 readidx_2
    (ca_contents state) (ca_capacity state) data_buffer_2.
  entailer!.
  + sep_apply_l_atomic
      (UCharArray.mixed_full_split_to_mixed_seg data_buffer_2 readidx_2
        (ca_capacity state) physical_2 ltac:(psatzl Z)).
    sep_apply_l_atomic
      (UCharArray.mixed_seg_split_to_mixed_seg data_buffer_2 readidx_2
        (readidx_2 + requested) (ca_capacity state)
        (sublist readidx_2 (ca_capacity state) physical_2)
        ltac:(psatzl Z)).
    repeat rewrite Zsublist_Zsublist by (try rewrite Hphysical; psatzl Z).
    replace (0 + readidx_2) with readidx_2 by ring.
    replace (readidx_2 + requested - readidx_2 + readidx_2) with
      (readidx_2 + requested) by ring.
    replace (ca_capacity state - readidx_2 + readidx_2) with
      (ca_capacity state) by ring.
    unfold CircularAreaInitializedSlice in Hslice.
    unfold CircularAreaSomeBytes.
    rewrite Hslice.
    sep_apply_l_atomic
      (UCharArray.mixed_full_split_to_mixed_seg out0 requested output_capacity
        output_before (conj Hrequested_nonneg PreH21)).
    sep_apply_l_atomic
      (UCharArray.mixed_seg_to_mixed_full out0 0 requested
        (sublist 0 requested output_before)).
    replace (out0 + 0 * sizeof(UCHAR)) with out0 by ring.
    replace (requested - 0) with requested by ring.
    entailer!.
  - discriminate.
Qed.

Lemma proof_of_CircularAreaRead_return_wit_1 : CircularAreaRead_return_wit_1.
Proof.
  aggressive_pre_process.
  pose proof
    (CircularArea_consume_logical_state__read_postconditions
      readidx writeidx area_length b_status requested data_length logical
      physical PreH21 PreH13 PreH14) as Hstate_after.
  Exists
    (Build_circular_area_state area_length
      (sublist data_length (Zlength logical) logical))
    (CircularAreaSomeBytes (sublist 0 data_length logical) ++
      sublist data_length output_capacity output_before).
  split_pure_spatial.
  - assert (Harea : 0 < area_length <= 256).
    { unfold CircularAreaLogicalState in PreH21. tauto. }
    assert (Hread : 0 <= readidx < area_length).
    { unfold CircularAreaLogicalState in PreH21. tauto. }
    assert (Hphyslen : Zlength physical = area_length).
    { unfold CircularAreaLogicalState in PreH21. tauto. }
    assert (Hphysical_reassemble :
      CircularAreaSomeBytes (sublist read_len_up data_length logical) ++
        sublist read_len_down readidx physical ++
        sublist readidx area_length physical = physical).
    { unfold CircularAreaInitializedSlice in PreH23.
      unfold CircularAreaSomeBytes.
      rewrite <- PreH23.
      transitivity (sublist 0 area_length physical).
      2: { apply sublist_self. symmetry. exact Hphyslen. }
      rewrite (sublist_split 0 area_length read_len_down physical) by lia.
      rewrite (sublist_split read_len_down area_length readidx physical) by lia.
      rewrite app_assoc. reflexivity. }
    assert (Hphysical_reassemble_left :
      (CircularAreaSomeBytes (sublist read_len_up data_length logical) ++
        sublist read_len_down readidx physical) ++
        sublist readidx area_length physical = physical).
    { rewrite <- app_assoc. exact Hphysical_reassemble. }
    assert (Hcast : unsigned_last_nbits read_len_down 8 =
      (readidx + data_length) mod area_length).
    { unfold unsigned_last_nbits.
      replace (2 ^ 8) with 256 by reflexivity.
      rewrite Z.mod_small by lia.
      assert (Hsum : readidx + data_length =
        area_length + read_len_down) by lia.
      rewrite Hsum, Z.add_mod by lia.
      rewrite Z.mod_same by lia. simpl.
      rewrite Z.mod_mod by lia.
      rewrite Z.mod_small by lia. reflexivity. }
    unfold store_circular_area.
    Exists data_buffer operations
      ((readidx + data_length) mod area_length) writeidx 0 physical.
    split_pure_spatial.
    + rewrite <- PreH11.
      sep_apply_l_atomic
        (UCharArray.mixed_full_to_mixed_seg
          (out0 + read_len_up * sizeof(UCHAR)) read_len_down
          (CircularAreaSomeBytes
            (sublist read_len_up data_length logical))).
      rewrite <- UCharArray.mixed_seg_shift.
      replace (read_len_up + 0) with read_len_up by lia.
      replace (read_len_up + read_len_down) with data_length by lia.
      sep_apply_l_atomic
        (UCharArray.mixed_seg_merge_to_mixed_seg out0 0 read_len_up
          data_length
          (CircularAreaSomeBytes (sublist 0 read_len_up logical))
          (CircularAreaSomeBytes
            (sublist read_len_up data_length logical))
          ltac:(lia)).
      sep_apply_l_atomic
        (UCharArray.mixed_seg_merge_to_mixed_full out0 0 data_length
          output_capacity
          (CircularAreaSomeBytes (sublist 0 read_len_up logical) ++
            CircularAreaSomeBytes
              (sublist read_len_up data_length logical))
          (sublist data_length output_capacity output_before)
          ltac:(lia)).
      sep_apply_l_atomic
        (UCharArray.mixed_seg_merge_to_mixed_seg data_buffer 0
          read_len_down readidx
          (CircularAreaSomeBytes
            (sublist read_len_up data_length logical))
          (sublist read_len_down readidx physical)
          ltac:(lia)).
      sep_apply_l_atomic
        (UCharArray.mixed_seg_merge_to_mixed_full data_buffer 0 readidx
          area_length
          (CircularAreaSomeBytes
              (sublist read_len_up data_length logical) ++
            sublist read_len_down readidx physical)
          (sublist readidx area_length physical)
          ltac:(lia)).
      assert (Hdata_logical : data_length <= Zlength logical).
      { unfold CircularAreaActualReadLength in PreH13.
        rewrite PreH13. apply Z.le_min_r. }
      assert (Hlogical_prefix :
        CircularAreaSomeBytes (sublist 0 read_len_up logical) ++
          CircularAreaSomeBytes
            (sublist read_len_up data_length logical) =
        CircularAreaSomeBytes (sublist 0 data_length logical)).
      { unfold CircularAreaSomeBytes.
        rewrite <- map_app.
        f_equal.
        symmetry. apply sublist_split; lia. }
      rewrite Hlogical_prefix, Hphysical_reassemble_left.
      cbn.
      replace (output_capacity - 0) with output_capacity by lia.
      replace (area_length - 0) with area_length by lia.
      cancel.
      rewrite Hcast.
      replace (data_buffer + 0) with data_buffer by lia.
      replace (out0 + 0) with out0 by lia.
      cancel.
    + entailer!.
  - entailer!.
    unfold CircularAreaReadResult.
    right.
    assert (Hnonempty : ca_contents state <> nil).
    { intro Hnil.
      unfold CircularAreaStateEmptyResult in PreH12.
      rewrite Hnil in PreH12. simpl in PreH12. lia. }
    assert (Hlogical_nonempty : logical <> nil).
    { rewrite PreH11. exact Hnonempty. }
    unfold CircularAreaActualReadLength in PreH13.
    rewrite <- PreH10, <- PreH11.
    rewrite <- PreH13.
    repeat split; auto.
Qed.

Lemma proof_of_CircularAreaRead_return_wit_2 : CircularAreaRead_return_wit_2.
Proof.
  aggressive_pre_process.
  pose proof
    (CircularArea_consume_logical_state__read_postconditions
      readidx writeidx area_length b_status requested data_length logical
      physical PreH19 PreH13 PreH14) as Hstate_after.
  Exists
    (Build_circular_area_state area_length
      (sublist data_length (Zlength logical) logical))
    (CircularAreaSomeBytes (sublist 0 data_length logical) ++
      sublist data_length output_capacity output_before).
  split_pure_spatial.
  - assert (Harea : 0 < area_length <= 256).
    { unfold CircularAreaLogicalState in PreH19. tauto. }
    assert (Hphyslen : Zlength physical = area_length).
    { unfold CircularAreaLogicalState in PreH19. tauto. }
    assert (Hphysical_reassemble :
      sublist 0 readidx physical ++
        CircularAreaSomeBytes (sublist 0 data_length logical) ++
        sublist (readidx + data_length) area_length physical = physical).
    { unfold CircularAreaInitializedSlice in PreH21.
      unfold CircularAreaSomeBytes.
      rewrite <- PreH21.
      apply CircularArea_physical_split_three__read_post_and_memcpy_lengths;
        lia. }
    assert (Hnewread :
      0 <= (readidx + data_length) mod area_length < 256).
    { pose proof (Z.mod_pos_bound (readidx + data_length) area_length).
      lia. }
    assert (Hcast :
      unsigned_last_nbits ((readidx + data_length) mod area_length) 8 =
      (readidx + data_length) mod area_length).
    { unfold unsigned_last_nbits.
      replace (2 ^ 8) with 256 by reflexivity.
      apply Z.mod_small. exact Hnewread. }
    assert (Hphysical_reassemble_left :
      (sublist 0 readidx physical ++
        CircularAreaSomeBytes (sublist 0 data_length logical)) ++
        sublist (readidx + data_length) area_length physical = physical).
    { rewrite <- app_assoc. exact Hphysical_reassemble. }
    unfold store_circular_area.
    Exists data_buffer operations
      ((readidx + data_length) mod area_length) writeidx 0 physical.
    split_pure_spatial.
    + rewrite <- PreH11.
      sep_apply_l_atomic
        (UCharArray.mixed_full_to_mixed_seg out0 data_length
          (CircularAreaSomeBytes (sublist 0 data_length logical))).
      sep_apply_l_atomic
        (UCharArray.mixed_seg_merge_to_mixed_full out0 0 data_length
          output_capacity
          (CircularAreaSomeBytes (sublist 0 data_length logical))
          (sublist data_length output_capacity output_before)
          ltac:(lia)).
      sep_apply_l_atomic
        (UCharArray.mixed_seg_merge_to_mixed_seg data_buffer 0 readidx
          (readidx + data_length) (sublist 0 readidx physical)
          (CircularAreaSomeBytes (sublist 0 data_length logical))
          ltac:(lia)).
      sep_apply_l_atomic
        (UCharArray.mixed_seg_merge_to_mixed_full data_buffer 0
          (readidx + data_length) area_length
          (sublist 0 readidx physical ++
            CircularAreaSomeBytes (sublist 0 data_length logical))
          (sublist (readidx + data_length) area_length physical)
          ltac:(lia)).
      rewrite Hphysical_reassemble_left.
      cbn.
      replace (output_capacity - 0) with output_capacity by lia.
      replace (out0 + 0 * sizeof(UCHAR)) with out0 by lia.
      replace (area_length - 0) with area_length by lia.
      replace (data_buffer + 0 * sizeof(UCHAR)) with data_buffer by lia.
      cancel.
      assert (Hremmod :
        Z.rem (readidx + data_length) area_length =
        (readidx + data_length) mod area_length).
      { destruct (Z.eq_dec (readidx + data_length) area_length) as [Heq | Hne].
        - rewrite Heq, Z.rem_same, Z.mod_same by lia. reflexivity.
        - rewrite Z.rem_small, Z.mod_small by lia. reflexivity. }
      rewrite Hremmod.
      rewrite Hcast.
      replace (data_buffer + 0) with data_buffer by lia.
      replace (out0 + 0) with out0 by lia.
      cancel.
    + entailer!.
  - entailer!.
    unfold CircularAreaReadResult.
    right.
    assert (Hnonempty : ca_contents state <> nil).
    { intro Hnil.
      unfold CircularAreaStateEmptyResult in PreH12.
      rewrite Hnil in PreH12. simpl in PreH12. lia. }
    assert (Hlogical_nonempty : logical <> nil).
    { rewrite PreH11. exact Hnonempty. }
    unfold CircularAreaActualReadLength in PreH13.
    rewrite <- PreH10, <- PreH11.
    rewrite <- PreH13.
    repeat split; auto.
Qed.

Lemma proof_of_CircularAreaRead_return_wit_3 : CircularAreaRead_return_wit_3.
Proof.
  aggressive_pre_process.
  unfold CircularAreaStateEmptyResult in PreH5.
  unfold CircularAreaReadResult.
  destruct (ca_contents state) eqn:Hcontents.
  - left. repeat split; auto.
  - simpl in PreH5. lia.
Qed.

Lemma proof_of_CircularAreaRead_return_wit_4 : CircularAreaRead_return_wit_4.
Proof.
  aggressive_pre_process.
  unfold CircularAreaReadResult.
  left.
  repeat split; auto; lia.
Qed.

Lemma proof_of_CircularAreaRead_return_wit_5 : CircularAreaRead_return_wit_5.
Proof.
  right.
  intros.
  unfold CircularAreaErrorResult.
  entailer!.
Qed.

Lemma proof_of_CircularAreaRead_return_wit_6 : CircularAreaRead_return_wit_6.
Proof.
  right.
  intros.
  unfold CircularAreaErrorResult.
  entailer!.
Qed.

Lemma proof_of_CircularAreaRead_partial_solve_wit_4_pure : CircularAreaRead_partial_solve_wit_4_pure.
Proof.
  aggressive_pre_process.
  unfold CircularAreaStateDataLengthResult in *.
  entailer!.
Qed.

Lemma proof_of_CircularAreaRead_partial_solve_wit_5_pure : CircularAreaRead_partial_solve_wit_5_pure.
Proof.
  aggressive_pre_process.
  unfold CircularAreaStateDataLengthResult in *.
  entailer!.
Qed.

Lemma proof_of_CircularAreaRead_partial_solve_wit_6_pure : CircularAreaRead_partial_solve_wit_6_pure.
Proof.
  aggressive_pre_process.
  split_pures.
  - prop_apply_p (UCharArray.mixed_full_Zlength out0 read_len_up
      (sublist 0 read_len_up output_before)).
    Intros_p Hout.
    dump_pre_spatial.
    rewrite <- PreH23.
    exact Hout.
  - dump_pre_spatial.
    pose proof
      (CircularArea_actual_read_length_le__read_post_and_memcpy_lengths
        logical requested data_length PreH18) as Hdata_le.
    rewrite Zlength_sublist; [lia | split; lia].
  - dump_pre_spatial.
    pose proof
      (CircularArea_actual_read_length_le__read_post_and_memcpy_lengths
        logical requested data_length PreH18) as Hdata_le.
    rewrite Zlength_sublist; [lia | split; lia].
  - prop_apply_p (UCharArray.mixed_full_Zlength out0 read_len_up
      (sublist 0 read_len_up output_before)).
    Intros_p Hout.
    dump_pre_spatial.
    rewrite <- PreH23.
    exact Hout.
Qed.

Lemma proof_of_CircularAreaRead_partial_solve_wit_7_pure : CircularAreaRead_partial_solve_wit_7_pure.
Proof.
  aggressive_pre_process.
  split_pures.
  - prop_apply_p (UCharArray.mixed_full_Zlength
      (out0 + read_len_up * sizeof(UCHAR)) read_len_down
      (sublist read_len_up data_length output_before)).
    Intros_p Hout.
    dump_pre_spatial.
    rewrite <- PreH23, <- PreH24.
    exact Hout.
  - dump_pre_spatial.
    pose proof
      (CircularArea_actual_read_length_le__read_post_and_memcpy_lengths
        logical requested data_length PreH18) as Hdata_le.
    rewrite Zlength_sublist; [lia | split; lia].
  - dump_pre_spatial.
    pose proof
      (CircularArea_actual_read_length_le__read_post_and_memcpy_lengths
        logical requested data_length PreH18) as Hdata_le.
    rewrite Zlength_sublist; [lia | split; lia].
  - prop_apply_p (UCharArray.mixed_full_Zlength
      (out0 + read_len_up * sizeof(UCHAR)) read_len_down
      (sublist read_len_up data_length output_before)).
    Intros_p Hout.
    dump_pre_spatial.
    rewrite <- PreH23, <- PreH24.
    exact Hout.
Qed.

Lemma proof_of_CircularAreaRead_partial_solve_wit_8_pure : CircularAreaRead_partial_solve_wit_8_pure.
Proof.
  aggressive_pre_process.
  split_pures.
  - prop_apply_p (UCharArray.mixed_full_Zlength out0 data_length
      (sublist 0 data_length output_before)).
    Intros_p Hout.
    dump_pre_spatial.
    exact Hout.
  - dump_pre_spatial.
    pose proof
      (CircularArea_actual_read_length_le__read_post_and_memcpy_lengths
        logical requested data_length PreH14) as Hdata_le.
    rewrite Zlength_sublist; [lia | split; lia].
  - dump_pre_spatial.
    pose proof
      (CircularArea_actual_read_length_le__read_post_and_memcpy_lengths
        logical requested data_length PreH14) as Hdata_le.
    rewrite Zlength_sublist; [lia | split; lia].
Qed.
