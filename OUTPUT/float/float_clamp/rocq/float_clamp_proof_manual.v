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
Require Import MyTutorial.float_clamp_lib.
From MyTutorial Require Import float_clamp_goal.
From MyTutorial Require Import float_clamp_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
Local Open Scope sac.

(* ============================================================
 * float_clamp proofs
 * ============================================================ *)

Lemma proof_of_float_clamp_safety_wit_1_split_goal_1 : float_clamp_safety_wit_1_split_goal_1.
Proof.
  unfold float_clamp_safety_wit_1_split_goal_1.
  intros. unfold clampFloatSafe in PreH1. destruct PreH1 as [Hx [Hlo [Hhi _]]]. entailer!.
Qed.

Lemma proof_of_float_clamp_safety_wit_1_split_goal_2 : float_clamp_safety_wit_1_split_goal_2.
Proof.
  unfold float_clamp_safety_wit_1_split_goal_2.
  intros. unfold clampFloatSafe in PreH1. destruct PreH1 as [Hx [Hlo [Hhi _]]]. entailer!.
Qed.

Lemma proof_of_float_clamp_safety_wit_1 : float_clamp_safety_wit_1.
Proof.
  unfold float_clamp_safety_wit_1. left. intros. unfold clampFloatSafe in PreH1. destruct PreH1 as [Hx [Hlo [Hhi _]]]. entailer!.
Qed.

Lemma proof_of_float_clamp_safety_wit_2_split_goal_1 : float_clamp_safety_wit_2_split_goal_1.
Proof.
  unfold float_clamp_safety_wit_2_split_goal_1.
  intros. unfold clampFloatSafe in PreH2. destruct PreH2 as [Hx [Hlo [Hhi _]]]. entailer!.
Qed.

Lemma proof_of_float_clamp_safety_wit_2_split_goal_2 : float_clamp_safety_wit_2_split_goal_2.
Proof.
  unfold float_clamp_safety_wit_2_split_goal_2.
  intros. unfold clampFloatSafe in PreH2. destruct PreH2 as [Hx [Hlo [Hhi _]]]. entailer!.
Qed.

Lemma proof_of_float_clamp_safety_wit_2 : float_clamp_safety_wit_2.
Proof.
  unfold float_clamp_safety_wit_2. left. intros. unfold clampFloatSafe in PreH2. destruct PreH2 as [Hx [Hlo [Hhi _]]]. entailer!.
Qed.

Lemma proof_of_float_clamp_return_wit_1_split_goal_1 : float_clamp_return_wit_1_split_goal_1.
Proof.
  unfold float_clamp_return_wit_1_split_goal_1, clampFloatPost.
  intros.
  apply (derivable1s_coq_prop_r (fp32_LE lo_pre x_pre /\ fp32_LE x_pre hi_pre) (TT && emp)).
  unfold clampFloatSafe in PreH3. destruct PreH3 as [Hx [Hlo [Hhi Hle]]].
  split.
  - apply fp32_GE_implies_LE; auto.
  - exact PreH1.
Qed.

Lemma proof_of_float_clamp_return_wit_1 : float_clamp_return_wit_1.
Proof.
  unfold float_clamp_return_wit_1. left. intros. unfold clampFloatSafe in PreH3. destruct PreH3 as [Hx [Hlo [Hhi Hle]]].
  apply _derivable1_andp_intros.
  - apply (derivable1s_coq_prop_r (fp32_LE lo_pre x_pre /\ fp32_LE x_pre hi_pre) (TT && emp)).
    split.
    + apply fp32_GE_implies_LE; auto.
    + exact PreH1.
  - apply derivable1_andp_elim2.
Qed.

Lemma proof_of_float_clamp_return_wit_2_split_goal_1 : float_clamp_return_wit_2_split_goal_1.
Proof.
  unfold float_clamp_return_wit_2_split_goal_1, clampFloatPost.
  intros.
  apply (derivable1s_coq_prop_r (fp32_LE lo_pre hi_pre /\ fp32_LE hi_pre hi_pre) (TT && emp)).
  unfold clampFloatSafe in PreH3. destruct PreH3 as [Hx [Hlo [Hhi Hle]]].
  split.
  - exact Hle.
  - apply fp32_LE_refl. exact Hhi.
Qed.

Lemma proof_of_float_clamp_return_wit_2 : float_clamp_return_wit_2.
Proof.
  unfold float_clamp_return_wit_2. left. intros. unfold clampFloatSafe in PreH3. destruct PreH3 as [Hx [Hlo [Hhi Hle]]].
  apply _derivable1_andp_intros.
  - apply (derivable1s_coq_prop_r (fp32_LE lo_pre hi_pre /\ fp32_LE hi_pre hi_pre) (TT && emp)).
    split.
    + exact Hle.
    + apply fp32_LE_refl. exact Hhi.
  - apply derivable1_andp_elim2.
Qed.

Lemma proof_of_float_clamp_return_wit_3_split_goal_1 : float_clamp_return_wit_3_split_goal_1.
Proof.
  unfold float_clamp_return_wit_3_split_goal_1, clampFloatPost.
  intros.
  apply (derivable1s_coq_prop_r (fp32_LE lo_pre lo_pre /\ fp32_LE lo_pre hi_pre) (TT && emp)).
  unfold clampFloatSafe in PreH2. destruct PreH2 as [Hx [Hlo [Hhi Hle]]].
  split.
  - apply fp32_LE_refl. exact Hlo.
  - exact Hle.
Qed.

Lemma proof_of_float_clamp_return_wit_3 : float_clamp_return_wit_3.
Proof.
  unfold float_clamp_return_wit_3. left. intros. unfold clampFloatSafe in PreH2. destruct PreH2 as [Hx [Hlo [Hhi Hle]]].
  apply _derivable1_andp_intros.
  - apply (derivable1s_coq_prop_r (fp32_LE lo_pre lo_pre /\ fp32_LE lo_pre hi_pre) (TT && emp)).
    split.
    + apply fp32_LE_refl. exact Hlo.
    + exact Hle.
  - apply derivable1_andp_elim2.
Qed.

(* ============================================================
 * double_clamp proofs
 * ============================================================ *)

Lemma proof_of_double_clamp_safety_wit_1_split_goal_1 : double_clamp_safety_wit_1_split_goal_1.
Proof.
  unfold double_clamp_safety_wit_1_split_goal_1.
  intros. unfold clampSafe in PreH1. destruct PreH1 as [Hx [Hlo [Hhi _]]]. entailer!.
Qed.

Lemma proof_of_double_clamp_safety_wit_1_split_goal_2 : double_clamp_safety_wit_1_split_goal_2.
Proof.
  unfold double_clamp_safety_wit_1_split_goal_2.
  intros. unfold clampSafe in PreH1. destruct PreH1 as [Hx [Hlo [Hhi _]]]. entailer!.
Qed.

Lemma proof_of_double_clamp_safety_wit_1 : double_clamp_safety_wit_1.
Proof.
  unfold double_clamp_safety_wit_1. left. intros. unfold clampSafe in PreH1. destruct PreH1 as [Hx [Hlo [Hhi _]]]. entailer!.
Qed.

Lemma proof_of_double_clamp_safety_wit_2_split_goal_1 : double_clamp_safety_wit_2_split_goal_1.
Proof.
  unfold double_clamp_safety_wit_2_split_goal_1.
  intros. unfold clampSafe in PreH2. destruct PreH2 as [Hx [Hlo [Hhi _]]]. entailer!.
Qed.

Lemma proof_of_double_clamp_safety_wit_2_split_goal_2 : double_clamp_safety_wit_2_split_goal_2.
Proof.
  unfold double_clamp_safety_wit_2_split_goal_2.
  intros. unfold clampSafe in PreH2. destruct PreH2 as [Hx [Hlo [Hhi _]]]. entailer!.
Qed.

Lemma proof_of_double_clamp_safety_wit_2 : double_clamp_safety_wit_2.
Proof.
  unfold double_clamp_safety_wit_2. left. intros. unfold clampSafe in PreH2. destruct PreH2 as [Hx [Hlo [Hhi _]]]. entailer!.
Qed.

Lemma proof_of_double_clamp_return_wit_1_split_goal_1 : double_clamp_return_wit_1_split_goal_1.
Proof.
  unfold double_clamp_return_wit_1_split_goal_1, clampPost.
  intros.
  apply (derivable1s_coq_prop_r (fp64_LE lo_pre x_pre /\ fp64_LE x_pre hi_pre) (TT && emp)).
  unfold clampSafe in PreH3. destruct PreH3 as [Hx [Hlo [Hhi Hle]]].
  split.
  - apply fp64_GE_implies_LE; auto.
  - exact PreH1.
Qed.

Lemma proof_of_double_clamp_return_wit_1 : double_clamp_return_wit_1.
Proof.
  unfold double_clamp_return_wit_1. left. intros. unfold clampSafe in PreH3. destruct PreH3 as [Hx [Hlo [Hhi Hle]]].
  apply _derivable1_andp_intros.
  - apply (derivable1s_coq_prop_r (fp64_LE lo_pre x_pre /\ fp64_LE x_pre hi_pre) (TT && emp)).
    split.
    + apply fp64_GE_implies_LE; auto.
    + exact PreH1.
  - apply derivable1_andp_elim2.
Qed.

Lemma proof_of_double_clamp_return_wit_2_split_goal_1 : double_clamp_return_wit_2_split_goal_1.
Proof.
  unfold double_clamp_return_wit_2_split_goal_1, clampPost.
  intros.
  apply (derivable1s_coq_prop_r (fp64_LE lo_pre hi_pre /\ fp64_LE hi_pre hi_pre) (TT && emp)).
  unfold clampSafe in PreH3. destruct PreH3 as [Hx [Hlo [Hhi Hle]]].
  split.
  - exact Hle.
  - apply fp64_LE_refl. exact Hhi.
Qed.

Lemma proof_of_double_clamp_return_wit_2 : double_clamp_return_wit_2.
Proof.
  unfold double_clamp_return_wit_2. left. intros. unfold clampSafe in PreH3. destruct PreH3 as [Hx [Hlo [Hhi Hle]]].
  apply _derivable1_andp_intros.
  - apply (derivable1s_coq_prop_r (fp64_LE lo_pre hi_pre /\ fp64_LE hi_pre hi_pre) (TT && emp)).
    split.
    + exact Hle.
    + apply fp64_LE_refl. exact Hhi.
  - apply derivable1_andp_elim2.
Qed.

Lemma proof_of_double_clamp_return_wit_3_split_goal_1 : double_clamp_return_wit_3_split_goal_1.
Proof.
  unfold double_clamp_return_wit_3_split_goal_1, clampPost.
  intros.
  apply (derivable1s_coq_prop_r (fp64_LE lo_pre lo_pre /\ fp64_LE lo_pre hi_pre) (TT && emp)).
  unfold clampSafe in PreH2. destruct PreH2 as [Hx [Hlo [Hhi Hle]]].
  split.
  - apply fp64_LE_refl. exact Hlo.
  - exact Hle.
Qed.

Lemma proof_of_double_clamp_return_wit_3 : double_clamp_return_wit_3.
Proof.
  unfold double_clamp_return_wit_3. left. intros. unfold clampSafe in PreH2. destruct PreH2 as [Hx [Hlo [Hhi Hle]]].
  apply _derivable1_andp_intros.
  - apply (derivable1s_coq_prop_r (fp64_LE lo_pre lo_pre /\ fp64_LE lo_pre hi_pre) (TT && emp)).
    split.
    + apply fp64_LE_refl. exact Hlo.
    + exact Hle.
  - apply derivable1_andp_elim2.
Qed.
