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
  unfold CircularAreaDescriptorState in *.
  entailer!.
Qed.

Lemma proof_of_CircularAreaGetDataLength_safety_wit_5 : CircularAreaGetDataLength_safety_wit_5.
Proof.
  pre_process.
  unfold CircularAreaDescriptorState in *.
  entailer!.
Qed.

Lemma proof_of_CircularAreaGetDataLength_return_wit_1 : CircularAreaGetDataLength_return_wit_1.
Proof.
  pre_process.
  unfold CircularAreaIsFullResult in *.
  unfold CircularAreaDataLengthResult.
  entailer!.
Qed.

Lemma proof_of_CircularAreaGetDataLength_return_wit_2 : CircularAreaGetDataLength_return_wit_2.
Proof.
  pre_process.
  unfold CircularAreaIsFullResult in *.
  unfold CircularAreaDataLengthResult.
  entailer!.
Qed.

Lemma proof_of_CircularAreaDivideRdData_return_wit_1 : CircularAreaDivideRdData_return_wit_1.
Proof.
  pre_process.
  unfold CircularAreaDescriptorState in *.
  unfold CircularAreaDivideRdDataResult.
  unfold unsigned_last_nbits in *.
  entailer!.
  change (2 ^ 32) with 4294967296 in *.
  assert (Hreadidx : readidx mod 4294967296 = readidx).
  { apply Z.mod_small; lia. }
  rewrite Hreadidx in PreH1.
  assert (Hsum : (readidx + data_length_pre) mod 4294967296 =
                 readidx + data_length_pre).
  { apply Z.mod_small; lia. }
  rewrite Hsum in PreH1.
  lia.
Qed.

Lemma proof_of_CircularAreaDivideRdData_return_wit_2 : CircularAreaDivideRdData_return_wit_2.
Proof.
  pre_process.
  unfold CircularAreaDescriptorState in *.
  unfold CircularAreaDivideRdDataResult.
  unfold unsigned_last_nbits in *.
  entailer!.
  change (2 ^ 32) with 4294967296 in *.
  assert (Hreadidx : readidx mod 4294967296 = readidx).
  { apply Z.mod_small; lia. }
  rewrite Hreadidx in PreH1.
  assert (Hsum : (readidx + data_length_pre) mod 4294967296 =
                 readidx + data_length_pre).
  { apply Z.mod_small; lia. }
  rewrite Hsum in PreH1.
  lia.
Qed.

Lemma proof_of_CircularAreaRead_entail_wit_2 : CircularAreaRead_entail_wit_2.
Proof. aggressive_pre_process; subst; unfold CircularAreaEmptyResult in *; entailer!; try lia. Qed.

Lemma proof_of_CircularAreaRead_entail_wit_3_1 : CircularAreaRead_entail_wit_3_1.
Proof.
  aggressive_pre_process.
  all: subst.
  all: pose proof PreH4 as Hstate.
  all: unfold CircularAreaDescriptorState in Hstate.
  all: destruct Hstate as [[Hr0 Hr] [[Hw0 Hw] [[Ha0 Ha] [Hstatus Hlen]]]].
  all: assert (Hwrap : area_length < readidx + requested) by
    (unfold CircularAreaDivideRdDataResult in PreH1;
     destruct PreH1 as [[Hle Hret] | [Hgt Hret]]; lia).
  all: try dump_pre_spatial.
  all: try (unfold CircularAreaActualReadLength;
    exists retval_2; split; [exact PreH6 | symmetry; apply Z.min_l; lia]).
  all: try (unfold CircularAreaDivideRdDataResult in *;
    destruct PreH1 as [[Hle Hret] | [Hgt Hret]]; lia).
  all: try (repeat rewrite unsigned_last_nbits_eq by lia;
    unfold CircularAreaDivideRdDataResult in PreH1;
    destruct PreH1 as [[Hle Hret] | [Hgt Hret]]; lia).
  all: try (rewrite (unsigned_last_nbits_eq readidx 32) by lia;
    try rewrite (unsigned_last_nbits_eq (area_length - readidx) 32) by lia;
    try rewrite (unsigned_last_nbits_eq
      (requested - (area_length - readidx)) 32) by lia;
    lia).
  all: try (rewrite (unsigned_last_nbits_eq readidx 32) by lia;
    repeat rewrite unsigned_last_nbits_eq by lia; lia).
  all: try (repeat rewrite unsigned_last_nbits_eq by lia; lia).
  all: try exact PreH10.
  sep_apply_l_atomic
    (UCharArray.full_split_to_seg data_buffer readidx area_length buffer_contents
       ltac:(lia)).
  unfold CircularAreaDivideRdDataResult in PreH1.
  destruct PreH1 as [[Hle Hret] | [Hgt Hret]]; [lia |].
  assert (Hreadbits : unsigned_last_nbits readidx 32 = readidx).
  { apply unsigned_last_nbits_eq; lia. }
  assert (Htailbits : unsigned_last_nbits (area_length - readidx) 32 =
      area_length - readidx).
  { apply unsigned_last_nbits_eq; lia. }
  rewrite Hreadbits, Htailbits.
  sep_apply_l_atomic
    (UCharArray.full_split_to_seg out0 (area_length - readidx)
       output_capacity output_before ltac:(lia)).
  entailer!.
Qed.

Lemma proof_of_CircularAreaRead_entail_wit_3_2 : CircularAreaRead_entail_wit_3_2.
Proof.
  aggressive_pre_process.
  all: subst.
  all: pose proof PreH4 as Hstate.
  all: unfold CircularAreaDescriptorState in Hstate.
  all: destruct Hstate as [[Hr0 Hr] [[Hw0 Hw] [[Ha0 Ha] [Hstatus Hlen]]]].
  all: pose proof
    (circular_area_data_length_functional__read_preparation_and_memcpy
       readidx writeidx area_length b_status retval retval_3 PreH5 PreH10)
    as Havail_eq.
  all: pose proof
    (circular_area_data_length_positive__read_preparation_and_memcpy
       readidx writeidx area_length b_status buffer_contents retval
       PreH4 PreH14 PreH5) as Hretval_pos.
  all: assert (Hwrap : area_length < readidx + retval) by
    (unfold CircularAreaDivideRdDataResult in PreH1;
     destruct PreH1 as [[Hle Hret] | [Hgt Hret]]; lia).
  all: try dump_pre_spatial.
  all: try (unfold CircularAreaActualReadLength;
    exists retval; split; [exact PreH5 | symmetry; apply Z.min_r; lia]).
  all: try (unfold CircularAreaDivideRdDataResult in *;
    destruct PreH1 as [[Hle Hret] | [Hgt Hret]]; lia).
  all: try (repeat rewrite unsigned_last_nbits_eq by lia;
    unfold CircularAreaDivideRdDataResult in PreH1;
    destruct PreH1 as [[Hle Hret] | [Hgt Hret]]; lia).
  all: try (rewrite (unsigned_last_nbits_eq readidx 32) by lia;
    try rewrite (unsigned_last_nbits_eq (area_length - readidx) 32) by lia;
    try rewrite (unsigned_last_nbits_eq
      (retval - (area_length - readidx)) 32) by lia;
    lia).
  all: try (rewrite (unsigned_last_nbits_eq readidx 32) by lia;
    repeat rewrite unsigned_last_nbits_eq by lia; lia).
  all: try (repeat rewrite unsigned_last_nbits_eq by lia; lia).
  all: try exact PreH14.
  sep_apply_l_atomic
    (UCharArray.full_split_to_seg data_buffer readidx area_length buffer_contents
       ltac:(lia)).
  unfold CircularAreaDivideRdDataResult in PreH1.
  destruct PreH1 as [[Hle Hret] | [Hgt Hret]]; [lia |].
  assert (Hreadbits : unsigned_last_nbits readidx 32 = readidx).
  { apply unsigned_last_nbits_eq; lia. }
  assert (Htailbits : unsigned_last_nbits (area_length - readidx) 32 =
      area_length - readidx).
  { apply unsigned_last_nbits_eq; lia. }
  rewrite Hreadbits, Htailbits.
  sep_apply_l_atomic
    (UCharArray.full_split_to_seg out0 (area_length - readidx)
       output_capacity output_before ltac:(lia)).
  entailer!.
Qed.

Lemma proof_of_CircularAreaRead_entail_wit_4 : CircularAreaRead_entail_wit_4.
Proof.
  pre_process.
  subst.
  pose proof
    (circular_area_actual_read_bounds__read_preparation_and_memcpy
       readidx writeidx area_length b_status buffer_contents requested
       data_length ltac:(lia) PreH17 PreH6) as Hactual_bounds.
  unfold CircularAreaDivideRdDataResult in PreH14.
  destruct PreH14 as [[Hnowrap Hret] | [Hwrap Hret]]; [lia |].
  sep_apply_l_atomic
    (UCharArray.seg_split_to_seg data_buffer 0
       (data_length - (area_length - readidx)) readidx
       (sublist 0 readidx buffer_contents) ltac:(lia)).
  sep_apply_l_atomic
    (UCharArray.seg_split_to_seg out0 (area_length - readidx)
       data_length output_capacity
       (sublist (area_length - readidx) output_capacity output_before)
       ltac:(lia)).
  entailer!; try lia.
  all: try dump_pre_spatial.
  all: try (unfold CircularAreaDivideRdDataResult; right; lia).
  all: repeat rewrite Zsublist_Zsublist by lia.
  all: replace (data_length - (area_length - readidx) - 0)
    with (data_length - (area_length - readidx)) by lia.
  all: replace (readidx - 0) with readidx by lia.
  all: replace (0 + (area_length - readidx)) with (area_length - readidx) by lia.
  all: replace
    (data_length - (area_length - readidx) + (area_length - readidx))
    with data_length by lia.
  all: replace
    (output_capacity - (area_length - readidx) + (area_length - readidx))
    with output_capacity by lia.
  all: replace (0 + 0) with 0 by lia.
  all: replace (data_length - (area_length - readidx) + 0)
    with (data_length - (area_length - readidx)) by lia.
  all: replace (readidx + 0) with readidx by lia.
  all: entailer!.
Qed.

Lemma proof_of_CircularAreaRead_entail_wit_5_1 : CircularAreaRead_entail_wit_5_1.
Proof.
  pre_process.
  subst.
  pose proof PreH4 as Hstate.
  unfold CircularAreaDescriptorState in Hstate.
  destruct Hstate as [[Hr0 Hr] [[Hw0 Hw] [[Ha0 Ha] [Hstatus Hlen]]]].
  unfold CircularAreaDivideRdDataResult in PreH1.
  destruct PreH1 as [[Hnowrap Hret] | [Hwrap Hret]]; [| lia].
  assert (Hactual : CircularAreaActualReadLength
      readidx writeidx area_length b_status requested requested).
  { unfold CircularAreaActualReadLength.
    exists retval_2; split; [exact PreH6 |].
    symmetry; apply Z.min_l; lia. }
  sep_apply_l_atomic
    (UCharArray.full_split_to_seg data_buffer readidx area_length
       buffer_contents ltac:(lia)).
  sep_apply_l_atomic
    (UCharArray.seg_split_to_seg data_buffer readidx
       (readidx + requested) area_length
       (sublist readidx area_length buffer_contents)
       ltac:(lia)).
  sep_apply_l_atomic
    (UCharArray.full_split_to_seg out0 requested output_capacity
       output_before ltac:(lia)).
  entailer!; try lia.
  all: try dump_pre_spatial.
  all: try exact Hactual.
  all: try (unfold CircularAreaDivideRdDataResult; left; lia).
  all: repeat rewrite Zsublist_Zsublist by lia.
  all: replace (0 + readidx) with readidx by lia.
  all: try rewrite (Z.add_comm requested readidx).
  all: replace (area_length - readidx + readidx) with area_length by lia.
  all: replace (readidx + requested - readidx) with requested by lia.
  all: entailer!.
  all: rewrite (Z.add_comm requested readidx).
  all: entailer!.
Qed.

Lemma proof_of_CircularAreaRead_entail_wit_5_2 : CircularAreaRead_entail_wit_5_2.
Proof.
  pre_process.
  subst.
  pose proof PreH4 as Hstate.
  unfold CircularAreaDescriptorState in Hstate.
  destruct Hstate as [[Hr0 Hr] [[Hw0 Hw] [[Ha0 Ha] [Hstatus Hlen]]]].
  assert (Havail_eq : retval = retval_3).
  { eapply circular_area_data_length_functional__read_preparation_and_memcpy;
      eassumption. }
  assert (Hretval_pos : 0 < retval).
  { eapply circular_area_data_length_positive__read_preparation_and_memcpy;
      eassumption. }
  unfold CircularAreaDivideRdDataResult in PreH1.
  destruct PreH1 as [[Hnowrap Hret] | [Hwrap Hret]]; [| lia].
  assert (Hactual : CircularAreaActualReadLength
      readidx writeidx area_length b_status requested retval).
  { unfold CircularAreaActualReadLength.
    exists retval; split; [exact PreH5 |].
    symmetry; apply Z.min_r; lia. }
  sep_apply_l_atomic
    (UCharArray.full_split_to_seg data_buffer readidx area_length
       buffer_contents ltac:(lia)).
  sep_apply_l_atomic
    (UCharArray.seg_split_to_seg data_buffer readidx
       (readidx + retval) area_length
       (sublist readidx area_length buffer_contents)
       ltac:(lia)).
  sep_apply_l_atomic
    (UCharArray.full_split_to_seg out0 retval output_capacity
       output_before ltac:(lia)).
  entailer!; try lia.
  all: try dump_pre_spatial.
  all: try exact Hactual.
  all: try (unfold CircularAreaDivideRdDataResult; left; lia).
  all: repeat rewrite Zsublist_Zsublist by lia.
  all: replace (0 + readidx) with readidx by lia.
  all: try rewrite (Z.add_comm retval readidx).
  all: replace (area_length - readidx + readidx) with area_length by lia.
  all: replace (readidx + retval - readidx) with retval by lia.
  all: entailer!.
  all: rewrite (Z.add_comm retval readidx).
  all: entailer!.
Qed.

Lemma proof_of_CircularAreaRead_return_wit_1 : CircularAreaRead_return_wit_1.
Proof.
  pre_process.
  pose proof PreH16 as Hstate.
  unfold CircularAreaDescriptorState in Hstate.
  destruct Hstate as [[Hr0 Hr] [[Hw0 Hw] [[Ha0 Ha] [Hstatus Hlen]]]].
  pose proof
    (circular_area_actual_read_bounds__read_preparation_and_memcpy
       readidx writeidx area_length b_status buffer_contents requested
       data_length ltac:(lia) PreH16 PreH6) as Hactual_bounds.
  unfold CircularAreaDivideRdDataResult in PreH13.
  destruct PreH13 as [[Hnowrap Hret] | [Hwrap Hret]]; [lia |].
  assert (Hrem : Z.rem (readidx + data_length) area_length = read_len_down).
  { symmetry. apply Z.rem_unique with (q := 1); lia. }
  assert (Hbits : unsigned_last_nbits read_len_down 8 = read_len_down).
  { apply unsigned_last_nbits_eq; simpl; lia. }
  Left.
  Exists data_length read_len_down
    (sublist readidx area_length buffer_contents ++
       sublist 0 read_len_down buffer_contents)
    ((sublist readidx area_length buffer_contents ++
       sublist 0 read_len_down buffer_contents) ++
       sublist data_length output_capacity output_before).
  sep_apply_l_atomic
    (UCharArray.seg_merge_to_seg data_buffer 0 read_len_down readidx
       (sublist 0 read_len_down buffer_contents)
       (sublist read_len_down readidx buffer_contents)
       ltac:(lia)).
  sep_apply_l_atomic
    (UCharArray.seg_merge_to_full data_buffer 0 readidx area_length
       (sublist 0 read_len_down buffer_contents ++
        sublist read_len_down readidx buffer_contents)
       (sublist readidx area_length buffer_contents)
       ltac:(lia)).
  sep_apply_l_atomic
    (UCharArray.seg_merge_to_seg out0 0 read_len_up data_length
       (sublist readidx area_length buffer_contents)
       (sublist 0 read_len_down buffer_contents)
       ltac:(lia)).
  sep_apply_l_atomic
    (UCharArray.seg_merge_to_full out0 0 data_length output_capacity
       (sublist readidx area_length buffer_contents ++
        sublist 0 read_len_down buffer_contents)
       (sublist data_length output_capacity output_before)
       ltac:(lia)).
  rewrite Hbits.
  rewrite <- (sublist_split 0 readidx read_len_down
                buffer_contents) by lia.
  rewrite <- (sublist_split 0 area_length readidx
                buffer_contents) by lia.
  entailer!.
  all: try dump_pre_spatial.
  all: unfold CircularAreaReadSuccess, CircularAreaReadBytes,
       CircularAreaOutputAfterRead.
  all: repeat split; try assumption; try lia.
  all: try (rewrite Zlength_app; repeat rewrite Zlength_sublist by lia; lia).
  all: try (replace ((readidx + data_length <=? area_length)%Z) with false
              by (symmetry; apply Z.leb_gt; lia); reflexivity).
  all: try rewrite Hrem.
  all: try (replace (out0 + 0 * sizeof(UCHAR)) with out0 by lia;
            replace (output_capacity - 0) with output_capacity by lia;
            replace (data_buffer + 0 * sizeof(UCHAR)) with data_buffer by lia;
            replace (area_length - 0) with area_length by lia;
            entailer!).
  all: try lia.
  all: try rewrite (sublist_self buffer_contents area_length (eq_sym Hlen)).
  all: try entailer!.
  all: try (destruct (Z.leb (readidx + data_length) area_length) eqn:Hcmp;
              [apply Z.leb_le in Hcmp; lia |];
            replace (readidx + data_length - area_length) with read_len_down by lia;
            reflexivity).
  all: try (rewrite Zlength_app;
            repeat rewrite Zlength_sublist by lia;
            replace (area_length - readidx + (read_len_down - 0))
              with data_length by lia;
            reflexivity).
Qed.

Lemma proof_of_CircularAreaRead_return_wit_2 : CircularAreaRead_return_wit_2.
Proof.
  pre_process.
  subst.
  pose proof PreH14 as Hstate.
  unfold CircularAreaDescriptorState in Hstate.
  destruct Hstate as [[Hr0 Hr] [[Hw0 Hw] [[Ha0 Ha] [Hstatus Hlen]]]].
  pose proof
    (circular_area_actual_read_bounds__read_preparation_and_memcpy
       readidx writeidx area_length b_status buffer_contents requested
       data_length ltac:(lia) PreH14 PreH6) as Hactual_bounds.
  unfold CircularAreaDivideRdDataResult in PreH11.
  destruct PreH11 as [[Hnowrap Hret] | [Hwrap Hret]]; [| lia].
  assert (Hrem_bounds : 0 <= Z.rem (readidx + data_length) area_length
                              < area_length).
  { apply Z.rem_bound_pos; lia. }
  assert (Hbits : unsigned_last_nbits
      (Z.rem (readidx + data_length) area_length) 8 =
      Z.rem (readidx + data_length) area_length).
  { apply unsigned_last_nbits_eq; simpl; lia. }
  Left.
  Exists data_length (Z.rem (readidx + data_length) area_length)
    (sublist readidx (readidx + data_length) buffer_contents)
    (sublist readidx (readidx + data_length) buffer_contents ++
       sublist data_length output_capacity output_before).
  sep_apply_l_atomic
    (UCharArray.seg_merge_to_seg data_buffer 0 readidx
       (readidx + data_length)
       (sublist 0 readidx buffer_contents)
       (sublist readidx (readidx + data_length) buffer_contents)
       ltac:(lia)).
  sep_apply_l_atomic
    (UCharArray.seg_merge_to_full data_buffer 0
       (readidx + data_length) area_length
       (sublist 0 readidx buffer_contents ++
        sublist readidx (readidx + data_length) buffer_contents)
       (sublist (readidx + data_length) area_length buffer_contents)
       ltac:(lia)).
  sep_apply_l_atomic
    (UCharArray.seg_merge_to_full out0 0 data_length output_capacity
       (sublist readidx (readidx + data_length) buffer_contents)
       (sublist data_length output_capacity output_before)
       ltac:(lia)).
  rewrite Hbits.
  rewrite <- (sublist_split 0 (readidx + data_length) readidx
                buffer_contents) by lia.
  rewrite <- (sublist_split 0 area_length (readidx + data_length)
                buffer_contents) by lia.
  entailer!.
  all: try dump_pre_spatial.
  all: unfold CircularAreaReadSuccess, CircularAreaReadBytes,
       CircularAreaOutputAfterRead.
  all: repeat split; try assumption; try lia.
  all: try rewrite Zlength_sublist by lia.
  all: try (replace ((readidx + data_length <=? area_length)%Z) with true
              by (symmetry; apply Z.leb_le; lia); reflexivity).
  all: try (replace (readidx + data_length - readidx) with data_length by lia;
              reflexivity).
  all: try (replace (out0 + 0 * sizeof(UCHAR)) with out0 by lia;
            replace (output_capacity - 0) with output_capacity by lia;
            replace (data_buffer + 0 * sizeof(UCHAR)) with data_buffer by lia;
            replace (area_length - 0) with area_length by lia;
            entailer!).
  all: try lia.
  all: rewrite (sublist_self buffer_contents area_length (eq_sym Hlen)).
  all: entailer!.
Qed.

Lemma proof_of_CircularAreaRead_return_wit_3 : CircularAreaRead_return_wit_3.
Proof.
  pre_process.
  subst.
  Right.
  unfold CircularAreaErrorResult.
  entailer!.
Qed.

Lemma proof_of_CircularAreaRead_return_wit_4 : CircularAreaRead_return_wit_4.
Proof.
  pre_process.
  subst.
  Right.
  unfold CircularAreaErrorResult.
  entailer!; lia.
Qed.

Lemma proof_of_CircularAreaRead_return_wit_5 : CircularAreaRead_return_wit_5.
Proof.
  aggressive_pre_process.
  all: subst.
  unfold CircularAreaErrorResult.
  all: entailer!; lia.
Qed.

Lemma proof_of_CircularAreaRead_return_wit_6 : CircularAreaRead_return_wit_6.
Proof.
  aggressive_pre_process.
  all: subst.
Qed.

Lemma proof_of_CircularAreaRead_partial_solve_wit_4_pure : CircularAreaRead_partial_solve_wit_4_pure.
Proof.
  aggressive_pre_process.
  all: pose proof
    (circular_area_data_length_bounds__read_preparation_and_memcpy
       readidx writeidx area_length b_status buffer_contents retval
       PreH6 PreH3) as Hbounds.
  all: unfold CircularAreaDescriptorState in PreH6.
  all: destruct PreH6 as [[? ?] [? [[? ?] ?]]].
  all: entailer!.
Qed.

Lemma proof_of_CircularAreaRead_partial_solve_wit_5_pure : CircularAreaRead_partial_solve_wit_5_pure.
Proof.
  aggressive_pre_process.
  all: pose proof
    (circular_area_data_length_bounds__read_preparation_and_memcpy
       readidx writeidx area_length b_status buffer_contents retval_2
       PreH6 PreH3) as Hbounds.
  all: unfold CircularAreaDescriptorState in PreH6.
  all: destruct PreH6 as [[? ?] [? [[? ?] ?]]].
  all: entailer!.
Qed.

Lemma proof_of_CircularAreaRead_partial_solve_wit_6_pure : CircularAreaRead_partial_solve_wit_6_pure.
Proof.
  aggressive_pre_process.
  all: prop_apply_p (UCharArray.seg_Zlength out0 0 read_len_up
    (sublist 0 read_len_up output_before)).
  all: prop_apply_p (UCharArray.seg_Zlength data_buffer readidx area_length
    (sublist readidx area_length buffer_contents)).
  all: entailer!.
Qed.

Lemma proof_of_CircularAreaRead_partial_solve_wit_7_pure : CircularAreaRead_partial_solve_wit_7_pure.
Proof.
  aggressive_pre_process.
  all: prop_apply_p (UCharArray.seg_Zlength out0 read_len_up data_length
    (sublist read_len_up data_length output_before)).
  all: prop_apply_p (UCharArray.seg_Zlength data_buffer 0 read_len_down
    (sublist 0 read_len_down buffer_contents)).
  all: entailer!.
Qed.

Lemma proof_of_CircularAreaRead_partial_solve_wit_8_pure : CircularAreaRead_partial_solve_wit_8_pure.
Proof.
  aggressive_pre_process.
  all: prop_apply_p (UCharArray.seg_Zlength out0 0 data_length
    (sublist 0 data_length output_before)).
  all: prop_apply_p
    (UCharArray.seg_Zlength data_buffer readidx (readidx + data_length)
       (sublist readidx (readidx + data_length) buffer_contents)).
  all: entailer!.
Qed.
