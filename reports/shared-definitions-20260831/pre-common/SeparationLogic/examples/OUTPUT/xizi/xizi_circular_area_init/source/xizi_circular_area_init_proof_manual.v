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
  pre_process.
  pose proof
    (CircularArea_div4_aligned_range__init_return_branches
       circular_area_length_pre PreH10 ltac:(lia)) as Haligned_range.
  pose proof
    (Z.mul_quot_le circular_area_length_pre 4 ltac:(lia) ltac:(lia))
    as Haligned_le.
  rewrite (unsigned_last_nbits_eq _ 32 Haligned_range) in *.
  rewrite
    (CircularArea_quot_eq_div_nonneg__init_return_branch_construction
       circular_area_length_pre ltac:(lia)) in *.
  subst circular_area_callee_readidx.
  subst circular_area_callee_writeidx.
  subst circular_area_callee_b_status.
  assert (Hrequested_aligned :
    CircularAreaAlignedLength circular_area_length_pre
      ((circular_area_length_pre / 4) * 4)).
  {
    unfold CircularAreaAlignedLength.
    repeat split; try reflexivity; lia.
  }
  assert (Huninitialized :
    xizi_circular_area_uninitialized
      ((circular_area_length_pre / 4) * 4)
      (repeat None (Z.to_nat ((circular_area_length_pre / 4) * 4)))).
  {
    unfold xizi_circular_area_uninitialized.
    reflexivity.
  }
  assert (Hlogical_state :
    CircularAreaLogicalState 0 0
      ((circular_area_length_pre / 4) * 4) 0 nil
      (repeat None (Z.to_nat ((circular_area_length_pre / 4) * 4)))).
  {
    unfold CircularAreaLogicalState, CircularAreaLiveBytes.
    rewrite Zlength_nil, Zlength_correct, repeat_length, Z2Nat.id by lia.
    repeat split; try lia; try constructor;
      try (rewrite Z.mod_0_l by lia);
      try (intros k Hk; lia).
  }
  Exists retval_2
    (repeat None (Z.to_nat ((circular_area_length_pre / 4) * 4)))
    ((circular_area_length_pre / 4) * 4).
  unfold CircularAreaBackingResource.
  sep_apply UCharArray.undef_full_to_mixed_full.
  rewrite sizeof_uchar, Z.mul_1_r.
  entailer!.
Qed.

Lemma proof_of_CircularAreaInit_return_wit_2 : CircularAreaInit_return_wit_2.
Proof.
  pre_process.
  subst retval_2.
  subst circular_area_callee_readidx.
  subst circular_area_callee_writeidx.
  subst circular_area_callee_b_status.
  Exists retval.
  unfold CircularAreaInitFailureResource.
  Right.
  entailer!.
Qed.

Lemma proof_of_CircularAreaInit_return_wit_3 : CircularAreaInit_return_wit_3.
Proof.
  pre_process.
  Exists 0.
  unfold CircularAreaInitFailureResource.
  Left.
  entailer!.
Qed.
