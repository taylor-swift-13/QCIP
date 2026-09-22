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
  unfold CircularAreaFullResult, CircularAreaLogicalState in *.
  entailer!.
  destruct (Z.eq_dec (Zlength logical) area_length); lia.
Qed.

Lemma proof_of_CircularAreaIsFull_return_wit_2 : CircularAreaIsFull_return_wit_2.
Proof.
  pre_process.
  unfold CircularAreaFullResult, CircularAreaLogicalState in *.
  entailer!.
  destruct (Z.eq_dec (Zlength logical) area_length); lia.
Qed.

Lemma proof_of_CircularAreaIsFull_return_wit_3 : CircularAreaIsFull_return_wit_3.
Proof.
  pre_process.
  unfold CircularAreaFullResult, CircularAreaLogicalState in *.
  entailer!.
  destruct (Z.eq_dec (Zlength logical) area_length); lia.
Qed.

Lemma proof_of_CircularAreaGetDataLength_safety_wit_4 : CircularAreaGetDataLength_safety_wit_4.
Proof.
  pre_process.
  unfold CircularAreaLogicalState in *.
  entailer!; lia.
Qed.

Lemma proof_of_CircularAreaGetDataLength_safety_wit_5 : CircularAreaGetDataLength_safety_wit_5.
Proof.
  pre_process.
  unfold CircularAreaLogicalState in *.
  entailer!; lia.
Qed.

Lemma proof_of_CircularAreaGetDataLength_entail_wit_1 : CircularAreaGetDataLength_entail_wit_1.
Proof.
  pre_process.
  unfold CircularAreaFullResult in *.
  subst circular_area_pre.
  entailer!.
  destruct (Z.eq_dec (Zlength logical) area_length); lia.
Qed.

Lemma proof_of_CircularAreaGetDataLength_entail_wit_2 : CircularAreaGetDataLength_entail_wit_2.
Proof.
  pre_process.
  unfold CircularAreaFullResult in *.
  pose proof PreH4 as Hstate.
  unfold CircularAreaLogicalState in Hstate.
  destruct Hstate as (_ & _ & _ & Hlen & _).
  subst circular_area_pre.
  entailer!.
  destruct (Z.eq_dec (Zlength logical) area_length); lia.
Qed.

Lemma proof_of_CircularAreaGetDataLength_return_wit_1 : CircularAreaGetDataLength_return_wit_1.
Proof.
  pre_process.
  unfold CircularAreaDataLengthResult, CircularAreaLogicalState,
    unsigned_last_nbits in *.
  entailer!.
  destruct PreH4 as
    (Hcap & Hread & Hwrite_bound & Hlen & _ & _ & Hwrite & _).
  rewrite Z.rem_mod_nonneg by
    (try apply Z.mod_pos_bound; cbn; lia).
  rewrite Z.add_mod_idemp_l by (cbn; lia).
  rewrite (Z.mod_small (writeidx - readidx + area_length) (2 ^ 32))
    by (split; [lia | cbn; lia]).
  rewrite Hwrite.
  replace ((readidx + Zlength logical) mod area_length - readidx + area_length)
    with (((readidx + Zlength logical) mod area_length) +
          (- readidx + area_length)) by ring.
  rewrite Z.add_mod_idemp_l by lia.
  replace (readidx + Zlength logical + (- readidx + area_length))
    with (area_length + Zlength logical) by ring.
  symmetry.
  eapply Z.mod_unique with (q := 1); lia.
Qed.

Lemma proof_of_CircularAreaGetDataLength_return_wit_2 : CircularAreaGetDataLength_return_wit_2.
Proof.
  pre_process.
  unfold CircularAreaDataLengthResult in *.
  entailer!; lia.
Qed.

Lemma proof_of_CircularAreaDivideWrData_return_wit_1 : CircularAreaDivideWrData_return_wit_1.
Proof.
  pre_process.
  pose proof PreH8 as Hstate.
  unfold CircularAreaLogicalState in Hstate.
  destruct Hstate as (_ & _ & Hwrite & _).
  rewrite (unsigned_last_nbits_eq writeidx 32) in PreH1 by (cbn; lia).
  rewrite (unsigned_last_nbits_eq (writeidx + d0) 32) in PreH1 by
    (cbn; lia).
  unfold CircularAreaDivideWrDataResult.
  entailer!.
Qed.

Lemma proof_of_CircularAreaDivideWrData_return_wit_2 : CircularAreaDivideWrData_return_wit_2.
Proof.
  pre_process.
  pose proof PreH8 as Hstate.
  unfold CircularAreaLogicalState in Hstate.
  destruct Hstate as (_ & _ & Hwrite & _).
  rewrite (unsigned_last_nbits_eq writeidx 32) in PreH1 by (cbn; lia).
  rewrite (unsigned_last_nbits_eq (writeidx + d0) 32) in PreH1 by
    (cbn; lia).
  unfold CircularAreaDivideWrDataResult.
  entailer!.
Qed.

Lemma proof_of_CircularAreaWrite_safety_wit_20 : CircularAreaWrite_safety_wit_20.
Proof.
  pre_process.
  unfold CircularAreaLogicalState in PreH13.
  entailer!.
Qed.

Lemma proof_of_CircularAreaWrite_entail_wit_1 : CircularAreaWrite_entail_wit_1.
Proof.
  pre_process.
  subst circular_area_pre input_buffer_pre data_length_pre b_force_pre.
  unfold CircularAreaBackingResource.
  entailer!.
Qed.

Lemma proof_of_CircularAreaWrite_entail_wit_2_1 : CircularAreaWrite_entail_wit_2_1.
Proof.
  pre_process.
  Exists retval.
  unfold CircularAreaFullResult in PreH4.
  destruct (Z.eq_dec (Zlength logical) area_length).
  - subst retval. lia.
  - unfold CircularAreaLogicalState in PreH5.
    entailer!.
    unfold CircularAreaFullResult.
    destruct (Z.eq_dec (Zlength logical) area_length); lia.
Qed.

Lemma proof_of_CircularAreaWrite_entail_wit_2_2 : CircularAreaWrite_entail_wit_2_2.
Proof.
  pre_process.
  Exists retval.
  entailer!.
Qed.

Lemma proof_of_CircularAreaWrite_entail_wit_3_1 : CircularAreaWrite_entail_wit_3_1.
Proof.
  pre_process.
  unfold CircularAreaDataLengthResult in PreH8.
  subst retval.
  unfold CircularAreaLogicalState in PreH4.
  destruct PreH4 as [Harea [Hread [Hwrite [Hlen Hstate]]]].
  rewrite unsigned_last_nbits_eq in * by lia.
  assert (Hready : CircularAreaWriteLengthReady area_length requested logical
                    (area_length - Zlength logical) force0).
  { unfold CircularAreaWriteLengthReady, CircularAreaActualWriteLength.
    split.
    - rewrite Z.min_r; lia.
    - intros Hforce. apply PreH16 in Hforce. lia. }
  assert (Hdivide : CircularAreaDivideWrDataResult writeidx
                      (area_length - Zlength logical) area_length 1).
  { unfold CircularAreaDivideWrDataResult in PreH3 |- *.
    destruct PreH3 as [[Hle Hzero] | [Hgt Hone]].
    - exfalso. apply PreH19. lia.
    - right. split; lia. }
  entailer!.
Qed.

Lemma proof_of_CircularAreaWrite_entail_wit_3_2 : CircularAreaWrite_entail_wit_3_2.
Proof.
  pre_process.
  unfold CircularAreaDataLengthResult in PreH8.
  subst retval.
  unfold CircularAreaLogicalState in PreH4.
  destruct PreH4 as [Harea [Hread [Hwrite [Hlen Hstate]]]].
  rewrite unsigned_last_nbits_eq in * by lia.
  assert (Hready : CircularAreaWriteLengthReady area_length requested logical
                    requested force0).
  { unfold CircularAreaWriteLengthReady, CircularAreaActualWriteLength.
    split.
    - rewrite Z.min_l; lia.
    - intros Hforce. lia. }
  assert (Hdivide : CircularAreaDivideWrDataResult writeidx requested area_length 1).
  { unfold CircularAreaDivideWrDataResult in PreH3 |- *.
    destruct PreH3 as [[Hle Hzero] | [Hgt Hone]].
    - exfalso. apply PreH19. lia.
    - right. split; lia. }
  entailer!.
Qed.

Lemma proof_of_CircularAreaWrite_entail_wit_4 : CircularAreaWrite_entail_wit_4.
Proof.
  aggressive_pre_process.
  all: unfold CircularAreaLogicalState in PreH10.
  all: destruct PreH10 as [Harea [Hread [Hwrite [Hlogical [Hphysical Hrest]]]]].
  all: unfold CircularAreaDivideWrDataResult in PreH9.
  all: destruct PreH9 as [[Hnowrap Hzero] | [Hwrap Hone]]; try lia.
  all: prop_apply (UCharArray.full_length_range in0 requested input_contents).
  all: Intros_p Hrequested_range.
  - rewrite (unsigned_last_nbits_eq writeidx 32) by lia.
    rewrite (unsigned_last_nbits_eq (area_length - writeidx) 32) by lia.
    sep_apply_l_atomic (UCharArray.mixed_full_split_to_mixed_seg data_buffer writeidx area_length physical).
    + dump_pre_spatial; lia.
    + sep_apply_l_atomic (UCharArray.full_split_to_seg in0 (area_length - writeidx) requested input_contents).
      * dump_pre_spatial; lia.
      * entailer!.
  - dump_pre_spatial.
    rewrite (unsigned_last_nbits_eq writeidx 32) by lia.
    rewrite (unsigned_last_nbits_eq (area_length - writeidx) 32) by lia.
    lia.
  - dump_pre_spatial.
    rewrite (unsigned_last_nbits_eq writeidx 32) by lia.
    rewrite (unsigned_last_nbits_eq (area_length - writeidx) 32) by lia.
    cbn [sizeof_front_end_type] in Hrequested_range.
    change Int.max_unsigned with 4294967295 in Hrequested_range.
    simpl in Hrequested_range.
    apply unsigned_last_nbits_eq.
    change (0 <= data_length - (area_length - writeidx) < 4294967296).
    lia.
  - dump_pre_spatial.
    rewrite (unsigned_last_nbits_eq writeidx 32) by lia.
    rewrite (unsigned_last_nbits_eq (area_length - writeidx) 32) by lia.
    reflexivity.
  - dump_pre_spatial; lia.
  - dump_pre_spatial; lia.
Qed.

Lemma proof_of_CircularAreaWrite_entail_wit_5 : CircularAreaWrite_entail_wit_5.
Proof.
  aggressive_pre_process.
  all: unfold CircularAreaLogicalState in PreH16.
  all: destruct PreH16 as [Harea [Hread [Hwrite [Hlogical [Hphysical Hrest]]]]].
  all: unfold CircularAreaWriteLengthReady, CircularAreaActualWriteLength in PreH6.
  all: destruct PreH6 as [Hactual Hpositive].
  all: unfold CircularAreaDivideWrDataResult in PreH15.
  all: destruct PreH15 as [[Hnowrap Hzero] | [Hwrap Hone]]; try lia.
  all: pose proof (Z.le_min_r requested (area_length - Zlength logical)) as Hmin_area.
  all: rewrite <- Hactual in Hmin_area.
  - sep_apply_l_atomic
      (UCharArray.mixed_seg_split_to_mixed_seg data_buffer 0 write_len_down writeidx
        (sublist 0 writeidx physical)).
    + dump_pre_spatial; subst write_len_up write_len_down; lia.
    + rewrite Zsublist_Zsublist0 by
          (subst write_len_up write_len_down; lia).
      rewrite Zsublist_Zsublist0 by
          (subst write_len_up write_len_down; lia).
      replace (write_len_down - 0) with write_len_down by lia.
      replace (writeidx - 0) with writeidx by lia.
      entailer!.
  - dump_pre_spatial. subst write_len_up write_len_down.
    lia.
  - dump_pre_spatial.
    rewrite (sublist_split (area_length - writeidx) requested data_length input_contents) by
      (subst write_len_up write_len_down; lia).
    reflexivity.
  - dump_pre_spatial.
    rewrite Zlength_sublist by
      (subst write_len_up write_len_down; lia).
    reflexivity.
Qed.

Lemma proof_of_CircularAreaWrite_entail_wit_6_1 : CircularAreaWrite_entail_wit_6_1.
Proof.
  aggressive_pre_process.
  all: unfold CircularAreaDataLengthResult in PreH8; subst retval.
  all: unfold CircularAreaLogicalState in PreH18.
  all: destruct PreH18 as [Harea [Hread [Hwrite [Hlogical [Hphysical Hrest]]]]].
  all: try rewrite (unsigned_last_nbits_eq (area_length - Zlength logical) 32) in * by lia.
  all: unfold CircularAreaDivideWrDataResult in PreH3.
  all: rewrite PreH19 in PreH3.
  all: destruct PreH3 as [[Hnowrap Hzero] | [Hwrap Hone]]; try lia.
  - sep_apply_l_atomic
      (UCharArray.mixed_full_split_to_mixed_seg data_buffer writeidx area_length physical).
    + dump_pre_spatial; lia.
    + sep_apply_l_atomic
        (UCharArray.mixed_seg_split_to_mixed_seg data_buffer writeidx
          (writeidx + (area_length - Zlength logical)) area_length
          (sublist writeidx area_length physical)).
      * dump_pre_spatial; lia.
      * sep_apply_l_atomic
          (UCharArray.full_split_to_seg in0 (area_length - Zlength logical)
            requested input_contents).
        -- dump_pre_spatial; lia.
        -- rewrite Zsublist_Zsublist by lia.
           rewrite Zsublist_Zsublist by lia.
           replace (0 + writeidx) with writeidx by lia.
           replace (area_length - Zlength logical + writeidx)
             with (writeidx + (area_length - Zlength logical)) by lia.
           replace (area_length - writeidx + writeidx) with area_length by lia.
           replace (writeidx + (area_length - Zlength logical) - writeidx + writeidx)
             with (writeidx + (area_length - Zlength logical)) by lia.
           entailer!.
  - dump_pre_spatial; lia.
  - dump_pre_spatial; lia.
  - dump_pre_spatial; lia.
  - dump_pre_spatial.
    unfold CircularAreaWriteLengthReady, CircularAreaActualWriteLength.
    split.
    + rewrite Z.min_r by lia. reflexivity.
    + intro Hforce. apply PreH16 in Hforce. lia.
Qed.

Lemma proof_of_CircularAreaWrite_entail_wit_6_2 : CircularAreaWrite_entail_wit_6_2.
Proof.
  aggressive_pre_process.
  all: unfold CircularAreaDataLengthResult in PreH8; subst retval.
  all: unfold CircularAreaLogicalState in PreH18.
  all: destruct PreH18 as [Harea [Hread [Hwrite [Hlogical [Hphysical Hrest]]]]].
  all: try rewrite (unsigned_last_nbits_eq (area_length - Zlength logical) 32) in * by lia.
  all: unfold CircularAreaDivideWrDataResult in PreH3.
  all: rewrite PreH19 in PreH3.
  all: destruct PreH3 as [[Hnowrap Hzero] | [Hwrap Hone]]; try lia.
  - rewrite (sublist_self input_contents requested) by lia.
    sep_apply_l_atomic
      (UCharArray.mixed_full_split_to_mixed_seg data_buffer writeidx area_length physical).
    + dump_pre_spatial; lia.
    + sep_apply_l_atomic
        (UCharArray.mixed_seg_split_to_mixed_seg data_buffer writeidx
          (writeidx + requested) area_length
          (sublist writeidx area_length physical)).
      * dump_pre_spatial; lia.
      * sep_apply_l_atomic (UCharArray.full_to_seg in0 requested input_contents).
        rewrite Zsublist_Zsublist by lia.
        rewrite Zsublist_Zsublist by lia.
        replace (0 + writeidx) with writeidx by lia.
        replace (writeidx + requested - writeidx + writeidx)
          with (writeidx + requested) by lia.
        replace (area_length - writeidx + writeidx) with area_length by lia.
        entailer!.
  - dump_pre_spatial; lia.
  - dump_pre_spatial; lia.
  - dump_pre_spatial.
    unfold CircularAreaWriteLengthReady, CircularAreaActualWriteLength.
    split.
    + rewrite Z.min_l by lia. reflexivity.
    + intros Hforce. lia.
  - dump_pre_spatial. apply Zsublist_nil. lia.
Qed.

Lemma proof_of_CircularAreaWrite_return_wit_1 : CircularAreaWrite_return_wit_1.
Proof.
  aggressive_pre_process.
  unfold CircularAreaLogicalState in PreH17.
  destruct PreH17 as
    [Harea [Hread [Hwrite [Hlogical [Hphysical
    [Hbytes [Hindex [Hstatus [Hfull [Hempty Hlive]]]]]]]]]].
  unfold CircularAreaWriteLengthReady, CircularAreaActualWriteLength in PreH10.
  destruct PreH10 as [Hactual Hpositive].
  unfold CircularAreaDivideWrDataResult in PreH16.
  destruct PreH16 as [[Hdivide Hret] | [Hdivide Hret]]; try lia.
  assert (Hactualrequested : data_length <= requested).
  { rewrite Hactual. apply Z.le_min_l. }
  assert (Hactualarea : data_length <= area_length - Zlength logical).
  { rewrite Hactual. apply Z.le_min_r. }
  assert (Hactualnonneg : 0 <= data_length) by lia.
  assert (Hactualbound : data_length <= area_length) by lia.
  assert (Hmod : write_len_down =
    (writeidx + data_length) mod area_length).
  {
    apply Z.mod_unique with (q := 1).
    - left. lia.
    - lia.
  }
  Exists data_length write_len_down
    ((CircularAreaSomeBytes (sublist write_len_up data_length input_contents) ++
      sublist write_len_down writeidx physical) ++
     CircularAreaSomeBytes (sublist 0 write_len_up input_contents)).
  unfold CircularAreaForceWriteResource.
  assert (Hbits : unsigned_last_nbits write_len_down 8 = write_len_down).
  {
    apply unsigned_last_nbits_eq.
    change (0 <= write_len_down < 256).
    lia.
  }
  rewrite Hbits.
  sep_apply_l_atomic
    (UCharArray.mixed_seg_merge_to_mixed_seg data_buffer 0 write_len_down
      writeidx (CircularAreaSomeBytes
        (sublist write_len_up data_length input_contents))
      (sublist write_len_down writeidx physical)).
  - dump_pre_spatial. lia.
  - sep_apply_l_atomic
      (UCharArray.mixed_seg_merge_to_mixed_full data_buffer 0 writeidx
        area_length
        (CircularAreaSomeBytes
           (sublist write_len_up data_length input_contents) ++
         sublist write_len_down writeidx physical)
        (CircularAreaSomeBytes (sublist 0 write_len_up input_contents))).
    + dump_pre_spatial. lia.
    + sep_apply_l_atomic
        (UCharArray.seg_merge_to_seg in0 0 write_len_up data_length
          (sublist 0 write_len_up input_contents)
          (sublist write_len_up data_length input_contents)).
      * dump_pre_spatial. lia.
      * sep_apply_l_atomic
          (UCharArray.seg_merge_to_full in0 0 data_length requested
            (sublist 0 write_len_up input_contents ++
             sublist write_len_up data_length input_contents)
            (sublist data_length requested input_contents)).
        { dump_pre_spatial. lia. }
        assert (Hinputprefix :
          sublist 0 write_len_up input_contents ++
          sublist write_len_up data_length input_contents =
          sublist 0 data_length input_contents).
        {
          rewrite <- (sublist_split 0 data_length write_len_up input_contents)
            by lia.
          reflexivity.
        }
        assert (Hinputsplit :
          (sublist 0 write_len_up input_contents ++
           sublist write_len_up data_length input_contents) ++
          sublist data_length requested input_contents = input_contents).
        {
          rewrite Hinputprefix.
          rewrite <- (sublist_split 0 requested data_length input_contents)
            by lia.
          apply sublist_self.
          symmetry. exact PreH11.
        }
        assert (Hphysicalwrite : CircularAreaPhysicalWrite
          physical input_contents
          ((CircularAreaSomeBytes
              (sublist write_len_up data_length input_contents) ++
            sublist write_len_down writeidx physical) ++
           CircularAreaSomeBytes (sublist 0 write_len_up input_contents))
          area_length writeidx data_length).
        {
          rewrite <- app_assoc.
          apply circular_area_physical_write_wrap__write_returns; lia.
        }
        rewrite Hinputsplit.
        entailer!.
        simpl.
        replace (in0 + 0) with in0 by lia.
        replace (requested - 0) with requested by lia.
        replace (data_buffer + 0) with data_buffer by lia.
        replace (area_length - 0) with area_length by lia.
        cancel.
        all: try exact (proj1 (proj2 Hphysicalwrite)).
        unfold CircularAreaForceWriteEffect.
        split; [unfold CircularAreaActualWriteLength; exact Hactual |].
        split; [lia |].
        split; [exact Hmod |].
        exact Hphysicalwrite.
Qed.

Lemma proof_of_CircularAreaWrite_return_wit_2 : CircularAreaWrite_return_wit_2.
Proof.
  aggressive_pre_process.
  unfold CircularAreaLogicalState in PreH17.
  destruct PreH17 as
    [Harea [Hread [Hwrite [Hlogical [Hphysical
    [Hbytes [Hindex [Hstatus [Hfull [Hempty Hlive]]]]]]]]]].
  unfold CircularAreaWriteLengthReady, CircularAreaActualWriteLength in PreH10.
  destruct PreH10 as [Hactual Hpositive].
  unfold CircularAreaDivideWrDataResult in PreH16.
  destruct PreH16 as [[Hdivide Hret] | [Hdivide Hret]]; try lia.
  Exists data_length ((writeidx + data_length) mod area_length)
    ((sublist 0 writeidx physical) ++
     (CircularAreaSomeBytes (sublist 0 data_length input_contents)) ++
     (sublist (writeidx + data_length) area_length physical)).
  unfold CircularAreaForceWriteResource.
  assert (Hmodrange :
    0 <= (writeidx + data_length) mod area_length < area_length).
  { apply Z.mod_pos_bound. lia. }
  assert (Hbits :
    unsigned_last_nbits ((writeidx + data_length) mod area_length) 8 =
    (writeidx + data_length) mod area_length).
  {
    apply unsigned_last_nbits_eq.
    change (0 <= (writeidx + data_length) mod area_length < 256).
    lia.
  }
  assert (Hremmod :
    Z.rem (writeidx + data_length) area_length =
    (writeidx + data_length) mod area_length).
  { apply Z.rem_mod_nonneg; lia. }
  rewrite Hremmod, Hbits.
  sep_apply_l_atomic
    (UCharArray.mixed_seg_merge_to_mixed_seg data_buffer 0 writeidx
      (writeidx + data_length) (sublist 0 writeidx physical)
      (CircularAreaSomeBytes (sublist 0 data_length input_contents))).
  - dump_pre_spatial. lia.
  - sep_apply_l_atomic
      (UCharArray.mixed_seg_merge_to_mixed_full data_buffer 0
        (writeidx + data_length) area_length
        (sublist 0 writeidx physical ++
         CircularAreaSomeBytes (sublist 0 data_length input_contents))
        (sublist (writeidx + data_length) area_length physical)).
    + dump_pre_spatial. lia.
    + sep_apply_l_atomic
        (UCharArray.seg_merge_to_full in0 0 data_length requested
          (sublist 0 data_length input_contents)
          (sublist data_length requested input_contents)).
      * dump_pre_spatial. lia.
      * assert (Hinputsplit :
          sublist 0 data_length input_contents ++
          sublist data_length requested input_contents = input_contents).
        {
          rewrite <- (sublist_split 0 requested data_length input_contents)
            by lia.
          apply sublist_self.
          symmetry. exact PreH11.
        }
        assert (Hphysicalwrite : CircularAreaPhysicalWrite
          physical input_contents
          ((sublist 0 writeidx physical ++
           CircularAreaSomeBytes (sublist 0 data_length input_contents)) ++
           sublist (writeidx + data_length) area_length physical)
          area_length writeidx data_length).
        {
          rewrite <- app_assoc.
          apply circular_area_physical_write_nowrap__write_returns; lia.
        }
        rewrite Hinputsplit.
        rewrite app_assoc.
        entailer!.
        simpl.
        replace (in0 + 0) with in0 by lia.
        replace (requested - 0) with requested by lia.
        replace (data_buffer + 0) with data_buffer by lia.
        replace (area_length - 0) with area_length by lia.
        cancel.
        all: try exact (proj1 (proj2 Hphysicalwrite)).
        unfold CircularAreaForceWriteEffect.
        split; [unfold CircularAreaActualWriteLength; exact Hactual |].
        split; [lia |].
        split; [reflexivity |].
        exact Hphysicalwrite.
Qed.

Lemma proof_of_CircularAreaWrite_return_wit_3 : CircularAreaWrite_return_wit_3.
Proof.
  aggressive_pre_process.
  Left.
  pose proof PreH13 as Hstate.
  unfold CircularAreaLogicalState in PreH13.
  destruct PreH13 as
    [Harea [Hread [Hwrite [Hlogical [Hphysical
    [Hbytes [Hindex [Hstatus [Hfull [Hempty Hlive]]]]]]]]]].
  unfold CircularAreaWriteLengthReady, CircularAreaActualWriteLength in PreH6.
  destruct PreH6 as [Hactual Hpositive].
  unfold CircularAreaDivideWrDataResult in PreH12.
  destruct PreH12 as [[Hdivide Hret] | [Hdivide Hret]]; try lia.
  assert (Hactualpos : 0 < data_length) by (apply Hpositive; exact PreH14).
  assert (Hactualrequested : data_length <= requested).
  { rewrite Hactual. apply Z.le_min_l. }
  assert (Hfree : data_length <= area_length - Zlength logical).
  { rewrite Hactual. apply Z.le_min_r. }
  assert (Hmod : write_len_down =
    (writeidx + data_length) mod area_length).
  { apply Z.mod_unique with (q := 1); [left; lia|lia]. }
  Exists data_length write_len_down
    (logical ++ sublist 0 data_length input_contents)
    ((CircularAreaSomeBytes (sublist write_len_up data_length input_contents) ++
      sublist write_len_down writeidx physical) ++
     CircularAreaSomeBytes (sublist 0 write_len_up input_contents)).
  unfold CircularAreaBackingResource.
  assert (Hbits : unsigned_last_nbits write_len_down 8 = write_len_down).
  { apply unsigned_last_nbits_eq. change (0 <= write_len_down < 256). lia. }
  rewrite Hbits.
  sep_apply_l_atomic
    (UCharArray.mixed_seg_merge_to_mixed_seg data_buffer 0 write_len_down
      writeidx (CircularAreaSomeBytes
        (sublist write_len_up data_length input_contents))
      (sublist write_len_down writeidx physical)).
  - dump_pre_spatial. lia.
  - sep_apply_l_atomic
      (UCharArray.mixed_seg_merge_to_mixed_full data_buffer 0 writeidx
        area_length
        (CircularAreaSomeBytes
           (sublist write_len_up data_length input_contents) ++
         sublist write_len_down writeidx physical)
        (CircularAreaSomeBytes (sublist 0 write_len_up input_contents))).
    + dump_pre_spatial. lia.
    + sep_apply_l_atomic
        (UCharArray.seg_merge_to_seg in0 0 write_len_up data_length
          (sublist 0 write_len_up input_contents)
          (sublist write_len_up data_length input_contents)).
      * dump_pre_spatial. lia.
      * sep_apply_l_atomic
          (UCharArray.seg_merge_to_full in0 0 data_length requested
            (sublist 0 write_len_up input_contents ++
             sublist write_len_up data_length input_contents)
            (sublist data_length requested input_contents)).
        { dump_pre_spatial. lia. }
        assert (Hinputprefix :
          sublist 0 write_len_up input_contents ++
          sublist write_len_up data_length input_contents =
          sublist 0 data_length input_contents).
        { rewrite <- (sublist_split 0 data_length write_len_up input_contents)
            by lia; reflexivity. }
        assert (Hinputsplit :
          (sublist 0 write_len_up input_contents ++
           sublist write_len_up data_length input_contents) ++
          sublist data_length requested input_contents = input_contents).
        {
          rewrite Hinputprefix.
          rewrite <- (sublist_split 0 requested data_length input_contents)
            by lia.
          apply sublist_self. symmetry. exact PreH7.
        }
        rewrite Hinputsplit.
        simpl.
        replace (in0 + 0) with in0 by lia.
        replace (requested - 0) with requested by lia.
        prop_apply (circular_area_uchar_full_forall__write_returns
          in0 requested input_contents).
        Intros. rename H into Hinputbytes.
        assert (Hphysicalwrite : CircularAreaPhysicalWrite
          physical input_contents
          ((CircularAreaSomeBytes
              (sublist write_len_up data_length input_contents) ++
            sublist write_len_down writeidx physical) ++
           CircularAreaSomeBytes (sublist 0 write_len_up input_contents))
          area_length writeidx data_length).
        {
          rewrite <- app_assoc.
          apply circular_area_physical_write_wrap__write_returns; lia.
        }
        assert (Hlogicalafter : CircularAreaLogicalState readidx
          write_len_down area_length 1
          (logical ++ sublist 0 data_length input_contents)
          ((CircularAreaSomeBytes
              (sublist write_len_up data_length input_contents) ++
            sublist write_len_down writeidx physical) ++
           CircularAreaSomeBytes (sublist 0 write_len_up input_contents))).
        {
          assert (Hlogicalmod : CircularAreaLogicalState readidx
            ((writeidx + data_length) mod area_length) area_length 1
            (logical ++ sublist 0 data_length input_contents)
            ((CircularAreaSomeBytes
                (sublist write_len_up data_length input_contents) ++
              sublist write_len_down writeidx physical) ++
             CircularAreaSomeBytes (sublist 0 write_len_up input_contents))).
          {
            eapply circular_area_logical_state_after_write__write_returns;
              [exact Hstate | exact Hphysicalwrite | exact Hinputbytes |
               exact Hactualpos | exact Hfree].
          }
          rewrite <- Hmod in Hlogicalmod.
          exact Hlogicalmod.
        }
        entailer!.
        simpl.
        replace (in0 + 0) with in0 by lia.
        replace (requested - 0) with requested by lia.
        replace (data_buffer + 0) with data_buffer by lia.
        replace (area_length - 0) with area_length by lia.
        cancel.
        all: try exact (proj1 (proj2 Hphysicalwrite)).
        all: try exact Hlogicalafter.
        unfold CircularAreaWriteSuccess.
        split; [unfold CircularAreaActualWriteLength; exact Hactual |].
        split; [lia |].
        split; [reflexivity |].
        split; [exact Hmod |].
        exact Hphysicalwrite.
Qed.

Lemma proof_of_CircularAreaWrite_return_wit_4 : CircularAreaWrite_return_wit_4.
Proof.
  aggressive_pre_process.
  Left.
  pose proof PreH13 as Hstate.
  unfold CircularAreaLogicalState in PreH13.
  destruct PreH13 as
    [Harea [Hread [Hwrite [Hlogical [Hphysical
    [Hbytes [Hindex [Hstatus [Hfull [Hempty Hlive]]]]]]]]]].
  unfold CircularAreaWriteLengthReady, CircularAreaActualWriteLength in PreH6.
  destruct PreH6 as [Hactual Hpositive].
  unfold CircularAreaDivideWrDataResult in PreH12.
  destruct PreH12 as [[Hdivide Hret] | [Hdivide Hret]]; try lia.
  assert (Hactualpos : 0 < data_length) by (apply Hpositive; exact PreH14).
  assert (Hfree : data_length <= area_length - Zlength logical).
  { rewrite Hactual. apply Z.le_min_r. }
  Exists data_length ((writeidx + data_length) mod area_length)
    (logical ++ sublist 0 data_length input_contents)
    ((sublist 0 writeidx physical ++
      CircularAreaSomeBytes (sublist 0 data_length input_contents)) ++
     sublist (writeidx + data_length) area_length physical).
  unfold CircularAreaBackingResource.
  assert (Hmodrange :
    0 <= (writeidx + data_length) mod area_length < area_length).
  { apply Z.mod_pos_bound. lia. }
  assert (Hbits :
    unsigned_last_nbits ((writeidx + data_length) mod area_length) 8 =
    (writeidx + data_length) mod area_length).
  { apply unsigned_last_nbits_eq.
    change (0 <= (writeidx + data_length) mod area_length < 256). lia. }
  assert (Hremmod : Z.rem (writeidx + data_length) area_length =
    (writeidx + data_length) mod area_length).
  { apply Z.rem_mod_nonneg; lia. }
  rewrite Hremmod, Hbits.
  sep_apply_l_atomic
    (UCharArray.mixed_seg_merge_to_mixed_seg data_buffer 0 writeidx
      (writeidx + data_length) (sublist 0 writeidx physical)
      (CircularAreaSomeBytes (sublist 0 data_length input_contents))).
  - dump_pre_spatial. lia.
  - sep_apply_l_atomic
      (UCharArray.mixed_seg_merge_to_mixed_full data_buffer 0
        (writeidx + data_length) area_length
        (sublist 0 writeidx physical ++
         CircularAreaSomeBytes (sublist 0 data_length input_contents))
        (sublist (writeidx + data_length) area_length physical)).
    + dump_pre_spatial. lia.
    + sep_apply_l_atomic
        (UCharArray.seg_merge_to_full in0 0 data_length requested
          (sublist 0 data_length input_contents)
          (sublist data_length requested input_contents)).
      * dump_pre_spatial. lia.
      * assert (Hinputsplit :
          sublist 0 data_length input_contents ++
          sublist data_length requested input_contents = input_contents).
        {
          rewrite <- (sublist_split 0 requested data_length input_contents)
            by lia.
          apply sublist_self. symmetry. exact PreH7.
        }
        rewrite Hinputsplit.
        simpl.
        replace (in0 + 0) with in0 by lia.
        replace (requested - 0) with requested by lia.
        prop_apply (circular_area_uchar_full_forall__write_returns
          in0 requested input_contents).
        Intros.
        rename H into Hinputbytes.
        assert (Hphysicalwrite : CircularAreaPhysicalWrite
          physical input_contents
          ((sublist 0 writeidx physical ++
           CircularAreaSomeBytes (sublist 0 data_length input_contents)) ++
           sublist (writeidx + data_length) area_length physical)
          area_length writeidx data_length).
        {
          rewrite <- app_assoc.
          apply circular_area_physical_write_nowrap__write_returns; lia.
        }
        assert (Hlogicalafter : CircularAreaLogicalState readidx
          ((writeidx + data_length) mod area_length) area_length 1
          (logical ++ sublist 0 data_length input_contents)
          ((sublist 0 writeidx physical ++
            CircularAreaSomeBytes (sublist 0 data_length input_contents)) ++
           sublist (writeidx + data_length) area_length physical)).
        {
          eapply circular_area_logical_state_after_write__write_returns;
            eauto.
        }
        entailer!.
        simpl.
        replace (in0 + 0) with in0 by lia.
        replace (requested - 0) with requested by lia.
        replace (data_buffer + 0) with data_buffer by lia.
        replace (area_length - 0) with area_length by lia.
        cancel.
        all: try exact (proj1 (proj2 Hphysicalwrite)).
        all: try exact Hlogicalafter.
        unfold CircularAreaWriteSuccess.
        split; [unfold CircularAreaActualWriteLength; exact Hactual |].
        split; [lia |].
        split; [reflexivity |].
        split; [reflexivity |].
        exact Hphysicalwrite.
Qed.

Lemma proof_of_CircularAreaWrite_return_wit_5 : CircularAreaWrite_return_wit_5.
Proof.
  pre_process.
  unfold CircularAreaBackingResource.
  entailer!.
  unfold CircularAreaFullResult in PreH5.
  destruct (Z.eq_dec (Zlength logical) area_length); try lia; auto.
Qed.

Lemma proof_of_CircularAreaWrite_return_wit_6 : CircularAreaWrite_return_wit_6.
Proof.
  pre_process.
  Left.
  unfold CircularAreaErrorResult.
  entailer!.
Qed.

Lemma proof_of_CircularAreaWrite_return_wit_7 : CircularAreaWrite_return_wit_7.
Proof.
  pre_process.
Qed.

Lemma proof_of_CircularAreaWrite_return_wit_8 : CircularAreaWrite_return_wit_8.
Proof.
  pre_process.
Qed.

Lemma proof_of_CircularAreaWrite_partial_solve_wit_3_pure : CircularAreaWrite_partial_solve_wit_3_pure.
Proof.
  pre_process.
  unfold CircularAreaDataLengthResult in PreH4.
  subst retval.
  unfold CircularAreaLogicalState in PreH5.
  destruct PreH5 as [Harea [Hread [Hwrite [Hlen Hstate]]]].
  rewrite unsigned_last_nbits_eq in * by lia.
  entailer!.
Qed.

Lemma proof_of_CircularAreaWrite_partial_solve_wit_4_pure : CircularAreaWrite_partial_solve_wit_4_pure.
Proof.
  pre_process.
  unfold CircularAreaDataLengthResult in PreH4.
  subst retval.
  unfold CircularAreaLogicalState in PreH5.
  destruct PreH5 as [Harea [Hread [Hwrite [Hlen Hstate]]]].
  rewrite unsigned_last_nbits_eq in * by lia.
  entailer!.
Qed.

Lemma proof_of_CircularAreaWrite_partial_solve_wit_5_pure : CircularAreaWrite_partial_solve_wit_5_pure.
Proof.
  aggressive_pre_process.
  all: unfold CircularAreaLogicalState in PreH29.
  all: destruct PreH29 as [Harea [Hread [Hwrite [Hlogical [Hphysical Hrest]]]]].
  all: dump_pre_spatial.
  all: rewrite Zlength_sublist by lia.
  all: lia.
Qed.

Lemma proof_of_CircularAreaWrite_partial_solve_wit_6_pure : CircularAreaWrite_partial_solve_wit_6_pure.
Proof.
  aggressive_pre_process.
  all: unfold CircularAreaLogicalState in PreH26.
  all: destruct PreH26 as [Harea [Hread [Hwrite [Hlogical [Hphysical Hrest]]]]].
  all: unfold CircularAreaWriteLengthReady, CircularAreaActualWriteLength in PreH19.
  all: destruct PreH19 as [Hactual Hpositive].
  all: pose proof (Z.le_min_l requested (area_length - Zlength logical)) as Hmin_requested.
  all: rewrite <- Hactual in Hmin_requested.
  all: dump_pre_spatial.
  all: rewrite Zlength_sublist by lia.
  all: lia.
Qed.

Lemma proof_of_CircularAreaWrite_partial_solve_wit_7_pure : CircularAreaWrite_partial_solve_wit_7_pure.
Proof.
  aggressive_pre_process.
  all: unfold CircularAreaLogicalState in PreH22.
  all: destruct PreH22 as [Harea [Hread [Hwrite [Hlogical [Hphysical Hrest]]]]].
  all: dump_pre_spatial.
  all: rewrite Zlength_sublist by lia.
  all: lia.
Qed.
