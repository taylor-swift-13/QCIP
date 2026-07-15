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
From QCIPCases.xizi.xizi_avl_height Require Import xizi_avl_height_goal.
From QCIPCases.xizi.xizi_avl_height Require Import xizi_avl_height_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
Require Import QCIPLib.xizi.xizi_avl_common.xizi_avl_lib.
Local Open Scope sac.

Lemma proof_of_xizi_avl_height_safety_wit_3 : xizi_avl_height_safety_wit_3.
Proof.
  left. pre_process. entailer!;
  subst; simpl in *;
  pose proof (tree_depth_nonneg tr1);
  pose proof (tree_depth_nonneg tr2); lia.
Qed.

Lemma proof_of_xizi_avl_height_safety_wit_5 : xizi_avl_height_safety_wit_5.
Proof.
  left. pre_process. entailer!;
  subst; simpl in *;
  pose proof (tree_depth_nonneg tr1);
  pose proof (tree_depth_nonneg tr2); lia.
Qed.

Lemma proof_of_xizi_avl_height_return_wit_1 : xizi_avl_height_return_wit_1.
Proof.
  right. pre_process. entailer!.
  subst. simpl.
  pose proof (tree_depth_nonneg tr1);
  pose proof (tree_depth_nonneg tr2); lia.
Qed.

Lemma proof_of_xizi_avl_height_return_wit_2 : xizi_avl_height_return_wit_2.
Proof.
  right. pre_process. entailer!.
  subst. simpl.
  pose proof (tree_depth_nonneg tr1);
  pose proof (tree_depth_nonneg tr2); lia.
Qed.

Lemma proof_of_xizi_avl_height_return_wit_3 : xizi_avl_height_return_wit_3.
Proof.
  left. pre_process. subst avl_node_pre. destruct tr.
  - simpl. entailer!.
  - simpl. Intros pl pr d h. contradiction.
Qed.

Lemma proof_of_xizi_avl_height_partial_solve_wit_2_pure : xizi_avl_height_partial_solve_wit_2_pure.
Proof.
  left. pre_process. entailer!;
  subst; simpl in *;
  pose proof (tree_depth_nonneg tr1);
  pose proof (tree_depth_nonneg tr2); lia.
Qed.

Lemma proof_of_xizi_avl_height_partial_solve_wit_3_pure : xizi_avl_height_partial_solve_wit_3_pure.
Proof.
  left. pre_process. entailer!;
  subst; simpl in *;
  pose proof (tree_depth_nonneg tr1);
  pose proof (tree_depth_nonneg tr2); lia.
Qed.
