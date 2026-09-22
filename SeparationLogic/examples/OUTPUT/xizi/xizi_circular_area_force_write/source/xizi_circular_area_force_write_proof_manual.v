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
From SimpleC.EE.OUTPUT.xizi.xizi_circular_area_force_write.source Require Import xizi_circular_area_force_write_goal.
From SimpleC.EE.OUTPUT.xizi.xizi_circular_area_force_write.source Require Import xizi_circular_area_force_write_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
From SimpleC.EE.OUTPUT.xizi.xizi_circular_area_force_write.source Require Import xizi_circular_area_force_write_lib.
Local Open Scope sac.

Lemma proof_of_CircularAreaIsFull_return_wit_1 : CircularAreaIsFull_return_wit_1.
Proof.
  aggressive_pre_process.
  unfold CircularAreaStateFullResult, CircularAreaLogicalState in *.
  destruct (Z.eq_dec (Zlength (ca_contents state)) (ca_capacity state)).
  - entailer!.
  - entailer!.
Qed.

Lemma proof_of_CircularAreaIsFull_return_wit_2 : CircularAreaIsFull_return_wit_2.
Proof.
  aggressive_pre_process.
  unfold CircularAreaStateFullResult, CircularAreaLogicalState in *.
  destruct (Z.eq_dec (Zlength (ca_contents state)) (ca_capacity state)); entailer!.
Qed.

Lemma proof_of_CircularAreaIsFull_return_wit_3 : CircularAreaIsFull_return_wit_3.
Proof.
  aggressive_pre_process.
  unfold CircularAreaStateFullResult, CircularAreaLogicalState in *.
  destruct (Z.eq_dec (Zlength (ca_contents state)) (ca_capacity state)); entailer!.
Qed.

Lemma proof_of_CircularAreaGetDataLength_safety_wit_4 : CircularAreaGetDataLength_safety_wit_4.
Proof.
  aggressive_pre_process.
  unfold CircularAreaLogicalState in *.
  entailer!.
  all: lia.
Qed.

Lemma proof_of_CircularAreaGetDataLength_safety_wit_5 : CircularAreaGetDataLength_safety_wit_5.
Proof.
  aggressive_pre_process.
  all: unfold CircularAreaLogicalState in PreH4.
  all: destruct PreH4 as (Hcap & Hread & Hwrite & Hlen & Hrest).
  all: entailer!.
  all: dump_pre_spatial; lia.
Qed.

Lemma proof_of_CircularAreaGetDataLength_entail_wit_1 : CircularAreaGetDataLength_entail_wit_1.
Proof.
  aggressive_pre_process.
  unfold CircularAreaStateFullResult, CircularAreaLogicalState in *.
  destruct (Z.eq_dec (Zlength (ca_contents state)) (ca_capacity state)); entailer!.
Qed.

Lemma proof_of_CircularAreaGetDataLength_entail_wit_2 : CircularAreaGetDataLength_entail_wit_2.
Proof.
  aggressive_pre_process.
  unfold CircularAreaStateFullResult, CircularAreaLogicalState in *.
  destruct (Z.eq_dec (Zlength (ca_contents state)) (ca_capacity state)); entailer!.
Qed.

Lemma proof_of_CircularAreaGetDataLength_return_wit_1 : CircularAreaGetDataLength_return_wit_1.
Proof.
  aggressive_pre_process.
  all: unfold CircularAreaStateDataLengthResult.
  all: unfold CircularAreaLogicalState in PreH4.
  all: destruct PreH4 as
    (Hcap & Hread & Hwrite & Hlen & Hphysical & Hbytes & Hindex &
     Hstatus & Hfull & Hempty & Hlive).
  all: entailer!.
  all: eapply circular_area_wrapped_distance__query_and_divide_arithmetic;
    eauto; lia.
Qed.

Lemma proof_of_CircularAreaGetDataLength_return_wit_2 : CircularAreaGetDataLength_return_wit_2.
Proof.
  aggressive_pre_process.
  unfold CircularAreaStateDataLengthResult.
  entailer!.
Qed.

Lemma proof_of_CircularAreaDivideWrData_entail_wit_1 : CircularAreaDivideWrData_entail_wit_1.
Proof.
  aggressive_pre_process.
  unfold CircularAreaLogicalState in *.
  entailer!.
Qed.

Lemma proof_of_CircularAreaDivideWrData_return_wit_1 : CircularAreaDivideWrData_return_wit_1.
Proof.
  aggressive_pre_process.
  all: unfold CircularAreaStateDivideWrDataResult, CircularAreaDivideWrDataResult,
    CircularAreaValid, CircularAreaLogicalState in *.
  all: destruct PreH8 as
    (Hcap & Hread & Hwrite & Hlen & Hphysical & Hbytes & Hindex &
     Hstatus & Hfull & Hempty & Hlive).
  all: replace (unsigned_last_nbits writeidx_2 32) with writeidx_2 in PreH1
    by (symmetry; apply unsigned_last_nbits_eq; lia).
  all: replace (unsigned_last_nbits (writeidx_2 + data_length_pre) 32)
    with (writeidx_2 + data_length_pre) in PreH1
    by (symmetry; apply unsigned_last_nbits_eq; lia).
  all: entailer!.
Qed.

Lemma proof_of_CircularAreaDivideWrData_return_wit_2 : CircularAreaDivideWrData_return_wit_2.
Proof.
  aggressive_pre_process.
  all: unfold CircularAreaStateDivideWrDataResult, CircularAreaDivideWrDataResult,
    CircularAreaValid, CircularAreaLogicalState in *.
  all: destruct PreH8 as
    (Hcap & Hread & Hwrite & Hlen & Hphysical & Hbytes & Hindex &
     Hstatus & Hfull & Hempty & Hlive).
  all: replace (unsigned_last_nbits writeidx_2 32) with writeidx_2 in PreH1
    by (symmetry; apply unsigned_last_nbits_eq; lia).
  all: replace (unsigned_last_nbits (writeidx_2 + data_length_pre) 32)
    with (writeidx_2 + data_length_pre) in PreH1
    by (symmetry; apply unsigned_last_nbits_eq; lia).
  all: entailer!.
Qed.

Lemma proof_of_CircularAreaWrite_safety_wit_11 : CircularAreaWrite_safety_wit_11.
Proof.
  aggressive_pre_process.
  unfold CircularAreaLogicalState in PreH15.
  entailer!.
Qed.

Lemma proof_of_CircularAreaWrite_entail_wit_2 : CircularAreaWrite_entail_wit_2.
Proof.
  aggressive_pre_process.
  unfold CircularAreaForceWriteInput.
  Intros_p Hbounds.
  normalize.
  repeat Split.
  - Intros_p Hcirc0. Intros_p Hinput0. entailer!.
  - Intros_p Hcirc0. Intros_p Hinput. entailer!.
  - Intros_p Hcirc. Intros_p Hinput0. entailer!.
  - Intros_p Hcirc. Intros_p Hinput.
    unfold store_circular_area.
    Intros data_buffer operations readidx writeidx b_status physical.
    destruct Hinput as [Hinput Hlen].
    destruct H as [Hcirc' [Hdata_buffer Hlogical]].
    symmetry in Hlen. subst data_length_pre.
    Exists operations readidx writeidx b_status physical data_buffer.
    entailer!.
Qed.

Lemma proof_of_CircularAreaWrite_entail_wit_4_1 : CircularAreaWrite_entail_wit_4_1.
Proof.
  aggressive_pre_process.
  all: assert (Hretval2 : retval_2 = 1) by
    (unfold CircularAreaStateDivideWrDataResult in PreH3;
     destruct PreH3 as [_ [_ [Hzero | Hone]]]; congruence).
  all: subst retval_2.
  all: unfold CircularAreaStateDataLengthResult in PreH9.
  all: subst retval.
  all: assert (Hgap :
    0 <= ca_capacity state - Zlength (ca_contents state) <= Int.max_unsigned) by
    (unfold CircularAreaStateDivideWrDataResult, CircularAreaValid in PreH3;
     destruct PreH3 as [[Hcap [Hlen Hbytes]] [Hgap' Hres]];
     change (0 <= ca_capacity state - Zlength (ca_contents state) <= 4294967295);
     lia).
  all: assert (Hunsigned :
    unsigned_last_nbits
      (ca_capacity state - Zlength (ca_contents state)) 32 =
    ca_capacity state - Zlength (ca_contents state)) by
    (symmetry; apply UInt_unsigned_eq; exact Hgap).
  all: rewrite Hunsigned in *.
  - exact PreH4.
  - exact PreH3.
  - unfold CircularAreaDivideWrDataResult in PreH4.
    unfold CircularAreaLogicalState in PreH5.
    destruct PreH4 as [[_ Hbad] | [Hwrap _]]; lia.
  - unfold CircularAreaActualWriteLength.
    rewrite Z.min_r; lia.
Qed.

Lemma proof_of_CircularAreaWrite_entail_wit_4_2 : CircularAreaWrite_entail_wit_4_2.
Proof.
  aggressive_pre_process.
  all: assert (Hretval2 : retval_2 = 1) by
    (unfold CircularAreaStateDivideWrDataResult in PreH3;
     destruct PreH3 as [_ [_ [Hzero | Hone]]]; congruence).
  all: subst retval_2.
  all: rewrite PreH11 in *.
  all: subst data_length.
  all: unfold CircularAreaStateDataLengthResult in PreH9.
  all: subst retval.
  all: assert (Hgap :
    0 <= ca_capacity state - Zlength (ca_contents state) <= Int.max_unsigned) by
    (unfold CircularAreaStateDivideWrDataResult, CircularAreaValid in PreH3;
     destruct PreH3 as [[Hcap [Hlen Hbytes]] [Hgap' Hres]];
     change (0 <= ca_capacity state - Zlength (ca_contents state) <= 4294967295);
     lia).
  all: assert (Hunsigned :
    unsigned_last_nbits
      (ca_capacity state - Zlength (ca_contents state)) 32 =
    ca_capacity state - Zlength (ca_contents state)) by
    (symmetry; apply UInt_unsigned_eq; exact Hgap).
  all: rewrite Hunsigned in *.
  - exact PreH4.
  - exact PreH3.
  - unfold CircularAreaActualWriteLength.
    rewrite Z.min_l; lia.
Qed.

Lemma proof_of_CircularAreaWrite_entail_wit_5 : CircularAreaWrite_entail_wit_5.
Proof.
  aggressive_pre_process.
  pose proof PreH12 as Hlogical_state.
  pose proof PreH10 as Hstate_result.
  pose proof PreH11 as Hdivide_result.
  unfold CircularAreaLogicalState in PreH12.
  destruct PreH12 as
    (Hcap & Hread & Hwrite & Hlogical_len & Hphysical_len & Hbytes &
     Hindex & Hstatus & Hfull & Hempty & Hlive).
  unfold CircularAreaStateDivideWrDataResult in PreH10.
  destruct PreH10 as (Hvalid & Hactual_bounds & Hresult).
  unfold CircularAreaDivideWrDataResult in PreH11.
  destruct PreH11 as [[Hnowrap Hbad] | [Hwrap Hone]]; [congruence |].
  assert (Hwrite_unsigned : unsigned_last_nbits writeidx 32 = writeidx).
  { symmetry. apply UInt_unsigned_eq.
    change (0 <= writeidx <= 4294967295). lia. }
  assert (Hup_unsigned :
    unsigned_last_nbits (ca_capacity state - writeidx) 32 =
    ca_capacity state - writeidx).
  { symmetry. apply UInt_unsigned_eq.
    change (0 <= ca_capacity state - writeidx <= 4294967295). lia. }
  assert (Hdown_unsigned :
    unsigned_last_nbits (data_length - (ca_capacity state - writeidx)) 32 =
    data_length - (ca_capacity state - writeidx)).
  { symmetry. apply UInt_unsigned_eq.
    change
      (0 <= data_length - (ca_capacity state - writeidx) <= 4294967295).
    lia. }
  rewrite Hwrite_unsigned, Hup_unsigned, Hdown_unsigned.
  sep_apply_l_atomic
    (UCharArray.mixed_full_split_to_mixed_seg
       data_buffer_2 writeidx (ca_capacity state) physical_2).
  - entailer!.
  - sep_apply_l_atomic
      (UCharArray.full_split_to_seg
         input_buffer_pre (ca_capacity state - writeidx)
         (Zlength input_contents) input_contents).
    + entailer!.
    + Exists physical_2.
      entailer!.
Qed.

Lemma proof_of_CircularAreaWrite_entail_wit_6 : CircularAreaWrite_entail_wit_6.
Proof.
  aggressive_pre_process.
  pose proof PreH18 as Hlogical_state.
  pose proof PreH16 as Hstate_result.
  pose proof PreH17 as Hdivide_result.
  unfold CircularAreaLogicalState in PreH18.
  destruct PreH18 as
    (Hcap & Hread & Hwrite & Hlogical_len & Hphysical_len & Hbytes &
     Hindex & Hstatus & Hfull & Hempty & Hlive).
  unfold CircularAreaStateDivideWrDataResult in PreH16.
  destruct PreH16 as (Hvalid & Hactual_bounds & Hresult).
  unfold CircularAreaDivideWrDataResult in PreH17.
  destruct PreH17 as [[Hnowrap Hbad] | [Hwrap Hone]]; [congruence |].
  assert (Hdown_bounds : 0 <= write_len_down <= writeidx_2) by lia.
  sep_apply_l_atomic
    (UCharArray.mixed_seg_split_to_mixed_seg
       data_buffer_2 0 write_len_down writeidx_2
       (sublist 0 writeidx_2 physical_2)).
  - entailer!.
  - Exists physical_2.
    entailer!.
    + replace (write_len_down - 0) with write_len_down by lia.
      replace (writeidx_2 - 0) with writeidx_2 by lia.
      rewrite Zsublist_Zsublist00 by lia.
      rewrite Zsublist_Zsublist0 by lia.
      entailer!.
    + apply sublist_split; lia.
    + rewrite Zlength_sublist by lia. lia.
Qed.

Lemma proof_of_CircularAreaWrite_entail_wit_7_1 : CircularAreaWrite_entail_wit_7_1.
Proof.
  aggressive_pre_process.
  pose proof PreH5 as Hlogical_state.
  pose proof PreH3 as Hstate_result.
  pose proof PreH4 as Hdivide_result.
  unfold CircularAreaStateDataLengthResult in PreH9.
  subst retval.
  assert (Hgap :
    0 <= ca_capacity state - Zlength (ca_contents state) <= Int.max_unsigned) by
    (unfold CircularAreaStateDivideWrDataResult, CircularAreaValid in PreH3;
     destruct PreH3 as [[Hcap [Hlen Hbytes]] [Hgap' Hres]];
     change (0 <= ca_capacity state - Zlength (ca_contents state) <= 4294967295);
     lia).
  assert (Hunsigned :
    unsigned_last_nbits
      (ca_capacity state - Zlength (ca_contents state)) 32 =
    ca_capacity state - Zlength (ca_contents state)) by
    (symmetry; apply UInt_unsigned_eq; exact Hgap).
  rewrite Hunsigned in *.
  unfold CircularAreaLogicalState in PreH5.
  destruct PreH5 as
    (Hcap & Hread & Hwrite & Hlogical_len & Hphysical_len & Hbytes &
     Hindex & Hstatus & Hfull & Hempty & Hlive).
  unfold CircularAreaDivideWrDataResult in PreH4.
  destruct PreH4 as [[Hnowrap Hzero] | [Hwrap Hbad]]; [|congruence].
  subst retval_2.
  sep_apply_l_atomic
    (UCharArray.mixed_full_split_to_mixed_seg
       data_buffer_4 writeidx_4 (ca_capacity state) physical_4).
  - entailer!.
  - sep_apply_l_atomic
      (UCharArray.mixed_seg_split_to_mixed_seg
         data_buffer_4 writeidx_4
         (writeidx_4 + (ca_capacity state - Zlength (ca_contents state)))
         (ca_capacity state)
         (sublist writeidx_4 (ca_capacity state) physical_4)).
    + entailer!.
    + sep_apply_l_atomic
        (UCharArray.full_split_to_seg
           input_buffer_pre
           (ca_capacity state - Zlength (ca_contents state))
           (Zlength input_contents) input_contents).
      * entailer!.
      * Exists physical_4.
        entailer!.
        -- rewrite !Zsublist_Zsublist by lia.
           replace (0 + writeidx_4) with writeidx_4 by lia.
           replace
             (writeidx_4 + (ca_capacity state - Zlength (ca_contents state)) -
              writeidx_4 + writeidx_4)
             with
               (writeidx_4 +
                (ca_capacity state - Zlength (ca_contents state))) by lia.
           replace (ca_capacity state - writeidx_4 + writeidx_4)
             with (ca_capacity state) by lia.
           entailer!.
        -- unfold CircularAreaActualWriteLength.
           rewrite Z.min_r; lia.
Qed.

Lemma proof_of_CircularAreaWrite_entail_wit_7_2 : CircularAreaWrite_entail_wit_7_2.
Proof.
  aggressive_pre_process.
  pose proof PreH5 as Hlogical_state.
  pose proof PreH3 as Hstate_result.
  pose proof PreH4 as Hdivide_result.
  unfold CircularAreaStateDataLengthResult in PreH9.
  subst retval.
  assert (Hgap :
    0 <= ca_capacity state - Zlength (ca_contents state) <= Int.max_unsigned) by
    (unfold CircularAreaStateDivideWrDataResult, CircularAreaValid in PreH3;
     destruct PreH3 as [[Hcap [Hlen Hbytes]] [Hgap' Hres]];
     change (0 <= ca_capacity state - Zlength (ca_contents state) <= 4294967295);
     lia).
  assert (Hunsigned :
    unsigned_last_nbits
      (ca_capacity state - Zlength (ca_contents state)) 32 =
    ca_capacity state - Zlength (ca_contents state)) by
    (symmetry; apply UInt_unsigned_eq; exact Hgap).
  rewrite Hunsigned in *.
  subst data_length.
  unfold CircularAreaLogicalState in PreH5.
  destruct PreH5 as
    (Hcap & Hread & Hwrite & Hlogical_len & Hphysical_len & Hbytes &
     Hindex & Hstatus & Hfull & Hempty & Hlive).
  unfold CircularAreaDivideWrDataResult in PreH4.
  destruct PreH4 as [[Hnowrap Hzero] | [Hwrap Hbad]]; [|congruence].
  subst retval_2.
  sep_apply_l_atomic
    (UCharArray.mixed_full_split_to_mixed_seg
       data_buffer_4 writeidx_4 (ca_capacity state) physical_4).
  - entailer!.
  - sep_apply_l_atomic
      (UCharArray.mixed_seg_split_to_mixed_seg
         data_buffer_4 writeidx_4
         (writeidx_4 + Zlength input_contents)
         (ca_capacity state)
         (sublist writeidx_4 (ca_capacity state) physical_4)).
    + entailer!.
    + sep_apply_l_atomic
        (UCharArray.full_split_to_seg
           input_buffer_pre (Zlength input_contents)
           (Zlength input_contents) input_contents).
      * entailer!.
      * Exists physical_4.
        entailer!.
        -- rewrite !Zsublist_Zsublist by lia.
           replace (0 + writeidx_4) with writeidx_4 by lia.
           replace
             (writeidx_4 + Zlength input_contents - writeidx_4 + writeidx_4)
             with (writeidx_4 + Zlength input_contents) by lia.
           replace (ca_capacity state - writeidx_4 + writeidx_4)
             with (ca_capacity state) by lia.
           entailer!.
        -- unfold CircularAreaActualWriteLength.
           rewrite Z.min_l; lia.
Qed.

Lemma proof_of_CircularAreaWrite_return_wit_1 : CircularAreaWrite_return_wit_1.
Proof.
  unfold CircularAreaWrite_return_wit_1.
  aggressive_pre_process.
  pose proof PreH19 as Hlogical_facts.
  unfold CircularAreaLogicalState in Hlogical_facts.
  destruct Hlogical_facts as
    [Hcap0 [Hread0 [Hwrite0 Hlogical_rest]]].
  destruct Hlogical_rest as [Hlogical_len Hlogical_rest].
  pose proof PreH12 as Hactual_eq.
  unfold CircularAreaActualWriteLength in Hactual_eq.
  assert (Hactual_bounds : 0 <= data_length <= Zlength input_contents).
  { rewrite Hactual_eq.
    split.
    - apply Z.min_glb; lia.
    - apply Z.le_min_l. }
  unfold CircularAreaDivideWrDataResult in PreH18.
  destruct PreH18 as [[Hnowrap Hbad]|[Hwrap Hone]]; [lia|].
  sep_apply (UCharArray.seg_merge_to_seg input_buffer_pre 0 write_len_up
    data_length); try lia.
  sep_apply (UCharArray.seg_merge_to_full input_buffer_pre 0 data_length
    (Zlength input_contents)); try lia.
  replace (input_buffer_pre + 0 * sizeof(UCHAR)) with input_buffer_pre by lia.
  replace (Zlength input_contents - 0) with (Zlength input_contents) by lia.
  rewrite <- (sublist_split 0 data_length write_len_up input_contents)
    by lia.
  replace (sublist 0 data_length input_contents ++
           sublist data_length (Zlength input_contents) input_contents)
    with input_contents.
  2:{ rewrite <- (sublist_split 0 (Zlength input_contents) data_length);
      try lia. symmetry. apply sublist_self. reflexivity. }
  subst data_length_pre.
  prop_apply uchar_full_forall_bytes__force_write_outcomes.
  Intros_p Hbytes.
  sep_apply (UCharArray.mixed_seg_merge_to_mixed_seg data_buffer 0
    write_len_down writeidx); try lia.
  sep_apply (UCharArray.mixed_seg_merge_to_mixed_full data_buffer 0 writeidx
    (ca_capacity state)); try lia.
  replace (data_buffer + 0 * sizeof(UCHAR)) with data_buffer by lia.
  replace (ca_capacity state - 0) with (ca_capacity state) by lia.
  rewrite <- List.app_assoc.
  pose proof (force_success_wrap_package__force_write_outcomes
    state (Zlength input_contents) input_contents readidx writeidx b_status
    physical data_length write_len_up write_len_down PreH10 eq_refl Hbytes
    PreH12 PreH15 PreH16 ltac:(lia) Hwrap PreH19) as Hpackage.
  cbn in Hpackage.
  destruct Hpackage as [Hresult [Hcap [Hindex Hphysical_len]]].
  assert (Hindex8 :
    unsigned_last_nbits write_len_down 8 = write_len_down).
  { apply unsigned_last_nbits_eq. cbn. lia. }
  unfold CircularAreaForceWriteOutcome.
  Right.
  Exists (Build_forced_circular_area_state
    (ca_capacity state) write_len_down
    (CircularAreaSomeBytes (sublist write_len_up data_length input_contents) ++
     (sublist write_len_down writeidx physical ++
      CircularAreaSomeBytes (sublist 0 write_len_up input_contents)))).
  unfold store_forced_circular_area.
  Exists data_buffer operations.
  entailer!.
  rewrite Hindex8.
  cbn.
  entailer!.
Qed.

Lemma proof_of_CircularAreaWrite_return_wit_2 : CircularAreaWrite_return_wit_2.
Proof.
  unfold CircularAreaWrite_return_wit_2.
  aggressive_pre_process.
  sep_apply (UCharArray.seg_merge_to_full input_buffer_pre 0 data_length
    (Zlength input_contents)); try lia.
  replace (input_buffer_pre + 0 * sizeof(UCHAR)) with input_buffer_pre by lia.
  replace (Zlength input_contents - 0) with (Zlength input_contents) by lia.
  replace (sublist 0 data_length input_contents ++
           sublist data_length (Zlength input_contents) input_contents)
    with input_contents.
  2:{ rewrite <- (sublist_split 0 (Zlength input_contents) data_length);
      try lia. symmetry. apply sublist_self. reflexivity. }
  subst data_length_pre.
  prop_apply uchar_full_forall_bytes__force_write_outcomes.
  Intros_p Hbytes.
  sep_apply (UCharArray.mixed_seg_merge_to_mixed_seg data_buffer 0 writeidx
    (writeidx + data_length)); try lia.
  sep_apply (UCharArray.mixed_seg_merge_to_mixed_full data_buffer 0
    (writeidx + data_length) (ca_capacity state)); try lia.
  replace (data_buffer + 0 * sizeof(UCHAR)) with data_buffer by lia.
  replace (ca_capacity state - 0) with (ca_capacity state) by lia.
  rewrite <- List.app_assoc.
  pose proof (force_success_no_wrap_package__force_write_outcomes
    state (Zlength input_contents) input_contents readidx writeidx b_status
    physical data_length PreH10 eq_refl Hbytes PreH12 PreH13 PreH14
    PreH16 PreH19) as Hpackage.
  cbn in Hpackage.
  destruct Hpackage as [Hresult [Hcap [Hindex Hphysical_len]]].
  assert (Hindex8 :
    unsigned_last_nbits ((writeidx + data_length) mod ca_capacity state) 8 =
    (writeidx + data_length) mod ca_capacity state).
  { apply unsigned_last_nbits_eq. cbn. lia. }
  unfold CircularAreaForceWriteOutcome.
  Right.
  Exists (Build_forced_circular_area_state
    (ca_capacity state) ((writeidx + data_length) mod ca_capacity state)
    (sublist 0 writeidx physical ++
     (CircularAreaSomeBytes (sublist 0 data_length input_contents) ++
      sublist (writeidx + data_length) (ca_capacity state) physical))).
  unfold store_forced_circular_area.
  Exists data_buffer operations.
  entailer!.
  assert (Hremmod :
    Z.rem (writeidx + data_length) (ca_capacity state) =
    (writeidx + data_length) mod ca_capacity state).
  { apply Z.rem_mod_nonneg; lia. }
  rewrite Hremmod, Hindex8.
  cbn.
  entailer!.
Qed.

Lemma proof_of_CircularAreaWrite_return_wit_3 : CircularAreaWrite_return_wit_3.
Proof.
  unfold CircularAreaWrite_return_wit_3.
  aggressive_pre_process.
  all: unfold CircularAreaForceWriteInput, CircularAreaForceWriteOutcome,
      CircularAreaErrorResult.
  all: entailer!.
  all: repeat (Split; entailer!).
  all: try Intros_p Hc.
  all: try Intros_p Hin.
  all: try solve [exfalso; tauto].
  - destruct Hin as [_ Hlen].
    destruct input_contents as [|a input_contents].
    + rewrite UCharArray.full_empty.
      Left.
      entailer!.
    + rewrite Zlength_cons in Hlen.
      pose proof (Zlength_nonneg input_contents).
      exfalso; lia.
  - destruct H1 as [_ Hlen].
    destruct input_contents as [|a input_contents]; [reflexivity|].
    rewrite Zlength_cons in Hlen.
    pose proof (Zlength_nonneg input_contents).
    lia.
Qed.

Lemma proof_of_CircularAreaWrite_return_wit_4 : CircularAreaWrite_return_wit_4.
Proof.
  unfold CircularAreaWrite_return_wit_4.
  aggressive_pre_process.
  all: try unfold CircularAreaForceWriteInput.
  all: try unfold CircularAreaErrorResult.
  all: entailer!.
  Unshelve.
  all: try (dump_pre_spatial; reflexivity).
  Split.
  - Intros_p Hc.
    exfalso; tauto.
  - Intros_p Hc.
    Split.
    + Intros_p Hin.
      reflexivity.
    + Intros_p Hin.
      exfalso; tauto.
Qed.

Lemma proof_of_CircularAreaWrite_return_wit_5 : CircularAreaWrite_return_wit_5.
Proof.
  unfold CircularAreaWrite_return_wit_5.
  aggressive_pre_process.
  unfold CircularAreaForceWriteInput, CircularAreaErrorResult.
  entailer!.
  repeat (Split; entailer!).
  all: try Intros_p Hc.
  all: try Intros_p Hin.
  all: try solve [exfalso; tauto].
  Split.
  - Intros_p Hcirc.
    Split.
    + Intros_p Hinput.
      Left.
      entailer!.
    + Intros_p Hinput.
      Right.
      entailer!.
  - Intros_p Hcirc.
    exfalso; tauto.
Qed.

Lemma proof_of_CircularAreaWrite_partial_solve_wit_3_pure : CircularAreaWrite_partial_solve_wit_3_pure.
Proof.
  pre_process.
  unfold CircularAreaStateDataLengthResult in PreH4.
  pose proof PreH5 as Hstate.
  unfold CircularAreaLogicalState in PreH5.
  destruct PreH5 as
    (Hcap & Hread & Hwrite & Hlogical & Hphysical &
     Hbytes & Hindex & Hstatus & Hfull & Hempty & Hlive).
  destruct Hcap as [Hcap_pos Hcap_hi].
  destruct Hlogical as [Hlogical_nonneg Hlogical_hi].
  subst retval.
  rewrite unsigned_last_nbits_eq in * by lia.
  split_pures; dump_pre_spatial; try assumption; lia.
Qed.

Lemma proof_of_CircularAreaWrite_partial_solve_wit_4_pure : CircularAreaWrite_partial_solve_wit_4_pure.
Proof.
  pre_process.
  unfold CircularAreaStateDataLengthResult in PreH4.
  pose proof PreH5 as Hstate.
  unfold CircularAreaLogicalState in PreH5.
  destruct PreH5 as
    (Hcap & Hread & Hwrite & Hlogical & Hphysical &
     Hbytes & Hindex & Hstatus & Hfull & Hempty & Hlive).
  destruct Hcap as [Hcap_pos Hcap_hi].
  destruct Hlogical as [Hlogical_nonneg Hlogical_hi].
  subst retval.
  rewrite unsigned_last_nbits_eq in * by lia.
  split_pures; dump_pre_spatial; try assumption; lia.
Qed.

Lemma proof_of_CircularAreaWrite_partial_solve_wit_5_pure : CircularAreaWrite_partial_solve_wit_5_pure.
Proof.
  pre_process.
  unfold CircularAreaLogicalState in PreH17.
  destruct PreH17 as
    (Hcap & Hread & Hwrite & Hlogical & Hphysical &
     Hbytes & Hindex & Hstatus & Hfull & Hempty & Hlive).
  split_pures; dump_pre_spatial; rewrite ?sizeof_uchar;
    try rewrite Zlength_sublist by lia; lia.
Qed.

Lemma proof_of_CircularAreaWrite_partial_solve_wit_6_pure : CircularAreaWrite_partial_solve_wit_6_pure.
Proof.
  pre_process.
  unfold CircularAreaActualWriteLength in PreH7.
  unfold CircularAreaLogicalState in PreH14.
  destruct PreH14 as
    (Hcap & Hread & Hwrite & Hlogical & Hphysical &
     Hbytes & Hindex & Hstatus & Hfull & Hempty & Hlive).
  assert (Hactual_le_input : (data_length <= Zlength input_contents)%Z).
  { destruct (Z.min_dec (Zlength input_contents)
                        (ca_capacity state - Zlength (ca_contents state)))
      as [Hmin | Hmin]; rewrite Hmin in PreH7; lia. }
  split_pures; dump_pre_spatial; rewrite ?sizeof_uchar;
    try rewrite Zlength_sublist by lia; lia.
Qed.

Lemma proof_of_CircularAreaWrite_partial_solve_wit_7_pure : CircularAreaWrite_partial_solve_wit_7_pure.
Proof.
  pre_process.
  unfold CircularAreaLogicalState in PreH14.
  destruct PreH14 as
    (Hcap & Hread & Hwrite & Hlogical & Hphysical &
     Hbytes & Hindex & Hstatus & Hfull & Hempty & Hlive).
  split_pures; dump_pre_spatial; rewrite ?sizeof_uchar;
    try rewrite Zlength_sublist by lia; lia.
Qed.
