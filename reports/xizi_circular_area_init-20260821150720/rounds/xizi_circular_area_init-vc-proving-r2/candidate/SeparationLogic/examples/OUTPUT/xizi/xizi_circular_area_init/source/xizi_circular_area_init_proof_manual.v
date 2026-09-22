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
  - assert (Hrange : 0 <= (circular_area_length_pre ÷ 4) * 4 < 2 ^ 32).
    {
      apply CircularArea_div4_aligned_range__init_return_branches; lia.
    }
    rewrite (unsigned_last_nbits_eq _ 32 Hrange).
    rewrite (unsigned_last_nbits_eq _ 32 Hrange) in PreH3.
    unfold CircularAreaInitDescriptorState.
    dump_pre_spatial.
    pose proof
      (Z.mul_quot_le circular_area_length_pre 4 ltac:(lia) ltac:(lia))
      as Hquot.
    repeat split; try assumption; try reflexivity; lia.
  - assert (Hrange : 0 <= (circular_area_length_pre ÷ 4) * 4 < 2 ^ 32).
    {
      apply CircularArea_div4_aligned_range__init_return_branches; lia.
    }
    rewrite (unsigned_last_nbits_eq _ 32 Hrange).
    rewrite (unsigned_last_nbits_eq _ 32 Hrange) in PreH3.
    unfold CircularAreaAlignedLength.
    dump_pre_spatial.
    pose proof
      (Z.mul_quot_le circular_area_length_pre 4 ltac:(lia) ltac:(lia))
      as Hquot.
    repeat split; try assumption; try lia.
    rewrite CircularArea_quot_eq_div_nonneg__init_return_branch_construction by lia.
    reflexivity.
Qed.

Lemma proof_of_CircularAreaInit_return_wit_2 : CircularAreaInit_return_wit_2.
Proof.
  pre_process.
  subst retval_2.
  subst circular_area_callee_readidx.
  subst circular_area_callee_writeidx.
  subst circular_area_callee_b_status.
  Left.
  Exists retval ((circular_area_length_pre / 4) * 4).
  unfold CircularAreaAlignedLength, CircularAreaInitFailureState.
  repeat split_pures.
  Right.
  repeat (split_pure_spatial || split_pures).
  all: try (dump_pre_spatial; lia).
  all: repeat cancel.
Qed.

Lemma proof_of_CircularAreaInit_return_wit_3 : CircularAreaInit_return_wit_3.
Proof.
  pre_process.
  Left.
  Exists 0 ((circular_area_length_pre / 4) * 4).
  unfold CircularAreaAlignedLength, CircularAreaInitFailureState.
  repeat split_pures.
  Left.
  repeat (split_pure_spatial || split_pures).
  all: try (dump_pre_spatial; lia).
  all: repeat cancel.
Qed.
