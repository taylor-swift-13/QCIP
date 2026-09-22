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
  unfold CircularAreaDataLengthResult, CircularAreaIsFullResult in *.
  subst.
  entailer!.
  all: match goal with
       | |- context [Z.rem (unsigned_last_nbits ?u 32) ?y] =>
           pose proof (unsigned_Lastnbits_range u 32 ltac:(lia));
           pose proof (Z.rem_bound_pos_pos (unsigned_last_nbits u 32) y
             ltac:(lia) ltac:(lia));
           lia
       end.
Qed.

Lemma proof_of_CircularAreaGetDataLength_return_wit_2 : CircularAreaGetDataLength_return_wit_2.
Proof.
  pre_process.
  unfold CircularAreaDataLengthResult, CircularAreaIsFullResult in *.
  subst.
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
  all: try (unfold unsigned_last_nbits;
    rewrite Z.mod_small by lia; reflexivity).
  all: try (unfold CircularAreaActualWriteLength;
    eexists; split;
    [ unfold CircularAreaDataLengthResult;
      right; split; [intuition | reflexivity]
    | symmetry; apply Z.min_l; lia ]).
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
  all: try (unfold unsigned_last_nbits at 1;
    rewrite Z.mod_small by lia; reflexivity).
  all: try (unfold CircularAreaActualWriteLength;
    eexists; split;
    [ unfold CircularAreaDataLengthResult;
      right; split; [intuition | reflexivity]
    | symmetry; apply Z.min_r; lia ]).
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

Lemma proof_of_CircularAreaWrite_entail_wit_2 : CircularAreaWrite_entail_wit_2.
Proof.
  aggressive_pre_process.
  sep_apply_l_atomic
    (UCharArray.seg_split_to_seg data_buffer 0 write_len_down writeidx
      (sublist 0 writeidx contents)).
  - dump_pre_spatial.
    pose proof
      (CircularAreaActualWriteLength_upper_bound__write_branch_segmentation
        readidx writeidx area_length b_status requested data_length contents
        PreH19 PreH7).
    lia.
  - rewrite Zsublist_Zsublist0 by lia.
    rewrite Zsublist_Zsublist0 by lia.
    replace (write_len_down - 0) with write_len_down by lia.
    replace (writeidx - 0) with writeidx by lia.
    cancel.
  - dump_pre_spatial.
    pose proof
      (CircularAreaActualWriteLength_upper_bound__write_branch_segmentation
        readidx writeidx area_length b_status requested data_length contents
        PreH19 PreH7).
    lia.
  - dump_pre_spatial.
    rewrite sublist_split with (mid := data_length) by lia;
    reflexivity.
  - dump_pre_spatial.
    rewrite Zlength_sublist by lia;
    lia.
Qed.

Lemma proof_of_CircularAreaWrite_entail_wit_3_1 : CircularAreaWrite_entail_wit_3_1.
Proof.
  aggressive_pre_process.
  sep_apply_l_atomic
    (UCharArray.full_split_to_seg p_head writeidx area_length contents).
  - dump_pre_spatial. lia.
  - sep_apply_l_atomic
      (UCharArray.seg_split_to_seg p_head writeidx
        (writeidx + data_length_pre) area_length
        (sublist writeidx area_length contents)).
    + dump_pre_spatial.
      unfold CircularAreaDivideWrDataResult in PreH5.
      subst retval_3.
      intuition; lia.
    + sep_apply_l_atomic
        (UCharArray.full_split_to_seg input_buffer_pre
          data_length_pre requested input_contents).
      * dump_pre_spatial. lia.
      * rewrite Zsublist_Zsublist by lia.
        rewrite Zsublist_Zsublist by lia.
        replace (0 + writeidx) with writeidx by lia.
        replace (writeidx + data_length_pre - writeidx + writeidx)
          with (writeidx + data_length_pre) by lia.
        replace (area_length - writeidx + writeidx)
          with area_length by lia.
        subst circular_area_entry.
        subst input_buffer_entry.
        subst data_buffer.
        subst p_tail.
        cancel.
  - dump_pre_spatial.
    unfold CircularAreaDivideWrDataResult in *.
    intuition; subst; lia.
  - dump_pre_spatial.
    unfold CircularAreaDivideWrDataResult in *.
    intuition; subst; lia.
  - dump_pre_spatial.
    unfold CircularAreaActualWriteLength.
    exists retval_2; split; [assumption |].
    rewrite <- PreH22.
    symmetry; apply Z.min_l; lia.
Qed.

Lemma proof_of_CircularAreaWrite_entail_wit_3_2 : CircularAreaWrite_entail_wit_3_2.
Proof.
  aggressive_pre_process.
  sep_apply_l_atomic
    (UCharArray.full_split_to_seg p_head writeidx area_length contents).
  - dump_pre_spatial. lia.
  - sep_apply_l_atomic
      (UCharArray.seg_split_to_seg p_head writeidx
        (writeidx + (area_length - retval)) area_length
        (sublist writeidx area_length contents)).
    + dump_pre_spatial.
      unfold CircularAreaDivideWrDataResult in PreH5.
      subst retval_3.
      intuition; lia.
    + sep_apply_l_atomic
        (UCharArray.full_split_to_seg input_buffer_pre
          (area_length - retval) requested input_contents).
      * dump_pre_spatial. lia.
      * rewrite Zsublist_Zsublist by lia.
        rewrite Zsublist_Zsublist by lia.
        replace (0 + writeidx) with writeidx by lia.
        replace (writeidx + (area_length - retval) - writeidx + writeidx)
          with (writeidx + (area_length - retval)) by lia.
        replace (area_length - writeidx + writeidx)
          with area_length by lia.
        subst circular_area_entry.
        subst input_buffer_entry.
        subst data_buffer.
        subst p_tail.
        cancel.
  - dump_pre_spatial.
    unfold CircularAreaDivideWrDataResult in *.
    intuition; subst; lia.
  - dump_pre_spatial.
    unfold CircularAreaDivideWrDataResult in *.
    intuition; subst; lia.
  - dump_pre_spatial.
    unfold CircularAreaActualWriteLength.
    exists retval; split; [assumption |].
    symmetry; apply Z.min_r; lia.
Qed.

Lemma proof_of_CircularAreaWrite_entail_wit_3_3 : CircularAreaWrite_entail_wit_3_3.
Proof.
  aggressive_pre_process.
  sep_apply_l_atomic
    (UCharArray.full_split_to_seg p_head writeidx area_length contents).
  - dump_pre_spatial. lia.
  - sep_apply_l_atomic
      (UCharArray.seg_split_to_seg p_head writeidx
        (writeidx + data_length_pre) area_length
        (sublist writeidx area_length contents)).
    + dump_pre_spatial.
      unfold CircularAreaDivideWrDataResult in PreH5.
      subst retval_3.
      intuition; lia.
    + sep_apply_l_atomic
        (UCharArray.full_split_to_seg input_buffer_pre
          data_length_pre requested input_contents).
      * dump_pre_spatial. lia.
      * rewrite Zsublist_Zsublist by lia.
        rewrite Zsublist_Zsublist by lia.
        replace (0 + writeidx) with writeidx by lia.
        replace (writeidx + data_length_pre - writeidx + writeidx)
          with (writeidx + data_length_pre) by lia.
        replace (area_length - writeidx + writeidx)
          with area_length by lia.
        subst circular_area_entry.
        subst input_buffer_entry.
        subst data_buffer.
        subst p_tail.
        cancel.
  - dump_pre_spatial.
    unfold CircularAreaDivideWrDataResult in *.
    intuition; subst; lia.
  - dump_pre_spatial.
    unfold CircularAreaDivideWrDataResult in *.
    intuition; subst; lia.
  - dump_pre_spatial.
    unfold CircularAreaActualWriteLength.
    exists retval_2; split; [assumption |].
    rewrite <- PreH21.
    symmetry; apply Z.min_l; lia.
  - dump_pre_spatial.
    unfold CircularAreaIsFullResult in PreH13.
    subst retval.
    intuition.
Qed.

Lemma proof_of_CircularAreaWrite_entail_wit_3_4 : CircularAreaWrite_entail_wit_3_4.
Proof.
  aggressive_pre_process.
  sep_apply_l_atomic
    (UCharArray.full_split_to_seg p_head writeidx area_length contents).
  - dump_pre_spatial. lia.
  - sep_apply_l_atomic
      (UCharArray.seg_split_to_seg p_head writeidx
        (writeidx + (area_length - retval)) area_length
        (sublist writeidx area_length contents)).
    + dump_pre_spatial.
      unfold CircularAreaDivideWrDataResult in PreH5.
      subst retval_3.
      intuition; lia.
    + sep_apply_l_atomic
        (UCharArray.full_split_to_seg input_buffer_pre
          (area_length - retval) requested input_contents).
      * dump_pre_spatial. lia.
      * rewrite Zsublist_Zsublist by lia.
        rewrite Zsublist_Zsublist by lia.
        replace (0 + writeidx) with writeidx by lia.
        replace (writeidx + (area_length - retval) - writeidx + writeidx)
          with (writeidx + (area_length - retval)) by lia.
        replace (area_length - writeidx + writeidx)
          with area_length by lia.
        subst circular_area_entry.
        subst input_buffer_entry.
        subst data_buffer.
        subst p_tail.
        cancel.
  - dump_pre_spatial.
    unfold CircularAreaDivideWrDataResult in *.
    intuition; subst; lia.
  - dump_pre_spatial.
    unfold CircularAreaDivideWrDataResult in *.
    intuition; subst; lia.
  - dump_pre_spatial.
    unfold CircularAreaActualWriteLength.
    exists retval; split; [assumption |].
    symmetry; apply Z.min_r; lia.
  - dump_pre_spatial.
    unfold CircularAreaIsFullResult in PreH13.
    subst retval_2.
    intuition.
Qed.

Lemma proof_of_CircularAreaWrite_return_wit_1 : CircularAreaWrite_return_wit_1.
Proof.
  aggressive_pre_process.
  Exists ((sublist write_len_up data_length input_contents ++
           sublist write_len_down writeidx contents) ++
          sublist 0%Z write_len_up input_contents).
  pose proof PreH16 as Hstate.
  pose proof (CircularAreaActualWriteLength_upper_bound__write_branch_segmentation
    readidx writeidx area_length b_status requested data_length contents
    Hstate PreH7) as Hactual_le_area.
  unfold CircularAreaDescriptorState in PreH16.
  destruct PreH16 as [Hread [Hwrite [Harea [Hstatus Hcontents]]]].
  unfold CircularAreaActualWriteLength in PreH7.
  destruct PreH7 as [used [Hused Hactual]].
  assert (Hactual_le_requested : data_length <= requested).
  { rewrite Hactual. apply Z.le_min_l. }
  assert (Hinput_decomp :
    input_contents =
      ((sublist 0 write_len_up input_contents ++
        sublist write_len_up data_length input_contents) ++
       sublist data_length requested input_contents)).
  { rewrite <- (sublist_split 0 data_length write_len_up input_contents) by lia.
    rewrite <- (sublist_split 0 requested data_length input_contents) by lia.
    rewrite (sublist_self input_contents requested) by lia.
    reflexivity. }
  assert (Hring : CircularAreaRingUpdate contents input_contents
    ((sublist write_len_up data_length input_contents ++
      sublist write_len_down writeidx contents) ++
     sublist 0 write_len_up input_contents)
    area_length writeidx data_length).
  { eapply circular_area_ring_update_wrap__write_exit_ring_reconstruction;
      eauto; lia. }
  assert (Hrem : Z.rem (writeidx + data_length) area_length = write_len_down).
  { eapply circular_area_wrap_mod_index__write_exit_ring_reconstruction;
      eauto; lia. }
  assert (Hdown_u : unsigned_last_nbits write_len_down 8 = write_len_down).
  { apply unsigned_last_nbits_eq. lia. }
  pose proof Hring as Hring_facts.
  unfold CircularAreaRingUpdate in Hring_facts.
  destruct Hring_facts as [_ [Hafter _]].
  split_pure_spatial.
  - sep_apply (UCharArray.seg_merge_to_seg data_buffer 0 write_len_down writeidx
      (sublist write_len_up data_length input_contents)
      (sublist write_len_down writeidx contents)); try lia.
    sep_apply (UCharArray.seg_merge_to_full data_buffer 0 writeidx area_length
      (sublist write_len_up data_length input_contents ++ sublist write_len_down writeidx contents)
      (sublist 0 write_len_up input_contents)); try lia.
    sep_apply (UCharArray.seg_merge_to_seg input_buffer_entry 0 write_len_up data_length
      (sublist 0 write_len_up input_contents)
      (sublist write_len_up data_length input_contents)); try lia.
    sep_apply (UCharArray.seg_merge_to_full input_buffer_entry 0 data_length requested
      (sublist 0 write_len_up input_contents ++ sublist write_len_up data_length input_contents)
      (sublist data_length requested input_contents)); try lia.
    rewrite <- Hinput_decomp.
    replace (data_buffer + 0 * sizeof(UCHAR)) with data_buffer by lia.
    replace (area_length - 0) with area_length by lia.
    replace (input_buffer_entry + 0 * sizeof(UCHAR)) with input_buffer_entry by lia.
    replace (requested - 0) with requested by lia.
    entailer!.
  - split_pures.
    + dump_pre_spatial. exact PreH2.
    + dump_pre_spatial. exact PreH3.
    + dump_pre_spatial. exact PreH4.
    + dump_pre_spatial. exact PreH6.
    + dump_pre_spatial.
      unfold CircularAreaWriteSuccess.
      exists used, data_length.
      split; [exact Hused |].
      split; [exact Hactual |].
      split; [lia |].
      split; [exact Hring |].
      split; [rewrite Hrem; reflexivity |].
      split; [right; split; [exact PreH17 | reflexivity] |].
      split; reflexivity.
    + dump_pre_spatial.
      unfold CircularAreaDescriptorState.
      rewrite Hdown_u.
      repeat split; try lia.
Qed.

Lemma proof_of_CircularAreaWrite_return_wit_2 : CircularAreaWrite_return_wit_2.
Proof.
  aggressive_pre_process.
  Exists ((sublist 0 writeidx contents ++ sublist 0 data_length input_contents) ++
          sublist (writeidx + data_length) area_length contents).
  pose proof PreH16 as Hstate.
  pose proof (CircularAreaActualWriteLength_upper_bound__write_branch_segmentation
    readidx writeidx area_length b_status requested data_length contents
    Hstate PreH7) as Hactual_le_area.
  unfold CircularAreaDescriptorState in PreH16.
  destruct PreH16 as [Hread [Hwrite [Harea [Hstatus Hcontents]]]].
  unfold CircularAreaActualWriteLength in PreH7.
  destruct PreH7 as [used [Hused Hactual]].
  assert (Hinput_decomp :
    input_contents = sublist 0 data_length input_contents ++
                     sublist data_length requested input_contents).
  { rewrite <- (sublist_split 0 requested data_length input_contents) by lia.
    rewrite (sublist_self input_contents requested) by lia.
    reflexivity. }
  assert (Hring : CircularAreaRingUpdate contents input_contents
    ((sublist 0 writeidx contents ++ sublist 0 data_length input_contents) ++
     sublist (writeidx + data_length) area_length contents)
    area_length writeidx data_length).
  { eapply circular_area_ring_update_nowrap__write_exit_ring_reconstruction;
      eauto; lia. }
  pose proof (Z.rem_bound_pos_pos (writeidx + data_length) area_length
    ltac:(lia) ltac:(lia)) as Hrem_bounds.
  assert (Hidx_u : unsigned_last_nbits (Z.rem (writeidx + data_length) area_length) 8 =
                   Z.rem (writeidx + data_length) area_length).
  { apply unsigned_last_nbits_eq. lia. }
  pose proof Hring as Hring_facts.
  unfold CircularAreaRingUpdate in Hring_facts.
  destruct Hring_facts as [_ [Hafter _]].
  split_pure_spatial.
  - sep_apply (UCharArray.seg_merge_to_seg data_buffer 0 writeidx (writeidx + data_length)
      (sublist 0 writeidx contents) (sublist 0 data_length input_contents)); try lia.
    sep_apply (UCharArray.seg_merge_to_full data_buffer 0 (writeidx + data_length) area_length
      (sublist 0 writeidx contents ++ sublist 0 data_length input_contents)
      (sublist (writeidx + data_length) area_length contents)); try lia.
    sep_apply (UCharArray.seg_merge_to_full input_buffer_entry 0 data_length requested
      (sublist 0 data_length input_contents)
      (sublist data_length requested input_contents)); try lia.
    rewrite <- Hinput_decomp.
    replace (data_buffer + 0 * sizeof(UCHAR)) with data_buffer by lia.
    replace (area_length - 0) with area_length by lia.
    replace (input_buffer_entry + 0 * sizeof(UCHAR)) with input_buffer_entry by lia.
    replace (requested - 0) with requested by lia.
    entailer!.
  - split_pures.
    + dump_pre_spatial. exact PreH2.
    + dump_pre_spatial. exact PreH3.
    + dump_pre_spatial. exact PreH4.
    + dump_pre_spatial. exact PreH6.
    + dump_pre_spatial.
      unfold CircularAreaWriteSuccess.
      exists used, data_length.
      split; [exact Hused |].
      split; [exact Hactual |].
      split; [lia |].
      split; [exact Hring |].
      split; [reflexivity |].
      split; [right; split; [exact PreH17 | reflexivity] |].
      split; reflexivity.
    + dump_pre_spatial.
      unfold CircularAreaDescriptorState.
      rewrite Hidx_u.
      repeat split; try lia.
Qed.

Lemma proof_of_CircularAreaWrite_return_wit_3 : CircularAreaWrite_return_wit_3.
Proof.
  aggressive_pre_process.
  Exists ((sublist write_len_up data_length input_contents ++
           sublist write_len_down writeidx contents) ++
          sublist 0%Z write_len_up input_contents).
  pose proof PreH16 as Hstate.
  pose proof (CircularAreaActualWriteLength_upper_bound__write_branch_segmentation
    readidx writeidx area_length b_status requested data_length contents
    Hstate PreH7) as Hactual_le_area.
  unfold CircularAreaDescriptorState in PreH16.
  destruct PreH16 as [Hread [Hwrite [Harea [Hstatus Hcontents]]]].
  unfold CircularAreaActualWriteLength in PreH7.
  destruct PreH7 as [used [Hused Hactual]].
  assert (Hactual_le_requested : data_length <= requested).
  { rewrite Hactual. apply Z.le_min_l. }
  assert (Hinput_decomp :
    input_contents =
      ((sublist 0 write_len_up input_contents ++
        sublist write_len_up data_length input_contents) ++
       sublist data_length requested input_contents)).
  { rewrite <- (sublist_split 0 data_length write_len_up input_contents) by lia.
    rewrite <- (sublist_split 0 requested data_length input_contents) by lia.
    rewrite (sublist_self input_contents requested) by lia.
    reflexivity. }
  assert (Hring : CircularAreaRingUpdate contents input_contents
    ((sublist write_len_up data_length input_contents ++
      sublist write_len_down writeidx contents) ++
     sublist 0 write_len_up input_contents)
    area_length writeidx data_length).
  { eapply circular_area_ring_update_wrap__write_exit_ring_reconstruction;
      eauto; lia. }
  assert (Hrem : Z.rem (writeidx + data_length) area_length = write_len_down).
  { eapply circular_area_wrap_mod_index__write_exit_ring_reconstruction;
      eauto; lia. }
  assert (Hdown_u : unsigned_last_nbits write_len_down 8 = write_len_down).
  { apply unsigned_last_nbits_eq. lia. }
  pose proof Hring as Hring_facts.
  unfold CircularAreaRingUpdate in Hring_facts.
  destruct Hring_facts as [_ [Hafter _]].
  split_pure_spatial.
  - sep_apply (UCharArray.seg_merge_to_seg data_buffer 0 write_len_down writeidx
      (sublist write_len_up data_length input_contents)
      (sublist write_len_down writeidx contents)); try lia.
    sep_apply (UCharArray.seg_merge_to_full data_buffer 0 writeidx area_length
      (sublist write_len_up data_length input_contents ++ sublist write_len_down writeidx contents)
      (sublist 0 write_len_up input_contents)); try lia.
    sep_apply (UCharArray.seg_merge_to_seg input_buffer_entry 0 write_len_up data_length
      (sublist 0 write_len_up input_contents)
      (sublist write_len_up data_length input_contents)); try lia.
    sep_apply (UCharArray.seg_merge_to_full input_buffer_entry 0 data_length requested
      (sublist 0 write_len_up input_contents ++ sublist write_len_up data_length input_contents)
      (sublist data_length requested input_contents)); try lia.
    rewrite <- Hinput_decomp.
    replace (data_buffer + 0 * sizeof(UCHAR)) with data_buffer by lia.
    replace (area_length - 0) with area_length by lia.
    replace (input_buffer_entry + 0 * sizeof(UCHAR)) with input_buffer_entry by lia.
    replace (requested - 0) with requested by lia.
    entailer!.
  - split_pures.
    + dump_pre_spatial. exact PreH2.
    + dump_pre_spatial. exact PreH3.
    + dump_pre_spatial. exact PreH4.
    + dump_pre_spatial. exact PreH6.
    + dump_pre_spatial.
      unfold CircularAreaWriteSuccess.
      exists used, data_length.
      split; [exact Hused |].
      split; [exact Hactual |].
      split; [lia |].
      split; [exact Hring |].
      split; [rewrite Hrem; reflexivity |].
      split; [left; split; [exact PreH17 | reflexivity] |].
      split; reflexivity.
    + dump_pre_spatial.
      unfold CircularAreaDescriptorState.
      rewrite Hdown_u.
      repeat split; try lia.
Qed.

Lemma proof_of_CircularAreaWrite_return_wit_4 : CircularAreaWrite_return_wit_4.
Proof.
  aggressive_pre_process.
  Exists ((sublist 0 writeidx contents ++ sublist 0 data_length input_contents) ++
          sublist (writeidx + data_length) area_length contents).
  pose proof PreH16 as Hstate.
  pose proof (CircularAreaActualWriteLength_upper_bound__write_branch_segmentation
    readidx writeidx area_length b_status requested data_length contents
    Hstate PreH7) as Hactual_le_area.
  unfold CircularAreaDescriptorState in PreH16.
  destruct PreH16 as [Hread [Hwrite [Harea [Hstatus Hcontents]]]].
  unfold CircularAreaActualWriteLength in PreH7.
  destruct PreH7 as [used [Hused Hactual]].
  assert (Hinput_decomp :
    input_contents = sublist 0 data_length input_contents ++
                     sublist data_length requested input_contents).
  { rewrite <- (sublist_split 0 requested data_length input_contents) by lia.
    rewrite (sublist_self input_contents requested) by lia.
    reflexivity. }
  assert (Hring : CircularAreaRingUpdate contents input_contents
    ((sublist 0 writeidx contents ++ sublist 0 data_length input_contents) ++
     sublist (writeidx + data_length) area_length contents)
    area_length writeidx data_length).
  { eapply circular_area_ring_update_nowrap__write_exit_ring_reconstruction;
      eauto; lia. }
  pose proof (Z.rem_bound_pos_pos (writeidx + data_length) area_length
    ltac:(lia) ltac:(lia)) as Hrem_bounds.
  assert (Hidx_u : unsigned_last_nbits (Z.rem (writeidx + data_length) area_length) 8 =
                   Z.rem (writeidx + data_length) area_length).
  { apply unsigned_last_nbits_eq. lia. }
  pose proof Hring as Hring_facts.
  unfold CircularAreaRingUpdate in Hring_facts.
  destruct Hring_facts as [_ [Hafter _]].
  split_pure_spatial.
  - sep_apply (UCharArray.seg_merge_to_seg data_buffer 0 writeidx (writeidx + data_length)
      (sublist 0 writeidx contents) (sublist 0 data_length input_contents)); try lia.
    sep_apply (UCharArray.seg_merge_to_full data_buffer 0 (writeidx + data_length) area_length
      (sublist 0 writeidx contents ++ sublist 0 data_length input_contents)
      (sublist (writeidx + data_length) area_length contents)); try lia.
    sep_apply (UCharArray.seg_merge_to_full input_buffer_entry 0 data_length requested
      (sublist 0 data_length input_contents)
      (sublist data_length requested input_contents)); try lia.
    rewrite <- Hinput_decomp.
    replace (data_buffer + 0 * sizeof(UCHAR)) with data_buffer by lia.
    replace (area_length - 0) with area_length by lia.
    replace (input_buffer_entry + 0 * sizeof(UCHAR)) with input_buffer_entry by lia.
    replace (requested - 0) with requested by lia.
    entailer!.
  - split_pures.
    + dump_pre_spatial. exact PreH2.
    + dump_pre_spatial. exact PreH3.
    + dump_pre_spatial. exact PreH4.
    + dump_pre_spatial. exact PreH6.
    + dump_pre_spatial.
      unfold CircularAreaWriteSuccess.
      exists used, data_length.
      split; [exact Hused |].
      split; [exact Hactual |].
      split; [lia |].
      split; [exact Hring |].
      split; [reflexivity |].
      split; [left; split; [exact PreH17 | reflexivity] |].
      split; reflexivity.
    + dump_pre_spatial.
      unfold CircularAreaDescriptorState.
      rewrite Hidx_u.
      repeat split; try lia.
Qed.

Lemma proof_of_CircularAreaWrite_return_wit_5 : CircularAreaWrite_return_wit_5.
Proof.
  pre_process.
  unfold CircularAreaIsFullResult in PreH3.
  destruct PreH3 as [[Hrw [Hstat Hret]] | [Hnot Hret]]; [|lia].
  subst b_force_pre circular_area_entry input_buffer_entry requested force0 p_head p_tail.
  Left.
  entailer!.
Qed.

Lemma proof_of_CircularAreaWrite_return_wit_6 : CircularAreaWrite_return_wit_6.
Proof.
  aggressive_pre_process.
  pose proof (Zlength_nonneg input_contents).
  entailer!.
Qed.

Lemma proof_of_CircularAreaWrite_partial_solve_wit_8_pure : CircularAreaWrite_partial_solve_wit_8_pure.
Proof.
  pre_process.
  unfold CircularAreaDescriptorState in PreH18.
  destruct PreH18 as [_ [_ [_ [_ Hcontents]]]].
  entailer!.
  all: try dump_pre_spatial; try rewrite Zlength_sublist by (rewrite ?PreH7, ?Hcontents; lia); try lia.
  rewrite sizeof_uchar. lia.
Qed.

Lemma proof_of_CircularAreaWrite_partial_solve_wit_9_pure : CircularAreaWrite_partial_solve_wit_9_pure.
Proof.
  pre_process.
  unfold CircularAreaActualWriteLength in PreH6.
  destruct PreH6 as [used [Hused Hactual]].
  assert (Hactual_le_requested : data_length <= requested).
  { rewrite Hactual. apply Z.le_min_l. }
  unfold CircularAreaDescriptorState in PreH15.
  destruct PreH15 as [_ [Hwrite [_ [_ Hcontents]]]].
  entailer!.
  all: try dump_pre_spatial; try rewrite Zlength_sublist by (rewrite ?PreH7, ?Hcontents; lia); try rewrite sizeof_uchar; lia.
Qed.

Lemma proof_of_CircularAreaWrite_partial_solve_wit_10_pure : CircularAreaWrite_partial_solve_wit_10_pure.
Proof.
  pre_process.
  unfold CircularAreaDescriptorState in PreH15.
  destruct PreH15 as [_ [_ [_ [_ Hcontents]]]].
  entailer!.
  all: try dump_pre_spatial; try rewrite Zlength_sublist by (rewrite ?PreH7, ?Hcontents; lia); try rewrite sizeof_uchar; lia.
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
