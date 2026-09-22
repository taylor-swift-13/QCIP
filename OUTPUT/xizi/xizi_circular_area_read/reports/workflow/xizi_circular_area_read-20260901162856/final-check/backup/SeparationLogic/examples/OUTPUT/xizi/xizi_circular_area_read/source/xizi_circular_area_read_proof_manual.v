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
  dump_pre_spatial.
  unfold CircularAreaLogicalState in PreH4.
  lia.
Qed.

Lemma proof_of_CircularAreaGetDataLength_safety_wit_5 : CircularAreaGetDataLength_safety_wit_5.
Proof.
  pre_process.
  split_pures.
  - dump_pre_spatial.
    unfold CircularAreaLogicalState in PreH4.
    lia.
  - dump_pre_spatial.
    unfold CircularAreaLogicalState in PreH4.
    lia.
Qed.

Lemma proof_of_CircularAreaGetDataLength_entail_wit_1 : CircularAreaGetDataLength_entail_wit_1.
Proof.
  pre_process.
  subst circular_area_pre.
  unfold CircularAreaFullResult in PreH3.
  destruct (Z.eq_dec (Zlength logical) area_length) as [Heq | Hneq].
  - subst retval.
    unfold CircularAreaBackingResource.
    entailer!.
  - subst retval.
    contradiction.
Qed.

Lemma proof_of_CircularAreaGetDataLength_entail_wit_2 : CircularAreaGetDataLength_entail_wit_2.
Proof.
  pre_process.
  subst circular_area_pre.
  unfold CircularAreaFullResult in PreH3.
  destruct (Z.eq_dec (Zlength logical) area_length) as [Heq | Hneq].
  - subst retval.
    exfalso.
    lia.
  - subst retval.
    unfold CircularAreaBackingResource.
    entailer!.
    unfold CircularAreaLogicalState in *.
    lia.
Qed.

Lemma proof_of_CircularAreaGetDataLength_return_wit_1 : CircularAreaGetDataLength_return_wit_1.
Proof.
  pre_process.
  rewrite unsigned_unsigned_add_l by lia.
  rewrite unsigned_last_nbits_eq.
  2: { unfold CircularAreaLogicalState in PreH4. lia. }
  pose proof PreH4 as Hstate.
  unfold CircularAreaLogicalState in Hstate.
  destruct Hstate as
    [Harea [Hread [Hwrite [Hlogical [_ [_ [Hwriteeq _]]]]]]].
  pose proof
    (CircularArea_data_length_mod__length_and_divide_results
       readidx writeidx area_length (Zlength logical)
       Harea Hread Hwrite (conj (Zlength_nonneg logical) PreH3) Hwriteeq)
    as Hlength.
  unfold CircularAreaDataLengthResult.
  unfold CircularAreaBackingResource.
  entailer!.
Qed.

Lemma proof_of_CircularAreaGetDataLength_return_wit_2 : CircularAreaGetDataLength_return_wit_2.
Proof.
  pre_process.
  unfold CircularAreaDataLengthResult.
  unfold CircularAreaBackingResource.
  entailer!.
Qed.

Lemma proof_of_CircularAreaDivideRdData_entail_wit_1 : CircularAreaDivideRdData_entail_wit_1.
Proof.
  pre_process.
  subst circular_area_pre.
  subst data_length_pre.
  unfold CircularAreaBackingResource.
  entailer!.
Qed.

Lemma proof_of_CircularAreaDivideRdData_return_wit_1 : CircularAreaDivideRdData_return_wit_1.
Proof.
  pre_process.
  assert (Hread : 0 <= readidx < 2 ^ 32).
  { unfold CircularAreaLogicalState in PreH8. lia. }
  assert (Hreadcast : unsigned_last_nbits readidx 32 = readidx).
  { apply unsigned_last_nbits_eq. exact Hread. }
  rewrite Hreadcast in PreH1.
  assert (Hsumcast : unsigned_last_nbits (readidx + d0) 32 = readidx + d0).
  { apply unsigned_last_nbits_eq. split; lia. }
  rewrite Hsumcast in PreH1.
  unfold CircularAreaDivideRdDataResult.
  unfold CircularAreaBackingResource.
  entailer!.
Qed.

Lemma proof_of_CircularAreaDivideRdData_return_wit_2 : CircularAreaDivideRdData_return_wit_2.
Proof.
  pre_process.
  assert (Hread : 0 <= readidx < 2 ^ 32).
  { unfold CircularAreaLogicalState in PreH8. lia. }
  assert (Hreadcast : unsigned_last_nbits readidx 32 = readidx).
  { apply unsigned_last_nbits_eq. exact Hread. }
  rewrite Hreadcast in PreH1.
  assert (Hsumcast : unsigned_last_nbits (readidx + d0) 32 = readidx + d0).
  { apply unsigned_last_nbits_eq. split; lia. }
  rewrite Hsumcast in PreH1.
  unfold CircularAreaDivideRdDataResult.
  unfold CircularAreaBackingResource.
  entailer!.
Qed.

Lemma proof_of_CircularAreaRead_entail_wit_2 : CircularAreaRead_entail_wit_2.
Proof.
  aggressive_pre_process.
  unfold CircularAreaEmptyResult in *.
  destruct logical; simpl in *; try contradiction; entailer!.
Qed.

Lemma proof_of_CircularAreaRead_entail_wit_3_1 : CircularAreaRead_entail_wit_3_1.
Proof.
  unfold CircularAreaRead_entail_wit_3_1.
  right.
  pre_process.
  pose proof
    (CircularArea_empty_result_zero_length_pos__read_call_normalization
       logical retval_2 PreH13 PreH27) as Hlogical_pos.
  unfold CircularAreaDataLengthResult in PreH6, PreH10.
  assert (Hretval_pos : 0 < retval) by lia.
  assert (Hactual : CircularAreaActualReadLength logical data_length_pre retval).
  {
    unfold CircularAreaActualReadLength.
    rewrite PreH6.
    symmetry.
    apply Z.min_r.
    lia.
  }
  assert (Hdivide : CircularAreaDivideRdDataResult readidx retval area_length 1).
  {
    unfold CircularAreaDivideRdDataResult in *.
    destruct PreH3 as [[Hfit Hzero] | [Hwrap Hone]].
    - contradiction.
    - right. split; [exact Hwrap | lia].
  }
  unfold CircularAreaBackingResource at 1.
  Intros_p Hresource.
  destruct Hresource as [Hca [Hdata Hstate_resource]].
  add_pure
    (CircularAreaLogicalState readidx writeidx area_length b_status logical physical)
    as Hstate_sep.
  - dump_pre_spatial. exact Hstate_resource.
  - add_pure
      (CircularAreaDivideRdDataResult readidx retval area_length 1)
      as Hdivide_sep.
    + dump_pre_spatial. exact Hdivide.
    + add_pure (retval <= output_capacity) as Hcapacity_sep.
      * dump_pre_spatial. lia.
      * add_pure (0 < retval) as Hpositive_sep.
        -- dump_pre_spatial. exact Hretval_pos.
        -- add_pure
             (CircularAreaActualReadLength logical data_length_pre retval)
             as Hactual_sep.
           ++ dump_pre_spatial. exact Hactual.
           ++ entailer!.
Qed.

Lemma proof_of_CircularAreaRead_entail_wit_3_2 : CircularAreaRead_entail_wit_3_2.
Proof.
  unfold CircularAreaRead_entail_wit_3_2.
  right.
  pre_process.
  pose proof
    (CircularArea_empty_result_zero_length_pos__read_call_normalization
       logical retval PreH10 PreH24) as Hlogical_pos.
  unfold CircularAreaDataLengthResult in PreH7.
  assert (Hactual : CircularAreaActualReadLength logical data_length_pre data_length_pre).
  {
    unfold CircularAreaActualReadLength.
    symmetry.
    apply Z.min_l.
    lia.
  }
  assert (Hdivide : CircularAreaDivideRdDataResult readidx data_length_pre area_length 1).
  {
    unfold CircularAreaDivideRdDataResult in *.
    destruct PreH3 as [[Hfit Hzero] | [Hwrap Hone]].
    - contradiction.
    - right. split; [exact Hwrap | lia].
  }
  unfold CircularAreaBackingResource at 1.
  Intros_p Hresource.
  destruct Hresource as [Hca [Hdata Hstate_resource]].
  add_pure
    (CircularAreaLogicalState readidx writeidx area_length b_status logical physical)
    as Hstate_sep.
  - dump_pre_spatial. exact Hstate_resource.
  - add_pure
      (CircularAreaDivideRdDataResult readidx data_length_pre area_length 1)
      as Hdivide_sep.
    + dump_pre_spatial. exact Hdivide.
    + add_pure
        (CircularAreaActualReadLength logical data_length_pre data_length_pre)
        as Hactual_sep.
      * dump_pre_spatial. exact Hactual.
      * entailer!.
Qed.

Lemma proof_of_CircularAreaRead_entail_wit_4 : CircularAreaRead_entail_wit_4.
Proof.
  aggressive_pre_process.
  - sep_apply_l_atomic (UCharArray.mixed_full_split_to_mixed_seg data_buffer readidx area_length physical).
    + dump_pre_spatial.
      unfold CircularAreaLogicalState in PreH10.
      destruct PreH10 as (Harea & Hread & Hwrite & Hlogical & Hphysical & Hbytes & Hwriteidx & Hfull & Hnotfull & Hlive).
      lia.
    + sep_apply_l_atomic (UCharArray.full_split_to_seg out0
        (unsigned_last_nbits (area_length - unsigned_last_nbits readidx 32) 32)
        output_capacity output_before).
      * dump_pre_spatial.
        unfold CircularAreaLogicalState in PreH10.
        unfold CircularAreaActualReadLength in PreH6.
        unfold CircularAreaDivideRdDataResult in PreH9.
        destruct PreH10 as (Harea & Hread & Hwrite & Hlogical & Hphysical & Hbytes & Hwriteidx & Hfull & Hnotfull & Hlive).
        destruct PreH9 as [[Hfit Heq] | [Hwrap Heq]]; [lia|].
        rewrite (unsigned_last_nbits_eq readidx 32) by (change (0 <= readidx < 4294967296); lia).
        rewrite (unsigned_last_nbits_eq (area_length - readidx) 32) by (change (0 <= area_length - readidx < 4294967296); lia).
        lia.
      * cancel.
  - dump_pre_spatial.
    unfold CircularAreaLogicalState in PreH10.
    unfold CircularAreaActualReadLength in PreH6.
    unfold CircularAreaDivideRdDataResult in PreH9.
    destruct PreH10 as (Harea & Hread & Hwrite & Hlogical & Hphysical & Hbytes & Hwriteidx & Hfull & Hnotfull & Hlive).
    destruct PreH9 as [[Hfit Heq] | [Hwrap Heq]]; [lia|].
    rewrite (unsigned_last_nbits_eq readidx 32) by (change (0 <= readidx < 4294967296); lia).
    rewrite (unsigned_last_nbits_eq (area_length - readidx) 32) by (change (0 <= area_length - readidx < 4294967296); lia).
    replace area_length with (readidx + (area_length - readidx)) at 1 by lia.
    eapply (CircularAreaInitializedSlice_nonwrap__read_copy_slices
      physical logical readidx area_length (area_length - readidx));
      try assumption; lia.
  - dump_pre_spatial.
    unfold CircularAreaLogicalState in PreH10.
    tauto.
  - dump_pre_spatial.
    unfold CircularAreaLogicalState in PreH10.
    unfold CircularAreaDivideRdDataResult in PreH9.
    destruct PreH10 as (Harea & Hread & Hwrite & Hlogical & Hphysical & Hbytes & Hwriteidx & Hfull & Hnotfull & Hlive).
    destruct PreH9 as [[Hfit Heq] | [Hwrap Heq]]; [lia|].
    rewrite (unsigned_last_nbits_eq readidx 32) by (change (0 <= readidx < 4294967296); lia).
    rewrite (unsigned_last_nbits_eq (area_length - readidx) 32) by (change (0 <= area_length - readidx < 4294967296); lia).
    lia.
  - dump_pre_spatial.
    unfold CircularAreaLogicalState in PreH10.
    unfold CircularAreaActualReadLength in PreH6.
    unfold CircularAreaDivideRdDataResult in PreH9.
    destruct PreH10 as (Harea & Hread & Hwrite & Hlogical & Hphysical & Hbytes & Hwriteidx & Hfull & Hnotfull & Hlive).
    destruct PreH9 as [[Hfit Heq] | [Hwrap Heq]]; [lia|].
    rewrite (unsigned_last_nbits_eq readidx 32) by (change (0 <= readidx < 4294967296); lia).
    rewrite (unsigned_last_nbits_eq (area_length - readidx) 32) by (change (0 <= area_length - readidx < 4294967296); lia).
    apply unsigned_last_nbits_eq.
    change (0 <= data_length - (area_length - readidx) < 4294967296).
    lia.
  - dump_pre_spatial.
    unfold CircularAreaLogicalState in PreH10.
    destruct PreH10 as (Harea & Hread & Hwrite & Hlogical & Hphysical & Hbytes & Hwriteidx & Hfull & Hnotfull & Hlive).
    rewrite (unsigned_last_nbits_eq readidx 32) by (change (0 <= readidx < 4294967296); lia).
    rewrite (unsigned_last_nbits_eq (area_length - readidx) 32) by (change (0 <= area_length - readidx < 4294967296); lia).
    reflexivity.
  - dump_pre_spatial.
    unfold CircularAreaLogicalState in PreH10.
    tauto.
  - dump_pre_spatial.
    unfold CircularAreaLogicalState in PreH10.
    tauto.
Qed.

Lemma proof_of_CircularAreaRead_entail_wit_5 : CircularAreaRead_entail_wit_5.
Proof.
  pre_process.
  prop_apply_p (UCharArray.seg_Zlength out0 read_len_up output_capacity
    (sublist read_len_up output_capacity output_before)).
  Intros_p HoutTail.
  sep_apply_l_atomic (UCharArray.seg_split_to_seg out0 read_len_up
    data_length output_capacity
    (sublist read_len_up output_capacity output_before)).
  - dump_pre_spatial.
    unfold CircularAreaLogicalState in PreH16.
    destruct PreH16 as (Harea & Hread & Hwrite & Hlogical & Hphysical & Hbytes & Hwriteidx & Hfull & Hnotfull & Hlive).
    lia.
  - rewrite Zsublist_Zsublist by lia.
    rewrite Zsublist_Zsublist by lia.
    replace (0 + read_len_up) with read_len_up by lia.
    replace (data_length - read_len_up + read_len_up) with data_length by lia.
    replace (output_capacity - read_len_up + read_len_up) with output_capacity by lia.
    sep_apply_l_atomic (UCharArray.mixed_seg_split_to_mixed_seg
      data_buffer 0 read_len_down readidx (sublist 0 readidx physical)).
    + dump_pre_spatial.
      unfold CircularAreaLogicalState in PreH16.
      unfold CircularAreaActualReadLength in PreH7.
      destruct PreH16 as (Harea & Hread & Hwrite & Hlogical & Hphysical & Hbytes & Hwriteidx & Hfull & Hnotfull & Hlive).
      lia.
    + replace (read_len_down - 0) with read_len_down by lia.
      replace (readidx - 0) with readidx by lia.
      rewrite Zsublist_Zsublist0 by lia.
      rewrite Zsublist_Zsublist0 by lia.
      split_pure_spatial.
      * cancel.
      * entailer!.
        unfold CircularAreaLogicalState in PreH16.
        unfold CircularAreaActualReadLength in PreH7.
        destruct PreH16 as (Harea & Hread & Hwrite & Hlogical & Hphysical & Hbytes & Hwriteidx & Hfull & Hnotfull & Hlive).
        replace (sublist read_len_up data_length logical)
          with (sublist read_len_up (read_len_up + read_len_down) logical)
          by (f_equal; lia).
        eapply (CircularAreaInitializedSlice_wrap_head__read_copy_slices
          physical logical readidx area_length read_len_up read_len_down);
          try assumption; lia.
Qed.

Lemma proof_of_CircularAreaRead_entail_wit_6_1 : CircularAreaRead_entail_wit_6_1.
Proof.
  aggressive_pre_process.
  all: unfold CircularAreaBackingResource; Intros_p Hback.
  - destruct Hback as (Hca & Hdb & Hstate).
    unfold CircularAreaLogicalState in Hstate.
    unfold CircularAreaDivideRdDataResult in PreH3.
    unfold CircularAreaDataLengthResult in PreH6.
    destruct Hstate as (Harea & Hread & Hwrite & Hlogical & Hphysical & Hbytes & Hwriteidx & Hfull & Hnotfull & Hlive).
    destruct PreH3 as [[Hfit Heq] | [Hwrap Heq]]; [|lia].
    sep_apply_l_atomic (UCharArray.mixed_full_split_to_mixed_seg
      data_buffer (readidx + retval) area_length physical).
    + dump_pre_spatial. lia.
    + sep_apply_l_atomic (UCharArray.mixed_seg_split_to_mixed_seg
        data_buffer 0 readidx (readidx + retval)
        (sublist 0 (readidx + retval) physical)).
      * dump_pre_spatial. lia.
      * replace (readidx - 0) with readidx by lia.
        replace (readidx + retval - 0) with (readidx + retval) by lia.
        rewrite Zsublist_Zsublist0 by lia.
        rewrite Zsublist_Zsublist0 by lia.
        sep_apply_l_atomic (UCharArray.full_split_to_seg out0 retval
          output_capacity output_before).
        -- dump_pre_spatial.
           unfold CircularAreaDataLengthResult in PreH6, PreH10.
           lia.
        -- cancel.
  - dump_pre_spatial.
    destruct Hback as (Hca & Hdb & Hstate).
    unfold CircularAreaLogicalState in Hstate.
    unfold CircularAreaDataLengthResult in PreH6.
    unfold CircularAreaDivideRdDataResult in PreH3.
    destruct Hstate as (Harea & Hread & Hwrite & Hlogical & Hphysical & Hbytes & Hwriteidx & Hfull & Hnotfull & Hlive).
    destruct PreH3 as [[Hfit Heq] | [Hwrap Heq]]; [|lia].
    eapply (CircularAreaInitializedSlice_nonwrap__read_copy_slices
      physical logical readidx area_length retval); try assumption; lia.
  - dump_pre_spatial.
    destruct Hback as (_ & _ & Hstate).
    unfold CircularAreaLogicalState in Hstate.
    tauto.
  - dump_pre_spatial. tauto.
  - dump_pre_spatial.
    unfold CircularAreaDivideRdDataResult in PreH3.
    destruct PreH3 as [[Hfit Heq] | [Hwrap Heq]]; lia.
  - dump_pre_spatial.
    destruct Hback as (_ & _ & Hstate).
    unfold CircularAreaLogicalState in Hstate.
    tauto.
  - dump_pre_spatial.
    unfold CircularAreaDataLengthResult in PreH6, PreH10.
    lia.
  - dump_pre_spatial.
    unfold CircularAreaDataLengthResult in PreH6.
    unfold CircularAreaEmptyResult in PreH13.
    destruct logical as [|x xs]; simpl in *; try lia.
    pose proof (CircularArea_zlength_cons_pos__read_call_normalization x xs).
    lia.
  - dump_pre_spatial.
    unfold CircularAreaActualReadLength.
    unfold CircularAreaDataLengthResult in PreH6, PreH10.
    rewrite Z.min_r by lia.
    lia.
Qed.

Lemma proof_of_CircularAreaRead_entail_wit_6_2 : CircularAreaRead_entail_wit_6_2.
Proof.
  aggressive_pre_process.
  all: unfold CircularAreaBackingResource; Intros_p Hback.
  - destruct Hback as (Hca & Hdb & Hstate).
    unfold CircularAreaLogicalState in Hstate.
    unfold CircularAreaDivideRdDataResult in PreH3.
    destruct Hstate as (Harea & Hread & Hwrite & Hlogical & Hphysical & Hbytes & Hwriteidx & Hfull & Hnotfull & Hlive).
    destruct PreH3 as [[Hfit Heq] | [Hwrap Heq]]; [|lia].
    sep_apply_l_atomic (UCharArray.mixed_full_split_to_mixed_seg
      data_buffer (readidx + data_length_pre) area_length physical).
    + dump_pre_spatial. lia.
    + sep_apply_l_atomic (UCharArray.mixed_seg_split_to_mixed_seg
        data_buffer 0 readidx (readidx + data_length_pre)
        (sublist 0 (readidx + data_length_pre) physical)).
      * dump_pre_spatial. lia.
      * replace (readidx - 0) with readidx by lia.
        replace (readidx + data_length_pre - 0)
          with (readidx + data_length_pre) by lia.
        rewrite Zsublist_Zsublist0 by lia.
        rewrite Zsublist_Zsublist0 by lia.
        sep_apply_l_atomic (UCharArray.full_split_to_seg out0 data_length_pre
          output_capacity output_before).
        -- dump_pre_spatial. lia.
        -- cancel.
  - dump_pre_spatial.
    destruct Hback as (Hca & Hdb & Hstate).
    unfold CircularAreaLogicalState in Hstate.
    unfold CircularAreaDataLengthResult in PreH7.
    unfold CircularAreaDivideRdDataResult in PreH3.
    destruct Hstate as (Harea & Hread & Hwrite & Hlogical & Hphysical & Hbytes & Hwriteidx & Hfull & Hnotfull & Hlive).
    destruct PreH3 as [[Hfit Heq] | [Hwrap Heq]]; [|lia].
    eapply (CircularAreaInitializedSlice_nonwrap__read_copy_slices
      physical logical readidx area_length data_length_pre);
      try assumption; lia.
  - dump_pre_spatial.
    destruct Hback as (_ & _ & Hstate).
    unfold CircularAreaLogicalState in Hstate.
    tauto.
  - dump_pre_spatial. tauto.
  - dump_pre_spatial.
    unfold CircularAreaDivideRdDataResult in PreH3.
    destruct PreH3 as [[Hfit Heq] | [Hwrap Heq]]; lia.
  - dump_pre_spatial.
    destruct Hback as (_ & _ & Hstate).
    unfold CircularAreaLogicalState in Hstate.
    tauto.
  - dump_pre_spatial.
    unfold CircularAreaActualReadLength.
    unfold CircularAreaDataLengthResult in PreH7.
    rewrite Z.min_l by lia.
    lia.
Qed.

Lemma proof_of_CircularAreaRead_return_wit_1 : CircularAreaRead_return_wit_1.
Proof.
  pre_process.
  Left.
  Exists data_length read_len_down.
  Exists (sublist 0 data_length logical).
  Exists (sublist data_length (Zlength logical) logical).
  Exists (sublist 0 data_length logical ++
          sublist data_length output_capacity output_before).
  pose proof PreH15 as Hstatefacts0.
  unfold CircularAreaLogicalState in Hstatefacts0.
  destruct Hstatefacts0 as
    (Harea0 & Hread0 & Hwrite0 & Hlogical0 & Hphysical0 & Hbytes0 &
     Hwriteidx0 & Hfull0 & Hnotfull0 & Hlive0).
  assert (Hmod : (readidx + data_length) mod area_length = read_len_down).
  { symmetry.
    apply Z.mod_unique with (q := 1).
    - lia.
    - lia. }
  pose proof
    (CircularArea_consume_logical_state__read_postconditions
       readidx writeidx area_length b_status requested data_length
       logical physical PreH15 PreH7 PreH8) as Hnewstate.
  pose proof PreH7 as Hactualfacts.
  unfold CircularAreaActualReadLength in Hactualfacts.
  pose proof (Z.le_min_r requested (Zlength logical)) as Hmin_logical.
  assert (Hdata_logical : data_length <= Zlength logical) by lia.
  rewrite Hmod in Hnewstate.
  unfold CircularAreaReadSuccess, CircularAreaOutputAfterRead.
  unfold CircularAreaBackingResource.
  entailer!.
  - assert (Hcast : unsigned_last_nbits read_len_down 8 = read_len_down).
    { apply unsigned_last_nbits_eq. simpl. lia. }
    rewrite Hcast.
    sep_apply_l_atomic
      (UCharArray.mixed_seg_merge_to_mixed_seg
         data_buffer 0 read_len_down readidx
         (sublist 0 read_len_down physical)
         (sublist read_len_down readidx physical)
         ltac:(lia)).
    rewrite <- (sublist_split 0 readidx read_len_down physical) by lia.
    sep_apply_l_atomic
      (UCharArray.mixed_seg_merge_to_mixed_full
         data_buffer 0 readidx area_length
         (sublist 0 readidx physical)
         (sublist readidx area_length physical)
         ltac:(lia)).
    rewrite <- (sublist_split 0 area_length readidx physical) by lia.
    rewrite sublist_self by lia.
    sep_apply_l_atomic
      (UCharArray.seg_merge_to_seg
         out0 0 read_len_up data_length
         (sublist 0 read_len_up logical)
         (sublist read_len_up data_length logical)
         ltac:(lia)).
    rewrite <- (sublist_split 0 data_length read_len_up logical) by lia.
    sep_apply_l_atomic
      (UCharArray.seg_merge_to_full
         out0 0 data_length output_capacity
         (sublist 0 data_length logical)
         (sublist data_length output_capacity output_before)
         ltac:(lia)).
    simpl.
    replace (out0 + 0) with out0 by lia.
    replace (output_capacity - 0) with output_capacity by lia.
    replace (data_buffer + 0) with data_buffer by lia.
    replace (area_length - 0) with area_length by lia.
    entailer!.
  - f_equal.
    rewrite Zlength_sublist.
    + replace (data_length - 0) with data_length by lia.
      reflexivity.
    + lia.
Qed.

Lemma proof_of_CircularAreaRead_return_wit_2 : CircularAreaRead_return_wit_2.
Proof.
  pre_process.
  Left.
  Exists data_length ((readidx + data_length) mod area_length).
  Exists (sublist 0 data_length logical).
  Exists (sublist data_length (Zlength logical) logical).
  Exists (sublist 0 data_length logical ++
          sublist data_length output_capacity output_before).
  pose proof
    (CircularArea_consume_logical_state__read_postconditions
       readidx writeidx area_length b_status requested data_length
       logical physical PreH13 PreH7 PreH8) as Hnewstate.
  unfold CircularAreaReadSuccess, CircularAreaOutputAfterRead.
  unfold CircularAreaBackingResource.
  entailer!.
  - pose proof PreH13 as Hstatefacts.
    unfold CircularAreaLogicalState in Hstatefacts.
    destruct Hstatefacts as
      (Harea & Hread & Hwrite & Hlogical & Hphysical & Hbytes &
       Hwriteidx & Hfull & Hnotfull & Hlive).
    assert (Hcast :
      unsigned_last_nbits ((readidx + data_length) % (area_length)) 8 =
      (readidx + data_length) mod area_length).
    { rewrite Z.rem_mod_nonneg by lia.
      apply unsigned_last_nbits_eq.
      pose proof (Z.mod_pos_bound (readidx + data_length) area_length
                    ltac:(lia)).
      simpl. lia. }
    rewrite Hcast.
    sep_apply_l_atomic
      (UCharArray.mixed_seg_merge_to_mixed_seg
         data_buffer 0 readidx (readidx + data_length)
         (sublist 0 readidx physical)
         (sublist readidx (readidx + data_length) physical)
         ltac:(lia)).
    rewrite <- (sublist_split 0 (readidx + data_length) readidx physical)
      by lia.
    sep_apply_l_atomic
      (UCharArray.mixed_seg_merge_to_mixed_full
         data_buffer 0 (readidx + data_length) area_length
         (sublist 0 (readidx + data_length) physical)
         (sublist (readidx + data_length) area_length physical)
         ltac:(lia)).
    rewrite <- (sublist_split 0 area_length
                  (readidx + data_length) physical) by lia.
    rewrite sublist_self by lia.
    sep_apply_l_atomic
      (UCharArray.seg_merge_to_full
         out0 0 data_length output_capacity
         (sublist 0 data_length logical)
         (sublist data_length output_capacity output_before)
         ltac:(lia)).
    simpl.
    replace (out0 + 0) with out0 by lia.
    replace (output_capacity - 0) with output_capacity by lia.
    replace (data_buffer + 0) with data_buffer by lia.
    replace (area_length - 0) with area_length by lia.
    entailer!.
  - unfold CircularAreaActualReadLength in PreH7.
    pose proof (Z.le_min_l requested (Zlength logical)).
    lia.
  - f_equal.
    rewrite Zlength_sublist.
    + replace (data_length - 0) with data_length by lia.
      reflexivity.
    + unfold CircularAreaActualReadLength in PreH7.
      pose proof (Z.le_min_r requested (Zlength logical)).
      lia.
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
  aggressive_pre_process.
  unfold CircularAreaBackingResource in *.
  entailer!.
Qed.

Lemma proof_of_CircularAreaRead_partial_solve_wit_4_pure : CircularAreaRead_partial_solve_wit_4_pure.
Proof.
  unfold CircularAreaRead_partial_solve_wit_4_pure.
  right.
  pre_process.
  unfold CircularAreaDataLengthResult in PreH5.
  unfold CircularAreaBackingResource at 1.
  Intros_p Hresource.
  destruct Hresource as [Hca [Hdata Hstate]].
  unfold CircularAreaLogicalState in Hstate.
  destruct Hstate as [Harea [Hread [Hwrite [Hlogical Hrest]]]].
  split_pures; dump_pre_spatial; lia.
Qed.

Lemma proof_of_CircularAreaRead_partial_solve_wit_5_pure : CircularAreaRead_partial_solve_wit_5_pure.
Proof.
  unfold CircularAreaRead_partial_solve_wit_5_pure.
  right.
  pre_process.
  unfold CircularAreaDataLengthResult in PreH5.
  unfold CircularAreaBackingResource at 1.
  Intros_p Hresource.
  destruct Hresource as [Hca [Hdata Hstate]].
  unfold CircularAreaLogicalState in Hstate.
  destruct Hstate as [Harea [Hread [Hwrite [Hlogical Hrest]]]].
  split_pures; dump_pre_spatial; lia.
Qed.

Lemma proof_of_CircularAreaRead_partial_solve_wit_6_pure : CircularAreaRead_partial_solve_wit_6_pure.
Proof.
  aggressive_pre_process.
  - prop_apply_p (UCharArray.seg_Zlength out0 0 read_len_up
      (sublist 0 read_len_up output_before)).
    Intros_p Hlen.
    dump_pre_spatial. rewrite <- PreH21. exact Hlen.
  - dump_pre_spatial.
    unfold CircularAreaActualReadLength in PreH16.
    unfold CircularAreaLogicalState in PreH25.
    destruct PreH25 as (Harea & Hread & Hwrite & Hlogical & Hphysical & Hbytes & Hwriteidx & Hfull & Hnotfull & Hlive).
    rewrite <- PreH21.
    rewrite Zlength_sublist by lia.
    lia.
  - dump_pre_spatial.
    unfold CircularAreaActualReadLength in PreH16.
    unfold CircularAreaLogicalState in PreH25.
    destruct PreH25 as (Harea & Hread & Hwrite & Hlogical & Hphysical & Hbytes & Hwriteidx & Hfull & Hnotfull & Hlive).
    rewrite <- PreH21.
    rewrite Zlength_sublist by lia.
    lia.
  - prop_apply_p (UCharArray.seg_Zlength out0 0 read_len_up
      (sublist 0 read_len_up output_before)).
    Intros_p Hlen.
    dump_pre_spatial. rewrite <- PreH21. exact Hlen.
Qed.

Lemma proof_of_CircularAreaRead_partial_solve_wit_7_pure : CircularAreaRead_partial_solve_wit_7_pure.
Proof.
  aggressive_pre_process.
  - prop_apply_p (UCharArray.seg_Zlength out0 read_len_up data_length
      (sublist read_len_up data_length output_before)).
    Intros_p Hlen.
    dump_pre_spatial. rewrite <- PreH21. exact Hlen.
  - dump_pre_spatial.
    unfold CircularAreaActualReadLength in PreH16.
    unfold CircularAreaLogicalState in PreH24.
    destruct PreH24 as (Harea & Hread & Hwrite & Hlogical & Hphysical & Hbytes & Hwriteidx & Hfull & Hnotfull & Hlive).
    rewrite <- PreH21.
    rewrite Zlength_sublist by lia.
    lia.
  - dump_pre_spatial.
    unfold CircularAreaActualReadLength in PreH16.
    unfold CircularAreaLogicalState in PreH24.
    destruct PreH24 as (Harea & Hread & Hwrite & Hlogical & Hphysical & Hbytes & Hwriteidx & Hfull & Hnotfull & Hlive).
    rewrite <- PreH21.
    rewrite Zlength_sublist by lia.
    lia.
  - prop_apply_p (UCharArray.seg_Zlength out0 read_len_up data_length
      (sublist read_len_up data_length output_before)).
    Intros_p Hlen.
    dump_pre_spatial. rewrite <- PreH21. exact Hlen.
Qed.

Lemma proof_of_CircularAreaRead_partial_solve_wit_8_pure : CircularAreaRead_partial_solve_wit_8_pure.
Proof.
  aggressive_pre_process.
  - prop_apply_p (UCharArray.seg_Zlength out0 0 data_length
      (sublist 0 data_length output_before)).
    Intros_p Hlen.
    dump_pre_spatial. lia.
  - dump_pre_spatial.
    unfold CircularAreaActualReadLength in PreH12.
    unfold CircularAreaLogicalState in PreH18.
    destruct PreH18 as (Harea & Hread & Hwrite & Hlogical & Hphysical & Hbytes & Hwriteidx & Hfull & Hnotfull & Hlive).
    rewrite Zlength_sublist by lia.
    lia.
Qed.
