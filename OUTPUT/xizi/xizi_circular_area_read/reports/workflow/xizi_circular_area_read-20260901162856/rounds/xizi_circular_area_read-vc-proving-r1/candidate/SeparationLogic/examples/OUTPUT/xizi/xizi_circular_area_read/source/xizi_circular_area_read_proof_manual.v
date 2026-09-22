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
  subst circular_area_pre.
  unfold CircularAreaBackingResource.
  entailer!.
Qed.

Lemma proof_of_CircularAreaIsFull_return_wit_1 : CircularAreaIsFull_return_wit_1.
Proof.
  pre_process.
  unfold CircularAreaBackingResource.
  pose proof (CircularArea_full_read_ne__query_state_results
    readidx writeidx area_length b_status logical physical PreH5 PreH1) as Hresult.
  entailer!.
Qed.

Lemma proof_of_CircularAreaIsFull_return_wit_2 : CircularAreaIsFull_return_wit_2.
Proof.
  pre_process.
  unfold CircularAreaBackingResource.
  pose proof (CircularArea_full_status_zero__query_state_results
    readidx writeidx area_length b_status logical physical PreH6 PreH1) as Hresult.
  entailer!.
Qed.

Lemma proof_of_CircularAreaIsFull_return_wit_3 : CircularAreaIsFull_return_wit_3.
Proof.
  pre_process.
  unfold CircularAreaBackingResource.
  pose proof (CircularArea_full_status_nonzero__query_state_results
    readidx writeidx area_length b_status logical physical PreH6 PreH1 PreH2) as Hresult.
  entailer!.
Qed.

Lemma proof_of_CircularAreaIsEmpty_entail_wit_1 : CircularAreaIsEmpty_entail_wit_1.
Proof.
  pre_process.
  subst circular_area_pre.
  unfold CircularAreaBackingResource.
  entailer!.
Qed.

Lemma proof_of_CircularAreaIsEmpty_return_wit_1 : CircularAreaIsEmpty_return_wit_1.
Proof.
  pre_process.
  unfold CircularAreaBackingResource.
  pose proof (CircularArea_empty_read_ne__query_state_results
    readidx writeidx area_length b_status logical physical PreH5 PreH1) as Hresult.
  entailer!.
Qed.

Lemma proof_of_CircularAreaIsEmpty_return_wit_2 : CircularAreaIsEmpty_return_wit_2.
Proof.
  pre_process.
  unfold CircularAreaBackingResource.
  pose proof (CircularArea_empty_status_nonzero__query_state_results
    readidx writeidx area_length b_status logical physical PreH6 PreH1) as Hresult.
  entailer!.
Qed.

Lemma proof_of_CircularAreaIsEmpty_return_wit_3 : CircularAreaIsEmpty_return_wit_3.
Proof.
  pre_process.
  unfold CircularAreaBackingResource.
  pose proof (CircularArea_empty_status_zero_equal__query_state_results
    readidx writeidx area_length b_status logical physical PreH6 PreH1 PreH2) as Hresult.
  entailer!.
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
  subst circular_area_pre.
  unfold CircularAreaBackingResource.
  unfold CircularAreaFullResult in PreH3.
  destruct (Z.eq_dec (Zlength logical) area_length) as [Heq | Hneq].
  - entailer!.
  - entailer!.
Qed.

Lemma proof_of_CircularAreaGetDataLength_entail_wit_2 : CircularAreaGetDataLength_entail_wit_2.
Proof.
  pre_process.
  subst circular_area_pre.
  unfold CircularAreaBackingResource.
  unfold CircularAreaFullResult in PreH3.
  destruct (Z.eq_dec (Zlength logical) area_length) as [Heq | Hneq].
  - entailer!.
  - unfold CircularAreaLogicalState in *.
    entailer!.
Qed.

Lemma proof_of_CircularAreaGetDataLength_return_wit_1 : CircularAreaGetDataLength_return_wit_1.
Proof.
  pre_process.
  unfold CircularAreaBackingResource.
  split_pure_spatial.
  - entailer!.
  - entailer!.
    unfold CircularAreaDataLengthResult.
    unfold CircularAreaLogicalState in PreH4.
    destruct PreH4 as
      [Harea [Hread [Hwrite [Hlength [_ [_ [Hwriteeq _]]]]]]].
    assert (Hcast :
      unsigned_last_nbits
        (unsigned_last_nbits (writeidx - readidx) 32 + area_length) 32 =
      writeidx - readidx + area_length).
    { destruct (Z_le_gt_dec 0 (writeidx - readidx)) as [Hnonneg | Hneg].
      - assert (Hinner :
          unsigned_last_nbits (writeidx - readidx) 32 =
          writeidx - readidx).
        { apply unsigned_last_nbits_eq.
          change (2 ^ 32) with 4294967296.
          lia. }
        rewrite Hinner.
        rewrite unsigned_last_nbits_eq by
          (change (2 ^ 32) with 4294967296; lia).
        reflexivity.
      - assert (Hinner :
          unsigned_last_nbits (writeidx - readidx) 32 =
          writeidx - readidx + 4294967296).
        { unfold unsigned_last_nbits.
          change (2 ^ 32) with 4294967296.
          symmetry.
          apply Z.mod_unique with (q := -1); lia. }
        rewrite Hinner.
        unfold unsigned_last_nbits.
        change (2 ^ 32) with 4294967296.
        symmetry.
        apply Z.mod_unique with (q := 1); lia. }
    rewrite Hcast.
    eapply CircularArea_data_length_mod__length_and_divide_results; eauto; lia.
Qed.

Lemma proof_of_CircularAreaGetDataLength_return_wit_2 : CircularAreaGetDataLength_return_wit_2.
Proof.
  pre_process.
  unfold CircularAreaBackingResource.
  unfold CircularAreaDataLengthResult.
  entailer!.
Qed.

Lemma proof_of_CircularAreaDivideRdData_entail_wit_1 : CircularAreaDivideRdData_entail_wit_1.
Proof.
  pre_process.
  subst circular_area_pre data_length_pre.
  unfold CircularAreaBackingResource.
  entailer!.
Qed.

Lemma proof_of_CircularAreaDivideRdData_return_wit_1 : CircularAreaDivideRdData_return_wit_1.
Proof.
  pre_process.
  unfold CircularAreaBackingResource.
  split_pure_spatial.
  - entailer!.
  - entailer!.
    unfold CircularAreaDivideRdDataResult.
    unfold CircularAreaLogicalState in PreH8.
    destruct PreH8 as [Harea [Hread _]].
    assert (Hreadcast : unsigned_last_nbits readidx 32 = readidx).
    { apply unsigned_last_nbits_eq.
      change (2 ^ 32) with 4294967296.
      lia. }
    rewrite Hreadcast in PreH1.
    rewrite unsigned_last_nbits_eq in PreH1 by
      (change (2 ^ 32) with 4294967296; lia).
    right.
    lia.
Qed.

Lemma proof_of_CircularAreaDivideRdData_return_wit_2 : CircularAreaDivideRdData_return_wit_2.
Proof.
  pre_process.
  unfold CircularAreaBackingResource.
  split_pure_spatial.
  - entailer!.
  - entailer!.
    unfold CircularAreaDivideRdDataResult.
    unfold CircularAreaLogicalState in PreH8.
    destruct PreH8 as [Harea [Hread _]].
    assert (Hreadcast : unsigned_last_nbits readidx 32 = readidx).
    { apply unsigned_last_nbits_eq.
      change (2 ^ 32) with 4294967296.
      lia. }
    rewrite Hreadcast in PreH1.
    rewrite unsigned_last_nbits_eq in PreH1 by
      (change (2 ^ 32) with 4294967296; lia).
    left.
    lia.
Qed.

Lemma proof_of_CircularAreaRead_entail_wit_2 : CircularAreaRead_entail_wit_2.
Proof.
  aggressive_pre_process.
  unfold CircularAreaEmptyResult in *.
  destruct logical; simpl in *; lia.
Qed.

Lemma proof_of_CircularAreaRead_entail_wit_3_1 : CircularAreaRead_entail_wit_3_1.
Proof.
  aggressive_pre_process.
  all: unfold CircularAreaBackingResource.
  all: entailer!.
  - unfold CircularAreaDivideRdDataResult in *.
    destruct PreH3 as [[Hfit Hresult] | [Hwrap Hresult]].
    + contradiction.
    + right. lia.
  - unfold CircularAreaDataLengthResult in *.
    lia.
  - pose proof
      (CircularArea_empty_result_zero_length_pos__read_call_normalization
         logical retval_2 PreH13 PreH27) as Hlogical_pos.
    unfold CircularAreaDataLengthResult in PreH6.
    lia.
  - unfold CircularAreaActualReadLength.
    unfold CircularAreaDataLengthResult in *.
    rewrite PreH6.
    symmetry.
    apply Z.min_r.
    lia.
Qed.

Lemma proof_of_CircularAreaRead_entail_wit_3_2 : CircularAreaRead_entail_wit_3_2.
Proof.
  aggressive_pre_process.
  all: unfold CircularAreaBackingResource.
  all: entailer!.
  - unfold CircularAreaDivideRdDataResult in *.
    destruct PreH3 as [[Hfit Hresult] | [Hwrap Hresult]].
    + contradiction.
    + right. lia.
  - unfold CircularAreaActualReadLength.
    unfold CircularAreaDataLengthResult in PreH7.
    symmetry.
    apply Z.min_l.
    lia.
Qed.

Lemma proof_of_CircularAreaRead_entail_wit_4 : CircularAreaRead_entail_wit_4.
Proof.
  aggressive_pre_process.
  all: unfold CircularAreaBackingResource.
  all: entailer!.
  all: unfold CircularAreaLogicalState in PreH10.
  all: destruct PreH10 as
    (Harea & Hread & Hwrite & Hlogical & Hphysical & Hbytes & Hwriteidx &
     Hstatus & Hfull & Hempty & Hlive).
  all: unfold CircularAreaDivideRdDataResult in PreH9.
  all: destruct PreH9 as [[Hfit Hresult] | [Hwrap Hresult]].
  all: try congruence.
  all: repeat match goal with
    | |- context [unsigned_last_nbits ?x 32] =>
        rewrite (unsigned_last_nbits_eq x 32) by lia
    end.
  - sep_apply_l_atomic
      (UCharArray.mixed_full_split_to_mixed_seg
         data_buffer readidx area_length physical).
    + dump_pre_spatial. lia.
    + sep_apply_l_atomic
        (UCharArray.full_split_to_seg
           out0 (area_length - readidx) output_capacity output_before).
      * dump_pre_spatial. lia.
      * cancel.
  - replace area_length with
      (readidx + (area_length - readidx)) at 1 by lia.
    apply CircularAreaInitializedSlice_nonwrap__read_copy_slices
      with (logical := logical) (area_length := area_length)
           (n := area_length - readidx); try lia.
    + unfold CircularAreaActualReadLength in PreH6.
      pose proof (Z.le_min_r requested (Zlength logical)).
      lia.
    + exact Hlive.
  - exact Hlive.
  - lia.
  - unfold CircularAreaActualReadLength in PreH6.
    pose proof (Z.le_min_r requested (Zlength logical)).
    rewrite unsigned_last_nbits_eq by lia.
    lia.
  - lia.
  - lia.
  - lia.
Qed.

Lemma proof_of_CircularAreaRead_entail_wit_5 : CircularAreaRead_entail_wit_5.
Proof.
  pre_process.
  pose proof PreH16 as Hstate.
  unfold CircularAreaLogicalState in Hstate.
  destruct Hstate as
    (Harea & Hread & Hwrite & Hlogical & Hphysical & Hbytes & Hwriteidx &
     Hstatus & Hfull & Hempty & Hlive).
  unfold CircularAreaActualReadLength in PreH7.
  pose proof (Z.le_min_r requested (Zlength logical)) as Hactual_le_logical.
  assert (Hdown0 : 0 <= read_len_down) by lia.
  assert (Hdownle : read_len_down <= readidx) by lia.
  assert (Hslice :
      CircularAreaInitializedSlice physical 0 read_len_down
        (sublist read_len_up data_length logical)).
  {
    replace data_length with (read_len_up + read_len_down) by lia.
    apply CircularAreaInitializedSlice_wrap_head__read_copy_slices
      with (readidx := readidx) (area_length := area_length); try lia.
    - exact Hlive.
  }
  sep_apply_l_atomic
    (UCharArray.mixed_seg_split_to_mixed_seg data_buffer 0 read_len_down
       readidx (sublist 0 readidx physical)).
  - dump_pre_spatial. lia.
  - sep_apply_l_atomic
      (UCharArray.seg_split_to_seg out0 read_len_up data_length
         output_capacity (sublist read_len_up output_capacity output_before)).
    + dump_pre_spatial. lia.
    + repeat rewrite Zsublist_Zsublist by lia.
      replace (data_length - read_len_up + read_len_up)
        with data_length by lia.
      replace (output_capacity - read_len_up + read_len_up)
        with output_capacity by lia.
      replace (read_len_down - 0 + 0) with read_len_down by lia.
      replace (readidx - 0 + 0) with readidx by lia.
      entailer!.
      * replace (0 + read_len_up) with read_len_up by lia.
        replace (0 + 0) with 0 by lia.
        cancel.
Qed.

Lemma proof_of_CircularAreaRead_entail_wit_6_1 : CircularAreaRead_entail_wit_6_1.
Proof.
  aggressive_pre_process.
  all: unfold CircularAreaBackingResource.
  all: entailer!.
  all: pose proof H as Hbacking.
  all: destruct Hbacking as [_ [_ Hstate]].
  all: unfold CircularAreaLogicalState in Hstate.
  all: destruct Hstate as
    (Harea & Hread & Hwrite & Hlogical & Hphysical & Hbytes & Hwriteidx &
     Hstatus & Hfull & Hempty & Hlive).
  all: unfold CircularAreaDivideRdDataResult in PreH3.
  all: destruct PreH3 as [[Hfit Hresult] | [Hwrap Hresult]].
  all: try congruence.
  all: assert (Hretval_pos : 0 < retval) by (
    pose proof PreH6 as Hdata;
    unfold CircularAreaDataLengthResult in Hdata;
    pose proof
      (CircularArea_empty_result_zero_length_pos__read_call_normalization
         logical retval_2 PreH13 PreH27) as Hlogical_pos;
    lia
  ).
  all: assert (Hretval_output : retval <= output_capacity) by (
    pose proof PreH6 as Hdata;
    pose proof PreH10 as Hdata_before;
    unfold CircularAreaDataLengthResult in Hdata, Hdata_before;
    lia
  ).
  - sep_apply_l_atomic
      (UCharArray.mixed_full_split_to_mixed_seg
         data_buffer readidx area_length physical).
    + dump_pre_spatial. lia.
    + sep_apply_l_atomic
        (UCharArray.mixed_seg_split_to_mixed_seg data_buffer readidx
           (readidx + retval) area_length
           (sublist readidx area_length physical)).
      * dump_pre_spatial. lia.
      * sep_apply_l_atomic
          (UCharArray.full_split_to_seg
             out0 retval output_capacity output_before).
        -- dump_pre_spatial. lia.
        -- repeat rewrite Zsublist_Zsublist by lia.
           replace (0 + readidx) with readidx by lia.
           replace (retval + readidx) with (readidx + retval) by lia.
           replace (readidx + retval - readidx + readidx)
             with (readidx + retval) by lia.
           replace (area_length - readidx + readidx)
             with area_length by lia.
           cancel.
  - apply CircularAreaInitializedSlice_nonwrap__read_copy_slices
      with (logical := logical) (area_length := area_length); try lia.
    + unfold CircularAreaDataLengthResult in PreH6.
      lia.
    + exact Hlive.
  - exact Hlive.
  - lia.
  - lia.
  - unfold CircularAreaDataLengthResult in *.
    lia.
  - unfold CircularAreaActualReadLength.
    unfold CircularAreaDataLengthResult in *.
    rewrite PreH6.
    symmetry.
    apply Z.min_r.
    lia.
Qed.

Lemma proof_of_CircularAreaRead_entail_wit_6_2 : CircularAreaRead_entail_wit_6_2.
Proof.
  aggressive_pre_process.
  all: unfold CircularAreaBackingResource.
  all: entailer!.
  all: pose proof H as Hbacking.
  all: destruct Hbacking as [_ [_ Hstate]].
  all: unfold CircularAreaLogicalState in Hstate.
  all: destruct Hstate as
    (Harea & Hread & Hwrite & Hlogical & Hphysical & Hbytes & Hwriteidx &
     Hstatus & Hfull & Hempty & Hlive).
  all: unfold CircularAreaDivideRdDataResult in PreH3.
  all: destruct PreH3 as [[Hfit Hresult] | [Hwrap Hresult]].
  all: try congruence.
  - sep_apply_l_atomic
      (UCharArray.mixed_full_split_to_mixed_seg
         data_buffer readidx area_length physical).
    + dump_pre_spatial. lia.
    + sep_apply_l_atomic
        (UCharArray.mixed_seg_split_to_mixed_seg data_buffer readidx
           (readidx + data_length_pre) area_length
           (sublist readidx area_length physical)).
      * dump_pre_spatial. lia.
      * sep_apply_l_atomic
          (UCharArray.full_split_to_seg
             out0 data_length_pre output_capacity output_before).
        -- dump_pre_spatial. lia.
        -- repeat rewrite Zsublist_Zsublist by lia.
           replace (0 + readidx) with readidx by lia.
           replace (data_length_pre + readidx)
             with (readidx + data_length_pre) by lia.
           replace (readidx + data_length_pre - readidx + readidx)
             with (readidx + data_length_pre) by lia.
           replace (area_length - readidx + readidx)
             with area_length by lia.
           cancel.
  - apply CircularAreaInitializedSlice_nonwrap__read_copy_slices
      with (logical := logical) (area_length := area_length); try lia.
    + unfold CircularAreaDataLengthResult in PreH7.
      lia.
    + exact Hlive.
  - exact Hlive.
  - lia.
  - unfold CircularAreaActualReadLength.
    unfold CircularAreaDataLengthResult in PreH7.
    symmetry.
    apply Z.min_l.
    lia.
Qed.

Lemma proof_of_CircularAreaRead_return_wit_1 : CircularAreaRead_return_wit_1.
Proof.
  pre_process.
  pose proof PreH15 as Hstate.
  unfold CircularAreaLogicalState in PreH15.
  destruct PreH15 as
    (Harea & Hread & Hwrite & Hlogical & Hphysical & Hbytes & Hwriteeq &
     Hstatus & Hfull & Hempty & Hlive).
  unfold CircularAreaActualReadLength in PreH7.
  unfold CircularAreaDivideRdDataResult in PreH14.
  destruct PreH14 as [[Hfit Hresult_zero] | [Hwrap Hresult_one]].
  - lia.
  - assert (Hmod :
        readidx + data_length - area_length =
          (readidx + data_length) mod area_length).
    { apply Z.mod_unique with (q := 1); lia. }
    assert (Hnewread :
        read_len_down = (readidx + data_length) mod area_length) by lia.
    assert (Hstate_after :=
      CircularArea_consume_logical_state__read_postconditions
        readidx writeidx area_length b_status requested data_length
        logical physical Hstate PreH7 PreH8).
    rewrite <- Hnewread in Hstate_after.
    assert (Hbits : 0 <= read_len_down < 2 ^ 8) by
      (change (0 <= read_len_down < 256); lia).
    Left.
    Exists data_length read_len_down
      (sublist 0 data_length logical)
      (sublist data_length (Zlength logical) logical)
      (sublist 0 data_length logical ++
        sublist data_length output_capacity output_before).
    sep_apply (UCharArray.mixed_seg_merge_to_mixed_seg data_buffer 0
      read_len_down readidx
      (sublist 0 read_len_down physical)
      (sublist read_len_down readidx physical)); try lia.
    replace (sublist 0 read_len_down physical ++
        sublist read_len_down readidx physical)
      with (sublist 0 readidx physical) by
      (apply sublist_split; lia).
    sep_apply (UCharArray.mixed_seg_merge_to_mixed_full data_buffer 0
      readidx area_length
      (sublist 0 readidx physical)
      (sublist readidx area_length physical)); try lia.
    replace (sublist 0 readidx physical ++ sublist readidx area_length physical)
      with (sublist 0 area_length physical) by
      (apply sublist_split; lia).
    rewrite sublist_self by lia.
    sep_apply (UCharArray.seg_merge_to_seg out0 0 read_len_up data_length
      (sublist 0 read_len_up logical)
      (sublist read_len_up data_length logical)); try lia.
    replace (sublist 0 read_len_up logical ++
        sublist read_len_up data_length logical)
      with (sublist 0 data_length logical) by
      (apply sublist_split; lia).
    sep_apply (UCharArray.seg_merge_to_full out0 0 data_length output_capacity
      (sublist 0 data_length logical)
      (sublist data_length output_capacity output_before)); try lia.
    unfold CircularAreaBackingResource, CircularAreaReadSuccess,
      CircularAreaOutputAfterRead.
    replace (out0 + 0 * sizeof(UCHAR)) with out0 by ring.
    replace (output_capacity - 0) with output_capacity by lia.
    replace (data_buffer + 0 * sizeof(UCHAR)) with data_buffer by ring.
    replace (area_length - 0) with area_length by lia.
    entailer!.
    all: try rewrite (unsigned_last_nbits_eq read_len_down 8 Hbits).
    all: try entailer!.
    all: try exact Hstate_after.
    all: try (rewrite Zlength_sublist by lia); try lia.
    all: replace (data_length - 0) with data_length by lia; reflexivity.
Qed.

Lemma proof_of_CircularAreaRead_return_wit_2 : CircularAreaRead_return_wit_2.
Proof.
  pre_process.
  pose proof PreH13 as Hstate.
  unfold CircularAreaLogicalState in PreH13.
  destruct PreH13 as
    (Harea & Hread & Hwrite & Hlogical & Hphysical & Hbytes & Hwriteeq &
     Hstatus & Hfull & Hempty & Hlive).
  assert (Hstate_after :=
    CircularArea_consume_logical_state__read_postconditions
      readidx writeidx area_length b_status requested data_length
      logical physical Hstate PreH7 PreH8).
  Left.
  Exists data_length ((readidx + data_length) mod area_length)
    (sublist 0 data_length logical)
    (sublist data_length (Zlength logical) logical)
    (sublist 0 data_length logical ++
      sublist data_length output_capacity output_before).
  sep_apply (UCharArray.mixed_seg_merge_to_mixed_seg data_buffer 0 readidx
    (readidx + data_length)
    (sublist 0 readidx physical)
    (sublist readidx (readidx + data_length) physical)); try lia.
  replace (sublist 0 readidx physical ++
      sublist readidx (readidx + data_length) physical)
    with (sublist 0 (readidx + data_length) physical) by
    (apply sublist_split; lia).
  sep_apply (UCharArray.mixed_seg_merge_to_mixed_full data_buffer 0
    (readidx + data_length) area_length
    (sublist 0 (readidx + data_length) physical)
    (sublist (readidx + data_length) area_length physical)); try lia.
  replace (sublist 0 (readidx + data_length) physical ++
      sublist (readidx + data_length) area_length physical)
    with (sublist 0 area_length physical) by
    (apply sublist_split; lia).
  rewrite sublist_self by lia.
  sep_apply (UCharArray.seg_merge_to_full out0 0 data_length output_capacity
    (sublist 0 data_length logical)
    (sublist data_length output_capacity output_before)); try lia.
  unfold CircularAreaBackingResource, CircularAreaReadSuccess,
    CircularAreaOutputAfterRead.
  unfold CircularAreaActualReadLength in PreH7.
  replace (out0 + 0 * sizeof(UCHAR)) with out0 by ring.
  replace (output_capacity - 0) with output_capacity by lia.
  replace (data_buffer + 0 * sizeof(UCHAR)) with data_buffer by ring.
  replace (area_length - 0) with area_length by lia.
  assert (Hmodrange :
    0 <= (readidx + data_length) mod area_length < area_length) by
    (apply Z.mod_pos_bound; lia).
  assert (Hbits :
    0 <= (readidx + data_length) mod area_length < 2 ^ 8) by
    (change (0 <= (readidx + data_length) mod area_length < 256); lia).
  entailer!.
  all: try rewrite Z.rem_mod_nonneg by lia.
  all: try rewrite (unsigned_last_nbits_eq
    ((readidx + data_length) mod area_length) 8 Hbits).
  all: try entailer!.
  all: try exact Hstate_after.
  all: try (rewrite Zlength_sublist by lia); try lia.
  all: replace (data_length - 0) with data_length by lia; reflexivity.
Qed.

Lemma proof_of_CircularAreaRead_return_wit_3 : CircularAreaRead_return_wit_3.
Proof.
  pre_process.
  Right.
  entailer!.
Qed.

Lemma proof_of_CircularAreaRead_return_wit_4 : CircularAreaRead_return_wit_4.
Proof.
  pre_process.
  Left.
  entailer!.
Qed.

Lemma proof_of_CircularAreaRead_return_wit_5 : CircularAreaRead_return_wit_5.
Proof.
  pre_process.
Qed.

Lemma proof_of_CircularAreaRead_return_wit_6 : CircularAreaRead_return_wit_6.
Proof.
  pre_process.
Qed.

Lemma proof_of_CircularAreaRead_partial_solve_wit_1_pure : CircularAreaRead_partial_solve_wit_1_pure.
Proof.
  pre_process.
  unfold CircularAreaBackingResource.
  entailer!.
Qed.

Lemma proof_of_CircularAreaRead_partial_solve_wit_4_pure : CircularAreaRead_partial_solve_wit_4_pure.
Proof.
  pre_process.
  unfold CircularAreaBackingResource, CircularAreaLogicalState,
    CircularAreaDataLengthResult in *.
  entailer!.
Qed.

Lemma proof_of_CircularAreaRead_partial_solve_wit_5_pure : CircularAreaRead_partial_solve_wit_5_pure.
Proof.
  pre_process.
  unfold CircularAreaBackingResource, CircularAreaLogicalState,
    CircularAreaDataLengthResult in *.
  entailer!.
Qed.

Lemma proof_of_CircularAreaRead_partial_solve_wit_6_pure : CircularAreaRead_partial_solve_wit_6_pure.
Proof.
  pre_process.
  subst read_len_up.
  prop_apply (UCharArray.seg_length out0 0 (area_length - readidx)
    (sublist 0 (area_length - readidx) output_before)).
  Intros_p Houtlen.
  pose proof Houtlen as HOutlen_saved.
  unfold CircularAreaBackingResource, CircularAreaLogicalState,
    CircularAreaActualReadLength in *.
  entailer!.
  all: try (rewrite Zlength_correct; exact HOutlen_saved).
  all: try (rewrite Zlength_sublist by lia).
  all: try rewrite sizeof_uchar; lia.
Qed.

Lemma proof_of_CircularAreaRead_partial_solve_wit_7_pure : CircularAreaRead_partial_solve_wit_7_pure.
Proof.
  pre_process.
  subst read_len_up.
  prop_apply (UCharArray.seg_length out0 (area_length - readidx) data_length
    (sublist (area_length - readidx) data_length output_before)).
  Intros_p HOutRange.
  pose proof HOutRange as HOutRange_saved.
  unfold CircularAreaBackingResource, CircularAreaLogicalState,
    CircularAreaActualReadLength, CircularAreaDivideRdDataResult in *.
  entailer!.
  all: try (rewrite Zlength_correct; exact HOutRange_saved).
  all: try (rewrite Zlength_sublist by lia).
  all: try rewrite sizeof_uchar; lia.
Qed.

Lemma proof_of_CircularAreaRead_partial_solve_wit_8_pure : CircularAreaRead_partial_solve_wit_8_pure.
Proof.
  pre_process.
  prop_apply (UCharArray.seg_length out0 0 data_length
    (sublist 0 data_length output_before)).
  Intros_p HOutPrefix.
  pose proof HOutPrefix as HOutPrefix_saved.
  unfold CircularAreaBackingResource, CircularAreaLogicalState,
    CircularAreaActualReadLength in *.
  entailer!.
  all: try (rewrite Zlength_correct; exact HOutPrefix_saved).
  all: try (rewrite Zlength_sublist by lia).
  all: try rewrite sizeof_uchar; lia.
Qed.
