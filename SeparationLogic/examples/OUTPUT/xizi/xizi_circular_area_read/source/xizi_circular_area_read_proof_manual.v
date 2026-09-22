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
  split_pure_spatial.
  - unfold store_circular_area.
    Exists data_buffer operations readidx writeidx b_status physical.
    entailer!.
  - dump_pre_spatial.
    eapply CircularArea_full_read_ne__query_state_results; eauto.
Qed.

Lemma proof_of_CircularAreaIsFull_return_wit_2 : CircularAreaIsFull_return_wit_2.
Proof.
  pre_process.
  split_pure_spatial.
  - unfold store_circular_area.
    Exists data_buffer operations readidx writeidx b_status physical.
    entailer!.
  - dump_pre_spatial.
    eapply CircularArea_full_status_zero__query_state_results; eauto.
Qed.

Lemma proof_of_CircularAreaIsFull_return_wit_3 : CircularAreaIsFull_return_wit_3.
Proof.
  pre_process.
  split_pure_spatial.
  - unfold store_circular_area.
    Exists data_buffer operations readidx writeidx b_status physical.
    entailer!.
  - dump_pre_spatial.
    eapply CircularArea_full_status_nonzero__query_state_results; eauto.
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
  split_pure_spatial.
  - unfold store_circular_area.
    Exists data_buffer operations readidx writeidx b_status physical.
    entailer!.
  - dump_pre_spatial.
    eapply CircularArea_empty_read_ne__query_state_results; eauto.
Qed.

Lemma proof_of_CircularAreaIsEmpty_return_wit_2 : CircularAreaIsEmpty_return_wit_2.
Proof.
  pre_process.
  split_pure_spatial.
  - unfold store_circular_area.
    Exists data_buffer operations readidx writeidx b_status physical.
    entailer!.
  - dump_pre_spatial.
    eapply CircularArea_empty_status_nonzero__query_state_results; eauto.
Qed.

Lemma proof_of_CircularAreaIsEmpty_return_wit_3 : CircularAreaIsEmpty_return_wit_3.
Proof.
  pre_process.
  split_pure_spatial.
  - unfold store_circular_area.
    Exists data_buffer operations readidx writeidx b_status physical.
    entailer!.
  - dump_pre_spatial.
    eapply CircularArea_empty_status_zero_equal__query_state_results; eauto.
Qed.

Lemma proof_of_CircularAreaGetDataLength_safety_wit_4 : CircularAreaGetDataLength_safety_wit_4.
Proof.
  pre_process.
  dump_pre_spatial.
  unfold CircularAreaLogicalState in PreH4.
  lia.
Qed.

Lemma proof_of_CircularAreaGetDataLength_safety_wit_5 : CircularAreaGetDataLength_safety_wit_5.
Proof.
  pre_process.
  split_pures;
    dump_pre_spatial;
    unfold CircularAreaLogicalState in PreH4;
    lia.
Qed.

Lemma proof_of_CircularAreaGetDataLength_entail_wit_1 : CircularAreaGetDataLength_entail_wit_1.
Proof.
  pre_process.
  unfold store_circular_area.
  Intros data_buffer operations readidx writeidx b_status physical.
  Exists operations readidx writeidx b_status physical data_buffer.
  entailer!.
  unfold CircularAreaStateFullResult in PreH1.
  destruct (Z.eq_dec (Zlength (ca_contents state)) (ca_capacity state));
    congruence.
Qed.

Lemma proof_of_CircularAreaGetDataLength_entail_wit_2 : CircularAreaGetDataLength_entail_wit_2.
Proof.
  pre_process.
  unfold store_circular_area.
  Intros data_buffer operations readidx writeidx b_status physical.
  Exists operations readidx writeidx b_status physical data_buffer.
  entailer!.
  unfold CircularAreaStateFullResult in PreH1.
  destruct (Z.eq_dec (Zlength (ca_contents state)) (ca_capacity state));
    try congruence.
  unfold CircularAreaLogicalState in H.
  lia.
Qed.

Lemma proof_of_CircularAreaGetDataLength_return_wit_1 : CircularAreaGetDataLength_return_wit_1.
Proof.
  pre_process.
  pose proof PreH4 as Hstate.
  unfold CircularAreaLogicalState in Hstate.
  split_pure_spatial.
  - unfold store_circular_area.
    Exists data_buffer operations readidx writeidx b_status physical.
    entailer!.
  - dump_pre_spatial.
    unfold CircularAreaStateDataLengthResult.
    unfold unsigned_last_nbits.
    rewrite (CircularArea_unsigned_ring_sum__length_and_divide_results
      readidx writeidx (ca_capacity state)) by lia.
    apply (CircularArea_data_length_mod__length_and_divide_results
      readidx writeidx (ca_capacity state) (Zlength (ca_contents state)));
      lia.
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
    lia.
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
  unfold store_circular_area.
  Intros data_buffer operations readidx writeidx b_status physical.
  rename H into Hstore.
  Exists operations writeidx b_status physical readidx data_buffer.
  pose proof Hstore as Hstate.
  unfold CircularAreaLogicalState in Hstate.
  entailer!.
Qed.

Lemma proof_of_CircularAreaDivideRdData_return_wit_1 : CircularAreaDivideRdData_return_wit_1.
Proof.
  pre_process.
  Exists operations_2 writeidx_2 b_status_2 physical_2 readidx_2 data_buffer_2.
  pose proof PreH8 as Hstate.
  unfold CircularAreaLogicalState in Hstate.
  unfold unsigned_last_nbits in PreH1.
  change ((readidx_2 mod 4294967296 + data_length_pre) mod 4294967296 >
          ca_capacity state) in PreH1.
  replace (readidx_2 mod 4294967296) with readidx_2 in PreH1
    by (symmetry; apply Z.mod_small; lia).
  replace ((readidx_2 + data_length_pre) mod 4294967296)
    with (readidx_2 + data_length_pre) in PreH1
    by (symmetry; apply Z.mod_small; lia).
  unfold CircularAreaStateDivideRdDataResult,
    CircularAreaDivideRdDataResult, CircularAreaValid.
  entailer!.
  all: try tauto; try lia.
Qed.

Lemma proof_of_CircularAreaDivideRdData_return_wit_2 : CircularAreaDivideRdData_return_wit_2.
Proof.
  pre_process.
  Exists operations_2 writeidx_2 b_status_2 physical_2 readidx_2 data_buffer_2.
  pose proof PreH8 as Hstate.
  unfold CircularAreaLogicalState in Hstate.
  unfold unsigned_last_nbits in PreH1.
  change ((readidx_2 mod 4294967296 + data_length_pre) mod 4294967296 <=
          ca_capacity state) in PreH1.
  replace (readidx_2 mod 4294967296) with readidx_2 in PreH1
    by (symmetry; apply Z.mod_small; lia).
  replace ((readidx_2 + data_length_pre) mod 4294967296)
    with (readidx_2 + data_length_pre) in PreH1
    by (symmetry; apply Z.mod_small; lia).
  unfold CircularAreaStateDivideRdDataResult,
    CircularAreaDivideRdDataResult, CircularAreaValid.
  entailer!.
  all: try tauto; try lia.
Qed.

Lemma proof_of_CircularAreaRead_entail_wit_1 : CircularAreaRead_entail_wit_1.
Proof.
  pre_process.
  unfold CircularAreaReadInput.
  Intros_p Hbounds.
  Split.
  - Left. Left. entailer!.
  - Intros_p Hca.
    Split.
    + Intros_p Hout0. Left. Right. entailer!.
    + Intros_p Hout. Right. entailer!.
Qed.

Lemma proof_of_CircularAreaRead_entail_wit_3 : CircularAreaRead_entail_wit_3.
Proof.
  pre_process.
  entailer!.
  unfold CircularAreaStateEmptyResult in *.
  destruct (ca_contents state); simpl in *; lia.
Qed.

Lemma proof_of_CircularAreaRead_entail_wit_4_1 : CircularAreaRead_entail_wit_4_1.
Proof.
  aggressive_pre_process.
  entailer!.
  - unfold CircularAreaDivideRdDataResult in *.
    intuition lia.
  - unfold CircularAreaStateDataLengthResult in *.
    lia.
  - pose proof (CircularArea_empty_result_zero_length_pos__read_call_normalization
      (ca_contents state) retval_2 PreH9 PreH20) as Hpos.
    unfold CircularAreaStateDataLengthResult in PreH6.
    lia.
  - unfold CircularAreaStateDataLengthResult in *.
    unfold CircularAreaActualReadLength.
    rewrite Z.min_r by lia.
    lia.
Qed.

Lemma proof_of_CircularAreaRead_entail_wit_4_2 : CircularAreaRead_entail_wit_4_2.
Proof.
  aggressive_pre_process.
  entailer!.
  - unfold CircularAreaDivideRdDataResult in *.
    intuition lia.
  - unfold CircularAreaStateDataLengthResult in PreH7.
    unfold CircularAreaActualReadLength.
    rewrite Z.min_l by lia.
    reflexivity.
Qed.

Lemma proof_of_CircularAreaRead_entail_wit_5 : CircularAreaRead_entail_wit_5.
Proof.
  aggressive_pre_process.
  pose proof PreH12 as Hstate.
  unfold CircularAreaLogicalState in Hstate.
  destruct Hstate as
    (Harea & Hread & Hwrite & Hlogical & Hphysical & Hbytes & Hwriteidx &
     Hstatus & Hfull & Hempty & Hlive).
  pose proof (CircularArea_actual_read_length_le__read_post_and_memcpy_lengths
    (ca_contents state) data_length_pre data_length PreH8) as Hactual_le.
  unfold CircularAreaDivideRdDataResult in PreH11.
  destruct PreH11 as [[_ Hzero] | [Hwrap Hone]]; [lia |].
  assert (Hread_u : unsigned_last_nbits readidx 32 = readidx).
  { apply unsigned_last_nbits_eq. split; [lia|].
    change (readidx < 4294967296). lia. }
  assert (Hup_u :
      unsigned_last_nbits (ca_capacity state - unsigned_last_nbits readidx 32) 32 =
      ca_capacity state - readidx).
  { rewrite Hread_u. apply unsigned_last_nbits_eq. split; [lia|].
    change (ca_capacity state - readidx < 4294967296). lia. }
  assert (Hdown_u :
      unsigned_last_nbits
        (data_length - unsigned_last_nbits
           (ca_capacity state - unsigned_last_nbits readidx 32) 32) 32 =
      data_length - (ca_capacity state - readidx)).
  { rewrite Hup_u. apply unsigned_last_nbits_eq. split; [lia|].
    change (data_length - (ca_capacity state - readidx) < 4294967296). lia. }
  pose proof
    (CircularAreaInitializedSlice_nonwrap__read_copy_slices
      physical_2 (ca_contents state) readidx (ca_capacity state)
      (ca_capacity state - readidx)
      ltac:(lia) ltac:(lia) ltac:(lia) ltac:(lia) Hphysical Hlive)
    as Hslice.
  replace (readidx + (ca_capacity state - readidx)) with
    (ca_capacity state) in Hslice by lia.
  rewrite Hdown_u, Hup_u.
  Exists physical_2.
  unfold CircularAreaInitializedSlice in Hslice.
  unfold CircularAreaSomeBytes.
  sep_apply_l_atomic
    (UCharArray.mixed_full_split_to_mixed_seg
      data_buffer_2 readidx (ca_capacity state) physical_2).
  - dump_pre_spatial. lia.
  - rewrite Hslice.
    sep_apply_l_atomic
      (UCharArray.mixed_full_split_to_mixed_seg
        output_buffer_pre (ca_capacity state - readidx)
        output_capacity output_before).
    + dump_pre_spatial. lia.
    + sep_apply_l_atomic
        (UCharArray.mixed_seg_to_mixed_full
          output_buffer_pre 0 (ca_capacity state - readidx)
          (sublist 0 (ca_capacity state - readidx) output_before)).
      entailer!.
      * replace (output_buffer_pre + 0 * sizeof(UCHAR)) with
          output_buffer_pre by lia.
        replace (ca_capacity state - readidx - 0) with
          (ca_capacity state - readidx) by lia.
        entailer!.
      * unfold CircularAreaDivideRdDataResult.
        right. lia.
Qed.

Lemma proof_of_CircularAreaRead_entail_wit_6 : CircularAreaRead_entail_wit_6.
Proof.
  aggressive_pre_process.
  subst area_length_2. subst logical_2.
  pose proof PreH18 as Hstate.
  unfold CircularAreaLogicalState in Hstate.
  destruct Hstate as
    (Harea & Hread & Hwrite & Hlogical & Hphysical & Hbytes & Hwriteidx &
     Hstatus & Hfull & Hempty & Hlive).
  pose proof (CircularArea_actual_read_length_le__read_post_and_memcpy_lengths
    (ca_contents state) data_length_pre data_length PreH9) as Hactual_le.
  unfold CircularAreaDivideRdDataResult in PreH17.
  destruct PreH17 as [[_ Hzero] | [Hwrap Hone]]; [lia |].
  assert (Hdown : 0 <= read_len_down <= readidx_2) by lia.
  pose proof
    (CircularAreaInitializedSlice_wrap_head__read_copy_slices
      physical_2 (ca_contents state) readidx_2 (ca_capacity state)
      read_len_up read_len_down ltac:(lia) Hread PreH14 Hdown
      ltac:(lia) ltac:(lia) Hphysical PreH19) as Hslice.
  replace (read_len_up + read_len_down) with data_length in Hslice by lia.
  Exists physical_2.
  unfold CircularAreaInitializedSlice in Hslice.
  unfold CircularAreaInitializedSlice in PreH20.
  unfold CircularAreaSomeBytes.
  sep_apply_l_atomic
    (UCharArray.mixed_full_to_mixed_seg output_buffer_pre read_len_up
      (map (@Some Z) (sublist 0 read_len_up (ca_contents state)))).
  sep_apply_l_atomic
    (UCharArray.mixed_seg_split_to_mixed_seg data_buffer_2 0 read_len_down
      readidx_2 (sublist 0 readidx_2 physical_2)).
  - dump_pre_spatial. lia.
  - replace (read_len_down - 0) with read_len_down by lia.
    replace (readidx_2 - 0) with readidx_2 by lia.
    repeat rewrite Zsublist_Zsublist0 by lia.
    rewrite Hslice.
    sep_apply_l_atomic
      (UCharArray.mixed_seg_split_to_mixed_seg output_buffer_pre read_len_up
        data_length output_capacity
        (sublist read_len_up output_capacity output_before)).
    + dump_pre_spatial. lia.
    + repeat rewrite Zsublist_Zsublist by lia.
      replace (0 + read_len_up) with read_len_up by lia.
      replace (data_length - read_len_up + read_len_up) with data_length by lia.
      replace (output_capacity - read_len_up + read_len_up) with
        output_capacity by lia.
      sep_apply_l_atomic
        (UCharArray.mixed_seg_to_mixed_full output_buffer_pre read_len_up
          data_length (sublist read_len_up data_length output_before)).
      entailer!.
      * rewrite PreH20.
        replace (data_length - read_len_up) with read_len_down by lia.
        entailer!.
      * unfold CircularAreaDivideRdDataResult.
        right. lia.
Qed.

Lemma proof_of_CircularAreaRead_entail_wit_7_1 : CircularAreaRead_entail_wit_7_1.
Proof.
  aggressive_pre_process.
  pose proof PreH5 as Hstate.
  unfold CircularAreaLogicalState in Hstate.
  destruct Hstate as
    (Harea & Hread & Hwrite & Hlogical & Hphysical & Hbytes & Hwriteidx &
     Hstatus & Hfull & Hempty & Hlive).
  unfold CircularAreaStateDataLengthResult in PreH6, PreH8.
  assert (Hactual :
      CircularAreaActualReadLength (ca_contents state) data_length_pre retval).
  { unfold CircularAreaActualReadLength.
    rewrite Z.min_r by lia. lia. }
  pose proof (CircularArea_empty_result_zero_length_pos__read_call_normalization
    (ca_contents state) retval_2 PreH9 PreH20) as Hpositive.
  unfold CircularAreaDivideRdDataResult in PreH4.
  destruct PreH4 as [[Hfit Hzero] | [_ Hone]]; [|lia].
  pose proof
    (CircularAreaInitializedSlice_nonwrap__read_copy_slices
      physical_2 (ca_contents state) readidx_2 (ca_capacity state) retval
      ltac:(lia) ltac:(lia) Hfit ltac:(lia) Hphysical Hlive) as Hslice.
  Exists physical_2.
  unfold CircularAreaInitializedSlice in Hslice.
  unfold CircularAreaSomeBytes.
  sep_apply_l_atomic
    (UCharArray.mixed_full_split_to_mixed_seg data_buffer_2 readidx_2
      (ca_capacity state) physical_2).
  - dump_pre_spatial. lia.
  - sep_apply_l_atomic
      (UCharArray.mixed_seg_split_to_mixed_seg data_buffer_2 readidx_2
        (readidx_2 + retval) (ca_capacity state)
        (sublist readidx_2 (ca_capacity state) physical_2)).
    + dump_pre_spatial. lia.
    + repeat rewrite Zsublist_Zsublist by lia.
      replace (0 + readidx_2) with readidx_2 by lia.
      replace (readidx_2 + retval - readidx_2 + readidx_2) with
        (readidx_2 + retval) by lia.
      replace (ca_capacity state - readidx_2 + readidx_2) with
        (ca_capacity state) by lia.
      rewrite Hslice.
      sep_apply_l_atomic
        (UCharArray.mixed_full_split_to_mixed_seg output_buffer_pre retval
          output_capacity output_before).
      * dump_pre_spatial. lia.
      * sep_apply_l_atomic
          (UCharArray.mixed_seg_to_mixed_full output_buffer_pre 0 retval
            (sublist 0 retval output_before)).
        entailer!.
        -- replace (output_buffer_pre + 0 * sizeof(UCHAR)) with
             output_buffer_pre by lia.
           replace (retval - 0) with retval by lia.
           entailer!.
        -- unfold CircularAreaDivideRdDataResult.
           left. lia.
        -- rewrite <- PreH20. exact PreH9.
Qed.

Lemma proof_of_CircularAreaRead_entail_wit_7_2 : CircularAreaRead_entail_wit_7_2.
Proof.
  aggressive_pre_process.
  pose proof PreH5 as Hstate.
  unfold CircularAreaLogicalState in Hstate.
  destruct Hstate as
    (Harea & Hread & Hwrite & Hlogical & Hphysical & Hbytes & Hwriteidx &
     Hstatus & Hfull & Hempty & Hlive).
  unfold CircularAreaStateDataLengthResult in PreH7.
  assert (Hactual :
      CircularAreaActualReadLength (ca_contents state) data_length_pre
        data_length_pre).
  { unfold CircularAreaActualReadLength.
    rewrite Z.min_l by lia. reflexivity. }
  unfold CircularAreaDivideRdDataResult in PreH4.
  destruct PreH4 as [[Hfit Hzero] | [_ Hone]]; [|lia].
  pose proof
    (CircularAreaInitializedSlice_nonwrap__read_copy_slices
      physical_2 (ca_contents state) readidx_2 (ca_capacity state)
      data_length_pre ltac:(lia) ltac:(lia) Hfit ltac:(lia)
      Hphysical Hlive) as Hslice.
  Exists physical_2.
  unfold CircularAreaInitializedSlice in Hslice.
  unfold CircularAreaSomeBytes.
  sep_apply_l_atomic
    (UCharArray.mixed_full_split_to_mixed_seg data_buffer_2 readidx_2
      (ca_capacity state) physical_2).
  - dump_pre_spatial. lia.
  - sep_apply_l_atomic
      (UCharArray.mixed_seg_split_to_mixed_seg data_buffer_2 readidx_2
        (readidx_2 + data_length_pre) (ca_capacity state)
        (sublist readidx_2 (ca_capacity state) physical_2)).
    + dump_pre_spatial. lia.
    + repeat rewrite Zsublist_Zsublist by lia.
      replace (0 + readidx_2) with readidx_2 by lia.
      replace (readidx_2 + data_length_pre - readidx_2 + readidx_2) with
        (readidx_2 + data_length_pre) by lia.
      replace (ca_capacity state - readidx_2 + readidx_2) with
        (ca_capacity state) by lia.
      rewrite Hslice.
      sep_apply_l_atomic
        (UCharArray.mixed_full_split_to_mixed_seg output_buffer_pre
          data_length_pre output_capacity output_before).
      * dump_pre_spatial. lia.
      * sep_apply_l_atomic
          (UCharArray.mixed_seg_to_mixed_full output_buffer_pre 0
            data_length_pre (sublist 0 data_length_pre output_before)).
        entailer!.
        -- replace (output_buffer_pre + 0 * sizeof(UCHAR)) with
             output_buffer_pre by lia.
           replace (data_length_pre - 0) with data_length_pre by lia.
           entailer!.
        -- unfold CircularAreaDivideRdDataResult.
           left. lia.
        -- rewrite <- PreH19. exact PreH8.
Qed.

Lemma proof_of_CircularAreaRead_return_wit_1 : CircularAreaRead_return_wit_1.
Proof.
  aggressive_pre_process.
  subst logical.
  unfold CircularAreaActualReadLength in PreH13.
  pose proof PreH21 as Hstatefacts.
  unfold CircularAreaLogicalState in Hstatefacts.
  destruct Hstatefacts as
    [Harea [Hread [Hwriteidx [Hlogical_length [Hphysical_length _]]]]].
  pose proof
    (CircularArea_read_consume_state__read_postconditions
      readidx writeidx area_length b_status (ca_contents state) physical
      data_length PreH21 ltac:(lia)) as Hnewstate.
  assert (Hnewindex :
    (readidx + data_length) mod area_length = read_len_down).
  {
    replace (readidx + data_length)
      with (read_len_down + 1 * area_length) by lia.
    rewrite Z.mod_add by lia.
    apply Z.mod_small. lia.
  }
  rewrite Hnewindex in Hnewstate.
  assert (Hnewread_range : 0 <= read_len_down < 2 ^ 8).
  {
    change (0 <= read_len_down < 256).
    lia.
  }
  rewrite unsigned_last_nbits_eq by exact Hnewread_range.
  unfold CircularAreaInitializedSlice in PreH23.
  unfold CircularAreaSomeBytes in *.
  rewrite <- PreH23.
  sep_apply
    (UCharArray.mixed_seg_merge_to_mixed_seg data_buffer 0 read_len_down
      readidx
      (sublist 0 read_len_down physical)
      (sublist read_len_down readidx physical)); try lia.
  rewrite <- (sublist_split 0 readidx read_len_down physical) by lia.
  sep_apply
    (UCharArray.mixed_seg_merge_to_mixed_full data_buffer 0 readidx
      area_length
      (sublist 0 readidx physical)
      (sublist readidx area_length physical)); try lia.
  rewrite <- (sublist_split 0 area_length readidx physical) by lia.
  rewrite (sublist_self physical area_length (eq_sym Hphysical_length)).
  sep_apply
    (UCharArray.mixed_full_to_mixed_seg
      (output_buffer_pre + read_len_up * sizeof(UCHAR)) read_len_down
      (sublist 0 read_len_down physical)).
  rewrite <-
    (UCharArray.mixed_seg_shift output_buffer_pre read_len_up 0 read_len_down
      (sublist 0 read_len_down physical)).
  replace (read_len_up + 0) with read_len_up by lia.
  replace (read_len_up + read_len_down) with data_length by lia.
  sep_apply
    (UCharArray.mixed_seg_merge_to_mixed_seg output_buffer_pre 0 read_len_up
      data_length
      (map (@Some Z) (sublist 0 read_len_up (ca_contents state)))
      (sublist 0 read_len_down physical)); try lia.
  rewrite PreH23.
  rewrite <- map_app.
  rewrite <- (sublist_split 0 data_length read_len_up (ca_contents state))
    by lia.
  sep_apply
    (UCharArray.mixed_seg_merge_to_mixed_full output_buffer_pre 0 data_length
      output_capacity
      (map (@Some Z) (sublist 0 data_length (ca_contents state)))
      (sublist data_length output_capacity output_before)); try lia.
  Exists
    (Build_circular_area_state (ca_capacity state)
      (sublist data_length (Zlength (ca_contents state)) (ca_contents state)))
    (CircularAreaSomeBytes (sublist 0 data_length (ca_contents state)) ++
      sublist data_length output_capacity output_before).
  unfold store_circular_area.
  Exists data_buffer operations read_len_down writeidx 0 physical.
  entailer!.
  - simpl. rewrite <- PreH10.
    unfold CircularAreaSomeBytes.
    replace (output_buffer_pre + 0) with output_buffer_pre by lia.
    replace (output_capacity - 0) with output_capacity by lia.
    replace (data_buffer + 0) with data_buffer by lia.
    replace (area_length - 0) with area_length by lia.
    entailer!.
  - simpl. rewrite <- PreH10. exact Hnewstate.
  - unfold CircularAreaReadResult.
    right.
    repeat split; auto; try lia.
    + intro Hnil.
      unfold CircularAreaStateEmptyResult in PreH12.
      rewrite Hnil in PreH12. discriminate.
    + rewrite <- PreH13. reflexivity.
    + unfold CircularAreaSomeBytes. rewrite <- PreH13. reflexivity.
Qed.

Lemma proof_of_CircularAreaRead_return_wit_2 : CircularAreaRead_return_wit_2.
Proof.
  aggressive_pre_process.
  subst logical.
  unfold CircularAreaActualReadLength in PreH13.
  pose proof
    (CircularArea_read_consume_state__read_postconditions
      readidx writeidx area_length b_status (ca_contents state) physical
      data_length PreH19 ltac:(lia)) as Hnewstate.
  assert (Hphysical_length : Zlength physical = area_length).
  { unfold CircularAreaLogicalState in PreH19. tauto. }
  assert (Hnewread_range :
    0 <= (readidx + data_length) mod area_length < 2 ^ 8).
  {
    unfold CircularAreaLogicalState in Hnewstate.
    destruct Hnewstate as [_ [Hr _]].
    change (0 <= (readidx + data_length) mod area_length < 256).
    unfold CircularAreaLogicalState in PreH19.
    lia.
  }
  rewrite Z.rem_mod_nonneg by
    (unfold CircularAreaLogicalState in PreH19; lia).
  rewrite unsigned_last_nbits_eq by exact Hnewread_range.
  unfold CircularAreaInitializedSlice in PreH21.
  unfold CircularAreaSomeBytes in *.
  rewrite <- PreH21.
  sep_apply
    (UCharArray.mixed_seg_merge_to_mixed_seg data_buffer 0 readidx
      (readidx + data_length)
      (sublist 0 readidx physical)
      (sublist readidx (readidx + data_length) physical)); try lia.
  rewrite <- (sublist_split 0 (readidx + data_length) readidx physical)
    by lia.
  sep_apply
    (UCharArray.mixed_seg_merge_to_mixed_full data_buffer 0
      (readidx + data_length) area_length
      (sublist 0 (readidx + data_length) physical)
      (sublist (readidx + data_length) area_length physical)); try lia.
  rewrite <- (sublist_split 0 area_length (readidx + data_length) physical)
    by lia.
  rewrite (sublist_self physical area_length (eq_sym Hphysical_length)).
  sep_apply
    (UCharArray.mixed_full_to_mixed_seg output_buffer_pre data_length
      (sublist readidx (readidx + data_length) physical)).
  sep_apply
    (UCharArray.mixed_seg_merge_to_mixed_full output_buffer_pre 0 data_length
      output_capacity
      (sublist readidx (readidx + data_length) physical)
      (sublist data_length output_capacity output_before)); try lia.
  rewrite PreH21.
  Exists
    (Build_circular_area_state (ca_capacity state)
      (sublist data_length (Zlength (ca_contents state)) (ca_contents state)))
    (CircularAreaSomeBytes (sublist 0 data_length (ca_contents state)) ++
      sublist data_length output_capacity output_before).
  unfold store_circular_area.
  Exists data_buffer operations ((readidx + data_length) mod area_length)
    writeidx 0 physical.
  entailer!.
  - simpl. rewrite <- PreH10.
    unfold CircularAreaSomeBytes.
    replace (output_buffer_pre + 0) with output_buffer_pre by lia.
    replace (output_capacity - 0) with output_capacity by lia.
    replace (data_buffer + 0) with data_buffer by lia.
    replace (area_length - 0) with area_length by lia.
    entailer!.
  - simpl. rewrite <- PreH10. exact Hnewstate.
  - unfold CircularAreaReadResult.
    right.
    repeat split; auto; try lia.
    + intro Hnil.
      unfold CircularAreaStateEmptyResult in PreH12.
      rewrite Hnil in PreH12. discriminate.
    + rewrite <- PreH13. reflexivity.
    + unfold CircularAreaSomeBytes. rewrite <- PreH13. reflexivity.
Qed.

Lemma proof_of_CircularAreaRead_return_wit_3 : CircularAreaRead_return_wit_3.
Proof.
  aggressive_pre_process.
  unfold CircularAreaReadResult, CircularAreaStateEmptyResult in *.
  destruct (ca_contents state); simpl in *; try tauto; lia.
Qed.

Lemma proof_of_CircularAreaRead_return_wit_4 : CircularAreaRead_return_wit_4.
Proof.
  aggressive_pre_process.
  unfold CircularAreaReadResult.
  left; repeat split; auto; try lia.
Qed.

Lemma proof_of_CircularAreaRead_return_wit_5 : CircularAreaRead_return_wit_5.
Proof.
  unfold CircularAreaRead_return_wit_5.
  right.
  intros.
  unfold CircularAreaErrorResult.
  entailer!.
Qed.

Lemma proof_of_CircularAreaRead_return_wit_6 : CircularAreaRead_return_wit_6.
Proof.
  unfold CircularAreaRead_return_wit_6.
  right.
  intros.
  unfold CircularAreaErrorResult.
  entailer!.
Qed.

Lemma proof_of_CircularAreaRead_partial_solve_wit_4_pure : CircularAreaRead_partial_solve_wit_4_pure.
Proof.
  pre_process.
  split_pures.
  - dump_pre_spatial.
    unfold CircularAreaStateDataLengthResult in *.
    lia.
  - dump_pre_spatial.
    unfold CircularAreaStateDataLengthResult in *.
    pose proof (Zlength_nonneg (ca_contents state)).
    lia.
Qed.

Lemma proof_of_CircularAreaRead_partial_solve_wit_5_pure : CircularAreaRead_partial_solve_wit_5_pure.
Proof.
  pre_process.
  split_pures;
    dump_pre_spatial;
    unfold CircularAreaStateDataLengthResult in *;
    lia.
Qed.

Lemma proof_of_CircularAreaRead_partial_solve_wit_6_pure : CircularAreaRead_partial_solve_wit_6_pure.
Proof.
  aggressive_pre_process.
  split_pures.
  all: prop_apply (UCharArray.mixed_full_Zlength output_buffer_pre read_len_up
    (sublist 0 read_len_up output_before)); Intros_p Houtlen.
  all: unfold CircularAreaActualReadLength in PreH18.
  all: unfold CircularAreaLogicalState in PreH27.
  all: destruct PreH27 as [_ [_ [_ [Hlogiclen _]]]].
  all: dump_pre_spatial.
  all: try (rewrite Zlength_sublist by lia); try lia.
  all: try (rewrite <- PreH23; exact Houtlen).
Qed.

Lemma proof_of_CircularAreaRead_partial_solve_wit_7_pure : CircularAreaRead_partial_solve_wit_7_pure.
Proof.
  aggressive_pre_process.
  split_pures.
  all: prop_apply (UCharArray.mixed_full_Zlength
    (output_buffer_pre + read_len_up * sizeof(UCHAR)) read_len_down
    (sublist read_len_up data_length output_before)); Intros_p Houtlen.
  all: unfold CircularAreaActualReadLength in PreH18.
  all: unfold CircularAreaLogicalState in PreH26.
  all: destruct PreH26 as [_ [_ [_ [Hlogiclen _]]]].
  all: dump_pre_spatial.
  all: try (rewrite Zlength_sublist by lia); try lia.
  all: try (rewrite <- PreH23; rewrite <- PreH24; exact Houtlen).
Qed.

Lemma proof_of_CircularAreaRead_partial_solve_wit_8_pure : CircularAreaRead_partial_solve_wit_8_pure.
Proof.
  aggressive_pre_process.
  split_pures.
  all: prop_apply (UCharArray.mixed_full_Zlength output_buffer_pre data_length
    (sublist 0 data_length output_before)); Intros_p Houtlen.
  all: unfold CircularAreaActualReadLength in PreH14.
  all: unfold CircularAreaLogicalState in PreH20.
  all: destruct PreH20 as [_ [_ [_ [Hlogiclen _]]]].
  all: dump_pre_spatial.
  all: try (rewrite Zlength_sublist by lia); try lia.
  all: try exact Houtlen.
Qed.
