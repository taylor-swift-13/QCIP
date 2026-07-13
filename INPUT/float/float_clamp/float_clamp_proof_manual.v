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
From MyTutorial Require Import float_clamp_goal.
From MyTutorial Require Import float_clamp_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
Require Import MyTutorial.float_clamp_lib.
Local Open Scope sac.

(* ============================================================
 * Manual witness proofs for float_clamp / double_clamp
 * under QCP v2.0.4 native fp32/fp64 support.
 * ============================================================ *)

Lemma proof_of_float_clamp_return_wit_1_split_goal_1 : float_clamp_return_wit_1_split_goal_1.
Proof.
  unfold float_clamp_return_wit_1_split_goal_1. intros.
  unfold clampFloatPost. split; assumption.
Qed.

Lemma proof_of_float_clamp_return_wit_1 : float_clamp_return_wit_1.
Proof.
  unfold float_clamp_return_wit_1. left. intros.
  apply (derivable1s_andp_mono truep (coq_prop (clampFloatPost x_pre lo_pre hi_pre x_pre)) emp emp).
  - apply (derivable1s_coq_prop_r (clampFloatPost x_pre lo_pre hi_pre x_pre) truep).
    apply proof_of_float_clamp_return_wit_1_split_goal_1; auto.
  - apply derivable1_refl.
Qed.

Lemma proof_of_float_clamp_return_wit_2_split_goal_1 : float_clamp_return_wit_2_split_goal_1.
Proof.
  unfold float_clamp_return_wit_2_split_goal_1. intros.
  destruct PreH3 as [Hx [Hlo [Hhi Hle]]].
  unfold clampFloatPost. split.
  - apply (fp32_le_ge lo_pre hi_pre); assumption.
  - apply fp32_le_refl; assumption.
Qed.

Lemma proof_of_float_clamp_return_wit_2 : float_clamp_return_wit_2.
Proof.
  unfold float_clamp_return_wit_2. left. intros.
  apply (derivable1s_andp_mono truep (coq_prop (clampFloatPost x_pre lo_pre hi_pre hi_pre)) emp emp).
  - apply (derivable1s_coq_prop_r (clampFloatPost x_pre lo_pre hi_pre hi_pre) truep).
    apply proof_of_float_clamp_return_wit_2_split_goal_1; auto.
  - apply derivable1_refl.
Qed.

Lemma proof_of_float_clamp_return_wit_3_split_goal_1 : float_clamp_return_wit_3_split_goal_1.
Proof.
  unfold float_clamp_return_wit_3_split_goal_1. intros.
  destruct PreH2 as [Hx [Hlo [Hhi Hle]]].
  unfold clampFloatPost. split.
  - apply (fp32_le_ge lo_pre lo_pre); try apply fp32_le_refl; assumption.
  - assumption.
Qed.

Lemma proof_of_float_clamp_return_wit_3 : float_clamp_return_wit_3.
Proof.
  unfold float_clamp_return_wit_3. left. intros.
  apply (derivable1s_andp_mono truep (coq_prop (clampFloatPost x_pre lo_pre hi_pre lo_pre)) emp emp).
  - apply (derivable1s_coq_prop_r (clampFloatPost x_pre lo_pre hi_pre lo_pre) truep).
    apply proof_of_float_clamp_return_wit_3_split_goal_1; auto.
  - apply derivable1_refl.
Qed.

Lemma proof_of_double_clamp_return_wit_1_split_goal_1 : double_clamp_return_wit_1_split_goal_1.
Proof.
  unfold double_clamp_return_wit_1_split_goal_1. intros.
  unfold clampPost. split; assumption.
Qed.

Lemma proof_of_double_clamp_return_wit_1 : double_clamp_return_wit_1.
Proof.
  unfold double_clamp_return_wit_1. left. intros.
  apply (derivable1s_andp_mono truep (coq_prop (clampPost x_pre lo_pre hi_pre x_pre)) emp emp).
  - apply (derivable1s_coq_prop_r (clampPost x_pre lo_pre hi_pre x_pre) truep).
    apply proof_of_double_clamp_return_wit_1_split_goal_1; auto.
  - apply derivable1_refl.
Qed.

Lemma proof_of_double_clamp_return_wit_2_split_goal_1 : double_clamp_return_wit_2_split_goal_1.
Proof.
  unfold double_clamp_return_wit_2_split_goal_1. intros.
  destruct PreH3 as [Hx [Hlo [Hhi Hle]]].
  unfold clampPost. split.
  - apply (fp64_le_ge lo_pre hi_pre); assumption.
  - apply fp64_le_refl; assumption.
Qed.

Lemma proof_of_double_clamp_return_wit_2 : double_clamp_return_wit_2.
Proof.
  unfold double_clamp_return_wit_2. left. intros.
  apply (derivable1s_andp_mono truep (coq_prop (clampPost x_pre lo_pre hi_pre hi_pre)) emp emp).
  - apply (derivable1s_coq_prop_r (clampPost x_pre lo_pre hi_pre hi_pre) truep).
    apply proof_of_double_clamp_return_wit_2_split_goal_1; auto.
  - apply derivable1_refl.
Qed.

Lemma proof_of_double_clamp_return_wit_3_split_goal_1 : double_clamp_return_wit_3_split_goal_1.
Proof.
  unfold double_clamp_return_wit_3_split_goal_1. intros.
  destruct PreH2 as [Hx [Hlo [Hhi Hle]]].
  unfold clampPost. split.
  - apply (fp64_le_ge lo_pre lo_pre); try apply fp64_le_refl; assumption.
  - assumption.
Qed.

Lemma proof_of_double_clamp_return_wit_3 : double_clamp_return_wit_3.
Proof.
  unfold double_clamp_return_wit_3. left. intros.
  apply (derivable1s_andp_mono truep (coq_prop (clampPost x_pre lo_pre hi_pre lo_pre)) emp emp).
  - apply (derivable1s_coq_prop_r (clampPost x_pre lo_pre hi_pre lo_pre) truep).
    apply proof_of_double_clamp_return_wit_3_split_goal_1; auto.
  - apply derivable1_refl.
Qed.
