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
From SimpleC.EE.QCP_demos_LLM Require Import bst_left_child_goal.
From SimpleC.EE.QCP_demos_LLM Require Import bst_left_child_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
Require Import SimpleC.EE.QCP_demos_LLM.bst_lib_1.
Require Import SimpleC.EE.QCP_demos_LLM.bst_left_child_lib.
Local Open Scope sac.

Lemma proof_of_bst_left_child_return_wit_1 : bst_left_child_return_wit_1.
Proof.
  unfold bst_left_child_return_wit_1.
  left.
  intros root_pre g PreH1 PreH2 PreH3.
  unfold bst_left_child_result.
  split_pure_spatial.
  - cancel.
  - dump_pre_spatial.
    reflexivity.
Qed.
