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
       circular_area_length_pre ltac:(lia) ltac:(lia)) as Hrange.
  rewrite unsigned_last_nbits_eq in * by exact Hrange.
  pose proof
    (CircularArea_quot_eq_div_nonneg__init_return_branch_construction
       circular_area_length_pre ltac:(lia)) as Hquot.
  pose proof
    (Z.mul_quot_le circular_area_length_pre 4 ltac:(lia) ltac:(lia)) as Hle.
  rewrite Hquot in *.
  subst circular_area_callee_readidx.
  subst circular_area_callee_writeidx.
  subst circular_area_callee_b_status.
  Exists retval_2
    (repeat None (Z.to_nat (circular_area_length_pre / 4 * 4)))
    (circular_area_length_pre / 4 * 4).
  unfold CircularAreaAlignedLength,
    xizi_circular_area_uninitialized,
    CircularAreaBackingResource.
  sep_apply_l_atomic
    (UCharArray.undef_full_to_mixed_full
       retval_2 (circular_area_length_pre / 4 * 4)).
  entailer!.
  - replace (sizeof (UCHAR)) with 1 by reflexivity.
    replace
      (retval_2 + circular_area_length_pre / 4 * 4 * 1)
      with (retval_2 + circular_area_length_pre / 4 * 4) by lia.
    entailer!.
  - unfold CircularAreaLogicalState.
    repeat split; try lia; try constructor.
    all: repeat rewrite Zlength_nil in *.
    all: try lia.
    + rewrite Zlength_correct, repeat_length, Z2Nat.id by lia.
      reflexivity.
    + unfold CircularAreaLiveBytes.
      intros k Hk.
      rewrite Zlength_nil in Hk.
      lia.
Qed.
