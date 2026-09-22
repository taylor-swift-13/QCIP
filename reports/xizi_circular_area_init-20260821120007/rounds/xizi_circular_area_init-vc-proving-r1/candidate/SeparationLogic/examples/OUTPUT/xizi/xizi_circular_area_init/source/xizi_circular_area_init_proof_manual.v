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
From SimpleC.EE.OUTPUT.xizi.xizi_circular_area_init.source Require Import xizi_circular_area_init_goal.
From SimpleC.EE.OUTPUT.xizi.xizi_circular_area_init.source Require Import xizi_circular_area_init_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
Require Import
      SimpleC.EE.OUTPUT.xizi.xizi_circular_area_init.source.xizi_circular_area_init_lib.
Local Open Scope sac.

Lemma proof_of_CircularAreaInit_return_wit_1 : CircularAreaInit_return_wit_1.
Proof.
  right.
  pre_process.
  pose proof
    (CircularArea_div4_aligned_range__init_return_branches
       circular_area_length_pre ltac:(lia) ltac:(lia)) as Haligned_range.
  rewrite unsigned_last_nbits_eq by exact Haligned_range.
  rewrite unsigned_last_nbits_eq in PreH3 by exact Haligned_range.
  assert (Hquot_div :
    circular_area_length_pre ÷ 4 = circular_area_length_pre / 4).
  { apply CircularArea_quot_eq_div_nonneg__init_return_branch_construction;
      lia. }
  rewrite Hquot_div.
  rewrite Hquot_div in PreH3.
  pose proof
    (Z.mul_quot_le circular_area_length_pre 4 ltac:(lia) ltac:(lia))
    as Haligned_le.
  split_pure_spatial.
  - cancel.
  - split_pures.
    + dump_pre_spatial.
      unfold CircularAreaInitDescriptorState.
      repeat split; try assumption; try reflexivity; lia.
    + dump_pre_spatial.
      unfold CircularAreaAlignedLength.
      repeat split; try assumption; try reflexivity; lia.
Qed.

Lemma proof_of_CircularAreaInit_return_wit_2 : CircularAreaInit_return_wit_2.
Proof.
  pre_process.
  subst retval_2 circular_area_callee_readidx
    circular_area_callee_writeidx circular_area_callee_b_status.
  Left. Left.
  Exists 0 0 0 0 retval ((circular_area_length_pre / 4) * 4).
  split_pure_spatial.
  - repeat cancel.
  - split_pures;
      dump_pre_spatial;
      unfold CircularAreaAlignedLength,
        CircularAreaInitLeakedDescriptorState;
      repeat split; try assumption; try reflexivity; lia.
Qed.

Lemma proof_of_CircularAreaInit_return_wit_3 : CircularAreaInit_return_wit_3.
Proof.
  pre_process.
  Right.
  Exists ((circular_area_length_pre / 4) * 4).
  split_pure_spatial.
  - cancel.
  - split_pures.
    + dump_pre_spatial. lia.
    + dump_pre_spatial. unfold CircularAreaAlignedLength. lia.
    + dump_pre_spatial. lia.
Qed.
