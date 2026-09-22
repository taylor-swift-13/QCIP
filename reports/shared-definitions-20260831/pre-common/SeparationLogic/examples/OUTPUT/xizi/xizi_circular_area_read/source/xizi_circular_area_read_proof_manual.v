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
  entailer!.
  eapply CircularArea_full_read_ne__query_state_results; eauto.
Qed.

Lemma proof_of_CircularAreaIsFull_return_wit_2 : CircularAreaIsFull_return_wit_2.
Proof.
  pre_process.
  unfold CircularAreaBackingResource.
  entailer!.
  eapply CircularArea_full_status_zero__query_state_results; eauto.
Qed.

Lemma proof_of_CircularAreaIsFull_return_wit_3 : CircularAreaIsFull_return_wit_3.
Proof.
  pre_process.
  unfold CircularAreaBackingResource.
  entailer!.
  eapply CircularArea_full_status_nonzero__query_state_results; eauto.
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
  entailer!.
  eapply CircularArea_empty_read_ne__query_state_results; eauto.
Qed.

Lemma proof_of_CircularAreaIsEmpty_return_wit_2 : CircularAreaIsEmpty_return_wit_2.
Proof.
  pre_process.
  unfold CircularAreaBackingResource.
  entailer!.
  eapply CircularArea_empty_status_nonzero__query_state_results; eauto.
Qed.

Lemma proof_of_CircularAreaIsEmpty_return_wit_3 : CircularAreaIsEmpty_return_wit_3.
Proof.
  pre_process.
  unfold CircularAreaBackingResource.
  entailer!.
  eapply CircularArea_empty_status_zero_equal__query_state_results; eauto.
Qed.

Lemma proof_of_CircularAreaGetDataLength_safety_wit_4 : CircularAreaGetDataLength_safety_wit_4.
Proof.
  aggressive_pre_process.
  dump_pre_spatial.
  unfold CircularAreaLogicalState in PreH4.
  lia.
Qed.

Lemma proof_of_CircularAreaGetDataLength_safety_wit_5 : CircularAreaGetDataLength_safety_wit_5.
Proof.
  aggressive_pre_process.
  all: dump_pre_spatial; unfold CircularAreaLogicalState in PreH4; lia.
Qed.

Lemma proof_of_CircularAreaGetDataLength_entail_wit_1 : CircularAreaGetDataLength_entail_wit_1.
Proof.
  aggressive_pre_process.
  all: unfold CircularAreaBackingResource.
  all: Intros_p Hstate.
  - entailer!.
  - dump_pre_spatial. tauto.
  - dump_pre_spatial.
    unfold CircularAreaFullResult in PreH3.
    destruct (Z.eq_dec (Zlength logical) area_length); lia.
Qed.

Lemma proof_of_CircularAreaGetDataLength_entail_wit_2 : CircularAreaGetDataLength_entail_wit_2.
Proof.
  aggressive_pre_process.
  all: unfold CircularAreaBackingResource.
  all: Intros_p Hstate.
  - entailer!.
  - dump_pre_spatial. tauto.
  - dump_pre_spatial.
    unfold CircularAreaFullResult in PreH3.
    unfold CircularAreaLogicalState in Hstate.
    destruct (Z.eq_dec (Zlength logical) area_length); lia.
Qed.

Lemma proof_of_CircularAreaGetDataLength_return_wit_1 : CircularAreaGetDataLength_return_wit_1.
Proof.
  aggressive_pre_process.
  unfold CircularAreaBackingResource.
  - entailer!.
  - dump_pre_spatial.
    unfold CircularAreaDataLengthResult.
    unfold CircularAreaLogicalState in PreH8.
    assert (Harea : 0 < area_length <= 256) by tauto.
    assert (Hread : 0 <= readidx < area_length) by tauto.
    assert (Hwrite : 0 <= writeidx < area_length) by tauto.
    assert (Hlength : 0 <= Zlength logical < area_length) by lia.
    assert (Hwriteeq :
      writeidx = (readidx + Zlength logical) mod area_length) by tauto.
    rewrite unsigned_unsigned_add_l by lia.
    rewrite unsigned_last_nbits_eq by (simpl; lia).
    apply CircularArea_data_length_mod__length_and_divide_results.
    + exact Harea.
    + exact Hread.
    + exact Hwrite.
    + exact Hlength.
    + exact Hwriteeq.
Qed.

Lemma proof_of_CircularAreaGetDataLength_return_wit_2 : CircularAreaGetDataLength_return_wit_2.
Proof.
  aggressive_pre_process.
  unfold CircularAreaBackingResource.
  - entailer!.
  - dump_pre_spatial.
    unfold CircularAreaDataLengthResult.
    symmetry. exact PreH7.
Qed.

Lemma proof_of_CircularAreaDivideRdData_entail_wit_1 : CircularAreaDivideRdData_entail_wit_1.
Proof.
  aggressive_pre_process.
  all: unfold CircularAreaBackingResource.
  all: Intros_p Hstate.
  - entailer!.
  - dump_pre_spatial. tauto.
Qed.

Lemma proof_of_CircularAreaDivideRdData_return_wit_1 : CircularAreaDivideRdData_return_wit_1.
Proof.
  aggressive_pre_process.
  unfold CircularAreaBackingResource.
  - entailer!.
  - dump_pre_spatial.
    unfold CircularAreaLogicalState in PreH12.
    assert (Hread : unsigned_last_nbits readidx 32 = readidx).
    { apply unsigned_last_nbits_eq. simpl. lia. }
    rewrite Hread in PreH5.
    assert (Hsum : unsigned_last_nbits (readidx + d0) 32 = readidx + d0).
    { apply unsigned_last_nbits_eq. simpl. lia. }
    rewrite Hsum in PreH5.
    unfold CircularAreaDivideRdDataResult.
    right. lia.
Qed.

Lemma proof_of_CircularAreaDivideRdData_return_wit_2 : CircularAreaDivideRdData_return_wit_2.
Proof.
  aggressive_pre_process.
  unfold CircularAreaBackingResource.
  - entailer!.
  - dump_pre_spatial.
    unfold CircularAreaLogicalState in PreH12.
    assert (Hread : unsigned_last_nbits readidx 32 = readidx).
    { apply unsigned_last_nbits_eq. simpl. lia. }
    rewrite Hread in PreH5.
    assert (Hsum : unsigned_last_nbits (readidx + d0) 32 = readidx + d0).
    { apply unsigned_last_nbits_eq. simpl. lia. }
    rewrite Hsum in PreH5.
    unfold CircularAreaDivideRdDataResult.
    left. lia.
Qed.

Lemma proof_of_CircularAreaRead_entail_wit_2 : CircularAreaRead_entail_wit_2.
Proof.
  pre_process.
  subst circular_area_pre output_buffer_pre data_length_pre.
  unfold CircularAreaEmptyResult in *.
  entailer!.
  all: destruct logical; simpl in *; congruence.
Qed.

Lemma proof_of_CircularAreaRead_entail_wit_3_1 : CircularAreaRead_entail_wit_3_1.
Proof.
  pre_process.
  subst circular_area_pre output_buffer_pre data_length_pre.
  unfold CircularAreaBackingResource.
  unfold CircularAreaDataLengthResult, CircularAreaEmptyResult,
    CircularAreaActualReadLength, CircularAreaDivideRdDataResult in *.
  destruct logical as [| x xs].
  - simpl in *; congruence.
  - destruct PreH3 as [[Hinside Hret] | [Hwrap Hret]].
    + subst retval_4; contradiction.
    + subst retval_4.
      rewrite CircularArea_zmin_right__read_call_normalization by lia.
      pose proof
        (CircularArea_zlength_cons_pos__read_call_normalization x xs) as Hlen.
  entailer!.
  all: lia.
Qed.

Lemma proof_of_CircularAreaRead_entail_wit_3_2 : CircularAreaRead_entail_wit_3_2.
Proof.
  pre_process.
  subst circular_area_pre output_buffer_pre data_length_pre.
  unfold CircularAreaBackingResource.
  unfold CircularAreaDataLengthResult, CircularAreaEmptyResult,
    CircularAreaActualReadLength, CircularAreaDivideRdDataResult in *.
  destruct PreH3 as [[Hinside Hret] | [Hwrap Hret]].
  - subst retval_3; contradiction.
  - subst retval_3.
    rewrite CircularArea_zmin_left__read_call_normalization by lia.
    entailer!.
    all: lia.
Qed.

Lemma proof_of_CircularAreaRead_entail_wit_4 : CircularAreaRead_entail_wit_4.
Proof.
  aggressive_pre_process.
  all: unfold CircularAreaLogicalState in PreH10.
  all: destruct PreH10 as
    [Harea [Hread [Hwrite [Hlog [Hphys [Hbyte [Hwriteeq [Hfull [Hnotfull Hlive]]]]]]]]].
  all: unfold CircularAreaDivideRdDataResult in PreH9.
  all: destruct PreH9 as [[Hnowrap Hzero] | [Hwrap Hone]]; try lia.
  all: assert (Hdata_log : data_length <= Zlength logical) by
    (unfold CircularAreaActualReadLength in PreH6;
     destruct (Z_le_dec requested (Zlength logical));
     [rewrite Z.min_l in PreH6 by lia |
      rewrite Z.min_r in PreH6 by lia]; lia).
  all: assert (Hur : unsigned_last_nbits readidx 32 = readidx) by
    (apply unsigned_last_nbits_eq; lia).
  all: assert (Htail :
    unsigned_last_nbits (area_length - unsigned_last_nbits readidx 32) 32 =
    area_length - readidx) by
    (rewrite Hur; apply unsigned_last_nbits_eq; lia).
  all: assert (Hrem : unsigned_last_nbits
    (data_length - unsigned_last_nbits
      (area_length - unsigned_last_nbits readidx 32) 32) 32 =
    data_length - unsigned_last_nbits
      (area_length - unsigned_last_nbits readidx 32) 32) by
    (rewrite Htail; apply unsigned_last_nbits_eq; lia).
  all: try rewrite Hrem.
  all: try rewrite Htail.
  all: try rewrite Hur.
  all: try (sep_apply_l_atomic
    (UCharArray.mixed_full_split_to_mixed_seg
      data_buffer readidx area_length physical ltac:(lia));
    sep_apply_l_atomic
      (UCharArray.full_split_to_seg
        out0 (area_length - readidx) output_capacity output_before ltac:(lia));
    cancel).
  all: entailer!.
  all: try exact Hlive.
  all: pose proof (CircularAreaInitializedSlice_nonwrap__read_copy_slices
    physical logical readidx area_length (area_length - readidx)
    ltac:(lia) ltac:(lia) ltac:(lia) ltac:(lia) Hphys Hlive) as Hslice.
  all: replace (readidx + (area_length - readidx)) with area_length in Hslice by lia.
  all: exact Hslice.
Qed.

Lemma proof_of_CircularAreaRead_entail_wit_5 : CircularAreaRead_entail_wit_5.
Proof.
  pre_process.
  pose proof PreH16 as Hstate.
  unfold CircularAreaLogicalState in PreH16.
  destruct PreH16 as
    [Harea [Hread [Hwrite [Hlog [Hphys [Hbyte [Hwriteeq [Hfull [Hnotfull Hlive]]]]]]]]].
  assert (Hdata_log : data_length <= Zlength logical) by
    (unfold CircularAreaActualReadLength in PreH7;
     destruct (Z_le_dec requested (Zlength logical));
     [rewrite Z.min_l in PreH7 by lia |
      rewrite Z.min_r in PreH7 by lia]; lia).
  assert (Hdown : 0 <= read_len_down <= readidx) by lia.
  split_pure_spatial.
  - sep_apply_l_atomic
      (UCharArray.mixed_seg_split_to_mixed_seg
        data_buffer 0 read_len_down readidx (sublist 0 readidx physical)
        ltac:(lia)).
    replace (read_len_down - 0) with read_len_down by lia.
    replace (readidx - 0) with readidx by lia.
    rewrite Zsublist_Zsublist00 by lia.
    rewrite Zsublist_Zsublist0 by lia.
    sep_apply_l_atomic
      (UCharArray.seg_split_to_seg
        out0 read_len_up data_length output_capacity
        (sublist read_len_up output_capacity output_before) ltac:(lia)).
    rewrite Zsublist_Zsublist by lia.
    rewrite Zsublist_Zsublist by lia.
    replace (0 + read_len_up) with read_len_up by lia.
    replace (data_length - read_len_up + read_len_up) with data_length by lia.
    replace (output_capacity - read_len_up + read_len_up) with output_capacity by lia.
    cancel.
  - split_pures.
    all: entailer!.
    all: try assumption.
    all: try lia.
    pose proof
      (CircularAreaInitializedSlice_wrap_head__read_copy_slices
        physical logical readidx area_length read_len_up read_len_down
        ltac:(lia) ltac:(lia) ltac:(lia) ltac:(lia) ltac:(lia)
        ltac:(lia) Hphys Hlive) as Hslice.
    replace (read_len_up + read_len_down) with data_length in Hslice by lia.
    exact Hslice.
Qed.

Lemma proof_of_CircularAreaRead_entail_wit_6_1 : CircularAreaRead_entail_wit_6_1.
Proof.
  aggressive_pre_process.
  all: unfold CircularAreaBackingResource.
  all: Intros_p Hback.
  all: destruct Hback as [Hca [Hbuf Hstate]].
  all: pose proof Hstate as Hstate_saved.
  all: unfold CircularAreaLogicalState in Hstate.
  all: destruct Hstate as
    [Harea [Hread [Hwrite [Hlog [Hphys [Hbyte [Hwriteeq [Hfull [Hnotfull Hlive]]]]]]]]].
  all: unfold CircularAreaDataLengthResult in PreH6, PreH10.
  all: assert (Hnonempty : 0 < Zlength logical) by
    (unfold CircularAreaEmptyResult in PreH13;
     destruct logical as [|x xs];
     [simpl in PreH13; lia |
      rewrite Zlength_cons; pose proof (Zlength_nonneg xs); lia]).
  all: unfold CircularAreaDivideRdDataResult in PreH3.
  all: destruct PreH3 as [[Hfit Hzero] | [Hwrap Hone]]; try lia.
  all: try (sep_apply_l_atomic
    (UCharArray.mixed_full_split_to_mixed_seg
      data_buffer readidx area_length physical ltac:(lia));
    sep_apply_l_atomic
      (UCharArray.mixed_seg_split_to_mixed_seg
        data_buffer readidx (readidx + retval) area_length
        (sublist readidx area_length physical) ltac:(lia));
    rewrite Zsublist_Zsublist by lia;
    rewrite Zsublist_Zsublist by lia;
    replace (0 + readidx) with readidx by lia;
    replace (readidx + retval - readidx + readidx)
      with (readidx + retval) by lia;
    replace (area_length - readidx + readidx) with area_length by lia;
    sep_apply_l_atomic
      (UCharArray.full_split_to_seg
        out0 retval output_capacity output_before ltac:(lia));
    cancel).
  all: entailer!.
  all: try exact Hlive.
  all: try exact Hstate_saved.
  all: try (unfold CircularAreaActualReadLength;
    rewrite Z.min_r by lia; lia).
  all: try lia.
  all: pose proof (CircularAreaInitializedSlice_nonwrap__read_copy_slices
    physical logical readidx area_length retval
    ltac:(lia) ltac:(lia) ltac:(lia) ltac:(lia) Hphys Hlive) as Hslice.
  all: exact Hslice.
Qed.

Lemma proof_of_CircularAreaRead_entail_wit_6_2 : CircularAreaRead_entail_wit_6_2.
Proof.
  aggressive_pre_process.
  all: unfold CircularAreaBackingResource.
  all: Intros_p Hback.
  all: destruct Hback as [Hca [Hbuf Hstate]].
  all: pose proof Hstate as Hstate_saved.
  all: unfold CircularAreaLogicalState in Hstate.
  all: destruct Hstate as
    [Harea [Hread [Hwrite [Hlog [Hphys [Hbyte [Hwriteeq [Hfull [Hnotfull Hlive]]]]]]]]].
  all: unfold CircularAreaDataLengthResult in PreH7.
  all: assert (Hlen : data_length_pre <= Zlength logical) by lia.
  all: unfold CircularAreaDivideRdDataResult in PreH3.
  all: destruct PreH3 as [[Hfit Hzero] | [Hwrap Hone]]; try lia.
  all: try (sep_apply_l_atomic
    (UCharArray.mixed_full_split_to_mixed_seg
      data_buffer readidx area_length physical ltac:(lia));
    sep_apply_l_atomic
      (UCharArray.mixed_seg_split_to_mixed_seg
        data_buffer readidx (readidx + data_length_pre) area_length
        (sublist readidx area_length physical) ltac:(lia));
    rewrite Zsublist_Zsublist by lia;
    rewrite Zsublist_Zsublist by lia;
    replace (0 + readidx) with readidx by lia;
    replace (readidx + data_length_pre - readidx + readidx)
      with (readidx + data_length_pre) by lia;
    replace (area_length - readidx + readidx) with area_length by lia;
    sep_apply_l_atomic
      (UCharArray.full_split_to_seg
        out0 data_length_pre output_capacity output_before ltac:(lia));
    cancel).
  all: entailer!.
  all: try exact Hlive.
  all: try exact Hstate_saved.
  all: try (unfold CircularAreaActualReadLength;
    rewrite Z.min_l by lia; reflexivity).
  all: try lia.
  all: pose proof (CircularAreaInitializedSlice_nonwrap__read_copy_slices
    physical logical readidx area_length data_length_pre
    ltac:(lia) ltac:(lia) ltac:(lia) ltac:(lia) Hphys Hlive) as Hslice.
  all: exact Hslice.
Qed.

Lemma proof_of_CircularAreaRead_return_wit_1 : CircularAreaRead_return_wit_1.
Proof.
  pre_process.
  Left.
  Exists data_length ((readidx + data_length) mod area_length)
    (sublist 0 data_length logical)
    (sublist data_length (Zlength logical) logical)
    ((sublist 0 data_length logical) ++
       (sublist data_length output_capacity output_before)).
  entailer!.
  - pose proof PreH15 as Hstate_bounds.
    unfold CircularAreaLogicalState in Hstate_bounds.
    destruct Hstate_bounds as
      (Harea & Hread & Hwrite & Hlogical & Hphysical & Hbytes &
       Hwriteidx & Hfull & Hnotfull & Hlive).
    destruct Harea as [Harea_pos Harea_max].
    destruct Hread as [Hread_nonneg Hread_lt].
    destruct Hlogical as [Hlogical_nonneg Hlogical_le].
    unfold CircularAreaActualReadLength in PreH7.
    pose proof (Z.le_min_r requested (Zlength logical)).
    assert (Hdata_logical : data_length <= Zlength logical) by lia.
    unfold CircularAreaDivideRdDataResult in PreH14.
    destruct PreH14 as [[Hnowrap Hzero] | [Hwrap Hone]]; try lia.
    assert (Hnewidx :
        (readidx + data_length) mod area_length = read_len_down).
    { symmetry.
      apply Z.mod_unique with (q := 1).
      - lia.
      - lia. }
    sep_apply (UCharArray.seg_merge_to_seg
      out0 0 read_len_up data_length); try lia.
    rewrite <- (sublist_split 0 data_length read_len_up logical) by lia.
    sep_apply (UCharArray.seg_merge_to_full
      out0 0 data_length output_capacity); try lia.
    sep_apply (UCharArray.mixed_seg_merge_to_mixed_seg
      data_buffer 0 read_len_down readidx); try lia.
    rewrite <- (sublist_split 0 readidx read_len_down physical) by lia.
    sep_apply (UCharArray.mixed_seg_merge_to_mixed_full
      data_buffer 0 readidx area_length); try lia.
    rewrite <- (sublist_split 0 area_length readidx physical) by lia.
    rewrite (sublist_self physical area_length) by lia.
    rewrite unsigned_last_nbits_eq.
    2:{ replace (2 ^ 8) with 256 by reflexivity. lia. }
    rewrite <- Hnewidx.
    unfold CircularAreaBackingResource.
    entailer!.
    + replace (data_buffer + 0 * sizeof(UCHAR)) with data_buffer by ring.
      replace (area_length - 0) with area_length by ring.
      replace (out0 + 0 * sizeof(UCHAR)) with out0 by ring.
      replace (output_capacity - 0) with output_capacity by ring.
      entailer!.
    + apply (CircularArea_consume_logical_state__read_postconditions
        readidx writeidx area_length b_status requested data_length logical physical);
        auto.
  - unfold CircularAreaReadSuccess, CircularAreaOutputAfterRead.
    unfold CircularAreaActualReadLength in *.
    repeat split; try assumption; try reflexivity.
    rewrite PreH7.
    apply Z.le_min_l.
    f_equal.
    rewrite Zlength_sublist0 by
      (split; [lia | rewrite PreH7; apply Z.le_min_r]).
    reflexivity.
Qed.

Lemma proof_of_CircularAreaRead_return_wit_2 : CircularAreaRead_return_wit_2.
Proof.
  pre_process.
  Left.
  Exists data_length ((readidx + data_length) mod area_length)
    (sublist 0 data_length logical)
    (sublist data_length (Zlength logical) logical)
    ((sublist 0 data_length logical) ++
       (sublist data_length output_capacity output_before)).
  entailer!.
  - pose proof PreH13 as Hstate_bounds.
    unfold CircularAreaLogicalState in Hstate_bounds.
    destruct Hstate_bounds as
      (Harea & Hread & Hwrite & Hlogical & Hphysical & Hbytes &
       Hwriteidx & Hfull & Hnotfull & Hlive).
    destruct Harea as [Harea_pos Harea_max].
    destruct Hread as [Hread_nonneg Hread_lt].
    destruct Hlogical as [Hlogical_nonneg Hlogical_le].
    unfold CircularAreaActualReadLength in PreH7.
    pose proof (Z.le_min_r requested (Zlength logical)).
    assert (Hdata_logical : data_length <= Zlength logical) by lia.
    sep_apply (UCharArray.seg_merge_to_full
      out0 0 data_length output_capacity); try lia.
    sep_apply (UCharArray.mixed_seg_merge_to_mixed_seg
      data_buffer 0 readidx (readidx + data_length)); try lia.
    rewrite <- (sublist_split 0 (readidx + data_length) readidx physical)
      by lia.
    sep_apply (UCharArray.mixed_seg_merge_to_mixed_full
      data_buffer 0 (readidx + data_length) area_length); try lia.
    rewrite <- (sublist_split 0 area_length (readidx + data_length) physical)
      by lia.
    rewrite (sublist_self physical area_length) by lia.
    rewrite Z.rem_mod_nonneg by lia.
    rewrite unsigned_last_nbits_eq.
    2:{ replace (2 ^ 8) with 256 by reflexivity.
        pose proof (Z.mod_pos_bound
          (readidx + data_length) area_length Harea_pos) as Hmod.
        split.
        - exact (proj1 Hmod).
        - eapply Z.lt_le_trans; [exact (proj2 Hmod) | exact Harea_max]. }
    unfold CircularAreaBackingResource.
    entailer!.
    + replace (data_buffer + 0 * sizeof(UCHAR)) with data_buffer by ring.
      replace (area_length - 0) with area_length by ring.
      replace (out0 + 0 * sizeof(UCHAR)) with out0 by ring.
      replace (output_capacity - 0) with output_capacity by ring.
      entailer!.
    + apply (CircularArea_consume_logical_state__read_postconditions
        readidx writeidx area_length b_status requested data_length logical physical);
        auto.
  - unfold CircularAreaReadSuccess, CircularAreaOutputAfterRead.
    unfold CircularAreaActualReadLength in *.
    repeat split; try assumption; try reflexivity.
    rewrite PreH7.
    apply Z.le_min_l.
    f_equal.
    rewrite Zlength_sublist0 by
      (split; [lia | rewrite PreH7; apply Z.le_min_r]).
    reflexivity.
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
  unfold CircularAreaBackingResource, CircularAreaLogicalState in *.
  entailer!.
Qed.

Lemma proof_of_CircularAreaRead_partial_solve_wit_4_pure : CircularAreaRead_partial_solve_wit_4_pure.
Proof.
  pre_process.
  unfold CircularAreaBackingResource, CircularAreaLogicalState,
    CircularAreaDataLengthResult in *.
  entailer!.
  all: lia.
Qed.

Lemma proof_of_CircularAreaRead_partial_solve_wit_5_pure : CircularAreaRead_partial_solve_wit_5_pure.
Proof.
  pre_process.
  unfold CircularAreaBackingResource, CircularAreaLogicalState,
    CircularAreaDataLengthResult in *.
  entailer!.
  all: lia.
Qed.

Lemma proof_of_CircularAreaRead_partial_solve_wit_6_pure : CircularAreaRead_partial_solve_wit_6_pure.
Proof.
  aggressive_pre_process.
  all: unfold CircularAreaActualReadLength in PreH16.
  all: assert (Hactualle : data_length <= Zlength logical) by
    (destruct (Z_le_dec requested (Zlength logical));
     [rewrite Z.min_l in PreH16 by lia |
      rewrite Z.min_r in PreH16 by lia]; lia).
  all: prop_apply_p
    (UCharArray.seg_Zlength out0 0 read_len_up
      (sublist 0 read_len_up output_before)).
  all: Intros_p Houtlen.
  all: entailer!.
  all: try rewrite <- PreH21.
  all: try lia.
  all: rewrite Zlength_sublist by lia.
  all: lia.
Qed.

Lemma proof_of_CircularAreaRead_partial_solve_wit_7_pure : CircularAreaRead_partial_solve_wit_7_pure.
Proof.
  aggressive_pre_process.
  all: unfold CircularAreaActualReadLength in PreH16.
  all: assert (Hactualle : data_length <= Zlength logical) by
    (destruct (Z_le_dec requested (Zlength logical));
     [rewrite Z.min_l in PreH16 by lia |
      rewrite Z.min_r in PreH16 by lia]; lia).
  all: prop_apply_p
    (UCharArray.seg_Zlength out0 read_len_up data_length
      (sublist read_len_up data_length output_before)).
  all: Intros_p Houtlen.
  all: entailer!.
  all: try rewrite <- PreH21.
  all: try lia.
  all: rewrite Zlength_sublist by lia.
  all: lia.
Qed.

Lemma proof_of_CircularAreaRead_partial_solve_wit_8_pure : CircularAreaRead_partial_solve_wit_8_pure.
Proof.
  aggressive_pre_process.
  all: unfold CircularAreaActualReadLength in PreH12.
  all: assert (Hactualle : data_length <= Zlength logical) by
    (destruct (Z_le_dec requested (Zlength logical));
     [rewrite Z.min_l in PreH12 by lia |
      rewrite Z.min_r in PreH12 by lia]; lia).
  all: prop_apply_p
    (UCharArray.seg_Zlength out0 0 data_length
      (sublist 0 data_length output_before)).
  all: Intros_p Houtlen.
  all: entailer!.
  all: try lia.
  all: rewrite Zlength_sublist by lia.
  all: lia.
Qed.
