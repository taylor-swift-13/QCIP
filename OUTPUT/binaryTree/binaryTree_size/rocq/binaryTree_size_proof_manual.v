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
From QCIPCases.binaryTree.binaryTree_size Require Import binaryTree_size_goal.
From QCIPCases.binaryTree.binaryTree_size Require Import binaryTree_size_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
Require Import QCIPLib.binaryTree.common.binaryTree_lib.
Local Open Scope sac.

Lemma proof_of_count_nodes_safety_wit_3 : count_nodes_safety_wit_3.
Proof.
  left. pre_process. entailer!;
  subst; simpl in *;
  pose proof (tree_size_nonneg tr1);
  pose proof (tree_size_nonneg tr2); lia.
Qed.

Lemma proof_of_count_nodes_safety_wit_4 : count_nodes_safety_wit_4.
Proof.
  left. pre_process. entailer!;
  subst; simpl in *;
  pose proof (tree_size_nonneg tr1);
  pose proof (tree_size_nonneg tr2); lia.
Qed.

Lemma proof_of_count_nodes_return_wit_1 : count_nodes_return_wit_1.
Proof.
  right. pre_process. entailer!.
  subst. simpl. lia.
Qed.

Lemma proof_of_count_nodes_return_wit_2 : count_nodes_return_wit_2.
Proof.
  left. pre_process. subst root_pre. destruct tr.
  - simpl. entailer!.
  - simpl. Intros pl pr k v h. contradiction.
Qed.

Lemma proof_of_count_nodes_partial_solve_wit_2_pure : count_nodes_partial_solve_wit_2_pure.
Proof.
  left. pre_process. entailer!;
  subst; simpl in *;
  pose proof (tree_size_nonneg tr2); lia.
Qed.

Lemma proof_of_count_nodes_partial_solve_wit_3_pure : count_nodes_partial_solve_wit_3_pure.
Proof.
  left. pre_process. entailer!;
  subst; simpl in *;
  pose proof (tree_size_nonneg tr1); lia.
Qed.
