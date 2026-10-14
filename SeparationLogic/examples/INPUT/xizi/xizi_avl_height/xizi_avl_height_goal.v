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
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
Require Import QCIPLib.xizi.xizi_avl_common.xizi_avl_graph_lib.
Local Open Scope sac.

(*----- Function xizi_avl_height -----*)

Definition xizi_avl_height_safety_wit_1 := 
forall (avl_node_pre: Z) (g_low_level_spec: avl_model) (PreH1 : (avl_tree_valid g_low_level_spec )) (PreH2 : (avl_height_int_result_safe g_low_level_spec avl_node_pre )) ,
  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  (avl_subtree_store_at g_low_level_spec avl_node_pre )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition xizi_avl_height_safety_wit_2 := 
forall (avl_node_pre: Z) (g_low_level_spec: avl_model) (PreH1 : (avl_node_pre = 0)) (PreH2 : (avl_tree_valid g_low_level_spec )) (PreH3 : (avl_height_int_result_safe g_low_level_spec avl_node_pre )) ,
  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  (avl_subtree_store_at g_low_level_spec avl_node_pre )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition xizi_avl_height_entail_wit_1 := 
(
forall (avl_node_pre: Z) (g_low_level_spec: avl_model) (PreH1 : (avl_node_pre <> 0)) (PreH2 : (avl_tree_valid g_low_level_spec )) (PreH3 : (avl_height_int_result_safe g_low_level_spec avl_node_pre )) ,
  (avl_subtree_store_at g_low_level_spec avl_node_pre )
|--
  “ (avl_tree_valid g_low_level_spec ) ” 
  &&  “ (avl_vvalid g_low_level_spec avl_node_pre ) ” 
  &&  “ (avl_node_pre <> 0) ” 
  &&  “ (0 <= (avl_height_of (g_low_level_spec) (avl_node_pre))) ” 
  &&  “ ((avl_height_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX) ”
  &&  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
) \/
(
forall (avl_node_pre: Z) (g_low_level_spec: avl_model) (PreH1 : (avl_node_pre <> 0)) (PreH2 : (avl_tree_valid g_low_level_spec )) (PreH3 : (avl_height_int_result_safe g_low_level_spec avl_node_pre )) ,
  (avl_subtree_store_at g_low_level_spec avl_node_pre )
|--
  “ ((avl_height_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX) ” 
  &&  “ (0 <= (avl_height_of (g_low_level_spec) (avl_node_pre))) ” 
  &&  “ (avl_vvalid g_low_level_spec avl_node_pre ) ”
  &&  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
).

Definition xizi_avl_height_entail_wit_1_split_goal_1 := 
forall (avl_node_pre: Z) (g_low_level_spec: avl_model) (PreH1 : (avl_node_pre <> 0)) (PreH2 : (avl_tree_valid g_low_level_spec )) (PreH3 : (avl_height_int_result_safe g_low_level_spec avl_node_pre )) ,
  (avl_subtree_store_at g_low_level_spec avl_node_pre )
|--
  “ ((avl_height_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX) ”
.

Definition xizi_avl_height_entail_wit_1_split_goal_2 := 
forall (avl_node_pre: Z) (g_low_level_spec: avl_model) (PreH1 : (avl_node_pre <> 0)) (PreH2 : (avl_tree_valid g_low_level_spec )) (PreH3 : (avl_height_int_result_safe g_low_level_spec avl_node_pre )) ,
  (avl_subtree_store_at g_low_level_spec avl_node_pre )
|--
  “ (0 <= (avl_height_of (g_low_level_spec) (avl_node_pre))) ”
.

Definition xizi_avl_height_entail_wit_1_split_goal_3 := 
forall (avl_node_pre: Z) (g_low_level_spec: avl_model) (PreH1 : (avl_node_pre <> 0)) (PreH2 : (avl_tree_valid g_low_level_spec )) (PreH3 : (avl_height_int_result_safe g_low_level_spec avl_node_pre )) ,
  (avl_subtree_store_at g_low_level_spec avl_node_pre )
|--
  “ (avl_vvalid g_low_level_spec avl_node_pre ) ”
.

Definition xizi_avl_height_entail_wit_1_split_goal_spatial := 
forall (avl_node_pre: Z) (g_low_level_spec: avl_model) (PreH1 : (avl_node_pre <> 0)) (PreH2 : (avl_tree_valid g_low_level_spec )) (PreH3 : (avl_height_int_result_safe g_low_level_spec avl_node_pre )) ,
  (avl_subtree_store_at g_low_level_spec avl_node_pre )
|--
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
.

Definition xizi_avl_height_return_wit_1 := 
(
forall (avl_node_pre: Z) (g_low_level_spec: avl_model) (PreH1 : (avl_tree_valid g_low_level_spec )) (PreH2 : (avl_vvalid g_low_level_spec avl_node_pre )) (PreH3 : (avl_node_pre <> 0)) (PreH4 : (0 <= (avl_height_of (g_low_level_spec) (avl_node_pre)))) (PreH5 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX)) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
|--
  “ (avl_height_result g_low_level_spec avl_node_pre (avl_height_of (g_low_level_spec) (avl_node_pre)) ) ”
  &&  (avl_subtree_store_at g_low_level_spec avl_node_pre )
) \/
(
forall (avl_node_pre: Z) (g_low_level_spec: avl_model) (PreH1 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH2 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) >= 0)) (PreH3 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH5 : (avl_tree_valid g_low_level_spec )) (PreH6 : (avl_vvalid g_low_level_spec avl_node_pre )) (PreH7 : (avl_node_pre <> 0)) (PreH8 : (0 <= (avl_height_of (g_low_level_spec) (avl_node_pre)))) (PreH9 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX)) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
|--
  “ (avl_height_result g_low_level_spec avl_node_pre (avl_height_of (g_low_level_spec) (avl_node_pre)) ) ”
  &&  (avl_subtree_store_at g_low_level_spec avl_node_pre )
).

Definition xizi_avl_height_return_wit_1_split_goal_1 := 
forall (avl_node_pre: Z) (g_low_level_spec: avl_model) (PreH1 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH2 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) >= 0)) (PreH3 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH5 : (avl_tree_valid g_low_level_spec )) (PreH6 : (avl_vvalid g_low_level_spec avl_node_pre )) (PreH7 : (avl_node_pre <> 0)) (PreH8 : (0 <= (avl_height_of (g_low_level_spec) (avl_node_pre)))) (PreH9 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX)) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
|--
  “ (avl_height_result g_low_level_spec avl_node_pre (avl_height_of (g_low_level_spec) (avl_node_pre)) ) ”
.

Definition xizi_avl_height_return_wit_1_split_goal_spatial := 
forall (avl_node_pre: Z) (g_low_level_spec: avl_model) (PreH1 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH2 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) >= 0)) (PreH3 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH5 : (avl_tree_valid g_low_level_spec )) (PreH6 : (avl_vvalid g_low_level_spec avl_node_pre )) (PreH7 : (avl_node_pre <> 0)) (PreH8 : (0 <= (avl_height_of (g_low_level_spec) (avl_node_pre)))) (PreH9 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX)) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
|--
  (avl_subtree_store_at g_low_level_spec avl_node_pre )
.

Definition xizi_avl_height_return_wit_2 := 
(
forall (avl_node_pre: Z) (g_low_level_spec: avl_model) (PreH1 : (avl_node_pre = 0)) (PreH2 : (avl_tree_valid g_low_level_spec )) (PreH3 : (avl_height_int_result_safe g_low_level_spec avl_node_pre )) ,
  (avl_subtree_store_at g_low_level_spec avl_node_pre )
|--
  “ (avl_height_result g_low_level_spec avl_node_pre 0 ) ”
  &&  (avl_subtree_store_at g_low_level_spec avl_node_pre )
) \/
(
forall (avl_node_pre: Z) (g_low_level_spec: avl_model) (PreH1 : (avl_node_pre = 0)) (PreH2 : (avl_tree_valid g_low_level_spec )) (PreH3 : (avl_height_int_result_safe g_low_level_spec avl_node_pre )) ,
  TT && emp 
|--
  “ (avl_height_result g_low_level_spec 0 0 ) ”
  &&  emp
).

Definition xizi_avl_height_return_wit_2_split_goal_1 := 
forall (avl_node_pre: Z) (g_low_level_spec: avl_model) (PreH1 : (avl_node_pre = 0)) (PreH2 : (avl_tree_valid g_low_level_spec )) (PreH3 : (avl_height_int_result_safe g_low_level_spec avl_node_pre )) ,
  (avl_height_result g_low_level_spec 0 0 )
.

Module Type VC_Correct.


Axiom proof_of_xizi_avl_height_safety_wit_1 : xizi_avl_height_safety_wit_1.
Axiom proof_of_xizi_avl_height_safety_wit_2 : xizi_avl_height_safety_wit_2.
Axiom proof_of_xizi_avl_height_entail_wit_1 : xizi_avl_height_entail_wit_1.
Axiom proof_of_xizi_avl_height_return_wit_1 : xizi_avl_height_return_wit_1.
Axiom proof_of_xizi_avl_height_return_wit_2 : xizi_avl_height_return_wit_2.

End VC_Correct.
