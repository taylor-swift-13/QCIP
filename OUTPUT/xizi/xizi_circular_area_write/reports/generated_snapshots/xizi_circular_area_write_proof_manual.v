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
From SimpleC.EE.OUTPUT.xizi.xizi_circular_area_write.source Require Import xizi_circular_area_write_lib.
Local Open Scope sac.

Lemma proof_of_CircularAreaIsFull_return_wit_1 : CircularAreaIsFull_return_wit_1.
Proof.
  pre_process.
  assert (Hresult : CircularAreaStateFullResult state 0).
  {
    unfold CircularAreaStateFullResult.
    destruct (Z.eq_dec (Zlength (ca_contents state)) (ca_capacity state))
      as [Heq | Hneq]; [| reflexivity].
    unfold CircularAreaLogicalState in PreH5.
    intuition.
  }
  Exists operations_2 readidx_2 writeidx_2 b_status_2 physical_2 data_buffer_2.
  entailer!.
Qed.

Lemma proof_of_CircularAreaIsFull_return_wit_2 : CircularAreaIsFull_return_wit_2.
Proof.
  pre_process.
  assert (Hresult : CircularAreaStateFullResult state 0).
  {
    unfold CircularAreaStateFullResult.
    destruct (Z.eq_dec (Zlength (ca_contents state)) (ca_capacity state))
      as [Heq | Hneq]; [| reflexivity].
    unfold CircularAreaLogicalState in PreH6.
    intuition lia.
  }
  Exists operations_2 readidx_2 writeidx_2 b_status_2 physical_2 data_buffer_2.
  entailer!.
Qed.

Lemma proof_of_CircularAreaIsFull_return_wit_3 : CircularAreaIsFull_return_wit_3.
Proof.
  pre_process.
  assert (Hresult : CircularAreaStateFullResult state 1).
  {
    unfold CircularAreaStateFullResult.
    destruct (Z.eq_dec (Zlength (ca_contents state)) (ca_capacity state))
      as [Heq | Hneq]; [reflexivity |].
    unfold CircularAreaLogicalState in PreH6.
    intuition lia.
  }
  Exists operations_2 readidx_2 writeidx_2 b_status_2 physical_2 data_buffer_2.
  entailer!.
Qed.

Lemma proof_of_CircularAreaGetDataLength_safety_wit_4 : CircularAreaGetDataLength_safety_wit_4.
Proof.
  pre_process.
  unfold CircularAreaLogicalState in PreH4.
  entailer!; lia.
Qed.

Lemma proof_of_CircularAreaGetDataLength_safety_wit_5 : CircularAreaGetDataLength_safety_wit_5.
Proof.
  pre_process.
  unfold CircularAreaLogicalState in PreH4.
  entailer!; unfold INT_MAX, INT_MIN; lia.
Qed.

Lemma proof_of_CircularAreaGetDataLength_entail_wit_1 : CircularAreaGetDataLength_entail_wit_1.
Proof.
  pre_process.
  assert (Hfull : Zlength (ca_contents state) = ca_capacity state).
  {
    unfold CircularAreaStateFullResult in PreH3.
    destruct (Z.eq_dec (Zlength (ca_contents state)) (ca_capacity state));
      lia.
  }
  Exists operations_2 readidx_3 writeidx_3 b_status_3 physical_3 data_buffer_3.
  entailer!.
Qed.

Lemma proof_of_CircularAreaGetDataLength_entail_wit_2 : CircularAreaGetDataLength_entail_wit_2.
Proof.
  pre_process.
  assert (Hnotfull : Zlength (ca_contents state) <> ca_capacity state).
  {
    unfold CircularAreaStateFullResult in PreH3.
    destruct (Z.eq_dec (Zlength (ca_contents state)) (ca_capacity state));
      lia.
  }
  assert (Hlt : Zlength (ca_contents state) < ca_capacity state).
  {
    unfold CircularAreaLogicalState in PreH4.
    intuition lia.
  }
  Exists operations_2 readidx_3 writeidx_3 b_status_3 physical_3 data_buffer_3.
  entailer!.
Qed.

Lemma proof_of_CircularAreaGetDataLength_return_wit_1 : CircularAreaGetDataLength_return_wit_1.
Proof.
  pre_process.
  assert (Hresult :
    CircularAreaStateDataLengthResult state
      (Z.rem
        (unsigned_last_nbits
          (unsigned_last_nbits (writeidx_2 - readidx_2) 32 + ca_capacity state)
          32)
        (ca_capacity state))).
  {
    unfold CircularAreaStateDataLengthResult.
    unfold CircularAreaLogicalState in PreH4.
    destruct PreH4 as
      [Hcap [Hread [Hwrite [Hlen [_ [_ [Hindex _]]]]]]].
    apply (circular_area_query_length__state_queries
      readidx_2 writeidx_2 (ca_capacity state) (Zlength (ca_contents state)));
      lia || assumption.
  }
  Exists operations_2 readidx_2 writeidx_2 b_status_2 physical_2 data_buffer_2.
  entailer!.
Qed.

Lemma proof_of_CircularAreaGetDataLength_return_wit_2 : CircularAreaGetDataLength_return_wit_2.
Proof.
  pre_process.
  assert (Hresult : CircularAreaStateDataLengthResult state (ca_capacity state)).
  { unfold CircularAreaStateDataLengthResult; symmetry; exact PreH3. }
  Exists operations_2 readidx_2 writeidx_2 b_status_2 physical_2 data_buffer_2.
  entailer!.
Qed.

Lemma proof_of_CircularAreaDivideWrData_entail_wit_1 : CircularAreaDivideWrData_entail_wit_1.
Proof.
  pre_process.
  assert (Hsum : writeidx_2 + data_length_pre <= 4294967295).
  {
    unfold CircularAreaLogicalState in PreH5.
    intuition lia.
  }
  Exists operations_2 readidx_2 b_status_2 physical_2 writeidx_2 data_buffer_2.
  entailer!.
Qed.

Lemma proof_of_CircularAreaDivideWrData_return_wit_1 : CircularAreaDivideWrData_return_wit_1.
Proof.
  pre_process.
  assert (Hvalid : CircularAreaValid state).
  {
    unfold CircularAreaValid, CircularAreaLogicalState in *.
    intuition.
  }
  assert (Hcastw : unsigned_last_nbits writeidx_2 32 = writeidx_2).
  {
    apply unsigned_last_nbits_eq.
    unfold CircularAreaLogicalState in PreH8.
    change (0 <= writeidx_2 < 4294967296).
    intuition lia.
  }
  assert (Hcasts : unsigned_last_nbits (writeidx_2 + data_length_pre) 32 =
                   writeidx_2 + data_length_pre).
  {
    apply unsigned_last_nbits_eq.
    change (0 <= writeidx_2 + data_length_pre < 4294967296).
    unfold CircularAreaLogicalState in PreH8.
    intuition lia.
  }
  assert (Hdivide :
    CircularAreaDivideWrDataResult writeidx_2 data_length_pre
      (ca_capacity state) 1).
  {
    unfold CircularAreaDivideWrDataResult.
    right.
    rewrite Hcastw, Hcasts in PreH1.
    lia.
  }
  assert (Hstate : CircularAreaStateDivideWrDataResult state data_length_pre 1).
  {
    unfold CircularAreaStateDivideWrDataResult.
    intuition.
  }
  Exists operations_2 readidx_2 b_status_2 physical_2 writeidx_2 data_buffer_2.
  entailer!.
Qed.

Lemma proof_of_CircularAreaDivideWrData_return_wit_2 : CircularAreaDivideWrData_return_wit_2.
Proof.
  pre_process.
  assert (Hvalid : CircularAreaValid state).
  {
    unfold CircularAreaValid, CircularAreaLogicalState in *.
    intuition.
  }
  assert (Hcastw : unsigned_last_nbits writeidx_2 32 = writeidx_2).
  {
    apply unsigned_last_nbits_eq.
    unfold CircularAreaLogicalState in PreH8.
    change (0 <= writeidx_2 < 4294967296).
    intuition lia.
  }
  assert (Hcasts : unsigned_last_nbits (writeidx_2 + data_length_pre) 32 =
                   writeidx_2 + data_length_pre).
  {
    apply unsigned_last_nbits_eq.
    change (0 <= writeidx_2 + data_length_pre < 4294967296).
    unfold CircularAreaLogicalState in PreH8.
    intuition lia.
  }
  assert (Hdivide :
    CircularAreaDivideWrDataResult writeidx_2 data_length_pre
      (ca_capacity state) 0).
  {
    unfold CircularAreaDivideWrDataResult.
    left.
    rewrite Hcastw, Hcasts in PreH1.
    lia.
  }
  assert (Hstate : CircularAreaStateDivideWrDataResult state data_length_pre 0).
  {
    unfold CircularAreaStateDivideWrDataResult.
    intuition.
  }
  Exists operations_2 readidx_2 b_status_2 physical_2 writeidx_2 data_buffer_2.
  entailer!.
Qed.

Lemma proof_of_CircularAreaWrite_entail_wit_1 : CircularAreaWrite_entail_wit_1.
Proof.
  aggressive_pre_process.
  unfold CircularAreaWriteInput.
  Intros_p Hcommon.
  Split.
  - Intros_p Hib0. Split.
    + Intros_p Hca0. Left. Right. entailer!.
    + Intros_p Hcan. Left. Left. Left. entailer!.
  - Intros_p Hibdata. Split.
    + Intros_p Hca0. Right. entailer!.
    + Intros_p Hcan. Left. Left. Right. entailer!.
Qed.

Lemma proof_of_CircularAreaWrite_entail_wit_3 : CircularAreaWrite_entail_wit_3.
Proof.
  aggressive_pre_process.
  unfold store_circular_area.
  Intros data_buffer operations readidx writeidx b_status physical.
  Exists operations readidx writeidx b_status physical data_buffer.
  entailer!.
  rewrite <- PreH13.
  entailer!.
Qed.

Lemma proof_of_CircularAreaWrite_entail_wit_5_1 : CircularAreaWrite_entail_wit_5_1.
Proof.
  aggressive_pre_process.
  all: assert (Hret2 : retval_2 = 1) by
    (unfold CircularAreaStateDivideWrDataResult in PreH3;
     destruct PreH3 as [_ [_ Hretcases]];
     eapply circular_area_zero_or_one_nonzero__write_branch_preparation;
     eauto).
  all: rewrite Hret2 in PreH3, PreH4.
  all: unfold CircularAreaLogicalState in PreH5.
  all: destruct PreH5 as [Hcap [_ [_ [Hlen _]]]].
  all: unfold CircularAreaStateDataLengthResult in PreH9.
  all: subst retval.
  all: pose proof
    (circular_area_not_full_result_zero__write_branch_preparation state PreH16)
    as Hnotfull.
  all: pose proof
    (circular_area_free_unsigned_positive__write_branch_preparation
      (ca_capacity state) (Zlength (ca_contents state)) Hcap Hlen Hnotfull)
    as [Hunsigned Hfree].
  all: rewrite Hunsigned in *.
  - exact PreH4.
  - exact PreH3.
  - exact Hfree.
  - apply circular_area_actual_write_free__write_branch_preparation.
    + exact Hlen.
    + exact PreH6.
Qed.

Lemma proof_of_CircularAreaWrite_entail_wit_5_2 : CircularAreaWrite_entail_wit_5_2.
Proof.
  aggressive_pre_process.
  all: assert (Hret2 : retval_2 = 1) by
    (unfold CircularAreaStateDivideWrDataResult in PreH3;
     destruct PreH3 as [_ [_ Hretcases]];
     eapply circular_area_zero_or_one_nonzero__write_branch_preparation;
     eauto).
  all: rewrite Hret2 in PreH3, PreH4.
  all: unfold CircularAreaLogicalState in PreH5.
  all: destruct PreH5 as [Hcap [_ [_ [Hlen _]]]].
  all: unfold CircularAreaStateDataLengthResult in PreH9.
  all: subst retval.
  all: pose proof
    (circular_area_not_full_result_zero__write_branch_preparation state PreH16)
    as Hnotfull.
  all: pose proof
    (circular_area_free_unsigned_positive__write_branch_preparation
      (ca_capacity state) (Zlength (ca_contents state)) Hcap Hlen Hnotfull)
    as [Hunsigned Hfree].
  all: rewrite Hunsigned in PreH6.
  - exact PreH4.
  - exact PreH3.
  - apply circular_area_actual_write_requested__write_branch_preparation.
    exact PreH6.
Qed.

Lemma proof_of_CircularAreaWrite_entail_wit_6 : CircularAreaWrite_entail_wit_6.
Proof.
  aggressive_pre_process.
  pose proof
    (circular_area_wrap_prepare__write_branch_preparation
      state readidx_2 writeidx b_status_2 physical_2 data_length
      PreH12 PreH10 PreH11)
    as [Hwrite [Hwritecast [Hfreecast [Hdowncast Hsplit]]]].
  Exists physical_2.
  sep_apply (UCharArray.mixed_full_split_to_mixed_seg
    data_buffer_2 writeidx (ca_capacity state) physical_2).
  2: { destruct Hwrite as [Hlo Hlt]. split; [exact Hlo|lia]. }
  sep_apply (UCharArray.full_split_to_seg
    input_buffer_pre
    (unsigned_last_nbits
      (ca_capacity state - unsigned_last_nbits writeidx 32) 32)
    (Zlength input_contents) input_contents).
  2: { destruct Hsplit as [Hsplit0 Hsplit_data].
       split; [exact Hsplit0|lia]. }
  entailer!.
Qed.

Lemma proof_of_CircularAreaWrite_entail_wit_7 : CircularAreaWrite_entail_wit_7.
Proof.
  aggressive_pre_process.
  pose proof
    (circular_area_wrap_segment_bounds__write_branch_preparation
      state readidx_2 writeidx_2 b_status_2 physical_2 data_length
      PreH18 PreH16 PreH17)
    as [Hup Hdown].
  rewrite <- PreH13 in Hup.
  rewrite <- PreH13, <- PreH14 in Hdown.
  pose proof
    (circular_area_sublist_split_facts__write_branch_preparation
      input_contents write_len_up data_length Hup PreH10)
    as [Hsub_length Hsub_split].
  Exists physical_2.
  sep_apply (UCharArray.mixed_seg_split_to_mixed_seg
    data_buffer_2 0 write_len_down writeidx_2
    (sublist 0 writeidx_2 physical_2)).
  2: exact Hdown.
  repeat rewrite Z.sub_0_r.
  rewrite Zsublist_Zsublist00 by lia.
  rewrite Zsublist_Zsublist0 by lia.
  entailer!.
Qed.

Lemma proof_of_CircularAreaWrite_entail_wit_8_1 : CircularAreaWrite_entail_wit_8_1.
Proof.
  aggressive_pre_process.
  pose proof PreH5 as Hlogical4.
  unfold CircularAreaLogicalState in PreH5.
  destruct PreH5 as [Hcap [_ [Hwrite [Hlen _]]]].
  unfold CircularAreaStateDataLengthResult in PreH9.
  subst retval.
  pose proof
    (circular_area_not_full_result_zero__write_branch_preparation state PreH16)
    as Hnotfull.
  pose proof
    (circular_area_free_unsigned_positive__write_branch_preparation
      (ca_capacity state) (Zlength (ca_contents state)) Hcap Hlen Hnotfull)
    as [Hunsigned Hfree].
  rewrite PreH19 in PreH3, PreH4.
  rewrite Hunsigned in *.
  pose proof
    (circular_area_nonwrap_segment_bounds__write_branch_preparation
      writeidx_4 (ca_capacity state - Zlength (ca_contents state))
      (ca_capacity state) PreH4 (proj1 Hwrite)
      (Z.lt_le_incl _ _ Hfree))
    as Hsegments.
  Exists physical_4.
  sep_apply (UCharArray.mixed_full_split_to_mixed_seg
    data_buffer_4 writeidx_4 (ca_capacity state) physical_4).
  2: { destruct Hwrite as [Hwrite0 Hwritecap]. split; [exact Hwrite0|lia]. }
  sep_apply (UCharArray.mixed_seg_split_to_mixed_seg
    data_buffer_4 writeidx_4
    (writeidx_4 + (ca_capacity state - Zlength (ca_contents state)))
    (ca_capacity state)
    (sublist writeidx_4 (ca_capacity state) physical_4)).
  2: { destruct Hsegments as [_ Hrest]. exact Hrest. }
  sep_apply (UCharArray.full_split_to_seg
    input_buffer_pre (ca_capacity state - Zlength (ca_contents state))
    (Zlength input_contents) input_contents).
  2: { split; lia. }
  repeat rewrite Zsublist_Zsublist by lia.
  replace (0 + writeidx_4) with writeidx_4 by lia.
  replace
    (writeidx_4 + (ca_capacity state - Zlength (ca_contents state)) -
       writeidx_4 + writeidx_4)
    with
    (writeidx_4 + (ca_capacity state - Zlength (ca_contents state)))
    by lia.
  replace (ca_capacity state - writeidx_4 + writeidx_4)
    with (ca_capacity state) by lia.
  entailer!.
  apply circular_area_actual_write_free__write_branch_preparation.
  - exact Hlen.
  - lia.
Qed.

Lemma proof_of_CircularAreaWrite_entail_wit_8_2 : CircularAreaWrite_entail_wit_8_2.
Proof.
  aggressive_pre_process.
  pose proof PreH5 as Hlogical4.
  unfold CircularAreaLogicalState in PreH5.
  destruct PreH5 as [Hcap [_ [Hwrite [Hlen _]]]].
  unfold CircularAreaStateDataLengthResult in PreH9.
  subst retval.
  pose proof
    (circular_area_not_full_result_zero__write_branch_preparation state PreH16)
    as Hnotfull.
  pose proof
    (circular_area_free_unsigned_positive__write_branch_preparation
      (ca_capacity state) (Zlength (ca_contents state)) Hcap Hlen Hnotfull)
    as [Hunsigned Hfree].
  rewrite PreH19 in PreH3, PreH4.
  rewrite Hunsigned in PreH6.
  assert (Hdata_nonneg : 0 <= data_length).
  { lia. }
  pose proof
    (circular_area_nonwrap_segment_bounds__write_branch_preparation
      writeidx_4 data_length (ca_capacity state) PreH4
      (proj1 Hwrite) Hdata_nonneg)
    as Hsegments.
  Exists physical_4.
  sep_apply (UCharArray.mixed_full_split_to_mixed_seg
    data_buffer_4 writeidx_4 (ca_capacity state) physical_4).
  2: { destruct Hwrite as [Hwrite0 Hwritecap]. split; [exact Hwrite0|lia]. }
  sep_apply (UCharArray.mixed_seg_split_to_mixed_seg
    data_buffer_4 writeidx_4 (writeidx_4 + data_length)
    (ca_capacity state)
    (sublist writeidx_4 (ca_capacity state) physical_4)).
  2: { destruct Hsegments as [_ Hrest]. exact Hrest. }
  sep_apply (UCharArray.full_split_to_seg
    input_buffer_pre data_length (Zlength input_contents) input_contents).
  2: { split; [exact Hdata_nonneg|]. rewrite PreH14. apply Z.le_refl. }
  repeat rewrite Zsublist_Zsublist by lia.
  replace (0 + writeidx_4) with writeidx_4 by lia.
  replace (writeidx_4 + data_length - writeidx_4 + writeidx_4)
    with (writeidx_4 + data_length) by lia.
  replace (ca_capacity state - writeidx_4 + writeidx_4)
    with (ca_capacity state) by lia.
  entailer!.
  rewrite PreH14.
  apply circular_area_actual_write_requested__write_branch_preparation.
  lia.
Qed.

Lemma proof_of_CircularAreaWrite_return_wit_1 : CircularAreaWrite_return_wit_1.
Proof.
  aggressive_pre_process.
  pose proof PreH19 as Hstate.
  unfold CircularAreaLogicalState in Hstate.
  destruct Hstate as
    [Harea [Hread [Hwrite [Hlogical [Hphysical
    [Hlogicalbytes [Hindex [Hstatus [Hfull [Hempty Hlive]]]]]]]]]].
  unfold CircularAreaActualWriteLength in PreH12.
  unfold CircularAreaStateDivideWrDataResult in PreH17.
  destruct PreH17 as [Hvalid Hrequest].
  unfold CircularAreaDivideWrDataResult in PreH18.
  destruct PreH18 as [[Hnowrap Hbad] | [Hwrap _]]; [lia |].
  assert (Hnotfull : Zlength (ca_contents state) < ca_capacity state).
  {
    unfold CircularAreaStateFullResult in PreH11.
    destruct (Z.eq_dec (Zlength (ca_contents state)) (ca_capacity state));
      lia.
  }
  sep_apply (UCharArray.seg_merge_to_seg input_buffer_pre
    0 write_len_up data_length); try lia.
  sep_apply (UCharArray.seg_merge_to_full input_buffer_pre
    0 data_length (Zlength input_contents)); try lia.
  replace (input_buffer_pre + 0 * sizeof (UCHAR)) with input_buffer_pre by lia.
  replace (Zlength input_contents - 0) with (Zlength input_contents) by lia.
  replace ((sublist 0 write_len_up input_contents ++
            sublist write_len_up data_length input_contents) ++
           sublist data_length (Zlength input_contents) input_contents)
    with input_contents.
  2:
  {
    rewrite <- (sublist_split 0 data_length write_len_up input_contents)
      by lia.
    rewrite <- (sublist_split 0 (Zlength input_contents) data_length
      input_contents) by lia.
    symmetry. apply sublist_self. reflexivity.
  }
  prop_apply (circular_area_uchar_full_forall__write_returns
    input_buffer_pre (Zlength input_contents) input_contents).
  Intros_p Hinputbytes.
  assert (Hphysicalwrite : CircularAreaPhysicalWrite physical input_contents
    (CircularAreaSomeBytes (sublist write_len_up data_length input_contents) ++
     sublist write_len_down writeidx physical ++
     CircularAreaSomeBytes (sublist 0 write_len_up input_contents))
    (ca_capacity state) writeidx data_length).
  {
    apply circular_area_physical_write_wrap__write_returns;
      try assumption; try lia.
  }
  assert (Hlogicalafter : CircularAreaLogicalState readidx
    ((writeidx + data_length) mod ca_capacity state) (ca_capacity state) 1
    (ca_contents state ++ sublist 0 data_length input_contents)
    (CircularAreaSomeBytes (sublist write_len_up data_length input_contents) ++
     sublist write_len_down writeidx physical ++
     CircularAreaSomeBytes (sublist 0 write_len_up input_contents))).
  {
    eapply circular_area_logical_state_after_write__write_returns;
      eauto; lia.
  }
  assert (Hresult : CircularAreaWriteResult state (Zlength input_contents)
    input_contents 0
    (Build_circular_area_state (ca_capacity state)
      (ca_contents state ++ sublist 0 data_length input_contents))).
  {
    unfold CircularAreaWriteResult.
    right. repeat split; try lia.
    rewrite <- PreH12. reflexivity.
  }
  sep_apply (UCharArray.mixed_seg_merge_to_mixed_seg data_buffer
    0 write_len_down writeidx); try lia.
  sep_apply (UCharArray.mixed_seg_merge_to_mixed_full data_buffer
    0 writeidx (ca_capacity state)); try lia.
  replace (data_buffer + 0 * sizeof (UCHAR)) with data_buffer by lia.
  replace (ca_capacity state - 0) with (ca_capacity state) by lia.
  assert (Hmoddown :
    (writeidx + data_length) mod ca_capacity state = write_len_down).
  {
    symmetry. apply Z.mod_unique with (q := 1); [left |]; lia.
  }
  assert (Hcastdown : unsigned_last_nbits write_len_down 8 = write_len_down).
  {
    apply unsigned_last_nbits_eq.
    change (0 <= write_len_down < 256). lia.
  }
  Exists (Build_circular_area_state (ca_capacity state)
    (ca_contents state ++ sublist 0 data_length input_contents)).
  unfold store_circular_area.
  Exists data_buffer operations readidx write_len_down 1
    (CircularAreaSomeBytes (sublist write_len_up data_length input_contents) ++
     sublist write_len_down writeidx physical ++
     CircularAreaSomeBytes (sublist 0 write_len_up input_contents)).
  rewrite Hcastdown.
  rewrite app_assoc.
  simpl.
  entailer!.
  rewrite <- app_assoc.
  rewrite Hmoddown in Hlogicalafter.
  exact Hlogicalafter.
Qed.

Lemma proof_of_CircularAreaWrite_return_wit_2 : CircularAreaWrite_return_wit_2.
Proof.
  aggressive_pre_process.
  pose proof PreH19 as Hstate.
  unfold CircularAreaLogicalState in Hstate.
  destruct Hstate as
    [Harea [Hread [Hwrite [Hlogical [Hphysical
    [Hlogicalbytes [Hindex [Hstatus [Hfull [Hempty Hlive]]]]]]]]]].
  unfold CircularAreaActualWriteLength in PreH12.
  unfold CircularAreaStateDivideWrDataResult in PreH17.
  destruct PreH17 as [Hvalid Hrequest].
  assert (Hnotfull : Zlength (ca_contents state) < ca_capacity state).
  {
    unfold CircularAreaStateFullResult in PreH11.
    destruct (Z.eq_dec (Zlength (ca_contents state)) (ca_capacity state));
      lia.
  }
  sep_apply (UCharArray.seg_merge_to_full input_buffer_pre 0 data_length
    (Zlength input_contents)); try lia.
  replace (input_buffer_pre + 0 * sizeof (UCHAR)) with input_buffer_pre by lia.
  replace (Zlength input_contents - 0) with (Zlength input_contents) by lia.
  replace (sublist 0 data_length input_contents ++
           sublist data_length (Zlength input_contents) input_contents)
    with input_contents.
  2:
  {
    rewrite <- (sublist_split 0 (Zlength input_contents) data_length
      input_contents) by lia.
    symmetry. apply sublist_self. reflexivity.
  }
  prop_apply (circular_area_uchar_full_forall__write_returns
    input_buffer_pre (Zlength input_contents) input_contents).
  Intros_p Hinputbytes.
  assert (Hphysicalwrite : CircularAreaPhysicalWrite physical input_contents
    (sublist 0 writeidx physical ++
     CircularAreaSomeBytes (sublist 0 data_length input_contents) ++
     sublist (writeidx + data_length) (ca_capacity state) physical)
    (ca_capacity state) writeidx data_length).
  {
    apply circular_area_physical_write_nowrap__write_returns;
      try assumption; try lia.
  }
  assert (Hlogicalafter : CircularAreaLogicalState readidx
    ((writeidx + data_length) mod ca_capacity state) (ca_capacity state) 1
    (ca_contents state ++ sublist 0 data_length input_contents)
    (sublist 0 writeidx physical ++
     CircularAreaSomeBytes (sublist 0 data_length input_contents) ++
     sublist (writeidx + data_length) (ca_capacity state) physical)).
  {
    eapply circular_area_logical_state_after_write__write_returns;
      eauto; lia.
  }
  assert (Hresult : CircularAreaWriteResult state (Zlength input_contents)
    input_contents 0
    (Build_circular_area_state (ca_capacity state)
      (ca_contents state ++ sublist 0 data_length input_contents))).
  {
    unfold CircularAreaWriteResult.
    right. repeat split; try lia.
    rewrite <- PreH12. reflexivity.
  }
  sep_apply (UCharArray.mixed_seg_merge_to_mixed_seg data_buffer
    0 writeidx (writeidx + data_length)); try lia.
  sep_apply (UCharArray.mixed_seg_merge_to_mixed_full data_buffer
    0 (writeidx + data_length) (ca_capacity state)); try lia.
  replace (data_buffer + 0 * sizeof (UCHAR)) with data_buffer by lia.
  replace (ca_capacity state - 0) with (ca_capacity state) by lia.
  assert (Hmodrange :
    0 <= (writeidx + data_length) mod ca_capacity state < ca_capacity state).
  { apply Z.mod_pos_bound. lia. }
  assert (Hcast :
    unsigned_last_nbits ((writeidx + data_length) mod ca_capacity state) 8 =
    (writeidx + data_length) mod ca_capacity state).
  {
    apply unsigned_last_nbits_eq.
    change (0 <= (writeidx + data_length) mod ca_capacity state < 256).
    lia.
  }
  assert (Hrem :
    Z.rem (writeidx + data_length) (ca_capacity state) =
    (writeidx + data_length) mod ca_capacity state).
  { apply Z.rem_mod_nonneg; lia. }
  Exists (Build_circular_area_state (ca_capacity state)
    (ca_contents state ++ sublist 0 data_length input_contents)).
  unfold store_circular_area.
  Exists data_buffer operations readidx
    ((writeidx + data_length) mod ca_capacity state) 1
    (sublist 0 writeidx physical ++
     CircularAreaSomeBytes (sublist 0 data_length input_contents) ++
     sublist (writeidx + data_length) (ca_capacity state) physical).
  rewrite Hrem, Hcast.
  rewrite app_assoc.
  simpl.
  entailer!.
  rewrite <- app_assoc.
  exact Hlogicalafter.
Qed.

Lemma proof_of_CircularAreaWrite_return_wit_3 : CircularAreaWrite_return_wit_3.
Proof.
  aggressive_pre_process.
  Exists state.
  unfold store_circular_area.
  Exists data_buffer_2 operations readidx_2 writeidx_2 b_status_2 physical_2.
  unfold CircularAreaWriteResult, CircularAreaStateFullResult in *.
  destruct (Z.eq_dec (Zlength (ca_contents state)) (ca_capacity state));
    entailer!.
Qed.

Lemma proof_of_CircularAreaWrite_return_wit_4 : CircularAreaWrite_return_wit_4.
Proof.
  aggressive_pre_process.
  all: assert (Hlen0 : data_length_pre = 0) by lia.
  all: assert (Hnil : input_contents = nil) by (apply Zlength_nil_inv; lia).
  all: subst data_length_pre input_contents.
  - unfold UCharArray.full, store_array. simpl. entailer!.
  - unfold CircularAreaWriteResult. simpl. entailer!.
  - entailer!.
Qed.

Lemma proof_of_CircularAreaWrite_return_wit_5 : CircularAreaWrite_return_wit_5.
Proof.
  aggressive_pre_process;
    try (unfold CircularAreaErrorResult; reflexivity).
Qed.

Lemma proof_of_CircularAreaWrite_return_wit_6 : CircularAreaWrite_return_wit_6.
Proof.
  pre_process.
Qed.

Lemma proof_of_CircularAreaWrite_return_wit_7 : CircularAreaWrite_return_wit_7.
Proof.
  pre_process.
  rewrite PreH7.
  unfold CircularAreaErrorResult.
  entailer!.
Qed.

Lemma proof_of_CircularAreaWrite_partial_solve_wit_3_pure : CircularAreaWrite_partial_solve_wit_3_pure.
Proof.
  pre_process.
  unfold CircularAreaStateDataLengthResult in PreH4.
  pose proof PreH5 as Hstate.
  unfold CircularAreaLogicalState in Hstate.
  destruct Hstate as
    [Hcapacity [_ [_ [Hlogical_length [_ [_ [_ [_ [_ [_ _]]]]]]]]]].
  rewrite unsigned_last_nbits_eq by
    (change (0 <= ca_capacity state - retval < 4294967296); lia).
  entailer!.
Qed.

Lemma proof_of_CircularAreaWrite_partial_solve_wit_4_pure : CircularAreaWrite_partial_solve_wit_4_pure.
Proof.
  pre_process.
  unfold CircularAreaStateDataLengthResult in PreH4.
  pose proof PreH5 as Hstate.
  unfold CircularAreaLogicalState in Hstate.
  destruct Hstate as
    [Hcapacity [_ [_ [Hlogical_length [_ [_ [_ [_ [_ [_ _]]]]]]]]]].
  rewrite unsigned_last_nbits_eq in PreH1 by
    (change (0 <= ca_capacity state - retval < 4294967296); lia).
  entailer!.
Qed.

Lemma proof_of_CircularAreaWrite_partial_solve_wit_5_pure : CircularAreaWrite_partial_solve_wit_5_pure.
Proof.
  pre_process.
  unfold CircularAreaLogicalState in PreH17.
  destruct PreH17 as [_ [_ [_ [_ [Hphysical_length _]]]]].
  split_pures; dump_pre_spatial; try rewrite sizeof_uchar;
    try rewrite Zlength_sublist by lia; lia.
Qed.

Lemma proof_of_CircularAreaWrite_partial_solve_wit_6_pure : CircularAreaWrite_partial_solve_wit_6_pure.
Proof.
  pre_process.
  unfold CircularAreaActualWriteLength in PreH7.
  assert (Hdata_input : data_length <= Zlength input_contents).
  { rewrite PreH7. apply Z.le_min_l. }
  unfold CircularAreaLogicalState in PreH14.
  destruct PreH14 as [_ [_ [Hwriteidx [_ [Hphysical_length _]]]]].
  split_pures; dump_pre_spatial; try rewrite sizeof_uchar;
    try rewrite Zlength_sublist by lia; lia.
Qed.

Lemma proof_of_CircularAreaWrite_partial_solve_wit_7_pure : CircularAreaWrite_partial_solve_wit_7_pure.
Proof.
  pre_process.
  unfold CircularAreaLogicalState in PreH14.
  destruct PreH14 as [_ [_ [_ [_ [Hphysical_length _]]]]].
  split_pures; dump_pre_spatial; try rewrite sizeof_uchar;
    try rewrite Zlength_sublist by lia; lia.
Qed.
