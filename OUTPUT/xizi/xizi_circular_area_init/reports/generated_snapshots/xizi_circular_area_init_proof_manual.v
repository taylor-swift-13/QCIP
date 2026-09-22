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
  pose proof
    (CircularArea_quot_eq_div_nonneg__init_return_branch_construction
       circular_area_length_pre ltac:(lia)) as Hquot_div.
  rewrite (unsigned_last_nbits_eq
             ((circular_area_length_pre ÷ 4) * 4) 32 Hrange).
  rewrite (unsigned_last_nbits_eq
             ((circular_area_length_pre ÷ 4) * 4) 32 Hrange) in PreH3.
  pose proof
    (Z.mul_quot_le circular_area_length_pre 4 ltac:(lia) ltac:(lia))
    as Haligned_le.
  rewrite Hquot_div.
  rewrite Hquot_div in PreH3, Haligned_le.
  subst circular_area_callee_readidx.
  subst circular_area_callee_writeidx.
  subst circular_area_callee_b_status.
  replace (sizeof(UCHAR)) with 1 by reflexivity.
  unfold store_circular_area, CircularAreaInitState.
  simpl.
  Exists retval_2 (&( "CircularAreaOperations" )) 0 0 0
    (repeat None (Z.to_nat ((circular_area_length_pre / 4) * 4))).
  repeat (split_pure_spatial || split_pures).
  - sep_apply_l_atomic
      (UCharArray.undef_full_to_mixed_full
         retval_2 ((circular_area_length_pre / 4) * 4)).
    replace (retval_2 + circular_area_length_pre / 4 * 4 * 1)
      with (retval_2 + circular_area_length_pre / 4 * 4) by lia.
    cancel.
  - dump_pre_spatial.
    exact PreH8.
  - dump_pre_spatial.
    unfold CircularAreaLogicalState, CircularAreaLiveBytes.
    rewrite Zlength_nil, Zlength_correct, repeat_length.
    rewrite Z2Nat.id by lia.
    split; [lia |].
    split; [lia |].
    split; [lia |].
    split; [lia |].
    split; [lia |].
    split; [lia |].
    split; [reflexivity |].
    split; [constructor |].
    split.
    + rewrite Z.mod_0_l by lia.
      reflexivity.
    + split.
      * left; reflexivity.
      * split.
        -- split.
           ++ intros [_ Hfalse]. discriminate.
           ++ intro Hzero. exfalso. lia.
        -- split.
           ++ tauto.
           ++ intros k Hk. lia.
Qed.
