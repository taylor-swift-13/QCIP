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

Lemma proof_of_CircularAreaIsFull_return_wit_1 : CircularAreaIsFull_return_wit_1.
Proof.
  pre_process.
  unfold CircularAreaIsFullResult.
  entailer!.
Qed.

Lemma proof_of_CircularAreaIsFull_return_wit_2 : CircularAreaIsFull_return_wit_2.
Proof.
  pre_process.
  unfold CircularAreaIsFullResult.
  entailer!.
Qed.

Lemma proof_of_CircularAreaIsFull_return_wit_3 : CircularAreaIsFull_return_wit_3.
Proof.
  pre_process.
  unfold CircularAreaIsFullResult.
  entailer!.
Qed.

Lemma proof_of_CircularAreaIsEmpty_return_wit_1 : CircularAreaIsEmpty_return_wit_1.
Proof.
  pre_process.
  unfold CircularAreaEmptyResult.
  entailer!.
Qed.

Lemma proof_of_CircularAreaIsEmpty_return_wit_2 : CircularAreaIsEmpty_return_wit_2.
Proof.
  pre_process.
  unfold CircularAreaEmptyResult.
  entailer!.
Qed.

Lemma proof_of_CircularAreaIsEmpty_return_wit_3 : CircularAreaIsEmpty_return_wit_3.
Proof.
  pre_process.
  unfold CircularAreaEmptyResult.
  entailer!.
Qed.

Lemma proof_of_CircularAreaGetDataLength_safety_wit_4 : CircularAreaGetDataLength_safety_wit_4.
Proof.
  pre_process.
  unfold CircularAreaDescriptorState in PreH9.
  entailer!.
Qed.

Lemma proof_of_CircularAreaGetDataLength_safety_wit_5 : CircularAreaGetDataLength_safety_wit_5.
Proof.
  pre_process.
  unfold CircularAreaDescriptorState in PreH9.
  entailer!.
Qed.

Lemma proof_of_CircularAreaGetDataLength_return_wit_1 : CircularAreaGetDataLength_return_wit_1.
Proof.
  pre_process.
  unfold CircularAreaDataLengthResult.
  unfold CircularAreaIsFullResult in PreH1.
  destruct PreH1 as [[? [? ?]] | [? ?]].
  - lia.
  - entailer!.
Qed.

Lemma proof_of_CircularAreaGetDataLength_return_wit_2 : CircularAreaGetDataLength_return_wit_2.
Proof.
  pre_process.
  unfold CircularAreaDataLengthResult.
  unfold CircularAreaIsFullResult in PreH1.
  destruct PreH1 as [[? [? ?]] | [? ?]].
  - entailer!.
  - lia.
Qed.

Lemma proof_of_CircularAreaDivideRdData_return_wit_1 : CircularAreaDivideRdData_return_wit_1.
Proof.
  pre_process.
  unfold CircularAreaDivideRdDataResult.
  unfold CircularAreaDescriptorState in PreH9.
  destruct PreH9 as [Hread [Hwrite [Harea [Hstatus Hbuffer]]]].
  rewrite (unsigned_last_nbits_eq readidx 32) in PreH1 by lia.
  rewrite (unsigned_last_nbits_eq (readidx + data_length_pre) 32) in PreH1 by lia.
  entailer!.
  unfold CircularAreaDescriptorState; tauto.
Qed.

Lemma proof_of_CircularAreaDivideRdData_return_wit_2 : CircularAreaDivideRdData_return_wit_2.
Proof.
  pre_process.
  unfold CircularAreaDivideRdDataResult.
  unfold CircularAreaDescriptorState in PreH9.
  destruct PreH9 as [Hread [Hwrite [Harea [Hstatus Hbuffer]]]].
  rewrite (unsigned_last_nbits_eq readidx 32) in PreH1 by lia.
  rewrite (unsigned_last_nbits_eq (readidx + data_length_pre) 32) in PreH1 by lia.
  entailer!.
  unfold CircularAreaDescriptorState; tauto.
Qed.

Lemma proof_of_CircularAreaRead_entail_wit_2 : CircularAreaRead_entail_wit_2.
Proof.
  pre_process.
  subst.
  unfold CircularAreaEmptyResult in *.
  destruct PreH1 as [[? [? ?]] | [[? | ?] ?]];
    try contradiction; try lia.
  entailer!.
Qed.

Lemma proof_of_CircularAreaRead_entail_wit_3_1 : CircularAreaRead_entail_wit_3_1.
Proof.
  pre_process.
  subst.
  unfold CircularAreaDescriptorState in *.
  assert (Hdivide : area_length < readidx + requested).
  { unfold CircularAreaDivideRdDataResult in PreH1.
    destruct PreH1 as [[? ?] | [? ?]]; lia. }
  assert (Hactual : CircularAreaActualReadLength
    readidx writeidx area_length b_status requested requested).
  { exists retval_2. split; [exact PreH6|].
    rewrite Z.min_l; lia. }
  assert (Hread : unsigned_last_nbits readidx 32 = readidx).
  { apply unsigned_last_nbits_eq; lia. }
  assert (Hup : unsigned_last_nbits (area_length - readidx) 32 =
    area_length - readidx).
  { apply unsigned_last_nbits_eq; lia. }
  assert (Hdown : unsigned_last_nbits
    (requested - (area_length - readidx)) 32 =
    requested - (area_length - readidx)).
  { apply unsigned_last_nbits_eq; lia. }
  rewrite Hread, Hup, Hdown.
  sep_apply
    (UCharArray.full_split_to_seg data_buffer readidx area_length buffer_contents).
  sep_apply
    (UCharArray.full_split_to_seg out0 (area_length - readidx)
      output_capacity output_before).
  entailer!.
  all: try unfold CircularAreaDivideRdDataResult;
    try rewrite sizeof_uchar; try lia; eauto.
Qed.

Lemma proof_of_CircularAreaRead_entail_wit_3_2 : CircularAreaRead_entail_wit_3_2.
Proof.
  pre_process.
  subst.
  unfold CircularAreaDescriptorState in *.
  assert (Heq : retval = retval_3) by
    (eapply circular_area_data_length_functional__read_preparation_and_memcpy;
     eauto).
  subst retval_3.
  pose proof
    (circular_area_data_length_bounds__read_preparation_and_memcpy
       readidx writeidx area_length b_status buffer_contents retval
       PreH4 PreH5) as Hretval_bounds.
  assert (Hdivide : area_length < readidx + retval).
  { unfold CircularAreaDivideRdDataResult in PreH1.
    destruct PreH1 as [[? ?] | [? ?]]; lia. }
  assert (Hactual : CircularAreaActualReadLength
    readidx writeidx area_length b_status requested retval).
  { exists retval. split; [exact PreH5|].
    rewrite Z.min_r; lia. }
  assert (Hread : unsigned_last_nbits readidx 32 = readidx).
  { apply unsigned_last_nbits_eq; lia. }
  assert (Hup : unsigned_last_nbits (area_length - readidx) 32 =
    area_length - readidx).
  { apply unsigned_last_nbits_eq; lia. }
  assert (Hdown : unsigned_last_nbits
    (retval - (area_length - readidx)) 32 =
    retval - (area_length - readidx)).
  { apply unsigned_last_nbits_eq; lia. }
  rewrite Hread, Hup, Hdown.
  sep_apply
    (UCharArray.full_split_to_seg data_buffer readidx area_length buffer_contents).
  sep_apply
    (UCharArray.full_split_to_seg out0 (area_length - readidx)
      output_capacity output_before).
  entailer!.
  all: try unfold CircularAreaDivideRdDataResult;
    try rewrite sizeof_uchar; try lia; eauto.
Qed.

Lemma proof_of_CircularAreaRead_entail_wit_4 : CircularAreaRead_entail_wit_4.
Proof.
  pre_process.
  subst.
  pose proof
    (circular_area_actual_read_bounds__read_preparation_and_memcpy
       readidx writeidx area_length b_status buffer_contents requested
       data_length ltac:(lia) PreH17 PreH6) as Hactual_bounds.
  unfold CircularAreaDescriptorState in *.
  unfold CircularAreaDivideRdDataResult in PreH14.
  destruct PreH14 as [[? ?] | [? ?]]; try lia.
  sep_apply (UCharArray.seg_split_to_seg data_buffer 0
    (data_length - (area_length - readidx)) readidx
    (sublist 0 readidx buffer_contents)); try lia.
  sep_apply (UCharArray.seg_split_to_seg out0 (area_length - readidx)
    data_length output_capacity
    (sublist (area_length - readidx) output_capacity output_before)); try lia.
  repeat rewrite Zsublist_Zsublist by lia.
  replace (0 + (area_length - readidx)) with (area_length - readidx) by lia.
  replace (data_length - (area_length - readidx) + (area_length - readidx))
    with data_length by lia.
  replace (output_capacity - (area_length - readidx) +
    (area_length - readidx)) with output_capacity by lia.
  replace (0 + 0) with 0 by lia.
  replace (data_length - (area_length - readidx) - 0 + 0)
    with (data_length - (area_length - readidx)) by lia.
  replace (readidx - 0 + 0) with readidx by lia.
  entailer!.
  unfold CircularAreaDivideRdDataResult.
  right; lia.
Qed.

Lemma proof_of_CircularAreaRead_entail_wit_5_1 : CircularAreaRead_entail_wit_5_1.
Proof.
  pre_process.
  subst.
  unfold CircularAreaDescriptorState in *.
  unfold CircularAreaDivideRdDataResult in PreH1.
  destruct PreH1 as [[? ?] | [? ?]]; try lia.
  assert (Hactual : CircularAreaActualReadLength readidx writeidx area_length
    b_status requested requested).
  { exists retval_2. split; [exact PreH6|]. rewrite Z.min_l; lia. }
  sep_apply (UCharArray.full_split_to_seg data_buffer readidx area_length
    buffer_contents); try lia.
  sep_apply (UCharArray.seg_split_to_seg data_buffer readidx
    (readidx + requested) area_length
    (sublist readidx area_length buffer_contents)); try lia.
  sep_apply (UCharArray.full_split_to_seg out0 requested output_capacity
    output_before); try lia.
  repeat rewrite Zsublist_Zsublist by lia.
  repeat match goal with
    | |- context [0 + ?x] => replace (0 + x) with x by lia
    | |- context [?x - 0] => replace (x - 0) with x by lia
    end.
  replace (readidx + requested - readidx + readidx)
    with (readidx + requested) by lia.
  replace (area_length - readidx + readidx) with area_length by lia.
  entailer!.
  unfold CircularAreaDivideRdDataResult.
  left; lia.
Qed.

Lemma proof_of_CircularAreaRead_entail_wit_5_2 : CircularAreaRead_entail_wit_5_2.
Proof.
  pre_process.
  subst.
  assert (Heq : retval = retval_3) by
    (eapply circular_area_data_length_functional__read_preparation_and_memcpy;
     eauto).
  subst retval_3.
  pose proof
    (circular_area_data_length_bounds__read_preparation_and_memcpy
       readidx writeidx area_length b_status buffer_contents retval
       PreH4 PreH5) as Hretval_bounds.
  pose proof
    (circular_area_data_length_positive__read_preparation_and_memcpy
       readidx writeidx area_length b_status buffer_contents retval
       PreH4 PreH14 PreH5) as Hretval_positive.
  unfold CircularAreaDescriptorState in *.
  unfold CircularAreaDivideRdDataResult in PreH1.
  destruct PreH1 as [[? ?] | [? ?]]; try lia.
  assert (Hactual : CircularAreaActualReadLength readidx writeidx area_length
    b_status requested retval).
  { exists retval. split; [exact PreH5|]. rewrite Z.min_r; lia. }
  sep_apply (UCharArray.full_split_to_seg data_buffer readidx area_length
    buffer_contents); try lia.
  sep_apply (UCharArray.seg_split_to_seg data_buffer readidx
    (readidx + retval) area_length
    (sublist readidx area_length buffer_contents)); try lia.
  sep_apply (UCharArray.full_split_to_seg out0 retval output_capacity
    output_before); try lia.
  repeat rewrite Zsublist_Zsublist by lia.
  repeat match goal with
    | |- context [0 + ?x] => replace (0 + x) with x by lia
    | |- context [?x - 0] => replace (x - 0) with x by lia
    end.
  replace (readidx + retval - readidx + readidx)
    with (readidx + retval) by lia.
  replace (area_length - readidx + readidx) with area_length by lia.
  entailer!.
  unfold CircularAreaDivideRdDataResult.
  left; lia.
Qed.

Lemma proof_of_CircularAreaRead_return_wit_1 : CircularAreaRead_return_wit_1.
Proof.
  pre_process.
  unfold CircularAreaDescriptorState in PreH16.
  destruct PreH16 as [Hreadidx [Hwriteidx [Harea [Hbstatus Hbuffer_len]]]].
  unfold CircularAreaActualReadLength in PreH6.
  destruct PreH6 as [available [Havailable Hdata_length]].
  assert (Hdata_le_requested : data_length <= requested).
  { rewrite Hdata_length. apply Z.le_min_l. }
  unfold CircularAreaDivideRdDataResult in PreH13.
  destruct PreH13 as [[Hnowrap Hzero] | [Hwrap Hone]]; [lia|].
  assert (Hdown_eq : read_len_down = readidx + data_length - area_length) by lia.
  assert (Hdown_bounds : 0 <= read_len_down < area_length) by lia.
  assert (Hrem_eq :
    Z.rem (readidx + data_length) area_length = read_len_down).
  {
    replace (readidx + data_length) with (read_len_down + 1 * area_length) by lia.
    rewrite Z.rem_add by lia.
    apply Z.rem_small. exact Hdown_bounds.
  }
  assert (Hbuffer_recompose :
    (sublist 0 read_len_down buffer_contents ++
       sublist read_len_down readidx buffer_contents) ++
      sublist readidx area_length buffer_contents = buffer_contents).
  {
    rewrite <- (sublist_split 0 readidx read_len_down buffer_contents) by lia.
    rewrite <- (sublist_split 0 area_length readidx buffer_contents) by lia.
    apply sublist_self.
    symmetry; exact Hbuffer_len.
  }
  Left.
  Exists data_length read_len_down
    (sublist readidx area_length buffer_contents ++
       sublist 0 read_len_down buffer_contents)
    ((sublist readidx area_length buffer_contents ++
        sublist 0 read_len_down buffer_contents) ++
       sublist data_length output_capacity output_before).
  split_pure_spatial.
  - rewrite unsigned_last_nbits_eq by lia.
    sep_apply (UCharArray.seg_merge_to_seg
      data_buffer 0 read_len_down readidx
      (sublist 0 read_len_down buffer_contents)
      (sublist read_len_down readidx buffer_contents)); [|lia].
    sep_apply (UCharArray.seg_merge_to_full
      data_buffer 0 readidx area_length
      (sublist 0 read_len_down buffer_contents ++
       sublist read_len_down readidx buffer_contents)
      (sublist readidx area_length buffer_contents)); [|lia].
    sep_apply (UCharArray.seg_merge_to_seg
      out0 0 read_len_up data_length
      (sublist readidx area_length buffer_contents)
      (sublist 0 read_len_down buffer_contents)); [|lia].
    sep_apply (UCharArray.seg_merge_to_full
      out0 0 data_length output_capacity
      (sublist readidx area_length buffer_contents ++
       sublist 0 read_len_down buffer_contents)
      (sublist data_length output_capacity output_before)); [|lia].
    rewrite Hbuffer_recompose.
    replace (data_buffer + 0 * sizeof (UCHAR)) with data_buffer by lia.
    replace (area_length - 0) with area_length by lia.
    replace (out0 + 0 * sizeof (UCHAR)) with out0 by lia.
    replace (output_capacity - 0) with output_capacity by lia.
    entailer!.
  - split_pures.
    + dump_pre_spatial. exact PreH2.
    + dump_pre_spatial. exact PreH3.
    + dump_pre_spatial. exact PreH4.
    + dump_pre_spatial. exact PreH5.
    + dump_pre_spatial.
      unfold CircularAreaReadSuccess.
      split.
      * unfold CircularAreaActualReadLength.
        exists available. split; assumption.
      * split.
        -- split; lia.
        -- split.
           ++ unfold CircularAreaReadBytes.
              split.
              ** rewrite Zlength_app.
                 repeat rewrite Zlength_sublist by lia. lia.
              ** destruct (Z.leb (readidx + data_length) area_length) eqn:Hleb.
                 --- apply Z.leb_le in Hleb. lia.
                 --- rewrite Hdown_eq. reflexivity.
           ++ split.
              ** symmetry. exact Hrem_eq.
              ** unfold CircularAreaOutputAfterRead.
                 rewrite Zlength_app.
                 repeat rewrite Zlength_sublist by lia.
                 replace (area_length - readidx + (read_len_down - 0))
                   with data_length by lia.
                 reflexivity.
    + dump_pre_spatial. exact PreH14.
    + dump_pre_spatial. exact PreH15.
Qed.

Lemma proof_of_CircularAreaRead_return_wit_2 : CircularAreaRead_return_wit_2.
Proof.
  pre_process.
  unfold CircularAreaDescriptorState in PreH14.
  destruct PreH14 as [Hreadidx [Hwriteidx [Harea [Hbstatus Hbuffer_len]]]].
  unfold CircularAreaActualReadLength in PreH6.
  destruct PreH6 as [available [Havailable Hdata_length]].
  assert (Hdata_le_requested : data_length <= requested).
  { rewrite Hdata_length. apply Z.le_min_l. }
  assert (Hrem_bounds :
    0 <= Z.rem (readidx + data_length) area_length < area_length).
  { apply Z.rem_bound_pos; lia. }
  assert (Hbuffer_recompose :
    (sublist 0 readidx buffer_contents ++
       sublist readidx (readidx + data_length) buffer_contents) ++
      sublist (readidx + data_length) area_length buffer_contents =
    buffer_contents).
  {
    rewrite <- (sublist_split 0 (readidx + data_length) readidx buffer_contents)
      by lia.
    rewrite <- (sublist_split 0 area_length (readidx + data_length) buffer_contents)
      by lia.
    apply sublist_self.
    symmetry; exact Hbuffer_len.
  }
  Left.
  Exists data_length
    (Z.rem (readidx + data_length) area_length)
    (sublist readidx (readidx + data_length) buffer_contents)
    (sublist readidx (readidx + data_length) buffer_contents ++
       sublist data_length output_capacity output_before).
  split_pure_spatial.
  - rewrite unsigned_last_nbits_eq by lia.
    sep_apply (UCharArray.seg_merge_to_seg
      data_buffer 0 readidx (readidx + data_length)
      (sublist 0 readidx buffer_contents)
      (sublist readidx (readidx + data_length) buffer_contents)); [|lia].
    sep_apply (UCharArray.seg_merge_to_full
      data_buffer 0 (readidx + data_length) area_length
      (sublist 0 readidx buffer_contents ++
       sublist readidx (readidx + data_length) buffer_contents)
      (sublist (readidx + data_length) area_length buffer_contents)); [|lia].
    sep_apply (UCharArray.seg_merge_to_full
      out0 0 data_length output_capacity
      (sublist readidx (readidx + data_length) buffer_contents)
      (sublist data_length output_capacity output_before)); [|lia].
    rewrite Hbuffer_recompose.
    replace (data_buffer + 0 * sizeof (UCHAR)) with data_buffer by lia.
    replace (area_length - 0) with area_length by lia.
    replace (out0 + 0 * sizeof (UCHAR)) with out0 by lia.
    replace (output_capacity - 0) with output_capacity by lia.
    entailer!.
  - split_pures.
    + dump_pre_spatial. exact PreH2.
    + dump_pre_spatial. exact PreH3.
    + dump_pre_spatial. exact PreH4.
    + dump_pre_spatial. exact PreH5.
    + dump_pre_spatial.
      unfold CircularAreaReadSuccess.
      split.
      * unfold CircularAreaActualReadLength.
        exists available. split; assumption.
      * split.
        -- split; lia.
        -- split.
           ++ unfold CircularAreaReadBytes.
              split.
              ** rewrite Zlength_sublist by lia. lia.
              ** destruct (Z.leb (readidx + data_length) area_length) eqn:Hleb.
                 --- reflexivity.
                 --- apply Z.leb_gt in Hleb. lia.
           ++ split.
              ** reflexivity.
              ** unfold CircularAreaOutputAfterRead.
                 rewrite Zlength_sublist by lia.
                 replace (readidx + data_length - readidx) with data_length by lia.
                 reflexivity.
    + dump_pre_spatial. exact PreH12.
    + dump_pre_spatial. exact PreH13.
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
  Right.
  rewrite PreH10.
  entailer!.
Qed.

Lemma proof_of_CircularAreaRead_return_wit_5 : CircularAreaRead_return_wit_5.
Proof.
  right.
  pre_process.
  rewrite PreH7.
  entailer!.
Qed.

Lemma proof_of_CircularAreaRead_return_wit_6 : CircularAreaRead_return_wit_6.
Proof.
  right.
  pre_process.
Qed.

Lemma proof_of_CircularAreaRead_partial_solve_wit_4_pure : CircularAreaRead_partial_solve_wit_4_pure.
Proof.
  pre_process.
  subst.
  assert (retval = retval_3) by
    (eapply circular_area_data_length_functional__read_preparation_and_memcpy;
     eauto).
  subst retval_3.
  pose proof
    (circular_area_data_length_bounds__read_preparation_and_memcpy
       readidx writeidx area_length b_status buffer_contents retval
       PreH4 PreH1).
  unfold CircularAreaDescriptorState in *.
  entailer!.
  all: try rewrite Zlength_sublist; lia.
Qed.

Lemma proof_of_CircularAreaRead_partial_solve_wit_5_pure : CircularAreaRead_partial_solve_wit_5_pure.
Proof.
  pre_process.
  subst.
  pose proof
    (circular_area_data_length_bounds__read_preparation_and_memcpy
       readidx writeidx area_length b_status buffer_contents retval_2
       PreH5 PreH2).
  unfold CircularAreaDescriptorState in *.
  entailer!.
  all: try rewrite Zlength_sublist; lia.
Qed.

Lemma proof_of_CircularAreaRead_partial_solve_wit_6_pure : CircularAreaRead_partial_solve_wit_6_pure.
Proof.
  pre_process.
  subst.
  prop_apply_p (UCharArray.seg_Zlength out0 0 (area_length - readidx)
    (sublist 0 (area_length - readidx) output_before)).
  unfold CircularAreaDescriptorState in *.
  entailer!.
  all: try rewrite Zlength_sublist; try rewrite sizeof_uchar; lia.
Qed.

Lemma proof_of_CircularAreaRead_partial_solve_wit_7_pure : CircularAreaRead_partial_solve_wit_7_pure.
Proof.
  pre_process.
  subst.
  prop_apply_p (UCharArray.seg_Zlength out0 (area_length - readidx)
    data_length
    (sublist (area_length - readidx) data_length output_before)).
  prop_apply_p (UCharArray.seg_Zlength data_buffer 0
    (data_length - (area_length - readidx))
    (sublist 0 (data_length - (area_length - readidx)) buffer_contents)).
  unfold CircularAreaDescriptorState in *.
  entailer!.
  all: try rewrite Zlength_sublist; try rewrite sizeof_uchar; lia.
Qed.

Lemma proof_of_CircularAreaRead_partial_solve_wit_8_pure : CircularAreaRead_partial_solve_wit_8_pure.
Proof.
  pre_process.
  subst.
  prop_apply_p (UCharArray.seg_Zlength out0 0 data_length
    (sublist 0 data_length output_before)).
  prop_apply_p (UCharArray.seg_Zlength data_buffer readidx
    (readidx + data_length)
    (sublist readidx (readidx + data_length) buffer_contents)).
  unfold CircularAreaDescriptorState in *.
  entailer!.
  all: try rewrite Zlength_sublist; try rewrite sizeof_uchar; lia.
Qed.
