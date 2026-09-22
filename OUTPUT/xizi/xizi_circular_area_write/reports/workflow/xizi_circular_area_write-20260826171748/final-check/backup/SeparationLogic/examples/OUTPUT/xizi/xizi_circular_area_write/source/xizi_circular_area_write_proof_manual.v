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
From SimpleC.EE.OUTPUT.xizi.xizi_circular_area_write.source Require Import xizi_circular_area_write_goal.
From SimpleC.EE.OUTPUT.xizi.xizi_circular_area_write.source Require Import xizi_circular_area_write_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
Require Import
      SimpleC.EE.OUTPUT.xizi.xizi_circular_area_write.source.xizi_circular_area_write_lib.
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

Lemma proof_of_CircularAreaGetDataLength_return_wit_1 : CircularAreaGetDataLength_return_wit_1.
Proof.
  pre_process.
  subst p_head_circular_area_data_length_body.
  subst p_tail_circular_area_data_length_body.
  subst retval.
  unfold CircularAreaIsFullResult in PreH1.
  unfold CircularAreaDataLengthResult.
  pose proof (unsigned_Lastnbits_range
    (unsigned_last_nbits
       (writeidx_circular_area_data_length_body -
        readidx_circular_area_data_length_body) 32 +
     area_length_circular_area_data_length_body) 32 ltac:(lia)) as Hunsigned.
  pose proof (Z.rem_bound_pos
    (unsigned_last_nbits
       (unsigned_last_nbits
          (writeidx_circular_area_data_length_body -
           readidx_circular_area_data_length_body) 32 +
        area_length_circular_area_data_length_body) 32)
    area_length_circular_area_data_length_body ltac:(lia) ltac:(lia)) as Hrem.
  entailer!.
  all: lia.
Qed.

Lemma proof_of_CircularAreaGetDataLength_return_wit_2 : CircularAreaGetDataLength_return_wit_2.
Proof.
  pre_process.
  subst p_head_circular_area_data_length_body.
  subst p_tail_circular_area_data_length_body.
  unfold CircularAreaIsFullResult in PreH1.
  unfold CircularAreaDataLengthResult.
  entailer!.
Qed.

Lemma proof_of_CircularAreaDivideWrData_return_wit_1 : CircularAreaDivideWrData_return_wit_1.
Proof.
  pre_process.
  unfold CircularAreaDivideWrDataResult.
  entailer!.
Qed.

Lemma proof_of_CircularAreaDivideWrData_return_wit_2 : CircularAreaDivideWrData_return_wit_2.
Proof.
  pre_process.
  unfold CircularAreaDivideWrDataResult.
  entailer!.
Qed.

Lemma proof_of_CircularAreaWrite_entail_wit_1_1 : CircularAreaWrite_entail_wit_1_1.
Proof.
  aggressive_pre_process.
  all: try subst circular_area_entry.
  all: try subst input_buffer_entry.
  all: try subst force0.
  all: try subst data_buffer.
  all: try subst p_tail.
  all: try (dump_pre_spatial;
    unfold CircularAreaActualWriteLength;
    exists retval_2; split; [assumption | apply Z.min_l; lia]).
  all: try (dump_pre_spatial;
    unfold CircularAreaDescriptorState,
      CircularAreaDivideWrDataResult,
      CircularAreaDataLengthResult,
      CircularAreaIsFullResult in *;
    intuition; subst; try lia).
  sep_apply_l_atomic
    (UCharArray.full_split_to_seg p_head writeidx area_length contents).
  - dump_pre_spatial. lia.
  - sep_apply_l_atomic
      (UCharArray.full_split_to_seg input_buffer_pre
        (area_length - writeidx) requested input_contents).
    + dump_pre_spatial.
      unfold CircularAreaDivideWrDataResult in *.
      intuition; subst; lia.
    + cancel.
Qed.

Lemma proof_of_CircularAreaWrite_entail_wit_1_2 : CircularAreaWrite_entail_wit_1_2.
Proof.
  aggressive_pre_process.
  all: try subst circular_area_entry.
  all: try subst input_buffer_entry.
  all: try subst force0.
  all: try subst data_buffer.
  all: try subst p_tail.
  all: try (dump_pre_spatial;
    unfold CircularAreaActualWriteLength;
    exists retval; split; [assumption | apply Z.min_r; lia]).
  all: try (dump_pre_spatial;
    unfold CircularAreaDescriptorState,
      CircularAreaDivideWrDataResult,
      CircularAreaDataLengthResult,
      CircularAreaIsFullResult in *;
    intuition; subst; try lia).
  sep_apply_l_atomic
    (UCharArray.full_split_to_seg p_head writeidx area_length contents).
  - dump_pre_spatial. lia.
  - sep_apply_l_atomic
      (UCharArray.full_split_to_seg input_buffer_pre
        (area_length - writeidx) requested input_contents).
    + dump_pre_spatial.
      unfold CircularAreaDivideWrDataResult in *.
      intuition; subst; lia.
    + cancel.
Qed.

Lemma proof_of_CircularAreaWrite_entail_wit_1_3 : CircularAreaWrite_entail_wit_1_3.
Proof.
  aggressive_pre_process.
  all: try subst circular_area_entry.
  all: try subst input_buffer_entry.
  all: try subst force0.
  all: try subst data_buffer.
  all: try subst p_tail.
  all: try (dump_pre_spatial;
    unfold CircularAreaActualWriteLength;
    exists retval_2; split; [assumption | apply Z.min_l; lia]).
  all: try (dump_pre_spatial;
    unfold CircularAreaDescriptorState,
      CircularAreaDivideWrDataResult,
      CircularAreaDataLengthResult,
      CircularAreaIsFullResult in *;
    intuition; subst; try lia).
  sep_apply_l_atomic
    (UCharArray.full_split_to_seg p_head writeidx area_length contents).
  - dump_pre_spatial. lia.
  - sep_apply_l_atomic
      (UCharArray.full_split_to_seg input_buffer_pre
        (area_length - writeidx) requested input_contents).
    + dump_pre_spatial.
      unfold CircularAreaDivideWrDataResult in *.
      intuition; subst; lia.
    + cancel.
  - apply unsigned_last_nbits_eq; lia.
  - apply unsigned_last_nbits_eq; lia.
  - apply unsigned_last_nbits_eq; lia.
  - apply unsigned_last_nbits_eq; lia.
  - unfold CircularAreaActualWriteLength.
    eexists; split.
    + unfold CircularAreaDataLengthResult.
      right; split; [intuition | reflexivity].
    + symmetry; apply Z.min_l; lia.
  - unfold CircularAreaActualWriteLength.
    eexists; split.
    + unfold CircularAreaDataLengthResult.
      right; split; [intuition | reflexivity].
    + symmetry; apply Z.min_l; lia.
  - unfold CircularAreaActualWriteLength.
    eexists; split.
    + unfold CircularAreaDataLengthResult.
      right; split; [intuition | reflexivity].
    + symmetry; apply Z.min_l; lia.
  - unfold CircularAreaActualWriteLength.
    eexists; split.
    + unfold CircularAreaDataLengthResult.
      right; split; [intuition | reflexivity].
    + symmetry; apply Z.min_l; lia.
Qed.

Lemma proof_of_CircularAreaWrite_entail_wit_1_4 : CircularAreaWrite_entail_wit_1_4.
Proof.
  aggressive_pre_process.
  all: try subst circular_area_entry.
  all: try subst input_buffer_entry.
  all: try subst force0.
  all: try subst data_buffer.
  all: try subst p_tail.
  all: try (dump_pre_spatial;
    unfold CircularAreaActualWriteLength;
    exists retval; split; [assumption | apply Z.min_r; lia]).
  all: try (dump_pre_spatial;
    unfold CircularAreaDescriptorState,
      CircularAreaDivideWrDataResult,
      CircularAreaDataLengthResult,
      CircularAreaIsFullResult in *;
    intuition; subst; try lia).
  sep_apply_l_atomic
    (UCharArray.full_split_to_seg p_head writeidx area_length contents).
  - dump_pre_spatial. lia.
  - sep_apply_l_atomic
      (UCharArray.full_split_to_seg input_buffer_pre
        (area_length - writeidx) requested input_contents).
    + dump_pre_spatial.
      unfold CircularAreaDivideWrDataResult in *.
      intuition; subst; lia.
    + cancel.
  - apply unsigned_last_nbits_eq; lia.
  - apply unsigned_last_nbits_eq; lia.
  - apply unsigned_last_nbits_eq; lia.
  - apply unsigned_last_nbits_eq; lia.
  - unfold CircularAreaActualWriteLength.
    eexists; split.
    + unfold CircularAreaDataLengthResult.
      right; split; [intuition | reflexivity].
    + symmetry; apply Z.min_r; lia.
  - unfold CircularAreaActualWriteLength.
    eexists; split.
    + unfold CircularAreaDataLengthResult.
      right; split; [intuition | reflexivity].
    + symmetry; apply Z.min_r; lia.
  - unfold CircularAreaActualWriteLength.
    eexists; split.
    + unfold CircularAreaDataLengthResult.
      right; split; [intuition | reflexivity].
    + symmetry; apply Z.min_r; lia.
  - unfold CircularAreaActualWriteLength.
    eexists; split.
    + unfold CircularAreaDataLengthResult.
      right; split; [intuition | reflexivity].
    + symmetry; apply Z.min_r; lia.
Qed.

Lemma proof_of_CircularAreaWrite_entail_wit_2 : CircularAreaWrite_entail_wit_2.
Proof.
  aggressive_pre_process.
  all: try (dump_pre_spatial;
    match goal with
    | Hactual : CircularAreaActualWriteLength
        ?read ?write ?area ?status ?req ?actual,
      Hstate : CircularAreaDescriptorState
        ?read ?write ?area ?status ?contents
      |- _ =>
        pose proof
          (CircularAreaActualWriteLength_upper_bound__write_branch_segmentation
            read write area status req actual contents Hstate Hactual);
        lia
    end).
  all: try (dump_pre_spatial; lia).
  all: try (dump_pre_spatial;
    rewrite (sublist_split write_len_up requested data_length input_contents)
      by lia;
    reflexivity).
  all: try (dump_pre_spatial;
    rewrite Zlength_sublist by lia;
    lia).
  sep_apply_l_atomic
    (UCharArray.seg_split_to_seg data_buffer 0 write_len_down writeidx
      (sublist 0 writeidx contents)).
  - dump_pre_spatial.
    unfold CircularAreaDivideWrDataResult in *.
    match goal with
    | Hactual : CircularAreaActualWriteLength
        ?read ?write ?area ?status ?req ?actual,
      Hstate : CircularAreaDescriptorState
        ?read ?write ?area ?status ?contents
      |- _ =>
        pose proof
          (CircularAreaActualWriteLength_upper_bound__write_branch_segmentation
            read write area status req actual contents Hstate Hactual)
    end.
    intuition; lia.
  - rewrite !Zsublist_Zsublist by lia.
    replace (0 + 0) with 0 by lia.
    replace (write_len_down + 0) with write_len_down by lia.
    replace (write_len_down - 0 + 0) with write_len_down by lia.
    replace (writeidx - 0 + 0) with writeidx by lia.
    cancel.
Qed.

Lemma proof_of_CircularAreaWrite_entail_wit_3_1 : CircularAreaWrite_entail_wit_3_1.
Proof.
  aggressive_pre_process.
  all: try subst circular_area_entry.
  all: try subst input_buffer_entry.
  all: try subst force0.
  all: try subst data_buffer.
  all: try subst p_tail.
  all: try (dump_pre_spatial;
    unfold CircularAreaActualWriteLength;
    exists retval_2; split; [assumption | apply Z.min_l; lia]).
  all: try (dump_pre_spatial;
    unfold CircularAreaDescriptorState,
      CircularAreaDivideWrDataResult,
      CircularAreaDataLengthResult,
      CircularAreaIsFullResult in *;
    intuition; subst; try lia).
  sep_apply_l_atomic
    (UCharArray.full_split_to_seg p_head writeidx area_length contents).
  - dump_pre_spatial. lia.
  - sep_apply_l_atomic
      (UCharArray.seg_split_to_seg p_head writeidx
        (writeidx + data_length_pre) area_length
        (sublist writeidx area_length contents)).
    + dump_pre_spatial.
      unfold CircularAreaDivideWrDataResult in *.
      intuition; subst; lia.
    + replace (writeidx + data_length_pre - writeidx)
        with data_length_pre by lia.
      rewrite !Zsublist_Zsublist by lia.
      replace (0 + writeidx) with writeidx by lia.
      replace (data_length_pre + writeidx)
        with (writeidx + data_length_pre) by lia.
      replace (area_length - writeidx + writeidx)
        with area_length by lia.
      sep_apply_l_atomic
        (UCharArray.full_split_to_seg input_buffer_pre
          data_length_pre requested input_contents).
      * dump_pre_spatial. lia.
      * cancel.
Qed.

Lemma proof_of_CircularAreaWrite_entail_wit_3_2 : CircularAreaWrite_entail_wit_3_2.
Proof.
  aggressive_pre_process.
  all: try subst circular_area_entry.
  all: try subst input_buffer_entry.
  all: try subst force0.
  all: try subst data_buffer.
  all: try subst p_tail.
  all: try (dump_pre_spatial;
    unfold CircularAreaActualWriteLength;
    exists retval; split; [assumption | apply Z.min_r; lia]).
  all: try (dump_pre_spatial;
    unfold CircularAreaDescriptorState,
      CircularAreaDivideWrDataResult,
      CircularAreaDataLengthResult,
      CircularAreaIsFullResult in *;
    intuition; subst; try lia).
  sep_apply_l_atomic
    (UCharArray.full_split_to_seg p_head writeidx area_length contents).
  - dump_pre_spatial. lia.
  - sep_apply_l_atomic
      (UCharArray.seg_split_to_seg p_head writeidx
        (writeidx + (area_length - retval)) area_length
        (sublist writeidx area_length contents)).
    + dump_pre_spatial.
      unfold CircularAreaDivideWrDataResult in *.
      intuition; subst; lia.
    + replace (writeidx + (area_length - retval) - writeidx)
        with (area_length - retval) by lia.
      rewrite !Zsublist_Zsublist by lia.
      replace (0 + writeidx) with writeidx by lia.
      replace ((area_length - retval) + writeidx)
        with (writeidx + (area_length - retval)) by lia.
      replace (area_length - writeidx + writeidx)
        with area_length by lia.
      sep_apply_l_atomic
        (UCharArray.full_split_to_seg input_buffer_pre
          (area_length - retval) requested input_contents).
      * dump_pre_spatial. lia.
      * cancel.
  - unfold CircularAreaActualWriteLength.
    exists (Zlength contents); split.
    + unfold CircularAreaDataLengthResult.
      left; intuition.
    + symmetry; apply Z.min_r; lia.
Qed.

Lemma proof_of_CircularAreaWrite_entail_wit_3_3 : CircularAreaWrite_entail_wit_3_3.
Proof.
  aggressive_pre_process.
  all: try subst circular_area_entry.
  all: try subst input_buffer_entry.
  all: try subst force0.
  all: try subst data_buffer.
  all: try subst p_tail.
  all: try (dump_pre_spatial;
    unfold CircularAreaActualWriteLength;
    exists retval_2; split; [assumption | apply Z.min_l; lia]).
  all: try (dump_pre_spatial;
    unfold CircularAreaDescriptorState,
      CircularAreaDivideWrDataResult,
      CircularAreaDataLengthResult,
      CircularAreaIsFullResult in *;
    intuition; subst; try lia).
  sep_apply_l_atomic
    (UCharArray.full_split_to_seg p_head writeidx area_length contents).
  - dump_pre_spatial. lia.
  - sep_apply_l_atomic
      (UCharArray.seg_split_to_seg p_head writeidx
        (writeidx + data_length_pre) area_length
        (sublist writeidx area_length contents)).
    + dump_pre_spatial.
      unfold CircularAreaDivideWrDataResult in *.
      intuition; subst; lia.
    + replace (writeidx + data_length_pre - writeidx)
        with data_length_pre by lia.
      rewrite !Zsublist_Zsublist by lia.
      replace (0 + writeidx) with writeidx by lia.
      replace (data_length_pre + writeidx)
        with (writeidx + data_length_pre) by lia.
      replace (area_length - writeidx + writeidx)
        with area_length by lia.
      sep_apply_l_atomic
        (UCharArray.full_split_to_seg input_buffer_pre
          data_length_pre requested input_contents).
      * dump_pre_spatial. lia.
      * cancel.
  - unfold CircularAreaActualWriteLength.
    eexists; split.
    + unfold CircularAreaDataLengthResult.
      right; split; [intuition | reflexivity].
    + symmetry; apply Z.min_l; lia.
  - unfold CircularAreaActualWriteLength.
    eexists; split.
    + unfold CircularAreaDataLengthResult.
      right; split; [intuition | reflexivity].
    + symmetry; apply Z.min_l; lia.
  - unfold CircularAreaActualWriteLength.
    eexists; split.
    + unfold CircularAreaDataLengthResult.
      right; split; [intuition | reflexivity].
    + symmetry; apply Z.min_l; lia.
  - unfold CircularAreaActualWriteLength.
    eexists; split.
    + unfold CircularAreaDataLengthResult.
      right; split; [intuition | reflexivity].
    + symmetry; apply Z.min_l; lia.
Qed.

Lemma proof_of_CircularAreaWrite_entail_wit_3_4 : CircularAreaWrite_entail_wit_3_4.
Proof.
  aggressive_pre_process.
  all: try subst circular_area_entry.
  all: try subst input_buffer_entry.
  all: try subst force0.
  all: try subst data_buffer.
  all: try subst p_tail.
  all: try (dump_pre_spatial;
    unfold CircularAreaActualWriteLength;
    exists retval; split; [assumption | apply Z.min_r; lia]).
  all: try (dump_pre_spatial;
    unfold CircularAreaDescriptorState,
      CircularAreaDivideWrDataResult,
      CircularAreaDataLengthResult,
      CircularAreaIsFullResult in *;
    intuition; subst; try lia).
  sep_apply_l_atomic
    (UCharArray.full_split_to_seg p_head writeidx area_length contents).
  - dump_pre_spatial. lia.
  - sep_apply_l_atomic
      (UCharArray.seg_split_to_seg p_head writeidx
        (writeidx + (area_length - retval)) area_length
        (sublist writeidx area_length contents)).
    + dump_pre_spatial.
      unfold CircularAreaDivideWrDataResult in *.
      intuition; subst; lia.
    + replace (writeidx + (area_length - retval) - writeidx)
        with (area_length - retval) by lia.
      rewrite !Zsublist_Zsublist by lia.
      replace (0 + writeidx) with writeidx by lia.
      replace ((area_length - retval) + writeidx)
        with (writeidx + (area_length - retval)) by lia.
      replace (area_length - writeidx + writeidx)
        with area_length by lia.
      sep_apply_l_atomic
        (UCharArray.full_split_to_seg input_buffer_pre
          (area_length - retval) requested input_contents).
      * dump_pre_spatial. lia.
      * cancel.
  - unfold CircularAreaActualWriteLength.
    eexists; split.
    + unfold CircularAreaDataLengthResult.
      right; split; [intuition | reflexivity].
    + symmetry; apply Z.min_r; lia.
  - unfold CircularAreaActualWriteLength.
    eexists; split.
    + unfold CircularAreaDataLengthResult.
      right; split; [intuition | reflexivity].
    + symmetry; apply Z.min_r; lia.
  - unfold CircularAreaActualWriteLength.
    eexists; split.
    + unfold CircularAreaDataLengthResult.
      right; split; [intuition | reflexivity].
    + symmetry; apply Z.min_r; lia.
  - unfold CircularAreaActualWriteLength.
    eexists; split.
    + unfold CircularAreaDataLengthResult.
      right; split; [intuition | reflexivity].
    + symmetry; apply Z.min_r; lia.
Qed.

Lemma proof_of_CircularAreaWrite_return_wit_1 : CircularAreaWrite_return_wit_1.
Proof.
  aggressive_pre_process.
  pose proof PreH7 as Hactual.
  unfold CircularAreaActualWriteLength in Hactual.
  destruct Hactual as [used [Hused_result Hactual]].
  pose proof (Z.le_min_l requested (area_length - used)) as Hdata_requested.
  rewrite <- Hactual in Hdata_requested.
  Exists (((sublist write_len_up data_length input_contents) ++
           (sublist write_len_down writeidx contents)) ++
          (sublist 0 write_len_up input_contents)).
  split_pure_spatial.
  - sep_apply_l_atomic
      (UCharArray.seg_merge_to_seg data_buffer 0 write_len_down writeidx
        (sublist write_len_up data_length input_contents)
        (sublist write_len_down writeidx contents)).
    + dump_pre_spatial. lia.
    + sep_apply_l_atomic
        (UCharArray.seg_merge_to_seg data_buffer 0 writeidx area_length
          (sublist write_len_up data_length input_contents ++
           sublist write_len_down writeidx contents)
          (sublist 0 write_len_up input_contents)).
      * dump_pre_spatial.
        unfold CircularAreaDescriptorState in PreH16.
        lia.
      * sep_apply_l_atomic
          (UCharArray.seg_to_full data_buffer 0 area_length
            ((sublist write_len_up data_length input_contents ++
              sublist write_len_down writeidx contents) ++
             sublist 0 write_len_up input_contents)).
        replace (data_buffer + 0 * sizeof(UCHAR)) with data_buffer by lia.
        replace (area_length - 0) with area_length by lia.
        sep_apply_l_atomic
          (UCharArray.seg_merge_to_seg input_buffer_entry 0 write_len_up data_length
            (sublist 0 write_len_up input_contents)
            (sublist write_len_up data_length input_contents)).
        -- dump_pre_spatial.
           unfold CircularAreaDescriptorState in PreH16.
           lia.
        -- rewrite <- (sublist_split 0 data_length write_len_up input_contents) by lia.
           sep_apply_l_atomic
             (UCharArray.seg_merge_to_seg input_buffer_entry 0 data_length requested
               (sublist 0 data_length input_contents)
               (sublist data_length requested input_contents)).
           ++ dump_pre_spatial.
              unfold CircularAreaDescriptorState in PreH16.
              lia.
           ++ rewrite <- (sublist_split 0 requested data_length input_contents) by lia.
              rewrite (sublist_self input_contents requested) by lia.
              sep_apply_l_atomic
                (UCharArray.seg_to_full input_buffer_entry 0 requested input_contents).
              replace (input_buffer_entry + 0 * sizeof(UCHAR))
                with input_buffer_entry by lia.
              replace (requested - 0) with requested by lia.
              cancel.
  - entailer!.
    unfold CircularAreaDescriptorState in PreH16.
    destruct PreH16 as
      [Hread_bounds [Hread_lt [Hwrite_bounds [Hwrite_lt
       [Harea_bounds [Hstatus_bounds Hcontents]]]]]].
    unfold CircularAreaWriteSuccess.
    exists used, data_length.
    split; [exact Hused_result |].
    split; [exact Hactual |].
    split; [lia |].
    split.
    + apply circular_area_ring_update_wrap__write_exit_ring_reconstruction;
        try assumption; lia.
    + split.
      * f_equal.
        symmetry.
        apply circular_area_wrap_mod_index__write_exit_ring_reconstruction
          with (up := write_len_up); try assumption; lia.
      * split.
        -- right. split; [assumption | reflexivity].
        -- split; reflexivity.
Qed.

Lemma proof_of_CircularAreaWrite_return_wit_2 : CircularAreaWrite_return_wit_2.
Proof.
  aggressive_pre_process.
  pose proof PreH7 as Hactual.
  unfold CircularAreaActualWriteLength in Hactual.
  destruct Hactual as [used [Hused_result Hactual]].
  Exists (((sublist 0 writeidx contents) ++
           (sublist 0 data_length input_contents)) ++
          (sublist (writeidx + data_length) area_length contents)).
  split_pure_spatial.
  - sep_apply_l_atomic
      (UCharArray.seg_merge_to_seg data_buffer 0 writeidx
        (writeidx + data_length)
        (sublist 0 writeidx contents)
        (sublist 0 data_length input_contents)).
    + dump_pre_spatial. lia.
    + sep_apply_l_atomic
        (UCharArray.seg_merge_to_seg data_buffer 0
          (writeidx + data_length) area_length
          (sublist 0 writeidx contents ++ sublist 0 data_length input_contents)
          (sublist (writeidx + data_length) area_length contents)).
      * dump_pre_spatial. lia.
      * sep_apply_l_atomic
          (UCharArray.seg_to_full data_buffer 0 area_length
            ((sublist 0 writeidx contents ++ sublist 0 data_length input_contents) ++
             sublist (writeidx + data_length) area_length contents)).
        replace (data_buffer + 0 * sizeof(UCHAR)) with data_buffer by lia.
        replace (area_length - 0) with area_length by lia.
        sep_apply_l_atomic
          (UCharArray.seg_merge_to_seg input_buffer_entry 0 data_length requested
            (sublist 0 data_length input_contents)
            (sublist data_length requested input_contents)).
        -- dump_pre_spatial. lia.
        -- rewrite <- (sublist_split 0 requested data_length input_contents) by lia.
           rewrite (sublist_self input_contents requested) by lia.
           sep_apply_l_atomic
             (UCharArray.seg_to_full input_buffer_entry 0 requested input_contents).
           replace (input_buffer_entry + 0 * sizeof(UCHAR))
             with input_buffer_entry by lia.
           replace (requested - 0) with requested by lia.
           cancel.
  - entailer!.
    unfold CircularAreaDescriptorState in PreH16.
    destruct PreH16 as
      [Hread_bounds [Hread_lt [Hwrite_bounds [Hwrite_lt
       [Harea_bounds [Hstatus_bounds Hcontents]]]]]].
    unfold CircularAreaWriteSuccess.
    exists used, data_length.
    split; [exact Hused_result |].
    split; [exact Hactual |].
    split; [lia |].
    split.
    + apply circular_area_ring_update_nowrap__write_exit_ring_reconstruction;
        try assumption; lia.
    + split; [reflexivity |].
      split.
      * right. split; [assumption | reflexivity].
      * split; reflexivity.
Qed.

Lemma proof_of_CircularAreaWrite_return_wit_3 : CircularAreaWrite_return_wit_3.
Proof.
  aggressive_pre_process.
  pose proof PreH7 as Hactual.
  unfold CircularAreaActualWriteLength in Hactual.
  destruct Hactual as [used [Hused_result Hactual]].
  pose proof (Z.le_min_l requested (area_length - used)) as Hdata_requested.
  rewrite <- Hactual in Hdata_requested.
  Exists (((sublist write_len_up data_length input_contents) ++
           (sublist write_len_down writeidx contents)) ++
          (sublist 0 write_len_up input_contents)).
  split_pure_spatial.
  - sep_apply_l_atomic
      (UCharArray.seg_merge_to_seg data_buffer 0 write_len_down writeidx
        (sublist write_len_up data_length input_contents)
        (sublist write_len_down writeidx contents)).
    + dump_pre_spatial. lia.
    + sep_apply_l_atomic
        (UCharArray.seg_merge_to_seg data_buffer 0 writeidx area_length
          (sublist write_len_up data_length input_contents ++
           sublist write_len_down writeidx contents)
          (sublist 0 write_len_up input_contents)).
      * dump_pre_spatial.
        unfold CircularAreaDescriptorState in PreH16.
        lia.
      * sep_apply_l_atomic
          (UCharArray.seg_to_full data_buffer 0 area_length
            ((sublist write_len_up data_length input_contents ++
              sublist write_len_down writeidx contents) ++
             sublist 0 write_len_up input_contents)).
        replace (data_buffer + 0 * sizeof(UCHAR)) with data_buffer by lia.
        replace (area_length - 0) with area_length by lia.
        sep_apply_l_atomic
          (UCharArray.seg_merge_to_seg input_buffer_entry 0 write_len_up data_length
            (sublist 0 write_len_up input_contents)
            (sublist write_len_up data_length input_contents)).
        -- dump_pre_spatial.
           unfold CircularAreaDescriptorState in PreH16.
           lia.
        -- rewrite <- (sublist_split 0 data_length write_len_up input_contents) by lia.
           sep_apply_l_atomic
             (UCharArray.seg_merge_to_seg input_buffer_entry 0 data_length requested
               (sublist 0 data_length input_contents)
               (sublist data_length requested input_contents)).
           ++ dump_pre_spatial.
              unfold CircularAreaDescriptorState in PreH16.
              lia.
           ++ rewrite <- (sublist_split 0 requested data_length input_contents) by lia.
              rewrite (sublist_self input_contents requested) by lia.
              sep_apply_l_atomic
                (UCharArray.seg_to_full input_buffer_entry 0 requested input_contents).
              replace (input_buffer_entry + 0 * sizeof(UCHAR))
                with input_buffer_entry by lia.
              replace (requested - 0) with requested by lia.
              cancel.
  - entailer!.
    unfold CircularAreaDescriptorState in PreH16.
    destruct PreH16 as
      [Hread_bounds [Hread_lt [Hwrite_bounds [Hwrite_lt
       [Harea_bounds [Hstatus_bounds Hcontents]]]]]].
    unfold CircularAreaWriteSuccess.
    exists used, data_length.
    split; [exact Hused_result |].
    split; [exact Hactual |].
    split; [lia |].
    split.
    + apply circular_area_ring_update_wrap__write_exit_ring_reconstruction;
        try assumption; lia.
    + split.
      * f_equal.
        symmetry.
        apply circular_area_wrap_mod_index__write_exit_ring_reconstruction
          with (up := write_len_up); try assumption; lia.
      * split.
        -- left. split; [assumption | reflexivity].
        -- split; reflexivity.
Qed.

Lemma proof_of_CircularAreaWrite_return_wit_4 : CircularAreaWrite_return_wit_4.
Proof.
  aggressive_pre_process.
  pose proof PreH7 as Hactual.
  unfold CircularAreaActualWriteLength in Hactual.
  destruct Hactual as [used [Hused_result Hactual]].
  Exists (((sublist 0 writeidx contents) ++
           (sublist 0 data_length input_contents)) ++
          (sublist (writeidx + data_length) area_length contents)).
  split_pure_spatial.
  - sep_apply_l_atomic
      (UCharArray.seg_merge_to_seg data_buffer 0 writeidx
        (writeidx + data_length)
        (sublist 0 writeidx contents)
        (sublist 0 data_length input_contents)).
    + dump_pre_spatial. lia.
    + sep_apply_l_atomic
        (UCharArray.seg_merge_to_seg data_buffer 0
          (writeidx + data_length) area_length
          (sublist 0 writeidx contents ++ sublist 0 data_length input_contents)
          (sublist (writeidx + data_length) area_length contents)).
      * dump_pre_spatial. lia.
      * sep_apply_l_atomic
          (UCharArray.seg_to_full data_buffer 0 area_length
            ((sublist 0 writeidx contents ++ sublist 0 data_length input_contents) ++
             sublist (writeidx + data_length) area_length contents)).
        replace (data_buffer + 0 * sizeof(UCHAR)) with data_buffer by lia.
        replace (area_length - 0) with area_length by lia.
        sep_apply_l_atomic
          (UCharArray.seg_merge_to_seg input_buffer_entry 0 data_length requested
            (sublist 0 data_length input_contents)
            (sublist data_length requested input_contents)).
        -- dump_pre_spatial. lia.
        -- rewrite <- (sublist_split 0 requested data_length input_contents) by lia.
           rewrite (sublist_self input_contents requested) by lia.
           sep_apply_l_atomic
             (UCharArray.seg_to_full input_buffer_entry 0 requested input_contents).
           replace (input_buffer_entry + 0 * sizeof(UCHAR))
             with input_buffer_entry by lia.
           replace (requested - 0) with requested by lia.
           cancel.
  - entailer!.
    unfold CircularAreaDescriptorState in PreH16.
    destruct PreH16 as
      [Hread_bounds [Hread_lt [Hwrite_bounds [Hwrite_lt
       [Harea_bounds [Hstatus_bounds Hcontents]]]]]].
    unfold CircularAreaWriteSuccess.
    exists used, data_length.
    split; [exact Hused_result |].
    split; [exact Hactual |].
    split; [lia |].
    split.
    + apply circular_area_ring_update_nowrap__write_exit_ring_reconstruction;
        try assumption; lia.
    + split; [reflexivity |].
      split.
      * left. split; [assumption | reflexivity].
      * split; reflexivity.
Qed.

Lemma proof_of_CircularAreaWrite_return_wit_5 : CircularAreaWrite_return_wit_5.
Proof.
  pre_process.
  assert (Hfull : readidx = writeidx /\ b_status <> 0).
  { unfold CircularAreaIsFullResult in PreH3.
    destruct PreH3 as [[Hidx [Hstatus Hresult]] | [Hcond Hresult]].
    - split; assumption.
    - exfalso. apply PreH2. lia. }
  destruct Hfull as [Hidx Hstatus].
  subst p_head.
  subst p_tail.
  Left.
  entailer!.
Qed.

Lemma proof_of_CircularAreaWrite_return_wit_6 : CircularAreaWrite_return_wit_6.
Proof.
  aggressive_pre_process.
  entailer!.
  pose proof (Zlength_nonneg input_contents).
  lia.
Qed.

Lemma proof_of_CircularAreaWrite_partial_solve_wit_8_pure : CircularAreaWrite_partial_solve_wit_8_pure.
Proof.
  aggressive_pre_process; entailer!.
  all: match goal with
       | H : CircularAreaDescriptorState _ _ _ _ _ |- _ =>
           unfold CircularAreaDescriptorState in H;
           destruct H as [? [? [? [? [? [? ?]]]]]]
       end.
  all: rewrite Zlength_sublist by lia.
  all: entailer!.
Qed.

Lemma proof_of_CircularAreaWrite_partial_solve_wit_9_pure : CircularAreaWrite_partial_solve_wit_9_pure.
Proof.
  aggressive_pre_process; entailer!.
  all: match goal with
       | H : CircularAreaActualWriteLength _ _ _ _ _ _ |- _ =>
           unfold CircularAreaActualWriteLength in H;
           destruct H as [used [? Hactual]];
           pose proof (Z.le_min_l requested (area_length - used)) as Hrequested;
           rewrite <- Hactual in Hrequested
       end.
  all: match goal with
       | H : CircularAreaDescriptorState _ _ _ _ _ |- _ =>
           unfold CircularAreaDescriptorState in H;
           destruct H as [? [? [? [? [? [? ?]]]]]]
       end.
  all: rewrite Zlength_sublist by lia.
  all: entailer!.
Qed.

Lemma proof_of_CircularAreaWrite_partial_solve_wit_10_pure : CircularAreaWrite_partial_solve_wit_10_pure.
Proof.
  aggressive_pre_process; entailer!.
  all: match goal with
       | H : CircularAreaDescriptorState _ _ _ _ _ |- _ =>
           unfold CircularAreaDescriptorState in H;
           destruct H as [? [? [? [? [? [? ?]]]]]]
       end.
  all: rewrite Zlength_sublist by lia.
  all: entailer!.
Qed.

Lemma proof_of_CircularAreaGetDataLength_derive_circular_area_data_length_callable_by_circular_area_data_length_body : CircularAreaGetDataLength_derive_circular_area_data_length_callable_by_circular_area_data_length_body.
Proof.
  pre_process.
  Exists data_buffer_circular_area_data_length_callable
    readidx_circular_area_data_length_callable
    writeidx_circular_area_data_length_callable
    p_head_circular_area_data_length_callable
    p_tail_circular_area_data_length_callable
    area_length_circular_area_data_length_callable
    b_status_circular_area_data_length_callable
    LitMap_circular_area_data_length_callable
    operations_circular_area_data_length_callable
    contents_circular_area_data_length_callable.
  Right.
  entailer!.
  apply derivable1_wand_sepcon_adjoint.
  Split.
  - Intros retval_2.
    entailer!.
  - Intros retval_2.
    Exists retval_2.
    entailer!.
Qed.

Lemma proof_of_CircularAreaIsFull_derive_circular_area_is_full_callable_by_circular_area_is_full_body : CircularAreaIsFull_derive_circular_area_is_full_callable_by_circular_area_is_full_body.
Proof.
  pre_process.
  Exists data_buffer_circular_area_is_full_callable
    readidx_circular_area_is_full_callable
    writeidx_circular_area_is_full_callable
    p_head_circular_area_is_full_callable
    p_tail_circular_area_is_full_callable
    area_length_circular_area_is_full_callable
    b_status_circular_area_is_full_callable
    LitMap_circular_area_is_full_callable
    operations_circular_area_is_full_callable
    contents_circular_area_is_full_callable.
  Right.
  entailer!.
  apply derivable1_wand_sepcon_adjoint.
  Split.
  - Intros retval_2.
    entailer!.
  - Intros retval_2.
    Exists retval_2.
    entailer!.
Qed.
