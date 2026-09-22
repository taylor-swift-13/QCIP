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
  assert (Hresult : CircularAreaFullResult area_length logical 0).
  { eapply CircularArea_full_read_ne__query_state_results; eauto. }
  unfold CircularAreaBackingResource.
  entailer!.
Qed.

Lemma proof_of_CircularAreaIsFull_return_wit_2 : CircularAreaIsFull_return_wit_2.
Proof.
  pre_process.
  assert (Hresult : CircularAreaFullResult area_length logical 0).
  { eapply CircularArea_full_status_zero__query_state_results; eauto. }
  unfold CircularAreaBackingResource.
  entailer!.
Qed.

Lemma proof_of_CircularAreaIsFull_return_wit_3 : CircularAreaIsFull_return_wit_3.
Proof.
  pre_process.
  assert (Hresult : CircularAreaFullResult area_length logical 1).
  { eapply CircularArea_full_status_nonzero__query_state_results; eauto. }
  unfold CircularAreaBackingResource.
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
  assert (Hresult : CircularAreaEmptyResult logical 0).
  { eapply CircularArea_empty_read_ne__query_state_results; eauto. }
  unfold CircularAreaBackingResource.
  entailer!.
Qed.

Lemma proof_of_CircularAreaIsEmpty_return_wit_2 : CircularAreaIsEmpty_return_wit_2.
Proof.
  pre_process.
  assert (Hresult : CircularAreaEmptyResult logical 0).
  { eapply CircularArea_empty_status_nonzero__query_state_results; eauto. }
  unfold CircularAreaBackingResource.
  entailer!.
Qed.

Lemma proof_of_CircularAreaIsEmpty_return_wit_3 : CircularAreaIsEmpty_return_wit_3.
Proof.
  pre_process.
  assert (Hresult : CircularAreaEmptyResult logical 1).
  { eapply CircularArea_empty_status_zero_equal__query_state_results; eauto. }
  unfold CircularAreaBackingResource.
  entailer!.
Qed.

Lemma proof_of_CircularAreaGetDataLength_safety_wit_4 : CircularAreaGetDataLength_safety_wit_4.
Proof.
  pre_process.
  entailer!.
  all: unfold CircularAreaLogicalState in PreH4; lia.
Qed.

Lemma proof_of_CircularAreaGetDataLength_safety_wit_5 : CircularAreaGetDataLength_safety_wit_5.
Proof.
  pre_process.
  entailer!.
  all: unfold CircularAreaLogicalState in PreH4; lia.
Qed.

Lemma proof_of_CircularAreaGetDataLength_entail_wit_1 : CircularAreaGetDataLength_entail_wit_1.
Proof.
  pre_process.
  unfold CircularAreaBackingResource.
  Intros_p Hback.
  subst circular_area_pre.
  unfold CircularAreaFullResult in PreH3.
  destruct (Z.eq_dec (Zlength logical) area_length); [|lia].
  entailer!.
Qed.

Lemma proof_of_CircularAreaGetDataLength_entail_wit_2 : CircularAreaGetDataLength_entail_wit_2.
Proof.
  pre_process.
  unfold CircularAreaBackingResource.
  Intros_p Hback.
  subst circular_area_pre.
  unfold CircularAreaFullResult in PreH3.
  destruct (Z.eq_dec (Zlength logical) area_length); [lia|].
  entailer!.
  unfold CircularAreaLogicalState in Hback.
  lia.
Qed.

Lemma proof_of_CircularAreaGetDataLength_return_wit_1 : CircularAreaGetDataLength_return_wit_1.
Proof.
  pre_process.
  unfold CircularAreaDataLengthResult, CircularAreaBackingResource.
  entailer!.
  pose proof PreH4 as Hstate.
  unfold CircularAreaLogicalState in Hstate.
  destruct Hstate as
    [Harea [Hread [Hwrite [Hlength [_ [_ [Hwriteeq _]]]]]]].
  rewrite unsigned_unsigned_add_l by lia.
  rewrite unsigned_last_nbits_eq by lia.
  eapply CircularArea_data_length_mod__length_and_divide_results; eauto; lia.
Qed.

Lemma proof_of_CircularAreaGetDataLength_return_wit_2 : CircularAreaGetDataLength_return_wit_2.
Proof.
  pre_process.
  unfold CircularAreaDataLengthResult, CircularAreaBackingResource.
  entailer!.
Qed.

Lemma proof_of_CircularAreaDivideRdData_entail_wit_1 : CircularAreaDivideRdData_entail_wit_1.
Proof.
  pre_process.
  unfold CircularAreaBackingResource.
  Intros_p Hback.
  subst circular_area_pre data_length_pre.
  entailer!.
Qed.

Lemma proof_of_CircularAreaDivideRdData_return_wit_1 : CircularAreaDivideRdData_return_wit_1.
Proof.
  pre_process.
  unfold CircularAreaDivideRdDataResult, CircularAreaBackingResource.
  entailer!.
  pose proof PreH8 as Hstate.
  unfold CircularAreaLogicalState in Hstate.
  destruct Hstate as [Harea [Hread _]].
  replace (unsigned_last_nbits readidx 32) with readidx in PreH1.
  2: { symmetry; apply unsigned_last_nbits_eq; lia. }
  replace (unsigned_last_nbits (readidx + d0) 32) with (readidx + d0) in PreH1.
  2: { symmetry; apply unsigned_last_nbits_eq; lia. }
  right; lia.
Qed.

Lemma proof_of_CircularAreaDivideRdData_return_wit_2 : CircularAreaDivideRdData_return_wit_2.
Proof.
  pre_process.
  unfold CircularAreaDivideRdDataResult, CircularAreaBackingResource.
  entailer!.
  pose proof PreH8 as Hstate.
  unfold CircularAreaLogicalState in Hstate.
  destruct Hstate as [Harea [Hread _]].
  replace (unsigned_last_nbits readidx 32) with readidx in PreH1.
  2: { symmetry; apply unsigned_last_nbits_eq; lia. }
  replace (unsigned_last_nbits (readidx + d0) 32) with (readidx + d0) in PreH1.
  2: { symmetry; apply unsigned_last_nbits_eq; lia. }
  left; lia.
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
  all: pose proof (CircularArea_empty_result_zero_length_pos__read_call_normalization
    logical retval_2 PreH13 PreH27) as Hlogical_pos.
  all: unfold CircularAreaBackingResource; entailer!.
  all: unfold CircularAreaDivideRdDataResult, CircularAreaDataLengthResult,
    CircularAreaActualReadLength in *.
  all: try lia; try tauto.
Qed.

Lemma proof_of_CircularAreaRead_entail_wit_3_2 : CircularAreaRead_entail_wit_3_2.
Proof.
  aggressive_pre_process.
  all: unfold CircularAreaBackingResource; entailer!.
  all: unfold CircularAreaDivideRdDataResult, CircularAreaDataLengthResult,
    CircularAreaActualReadLength in *.
  all: try lia; try tauto.
Qed.

Lemma proof_of_CircularAreaRead_entail_wit_4 : CircularAreaRead_entail_wit_4.
Proof.
  aggressive_pre_process.
  all: unfold CircularAreaLogicalState in PreH10;
    destruct PreH10 as
      (Harea & Hread & Hwrite & Hlogical & Hphysical & Hbytes & Hwriteidx &
       Hstatus & Hfull & Hempty & Hlive).
  all: unfold CircularAreaDivideRdDataResult in PreH9.
  all: unfold CircularAreaActualReadLength in PreH6.
  all: lastnbits_eq.
  all: try (entailer!; try lia).
  - sep_apply_l_atomic
      (UCharArray.mixed_full_split_to_mixed_seg
        data_buffer readidx area_length physical).
    + entailer!; lia.
    + sep_apply_l_atomic
        (UCharArray.mixed_full_split_to_mixed_seg
          out0 (area_length - readidx) output_capacity output_before).
      * entailer!; lia.
      * cancel.
  - assert (Hs : CircularAreaInitializedSlice physical readidx
        (readidx + (area_length - readidx))
        (sublist 0 (area_length - readidx) logical)).
    { eapply (CircularAreaInitializedSlice_nonwrap__read_copy_slices
        physical logical readidx area_length (area_length - readidx)).
      - lia.
      - lia.
      - lia.
      - pose proof (Z.le_min_r requested (Zlength logical)); lia.
      - exact Hphysical.
      - exact Hlive. }
    replace (readidx + (area_length - readidx)) with area_length in Hs by lia.
    exact Hs.
Qed.

Lemma proof_of_CircularAreaRead_entail_wit_5 : CircularAreaRead_entail_wit_5.
Proof.
  pre_process.
  pose proof PreH16 as Hstate.
  unfold CircularAreaLogicalState in PreH16.
  destruct PreH16 as
    (Harea & Hread & Hwrite & Hlogical & Hphysical & Hbytes & Hwriteidx &
     Hstatus & Hfull & Hempty & Hlive).
  unfold CircularAreaDivideRdDataResult in PreH15.
  unfold CircularAreaActualReadLength in PreH7.
  split_pure_spatial.
  - sep_apply_l_atomic
      (UCharArray.mixed_seg_split_to_mixed_seg data_buffer 0 read_len_down
        readidx (sublist 0 readidx physical)).
    + entailer!; lia.
    + sep_apply_l_atomic
        (UCharArray.mixed_seg_split_to_mixed_seg out0 read_len_up data_length
          output_capacity (sublist read_len_up output_capacity output_before)).
      * entailer!; lia.
      * replace (read_len_down - 0) with read_len_down by lia.
        replace (readidx - 0) with readidx by lia.
        replace (data_length - read_len_up) with read_len_down by lia.
        entailer!.
        rewrite Zsublist_Zsublist00 by lia.
        rewrite Zsublist_Zsublist0 by lia.
        rewrite Zsublist_Zsublist by lia.
        rewrite Zsublist_Zsublist by lia.
        replace (0 + read_len_up) with read_len_up by lia.
        replace (read_len_down + read_len_up) with data_length by lia.
        replace (output_capacity - read_len_up + read_len_up)
          with output_capacity by lia.
        cancel.
  - entailer!.
    + assert (Hs : CircularAreaInitializedSlice physical 0 read_len_down
          (sublist read_len_up (read_len_up + read_len_down) logical)).
      { eapply (CircularAreaInitializedSlice_wrap_head__read_copy_slices
          physical logical readidx area_length read_len_up read_len_down);
          eauto; try lia. }
      replace (read_len_up + read_len_down) with data_length in Hs by lia.
      exact Hs.
Qed.

Lemma proof_of_CircularAreaRead_entail_wit_6_1 : CircularAreaRead_entail_wit_6_1.
Proof.
  aggressive_pre_process.
  all: unfold CircularAreaBackingResource; entailer!.
  all: unfold CircularAreaDivideRdDataResult, CircularAreaDataLengthResult,
    CircularAreaActualReadLength in *.
  all: pose proof (CircularArea_empty_result_zero_length_pos__read_call_normalization
    logical retval_2 PreH13 PreH27) as Hlogical_pos.
  all: destruct H as (_ & _ & Hstate);
    unfold CircularAreaLogicalState in Hstate;
    destruct Hstate as
      (Harea & Hread & Hwrite & Hlogical & Hphysical & Hbytes & Hwriteidx &
       Hstatus & Hfull & Hempty & Hlive).
  all: try lia; try tauto.
  - sep_apply_l_atomic
      (UCharArray.mixed_full_split_to_mixed_seg
        data_buffer readidx area_length physical).
    + entailer!; lia.
    + sep_apply_l_atomic
        (UCharArray.mixed_seg_split_to_mixed_seg data_buffer readidx
          (readidx + retval) area_length (sublist readidx area_length physical)).
      * entailer!; lia.
      * sep_apply_l_atomic
          (UCharArray.mixed_full_split_to_mixed_seg
            out0 retval output_capacity output_before).
        -- entailer!; lia.
        -- entailer!.
           rewrite Zsublist_Zsublist by lia.
           rewrite Zsublist_Zsublist by lia.
           replace (0 + readidx) with readidx by lia.
           replace (retval + readidx) with (readidx + retval) by lia.
           replace (area_length - readidx + readidx) with area_length by lia.
           replace (readidx + retval - readidx + readidx)
             with (readidx + retval) by lia.
           cancel.
  - eapply (CircularAreaInitializedSlice_nonwrap__read_copy_slices
      physical logical readidx area_length retval); eauto; lia.
Qed.

Lemma proof_of_CircularAreaRead_entail_wit_6_2 : CircularAreaRead_entail_wit_6_2.
Proof.
  aggressive_pre_process.
  all: unfold CircularAreaBackingResource; entailer!.
  all: unfold CircularAreaDivideRdDataResult, CircularAreaDataLengthResult,
    CircularAreaActualReadLength in *.
  all: destruct H as (_ & _ & Hstate);
    unfold CircularAreaLogicalState in Hstate;
    destruct Hstate as
      (Harea & Hread & Hwrite & Hlogical & Hphysical & Hbytes & Hwriteidx &
       Hstatus & Hfull & Hempty & Hlive).
  all: try lia; try tauto.
  - sep_apply_l_atomic
      (UCharArray.mixed_full_split_to_mixed_seg
        data_buffer readidx area_length physical).
    + entailer!; lia.
    + sep_apply_l_atomic
        (UCharArray.mixed_seg_split_to_mixed_seg data_buffer readidx
          (readidx + data_length_pre) area_length
          (sublist readidx area_length physical)).
      * entailer!; lia.
      * sep_apply_l_atomic
          (UCharArray.mixed_full_split_to_mixed_seg
            out0 data_length_pre output_capacity output_before).
        -- entailer!; lia.
        -- entailer!.
           rewrite Zsublist_Zsublist by lia.
           rewrite Zsublist_Zsublist by lia.
           replace (0 + readidx) with readidx by lia.
           replace (data_length_pre + readidx)
             with (readidx + data_length_pre) by lia.
           replace (area_length - readidx + readidx) with area_length by lia.
           replace (readidx + data_length_pre - readidx + readidx)
             with (readidx + data_length_pre) by lia.
           cancel.
  - eapply (CircularAreaInitializedSlice_nonwrap__read_copy_slices
      physical logical readidx area_length data_length_pre); eauto; lia.
Qed.

Lemma proof_of_CircularAreaRead_return_wit_1 : CircularAreaRead_return_wit_1.
Proof.
  pre_process.
  Left.
  Exists data_length read_len_down
    (sublist 0 data_length logical)
    (sublist data_length (Zlength logical) logical)
    (CircularAreaSomeBytes (sublist 0 data_length logical) ++
     sublist data_length output_capacity output_before).
  pose proof PreH7 as Hactual.
  pose proof PreH15 as Hstate.
  unfold CircularAreaLogicalState in Hstate.
  destruct Hstate as
    (Harea & Hread & Hwrite & Hlogical & Hphysical & Hbytes & Hwriteidx &
     Hstatus & Hfull & Hempty & Hlive).
  unfold CircularAreaDivideRdDataResult in PreH14.
  destruct PreH14 as [[Hnowrap Hbad] | [Hwrap Hone]].
  { int_auto. }
  assert (Hdata_le : data_length <= Zlength logical).
  { unfold CircularAreaActualReadLength in Hactual.
    rewrite Hactual. apply Z.le_min_r. }
  assert (Hdownmod :
    (readidx + data_length) mod area_length = read_len_down).
  { symmetry. apply Z.mod_unique with (q := 1); int_auto. }
  split_pure_spatial.
  - sep_apply (UCharArray.mixed_seg_merge_to_mixed_seg
      data_buffer 0 read_len_down readidx).
    2: int_auto.
    sep_apply (UCharArray.mixed_seg_merge_to_mixed_full
      data_buffer 0 readidx area_length).
    2: int_auto.
    sep_apply (UCharArray.mixed_seg_merge_to_mixed_seg
      out0 0 read_len_up data_length).
    2: int_auto.
    sep_apply (UCharArray.mixed_seg_merge_to_mixed_full
      out0 0 data_length output_capacity).
    2: int_auto.
    assert (Hphysical_decomp :
      (sublist 0 read_len_down physical ++
       sublist read_len_down readidx physical) ++
      sublist readidx area_length physical = physical).
    { rewrite <- (sublist_split 0 readidx read_len_down physical)
        by int_auto.
      rewrite <- (sublist_split 0 area_length readidx physical)
        by int_auto.
      apply sublist_self.
      symmetry. exact Hphysical. }
    assert (Houtput_decomp :
      CircularAreaSomeBytes (sublist 0 read_len_up logical) ++
      CircularAreaSomeBytes (sublist read_len_up data_length logical) =
      CircularAreaSomeBytes (sublist 0 data_length logical)).
    { unfold CircularAreaSomeBytes.
      rewrite <- map_app.
      f_equal.
      symmetry.
      apply sublist_split; int_auto. }
    assert (Hdownbyte : 0 <= read_len_down < 2 ^ 8).
    { simpl. int_auto. }
    unfold CircularAreaBackingResource.
    rewrite (unsigned_last_nbits_eq read_len_down 8 Hdownbyte).
    rewrite Hphysical_decomp, Houtput_decomp.
    replace (out0 + 0 * sizeof(UCHAR)) with out0 by int_auto.
    replace (output_capacity - 0) with output_capacity by int_auto.
    replace (data_buffer + 0 * sizeof(UCHAR)) with data_buffer by int_auto.
    replace (area_length - 0) with area_length by int_auto.
    entailer!.
    rewrite <- Hdownmod.
    apply (CircularArea_consume_logical_state__read_postconditions
      readidx writeidx area_length b_status requested data_length logical
      physical); assumption.
  - unfold CircularAreaReadSuccess, CircularAreaOutputAfterRead.
    unfold CircularAreaActualReadLength in Hactual.
    entailer!.
    rewrite Zlength_sublist by int_auto.
    replace (data_length - 0) with data_length by int_auto.
    reflexivity.
Qed.

Lemma proof_of_CircularAreaRead_return_wit_2 : CircularAreaRead_return_wit_2.
Proof.
  pre_process.
  Left.
  Exists data_length
    ((readidx + data_length) mod area_length)
    (sublist 0 data_length logical)
    (sublist data_length (Zlength logical) logical)
    (CircularAreaSomeBytes (sublist 0 data_length logical) ++
     sublist data_length output_capacity output_before).
  pose proof PreH7 as Hactual.
  pose proof PreH13 as Hstate.
  unfold CircularAreaLogicalState in Hstate.
  destruct Hstate as
    (Harea & Hread & Hwrite & Hlogical & Hphysical & Hbytes & Hwriteidx &
     Hstatus & Hfull & Hempty & Hlive).
  split_pure_spatial.
  - sep_apply (UCharArray.mixed_seg_merge_to_mixed_seg
      data_buffer 0 readidx (readidx + data_length)).
    2: int_auto.
    sep_apply (UCharArray.mixed_seg_merge_to_mixed_full
      data_buffer 0 (readidx + data_length) area_length).
    2: int_auto.
    sep_apply (UCharArray.mixed_seg_merge_to_mixed_full
      out0 0 data_length output_capacity).
    2: int_auto.
    assert (Hmod :
      0 <= (readidx + data_length) mod area_length < area_length).
    { apply Z.mod_pos_bound. int_auto. }
    assert (Hphysical_decomp :
      (sublist 0 readidx physical ++
       sublist readidx (readidx + data_length) physical) ++
      sublist (readidx + data_length) area_length physical = physical).
    { rewrite <- (sublist_split 0 (readidx + data_length) readidx physical)
        by int_auto.
      rewrite <- (sublist_split 0 area_length
        (readidx + data_length) physical) by int_auto.
      apply sublist_self.
      symmetry. exact Hphysical. }
    assert (Hbyte :
      0 <= (readidx + data_length) mod area_length < 2 ^ 8).
    { simpl. int_auto. }
    unfold CircularAreaBackingResource.
    rewrite Z.rem_mod_nonneg by int_auto.
    rewrite (unsigned_last_nbits_eq
      ((readidx + data_length) mod area_length) 8 Hbyte).
    rewrite Hphysical_decomp.
    replace (out0 + 0 * sizeof(UCHAR)) with out0 by int_auto.
    replace (output_capacity - 0) with output_capacity by int_auto.
    replace (data_buffer + 0 * sizeof(UCHAR)) with data_buffer by int_auto.
    replace (area_length - 0) with area_length by int_auto.
    entailer!.
    apply (CircularArea_consume_logical_state__read_postconditions
      readidx writeidx area_length b_status requested data_length logical
      physical); assumption.
  - unfold CircularAreaReadSuccess, CircularAreaOutputAfterRead.
    unfold CircularAreaActualReadLength in Hactual.
    assert (Hdata_le : data_length <= Zlength logical).
    { rewrite Hactual. apply Z.le_min_r. }
    entailer!.
    rewrite Zlength_sublist by int_auto.
    replace (data_length - 0) with data_length by int_auto.
    reflexivity.
Qed.

Lemma proof_of_CircularAreaRead_return_wit_3 : CircularAreaRead_return_wit_3.
Proof.
  pre_process.
Qed.

Lemma proof_of_CircularAreaRead_return_wit_4 : CircularAreaRead_return_wit_4.
Proof.
  pre_process.
  Left.
  unfold CircularAreaErrorResult.
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
  Intros_p Hbacking.
  entailer!.
Qed.

Lemma proof_of_CircularAreaRead_partial_solve_wit_4_pure : CircularAreaRead_partial_solve_wit_4_pure.
Proof.
  aggressive_pre_process.
  all: unfold CircularAreaBackingResource; entailer!.
  all: unfold CircularAreaDataLengthResult in *.
  all: unfold CircularAreaLogicalState in *.
  all: destruct logical; simpl in *; lia.
Qed.

Lemma proof_of_CircularAreaRead_partial_solve_wit_5_pure : CircularAreaRead_partial_solve_wit_5_pure.
Proof.
  aggressive_pre_process.
  all: unfold CircularAreaBackingResource; entailer!.
  all: unfold CircularAreaDataLengthResult in *.
  all: unfold CircularAreaLogicalState in *.
  all: destruct logical; simpl in *; lia.
Qed.

Lemma proof_of_CircularAreaRead_partial_solve_wit_6_pure : CircularAreaRead_partial_solve_wit_6_pure.
Proof.
  aggressive_pre_process.
  all: unfold CircularAreaLogicalState in PreH25.
  all: unfold CircularAreaActualReadLength in PreH16.
  all: destruct PreH25 as (Harea & Hread & Hwrite & Hlogical & Hphysical & Hrest).
  all: prop_apply (UCharArray.mixed_seg_Zlength out0 0 read_len_up
      (sublist 0 read_len_up output_before)); Intros.
  all: try entailer!.
  all: rewrite <- PreH21.
  all: try lia.
  all: pose proof (Z.le_min_r requested (Zlength logical)) as Hmin.
  all: rewrite Zlength_sublist by lia.
  all: lia.
Qed.

Lemma proof_of_CircularAreaRead_partial_solve_wit_7_pure : CircularAreaRead_partial_solve_wit_7_pure.
Proof.
  aggressive_pre_process.
  all: unfold CircularAreaLogicalState in PreH24.
  all: unfold CircularAreaActualReadLength in PreH16.
  all: destruct PreH24 as (Harea & Hread & Hwrite & Hlogical & Hphysical & Hrest).
  all: prop_apply (UCharArray.mixed_seg_Zlength out0 read_len_up data_length
      (sublist read_len_up data_length output_before)); Intros.
  all: try entailer!.
  all: rewrite <- PreH21.
  all: try lia.
  all: pose proof (Z.le_min_r requested (Zlength logical)) as Hmin.
  all: rewrite Zlength_sublist by lia.
  all: lia.
Qed.

Lemma proof_of_CircularAreaRead_partial_solve_wit_8_pure : CircularAreaRead_partial_solve_wit_8_pure.
Proof.
  aggressive_pre_process.
  all: unfold CircularAreaLogicalState in PreH18.
  all: unfold CircularAreaActualReadLength in PreH12.
  all: destruct PreH18 as (Harea & Hread & Hwrite & Hlogical & Hphysical & Hrest).
  all: prop_apply (UCharArray.mixed_seg_Zlength out0 0 data_length
      (sublist 0 data_length output_before)); Intros.
  all: try entailer!.
  all: pose proof (Z.le_min_r requested (Zlength logical)) as Hmin.
  all: rewrite Zlength_sublist by lia.
  all: lia.
Qed.
