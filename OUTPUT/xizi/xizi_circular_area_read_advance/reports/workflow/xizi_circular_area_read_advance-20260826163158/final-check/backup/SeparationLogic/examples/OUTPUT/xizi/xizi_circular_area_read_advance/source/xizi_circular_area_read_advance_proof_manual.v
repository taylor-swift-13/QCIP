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
From SimpleC.EE.OUTPUT.xizi.xizi_circular_area_read_advance.source Require Import xizi_circular_area_read_advance_goal.
From SimpleC.EE.OUTPUT.xizi.xizi_circular_area_read_advance.source Require Import xizi_circular_area_read_advance_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
From SimpleC.EE.OUTPUT.xizi.xizi_circular_area_read_advance.source Require Import xizi_circular_area_read_advance_lib.
Local Open Scope sac.

Lemma proof_of_CircularAreaDivideRdData_return_wit_1 : CircularAreaDivideRdData_return_wit_1.
Proof.
  right.
  intros data_length_pre circular_area_pre buffer_contents b_status
    area_length p_tail p_head writeidx readidx data_buffer
    PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9.
  unfold CircularAreaDescriptorState in PreH7.
  destruct PreH7 as
    [[Hread_nonneg Hread_lt]
      [[Hwrite_nonneg Hwrite_lt]
        [[Harea_pos Harea_bound] [Hb_status Hbuffer_length]]]].
  assert (Hread_u32 : 0 <= readidx < 2 ^ 32) by lia.
  pose proof
    (unsigned_last_nbits_eq readidx 32 Hread_u32) as Hread_unsigned.
  rewrite Hread_unsigned in PreH1.
  assert (Hsum_u32 : 0 <= readidx + data_length_pre < 2 ^ 32) by lia.
  pose proof
    (unsigned_last_nbits_eq (readidx + data_length_pre) 32 Hsum_u32)
    as Hsum_unsigned.
  rewrite Hsum_unsigned in PreH1.
  pre_process.
  entailer!.
  unfold CircularAreaDivideRdDataResult.
  right; lia.
Qed.

Lemma proof_of_CircularAreaDivideRdData_return_wit_2 : CircularAreaDivideRdData_return_wit_2.
Proof.
  right.
  intros data_length_pre circular_area_pre buffer_contents b_status
    area_length p_tail p_head writeidx readidx data_buffer
    PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9.
  unfold CircularAreaDescriptorState in PreH7.
  destruct PreH7 as
    [[Hread_nonneg Hread_lt]
      [[Hwrite_nonneg Hwrite_lt]
        [[Harea_pos Harea_bound] [Hb_status Hbuffer_length]]]].
  assert (Hread_u32 : 0 <= readidx < 2 ^ 32) by lia.
  pose proof
    (unsigned_last_nbits_eq readidx 32 Hread_u32) as Hread_unsigned.
  rewrite Hread_unsigned in PreH1.
  assert (Hsum_u32 : 0 <= readidx + data_length_pre < 2 ^ 32) by lia.
  pose proof
    (unsigned_last_nbits_eq (readidx + data_length_pre) 32 Hsum_u32)
    as Hsum_unsigned.
  rewrite Hsum_unsigned in PreH1.
  pre_process.
  entailer!.
  unfold CircularAreaDivideRdDataResult.
  left; lia.
Qed.
