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
  aggressive_pre_process.
  pose proof
    (CircularArea_div4_aligned_range__init_return_branches
       circular_area_length_pre ltac:(lia) ltac:(lia)) as Hraw_range.
  rewrite unsigned_last_nbits_eq in * by exact Hraw_range.
  rewrite CircularArea_quot_eq_div_nonneg__init_return_branch_construction
    in * by lia.
  set (aligned := circular_area_length_pre / 4 * 4).
  assert (Haligned_range : 4 <= aligned <= 256).
  {
    subst aligned.
    pose proof (Z.div_mod circular_area_length_pre 4 ltac:(lia)) as Hdivmod.
    pose proof (Z.mod_pos_bound circular_area_length_pre 4 ltac:(lia)) as Hmod.
    nia.
  }
  Exists retval_2 (repeat None (Z.to_nat aligned)) aligned.
  unfold CircularAreaAlignedLength, xizi_circular_area_uninitialized,
    CircularAreaBackingResource, CircularAreaLogicalState,
    CircularAreaLiveBytes.
  subst circular_area_callee_readidx circular_area_callee_writeidx
    circular_area_callee_b_status.
  cbv [sizeof_front_end_type].
  sep_apply_l_atomic
    (UCharArray.undef_full_to_mixed_full retval_2 aligned).
  entailer!.
  - replace (aligned * 1) with aligned by lia.
    cancel.
  - rewrite Zlength_nil; lia.
  - rewrite Zlength_correct, repeat_length, Z2Nat.id by lia.
    reflexivity.
  - rewrite Zlength_nil; lia.
  - rewrite Zlength_nil; lia.
  - intros k Hk.
    rewrite Zlength_nil in Hk.
    lia.
Qed.
