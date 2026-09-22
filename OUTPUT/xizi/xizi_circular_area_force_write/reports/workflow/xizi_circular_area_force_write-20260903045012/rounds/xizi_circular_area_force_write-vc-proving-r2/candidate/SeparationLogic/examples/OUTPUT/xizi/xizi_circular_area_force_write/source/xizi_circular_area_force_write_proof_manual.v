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
  unfold CircularAreaStateFullResult.
  unfold CircularAreaLogicalState in PreH5.
  destruct PreH5 as (_ & _ & _ & Hlen & _ & _ & _ & _ & Hfull & _).
  destruct (Z.eq_dec (Zlength (ca_contents state)) (ca_capacity state)); lia.
Qed.

Lemma proof_of_CircularAreaIsFull_return_wit_2 : CircularAreaIsFull_return_wit_2.
Proof.
  aggressive_pre_process.
  unfold CircularAreaStateFullResult.
  unfold CircularAreaLogicalState in PreH6.
  destruct PreH6 as (Hcap & _ & _ & Hlen & _ & _ & _ & _ & _ & Hempty & _).
  destruct (Z.eq_dec (Zlength (ca_contents state)) (ca_capacity state))
    as [Hlenfull | Hnotfull].
  - exfalso.
    assert (Zlength (ca_contents state) = 0) as Hlenzero.
    { apply (proj1 Hempty). split; assumption. }
    lia.
  - reflexivity.
Qed.

Lemma proof_of_CircularAreaIsFull_return_wit_3 : CircularAreaIsFull_return_wit_3.
Proof.
  aggressive_pre_process.
  unfold CircularAreaStateFullResult.
  unfold CircularAreaLogicalState in PreH6.
  destruct PreH6 as (_ & _ & _ & _ & _ & _ & _ & Hb & Hfull & _).
  destruct (Z.eq_dec (Zlength (ca_contents state)) (ca_capacity state));
    try reflexivity.
  exfalso.
  apply n.
  apply (proj1 Hfull).
  split; [assumption|].
  destruct Hb; congruence.
Qed.

Lemma proof_of_CircularAreaGetDataLength_safety_wit_4 : CircularAreaGetDataLength_safety_wit_4.
Proof.
  aggressive_pre_process.
  unfold CircularAreaLogicalState in PreH4.
  destruct PreH4 as ((Hcap_pos & Hcap_max) & _).
  dump_pre_spatial.
  lia.
Qed.

Lemma proof_of_CircularAreaGetDataLength_safety_wit_5 : CircularAreaGetDataLength_safety_wit_5.
Proof.
  aggressive_pre_process.
  - unfold CircularAreaLogicalState in PreH4.
    destruct PreH4 as ((Hcap_pos & Hcap_max) & (Hread_lo & Hread_hi) &
                       (Hwrite_lo & Hwrite_hi) & _).
    dump_pre_spatial. lia.
  - unfold CircularAreaLogicalState in PreH4.
    destruct PreH4 as ((Hcap_pos & Hcap_max) & (Hread_lo & Hread_hi) &
                       (Hwrite_lo & Hwrite_hi) & _).
    dump_pre_spatial. lia.
Qed.

Lemma proof_of_CircularAreaGetDataLength_entail_wit_1 : CircularAreaGetDataLength_entail_wit_1.
Proof.
  aggressive_pre_process.
  unfold CircularAreaStateFullResult in PreH3.
  destruct (Z.eq_dec (Zlength (ca_contents state)) (ca_capacity state));
    lia.
Qed.

Lemma proof_of_CircularAreaGetDataLength_entail_wit_2 : CircularAreaGetDataLength_entail_wit_2.
Proof.
  aggressive_pre_process.
  unfold CircularAreaStateFullResult in PreH3.
  unfold CircularAreaLogicalState in PreH4.
  destruct PreH4 as (_ & _ & _ & Hlen & _).
  destruct (Z.eq_dec (Zlength (ca_contents state)) (ca_capacity state));
    lia.
Qed.

Lemma proof_of_CircularAreaGetDataLength_return_wit_1 : CircularAreaGetDataLength_return_wit_1.
Proof.
  aggressive_pre_process.
  unfold CircularAreaStateDataLengthResult.
  unfold CircularAreaLogicalState in PreH4.
  destruct PreH4 as (Hcap & Hread & Hwrite & Hlen & Hphysical & Hbytes &
                     Hindex & Hb & Hfull & Hempty & Hlive).
  destruct (Z_lt_ge_dec (readidx_2 + Zlength (ca_contents state))
                        (ca_capacity state)) as [Hnowrap | Hwrap].
  - rewrite Z.mod_small in Hindex by lia.
    subst writeidx_2.
    replace (readidx_2 + Zlength (ca_contents state) - readidx_2) with
      (Zlength (ca_contents state)) by lia.
    rewrite (unsigned_last_nbits_eq (Zlength (ca_contents state)) 32) by lia.
    rewrite (unsigned_last_nbits_eq
               (Zlength (ca_contents state) + ca_capacity state) 32) by lia.
    replace (Zlength (ca_contents state) + ca_capacity state) with
      (Zlength (ca_contents state) + 1 * ca_capacity state) by lia.
    rewrite Z.rem_add by lia.
    rewrite Z.rem_small by lia.
    reflexivity.
  - assert (Hsum : readidx_2 + Zlength (ca_contents state) <
                   2 * ca_capacity state) by lia.
    assert (Hmod : (readidx_2 + Zlength (ca_contents state)) mod
                   ca_capacity state =
                   readidx_2 + Zlength (ca_contents state) - ca_capacity state).
    { replace (readidx_2 + Zlength (ca_contents state)) with
        ((readidx_2 + Zlength (ca_contents state) - ca_capacity state) +
         1 * ca_capacity state) by lia.
      rewrite Z.mod_add by lia.
      rewrite Z.mod_small by lia.
      lia. }
    rewrite Hmod in Hindex.
    subst writeidx_2.
    replace (readidx_2 + Zlength (ca_contents state) - ca_capacity state -
             readidx_2) with
      (Zlength (ca_contents state) - ca_capacity state) by lia.
    assert (Hinner : unsigned_last_nbits
                       (Zlength (ca_contents state) - ca_capacity state) 32 =
                     Zlength (ca_contents state) - ca_capacity state + 4294967296).
    { unfold unsigned_last_nbits.
      replace (2 ^ 32) with 4294967296 by reflexivity.
      replace (Zlength (ca_contents state) - ca_capacity state) with
        ((Zlength (ca_contents state) - ca_capacity state + 4294967296) -
         4294967296) at 1 by lia.
      rewrite Zminus_mod by lia.
      rewrite Z.mod_same by lia.
      rewrite Z.sub_0_r.
      rewrite Z.mod_mod by lia.
      rewrite Z.mod_small by lia.
      reflexivity. }
    rewrite Hinner.
    unfold unsigned_last_nbits.
    replace (2 ^ 32) with 4294967296 by reflexivity.
    replace (Zlength (ca_contents state) - ca_capacity state + 4294967296 +
             ca_capacity state) with
      (Zlength (ca_contents state) + 1 * 4294967296) by lia.
    rewrite Z.mod_add by lia.
    rewrite Z.mod_small by lia.
    rewrite Z.rem_small by lia.
    reflexivity.
Qed.

Lemma proof_of_CircularAreaGetDataLength_return_wit_2 : CircularAreaGetDataLength_return_wit_2.
Proof.
  aggressive_pre_process.
  unfold CircularAreaStateDataLengthResult.
  lia.
Qed.

Lemma proof_of_CircularAreaDivideWrData_entail_wit_1 : CircularAreaDivideWrData_entail_wit_1.
Proof.
  aggressive_pre_process.
  unfold CircularAreaLogicalState in PreH6.
  destruct PreH6 as (Hcap & _ & Hwrite & Hlen & _).
  lia.
Qed.

Lemma proof_of_CircularAreaDivideWrData_return_wit_1 : CircularAreaDivideWrData_return_wit_1.
Proof.
  aggressive_pre_process.
  - unfold CircularAreaLogicalState in PreH8.
    destruct PreH8 as (Hcap & Hread & Hwrite & Hlen & Hphysical & Hbytes &
                       Hindex & Hb & Hfull & Hempty & Hlive).
    rewrite (unsigned_last_nbits_eq writeidx_2 32) in PreH1 by lia.
    rewrite (unsigned_last_nbits_eq (writeidx_2 + d0) 32) in PreH1 by lia.
    unfold CircularAreaDivideWrDataResult.
    right. split; lia.
  - unfold CircularAreaLogicalState in PreH8.
    destruct PreH8 as (Hcap & Hread & Hwrite & Hlen & Hphysical & Hbytes &
                       Hindex & Hb & Hfull & Hempty & Hlive).
    unfold CircularAreaStateDivideWrDataResult, CircularAreaValid.
    split.
    + exact (conj Hcap (conj Hlen Hbytes)).
    + split; [split; assumption|]. right. reflexivity.
Qed.

Lemma proof_of_CircularAreaDivideWrData_return_wit_2 : CircularAreaDivideWrData_return_wit_2.
Proof.
  aggressive_pre_process.
  - unfold CircularAreaLogicalState in PreH8.
    destruct PreH8 as (Hcap & Hread & Hwrite & Hlen & Hphysical & Hbytes &
                       Hindex & Hb & Hfull & Hempty & Hlive).
    rewrite (unsigned_last_nbits_eq writeidx_2 32) in PreH1 by lia.
    rewrite (unsigned_last_nbits_eq (writeidx_2 + d0) 32) in PreH1 by lia.
    unfold CircularAreaDivideWrDataResult.
    left. split; lia.
  - unfold CircularAreaLogicalState in PreH8.
    destruct PreH8 as (Hcap & Hread & Hwrite & Hlen & Hphysical & Hbytes &
                       Hindex & Hb & Hfull & Hempty & Hlive).
    unfold CircularAreaStateDivideWrDataResult, CircularAreaValid.
    split.
    + exact (conj Hcap (conj Hlen Hbytes)).
    + split; [split; assumption|]. left. reflexivity.
Qed.

Lemma proof_of_CircularAreaWrite_safety_wit_23 : CircularAreaWrite_safety_wit_23.
Proof.
  pre_process.
  unfold CircularAreaLogicalState in PreH15.
  entailer!.
Qed.

Lemma proof_of_CircularAreaWrite_entail_wit_2 : CircularAreaWrite_entail_wit_2.
Proof.
  pre_process.
  unfold store_circular_area.
  Intros data_buffer operations readidx writeidx b_status physical.
  subst circular_area_pre input_buffer_pre data_length_pre.
  Exists operations readidx writeidx b_status physical data_buffer.
  entailer!.
Qed.

Lemma proof_of_CircularAreaWrite_entail_wit_4_1 : CircularAreaWrite_entail_wit_4_1.
Proof.
  pre_process.
  pose proof PreH5 as Hstate.
  unfold CircularAreaLogicalState in Hstate.
  destruct Hstate as [Hcap [_ [Hwrite [Hcontents _]]]].
  unfold CircularAreaStateDataLengthResult in PreH9.
  assert (Hu : unsigned_last_nbits (ca_capacity state - retval) 32 =
               ca_capacity state - retval).
  { apply unsigned_last_nbits_eq. split; lia. }
  assert (Hactual : CircularAreaActualWriteLength
                      (ca_capacity state) requested (ca_contents state)
                      (unsigned_last_nbits (ca_capacity state - retval) 32)).
  { unfold CircularAreaActualWriteLength. rewrite Hu, PreH9.
    symmetry. apply Z.min_r. lia. }
  assert (Hstate_result : CircularAreaStateDivideWrDataResult state
                            (unsigned_last_nbits (ca_capacity state - retval) 32) 1).
  { unfold CircularAreaStateDivideWrDataResult in PreH3 |- *.
    destruct PreH3 as [Hv [Hb [Hz | Ho]]].
    - exfalso. apply PreH18. exact Hz.
    - split; [exact Hv|]. split; [exact Hb|]. right. reflexivity. }
  assert (Hdivide_result : CircularAreaDivideWrDataResult writeidx_4
                             (unsigned_last_nbits (ca_capacity state - retval) 32)
                             (ca_capacity state) 1).
  { unfold CircularAreaDivideWrDataResult in PreH4 |- *.
    destruct PreH4 as [[Hb Hz] | [Hb Ho]].
    - exfalso. apply PreH18. exact Hz.
    - right. split; [exact Hb|reflexivity]. }
  Exists operations_2 readidx_4 b_status_4 physical_4 writeidx_4 data_buffer_4.
  entailer!.
  unfold CircularAreaDivideWrDataResult in Hdivide_result.
  destruct Hdivide_result as [[_ Hbad] | [Hwrap _]]; lia.
Qed.

Lemma proof_of_CircularAreaWrite_entail_wit_4_2 : CircularAreaWrite_entail_wit_4_2.
Proof.
  pre_process.
  pose proof PreH5 as Hstate.
  unfold CircularAreaLogicalState in Hstate.
  destruct Hstate as [Hcap [_ [Hwrite [Hcontents _]]]].
  unfold CircularAreaStateDataLengthResult in PreH9.
  assert (Hu : unsigned_last_nbits (ca_capacity state - retval) 32 =
               ca_capacity state - retval).
  { apply unsigned_last_nbits_eq. split; lia. }
  assert (Hactual : CircularAreaActualWriteLength
                      (ca_capacity state) requested (ca_contents state) requested).
  { unfold CircularAreaActualWriteLength.
    symmetry. apply Z.min_l. rewrite <- PreH9, <- Hu. lia. }
  assert (Hstate_result : CircularAreaStateDivideWrDataResult state requested 1).
  { unfold CircularAreaStateDivideWrDataResult in PreH3 |- *.
    destruct PreH3 as [Hv [Hb [Hz | Ho]]].
    - exfalso. apply PreH18. exact Hz.
    - split; [exact Hv|]. split; [exact Hb|]. right. reflexivity. }
  assert (Hdivide_result : CircularAreaDivideWrDataResult writeidx_4 requested
                             (ca_capacity state) 1).
  { unfold CircularAreaDivideWrDataResult in PreH4 |- *.
    destruct PreH4 as [[Hb Hz] | [Hb Ho]].
    - exfalso. apply PreH18. exact Hz.
    - right. split; [exact Hb|reflexivity]. }
  Exists operations_2 readidx_4 b_status_4 physical_4 writeidx_4 data_buffer_4.
  entailer!.
Qed.

Lemma proof_of_CircularAreaWrite_entail_wit_5 : CircularAreaWrite_entail_wit_5.
Proof.
  pre_process.
  pose proof PreH12 as Hstate.
  unfold CircularAreaLogicalState in Hstate.
  destruct Hstate as [Hcap [_ [Hwrite [Hcontents _]]]].
  pose proof PreH10 as Hstate_divide.
  unfold CircularAreaStateDivideWrDataResult in Hstate_divide.
  destruct Hstate_divide as [_ [Hdata_bounds _]].
  pose proof PreH11 as Hdivide.
  unfold CircularAreaDivideWrDataResult in Hdivide.
  destruct Hdivide as [[_ Hbad] | [Hwrap _]]; [lia|].
  assert (Hwrite_cast : unsigned_last_nbits writeidx 32 = writeidx).
  { apply unsigned_last_nbits_eq. split; lia. }
  assert (Hup_cast :
    unsigned_last_nbits
      (ca_capacity state - unsigned_last_nbits writeidx 32) 32 =
    ca_capacity state - writeidx).
  { rewrite Hwrite_cast. apply unsigned_last_nbits_eq. split; lia. }
  assert (Hdown_cast :
    unsigned_last_nbits
      (data_length - unsigned_last_nbits
         (ca_capacity state - unsigned_last_nbits writeidx 32) 32) 32 =
    data_length - unsigned_last_nbits
      (ca_capacity state - unsigned_last_nbits writeidx 32) 32).
  { rewrite Hup_cast. apply unsigned_last_nbits_eq. split; lia. }
  sep_apply_l_atomic
    (UCharArray.mixed_full_split_to_mixed_seg
       data_buffer_2 writeidx (ca_capacity state) physical_2).
  - dump_pre_spatial. lia.
  - sep_apply_l_atomic
      (UCharArray.full_split_to_seg in0
         (unsigned_last_nbits
            (ca_capacity state - unsigned_last_nbits writeidx 32) 32)
         requested input_contents).
    + dump_pre_spatial. rewrite Hup_cast. split; lia.
    + Exists operations_2 readidx_2 b_status_2 physical_2 writeidx data_buffer_2.
      entailer!.
Qed.

Lemma proof_of_CircularAreaWrite_entail_wit_6 : CircularAreaWrite_entail_wit_6.
Proof.
  pre_process.
  pose proof PreH18 as Hstate.
  unfold CircularAreaLogicalState in Hstate.
  destruct Hstate as [Hcap [_ [Hwrite [Hcontents _]]]].
  pose proof PreH16 as Hstate_divide.
  unfold CircularAreaStateDivideWrDataResult in Hstate_divide.
  destruct Hstate_divide as [_ [Hdata_bounds _]].
  assert (Hdown_bounds : 0 <= write_len_down <= writeidx_2) by lia.
  sep_apply_l_atomic
    (UCharArray.mixed_seg_split_to_mixed_seg
       data_buffer_2 0 write_len_down writeidx_2
       (sublist 0 writeidx_2 physical_2)).
  - dump_pre_spatial. lia.
  - sep_apply_l_atomic
      (UCharArray.seg_split_to_seg
         in0 write_len_up data_length requested
         (sublist write_len_up requested input_contents)).
    + dump_pre_spatial. lia.
    + Exists operations_2 readidx_2 b_status_2 physical_2 writeidx_2 data_buffer_2.
      entailer!.
      rewrite !Zsublist_Zsublist by lia.
      replace (0 + write_len_up) with write_len_up by lia.
      replace (data_length - write_len_up + write_len_up) with data_length by lia.
      replace (requested - write_len_up + write_len_up) with requested by lia.
      replace (0 + 0) with 0 by lia.
      replace (write_len_down - 0 + 0) with write_len_down by lia.
      replace (writeidx_2 - 0 + 0) with writeidx_2 by lia.
      cancel.
Qed.

Lemma proof_of_CircularAreaWrite_entail_wit_7_1 : CircularAreaWrite_entail_wit_7_1.
Proof.
  pre_process.
  pose proof PreH5 as Hstate.
  unfold CircularAreaLogicalState in Hstate.
  destruct Hstate as [Hcap [_ [Hwrite [Hcontents _]]]].
  unfold CircularAreaStateDataLengthResult in PreH9.
  assert (Hu : unsigned_last_nbits (ca_capacity state - retval) 32 =
               ca_capacity state - retval).
  { apply unsigned_last_nbits_eq. split; lia. }
  assert (Hactual : CircularAreaActualWriteLength
                      (ca_capacity state) requested (ca_contents state)
                      (unsigned_last_nbits (ca_capacity state - retval) 32)).
  { unfold CircularAreaActualWriteLength. rewrite Hu, PreH9.
    symmetry. apply Z.min_r. lia. }
  assert (Hstate_result : CircularAreaStateDivideWrDataResult state
                            (unsigned_last_nbits (ca_capacity state - retval) 32) 0).
  { unfold CircularAreaStateDivideWrDataResult in PreH3 |- *.
    destruct PreH3 as [Hv [Hb [Hz | Ho]]].
    - split; [exact Hv|]. split; [exact Hb|]. left. reflexivity.
    - exfalso. lia. }
  assert (Hdivide_result : CircularAreaDivideWrDataResult writeidx_4
                             (unsigned_last_nbits (ca_capacity state - retval) 32)
                             (ca_capacity state) 0).
  { unfold CircularAreaDivideWrDataResult in PreH4 |- *.
    destruct PreH4 as [[Hb Hz] | [Hb Ho]].
    - left. split; [exact Hb|reflexivity].
    - exfalso. lia. }
  pose proof Hdivide_result as Hdivide_bounds.
  unfold CircularAreaDivideWrDataResult in Hdivide_bounds.
  destruct Hdivide_bounds as [[Hnowrap _] | [_ Hbad]]; [|lia].
  sep_apply_l_atomic
    (UCharArray.mixed_full_split_to_mixed_seg
       data_buffer_4 writeidx_4 (ca_capacity state) physical_4).
  - dump_pre_spatial. lia.
  - sep_apply_l_atomic
      (UCharArray.mixed_seg_split_to_mixed_seg
         data_buffer_4 writeidx_4
         (writeidx_4 + unsigned_last_nbits (ca_capacity state - retval) 32)
         (ca_capacity state) (sublist writeidx_4 (ca_capacity state) physical_4)).
    + dump_pre_spatial. split; lia.
    + sep_apply_l_atomic
        (UCharArray.full_split_to_seg in0
           (unsigned_last_nbits (ca_capacity state - retval) 32)
           requested input_contents).
      * dump_pre_spatial. split; [rewrite Hu; lia|lia].
      * Exists operations_2 readidx_4 b_status_4 physical_4 writeidx_4 data_buffer_4.
        entailer!.
        rewrite !Zsublist_Zsublist by lia.
        replace (0 + writeidx_4) with writeidx_4 by lia.
        replace
          (writeidx_4 + unsigned_last_nbits (ca_capacity state - retval) 32 -
             writeidx_4 + writeidx_4)
          with (writeidx_4 + unsigned_last_nbits (ca_capacity state - retval) 32)
          by lia.
        replace (ca_capacity state - writeidx_4 + writeidx_4)
          with (ca_capacity state) by lia.
        cancel.
Qed.

Lemma proof_of_CircularAreaWrite_entail_wit_7_2 : CircularAreaWrite_entail_wit_7_2.
Proof.
  pre_process.
  pose proof PreH5 as Hstate.
  unfold CircularAreaLogicalState in Hstate.
  destruct Hstate as [Hcap [_ [Hwrite [Hcontents _]]]].
  unfold CircularAreaStateDataLengthResult in PreH9.
  assert (Hu : unsigned_last_nbits (ca_capacity state - retval) 32 =
               ca_capacity state - retval).
  { apply unsigned_last_nbits_eq. split; lia. }
  assert (Hactual : CircularAreaActualWriteLength
                      (ca_capacity state) requested (ca_contents state) requested).
  { unfold CircularAreaActualWriteLength.
    symmetry. apply Z.min_l. rewrite <- PreH9, <- Hu. lia. }
  assert (Hstate_result : CircularAreaStateDivideWrDataResult state requested 0).
  { unfold CircularAreaStateDivideWrDataResult in PreH3 |- *.
    destruct PreH3 as [Hv [Hb [Hz | Ho]]].
    - split; [exact Hv|]. split; [exact Hb|]. left. reflexivity.
    - exfalso. lia. }
  assert (Hdivide_result : CircularAreaDivideWrDataResult writeidx_4 requested
                             (ca_capacity state) 0).
  { unfold CircularAreaDivideWrDataResult in PreH4 |- *.
    destruct PreH4 as [[Hb Hz] | [Hb Ho]].
    - left. split; [exact Hb|reflexivity].
    - exfalso. lia. }
  pose proof Hdivide_result as Hdivide_bounds.
  unfold CircularAreaDivideWrDataResult in Hdivide_bounds.
  destruct Hdivide_bounds as [[Hnowrap _] | [_ Hbad]]; [|lia].
  sep_apply_l_atomic
    (UCharArray.mixed_full_split_to_mixed_seg
       data_buffer_4 writeidx_4 (ca_capacity state) physical_4).
  - dump_pre_spatial. lia.
  - sep_apply_l_atomic
      (UCharArray.mixed_seg_split_to_mixed_seg
         data_buffer_4 writeidx_4 (writeidx_4 + requested)
         (ca_capacity state) (sublist writeidx_4 (ca_capacity state) physical_4)).
    + dump_pre_spatial. split; lia.
    + sep_apply_l_atomic
        (UCharArray.full_split_to_seg in0 requested requested input_contents).
      * dump_pre_spatial. split; lia.
      * Exists operations_2 readidx_4 b_status_4 physical_4 writeidx_4 data_buffer_4.
        entailer!.
        rewrite !Zsublist_Zsublist by lia.
        replace (0 + writeidx_4) with writeidx_4 by lia.
        replace (writeidx_4 + requested - writeidx_4 + writeidx_4)
          with (writeidx_4 + requested) by lia.
        replace (ca_capacity state - writeidx_4 + writeidx_4)
          with (ca_capacity state) by lia.
        cancel.
Qed.

Lemma proof_of_CircularAreaWrite_return_wit_1 : CircularAreaWrite_return_wit_1.
Proof.
  pre_process.
  pose proof PreH7 as Hactual_eq.
  unfold CircularAreaActualWriteLength in Hactual_eq.
  assert (Hdata_requested : data_length <= requested).
  { rewrite Hactual_eq. apply Z.le_min_l. }
  assert (Hwrap : ca_capacity state < writeidx + data_length).
  { unfold CircularAreaDivideWrDataResult in PreH14.
    destruct PreH14 as [[_ Hzero] | [Hwrap _]]; [lia|exact Hwrap]. }
  pose proof PreH15 as Hlogical_bounds.
  assert (Hwriteidx_bounds : 0 <= writeidx < ca_capacity state).
  { unfold CircularAreaLogicalState in Hlogical_bounds. tauto. }
  sep_apply_l_atomic
    (UCharArray.seg_merge_to_seg in0 0 write_len_up data_length
      (sublist 0 write_len_up input_contents)
      (sublist write_len_up data_length input_contents) ltac:(lia)).
  replace
    (sublist 0 write_len_up input_contents ++
     sublist write_len_up data_length input_contents)
    with (sublist 0 data_length input_contents) by
      (apply sublist_split; lia).
  sep_apply_l_atomic
    (UCharArray.seg_merge_to_seg in0 0 data_length requested
      (sublist 0 data_length input_contents)
      (sublist data_length requested input_contents) ltac:(lia)).
  replace
    (sublist 0 data_length input_contents ++
     sublist data_length requested input_contents)
    with input_contents by
      (rewrite <- sublist_split by lia;
       symmetry; apply sublist_self; lia).
  sep_apply_l_atomic
    (UCharArray.seg_to_full in0 0 requested input_contents).
  replace (in0 + 0 * sizeof(UCHAR)) with in0 by lia.
  replace (requested - 0) with requested by lia.
  prop_apply_p (uchar_full_forall_bytes__force_write_outcomes
    in0 requested input_contents).
  Intros_p Hbytes.
  set (physical_after :=
    CircularAreaSomeBytes (sublist write_len_up data_length input_contents) ++
    sublist write_len_down writeidx physical ++
    CircularAreaSomeBytes (sublist 0 write_len_up input_contents)).
  set (raw_after := Build_forced_circular_area_state
    (ca_capacity state) write_len_down physical_after).
  pose proof
    (force_success_wrap_package__force_write_outcomes
      state requested input_contents readidx writeidx b_status physical data_length
      write_len_up write_len_down PreH5 PreH8 Hbytes PreH7 PreH11 PreH12
      (conj PreH9 PreH10) Hwrap PreH15)
    as Hpackage.
  fold physical_after in Hpackage.
  fold raw_after in Hpackage.
  destruct Hpackage as [Hforce [Hcapacity [Hnewindex Hphysical_length]]].
  unfold raw_after in Hcapacity, Hnewindex, Hphysical_length.
  simpl in Hcapacity, Hnewindex, Hphysical_length.
  destruct Hcapacity as [Hcapacity_pos Hcapacity_max].
  destruct Hnewindex as [Hnewindex_nonneg Hnewindex_lt].
  unfold CircularAreaForceWriteOutcome.
  Right.
  Exists raw_after.
  unfold store_forced_circular_area.
  Exists data_buffer operations.
  split_pure_spatial.
  - unfold raw_after.
    simpl.
    rewrite unsigned_last_nbits_eq.
    2: {
      cbn.
      split; [exact Hnewindex_nonneg|].
      eapply Z.lt_le_trans; eauto.
    }
    sep_apply_l_atomic
      (UCharArray.mixed_seg_merge_to_mixed_seg data_buffer write_len_down
        writeidx (ca_capacity state)
        (sublist write_len_down writeidx physical)
        (CircularAreaSomeBytes (sublist 0 write_len_up input_contents))
        ltac:(lia)).
    sep_apply_l_atomic
      (UCharArray.mixed_seg_merge_to_mixed_full data_buffer 0 write_len_down
        (ca_capacity state)
        (CircularAreaSomeBytes (sublist write_len_up data_length input_contents))
        (sublist write_len_down writeidx physical ++
         CircularAreaSomeBytes (sublist 0 write_len_up input_contents))
        ltac:(lia)).
    replace (data_buffer + 0 * sizeof(UCHAR)) with data_buffer by lia.
    replace (ca_capacity state - 0) with (ca_capacity state) by lia.
    entailer!.
  - unfold raw_after in *.
    simpl in *.
    entailer!.
Qed.

Lemma proof_of_CircularAreaWrite_return_wit_2 : CircularAreaWrite_return_wit_2.
Proof.
  pre_process.
  sep_apply_l_atomic
    (UCharArray.seg_merge_to_seg in0 0 data_length requested
      (sublist 0 data_length input_contents)
      (sublist data_length requested input_contents) ltac:(lia)).
  replace
    (sublist 0 data_length input_contents ++
     sublist data_length requested input_contents)
    with input_contents by
      (rewrite <- sublist_split by lia;
       symmetry; apply sublist_self; lia).
  sep_apply_l_atomic
    (UCharArray.seg_to_full in0 0 requested input_contents).
  replace (in0 + 0 * sizeof(UCHAR)) with in0 by lia.
  replace (requested - 0) with requested by lia.
  prop_apply_p (uchar_full_forall_bytes__force_write_outcomes
    in0 requested input_contents).
  Intros_p Hbytes.
  set (physical_after :=
    sublist 0 writeidx physical ++
    CircularAreaSomeBytes (sublist 0 data_length input_contents) ++
    sublist (writeidx + data_length) (ca_capacity state) physical).
  set (raw_after := Build_forced_circular_area_state
    (ca_capacity state)
    ((writeidx + data_length) mod ca_capacity state)
    physical_after).
  pose proof
    (force_success_no_wrap_package__force_write_outcomes
      state requested input_contents readidx writeidx b_status physical data_length
      PreH5 PreH8 Hbytes PreH7 PreH9 PreH10 PreH12 PreH15)
    as Hpackage.
  fold physical_after in Hpackage.
  fold raw_after in Hpackage.
  destruct Hpackage as [Hforce [Hcapacity [Hnewindex Hphysical_length]]].
  unfold raw_after in Hcapacity, Hnewindex, Hphysical_length.
  simpl in Hcapacity, Hnewindex, Hphysical_length.
  destruct Hcapacity as [Hcapacity_pos Hcapacity_max].
  destruct Hnewindex as [Hnewindex_nonneg Hnewindex_lt].
  unfold CircularAreaForceWriteOutcome.
  Right.
  Exists raw_after.
  unfold store_forced_circular_area.
  Exists data_buffer operations.
  split_pure_spatial.
  - unfold raw_after.
    simpl.
    rewrite Z.rem_mod_nonneg by lia.
    rewrite unsigned_last_nbits_eq.
    2: {
      cbn.
      split; [exact Hnewindex_nonneg|].
      eapply Z.lt_le_trans; eauto.
    }
    sep_apply_l_atomic
      (UCharArray.mixed_seg_merge_to_mixed_seg data_buffer writeidx
        (writeidx + data_length) (ca_capacity state)
        (CircularAreaSomeBytes (sublist 0 data_length input_contents))
        (sublist (writeidx + data_length) (ca_capacity state) physical)
        ltac:(lia)).
    sep_apply_l_atomic
      (UCharArray.mixed_seg_merge_to_mixed_full data_buffer 0 writeidx
        (ca_capacity state) (sublist 0 writeidx physical)
        (CircularAreaSomeBytes (sublist 0 data_length input_contents) ++
         sublist (writeidx + data_length) (ca_capacity state) physical)
        ltac:(lia)).
    replace (data_buffer + 0 * sizeof(UCHAR)) with data_buffer by lia.
    replace (ca_capacity state - 0) with (ca_capacity state) by lia.
    entailer!.
  - unfold raw_after in *.
    simpl in *.
    entailer!.
Qed.

Lemma proof_of_CircularAreaWrite_return_wit_3 : CircularAreaWrite_return_wit_3.
Proof.
  pre_process.
  unfold CircularAreaForceWriteOutcome, CircularAreaErrorResult.
  Left.
  entailer!.
Qed.

Lemma proof_of_CircularAreaWrite_return_wit_4 : CircularAreaWrite_return_wit_4.
Proof.
  pre_process.
Qed.

Lemma proof_of_CircularAreaWrite_return_wit_5 : CircularAreaWrite_return_wit_5.
Proof.
  pre_process.
Qed.

Lemma proof_of_CircularAreaWrite_return_wit_6 : CircularAreaWrite_return_wit_6.
Proof.
  pre_process.
Qed.

Lemma proof_of_CircularAreaWrite_partial_solve_wit_3_pure : CircularAreaWrite_partial_solve_wit_3_pure.
Proof.
  pre_process.
  unfold CircularAreaStateDataLengthResult in PreH4.
  pose proof PreH5 as Hlogical.
  unfold CircularAreaLogicalState in Hlogical.
  destruct Hlogical as [Hcap [_ [_ [Hlen _]]]].
  assert (Hunsigned :
    ca_capacity state - Zlength (ca_contents state) =
    unsigned_last_nbits (ca_capacity state - retval) 32).
  { subst retval. apply UInt_unsigned_eq. split; [lia|].
    replace Int.max_unsigned with (2 ^ 32 - 1) by reflexivity. lia. }
  rewrite <- Hunsigned in PreH1.
  split_pures.
  all: dump_pre_spatial.
  all: try assumption; try reflexivity; lia.
Qed.

Lemma proof_of_CircularAreaWrite_partial_solve_wit_4_pure : CircularAreaWrite_partial_solve_wit_4_pure.
Proof.
  pre_process.
  unfold CircularAreaStateDataLengthResult in PreH4.
  pose proof PreH5 as Hlogical.
  unfold CircularAreaLogicalState in Hlogical.
  destruct Hlogical as [Hcap [_ [_ [Hlen _]]]].
  assert (Hunsigned :
    ca_capacity state - Zlength (ca_contents state) =
    unsigned_last_nbits (ca_capacity state - retval) 32).
  { subst retval. apply UInt_unsigned_eq. split; [lia|].
    replace Int.max_unsigned with (2 ^ 32 - 1) by reflexivity. lia. }
  rewrite <- Hunsigned in PreH1.
  split_pures.
  all: dump_pre_spatial.
  all: try assumption; try reflexivity; lia.
Qed.

Lemma proof_of_CircularAreaWrite_partial_solve_wit_5_pure : CircularAreaWrite_partial_solve_wit_5_pure.
Proof.
  pre_process.
  pose proof PreH17 as Hlogical.
  unfold CircularAreaLogicalState in Hlogical.
  destruct Hlogical as [Hcap [Hread [Hwrite [Hloglen [Hphys _]]]]].
  split_pures.
  all: dump_pre_spatial.
  all: try rewrite sizeof_uchar.
  all: try rewrite Zlength_sublist by lia.
  all: lia.
Qed.

Lemma proof_of_CircularAreaWrite_partial_solve_wit_6_pure : CircularAreaWrite_partial_solve_wit_6_pure.
Proof.
  pre_process.
  pose proof PreH14 as Hlogical.
  unfold CircularAreaLogicalState in Hlogical.
  destruct Hlogical as [Hcap [Hread [Hwrite [Hloglen [Hphys _]]]]].
  unfold CircularAreaActualWriteLength in PreH6.
  pose proof
    (Z.le_min_l requested
      (ca_capacity state - Zlength (ca_contents state))) as Hactual_le.
  split_pures.
  all: dump_pre_spatial.
  all: try rewrite sizeof_uchar.
  all: try rewrite Zlength_sublist by lia.
  all: lia.
Qed.

Lemma proof_of_CircularAreaWrite_partial_solve_wit_7_pure : CircularAreaWrite_partial_solve_wit_7_pure.
Proof.
  pre_process.
  pose proof PreH14 as Hlogical.
  unfold CircularAreaLogicalState in Hlogical.
  destruct Hlogical as [Hcap [Hread [Hwrite [Hloglen [Hphys _]]]]].
  split_pures.
  all: dump_pre_spatial.
  all: try rewrite sizeof_uchar.
  all: try rewrite Zlength_sublist by lia.
  all: lia.
Qed.
