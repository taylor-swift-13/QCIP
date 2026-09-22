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
  Exists operations_2 readidx_2 writeidx_2 b_status_2 physical_2 data_buffer_2.
  entailer!.
  unfold CircularAreaStateFullResult.
  unfold CircularAreaLogicalState in PreH5.
  destruct PreH5 as
    [Hcap [Hread [Hwrite [Hlen [Hphysical [Hbytes
    [Hindex [Hstatus [Hfull [Hempty Hlive]]]]]]]]]].
  destruct (Z.eq_dec (Zlength (ca_contents state)) (ca_capacity state))
    as [Heq | Hneq].
  - exfalso. apply PreH1. apply (proj2 Hfull). exact Heq.
  - reflexivity.
Qed.

Lemma proof_of_CircularAreaIsFull_return_wit_2 : CircularAreaIsFull_return_wit_2.
Proof.
  pre_process.
  Exists operations_2 readidx_2 writeidx_2 b_status_2 physical_2 data_buffer_2.
  entailer!.
  unfold CircularAreaStateFullResult.
  unfold CircularAreaLogicalState in PreH6.
  destruct PreH6 as
    [Hcap [Hread [Hwrite [Hlen [Hphysical [Hbytes
    [Hindex [Hstatus [Hfull [Hempty Hlive]]]]]]]]]].
  destruct (Z.eq_dec (Zlength (ca_contents state)) (ca_capacity state))
    as [Heq | Hneq].
  - exfalso.
    pose proof (proj2 Hfull Heq) as [_ Hb].
    lia.
  - reflexivity.
Qed.

Lemma proof_of_CircularAreaIsFull_return_wit_3 : CircularAreaIsFull_return_wit_3.
Proof.
  pre_process.
  Exists operations_2 readidx_2 writeidx_2 b_status_2 physical_2 data_buffer_2.
  entailer!.
  unfold CircularAreaStateFullResult.
  unfold CircularAreaLogicalState in PreH6.
  destruct PreH6 as
    [Hcap [Hread [Hwrite [Hlen [Hphysical [Hbytes
    [Hindex [Hstatus [Hfull [Hempty Hlive]]]]]]]]]].
  destruct (Z.eq_dec (Zlength (ca_contents state)) (ca_capacity state))
    as [Heq | Hneq].
  - reflexivity.
  - exfalso. apply Hneq. apply Hfull. split; [exact PreH2 |].
    destruct Hstatus as [Hzero | Hone]; [contradiction | exact Hone].
Qed.

Lemma proof_of_CircularAreaGetDataLength_safety_wit_4 : CircularAreaGetDataLength_safety_wit_4.
Proof.
  pre_process.
  entailer!.
  all: unfold CircularAreaLogicalState in PreH4;
       intuition lia.
Qed.

Lemma proof_of_CircularAreaGetDataLength_safety_wit_5 : CircularAreaGetDataLength_safety_wit_5.
Proof.
  pre_process.
  entailer!.
  all: unfold CircularAreaLogicalState in PreH4;
       intuition lia.
Qed.

Lemma proof_of_CircularAreaGetDataLength_entail_wit_1 : CircularAreaGetDataLength_entail_wit_1.
Proof.
  pre_process.
  Exists operations_2 readidx_3 writeidx_3 b_status_3 physical_3 data_buffer_3.
  entailer!.
  unfold CircularAreaStateFullResult in PreH3.
  destruct (Z.eq_dec (Zlength (ca_contents state)) (ca_capacity state))
    as [Heq | Hneq]; [exact Heq | lia].
Qed.

Lemma proof_of_CircularAreaGetDataLength_entail_wit_2 : CircularAreaGetDataLength_entail_wit_2.
Proof.
  pre_process.
  Exists operations_2 readidx_3 writeidx_3 b_status_3 physical_3 data_buffer_3.
  entailer!.
  unfold CircularAreaStateFullResult in PreH3.
  unfold CircularAreaLogicalState in PreH4.
  destruct PreH4 as
    [Hcap [Hread [Hwrite [Hlen [Hphysical [Hbytes
    [Hindex [Hstatus [Hfull [Hempty Hlive]]]]]]]]]].
  destruct (Z.eq_dec (Zlength (ca_contents state)) (ca_capacity state))
    as [Heq | Hneq]; [lia | lia].
Qed.

Lemma proof_of_CircularAreaGetDataLength_return_wit_1 : CircularAreaGetDataLength_return_wit_1.
Proof.
  pre_process.
  Exists operations_2 readidx_2 writeidx_2 b_status_2 physical_2 data_buffer_2.
  entailer!.
  unfold CircularAreaStateDataLengthResult.
  unfold CircularAreaLogicalState in PreH4.
  destruct PreH4 as
    [Hcap [Hread [Hwrite [Hlen [Hphysical [Hbytes
    [Hindex [Hstatus [Hfull [Hempty Hlive]]]]]]]]]].
  eapply circular_area_query_length__state_queries; eauto; lia.
Qed.

Lemma proof_of_CircularAreaGetDataLength_return_wit_2 : CircularAreaGetDataLength_return_wit_2.
Proof.
  pre_process.
  Exists operations_2 readidx_2 writeidx_2 b_status_2 physical_2 data_buffer_2.
  entailer!.
  unfold CircularAreaStateDataLengthResult.
  exact (eq_sym PreH3).
Qed.

Lemma proof_of_CircularAreaDivideWrData_entail_wit_1 : CircularAreaDivideWrData_entail_wit_1.
Proof.
  pre_process.
  subst data_length_pre.
  Exists operations_2 readidx_2 b_status_2 physical_2 writeidx_2 data_buffer_2.
  unfold CircularAreaLogicalState in PreH6.
  entailer!.
Qed.

Lemma proof_of_CircularAreaDivideWrData_return_wit_1 : CircularAreaDivideWrData_return_wit_1.
Proof.
  pre_process.
  Exists operations_2 readidx_2 b_status_2 physical_2 writeidx_2 data_buffer_2.
  unfold CircularAreaLogicalState in PreH8.
  unfold CircularAreaStateDivideWrDataResult, CircularAreaValid,
    CircularAreaDivideWrDataResult.
  unfold unsigned_last_nbits in PreH1.
  rewrite (Z.mod_small writeidx_2 (2 ^ 32)) in PreH1 by lia.
  rewrite Z.mod_small in PreH1 by lia.
  entailer!.
Qed.

Lemma proof_of_CircularAreaDivideWrData_return_wit_2 : CircularAreaDivideWrData_return_wit_2.
Proof.
  pre_process.
  Exists operations_2 readidx_2 b_status_2 physical_2 writeidx_2 data_buffer_2.
  unfold CircularAreaLogicalState in PreH8.
  unfold CircularAreaStateDivideWrDataResult, CircularAreaValid,
    CircularAreaDivideWrDataResult.
  unfold unsigned_last_nbits in PreH1.
  rewrite (Z.mod_small writeidx_2 (2 ^ 32)) in PreH1 by lia.
  rewrite Z.mod_small in PreH1 by lia.
  entailer!.
Qed.

Lemma proof_of_CircularAreaWrite_entail_wit_2 : CircularAreaWrite_entail_wit_2.
Proof.
  aggressive_pre_process.
  unfold store_circular_area.
  Intros data_buffer operations readidx writeidx b_status physical.
  Exists operations readidx writeidx b_status physical data_buffer.
  entailer!.
Qed.

Lemma proof_of_CircularAreaWrite_entail_wit_4_1 : CircularAreaWrite_entail_wit_4_1.
Proof.
  aggressive_pre_process.
  all: unfold CircularAreaStateDivideWrDataResult in PreH3.
  all: unfold CircularAreaStateDataLengthResult in PreH9.
  all: unfold CircularAreaStateFullResult in PreH15.
  all: unfold CircularAreaLogicalState in PreH10.
  all: destruct PreH3 as [Hvalid [Hactual_bounds Hretval2]].
  all: destruct Hvalid as [Hcapacity [Hlength Hbytes]].
  all: destruct PreH10 as [Hcapacity' [Hread [Hwrite [Hlength' Hrest]]]].
  all: subst retval.
  all: destruct (Z.eq_dec (Zlength (ca_contents state)) (ca_capacity state))
    as [Hfull | Hnotfull]; [simpl in PreH15; discriminate | simpl in PreH15].
  all: rewrite unsigned_last_nbits_eq in * by lia.
  all: destruct Hretval2 as [Hretval2 | Hretval2]; [contradiction | subst retval_2].
  all: unfold CircularAreaDivideWrDataResult in PreH4.
  all: simpl in PreH4.
  - unfold CircularAreaDivideWrDataResult. right. tauto.
  - unfold CircularAreaStateDivideWrDataResult.
    repeat split; try assumption; try lia.
  - lia.
  - unfold CircularAreaActualWriteLength.
    rewrite Z.min_r by lia. reflexivity.
Qed.

Lemma proof_of_CircularAreaWrite_entail_wit_4_2 : CircularAreaWrite_entail_wit_4_2.
Proof.
  aggressive_pre_process.
  all: unfold CircularAreaStateDivideWrDataResult in PreH3.
  all: destruct PreH3 as [Hvalid [Hactual_bounds Hretval2]].
  all: destruct Hretval2 as [Hretval2 | Hretval2]; [contradiction | subst retval_2].
  - unfold CircularAreaDivideWrDataResult in PreH4 |- *.
    simpl in PreH4. right. tauto.
  - unfold CircularAreaStateDivideWrDataResult.
    split; [exact Hvalid |].
    split; [exact Hactual_bounds |].
    right. reflexivity.
  - unfold CircularAreaActualWriteLength.
    rewrite Z.min_l by lia. reflexivity.
Qed.

Lemma proof_of_CircularAreaWrite_entail_wit_5 : CircularAreaWrite_entail_wit_5.
Proof.
  aggressive_pre_process.
  pose proof PreH13 as Hstate.
  unfold CircularAreaLogicalState in Hstate.
  destruct Hstate as [Hcap [Hread [Hwrite [Hlogical Hstate_rest]]]].
  pose proof PreH7 as Hactual.
  unfold CircularAreaActualWriteLength in Hactual.
  pose proof (Z.le_min_r requested
    (ca_capacity state - Zlength (ca_contents state))) as Hdatafree.
  rewrite <- Hactual in Hdatafree.
  pose proof PreH12 as Hdivide.
  unfold CircularAreaDivideWrDataResult in Hdivide.
  destruct Hdivide as [[Hnowrap Honezero] | [Hwrap Hone]].
  - lia.
  - assert (Huw : unsigned_last_nbits writeidx 32 = writeidx).
    { apply unsigned_last_nbits_eq. lia. }
    assert (Hub : unsigned_last_nbits (ca_capacity state - writeidx) 32 =
                  ca_capacity state - writeidx).
    { apply unsigned_last_nbits_eq. lia. }
    assert (Hud : unsigned_last_nbits
      (data_length - (ca_capacity state - writeidx)) 32 =
      data_length - (ca_capacity state - writeidx)).
    { apply unsigned_last_nbits_eq. lia. }
    sep_apply_l_atomic
      (UCharArray.mixed_full_split_to_mixed_seg
        data_buffer_2 writeidx (ca_capacity state) physical_2).
    + dump_pre_spatial. lia.
    + sep_apply_l_atomic
        (UCharArray.full_split_to_seg
          in0 (ca_capacity state - writeidx) requested input_contents).
      * dump_pre_spatial. lia.
      * Exists physical_2.
        split_pure_spatial.
        -- rewrite Huw, Hub.
           cancel (UCharArray.mixed_seg data_buffer_2 0 writeidx
             (sublist 0 writeidx physical_2)).
           cancel (UCharArray.mixed_seg data_buffer_2 writeidx
             (ca_capacity state)
             (sublist writeidx (ca_capacity state) physical_2)).
           cancel (UCharArray.seg in0 0 (ca_capacity state - writeidx)
             (sublist 0 (ca_capacity state - writeidx) input_contents)).
           cancel (UCharArray.seg in0 (ca_capacity state - writeidx) requested
             (sublist (ca_capacity state - writeidx) requested input_contents)).
           cancel (GlobalStrings LitMap).
        -- rewrite Huw, Hub, Hud.
           split_pures; dump_pre_spatial; try lia; assumption.
Qed.

Lemma proof_of_CircularAreaWrite_entail_wit_6 : CircularAreaWrite_entail_wit_6.
Proof.
  aggressive_pre_process.
  pose proof PreH19 as Hstate.
  unfold CircularAreaLogicalState in Hstate.
  destruct Hstate as [Hcap [Hread [Hwrite [Hlogical Hstate_rest]]]].
  pose proof PreH8 as Hactual.
  unfold CircularAreaActualWriteLength in Hactual.
  pose proof (Z.le_min_r requested
    (ca_capacity state - Zlength (ca_contents state))) as Hdatafree.
  rewrite <- Hactual in Hdatafree.
  pose proof PreH18 as Hdivide.
  unfold CircularAreaDivideWrDataResult in Hdivide.
  destruct Hdivide as [[Hnowrap Hzero] | [Hwrap Hone]].
  - lia.
  - sep_apply_l_atomic
      (UCharArray.mixed_seg_split_to_mixed_seg data_buffer_2 0
        write_len_down writeidx_2 (sublist 0 writeidx_2 physical_2)).
    + dump_pre_spatial. lia.
    + replace (write_len_down - 0) with write_len_down by lia.
      replace (writeidx_2 - 0) with writeidx_2 by lia.
      rewrite (Zsublist_Zsublist00 write_len_down writeidx_2 physical_2) by lia.
      rewrite (Zsublist_Zsublist0 writeidx_2 writeidx_2 write_len_down physical_2) by lia.
      Exists physical_2.
      split_pure_spatial.
      * cancel (UCharArray.mixed_seg data_buffer_2 0 write_len_down
          (sublist 0 write_len_down physical_2)).
        cancel (UCharArray.mixed_seg data_buffer_2 write_len_down writeidx_2
          (sublist write_len_down writeidx_2 physical_2)).
        cancel (GlobalStrings LitMap).
      * split_pures; dump_pre_spatial; try lia; try assumption.
        -- rewrite Zlength_sublist by lia. lia.
        -- apply sublist_split; lia.
Qed.

Lemma proof_of_CircularAreaWrite_entail_wit_7_1 : CircularAreaWrite_entail_wit_7_1.
Proof.
  aggressive_pre_process.
  pose proof PreH5 as Hstate.
  unfold CircularAreaLogicalState in Hstate.
  destruct Hstate as [Hcap [Hread [Hwrite [Hlogical Hstate_rest]]]].
  unfold CircularAreaStateDataLengthResult in PreH9.
  subst retval.
  pose proof PreH15 as Hnotfull.
  unfold CircularAreaStateFullResult in Hnotfull.
  destruct (Z.eq_dec (Zlength (ca_contents state)) (ca_capacity state))
    as [Heq | Hneq].
  - simpl in Hnotfull. lia.
  - simpl in Hnotfull.
    assert (Hu : unsigned_last_nbits
      (ca_capacity state - Zlength (ca_contents state)) 32 =
      ca_capacity state - Zlength (ca_contents state)).
    { apply unsigned_last_nbits_eq. lia. }
    rewrite Hu in *.
    subst retval_2.
    pose proof PreH4 as Hdivide.
    unfold CircularAreaDivideWrDataResult in Hdivide.
    destruct Hdivide as [[Hnowrap Hzero] | [Hwrap Hone]].
    + sep_apply_l_atomic
        (UCharArray.mixed_full_split_to_mixed_seg data_buffer_4 writeidx_4
          (ca_capacity state) physical_4).
      * dump_pre_spatial. lia.
      * sep_apply_l_atomic
          (UCharArray.mixed_seg_split_to_mixed_seg data_buffer_4 writeidx_4
            (writeidx_4 + (ca_capacity state - Zlength (ca_contents state)))
            (ca_capacity state)
            (sublist writeidx_4 (ca_capacity state) physical_4)).
        -- dump_pre_spatial. lia.
        -- sep_apply_l_atomic
            (UCharArray.full_split_to_seg in0
              (ca_capacity state - Zlength (ca_contents state))
              requested input_contents).
           ++ dump_pre_spatial. lia.
           ++ replace
                (writeidx_4 + (ca_capacity state - Zlength (ca_contents state)) -
                 writeidx_4)
                with (ca_capacity state - Zlength (ca_contents state)) by lia.
              rewrite (Zsublist_Zsublist
                (ca_capacity state - Zlength (ca_contents state))
                (ca_capacity state) 0 writeidx_4 physical_4) by lia.
              rewrite (Zsublist_Zsublist
                (ca_capacity state - writeidx_4)
                (ca_capacity state)
                (ca_capacity state - Zlength (ca_contents state))
                writeidx_4 physical_4) by lia.
              replace (0 + writeidx_4) with writeidx_4 by lia.
              replace
                (ca_capacity state - Zlength (ca_contents state) + writeidx_4)
                with
                (writeidx_4 + (ca_capacity state - Zlength (ca_contents state)))
                by lia.
              replace (ca_capacity state - writeidx_4 + writeidx_4)
                with (ca_capacity state) by lia.
              Exists physical_4.
              split_pure_spatial.
              ** cancel (UCharArray.mixed_seg data_buffer_4 0 writeidx_4
                   (sublist 0 writeidx_4 physical_4)).
                 cancel (UCharArray.mixed_seg data_buffer_4 writeidx_4
                   (writeidx_4 +
                    (ca_capacity state - Zlength (ca_contents state)))
                   (sublist writeidx_4
                    (writeidx_4 +
                     (ca_capacity state - Zlength (ca_contents state)))
                    physical_4)).
                 cancel (UCharArray.mixed_seg data_buffer_4
                   (writeidx_4 +
                    (ca_capacity state - Zlength (ca_contents state)))
                   (ca_capacity state)
                   (sublist
                    (writeidx_4 +
                     (ca_capacity state - Zlength (ca_contents state)))
                    (ca_capacity state) physical_4)).
                 cancel (UCharArray.seg in0 0
                   (ca_capacity state - Zlength (ca_contents state))
                   (sublist 0
                    (ca_capacity state - Zlength (ca_contents state))
                    input_contents)).
                 cancel (UCharArray.seg in0
                   (ca_capacity state - Zlength (ca_contents state)) requested
                   (sublist
                    (ca_capacity state - Zlength (ca_contents state))
                    requested input_contents)).
                 cancel (GlobalStrings LitMap).
              ** split_pures; dump_pre_spatial; try lia; try assumption.
                 unfold CircularAreaActualWriteLength.
                 rewrite Z.min_r; lia.
    + lia.
Qed.

Lemma proof_of_CircularAreaWrite_entail_wit_7_2 : CircularAreaWrite_entail_wit_7_2.
Proof.
  aggressive_pre_process.
  pose proof PreH5 as Hstate.
  unfold CircularAreaLogicalState in Hstate.
  destruct Hstate as [Hcap [Hread [Hwrite [Hlogical Hstate_rest]]]].
  unfold CircularAreaStateDataLengthResult in PreH9.
  subst retval.
  pose proof PreH15 as Hnotfull.
  unfold CircularAreaStateFullResult in Hnotfull.
  destruct (Z.eq_dec (Zlength (ca_contents state)) (ca_capacity state))
    as [Heq | Hneq].
  - simpl in Hnotfull. lia.
  - simpl in Hnotfull.
    assert (Hu : unsigned_last_nbits
      (ca_capacity state - Zlength (ca_contents state)) 32 =
      ca_capacity state - Zlength (ca_contents state)).
    { apply unsigned_last_nbits_eq. lia. }
    rewrite Hu in *.
    subst retval_2.
    pose proof PreH4 as Hdivide.
    unfold CircularAreaDivideWrDataResult in Hdivide.
    destruct Hdivide as [[Hnowrap Hzero] | [Hwrap Hone]].
    + sep_apply_l_atomic
        (UCharArray.mixed_full_split_to_mixed_seg data_buffer_4 writeidx_4
          (ca_capacity state) physical_4).
      * dump_pre_spatial. lia.
      * sep_apply_l_atomic
          (UCharArray.mixed_seg_split_to_mixed_seg data_buffer_4 writeidx_4
            (writeidx_4 + requested) (ca_capacity state)
            (sublist writeidx_4 (ca_capacity state) physical_4)).
        -- dump_pre_spatial. lia.
        -- sep_apply_l_atomic
            (UCharArray.full_to_seg in0 requested input_contents).
           replace (writeidx_4 + requested - writeidx_4)
             with requested by lia.
           rewrite (Zsublist_Zsublist requested (ca_capacity state)
             0 writeidx_4 physical_4) by lia.
           rewrite (Zsublist_Zsublist (ca_capacity state - writeidx_4)
             (ca_capacity state) requested writeidx_4 physical_4) by lia.
           replace (0 + writeidx_4) with writeidx_4 by lia.
           replace (requested + writeidx_4)
             with (writeidx_4 + requested) by lia.
           replace (ca_capacity state - writeidx_4 + writeidx_4)
             with (ca_capacity state) by lia.
           rewrite (sublist_self input_contents requested) by lia.
           Exists physical_4.
           split_pure_spatial.
           ++ cancel (UCharArray.mixed_seg data_buffer_4 0 writeidx_4
                (sublist 0 writeidx_4 physical_4)).
              cancel (UCharArray.mixed_seg data_buffer_4 writeidx_4
                (writeidx_4 + requested)
                (sublist writeidx_4 (writeidx_4 + requested) physical_4)).
              cancel (UCharArray.mixed_seg data_buffer_4
                (writeidx_4 + requested) (ca_capacity state)
                (sublist (writeidx_4 + requested) (ca_capacity state)
                  physical_4)).
              cancel (UCharArray.seg in0 0 requested input_contents).
              cancel (GlobalStrings LitMap).
           ++ split_pures; dump_pre_spatial; try lia; try assumption.
              all: first [apply Zsublist_nil; lia |
                          unfold CircularAreaActualWriteLength;
                          rewrite Z.min_l; lia].
    + lia.
Qed.

Lemma proof_of_CircularAreaWrite_return_wit_1 : CircularAreaWrite_return_wit_1.
Proof.
  pre_process.
  pose proof PreH16 as Hstate.
  unfold CircularAreaLogicalState in PreH16.
  destruct PreH16 as
    [Harea [Hread [Hwrite [Hlogical [Hphysical
    [Hlogicalbytes [Hindex [Hstatus [Hfull [Hempty Hlive]]]]]]]]]].
  unfold CircularAreaStateFullResult in PreH7.
  destruct (Z.eq_dec (Zlength (ca_contents state)) (ca_capacity state))
    as [Hlogfull | Hlognotfull].
  - simpl in PreH7. discriminate.
  - simpl in PreH7.
    unfold CircularAreaActualWriteLength in PreH8.
    unfold CircularAreaStateDivideWrDataResult in PreH14.
    destruct PreH14 as [Hvalid [Hactualbounds Hresultshape]].
    unfold CircularAreaDivideWrDataResult in PreH15.
    destruct PreH15 as [[Hnowrap Hz] | [Hwrap Hz]].
    { discriminate. }
    pose proof (proj1 Hactualbounds) as Hdata_nonneg.
    assert (Hdata_pos : 0 < data_length).
    { destruct (Z_lt_ge_dec 0 data_length) as [Hpos|Hnonpos];
        [exact Hpos|].
      pose proof (Z.ge_le _ _ Hnonpos) as Hdle.
      assert (Hsumle : writeidx + data_length <= writeidx + 0).
      { apply Z.add_le_mono_l. exact Hdle. }
      rewrite Z.add_0_r in Hsumle.
      pose proof (Z.lt_le_trans _ _ _ Hwrap Hsumle) as Hcapwrite.
      exfalso.
      exact (Z.lt_irrefl _
        (Z.lt_trans _ _ _ Hcapwrite (proj2 Hwrite))). }
    assert (Hdata_le_req : data_length <= requested).
    { rewrite PreH8. apply Z.le_min_l. }
    pose proof (proj2 Hactualbounds) as Hactualfree.
    assert (Hup_nonneg : 0 <= write_len_up).
    { rewrite PreH12. clear - Hwrite. psatz Z. }
    assert (Hup_le_data : write_len_up <= data_length).
    { rewrite PreH13 in PreH10. clear - PreH10. psatz Z. }
    assert (Hdata_le_area : data_length <= ca_capacity state).
    { eapply Z.le_trans; [exact Hactualfree|].
      apply (proj1 (Z.le_sub_nonneg (ca_capacity state)
                     (Zlength (ca_contents state)))).
      exact (proj1 Hlogical). }
    set (physical_after :=
      CircularAreaSomeBytes (sublist write_len_up data_length input_contents) ++
      sublist write_len_down writeidx physical ++
      CircularAreaSomeBytes (sublist 0 write_len_up input_contents)).
    assert (Hphysicalwrite : CircularAreaPhysicalWrite physical input_contents
      physical_after (ca_capacity state) writeidx data_length).
    { unfold physical_after.
      apply circular_area_physical_write_wrap__write_returns.
      - exact Hphysical.
      - rewrite PreH9. exact Hdata_le_req.
      - exact (proj1 Harea).
      - exact Hwrite.
      - exact PreH12.
      - exact PreH13.
      - split; assumption.
      - split; assumption. }
    sep_apply_l_atomic (UCharArray.mixed_seg_merge_to_mixed_seg
      data_buffer 0 write_len_down writeidx
      (CircularAreaSomeBytes (sublist write_len_up data_length input_contents))
      (sublist write_len_down writeidx physical)).
    + dump_pre_spatial. split; [exact PreH10|exact PreH11].
    + sep_apply_l_atomic (UCharArray.mixed_seg_merge_to_mixed_full
        data_buffer 0 writeidx (ca_capacity state)
        (CircularAreaSomeBytes
           (sublist write_len_up data_length input_contents) ++
         sublist write_len_down writeidx physical)
        (CircularAreaSomeBytes (sublist 0 write_len_up input_contents))).
      * dump_pre_spatial. split; [exact (proj1 Hwrite)|].
        apply Z.lt_le_incl. exact (proj2 Hwrite).
      * sep_apply_l_atomic (UCharArray.seg_merge_to_seg
          in0 0 write_len_up data_length
          (sublist 0 write_len_up input_contents)
          (sublist write_len_up data_length input_contents)).
        -- dump_pre_spatial. split; [exact Hup_nonneg|exact Hup_le_data].
        -- sep_apply_l_atomic (UCharArray.seg_merge_to_full
             in0 0 data_length requested
             (sublist 0 write_len_up input_contents ++
              sublist write_len_up data_length input_contents)
             (sublist data_length requested input_contents)).
           ++ dump_pre_spatial. split; [exact Hdata_nonneg|exact Hdata_le_req].
           ++ replace (in0 + 0 * sizeof(UCHAR)) with in0 by ring.
              replace (requested - 0) with requested by ring.
              assert (Hsplitup1 : 0 <= 0 <= write_len_up) by
                (split; [reflexivity|exact Hup_nonneg]).
              assert (Hsplitup2 : write_len_up <= data_length <=
                                  Zlength input_contents).
              { split; [exact Hup_le_data|rewrite PreH9; exact Hdata_le_req]. }
              rewrite <- (sublist_split 0 data_length write_len_up input_contents)
                by assumption.
              assert (Hsplitdata1 : 0 <= 0 <= data_length) by
                (split; [reflexivity|exact Hdata_nonneg]).
              assert (Hsplitdata2 : data_length <= requested <=
                                    Zlength input_contents).
              { split; [exact Hdata_le_req|rewrite PreH9; reflexivity]. }
              rewrite <- (sublist_split 0 requested data_length input_contents)
                by assumption.
              rewrite sublist_self by (symmetry; exact PreH9).
              prop_apply_p (circular_area_uchar_full_forall__write_returns
                in0 requested input_contents).
              Intros_p Hinputbytes.
              assert (Hnewstate : CircularAreaLogicalState readidx
                ((writeidx + data_length) mod ca_capacity state)
                (ca_capacity state) 1
                (ca_contents state ++ sublist 0 data_length input_contents)
                physical_after).
              { eapply circular_area_logical_state_after_write__write_returns.
                - exact Hstate.
                - exact Hphysicalwrite.
                - exact Hinputbytes.
                - exact Hdata_pos.
                - exact Hactualfree. }
              assert (Hnewidx :
                (writeidx + data_length) mod ca_capacity state = write_len_down).
              { symmetry.
                apply Z.mod_unique with (q := 1).
                - left. split; [exact PreH10|].
                  eapply Z.le_lt_trans; [exact PreH11|exact (proj2 Hwrite)].
                - rewrite PreH13, PreH12. ring. }
              assert (Hdownrange : 0 <= write_len_down < 2 ^ 8).
              { change (0 <= write_len_down < 256).
                split; [exact PreH10|].
                eapply Z.le_lt_trans; [exact PreH11|].
                eapply Z.lt_le_trans; [exact (proj2 Hwrite)|exact (proj2 Harea)]. }
              rewrite unsigned_last_nbits_eq by exact Hdownrange.
              Exists (Build_circular_area_state
                (ca_capacity state)
                (ca_contents state ++ sublist 0 data_length input_contents)).
              unfold store_circular_area.
              Exists data_buffer operations readidx write_len_down 1 physical_after.
              cbn [ca_capacity ca_contents].
              split_pure_spatial.
              { unfold physical_after.
                replace (data_buffer + 0 * sizeof(UCHAR)) with data_buffer by ring.
                replace (ca_capacity state - 0) with (ca_capacity state) by ring.
                rewrite app_assoc.
                entailer!. }
              { split_pures.
                { dump_pre_spatial. exact PreH2. }
                { dump_pre_spatial. exact PreH3. }
                { dump_pre_spatial.
                  unfold CircularAreaWriteResult.
                  right.
                  repeat split; try assumption; try reflexivity; try psatz Z.
                  rewrite <- PreH8. reflexivity. }
                { entailer!. rewrite <- Hnewidx. exact Hnewstate. } }
Qed.

Lemma proof_of_CircularAreaWrite_return_wit_2 : CircularAreaWrite_return_wit_2.
Proof.
  pre_process.
  pose proof PreH16 as Hstate.
  unfold CircularAreaLogicalState in PreH16.
  destruct PreH16 as
    [Harea [Hread [Hwrite [Hlogical [Hphysical
    [Hlogicalbytes [Hindex [Hstatus [Hfull [Hempty Hlive]]]]]]]]]].
  unfold CircularAreaStateFullResult in PreH7.
  destruct (Z.eq_dec (Zlength (ca_contents state)) (ca_capacity state))
    as [Hlogfull | Hlognotfull].
  - simpl in PreH7. discriminate.
  - simpl in PreH7.
    unfold CircularAreaActualWriteLength in PreH8.
    assert (Hdata_nonneg : 0 <= data_length) by
      (apply Z.lt_le_incl; exact PreH10).
    assert (Hactualfree : data_length <=
      ca_capacity state - Zlength (ca_contents state)).
    { rewrite PreH8. apply Z.le_min_r. }
    set (physical_after :=
      sublist 0 writeidx physical ++
      CircularAreaSomeBytes (sublist 0 data_length input_contents) ++
      sublist (writeidx + data_length) (ca_capacity state) physical).
    assert (Hphysicalwrite : CircularAreaPhysicalWrite physical input_contents
      physical_after (ca_capacity state) writeidx data_length).
    { unfold physical_after.
      apply circular_area_physical_write_nowrap__write_returns.
      - exact Hphysical.
      - rewrite PreH9. exact PreH11.
      - psatz Z.
      - exact PreH12.
      - psatz Z.
      - exact PreH13.
      - psatz Z. }
    sep_apply_l_atomic (UCharArray.mixed_seg_merge_to_mixed_seg
      data_buffer 0 writeidx (writeidx + data_length)
      (sublist 0 writeidx physical)
      (CircularAreaSomeBytes (sublist 0 data_length input_contents))).
    + dump_pre_spatial. clear - PreH12 Hdata_nonneg. psatz Z.
    + sep_apply_l_atomic (UCharArray.mixed_seg_merge_to_mixed_full
        data_buffer 0 (writeidx + data_length) (ca_capacity state)
        (sublist 0 writeidx physical ++
         CircularAreaSomeBytes (sublist 0 data_length input_contents))
        (sublist (writeidx + data_length) (ca_capacity state) physical)).
      * dump_pre_spatial. split.
        -- apply Z.add_nonneg_nonneg; assumption.
        -- exact PreH13.
      * sep_apply_l_atomic (UCharArray.seg_merge_to_full
          in0 0 data_length requested
          (sublist 0 data_length input_contents)
          (sublist data_length requested input_contents)).
        -- dump_pre_spatial. split; [exact Hdata_nonneg|exact PreH11].
        -- replace (in0 + 0 * sizeof(UCHAR)) with in0 by ring.
           replace (requested - 0) with requested by ring.
           assert (Hsplitlo : 0 <= 0 <= data_length) by
             (split; [reflexivity|exact Hdata_nonneg]).
           assert (Hsplithi : data_length <= requested <= Zlength input_contents).
           { split; [exact PreH11|rewrite PreH9; reflexivity]. }
           rewrite <- (sublist_split 0 requested data_length input_contents)
             by assumption.
           rewrite sublist_self by (symmetry; exact PreH9).
           prop_apply_p (circular_area_uchar_full_forall__write_returns
             in0 requested input_contents).
           Intros_p Hinputbytes.
           assert (Hnewstate : CircularAreaLogicalState readidx
             ((writeidx + data_length) mod ca_capacity state)
             (ca_capacity state) 1
             (ca_contents state ++ sublist 0 data_length input_contents)
             physical_after).
           { eapply circular_area_logical_state_after_write__write_returns;
               eauto. }
           assert (Hmodrange :
             0 <= (writeidx + data_length) mod ca_capacity state < 2 ^ 8).
           { pose proof (Z.mod_pos_bound (writeidx + data_length)
                          (ca_capacity state) (proj1 Harea)) as Hmod.
             change (0 <= (writeidx + data_length) mod ca_capacity state < 256).
             split; [exact (proj1 Hmod)|].
             eapply Z.lt_le_trans; [exact (proj2 Hmod)|exact (proj2 Harea)]. }
           rewrite Z.rem_mod_nonneg.
           2: { apply Z.add_nonneg_nonneg; assumption. }
           2: { exact (proj1 Harea). }
           rewrite unsigned_last_nbits_eq by exact Hmodrange.
           Exists (Build_circular_area_state
             (ca_capacity state)
             (ca_contents state ++ sublist 0 data_length input_contents)).
           unfold store_circular_area.
           Exists data_buffer operations readidx
             ((writeidx + data_length) mod ca_capacity state) 1 physical_after.
           cbn [ca_capacity ca_contents].
           split_pure_spatial.
           { unfold physical_after.
             replace (data_buffer + 0 * sizeof(UCHAR)) with data_buffer by ring.
             replace (ca_capacity state - 0) with (ca_capacity state) by ring.
             rewrite app_assoc.
             entailer!. }
           { split_pures.
             { dump_pre_spatial. exact PreH2. }
             { dump_pre_spatial. exact PreH3. }
             { dump_pre_spatial.
               unfold CircularAreaWriteResult.
               right.
               repeat split; try assumption; try reflexivity; try psatz Z.
               rewrite <- PreH8. reflexivity. }
             { entailer!. } }
Qed.

Lemma proof_of_CircularAreaWrite_return_wit_3 : CircularAreaWrite_return_wit_3.
Proof.
  pre_process.
  Exists state.
  unfold store_circular_area.
  Exists data_buffer_2 operations readidx_2 writeidx_2 b_status_2 physical_2.
  split_pure_spatial.
  - entailer!.
  - split_pures.
    + dump_pre_spatial. exact PreH3.
    + dump_pre_spatial. exact PreH8.
    + dump_pre_spatial.
      unfold CircularAreaStateFullResult in PreH5.
      destruct (Z.eq_dec (Zlength (ca_contents state)) (ca_capacity state))
        as [Hfull | Hnotfull].
      2: { simpl in PreH5. contradiction. }
      unfold CircularAreaWriteResult.
      left.
      repeat split; try reflexivity.
      right. exact Hfull.
    + entailer!.
Qed.

Lemma proof_of_CircularAreaWrite_return_wit_4 : CircularAreaWrite_return_wit_4.
Proof.
  pre_process.
  Exists state.
  split_pure_spatial.
  - entailer!.
  - split_pures.
    + dump_pre_spatial. exact PreH14.
    + dump_pre_spatial. exact PreH15.
    + dump_pre_spatial.
      unfold CircularAreaWriteResult.
      left.
      assert (data_length_pre = 0) by psatz Z.
      subst data_length_pre.
      subst requested.
      repeat split; try reflexivity; auto.
Qed.

Lemma proof_of_CircularAreaWrite_return_wit_5 : CircularAreaWrite_return_wit_5.
Proof.
  pre_process.
Qed.

Lemma proof_of_CircularAreaWrite_return_wit_6 : CircularAreaWrite_return_wit_6.
Proof.
  pre_process.
Qed.

Lemma proof_of_CircularAreaWrite_return_wit_7 : CircularAreaWrite_return_wit_7.
Proof.
  pre_process.
Qed.

Lemma proof_of_CircularAreaWrite_partial_solve_wit_3_pure : CircularAreaWrite_partial_solve_wit_3_pure.
Proof.
  aggressive_pre_process.
  unfold CircularAreaStateDataLengthResult in PreH12.
  unfold CircularAreaLogicalState in PreH13.
  destruct PreH13 as [Hcapacity [Hread [Hwrite [Hlength Hrest]]]].
  subst retval.
  rewrite unsigned_last_nbits_eq by lia.
  entailer!.
Qed.

Lemma proof_of_CircularAreaWrite_partial_solve_wit_4_pure : CircularAreaWrite_partial_solve_wit_4_pure.
Proof.
  aggressive_pre_process.
  unfold CircularAreaStateDataLengthResult in PreH14.
  unfold CircularAreaLogicalState in PreH15.
  destruct PreH15 as [Hcapacity [Hread [Hwrite [Hlength Hrest]]]].
  subst retval.
  rewrite unsigned_last_nbits_eq in PreH11 by lia.
  entailer!.
Qed.

Lemma proof_of_CircularAreaWrite_partial_solve_wit_5_pure : CircularAreaWrite_partial_solve_wit_5_pure.
Proof.
  aggressive_pre_process.
  split_pures.
  - prop_apply (UCharArray.mixed_seg_Zlength data_buffer writeidx
      (ca_capacity state) (sublist writeidx (ca_capacity state) physical)).
    Intros_p Htail. rewrite Htail. entailer!.
  - prop_apply (UCharArray.seg_Zlength in0 0 write_len_up
      (sublist 0 write_len_up input_contents)).
    Intros_p Hinput. rewrite Hinput. entailer!.
  - prop_apply (UCharArray.mixed_seg_Zlength data_buffer writeidx
      (ca_capacity state) (sublist writeidx (ca_capacity state) physical)).
    Intros_p Htail. rewrite Htail. entailer!.
Qed.

Lemma proof_of_CircularAreaWrite_partial_solve_wit_6_pure : CircularAreaWrite_partial_solve_wit_6_pure.
Proof.
  aggressive_pre_process.
  split_pures.
  - prop_apply (UCharArray.mixed_seg_Zlength data_buffer 0 write_len_down
      (sublist 0 write_len_down physical)).
    Intros_p Hdown. rewrite <- PreH26, Hdown. entailer!.
  - prop_apply (UCharArray.seg_Zlength in0 write_len_up data_length
      (sublist write_len_up data_length input_contents)).
    Intros_p Hinput. rewrite Hinput. entailer!.
  - prop_apply (UCharArray.mixed_seg_Zlength data_buffer 0 write_len_down
      (sublist 0 write_len_down physical)).
    Intros_p Hdown. rewrite <- PreH26, Hdown. entailer!.
Qed.

Lemma proof_of_CircularAreaWrite_partial_solve_wit_7_pure : CircularAreaWrite_partial_solve_wit_7_pure.
Proof.
  aggressive_pre_process.
  split_pures.
  - prop_apply (UCharArray.mixed_seg_Zlength data_buffer writeidx
      (writeidx + data_length)
      (sublist writeidx (writeidx + data_length) physical)).
    Intros_p Hphysical. rewrite Hphysical. entailer!.
  - prop_apply (UCharArray.seg_Zlength in0 0 data_length
      (sublist 0 data_length input_contents)).
    Intros_p Hinput. rewrite Hinput. entailer!.
Qed.
