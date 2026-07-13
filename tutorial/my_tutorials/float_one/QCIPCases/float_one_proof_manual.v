Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Strings.String.
Require Import Coq.Strings.Ascii.
Require Import Coq.Lists.List.
Require Import Coq.Classes.RelationClasses.
Require Import Coq.Classes.Morphisms.
Require Import Coq.micromega.Psatz.
Require Import Coq.Reals.Reals.
Require Import Coq.Sorting.Permutation.
From AUXLib Require Import int_auto Axioms Feq Idents ListLib VMap.
Require Import SetsClass.SetsClass. Import SetsNotation.
From SimpleC.SL Require Import Mem SeparationLogic.
From MyTutorial Require Import float_one_goal.
From MyTutorial Require Import float_one_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope R_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
Require Import MyTutorial.float_one_lib.
Local Open Scope sac.

Lemma proof_of_return_one_return_wit_1_split_goal_1 : return_one_return_wit_1_split_goal_1.
Proof.
  unfold return_one_return_wit_1_split_goal_1.
  unfold returnOnePost.
  reflexivity.
Qed.

Lemma proof_of_return_one_return_wit_1 : return_one_return_wit_1.
Proof.
  unfold return_one_return_wit_1. left. intros.
  apply (derivable1s_andp_mono truep (coq_prop (returnOnePost (fp64_of_real (1.0 : R)))) emp emp).
  - apply (derivable1s_coq_prop_r (returnOnePost (fp64_of_real (1.0 : R))) truep).
    apply proof_of_return_one_return_wit_1_split_goal_1; auto.
  - apply derivable1_refl.
Qed.
