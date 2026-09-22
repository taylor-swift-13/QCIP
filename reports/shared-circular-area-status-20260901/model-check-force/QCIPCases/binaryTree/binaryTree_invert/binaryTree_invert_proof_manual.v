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
From QCIPCases.binaryTree.binaryTree_invert Require Import binaryTree_invert_goal.
From QCIPCases.binaryTree.binaryTree_invert Require Import binaryTree_invert_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
Require Import QCIPLib.binaryTree.common.binaryTree_lib.
Local Open Scope sac.

Lemma proof_of_invert_tree_return_wit_1 : invert_tree_return_wit_1.
Proof.
  left.
  pre_process.
  sep_apply store_tree_zero; [ | assumption ].
  Intros.
  subst tr.
  simpl.
  entailer!.
Qed.

Lemma proof_of_invert_tree_return_wit_2 : invert_tree_return_wit_2.
Proof.
  right.
  pre_process.
  subst tr.
  simpl.
  entailer!.
Qed.

