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
From SimpleC.EE.OUTPUT.xizi.xizi_circular_area_is_empty.source Require Import xizi_circular_area_is_empty_goal.
From SimpleC.EE.OUTPUT.xizi.xizi_circular_area_is_empty.source Require Import xizi_circular_area_is_empty_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
Require Import SimpleC.EE.OUTPUT.xizi.xizi_circular_area_is_empty.source.xizi_circular_area_is_empty_lib.
Local Open Scope sac.

Lemma proof_of_CircularAreaIsEmpty_return_wit_1 : CircularAreaIsEmpty_return_wit_1.
Proof.
  pre_process.
  unfold CircularAreaEmptyResult.
  entailer!.
Qed.

Lemma proof_of_CircularAreaIsEmpty_return_wit_2 : CircularAreaIsEmpty_return_wit_2.
Proof.
  pre_process.
  unfold CircularAreaEmptyResult.
  entailer!.
Qed.

Lemma proof_of_CircularAreaIsEmpty_return_wit_3 : CircularAreaIsEmpty_return_wit_3.
Proof.
  pre_process.
  unfold CircularAreaEmptyResult.
  entailer!.
Qed.

Lemma proof_of_CircularAreaIsEmpty_return_wit_4 : CircularAreaIsEmpty_return_wit_4.
Proof.
  pre_process.
Qed.

Lemma proof_of_CircularAreaIsEmpty_partial_solve_wit_1_pure : CircularAreaIsEmpty_partial_solve_wit_1_pure.
Proof.
  pre_process.
Qed.
