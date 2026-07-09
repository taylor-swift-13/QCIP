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
From MyTutorial Require Import float_try_lib.
From MyTutorial Require Import float_try_goal.
From MyTutorial Require Import float_try_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
Local Open Scope sac.

Lemma proof_of_lerp_positive_safety_wit_1_split_goal_1 : lerp_positive_safety_wit_1_split_goal_1.
Proof. Abort.

Lemma proof_of_lerp_positive_safety_wit_1 : lerp_positive_safety_wit_1.
Proof. Admitted. 

Lemma proof_of_lerp_positive_safety_wit_2_split_goal_1 : lerp_positive_safety_wit_2_split_goal_1.
Proof. Abort.

Lemma proof_of_lerp_positive_safety_wit_2 : lerp_positive_safety_wit_2.
Proof. Admitted. 

Lemma proof_of_lerp_positive_safety_wit_3_split_goal_1 : lerp_positive_safety_wit_3_split_goal_1.
Proof. Abort.

Lemma proof_of_lerp_positive_safety_wit_3 : lerp_positive_safety_wit_3.
Proof. Admitted. 

Lemma proof_of_lerp_positive_safety_wit_4_split_goal_1 : lerp_positive_safety_wit_4_split_goal_1.
Proof. Abort.

Lemma proof_of_lerp_positive_safety_wit_4_split_goal_2 : lerp_positive_safety_wit_4_split_goal_2.
Proof.
  unfold lerp_positive_safety_wit_4_split_goal_2.
  intros.
  entailer!.
Qed.

Lemma proof_of_lerp_positive_safety_wit_4 : lerp_positive_safety_wit_4.
Proof. Admitted.

Lemma proof_of_lerp_positive_return_wit_1_split_goal_1 : lerp_positive_return_wit_1_split_goal_1.
Proof.
  unfold lerp_positive_return_wit_1_split_goal_1.
  intros.
  entailer!.
  unfold lerpPositivePost.
  split.
  - intros _. reflexivity.
  - intros Hgt.
    exfalso.
    apply (fp64_GT_not_LE _ _ Hgt PreH1).
Qed.

Lemma proof_of_lerp_positive_return_wit_1 : lerp_positive_return_wit_1.
Proof.
  unfold lerp_positive_return_wit_1.
  left.
  intros.
  entailer!.
  unfold lerpPositivePost.
  split.
  - intros _. reflexivity.
  - intros Hgt. exfalso. apply (fp64_GT_not_LE _ _ Hgt PreH1).
Qed.

Lemma proof_of_lerp_positive_return_wit_2_split_goal_1 : lerp_positive_return_wit_2_split_goal_1.
Proof.
  unfold lerp_positive_return_wit_2_split_goal_1.
  intros.
  entailer!.
  unfold lerpPositivePost.
  split.
  - intros Hle.
    exfalso.
    apply (fp64_GT_not_LE _ _ PreH1 Hle).
  - intros _. reflexivity.
Qed.

Lemma proof_of_lerp_positive_return_wit_2 : lerp_positive_return_wit_2.
Proof.
  unfold lerp_positive_return_wit_2.
  left.
  intros.
  entailer!.
  unfold lerpPositivePost.
  split.
  - intros Hle. exfalso. apply (fp64_GT_not_LE _ _ PreH1 Hle).
  - intros _. reflexivity.
Qed.
