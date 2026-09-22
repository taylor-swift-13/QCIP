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
From SimpleC.EE.OUTPUT.xizi.xizi_circular_area_is_full.source Require Import xizi_circular_area_is_full_goal.
From SimpleC.EE.OUTPUT.xizi.xizi_circular_area_is_full.source Require Import xizi_circular_area_is_full_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
Require Import SimpleC.EE.OUTPUT.xizi.xizi_circular_area_is_full.source.xizi_circular_area_is_full_lib.
Local Open Scope sac.

Lemma proof_of_CircularAreaIsFull_return_wit_1 : CircularAreaIsFull_return_wit_1.
Proof.
  unfold CircularAreaIsFull_return_wit_1.
  left.
  intros.
  unfold xizi_circular_area_is_full_result.
  entailer!.
Qed.

Lemma proof_of_CircularAreaIsFull_return_wit_2 : CircularAreaIsFull_return_wit_2.
Proof.
  unfold CircularAreaIsFull_return_wit_2.
  left.
  intros.
  unfold xizi_circular_area_is_full_result.
  entailer!.
Qed.

Lemma proof_of_CircularAreaIsFull_return_wit_3 : CircularAreaIsFull_return_wit_3.
Proof.
  unfold CircularAreaIsFull_return_wit_3.
  left.
  intros.
  unfold xizi_circular_area_is_full_result.
  entailer!.
Qed.

Lemma proof_of_CircularAreaIsFull_return_wit_4 : CircularAreaIsFull_return_wit_4.
Proof.
  unfold CircularAreaIsFull_return_wit_4.
  left.
  intros.
  unfold xizi_circular_area_error_result.
  entailer!.
Qed.

Lemma proof_of_CircularAreaIsFull_partial_solve_wit_1_pure : CircularAreaIsFull_partial_solve_wit_1_pure.
Proof.
  unfold CircularAreaIsFull_partial_solve_wit_1_pure.
  left.
  intros.
  entailer!.
Qed.
