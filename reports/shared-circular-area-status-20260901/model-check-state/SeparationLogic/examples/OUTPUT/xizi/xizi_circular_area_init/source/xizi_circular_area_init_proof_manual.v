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
       circular_area_length_pre ltac:(lia) ltac:(lia)) as Haligned_range.
  rewrite (unsigned_last_nbits_eq _ 32 Haligned_range) in *.
  subst circular_area_callee_readidx.
  subst circular_area_callee_writeidx.
  subst circular_area_callee_b_status.
  replace (sizeof ( UCHAR )) with 1 by reflexivity.
  Exists retval_2
    (repeat None (Z.to_nat (circular_area_length_pre ÷ 4 * 4)))
    (circular_area_length_pre ÷ 4 * 4).
  unfold CircularAreaBackingResource.
  split_pure_spatial.
  - sep_apply_l_atomic
      (UCharArray.undef_full_to_mixed_full retval_2
         (circular_area_length_pre ÷ 4 * 4)).
    replace (circular_area_length_pre ÷ 4 * 4 * 1)
      with (circular_area_length_pre ÷ 4 * 4) by lia.
    cancel.
  - split_pures.
    + dump_pre_spatial. exact PreH8.
    + dump_pre_spatial.
      unfold CircularAreaAlignedLength.
      pose proof
        (CircularArea_quot_eq_div_nonneg__init_return_branch_construction
           circular_area_length_pre ltac:(lia)) as Hquot_div.
      rewrite Hquot_div.
      lia.
    + dump_pre_spatial.
      unfold xizi_circular_area_uninitialized.
      reflexivity.
    + dump_pre_spatial.
      split; [exact PreH8|].
      split; [exact PreH2|].
      pose proof
        (Z.mul_quot_le circular_area_length_pre 4 ltac:(lia) ltac:(lia))
        as Haligned_le_requested.
      assert (Hlogical :
        CircularAreaLogicalState 0 0
          (circular_area_length_pre ÷ 4 * 4) 0 nil
          (repeat None (Z.to_nat (circular_area_length_pre ÷ 4 * 4)))).
      {
        unfold CircularAreaLogicalState.
        repeat apply conj.
        all: try lia.
        - rewrite Zlength_nil; lia.
        - rewrite Zlength_nil; lia.
        - rewrite Zlength_correct, repeat_length.
          rewrite Z2Nat.id by lia.
          reflexivity.
        - constructor.
        - simpl.
          rewrite Z.mod_0_l by lia.
          reflexivity.
        - intros Hz.
          rewrite Zlength_nil in Hz.
          split; lia.
        - intros _.
          reflexivity.
        - unfold CircularAreaLiveBytes.
          intros k Hk.
          rewrite Zlength_nil in Hk.
          lia.
      }
      exact Hlogical.
Qed.
