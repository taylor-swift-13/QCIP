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
From SimpleC.EE.INPUT.xizi.xizi_avl_height Require Import xizi_avl_height_goal.
From SimpleC.EE.INPUT.xizi.xizi_avl_height Require Import xizi_avl_height_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
Require Import QCIPLib.xizi.xizi_avl_common.xizi_avl_graph_lib.
Local Open Scope sac.

Lemma proof_of_xizi_avl_height_entail_wit_1 : xizi_avl_height_entail_wit_1.
Proof.
  pre_process.
  prop_apply_p (avl_subtree_store_valid_nonnull__height_graph_recursion g_low_level_spec avl_node_pre PreH1).
  Intros_p Hv.
  sep_apply_l_atomic (avl_subtree_store_decompose__height_accessor g_low_level_spec avl_node_pre PreH2 PreH1 Hv).
  unfold avl_graph_node_store.
  entailer!.
Qed. 

Lemma proof_of_xizi_avl_height_return_wit_1 : xizi_avl_height_return_wit_1.
Proof.
  aggressive_pre_process.
  - sep_apply_r_atomic (avl_subtree_store_fold__height_accessor g_low_level_spec avl_node_pre PreH5 PreH7 PreH6).
    unfold avl_graph_node_store.
    entailer!.
  - unfold avl_height_result.
    entailer!.
    right. exists avl_node_pre. repeat split; auto.
Qed. 

Lemma proof_of_xizi_avl_height_return_wit_2 : xizi_avl_height_return_wit_2.
Proof.
  pre_process.
  unfold avl_height_result.
  entailer!.
Qed. 

