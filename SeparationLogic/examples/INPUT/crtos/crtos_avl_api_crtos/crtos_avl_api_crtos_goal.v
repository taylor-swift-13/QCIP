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
Require Import SimpleC.EE.INPUT.crtos.crtos_avl_internal_crtos.crtos_avl_internal_crtos_lib.
Require Import SimpleC.EE.INPUT.crtos.crtos_avl_api_crtos.crtos_avl_api_crtos_lib.
Local Open Scope sac.

(*----- Function crtos_avl_height_crtos -----*)

Definition crtos_avl_height_crtos_safety_wit_1 := 
forall (avl_node_pre: Z) (g_low_level_spec: avl_model) (PreH1 : (avl_node_pre <> 0)) (PreH2 : (avl_tree_valid g_low_level_spec )) (PreH3 : (avl_node_pre = 0)) ,
  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  (avl_subtree_store_at g_low_level_spec avl_node_pre )
|--
  “ False ”
.

Definition crtos_avl_height_crtos_safety_wit_2 := 
forall (avl_node_pre: Z) (g_low_level_spec: avl_model) (PreH1 : (avl_node_pre = 0)) (PreH2 : (avl_tree_valid g_low_level_spec )) (PreH3 : (avl_node_pre <> 0)) (PreH4 : (avl_vvalid g_low_level_spec avl_node_pre )) ,
  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
|--
  “ False ”
.

Definition crtos_avl_height_crtos_safety_wit_3 := 
forall (avl_node_pre: Z) (g_low_level_spec: avl_model) (PreH1 : (avl_node_pre = 0)) (PreH2 : (avl_tree_valid g_low_level_spec )) (PreH3 : (avl_node_pre = 0)) ,
  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  (avl_subtree_store_at g_low_level_spec avl_node_pre )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition crtos_avl_height_crtos_entail_wit_1 := 
forall (avl_node_pre: Z) (g_low_level_spec: avl_model) (PreH1 : (avl_tree_valid g_low_level_spec )) ,
  (avl_subtree_store_at g_low_level_spec avl_node_pre )
|--
  (“ (avl_tree_valid g_low_level_spec ) ” 
  &&  “ (avl_node_pre <> 0) ” 
  &&  “ (avl_vvalid g_low_level_spec avl_node_pre ) ”
  &&  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) ))
  ||
  (“ (avl_tree_valid g_low_level_spec ) ” 
  &&  “ (avl_node_pre = 0) ”
  &&  (avl_subtree_store_at g_low_level_spec avl_node_pre ))
.

Definition crtos_avl_height_crtos_return_wit_1 := 
(
forall (avl_node_pre: Z) (g_low_level_spec: avl_model) (PreH1 : (avl_node_pre <> 0)) (PreH2 : (avl_tree_valid g_low_level_spec )) (PreH3 : (avl_node_pre <> 0)) (PreH4 : (avl_vvalid g_low_level_spec avl_node_pre )) ,
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
forall (avl_node_pre: Z) (g_low_level_spec: avl_model) (PreH1 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH2 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) >= 0)) (PreH3 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH5 : (avl_node_pre <> 0)) (PreH6 : (avl_tree_valid g_low_level_spec )) (PreH7 : (avl_node_pre <> 0)) (PreH8 : (avl_vvalid g_low_level_spec avl_node_pre )) ,
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

Definition crtos_avl_height_crtos_return_wit_1_split_goal_1 := 
forall (avl_node_pre: Z) (g_low_level_spec: avl_model) (PreH1 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH2 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) >= 0)) (PreH3 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH5 : (avl_node_pre <> 0)) (PreH6 : (avl_tree_valid g_low_level_spec )) (PreH7 : (avl_node_pre <> 0)) (PreH8 : (avl_vvalid g_low_level_spec avl_node_pre )) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
|--
  “ (avl_height_result g_low_level_spec avl_node_pre (avl_height_of (g_low_level_spec) (avl_node_pre)) ) ”
.

Definition crtos_avl_height_crtos_return_wit_1_split_goal_spatial := 
forall (avl_node_pre: Z) (g_low_level_spec: avl_model) (PreH1 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH2 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) >= 0)) (PreH3 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH5 : (avl_node_pre <> 0)) (PreH6 : (avl_tree_valid g_low_level_spec )) (PreH7 : (avl_node_pre <> 0)) (PreH8 : (avl_vvalid g_low_level_spec avl_node_pre )) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
|--
  (avl_subtree_store_at g_low_level_spec avl_node_pre )
.

Definition crtos_avl_height_crtos_return_wit_2 := 
(
forall (avl_node_pre: Z) (g_low_level_spec: avl_model) (PreH1 : (avl_node_pre = 0)) (PreH2 : (avl_tree_valid g_low_level_spec )) (PreH3 : (avl_node_pre = 0)) ,
  (avl_subtree_store_at g_low_level_spec avl_node_pre )
|--
  “ (avl_height_result g_low_level_spec avl_node_pre 0 ) ”
  &&  (avl_subtree_store_at g_low_level_spec avl_node_pre )
) \/
(
forall (avl_node_pre: Z) (g_low_level_spec: avl_model) (PreH1 : (avl_node_pre = 0)) (PreH2 : (avl_tree_valid g_low_level_spec )) (PreH3 : (avl_node_pre = 0)) ,
  TT && emp 
|--
  “ (avl_height_result g_low_level_spec 0 0 ) ”
  &&  emp
).

Definition crtos_avl_height_crtos_return_wit_2_split_goal_1 := 
forall (avl_node_pre: Z) (g_low_level_spec: avl_model) (PreH1 : (avl_node_pre = 0)) (PreH2 : (avl_tree_valid g_low_level_spec )) (PreH3 : (avl_node_pre = 0)) ,
  (avl_height_result g_low_level_spec 0 0 )
.

(*----- Function crtos_avl_update_height_crtos -----*)

Definition crtos_avl_update_height_crtos_safety_wit_1 := 
forall (avl_node_pre: Z) (old_cache_low_level_spec: Z) (g_low_level_spec: avl_model) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (avl_height_result g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) retval_3 )) (PreH2 : (retval > retval_2)) (PreH3 : (avl_height_result g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) retval_2 )) (PreH4 : (avl_height_result g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) retval )) (PreH5 : (avl_tree_valid g_low_level_spec )) (PreH6 : ((avl_root (g_low_level_spec)) = (Some (avl_node_pre)))) (PreH7 : (avl_vvalid g_low_level_spec avl_node_pre )) (PreH8 : (avl_node_pre <> 0)) (PreH9 : (avl_update_height_children_safe g_low_level_spec avl_node_pre )) ,
  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> old_cache_low_level_spec)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition crtos_avl_update_height_crtos_safety_wit_2 := 
forall (avl_node_pre: Z) (old_cache_low_level_spec: Z) (g_low_level_spec: avl_model) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (avl_height_result g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) retval_3 )) (PreH2 : (retval <= retval_2)) (PreH3 : (avl_height_result g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) retval_2 )) (PreH4 : (avl_height_result g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) retval )) (PreH5 : (avl_tree_valid g_low_level_spec )) (PreH6 : ((avl_root (g_low_level_spec)) = (Some (avl_node_pre)))) (PreH7 : (avl_vvalid g_low_level_spec avl_node_pre )) (PreH8 : (avl_node_pre <> 0)) (PreH9 : (avl_update_height_children_safe g_low_level_spec avl_node_pre )) ,
  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> old_cache_low_level_spec)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition crtos_avl_update_height_crtos_entail_wit_1 := 
(
forall (avl_node_pre: Z) (old_cache_low_level_spec: Z) (g_low_level_spec: avl_model) (PreH1 : (avl_tree_valid g_low_level_spec )) (PreH2 : (avl_node_pre = (avl_ptr_of ((avl_root (g_low_level_spec)))))) (PreH3 : (avl_update_height_children_safe g_low_level_spec avl_node_pre )) (PreH4 : (avl_node_pre <> 0)) ,
  (avl_tree_store (avl_with_root_cache (g_low_level_spec) (avl_node_pre) (old_cache_low_level_spec)) )
|--
  “ (avl_tree_valid g_low_level_spec ) ” 
  &&  “ ((avl_root (g_low_level_spec)) = (Some (avl_node_pre))) ” 
  &&  “ (avl_vvalid g_low_level_spec avl_node_pre ) ” 
  &&  “ (avl_node_pre <> 0) ” 
  &&  “ (avl_update_height_children_safe g_low_level_spec avl_node_pre ) ”
  &&  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> old_cache_low_level_spec)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
) \/
(
forall (avl_node_pre: Z) (old_cache_low_level_spec: Z) (g_low_level_spec: avl_model) (PreH1 : (avl_tree_valid g_low_level_spec )) (PreH2 : (avl_node_pre = (avl_ptr_of ((avl_root (g_low_level_spec)))))) (PreH3 : (avl_update_height_children_safe g_low_level_spec avl_node_pre )) (PreH4 : (avl_node_pre <> 0)) ,
  (avl_tree_store (avl_with_root_cache (g_low_level_spec) (avl_node_pre) (old_cache_low_level_spec)) )
|--
  “ (avl_vvalid g_low_level_spec avl_node_pre ) ” 
  &&  “ ((avl_root (g_low_level_spec)) = (Some (avl_node_pre))) ”
  &&  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> old_cache_low_level_spec)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
).

Definition crtos_avl_update_height_crtos_entail_wit_1_split_goal_1 := 
forall (avl_node_pre: Z) (old_cache_low_level_spec: Z) (g_low_level_spec: avl_model) (PreH1 : (avl_tree_valid g_low_level_spec )) (PreH2 : (avl_node_pre = (avl_ptr_of ((avl_root (g_low_level_spec)))))) (PreH3 : (avl_update_height_children_safe g_low_level_spec avl_node_pre )) (PreH4 : (avl_node_pre <> 0)) ,
  (avl_tree_store (avl_with_root_cache (g_low_level_spec) (avl_node_pre) (old_cache_low_level_spec)) )
|--
  “ (avl_vvalid g_low_level_spec avl_node_pre ) ”
.

Definition crtos_avl_update_height_crtos_entail_wit_1_split_goal_2 := 
forall (avl_node_pre: Z) (old_cache_low_level_spec: Z) (g_low_level_spec: avl_model) (PreH1 : (avl_tree_valid g_low_level_spec )) (PreH2 : (avl_node_pre = (avl_ptr_of ((avl_root (g_low_level_spec)))))) (PreH3 : (avl_update_height_children_safe g_low_level_spec avl_node_pre )) (PreH4 : (avl_node_pre <> 0)) ,
  (avl_tree_store (avl_with_root_cache (g_low_level_spec) (avl_node_pre) (old_cache_low_level_spec)) )
|--
  “ ((avl_root (g_low_level_spec)) = (Some (avl_node_pre))) ”
.

Definition crtos_avl_update_height_crtos_entail_wit_1_split_goal_spatial := 
forall (avl_node_pre: Z) (old_cache_low_level_spec: Z) (g_low_level_spec: avl_model) (PreH1 : (avl_tree_valid g_low_level_spec )) (PreH2 : (avl_node_pre = (avl_ptr_of ((avl_root (g_low_level_spec)))))) (PreH3 : (avl_update_height_children_safe g_low_level_spec avl_node_pre )) (PreH4 : (avl_node_pre <> 0)) ,
  (avl_tree_store (avl_with_root_cache (g_low_level_spec) (avl_node_pre) (old_cache_low_level_spec)) )
|--
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> old_cache_low_level_spec)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
.

Definition crtos_avl_update_height_crtos_return_wit_1 := 
(
forall (avl_node_pre: Z) (g_low_level_spec: avl_model) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (avl_height_result g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) retval_3 )) (PreH2 : (retval > retval_2)) (PreH3 : (avl_height_result g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) retval_2 )) (PreH4 : (avl_height_result g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) retval )) (PreH5 : (avl_tree_valid g_low_level_spec )) (PreH6 : ((avl_root (g_low_level_spec)) = (Some (avl_node_pre)))) (PreH7 : (avl_vvalid g_low_level_spec avl_node_pre )) (PreH8 : (avl_node_pre <> 0)) (PreH9 : (avl_update_height_children_safe g_low_level_spec avl_node_pre )) ,
  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (unsigned_last_nbits ((retval_3 + 1 )) (32)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
|--
  (avl_tree_store g_low_level_spec )
) \/
(
forall (avl_node_pre: Z) (g_low_level_spec: avl_model) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : ((unsigned_last_nbits ((retval_3 + 1 )) (32)) <= UINT_MAX)) (PreH2 : ((unsigned_last_nbits ((retval_3 + 1 )) (32)) >= 0)) (PreH3 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH5 : (avl_height_result g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) retval_3 )) (PreH6 : (retval > retval_2)) (PreH7 : (avl_height_result g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) retval_2 )) (PreH8 : (avl_height_result g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) retval )) (PreH9 : (avl_tree_valid g_low_level_spec )) (PreH10 : ((avl_root (g_low_level_spec)) = (Some (avl_node_pre)))) (PreH11 : (avl_vvalid g_low_level_spec avl_node_pre )) (PreH12 : (avl_node_pre <> 0)) (PreH13 : (avl_update_height_children_safe g_low_level_spec avl_node_pre )) ,
  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (unsigned_last_nbits ((retval_3 + 1 )) (32)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
|--
  (avl_tree_store g_low_level_spec )
).

Definition crtos_avl_update_height_crtos_return_wit_1_split_goal_spatial := 
forall (avl_node_pre: Z) (g_low_level_spec: avl_model) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : ((unsigned_last_nbits ((retval_3 + 1 )) (32)) <= UINT_MAX)) (PreH2 : ((unsigned_last_nbits ((retval_3 + 1 )) (32)) >= 0)) (PreH3 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH5 : (avl_height_result g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) retval_3 )) (PreH6 : (retval > retval_2)) (PreH7 : (avl_height_result g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) retval_2 )) (PreH8 : (avl_height_result g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) retval )) (PreH9 : (avl_tree_valid g_low_level_spec )) (PreH10 : ((avl_root (g_low_level_spec)) = (Some (avl_node_pre)))) (PreH11 : (avl_vvalid g_low_level_spec avl_node_pre )) (PreH12 : (avl_node_pre <> 0)) (PreH13 : (avl_update_height_children_safe g_low_level_spec avl_node_pre )) ,
  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (unsigned_last_nbits ((retval_3 + 1 )) (32)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
|--
  (avl_tree_store g_low_level_spec )
.

Definition crtos_avl_update_height_crtos_return_wit_2 := 
(
forall (avl_node_pre: Z) (g_low_level_spec: avl_model) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (avl_height_result g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) retval_3 )) (PreH2 : (retval <= retval_2)) (PreH3 : (avl_height_result g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) retval_2 )) (PreH4 : (avl_height_result g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) retval )) (PreH5 : (avl_tree_valid g_low_level_spec )) (PreH6 : ((avl_root (g_low_level_spec)) = (Some (avl_node_pre)))) (PreH7 : (avl_vvalid g_low_level_spec avl_node_pre )) (PreH8 : (avl_node_pre <> 0)) (PreH9 : (avl_update_height_children_safe g_low_level_spec avl_node_pre )) ,
  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (unsigned_last_nbits ((retval_3 + 1 )) (32)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
|--
  (avl_tree_store g_low_level_spec )
) \/
(
forall (avl_node_pre: Z) (g_low_level_spec: avl_model) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : ((unsigned_last_nbits ((retval_3 + 1 )) (32)) <= UINT_MAX)) (PreH2 : ((unsigned_last_nbits ((retval_3 + 1 )) (32)) >= 0)) (PreH3 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH5 : (avl_height_result g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) retval_3 )) (PreH6 : (retval <= retval_2)) (PreH7 : (avl_height_result g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) retval_2 )) (PreH8 : (avl_height_result g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) retval )) (PreH9 : (avl_tree_valid g_low_level_spec )) (PreH10 : ((avl_root (g_low_level_spec)) = (Some (avl_node_pre)))) (PreH11 : (avl_vvalid g_low_level_spec avl_node_pre )) (PreH12 : (avl_node_pre <> 0)) (PreH13 : (avl_update_height_children_safe g_low_level_spec avl_node_pre )) ,
  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (unsigned_last_nbits ((retval_3 + 1 )) (32)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
|--
  (avl_tree_store g_low_level_spec )
).

Definition crtos_avl_update_height_crtos_return_wit_2_split_goal_spatial := 
forall (avl_node_pre: Z) (g_low_level_spec: avl_model) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : ((unsigned_last_nbits ((retval_3 + 1 )) (32)) <= UINT_MAX)) (PreH2 : ((unsigned_last_nbits ((retval_3 + 1 )) (32)) >= 0)) (PreH3 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH5 : (avl_height_result g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) retval_3 )) (PreH6 : (retval <= retval_2)) (PreH7 : (avl_height_result g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) retval_2 )) (PreH8 : (avl_height_result g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) retval )) (PreH9 : (avl_tree_valid g_low_level_spec )) (PreH10 : ((avl_root (g_low_level_spec)) = (Some (avl_node_pre)))) (PreH11 : (avl_vvalid g_low_level_spec avl_node_pre )) (PreH12 : (avl_node_pre <> 0)) (PreH13 : (avl_update_height_children_safe g_low_level_spec avl_node_pre )) ,
  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (unsigned_last_nbits ((retval_3 + 1 )) (32)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
|--
  (avl_tree_store g_low_level_spec )
.

Definition crtos_avl_update_height_crtos_return_wit_3 := 
(
forall (avl_node_pre: Z) (old_cache_low_level_spec: Z) (g_low_level_spec: avl_model) (PreH1 : (avl_tree_valid g_low_level_spec )) (PreH2 : (avl_node_pre = (avl_ptr_of ((avl_root (g_low_level_spec)))))) (PreH3 : (avl_update_height_children_safe g_low_level_spec avl_node_pre )) (PreH4 : (avl_node_pre = 0)) ,
  (avl_tree_store (avl_with_root_cache (g_low_level_spec) (avl_node_pre) (old_cache_low_level_spec)) )
|--
  (avl_tree_store g_low_level_spec )
) \/
(
forall (avl_node_pre: Z) (old_cache_low_level_spec: Z) (g_low_level_spec: avl_model) (PreH1 : (avl_tree_valid g_low_level_spec )) (PreH2 : (avl_node_pre = (avl_ptr_of ((avl_root (g_low_level_spec)))))) (PreH3 : (avl_update_height_children_safe g_low_level_spec avl_node_pre )) (PreH4 : (avl_node_pre = 0)) ,
  (avl_tree_store (avl_with_root_cache (g_low_level_spec) (avl_node_pre) (old_cache_low_level_spec)) )
|--
  (avl_tree_store g_low_level_spec )
).

Definition crtos_avl_update_height_crtos_return_wit_3_split_goal_spatial := 
forall (avl_node_pre: Z) (old_cache_low_level_spec: Z) (g_low_level_spec: avl_model) (PreH1 : (avl_tree_valid g_low_level_spec )) (PreH2 : (avl_node_pre = (avl_ptr_of ((avl_root (g_low_level_spec)))))) (PreH3 : (avl_update_height_children_safe g_low_level_spec avl_node_pre )) (PreH4 : (avl_node_pre = 0)) ,
  (avl_tree_store (avl_with_root_cache (g_low_level_spec) (avl_node_pre) (old_cache_low_level_spec)) )
|--
  (avl_tree_store g_low_level_spec )
.

Definition crtos_avl_update_height_crtos_partial_solve_wit_1_pure := 
forall (avl_node_pre: Z) (old_cache_low_level_spec: Z) (g_low_level_spec: avl_model) (PreH1 : (avl_tree_valid g_low_level_spec )) (PreH2 : ((avl_root (g_low_level_spec)) = (Some (avl_node_pre)))) (PreH3 : (avl_vvalid g_low_level_spec avl_node_pre )) (PreH4 : (avl_node_pre <> 0)) (PreH5 : (avl_update_height_children_safe g_low_level_spec avl_node_pre )) ,
  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> old_cache_low_level_spec)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
|--
  “ (avl_tree_valid g_low_level_spec ) ”
.

Definition crtos_avl_update_height_crtos_partial_solve_wit_1_aux := 
forall (avl_node_pre: Z) (old_cache_low_level_spec: Z) (g_low_level_spec: avl_model) (PreH1 : (avl_tree_valid g_low_level_spec )) (PreH2 : ((avl_root (g_low_level_spec)) = (Some (avl_node_pre)))) (PreH3 : (avl_vvalid g_low_level_spec avl_node_pre )) (PreH4 : (avl_node_pre <> 0)) (PreH5 : (avl_update_height_children_safe g_low_level_spec avl_node_pre )) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> old_cache_low_level_spec)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
|--
  “ (avl_tree_valid g_low_level_spec ) ” 
  &&  “ (avl_tree_valid g_low_level_spec ) ” 
  &&  “ ((avl_root (g_low_level_spec)) = (Some (avl_node_pre))) ” 
  &&  “ (avl_vvalid g_low_level_spec avl_node_pre ) ” 
  &&  “ (avl_node_pre <> 0) ” 
  &&  “ (avl_update_height_children_safe g_low_level_spec avl_node_pre ) ”
  &&  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> old_cache_low_level_spec)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
.

Definition crtos_avl_update_height_crtos_partial_solve_wit_1 := crtos_avl_update_height_crtos_partial_solve_wit_1_pure -> crtos_avl_update_height_crtos_partial_solve_wit_1_aux.

Definition crtos_avl_update_height_crtos_partial_solve_wit_2_pure := 
forall (avl_node_pre: Z) (old_cache_low_level_spec: Z) (g_low_level_spec: avl_model) (retval: Z) (PreH1 : (avl_height_result g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) retval )) (PreH2 : (avl_tree_valid g_low_level_spec )) (PreH3 : ((avl_root (g_low_level_spec)) = (Some (avl_node_pre)))) (PreH4 : (avl_vvalid g_low_level_spec avl_node_pre )) (PreH5 : (avl_node_pre <> 0)) (PreH6 : (avl_update_height_children_safe g_low_level_spec avl_node_pre )) ,
  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> old_cache_low_level_spec)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
|--
  “ (avl_tree_valid g_low_level_spec ) ”
.

Definition crtos_avl_update_height_crtos_partial_solve_wit_2_aux := 
forall (avl_node_pre: Z) (old_cache_low_level_spec: Z) (g_low_level_spec: avl_model) (retval: Z) (PreH1 : (avl_height_result g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) retval )) (PreH2 : (avl_tree_valid g_low_level_spec )) (PreH3 : ((avl_root (g_low_level_spec)) = (Some (avl_node_pre)))) (PreH4 : (avl_vvalid g_low_level_spec avl_node_pre )) (PreH5 : (avl_node_pre <> 0)) (PreH6 : (avl_update_height_children_safe g_low_level_spec avl_node_pre )) ,
  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> old_cache_low_level_spec)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
|--
  “ (avl_tree_valid g_low_level_spec ) ” 
  &&  “ (avl_height_result g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) retval ) ” 
  &&  “ (avl_tree_valid g_low_level_spec ) ” 
  &&  “ ((avl_root (g_low_level_spec)) = (Some (avl_node_pre))) ” 
  &&  “ (avl_vvalid g_low_level_spec avl_node_pre ) ” 
  &&  “ (avl_node_pre <> 0) ” 
  &&  “ (avl_update_height_children_safe g_low_level_spec avl_node_pre ) ”
  &&  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> old_cache_low_level_spec)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
.

Definition crtos_avl_update_height_crtos_partial_solve_wit_2 := crtos_avl_update_height_crtos_partial_solve_wit_2_pure -> crtos_avl_update_height_crtos_partial_solve_wit_2_aux.

Definition crtos_avl_update_height_crtos_partial_solve_wit_3_pure := 
forall (avl_node_pre: Z) (old_cache_low_level_spec: Z) (g_low_level_spec: avl_model) (retval: Z) (retval_2: Z) (PreH1 : (retval > retval_2)) (PreH2 : (avl_height_result g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) retval_2 )) (PreH3 : (avl_height_result g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) retval )) (PreH4 : (avl_tree_valid g_low_level_spec )) (PreH5 : ((avl_root (g_low_level_spec)) = (Some (avl_node_pre)))) (PreH6 : (avl_vvalid g_low_level_spec avl_node_pre )) (PreH7 : (avl_node_pre <> 0)) (PreH8 : (avl_update_height_children_safe g_low_level_spec avl_node_pre )) ,
  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> old_cache_low_level_spec)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
|--
  “ (avl_tree_valid g_low_level_spec ) ”
.

Definition crtos_avl_update_height_crtos_partial_solve_wit_3_aux := 
forall (avl_node_pre: Z) (old_cache_low_level_spec: Z) (g_low_level_spec: avl_model) (retval: Z) (retval_2: Z) (PreH1 : (retval > retval_2)) (PreH2 : (avl_height_result g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) retval_2 )) (PreH3 : (avl_height_result g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) retval )) (PreH4 : (avl_tree_valid g_low_level_spec )) (PreH5 : ((avl_root (g_low_level_spec)) = (Some (avl_node_pre)))) (PreH6 : (avl_vvalid g_low_level_spec avl_node_pre )) (PreH7 : (avl_node_pre <> 0)) (PreH8 : (avl_update_height_children_safe g_low_level_spec avl_node_pre )) ,
  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> old_cache_low_level_spec)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
|--
  “ (avl_tree_valid g_low_level_spec ) ” 
  &&  “ (retval > retval_2) ” 
  &&  “ (avl_height_result g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) retval_2 ) ” 
  &&  “ (avl_height_result g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) retval ) ” 
  &&  “ (avl_tree_valid g_low_level_spec ) ” 
  &&  “ ((avl_root (g_low_level_spec)) = (Some (avl_node_pre))) ” 
  &&  “ (avl_vvalid g_low_level_spec avl_node_pre ) ” 
  &&  “ (avl_node_pre <> 0) ” 
  &&  “ (avl_update_height_children_safe g_low_level_spec avl_node_pre ) ”
  &&  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> old_cache_low_level_spec)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
.

Definition crtos_avl_update_height_crtos_partial_solve_wit_3 := crtos_avl_update_height_crtos_partial_solve_wit_3_pure -> crtos_avl_update_height_crtos_partial_solve_wit_3_aux.

Definition crtos_avl_update_height_crtos_partial_solve_wit_4_pure := 
forall (avl_node_pre: Z) (old_cache_low_level_spec: Z) (g_low_level_spec: avl_model) (retval: Z) (retval_2: Z) (PreH1 : (retval <= retval_2)) (PreH2 : (avl_height_result g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) retval_2 )) (PreH3 : (avl_height_result g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) retval )) (PreH4 : (avl_tree_valid g_low_level_spec )) (PreH5 : ((avl_root (g_low_level_spec)) = (Some (avl_node_pre)))) (PreH6 : (avl_vvalid g_low_level_spec avl_node_pre )) (PreH7 : (avl_node_pre <> 0)) (PreH8 : (avl_update_height_children_safe g_low_level_spec avl_node_pre )) ,
  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> old_cache_low_level_spec)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
|--
  “ (avl_tree_valid g_low_level_spec ) ”
.

Definition crtos_avl_update_height_crtos_partial_solve_wit_4_aux := 
forall (avl_node_pre: Z) (old_cache_low_level_spec: Z) (g_low_level_spec: avl_model) (retval: Z) (retval_2: Z) (PreH1 : (retval <= retval_2)) (PreH2 : (avl_height_result g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) retval_2 )) (PreH3 : (avl_height_result g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) retval )) (PreH4 : (avl_tree_valid g_low_level_spec )) (PreH5 : ((avl_root (g_low_level_spec)) = (Some (avl_node_pre)))) (PreH6 : (avl_vvalid g_low_level_spec avl_node_pre )) (PreH7 : (avl_node_pre <> 0)) (PreH8 : (avl_update_height_children_safe g_low_level_spec avl_node_pre )) ,
  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> old_cache_low_level_spec)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
|--
  “ (avl_tree_valid g_low_level_spec ) ” 
  &&  “ (retval <= retval_2) ” 
  &&  “ (avl_height_result g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) retval_2 ) ” 
  &&  “ (avl_height_result g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) retval ) ” 
  &&  “ (avl_tree_valid g_low_level_spec ) ” 
  &&  “ ((avl_root (g_low_level_spec)) = (Some (avl_node_pre))) ” 
  &&  “ (avl_vvalid g_low_level_spec avl_node_pre ) ” 
  &&  “ (avl_node_pre <> 0) ” 
  &&  “ (avl_update_height_children_safe g_low_level_spec avl_node_pre ) ”
  &&  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> old_cache_low_level_spec)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
.

Definition crtos_avl_update_height_crtos_partial_solve_wit_4 := crtos_avl_update_height_crtos_partial_solve_wit_4_pure -> crtos_avl_update_height_crtos_partial_solve_wit_4_aux.

(*----- Function crtos_avl_balance_factor_crtos -----*)

Definition crtos_avl_balance_factor_crtos_safety_wit_1 := 
forall (avl_node_pre: Z) (g_low_level_spec: avl_model) (PreH1 : (avl_balance_factor_input_valid g_low_level_spec )) (PreH2 : (avl_node_pre = 0)) ,
  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  (avl_subtree_store_at g_low_level_spec avl_node_pre )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition crtos_avl_balance_factor_crtos_entail_wit_1 := 
(
forall (avl_node_pre: Z) (g_low_level_spec: avl_model) (PreH1 : (avl_balance_factor_input_valid g_low_level_spec )) (PreH2 : (avl_node_pre <> 0)) ,
  (avl_subtree_store_at g_low_level_spec avl_node_pre )
|--
  “ (avl_balance_factor_input_valid g_low_level_spec ) ” 
  &&  “ (avl_tree_valid g_low_level_spec ) ” 
  &&  “ (avl_node_pre <> 0) ” 
  &&  “ (avl_vvalid g_low_level_spec avl_node_pre ) ”
  &&  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
) \/
(
forall (avl_node_pre: Z) (g_low_level_spec: avl_model) (PreH1 : (avl_balance_factor_input_valid g_low_level_spec )) (PreH2 : (avl_node_pre <> 0)) ,
  (avl_subtree_store_at g_low_level_spec avl_node_pre )
|--
  “ (avl_vvalid g_low_level_spec avl_node_pre ) ” 
  &&  “ (avl_tree_valid g_low_level_spec ) ”
  &&  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
).

Definition crtos_avl_balance_factor_crtos_entail_wit_1_split_goal_1 := 
forall (avl_node_pre: Z) (g_low_level_spec: avl_model) (PreH1 : (avl_balance_factor_input_valid g_low_level_spec )) (PreH2 : (avl_node_pre <> 0)) ,
  (avl_subtree_store_at g_low_level_spec avl_node_pre )
|--
  “ (avl_vvalid g_low_level_spec avl_node_pre ) ”
.

Definition crtos_avl_balance_factor_crtos_entail_wit_1_split_goal_2 := 
forall (avl_node_pre: Z) (g_low_level_spec: avl_model) (PreH1 : (avl_balance_factor_input_valid g_low_level_spec )) (PreH2 : (avl_node_pre <> 0)) ,
  (avl_subtree_store_at g_low_level_spec avl_node_pre )
|--
  “ (avl_tree_valid g_low_level_spec ) ”
.

Definition crtos_avl_balance_factor_crtos_entail_wit_1_split_goal_spatial := 
forall (avl_node_pre: Z) (g_low_level_spec: avl_model) (PreH1 : (avl_balance_factor_input_valid g_low_level_spec )) (PreH2 : (avl_node_pre <> 0)) ,
  (avl_subtree_store_at g_low_level_spec avl_node_pre )
|--
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
.

Definition crtos_avl_balance_factor_crtos_return_wit_1 := 
forall (avl_node_pre: Z) (g_low_level_spec: avl_model) (PreH1 : (avl_balance_factor_input_valid g_low_level_spec )) (PreH2 : (avl_node_pre = 0)) ,
  (avl_subtree_store_at g_low_level_spec avl_node_pre )
|--
  “ (avl_node_pre = 0) ” 
  &&  “ (0 = 0) ”
  &&  (avl_subtree_store_at g_low_level_spec avl_node_pre )
.

Definition crtos_avl_balance_factor_crtos_return_wit_2 := 
(
forall (avl_node_pre: Z) (g_low_level_spec: avl_model) (retval: Z) (retval_2: Z) (PreH1 : (avl_height_result g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) retval_2 )) (PreH2 : (avl_height_result g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) retval )) (PreH3 : (avl_balance_factor_input_valid g_low_level_spec )) (PreH4 : (avl_tree_valid g_low_level_spec )) (PreH5 : (avl_node_pre <> 0)) (PreH6 : (avl_vvalid g_low_level_spec avl_node_pre )) ,
  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
|--
  “ (avl_node_pre <> 0) ” 
  &&  “ (avl_vvalid g_low_level_spec avl_node_pre ) ” 
  &&  “ ((signed_last_nbits ((retval - retval_2 )) (32)) = (avl_model_balance_factor (g_low_level_spec) (avl_node_pre))) ” 
  &&  “ (INT_MIN < (signed_last_nbits ((retval - retval_2 )) (32))) ” 
  &&  “ ((signed_last_nbits ((retval - retval_2 )) (32)) <= INT_MAX) ”
  &&  (avl_subtree_store_at g_low_level_spec avl_node_pre )
) \/
(
forall (avl_node_pre: Z) (g_low_level_spec: avl_model) (retval: Z) (retval_2: Z) (PreH1 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH2 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) >= 0)) (PreH3 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH5 : (avl_height_result g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) retval_2 )) (PreH6 : (avl_height_result g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) retval )) (PreH7 : (avl_balance_factor_input_valid g_low_level_spec )) (PreH8 : (avl_tree_valid g_low_level_spec )) (PreH9 : (avl_node_pre <> 0)) (PreH10 : (avl_vvalid g_low_level_spec avl_node_pre )) ,
  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
|--
  “ ((signed_last_nbits ((retval - retval_2 )) (32)) <= INT_MAX) ” 
  &&  “ (INT_MIN < (signed_last_nbits ((retval - retval_2 )) (32))) ” 
  &&  “ ((signed_last_nbits ((retval - retval_2 )) (32)) = (avl_model_balance_factor (g_low_level_spec) (avl_node_pre))) ”
  &&  (avl_subtree_store_at g_low_level_spec avl_node_pre )
).

Definition crtos_avl_balance_factor_crtos_return_wit_2_split_goal_1 := 
forall (avl_node_pre: Z) (g_low_level_spec: avl_model) (retval: Z) (retval_2: Z) (PreH1 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH2 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) >= 0)) (PreH3 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH5 : (avl_height_result g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) retval_2 )) (PreH6 : (avl_height_result g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) retval )) (PreH7 : (avl_balance_factor_input_valid g_low_level_spec )) (PreH8 : (avl_tree_valid g_low_level_spec )) (PreH9 : (avl_node_pre <> 0)) (PreH10 : (avl_vvalid g_low_level_spec avl_node_pre )) ,
  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
|--
  “ ((signed_last_nbits ((retval - retval_2 )) (32)) <= INT_MAX) ”
.

Definition crtos_avl_balance_factor_crtos_return_wit_2_split_goal_2 := 
forall (avl_node_pre: Z) (g_low_level_spec: avl_model) (retval: Z) (retval_2: Z) (PreH1 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH2 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) >= 0)) (PreH3 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH5 : (avl_height_result g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) retval_2 )) (PreH6 : (avl_height_result g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) retval )) (PreH7 : (avl_balance_factor_input_valid g_low_level_spec )) (PreH8 : (avl_tree_valid g_low_level_spec )) (PreH9 : (avl_node_pre <> 0)) (PreH10 : (avl_vvalid g_low_level_spec avl_node_pre )) ,
  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
|--
  “ (INT_MIN < (signed_last_nbits ((retval - retval_2 )) (32))) ”
.

Definition crtos_avl_balance_factor_crtos_return_wit_2_split_goal_3 := 
forall (avl_node_pre: Z) (g_low_level_spec: avl_model) (retval: Z) (retval_2: Z) (PreH1 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH2 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) >= 0)) (PreH3 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH5 : (avl_height_result g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) retval_2 )) (PreH6 : (avl_height_result g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) retval )) (PreH7 : (avl_balance_factor_input_valid g_low_level_spec )) (PreH8 : (avl_tree_valid g_low_level_spec )) (PreH9 : (avl_node_pre <> 0)) (PreH10 : (avl_vvalid g_low_level_spec avl_node_pre )) ,
  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
|--
  “ ((signed_last_nbits ((retval - retval_2 )) (32)) = (avl_model_balance_factor (g_low_level_spec) (avl_node_pre))) ”
.

Definition crtos_avl_balance_factor_crtos_return_wit_2_split_goal_spatial := 
forall (avl_node_pre: Z) (g_low_level_spec: avl_model) (retval: Z) (retval_2: Z) (PreH1 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH2 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) >= 0)) (PreH3 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH5 : (avl_height_result g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) retval_2 )) (PreH6 : (avl_height_result g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) retval )) (PreH7 : (avl_balance_factor_input_valid g_low_level_spec )) (PreH8 : (avl_tree_valid g_low_level_spec )) (PreH9 : (avl_node_pre <> 0)) (PreH10 : (avl_vvalid g_low_level_spec avl_node_pre )) ,
  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
|--
  (avl_subtree_store_at g_low_level_spec avl_node_pre )
.

Definition crtos_avl_balance_factor_crtos_partial_solve_wit_1_pure := 
forall (avl_node_pre: Z) (g_low_level_spec: avl_model) (PreH1 : (avl_balance_factor_input_valid g_low_level_spec )) (PreH2 : (avl_tree_valid g_low_level_spec )) (PreH3 : (avl_node_pre <> 0)) (PreH4 : (avl_vvalid g_low_level_spec avl_node_pre )) ,
  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
|--
  “ (avl_tree_valid g_low_level_spec ) ”
.

Definition crtos_avl_balance_factor_crtos_partial_solve_wit_1_aux := 
forall (avl_node_pre: Z) (g_low_level_spec: avl_model) (PreH1 : (avl_balance_factor_input_valid g_low_level_spec )) (PreH2 : (avl_tree_valid g_low_level_spec )) (PreH3 : (avl_node_pre <> 0)) (PreH4 : (avl_vvalid g_low_level_spec avl_node_pre )) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
|--
  “ (avl_tree_valid g_low_level_spec ) ” 
  &&  “ (avl_balance_factor_input_valid g_low_level_spec ) ” 
  &&  “ (avl_tree_valid g_low_level_spec ) ” 
  &&  “ (avl_node_pre <> 0) ” 
  &&  “ (avl_vvalid g_low_level_spec avl_node_pre ) ”
  &&  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
.

Definition crtos_avl_balance_factor_crtos_partial_solve_wit_1 := crtos_avl_balance_factor_crtos_partial_solve_wit_1_pure -> crtos_avl_balance_factor_crtos_partial_solve_wit_1_aux.

Definition crtos_avl_balance_factor_crtos_partial_solve_wit_2_pure := 
forall (avl_node_pre: Z) (g_low_level_spec: avl_model) (retval: Z) (PreH1 : (avl_height_result g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) retval )) (PreH2 : (avl_balance_factor_input_valid g_low_level_spec )) (PreH3 : (avl_tree_valid g_low_level_spec )) (PreH4 : (avl_node_pre <> 0)) (PreH5 : (avl_vvalid g_low_level_spec avl_node_pre )) ,
  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
|--
  “ (avl_tree_valid g_low_level_spec ) ”
.

Definition crtos_avl_balance_factor_crtos_partial_solve_wit_2_aux := 
forall (avl_node_pre: Z) (g_low_level_spec: avl_model) (retval: Z) (PreH1 : (avl_height_result g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) retval )) (PreH2 : (avl_balance_factor_input_valid g_low_level_spec )) (PreH3 : (avl_tree_valid g_low_level_spec )) (PreH4 : (avl_node_pre <> 0)) (PreH5 : (avl_vvalid g_low_level_spec avl_node_pre )) ,
  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
|--
  “ (avl_tree_valid g_low_level_spec ) ” 
  &&  “ (avl_height_result g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) retval ) ” 
  &&  “ (avl_balance_factor_input_valid g_low_level_spec ) ” 
  &&  “ (avl_tree_valid g_low_level_spec ) ” 
  &&  “ (avl_node_pre <> 0) ” 
  &&  “ (avl_vvalid g_low_level_spec avl_node_pre ) ”
  &&  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
.

Definition crtos_avl_balance_factor_crtos_partial_solve_wit_2 := crtos_avl_balance_factor_crtos_partial_solve_wit_2_pure -> crtos_avl_balance_factor_crtos_partial_solve_wit_2_aux.

(*----- Function crtos_avl_right_rotate_crtos -----*)

Definition crtos_avl_right_rotate_crtos_safety_wit_1 := 
forall (avl_node_pre: Z) (root_cached_height_low_level_spec: Z) (before_low_level_spec: avl_model) (PreH1 : (avl_right_rotation_input before_low_level_spec avl_node_pre )) (PreH2 : (avl_node_pre <> 0)) ,
  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  (avl_tree_store (avl_with_root_cache (before_low_level_spec) (avl_node_pre) (root_cached_height_low_level_spec)) )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition crtos_avl_right_rotate_crtos_safety_wit_2 := 
forall (avl_node_pre: Z) (root_cached_height_low_level_spec: Z) (before_low_level_spec: avl_model) (PreH1 : (avl_node_pre = 0)) (PreH2 : (avl_right_rotation_input before_low_level_spec avl_node_pre )) (PreH3 : (avl_node_pre <> 0)) ,
  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  (avl_tree_store (avl_with_root_cache (before_low_level_spec) (avl_node_pre) (root_cached_height_low_level_spec)) )
|--
  “ False ”
.

Definition crtos_avl_right_rotate_crtos_safety_wit_3 := 
forall (avl_node_pre: Z) (root_cached_height_low_level_spec: Z) (before_low_level_spec: avl_model) (PreH1 : (avl_right_rotation_input before_low_level_spec avl_node_pre )) (PreH2 : (avl_node_pre <> 0)) ,
  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  (avl_tree_store (avl_with_root_cache (before_low_level_spec) (avl_node_pre) (root_cached_height_low_level_spec)) )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition crtos_avl_right_rotate_crtos_entail_wit_1 := 
(
forall (avl_node_pre: Z) (root_cached_height_low_level_spec: Z) (before_low_level_spec: avl_model) (PreH1 : (avl_right_rotation_input before_low_level_spec avl_node_pre )) ,
  (avl_tree_store (avl_with_root_cache (before_low_level_spec) (avl_node_pre) (root_cached_height_low_level_spec)) )
|--
  “ (avl_right_rotation_input before_low_level_spec avl_node_pre ) ” 
  &&  “ (avl_node_pre <> 0) ”
  &&  (avl_tree_store (avl_with_root_cache (before_low_level_spec) (avl_node_pre) (root_cached_height_low_level_spec)) )
) \/
(
forall (avl_node_pre: Z) (before_low_level_spec: avl_model) (PreH1 : (avl_right_rotation_input before_low_level_spec avl_node_pre )) ,
  TT && emp 
|--
  “ (avl_node_pre <> 0) ”
  &&  emp
).

Definition crtos_avl_right_rotate_crtos_entail_wit_1_split_goal_1 := 
forall (avl_node_pre: Z) (before_low_level_spec: avl_model) (PreH1 : (avl_right_rotation_input before_low_level_spec avl_node_pre )) ,
  (avl_node_pre <> 0)
.

Definition crtos_avl_right_rotate_crtos_entail_wit_2 := 
forall (avl_node_pre: Z) (root_cached_height_low_level_spec: Z) (before_low_level_spec: avl_model) (PreH1 : (avl_node_pre <> 0)) (PreH2 : (avl_right_rotation_input before_low_level_spec avl_node_pre )) (PreH3 : (avl_node_pre <> 0)) ,
  (avl_tree_store (avl_with_root_cache (before_low_level_spec) (avl_node_pre) (root_cached_height_low_level_spec)) )
|--
  “ (avl_right_rotation_input before_low_level_spec avl_node_pre ) ” 
  &&  “ (avl_node_pre <> 0) ”
  &&  (avl_tree_store (avl_with_root_cache (before_low_level_spec) (avl_node_pre) (root_cached_height_low_level_spec)) )
.

Definition crtos_avl_right_rotate_crtos_entail_wit_3 := 
(
forall (avl_node_pre: Z) (root_cached_height_low_level_spec: Z) (before_low_level_spec: avl_model) (PreH1 : (avl_right_rotation_input before_low_level_spec avl_node_pre )) (PreH2 : (avl_node_pre <> 0)) ,
  (avl_tree_store (avl_with_root_cache (before_low_level_spec) (avl_node_pre) (root_cached_height_low_level_spec)) )
|--
  EX (after: avl_model)  (promoted: Z) ,
  “ (avl_right_rotation_input before_low_level_spec avl_node_pre ) ” 
  &&  “ (avl_right_rotation_result before_low_level_spec after avl_node_pre promoted ) ” 
  &&  “ (avl_tree_valid after ) ” 
  &&  “ (avl_tree_valid before_low_level_spec ) ” 
  &&  “ (avl_node_pre <> 0) ” 
  &&  “ (promoted <> 0) ” 
  &&  “ (promoted = (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre))))) ”
  &&  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> root_cached_height_low_level_spec)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  ((&((promoted)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (promoted)))
  **  ((&((promoted)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (promoted)))
  **  ((&((promoted)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (promoted)))))
  **  ((&((promoted)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (promoted)))))
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_left (before_low_level_spec) (promoted)))) )
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_right (before_low_level_spec) (promoted)))) )
) \/
(
forall (avl_node_pre: Z) (root_cached_height_low_level_spec: Z) (before_low_level_spec: avl_model) (PreH1 : (avl_right_rotation_input before_low_level_spec avl_node_pre )) (PreH2 : (avl_node_pre <> 0)) ,
  (avl_tree_store (avl_with_root_cache (before_low_level_spec) (avl_node_pre) (root_cached_height_low_level_spec)) )
|--
  EX (after: avl_model) ,
  “ (avl_right_rotation_input before_low_level_spec avl_node_pre ) ” 
  &&  “ (avl_right_rotation_result before_low_level_spec after avl_node_pre (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) ) ” 
  &&  “ (avl_tree_valid after ) ” 
  &&  “ (avl_tree_valid before_low_level_spec ) ” 
  &&  “ (avl_node_pre <> 0) ” 
  &&  “ ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) <> 0) ”
  &&  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> root_cached_height_low_level_spec)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  ((&(((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))))
  **  ((&(((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))))
  **  ((&(((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))))))
  **  ((&(((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))))))
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_left (before_low_level_spec) ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))))) )
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_right (before_low_level_spec) ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))))) )
).

Definition crtos_avl_right_rotate_crtos_entail_wit_4 := 
(
forall (avl_node_pre: Z) (root_cached_height_low_level_spec: Z) (before_low_level_spec: avl_model) (after: avl_model) (promoted: Z) (PreH1 : (avl_right_rotation_input before_low_level_spec avl_node_pre )) (PreH2 : (avl_right_rotation_result before_low_level_spec after avl_node_pre promoted )) (PreH3 : (avl_tree_valid after )) (PreH4 : (avl_tree_valid before_low_level_spec )) (PreH5 : (avl_node_pre <> 0)) (PreH6 : (promoted <> 0)) (PreH7 : (promoted = (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) ,
  ((&(((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))  # "AvlNode" ->ₛ "right")) # Ptr  |-> avl_node_pre)
  **  ((( &( "new_node" ) )) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> root_cached_height_low_level_spec)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  ((&((promoted)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (promoted)))
  **  ((&((promoted)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (promoted)))
  **  ((&((promoted)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (promoted)))))
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_left (before_low_level_spec) (promoted)))) )
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_right (before_low_level_spec) (promoted)))) )
|--
  “ (avl_right_rotation_input before_low_level_spec avl_node_pre ) ” 
  &&  “ (avl_right_rotation_result before_low_level_spec after avl_node_pre promoted ) ” 
  &&  “ (avl_tree_valid after ) ” 
  &&  “ (avl_tree_valid (avl_subtree_model (after) (avl_node_pre)) ) ” 
  &&  “ (avl_node_pre = (avl_ptr_of ((avl_root ((avl_subtree_model (after) (avl_node_pre))))))) ” 
  &&  “ (avl_update_height_children_safe (avl_subtree_model (after) (avl_node_pre)) avl_node_pre ) ”
  &&  ((( &( "new_node" ) )) # Ptr  |-> promoted)
  **  (avl_tree_store (avl_with_root_cache ((avl_subtree_model (after) (avl_node_pre))) (avl_node_pre) (root_cached_height_low_level_spec)) )
  **  ((&((promoted)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (promoted)))
  **  ((&((promoted)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (promoted)))
  **  ((&((promoted)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (promoted)))))
  **  ((&((promoted)  # "AvlNode" ->ₛ "right")) # Ptr  |-> avl_node_pre)
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_left (before_low_level_spec) (promoted)))) )
) \/
(
forall (avl_node_pre: Z) (root_cached_height_low_level_spec: Z) (before_low_level_spec: avl_model) (after: avl_model) (promoted: Z) (PreH1 : (root_cached_height_low_level_spec <= UINT_MAX)) (PreH2 : (root_cached_height_low_level_spec >= 0)) (PreH3 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH5 : (avl_right_rotation_input before_low_level_spec avl_node_pre )) (PreH6 : (avl_right_rotation_result before_low_level_spec after avl_node_pre promoted )) (PreH7 : (avl_tree_valid after )) (PreH8 : (avl_tree_valid before_low_level_spec )) (PreH9 : (avl_node_pre <> 0)) (PreH10 : (promoted <> 0)) (PreH11 : (promoted = (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) ,
  ((&(((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))  # "AvlNode" ->ₛ "right")) # Ptr  |-> avl_node_pre)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> root_cached_height_low_level_spec)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_left (before_low_level_spec) (promoted)))) )
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_right (before_low_level_spec) (promoted)))) )
|--
  “ (avl_update_height_children_safe (avl_subtree_model (after) (avl_node_pre)) avl_node_pre ) ” 
  &&  “ (avl_node_pre = (avl_ptr_of ((avl_root ((avl_subtree_model (after) (avl_node_pre))))))) ” 
  &&  “ (avl_tree_valid (avl_subtree_model (after) (avl_node_pre)) ) ”
  &&  (avl_tree_store (avl_with_root_cache ((avl_subtree_model (after) (avl_node_pre))) (avl_node_pre) (root_cached_height_low_level_spec)) )
  **  ((&((promoted)  # "AvlNode" ->ₛ "right")) # Ptr  |-> avl_node_pre)
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_left (before_low_level_spec) (promoted)))) )
).

Definition crtos_avl_right_rotate_crtos_entail_wit_4_split_goal_1 := 
forall (avl_node_pre: Z) (root_cached_height_low_level_spec: Z) (before_low_level_spec: avl_model) (after: avl_model) (promoted: Z) (PreH1 : (root_cached_height_low_level_spec <= UINT_MAX)) (PreH2 : (root_cached_height_low_level_spec >= 0)) (PreH3 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH5 : (avl_right_rotation_input before_low_level_spec avl_node_pre )) (PreH6 : (avl_right_rotation_result before_low_level_spec after avl_node_pre promoted )) (PreH7 : (avl_tree_valid after )) (PreH8 : (avl_tree_valid before_low_level_spec )) (PreH9 : (avl_node_pre <> 0)) (PreH10 : (promoted <> 0)) (PreH11 : (promoted = (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) ,
  ((&(((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))  # "AvlNode" ->ₛ "right")) # Ptr  |-> avl_node_pre)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> root_cached_height_low_level_spec)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_left (before_low_level_spec) (promoted)))) )
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_right (before_low_level_spec) (promoted)))) )
|--
  “ (avl_update_height_children_safe (avl_subtree_model (after) (avl_node_pre)) avl_node_pre ) ”
.

Definition crtos_avl_right_rotate_crtos_entail_wit_4_split_goal_2 := 
forall (avl_node_pre: Z) (root_cached_height_low_level_spec: Z) (before_low_level_spec: avl_model) (after: avl_model) (promoted: Z) (PreH1 : (root_cached_height_low_level_spec <= UINT_MAX)) (PreH2 : (root_cached_height_low_level_spec >= 0)) (PreH3 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH5 : (avl_right_rotation_input before_low_level_spec avl_node_pre )) (PreH6 : (avl_right_rotation_result before_low_level_spec after avl_node_pre promoted )) (PreH7 : (avl_tree_valid after )) (PreH8 : (avl_tree_valid before_low_level_spec )) (PreH9 : (avl_node_pre <> 0)) (PreH10 : (promoted <> 0)) (PreH11 : (promoted = (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) ,
  ((&(((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))  # "AvlNode" ->ₛ "right")) # Ptr  |-> avl_node_pre)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> root_cached_height_low_level_spec)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_left (before_low_level_spec) (promoted)))) )
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_right (before_low_level_spec) (promoted)))) )
|--
  “ (avl_node_pre = (avl_ptr_of ((avl_root ((avl_subtree_model (after) (avl_node_pre))))))) ”
.

Definition crtos_avl_right_rotate_crtos_entail_wit_4_split_goal_3 := 
forall (avl_node_pre: Z) (root_cached_height_low_level_spec: Z) (before_low_level_spec: avl_model) (after: avl_model) (promoted: Z) (PreH1 : (root_cached_height_low_level_spec <= UINT_MAX)) (PreH2 : (root_cached_height_low_level_spec >= 0)) (PreH3 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH5 : (avl_right_rotation_input before_low_level_spec avl_node_pre )) (PreH6 : (avl_right_rotation_result before_low_level_spec after avl_node_pre promoted )) (PreH7 : (avl_tree_valid after )) (PreH8 : (avl_tree_valid before_low_level_spec )) (PreH9 : (avl_node_pre <> 0)) (PreH10 : (promoted <> 0)) (PreH11 : (promoted = (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) ,
  ((&(((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))  # "AvlNode" ->ₛ "right")) # Ptr  |-> avl_node_pre)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> root_cached_height_low_level_spec)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_left (before_low_level_spec) (promoted)))) )
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_right (before_low_level_spec) (promoted)))) )
|--
  “ (avl_tree_valid (avl_subtree_model (after) (avl_node_pre)) ) ”
.

Definition crtos_avl_right_rotate_crtos_entail_wit_4_split_goal_spatial := 
forall (avl_node_pre: Z) (root_cached_height_low_level_spec: Z) (before_low_level_spec: avl_model) (after: avl_model) (promoted: Z) (PreH1 : (root_cached_height_low_level_spec <= UINT_MAX)) (PreH2 : (root_cached_height_low_level_spec >= 0)) (PreH3 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH5 : (avl_right_rotation_input before_low_level_spec avl_node_pre )) (PreH6 : (avl_right_rotation_result before_low_level_spec after avl_node_pre promoted )) (PreH7 : (avl_tree_valid after )) (PreH8 : (avl_tree_valid before_low_level_spec )) (PreH9 : (avl_node_pre <> 0)) (PreH10 : (promoted <> 0)) (PreH11 : (promoted = (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) ,
  ((&(((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))  # "AvlNode" ->ₛ "right")) # Ptr  |-> avl_node_pre)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> root_cached_height_low_level_spec)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_left (before_low_level_spec) (promoted)))) )
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_right (before_low_level_spec) (promoted)))) )
|--
  (avl_tree_store (avl_with_root_cache ((avl_subtree_model (after) (avl_node_pre))) (avl_node_pre) (root_cached_height_low_level_spec)) )
  **  ((&((promoted)  # "AvlNode" ->ₛ "right")) # Ptr  |-> avl_node_pre)
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_left (before_low_level_spec) (promoted)))) )
.

Definition crtos_avl_right_rotate_crtos_entail_wit_5 := 
(
forall (avl_node_pre: Z) (before_low_level_spec: avl_model) (after: avl_model) (promoted: Z) (PreH1 : (avl_right_rotation_input before_low_level_spec avl_node_pre )) (PreH2 : (avl_right_rotation_result before_low_level_spec after avl_node_pre promoted )) (PreH3 : (avl_tree_valid after )) (PreH4 : (avl_tree_valid (avl_subtree_model (after) (avl_node_pre)) )) (PreH5 : (avl_node_pre = (avl_ptr_of ((avl_root ((avl_subtree_model (after) (avl_node_pre)))))))) (PreH6 : (avl_update_height_children_safe (avl_subtree_model (after) (avl_node_pre)) avl_node_pre )) ,
  (avl_tree_store (avl_subtree_model (after) (avl_node_pre)) )
  **  ((&((promoted)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (promoted)))
  **  ((&((promoted)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (promoted)))
  **  ((&((promoted)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (promoted)))))
  **  ((&((promoted)  # "AvlNode" ->ₛ "right")) # Ptr  |-> avl_node_pre)
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_left (before_low_level_spec) (promoted)))) )
|--
  “ (avl_right_rotation_input before_low_level_spec avl_node_pre ) ” 
  &&  “ (avl_right_rotation_result before_low_level_spec after avl_node_pre promoted ) ” 
  &&  “ (avl_tree_valid after ) ” 
  &&  “ (promoted = (avl_ptr_of ((avl_root (after))))) ” 
  &&  “ (avl_update_height_children_safe after promoted ) ”
  &&  (avl_tree_store (avl_with_root_cache (after) (promoted) ((avl_height_of (before_low_level_spec) (promoted)))) )
) \/
(
forall (avl_node_pre: Z) (before_low_level_spec: avl_model) (after: avl_model) (promoted: Z) (PreH1 : ((avl_height_of (before_low_level_spec) (promoted)) <= UINT_MAX)) (PreH2 : ((avl_height_of (before_low_level_spec) (promoted)) >= 0)) (PreH3 : ((avl_key_of (before_low_level_spec) (promoted)) <= INT_MAX)) (PreH4 : ((avl_key_of (before_low_level_spec) (promoted)) >= INT_MIN)) (PreH5 : (avl_right_rotation_input before_low_level_spec avl_node_pre )) (PreH6 : (avl_right_rotation_result before_low_level_spec after avl_node_pre promoted )) (PreH7 : (avl_tree_valid after )) (PreH8 : (avl_tree_valid (avl_subtree_model (after) (avl_node_pre)) )) (PreH9 : (avl_node_pre = (avl_ptr_of ((avl_root ((avl_subtree_model (after) (avl_node_pre)))))))) (PreH10 : (avl_update_height_children_safe (avl_subtree_model (after) (avl_node_pre)) avl_node_pre )) ,
  (avl_tree_store (avl_subtree_model (after) (avl_node_pre)) )
  **  ((&((promoted)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (promoted)))
  **  ((&((promoted)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (promoted)))
  **  ((&((promoted)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (promoted)))))
  **  ((&((promoted)  # "AvlNode" ->ₛ "right")) # Ptr  |-> avl_node_pre)
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_left (before_low_level_spec) (promoted)))) )
|--
  “ (avl_update_height_children_safe after promoted ) ” 
  &&  “ (promoted = (avl_ptr_of ((avl_root (after))))) ”
  &&  (avl_tree_store (avl_with_root_cache (after) (promoted) ((avl_height_of (before_low_level_spec) (promoted)))) )
).

Definition crtos_avl_right_rotate_crtos_entail_wit_5_split_goal_1 := 
forall (avl_node_pre: Z) (before_low_level_spec: avl_model) (after: avl_model) (promoted: Z) (PreH1 : ((avl_height_of (before_low_level_spec) (promoted)) <= UINT_MAX)) (PreH2 : ((avl_height_of (before_low_level_spec) (promoted)) >= 0)) (PreH3 : ((avl_key_of (before_low_level_spec) (promoted)) <= INT_MAX)) (PreH4 : ((avl_key_of (before_low_level_spec) (promoted)) >= INT_MIN)) (PreH5 : (avl_right_rotation_input before_low_level_spec avl_node_pre )) (PreH6 : (avl_right_rotation_result before_low_level_spec after avl_node_pre promoted )) (PreH7 : (avl_tree_valid after )) (PreH8 : (avl_tree_valid (avl_subtree_model (after) (avl_node_pre)) )) (PreH9 : (avl_node_pre = (avl_ptr_of ((avl_root ((avl_subtree_model (after) (avl_node_pre)))))))) (PreH10 : (avl_update_height_children_safe (avl_subtree_model (after) (avl_node_pre)) avl_node_pre )) ,
  (avl_tree_store (avl_subtree_model (after) (avl_node_pre)) )
  **  ((&((promoted)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (promoted)))
  **  ((&((promoted)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (promoted)))
  **  ((&((promoted)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (promoted)))))
  **  ((&((promoted)  # "AvlNode" ->ₛ "right")) # Ptr  |-> avl_node_pre)
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_left (before_low_level_spec) (promoted)))) )
|--
  “ (avl_update_height_children_safe after promoted ) ”
.

Definition crtos_avl_right_rotate_crtos_entail_wit_5_split_goal_2 := 
forall (avl_node_pre: Z) (before_low_level_spec: avl_model) (after: avl_model) (promoted: Z) (PreH1 : ((avl_height_of (before_low_level_spec) (promoted)) <= UINT_MAX)) (PreH2 : ((avl_height_of (before_low_level_spec) (promoted)) >= 0)) (PreH3 : ((avl_key_of (before_low_level_spec) (promoted)) <= INT_MAX)) (PreH4 : ((avl_key_of (before_low_level_spec) (promoted)) >= INT_MIN)) (PreH5 : (avl_right_rotation_input before_low_level_spec avl_node_pre )) (PreH6 : (avl_right_rotation_result before_low_level_spec after avl_node_pre promoted )) (PreH7 : (avl_tree_valid after )) (PreH8 : (avl_tree_valid (avl_subtree_model (after) (avl_node_pre)) )) (PreH9 : (avl_node_pre = (avl_ptr_of ((avl_root ((avl_subtree_model (after) (avl_node_pre)))))))) (PreH10 : (avl_update_height_children_safe (avl_subtree_model (after) (avl_node_pre)) avl_node_pre )) ,
  (avl_tree_store (avl_subtree_model (after) (avl_node_pre)) )
  **  ((&((promoted)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (promoted)))
  **  ((&((promoted)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (promoted)))
  **  ((&((promoted)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (promoted)))))
  **  ((&((promoted)  # "AvlNode" ->ₛ "right")) # Ptr  |-> avl_node_pre)
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_left (before_low_level_spec) (promoted)))) )
|--
  “ (promoted = (avl_ptr_of ((avl_root (after))))) ”
.

Definition crtos_avl_right_rotate_crtos_entail_wit_5_split_goal_spatial := 
forall (avl_node_pre: Z) (before_low_level_spec: avl_model) (after: avl_model) (promoted: Z) (PreH1 : ((avl_height_of (before_low_level_spec) (promoted)) <= UINT_MAX)) (PreH2 : ((avl_height_of (before_low_level_spec) (promoted)) >= 0)) (PreH3 : ((avl_key_of (before_low_level_spec) (promoted)) <= INT_MAX)) (PreH4 : ((avl_key_of (before_low_level_spec) (promoted)) >= INT_MIN)) (PreH5 : (avl_right_rotation_input before_low_level_spec avl_node_pre )) (PreH6 : (avl_right_rotation_result before_low_level_spec after avl_node_pre promoted )) (PreH7 : (avl_tree_valid after )) (PreH8 : (avl_tree_valid (avl_subtree_model (after) (avl_node_pre)) )) (PreH9 : (avl_node_pre = (avl_ptr_of ((avl_root ((avl_subtree_model (after) (avl_node_pre)))))))) (PreH10 : (avl_update_height_children_safe (avl_subtree_model (after) (avl_node_pre)) avl_node_pre )) ,
  (avl_tree_store (avl_subtree_model (after) (avl_node_pre)) )
  **  ((&((promoted)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (promoted)))
  **  ((&((promoted)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (promoted)))
  **  ((&((promoted)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (promoted)))))
  **  ((&((promoted)  # "AvlNode" ->ₛ "right")) # Ptr  |-> avl_node_pre)
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_left (before_low_level_spec) (promoted)))) )
|--
  (avl_tree_store (avl_with_root_cache (after) (promoted) ((avl_height_of (before_low_level_spec) (promoted)))) )
.

Definition crtos_avl_right_rotate_crtos_return_wit_1 := 
(
forall (avl_node_pre: Z) (before_low_level_spec: avl_model) (after: avl_model) (promoted: Z) (PreH1 : (avl_right_rotation_input before_low_level_spec avl_node_pre )) (PreH2 : (avl_right_rotation_result before_low_level_spec after avl_node_pre promoted )) (PreH3 : (avl_tree_valid after )) (PreH4 : (promoted = (avl_ptr_of ((avl_root (after)))))) (PreH5 : (avl_update_height_children_safe after promoted )) ,
  (avl_tree_store after )
|--
  (avl_right_rotation_post before_low_level_spec avl_node_pre promoted )
) \/
(
forall (avl_node_pre: Z) (before_low_level_spec: avl_model) (after: avl_model) (promoted: Z) (PreH1 : (avl_right_rotation_input before_low_level_spec avl_node_pre )) (PreH2 : (avl_right_rotation_result before_low_level_spec after avl_node_pre promoted )) (PreH3 : (avl_tree_valid after )) (PreH4 : (promoted = (avl_ptr_of ((avl_root (after)))))) (PreH5 : (avl_update_height_children_safe after promoted )) ,
  (avl_tree_store after )
|--
  (avl_right_rotation_post before_low_level_spec avl_node_pre promoted )
).

Definition crtos_avl_right_rotate_crtos_return_wit_1_split_goal_spatial := 
forall (avl_node_pre: Z) (before_low_level_spec: avl_model) (after: avl_model) (promoted: Z) (PreH1 : (avl_right_rotation_input before_low_level_spec avl_node_pre )) (PreH2 : (avl_right_rotation_result before_low_level_spec after avl_node_pre promoted )) (PreH3 : (avl_tree_valid after )) (PreH4 : (promoted = (avl_ptr_of ((avl_root (after)))))) (PreH5 : (avl_update_height_children_safe after promoted )) ,
  (avl_tree_store after )
|--
  (avl_right_rotation_post before_low_level_spec avl_node_pre promoted )
.

Definition crtos_avl_right_rotate_crtos_partial_solve_wit_1 := 
forall (avl_node_pre: Z) (root_cached_height_low_level_spec: Z) (before_low_level_spec: avl_model) (after: avl_model) (promoted: Z) (PreH1 : (avl_right_rotation_input before_low_level_spec avl_node_pre )) (PreH2 : (avl_right_rotation_result before_low_level_spec after avl_node_pre promoted )) (PreH3 : (avl_tree_valid after )) (PreH4 : (avl_tree_valid before_low_level_spec )) (PreH5 : (avl_node_pre <> 0)) (PreH6 : (promoted <> 0)) (PreH7 : (promoted = (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> root_cached_height_low_level_spec)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  ((&((promoted)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (promoted)))
  **  ((&((promoted)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (promoted)))
  **  ((&((promoted)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (promoted)))))
  **  ((&((promoted)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (promoted)))))
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_left (before_low_level_spec) (promoted)))) )
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_right (before_low_level_spec) (promoted)))) )
|--
  “ (avl_right_rotation_input before_low_level_spec avl_node_pre ) ” 
  &&  “ (avl_right_rotation_result before_low_level_spec after avl_node_pre promoted ) ” 
  &&  “ (avl_tree_valid after ) ” 
  &&  “ (avl_tree_valid before_low_level_spec ) ” 
  &&  “ (avl_node_pre <> 0) ” 
  &&  “ (promoted <> 0) ” 
  &&  “ (promoted = (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre))))) ”
  &&  ((&(((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> root_cached_height_low_level_spec)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  ((&((promoted)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (promoted)))
  **  ((&((promoted)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (promoted)))
  **  ((&((promoted)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (promoted)))))
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_left (before_low_level_spec) (promoted)))) )
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_right (before_low_level_spec) (promoted)))) )
.

Definition crtos_avl_right_rotate_crtos_partial_solve_wit_2_pure := 
forall (avl_node_pre: Z) (root_cached_height_low_level_spec: Z) (before_low_level_spec: avl_model) (after: avl_model) (promoted: Z) (PreH1 : (avl_right_rotation_input before_low_level_spec avl_node_pre )) (PreH2 : (avl_right_rotation_result before_low_level_spec after avl_node_pre promoted )) (PreH3 : (avl_tree_valid after )) (PreH4 : (avl_tree_valid (avl_subtree_model (after) (avl_node_pre)) )) (PreH5 : (avl_node_pre = (avl_ptr_of ((avl_root ((avl_subtree_model (after) (avl_node_pre)))))))) (PreH6 : (avl_update_height_children_safe (avl_subtree_model (after) (avl_node_pre)) avl_node_pre )) ,
  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "new_node" ) )) # Ptr  |-> promoted)
  **  (avl_tree_store (avl_with_root_cache ((avl_subtree_model (after) (avl_node_pre))) (avl_node_pre) (root_cached_height_low_level_spec)) )
  **  ((&((promoted)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (promoted)))
  **  ((&((promoted)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (promoted)))
  **  ((&((promoted)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (promoted)))))
  **  ((&((promoted)  # "AvlNode" ->ₛ "right")) # Ptr  |-> avl_node_pre)
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_left (before_low_level_spec) (promoted)))) )
|--
  “ (avl_tree_valid (avl_subtree_model (after) (avl_node_pre)) ) ” 
  &&  “ (avl_node_pre = (avl_ptr_of ((avl_root ((avl_subtree_model (after) (avl_node_pre))))))) ” 
  &&  “ (avl_update_height_children_safe (avl_subtree_model (after) (avl_node_pre)) avl_node_pre ) ”
.

Definition crtos_avl_right_rotate_crtos_partial_solve_wit_2_aux := 
forall (avl_node_pre: Z) (root_cached_height_low_level_spec: Z) (before_low_level_spec: avl_model) (after: avl_model) (promoted: Z) (PreH1 : (avl_right_rotation_input before_low_level_spec avl_node_pre )) (PreH2 : (avl_right_rotation_result before_low_level_spec after avl_node_pre promoted )) (PreH3 : (avl_tree_valid after )) (PreH4 : (avl_tree_valid (avl_subtree_model (after) (avl_node_pre)) )) (PreH5 : (avl_node_pre = (avl_ptr_of ((avl_root ((avl_subtree_model (after) (avl_node_pre)))))))) (PreH6 : (avl_update_height_children_safe (avl_subtree_model (after) (avl_node_pre)) avl_node_pre )) ,
  (avl_tree_store (avl_with_root_cache ((avl_subtree_model (after) (avl_node_pre))) (avl_node_pre) (root_cached_height_low_level_spec)) )
  **  ((&((promoted)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (promoted)))
  **  ((&((promoted)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (promoted)))
  **  ((&((promoted)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (promoted)))))
  **  ((&((promoted)  # "AvlNode" ->ₛ "right")) # Ptr  |-> avl_node_pre)
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_left (before_low_level_spec) (promoted)))) )
|--
  “ (avl_tree_valid (avl_subtree_model (after) (avl_node_pre)) ) ” 
  &&  “ (avl_node_pre = (avl_ptr_of ((avl_root ((avl_subtree_model (after) (avl_node_pre))))))) ” 
  &&  “ (avl_update_height_children_safe (avl_subtree_model (after) (avl_node_pre)) avl_node_pre ) ” 
  &&  “ (avl_right_rotation_input before_low_level_spec avl_node_pre ) ” 
  &&  “ (avl_right_rotation_result before_low_level_spec after avl_node_pre promoted ) ” 
  &&  “ (avl_tree_valid after ) ” 
  &&  “ (avl_tree_valid (avl_subtree_model (after) (avl_node_pre)) ) ” 
  &&  “ (avl_node_pre = (avl_ptr_of ((avl_root ((avl_subtree_model (after) (avl_node_pre))))))) ” 
  &&  “ (avl_update_height_children_safe (avl_subtree_model (after) (avl_node_pre)) avl_node_pre ) ”
  &&  (avl_tree_store (avl_with_root_cache ((avl_subtree_model (after) (avl_node_pre))) (avl_node_pre) (root_cached_height_low_level_spec)) )
  **  ((&((promoted)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (promoted)))
  **  ((&((promoted)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (promoted)))
  **  ((&((promoted)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (promoted)))))
  **  ((&((promoted)  # "AvlNode" ->ₛ "right")) # Ptr  |-> avl_node_pre)
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_left (before_low_level_spec) (promoted)))) )
.

Definition crtos_avl_right_rotate_crtos_partial_solve_wit_2 := crtos_avl_right_rotate_crtos_partial_solve_wit_2_pure -> crtos_avl_right_rotate_crtos_partial_solve_wit_2_aux.

Definition crtos_avl_right_rotate_crtos_partial_solve_wit_3_pure := 
forall (avl_node_pre: Z) (before_low_level_spec: avl_model) (after: avl_model) (promoted: Z) (PreH1 : (avl_right_rotation_input before_low_level_spec avl_node_pre )) (PreH2 : (avl_right_rotation_result before_low_level_spec after avl_node_pre promoted )) (PreH3 : (avl_tree_valid after )) (PreH4 : (promoted = (avl_ptr_of ((avl_root (after)))))) (PreH5 : (avl_update_height_children_safe after promoted )) ,
  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "new_node" ) )) # Ptr  |-> promoted)
  **  (avl_tree_store (avl_with_root_cache (after) (promoted) ((avl_height_of (before_low_level_spec) (promoted)))) )
|--
  “ (avl_tree_valid after ) ” 
  &&  “ (promoted = (avl_ptr_of ((avl_root (after))))) ” 
  &&  “ (avl_update_height_children_safe after promoted ) ”
.

Definition crtos_avl_right_rotate_crtos_partial_solve_wit_3_aux := 
forall (avl_node_pre: Z) (before_low_level_spec: avl_model) (after: avl_model) (promoted: Z) (PreH1 : (avl_right_rotation_input before_low_level_spec avl_node_pre )) (PreH2 : (avl_right_rotation_result before_low_level_spec after avl_node_pre promoted )) (PreH3 : (avl_tree_valid after )) (PreH4 : (promoted = (avl_ptr_of ((avl_root (after)))))) (PreH5 : (avl_update_height_children_safe after promoted )) ,
  (avl_tree_store (avl_with_root_cache (after) (promoted) ((avl_height_of (before_low_level_spec) (promoted)))) )
|--
  “ (avl_tree_valid after ) ” 
  &&  “ (promoted = (avl_ptr_of ((avl_root (after))))) ” 
  &&  “ (avl_update_height_children_safe after promoted ) ” 
  &&  “ (avl_right_rotation_input before_low_level_spec avl_node_pre ) ” 
  &&  “ (avl_right_rotation_result before_low_level_spec after avl_node_pre promoted ) ” 
  &&  “ (avl_tree_valid after ) ” 
  &&  “ (promoted = (avl_ptr_of ((avl_root (after))))) ” 
  &&  “ (avl_update_height_children_safe after promoted ) ”
  &&  (avl_tree_store (avl_with_root_cache (after) (promoted) ((avl_height_of (before_low_level_spec) (promoted)))) )
.

Definition crtos_avl_right_rotate_crtos_partial_solve_wit_3 := crtos_avl_right_rotate_crtos_partial_solve_wit_3_pure -> crtos_avl_right_rotate_crtos_partial_solve_wit_3_aux.

(*----- Function crtos_avl_left_rotate_crtos -----*)

Definition crtos_avl_left_rotate_crtos_safety_wit_1 := 
forall (avl_node_pre: Z) (root_cached_height_low_level_spec: Z) (before_low_level_spec: avl_model) (PreH1 : (avl_left_rotation_cached_input before_low_level_spec avl_node_pre )) (PreH2 : (avl_node_pre <> 0)) ,
  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  (avl_tree_store (avl_with_root_cache (before_low_level_spec) (avl_node_pre) (root_cached_height_low_level_spec)) )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition crtos_avl_left_rotate_crtos_safety_wit_2 := 
forall (avl_node_pre: Z) (root_cached_height_low_level_spec: Z) (before_low_level_spec: avl_model) (PreH1 : (avl_node_pre = 0)) (PreH2 : (avl_left_rotation_cached_input before_low_level_spec avl_node_pre )) (PreH3 : (avl_node_pre <> 0)) ,
  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  (avl_tree_store (avl_with_root_cache (before_low_level_spec) (avl_node_pre) (root_cached_height_low_level_spec)) )
|--
  “ False ”
.

Definition crtos_avl_left_rotate_crtos_safety_wit_3 := 
forall (avl_node_pre: Z) (root_cached_height_low_level_spec: Z) (before_low_level_spec: avl_model) (PreH1 : (avl_left_rotation_cached_input before_low_level_spec avl_node_pre )) (PreH2 : (avl_node_pre <> 0)) ,
  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  (avl_tree_store (avl_with_root_cache (before_low_level_spec) (avl_node_pre) (root_cached_height_low_level_spec)) )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition crtos_avl_left_rotate_crtos_entail_wit_1 := 
(
forall (avl_node_pre: Z) (root_cached_height_low_level_spec: Z) (before_low_level_spec: avl_model) (PreH1 : (avl_left_rotation_cached_input before_low_level_spec avl_node_pre )) ,
  (avl_tree_store (avl_with_root_cache (before_low_level_spec) (avl_node_pre) (root_cached_height_low_level_spec)) )
|--
  “ (avl_left_rotation_cached_input before_low_level_spec avl_node_pre ) ” 
  &&  “ (avl_node_pre <> 0) ”
  &&  (avl_tree_store (avl_with_root_cache (before_low_level_spec) (avl_node_pre) (root_cached_height_low_level_spec)) )
) \/
(
forall (avl_node_pre: Z) (before_low_level_spec: avl_model) (PreH1 : (avl_left_rotation_cached_input before_low_level_spec avl_node_pre )) ,
  TT && emp 
|--
  “ (avl_node_pre <> 0) ”
  &&  emp
).

Definition crtos_avl_left_rotate_crtos_entail_wit_1_split_goal_1 := 
forall (avl_node_pre: Z) (before_low_level_spec: avl_model) (PreH1 : (avl_left_rotation_cached_input before_low_level_spec avl_node_pre )) ,
  (avl_node_pre <> 0)
.

Definition crtos_avl_left_rotate_crtos_entail_wit_2 := 
forall (avl_node_pre: Z) (root_cached_height_low_level_spec: Z) (before_low_level_spec: avl_model) (PreH1 : (avl_node_pre <> 0)) (PreH2 : (avl_left_rotation_cached_input before_low_level_spec avl_node_pre )) (PreH3 : (avl_node_pre <> 0)) ,
  (avl_tree_store (avl_with_root_cache (before_low_level_spec) (avl_node_pre) (root_cached_height_low_level_spec)) )
|--
  “ (avl_left_rotation_cached_input before_low_level_spec avl_node_pre ) ” 
  &&  “ (avl_node_pre <> 0) ”
  &&  (avl_tree_store (avl_with_root_cache (before_low_level_spec) (avl_node_pre) (root_cached_height_low_level_spec)) )
.

Definition crtos_avl_left_rotate_crtos_entail_wit_3 := 
(
forall (avl_node_pre: Z) (root_cached_height_low_level_spec: Z) (before_low_level_spec: avl_model) (PreH1 : (avl_left_rotation_cached_input before_low_level_spec avl_node_pre )) (PreH2 : (avl_node_pre <> 0)) ,
  (avl_tree_store (avl_with_root_cache (before_low_level_spec) (avl_node_pre) (root_cached_height_low_level_spec)) )
|--
  EX (after: avl_model)  (promoted: Z) ,
  “ (avl_left_rotation_cached_input before_low_level_spec avl_node_pre ) ” 
  &&  “ (avl_left_rotation_result before_low_level_spec after avl_node_pre promoted ) ” 
  &&  “ (avl_tree_valid after ) ” 
  &&  “ (avl_tree_valid before_low_level_spec ) ” 
  &&  “ (avl_node_pre <> 0) ” 
  &&  “ (promoted <> 0) ” 
  &&  “ (promoted = (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre))))) ”
  &&  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> root_cached_height_low_level_spec)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  ((&((promoted)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (promoted)))
  **  ((&((promoted)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (promoted)))
  **  ((&((promoted)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (promoted)))))
  **  ((&((promoted)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (promoted)))))
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_left (before_low_level_spec) (promoted)))) )
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_right (before_low_level_spec) (promoted)))) )
) \/
(
forall (avl_node_pre: Z) (root_cached_height_low_level_spec: Z) (before_low_level_spec: avl_model) (PreH1 : (avl_left_rotation_cached_input before_low_level_spec avl_node_pre )) (PreH2 : (avl_node_pre <> 0)) ,
  (avl_tree_store (avl_with_root_cache (before_low_level_spec) (avl_node_pre) (root_cached_height_low_level_spec)) )
|--
  EX (after: avl_model) ,
  “ (avl_left_rotation_cached_input before_low_level_spec avl_node_pre ) ” 
  &&  “ (avl_left_rotation_result before_low_level_spec after avl_node_pre (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) ) ” 
  &&  “ (avl_tree_valid after ) ” 
  &&  “ (avl_tree_valid before_low_level_spec ) ” 
  &&  “ (avl_node_pre <> 0) ” 
  &&  “ ((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) <> 0) ”
  &&  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> root_cached_height_low_level_spec)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  ((&(((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) ((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))))
  **  ((&(((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) ((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))))
  **  ((&(((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) ((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))))))
  **  ((&(((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) ((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))))))
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_left (before_low_level_spec) ((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))))) )
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_right (before_low_level_spec) ((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))))) )
).

Definition crtos_avl_left_rotate_crtos_entail_wit_4 := 
(
forall (avl_node_pre: Z) (root_cached_height_low_level_spec: Z) (before_low_level_spec: avl_model) (after: avl_model) (promoted: Z) (PreH1 : (avl_left_rotation_cached_input before_low_level_spec avl_node_pre )) (PreH2 : (avl_left_rotation_result before_low_level_spec after avl_node_pre promoted )) (PreH3 : (avl_tree_valid after )) (PreH4 : (avl_tree_valid before_low_level_spec )) (PreH5 : (avl_node_pre <> 0)) (PreH6 : (promoted <> 0)) (PreH7 : (promoted = (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))) ,
  ((&(((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))  # "AvlNode" ->ₛ "left")) # Ptr  |-> avl_node_pre)
  **  ((( &( "new_node" ) )) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> root_cached_height_low_level_spec)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) ((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))))))
  **  ((&((promoted)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (promoted)))
  **  ((&((promoted)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (promoted)))
  **  ((&((promoted)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (promoted)))))
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_left (before_low_level_spec) (promoted)))) )
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_right (before_low_level_spec) (promoted)))) )
|--
  “ (avl_left_rotation_cached_input before_low_level_spec avl_node_pre ) ” 
  &&  “ (avl_left_rotation_result before_low_level_spec after avl_node_pre promoted ) ” 
  &&  “ (avl_tree_valid after ) ” 
  &&  “ (avl_tree_valid (avl_subtree_model (after) (avl_node_pre)) ) ” 
  &&  “ (avl_node_pre = (avl_ptr_of ((avl_root ((avl_subtree_model (after) (avl_node_pre))))))) ” 
  &&  “ (avl_update_height_children_safe (avl_subtree_model (after) (avl_node_pre)) avl_node_pre ) ”
  &&  ((( &( "new_node" ) )) # Ptr  |-> promoted)
  **  (avl_tree_store (avl_with_root_cache ((avl_subtree_model (after) (avl_node_pre))) (avl_node_pre) (root_cached_height_low_level_spec)) )
  **  ((&((promoted)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (promoted)))
  **  ((&((promoted)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (promoted)))
  **  ((&((promoted)  # "AvlNode" ->ₛ "left")) # Ptr  |-> avl_node_pre)
  **  ((&((promoted)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (promoted)))))
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_right (before_low_level_spec) (promoted)))) )
) \/
(
forall (avl_node_pre: Z) (root_cached_height_low_level_spec: Z) (before_low_level_spec: avl_model) (after: avl_model) (promoted: Z) (PreH1 : (root_cached_height_low_level_spec <= UINT_MAX)) (PreH2 : (root_cached_height_low_level_spec >= 0)) (PreH3 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH5 : (avl_left_rotation_cached_input before_low_level_spec avl_node_pre )) (PreH6 : (avl_left_rotation_result before_low_level_spec after avl_node_pre promoted )) (PreH7 : (avl_tree_valid after )) (PreH8 : (avl_tree_valid before_low_level_spec )) (PreH9 : (avl_node_pre <> 0)) (PreH10 : (promoted <> 0)) (PreH11 : (promoted = (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))) ,
  ((&(((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))  # "AvlNode" ->ₛ "left")) # Ptr  |-> avl_node_pre)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> root_cached_height_low_level_spec)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) ((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))))))
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_left (before_low_level_spec) (promoted)))) )
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_right (before_low_level_spec) (promoted)))) )
|--
  “ (avl_update_height_children_safe (avl_subtree_model (after) (avl_node_pre)) avl_node_pre ) ” 
  &&  “ (avl_node_pre = (avl_ptr_of ((avl_root ((avl_subtree_model (after) (avl_node_pre))))))) ” 
  &&  “ (avl_tree_valid (avl_subtree_model (after) (avl_node_pre)) ) ”
  &&  (avl_tree_store (avl_with_root_cache ((avl_subtree_model (after) (avl_node_pre))) (avl_node_pre) (root_cached_height_low_level_spec)) )
  **  ((&((promoted)  # "AvlNode" ->ₛ "left")) # Ptr  |-> avl_node_pre)
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_right (before_low_level_spec) (promoted)))) )
).

Definition crtos_avl_left_rotate_crtos_entail_wit_4_split_goal_1 := 
forall (avl_node_pre: Z) (root_cached_height_low_level_spec: Z) (before_low_level_spec: avl_model) (after: avl_model) (promoted: Z) (PreH1 : (root_cached_height_low_level_spec <= UINT_MAX)) (PreH2 : (root_cached_height_low_level_spec >= 0)) (PreH3 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH5 : (avl_left_rotation_cached_input before_low_level_spec avl_node_pre )) (PreH6 : (avl_left_rotation_result before_low_level_spec after avl_node_pre promoted )) (PreH7 : (avl_tree_valid after )) (PreH8 : (avl_tree_valid before_low_level_spec )) (PreH9 : (avl_node_pre <> 0)) (PreH10 : (promoted <> 0)) (PreH11 : (promoted = (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))) ,
  ((&(((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))  # "AvlNode" ->ₛ "left")) # Ptr  |-> avl_node_pre)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> root_cached_height_low_level_spec)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) ((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))))))
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_left (before_low_level_spec) (promoted)))) )
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_right (before_low_level_spec) (promoted)))) )
|--
  “ (avl_update_height_children_safe (avl_subtree_model (after) (avl_node_pre)) avl_node_pre ) ”
.

Definition crtos_avl_left_rotate_crtos_entail_wit_4_split_goal_2 := 
forall (avl_node_pre: Z) (root_cached_height_low_level_spec: Z) (before_low_level_spec: avl_model) (after: avl_model) (promoted: Z) (PreH1 : (root_cached_height_low_level_spec <= UINT_MAX)) (PreH2 : (root_cached_height_low_level_spec >= 0)) (PreH3 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH5 : (avl_left_rotation_cached_input before_low_level_spec avl_node_pre )) (PreH6 : (avl_left_rotation_result before_low_level_spec after avl_node_pre promoted )) (PreH7 : (avl_tree_valid after )) (PreH8 : (avl_tree_valid before_low_level_spec )) (PreH9 : (avl_node_pre <> 0)) (PreH10 : (promoted <> 0)) (PreH11 : (promoted = (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))) ,
  ((&(((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))  # "AvlNode" ->ₛ "left")) # Ptr  |-> avl_node_pre)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> root_cached_height_low_level_spec)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) ((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))))))
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_left (before_low_level_spec) (promoted)))) )
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_right (before_low_level_spec) (promoted)))) )
|--
  “ (avl_node_pre = (avl_ptr_of ((avl_root ((avl_subtree_model (after) (avl_node_pre))))))) ”
.

Definition crtos_avl_left_rotate_crtos_entail_wit_4_split_goal_3 := 
forall (avl_node_pre: Z) (root_cached_height_low_level_spec: Z) (before_low_level_spec: avl_model) (after: avl_model) (promoted: Z) (PreH1 : (root_cached_height_low_level_spec <= UINT_MAX)) (PreH2 : (root_cached_height_low_level_spec >= 0)) (PreH3 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH5 : (avl_left_rotation_cached_input before_low_level_spec avl_node_pre )) (PreH6 : (avl_left_rotation_result before_low_level_spec after avl_node_pre promoted )) (PreH7 : (avl_tree_valid after )) (PreH8 : (avl_tree_valid before_low_level_spec )) (PreH9 : (avl_node_pre <> 0)) (PreH10 : (promoted <> 0)) (PreH11 : (promoted = (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))) ,
  ((&(((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))  # "AvlNode" ->ₛ "left")) # Ptr  |-> avl_node_pre)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> root_cached_height_low_level_spec)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) ((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))))))
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_left (before_low_level_spec) (promoted)))) )
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_right (before_low_level_spec) (promoted)))) )
|--
  “ (avl_tree_valid (avl_subtree_model (after) (avl_node_pre)) ) ”
.

Definition crtos_avl_left_rotate_crtos_entail_wit_4_split_goal_spatial := 
forall (avl_node_pre: Z) (root_cached_height_low_level_spec: Z) (before_low_level_spec: avl_model) (after: avl_model) (promoted: Z) (PreH1 : (root_cached_height_low_level_spec <= UINT_MAX)) (PreH2 : (root_cached_height_low_level_spec >= 0)) (PreH3 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH5 : (avl_left_rotation_cached_input before_low_level_spec avl_node_pre )) (PreH6 : (avl_left_rotation_result before_low_level_spec after avl_node_pre promoted )) (PreH7 : (avl_tree_valid after )) (PreH8 : (avl_tree_valid before_low_level_spec )) (PreH9 : (avl_node_pre <> 0)) (PreH10 : (promoted <> 0)) (PreH11 : (promoted = (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))) ,
  ((&(((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))  # "AvlNode" ->ₛ "left")) # Ptr  |-> avl_node_pre)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> root_cached_height_low_level_spec)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) ((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))))))
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_left (before_low_level_spec) (promoted)))) )
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_right (before_low_level_spec) (promoted)))) )
|--
  (avl_tree_store (avl_with_root_cache ((avl_subtree_model (after) (avl_node_pre))) (avl_node_pre) (root_cached_height_low_level_spec)) )
  **  ((&((promoted)  # "AvlNode" ->ₛ "left")) # Ptr  |-> avl_node_pre)
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_right (before_low_level_spec) (promoted)))) )
.

Definition crtos_avl_left_rotate_crtos_entail_wit_5 := 
(
forall (avl_node_pre: Z) (before_low_level_spec: avl_model) (after: avl_model) (promoted: Z) (PreH1 : (avl_left_rotation_cached_input before_low_level_spec avl_node_pre )) (PreH2 : (avl_left_rotation_result before_low_level_spec after avl_node_pre promoted )) (PreH3 : (avl_tree_valid after )) (PreH4 : (avl_tree_valid (avl_subtree_model (after) (avl_node_pre)) )) (PreH5 : (avl_node_pre = (avl_ptr_of ((avl_root ((avl_subtree_model (after) (avl_node_pre)))))))) (PreH6 : (avl_update_height_children_safe (avl_subtree_model (after) (avl_node_pre)) avl_node_pre )) ,
  (avl_tree_store (avl_subtree_model (after) (avl_node_pre)) )
  **  ((&((promoted)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (promoted)))
  **  ((&((promoted)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (promoted)))
  **  ((&((promoted)  # "AvlNode" ->ₛ "left")) # Ptr  |-> avl_node_pre)
  **  ((&((promoted)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (promoted)))))
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_right (before_low_level_spec) (promoted)))) )
|--
  “ (avl_left_rotation_cached_input before_low_level_spec avl_node_pre ) ” 
  &&  “ (avl_left_rotation_result before_low_level_spec after avl_node_pre promoted ) ” 
  &&  “ (avl_tree_valid after ) ” 
  &&  “ (promoted = (avl_ptr_of ((avl_root (after))))) ” 
  &&  “ (avl_update_height_children_safe after promoted ) ”
  &&  (avl_tree_store (avl_with_root_cache (after) (promoted) ((avl_height_of (before_low_level_spec) (promoted)))) )
) \/
(
forall (avl_node_pre: Z) (before_low_level_spec: avl_model) (after: avl_model) (promoted: Z) (PreH1 : ((avl_height_of (before_low_level_spec) (promoted)) <= UINT_MAX)) (PreH2 : ((avl_height_of (before_low_level_spec) (promoted)) >= 0)) (PreH3 : ((avl_key_of (before_low_level_spec) (promoted)) <= INT_MAX)) (PreH4 : ((avl_key_of (before_low_level_spec) (promoted)) >= INT_MIN)) (PreH5 : (avl_left_rotation_cached_input before_low_level_spec avl_node_pre )) (PreH6 : (avl_left_rotation_result before_low_level_spec after avl_node_pre promoted )) (PreH7 : (avl_tree_valid after )) (PreH8 : (avl_tree_valid (avl_subtree_model (after) (avl_node_pre)) )) (PreH9 : (avl_node_pre = (avl_ptr_of ((avl_root ((avl_subtree_model (after) (avl_node_pre)))))))) (PreH10 : (avl_update_height_children_safe (avl_subtree_model (after) (avl_node_pre)) avl_node_pre )) ,
  (avl_tree_store (avl_subtree_model (after) (avl_node_pre)) )
  **  ((&((promoted)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (promoted)))
  **  ((&((promoted)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (promoted)))
  **  ((&((promoted)  # "AvlNode" ->ₛ "left")) # Ptr  |-> avl_node_pre)
  **  ((&((promoted)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (promoted)))))
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_right (before_low_level_spec) (promoted)))) )
|--
  “ (avl_update_height_children_safe after promoted ) ” 
  &&  “ (promoted = (avl_ptr_of ((avl_root (after))))) ”
  &&  (avl_tree_store (avl_with_root_cache (after) (promoted) ((avl_height_of (before_low_level_spec) (promoted)))) )
).

Definition crtos_avl_left_rotate_crtos_entail_wit_5_split_goal_1 := 
forall (avl_node_pre: Z) (before_low_level_spec: avl_model) (after: avl_model) (promoted: Z) (PreH1 : ((avl_height_of (before_low_level_spec) (promoted)) <= UINT_MAX)) (PreH2 : ((avl_height_of (before_low_level_spec) (promoted)) >= 0)) (PreH3 : ((avl_key_of (before_low_level_spec) (promoted)) <= INT_MAX)) (PreH4 : ((avl_key_of (before_low_level_spec) (promoted)) >= INT_MIN)) (PreH5 : (avl_left_rotation_cached_input before_low_level_spec avl_node_pre )) (PreH6 : (avl_left_rotation_result before_low_level_spec after avl_node_pre promoted )) (PreH7 : (avl_tree_valid after )) (PreH8 : (avl_tree_valid (avl_subtree_model (after) (avl_node_pre)) )) (PreH9 : (avl_node_pre = (avl_ptr_of ((avl_root ((avl_subtree_model (after) (avl_node_pre)))))))) (PreH10 : (avl_update_height_children_safe (avl_subtree_model (after) (avl_node_pre)) avl_node_pre )) ,
  (avl_tree_store (avl_subtree_model (after) (avl_node_pre)) )
  **  ((&((promoted)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (promoted)))
  **  ((&((promoted)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (promoted)))
  **  ((&((promoted)  # "AvlNode" ->ₛ "left")) # Ptr  |-> avl_node_pre)
  **  ((&((promoted)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (promoted)))))
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_right (before_low_level_spec) (promoted)))) )
|--
  “ (avl_update_height_children_safe after promoted ) ”
.

Definition crtos_avl_left_rotate_crtos_entail_wit_5_split_goal_2 := 
forall (avl_node_pre: Z) (before_low_level_spec: avl_model) (after: avl_model) (promoted: Z) (PreH1 : ((avl_height_of (before_low_level_spec) (promoted)) <= UINT_MAX)) (PreH2 : ((avl_height_of (before_low_level_spec) (promoted)) >= 0)) (PreH3 : ((avl_key_of (before_low_level_spec) (promoted)) <= INT_MAX)) (PreH4 : ((avl_key_of (before_low_level_spec) (promoted)) >= INT_MIN)) (PreH5 : (avl_left_rotation_cached_input before_low_level_spec avl_node_pre )) (PreH6 : (avl_left_rotation_result before_low_level_spec after avl_node_pre promoted )) (PreH7 : (avl_tree_valid after )) (PreH8 : (avl_tree_valid (avl_subtree_model (after) (avl_node_pre)) )) (PreH9 : (avl_node_pre = (avl_ptr_of ((avl_root ((avl_subtree_model (after) (avl_node_pre)))))))) (PreH10 : (avl_update_height_children_safe (avl_subtree_model (after) (avl_node_pre)) avl_node_pre )) ,
  (avl_tree_store (avl_subtree_model (after) (avl_node_pre)) )
  **  ((&((promoted)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (promoted)))
  **  ((&((promoted)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (promoted)))
  **  ((&((promoted)  # "AvlNode" ->ₛ "left")) # Ptr  |-> avl_node_pre)
  **  ((&((promoted)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (promoted)))))
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_right (before_low_level_spec) (promoted)))) )
|--
  “ (promoted = (avl_ptr_of ((avl_root (after))))) ”
.

Definition crtos_avl_left_rotate_crtos_entail_wit_5_split_goal_spatial := 
forall (avl_node_pre: Z) (before_low_level_spec: avl_model) (after: avl_model) (promoted: Z) (PreH1 : ((avl_height_of (before_low_level_spec) (promoted)) <= UINT_MAX)) (PreH2 : ((avl_height_of (before_low_level_spec) (promoted)) >= 0)) (PreH3 : ((avl_key_of (before_low_level_spec) (promoted)) <= INT_MAX)) (PreH4 : ((avl_key_of (before_low_level_spec) (promoted)) >= INT_MIN)) (PreH5 : (avl_left_rotation_cached_input before_low_level_spec avl_node_pre )) (PreH6 : (avl_left_rotation_result before_low_level_spec after avl_node_pre promoted )) (PreH7 : (avl_tree_valid after )) (PreH8 : (avl_tree_valid (avl_subtree_model (after) (avl_node_pre)) )) (PreH9 : (avl_node_pre = (avl_ptr_of ((avl_root ((avl_subtree_model (after) (avl_node_pre)))))))) (PreH10 : (avl_update_height_children_safe (avl_subtree_model (after) (avl_node_pre)) avl_node_pre )) ,
  (avl_tree_store (avl_subtree_model (after) (avl_node_pre)) )
  **  ((&((promoted)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (promoted)))
  **  ((&((promoted)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (promoted)))
  **  ((&((promoted)  # "AvlNode" ->ₛ "left")) # Ptr  |-> avl_node_pre)
  **  ((&((promoted)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (promoted)))))
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_right (before_low_level_spec) (promoted)))) )
|--
  (avl_tree_store (avl_with_root_cache (after) (promoted) ((avl_height_of (before_low_level_spec) (promoted)))) )
.

Definition crtos_avl_left_rotate_crtos_return_wit_1 := 
(
forall (avl_node_pre: Z) (before_low_level_spec: avl_model) (after: avl_model) (promoted: Z) (PreH1 : (avl_left_rotation_cached_input before_low_level_spec avl_node_pre )) (PreH2 : (avl_left_rotation_result before_low_level_spec after avl_node_pre promoted )) (PreH3 : (avl_tree_valid after )) (PreH4 : (promoted = (avl_ptr_of ((avl_root (after)))))) (PreH5 : (avl_update_height_children_safe after promoted )) ,
  (avl_tree_store after )
|--
  (avl_left_rotation_post before_low_level_spec avl_node_pre promoted )
) \/
(
forall (avl_node_pre: Z) (before_low_level_spec: avl_model) (after: avl_model) (promoted: Z) (PreH1 : (avl_left_rotation_cached_input before_low_level_spec avl_node_pre )) (PreH2 : (avl_left_rotation_result before_low_level_spec after avl_node_pre promoted )) (PreH3 : (avl_tree_valid after )) (PreH4 : (promoted = (avl_ptr_of ((avl_root (after)))))) (PreH5 : (avl_update_height_children_safe after promoted )) ,
  (avl_tree_store after )
|--
  (avl_left_rotation_post before_low_level_spec avl_node_pre promoted )
).

Definition crtos_avl_left_rotate_crtos_return_wit_1_split_goal_spatial := 
forall (avl_node_pre: Z) (before_low_level_spec: avl_model) (after: avl_model) (promoted: Z) (PreH1 : (avl_left_rotation_cached_input before_low_level_spec avl_node_pre )) (PreH2 : (avl_left_rotation_result before_low_level_spec after avl_node_pre promoted )) (PreH3 : (avl_tree_valid after )) (PreH4 : (promoted = (avl_ptr_of ((avl_root (after)))))) (PreH5 : (avl_update_height_children_safe after promoted )) ,
  (avl_tree_store after )
|--
  (avl_left_rotation_post before_low_level_spec avl_node_pre promoted )
.

Definition crtos_avl_left_rotate_crtos_partial_solve_wit_1 := 
forall (avl_node_pre: Z) (root_cached_height_low_level_spec: Z) (before_low_level_spec: avl_model) (after: avl_model) (promoted: Z) (PreH1 : (avl_left_rotation_cached_input before_low_level_spec avl_node_pre )) (PreH2 : (avl_left_rotation_result before_low_level_spec after avl_node_pre promoted )) (PreH3 : (avl_tree_valid after )) (PreH4 : (avl_tree_valid before_low_level_spec )) (PreH5 : (avl_node_pre <> 0)) (PreH6 : (promoted <> 0)) (PreH7 : (promoted = (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> root_cached_height_low_level_spec)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  ((&((promoted)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (promoted)))
  **  ((&((promoted)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (promoted)))
  **  ((&((promoted)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (promoted)))))
  **  ((&((promoted)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (promoted)))))
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_left (before_low_level_spec) (promoted)))) )
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_right (before_low_level_spec) (promoted)))) )
|--
  “ (avl_left_rotation_cached_input before_low_level_spec avl_node_pre ) ” 
  &&  “ (avl_left_rotation_result before_low_level_spec after avl_node_pre promoted ) ” 
  &&  “ (avl_tree_valid after ) ” 
  &&  “ (avl_tree_valid before_low_level_spec ) ” 
  &&  “ (avl_node_pre <> 0) ” 
  &&  “ (promoted <> 0) ” 
  &&  “ (promoted = (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre))))) ”
  &&  ((&(((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) ((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> root_cached_height_low_level_spec)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  ((&((promoted)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (promoted)))
  **  ((&((promoted)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (promoted)))
  **  ((&((promoted)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (promoted)))))
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_left (before_low_level_spec) (promoted)))) )
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_right (before_low_level_spec) (promoted)))) )
.

Definition crtos_avl_left_rotate_crtos_partial_solve_wit_2_pure := 
forall (avl_node_pre: Z) (root_cached_height_low_level_spec: Z) (before_low_level_spec: avl_model) (after: avl_model) (promoted: Z) (PreH1 : (avl_left_rotation_cached_input before_low_level_spec avl_node_pre )) (PreH2 : (avl_left_rotation_result before_low_level_spec after avl_node_pre promoted )) (PreH3 : (avl_tree_valid after )) (PreH4 : (avl_tree_valid (avl_subtree_model (after) (avl_node_pre)) )) (PreH5 : (avl_node_pre = (avl_ptr_of ((avl_root ((avl_subtree_model (after) (avl_node_pre)))))))) (PreH6 : (avl_update_height_children_safe (avl_subtree_model (after) (avl_node_pre)) avl_node_pre )) ,
  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "new_node" ) )) # Ptr  |-> promoted)
  **  (avl_tree_store (avl_with_root_cache ((avl_subtree_model (after) (avl_node_pre))) (avl_node_pre) (root_cached_height_low_level_spec)) )
  **  ((&((promoted)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (promoted)))
  **  ((&((promoted)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (promoted)))
  **  ((&((promoted)  # "AvlNode" ->ₛ "left")) # Ptr  |-> avl_node_pre)
  **  ((&((promoted)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (promoted)))))
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_right (before_low_level_spec) (promoted)))) )
|--
  “ (avl_tree_valid (avl_subtree_model (after) (avl_node_pre)) ) ” 
  &&  “ (avl_node_pre = (avl_ptr_of ((avl_root ((avl_subtree_model (after) (avl_node_pre))))))) ” 
  &&  “ (avl_update_height_children_safe (avl_subtree_model (after) (avl_node_pre)) avl_node_pre ) ”
.

Definition crtos_avl_left_rotate_crtos_partial_solve_wit_2_aux := 
forall (avl_node_pre: Z) (root_cached_height_low_level_spec: Z) (before_low_level_spec: avl_model) (after: avl_model) (promoted: Z) (PreH1 : (avl_left_rotation_cached_input before_low_level_spec avl_node_pre )) (PreH2 : (avl_left_rotation_result before_low_level_spec after avl_node_pre promoted )) (PreH3 : (avl_tree_valid after )) (PreH4 : (avl_tree_valid (avl_subtree_model (after) (avl_node_pre)) )) (PreH5 : (avl_node_pre = (avl_ptr_of ((avl_root ((avl_subtree_model (after) (avl_node_pre)))))))) (PreH6 : (avl_update_height_children_safe (avl_subtree_model (after) (avl_node_pre)) avl_node_pre )) ,
  (avl_tree_store (avl_with_root_cache ((avl_subtree_model (after) (avl_node_pre))) (avl_node_pre) (root_cached_height_low_level_spec)) )
  **  ((&((promoted)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (promoted)))
  **  ((&((promoted)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (promoted)))
  **  ((&((promoted)  # "AvlNode" ->ₛ "left")) # Ptr  |-> avl_node_pre)
  **  ((&((promoted)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (promoted)))))
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_right (before_low_level_spec) (promoted)))) )
|--
  “ (avl_tree_valid (avl_subtree_model (after) (avl_node_pre)) ) ” 
  &&  “ (avl_node_pre = (avl_ptr_of ((avl_root ((avl_subtree_model (after) (avl_node_pre))))))) ” 
  &&  “ (avl_update_height_children_safe (avl_subtree_model (after) (avl_node_pre)) avl_node_pre ) ” 
  &&  “ (avl_left_rotation_cached_input before_low_level_spec avl_node_pre ) ” 
  &&  “ (avl_left_rotation_result before_low_level_spec after avl_node_pre promoted ) ” 
  &&  “ (avl_tree_valid after ) ” 
  &&  “ (avl_tree_valid (avl_subtree_model (after) (avl_node_pre)) ) ” 
  &&  “ (avl_node_pre = (avl_ptr_of ((avl_root ((avl_subtree_model (after) (avl_node_pre))))))) ” 
  &&  “ (avl_update_height_children_safe (avl_subtree_model (after) (avl_node_pre)) avl_node_pre ) ”
  &&  (avl_tree_store (avl_with_root_cache ((avl_subtree_model (after) (avl_node_pre))) (avl_node_pre) (root_cached_height_low_level_spec)) )
  **  ((&((promoted)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (promoted)))
  **  ((&((promoted)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (promoted)))
  **  ((&((promoted)  # "AvlNode" ->ₛ "left")) # Ptr  |-> avl_node_pre)
  **  ((&((promoted)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (promoted)))))
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_right (before_low_level_spec) (promoted)))) )
.

Definition crtos_avl_left_rotate_crtos_partial_solve_wit_2 := crtos_avl_left_rotate_crtos_partial_solve_wit_2_pure -> crtos_avl_left_rotate_crtos_partial_solve_wit_2_aux.

Definition crtos_avl_left_rotate_crtos_partial_solve_wit_3_pure := 
forall (avl_node_pre: Z) (before_low_level_spec: avl_model) (after: avl_model) (promoted: Z) (PreH1 : (avl_left_rotation_cached_input before_low_level_spec avl_node_pre )) (PreH2 : (avl_left_rotation_result before_low_level_spec after avl_node_pre promoted )) (PreH3 : (avl_tree_valid after )) (PreH4 : (promoted = (avl_ptr_of ((avl_root (after)))))) (PreH5 : (avl_update_height_children_safe after promoted )) ,
  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "new_node" ) )) # Ptr  |-> promoted)
  **  (avl_tree_store (avl_with_root_cache (after) (promoted) ((avl_height_of (before_low_level_spec) (promoted)))) )
|--
  “ (avl_tree_valid after ) ” 
  &&  “ (promoted = (avl_ptr_of ((avl_root (after))))) ” 
  &&  “ (avl_update_height_children_safe after promoted ) ”
.

Definition crtos_avl_left_rotate_crtos_partial_solve_wit_3_aux := 
forall (avl_node_pre: Z) (before_low_level_spec: avl_model) (after: avl_model) (promoted: Z) (PreH1 : (avl_left_rotation_cached_input before_low_level_spec avl_node_pre )) (PreH2 : (avl_left_rotation_result before_low_level_spec after avl_node_pre promoted )) (PreH3 : (avl_tree_valid after )) (PreH4 : (promoted = (avl_ptr_of ((avl_root (after)))))) (PreH5 : (avl_update_height_children_safe after promoted )) ,
  (avl_tree_store (avl_with_root_cache (after) (promoted) ((avl_height_of (before_low_level_spec) (promoted)))) )
|--
  “ (avl_tree_valid after ) ” 
  &&  “ (promoted = (avl_ptr_of ((avl_root (after))))) ” 
  &&  “ (avl_update_height_children_safe after promoted ) ” 
  &&  “ (avl_left_rotation_cached_input before_low_level_spec avl_node_pre ) ” 
  &&  “ (avl_left_rotation_result before_low_level_spec after avl_node_pre promoted ) ” 
  &&  “ (avl_tree_valid after ) ” 
  &&  “ (promoted = (avl_ptr_of ((avl_root (after))))) ” 
  &&  “ (avl_update_height_children_safe after promoted ) ”
  &&  (avl_tree_store (avl_with_root_cache (after) (promoted) ((avl_height_of (before_low_level_spec) (promoted)))) )
.

Definition crtos_avl_left_rotate_crtos_partial_solve_wit_3 := crtos_avl_left_rotate_crtos_partial_solve_wit_3_pure -> crtos_avl_left_rotate_crtos_partial_solve_wit_3_aux.

(*----- Function crtos_avl_lr_rotate_crtos -----*)

Definition crtos_avl_lr_rotate_crtos_safety_wit_1 := 
forall (avl_node_pre: Z) (root_cached_height_low_level_spec: Z) (before_low_level_spec: avl_model) (PreH1 : (avl_lr_rotation_input before_low_level_spec avl_node_pre )) (PreH2 : (avl_node_pre <> 0)) ,
  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  (avl_tree_store (avl_with_root_cache (before_low_level_spec) (avl_node_pre) (root_cached_height_low_level_spec)) )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition crtos_avl_lr_rotate_crtos_safety_wit_2 := 
forall (avl_node_pre: Z) (root_cached_height_low_level_spec: Z) (before_low_level_spec: avl_model) (PreH1 : (avl_node_pre = 0)) (PreH2 : (avl_lr_rotation_input before_low_level_spec avl_node_pre )) (PreH3 : (avl_node_pre <> 0)) ,
  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  (avl_tree_store (avl_with_root_cache (before_low_level_spec) (avl_node_pre) (root_cached_height_low_level_spec)) )
|--
  “ False ”
.

Definition crtos_avl_lr_rotate_crtos_safety_wit_3 := 
forall (avl_node_pre: Z) (root_cached_height_low_level_spec: Z) (before_low_level_spec: avl_model) (PreH1 : (avl_lr_rotation_input before_low_level_spec avl_node_pre )) (PreH2 : (avl_node_pre <> 0)) ,
  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  (avl_tree_store (avl_with_root_cache (before_low_level_spec) (avl_node_pre) (root_cached_height_low_level_spec)) )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition crtos_avl_lr_rotate_crtos_safety_wit_4 := 
forall (avl_node_pre: Z) (root_cached_height_low_level_spec: Z) (before_low_level_spec: avl_model) (PreH1 : (avl_lr_rotation_input before_low_level_spec avl_node_pre )) (PreH2 : (avl_node_pre <> 0)) ,
  ((( &( "new_node" ) )) # Ptr  |->_)
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  (avl_tree_store (avl_with_root_cache (before_low_level_spec) (avl_node_pre) (root_cached_height_low_level_spec)) )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition crtos_avl_lr_rotate_crtos_entail_wit_1 := 
(
forall (avl_node_pre: Z) (root_cached_height_low_level_spec: Z) (before_low_level_spec: avl_model) (PreH1 : (avl_lr_rotation_input before_low_level_spec avl_node_pre )) ,
  (avl_tree_store (avl_with_root_cache (before_low_level_spec) (avl_node_pre) (root_cached_height_low_level_spec)) )
|--
  “ (avl_lr_rotation_input before_low_level_spec avl_node_pre ) ” 
  &&  “ (avl_node_pre <> 0) ”
  &&  (avl_tree_store (avl_with_root_cache (before_low_level_spec) (avl_node_pre) (root_cached_height_low_level_spec)) )
) \/
(
forall (avl_node_pre: Z) (before_low_level_spec: avl_model) (PreH1 : (avl_lr_rotation_input before_low_level_spec avl_node_pre )) ,
  TT && emp 
|--
  “ (avl_node_pre <> 0) ”
  &&  emp
).

Definition crtos_avl_lr_rotate_crtos_entail_wit_1_split_goal_1 := 
forall (avl_node_pre: Z) (before_low_level_spec: avl_model) (PreH1 : (avl_lr_rotation_input before_low_level_spec avl_node_pre )) ,
  (avl_node_pre <> 0)
.

Definition crtos_avl_lr_rotate_crtos_entail_wit_2 := 
forall (avl_node_pre: Z) (root_cached_height_low_level_spec: Z) (before_low_level_spec: avl_model) (PreH1 : (avl_node_pre <> 0)) (PreH2 : (avl_lr_rotation_input before_low_level_spec avl_node_pre )) (PreH3 : (avl_node_pre <> 0)) ,
  (avl_tree_store (avl_with_root_cache (before_low_level_spec) (avl_node_pre) (root_cached_height_low_level_spec)) )
|--
  “ (avl_lr_rotation_input before_low_level_spec avl_node_pre ) ” 
  &&  “ (avl_node_pre <> 0) ”
  &&  (avl_tree_store (avl_with_root_cache (before_low_level_spec) (avl_node_pre) (root_cached_height_low_level_spec)) )
.

Definition crtos_avl_lr_rotate_crtos_entail_wit_3 := 
(
forall (avl_node_pre: Z) (root_cached_height_low_level_spec: Z) (before_low_level_spec: avl_model) (PreH1 : (avl_lr_rotation_input before_low_level_spec avl_node_pre )) (PreH2 : (avl_node_pre <> 0)) ,
  (avl_tree_store (avl_with_root_cache (before_low_level_spec) (avl_node_pre) (root_cached_height_low_level_spec)) )
|--
  “ (avl_lr_rotation_input before_low_level_spec avl_node_pre ) ” 
  &&  “ (avl_left_rotation_cached_input (avl_subtree_model (before_low_level_spec) ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) ) ”
  &&  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> root_cached_height_low_level_spec)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  (avl_tree_store (avl_with_root_cache ((avl_subtree_model (before_low_level_spec) ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre))))))) ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre))))) ((avl_height_of (before_low_level_spec) ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))))) )
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) )
) \/
(
forall (avl_node_pre: Z) (root_cached_height_low_level_spec: Z) (before_low_level_spec: avl_model) (PreH1 : (avl_lr_rotation_input before_low_level_spec avl_node_pre )) (PreH2 : (avl_node_pre <> 0)) ,
  (avl_tree_store (avl_with_root_cache (before_low_level_spec) (avl_node_pre) (root_cached_height_low_level_spec)) )
|--
  “ (avl_left_rotation_cached_input (avl_subtree_model (before_low_level_spec) ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) ) ”
  &&  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> root_cached_height_low_level_spec)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  (avl_tree_store (avl_with_root_cache ((avl_subtree_model (before_low_level_spec) ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre))))))) ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre))))) ((avl_height_of (before_low_level_spec) ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))))) )
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) )
).

Definition crtos_avl_lr_rotate_crtos_entail_wit_3_split_goal_1 := 
forall (avl_node_pre: Z) (root_cached_height_low_level_spec: Z) (before_low_level_spec: avl_model) (PreH1 : (avl_lr_rotation_input before_low_level_spec avl_node_pre )) (PreH2 : (avl_node_pre <> 0)) ,
  (avl_tree_store (avl_with_root_cache (before_low_level_spec) (avl_node_pre) (root_cached_height_low_level_spec)) )
|--
  “ (avl_left_rotation_cached_input (avl_subtree_model (before_low_level_spec) ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) ) ”
.

Definition crtos_avl_lr_rotate_crtos_entail_wit_3_split_goal_spatial := 
forall (avl_node_pre: Z) (root_cached_height_low_level_spec: Z) (before_low_level_spec: avl_model) (PreH1 : (avl_lr_rotation_input before_low_level_spec avl_node_pre )) (PreH2 : (avl_node_pre <> 0)) ,
  (avl_tree_store (avl_with_root_cache (before_low_level_spec) (avl_node_pre) (root_cached_height_low_level_spec)) )
|--
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> root_cached_height_low_level_spec)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  (avl_tree_store (avl_with_root_cache ((avl_subtree_model (before_low_level_spec) ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre))))))) ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre))))) ((avl_height_of (before_low_level_spec) ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))))) )
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) )
.

Definition crtos_avl_lr_rotate_crtos_entail_wit_4 := 
(
forall (avl_node_pre: Z) (root_cached_height_low_level_spec: Z) (before_low_level_spec: avl_model) (retval: Z) (PreH1 : (avl_lr_rotation_input before_low_level_spec avl_node_pre )) (PreH2 : (avl_left_rotation_cached_input (avl_subtree_model (before_low_level_spec) ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) )) ,
  (avl_left_rotation_post (avl_subtree_model (before_low_level_spec) ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) retval )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> root_cached_height_low_level_spec)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> retval)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) )
|--
  EX (middle: avl_model) ,
  “ (avl_lr_rotation_input before_low_level_spec avl_node_pre ) ” 
  &&  “ (avl_lr_middle before_low_level_spec middle avl_node_pre (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_right (before_low_level_spec) ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))))) ) ” 
  &&  “ (avl_right_rotation_input middle avl_node_pre ) ”
  &&  (avl_tree_store (avl_with_root_cache (middle) (avl_node_pre) (root_cached_height_low_level_spec)) )
) \/
(
forall (avl_node_pre: Z) (root_cached_height_low_level_spec: Z) (before_low_level_spec: avl_model) (retval: Z) (PreH1 : (root_cached_height_low_level_spec <= UINT_MAX)) (PreH2 : (root_cached_height_low_level_spec >= 0)) (PreH3 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH5 : (avl_lr_rotation_input before_low_level_spec avl_node_pre )) (PreH6 : (avl_left_rotation_cached_input (avl_subtree_model (before_low_level_spec) ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) )) ,
  (avl_left_rotation_post (avl_subtree_model (before_low_level_spec) ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) retval )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> root_cached_height_low_level_spec)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> retval)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) )
|--
  EX (middle: avl_model) ,
  “ (avl_lr_rotation_input before_low_level_spec avl_node_pre ) ” 
  &&  “ (avl_lr_middle before_low_level_spec middle avl_node_pre (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_right (before_low_level_spec) ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))))) ) ” 
  &&  “ (avl_right_rotation_input middle avl_node_pre ) ”
  &&  (avl_tree_store (avl_with_root_cache (middle) (avl_node_pre) (root_cached_height_low_level_spec)) )
).

Definition crtos_avl_lr_rotate_crtos_return_wit_1 := 
(
forall (avl_node_pre: Z) (before_low_level_spec: avl_model) (middle: avl_model) (retval: Z) (PreH1 : (avl_lr_rotation_input before_low_level_spec avl_node_pre )) (PreH2 : (avl_lr_middle before_low_level_spec middle avl_node_pre (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_right (before_low_level_spec) ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))))) )) (PreH3 : (avl_right_rotation_input middle avl_node_pre )) ,
  (avl_right_rotation_post middle avl_node_pre retval )
|--
  (avl_lr_rotation_post before_low_level_spec avl_node_pre retval )
) \/
(
forall (avl_node_pre: Z) (before_low_level_spec: avl_model) (middle: avl_model) (retval: Z) (PreH1 : (avl_lr_rotation_input before_low_level_spec avl_node_pre )) (PreH2 : (avl_lr_middle before_low_level_spec middle avl_node_pre (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_right (before_low_level_spec) ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))))) )) (PreH3 : (avl_right_rotation_input middle avl_node_pre )) ,
  (avl_right_rotation_post middle avl_node_pre retval )
|--
  (avl_lr_rotation_post before_low_level_spec avl_node_pre retval )
).

Definition crtos_avl_lr_rotate_crtos_return_wit_1_split_goal_spatial := 
forall (avl_node_pre: Z) (before_low_level_spec: avl_model) (middle: avl_model) (retval: Z) (PreH1 : (avl_lr_rotation_input before_low_level_spec avl_node_pre )) (PreH2 : (avl_lr_middle before_low_level_spec middle avl_node_pre (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_right (before_low_level_spec) ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))))) )) (PreH3 : (avl_right_rotation_input middle avl_node_pre )) ,
  (avl_right_rotation_post middle avl_node_pre retval )
|--
  (avl_lr_rotation_post before_low_level_spec avl_node_pre retval )
.

Definition crtos_avl_lr_rotate_crtos_partial_solve_wit_1_pure := 
forall (avl_node_pre: Z) (root_cached_height_low_level_spec: Z) (before_low_level_spec: avl_model) (PreH1 : (avl_lr_rotation_input before_low_level_spec avl_node_pre )) (PreH2 : (avl_left_rotation_cached_input (avl_subtree_model (before_low_level_spec) ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) )) ,
  ((( &( "left_node" ) )) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> root_cached_height_low_level_spec)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  (avl_tree_store (avl_with_root_cache ((avl_subtree_model (before_low_level_spec) ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre))))))) ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre))))) ((avl_height_of (before_low_level_spec) ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))))) )
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  ((( &( "new_node" ) )) # Ptr  |-> 0)
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
|--
  “ (avl_left_rotation_cached_input (avl_subtree_model (before_low_level_spec) ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) ) ”
.

Definition crtos_avl_lr_rotate_crtos_partial_solve_wit_1_aux := 
forall (avl_node_pre: Z) (root_cached_height_low_level_spec: Z) (before_low_level_spec: avl_model) (PreH1 : (avl_lr_rotation_input before_low_level_spec avl_node_pre )) (PreH2 : (avl_left_rotation_cached_input (avl_subtree_model (before_low_level_spec) ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) )) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> root_cached_height_low_level_spec)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  (avl_tree_store (avl_with_root_cache ((avl_subtree_model (before_low_level_spec) ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre))))))) ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre))))) ((avl_height_of (before_low_level_spec) ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))))) )
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) )
|--
  “ (avl_left_rotation_cached_input (avl_subtree_model (before_low_level_spec) ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) ) ” 
  &&  “ (avl_lr_rotation_input before_low_level_spec avl_node_pre ) ” 
  &&  “ (avl_left_rotation_cached_input (avl_subtree_model (before_low_level_spec) ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) ) ”
  &&  (avl_tree_store (avl_with_root_cache ((avl_subtree_model (before_low_level_spec) ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre))))))) ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre))))) ((avl_height_of (before_low_level_spec) ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))))) )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> root_cached_height_low_level_spec)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) )
.

Definition crtos_avl_lr_rotate_crtos_partial_solve_wit_1 := crtos_avl_lr_rotate_crtos_partial_solve_wit_1_pure -> crtos_avl_lr_rotate_crtos_partial_solve_wit_1_aux.

Definition crtos_avl_lr_rotate_crtos_partial_solve_wit_2_pure := 
forall (avl_node_pre: Z) (root_cached_height_low_level_spec: Z) (before_low_level_spec: avl_model) (middle: avl_model) (PreH1 : (avl_lr_rotation_input before_low_level_spec avl_node_pre )) (PreH2 : (avl_lr_middle before_low_level_spec middle avl_node_pre (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_right (before_low_level_spec) ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))))) )) (PreH3 : (avl_right_rotation_input middle avl_node_pre )) ,
  (avl_tree_store (avl_with_root_cache (middle) (avl_node_pre) (root_cached_height_low_level_spec)) )
  **  ((( &( "new_node" ) )) # Ptr  |-> 0)
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "left_node" ) )) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
|--
  “ (avl_right_rotation_input middle avl_node_pre ) ”
.

Definition crtos_avl_lr_rotate_crtos_partial_solve_wit_2_aux := 
forall (avl_node_pre: Z) (root_cached_height_low_level_spec: Z) (before_low_level_spec: avl_model) (middle: avl_model) (PreH1 : (avl_lr_rotation_input before_low_level_spec avl_node_pre )) (PreH2 : (avl_lr_middle before_low_level_spec middle avl_node_pre (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_right (before_low_level_spec) ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))))) )) (PreH3 : (avl_right_rotation_input middle avl_node_pre )) ,
  (avl_tree_store (avl_with_root_cache (middle) (avl_node_pre) (root_cached_height_low_level_spec)) )
|--
  “ (avl_right_rotation_input middle avl_node_pre ) ” 
  &&  “ (avl_lr_rotation_input before_low_level_spec avl_node_pre ) ” 
  &&  “ (avl_lr_middle before_low_level_spec middle avl_node_pre (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_right (before_low_level_spec) ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))))) ) ” 
  &&  “ (avl_right_rotation_input middle avl_node_pre ) ”
  &&  (avl_tree_store (avl_with_root_cache (middle) (avl_node_pre) (root_cached_height_low_level_spec)) )
.

Definition crtos_avl_lr_rotate_crtos_partial_solve_wit_2 := crtos_avl_lr_rotate_crtos_partial_solve_wit_2_pure -> crtos_avl_lr_rotate_crtos_partial_solve_wit_2_aux.

(*----- Function crtos_avl_rl_rotate_crtos -----*)

Definition crtos_avl_rl_rotate_crtos_safety_wit_1 := 
forall (avl_node_pre: Z) (root_cached_height_low_level_spec: Z) (before_low_level_spec: avl_model) (PreH1 : (avl_rl_rotation_input before_low_level_spec avl_node_pre )) (PreH2 : (avl_node_pre <> 0)) ,
  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  (avl_tree_store (avl_with_root_cache (before_low_level_spec) (avl_node_pre) (root_cached_height_low_level_spec)) )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition crtos_avl_rl_rotate_crtos_safety_wit_2 := 
forall (avl_node_pre: Z) (root_cached_height_low_level_spec: Z) (before_low_level_spec: avl_model) (PreH1 : (avl_node_pre = 0)) (PreH2 : (avl_rl_rotation_input before_low_level_spec avl_node_pre )) (PreH3 : (avl_node_pre <> 0)) ,
  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  (avl_tree_store (avl_with_root_cache (before_low_level_spec) (avl_node_pre) (root_cached_height_low_level_spec)) )
|--
  “ False ”
.

Definition crtos_avl_rl_rotate_crtos_safety_wit_3 := 
forall (avl_node_pre: Z) (root_cached_height_low_level_spec: Z) (before_low_level_spec: avl_model) (PreH1 : (avl_rl_rotation_input before_low_level_spec avl_node_pre )) (PreH2 : (avl_node_pre <> 0)) ,
  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  (avl_tree_store (avl_with_root_cache (before_low_level_spec) (avl_node_pre) (root_cached_height_low_level_spec)) )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition crtos_avl_rl_rotate_crtos_safety_wit_4 := 
forall (avl_node_pre: Z) (root_cached_height_low_level_spec: Z) (before_low_level_spec: avl_model) (PreH1 : (avl_rl_rotation_input before_low_level_spec avl_node_pre )) (PreH2 : (avl_node_pre <> 0)) ,
  ((( &( "new_node" ) )) # Ptr  |->_)
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  (avl_tree_store (avl_with_root_cache (before_low_level_spec) (avl_node_pre) (root_cached_height_low_level_spec)) )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition crtos_avl_rl_rotate_crtos_entail_wit_1 := 
(
forall (avl_node_pre: Z) (root_cached_height_low_level_spec: Z) (before_low_level_spec: avl_model) (PreH1 : (avl_rl_rotation_input before_low_level_spec avl_node_pre )) ,
  (avl_tree_store (avl_with_root_cache (before_low_level_spec) (avl_node_pre) (root_cached_height_low_level_spec)) )
|--
  “ (avl_rl_rotation_input before_low_level_spec avl_node_pre ) ” 
  &&  “ (avl_node_pre <> 0) ”
  &&  (avl_tree_store (avl_with_root_cache (before_low_level_spec) (avl_node_pre) (root_cached_height_low_level_spec)) )
) \/
(
forall (avl_node_pre: Z) (before_low_level_spec: avl_model) (PreH1 : (avl_rl_rotation_input before_low_level_spec avl_node_pre )) ,
  TT && emp 
|--
  “ (avl_node_pre <> 0) ”
  &&  emp
).

Definition crtos_avl_rl_rotate_crtos_entail_wit_1_split_goal_1 := 
forall (avl_node_pre: Z) (before_low_level_spec: avl_model) (PreH1 : (avl_rl_rotation_input before_low_level_spec avl_node_pre )) ,
  (avl_node_pre <> 0)
.

Definition crtos_avl_rl_rotate_crtos_entail_wit_2 := 
forall (avl_node_pre: Z) (root_cached_height_low_level_spec: Z) (before_low_level_spec: avl_model) (PreH1 : (avl_node_pre <> 0)) (PreH2 : (avl_rl_rotation_input before_low_level_spec avl_node_pre )) (PreH3 : (avl_node_pre <> 0)) ,
  (avl_tree_store (avl_with_root_cache (before_low_level_spec) (avl_node_pre) (root_cached_height_low_level_spec)) )
|--
  “ (avl_rl_rotation_input before_low_level_spec avl_node_pre ) ” 
  &&  “ (avl_node_pre <> 0) ”
  &&  (avl_tree_store (avl_with_root_cache (before_low_level_spec) (avl_node_pre) (root_cached_height_low_level_spec)) )
.

Definition crtos_avl_rl_rotate_crtos_entail_wit_3 := 
(
forall (avl_node_pre: Z) (root_cached_height_low_level_spec: Z) (before_low_level_spec: avl_model) (PreH1 : (avl_rl_rotation_input before_low_level_spec avl_node_pre )) (PreH2 : (avl_node_pre <> 0)) ,
  (avl_tree_store (avl_with_root_cache (before_low_level_spec) (avl_node_pre) (root_cached_height_low_level_spec)) )
|--
  “ (avl_rl_rotation_input before_low_level_spec avl_node_pre ) ” 
  &&  “ (avl_right_rotation_input (avl_subtree_model (before_low_level_spec) ((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))) (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) ) ”
  &&  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> root_cached_height_low_level_spec)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  (avl_tree_store (avl_with_root_cache ((avl_subtree_model (before_low_level_spec) ((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre))))))) ((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre))))) ((avl_height_of (before_low_level_spec) ((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))))) )
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) )
) \/
(
forall (avl_node_pre: Z) (root_cached_height_low_level_spec: Z) (before_low_level_spec: avl_model) (PreH1 : (avl_rl_rotation_input before_low_level_spec avl_node_pre )) (PreH2 : (avl_node_pre <> 0)) ,
  (avl_tree_store (avl_with_root_cache (before_low_level_spec) (avl_node_pre) (root_cached_height_low_level_spec)) )
|--
  “ (avl_right_rotation_input (avl_subtree_model (before_low_level_spec) ((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))) (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) ) ”
  &&  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> root_cached_height_low_level_spec)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  (avl_tree_store (avl_with_root_cache ((avl_subtree_model (before_low_level_spec) ((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre))))))) ((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre))))) ((avl_height_of (before_low_level_spec) ((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))))) )
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) )
).

Definition crtos_avl_rl_rotate_crtos_entail_wit_3_split_goal_1 := 
forall (avl_node_pre: Z) (root_cached_height_low_level_spec: Z) (before_low_level_spec: avl_model) (PreH1 : (avl_rl_rotation_input before_low_level_spec avl_node_pre )) (PreH2 : (avl_node_pre <> 0)) ,
  (avl_tree_store (avl_with_root_cache (before_low_level_spec) (avl_node_pre) (root_cached_height_low_level_spec)) )
|--
  “ (avl_right_rotation_input (avl_subtree_model (before_low_level_spec) ((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))) (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) ) ”
.

Definition crtos_avl_rl_rotate_crtos_entail_wit_3_split_goal_spatial := 
forall (avl_node_pre: Z) (root_cached_height_low_level_spec: Z) (before_low_level_spec: avl_model) (PreH1 : (avl_rl_rotation_input before_low_level_spec avl_node_pre )) (PreH2 : (avl_node_pre <> 0)) ,
  (avl_tree_store (avl_with_root_cache (before_low_level_spec) (avl_node_pre) (root_cached_height_low_level_spec)) )
|--
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> root_cached_height_low_level_spec)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  (avl_tree_store (avl_with_root_cache ((avl_subtree_model (before_low_level_spec) ((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre))))))) ((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre))))) ((avl_height_of (before_low_level_spec) ((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))))) )
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) )
.

Definition crtos_avl_rl_rotate_crtos_entail_wit_4 := 
(
forall (avl_node_pre: Z) (root_cached_height_low_level_spec: Z) (before_low_level_spec: avl_model) (retval: Z) (PreH1 : (avl_rl_rotation_input before_low_level_spec avl_node_pre )) (PreH2 : (avl_right_rotation_input (avl_subtree_model (before_low_level_spec) ((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))) (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) )) ,
  (avl_right_rotation_post (avl_subtree_model (before_low_level_spec) ((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))) (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) retval )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> root_cached_height_low_level_spec)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> retval)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) )
|--
  EX (middle: avl_model) ,
  “ (avl_rl_rotation_input before_low_level_spec avl_node_pre ) ” 
  &&  “ (avl_rl_middle before_low_level_spec middle avl_node_pre (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_left (before_low_level_spec) ((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))))) ) ” 
  &&  “ (avl_left_rotation_cached_input middle avl_node_pre ) ”
  &&  (avl_tree_store (avl_with_root_cache (middle) (avl_node_pre) (root_cached_height_low_level_spec)) )
) \/
(
forall (avl_node_pre: Z) (root_cached_height_low_level_spec: Z) (before_low_level_spec: avl_model) (retval: Z) (PreH1 : (root_cached_height_low_level_spec <= UINT_MAX)) (PreH2 : (root_cached_height_low_level_spec >= 0)) (PreH3 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH5 : (avl_rl_rotation_input before_low_level_spec avl_node_pre )) (PreH6 : (avl_right_rotation_input (avl_subtree_model (before_low_level_spec) ((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))) (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) )) ,
  (avl_right_rotation_post (avl_subtree_model (before_low_level_spec) ((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))) (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) retval )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> root_cached_height_low_level_spec)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> retval)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) )
|--
  EX (middle: avl_model) ,
  “ (avl_rl_rotation_input before_low_level_spec avl_node_pre ) ” 
  &&  “ (avl_rl_middle before_low_level_spec middle avl_node_pre (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_left (before_low_level_spec) ((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))))) ) ” 
  &&  “ (avl_left_rotation_cached_input middle avl_node_pre ) ”
  &&  (avl_tree_store (avl_with_root_cache (middle) (avl_node_pre) (root_cached_height_low_level_spec)) )
).

Definition crtos_avl_rl_rotate_crtos_return_wit_1 := 
(
forall (avl_node_pre: Z) (before_low_level_spec: avl_model) (middle: avl_model) (retval: Z) (PreH1 : (avl_rl_rotation_input before_low_level_spec avl_node_pre )) (PreH2 : (avl_rl_middle before_low_level_spec middle avl_node_pre (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_left (before_low_level_spec) ((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))))) )) (PreH3 : (avl_left_rotation_cached_input middle avl_node_pre )) ,
  (avl_left_rotation_post middle avl_node_pre retval )
|--
  (avl_rl_rotation_post before_low_level_spec avl_node_pre retval )
) \/
(
forall (avl_node_pre: Z) (before_low_level_spec: avl_model) (middle: avl_model) (retval: Z) (PreH1 : (avl_rl_rotation_input before_low_level_spec avl_node_pre )) (PreH2 : (avl_rl_middle before_low_level_spec middle avl_node_pre (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_left (before_low_level_spec) ((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))))) )) (PreH3 : (avl_left_rotation_cached_input middle avl_node_pre )) ,
  (avl_left_rotation_post middle avl_node_pre retval )
|--
  (avl_rl_rotation_post before_low_level_spec avl_node_pre retval )
).

Definition crtos_avl_rl_rotate_crtos_return_wit_1_split_goal_spatial := 
forall (avl_node_pre: Z) (before_low_level_spec: avl_model) (middle: avl_model) (retval: Z) (PreH1 : (avl_rl_rotation_input before_low_level_spec avl_node_pre )) (PreH2 : (avl_rl_middle before_low_level_spec middle avl_node_pre (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_left (before_low_level_spec) ((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))))) )) (PreH3 : (avl_left_rotation_cached_input middle avl_node_pre )) ,
  (avl_left_rotation_post middle avl_node_pre retval )
|--
  (avl_rl_rotation_post before_low_level_spec avl_node_pre retval )
.

Definition crtos_avl_rl_rotate_crtos_partial_solve_wit_1_pure := 
forall (avl_node_pre: Z) (root_cached_height_low_level_spec: Z) (before_low_level_spec: avl_model) (PreH1 : (avl_rl_rotation_input before_low_level_spec avl_node_pre )) (PreH2 : (avl_right_rotation_input (avl_subtree_model (before_low_level_spec) ((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))) (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) )) ,
  ((( &( "right_node" ) )) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> root_cached_height_low_level_spec)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  (avl_tree_store (avl_with_root_cache ((avl_subtree_model (before_low_level_spec) ((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre))))))) ((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre))))) ((avl_height_of (before_low_level_spec) ((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))))) )
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  ((( &( "new_node" ) )) # Ptr  |-> 0)
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
|--
  “ (avl_right_rotation_input (avl_subtree_model (before_low_level_spec) ((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))) (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) ) ”
.

Definition crtos_avl_rl_rotate_crtos_partial_solve_wit_1_aux := 
forall (avl_node_pre: Z) (root_cached_height_low_level_spec: Z) (before_low_level_spec: avl_model) (PreH1 : (avl_rl_rotation_input before_low_level_spec avl_node_pre )) (PreH2 : (avl_right_rotation_input (avl_subtree_model (before_low_level_spec) ((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))) (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) )) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> root_cached_height_low_level_spec)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  (avl_tree_store (avl_with_root_cache ((avl_subtree_model (before_low_level_spec) ((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre))))))) ((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre))))) ((avl_height_of (before_low_level_spec) ((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))))) )
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) )
|--
  “ (avl_right_rotation_input (avl_subtree_model (before_low_level_spec) ((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))) (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) ) ” 
  &&  “ (avl_rl_rotation_input before_low_level_spec avl_node_pre ) ” 
  &&  “ (avl_right_rotation_input (avl_subtree_model (before_low_level_spec) ((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))) (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) ) ”
  &&  (avl_tree_store (avl_with_root_cache ((avl_subtree_model (before_low_level_spec) ((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre))))))) ((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre))))) ((avl_height_of (before_low_level_spec) ((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))))) )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> root_cached_height_low_level_spec)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at before_low_level_spec (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) )
.

Definition crtos_avl_rl_rotate_crtos_partial_solve_wit_1 := crtos_avl_rl_rotate_crtos_partial_solve_wit_1_pure -> crtos_avl_rl_rotate_crtos_partial_solve_wit_1_aux.

Definition crtos_avl_rl_rotate_crtos_partial_solve_wit_2_pure := 
forall (avl_node_pre: Z) (root_cached_height_low_level_spec: Z) (before_low_level_spec: avl_model) (middle: avl_model) (PreH1 : (avl_rl_rotation_input before_low_level_spec avl_node_pre )) (PreH2 : (avl_rl_middle before_low_level_spec middle avl_node_pre (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_left (before_low_level_spec) ((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))))) )) (PreH3 : (avl_left_rotation_cached_input middle avl_node_pre )) ,
  (avl_tree_store (avl_with_root_cache (middle) (avl_node_pre) (root_cached_height_low_level_spec)) )
  **  ((( &( "new_node" ) )) # Ptr  |-> 0)
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "right_node" ) )) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
|--
  “ (avl_left_rotation_cached_input middle avl_node_pre ) ”
.

Definition crtos_avl_rl_rotate_crtos_partial_solve_wit_2_aux := 
forall (avl_node_pre: Z) (root_cached_height_low_level_spec: Z) (before_low_level_spec: avl_model) (middle: avl_model) (PreH1 : (avl_rl_rotation_input before_low_level_spec avl_node_pre )) (PreH2 : (avl_rl_middle before_low_level_spec middle avl_node_pre (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_left (before_low_level_spec) ((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))))) )) (PreH3 : (avl_left_rotation_cached_input middle avl_node_pre )) ,
  (avl_tree_store (avl_with_root_cache (middle) (avl_node_pre) (root_cached_height_low_level_spec)) )
|--
  “ (avl_left_rotation_cached_input middle avl_node_pre ) ” 
  &&  “ (avl_rl_rotation_input before_low_level_spec avl_node_pre ) ” 
  &&  “ (avl_rl_middle before_low_level_spec middle avl_node_pre (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_left (before_low_level_spec) ((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))))) ) ” 
  &&  “ (avl_left_rotation_cached_input middle avl_node_pre ) ”
  &&  (avl_tree_store (avl_with_root_cache (middle) (avl_node_pre) (root_cached_height_low_level_spec)) )
.

Definition crtos_avl_rl_rotate_crtos_partial_solve_wit_2 := crtos_avl_rl_rotate_crtos_partial_solve_wit_2_pure -> crtos_avl_rl_rotate_crtos_partial_solve_wit_2_aux.

(*----- Function crtos_avl_balance_crtos -----*)

Definition crtos_avl_balance_crtos_safety_wit_1 := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (PreH1 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) ,
  ((( &( "bf" ) )) # Int  |->_)
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  (avl_tree_store before_high_level_spec )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition crtos_avl_balance_crtos_safety_wit_2 := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (PreH1 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) ,
  ((( &( "child_bf" ) )) # Int  |->_)
  **  ((( &( "bf" ) )) # Int  |-> 0)
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  (avl_tree_store before_high_level_spec )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition crtos_avl_balance_crtos_safety_wit_3 := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (PreH1 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) ,
  ((( &( "child_bf" ) )) # Int  |-> 0)
  **  ((( &( "bf" ) )) # Int  |-> 0)
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  (avl_tree_store before_high_level_spec )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition crtos_avl_balance_crtos_safety_wit_4 := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (PreH1 : (avl_node_pre = 0)) (PreH2 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) ,
  ((( &( "child_bf" ) )) # Int  |-> 0)
  **  ((( &( "bf" ) )) # Int  |-> 0)
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  (avl_tree_store before_high_level_spec )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition crtos_avl_balance_crtos_safety_wit_5 := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (bf: Z) (child_bf: Z) (retval: Z) (PreH1 : (avl_node_pre = 0)) (PreH2 : (retval = 0)) (PreH3 : (bf = 0)) (PreH4 : (child_bf = 0)) (PreH5 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH6 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH7 : (avl_node_pre <> 0)) ,
  (avl_subtree_store_at before_high_level_spec avl_node_pre )
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "bf" ) )) # Int  |-> bf)
  **  ((( &( "child_bf" ) )) # Int  |-> child_bf)
|--
  “ False ”
.

Definition crtos_avl_balance_crtos_safety_wit_6 := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (bf: Z) (child_bf: Z) (PreH1 : (bf = (avl_model_balance_factor (before_high_level_spec) (avl_node_pre)))) (PreH2 : (child_bf = 0)) (PreH3 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH4 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH5 : (avl_node_pre <> 0)) ,
  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "bf" ) )) # Int  |-> bf)
  **  ((( &( "child_bf" ) )) # Int  |-> child_bf)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition crtos_avl_balance_crtos_safety_wit_7 := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (bf: Z) (child_bf: Z) (retval: Z) (PreH1 : ((avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) <> 0)) (PreH2 : (avl_vvalid before_high_level_spec (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) )) (PreH3 : (retval = (avl_model_balance_factor (before_high_level_spec) ((avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))))) (PreH4 : (INT_MIN < retval)) (PreH5 : (retval <= INT_MAX)) (PreH6 : (bf > 1)) (PreH7 : (bf = (avl_model_balance_factor (before_high_level_spec) (avl_node_pre)))) (PreH8 : (child_bf = 0)) (PreH9 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH10 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH11 : (avl_node_pre <> 0)) ,
  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) )
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "bf" ) )) # Int  |-> bf)
  **  ((( &( "child_bf" ) )) # Int  |-> retval)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition crtos_avl_balance_crtos_safety_wit_8 := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (bf: Z) (child_bf: Z) (retval: Z) (PreH1 : ((avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) = 0)) (PreH2 : (retval = 0)) (PreH3 : (bf > 1)) (PreH4 : (bf = (avl_model_balance_factor (before_high_level_spec) (avl_node_pre)))) (PreH5 : (child_bf = 0)) (PreH6 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH7 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH8 : (avl_node_pre <> 0)) ,
  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) )
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "bf" ) )) # Int  |-> bf)
  **  ((( &( "child_bf" ) )) # Int  |-> retval)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition crtos_avl_balance_crtos_safety_wit_9 := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (bf: Z) (child_bf: Z) (retval: Z) (PreH1 : (retval < 0)) (PreH2 : ((avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) = 0)) (PreH3 : (retval = 0)) (PreH4 : (bf > 1)) (PreH5 : (bf = (avl_model_balance_factor (before_high_level_spec) (avl_node_pre)))) (PreH6 : (child_bf = 0)) (PreH7 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH8 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH9 : (avl_node_pre <> 0)) ,
  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) )
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "bf" ) )) # Int  |-> bf)
  **  ((( &( "child_bf" ) )) # Int  |-> retval)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) )
|--
  “ False ”
.

Definition crtos_avl_balance_crtos_safety_wit_10 := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (bf: Z) (child_bf: Z) (PreH1 : (bf <= 1)) (PreH2 : (bf = (avl_model_balance_factor (before_high_level_spec) (avl_node_pre)))) (PreH3 : (child_bf = 0)) (PreH4 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH5 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH6 : (avl_node_pre <> 0)) ,
  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "bf" ) )) # Int  |-> bf)
  **  ((( &( "child_bf" ) )) # Int  |-> child_bf)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) )
|--
  “ (1 <> (INT_MIN)) ”
.

Definition crtos_avl_balance_crtos_safety_wit_11 := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (bf: Z) (child_bf: Z) (PreH1 : (bf <= 1)) (PreH2 : (bf = (avl_model_balance_factor (before_high_level_spec) (avl_node_pre)))) (PreH3 : (child_bf = 0)) (PreH4 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH5 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH6 : (avl_node_pre <> 0)) ,
  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "bf" ) )) # Int  |-> bf)
  **  ((( &( "child_bf" ) )) # Int  |-> child_bf)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition crtos_avl_balance_crtos_safety_wit_12 := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (bf: Z) (child_bf: Z) (retval: Z) (PreH1 : ((avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) <> 0)) (PreH2 : (avl_vvalid before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) )) (PreH3 : (retval = (avl_model_balance_factor (before_high_level_spec) ((avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))))) (PreH4 : (INT_MIN < retval)) (PreH5 : (retval <= INT_MAX)) (PreH6 : (bf < (-1))) (PreH7 : (bf <= 1)) (PreH8 : (bf = (avl_model_balance_factor (before_high_level_spec) (avl_node_pre)))) (PreH9 : (child_bf = 0)) (PreH10 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH11 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH12 : (avl_node_pre <> 0)) ,
  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) )
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "bf" ) )) # Int  |-> bf)
  **  ((( &( "child_bf" ) )) # Int  |-> retval)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition crtos_avl_balance_crtos_safety_wit_13 := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (bf: Z) (child_bf: Z) (retval: Z) (PreH1 : ((avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) = 0)) (PreH2 : (retval = 0)) (PreH3 : (bf < (-1))) (PreH4 : (bf <= 1)) (PreH5 : (bf = (avl_model_balance_factor (before_high_level_spec) (avl_node_pre)))) (PreH6 : (child_bf = 0)) (PreH7 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH8 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH9 : (avl_node_pre <> 0)) ,
  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) )
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "bf" ) )) # Int  |-> bf)
  **  ((( &( "child_bf" ) )) # Int  |-> retval)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition crtos_avl_balance_crtos_safety_wit_14 := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (bf: Z) (child_bf: Z) (retval: Z) (PreH1 : (retval > 0)) (PreH2 : ((avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) = 0)) (PreH3 : (retval = 0)) (PreH4 : (bf < (-1))) (PreH5 : (bf <= 1)) (PreH6 : (bf = (avl_model_balance_factor (before_high_level_spec) (avl_node_pre)))) (PreH7 : (child_bf = 0)) (PreH8 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH9 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH10 : (avl_node_pre <> 0)) ,
  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) )
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "bf" ) )) # Int  |-> bf)
  **  ((( &( "child_bf" ) )) # Int  |-> retval)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) )
|--
  “ False ”
.

Definition crtos_avl_balance_crtos_entail_wit_1 := 
(
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (PreH1 : (avl_node_pre <> 0)) (PreH2 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) ,
  (avl_tree_store before_high_level_spec )
|--
  “ (0 = 0) ” 
  &&  “ (0 = 0) ” 
  &&  “ (avl_balance_graph_input before_high_level_spec avl_node_pre ) ” 
  &&  “ (avl_balance_factor_input_valid before_high_level_spec ) ” 
  &&  “ (avl_node_pre <> 0) ”
  &&  (avl_subtree_store_at before_high_level_spec avl_node_pre )
) \/
(
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (PreH1 : (avl_node_pre <> 0)) (PreH2 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) ,
  (avl_tree_store before_high_level_spec )
|--
  “ (avl_balance_factor_input_valid before_high_level_spec ) ”
  &&  (avl_subtree_store_at before_high_level_spec avl_node_pre )
).

Definition crtos_avl_balance_crtos_entail_wit_1_split_goal_1 := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (PreH1 : (avl_node_pre <> 0)) (PreH2 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) ,
  (avl_tree_store before_high_level_spec )
|--
  “ (avl_balance_factor_input_valid before_high_level_spec ) ”
.

Definition crtos_avl_balance_crtos_entail_wit_1_split_goal_spatial := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (PreH1 : (avl_node_pre <> 0)) (PreH2 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) ,
  (avl_tree_store before_high_level_spec )
|--
  (avl_subtree_store_at before_high_level_spec avl_node_pre )
.

Definition crtos_avl_balance_crtos_entail_wit_2 := 
(
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (bf: Z) (child_bf: Z) (retval: Z) (PreH1 : (avl_node_pre <> 0)) (PreH2 : (avl_vvalid before_high_level_spec avl_node_pre )) (PreH3 : (retval = (avl_model_balance_factor (before_high_level_spec) (avl_node_pre)))) (PreH4 : (INT_MIN < retval)) (PreH5 : (retval <= INT_MAX)) (PreH6 : (bf = 0)) (PreH7 : (child_bf = 0)) (PreH8 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH9 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH10 : (avl_node_pre <> 0)) ,
  (avl_subtree_store_at before_high_level_spec avl_node_pre )
|--
  “ (retval = (avl_model_balance_factor (before_high_level_spec) (avl_node_pre))) ” 
  &&  “ (child_bf = 0) ” 
  &&  “ (avl_balance_graph_input before_high_level_spec avl_node_pre ) ” 
  &&  “ (avl_balance_factor_input_valid before_high_level_spec ) ” 
  &&  “ (avl_node_pre <> 0) ”
  &&  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) )
) \/
(
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (bf: Z) (child_bf: Z) (retval: Z) (PreH1 : (avl_node_pre <> 0)) (PreH2 : (avl_vvalid before_high_level_spec avl_node_pre )) (PreH3 : (retval = (avl_model_balance_factor (before_high_level_spec) (avl_node_pre)))) (PreH4 : (INT_MIN < retval)) (PreH5 : (retval <= INT_MAX)) (PreH6 : (bf = 0)) (PreH7 : (child_bf = 0)) (PreH8 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH9 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH10 : (avl_node_pre <> 0)) ,
  (avl_subtree_store_at before_high_level_spec avl_node_pre )
|--
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) )
).

Definition crtos_avl_balance_crtos_entail_wit_2_split_goal_spatial := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (bf: Z) (child_bf: Z) (retval: Z) (PreH1 : (avl_node_pre <> 0)) (PreH2 : (avl_vvalid before_high_level_spec avl_node_pre )) (PreH3 : (retval = (avl_model_balance_factor (before_high_level_spec) (avl_node_pre)))) (PreH4 : (INT_MIN < retval)) (PreH5 : (retval <= INT_MAX)) (PreH6 : (bf = 0)) (PreH7 : (child_bf = 0)) (PreH8 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH9 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH10 : (avl_node_pre <> 0)) ,
  (avl_subtree_store_at before_high_level_spec avl_node_pre )
|--
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) )
.

Definition crtos_avl_balance_crtos_entail_wit_3_1 := 
(
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (bf: Z) (child_bf: Z) (retval: Z) (PreH1 : (retval >= 0)) (PreH2 : ((avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) <> 0)) (PreH3 : (avl_vvalid before_high_level_spec (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) )) (PreH4 : (retval = (avl_model_balance_factor (before_high_level_spec) ((avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))))) (PreH5 : (INT_MIN < retval)) (PreH6 : (retval <= INT_MAX)) (PreH7 : (bf > 1)) (PreH8 : (bf = (avl_model_balance_factor (before_high_level_spec) (avl_node_pre)))) (PreH9 : (child_bf = 0)) (PreH10 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH11 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH12 : (avl_node_pre <> 0)) ,
  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) )
|--
  “ (avl_balance_graph_input before_high_level_spec avl_node_pre ) ” 
  &&  “ (bf = (avl_model_balance_factor (before_high_level_spec) (avl_node_pre))) ” 
  &&  “ (retval = (avl_model_balance_factor (before_high_level_spec) ((avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre))))))) ” 
  &&  “ (bf > 1) ” 
  &&  “ (retval >= 0) ” 
  &&  “ (avl_right_rotation_input before_high_level_spec avl_node_pre ) ”
  &&  (avl_tree_store (avl_with_root_cache (before_high_level_spec) (avl_node_pre) ((avl_height_of (before_high_level_spec) (avl_node_pre)))) )
) \/
(
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (bf: Z) (child_bf: Z) (retval: Z) (PreH1 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH2 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) >= 0)) (PreH3 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH5 : (retval >= 0)) (PreH6 : ((avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) <> 0)) (PreH7 : (avl_vvalid before_high_level_spec (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) )) (PreH8 : (retval = (avl_model_balance_factor (before_high_level_spec) ((avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))))) (PreH9 : (INT_MIN < retval)) (PreH10 : (retval <= INT_MAX)) (PreH11 : (bf > 1)) (PreH12 : (bf = (avl_model_balance_factor (before_high_level_spec) (avl_node_pre)))) (PreH13 : (child_bf = 0)) (PreH14 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH15 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH16 : (avl_node_pre <> 0)) ,
  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) )
|--
  “ (avl_right_rotation_input before_high_level_spec avl_node_pre ) ”
  &&  (avl_tree_store (avl_with_root_cache (before_high_level_spec) (avl_node_pre) ((avl_height_of (before_high_level_spec) (avl_node_pre)))) )
).

Definition crtos_avl_balance_crtos_entail_wit_3_1_split_goal_1 := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (bf: Z) (child_bf: Z) (retval: Z) (PreH1 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH2 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) >= 0)) (PreH3 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH5 : (retval >= 0)) (PreH6 : ((avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) <> 0)) (PreH7 : (avl_vvalid before_high_level_spec (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) )) (PreH8 : (retval = (avl_model_balance_factor (before_high_level_spec) ((avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))))) (PreH9 : (INT_MIN < retval)) (PreH10 : (retval <= INT_MAX)) (PreH11 : (bf > 1)) (PreH12 : (bf = (avl_model_balance_factor (before_high_level_spec) (avl_node_pre)))) (PreH13 : (child_bf = 0)) (PreH14 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH15 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH16 : (avl_node_pre <> 0)) ,
  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) )
|--
  “ (avl_right_rotation_input before_high_level_spec avl_node_pre ) ”
.

Definition crtos_avl_balance_crtos_entail_wit_3_1_split_goal_spatial := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (bf: Z) (child_bf: Z) (retval: Z) (PreH1 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH2 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) >= 0)) (PreH3 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH5 : (retval >= 0)) (PreH6 : ((avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) <> 0)) (PreH7 : (avl_vvalid before_high_level_spec (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) )) (PreH8 : (retval = (avl_model_balance_factor (before_high_level_spec) ((avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))))) (PreH9 : (INT_MIN < retval)) (PreH10 : (retval <= INT_MAX)) (PreH11 : (bf > 1)) (PreH12 : (bf = (avl_model_balance_factor (before_high_level_spec) (avl_node_pre)))) (PreH13 : (child_bf = 0)) (PreH14 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH15 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH16 : (avl_node_pre <> 0)) ,
  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) )
|--
  (avl_tree_store (avl_with_root_cache (before_high_level_spec) (avl_node_pre) ((avl_height_of (before_high_level_spec) (avl_node_pre)))) )
.

Definition crtos_avl_balance_crtos_entail_wit_3_2 := 
(
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (bf: Z) (child_bf: Z) (retval: Z) (PreH1 : (retval >= 0)) (PreH2 : ((avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) = 0)) (PreH3 : (retval = 0)) (PreH4 : (bf > 1)) (PreH5 : (bf = (avl_model_balance_factor (before_high_level_spec) (avl_node_pre)))) (PreH6 : (child_bf = 0)) (PreH7 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH8 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH9 : (avl_node_pre <> 0)) ,
  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) )
|--
  “ (avl_balance_graph_input before_high_level_spec avl_node_pre ) ” 
  &&  “ (bf = (avl_model_balance_factor (before_high_level_spec) (avl_node_pre))) ” 
  &&  “ (retval = (avl_model_balance_factor (before_high_level_spec) ((avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre))))))) ” 
  &&  “ (bf > 1) ” 
  &&  “ (retval >= 0) ” 
  &&  “ (avl_right_rotation_input before_high_level_spec avl_node_pre ) ”
  &&  (avl_tree_store (avl_with_root_cache (before_high_level_spec) (avl_node_pre) ((avl_height_of (before_high_level_spec) (avl_node_pre)))) )
) \/
(
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (bf: Z) (child_bf: Z) (retval: Z) (PreH1 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH2 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) >= 0)) (PreH3 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH5 : (retval >= 0)) (PreH6 : ((avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) = 0)) (PreH7 : (retval = 0)) (PreH8 : (bf > 1)) (PreH9 : (bf = (avl_model_balance_factor (before_high_level_spec) (avl_node_pre)))) (PreH10 : (child_bf = 0)) (PreH11 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH12 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH13 : (avl_node_pre <> 0)) ,
  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) )
|--
  “ (avl_right_rotation_input before_high_level_spec avl_node_pre ) ” 
  &&  “ (0 = (avl_model_balance_factor (before_high_level_spec) (0))) ”
  &&  (avl_tree_store (avl_with_root_cache (before_high_level_spec) (avl_node_pre) ((avl_height_of (before_high_level_spec) (avl_node_pre)))) )
).

Definition crtos_avl_balance_crtos_entail_wit_3_2_split_goal_1 := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (bf: Z) (child_bf: Z) (retval: Z) (PreH1 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH2 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) >= 0)) (PreH3 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH5 : (retval >= 0)) (PreH6 : ((avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) = 0)) (PreH7 : (retval = 0)) (PreH8 : (bf > 1)) (PreH9 : (bf = (avl_model_balance_factor (before_high_level_spec) (avl_node_pre)))) (PreH10 : (child_bf = 0)) (PreH11 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH12 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH13 : (avl_node_pre <> 0)) ,
  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) )
|--
  “ (avl_right_rotation_input before_high_level_spec avl_node_pre ) ”
.

Definition crtos_avl_balance_crtos_entail_wit_3_2_split_goal_2 := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (bf: Z) (child_bf: Z) (retval: Z) (PreH1 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH2 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) >= 0)) (PreH3 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH5 : (retval >= 0)) (PreH6 : ((avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) = 0)) (PreH7 : (retval = 0)) (PreH8 : (bf > 1)) (PreH9 : (bf = (avl_model_balance_factor (before_high_level_spec) (avl_node_pre)))) (PreH10 : (child_bf = 0)) (PreH11 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH12 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH13 : (avl_node_pre <> 0)) ,
  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) )
|--
  “ (0 = (avl_model_balance_factor (before_high_level_spec) (0))) ”
.

Definition crtos_avl_balance_crtos_entail_wit_3_2_split_goal_spatial := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (bf: Z) (child_bf: Z) (retval: Z) (PreH1 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH2 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) >= 0)) (PreH3 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH5 : (retval >= 0)) (PreH6 : ((avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) = 0)) (PreH7 : (retval = 0)) (PreH8 : (bf > 1)) (PreH9 : (bf = (avl_model_balance_factor (before_high_level_spec) (avl_node_pre)))) (PreH10 : (child_bf = 0)) (PreH11 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH12 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH13 : (avl_node_pre <> 0)) ,
  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) )
|--
  (avl_tree_store (avl_with_root_cache (before_high_level_spec) (avl_node_pre) ((avl_height_of (before_high_level_spec) (avl_node_pre)))) )
.

Definition crtos_avl_balance_crtos_entail_wit_4 := 
(
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (bf: Z) (child_bf: Z) (retval: Z) (PreH1 : (retval < 0)) (PreH2 : ((avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) <> 0)) (PreH3 : (avl_vvalid before_high_level_spec (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) )) (PreH4 : (retval = (avl_model_balance_factor (before_high_level_spec) ((avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))))) (PreH5 : (INT_MIN < retval)) (PreH6 : (retval <= INT_MAX)) (PreH7 : (bf > 1)) (PreH8 : (bf = (avl_model_balance_factor (before_high_level_spec) (avl_node_pre)))) (PreH9 : (child_bf = 0)) (PreH10 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH11 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH12 : (avl_node_pre <> 0)) ,
  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) )
|--
  “ (avl_balance_graph_input before_high_level_spec avl_node_pre ) ” 
  &&  “ (bf = (avl_model_balance_factor (before_high_level_spec) (avl_node_pre))) ” 
  &&  “ (retval = (avl_model_balance_factor (before_high_level_spec) ((avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre))))))) ” 
  &&  “ (bf > 1) ” 
  &&  “ (retval < 0) ” 
  &&  “ (avl_lr_rotation_input before_high_level_spec avl_node_pre ) ”
  &&  (avl_tree_store (avl_with_root_cache (before_high_level_spec) (avl_node_pre) ((avl_height_of (before_high_level_spec) (avl_node_pre)))) )
) \/
(
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (bf: Z) (child_bf: Z) (retval: Z) (PreH1 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH2 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) >= 0)) (PreH3 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH5 : (retval < 0)) (PreH6 : ((avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) <> 0)) (PreH7 : (avl_vvalid before_high_level_spec (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) )) (PreH8 : (retval = (avl_model_balance_factor (before_high_level_spec) ((avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))))) (PreH9 : (INT_MIN < retval)) (PreH10 : (retval <= INT_MAX)) (PreH11 : (bf > 1)) (PreH12 : (bf = (avl_model_balance_factor (before_high_level_spec) (avl_node_pre)))) (PreH13 : (child_bf = 0)) (PreH14 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH15 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH16 : (avl_node_pre <> 0)) ,
  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) )
|--
  “ (avl_lr_rotation_input before_high_level_spec avl_node_pre ) ”
  &&  (avl_tree_store (avl_with_root_cache (before_high_level_spec) (avl_node_pre) ((avl_height_of (before_high_level_spec) (avl_node_pre)))) )
).

Definition crtos_avl_balance_crtos_entail_wit_4_split_goal_1 := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (bf: Z) (child_bf: Z) (retval: Z) (PreH1 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH2 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) >= 0)) (PreH3 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH5 : (retval < 0)) (PreH6 : ((avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) <> 0)) (PreH7 : (avl_vvalid before_high_level_spec (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) )) (PreH8 : (retval = (avl_model_balance_factor (before_high_level_spec) ((avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))))) (PreH9 : (INT_MIN < retval)) (PreH10 : (retval <= INT_MAX)) (PreH11 : (bf > 1)) (PreH12 : (bf = (avl_model_balance_factor (before_high_level_spec) (avl_node_pre)))) (PreH13 : (child_bf = 0)) (PreH14 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH15 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH16 : (avl_node_pre <> 0)) ,
  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) )
|--
  “ (avl_lr_rotation_input before_high_level_spec avl_node_pre ) ”
.

Definition crtos_avl_balance_crtos_entail_wit_4_split_goal_spatial := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (bf: Z) (child_bf: Z) (retval: Z) (PreH1 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH2 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) >= 0)) (PreH3 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH5 : (retval < 0)) (PreH6 : ((avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) <> 0)) (PreH7 : (avl_vvalid before_high_level_spec (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) )) (PreH8 : (retval = (avl_model_balance_factor (before_high_level_spec) ((avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))))) (PreH9 : (INT_MIN < retval)) (PreH10 : (retval <= INT_MAX)) (PreH11 : (bf > 1)) (PreH12 : (bf = (avl_model_balance_factor (before_high_level_spec) (avl_node_pre)))) (PreH13 : (child_bf = 0)) (PreH14 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH15 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH16 : (avl_node_pre <> 0)) ,
  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) )
|--
  (avl_tree_store (avl_with_root_cache (before_high_level_spec) (avl_node_pre) ((avl_height_of (before_high_level_spec) (avl_node_pre)))) )
.

Definition crtos_avl_balance_crtos_entail_wit_5_1 := 
(
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (bf: Z) (child_bf: Z) (retval: Z) (PreH1 : (retval <= 0)) (PreH2 : ((avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) <> 0)) (PreH3 : (avl_vvalid before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) )) (PreH4 : (retval = (avl_model_balance_factor (before_high_level_spec) ((avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))))) (PreH5 : (INT_MIN < retval)) (PreH6 : (retval <= INT_MAX)) (PreH7 : (bf < (-1))) (PreH8 : (bf <= 1)) (PreH9 : (bf = (avl_model_balance_factor (before_high_level_spec) (avl_node_pre)))) (PreH10 : (child_bf = 0)) (PreH11 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH12 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH13 : (avl_node_pre <> 0)) ,
  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) )
|--
  “ (avl_balance_graph_input before_high_level_spec avl_node_pre ) ” 
  &&  “ (bf = (avl_model_balance_factor (before_high_level_spec) (avl_node_pre))) ” 
  &&  “ (retval = (avl_model_balance_factor (before_high_level_spec) ((avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre))))))) ” 
  &&  “ (bf < (-1)) ” 
  &&  “ (retval <= 0) ” 
  &&  “ (avl_left_rotation_cached_input before_high_level_spec avl_node_pre ) ”
  &&  (avl_tree_store (avl_with_root_cache (before_high_level_spec) (avl_node_pre) ((avl_height_of (before_high_level_spec) (avl_node_pre)))) )
) \/
(
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (bf: Z) (child_bf: Z) (retval: Z) (PreH1 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH2 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) >= 0)) (PreH3 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH5 : (retval <= 0)) (PreH6 : ((avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) <> 0)) (PreH7 : (avl_vvalid before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) )) (PreH8 : (retval = (avl_model_balance_factor (before_high_level_spec) ((avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))))) (PreH9 : (INT_MIN < retval)) (PreH10 : (retval <= INT_MAX)) (PreH11 : (bf < (-1))) (PreH12 : (bf <= 1)) (PreH13 : (bf = (avl_model_balance_factor (before_high_level_spec) (avl_node_pre)))) (PreH14 : (child_bf = 0)) (PreH15 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH16 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH17 : (avl_node_pre <> 0)) ,
  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) )
|--
  “ (avl_left_rotation_cached_input before_high_level_spec avl_node_pre ) ”
  &&  (avl_tree_store (avl_with_root_cache (before_high_level_spec) (avl_node_pre) ((avl_height_of (before_high_level_spec) (avl_node_pre)))) )
).

Definition crtos_avl_balance_crtos_entail_wit_5_1_split_goal_1 := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (bf: Z) (child_bf: Z) (retval: Z) (PreH1 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH2 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) >= 0)) (PreH3 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH5 : (retval <= 0)) (PreH6 : ((avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) <> 0)) (PreH7 : (avl_vvalid before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) )) (PreH8 : (retval = (avl_model_balance_factor (before_high_level_spec) ((avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))))) (PreH9 : (INT_MIN < retval)) (PreH10 : (retval <= INT_MAX)) (PreH11 : (bf < (-1))) (PreH12 : (bf <= 1)) (PreH13 : (bf = (avl_model_balance_factor (before_high_level_spec) (avl_node_pre)))) (PreH14 : (child_bf = 0)) (PreH15 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH16 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH17 : (avl_node_pre <> 0)) ,
  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) )
|--
  “ (avl_left_rotation_cached_input before_high_level_spec avl_node_pre ) ”
.

Definition crtos_avl_balance_crtos_entail_wit_5_1_split_goal_spatial := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (bf: Z) (child_bf: Z) (retval: Z) (PreH1 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH2 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) >= 0)) (PreH3 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH5 : (retval <= 0)) (PreH6 : ((avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) <> 0)) (PreH7 : (avl_vvalid before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) )) (PreH8 : (retval = (avl_model_balance_factor (before_high_level_spec) ((avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))))) (PreH9 : (INT_MIN < retval)) (PreH10 : (retval <= INT_MAX)) (PreH11 : (bf < (-1))) (PreH12 : (bf <= 1)) (PreH13 : (bf = (avl_model_balance_factor (before_high_level_spec) (avl_node_pre)))) (PreH14 : (child_bf = 0)) (PreH15 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH16 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH17 : (avl_node_pre <> 0)) ,
  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) )
|--
  (avl_tree_store (avl_with_root_cache (before_high_level_spec) (avl_node_pre) ((avl_height_of (before_high_level_spec) (avl_node_pre)))) )
.

Definition crtos_avl_balance_crtos_entail_wit_5_2 := 
(
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (bf: Z) (child_bf: Z) (retval: Z) (PreH1 : (retval <= 0)) (PreH2 : ((avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) = 0)) (PreH3 : (retval = 0)) (PreH4 : (bf < (-1))) (PreH5 : (bf <= 1)) (PreH6 : (bf = (avl_model_balance_factor (before_high_level_spec) (avl_node_pre)))) (PreH7 : (child_bf = 0)) (PreH8 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH9 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH10 : (avl_node_pre <> 0)) ,
  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) )
|--
  “ (avl_balance_graph_input before_high_level_spec avl_node_pre ) ” 
  &&  “ (bf = (avl_model_balance_factor (before_high_level_spec) (avl_node_pre))) ” 
  &&  “ (retval = (avl_model_balance_factor (before_high_level_spec) ((avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre))))))) ” 
  &&  “ (bf < (-1)) ” 
  &&  “ (retval <= 0) ” 
  &&  “ (avl_left_rotation_cached_input before_high_level_spec avl_node_pre ) ”
  &&  (avl_tree_store (avl_with_root_cache (before_high_level_spec) (avl_node_pre) ((avl_height_of (before_high_level_spec) (avl_node_pre)))) )
) \/
(
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (bf: Z) (child_bf: Z) (retval: Z) (PreH1 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH2 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) >= 0)) (PreH3 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH5 : (retval <= 0)) (PreH6 : ((avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) = 0)) (PreH7 : (retval = 0)) (PreH8 : (bf < (-1))) (PreH9 : (bf <= 1)) (PreH10 : (bf = (avl_model_balance_factor (before_high_level_spec) (avl_node_pre)))) (PreH11 : (child_bf = 0)) (PreH12 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH13 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH14 : (avl_node_pre <> 0)) ,
  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) )
|--
  “ (avl_left_rotation_cached_input before_high_level_spec avl_node_pre ) ” 
  &&  “ (0 = (avl_model_balance_factor (before_high_level_spec) (0))) ”
  &&  (avl_tree_store (avl_with_root_cache (before_high_level_spec) (avl_node_pre) ((avl_height_of (before_high_level_spec) (avl_node_pre)))) )
).

Definition crtos_avl_balance_crtos_entail_wit_5_2_split_goal_1 := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (bf: Z) (child_bf: Z) (retval: Z) (PreH1 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH2 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) >= 0)) (PreH3 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH5 : (retval <= 0)) (PreH6 : ((avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) = 0)) (PreH7 : (retval = 0)) (PreH8 : (bf < (-1))) (PreH9 : (bf <= 1)) (PreH10 : (bf = (avl_model_balance_factor (before_high_level_spec) (avl_node_pre)))) (PreH11 : (child_bf = 0)) (PreH12 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH13 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH14 : (avl_node_pre <> 0)) ,
  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) )
|--
  “ (avl_left_rotation_cached_input before_high_level_spec avl_node_pre ) ”
.

Definition crtos_avl_balance_crtos_entail_wit_5_2_split_goal_2 := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (bf: Z) (child_bf: Z) (retval: Z) (PreH1 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH2 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) >= 0)) (PreH3 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH5 : (retval <= 0)) (PreH6 : ((avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) = 0)) (PreH7 : (retval = 0)) (PreH8 : (bf < (-1))) (PreH9 : (bf <= 1)) (PreH10 : (bf = (avl_model_balance_factor (before_high_level_spec) (avl_node_pre)))) (PreH11 : (child_bf = 0)) (PreH12 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH13 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH14 : (avl_node_pre <> 0)) ,
  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) )
|--
  “ (0 = (avl_model_balance_factor (before_high_level_spec) (0))) ”
.

Definition crtos_avl_balance_crtos_entail_wit_5_2_split_goal_spatial := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (bf: Z) (child_bf: Z) (retval: Z) (PreH1 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH2 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) >= 0)) (PreH3 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH5 : (retval <= 0)) (PreH6 : ((avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) = 0)) (PreH7 : (retval = 0)) (PreH8 : (bf < (-1))) (PreH9 : (bf <= 1)) (PreH10 : (bf = (avl_model_balance_factor (before_high_level_spec) (avl_node_pre)))) (PreH11 : (child_bf = 0)) (PreH12 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH13 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH14 : (avl_node_pre <> 0)) ,
  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) )
|--
  (avl_tree_store (avl_with_root_cache (before_high_level_spec) (avl_node_pre) ((avl_height_of (before_high_level_spec) (avl_node_pre)))) )
.

Definition crtos_avl_balance_crtos_entail_wit_6 := 
(
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (bf: Z) (child_bf: Z) (retval: Z) (PreH1 : (retval > 0)) (PreH2 : ((avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) <> 0)) (PreH3 : (avl_vvalid before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) )) (PreH4 : (retval = (avl_model_balance_factor (before_high_level_spec) ((avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))))) (PreH5 : (INT_MIN < retval)) (PreH6 : (retval <= INT_MAX)) (PreH7 : (bf < (-1))) (PreH8 : (bf <= 1)) (PreH9 : (bf = (avl_model_balance_factor (before_high_level_spec) (avl_node_pre)))) (PreH10 : (child_bf = 0)) (PreH11 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH12 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH13 : (avl_node_pre <> 0)) ,
  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) )
|--
  “ (avl_balance_graph_input before_high_level_spec avl_node_pre ) ” 
  &&  “ (bf = (avl_model_balance_factor (before_high_level_spec) (avl_node_pre))) ” 
  &&  “ (retval = (avl_model_balance_factor (before_high_level_spec) ((avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre))))))) ” 
  &&  “ (bf < (-1)) ” 
  &&  “ (retval > 0) ” 
  &&  “ (avl_rl_rotation_input before_high_level_spec avl_node_pre ) ”
  &&  (avl_tree_store (avl_with_root_cache (before_high_level_spec) (avl_node_pre) ((avl_height_of (before_high_level_spec) (avl_node_pre)))) )
) \/
(
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (bf: Z) (child_bf: Z) (retval: Z) (PreH1 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH2 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) >= 0)) (PreH3 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH5 : (retval > 0)) (PreH6 : ((avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) <> 0)) (PreH7 : (avl_vvalid before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) )) (PreH8 : (retval = (avl_model_balance_factor (before_high_level_spec) ((avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))))) (PreH9 : (INT_MIN < retval)) (PreH10 : (retval <= INT_MAX)) (PreH11 : (bf < (-1))) (PreH12 : (bf <= 1)) (PreH13 : (bf = (avl_model_balance_factor (before_high_level_spec) (avl_node_pre)))) (PreH14 : (child_bf = 0)) (PreH15 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH16 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH17 : (avl_node_pre <> 0)) ,
  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) )
|--
  “ (avl_rl_rotation_input before_high_level_spec avl_node_pre ) ”
  &&  (avl_tree_store (avl_with_root_cache (before_high_level_spec) (avl_node_pre) ((avl_height_of (before_high_level_spec) (avl_node_pre)))) )
).

Definition crtos_avl_balance_crtos_entail_wit_6_split_goal_1 := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (bf: Z) (child_bf: Z) (retval: Z) (PreH1 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH2 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) >= 0)) (PreH3 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH5 : (retval > 0)) (PreH6 : ((avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) <> 0)) (PreH7 : (avl_vvalid before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) )) (PreH8 : (retval = (avl_model_balance_factor (before_high_level_spec) ((avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))))) (PreH9 : (INT_MIN < retval)) (PreH10 : (retval <= INT_MAX)) (PreH11 : (bf < (-1))) (PreH12 : (bf <= 1)) (PreH13 : (bf = (avl_model_balance_factor (before_high_level_spec) (avl_node_pre)))) (PreH14 : (child_bf = 0)) (PreH15 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH16 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH17 : (avl_node_pre <> 0)) ,
  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) )
|--
  “ (avl_rl_rotation_input before_high_level_spec avl_node_pre ) ”
.

Definition crtos_avl_balance_crtos_entail_wit_6_split_goal_spatial := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (bf: Z) (child_bf: Z) (retval: Z) (PreH1 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH2 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) >= 0)) (PreH3 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH5 : (retval > 0)) (PreH6 : ((avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) <> 0)) (PreH7 : (avl_vvalid before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) )) (PreH8 : (retval = (avl_model_balance_factor (before_high_level_spec) ((avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))))) (PreH9 : (INT_MIN < retval)) (PreH10 : (retval <= INT_MAX)) (PreH11 : (bf < (-1))) (PreH12 : (bf <= 1)) (PreH13 : (bf = (avl_model_balance_factor (before_high_level_spec) (avl_node_pre)))) (PreH14 : (child_bf = 0)) (PreH15 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH16 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH17 : (avl_node_pre <> 0)) ,
  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) )
|--
  (avl_tree_store (avl_with_root_cache (before_high_level_spec) (avl_node_pre) ((avl_height_of (before_high_level_spec) (avl_node_pre)))) )
.

Definition crtos_avl_balance_crtos_return_wit_1 := 
(
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (bf: Z) (child_bf: Z) (PreH1 : (bf >= (-1))) (PreH2 : (bf <= 1)) (PreH3 : (bf = (avl_model_balance_factor (before_high_level_spec) (avl_node_pre)))) (PreH4 : (child_bf = 0)) (PreH5 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH6 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH7 : (avl_node_pre <> 0)) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) )
|--
  EX (after: avl_model) ,
  “ (avl_balance_graph_result before_high_level_spec after avl_node_pre ) ” 
  &&  “ (avl_balance_height_effect before_high_level_spec after ) ” 
  &&  “ (strict_balance_identity before_high_level_spec after ) ”
  &&  (avl_tree_store after )
) \/
(
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (bf: Z) (child_bf: Z) (PreH1 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH2 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) >= 0)) (PreH3 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH5 : (bf >= (-1))) (PreH6 : (bf <= 1)) (PreH7 : (bf = (avl_model_balance_factor (before_high_level_spec) (avl_node_pre)))) (PreH8 : (child_bf = 0)) (PreH9 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH10 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH11 : (avl_node_pre <> 0)) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) )
|--
  EX (after: avl_model) ,
  “ (avl_balance_graph_result before_high_level_spec after avl_node_pre ) ” 
  &&  “ (avl_balance_height_effect before_high_level_spec after ) ” 
  &&  “ (strict_balance_identity before_high_level_spec after ) ”
  &&  (avl_tree_store after )
).

Definition crtos_avl_balance_crtos_return_wit_2 := 
(
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (bf: Z) (child_bf: Z) (retval: Z) (PreH1 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH2 : (bf = (avl_model_balance_factor (before_high_level_spec) (avl_node_pre)))) (PreH3 : (child_bf = (avl_model_balance_factor (before_high_level_spec) ((avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))))) (PreH4 : (bf < (-1))) (PreH5 : (child_bf > 0)) (PreH6 : (avl_rl_rotation_input before_high_level_spec avl_node_pre )) ,
  (avl_rl_rotation_post before_high_level_spec avl_node_pre retval )
|--
  EX (after: avl_model) ,
  “ (avl_balance_graph_result before_high_level_spec after retval ) ” 
  &&  “ (avl_balance_height_effect before_high_level_spec after ) ” 
  &&  “ (strict_balance_identity before_high_level_spec after ) ”
  &&  (avl_tree_store after )
) \/
(
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (bf: Z) (child_bf: Z) (retval: Z) (PreH1 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH2 : (bf = (avl_model_balance_factor (before_high_level_spec) (avl_node_pre)))) (PreH3 : (child_bf = (avl_model_balance_factor (before_high_level_spec) ((avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))))) (PreH4 : (bf < (-1))) (PreH5 : (child_bf > 0)) (PreH6 : (avl_rl_rotation_input before_high_level_spec avl_node_pre )) ,
  (avl_rl_rotation_post before_high_level_spec avl_node_pre retval )
|--
  EX (after: avl_model) ,
  “ (avl_balance_graph_result before_high_level_spec after retval ) ” 
  &&  “ (avl_balance_height_effect before_high_level_spec after ) ” 
  &&  “ (strict_balance_identity before_high_level_spec after ) ”
  &&  (avl_tree_store after )
).

Definition crtos_avl_balance_crtos_return_wit_3 := 
(
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (bf: Z) (child_bf: Z) (retval: Z) (PreH1 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH2 : (bf = (avl_model_balance_factor (before_high_level_spec) (avl_node_pre)))) (PreH3 : (child_bf = (avl_model_balance_factor (before_high_level_spec) ((avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))))) (PreH4 : (bf < (-1))) (PreH5 : (child_bf <= 0)) (PreH6 : (avl_left_rotation_cached_input before_high_level_spec avl_node_pre )) ,
  (avl_left_rotation_post before_high_level_spec avl_node_pre retval )
|--
  EX (after: avl_model) ,
  “ (avl_balance_graph_result before_high_level_spec after retval ) ” 
  &&  “ (avl_balance_height_effect before_high_level_spec after ) ” 
  &&  “ (strict_balance_identity before_high_level_spec after ) ”
  &&  (avl_tree_store after )
) \/
(
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (bf: Z) (child_bf: Z) (retval: Z) (PreH1 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH2 : (bf = (avl_model_balance_factor (before_high_level_spec) (avl_node_pre)))) (PreH3 : (child_bf = (avl_model_balance_factor (before_high_level_spec) ((avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))))) (PreH4 : (bf < (-1))) (PreH5 : (child_bf <= 0)) (PreH6 : (avl_left_rotation_cached_input before_high_level_spec avl_node_pre )) ,
  (avl_left_rotation_post before_high_level_spec avl_node_pre retval )
|--
  EX (after: avl_model) ,
  “ (avl_balance_graph_result before_high_level_spec after retval ) ” 
  &&  “ (avl_balance_height_effect before_high_level_spec after ) ” 
  &&  “ (strict_balance_identity before_high_level_spec after ) ”
  &&  (avl_tree_store after )
).

Definition crtos_avl_balance_crtos_return_wit_4 := 
(
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (bf: Z) (child_bf: Z) (retval: Z) (PreH1 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH2 : (bf = (avl_model_balance_factor (before_high_level_spec) (avl_node_pre)))) (PreH3 : (child_bf = (avl_model_balance_factor (before_high_level_spec) ((avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))))) (PreH4 : (bf > 1)) (PreH5 : (child_bf < 0)) (PreH6 : (avl_lr_rotation_input before_high_level_spec avl_node_pre )) ,
  (avl_lr_rotation_post before_high_level_spec avl_node_pre retval )
|--
  EX (after: avl_model) ,
  “ (avl_balance_graph_result before_high_level_spec after retval ) ” 
  &&  “ (avl_balance_height_effect before_high_level_spec after ) ” 
  &&  “ (strict_balance_identity before_high_level_spec after ) ”
  &&  (avl_tree_store after )
) \/
(
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (bf: Z) (child_bf: Z) (retval: Z) (PreH1 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH2 : (bf = (avl_model_balance_factor (before_high_level_spec) (avl_node_pre)))) (PreH3 : (child_bf = (avl_model_balance_factor (before_high_level_spec) ((avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))))) (PreH4 : (bf > 1)) (PreH5 : (child_bf < 0)) (PreH6 : (avl_lr_rotation_input before_high_level_spec avl_node_pre )) ,
  (avl_lr_rotation_post before_high_level_spec avl_node_pre retval )
|--
  EX (after: avl_model) ,
  “ (avl_balance_graph_result before_high_level_spec after retval ) ” 
  &&  “ (avl_balance_height_effect before_high_level_spec after ) ” 
  &&  “ (strict_balance_identity before_high_level_spec after ) ”
  &&  (avl_tree_store after )
).

Definition crtos_avl_balance_crtos_return_wit_5 := 
(
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (bf: Z) (child_bf: Z) (retval: Z) (PreH1 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH2 : (bf = (avl_model_balance_factor (before_high_level_spec) (avl_node_pre)))) (PreH3 : (child_bf = (avl_model_balance_factor (before_high_level_spec) ((avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))))) (PreH4 : (bf > 1)) (PreH5 : (child_bf >= 0)) (PreH6 : (avl_right_rotation_input before_high_level_spec avl_node_pre )) ,
  (avl_right_rotation_post before_high_level_spec avl_node_pre retval )
|--
  EX (after: avl_model) ,
  “ (avl_balance_graph_result before_high_level_spec after retval ) ” 
  &&  “ (avl_balance_height_effect before_high_level_spec after ) ” 
  &&  “ (strict_balance_identity before_high_level_spec after ) ”
  &&  (avl_tree_store after )
) \/
(
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (bf: Z) (child_bf: Z) (retval: Z) (PreH1 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH2 : (bf = (avl_model_balance_factor (before_high_level_spec) (avl_node_pre)))) (PreH3 : (child_bf = (avl_model_balance_factor (before_high_level_spec) ((avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))))) (PreH4 : (bf > 1)) (PreH5 : (child_bf >= 0)) (PreH6 : (avl_right_rotation_input before_high_level_spec avl_node_pre )) ,
  (avl_right_rotation_post before_high_level_spec avl_node_pre retval )
|--
  EX (after: avl_model) ,
  “ (avl_balance_graph_result before_high_level_spec after retval ) ” 
  &&  “ (avl_balance_height_effect before_high_level_spec after ) ” 
  &&  “ (strict_balance_identity before_high_level_spec after ) ”
  &&  (avl_tree_store after )
).

Definition crtos_avl_balance_crtos_return_wit_6 := 
(
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (PreH1 : (avl_node_pre = 0)) (PreH2 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) ,
  (avl_tree_store before_high_level_spec )
|--
  EX (after: avl_model) ,
  “ (avl_balance_graph_result before_high_level_spec after 0 ) ” 
  &&  “ (avl_balance_height_effect before_high_level_spec after ) ” 
  &&  “ (strict_balance_identity before_high_level_spec after ) ”
  &&  (avl_tree_store after )
) \/
(
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (PreH1 : (avl_node_pre = 0)) (PreH2 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) ,
  TT && emp 
|--
  “ (strict_balance_identity before_high_level_spec before_high_level_spec ) ” 
  &&  “ (avl_balance_height_effect before_high_level_spec before_high_level_spec ) ” 
  &&  “ (avl_balance_graph_result before_high_level_spec before_high_level_spec 0 ) ”
  &&  emp
).

Definition crtos_avl_balance_crtos_return_wit_6_split_goal_1 := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (PreH1 : (avl_node_pre = 0)) (PreH2 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) ,
  (strict_balance_identity before_high_level_spec before_high_level_spec )
.

Definition crtos_avl_balance_crtos_return_wit_6_split_goal_2 := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (PreH1 : (avl_node_pre = 0)) (PreH2 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) ,
  (avl_balance_height_effect before_high_level_spec before_high_level_spec )
.

Definition crtos_avl_balance_crtos_return_wit_6_split_goal_3 := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (PreH1 : (avl_node_pre = 0)) (PreH2 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) ,
  (avl_balance_graph_result before_high_level_spec before_high_level_spec 0 )
.

Definition crtos_avl_balance_crtos_partial_solve_wit_1_pure := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (bf: Z) (child_bf: Z) (PreH1 : (bf = 0)) (PreH2 : (child_bf = 0)) (PreH3 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH4 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH5 : (avl_node_pre <> 0)) ,
  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "bf" ) )) # Int  |-> bf)
  **  ((( &( "child_bf" ) )) # Int  |-> child_bf)
  **  (avl_subtree_store_at before_high_level_spec avl_node_pre )
|--
  “ (avl_balance_factor_input_valid before_high_level_spec ) ”
.

Definition crtos_avl_balance_crtos_partial_solve_wit_1_aux := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (bf: Z) (child_bf: Z) (PreH1 : (bf = 0)) (PreH2 : (child_bf = 0)) (PreH3 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH4 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH5 : (avl_node_pre <> 0)) ,
  (avl_subtree_store_at before_high_level_spec avl_node_pre )
|--
  “ (avl_balance_factor_input_valid before_high_level_spec ) ” 
  &&  “ (bf = 0) ” 
  &&  “ (child_bf = 0) ” 
  &&  “ (avl_balance_graph_input before_high_level_spec avl_node_pre ) ” 
  &&  “ (avl_balance_factor_input_valid before_high_level_spec ) ” 
  &&  “ (avl_node_pre <> 0) ”
  &&  (avl_subtree_store_at before_high_level_spec avl_node_pre )
.

Definition crtos_avl_balance_crtos_partial_solve_wit_1 := crtos_avl_balance_crtos_partial_solve_wit_1_pure -> crtos_avl_balance_crtos_partial_solve_wit_1_aux.

Definition crtos_avl_balance_crtos_partial_solve_wit_2_pure := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (bf: Z) (child_bf: Z) (PreH1 : (bf > 1)) (PreH2 : (bf = (avl_model_balance_factor (before_high_level_spec) (avl_node_pre)))) (PreH3 : (child_bf = 0)) (PreH4 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH5 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH6 : (avl_node_pre <> 0)) ,
  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "bf" ) )) # Int  |-> bf)
  **  ((( &( "child_bf" ) )) # Int  |-> child_bf)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) )
|--
  “ (avl_balance_factor_input_valid before_high_level_spec ) ”
.

Definition crtos_avl_balance_crtos_partial_solve_wit_2_aux := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (bf: Z) (child_bf: Z) (PreH1 : (bf > 1)) (PreH2 : (bf = (avl_model_balance_factor (before_high_level_spec) (avl_node_pre)))) (PreH3 : (child_bf = 0)) (PreH4 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH5 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH6 : (avl_node_pre <> 0)) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) )
|--
  “ (avl_balance_factor_input_valid before_high_level_spec ) ” 
  &&  “ (bf > 1) ” 
  &&  “ (bf = (avl_model_balance_factor (before_high_level_spec) (avl_node_pre))) ” 
  &&  “ (child_bf = 0) ” 
  &&  “ (avl_balance_graph_input before_high_level_spec avl_node_pre ) ” 
  &&  “ (avl_balance_factor_input_valid before_high_level_spec ) ” 
  &&  “ (avl_node_pre <> 0) ”
  &&  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) )
.

Definition crtos_avl_balance_crtos_partial_solve_wit_2 := crtos_avl_balance_crtos_partial_solve_wit_2_pure -> crtos_avl_balance_crtos_partial_solve_wit_2_aux.

Definition crtos_avl_balance_crtos_partial_solve_wit_3_pure := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (bf: Z) (child_bf: Z) (PreH1 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH2 : (bf = (avl_model_balance_factor (before_high_level_spec) (avl_node_pre)))) (PreH3 : (child_bf = (avl_model_balance_factor (before_high_level_spec) ((avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))))) (PreH4 : (bf > 1)) (PreH5 : (child_bf >= 0)) (PreH6 : (avl_right_rotation_input before_high_level_spec avl_node_pre )) ,
  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "bf" ) )) # Int  |-> bf)
  **  ((( &( "child_bf" ) )) # Int  |-> child_bf)
  **  (avl_tree_store (avl_with_root_cache (before_high_level_spec) (avl_node_pre) ((avl_height_of (before_high_level_spec) (avl_node_pre)))) )
|--
  “ (avl_right_rotation_input before_high_level_spec avl_node_pre ) ”
.

Definition crtos_avl_balance_crtos_partial_solve_wit_3_aux := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (bf: Z) (child_bf: Z) (PreH1 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH2 : (bf = (avl_model_balance_factor (before_high_level_spec) (avl_node_pre)))) (PreH3 : (child_bf = (avl_model_balance_factor (before_high_level_spec) ((avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))))) (PreH4 : (bf > 1)) (PreH5 : (child_bf >= 0)) (PreH6 : (avl_right_rotation_input before_high_level_spec avl_node_pre )) ,
  (avl_tree_store (avl_with_root_cache (before_high_level_spec) (avl_node_pre) ((avl_height_of (before_high_level_spec) (avl_node_pre)))) )
|--
  “ (avl_right_rotation_input before_high_level_spec avl_node_pre ) ” 
  &&  “ (avl_balance_graph_input before_high_level_spec avl_node_pre ) ” 
  &&  “ (bf = (avl_model_balance_factor (before_high_level_spec) (avl_node_pre))) ” 
  &&  “ (child_bf = (avl_model_balance_factor (before_high_level_spec) ((avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre))))))) ” 
  &&  “ (bf > 1) ” 
  &&  “ (child_bf >= 0) ” 
  &&  “ (avl_right_rotation_input before_high_level_spec avl_node_pre ) ”
  &&  (avl_tree_store (avl_with_root_cache (before_high_level_spec) (avl_node_pre) ((avl_height_of (before_high_level_spec) (avl_node_pre)))) )
.

Definition crtos_avl_balance_crtos_partial_solve_wit_3 := crtos_avl_balance_crtos_partial_solve_wit_3_pure -> crtos_avl_balance_crtos_partial_solve_wit_3_aux.

Definition crtos_avl_balance_crtos_partial_solve_wit_4_pure := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (bf: Z) (child_bf: Z) (PreH1 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH2 : (bf = (avl_model_balance_factor (before_high_level_spec) (avl_node_pre)))) (PreH3 : (child_bf = (avl_model_balance_factor (before_high_level_spec) ((avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))))) (PreH4 : (bf > 1)) (PreH5 : (child_bf < 0)) (PreH6 : (avl_lr_rotation_input before_high_level_spec avl_node_pre )) ,
  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "bf" ) )) # Int  |-> bf)
  **  ((( &( "child_bf" ) )) # Int  |-> child_bf)
  **  (avl_tree_store (avl_with_root_cache (before_high_level_spec) (avl_node_pre) ((avl_height_of (before_high_level_spec) (avl_node_pre)))) )
|--
  “ (avl_lr_rotation_input before_high_level_spec avl_node_pre ) ”
.

Definition crtos_avl_balance_crtos_partial_solve_wit_4_aux := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (bf: Z) (child_bf: Z) (PreH1 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH2 : (bf = (avl_model_balance_factor (before_high_level_spec) (avl_node_pre)))) (PreH3 : (child_bf = (avl_model_balance_factor (before_high_level_spec) ((avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))))) (PreH4 : (bf > 1)) (PreH5 : (child_bf < 0)) (PreH6 : (avl_lr_rotation_input before_high_level_spec avl_node_pre )) ,
  (avl_tree_store (avl_with_root_cache (before_high_level_spec) (avl_node_pre) ((avl_height_of (before_high_level_spec) (avl_node_pre)))) )
|--
  “ (avl_lr_rotation_input before_high_level_spec avl_node_pre ) ” 
  &&  “ (avl_balance_graph_input before_high_level_spec avl_node_pre ) ” 
  &&  “ (bf = (avl_model_balance_factor (before_high_level_spec) (avl_node_pre))) ” 
  &&  “ (child_bf = (avl_model_balance_factor (before_high_level_spec) ((avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre))))))) ” 
  &&  “ (bf > 1) ” 
  &&  “ (child_bf < 0) ” 
  &&  “ (avl_lr_rotation_input before_high_level_spec avl_node_pre ) ”
  &&  (avl_tree_store (avl_with_root_cache (before_high_level_spec) (avl_node_pre) ((avl_height_of (before_high_level_spec) (avl_node_pre)))) )
.

Definition crtos_avl_balance_crtos_partial_solve_wit_4 := crtos_avl_balance_crtos_partial_solve_wit_4_pure -> crtos_avl_balance_crtos_partial_solve_wit_4_aux.

Definition crtos_avl_balance_crtos_partial_solve_wit_5_pure := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (bf: Z) (child_bf: Z) (PreH1 : (bf < (-1))) (PreH2 : (bf <= 1)) (PreH3 : (bf = (avl_model_balance_factor (before_high_level_spec) (avl_node_pre)))) (PreH4 : (child_bf = 0)) (PreH5 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH6 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH7 : (avl_node_pre <> 0)) ,
  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "bf" ) )) # Int  |-> bf)
  **  ((( &( "child_bf" ) )) # Int  |-> child_bf)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) )
|--
  “ (avl_balance_factor_input_valid before_high_level_spec ) ”
.

Definition crtos_avl_balance_crtos_partial_solve_wit_5_aux := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (bf: Z) (child_bf: Z) (PreH1 : (bf < (-1))) (PreH2 : (bf <= 1)) (PreH3 : (bf = (avl_model_balance_factor (before_high_level_spec) (avl_node_pre)))) (PreH4 : (child_bf = 0)) (PreH5 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH6 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH7 : (avl_node_pre <> 0)) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) )
|--
  “ (avl_balance_factor_input_valid before_high_level_spec ) ” 
  &&  “ (bf < (-1)) ” 
  &&  “ (bf <= 1) ” 
  &&  “ (bf = (avl_model_balance_factor (before_high_level_spec) (avl_node_pre))) ” 
  &&  “ (child_bf = 0) ” 
  &&  “ (avl_balance_graph_input before_high_level_spec avl_node_pre ) ” 
  &&  “ (avl_balance_factor_input_valid before_high_level_spec ) ” 
  &&  “ (avl_node_pre <> 0) ”
  &&  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) )
.

Definition crtos_avl_balance_crtos_partial_solve_wit_5 := crtos_avl_balance_crtos_partial_solve_wit_5_pure -> crtos_avl_balance_crtos_partial_solve_wit_5_aux.

Definition crtos_avl_balance_crtos_partial_solve_wit_6_pure := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (bf: Z) (child_bf: Z) (PreH1 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH2 : (bf = (avl_model_balance_factor (before_high_level_spec) (avl_node_pre)))) (PreH3 : (child_bf = (avl_model_balance_factor (before_high_level_spec) ((avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))))) (PreH4 : (bf < (-1))) (PreH5 : (child_bf <= 0)) (PreH6 : (avl_left_rotation_cached_input before_high_level_spec avl_node_pre )) ,
  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "bf" ) )) # Int  |-> bf)
  **  ((( &( "child_bf" ) )) # Int  |-> child_bf)
  **  (avl_tree_store (avl_with_root_cache (before_high_level_spec) (avl_node_pre) ((avl_height_of (before_high_level_spec) (avl_node_pre)))) )
|--
  “ (avl_left_rotation_cached_input before_high_level_spec avl_node_pre ) ”
.

Definition crtos_avl_balance_crtos_partial_solve_wit_6_aux := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (bf: Z) (child_bf: Z) (PreH1 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH2 : (bf = (avl_model_balance_factor (before_high_level_spec) (avl_node_pre)))) (PreH3 : (child_bf = (avl_model_balance_factor (before_high_level_spec) ((avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))))) (PreH4 : (bf < (-1))) (PreH5 : (child_bf <= 0)) (PreH6 : (avl_left_rotation_cached_input before_high_level_spec avl_node_pre )) ,
  (avl_tree_store (avl_with_root_cache (before_high_level_spec) (avl_node_pre) ((avl_height_of (before_high_level_spec) (avl_node_pre)))) )
|--
  “ (avl_left_rotation_cached_input before_high_level_spec avl_node_pre ) ” 
  &&  “ (avl_balance_graph_input before_high_level_spec avl_node_pre ) ” 
  &&  “ (bf = (avl_model_balance_factor (before_high_level_spec) (avl_node_pre))) ” 
  &&  “ (child_bf = (avl_model_balance_factor (before_high_level_spec) ((avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre))))))) ” 
  &&  “ (bf < (-1)) ” 
  &&  “ (child_bf <= 0) ” 
  &&  “ (avl_left_rotation_cached_input before_high_level_spec avl_node_pre ) ”
  &&  (avl_tree_store (avl_with_root_cache (before_high_level_spec) (avl_node_pre) ((avl_height_of (before_high_level_spec) (avl_node_pre)))) )
.

Definition crtos_avl_balance_crtos_partial_solve_wit_6 := crtos_avl_balance_crtos_partial_solve_wit_6_pure -> crtos_avl_balance_crtos_partial_solve_wit_6_aux.

Definition crtos_avl_balance_crtos_partial_solve_wit_7_pure := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (bf: Z) (child_bf: Z) (PreH1 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH2 : (bf = (avl_model_balance_factor (before_high_level_spec) (avl_node_pre)))) (PreH3 : (child_bf = (avl_model_balance_factor (before_high_level_spec) ((avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))))) (PreH4 : (bf < (-1))) (PreH5 : (child_bf > 0)) (PreH6 : (avl_rl_rotation_input before_high_level_spec avl_node_pre )) ,
  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "bf" ) )) # Int  |-> bf)
  **  ((( &( "child_bf" ) )) # Int  |-> child_bf)
  **  (avl_tree_store (avl_with_root_cache (before_high_level_spec) (avl_node_pre) ((avl_height_of (before_high_level_spec) (avl_node_pre)))) )
|--
  “ (avl_rl_rotation_input before_high_level_spec avl_node_pre ) ”
.

Definition crtos_avl_balance_crtos_partial_solve_wit_7_aux := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (bf: Z) (child_bf: Z) (PreH1 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH2 : (bf = (avl_model_balance_factor (before_high_level_spec) (avl_node_pre)))) (PreH3 : (child_bf = (avl_model_balance_factor (before_high_level_spec) ((avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))))) (PreH4 : (bf < (-1))) (PreH5 : (child_bf > 0)) (PreH6 : (avl_rl_rotation_input before_high_level_spec avl_node_pre )) ,
  (avl_tree_store (avl_with_root_cache (before_high_level_spec) (avl_node_pre) ((avl_height_of (before_high_level_spec) (avl_node_pre)))) )
|--
  “ (avl_rl_rotation_input before_high_level_spec avl_node_pre ) ” 
  &&  “ (avl_balance_graph_input before_high_level_spec avl_node_pre ) ” 
  &&  “ (bf = (avl_model_balance_factor (before_high_level_spec) (avl_node_pre))) ” 
  &&  “ (child_bf = (avl_model_balance_factor (before_high_level_spec) ((avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre))))))) ” 
  &&  “ (bf < (-1)) ” 
  &&  “ (child_bf > 0) ” 
  &&  “ (avl_rl_rotation_input before_high_level_spec avl_node_pre ) ”
  &&  (avl_tree_store (avl_with_root_cache (before_high_level_spec) (avl_node_pre) ((avl_height_of (before_high_level_spec) (avl_node_pre)))) )
.

Definition crtos_avl_balance_crtos_partial_solve_wit_7 := crtos_avl_balance_crtos_partial_solve_wit_7_pure -> crtos_avl_balance_crtos_partial_solve_wit_7_aux.

(*----- Function AvlTreeInsertNode -----*)

Definition AvlTreeInsertNode_safety_wit_1 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (PreH1 : (avl_insert_input before_low_level_spec avl_node_pre data_pre )) ,
  ((( &( "new_node" ) )) # Ptr  |->_)
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  (avl_subtree_store_at before_low_level_spec avl_node_pre )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition AvlTreeInsertNode_safety_wit_2 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (new_node: Z) (PreH1 : (avl_insert_input before_low_level_spec avl_node_pre data_pre )) (PreH2 : (new_node = 0)) (PreH3 : (avl_node_pre = 0)) ,
  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "new_node" ) )) # Ptr  |-> new_node)
  **  (avl_tree_store before_low_level_spec )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition AvlTreeInsertNode_safety_wit_3 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (new_node: Z) (PreH1 : (avl_insert_input before_low_level_spec avl_node_pre data_pre )) (PreH2 : (new_node = 0)) (PreH3 : (avl_node_pre <> 0)) (PreH4 : (avl_vvalid before_low_level_spec avl_node_pre )) ,
  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "new_node" ) )) # Ptr  |-> new_node)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition AvlTreeInsertNode_safety_wit_4 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (new_node: Z) (PreH1 : (0 <> avl_node_pre)) (PreH2 : (avl_insert_input before_low_level_spec avl_node_pre data_pre )) (PreH3 : (new_node = 0)) (PreH4 : (avl_node_pre = 0)) ,
  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "new_node" ) )) # Ptr  |-> new_node)
  **  (avl_tree_store before_low_level_spec )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ False ”
.

Definition AvlTreeInsertNode_safety_wit_5 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (new_node: Z) (PreH1 : (0 = avl_node_pre)) (PreH2 : (avl_insert_input before_low_level_spec avl_node_pre data_pre )) (PreH3 : (new_node = 0)) (PreH4 : (avl_node_pre <> 0)) (PreH5 : (avl_vvalid before_low_level_spec avl_node_pre )) ,
  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "new_node" ) )) # Ptr  |-> new_node)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ False ”
.

Definition AvlTreeInsertNode_safety_wit_6 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (new_node: Z) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (0 = avl_node_pre)) (PreH3 : (avl_insert_input before_low_level_spec avl_node_pre data_pre )) (PreH4 : (new_node = 0)) (PreH5 : (avl_node_pre = 0)) ,
  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "new_node" ) )) # Ptr  |-> retval)
  **  (avl_tree_store before_low_level_spec )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition AvlTreeInsertNode_safety_wit_7 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (new_node: Z) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (0 = avl_node_pre)) (PreH3 : (avl_insert_input before_low_level_spec avl_node_pre data_pre )) (PreH4 : (new_node = 0)) (PreH5 : (avl_node_pre = 0)) ,
  ((&((retval)  # "AvlNode" ->ₛ "data")) # Int  |->_)
  **  ((&((retval)  # "AvlNode" ->ₛ "height")) # UInt  |->_)
  **  ((&((retval)  # "AvlNode" ->ₛ "left")) # Ptr  |->_)
  **  ((&((retval)  # "AvlNode" ->ₛ "right")) # Ptr  |->_)
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "new_node" ) )) # Ptr  |-> retval)
  **  (avl_tree_store before_low_level_spec )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition AvlTreeInsertNode_safety_wit_8 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (new_node: Z) (retval: Z) (PreH1 : (0 <> retval)) (PreH2 : (retval = 0)) (PreH3 : (0 = avl_node_pre)) (PreH4 : (avl_insert_input before_low_level_spec avl_node_pre data_pre )) (PreH5 : (new_node = 0)) (PreH6 : (avl_node_pre = 0)) ,
  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "new_node" ) )) # Ptr  |-> retval)
  **  (avl_tree_store before_low_level_spec )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ False ”
.

Definition AvlTreeInsertNode_safety_wit_9 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (new_node: Z) (retval: Z) (PreH1 : (0 = retval)) (PreH2 : (retval <> 0)) (PreH3 : (0 = avl_node_pre)) (PreH4 : (avl_insert_input before_low_level_spec avl_node_pre data_pre )) (PreH5 : (new_node = 0)) (PreH6 : (avl_node_pre = 0)) ,
  ((&((retval)  # "AvlNode" ->ₛ "data")) # Int  |->_)
  **  ((&((retval)  # "AvlNode" ->ₛ "height")) # UInt  |->_)
  **  ((&((retval)  # "AvlNode" ->ₛ "left")) # Ptr  |->_)
  **  ((&((retval)  # "AvlNode" ->ₛ "right")) # Ptr  |->_)
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "new_node" ) )) # Ptr  |-> retval)
  **  (avl_tree_store before_low_level_spec )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ False ”
.

Definition AvlTreeInsertNode_safety_wit_10 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (new_node: Z) (retval: Z) (PreH1 : (0 = retval)) (PreH2 : (retval = 0)) (PreH3 : (0 = avl_node_pre)) (PreH4 : (avl_insert_input before_low_level_spec avl_node_pre data_pre )) (PreH5 : (new_node = 0)) (PreH6 : (avl_node_pre = 0)) ,
  (store_stringLit (LitMap_low_level_spec (("AvlTreeInsertNode malloc AvlNode failed
"%string))) ("AvlTreeInsertNode malloc AvlNode failed
"%string) )
  **  (GlobalStrings_missing LitMap_low_level_spec (cons (("AvlTreeInsertNode malloc AvlNode failed
"%string)) ((@nil string))) )
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "new_node" ) )) # Ptr  |-> retval)
  **  (avl_tree_store before_low_level_spec )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition AvlTreeInsertNode_safety_wit_11 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (new_node: Z) (retval: Z) (PreH1 : (0 = retval)) (PreH2 : (retval = 0)) (PreH3 : (0 = avl_node_pre)) (PreH4 : (avl_insert_input before_low_level_spec avl_node_pre data_pre )) (PreH5 : (new_node = 0)) (PreH6 : (avl_node_pre = 0)) ,
  (store_stringLit (LitMap_low_level_spec (("AvlTreeInsertNode malloc AvlNode failed
"%string))) ("AvlTreeInsertNode malloc AvlNode failed
"%string) )
  **  (GlobalStrings_missing LitMap_low_level_spec (cons (("AvlTreeInsertNode malloc AvlNode failed
"%string)) ((@nil string))) )
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "new_node" ) )) # Ptr  |-> retval)
  **  (avl_tree_store before_low_level_spec )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition AvlTreeInsertNode_safety_wit_12 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (new_node: Z) (retval: Z) (PreH1 : (0 <> retval)) (PreH2 : (retval <> 0)) (PreH3 : (0 = avl_node_pre)) (PreH4 : (avl_insert_input before_low_level_spec avl_node_pre data_pre )) (PreH5 : (new_node = 0)) (PreH6 : (avl_node_pre = 0)) ,
  ((&((retval)  # "AvlNode" ->ₛ "data")) # Int  |-> data_pre)
  **  ((&((retval)  # "AvlNode" ->ₛ "height")) # UInt  |->_)
  **  ((&((retval)  # "AvlNode" ->ₛ "left")) # Ptr  |->_)
  **  ((&((retval)  # "AvlNode" ->ₛ "right")) # Ptr  |->_)
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "new_node" ) )) # Ptr  |-> retval)
  **  (avl_tree_store before_low_level_spec )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition AvlTreeInsertNode_safety_wit_13 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (new_node: Z) (retval: Z) (PreH1 : (0 <> retval)) (PreH2 : (retval <> 0)) (PreH3 : (0 = avl_node_pre)) (PreH4 : (avl_insert_input before_low_level_spec avl_node_pre data_pre )) (PreH5 : (new_node = 0)) (PreH6 : (avl_node_pre = 0)) ,
  ((&((retval)  # "AvlNode" ->ₛ "data")) # Int  |-> data_pre)
  **  ((&((retval)  # "AvlNode" ->ₛ "height")) # UInt  |->_)
  **  ((&((retval)  # "AvlNode" ->ₛ "left")) # Ptr  |-> 0)
  **  ((&((retval)  # "AvlNode" ->ₛ "right")) # Ptr  |->_)
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "new_node" ) )) # Ptr  |-> retval)
  **  (avl_tree_store before_low_level_spec )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition AvlTreeInsertNode_safety_wit_14 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (new_node: Z) (retval: Z) (PreH1 : (0 <> retval)) (PreH2 : (retval <> 0)) (PreH3 : (0 = avl_node_pre)) (PreH4 : (avl_insert_input before_low_level_spec avl_node_pre data_pre )) (PreH5 : (new_node = 0)) (PreH6 : (avl_node_pre = 0)) ,
  ((&((retval)  # "AvlNode" ->ₛ "data")) # Int  |-> data_pre)
  **  ((&((retval)  # "AvlNode" ->ₛ "height")) # UInt  |->_)
  **  ((&((retval)  # "AvlNode" ->ₛ "left")) # Ptr  |-> 0)
  **  ((&((retval)  # "AvlNode" ->ₛ "right")) # Ptr  |-> 0)
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "new_node" ) )) # Ptr  |-> retval)
  **  (avl_tree_store before_low_level_spec )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition AvlTreeInsertNode_safety_wit_15 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (new_node: Z) (PreH1 : (data_pre = (avl_key_of (before_low_level_spec) (avl_node_pre)))) (PreH2 : (0 <> avl_node_pre)) (PreH3 : (avl_insert_input before_low_level_spec avl_node_pre data_pre )) (PreH4 : (new_node = 0)) (PreH5 : (avl_node_pre <> 0)) (PreH6 : (avl_vvalid before_low_level_spec avl_node_pre )) ,
  (store_stringLit (LitMap_low_level_spec (("the input data is already existed. just return
"%string))) ("the input data is already existed. just return
"%string) )
  **  (GlobalStrings_missing LitMap_low_level_spec (cons (("the input data is already existed. just return
"%string)) ((@nil string))) )
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "new_node" ) )) # Ptr  |-> new_node)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition AvlTreeInsertNode_safety_wit_16 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (new_node: Z) (after: avl_model) (retval: Z) (PreH1 : (strict_insert_outcome (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) after data_pre retval )) (PreH2 : (avl_insert_input before_low_level_spec avl_node_pre data_pre )) (PreH3 : (new_node = 0)) (PreH4 : (avl_node_pre <> 0)) (PreH5 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) < data_pre)) (PreH6 : (avl_insert_input (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) data_pre )) ,
  (avl_tree_store after )
  **  (GlobalStrings LitMap_low_level_spec )
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "new_node" ) )) # Ptr  |-> new_node)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> retval)
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition AvlTreeInsertNode_safety_wit_17 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (new_node: Z) (after: avl_model) (retval: Z) (PreH1 : (0 = retval)) (PreH2 : (strict_insert_outcome (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) after data_pre retval )) (PreH3 : (avl_insert_input before_low_level_spec avl_node_pre data_pre )) (PreH4 : (new_node = 0)) (PreH5 : (avl_node_pre <> 0)) (PreH6 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) < data_pre)) (PreH7 : (avl_insert_input (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) data_pre )) ,
  (store_stringLit (LitMap_low_level_spec (("AvlTreeInsertNode find right avl_node data failed
"%string))) ("AvlTreeInsertNode find right avl_node data failed
"%string) )
  **  (GlobalStrings_missing LitMap_low_level_spec (cons (("AvlTreeInsertNode find right avl_node data failed
"%string)) ((@nil string))) )
  **  (avl_tree_store after )
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "new_node" ) )) # Ptr  |-> new_node)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> retval)
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition AvlTreeInsertNode_safety_wit_18 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (new_node: Z) (after: avl_model) (retval: Z) (PreH1 : (0 = retval)) (PreH2 : (strict_insert_outcome (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) after data_pre retval )) (PreH3 : (avl_insert_input before_low_level_spec avl_node_pre data_pre )) (PreH4 : (new_node = 0)) (PreH5 : (avl_node_pre <> 0)) (PreH6 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) < data_pre)) (PreH7 : (avl_insert_input (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) data_pre )) ,
  (store_stringLit (LitMap_low_level_spec (("AvlTreeInsertNode find right avl_node data failed
"%string))) ("AvlTreeInsertNode find right avl_node data failed
"%string) )
  **  (GlobalStrings_missing LitMap_low_level_spec (cons (("AvlTreeInsertNode find right avl_node data failed
"%string)) ((@nil string))) )
  **  (avl_tree_store after )
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "new_node" ) )) # Ptr  |-> new_node)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> retval)
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition AvlTreeInsertNode_safety_wit_19 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (new_node: Z) (after: avl_model) (retval: Z) (PreH1 : (strict_insert_outcome (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) after data_pre retval )) (PreH2 : (avl_insert_input before_low_level_spec avl_node_pre data_pre )) (PreH3 : (new_node = 0)) (PreH4 : (avl_node_pre <> 0)) (PreH5 : (data_pre < (avl_key_of (before_low_level_spec) (avl_node_pre)))) (PreH6 : (avl_insert_input (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) data_pre )) ,
  (avl_tree_store after )
  **  (GlobalStrings LitMap_low_level_spec )
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "new_node" ) )) # Ptr  |-> new_node)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> retval)
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition AvlTreeInsertNode_safety_wit_20 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (new_node: Z) (after: avl_model) (retval: Z) (PreH1 : (0 = retval)) (PreH2 : (strict_insert_outcome (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) after data_pre retval )) (PreH3 : (avl_insert_input before_low_level_spec avl_node_pre data_pre )) (PreH4 : (new_node = 0)) (PreH5 : (avl_node_pre <> 0)) (PreH6 : (data_pre < (avl_key_of (before_low_level_spec) (avl_node_pre)))) (PreH7 : (avl_insert_input (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) data_pre )) ,
  (store_stringLit (LitMap_low_level_spec (("AvlTreeInsertNode find left avl_node data failed
"%string))) ("AvlTreeInsertNode find left avl_node data failed
"%string) )
  **  (GlobalStrings_missing LitMap_low_level_spec (cons (("AvlTreeInsertNode find left avl_node data failed
"%string)) ((@nil string))) )
  **  (avl_tree_store after )
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "new_node" ) )) # Ptr  |-> new_node)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> retval)
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition AvlTreeInsertNode_safety_wit_21 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (new_node: Z) (after: avl_model) (retval: Z) (PreH1 : (0 = retval)) (PreH2 : (strict_insert_outcome (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) after data_pre retval )) (PreH3 : (avl_insert_input before_low_level_spec avl_node_pre data_pre )) (PreH4 : (new_node = 0)) (PreH5 : (avl_node_pre <> 0)) (PreH6 : (data_pre < (avl_key_of (before_low_level_spec) (avl_node_pre)))) (PreH7 : (avl_insert_input (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) data_pre )) ,
  (store_stringLit (LitMap_low_level_spec (("AvlTreeInsertNode find left avl_node data failed
"%string))) ("AvlTreeInsertNode find left avl_node data failed
"%string) )
  **  (GlobalStrings_missing LitMap_low_level_spec (cons (("AvlTreeInsertNode find left avl_node data failed
"%string)) ((@nil string))) )
  **  (avl_tree_store after )
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "new_node" ) )) # Ptr  |-> new_node)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> retval)
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition AvlTreeInsertNode_entail_wit_1 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (PreH1 : (avl_insert_input before_low_level_spec avl_node_pre data_pre )) ,
  (avl_subtree_store_at before_low_level_spec avl_node_pre )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  (“ (avl_insert_input before_low_level_spec avl_node_pre data_pre ) ” 
  &&  “ (0 = 0) ” 
  &&  “ (avl_node_pre = 0) ”
  &&  (avl_tree_store before_low_level_spec )
  **  (GlobalStrings LitMap_low_level_spec ))
  ||
  (“ (avl_insert_input before_low_level_spec avl_node_pre data_pre ) ” 
  &&  “ (0 = 0) ” 
  &&  “ (avl_node_pre <> 0) ” 
  &&  “ (avl_vvalid before_low_level_spec avl_node_pre ) ”
  &&  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec ))
.

Definition AvlTreeInsertNode_entail_wit_2 := 
(
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (new_node: Z) (PreH1 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) < data_pre)) (PreH2 : (data_pre <> (avl_key_of (before_low_level_spec) (avl_node_pre)))) (PreH3 : (0 <> avl_node_pre)) (PreH4 : (avl_insert_input before_low_level_spec avl_node_pre data_pre )) (PreH5 : (new_node = 0)) (PreH6 : (avl_node_pre <> 0)) (PreH7 : (avl_vvalid before_low_level_spec avl_node_pre )) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (avl_insert_input before_low_level_spec avl_node_pre data_pre ) ” 
  &&  “ (new_node = 0) ” 
  &&  “ (avl_node_pre <> 0) ” 
  &&  “ ((avl_key_of (before_low_level_spec) (avl_node_pre)) < data_pre) ” 
  &&  “ (avl_insert_input (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) data_pre ) ”
  &&  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
) \/
(
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (new_node: Z) (PreH1 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) < data_pre)) (PreH2 : (data_pre <> (avl_key_of (before_low_level_spec) (avl_node_pre)))) (PreH3 : (0 <> avl_node_pre)) (PreH4 : (avl_insert_input before_low_level_spec avl_node_pre data_pre )) (PreH5 : (new_node = 0)) (PreH6 : (avl_node_pre <> 0)) (PreH7 : (avl_vvalid before_low_level_spec avl_node_pre )) ,
  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (avl_insert_input (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) data_pre ) ”
  &&  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
).

Definition AvlTreeInsertNode_entail_wit_2_split_goal_1 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (new_node: Z) (PreH1 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) < data_pre)) (PreH2 : (data_pre <> (avl_key_of (before_low_level_spec) (avl_node_pre)))) (PreH3 : (0 <> avl_node_pre)) (PreH4 : (avl_insert_input before_low_level_spec avl_node_pre data_pre )) (PreH5 : (new_node = 0)) (PreH6 : (avl_node_pre <> 0)) (PreH7 : (avl_vvalid before_low_level_spec avl_node_pre )) ,
  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (avl_insert_input (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) data_pre ) ”
.

Definition AvlTreeInsertNode_entail_wit_2_split_goal_spatial := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (new_node: Z) (PreH1 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) < data_pre)) (PreH2 : (data_pre <> (avl_key_of (before_low_level_spec) (avl_node_pre)))) (PreH3 : (0 <> avl_node_pre)) (PreH4 : (avl_insert_input before_low_level_spec avl_node_pre data_pre )) (PreH5 : (new_node = 0)) (PreH6 : (avl_node_pre <> 0)) (PreH7 : (avl_vvalid before_low_level_spec avl_node_pre )) ,
  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
.

Definition AvlTreeInsertNode_entail_wit_3 := 
(
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (new_node: Z) (PreH1 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) >= data_pre)) (PreH2 : (data_pre <> (avl_key_of (before_low_level_spec) (avl_node_pre)))) (PreH3 : (0 <> avl_node_pre)) (PreH4 : (avl_insert_input before_low_level_spec avl_node_pre data_pre )) (PreH5 : (new_node = 0)) (PreH6 : (avl_node_pre <> 0)) (PreH7 : (avl_vvalid before_low_level_spec avl_node_pre )) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (avl_insert_input before_low_level_spec avl_node_pre data_pre ) ” 
  &&  “ (new_node = 0) ” 
  &&  “ (avl_node_pre <> 0) ” 
  &&  “ (data_pre < (avl_key_of (before_low_level_spec) (avl_node_pre))) ” 
  &&  “ (avl_insert_input (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) data_pre ) ”
  &&  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
) \/
(
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (new_node: Z) (PreH1 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) >= data_pre)) (PreH2 : (data_pre <> (avl_key_of (before_low_level_spec) (avl_node_pre)))) (PreH3 : (0 <> avl_node_pre)) (PreH4 : (avl_insert_input before_low_level_spec avl_node_pre data_pre )) (PreH5 : (new_node = 0)) (PreH6 : (avl_node_pre <> 0)) (PreH7 : (avl_vvalid before_low_level_spec avl_node_pre )) ,
  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (avl_insert_input (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) data_pre ) ” 
  &&  “ (data_pre < (avl_key_of (before_low_level_spec) (avl_node_pre))) ”
  &&  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
).

Definition AvlTreeInsertNode_entail_wit_3_split_goal_1 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (new_node: Z) (PreH1 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) >= data_pre)) (PreH2 : (data_pre <> (avl_key_of (before_low_level_spec) (avl_node_pre)))) (PreH3 : (0 <> avl_node_pre)) (PreH4 : (avl_insert_input before_low_level_spec avl_node_pre data_pre )) (PreH5 : (new_node = 0)) (PreH6 : (avl_node_pre <> 0)) (PreH7 : (avl_vvalid before_low_level_spec avl_node_pre )) ,
  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (avl_insert_input (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) data_pre ) ”
.

Definition AvlTreeInsertNode_entail_wit_3_split_goal_2 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (new_node: Z) (PreH1 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) >= data_pre)) (PreH2 : (data_pre <> (avl_key_of (before_low_level_spec) (avl_node_pre)))) (PreH3 : (0 <> avl_node_pre)) (PreH4 : (avl_insert_input before_low_level_spec avl_node_pre data_pre )) (PreH5 : (new_node = 0)) (PreH6 : (avl_node_pre <> 0)) (PreH7 : (avl_vvalid before_low_level_spec avl_node_pre )) ,
  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (data_pre < (avl_key_of (before_low_level_spec) (avl_node_pre))) ”
.

Definition AvlTreeInsertNode_entail_wit_3_split_goal_spatial := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (new_node: Z) (PreH1 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) >= data_pre)) (PreH2 : (data_pre <> (avl_key_of (before_low_level_spec) (avl_node_pre)))) (PreH3 : (0 <> avl_node_pre)) (PreH4 : (avl_insert_input before_low_level_spec avl_node_pre data_pre )) (PreH5 : (new_node = 0)) (PreH6 : (avl_node_pre <> 0)) (PreH7 : (avl_vvalid before_low_level_spec avl_node_pre )) ,
  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
.

Definition AvlTreeInsertNode_entail_wit_4_1 := 
(
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (new_node: Z) (retval: Z) (PreH1 : (0 <> retval)) (PreH2 : (retval <> 0)) (PreH3 : (0 = avl_node_pre)) (PreH4 : (avl_insert_input before_low_level_spec avl_node_pre data_pre )) (PreH5 : (new_node = 0)) (PreH6 : (avl_node_pre = 0)) ,
  ((&((retval)  # "AvlNode" ->ₛ "data")) # Int  |-> data_pre)
  **  ((&((retval)  # "AvlNode" ->ₛ "height")) # UInt  |-> 1)
  **  ((&((retval)  # "AvlNode" ->ₛ "left")) # Ptr  |-> 0)
  **  ((&((retval)  # "AvlNode" ->ₛ "right")) # Ptr  |-> 0)
  **  (avl_tree_store before_low_level_spec )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  EX (old_cache: Z)  (raw: avl_model) ,
  “ (strict_insert_pending before_low_level_spec raw data_pre retval ) ” 
  &&  “ (retval = (avl_ptr_of ((avl_root (raw))))) ” 
  &&  “ (avl_tree_valid raw ) ” 
  &&  “ (avl_update_height_children_safe raw retval ) ” 
  &&  “ (avl_balance_graph_input raw retval ) ”
  &&  (avl_tree_store (avl_with_root_cache (raw) (retval) (old_cache)) )
  **  (GlobalStrings LitMap_low_level_spec )
) \/
(
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (new_node: Z) (retval: Z) (PreH1 : (1 <= UINT_MAX)) (PreH2 : (1 >= 0)) (PreH3 : (data_pre <= INT_MAX)) (PreH4 : (data_pre >= INT_MIN)) (PreH5 : (0 <> retval)) (PreH6 : (retval <> 0)) (PreH7 : (0 = avl_node_pre)) (PreH8 : (avl_insert_input before_low_level_spec avl_node_pre data_pre )) (PreH9 : (new_node = 0)) (PreH10 : (avl_node_pre = 0)) ,
  ((&((retval)  # "AvlNode" ->ₛ "data")) # Int  |-> data_pre)
  **  ((&((retval)  # "AvlNode" ->ₛ "height")) # UInt  |-> 1)
  **  ((&((retval)  # "AvlNode" ->ₛ "left")) # Ptr  |-> 0)
  **  ((&((retval)  # "AvlNode" ->ₛ "right")) # Ptr  |-> 0)
  **  (avl_tree_store before_low_level_spec )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  EX (old_cache: Z)  (raw: avl_model) ,
  “ (strict_insert_pending before_low_level_spec raw data_pre retval ) ” 
  &&  “ (retval = (avl_ptr_of ((avl_root (raw))))) ” 
  &&  “ (avl_tree_valid raw ) ” 
  &&  “ (avl_update_height_children_safe raw retval ) ” 
  &&  “ (avl_balance_graph_input raw retval ) ”
  &&  (avl_tree_store (avl_with_root_cache (raw) (retval) (old_cache)) )
  **  (GlobalStrings LitMap_low_level_spec )
).

Definition AvlTreeInsertNode_entail_wit_4_2 := 
(
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (new_node: Z) (after: avl_model) (retval: Z) (PreH1 : (0 <> retval)) (PreH2 : (strict_insert_outcome (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) after data_pre retval )) (PreH3 : (avl_insert_input before_low_level_spec avl_node_pre data_pre )) (PreH4 : (new_node = 0)) (PreH5 : (avl_node_pre <> 0)) (PreH6 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) < data_pre)) (PreH7 : (avl_insert_input (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) data_pre )) ,
  (avl_tree_store after )
  **  (GlobalStrings LitMap_low_level_spec )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> retval)
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
|--
  EX (old_cache: Z)  (raw: avl_model) ,
  “ (strict_insert_pending before_low_level_spec raw data_pre avl_node_pre ) ” 
  &&  “ (avl_node_pre = (avl_ptr_of ((avl_root (raw))))) ” 
  &&  “ (avl_tree_valid raw ) ” 
  &&  “ (avl_update_height_children_safe raw avl_node_pre ) ” 
  &&  “ (avl_balance_graph_input raw avl_node_pre ) ”
  &&  (avl_tree_store (avl_with_root_cache (raw) (avl_node_pre) (old_cache)) )
  **  (GlobalStrings LitMap_low_level_spec )
) \/
(
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (new_node: Z) (after: avl_model) (retval: Z) (PreH1 : ((avl_height_of (before_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH2 : ((avl_height_of (before_low_level_spec) (avl_node_pre)) >= 0)) (PreH3 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH5 : (0 <> retval)) (PreH6 : (strict_insert_outcome (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) after data_pre retval )) (PreH7 : (avl_insert_input before_low_level_spec avl_node_pre data_pre )) (PreH8 : (new_node = 0)) (PreH9 : (avl_node_pre <> 0)) (PreH10 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) < data_pre)) (PreH11 : (avl_insert_input (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) data_pre )) ,
  (avl_tree_store after )
  **  (GlobalStrings LitMap_low_level_spec )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> retval)
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
|--
  EX (old_cache: Z)  (raw: avl_model) ,
  “ (strict_insert_pending before_low_level_spec raw data_pre avl_node_pre ) ” 
  &&  “ (avl_node_pre = (avl_ptr_of ((avl_root (raw))))) ” 
  &&  “ (avl_tree_valid raw ) ” 
  &&  “ (avl_update_height_children_safe raw avl_node_pre ) ” 
  &&  “ (avl_balance_graph_input raw avl_node_pre ) ”
  &&  (avl_tree_store (avl_with_root_cache (raw) (avl_node_pre) (old_cache)) )
  **  (GlobalStrings LitMap_low_level_spec )
).

Definition AvlTreeInsertNode_entail_wit_4_3 := 
(
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (new_node: Z) (after: avl_model) (retval: Z) (PreH1 : (0 <> retval)) (PreH2 : (strict_insert_outcome (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) after data_pre retval )) (PreH3 : (avl_insert_input before_low_level_spec avl_node_pre data_pre )) (PreH4 : (new_node = 0)) (PreH5 : (avl_node_pre <> 0)) (PreH6 : (data_pre < (avl_key_of (before_low_level_spec) (avl_node_pre)))) (PreH7 : (avl_insert_input (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) data_pre )) ,
  (avl_tree_store after )
  **  (GlobalStrings LitMap_low_level_spec )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> retval)
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
|--
  EX (old_cache: Z)  (raw: avl_model) ,
  “ (strict_insert_pending before_low_level_spec raw data_pre avl_node_pre ) ” 
  &&  “ (avl_node_pre = (avl_ptr_of ((avl_root (raw))))) ” 
  &&  “ (avl_tree_valid raw ) ” 
  &&  “ (avl_update_height_children_safe raw avl_node_pre ) ” 
  &&  “ (avl_balance_graph_input raw avl_node_pre ) ”
  &&  (avl_tree_store (avl_with_root_cache (raw) (avl_node_pre) (old_cache)) )
  **  (GlobalStrings LitMap_low_level_spec )
) \/
(
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (new_node: Z) (after: avl_model) (retval: Z) (PreH1 : ((avl_height_of (before_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH2 : ((avl_height_of (before_low_level_spec) (avl_node_pre)) >= 0)) (PreH3 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH5 : (0 <> retval)) (PreH6 : (strict_insert_outcome (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) after data_pre retval )) (PreH7 : (avl_insert_input before_low_level_spec avl_node_pre data_pre )) (PreH8 : (new_node = 0)) (PreH9 : (avl_node_pre <> 0)) (PreH10 : (data_pre < (avl_key_of (before_low_level_spec) (avl_node_pre)))) (PreH11 : (avl_insert_input (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) data_pre )) ,
  (avl_tree_store after )
  **  (GlobalStrings LitMap_low_level_spec )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> retval)
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
|--
  EX (old_cache: Z)  (raw: avl_model) ,
  “ (strict_insert_pending before_low_level_spec raw data_pre avl_node_pre ) ” 
  &&  “ (avl_node_pre = (avl_ptr_of ((avl_root (raw))))) ” 
  &&  “ (avl_tree_valid raw ) ” 
  &&  “ (avl_update_height_children_safe raw avl_node_pre ) ” 
  &&  “ (avl_balance_graph_input raw avl_node_pre ) ”
  &&  (avl_tree_store (avl_with_root_cache (raw) (avl_node_pre) (old_cache)) )
  **  (GlobalStrings LitMap_low_level_spec )
).

Definition AvlTreeInsertNode_return_wit_1 := 
(
forall (data_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (avl_node: Z) (raw: avl_model) (after_2: avl_model) (retval: Z) (PreH1 : (avl_balance_graph_result raw after_2 retval )) (PreH2 : (avl_balance_height_effect raw after_2 )) (PreH3 : (strict_balance_identity raw after_2 )) (PreH4 : (strict_insert_pending before_low_level_spec raw data_pre avl_node )) (PreH5 : (avl_node = (avl_ptr_of ((avl_root (raw)))))) (PreH6 : (avl_tree_valid raw )) (PreH7 : (avl_update_height_children_safe raw avl_node )) (PreH8 : (avl_balance_graph_input raw avl_node )) ,
  (avl_tree_store after_2 )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  EX (after: avl_model) ,
  “ (strict_insert_outcome before_low_level_spec after data_pre retval ) ”
  &&  (avl_tree_store after )
  **  (GlobalStrings LitMap_low_level_spec )
) \/
(
forall (data_pre: Z) (before_low_level_spec: avl_model) (avl_node: Z) (raw: avl_model) (after_2: avl_model) (retval: Z) (PreH1 : (avl_balance_graph_result raw after_2 retval )) (PreH2 : (avl_balance_height_effect raw after_2 )) (PreH3 : (strict_balance_identity raw after_2 )) (PreH4 : (strict_insert_pending before_low_level_spec raw data_pre avl_node )) (PreH5 : (avl_node = (avl_ptr_of ((avl_root (raw)))))) (PreH6 : (avl_tree_valid raw )) (PreH7 : (avl_update_height_children_safe raw avl_node )) (PreH8 : (avl_balance_graph_input raw avl_node )) ,
  TT && emp 
|--
  “ (strict_insert_outcome before_low_level_spec after_2 data_pre retval ) ”
  &&  emp
).

Definition AvlTreeInsertNode_return_wit_1_split_goal_1 := 
forall (data_pre: Z) (before_low_level_spec: avl_model) (avl_node: Z) (raw: avl_model) (after_2: avl_model) (retval: Z) (PreH1 : (avl_balance_graph_result raw after_2 retval )) (PreH2 : (avl_balance_height_effect raw after_2 )) (PreH3 : (strict_balance_identity raw after_2 )) (PreH4 : (strict_insert_pending before_low_level_spec raw data_pre avl_node )) (PreH5 : (avl_node = (avl_ptr_of ((avl_root (raw)))))) (PreH6 : (avl_tree_valid raw )) (PreH7 : (avl_update_height_children_safe raw avl_node )) (PreH8 : (avl_balance_graph_input raw avl_node )) ,
  (strict_insert_outcome before_low_level_spec after_2 data_pre retval )
.

Definition AvlTreeInsertNode_return_wit_2 := 
(
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (new_node: Z) (after_2: avl_model) (retval: Z) (PreH1 : (0 = retval)) (PreH2 : (strict_insert_outcome (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) after_2 data_pre retval )) (PreH3 : (avl_insert_input before_low_level_spec avl_node_pre data_pre )) (PreH4 : (new_node = 0)) (PreH5 : (avl_node_pre <> 0)) (PreH6 : (data_pre < (avl_key_of (before_low_level_spec) (avl_node_pre)))) (PreH7 : (avl_insert_input (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) data_pre )) ,
  (store_stringLit (LitMap_low_level_spec (("AvlTreeInsertNode find left avl_node data failed
"%string))) ("AvlTreeInsertNode find left avl_node data failed
"%string) )
  **  (GlobalStrings_missing LitMap_low_level_spec (cons (("AvlTreeInsertNode find left avl_node data failed
"%string)) ((@nil string))) )
  **  (avl_tree_store after_2 )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> retval)
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
|--
  EX (after: avl_model) ,
  “ (strict_insert_outcome before_low_level_spec after data_pre 0 ) ”
  &&  (avl_tree_store after )
  **  (GlobalStrings LitMap_low_level_spec )
) \/
(
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (new_node: Z) (after_2: avl_model) (retval: Z) (PreH1 : ((avl_height_of (before_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH2 : ((avl_height_of (before_low_level_spec) (avl_node_pre)) >= 0)) (PreH3 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH5 : (0 = retval)) (PreH6 : (strict_insert_outcome (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) after_2 data_pre retval )) (PreH7 : (avl_insert_input before_low_level_spec avl_node_pre data_pre )) (PreH8 : (new_node = 0)) (PreH9 : (avl_node_pre <> 0)) (PreH10 : (data_pre < (avl_key_of (before_low_level_spec) (avl_node_pre)))) (PreH11 : (avl_insert_input (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) data_pre )) ,
  (GlobalStrings LitMap_low_level_spec )
  **  (avl_tree_store after_2 )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> retval)
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
|--
  EX (after: avl_model) ,
  “ (strict_insert_outcome before_low_level_spec after data_pre 0 ) ”
  &&  (avl_tree_store after )
  **  (GlobalStrings LitMap_low_level_spec )
).

Definition AvlTreeInsertNode_return_wit_3 := 
(
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (new_node: Z) (after_2: avl_model) (retval: Z) (PreH1 : (0 = retval)) (PreH2 : (strict_insert_outcome (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) after_2 data_pre retval )) (PreH3 : (avl_insert_input before_low_level_spec avl_node_pre data_pre )) (PreH4 : (new_node = 0)) (PreH5 : (avl_node_pre <> 0)) (PreH6 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) < data_pre)) (PreH7 : (avl_insert_input (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) data_pre )) ,
  (store_stringLit (LitMap_low_level_spec (("AvlTreeInsertNode find right avl_node data failed
"%string))) ("AvlTreeInsertNode find right avl_node data failed
"%string) )
  **  (GlobalStrings_missing LitMap_low_level_spec (cons (("AvlTreeInsertNode find right avl_node data failed
"%string)) ((@nil string))) )
  **  (avl_tree_store after_2 )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> retval)
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
|--
  EX (after: avl_model) ,
  “ (strict_insert_outcome before_low_level_spec after data_pre 0 ) ”
  &&  (avl_tree_store after )
  **  (GlobalStrings LitMap_low_level_spec )
) \/
(
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (new_node: Z) (after_2: avl_model) (retval: Z) (PreH1 : ((avl_height_of (before_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH2 : ((avl_height_of (before_low_level_spec) (avl_node_pre)) >= 0)) (PreH3 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH5 : (0 = retval)) (PreH6 : (strict_insert_outcome (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) after_2 data_pre retval )) (PreH7 : (avl_insert_input before_low_level_spec avl_node_pre data_pre )) (PreH8 : (new_node = 0)) (PreH9 : (avl_node_pre <> 0)) (PreH10 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) < data_pre)) (PreH11 : (avl_insert_input (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) data_pre )) ,
  (GlobalStrings LitMap_low_level_spec )
  **  (avl_tree_store after_2 )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> retval)
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
|--
  EX (after: avl_model) ,
  “ (strict_insert_outcome before_low_level_spec after data_pre 0 ) ”
  &&  (avl_tree_store after )
  **  (GlobalStrings LitMap_low_level_spec )
).

Definition AvlTreeInsertNode_return_wit_4 := 
(
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (new_node: Z) (PreH1 : (data_pre = (avl_key_of (before_low_level_spec) (avl_node_pre)))) (PreH2 : (0 <> avl_node_pre)) (PreH3 : (avl_insert_input before_low_level_spec avl_node_pre data_pre )) (PreH4 : (new_node = 0)) (PreH5 : (avl_node_pre <> 0)) (PreH6 : (avl_vvalid before_low_level_spec avl_node_pre )) ,
  (store_stringLit (LitMap_low_level_spec (("the input data is already existed. just return
"%string))) ("the input data is already existed. just return
"%string) )
  **  (GlobalStrings_missing LitMap_low_level_spec (cons (("the input data is already existed. just return
"%string)) ((@nil string))) )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
|--
  EX (after: avl_model) ,
  “ (strict_insert_outcome before_low_level_spec after data_pre avl_node_pre ) ”
  &&  (avl_tree_store after )
  **  (GlobalStrings LitMap_low_level_spec )
) \/
(
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (new_node: Z) (PreH1 : ((avl_height_of (before_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH2 : ((avl_height_of (before_low_level_spec) (avl_node_pre)) >= 0)) (PreH3 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH5 : (data_pre = (avl_key_of (before_low_level_spec) (avl_node_pre)))) (PreH6 : (0 <> avl_node_pre)) (PreH7 : (avl_insert_input before_low_level_spec avl_node_pre data_pre )) (PreH8 : (new_node = 0)) (PreH9 : (avl_node_pre <> 0)) (PreH10 : (avl_vvalid before_low_level_spec avl_node_pre )) ,
  (GlobalStrings LitMap_low_level_spec )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
|--
  EX (after: avl_model) ,
  “ (strict_insert_outcome before_low_level_spec after data_pre avl_node_pre ) ”
  &&  (avl_tree_store after )
  **  (GlobalStrings LitMap_low_level_spec )
).

Definition AvlTreeInsertNode_return_wit_5 := 
(
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (new_node: Z) (retval: Z) (PreH1 : (0 = retval)) (PreH2 : (retval = 0)) (PreH3 : (0 = avl_node_pre)) (PreH4 : (avl_insert_input before_low_level_spec avl_node_pre data_pre )) (PreH5 : (new_node = 0)) (PreH6 : (avl_node_pre = 0)) ,
  (store_stringLit (LitMap_low_level_spec (("AvlTreeInsertNode malloc AvlNode failed
"%string))) ("AvlTreeInsertNode malloc AvlNode failed
"%string) )
  **  (GlobalStrings_missing LitMap_low_level_spec (cons (("AvlTreeInsertNode malloc AvlNode failed
"%string)) ((@nil string))) )
  **  (avl_tree_store before_low_level_spec )
|--
  EX (after: avl_model) ,
  “ (strict_insert_outcome before_low_level_spec after data_pre 0 ) ”
  &&  (avl_tree_store after )
  **  (GlobalStrings LitMap_low_level_spec )
) \/
(
forall (data_pre: Z) (avl_node_pre: Z) (before_low_level_spec: avl_model) (new_node: Z) (retval: Z) (PreH1 : (0 = retval)) (PreH2 : (retval = 0)) (PreH3 : (0 = avl_node_pre)) (PreH4 : (avl_insert_input before_low_level_spec avl_node_pre data_pre )) (PreH5 : (new_node = 0)) (PreH6 : (avl_node_pre = 0)) ,
  TT && emp 
|--
  “ (strict_insert_outcome before_low_level_spec before_low_level_spec data_pre 0 ) ”
  &&  emp
).

Definition AvlTreeInsertNode_return_wit_5_split_goal_1 := 
forall (data_pre: Z) (avl_node_pre: Z) (before_low_level_spec: avl_model) (new_node: Z) (retval: Z) (PreH1 : (0 = retval)) (PreH2 : (retval = 0)) (PreH3 : (0 = avl_node_pre)) (PreH4 : (avl_insert_input before_low_level_spec avl_node_pre data_pre )) (PreH5 : (new_node = 0)) (PreH6 : (avl_node_pre = 0)) ,
  (strict_insert_outcome before_low_level_spec before_low_level_spec data_pre 0 )
.

Definition AvlTreeInsertNode_partial_solve_wit_1_pure := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (new_node: Z) (PreH1 : (0 = avl_node_pre)) (PreH2 : (avl_insert_input before_low_level_spec avl_node_pre data_pre )) (PreH3 : (new_node = 0)) (PreH4 : (avl_node_pre = 0)) ,
  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "new_node" ) )) # Ptr  |-> new_node)
  **  (avl_tree_store before_low_level_spec )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (sizeof( "AvlNode" ) = sizeof( "AvlNode" )) ”
.

Definition AvlTreeInsertNode_partial_solve_wit_1_aux := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (new_node: Z) (PreH1 : (0 = avl_node_pre)) (PreH2 : (avl_insert_input before_low_level_spec avl_node_pre data_pre )) (PreH3 : (new_node = 0)) (PreH4 : (avl_node_pre = 0)) ,
  (avl_tree_store before_low_level_spec )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (sizeof( "AvlNode" ) = sizeof( "AvlNode" )) ” 
  &&  “ (0 = avl_node_pre) ” 
  &&  “ (avl_insert_input before_low_level_spec avl_node_pre data_pre ) ” 
  &&  “ (new_node = 0) ” 
  &&  “ (avl_node_pre = 0) ”
  &&  (avl_tree_store before_low_level_spec )
  **  (GlobalStrings LitMap_low_level_spec )
.

Definition AvlTreeInsertNode_partial_solve_wit_1 := AvlTreeInsertNode_partial_solve_wit_1_pure -> AvlTreeInsertNode_partial_solve_wit_1_aux.

Definition AvlTreeInsertNode_partial_solve_wit_2_pure := 
(
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (new_node: Z) (retval: Z) (PreH1 : (0 = retval)) (PreH2 : (retval = 0)) (PreH3 : (0 = avl_node_pre)) (PreH4 : (avl_insert_input before_low_level_spec avl_node_pre data_pre )) (PreH5 : (new_node = 0)) (PreH6 : (avl_node_pre = 0)) ,
  (store_stringLit (LitMap_low_level_spec (("AvlTreeInsertNode malloc AvlNode failed
"%string))) ("AvlTreeInsertNode malloc AvlNode failed
"%string) )
  **  (GlobalStrings_missing LitMap_low_level_spec (cons (("AvlTreeInsertNode malloc AvlNode failed
"%string)) ((@nil string))) )
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "new_node" ) )) # Ptr  |-> retval)
  **  (avl_tree_store before_low_level_spec )
|--
  “ (((LitMap_low_level_spec (("AvlTreeInsertNode malloc AvlNode failed
"%string))) + (0 * sizeof(CHAR))) = (LitMap_low_level_spec (("AvlTreeInsertNode malloc AvlNode failed
"%string)))) ”
) \/
(
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (new_node: Z) (retval: Z) (PreH1 : (data_pre <= INT_MAX)) (PreH2 : (data_pre >= INT_MIN)) (PreH3 : (0 = retval)) (PreH4 : (retval = 0)) (PreH5 : (0 = avl_node_pre)) (PreH6 : (avl_insert_input before_low_level_spec avl_node_pre data_pre )) (PreH7 : (new_node = 0)) (PreH8 : (avl_node_pre = 0)) ,
  (GlobalStrings LitMap_low_level_spec )
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "new_node" ) )) # Ptr  |-> retval)
  **  (avl_tree_store before_low_level_spec )
|--
  “ (((LitMap_low_level_spec (("AvlTreeInsertNode malloc AvlNode failed
"%string))) + (0 * sizeof(CHAR))) = (LitMap_low_level_spec (("AvlTreeInsertNode malloc AvlNode failed
"%string)))) ”
).

Definition AvlTreeInsertNode_partial_solve_wit_2_pure_split_goal_1 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (new_node: Z) (retval: Z) (PreH1 : (data_pre <= INT_MAX)) (PreH2 : (data_pre >= INT_MIN)) (PreH3 : (0 = retval)) (PreH4 : (retval = 0)) (PreH5 : (0 = avl_node_pre)) (PreH6 : (avl_insert_input before_low_level_spec avl_node_pre data_pre )) (PreH7 : (new_node = 0)) (PreH8 : (avl_node_pre = 0)) ,
  (GlobalStrings LitMap_low_level_spec )
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "new_node" ) )) # Ptr  |-> retval)
  **  (avl_tree_store before_low_level_spec )
|--
  “ (((LitMap_low_level_spec (("AvlTreeInsertNode malloc AvlNode failed
"%string))) + (0 * sizeof(CHAR))) = (LitMap_low_level_spec (("AvlTreeInsertNode malloc AvlNode failed
"%string)))) ”
.

Definition AvlTreeInsertNode_partial_solve_wit_2_aux := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (new_node: Z) (retval: Z) (PreH1 : (0 = retval)) (PreH2 : (retval = 0)) (PreH3 : (0 = avl_node_pre)) (PreH4 : (avl_insert_input before_low_level_spec avl_node_pre data_pre )) (PreH5 : (new_node = 0)) (PreH6 : (avl_node_pre = 0)) ,
  (store_stringLit (LitMap_low_level_spec (("AvlTreeInsertNode malloc AvlNode failed
"%string))) ("AvlTreeInsertNode malloc AvlNode failed
"%string) )
  **  (GlobalStrings_missing LitMap_low_level_spec (cons (("AvlTreeInsertNode malloc AvlNode failed
"%string)) ((@nil string))) )
  **  (avl_tree_store before_low_level_spec )
|--
  “ (((LitMap_low_level_spec (("AvlTreeInsertNode malloc AvlNode failed
"%string))) + (0 * sizeof(CHAR))) = (LitMap_low_level_spec (("AvlTreeInsertNode malloc AvlNode failed
"%string)))) ” 
  &&  “ (0 = retval) ” 
  &&  “ (retval = 0) ” 
  &&  “ (0 = avl_node_pre) ” 
  &&  “ (avl_insert_input before_low_level_spec avl_node_pre data_pre ) ” 
  &&  “ (new_node = 0) ” 
  &&  “ (avl_node_pre = 0) ”
  &&  (store_stringLit (LitMap_low_level_spec (("AvlTreeInsertNode malloc AvlNode failed
"%string))) ("AvlTreeInsertNode malloc AvlNode failed
"%string) )
  **  (GlobalStrings_missing LitMap_low_level_spec (cons (("AvlTreeInsertNode malloc AvlNode failed
"%string)) ((@nil string))) )
  **  (avl_tree_store before_low_level_spec )
.

Definition AvlTreeInsertNode_partial_solve_wit_2 := AvlTreeInsertNode_partial_solve_wit_2_pure -> AvlTreeInsertNode_partial_solve_wit_2_aux.

Definition AvlTreeInsertNode_partial_solve_wit_3_pure := 
(
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (new_node: Z) (PreH1 : (data_pre = (avl_key_of (before_low_level_spec) (avl_node_pre)))) (PreH2 : (0 <> avl_node_pre)) (PreH3 : (avl_insert_input before_low_level_spec avl_node_pre data_pre )) (PreH4 : (new_node = 0)) (PreH5 : (avl_node_pre <> 0)) (PreH6 : (avl_vvalid before_low_level_spec avl_node_pre )) ,
  (store_stringLit (LitMap_low_level_spec (("the input data is already existed. just return
"%string))) ("the input data is already existed. just return
"%string) )
  **  (GlobalStrings_missing LitMap_low_level_spec (cons (("the input data is already existed. just return
"%string)) ((@nil string))) )
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "new_node" ) )) # Ptr  |-> new_node)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
|--
  “ (((LitMap_low_level_spec (("the input data is already existed. just return
"%string))) + (0 * sizeof(CHAR))) = (LitMap_low_level_spec (("the input data is already existed. just return
"%string)))) ”
) \/
(
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (new_node: Z) (PreH1 : ((avl_height_of (before_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH2 : ((avl_height_of (before_low_level_spec) (avl_node_pre)) >= 0)) (PreH3 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : (data_pre <= INT_MAX)) (PreH5 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH6 : (data_pre >= INT_MIN)) (PreH7 : (data_pre = (avl_key_of (before_low_level_spec) (avl_node_pre)))) (PreH8 : (0 <> avl_node_pre)) (PreH9 : (avl_insert_input before_low_level_spec avl_node_pre data_pre )) (PreH10 : (new_node = 0)) (PreH11 : (avl_node_pre <> 0)) (PreH12 : (avl_vvalid before_low_level_spec avl_node_pre )) ,
  (GlobalStrings LitMap_low_level_spec )
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "new_node" ) )) # Ptr  |-> new_node)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
|--
  “ (((LitMap_low_level_spec (("the input data is already existed. just return
"%string))) + (0 * sizeof(CHAR))) = (LitMap_low_level_spec (("the input data is already existed. just return
"%string)))) ”
).

Definition AvlTreeInsertNode_partial_solve_wit_3_pure_split_goal_1 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (new_node: Z) (PreH1 : ((avl_height_of (before_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH2 : ((avl_height_of (before_low_level_spec) (avl_node_pre)) >= 0)) (PreH3 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : (data_pre <= INT_MAX)) (PreH5 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH6 : (data_pre >= INT_MIN)) (PreH7 : (data_pre = (avl_key_of (before_low_level_spec) (avl_node_pre)))) (PreH8 : (0 <> avl_node_pre)) (PreH9 : (avl_insert_input before_low_level_spec avl_node_pre data_pre )) (PreH10 : (new_node = 0)) (PreH11 : (avl_node_pre <> 0)) (PreH12 : (avl_vvalid before_low_level_spec avl_node_pre )) ,
  (GlobalStrings LitMap_low_level_spec )
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "new_node" ) )) # Ptr  |-> new_node)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
|--
  “ (((LitMap_low_level_spec (("the input data is already existed. just return
"%string))) + (0 * sizeof(CHAR))) = (LitMap_low_level_spec (("the input data is already existed. just return
"%string)))) ”
.

Definition AvlTreeInsertNode_partial_solve_wit_3_aux := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (new_node: Z) (PreH1 : (data_pre = (avl_key_of (before_low_level_spec) (avl_node_pre)))) (PreH2 : (0 <> avl_node_pre)) (PreH3 : (avl_insert_input before_low_level_spec avl_node_pre data_pre )) (PreH4 : (new_node = 0)) (PreH5 : (avl_node_pre <> 0)) (PreH6 : (avl_vvalid before_low_level_spec avl_node_pre )) ,
  (store_stringLit (LitMap_low_level_spec (("the input data is already existed. just return
"%string))) ("the input data is already existed. just return
"%string) )
  **  (GlobalStrings_missing LitMap_low_level_spec (cons (("the input data is already existed. just return
"%string)) ((@nil string))) )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
|--
  “ (((LitMap_low_level_spec (("the input data is already existed. just return
"%string))) + (0 * sizeof(CHAR))) = (LitMap_low_level_spec (("the input data is already existed. just return
"%string)))) ” 
  &&  “ (data_pre = (avl_key_of (before_low_level_spec) (avl_node_pre))) ” 
  &&  “ (0 <> avl_node_pre) ” 
  &&  “ (avl_insert_input before_low_level_spec avl_node_pre data_pre ) ” 
  &&  “ (new_node = 0) ” 
  &&  “ (avl_node_pre <> 0) ” 
  &&  “ (avl_vvalid before_low_level_spec avl_node_pre ) ”
  &&  (store_stringLit (LitMap_low_level_spec (("the input data is already existed. just return
"%string))) ("the input data is already existed. just return
"%string) )
  **  (GlobalStrings_missing LitMap_low_level_spec (cons (("the input data is already existed. just return
"%string)) ((@nil string))) )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
.

Definition AvlTreeInsertNode_partial_solve_wit_3 := AvlTreeInsertNode_partial_solve_wit_3_pure -> AvlTreeInsertNode_partial_solve_wit_3_aux.

Definition AvlTreeInsertNode_partial_solve_wit_4_pure := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (new_node: Z) (PreH1 : (avl_insert_input before_low_level_spec avl_node_pre data_pre )) (PreH2 : (new_node = 0)) (PreH3 : (avl_node_pre <> 0)) (PreH4 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) < data_pre)) (PreH5 : (avl_insert_input (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) data_pre )) ,
  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "new_node" ) )) # Ptr  |-> new_node)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (avl_insert_input (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) data_pre ) ”
.

Definition AvlTreeInsertNode_partial_solve_wit_4_aux := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (new_node: Z) (PreH1 : (avl_insert_input before_low_level_spec avl_node_pre data_pre )) (PreH2 : (new_node = 0)) (PreH3 : (avl_node_pre <> 0)) (PreH4 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) < data_pre)) (PreH5 : (avl_insert_input (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) data_pre )) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (avl_insert_input (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) data_pre ) ” 
  &&  “ (avl_insert_input before_low_level_spec avl_node_pre data_pre ) ” 
  &&  “ (new_node = 0) ” 
  &&  “ (avl_node_pre <> 0) ” 
  &&  “ ((avl_key_of (before_low_level_spec) (avl_node_pre)) < data_pre) ” 
  &&  “ (avl_insert_input (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) data_pre ) ”
  &&  (avl_subtree_store_at (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
.

Definition AvlTreeInsertNode_partial_solve_wit_4 := AvlTreeInsertNode_partial_solve_wit_4_pure -> AvlTreeInsertNode_partial_solve_wit_4_aux.

Definition AvlTreeInsertNode_partial_solve_wit_5_pure := 
(
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (new_node: Z) (after: avl_model) (retval: Z) (PreH1 : (0 = retval)) (PreH2 : (strict_insert_outcome (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) after data_pre retval )) (PreH3 : (avl_insert_input before_low_level_spec avl_node_pre data_pre )) (PreH4 : (new_node = 0)) (PreH5 : (avl_node_pre <> 0)) (PreH6 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) < data_pre)) (PreH7 : (avl_insert_input (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) data_pre )) ,
  (store_stringLit (LitMap_low_level_spec (("AvlTreeInsertNode find right avl_node data failed
"%string))) ("AvlTreeInsertNode find right avl_node data failed
"%string) )
  **  (GlobalStrings_missing LitMap_low_level_spec (cons (("AvlTreeInsertNode find right avl_node data failed
"%string)) ((@nil string))) )
  **  (avl_tree_store after )
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "new_node" ) )) # Ptr  |-> new_node)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> retval)
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
|--
  “ (((LitMap_low_level_spec (("AvlTreeInsertNode find right avl_node data failed
"%string))) + (0 * sizeof(CHAR))) = (LitMap_low_level_spec (("AvlTreeInsertNode find right avl_node data failed
"%string)))) ”
) \/
(
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (new_node: Z) (after: avl_model) (retval: Z) (PreH1 : ((avl_height_of (before_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH2 : ((avl_height_of (before_low_level_spec) (avl_node_pre)) >= 0)) (PreH3 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : (data_pre <= INT_MAX)) (PreH5 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH6 : (data_pre >= INT_MIN)) (PreH7 : (0 = retval)) (PreH8 : (strict_insert_outcome (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) after data_pre retval )) (PreH9 : (avl_insert_input before_low_level_spec avl_node_pre data_pre )) (PreH10 : (new_node = 0)) (PreH11 : (avl_node_pre <> 0)) (PreH12 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) < data_pre)) (PreH13 : (avl_insert_input (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) data_pre )) ,
  (GlobalStrings LitMap_low_level_spec )
  **  (avl_tree_store after )
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "new_node" ) )) # Ptr  |-> new_node)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> retval)
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
|--
  “ (((LitMap_low_level_spec (("AvlTreeInsertNode find right avl_node data failed
"%string))) + (0 * sizeof(CHAR))) = (LitMap_low_level_spec (("AvlTreeInsertNode find right avl_node data failed
"%string)))) ”
).

Definition AvlTreeInsertNode_partial_solve_wit_5_pure_split_goal_1 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (new_node: Z) (after: avl_model) (retval: Z) (PreH1 : ((avl_height_of (before_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH2 : ((avl_height_of (before_low_level_spec) (avl_node_pre)) >= 0)) (PreH3 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : (data_pre <= INT_MAX)) (PreH5 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH6 : (data_pre >= INT_MIN)) (PreH7 : (0 = retval)) (PreH8 : (strict_insert_outcome (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) after data_pre retval )) (PreH9 : (avl_insert_input before_low_level_spec avl_node_pre data_pre )) (PreH10 : (new_node = 0)) (PreH11 : (avl_node_pre <> 0)) (PreH12 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) < data_pre)) (PreH13 : (avl_insert_input (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) data_pre )) ,
  (GlobalStrings LitMap_low_level_spec )
  **  (avl_tree_store after )
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "new_node" ) )) # Ptr  |-> new_node)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> retval)
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
|--
  “ (((LitMap_low_level_spec (("AvlTreeInsertNode find right avl_node data failed
"%string))) + (0 * sizeof(CHAR))) = (LitMap_low_level_spec (("AvlTreeInsertNode find right avl_node data failed
"%string)))) ”
.

Definition AvlTreeInsertNode_partial_solve_wit_5_aux := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (new_node: Z) (after: avl_model) (retval: Z) (PreH1 : (0 = retval)) (PreH2 : (strict_insert_outcome (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) after data_pre retval )) (PreH3 : (avl_insert_input before_low_level_spec avl_node_pre data_pre )) (PreH4 : (new_node = 0)) (PreH5 : (avl_node_pre <> 0)) (PreH6 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) < data_pre)) (PreH7 : (avl_insert_input (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) data_pre )) ,
  (store_stringLit (LitMap_low_level_spec (("AvlTreeInsertNode find right avl_node data failed
"%string))) ("AvlTreeInsertNode find right avl_node data failed
"%string) )
  **  (GlobalStrings_missing LitMap_low_level_spec (cons (("AvlTreeInsertNode find right avl_node data failed
"%string)) ((@nil string))) )
  **  (avl_tree_store after )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> retval)
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
|--
  “ (((LitMap_low_level_spec (("AvlTreeInsertNode find right avl_node data failed
"%string))) + (0 * sizeof(CHAR))) = (LitMap_low_level_spec (("AvlTreeInsertNode find right avl_node data failed
"%string)))) ” 
  &&  “ (0 = retval) ” 
  &&  “ (strict_insert_outcome (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) after data_pre retval ) ” 
  &&  “ (avl_insert_input before_low_level_spec avl_node_pre data_pre ) ” 
  &&  “ (new_node = 0) ” 
  &&  “ (avl_node_pre <> 0) ” 
  &&  “ ((avl_key_of (before_low_level_spec) (avl_node_pre)) < data_pre) ” 
  &&  “ (avl_insert_input (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) data_pre ) ”
  &&  (store_stringLit (LitMap_low_level_spec (("AvlTreeInsertNode find right avl_node data failed
"%string))) ("AvlTreeInsertNode find right avl_node data failed
"%string) )
  **  (GlobalStrings_missing LitMap_low_level_spec (cons (("AvlTreeInsertNode find right avl_node data failed
"%string)) ((@nil string))) )
  **  (avl_tree_store after )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> retval)
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
.

Definition AvlTreeInsertNode_partial_solve_wit_5 := AvlTreeInsertNode_partial_solve_wit_5_pure -> AvlTreeInsertNode_partial_solve_wit_5_aux.

Definition AvlTreeInsertNode_partial_solve_wit_6_pure := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (new_node: Z) (PreH1 : (avl_insert_input before_low_level_spec avl_node_pre data_pre )) (PreH2 : (new_node = 0)) (PreH3 : (avl_node_pre <> 0)) (PreH4 : (data_pre < (avl_key_of (before_low_level_spec) (avl_node_pre)))) (PreH5 : (avl_insert_input (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) data_pre )) ,
  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "new_node" ) )) # Ptr  |-> new_node)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (avl_insert_input (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) data_pre ) ”
.

Definition AvlTreeInsertNode_partial_solve_wit_6_aux := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (new_node: Z) (PreH1 : (avl_insert_input before_low_level_spec avl_node_pre data_pre )) (PreH2 : (new_node = 0)) (PreH3 : (avl_node_pre <> 0)) (PreH4 : (data_pre < (avl_key_of (before_low_level_spec) (avl_node_pre)))) (PreH5 : (avl_insert_input (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) data_pre )) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (avl_insert_input (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) data_pre ) ” 
  &&  “ (avl_insert_input before_low_level_spec avl_node_pre data_pre ) ” 
  &&  “ (new_node = 0) ” 
  &&  “ (avl_node_pre <> 0) ” 
  &&  “ (data_pre < (avl_key_of (before_low_level_spec) (avl_node_pre))) ” 
  &&  “ (avl_insert_input (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) data_pre ) ”
  &&  (avl_subtree_store_at (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
.

Definition AvlTreeInsertNode_partial_solve_wit_6 := AvlTreeInsertNode_partial_solve_wit_6_pure -> AvlTreeInsertNode_partial_solve_wit_6_aux.

Definition AvlTreeInsertNode_partial_solve_wit_7_pure := 
(
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (new_node: Z) (after: avl_model) (retval: Z) (PreH1 : (0 = retval)) (PreH2 : (strict_insert_outcome (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) after data_pre retval )) (PreH3 : (avl_insert_input before_low_level_spec avl_node_pre data_pre )) (PreH4 : (new_node = 0)) (PreH5 : (avl_node_pre <> 0)) (PreH6 : (data_pre < (avl_key_of (before_low_level_spec) (avl_node_pre)))) (PreH7 : (avl_insert_input (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) data_pre )) ,
  (store_stringLit (LitMap_low_level_spec (("AvlTreeInsertNode find left avl_node data failed
"%string))) ("AvlTreeInsertNode find left avl_node data failed
"%string) )
  **  (GlobalStrings_missing LitMap_low_level_spec (cons (("AvlTreeInsertNode find left avl_node data failed
"%string)) ((@nil string))) )
  **  (avl_tree_store after )
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "new_node" ) )) # Ptr  |-> new_node)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> retval)
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
|--
  “ (((LitMap_low_level_spec (("AvlTreeInsertNode find left avl_node data failed
"%string))) + (0 * sizeof(CHAR))) = (LitMap_low_level_spec (("AvlTreeInsertNode find left avl_node data failed
"%string)))) ”
) \/
(
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (new_node: Z) (after: avl_model) (retval: Z) (PreH1 : ((avl_height_of (before_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH2 : ((avl_height_of (before_low_level_spec) (avl_node_pre)) >= 0)) (PreH3 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : (data_pre <= INT_MAX)) (PreH5 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH6 : (data_pre >= INT_MIN)) (PreH7 : (0 = retval)) (PreH8 : (strict_insert_outcome (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) after data_pre retval )) (PreH9 : (avl_insert_input before_low_level_spec avl_node_pre data_pre )) (PreH10 : (new_node = 0)) (PreH11 : (avl_node_pre <> 0)) (PreH12 : (data_pre < (avl_key_of (before_low_level_spec) (avl_node_pre)))) (PreH13 : (avl_insert_input (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) data_pre )) ,
  (GlobalStrings LitMap_low_level_spec )
  **  (avl_tree_store after )
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "new_node" ) )) # Ptr  |-> new_node)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> retval)
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
|--
  “ (((LitMap_low_level_spec (("AvlTreeInsertNode find left avl_node data failed
"%string))) + (0 * sizeof(CHAR))) = (LitMap_low_level_spec (("AvlTreeInsertNode find left avl_node data failed
"%string)))) ”
).

Definition AvlTreeInsertNode_partial_solve_wit_7_pure_split_goal_1 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (new_node: Z) (after: avl_model) (retval: Z) (PreH1 : ((avl_height_of (before_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH2 : ((avl_height_of (before_low_level_spec) (avl_node_pre)) >= 0)) (PreH3 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : (data_pre <= INT_MAX)) (PreH5 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH6 : (data_pre >= INT_MIN)) (PreH7 : (0 = retval)) (PreH8 : (strict_insert_outcome (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) after data_pre retval )) (PreH9 : (avl_insert_input before_low_level_spec avl_node_pre data_pre )) (PreH10 : (new_node = 0)) (PreH11 : (avl_node_pre <> 0)) (PreH12 : (data_pre < (avl_key_of (before_low_level_spec) (avl_node_pre)))) (PreH13 : (avl_insert_input (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) data_pre )) ,
  (GlobalStrings LitMap_low_level_spec )
  **  (avl_tree_store after )
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "new_node" ) )) # Ptr  |-> new_node)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> retval)
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
|--
  “ (((LitMap_low_level_spec (("AvlTreeInsertNode find left avl_node data failed
"%string))) + (0 * sizeof(CHAR))) = (LitMap_low_level_spec (("AvlTreeInsertNode find left avl_node data failed
"%string)))) ”
.

Definition AvlTreeInsertNode_partial_solve_wit_7_aux := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (new_node: Z) (after: avl_model) (retval: Z) (PreH1 : (0 = retval)) (PreH2 : (strict_insert_outcome (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) after data_pre retval )) (PreH3 : (avl_insert_input before_low_level_spec avl_node_pre data_pre )) (PreH4 : (new_node = 0)) (PreH5 : (avl_node_pre <> 0)) (PreH6 : (data_pre < (avl_key_of (before_low_level_spec) (avl_node_pre)))) (PreH7 : (avl_insert_input (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) data_pre )) ,
  (store_stringLit (LitMap_low_level_spec (("AvlTreeInsertNode find left avl_node data failed
"%string))) ("AvlTreeInsertNode find left avl_node data failed
"%string) )
  **  (GlobalStrings_missing LitMap_low_level_spec (cons (("AvlTreeInsertNode find left avl_node data failed
"%string)) ((@nil string))) )
  **  (avl_tree_store after )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> retval)
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
|--
  “ (((LitMap_low_level_spec (("AvlTreeInsertNode find left avl_node data failed
"%string))) + (0 * sizeof(CHAR))) = (LitMap_low_level_spec (("AvlTreeInsertNode find left avl_node data failed
"%string)))) ” 
  &&  “ (0 = retval) ” 
  &&  “ (strict_insert_outcome (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) after data_pre retval ) ” 
  &&  “ (avl_insert_input before_low_level_spec avl_node_pre data_pre ) ” 
  &&  “ (new_node = 0) ” 
  &&  “ (avl_node_pre <> 0) ” 
  &&  “ (data_pre < (avl_key_of (before_low_level_spec) (avl_node_pre))) ” 
  &&  “ (avl_insert_input (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) data_pre ) ”
  &&  (store_stringLit (LitMap_low_level_spec (("AvlTreeInsertNode find left avl_node data failed
"%string))) ("AvlTreeInsertNode find left avl_node data failed
"%string) )
  **  (GlobalStrings_missing LitMap_low_level_spec (cons (("AvlTreeInsertNode find left avl_node data failed
"%string)) ((@nil string))) )
  **  (avl_tree_store after )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> retval)
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
.

Definition AvlTreeInsertNode_partial_solve_wit_7 := AvlTreeInsertNode_partial_solve_wit_7_pure -> AvlTreeInsertNode_partial_solve_wit_7_aux.

Definition AvlTreeInsertNode_partial_solve_wit_8_pure := 
forall (data_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (new_ptr: Z) (avl_node: Z) (raw: avl_model) (old_cache: Z) (PreH1 : (strict_insert_pending before_low_level_spec raw data_pre avl_node )) (PreH2 : (avl_node = (avl_ptr_of ((avl_root (raw)))))) (PreH3 : (avl_tree_valid raw )) (PreH4 : (avl_update_height_children_safe raw avl_node )) (PreH5 : (avl_balance_graph_input raw avl_node )) ,
  ((( &( "avl_node" ) )) # Ptr  |-> avl_node)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "new_node" ) )) # Ptr  |-> new_ptr)
  **  (avl_tree_store (avl_with_root_cache (raw) (avl_node) (old_cache)) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (avl_tree_valid raw ) ” 
  &&  “ (avl_node = (avl_ptr_of ((avl_root (raw))))) ” 
  &&  “ (avl_update_height_children_safe raw avl_node ) ”
.

Definition AvlTreeInsertNode_partial_solve_wit_8_aux := 
forall (data_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (avl_node: Z) (raw: avl_model) (old_cache: Z) (PreH1 : (strict_insert_pending before_low_level_spec raw data_pre avl_node )) (PreH2 : (avl_node = (avl_ptr_of ((avl_root (raw)))))) (PreH3 : (avl_tree_valid raw )) (PreH4 : (avl_update_height_children_safe raw avl_node )) (PreH5 : (avl_balance_graph_input raw avl_node )) ,
  (avl_tree_store (avl_with_root_cache (raw) (avl_node) (old_cache)) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (avl_tree_valid raw ) ” 
  &&  “ (avl_node = (avl_ptr_of ((avl_root (raw))))) ” 
  &&  “ (avl_update_height_children_safe raw avl_node ) ” 
  &&  “ (strict_insert_pending before_low_level_spec raw data_pre avl_node ) ” 
  &&  “ (avl_node = (avl_ptr_of ((avl_root (raw))))) ” 
  &&  “ (avl_tree_valid raw ) ” 
  &&  “ (avl_update_height_children_safe raw avl_node ) ” 
  &&  “ (avl_balance_graph_input raw avl_node ) ”
  &&  (avl_tree_store (avl_with_root_cache (raw) (avl_node) (old_cache)) )
  **  (GlobalStrings LitMap_low_level_spec )
.

Definition AvlTreeInsertNode_partial_solve_wit_8 := AvlTreeInsertNode_partial_solve_wit_8_pure -> AvlTreeInsertNode_partial_solve_wit_8_aux.

Definition AvlTreeInsertNode_partial_solve_wit_9_pure := 
forall (data_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (new_ptr: Z) (avl_node: Z) (raw: avl_model) (PreH1 : (strict_insert_pending before_low_level_spec raw data_pre avl_node )) (PreH2 : (avl_node = (avl_ptr_of ((avl_root (raw)))))) (PreH3 : (avl_tree_valid raw )) (PreH4 : (avl_update_height_children_safe raw avl_node )) (PreH5 : (avl_balance_graph_input raw avl_node )) ,
  (avl_tree_store raw )
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "new_node" ) )) # Ptr  |-> new_ptr)
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (avl_balance_graph_input raw avl_node ) ”
.

Definition AvlTreeInsertNode_partial_solve_wit_9_aux := 
forall (data_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (avl_node: Z) (raw: avl_model) (PreH1 : (strict_insert_pending before_low_level_spec raw data_pre avl_node )) (PreH2 : (avl_node = (avl_ptr_of ((avl_root (raw)))))) (PreH3 : (avl_tree_valid raw )) (PreH4 : (avl_update_height_children_safe raw avl_node )) (PreH5 : (avl_balance_graph_input raw avl_node )) ,
  (avl_tree_store raw )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (avl_balance_graph_input raw avl_node ) ” 
  &&  “ (strict_insert_pending before_low_level_spec raw data_pre avl_node ) ” 
  &&  “ (avl_node = (avl_ptr_of ((avl_root (raw))))) ” 
  &&  “ (avl_tree_valid raw ) ” 
  &&  “ (avl_update_height_children_safe raw avl_node ) ” 
  &&  “ (avl_balance_graph_input raw avl_node ) ”
  &&  (avl_tree_store raw )
  **  (GlobalStrings LitMap_low_level_spec )
.

Definition AvlTreeInsertNode_partial_solve_wit_9 := AvlTreeInsertNode_partial_solve_wit_9_pure -> AvlTreeInsertNode_partial_solve_wit_9_aux.

(*----- Function AvlTreeDeleteNode -----*)

Definition AvlTreeDeleteNode_safety_wit_1 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (PreH1 : (avl_gvalid before_low_level_spec )) (PreH2 : (avl_node_pre = (avl_ptr_of ((avl_root (before_low_level_spec)))))) ,
  ((( &( "temp" ) )) # Ptr  |->_)
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  (avl_tree_store before_low_level_spec )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition AvlTreeDeleteNode_safety_wit_2 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (PreH1 : (avl_gvalid before_low_level_spec )) (PreH2 : (avl_node_pre = (avl_ptr_of ((avl_root (before_low_level_spec)))))) ,
  ((( &( "pred" ) )) # Ptr  |->_)
  **  ((( &( "temp" ) )) # Ptr  |-> 0)
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  (avl_tree_store before_low_level_spec )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition AvlTreeDeleteNode_safety_wit_3 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (PreH1 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH2 : (avl_node_pre <> 0)) (PreH3 : (avl_vvalid before_low_level_spec avl_node_pre )) (PreH4 : (avl_node_pre = 0)) ,
  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "temp" ) )) # Ptr  |-> 0)
  **  ((( &( "pred" ) )) # Ptr  |-> 0)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ False ”
.

Definition AvlTreeDeleteNode_safety_wit_4 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (PreH1 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH2 : (avl_node_pre = 0)) (PreH3 : (avl_node_pre <> 0)) ,
  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "temp" ) )) # Ptr  |-> 0)
  **  ((( &( "pred" ) )) # Ptr  |-> 0)
  **  (avl_tree_store before_low_level_spec )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ False ”
.

Definition AvlTreeDeleteNode_safety_wit_5 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (PreH1 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) <= data_pre)) (PreH2 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) >= data_pre)) (PreH3 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH4 : (avl_node_pre <> 0)) (PreH5 : (avl_vvalid before_low_level_spec avl_node_pre )) (PreH6 : (avl_node_pre <> 0)) ,
  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "temp" ) )) # Ptr  |-> 0)
  **  ((( &( "pred" ) )) # Ptr  |-> 0)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition AvlTreeDeleteNode_safety_wit_6 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (PreH1 : (0 = (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) (PreH2 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) <= data_pre)) (PreH3 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) >= data_pre)) (PreH4 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH5 : (avl_node_pre <> 0)) (PreH6 : (avl_vvalid before_low_level_spec avl_node_pre )) (PreH7 : (avl_node_pre <> 0)) ,
  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "temp" ) )) # Ptr  |-> 0)
  **  ((( &( "pred" ) )) # Ptr  |-> 0)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition AvlTreeDeleteNode_safety_wit_7 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (PreH1 : (0 = (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))) (PreH2 : (0 = (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) (PreH3 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) <= data_pre)) (PreH4 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) >= data_pre)) (PreH5 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH6 : (avl_node_pre <> 0)) (PreH7 : (avl_vvalid before_low_level_spec avl_node_pre )) (PreH8 : (avl_node_pre <> 0)) ,
  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "temp" ) )) # Ptr  |-> 0)
  **  ((( &( "pred" ) )) # Ptr  |-> 0)
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition AvlTreeDeleteNode_safety_wit_8 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (PreH1 : (0 <> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) (PreH2 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) <= data_pre)) (PreH3 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) >= data_pre)) (PreH4 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH5 : (avl_node_pre <> 0)) (PreH6 : (avl_vvalid before_low_level_spec avl_node_pre )) (PreH7 : (avl_node_pre <> 0)) ,
  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "temp" ) )) # Ptr  |-> 0)
  **  ((( &( "pred" ) )) # Ptr  |-> 0)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition AvlTreeDeleteNode_safety_wit_9 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (PreH1 : (0 <> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))) (PreH2 : (0 = (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) (PreH3 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) <= data_pre)) (PreH4 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) >= data_pre)) (PreH5 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH6 : (avl_node_pre <> 0)) (PreH7 : (avl_vvalid before_low_level_spec avl_node_pre )) (PreH8 : (avl_node_pre <> 0)) ,
  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "temp" ) )) # Ptr  |-> 0)
  **  ((( &( "pred" ) )) # Ptr  |-> 0)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition AvlTreeDeleteNode_safety_wit_10 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (PreH1 : (0 <> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) (PreH2 : (0 <> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))) (PreH3 : (0 = (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) (PreH4 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) <= data_pre)) (PreH5 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) >= data_pre)) (PreH6 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH7 : (avl_node_pre <> 0)) (PreH8 : (avl_vvalid before_low_level_spec avl_node_pre )) (PreH9 : (avl_node_pre <> 0)) ,
  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "temp" ) )) # Ptr  |-> 0)
  **  ((( &( "pred" ) )) # Ptr  |-> 0)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ False ”
.

Definition AvlTreeDeleteNode_safety_wit_11 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (PreH1 : (0 = (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) (PreH2 : (0 <> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) (PreH3 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) <= data_pre)) (PreH4 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) >= data_pre)) (PreH5 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH6 : (avl_node_pre <> 0)) (PreH7 : (avl_vvalid before_low_level_spec avl_node_pre )) (PreH8 : (avl_node_pre <> 0)) ,
  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "temp" ) )) # Ptr  |-> 0)
  **  ((( &( "pred" ) )) # Ptr  |-> 0)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ False ”
.

Definition AvlTreeDeleteNode_safety_wit_12 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (PreH1 : (0 <> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) (PreH2 : (0 <> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) (PreH3 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) <= data_pre)) (PreH4 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) >= data_pre)) (PreH5 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH6 : (avl_node_pre <> 0)) (PreH7 : (avl_vvalid before_low_level_spec avl_node_pre )) (PreH8 : (avl_node_pre <> 0)) ,
  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "temp" ) )) # Ptr  |-> 0)
  **  ((( &( "pred" ) )) # Ptr  |-> 0)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition AvlTreeDeleteNode_safety_wit_13 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (PreH1 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH2 : (avl_node_pre = 0)) (PreH3 : (avl_node_pre = 0)) ,
  (store_stringLit (LitMap_low_level_spec (("AvlTreeDeleteNode cannot find the delete data
"%string))) ("AvlTreeDeleteNode cannot find the delete data
"%string) )
  **  (GlobalStrings_missing LitMap_low_level_spec (cons (("AvlTreeDeleteNode cannot find the delete data
"%string)) ((@nil string))) )
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "temp" ) )) # Ptr  |-> 0)
  **  ((( &( "pred" ) )) # Ptr  |-> 0)
  **  (avl_tree_store before_low_level_spec )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition AvlTreeDeleteNode_safety_wit_14 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (PreH1 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH2 : (avl_node_pre = 0)) (PreH3 : (avl_node_pre = 0)) ,
  (store_stringLit (LitMap_low_level_spec (("AvlTreeDeleteNode cannot find the delete data
"%string))) ("AvlTreeDeleteNode cannot find the delete data
"%string) )
  **  (GlobalStrings_missing LitMap_low_level_spec (cons (("AvlTreeDeleteNode cannot find the delete data
"%string)) ((@nil string))) )
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "temp" ) )) # Ptr  |-> 0)
  **  ((( &( "pred" ) )) # Ptr  |-> 0)
  **  (avl_tree_store before_low_level_spec )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition AvlTreeDeleteNode_entail_wit_1 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (PreH1 : (avl_gvalid before_low_level_spec )) (PreH2 : (avl_node_pre = (avl_ptr_of ((avl_root (before_low_level_spec)))))) ,
  ((( &( "pred" ) )) # Ptr  |-> 0)
  **  ((( &( "temp" ) )) # Ptr  |-> 0)
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  (avl_tree_store before_low_level_spec )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (INT_MIN <= data_pre) ” 
  &&  “ (data_pre <= INT_MAX) ” 
  &&  “ (avl_gvalid before_low_level_spec ) ” 
  &&  “ (avl_node_pre = (avl_ptr_of ((avl_root (before_low_level_spec))))) ”
  &&  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "pred" ) )) # Ptr  |-> 0)
  **  ((( &( "temp" ) )) # Ptr  |-> 0)
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  (avl_tree_store before_low_level_spec )
  **  (GlobalStrings LitMap_low_level_spec )
.

Definition AvlTreeDeleteNode_entail_wit_2 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (PreH1 : (INT_MIN <= data_pre)) (PreH2 : (data_pre <= INT_MAX)) (PreH3 : (avl_gvalid before_low_level_spec )) (PreH4 : (avl_node_pre = (avl_ptr_of ((avl_root (before_low_level_spec)))))) ,
  (avl_tree_store before_low_level_spec )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  (“ (avl_delete_input before_low_level_spec avl_node_pre data_pre ) ” 
  &&  “ (avl_node_pre <> 0) ” 
  &&  “ (avl_vvalid before_low_level_spec avl_node_pre ) ”
  &&  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec ))
  ||
  (“ (avl_delete_input before_low_level_spec avl_node_pre data_pre ) ” 
  &&  “ (avl_node_pre = 0) ”
  &&  (avl_tree_store before_low_level_spec )
  **  (GlobalStrings LitMap_low_level_spec ))
.

Definition AvlTreeDeleteNode_entail_wit_3_1 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (PreH1 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH2 : (avl_node_pre <> 0)) (PreH3 : (avl_vvalid before_low_level_spec avl_node_pre )) (PreH4 : (avl_node_pre = 0)) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (avl_delete_input before_low_level_spec avl_node_pre data_pre ) ” 
  &&  “ (avl_node_pre = 0) ” 
  &&  “ (avl_node_pre = 0) ”
  &&  (avl_tree_store before_low_level_spec )
  **  (GlobalStrings LitMap_low_level_spec )
.

Definition AvlTreeDeleteNode_entail_wit_3_2 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (PreH1 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH2 : (avl_node_pre = 0)) (PreH3 : (avl_node_pre = 0)) ,
  (avl_tree_store before_low_level_spec )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (avl_delete_input before_low_level_spec avl_node_pre data_pre ) ” 
  &&  “ (avl_node_pre = 0) ” 
  &&  “ (avl_node_pre = 0) ”
  &&  (avl_tree_store before_low_level_spec )
  **  (GlobalStrings LitMap_low_level_spec )
.

Definition AvlTreeDeleteNode_entail_wit_4_1 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (PreH1 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH2 : (avl_node_pre <> 0)) (PreH3 : (avl_vvalid before_low_level_spec avl_node_pre )) (PreH4 : (avl_node_pre <> 0)) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (avl_delete_input before_low_level_spec avl_node_pre data_pre ) ” 
  &&  “ (avl_node_pre <> 0) ” 
  &&  “ (avl_vvalid before_low_level_spec avl_node_pre ) ” 
  &&  “ (avl_node_pre <> 0) ”
  &&  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
.

Definition AvlTreeDeleteNode_entail_wit_4_2 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (PreH1 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH2 : (avl_node_pre = 0)) (PreH3 : (avl_node_pre <> 0)) ,
  (avl_tree_store before_low_level_spec )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (avl_delete_input before_low_level_spec avl_node_pre data_pre ) ” 
  &&  “ (avl_node_pre <> 0) ” 
  &&  “ (avl_vvalid before_low_level_spec avl_node_pre ) ” 
  &&  “ (avl_node_pre <> 0) ”
  &&  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
.

Definition AvlTreeDeleteNode_entail_wit_5 := 
(
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (PreH1 : (0 = (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) (PreH2 : (0 <> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))) (PreH3 : (0 = (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) (PreH4 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) <= data_pre)) (PreH5 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) >= data_pre)) (PreH6 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH7 : (avl_node_pre <> 0)) (PreH8 : (avl_vvalid before_low_level_spec avl_node_pre )) (PreH9 : (avl_node_pre <> 0)) ,
  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (avl_delete_input before_low_level_spec avl_node_pre data_pre ) ” 
  &&  “ ((avl_key_of (before_low_level_spec) (avl_node_pre)) = data_pre) ” 
  &&  “ ((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) = (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre))))) ” 
  &&  “ (avl_api_delete_repair before_low_level_spec (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) data_pre (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) ) ” 
  &&  “ (avl_tree_valid (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) ) ” 
  &&  “ ((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) = (avl_ptr_of ((avl_root ((avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre))))))))) ” 
  &&  “ (avl_update_height_children_safe (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) ) ” 
  &&  “ (avl_balance_graph_input (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) ) ”
  &&  (avl_tree_store (avl_with_root_cache ((avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre))))) ((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre))))) ((avl_height_of ((avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre))))) ((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))))) )
  **  (GlobalStrings LitMap_low_level_spec )
) \/
(
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (PreH1 : (0 = (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) (PreH2 : (0 <> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))) (PreH3 : (0 = (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) (PreH4 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) <= data_pre)) (PreH5 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) >= data_pre)) (PreH6 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH7 : (avl_node_pre <> 0)) (PreH8 : (avl_vvalid before_low_level_spec avl_node_pre )) (PreH9 : (avl_node_pre <> 0)) ,
  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (avl_balance_graph_input (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) ) ” 
  &&  “ (avl_update_height_children_safe (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) ) ” 
  &&  “ ((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) = (avl_ptr_of ((avl_root ((avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre))))))))) ” 
  &&  “ (avl_tree_valid (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) ) ” 
  &&  “ (avl_api_delete_repair before_low_level_spec (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) data_pre (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) ) ”
  &&  (avl_tree_store (avl_with_root_cache ((avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre))))) ((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre))))) ((avl_height_of ((avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre))))) ((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))))) )
  **  (GlobalStrings LitMap_low_level_spec )
).

Definition AvlTreeDeleteNode_entail_wit_5_split_goal_1 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (PreH1 : (0 = (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) (PreH2 : (0 <> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))) (PreH3 : (0 = (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) (PreH4 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) <= data_pre)) (PreH5 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) >= data_pre)) (PreH6 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH7 : (avl_node_pre <> 0)) (PreH8 : (avl_vvalid before_low_level_spec avl_node_pre )) (PreH9 : (avl_node_pre <> 0)) ,
  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (avl_balance_graph_input (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) ) ”
.

Definition AvlTreeDeleteNode_entail_wit_5_split_goal_2 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (PreH1 : (0 = (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) (PreH2 : (0 <> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))) (PreH3 : (0 = (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) (PreH4 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) <= data_pre)) (PreH5 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) >= data_pre)) (PreH6 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH7 : (avl_node_pre <> 0)) (PreH8 : (avl_vvalid before_low_level_spec avl_node_pre )) (PreH9 : (avl_node_pre <> 0)) ,
  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (avl_update_height_children_safe (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) ) ”
.

Definition AvlTreeDeleteNode_entail_wit_5_split_goal_3 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (PreH1 : (0 = (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) (PreH2 : (0 <> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))) (PreH3 : (0 = (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) (PreH4 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) <= data_pre)) (PreH5 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) >= data_pre)) (PreH6 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH7 : (avl_node_pre <> 0)) (PreH8 : (avl_vvalid before_low_level_spec avl_node_pre )) (PreH9 : (avl_node_pre <> 0)) ,
  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ ((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) = (avl_ptr_of ((avl_root ((avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre))))))))) ”
.

Definition AvlTreeDeleteNode_entail_wit_5_split_goal_4 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (PreH1 : (0 = (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) (PreH2 : (0 <> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))) (PreH3 : (0 = (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) (PreH4 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) <= data_pre)) (PreH5 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) >= data_pre)) (PreH6 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH7 : (avl_node_pre <> 0)) (PreH8 : (avl_vvalid before_low_level_spec avl_node_pre )) (PreH9 : (avl_node_pre <> 0)) ,
  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (avl_tree_valid (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) ) ”
.

Definition AvlTreeDeleteNode_entail_wit_5_split_goal_5 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (PreH1 : (0 = (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) (PreH2 : (0 <> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))) (PreH3 : (0 = (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) (PreH4 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) <= data_pre)) (PreH5 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) >= data_pre)) (PreH6 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH7 : (avl_node_pre <> 0)) (PreH8 : (avl_vvalid before_low_level_spec avl_node_pre )) (PreH9 : (avl_node_pre <> 0)) ,
  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (avl_api_delete_repair before_low_level_spec (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) data_pre (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) ) ”
.

Definition AvlTreeDeleteNode_entail_wit_5_split_goal_spatial := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (PreH1 : (0 = (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) (PreH2 : (0 <> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))) (PreH3 : (0 = (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) (PreH4 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) <= data_pre)) (PreH5 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) >= data_pre)) (PreH6 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH7 : (avl_node_pre <> 0)) (PreH8 : (avl_vvalid before_low_level_spec avl_node_pre )) (PreH9 : (avl_node_pre <> 0)) ,
  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  (avl_tree_store (avl_with_root_cache ((avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre))))) ((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre))))) ((avl_height_of ((avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre))))) ((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))))) )
  **  (GlobalStrings LitMap_low_level_spec )
.

Definition AvlTreeDeleteNode_entail_wit_6 := 
(
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (PreH1 : (0 = (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))) (PreH2 : (0 <> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) (PreH3 : (0 <> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) (PreH4 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) <= data_pre)) (PreH5 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) >= data_pre)) (PreH6 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH7 : (avl_node_pre <> 0)) (PreH8 : (avl_vvalid before_low_level_spec avl_node_pre )) (PreH9 : (avl_node_pre <> 0)) ,
  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (avl_delete_input before_low_level_spec avl_node_pre data_pre ) ” 
  &&  “ ((avl_key_of (before_low_level_spec) (avl_node_pre)) = data_pre) ” 
  &&  “ ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) = (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre))))) ” 
  &&  “ (avl_api_delete_repair before_low_level_spec (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) data_pre (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) ) ” 
  &&  “ (avl_tree_valid (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) ) ” 
  &&  “ ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) = (avl_ptr_of ((avl_root ((avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre))))))))) ” 
  &&  “ (avl_update_height_children_safe (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) ) ” 
  &&  “ (avl_balance_graph_input (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) ) ”
  &&  (avl_tree_store (avl_with_root_cache ((avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre))))) ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre))))) ((avl_height_of ((avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre))))) ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))))) )
  **  (GlobalStrings LitMap_low_level_spec )
) \/
(
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (PreH1 : (0 = (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))) (PreH2 : (0 <> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) (PreH3 : (0 <> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) (PreH4 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) <= data_pre)) (PreH5 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) >= data_pre)) (PreH6 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH7 : (avl_node_pre <> 0)) (PreH8 : (avl_vvalid before_low_level_spec avl_node_pre )) (PreH9 : (avl_node_pre <> 0)) ,
  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (avl_balance_graph_input (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) ) ” 
  &&  “ (avl_update_height_children_safe (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) ) ” 
  &&  “ ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) = (avl_ptr_of ((avl_root ((avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre))))))))) ” 
  &&  “ (avl_tree_valid (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) ) ” 
  &&  “ (avl_api_delete_repair before_low_level_spec (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) data_pre (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) ) ”
  &&  (avl_tree_store (avl_with_root_cache ((avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre))))) ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre))))) ((avl_height_of ((avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre))))) ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))))) )
  **  (GlobalStrings LitMap_low_level_spec )
).

Definition AvlTreeDeleteNode_entail_wit_6_split_goal_1 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (PreH1 : (0 = (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))) (PreH2 : (0 <> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) (PreH3 : (0 <> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) (PreH4 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) <= data_pre)) (PreH5 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) >= data_pre)) (PreH6 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH7 : (avl_node_pre <> 0)) (PreH8 : (avl_vvalid before_low_level_spec avl_node_pre )) (PreH9 : (avl_node_pre <> 0)) ,
  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (avl_balance_graph_input (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) ) ”
.

Definition AvlTreeDeleteNode_entail_wit_6_split_goal_2 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (PreH1 : (0 = (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))) (PreH2 : (0 <> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) (PreH3 : (0 <> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) (PreH4 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) <= data_pre)) (PreH5 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) >= data_pre)) (PreH6 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH7 : (avl_node_pre <> 0)) (PreH8 : (avl_vvalid before_low_level_spec avl_node_pre )) (PreH9 : (avl_node_pre <> 0)) ,
  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (avl_update_height_children_safe (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) ) ”
.

Definition AvlTreeDeleteNode_entail_wit_6_split_goal_3 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (PreH1 : (0 = (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))) (PreH2 : (0 <> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) (PreH3 : (0 <> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) (PreH4 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) <= data_pre)) (PreH5 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) >= data_pre)) (PreH6 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH7 : (avl_node_pre <> 0)) (PreH8 : (avl_vvalid before_low_level_spec avl_node_pre )) (PreH9 : (avl_node_pre <> 0)) ,
  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) = (avl_ptr_of ((avl_root ((avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre))))))))) ”
.

Definition AvlTreeDeleteNode_entail_wit_6_split_goal_4 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (PreH1 : (0 = (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))) (PreH2 : (0 <> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) (PreH3 : (0 <> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) (PreH4 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) <= data_pre)) (PreH5 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) >= data_pre)) (PreH6 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH7 : (avl_node_pre <> 0)) (PreH8 : (avl_vvalid before_low_level_spec avl_node_pre )) (PreH9 : (avl_node_pre <> 0)) ,
  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (avl_tree_valid (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) ) ”
.

Definition AvlTreeDeleteNode_entail_wit_6_split_goal_5 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (PreH1 : (0 = (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))) (PreH2 : (0 <> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) (PreH3 : (0 <> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) (PreH4 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) <= data_pre)) (PreH5 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) >= data_pre)) (PreH6 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH7 : (avl_node_pre <> 0)) (PreH8 : (avl_vvalid before_low_level_spec avl_node_pre )) (PreH9 : (avl_node_pre <> 0)) ,
  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (avl_api_delete_repair before_low_level_spec (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) data_pre (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) ) ”
.

Definition AvlTreeDeleteNode_entail_wit_6_split_goal_spatial := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (PreH1 : (0 = (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))) (PreH2 : (0 <> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) (PreH3 : (0 <> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) (PreH4 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) <= data_pre)) (PreH5 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) >= data_pre)) (PreH6 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH7 : (avl_node_pre <> 0)) (PreH8 : (avl_vvalid before_low_level_spec avl_node_pre )) (PreH9 : (avl_node_pre <> 0)) ,
  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  (avl_tree_store (avl_with_root_cache ((avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre))))) ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre))))) ((avl_height_of ((avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre))))) ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))))) )
  **  (GlobalStrings LitMap_low_level_spec )
.

Definition AvlTreeDeleteNode_entail_wit_7 := 
(
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (PreH1 : (0 <> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))) (PreH2 : (0 <> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) (PreH3 : (0 <> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) (PreH4 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) <= data_pre)) (PreH5 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) >= data_pre)) (PreH6 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH7 : (avl_node_pre <> 0)) (PreH8 : (avl_vvalid before_low_level_spec avl_node_pre )) (PreH9 : (avl_node_pre <> 0)) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (avl_delete_input before_low_level_spec avl_node_pre data_pre ) ” 
  &&  “ ((avl_key_of (before_low_level_spec) (avl_node_pre)) = data_pre) ” 
  &&  “ ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) <> 0) ” 
  &&  “ ((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) <> 0) ” 
  &&  “ (crtos_delete_cursor before_low_level_spec avl_node_pre (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) ) ”
  &&  ((&(((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))))
  **  ((&(((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))))
  **  ((&(((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))))))
  **  ((&(((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))))))
  **  (avl_graph_nodes_store before_low_level_spec (avl_nodes_without (before_low_level_spec) ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) )
  **  (GlobalStrings LitMap_low_level_spec )
) \/
(
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (PreH1 : ((avl_height_of (before_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH2 : ((avl_height_of (before_low_level_spec) (avl_node_pre)) >= 0)) (PreH3 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH5 : (0 <> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))) (PreH6 : (0 <> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) (PreH7 : (0 <> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) (PreH8 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) <= data_pre)) (PreH9 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) >= data_pre)) (PreH10 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH11 : (avl_node_pre <> 0)) (PreH12 : (avl_vvalid before_low_level_spec avl_node_pre )) (PreH13 : (avl_node_pre <> 0)) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (crtos_delete_cursor before_low_level_spec avl_node_pre (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) ) ”
  &&  ((&(((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))))
  **  ((&(((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))))
  **  ((&(((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))))))
  **  ((&(((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))))))
  **  (avl_graph_nodes_store before_low_level_spec (avl_nodes_without (before_low_level_spec) ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) )
  **  (GlobalStrings LitMap_low_level_spec )
).

Definition AvlTreeDeleteNode_entail_wit_7_split_goal_1 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (PreH1 : ((avl_height_of (before_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH2 : ((avl_height_of (before_low_level_spec) (avl_node_pre)) >= 0)) (PreH3 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH5 : (0 <> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))) (PreH6 : (0 <> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) (PreH7 : (0 <> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) (PreH8 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) <= data_pre)) (PreH9 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) >= data_pre)) (PreH10 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH11 : (avl_node_pre <> 0)) (PreH12 : (avl_vvalid before_low_level_spec avl_node_pre )) (PreH13 : (avl_node_pre <> 0)) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (crtos_delete_cursor before_low_level_spec avl_node_pre (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) ) ”
.

Definition AvlTreeDeleteNode_entail_wit_7_split_goal_spatial := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (PreH1 : ((avl_height_of (before_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH2 : ((avl_height_of (before_low_level_spec) (avl_node_pre)) >= 0)) (PreH3 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH5 : (0 <> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))) (PreH6 : (0 <> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) (PreH7 : (0 <> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) (PreH8 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) <= data_pre)) (PreH9 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) >= data_pre)) (PreH10 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH11 : (avl_node_pre <> 0)) (PreH12 : (avl_vvalid before_low_level_spec avl_node_pre )) (PreH13 : (avl_node_pre <> 0)) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  ((&(((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))))
  **  ((&(((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))))
  **  ((&(((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))))))
  **  ((&(((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))))))
  **  (avl_graph_nodes_store before_low_level_spec (avl_nodes_without (before_low_level_spec) ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) )
  **  (GlobalStrings LitMap_low_level_spec )
.

Definition AvlTreeDeleteNode_entail_wit_8 := 
(
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (pred: Z) (PreH1 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH2 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) = data_pre)) (PreH3 : ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) <> 0)) (PreH4 : ((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) <> 0)) (PreH5 : (crtos_delete_cursor before_low_level_spec avl_node_pre pred )) (PreH6 : ((avl_ptr_of ((avl_right (before_low_level_spec) (pred)))) <> 0)) ,
  ((&((pred)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (pred)))
  **  ((&((pred)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (pred)))
  **  ((&((pred)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (pred)))))
  **  ((&((pred)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (pred)))))
  **  (avl_graph_nodes_store before_low_level_spec (avl_nodes_without (before_low_level_spec) (pred)) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (avl_delete_input before_low_level_spec avl_node_pre data_pre ) ” 
  &&  “ ((avl_key_of (before_low_level_spec) (avl_node_pre)) = data_pre) ” 
  &&  “ ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) <> 0) ” 
  &&  “ ((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) <> 0) ” 
  &&  “ (crtos_delete_cursor before_low_level_spec avl_node_pre (avl_ptr_of ((avl_right (before_low_level_spec) (pred)))) ) ”
  &&  ((&(((avl_ptr_of ((avl_right (before_low_level_spec) (pred)))))  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) ((avl_ptr_of ((avl_right (before_low_level_spec) (pred)))))))
  **  ((&(((avl_ptr_of ((avl_right (before_low_level_spec) (pred)))))  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) ((avl_ptr_of ((avl_right (before_low_level_spec) (pred)))))))
  **  ((&(((avl_ptr_of ((avl_right (before_low_level_spec) (pred)))))  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) ((avl_ptr_of ((avl_right (before_low_level_spec) (pred)))))))))
  **  ((&(((avl_ptr_of ((avl_right (before_low_level_spec) (pred)))))  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) ((avl_ptr_of ((avl_right (before_low_level_spec) (pred)))))))))
  **  (avl_graph_nodes_store before_low_level_spec (avl_nodes_without (before_low_level_spec) ((avl_ptr_of ((avl_right (before_low_level_spec) (pred)))))) )
  **  (GlobalStrings LitMap_low_level_spec )
) \/
(
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (pred: Z) (PreH1 : ((avl_height_of (before_low_level_spec) (pred)) <= UINT_MAX)) (PreH2 : ((avl_height_of (before_low_level_spec) (pred)) >= 0)) (PreH3 : ((avl_key_of (before_low_level_spec) (pred)) <= INT_MAX)) (PreH4 : ((avl_key_of (before_low_level_spec) (pred)) >= INT_MIN)) (PreH5 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH6 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) = data_pre)) (PreH7 : ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) <> 0)) (PreH8 : ((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) <> 0)) (PreH9 : (crtos_delete_cursor before_low_level_spec avl_node_pre pred )) (PreH10 : ((avl_ptr_of ((avl_right (before_low_level_spec) (pred)))) <> 0)) ,
  ((&((pred)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (pred)))
  **  ((&((pred)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (pred)))
  **  ((&((pred)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (pred)))))
  **  ((&((pred)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (pred)))))
  **  (avl_graph_nodes_store before_low_level_spec (avl_nodes_without (before_low_level_spec) (pred)) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (crtos_delete_cursor before_low_level_spec avl_node_pre (avl_ptr_of ((avl_right (before_low_level_spec) (pred)))) ) ”
  &&  ((&(((avl_ptr_of ((avl_right (before_low_level_spec) (pred)))))  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) ((avl_ptr_of ((avl_right (before_low_level_spec) (pred)))))))
  **  ((&(((avl_ptr_of ((avl_right (before_low_level_spec) (pred)))))  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) ((avl_ptr_of ((avl_right (before_low_level_spec) (pred)))))))
  **  ((&(((avl_ptr_of ((avl_right (before_low_level_spec) (pred)))))  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) ((avl_ptr_of ((avl_right (before_low_level_spec) (pred)))))))))
  **  ((&(((avl_ptr_of ((avl_right (before_low_level_spec) (pred)))))  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) ((avl_ptr_of ((avl_right (before_low_level_spec) (pred)))))))))
  **  (avl_graph_nodes_store before_low_level_spec (avl_nodes_without (before_low_level_spec) ((avl_ptr_of ((avl_right (before_low_level_spec) (pred)))))) )
  **  (GlobalStrings LitMap_low_level_spec )
).

Definition AvlTreeDeleteNode_entail_wit_8_split_goal_1 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (pred: Z) (PreH1 : ((avl_height_of (before_low_level_spec) (pred)) <= UINT_MAX)) (PreH2 : ((avl_height_of (before_low_level_spec) (pred)) >= 0)) (PreH3 : ((avl_key_of (before_low_level_spec) (pred)) <= INT_MAX)) (PreH4 : ((avl_key_of (before_low_level_spec) (pred)) >= INT_MIN)) (PreH5 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH6 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) = data_pre)) (PreH7 : ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) <> 0)) (PreH8 : ((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) <> 0)) (PreH9 : (crtos_delete_cursor before_low_level_spec avl_node_pre pred )) (PreH10 : ((avl_ptr_of ((avl_right (before_low_level_spec) (pred)))) <> 0)) ,
  ((&((pred)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (pred)))
  **  ((&((pred)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (pred)))
  **  ((&((pred)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (pred)))))
  **  ((&((pred)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (pred)))))
  **  (avl_graph_nodes_store before_low_level_spec (avl_nodes_without (before_low_level_spec) (pred)) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (crtos_delete_cursor before_low_level_spec avl_node_pre (avl_ptr_of ((avl_right (before_low_level_spec) (pred)))) ) ”
.

Definition AvlTreeDeleteNode_entail_wit_8_split_goal_spatial := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (pred: Z) (PreH1 : ((avl_height_of (before_low_level_spec) (pred)) <= UINT_MAX)) (PreH2 : ((avl_height_of (before_low_level_spec) (pred)) >= 0)) (PreH3 : ((avl_key_of (before_low_level_spec) (pred)) <= INT_MAX)) (PreH4 : ((avl_key_of (before_low_level_spec) (pred)) >= INT_MIN)) (PreH5 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH6 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) = data_pre)) (PreH7 : ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) <> 0)) (PreH8 : ((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) <> 0)) (PreH9 : (crtos_delete_cursor before_low_level_spec avl_node_pre pred )) (PreH10 : ((avl_ptr_of ((avl_right (before_low_level_spec) (pred)))) <> 0)) ,
  ((&((pred)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (pred)))
  **  ((&((pred)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (pred)))
  **  ((&((pred)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (pred)))))
  **  ((&((pred)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (pred)))))
  **  (avl_graph_nodes_store before_low_level_spec (avl_nodes_without (before_low_level_spec) (pred)) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  ((&(((avl_ptr_of ((avl_right (before_low_level_spec) (pred)))))  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) ((avl_ptr_of ((avl_right (before_low_level_spec) (pred)))))))
  **  ((&(((avl_ptr_of ((avl_right (before_low_level_spec) (pred)))))  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) ((avl_ptr_of ((avl_right (before_low_level_spec) (pred)))))))
  **  ((&(((avl_ptr_of ((avl_right (before_low_level_spec) (pred)))))  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) ((avl_ptr_of ((avl_right (before_low_level_spec) (pred)))))))))
  **  ((&(((avl_ptr_of ((avl_right (before_low_level_spec) (pred)))))  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) ((avl_ptr_of ((avl_right (before_low_level_spec) (pred)))))))))
  **  (avl_graph_nodes_store before_low_level_spec (avl_nodes_without (before_low_level_spec) ((avl_ptr_of ((avl_right (before_low_level_spec) (pred)))))) )
  **  (GlobalStrings LitMap_low_level_spec )
.

Definition AvlTreeDeleteNode_entail_wit_9 := 
(
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (pred: Z) (PreH1 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH2 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) = data_pre)) (PreH3 : ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) <> 0)) (PreH4 : ((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) <> 0)) (PreH5 : (crtos_delete_cursor before_low_level_spec avl_node_pre pred )) (PreH6 : ((avl_ptr_of ((avl_right (before_low_level_spec) (pred)))) = 0)) ,
  ((&((pred)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (pred)))
  **  ((&((pred)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (pred)))
  **  ((&((pred)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (pred)))))
  **  ((&((pred)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (pred)))))
  **  (avl_graph_nodes_store before_low_level_spec (avl_nodes_without (before_low_level_spec) (pred)) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (avl_delete_input before_low_level_spec avl_node_pre data_pre ) ” 
  &&  “ ((avl_key_of (before_low_level_spec) (avl_node_pre)) = data_pre) ” 
  &&  “ (avl_predecessor_result before_low_level_spec avl_node_pre pred ) ” 
  &&  “ (pred <> 0) ” 
  &&  “ (avl_vvalid before_low_level_spec pred ) ”
  &&  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  ((&((pred)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (pred)))
  **  ((&((pred)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (pred)))
  **  ((&((pred)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (pred)))))
  **  ((&((pred)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (pred)))))
  **  (avl_graph_nodes_store before_low_level_spec (remove_Z (pred) ((avl_nodes_without (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
) \/
(
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (pred: Z) (PreH1 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH2 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) = data_pre)) (PreH3 : ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) <> 0)) (PreH4 : ((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) <> 0)) (PreH5 : (crtos_delete_cursor before_low_level_spec avl_node_pre pred )) (PreH6 : ((avl_ptr_of ((avl_right (before_low_level_spec) (pred)))) = 0)) ,
  (avl_graph_nodes_store before_low_level_spec (avl_nodes_without (before_low_level_spec) (pred)) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (avl_vvalid before_low_level_spec pred ) ” 
  &&  “ (pred <> 0) ” 
  &&  “ (avl_predecessor_result before_low_level_spec avl_node_pre pred ) ”
  &&  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  (avl_graph_nodes_store before_low_level_spec (remove_Z (pred) ((avl_nodes_without (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
).

Definition AvlTreeDeleteNode_entail_wit_9_split_goal_1 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (pred: Z) (PreH1 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH2 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) = data_pre)) (PreH3 : ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) <> 0)) (PreH4 : ((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) <> 0)) (PreH5 : (crtos_delete_cursor before_low_level_spec avl_node_pre pred )) (PreH6 : ((avl_ptr_of ((avl_right (before_low_level_spec) (pred)))) = 0)) ,
  (avl_graph_nodes_store before_low_level_spec (avl_nodes_without (before_low_level_spec) (pred)) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (avl_vvalid before_low_level_spec pred ) ”
.

Definition AvlTreeDeleteNode_entail_wit_9_split_goal_2 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (pred: Z) (PreH1 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH2 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) = data_pre)) (PreH3 : ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) <> 0)) (PreH4 : ((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) <> 0)) (PreH5 : (crtos_delete_cursor before_low_level_spec avl_node_pre pred )) (PreH6 : ((avl_ptr_of ((avl_right (before_low_level_spec) (pred)))) = 0)) ,
  (avl_graph_nodes_store before_low_level_spec (avl_nodes_without (before_low_level_spec) (pred)) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (pred <> 0) ”
.

Definition AvlTreeDeleteNode_entail_wit_9_split_goal_3 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (pred: Z) (PreH1 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH2 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) = data_pre)) (PreH3 : ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) <> 0)) (PreH4 : ((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) <> 0)) (PreH5 : (crtos_delete_cursor before_low_level_spec avl_node_pre pred )) (PreH6 : ((avl_ptr_of ((avl_right (before_low_level_spec) (pred)))) = 0)) ,
  (avl_graph_nodes_store before_low_level_spec (avl_nodes_without (before_low_level_spec) (pred)) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (avl_predecessor_result before_low_level_spec avl_node_pre pred ) ”
.

Definition AvlTreeDeleteNode_entail_wit_9_split_goal_spatial := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (pred: Z) (PreH1 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH2 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) = data_pre)) (PreH3 : ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) <> 0)) (PreH4 : ((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) <> 0)) (PreH5 : (crtos_delete_cursor before_low_level_spec avl_node_pre pred )) (PreH6 : ((avl_ptr_of ((avl_right (before_low_level_spec) (pred)))) = 0)) ,
  (avl_graph_nodes_store before_low_level_spec (avl_nodes_without (before_low_level_spec) (pred)) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  (avl_graph_nodes_store before_low_level_spec (remove_Z (pred) ((avl_nodes_without (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
.

Definition AvlTreeDeleteNode_entail_wit_10 := 
(
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (pred: Z) (PreH1 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH2 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) = data_pre)) (PreH3 : (avl_predecessor_result before_low_level_spec avl_node_pre pred )) (PreH4 : (pred <> 0)) (PreH5 : (avl_vvalid before_low_level_spec pred )) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (pred)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  ((&((pred)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (pred)))
  **  ((&((pred)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (pred)))
  **  ((&((pred)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (pred)))))
  **  ((&((pred)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (pred)))))
  **  (avl_graph_nodes_store before_low_level_spec (remove_Z (pred) ((avl_nodes_without (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (avl_delete_input before_low_level_spec avl_node_pre data_pre ) ” 
  &&  “ (data_pre = (avl_key_of (before_low_level_spec) (avl_node_pre))) ” 
  &&  “ (avl_predecessor_result before_low_level_spec avl_node_pre pred ) ” 
  &&  “ (pred <> 0) ” 
  &&  “ (avl_vvalid (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) pred ) ” 
  &&  “ (avl_delete_input (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) (avl_key_of (before_low_level_spec) (pred)) ) ” 
  &&  “ ((avl_key_of ((avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre))))) (pred)) = (avl_key_of (before_low_level_spec) (pred))) ”
  &&  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (pred)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  ((&((pred)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of ((avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre))))) (pred)))
  **  ((&((pred)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of ((avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre))))) (pred)))
  **  ((&((pred)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left ((avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre))))) (pred)))))
  **  ((&((pred)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right ((avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre))))) (pred)))))
  **  (avl_graph_nodes_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) (avl_nodes_without ((avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre))))) (pred)) )
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
) \/
(
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (pred: Z) (PreH1 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH2 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) = data_pre)) (PreH3 : (avl_predecessor_result before_low_level_spec avl_node_pre pred )) (PreH4 : (pred <> 0)) (PreH5 : (avl_vvalid before_low_level_spec pred )) ,
  (avl_graph_nodes_store before_low_level_spec (remove_Z (pred) ((avl_nodes_without (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ ((avl_key_of ((avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre))))) (pred)) = (avl_key_of (before_low_level_spec) (pred))) ” 
  &&  “ (avl_delete_input (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) (avl_key_of (before_low_level_spec) (pred)) ) ” 
  &&  “ (avl_vvalid (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) pred ) ” 
  &&  “ ((avl_key_of (before_low_level_spec) (pred)) = (avl_key_of ((avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre))))) (pred))) ” 
  &&  “ ((avl_height_of (before_low_level_spec) (pred)) = (avl_height_of ((avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre))))) (pred))) ” 
  &&  “ ((avl_ptr_of ((avl_left (before_low_level_spec) (pred)))) = (avl_ptr_of ((avl_left ((avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre))))) (pred))))) ” 
  &&  “ ((avl_ptr_of ((avl_right (before_low_level_spec) (pred)))) = (avl_ptr_of ((avl_right ((avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre))))) (pred))))) ”
  &&  (avl_graph_nodes_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) (avl_nodes_without ((avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre))))) (pred)) )
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
).

Definition AvlTreeDeleteNode_entail_wit_10_split_goal_1 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (pred: Z) (PreH1 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH2 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) = data_pre)) (PreH3 : (avl_predecessor_result before_low_level_spec avl_node_pre pred )) (PreH4 : (pred <> 0)) (PreH5 : (avl_vvalid before_low_level_spec pred )) ,
  (avl_graph_nodes_store before_low_level_spec (remove_Z (pred) ((avl_nodes_without (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ ((avl_key_of ((avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre))))) (pred)) = (avl_key_of (before_low_level_spec) (pred))) ”
.

Definition AvlTreeDeleteNode_entail_wit_10_split_goal_2 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (pred: Z) (PreH1 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH2 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) = data_pre)) (PreH3 : (avl_predecessor_result before_low_level_spec avl_node_pre pred )) (PreH4 : (pred <> 0)) (PreH5 : (avl_vvalid before_low_level_spec pred )) ,
  (avl_graph_nodes_store before_low_level_spec (remove_Z (pred) ((avl_nodes_without (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (avl_delete_input (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) (avl_key_of (before_low_level_spec) (pred)) ) ”
.

Definition AvlTreeDeleteNode_entail_wit_10_split_goal_3 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (pred: Z) (PreH1 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH2 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) = data_pre)) (PreH3 : (avl_predecessor_result before_low_level_spec avl_node_pre pred )) (PreH4 : (pred <> 0)) (PreH5 : (avl_vvalid before_low_level_spec pred )) ,
  (avl_graph_nodes_store before_low_level_spec (remove_Z (pred) ((avl_nodes_without (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (avl_vvalid (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) pred ) ”
.

Definition AvlTreeDeleteNode_entail_wit_10_split_goal_4 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (pred: Z) (PreH1 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH2 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) = data_pre)) (PreH3 : (avl_predecessor_result before_low_level_spec avl_node_pre pred )) (PreH4 : (pred <> 0)) (PreH5 : (avl_vvalid before_low_level_spec pred )) ,
  (avl_graph_nodes_store before_low_level_spec (remove_Z (pred) ((avl_nodes_without (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ ((avl_key_of (before_low_level_spec) (pred)) = (avl_key_of ((avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre))))) (pred))) ”
.

Definition AvlTreeDeleteNode_entail_wit_10_split_goal_5 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (pred: Z) (PreH1 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH2 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) = data_pre)) (PreH3 : (avl_predecessor_result before_low_level_spec avl_node_pre pred )) (PreH4 : (pred <> 0)) (PreH5 : (avl_vvalid before_low_level_spec pred )) ,
  (avl_graph_nodes_store before_low_level_spec (remove_Z (pred) ((avl_nodes_without (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ ((avl_height_of (before_low_level_spec) (pred)) = (avl_height_of ((avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre))))) (pred))) ”
.

Definition AvlTreeDeleteNode_entail_wit_10_split_goal_6 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (pred: Z) (PreH1 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH2 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) = data_pre)) (PreH3 : (avl_predecessor_result before_low_level_spec avl_node_pre pred )) (PreH4 : (pred <> 0)) (PreH5 : (avl_vvalid before_low_level_spec pred )) ,
  (avl_graph_nodes_store before_low_level_spec (remove_Z (pred) ((avl_nodes_without (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ ((avl_ptr_of ((avl_left (before_low_level_spec) (pred)))) = (avl_ptr_of ((avl_left ((avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre))))) (pred))))) ”
.

Definition AvlTreeDeleteNode_entail_wit_10_split_goal_7 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (pred: Z) (PreH1 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH2 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) = data_pre)) (PreH3 : (avl_predecessor_result before_low_level_spec avl_node_pre pred )) (PreH4 : (pred <> 0)) (PreH5 : (avl_vvalid before_low_level_spec pred )) ,
  (avl_graph_nodes_store before_low_level_spec (remove_Z (pred) ((avl_nodes_without (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ ((avl_ptr_of ((avl_right (before_low_level_spec) (pred)))) = (avl_ptr_of ((avl_right ((avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre))))) (pred))))) ”
.

Definition AvlTreeDeleteNode_entail_wit_10_split_goal_spatial := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (pred: Z) (PreH1 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH2 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) = data_pre)) (PreH3 : (avl_predecessor_result before_low_level_spec avl_node_pre pred )) (PreH4 : (pred <> 0)) (PreH5 : (avl_vvalid before_low_level_spec pred )) ,
  (avl_graph_nodes_store before_low_level_spec (remove_Z (pred) ((avl_nodes_without (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  (avl_graph_nodes_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) (avl_nodes_without ((avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre))))) (pred)) )
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
.

Definition AvlTreeDeleteNode_entail_wit_11_1 := 
(
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (after: avl_model) (retval: Z) (PreH1 : (avl_delete_outcome (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) after data_pre retval )) (PreH2 : (avl_api_delete_identity (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) after data_pre )) (PreH3 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) < data_pre)) (PreH4 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH5 : (avl_node_pre <> 0)) (PreH6 : (avl_vvalid before_low_level_spec avl_node_pre )) (PreH7 : (avl_node_pre <> 0)) ,
  (avl_tree_store after )
  **  (GlobalStrings LitMap_low_level_spec )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> retval)
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
|--
  EX (old_cache: Z)  (raw: avl_model) ,
  “ (avl_delete_input before_low_level_spec avl_node_pre data_pre ) ” 
  &&  “ (avl_api_delete_repair before_low_level_spec raw data_pre avl_node_pre ) ” 
  &&  “ (avl_tree_valid raw ) ” 
  &&  “ (avl_update_height_children_safe raw avl_node_pre ) ” 
  &&  “ (avl_balance_graph_input raw avl_node_pre ) ”
  &&  (avl_tree_store (avl_with_root_cache (raw) (avl_node_pre) (old_cache)) )
  **  (GlobalStrings LitMap_low_level_spec )
) \/
(
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (after: avl_model) (retval: Z) (PreH1 : ((avl_height_of (before_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH2 : ((avl_height_of (before_low_level_spec) (avl_node_pre)) >= 0)) (PreH3 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH5 : (avl_delete_outcome (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) after data_pre retval )) (PreH6 : (avl_api_delete_identity (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) after data_pre )) (PreH7 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) < data_pre)) (PreH8 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH9 : (avl_node_pre <> 0)) (PreH10 : (avl_vvalid before_low_level_spec avl_node_pre )) (PreH11 : (avl_node_pre <> 0)) ,
  (avl_tree_store after )
  **  (GlobalStrings LitMap_low_level_spec )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> retval)
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
|--
  EX (old_cache: Z)  (raw: avl_model) ,
  “ (avl_delete_input before_low_level_spec avl_node_pre data_pre ) ” 
  &&  “ (avl_api_delete_repair before_low_level_spec raw data_pre avl_node_pre ) ” 
  &&  “ (avl_tree_valid raw ) ” 
  &&  “ (avl_update_height_children_safe raw avl_node_pre ) ” 
  &&  “ (avl_balance_graph_input raw avl_node_pre ) ”
  &&  (avl_tree_store (avl_with_root_cache (raw) (avl_node_pre) (old_cache)) )
  **  (GlobalStrings LitMap_low_level_spec )
).

Definition AvlTreeDeleteNode_entail_wit_11_2 := 
(
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (after: avl_model) (retval: Z) (PreH1 : (avl_delete_outcome (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) after data_pre retval )) (PreH2 : (avl_api_delete_identity (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) after data_pre )) (PreH3 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) > data_pre)) (PreH4 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) >= data_pre)) (PreH5 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH6 : (avl_node_pre <> 0)) (PreH7 : (avl_vvalid before_low_level_spec avl_node_pre )) (PreH8 : (avl_node_pre <> 0)) ,
  (avl_tree_store after )
  **  (GlobalStrings LitMap_low_level_spec )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> retval)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
|--
  EX (old_cache: Z)  (raw: avl_model) ,
  “ (avl_delete_input before_low_level_spec avl_node_pre data_pre ) ” 
  &&  “ (avl_api_delete_repair before_low_level_spec raw data_pre avl_node_pre ) ” 
  &&  “ (avl_tree_valid raw ) ” 
  &&  “ (avl_update_height_children_safe raw avl_node_pre ) ” 
  &&  “ (avl_balance_graph_input raw avl_node_pre ) ”
  &&  (avl_tree_store (avl_with_root_cache (raw) (avl_node_pre) (old_cache)) )
  **  (GlobalStrings LitMap_low_level_spec )
) \/
(
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (after: avl_model) (retval: Z) (PreH1 : ((avl_height_of (before_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH2 : ((avl_height_of (before_low_level_spec) (avl_node_pre)) >= 0)) (PreH3 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH5 : (avl_delete_outcome (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) after data_pre retval )) (PreH6 : (avl_api_delete_identity (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) after data_pre )) (PreH7 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) > data_pre)) (PreH8 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) >= data_pre)) (PreH9 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH10 : (avl_node_pre <> 0)) (PreH11 : (avl_vvalid before_low_level_spec avl_node_pre )) (PreH12 : (avl_node_pre <> 0)) ,
  (avl_tree_store after )
  **  (GlobalStrings LitMap_low_level_spec )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> retval)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
|--
  EX (old_cache: Z)  (raw: avl_model) ,
  “ (avl_delete_input before_low_level_spec avl_node_pre data_pre ) ” 
  &&  “ (avl_api_delete_repair before_low_level_spec raw data_pre avl_node_pre ) ” 
  &&  “ (avl_tree_valid raw ) ” 
  &&  “ (avl_update_height_children_safe raw avl_node_pre ) ” 
  &&  “ (avl_balance_graph_input raw avl_node_pre ) ”
  &&  (avl_tree_store (avl_with_root_cache (raw) (avl_node_pre) (old_cache)) )
  **  (GlobalStrings LitMap_low_level_spec )
).

Definition AvlTreeDeleteNode_entail_wit_11_3 := 
(
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (pred: Z) (after: avl_model) (retval: Z) (PreH1 : (avl_delete_outcome (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) after (avl_key_of ((avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre))))) (pred)) retval )) (PreH2 : (avl_api_delete_identity (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) after (avl_key_of ((avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre))))) (pred)) )) (PreH3 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH4 : (data_pre = (avl_key_of (before_low_level_spec) (avl_node_pre)))) (PreH5 : (avl_predecessor_result before_low_level_spec avl_node_pre pred )) (PreH6 : (pred <> 0)) (PreH7 : (avl_vvalid (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) pred )) (PreH8 : (avl_delete_input (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) (avl_key_of (before_low_level_spec) (pred)) )) (PreH9 : ((avl_key_of ((avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre))))) (pred)) = (avl_key_of (before_low_level_spec) (pred)))) ,
  (avl_tree_store after )
  **  (GlobalStrings LitMap_low_level_spec )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (pred)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> retval)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
|--
  EX (old_cache: Z)  (raw: avl_model) ,
  “ (avl_delete_input before_low_level_spec avl_node_pre data_pre ) ” 
  &&  “ (avl_api_delete_repair before_low_level_spec raw data_pre avl_node_pre ) ” 
  &&  “ (avl_tree_valid raw ) ” 
  &&  “ (avl_update_height_children_safe raw avl_node_pre ) ” 
  &&  “ (avl_balance_graph_input raw avl_node_pre ) ”
  &&  (avl_tree_store (avl_with_root_cache (raw) (avl_node_pre) (old_cache)) )
  **  (GlobalStrings LitMap_low_level_spec )
) \/
(
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (pred: Z) (after: avl_model) (retval: Z) (PreH1 : ((avl_height_of (before_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH2 : ((avl_height_of (before_low_level_spec) (avl_node_pre)) >= 0)) (PreH3 : ((avl_key_of (before_low_level_spec) (pred)) <= INT_MAX)) (PreH4 : ((avl_key_of (before_low_level_spec) (pred)) >= INT_MIN)) (PreH5 : (avl_delete_outcome (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) after (avl_key_of ((avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre))))) (pred)) retval )) (PreH6 : (avl_api_delete_identity (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) after (avl_key_of ((avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre))))) (pred)) )) (PreH7 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH8 : (data_pre = (avl_key_of (before_low_level_spec) (avl_node_pre)))) (PreH9 : (avl_predecessor_result before_low_level_spec avl_node_pre pred )) (PreH10 : (pred <> 0)) (PreH11 : (avl_vvalid (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) pred )) (PreH12 : (avl_delete_input (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) (avl_key_of (before_low_level_spec) (pred)) )) (PreH13 : ((avl_key_of ((avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre))))) (pred)) = (avl_key_of (before_low_level_spec) (pred)))) ,
  (avl_tree_store after )
  **  (GlobalStrings LitMap_low_level_spec )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (pred)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> retval)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
|--
  EX (old_cache: Z)  (raw: avl_model) ,
  “ (avl_delete_input before_low_level_spec avl_node_pre data_pre ) ” 
  &&  “ (avl_api_delete_repair before_low_level_spec raw data_pre avl_node_pre ) ” 
  &&  “ (avl_tree_valid raw ) ” 
  &&  “ (avl_update_height_children_safe raw avl_node_pre ) ” 
  &&  “ (avl_balance_graph_input raw avl_node_pre ) ”
  &&  (avl_tree_store (avl_with_root_cache (raw) (avl_node_pre) (old_cache)) )
  **  (GlobalStrings LitMap_low_level_spec )
).

Definition AvlTreeDeleteNode_return_wit_1 := 
(
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (PreH1 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH2 : (avl_node_pre = 0)) (PreH3 : (avl_node_pre = 0)) ,
  (store_stringLit (LitMap_low_level_spec (("AvlTreeDeleteNode cannot find the delete data
"%string))) ("AvlTreeDeleteNode cannot find the delete data
"%string) )
  **  (GlobalStrings_missing LitMap_low_level_spec (cons (("AvlTreeDeleteNode cannot find the delete data
"%string)) ((@nil string))) )
  **  (avl_tree_store before_low_level_spec )
|--
  EX (after: avl_model) ,
  “ (avl_delete_outcome before_low_level_spec after data_pre 0 ) ” 
  &&  “ (avl_api_delete_identity before_low_level_spec after data_pre ) ”
  &&  (avl_tree_store after )
  **  (GlobalStrings LitMap_low_level_spec )
) \/
(
forall (data_pre: Z) (avl_node_pre: Z) (before_low_level_spec: avl_model) (PreH1 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH2 : (avl_node_pre = 0)) (PreH3 : (avl_node_pre = 0)) ,
  TT && emp 
|--
  “ (avl_api_delete_identity before_low_level_spec before_low_level_spec data_pre ) ” 
  &&  “ (avl_delete_outcome before_low_level_spec before_low_level_spec data_pre 0 ) ”
  &&  emp
).

Definition AvlTreeDeleteNode_return_wit_1_split_goal_1 := 
forall (data_pre: Z) (avl_node_pre: Z) (before_low_level_spec: avl_model) (PreH1 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH2 : (avl_node_pre = 0)) (PreH3 : (avl_node_pre = 0)) ,
  (avl_api_delete_identity before_low_level_spec before_low_level_spec data_pre )
.

Definition AvlTreeDeleteNode_return_wit_1_split_goal_2 := 
forall (data_pre: Z) (avl_node_pre: Z) (before_low_level_spec: avl_model) (PreH1 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH2 : (avl_node_pre = 0)) (PreH3 : (avl_node_pre = 0)) ,
  (avl_delete_outcome before_low_level_spec before_low_level_spec data_pre 0 )
.

Definition AvlTreeDeleteNode_return_wit_2 := 
(
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (raw: avl_model) (after_2: avl_model) (retval: Z) (PreH1 : (avl_balance_graph_result raw after_2 retval )) (PreH2 : (avl_balance_height_effect raw after_2 )) (PreH3 : (strict_balance_identity raw after_2 )) (PreH4 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH5 : (avl_api_delete_repair before_low_level_spec raw data_pre avl_node_pre )) (PreH6 : (avl_tree_valid raw )) (PreH7 : (avl_update_height_children_safe raw avl_node_pre )) (PreH8 : (avl_balance_graph_input raw avl_node_pre )) ,
  (avl_tree_store after_2 )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  EX (after: avl_model) ,
  “ (avl_delete_outcome before_low_level_spec after data_pre retval ) ” 
  &&  “ (avl_api_delete_identity before_low_level_spec after data_pre ) ”
  &&  (avl_tree_store after )
  **  (GlobalStrings LitMap_low_level_spec )
) \/
(
forall (data_pre: Z) (avl_node_pre: Z) (before_low_level_spec: avl_model) (raw: avl_model) (after_2: avl_model) (retval: Z) (PreH1 : (avl_balance_graph_result raw after_2 retval )) (PreH2 : (avl_balance_height_effect raw after_2 )) (PreH3 : (strict_balance_identity raw after_2 )) (PreH4 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH5 : (avl_api_delete_repair before_low_level_spec raw data_pre avl_node_pre )) (PreH6 : (avl_tree_valid raw )) (PreH7 : (avl_update_height_children_safe raw avl_node_pre )) (PreH8 : (avl_balance_graph_input raw avl_node_pre )) ,
  TT && emp 
|--
  “ (avl_api_delete_identity before_low_level_spec after_2 data_pre ) ” 
  &&  “ (avl_delete_outcome before_low_level_spec after_2 data_pre retval ) ”
  &&  emp
).

Definition AvlTreeDeleteNode_return_wit_2_split_goal_1 := 
forall (data_pre: Z) (avl_node_pre: Z) (before_low_level_spec: avl_model) (raw: avl_model) (after_2: avl_model) (retval: Z) (PreH1 : (avl_balance_graph_result raw after_2 retval )) (PreH2 : (avl_balance_height_effect raw after_2 )) (PreH3 : (strict_balance_identity raw after_2 )) (PreH4 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH5 : (avl_api_delete_repair before_low_level_spec raw data_pre avl_node_pre )) (PreH6 : (avl_tree_valid raw )) (PreH7 : (avl_update_height_children_safe raw avl_node_pre )) (PreH8 : (avl_balance_graph_input raw avl_node_pre )) ,
  (avl_api_delete_identity before_low_level_spec after_2 data_pre )
.

Definition AvlTreeDeleteNode_return_wit_2_split_goal_2 := 
forall (data_pre: Z) (avl_node_pre: Z) (before_low_level_spec: avl_model) (raw: avl_model) (after_2: avl_model) (retval: Z) (PreH1 : (avl_balance_graph_result raw after_2 retval )) (PreH2 : (avl_balance_height_effect raw after_2 )) (PreH3 : (strict_balance_identity raw after_2 )) (PreH4 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH5 : (avl_api_delete_repair before_low_level_spec raw data_pre avl_node_pre )) (PreH6 : (avl_tree_valid raw )) (PreH7 : (avl_update_height_children_safe raw avl_node_pre )) (PreH8 : (avl_balance_graph_input raw avl_node_pre )) ,
  (avl_delete_outcome before_low_level_spec after_2 data_pre retval )
.

Definition AvlTreeDeleteNode_return_wit_3 := 
(
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (temp: Z) (after_2: avl_model) (retval: Z) (PreH1 : (avl_balance_graph_result (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) after_2 retval )) (PreH2 : (avl_balance_height_effect (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) after_2 )) (PreH3 : (strict_balance_identity (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) after_2 )) (PreH4 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH5 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) = data_pre)) (PreH6 : (temp = (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) (PreH7 : (avl_api_delete_repair before_low_level_spec (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) data_pre temp )) (PreH8 : (avl_tree_valid (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )) (PreH9 : (temp = (avl_ptr_of ((avl_root ((avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))))))))) (PreH10 : (avl_update_height_children_safe (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) temp )) (PreH11 : (avl_balance_graph_input (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) temp )) ,
  (avl_tree_store after_2 )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  EX (after: avl_model) ,
  “ (avl_delete_outcome before_low_level_spec after data_pre retval ) ” 
  &&  “ (avl_api_delete_identity before_low_level_spec after data_pre ) ”
  &&  (avl_tree_store after )
  **  (GlobalStrings LitMap_low_level_spec )
) \/
(
forall (data_pre: Z) (avl_node_pre: Z) (before_low_level_spec: avl_model) (temp: Z) (after_2: avl_model) (retval: Z) (PreH1 : (avl_balance_graph_result (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) after_2 retval )) (PreH2 : (avl_balance_height_effect (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) after_2 )) (PreH3 : (strict_balance_identity (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) after_2 )) (PreH4 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH5 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) = data_pre)) (PreH6 : (temp = (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) (PreH7 : (avl_api_delete_repair before_low_level_spec (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) data_pre temp )) (PreH8 : (avl_tree_valid (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )) (PreH9 : (temp = (avl_ptr_of ((avl_root ((avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))))))))) (PreH10 : (avl_update_height_children_safe (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) temp )) (PreH11 : (avl_balance_graph_input (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) temp )) ,
  TT && emp 
|--
  “ (avl_api_delete_identity before_low_level_spec after_2 data_pre ) ” 
  &&  “ (avl_delete_outcome before_low_level_spec after_2 data_pre retval ) ”
  &&  emp
).

Definition AvlTreeDeleteNode_return_wit_3_split_goal_1 := 
forall (data_pre: Z) (avl_node_pre: Z) (before_low_level_spec: avl_model) (temp: Z) (after_2: avl_model) (retval: Z) (PreH1 : (avl_balance_graph_result (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) after_2 retval )) (PreH2 : (avl_balance_height_effect (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) after_2 )) (PreH3 : (strict_balance_identity (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) after_2 )) (PreH4 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH5 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) = data_pre)) (PreH6 : (temp = (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) (PreH7 : (avl_api_delete_repair before_low_level_spec (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) data_pre temp )) (PreH8 : (avl_tree_valid (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )) (PreH9 : (temp = (avl_ptr_of ((avl_root ((avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))))))))) (PreH10 : (avl_update_height_children_safe (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) temp )) (PreH11 : (avl_balance_graph_input (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) temp )) ,
  (avl_api_delete_identity before_low_level_spec after_2 data_pre )
.

Definition AvlTreeDeleteNode_return_wit_3_split_goal_2 := 
forall (data_pre: Z) (avl_node_pre: Z) (before_low_level_spec: avl_model) (temp: Z) (after_2: avl_model) (retval: Z) (PreH1 : (avl_balance_graph_result (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) after_2 retval )) (PreH2 : (avl_balance_height_effect (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) after_2 )) (PreH3 : (strict_balance_identity (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) after_2 )) (PreH4 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH5 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) = data_pre)) (PreH6 : (temp = (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) (PreH7 : (avl_api_delete_repair before_low_level_spec (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) data_pre temp )) (PreH8 : (avl_tree_valid (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )) (PreH9 : (temp = (avl_ptr_of ((avl_root ((avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))))))))) (PreH10 : (avl_update_height_children_safe (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) temp )) (PreH11 : (avl_balance_graph_input (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) temp )) ,
  (avl_delete_outcome before_low_level_spec after_2 data_pre retval )
.

Definition AvlTreeDeleteNode_return_wit_4 := 
(
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (temp: Z) (after_2: avl_model) (retval: Z) (PreH1 : (avl_balance_graph_result (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) after_2 retval )) (PreH2 : (avl_balance_height_effect (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) after_2 )) (PreH3 : (strict_balance_identity (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) after_2 )) (PreH4 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH5 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) = data_pre)) (PreH6 : (temp = (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))) (PreH7 : (avl_api_delete_repair before_low_level_spec (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) data_pre temp )) (PreH8 : (avl_tree_valid (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )) (PreH9 : (temp = (avl_ptr_of ((avl_root ((avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))))))))) (PreH10 : (avl_update_height_children_safe (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) temp )) (PreH11 : (avl_balance_graph_input (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) temp )) ,
  (avl_tree_store after_2 )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  EX (after: avl_model) ,
  “ (avl_delete_outcome before_low_level_spec after data_pre retval ) ” 
  &&  “ (avl_api_delete_identity before_low_level_spec after data_pre ) ”
  &&  (avl_tree_store after )
  **  (GlobalStrings LitMap_low_level_spec )
) \/
(
forall (data_pre: Z) (avl_node_pre: Z) (before_low_level_spec: avl_model) (temp: Z) (after_2: avl_model) (retval: Z) (PreH1 : (avl_balance_graph_result (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) after_2 retval )) (PreH2 : (avl_balance_height_effect (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) after_2 )) (PreH3 : (strict_balance_identity (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) after_2 )) (PreH4 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH5 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) = data_pre)) (PreH6 : (temp = (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))) (PreH7 : (avl_api_delete_repair before_low_level_spec (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) data_pre temp )) (PreH8 : (avl_tree_valid (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )) (PreH9 : (temp = (avl_ptr_of ((avl_root ((avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))))))))) (PreH10 : (avl_update_height_children_safe (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) temp )) (PreH11 : (avl_balance_graph_input (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) temp )) ,
  TT && emp 
|--
  “ (avl_api_delete_identity before_low_level_spec after_2 data_pre ) ” 
  &&  “ (avl_delete_outcome before_low_level_spec after_2 data_pre retval ) ”
  &&  emp
).

Definition AvlTreeDeleteNode_return_wit_4_split_goal_1 := 
forall (data_pre: Z) (avl_node_pre: Z) (before_low_level_spec: avl_model) (temp: Z) (after_2: avl_model) (retval: Z) (PreH1 : (avl_balance_graph_result (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) after_2 retval )) (PreH2 : (avl_balance_height_effect (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) after_2 )) (PreH3 : (strict_balance_identity (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) after_2 )) (PreH4 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH5 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) = data_pre)) (PreH6 : (temp = (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))) (PreH7 : (avl_api_delete_repair before_low_level_spec (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) data_pre temp )) (PreH8 : (avl_tree_valid (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )) (PreH9 : (temp = (avl_ptr_of ((avl_root ((avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))))))))) (PreH10 : (avl_update_height_children_safe (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) temp )) (PreH11 : (avl_balance_graph_input (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) temp )) ,
  (avl_api_delete_identity before_low_level_spec after_2 data_pre )
.

Definition AvlTreeDeleteNode_return_wit_4_split_goal_2 := 
forall (data_pre: Z) (avl_node_pre: Z) (before_low_level_spec: avl_model) (temp: Z) (after_2: avl_model) (retval: Z) (PreH1 : (avl_balance_graph_result (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) after_2 retval )) (PreH2 : (avl_balance_height_effect (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) after_2 )) (PreH3 : (strict_balance_identity (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) after_2 )) (PreH4 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH5 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) = data_pre)) (PreH6 : (temp = (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))) (PreH7 : (avl_api_delete_repair before_low_level_spec (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) data_pre temp )) (PreH8 : (avl_tree_valid (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )) (PreH9 : (temp = (avl_ptr_of ((avl_root ((avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))))))))) (PreH10 : (avl_update_height_children_safe (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) temp )) (PreH11 : (avl_balance_graph_input (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) temp )) ,
  (avl_delete_outcome before_low_level_spec after_2 data_pre retval )
.

Definition AvlTreeDeleteNode_return_wit_5 := 
(
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (PreH1 : (0 = (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))) (PreH2 : (0 = (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) (PreH3 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) <= data_pre)) (PreH4 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) >= data_pre)) (PreH5 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH6 : (avl_node_pre <> 0)) (PreH7 : (avl_vvalid before_low_level_spec avl_node_pre )) (PreH8 : (avl_node_pre <> 0)) ,
  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  EX (after: avl_model) ,
  “ (avl_delete_outcome before_low_level_spec after data_pre 0 ) ” 
  &&  “ (avl_api_delete_identity before_low_level_spec after data_pre ) ”
  &&  (avl_tree_store after )
  **  (GlobalStrings LitMap_low_level_spec )
) \/
(
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (PreH1 : (0 = (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))) (PreH2 : (0 = (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) (PreH3 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) <= data_pre)) (PreH4 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) >= data_pre)) (PreH5 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH6 : (avl_node_pre <> 0)) (PreH7 : (avl_vvalid before_low_level_spec avl_node_pre )) (PreH8 : (avl_node_pre <> 0)) ,
  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  EX (after: avl_model) ,
  “ (avl_delete_outcome before_low_level_spec after data_pre 0 ) ” 
  &&  “ (avl_api_delete_identity before_low_level_spec after data_pre ) ”
  &&  (avl_tree_store after )
  **  (GlobalStrings LitMap_low_level_spec )
).

Definition AvlTreeDeleteNode_partial_solve_wit_1_pure := 
(
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (PreH1 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) < data_pre)) (PreH2 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH3 : (avl_node_pre <> 0)) (PreH4 : (avl_vvalid before_low_level_spec avl_node_pre )) (PreH5 : (avl_node_pre <> 0)) ,
  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "temp" ) )) # Ptr  |-> 0)
  **  ((( &( "pred" ) )) # Ptr  |-> 0)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ ((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) = (avl_ptr_of ((avl_root ((avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre))))))))) ” 
  &&  “ (avl_gvalid (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) ) ”
) \/
(
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (PreH1 : ((avl_height_of (before_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH2 : ((avl_height_of (before_low_level_spec) (avl_node_pre)) >= 0)) (PreH3 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : (data_pre <= INT_MAX)) (PreH5 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH6 : (data_pre >= INT_MIN)) (PreH7 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) < data_pre)) (PreH8 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH9 : (avl_node_pre <> 0)) (PreH10 : (avl_vvalid before_low_level_spec avl_node_pre )) (PreH11 : (avl_node_pre <> 0)) ,
  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "temp" ) )) # Ptr  |-> 0)
  **  ((( &( "pred" ) )) # Ptr  |-> 0)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (avl_gvalid (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) ) ” 
  &&  “ ((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) = (avl_ptr_of ((avl_root ((avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre))))))))) ”
).

Definition AvlTreeDeleteNode_partial_solve_wit_1_pure_split_goal_1 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (PreH1 : ((avl_height_of (before_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH2 : ((avl_height_of (before_low_level_spec) (avl_node_pre)) >= 0)) (PreH3 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : (data_pre <= INT_MAX)) (PreH5 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH6 : (data_pre >= INT_MIN)) (PreH7 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) < data_pre)) (PreH8 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH9 : (avl_node_pre <> 0)) (PreH10 : (avl_vvalid before_low_level_spec avl_node_pre )) (PreH11 : (avl_node_pre <> 0)) ,
  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "temp" ) )) # Ptr  |-> 0)
  **  ((( &( "pred" ) )) # Ptr  |-> 0)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (avl_gvalid (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) ) ”
.

Definition AvlTreeDeleteNode_partial_solve_wit_1_pure_split_goal_2 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (PreH1 : ((avl_height_of (before_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH2 : ((avl_height_of (before_low_level_spec) (avl_node_pre)) >= 0)) (PreH3 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : (data_pre <= INT_MAX)) (PreH5 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH6 : (data_pre >= INT_MIN)) (PreH7 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) < data_pre)) (PreH8 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH9 : (avl_node_pre <> 0)) (PreH10 : (avl_vvalid before_low_level_spec avl_node_pre )) (PreH11 : (avl_node_pre <> 0)) ,
  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "temp" ) )) # Ptr  |-> 0)
  **  ((( &( "pred" ) )) # Ptr  |-> 0)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ ((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) = (avl_ptr_of ((avl_root ((avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre))))))))) ”
.

Definition AvlTreeDeleteNode_partial_solve_wit_1_aux := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (PreH1 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) < data_pre)) (PreH2 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH3 : (avl_node_pre <> 0)) (PreH4 : (avl_vvalid before_low_level_spec avl_node_pre )) (PreH5 : (avl_node_pre <> 0)) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ ((avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))) = (avl_ptr_of ((avl_root ((avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre))))))))) ” 
  &&  “ (avl_gvalid (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) ) ” 
  &&  “ ((avl_key_of (before_low_level_spec) (avl_node_pre)) < data_pre) ” 
  &&  “ (avl_delete_input before_low_level_spec avl_node_pre data_pre ) ” 
  &&  “ (avl_node_pre <> 0) ” 
  &&  “ (avl_vvalid before_low_level_spec avl_node_pre ) ” 
  &&  “ (avl_node_pre <> 0) ”
  &&  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
.

Definition AvlTreeDeleteNode_partial_solve_wit_1 := AvlTreeDeleteNode_partial_solve_wit_1_pure -> AvlTreeDeleteNode_partial_solve_wit_1_aux.

Definition AvlTreeDeleteNode_partial_solve_wit_2_pure := 
(
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (PreH1 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) > data_pre)) (PreH2 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) >= data_pre)) (PreH3 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH4 : (avl_node_pre <> 0)) (PreH5 : (avl_vvalid before_low_level_spec avl_node_pre )) (PreH6 : (avl_node_pre <> 0)) ,
  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "temp" ) )) # Ptr  |-> 0)
  **  ((( &( "pred" ) )) # Ptr  |-> 0)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) = (avl_ptr_of ((avl_root ((avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre))))))))) ” 
  &&  “ (avl_gvalid (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) ) ”
) \/
(
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (PreH1 : ((avl_height_of (before_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH2 : ((avl_height_of (before_low_level_spec) (avl_node_pre)) >= 0)) (PreH3 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : (data_pre <= INT_MAX)) (PreH5 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH6 : (data_pre >= INT_MIN)) (PreH7 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) > data_pre)) (PreH8 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) >= data_pre)) (PreH9 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH10 : (avl_node_pre <> 0)) (PreH11 : (avl_vvalid before_low_level_spec avl_node_pre )) (PreH12 : (avl_node_pre <> 0)) ,
  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "temp" ) )) # Ptr  |-> 0)
  **  ((( &( "pred" ) )) # Ptr  |-> 0)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (avl_gvalid (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) ) ” 
  &&  “ ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) = (avl_ptr_of ((avl_root ((avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre))))))))) ”
).

Definition AvlTreeDeleteNode_partial_solve_wit_2_pure_split_goal_1 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (PreH1 : ((avl_height_of (before_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH2 : ((avl_height_of (before_low_level_spec) (avl_node_pre)) >= 0)) (PreH3 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : (data_pre <= INT_MAX)) (PreH5 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH6 : (data_pre >= INT_MIN)) (PreH7 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) > data_pre)) (PreH8 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) >= data_pre)) (PreH9 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH10 : (avl_node_pre <> 0)) (PreH11 : (avl_vvalid before_low_level_spec avl_node_pre )) (PreH12 : (avl_node_pre <> 0)) ,
  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "temp" ) )) # Ptr  |-> 0)
  **  ((( &( "pred" ) )) # Ptr  |-> 0)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (avl_gvalid (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) ) ”
.

Definition AvlTreeDeleteNode_partial_solve_wit_2_pure_split_goal_2 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (PreH1 : ((avl_height_of (before_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH2 : ((avl_height_of (before_low_level_spec) (avl_node_pre)) >= 0)) (PreH3 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : (data_pre <= INT_MAX)) (PreH5 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH6 : (data_pre >= INT_MIN)) (PreH7 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) > data_pre)) (PreH8 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) >= data_pre)) (PreH9 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH10 : (avl_node_pre <> 0)) (PreH11 : (avl_vvalid before_low_level_spec avl_node_pre )) (PreH12 : (avl_node_pre <> 0)) ,
  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "temp" ) )) # Ptr  |-> 0)
  **  ((( &( "pred" ) )) # Ptr  |-> 0)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) = (avl_ptr_of ((avl_root ((avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre))))))))) ”
.

Definition AvlTreeDeleteNode_partial_solve_wit_2_aux := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (PreH1 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) > data_pre)) (PreH2 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) >= data_pre)) (PreH3 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH4 : (avl_node_pre <> 0)) (PreH5 : (avl_vvalid before_low_level_spec avl_node_pre )) (PreH6 : (avl_node_pre <> 0)) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ ((avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) = (avl_ptr_of ((avl_root ((avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre))))))))) ” 
  &&  “ (avl_gvalid (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) ) ” 
  &&  “ ((avl_key_of (before_low_level_spec) (avl_node_pre)) > data_pre) ” 
  &&  “ ((avl_key_of (before_low_level_spec) (avl_node_pre)) >= data_pre) ” 
  &&  “ (avl_delete_input before_low_level_spec avl_node_pre data_pre ) ” 
  &&  “ (avl_node_pre <> 0) ” 
  &&  “ (avl_vvalid before_low_level_spec avl_node_pre ) ” 
  &&  “ (avl_node_pre <> 0) ”
  &&  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
.

Definition AvlTreeDeleteNode_partial_solve_wit_2 := AvlTreeDeleteNode_partial_solve_wit_2_pure -> AvlTreeDeleteNode_partial_solve_wit_2_aux.

Definition AvlTreeDeleteNode_partial_solve_wit_3_pure := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (PreH1 : (0 = (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))) (PreH2 : (0 = (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) (PreH3 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) <= data_pre)) (PreH4 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) >= data_pre)) (PreH5 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH6 : (avl_node_pre <> 0)) (PreH7 : (avl_vvalid before_low_level_spec avl_node_pre )) (PreH8 : (avl_node_pre <> 0)) ,
  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "temp" ) )) # Ptr  |-> 0)
  **  ((( &( "pred" ) )) # Ptr  |-> 0)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (avl_node_pre <> 0) ”
.

Definition AvlTreeDeleteNode_partial_solve_wit_3_aux := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (PreH1 : (0 = (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))) (PreH2 : (0 = (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) (PreH3 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) <= data_pre)) (PreH4 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) >= data_pre)) (PreH5 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH6 : (avl_node_pre <> 0)) (PreH7 : (avl_vvalid before_low_level_spec avl_node_pre )) (PreH8 : (avl_node_pre <> 0)) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (avl_node_pre <> 0) ” 
  &&  “ (0 = (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre))))) ” 
  &&  “ (0 = (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre))))) ” 
  &&  “ ((avl_key_of (before_low_level_spec) (avl_node_pre)) <= data_pre) ” 
  &&  “ ((avl_key_of (before_low_level_spec) (avl_node_pre)) >= data_pre) ” 
  &&  “ (avl_delete_input before_low_level_spec avl_node_pre data_pre ) ” 
  &&  “ (avl_node_pre <> 0) ” 
  &&  “ (avl_vvalid before_low_level_spec avl_node_pre ) ” 
  &&  “ (avl_node_pre <> 0) ”
  &&  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
.

Definition AvlTreeDeleteNode_partial_solve_wit_3 := AvlTreeDeleteNode_partial_solve_wit_3_pure -> AvlTreeDeleteNode_partial_solve_wit_3_aux.

Definition AvlTreeDeleteNode_partial_solve_wit_4_pure := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (PreH1 : (0 = (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) (PreH2 : (0 <> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))) (PreH3 : (0 = (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) (PreH4 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) <= data_pre)) (PreH5 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) >= data_pre)) (PreH6 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH7 : (avl_node_pre <> 0)) (PreH8 : (avl_vvalid before_low_level_spec avl_node_pre )) (PreH9 : (avl_node_pre <> 0)) ,
  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "temp" ) )) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  ((( &( "pred" ) )) # Ptr  |-> 0)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (avl_node_pre <> 0) ”
.

Definition AvlTreeDeleteNode_partial_solve_wit_4_aux := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (PreH1 : (0 = (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) (PreH2 : (0 <> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))) (PreH3 : (0 = (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) (PreH4 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) <= data_pre)) (PreH5 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) >= data_pre)) (PreH6 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH7 : (avl_node_pre <> 0)) (PreH8 : (avl_vvalid before_low_level_spec avl_node_pre )) (PreH9 : (avl_node_pre <> 0)) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (avl_node_pre <> 0) ” 
  &&  “ (0 = (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre))))) ” 
  &&  “ (0 <> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre))))) ” 
  &&  “ (0 = (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre))))) ” 
  &&  “ ((avl_key_of (before_low_level_spec) (avl_node_pre)) <= data_pre) ” 
  &&  “ ((avl_key_of (before_low_level_spec) (avl_node_pre)) >= data_pre) ” 
  &&  “ (avl_delete_input before_low_level_spec avl_node_pre data_pre ) ” 
  &&  “ (avl_node_pre <> 0) ” 
  &&  “ (avl_vvalid before_low_level_spec avl_node_pre ) ” 
  &&  “ (avl_node_pre <> 0) ”
  &&  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
.

Definition AvlTreeDeleteNode_partial_solve_wit_4 := AvlTreeDeleteNode_partial_solve_wit_4_pure -> AvlTreeDeleteNode_partial_solve_wit_4_aux.

Definition AvlTreeDeleteNode_partial_solve_wit_5_pure := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (temp: Z) (PreH1 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH2 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) = data_pre)) (PreH3 : (temp = (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))) (PreH4 : (avl_api_delete_repair before_low_level_spec (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) data_pre temp )) (PreH5 : (avl_tree_valid (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )) (PreH6 : (temp = (avl_ptr_of ((avl_root ((avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))))))))) (PreH7 : (avl_update_height_children_safe (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) temp )) (PreH8 : (avl_balance_graph_input (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) temp )) ,
  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "temp" ) )) # Ptr  |-> temp)
  **  ((( &( "pred" ) )) # Ptr  |-> 0)
  **  (avl_tree_store (avl_with_root_cache ((avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre))))) (temp) ((avl_height_of ((avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre))))) (temp)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (avl_tree_valid (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) ) ” 
  &&  “ (temp = (avl_ptr_of ((avl_root ((avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre))))))))) ” 
  &&  “ (avl_update_height_children_safe (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) temp ) ”
.

Definition AvlTreeDeleteNode_partial_solve_wit_5_aux := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (temp: Z) (PreH1 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH2 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) = data_pre)) (PreH3 : (temp = (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))) (PreH4 : (avl_api_delete_repair before_low_level_spec (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) data_pre temp )) (PreH5 : (avl_tree_valid (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )) (PreH6 : (temp = (avl_ptr_of ((avl_root ((avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))))))))) (PreH7 : (avl_update_height_children_safe (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) temp )) (PreH8 : (avl_balance_graph_input (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) temp )) ,
  (avl_tree_store (avl_with_root_cache ((avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre))))) (temp) ((avl_height_of ((avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre))))) (temp)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (avl_tree_valid (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) ) ” 
  &&  “ (temp = (avl_ptr_of ((avl_root ((avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre))))))))) ” 
  &&  “ (avl_update_height_children_safe (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) temp ) ” 
  &&  “ (avl_delete_input before_low_level_spec avl_node_pre data_pre ) ” 
  &&  “ ((avl_key_of (before_low_level_spec) (avl_node_pre)) = data_pre) ” 
  &&  “ (temp = (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre))))) ” 
  &&  “ (avl_api_delete_repair before_low_level_spec (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) data_pre temp ) ” 
  &&  “ (avl_tree_valid (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) ) ” 
  &&  “ (temp = (avl_ptr_of ((avl_root ((avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre))))))))) ” 
  &&  “ (avl_update_height_children_safe (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) temp ) ” 
  &&  “ (avl_balance_graph_input (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) temp ) ”
  &&  (avl_tree_store (avl_with_root_cache ((avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre))))) (temp) ((avl_height_of ((avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre))))) (temp)))) )
  **  (GlobalStrings LitMap_low_level_spec )
.

Definition AvlTreeDeleteNode_partial_solve_wit_5 := AvlTreeDeleteNode_partial_solve_wit_5_pure -> AvlTreeDeleteNode_partial_solve_wit_5_aux.

Definition AvlTreeDeleteNode_partial_solve_wit_6_pure := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (temp: Z) (PreH1 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH2 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) = data_pre)) (PreH3 : (temp = (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))) (PreH4 : (avl_api_delete_repair before_low_level_spec (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) data_pre temp )) (PreH5 : (avl_tree_valid (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )) (PreH6 : (temp = (avl_ptr_of ((avl_root ((avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))))))))) (PreH7 : (avl_update_height_children_safe (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) temp )) (PreH8 : (avl_balance_graph_input (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) temp )) ,
  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "temp" ) )) # Ptr  |-> temp)
  **  ((( &( "pred" ) )) # Ptr  |-> 0)
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (avl_balance_graph_input (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) temp ) ”
.

Definition AvlTreeDeleteNode_partial_solve_wit_6_aux := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (temp: Z) (PreH1 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH2 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) = data_pre)) (PreH3 : (temp = (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))) (PreH4 : (avl_api_delete_repair before_low_level_spec (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) data_pre temp )) (PreH5 : (avl_tree_valid (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )) (PreH6 : (temp = (avl_ptr_of ((avl_root ((avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))))))))) (PreH7 : (avl_update_height_children_safe (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) temp )) (PreH8 : (avl_balance_graph_input (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) temp )) ,
  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (avl_balance_graph_input (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) temp ) ” 
  &&  “ (avl_delete_input before_low_level_spec avl_node_pre data_pre ) ” 
  &&  “ ((avl_key_of (before_low_level_spec) (avl_node_pre)) = data_pre) ” 
  &&  “ (temp = (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre))))) ” 
  &&  “ (avl_api_delete_repair before_low_level_spec (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) data_pre temp ) ” 
  &&  “ (avl_tree_valid (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) ) ” 
  &&  “ (temp = (avl_ptr_of ((avl_root ((avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre))))))))) ” 
  &&  “ (avl_update_height_children_safe (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) temp ) ” 
  &&  “ (avl_balance_graph_input (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) temp ) ”
  &&  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
.

Definition AvlTreeDeleteNode_partial_solve_wit_6 := AvlTreeDeleteNode_partial_solve_wit_6_pure -> AvlTreeDeleteNode_partial_solve_wit_6_aux.

Definition AvlTreeDeleteNode_partial_solve_wit_7_pure := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (PreH1 : (0 = (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))) (PreH2 : (0 <> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) (PreH3 : (0 <> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) (PreH4 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) <= data_pre)) (PreH5 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) >= data_pre)) (PreH6 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH7 : (avl_node_pre <> 0)) (PreH8 : (avl_vvalid before_low_level_spec avl_node_pre )) (PreH9 : (avl_node_pre <> 0)) ,
  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "temp" ) )) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((( &( "pred" ) )) # Ptr  |-> 0)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (avl_node_pre <> 0) ”
.

Definition AvlTreeDeleteNode_partial_solve_wit_7_aux := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (PreH1 : (0 = (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))) (PreH2 : (0 <> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) (PreH3 : (0 <> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) (PreH4 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) <= data_pre)) (PreH5 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) >= data_pre)) (PreH6 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH7 : (avl_node_pre <> 0)) (PreH8 : (avl_vvalid before_low_level_spec avl_node_pre )) (PreH9 : (avl_node_pre <> 0)) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (avl_node_pre <> 0) ” 
  &&  “ (0 = (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre))))) ” 
  &&  “ (0 <> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre))))) ” 
  &&  “ (0 <> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre))))) ” 
  &&  “ ((avl_key_of (before_low_level_spec) (avl_node_pre)) <= data_pre) ” 
  &&  “ ((avl_key_of (before_low_level_spec) (avl_node_pre)) >= data_pre) ” 
  &&  “ (avl_delete_input before_low_level_spec avl_node_pre data_pre ) ” 
  &&  “ (avl_node_pre <> 0) ” 
  &&  “ (avl_vvalid before_low_level_spec avl_node_pre ) ” 
  &&  “ (avl_node_pre <> 0) ”
  &&  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
.

Definition AvlTreeDeleteNode_partial_solve_wit_7 := AvlTreeDeleteNode_partial_solve_wit_7_pure -> AvlTreeDeleteNode_partial_solve_wit_7_aux.

Definition AvlTreeDeleteNode_partial_solve_wit_8_pure := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (temp: Z) (PreH1 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH2 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) = data_pre)) (PreH3 : (temp = (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) (PreH4 : (avl_api_delete_repair before_low_level_spec (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) data_pre temp )) (PreH5 : (avl_tree_valid (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )) (PreH6 : (temp = (avl_ptr_of ((avl_root ((avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))))))))) (PreH7 : (avl_update_height_children_safe (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) temp )) (PreH8 : (avl_balance_graph_input (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) temp )) ,
  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "temp" ) )) # Ptr  |-> temp)
  **  ((( &( "pred" ) )) # Ptr  |-> 0)
  **  (avl_tree_store (avl_with_root_cache ((avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre))))) (temp) ((avl_height_of ((avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre))))) (temp)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (avl_tree_valid (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) ) ” 
  &&  “ (temp = (avl_ptr_of ((avl_root ((avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre))))))))) ” 
  &&  “ (avl_update_height_children_safe (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) temp ) ”
.

Definition AvlTreeDeleteNode_partial_solve_wit_8_aux := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (temp: Z) (PreH1 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH2 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) = data_pre)) (PreH3 : (temp = (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) (PreH4 : (avl_api_delete_repair before_low_level_spec (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) data_pre temp )) (PreH5 : (avl_tree_valid (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )) (PreH6 : (temp = (avl_ptr_of ((avl_root ((avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))))))))) (PreH7 : (avl_update_height_children_safe (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) temp )) (PreH8 : (avl_balance_graph_input (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) temp )) ,
  (avl_tree_store (avl_with_root_cache ((avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre))))) (temp) ((avl_height_of ((avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre))))) (temp)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (avl_tree_valid (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) ) ” 
  &&  “ (temp = (avl_ptr_of ((avl_root ((avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre))))))))) ” 
  &&  “ (avl_update_height_children_safe (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) temp ) ” 
  &&  “ (avl_delete_input before_low_level_spec avl_node_pre data_pre ) ” 
  &&  “ ((avl_key_of (before_low_level_spec) (avl_node_pre)) = data_pre) ” 
  &&  “ (temp = (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre))))) ” 
  &&  “ (avl_api_delete_repair before_low_level_spec (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) data_pre temp ) ” 
  &&  “ (avl_tree_valid (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) ) ” 
  &&  “ (temp = (avl_ptr_of ((avl_root ((avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre))))))))) ” 
  &&  “ (avl_update_height_children_safe (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) temp ) ” 
  &&  “ (avl_balance_graph_input (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) temp ) ”
  &&  (avl_tree_store (avl_with_root_cache ((avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre))))) (temp) ((avl_height_of ((avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre))))) (temp)))) )
  **  (GlobalStrings LitMap_low_level_spec )
.

Definition AvlTreeDeleteNode_partial_solve_wit_8 := AvlTreeDeleteNode_partial_solve_wit_8_pure -> AvlTreeDeleteNode_partial_solve_wit_8_aux.

Definition AvlTreeDeleteNode_partial_solve_wit_9_pure := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (temp: Z) (PreH1 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH2 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) = data_pre)) (PreH3 : (temp = (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) (PreH4 : (avl_api_delete_repair before_low_level_spec (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) data_pre temp )) (PreH5 : (avl_tree_valid (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )) (PreH6 : (temp = (avl_ptr_of ((avl_root ((avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))))))))) (PreH7 : (avl_update_height_children_safe (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) temp )) (PreH8 : (avl_balance_graph_input (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) temp )) ,
  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "temp" ) )) # Ptr  |-> temp)
  **  ((( &( "pred" ) )) # Ptr  |-> 0)
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (avl_balance_graph_input (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) temp ) ”
.

Definition AvlTreeDeleteNode_partial_solve_wit_9_aux := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (temp: Z) (PreH1 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH2 : ((avl_key_of (before_low_level_spec) (avl_node_pre)) = data_pre)) (PreH3 : (temp = (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))) (PreH4 : (avl_api_delete_repair before_low_level_spec (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) data_pre temp )) (PreH5 : (avl_tree_valid (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )) (PreH6 : (temp = (avl_ptr_of ((avl_root ((avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))))))))) (PreH7 : (avl_update_height_children_safe (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) temp )) (PreH8 : (avl_balance_graph_input (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) temp )) ,
  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (avl_balance_graph_input (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) temp ) ” 
  &&  “ (avl_delete_input before_low_level_spec avl_node_pre data_pre ) ” 
  &&  “ ((avl_key_of (before_low_level_spec) (avl_node_pre)) = data_pre) ” 
  &&  “ (temp = (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre))))) ” 
  &&  “ (avl_api_delete_repair before_low_level_spec (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) data_pre temp ) ” 
  &&  “ (avl_tree_valid (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) ) ” 
  &&  “ (temp = (avl_ptr_of ((avl_root ((avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre))))))))) ” 
  &&  “ (avl_update_height_children_safe (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) temp ) ” 
  &&  “ (avl_balance_graph_input (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) temp ) ”
  &&  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
.

Definition AvlTreeDeleteNode_partial_solve_wit_9 := AvlTreeDeleteNode_partial_solve_wit_9_pure -> AvlTreeDeleteNode_partial_solve_wit_9_aux.

Definition AvlTreeDeleteNode_partial_solve_wit_10_pure := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (pred: Z) (PreH1 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH2 : (data_pre = (avl_key_of (before_low_level_spec) (avl_node_pre)))) (PreH3 : (avl_predecessor_result before_low_level_spec avl_node_pre pred )) (PreH4 : (pred <> 0)) (PreH5 : (avl_vvalid (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) pred )) (PreH6 : (avl_delete_input (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) (avl_key_of (before_low_level_spec) (pred)) )) (PreH7 : ((avl_key_of ((avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre))))) (pred)) = (avl_key_of (before_low_level_spec) (pred)))) ,
  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "pred" ) )) # Ptr  |-> pred)
  **  ((( &( "temp" ) )) # Ptr  |-> 0)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (pred)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  ((&((pred)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of ((avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre))))) (pred)))
  **  ((&((pred)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of ((avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre))))) (pred)))
  **  ((&((pred)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left ((avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre))))) (pred)))))
  **  ((&((pred)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right ((avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre))))) (pred)))))
  **  (avl_graph_nodes_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) (avl_nodes_without ((avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre))))) (pred)) )
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (avl_delete_input (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) (avl_key_of ((avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre))))) (pred)) ) ” 
  &&  “ (pred <> 0) ” 
  &&  “ (avl_vvalid (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) pred ) ”
.

Definition AvlTreeDeleteNode_partial_solve_wit_10_aux := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (pred: Z) (PreH1 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH2 : (data_pre = (avl_key_of (before_low_level_spec) (avl_node_pre)))) (PreH3 : (avl_predecessor_result before_low_level_spec avl_node_pre pred )) (PreH4 : (pred <> 0)) (PreH5 : (avl_vvalid (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) pred )) (PreH6 : (avl_delete_input (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) (avl_key_of (before_low_level_spec) (pred)) )) (PreH7 : ((avl_key_of ((avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre))))) (pred)) = (avl_key_of (before_low_level_spec) (pred)))) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (pred)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  ((&((pred)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of ((avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre))))) (pred)))
  **  ((&((pred)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of ((avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre))))) (pred)))
  **  ((&((pred)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left ((avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre))))) (pred)))))
  **  ((&((pred)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right ((avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre))))) (pred)))))
  **  (avl_graph_nodes_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) (avl_nodes_without ((avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre))))) (pred)) )
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (avl_delete_input (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) (avl_key_of ((avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre))))) (pred)) ) ” 
  &&  “ (pred <> 0) ” 
  &&  “ (avl_vvalid (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) pred ) ” 
  &&  “ (avl_delete_input before_low_level_spec avl_node_pre data_pre ) ” 
  &&  “ (data_pre = (avl_key_of (before_low_level_spec) (avl_node_pre))) ” 
  &&  “ (avl_predecessor_result before_low_level_spec avl_node_pre pred ) ” 
  &&  “ (pred <> 0) ” 
  &&  “ (avl_vvalid (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) pred ) ” 
  &&  “ (avl_delete_input (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))) (avl_key_of (before_low_level_spec) (pred)) ) ” 
  &&  “ ((avl_key_of ((avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre))))) (pred)) = (avl_key_of (before_low_level_spec) (pred))) ”
  &&  ((&((pred)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of ((avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre))))) (pred)))
  **  ((&((pred)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of ((avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre))))) (pred)))
  **  ((&((pred)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left ((avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre))))) (pred)))))
  **  ((&((pred)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right ((avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre))))) (pred)))))
  **  (avl_graph_nodes_store (avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre)))) (avl_nodes_without ((avl_child_model (before_low_level_spec) ((avl_left (before_low_level_spec) (avl_node_pre))))) (pred)) )
  **  (GlobalStrings LitMap_low_level_spec )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_low_level_spec) (pred)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_low_level_spec) (avl_node_pre)))))
  **  (avl_tree_store (avl_child_model (before_low_level_spec) ((avl_right (before_low_level_spec) (avl_node_pre)))) )
.

Definition AvlTreeDeleteNode_partial_solve_wit_10 := AvlTreeDeleteNode_partial_solve_wit_10_pure -> AvlTreeDeleteNode_partial_solve_wit_10_aux.

Definition AvlTreeDeleteNode_partial_solve_wit_11_pure := 
(
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (raw: avl_model) (old_cache: Z) (saved_temp: Z) (saved_pred: Z) (PreH1 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH2 : (avl_api_delete_repair before_low_level_spec raw data_pre avl_node_pre )) (PreH3 : (avl_tree_valid raw )) (PreH4 : (avl_update_height_children_safe raw avl_node_pre )) (PreH5 : (avl_balance_graph_input raw avl_node_pre )) ,
  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "temp" ) )) # Ptr  |-> saved_temp)
  **  ((( &( "pred" ) )) # Ptr  |-> saved_pred)
  **  (avl_tree_store (avl_with_root_cache (raw) (avl_node_pre) (old_cache)) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (avl_tree_valid raw ) ” 
  &&  “ (avl_update_height_children_safe raw avl_node_pre ) ” 
  &&  “ (avl_node_pre = (avl_ptr_of ((avl_root (raw))))) ”
) \/
(
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (raw: avl_model) (old_cache: Z) (saved_temp: Z) (saved_pred: Z) (PreH1 : (data_pre <= INT_MAX)) (PreH2 : (data_pre >= INT_MIN)) (PreH3 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH4 : (avl_api_delete_repair before_low_level_spec raw data_pre avl_node_pre )) (PreH5 : (avl_tree_valid raw )) (PreH6 : (avl_update_height_children_safe raw avl_node_pre )) (PreH7 : (avl_balance_graph_input raw avl_node_pre )) ,
  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "temp" ) )) # Ptr  |-> saved_temp)
  **  ((( &( "pred" ) )) # Ptr  |-> saved_pred)
  **  (avl_tree_store (avl_with_root_cache (raw) (avl_node_pre) (old_cache)) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (avl_node_pre = (avl_ptr_of ((avl_root (raw))))) ”
).

Definition AvlTreeDeleteNode_partial_solve_wit_11_pure_split_goal_1 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (raw: avl_model) (old_cache: Z) (saved_temp: Z) (saved_pred: Z) (PreH1 : (data_pre <= INT_MAX)) (PreH2 : (data_pre >= INT_MIN)) (PreH3 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH4 : (avl_api_delete_repair before_low_level_spec raw data_pre avl_node_pre )) (PreH5 : (avl_tree_valid raw )) (PreH6 : (avl_update_height_children_safe raw avl_node_pre )) (PreH7 : (avl_balance_graph_input raw avl_node_pre )) ,
  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "temp" ) )) # Ptr  |-> saved_temp)
  **  ((( &( "pred" ) )) # Ptr  |-> saved_pred)
  **  (avl_tree_store (avl_with_root_cache (raw) (avl_node_pre) (old_cache)) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (avl_node_pre = (avl_ptr_of ((avl_root (raw))))) ”
.

Definition AvlTreeDeleteNode_partial_solve_wit_11_aux := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (raw: avl_model) (old_cache: Z) (PreH1 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH2 : (avl_api_delete_repair before_low_level_spec raw data_pre avl_node_pre )) (PreH3 : (avl_tree_valid raw )) (PreH4 : (avl_update_height_children_safe raw avl_node_pre )) (PreH5 : (avl_balance_graph_input raw avl_node_pre )) ,
  (avl_tree_store (avl_with_root_cache (raw) (avl_node_pre) (old_cache)) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (avl_tree_valid raw ) ” 
  &&  “ (avl_update_height_children_safe raw avl_node_pre ) ” 
  &&  “ (avl_node_pre = (avl_ptr_of ((avl_root (raw))))) ” 
  &&  “ (avl_delete_input before_low_level_spec avl_node_pre data_pre ) ” 
  &&  “ (avl_api_delete_repair before_low_level_spec raw data_pre avl_node_pre ) ” 
  &&  “ (avl_tree_valid raw ) ” 
  &&  “ (avl_update_height_children_safe raw avl_node_pre ) ” 
  &&  “ (avl_balance_graph_input raw avl_node_pre ) ”
  &&  (avl_tree_store (avl_with_root_cache (raw) (avl_node_pre) (old_cache)) )
  **  (GlobalStrings LitMap_low_level_spec )
.

Definition AvlTreeDeleteNode_partial_solve_wit_11 := AvlTreeDeleteNode_partial_solve_wit_11_pure -> AvlTreeDeleteNode_partial_solve_wit_11_aux.

Definition AvlTreeDeleteNode_partial_solve_wit_12_pure := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (raw: avl_model) (saved_temp: Z) (saved_pred: Z) (PreH1 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH2 : (avl_api_delete_repair before_low_level_spec raw data_pre avl_node_pre )) (PreH3 : (avl_tree_valid raw )) (PreH4 : (avl_update_height_children_safe raw avl_node_pre )) (PreH5 : (avl_balance_graph_input raw avl_node_pre )) ,
  (avl_tree_store raw )
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "temp" ) )) # Ptr  |-> saved_temp)
  **  ((( &( "pred" ) )) # Ptr  |-> saved_pred)
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (avl_balance_graph_input raw avl_node_pre ) ”
.

Definition AvlTreeDeleteNode_partial_solve_wit_12_aux := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (raw: avl_model) (PreH1 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH2 : (avl_api_delete_repair before_low_level_spec raw data_pre avl_node_pre )) (PreH3 : (avl_tree_valid raw )) (PreH4 : (avl_update_height_children_safe raw avl_node_pre )) (PreH5 : (avl_balance_graph_input raw avl_node_pre )) ,
  (avl_tree_store raw )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (avl_balance_graph_input raw avl_node_pre ) ” 
  &&  “ (avl_delete_input before_low_level_spec avl_node_pre data_pre ) ” 
  &&  “ (avl_api_delete_repair before_low_level_spec raw data_pre avl_node_pre ) ” 
  &&  “ (avl_tree_valid raw ) ” 
  &&  “ (avl_update_height_children_safe raw avl_node_pre ) ” 
  &&  “ (avl_balance_graph_input raw avl_node_pre ) ”
  &&  (avl_tree_store raw )
  **  (GlobalStrings LitMap_low_level_spec )
.

Definition AvlTreeDeleteNode_partial_solve_wit_12 := AvlTreeDeleteNode_partial_solve_wit_12_pure -> AvlTreeDeleteNode_partial_solve_wit_12_aux.

Definition AvlTreeDeleteNode_partial_solve_wit_13_pure := 
(
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (PreH1 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH2 : (avl_node_pre = 0)) (PreH3 : (avl_node_pre = 0)) ,
  (store_stringLit (LitMap_low_level_spec (("AvlTreeDeleteNode cannot find the delete data
"%string))) ("AvlTreeDeleteNode cannot find the delete data
"%string) )
  **  (GlobalStrings_missing LitMap_low_level_spec (cons (("AvlTreeDeleteNode cannot find the delete data
"%string)) ((@nil string))) )
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "temp" ) )) # Ptr  |-> 0)
  **  ((( &( "pred" ) )) # Ptr  |-> 0)
  **  (avl_tree_store before_low_level_spec )
|--
  “ (((LitMap_low_level_spec (("AvlTreeDeleteNode cannot find the delete data
"%string))) + (0 * sizeof(CHAR))) = (LitMap_low_level_spec (("AvlTreeDeleteNode cannot find the delete data
"%string)))) ”
) \/
(
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (PreH1 : (data_pre <= INT_MAX)) (PreH2 : (data_pre >= INT_MIN)) (PreH3 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH4 : (avl_node_pre = 0)) (PreH5 : (avl_node_pre = 0)) ,
  (GlobalStrings LitMap_low_level_spec )
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "temp" ) )) # Ptr  |-> 0)
  **  ((( &( "pred" ) )) # Ptr  |-> 0)
  **  (avl_tree_store before_low_level_spec )
|--
  “ (((LitMap_low_level_spec (("AvlTreeDeleteNode cannot find the delete data
"%string))) + (0 * sizeof(CHAR))) = (LitMap_low_level_spec (("AvlTreeDeleteNode cannot find the delete data
"%string)))) ”
).

Definition AvlTreeDeleteNode_partial_solve_wit_13_pure_split_goal_1 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (PreH1 : (data_pre <= INT_MAX)) (PreH2 : (data_pre >= INT_MIN)) (PreH3 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH4 : (avl_node_pre = 0)) (PreH5 : (avl_node_pre = 0)) ,
  (GlobalStrings LitMap_low_level_spec )
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "temp" ) )) # Ptr  |-> 0)
  **  ((( &( "pred" ) )) # Ptr  |-> 0)
  **  (avl_tree_store before_low_level_spec )
|--
  “ (((LitMap_low_level_spec (("AvlTreeDeleteNode cannot find the delete data
"%string))) + (0 * sizeof(CHAR))) = (LitMap_low_level_spec (("AvlTreeDeleteNode cannot find the delete data
"%string)))) ”
.

Definition AvlTreeDeleteNode_partial_solve_wit_13_aux := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (PreH1 : (avl_delete_input before_low_level_spec avl_node_pre data_pre )) (PreH2 : (avl_node_pre = 0)) (PreH3 : (avl_node_pre = 0)) ,
  (store_stringLit (LitMap_low_level_spec (("AvlTreeDeleteNode cannot find the delete data
"%string))) ("AvlTreeDeleteNode cannot find the delete data
"%string) )
  **  (GlobalStrings_missing LitMap_low_level_spec (cons (("AvlTreeDeleteNode cannot find the delete data
"%string)) ((@nil string))) )
  **  (avl_tree_store before_low_level_spec )
|--
  “ (((LitMap_low_level_spec (("AvlTreeDeleteNode cannot find the delete data
"%string))) + (0 * sizeof(CHAR))) = (LitMap_low_level_spec (("AvlTreeDeleteNode cannot find the delete data
"%string)))) ” 
  &&  “ (avl_delete_input before_low_level_spec avl_node_pre data_pre ) ” 
  &&  “ (avl_node_pre = 0) ” 
  &&  “ (avl_node_pre = 0) ”
  &&  (store_stringLit (LitMap_low_level_spec (("AvlTreeDeleteNode cannot find the delete data
"%string))) ("AvlTreeDeleteNode cannot find the delete data
"%string) )
  **  (GlobalStrings_missing LitMap_low_level_spec (cons (("AvlTreeDeleteNode cannot find the delete data
"%string)) ((@nil string))) )
  **  (avl_tree_store before_low_level_spec )
.

Definition AvlTreeDeleteNode_partial_solve_wit_13 := AvlTreeDeleteNode_partial_solve_wit_13_pure -> AvlTreeDeleteNode_partial_solve_wit_13_aux.

(*----- Function AvlNodeModifyNode -----*)

Definition AvlNodeModifyNode_safety_wit_1 := 
forall (dst_data_pre: Z) (src_data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (PreH1 : (avl_gvalid before_low_level_spec )) (PreH2 : (avl_node_pre = (avl_ptr_of ((avl_root (before_low_level_spec)))))) ,
  ((( &( "dst_node" ) )) # Ptr  |->_)
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "src_data" ) )) # Int  |-> src_data_pre)
  **  ((( &( "dst_data" ) )) # Int  |-> dst_data_pre)
  **  (avl_tree_store before_low_level_spec )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition AvlNodeModifyNode_safety_wit_2 := 
forall (dst_data_pre: Z) (src_data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (PreH1 : (avl_gvalid before_low_level_spec )) (PreH2 : (avl_node_pre = (avl_ptr_of ((avl_root (before_low_level_spec)))))) (PreH3 : (avl_node_pre = 0)) ,
  (store_stringLit (LitMap_low_level_spec (("AvlNodeModifyNode cannot find the src data node
"%string))) ("AvlNodeModifyNode cannot find the src data node
"%string) )
  **  (GlobalStrings_missing LitMap_low_level_spec (cons (("AvlNodeModifyNode cannot find the src data node
"%string)) ((@nil string))) )
  **  ((( &( "dst_node" ) )) # Ptr  |-> 0)
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "src_data" ) )) # Int  |-> src_data_pre)
  **  ((( &( "dst_data" ) )) # Int  |-> dst_data_pre)
  **  (avl_tree_store before_low_level_spec )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition AvlNodeModifyNode_safety_wit_3 := 
forall (dst_data_pre: Z) (src_data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (PreH1 : (avl_gvalid before_low_level_spec )) (PreH2 : (avl_node_pre = (avl_ptr_of ((avl_root (before_low_level_spec)))))) (PreH3 : (avl_node_pre = 0)) ,
  (store_stringLit (LitMap_low_level_spec (("AvlNodeModifyNode cannot find the src data node
"%string))) ("AvlNodeModifyNode cannot find the src data node
"%string) )
  **  (GlobalStrings_missing LitMap_low_level_spec (cons (("AvlNodeModifyNode cannot find the src data node
"%string)) ((@nil string))) )
  **  ((( &( "dst_node" ) )) # Ptr  |-> 0)
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "src_data" ) )) # Int  |-> src_data_pre)
  **  ((( &( "dst_data" ) )) # Int  |-> dst_data_pre)
  **  (avl_tree_store before_low_level_spec )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition AvlNodeModifyNode_entail_wit_1 := 
forall (dst_data_pre: Z) (src_data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (PreH1 : (avl_gvalid before_low_level_spec )) (PreH2 : (avl_node_pre = (avl_ptr_of ((avl_root (before_low_level_spec)))))) (PreH3 : (avl_node_pre <> 0)) ,
  ((( &( "dst_node" ) )) # Ptr  |-> 0)
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "src_data" ) )) # Int  |-> src_data_pre)
  **  ((( &( "dst_data" ) )) # Int  |-> dst_data_pre)
  **  (avl_tree_store before_low_level_spec )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (INT_MIN <= dst_data_pre) ” 
  &&  “ (dst_data_pre <= INT_MAX) ” 
  &&  “ (src_data_pre <= INT_MAX) ” 
  &&  “ (src_data_pre >= INT_MIN) ” 
  &&  “ (avl_gvalid before_low_level_spec ) ” 
  &&  “ (avl_node_pre = (avl_ptr_of ((avl_root (before_low_level_spec))))) ” 
  &&  “ (avl_node_pre <> 0) ”
  &&  ((( &( "dst_data" ) )) # Int  |-> dst_data_pre)
  **  ((( &( "dst_node" ) )) # Ptr  |-> 0)
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "src_data" ) )) # Int  |-> src_data_pre)
  **  (avl_tree_store before_low_level_spec )
  **  (GlobalStrings LitMap_low_level_spec )
.

Definition AvlNodeModifyNode_entail_wit_2 := 
(
forall (dst_data_pre: Z) (src_data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (after: avl_model) (retval: Z) (PreH1 : (avl_delete_outcome before_low_level_spec after src_data_pre retval )) (PreH2 : (avl_api_delete_identity before_low_level_spec after src_data_pre )) (PreH3 : (INT_MIN <= dst_data_pre)) (PreH4 : (dst_data_pre <= INT_MAX)) (PreH5 : (src_data_pre <= INT_MAX)) (PreH6 : (src_data_pre >= INT_MIN)) (PreH7 : (avl_gvalid before_low_level_spec )) (PreH8 : (avl_node_pre = (avl_ptr_of ((avl_root (before_low_level_spec)))))) (PreH9 : (avl_node_pre <> 0)) ,
  (avl_tree_store after )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  EX (middle: avl_model) ,
  “ (avl_node_pre <> 0) ” 
  &&  “ (avl_delete_outcome before_low_level_spec middle src_data_pre retval ) ” 
  &&  “ (avl_insert_input middle retval dst_data_pre ) ”
  &&  (avl_subtree_store_at middle retval )
  **  (GlobalStrings LitMap_low_level_spec )
) \/
(
forall (dst_data_pre: Z) (src_data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (after: avl_model) (retval: Z) (PreH1 : (avl_delete_outcome before_low_level_spec after src_data_pre retval )) (PreH2 : (avl_api_delete_identity before_low_level_spec after src_data_pre )) (PreH3 : (INT_MIN <= dst_data_pre)) (PreH4 : (dst_data_pre <= INT_MAX)) (PreH5 : (src_data_pre <= INT_MAX)) (PreH6 : (src_data_pre >= INT_MIN)) (PreH7 : (avl_gvalid before_low_level_spec )) (PreH8 : (avl_node_pre = (avl_ptr_of ((avl_root (before_low_level_spec)))))) (PreH9 : (avl_node_pre <> 0)) ,
  (avl_tree_store after )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  EX (middle: avl_model) ,
  “ (avl_node_pre <> 0) ” 
  &&  “ (avl_delete_outcome before_low_level_spec middle src_data_pre retval ) ” 
  &&  “ (avl_insert_input middle retval dst_data_pre ) ”
  &&  (avl_subtree_store_at middle retval )
  **  (GlobalStrings LitMap_low_level_spec )
).

Definition AvlNodeModifyNode_return_wit_1 := 
(
forall (dst_data_pre: Z) (src_data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (avl_node: Z) (middle_2: avl_model) (after_2: avl_model) (retval: Z) (PreH1 : (strict_insert_outcome middle_2 after_2 dst_data_pre retval )) (PreH2 : (avl_node_pre <> 0)) (PreH3 : (avl_delete_outcome before_low_level_spec middle_2 src_data_pre avl_node )) (PreH4 : (avl_insert_input middle_2 avl_node dst_data_pre )) ,
  (avl_tree_store after_2 )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  EX (after: avl_model)  (middle: avl_model) ,
  “ (avl_node_pre <> 0) ” 
  &&  “ (avl_delete_outcome before_low_level_spec middle src_data_pre (avl_ptr_of ((avl_root (middle)))) ) ” 
  &&  “ (strict_insert_outcome middle after dst_data_pre retval ) ”
  &&  (avl_tree_store after )
  **  (GlobalStrings LitMap_low_level_spec )
) \/
(
forall (dst_data_pre: Z) (src_data_pre: Z) (avl_node_pre: Z) (before_low_level_spec: avl_model) (avl_node: Z) (middle_2: avl_model) (after_2: avl_model) (retval: Z) (PreH1 : (strict_insert_outcome middle_2 after_2 dst_data_pre retval )) (PreH2 : (avl_node_pre <> 0)) (PreH3 : (avl_delete_outcome before_low_level_spec middle_2 src_data_pre avl_node )) (PreH4 : (avl_insert_input middle_2 avl_node dst_data_pre )) ,
  TT && emp 
|--
  EX (middle: avl_model) ,
  “ (avl_delete_outcome before_low_level_spec middle src_data_pre (avl_ptr_of ((avl_root (middle)))) ) ” 
  &&  “ (strict_insert_outcome middle after_2 dst_data_pre retval ) ”
  &&  emp
).

Definition AvlNodeModifyNode_return_wit_2 := 
forall (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (PreH1 : (avl_gvalid before_low_level_spec )) (PreH2 : (avl_node_pre = (avl_ptr_of ((avl_root (before_low_level_spec)))))) (PreH3 : (avl_node_pre = 0)) ,
  (store_stringLit (LitMap_low_level_spec (("AvlNodeModifyNode cannot find the src data node
"%string))) ("AvlNodeModifyNode cannot find the src data node
"%string) )
  **  (GlobalStrings_missing LitMap_low_level_spec (cons (("AvlNodeModifyNode cannot find the src data node
"%string)) ((@nil string))) )
  **  (avl_tree_store before_low_level_spec )
|--
  “ (avl_node_pre = 0) ” 
  &&  “ (0 = 0) ”
  &&  (avl_tree_store before_low_level_spec )
  **  (GlobalStrings LitMap_low_level_spec )
.

Definition AvlNodeModifyNode_partial_solve_wit_1_pure := 
forall (dst_data_pre: Z) (src_data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (PreH1 : (INT_MIN <= dst_data_pre)) (PreH2 : (dst_data_pre <= INT_MAX)) (PreH3 : (src_data_pre <= INT_MAX)) (PreH4 : (src_data_pre >= INT_MIN)) (PreH5 : (avl_gvalid before_low_level_spec )) (PreH6 : (avl_node_pre = (avl_ptr_of ((avl_root (before_low_level_spec)))))) (PreH7 : (avl_node_pre <> 0)) ,
  ((( &( "dst_data" ) )) # Int  |-> dst_data_pre)
  **  ((( &( "dst_node" ) )) # Ptr  |-> 0)
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "src_data" ) )) # Int  |-> src_data_pre)
  **  (avl_tree_store before_low_level_spec )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (avl_gvalid before_low_level_spec ) ” 
  &&  “ (avl_node_pre = (avl_ptr_of ((avl_root (before_low_level_spec))))) ”
.

Definition AvlNodeModifyNode_partial_solve_wit_1_aux := 
forall (dst_data_pre: Z) (src_data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (PreH1 : (INT_MIN <= dst_data_pre)) (PreH2 : (dst_data_pre <= INT_MAX)) (PreH3 : (src_data_pre <= INT_MAX)) (PreH4 : (src_data_pre >= INT_MIN)) (PreH5 : (avl_gvalid before_low_level_spec )) (PreH6 : (avl_node_pre = (avl_ptr_of ((avl_root (before_low_level_spec)))))) (PreH7 : (avl_node_pre <> 0)) ,
  (avl_tree_store before_low_level_spec )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (avl_gvalid before_low_level_spec ) ” 
  &&  “ (avl_node_pre = (avl_ptr_of ((avl_root (before_low_level_spec))))) ” 
  &&  “ (INT_MIN <= dst_data_pre) ” 
  &&  “ (dst_data_pre <= INT_MAX) ” 
  &&  “ (src_data_pre <= INT_MAX) ” 
  &&  “ (src_data_pre >= INT_MIN) ” 
  &&  “ (avl_gvalid before_low_level_spec ) ” 
  &&  “ (avl_node_pre = (avl_ptr_of ((avl_root (before_low_level_spec))))) ” 
  &&  “ (avl_node_pre <> 0) ”
  &&  (avl_tree_store before_low_level_spec )
  **  (GlobalStrings LitMap_low_level_spec )
.

Definition AvlNodeModifyNode_partial_solve_wit_1 := AvlNodeModifyNode_partial_solve_wit_1_pure -> AvlNodeModifyNode_partial_solve_wit_1_aux.

Definition AvlNodeModifyNode_partial_solve_wit_2_pure := 
forall (dst_data_pre: Z) (src_data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (avl_node: Z) (middle: avl_model) (PreH1 : (avl_node_pre <> 0)) (PreH2 : (avl_delete_outcome before_low_level_spec middle src_data_pre avl_node )) (PreH3 : (avl_insert_input middle avl_node dst_data_pre )) ,
  ((( &( "src_data" ) )) # Int  |-> src_data_pre)
  **  ((( &( "dst_data" ) )) # Int  |-> dst_data_pre)
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node)
  **  ((( &( "dst_node" ) )) # Ptr  |-> 0)
  **  (avl_subtree_store_at middle avl_node )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (avl_insert_input middle avl_node dst_data_pre ) ”
.

Definition AvlNodeModifyNode_partial_solve_wit_2_aux := 
forall (dst_data_pre: Z) (src_data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (avl_node: Z) (middle: avl_model) (PreH1 : (avl_node_pre <> 0)) (PreH2 : (avl_delete_outcome before_low_level_spec middle src_data_pre avl_node )) (PreH3 : (avl_insert_input middle avl_node dst_data_pre )) ,
  (avl_subtree_store_at middle avl_node )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (avl_insert_input middle avl_node dst_data_pre ) ” 
  &&  “ (avl_node_pre <> 0) ” 
  &&  “ (avl_delete_outcome before_low_level_spec middle src_data_pre avl_node ) ” 
  &&  “ (avl_insert_input middle avl_node dst_data_pre ) ”
  &&  (avl_subtree_store_at middle avl_node )
  **  (GlobalStrings LitMap_low_level_spec )
.

Definition AvlNodeModifyNode_partial_solve_wit_2 := AvlNodeModifyNode_partial_solve_wit_2_pure -> AvlNodeModifyNode_partial_solve_wit_2_aux.

Definition AvlNodeModifyNode_partial_solve_wit_3_pure := 
(
forall (dst_data_pre: Z) (src_data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (PreH1 : (avl_gvalid before_low_level_spec )) (PreH2 : (avl_node_pre = (avl_ptr_of ((avl_root (before_low_level_spec)))))) (PreH3 : (avl_node_pre = 0)) ,
  (store_stringLit (LitMap_low_level_spec (("AvlNodeModifyNode cannot find the src data node
"%string))) ("AvlNodeModifyNode cannot find the src data node
"%string) )
  **  (GlobalStrings_missing LitMap_low_level_spec (cons (("AvlNodeModifyNode cannot find the src data node
"%string)) ((@nil string))) )
  **  ((( &( "dst_node" ) )) # Ptr  |-> 0)
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "src_data" ) )) # Int  |-> src_data_pre)
  **  ((( &( "dst_data" ) )) # Int  |-> dst_data_pre)
  **  (avl_tree_store before_low_level_spec )
|--
  “ (((LitMap_low_level_spec (("AvlNodeModifyNode cannot find the src data node
"%string))) + (0 * sizeof(CHAR))) = (LitMap_low_level_spec (("AvlNodeModifyNode cannot find the src data node
"%string)))) ”
) \/
(
forall (dst_data_pre: Z) (src_data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (PreH1 : (dst_data_pre <= INT_MAX)) (PreH2 : (src_data_pre <= INT_MAX)) (PreH3 : (dst_data_pre >= INT_MIN)) (PreH4 : (src_data_pre >= INT_MIN)) (PreH5 : (avl_gvalid before_low_level_spec )) (PreH6 : (avl_node_pre = (avl_ptr_of ((avl_root (before_low_level_spec)))))) (PreH7 : (avl_node_pre = 0)) ,
  (GlobalStrings LitMap_low_level_spec )
  **  ((( &( "dst_node" ) )) # Ptr  |-> 0)
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "src_data" ) )) # Int  |-> src_data_pre)
  **  ((( &( "dst_data" ) )) # Int  |-> dst_data_pre)
  **  (avl_tree_store before_low_level_spec )
|--
  “ (((LitMap_low_level_spec (("AvlNodeModifyNode cannot find the src data node
"%string))) + (0 * sizeof(CHAR))) = (LitMap_low_level_spec (("AvlNodeModifyNode cannot find the src data node
"%string)))) ”
).

Definition AvlNodeModifyNode_partial_solve_wit_3_pure_split_goal_1 := 
forall (dst_data_pre: Z) (src_data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (PreH1 : (dst_data_pre <= INT_MAX)) (PreH2 : (src_data_pre <= INT_MAX)) (PreH3 : (dst_data_pre >= INT_MIN)) (PreH4 : (src_data_pre >= INT_MIN)) (PreH5 : (avl_gvalid before_low_level_spec )) (PreH6 : (avl_node_pre = (avl_ptr_of ((avl_root (before_low_level_spec)))))) (PreH7 : (avl_node_pre = 0)) ,
  (GlobalStrings LitMap_low_level_spec )
  **  ((( &( "dst_node" ) )) # Ptr  |-> 0)
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "src_data" ) )) # Int  |-> src_data_pre)
  **  ((( &( "dst_data" ) )) # Int  |-> dst_data_pre)
  **  (avl_tree_store before_low_level_spec )
|--
  “ (((LitMap_low_level_spec (("AvlNodeModifyNode cannot find the src data node
"%string))) + (0 * sizeof(CHAR))) = (LitMap_low_level_spec (("AvlNodeModifyNode cannot find the src data node
"%string)))) ”
.

Definition AvlNodeModifyNode_partial_solve_wit_3_aux := 
forall (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (before_low_level_spec: avl_model) (PreH1 : (avl_gvalid before_low_level_spec )) (PreH2 : (avl_node_pre = (avl_ptr_of ((avl_root (before_low_level_spec)))))) (PreH3 : (avl_node_pre = 0)) ,
  (store_stringLit (LitMap_low_level_spec (("AvlNodeModifyNode cannot find the src data node
"%string))) ("AvlNodeModifyNode cannot find the src data node
"%string) )
  **  (GlobalStrings_missing LitMap_low_level_spec (cons (("AvlNodeModifyNode cannot find the src data node
"%string)) ((@nil string))) )
  **  (avl_tree_store before_low_level_spec )
|--
  “ (((LitMap_low_level_spec (("AvlNodeModifyNode cannot find the src data node
"%string))) + (0 * sizeof(CHAR))) = (LitMap_low_level_spec (("AvlNodeModifyNode cannot find the src data node
"%string)))) ” 
  &&  “ (avl_gvalid before_low_level_spec ) ” 
  &&  “ (avl_node_pre = (avl_ptr_of ((avl_root (before_low_level_spec))))) ” 
  &&  “ (avl_node_pre = 0) ”
  &&  (store_stringLit (LitMap_low_level_spec (("AvlNodeModifyNode cannot find the src data node
"%string))) ("AvlNodeModifyNode cannot find the src data node
"%string) )
  **  (GlobalStrings_missing LitMap_low_level_spec (cons (("AvlNodeModifyNode cannot find the src data node
"%string)) ((@nil string))) )
  **  (avl_tree_store before_low_level_spec )
.

Definition AvlNodeModifyNode_partial_solve_wit_3 := AvlNodeModifyNode_partial_solve_wit_3_pure -> AvlNodeModifyNode_partial_solve_wit_3_aux.

(*----- Function AvlNodeSearchNode -----*)

Definition AvlNodeSearchNode_safety_wit_1 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (g_low_level_spec: avl_model) (PreH1 : (avl_tree_valid g_low_level_spec )) (PreH2 : (avl_search_cursor_valid g_low_level_spec avl_node_pre data_pre )) ,
  ((( &( "dst_node" ) )) # Ptr  |->_)
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  (avl_subtree_store_at g_low_level_spec avl_node_pre )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition AvlNodeSearchNode_safety_wit_2 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (g_low_level_spec: avl_model) (PreH1 : (data_pre = (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH2 : (INT_MIN <= data_pre)) (PreH3 : (data_pre <= INT_MAX)) (PreH4 : (avl_tree_valid g_low_level_spec )) (PreH5 : (avl_vvalid g_low_level_spec avl_node_pre )) (PreH6 : (avl_node_pre <> 0)) (PreH7 : (INT_MIN <= (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH8 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH9 : (0 <= (avl_height_of (g_low_level_spec) (avl_node_pre)))) (PreH10 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH11 : (avl_search_cursor_valid g_low_level_spec avl_node_pre data_pre )) ,
  (store_stringLit (LitMap_low_level_spec (("AvlNodeSearchNode %d is existed return the node
"%string))) ("AvlNodeSearchNode %d is existed return the node
"%string) )
  **  (GlobalStrings_missing LitMap_low_level_spec (cons (("AvlNodeSearchNode %d is existed return the node
"%string)) ((@nil string))) )
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "dst_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition AvlNodeSearchNode_safety_wit_3 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (g_low_level_spec: avl_model) (PreH1 : (INT_MIN <= data_pre)) (PreH2 : (data_pre <= INT_MAX)) (PreH3 : (avl_tree_valid g_low_level_spec )) (PreH4 : (avl_search_cursor_valid g_low_level_spec avl_node_pre data_pre )) (PreH5 : (avl_node_pre = 0)) ,
  (store_stringLit (LitMap_low_level_spec (("AvlNodeSearchNode avl_node is NONE.
"%string))) ("AvlNodeSearchNode avl_node is NONE.
"%string) )
  **  (GlobalStrings_missing LitMap_low_level_spec (cons (("AvlNodeSearchNode avl_node is NONE.
"%string)) ((@nil string))) )
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "dst_node" ) )) # Ptr  |-> 0)
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  (avl_subtree_store_at g_low_level_spec avl_node_pre )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition AvlNodeSearchNode_safety_wit_4 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (g_low_level_spec: avl_model) (PreH1 : (INT_MIN <= data_pre)) (PreH2 : (data_pre <= INT_MAX)) (PreH3 : (avl_tree_valid g_low_level_spec )) (PreH4 : (avl_search_cursor_valid g_low_level_spec avl_node_pre data_pre )) (PreH5 : (avl_node_pre = 0)) ,
  (store_stringLit (LitMap_low_level_spec (("AvlNodeSearchNode avl_node is NONE.
"%string))) ("AvlNodeSearchNode avl_node is NONE.
"%string) )
  **  (GlobalStrings_missing LitMap_low_level_spec (cons (("AvlNodeSearchNode avl_node is NONE.
"%string)) ((@nil string))) )
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "dst_node" ) )) # Ptr  |-> 0)
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  (avl_subtree_store_at g_low_level_spec avl_node_pre )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition AvlNodeSearchNode_entail_wit_1 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (g_low_level_spec: avl_model) (PreH1 : (avl_tree_valid g_low_level_spec )) (PreH2 : (avl_search_cursor_valid g_low_level_spec avl_node_pre data_pre )) ,
  ((( &( "dst_node" ) )) # Ptr  |-> 0)
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  (avl_subtree_store_at g_low_level_spec avl_node_pre )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (INT_MIN <= data_pre) ” 
  &&  “ (data_pre <= INT_MAX) ” 
  &&  “ (avl_tree_valid g_low_level_spec ) ” 
  &&  “ (avl_search_cursor_valid g_low_level_spec avl_node_pre data_pre ) ”
  &&  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "dst_node" ) )) # Ptr  |-> 0)
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  (avl_subtree_store_at g_low_level_spec avl_node_pre )
  **  (GlobalStrings LitMap_low_level_spec )
.

Definition AvlNodeSearchNode_entail_wit_2 := 
(
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (g_low_level_spec: avl_model) (PreH1 : (INT_MIN <= data_pre)) (PreH2 : (data_pre <= INT_MAX)) (PreH3 : (avl_tree_valid g_low_level_spec )) (PreH4 : (avl_search_cursor_valid g_low_level_spec avl_node_pre data_pre )) (PreH5 : (avl_node_pre <> 0)) ,
  (avl_subtree_store_at g_low_level_spec avl_node_pre )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (INT_MIN <= data_pre) ” 
  &&  “ (data_pre <= INT_MAX) ” 
  &&  “ (avl_tree_valid g_low_level_spec ) ” 
  &&  “ (avl_vvalid g_low_level_spec avl_node_pre ) ” 
  &&  “ (avl_node_pre <> 0) ” 
  &&  “ (INT_MIN <= (avl_key_of (g_low_level_spec) (avl_node_pre))) ” 
  &&  “ ((avl_key_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX) ” 
  &&  “ (0 <= (avl_height_of (g_low_level_spec) (avl_node_pre))) ” 
  &&  “ ((avl_height_of (g_low_level_spec) (avl_node_pre)) <= UINT_MAX) ” 
  &&  “ (avl_search_cursor_valid g_low_level_spec avl_node_pre data_pre ) ”
  &&  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
) \/
(
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (g_low_level_spec: avl_model) (PreH1 : (INT_MIN <= data_pre)) (PreH2 : (data_pre <= INT_MAX)) (PreH3 : (avl_tree_valid g_low_level_spec )) (PreH4 : (avl_search_cursor_valid g_low_level_spec avl_node_pre data_pre )) (PreH5 : (avl_node_pre <> 0)) ,
  (avl_subtree_store_at g_low_level_spec avl_node_pre )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ ((avl_height_of (g_low_level_spec) (avl_node_pre)) <= UINT_MAX) ” 
  &&  “ (0 <= (avl_height_of (g_low_level_spec) (avl_node_pre))) ” 
  &&  “ ((avl_key_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX) ” 
  &&  “ (INT_MIN <= (avl_key_of (g_low_level_spec) (avl_node_pre))) ” 
  &&  “ (avl_vvalid g_low_level_spec avl_node_pre ) ”
  &&  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
).

Definition AvlNodeSearchNode_entail_wit_2_split_goal_1 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (g_low_level_spec: avl_model) (PreH1 : (INT_MIN <= data_pre)) (PreH2 : (data_pre <= INT_MAX)) (PreH3 : (avl_tree_valid g_low_level_spec )) (PreH4 : (avl_search_cursor_valid g_low_level_spec avl_node_pre data_pre )) (PreH5 : (avl_node_pre <> 0)) ,
  (avl_subtree_store_at g_low_level_spec avl_node_pre )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ ((avl_height_of (g_low_level_spec) (avl_node_pre)) <= UINT_MAX) ”
.

Definition AvlNodeSearchNode_entail_wit_2_split_goal_2 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (g_low_level_spec: avl_model) (PreH1 : (INT_MIN <= data_pre)) (PreH2 : (data_pre <= INT_MAX)) (PreH3 : (avl_tree_valid g_low_level_spec )) (PreH4 : (avl_search_cursor_valid g_low_level_spec avl_node_pre data_pre )) (PreH5 : (avl_node_pre <> 0)) ,
  (avl_subtree_store_at g_low_level_spec avl_node_pre )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (0 <= (avl_height_of (g_low_level_spec) (avl_node_pre))) ”
.

Definition AvlNodeSearchNode_entail_wit_2_split_goal_3 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (g_low_level_spec: avl_model) (PreH1 : (INT_MIN <= data_pre)) (PreH2 : (data_pre <= INT_MAX)) (PreH3 : (avl_tree_valid g_low_level_spec )) (PreH4 : (avl_search_cursor_valid g_low_level_spec avl_node_pre data_pre )) (PreH5 : (avl_node_pre <> 0)) ,
  (avl_subtree_store_at g_low_level_spec avl_node_pre )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ ((avl_key_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX) ”
.

Definition AvlNodeSearchNode_entail_wit_2_split_goal_4 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (g_low_level_spec: avl_model) (PreH1 : (INT_MIN <= data_pre)) (PreH2 : (data_pre <= INT_MAX)) (PreH3 : (avl_tree_valid g_low_level_spec )) (PreH4 : (avl_search_cursor_valid g_low_level_spec avl_node_pre data_pre )) (PreH5 : (avl_node_pre <> 0)) ,
  (avl_subtree_store_at g_low_level_spec avl_node_pre )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (INT_MIN <= (avl_key_of (g_low_level_spec) (avl_node_pre))) ”
.

Definition AvlNodeSearchNode_entail_wit_2_split_goal_5 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (g_low_level_spec: avl_model) (PreH1 : (INT_MIN <= data_pre)) (PreH2 : (data_pre <= INT_MAX)) (PreH3 : (avl_tree_valid g_low_level_spec )) (PreH4 : (avl_search_cursor_valid g_low_level_spec avl_node_pre data_pre )) (PreH5 : (avl_node_pre <> 0)) ,
  (avl_subtree_store_at g_low_level_spec avl_node_pre )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (avl_vvalid g_low_level_spec avl_node_pre ) ”
.

Definition AvlNodeSearchNode_entail_wit_2_split_goal_spatial := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (g_low_level_spec: avl_model) (PreH1 : (INT_MIN <= data_pre)) (PreH2 : (data_pre <= INT_MAX)) (PreH3 : (avl_tree_valid g_low_level_spec )) (PreH4 : (avl_search_cursor_valid g_low_level_spec avl_node_pre data_pre )) (PreH5 : (avl_node_pre <> 0)) ,
  (avl_subtree_store_at g_low_level_spec avl_node_pre )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
.

Definition AvlNodeSearchNode_entail_wit_3 := 
(
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (g_low_level_spec: avl_model) (PreH1 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) < data_pre)) (PreH2 : (data_pre <> (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH3 : (INT_MIN <= data_pre)) (PreH4 : (data_pre <= INT_MAX)) (PreH5 : (avl_tree_valid g_low_level_spec )) (PreH6 : (avl_vvalid g_low_level_spec avl_node_pre )) (PreH7 : (avl_node_pre <> 0)) (PreH8 : (INT_MIN <= (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH9 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH10 : (0 <= (avl_height_of (g_low_level_spec) (avl_node_pre)))) (PreH11 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH12 : (avl_search_cursor_valid g_low_level_spec avl_node_pre data_pre )) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (INT_MIN <= data_pre) ” 
  &&  “ (data_pre <= INT_MAX) ” 
  &&  “ (avl_tree_valid g_low_level_spec ) ” 
  &&  “ (avl_vvalid g_low_level_spec avl_node_pre ) ” 
  &&  “ (avl_node_pre <> 0) ” 
  &&  “ (INT_MIN <= (avl_key_of (g_low_level_spec) (avl_node_pre))) ” 
  &&  “ ((avl_key_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX) ” 
  &&  “ (0 <= (avl_height_of (g_low_level_spec) (avl_node_pre))) ” 
  &&  “ ((avl_height_of (g_low_level_spec) (avl_node_pre)) <= UINT_MAX) ” 
  &&  “ ((avl_key_of (g_low_level_spec) (avl_node_pre)) < data_pre) ” 
  &&  “ (avl_search_cursor_valid g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) data_pre ) ”
  &&  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
) \/
(
forall (data_pre: Z) (avl_node_pre: Z) (g_low_level_spec: avl_model) (PreH1 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) < data_pre)) (PreH2 : (data_pre <> (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH3 : (INT_MIN <= data_pre)) (PreH4 : (data_pre <= INT_MAX)) (PreH5 : (avl_tree_valid g_low_level_spec )) (PreH6 : (avl_vvalid g_low_level_spec avl_node_pre )) (PreH7 : (avl_node_pre <> 0)) (PreH8 : (INT_MIN <= (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH9 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH10 : (0 <= (avl_height_of (g_low_level_spec) (avl_node_pre)))) (PreH11 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH12 : (avl_search_cursor_valid g_low_level_spec avl_node_pre data_pre )) ,
  TT && emp 
|--
  “ (avl_search_cursor_valid g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) data_pre ) ”
  &&  emp
).

Definition AvlNodeSearchNode_entail_wit_3_split_goal_1 := 
forall (data_pre: Z) (avl_node_pre: Z) (g_low_level_spec: avl_model) (PreH1 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) < data_pre)) (PreH2 : (data_pre <> (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH3 : (INT_MIN <= data_pre)) (PreH4 : (data_pre <= INT_MAX)) (PreH5 : (avl_tree_valid g_low_level_spec )) (PreH6 : (avl_vvalid g_low_level_spec avl_node_pre )) (PreH7 : (avl_node_pre <> 0)) (PreH8 : (INT_MIN <= (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH9 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH10 : (0 <= (avl_height_of (g_low_level_spec) (avl_node_pre)))) (PreH11 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH12 : (avl_search_cursor_valid g_low_level_spec avl_node_pre data_pre )) ,
  (avl_search_cursor_valid g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) data_pre )
.

Definition AvlNodeSearchNode_entail_wit_4 := 
(
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (g_low_level_spec: avl_model) (PreH1 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) >= data_pre)) (PreH2 : (data_pre <> (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH3 : (INT_MIN <= data_pre)) (PreH4 : (data_pre <= INT_MAX)) (PreH5 : (avl_tree_valid g_low_level_spec )) (PreH6 : (avl_vvalid g_low_level_spec avl_node_pre )) (PreH7 : (avl_node_pre <> 0)) (PreH8 : (INT_MIN <= (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH9 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH10 : (0 <= (avl_height_of (g_low_level_spec) (avl_node_pre)))) (PreH11 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH12 : (avl_search_cursor_valid g_low_level_spec avl_node_pre data_pre )) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (INT_MIN <= data_pre) ” 
  &&  “ (data_pre <= INT_MAX) ” 
  &&  “ (avl_tree_valid g_low_level_spec ) ” 
  &&  “ (avl_vvalid g_low_level_spec avl_node_pre ) ” 
  &&  “ (avl_node_pre <> 0) ” 
  &&  “ (INT_MIN <= (avl_key_of (g_low_level_spec) (avl_node_pre))) ” 
  &&  “ ((avl_key_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX) ” 
  &&  “ (0 <= (avl_height_of (g_low_level_spec) (avl_node_pre))) ” 
  &&  “ ((avl_height_of (g_low_level_spec) (avl_node_pre)) <= UINT_MAX) ” 
  &&  “ (data_pre < (avl_key_of (g_low_level_spec) (avl_node_pre))) ” 
  &&  “ (avl_search_cursor_valid g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) data_pre ) ”
  &&  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
) \/
(
forall (data_pre: Z) (avl_node_pre: Z) (g_low_level_spec: avl_model) (PreH1 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) >= data_pre)) (PreH2 : (data_pre <> (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH3 : (INT_MIN <= data_pre)) (PreH4 : (data_pre <= INT_MAX)) (PreH5 : (avl_tree_valid g_low_level_spec )) (PreH6 : (avl_vvalid g_low_level_spec avl_node_pre )) (PreH7 : (avl_node_pre <> 0)) (PreH8 : (INT_MIN <= (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH9 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH10 : (0 <= (avl_height_of (g_low_level_spec) (avl_node_pre)))) (PreH11 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH12 : (avl_search_cursor_valid g_low_level_spec avl_node_pre data_pre )) ,
  TT && emp 
|--
  “ (avl_search_cursor_valid g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) data_pre ) ” 
  &&  “ (data_pre < (avl_key_of (g_low_level_spec) (avl_node_pre))) ”
  &&  emp
).

Definition AvlNodeSearchNode_entail_wit_4_split_goal_1 := 
forall (data_pre: Z) (avl_node_pre: Z) (g_low_level_spec: avl_model) (PreH1 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) >= data_pre)) (PreH2 : (data_pre <> (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH3 : (INT_MIN <= data_pre)) (PreH4 : (data_pre <= INT_MAX)) (PreH5 : (avl_tree_valid g_low_level_spec )) (PreH6 : (avl_vvalid g_low_level_spec avl_node_pre )) (PreH7 : (avl_node_pre <> 0)) (PreH8 : (INT_MIN <= (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH9 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH10 : (0 <= (avl_height_of (g_low_level_spec) (avl_node_pre)))) (PreH11 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH12 : (avl_search_cursor_valid g_low_level_spec avl_node_pre data_pre )) ,
  (avl_search_cursor_valid g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) data_pre )
.

Definition AvlNodeSearchNode_entail_wit_4_split_goal_2 := 
forall (data_pre: Z) (avl_node_pre: Z) (g_low_level_spec: avl_model) (PreH1 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) >= data_pre)) (PreH2 : (data_pre <> (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH3 : (INT_MIN <= data_pre)) (PreH4 : (data_pre <= INT_MAX)) (PreH5 : (avl_tree_valid g_low_level_spec )) (PreH6 : (avl_vvalid g_low_level_spec avl_node_pre )) (PreH7 : (avl_node_pre <> 0)) (PreH8 : (INT_MIN <= (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH9 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH10 : (0 <= (avl_height_of (g_low_level_spec) (avl_node_pre)))) (PreH11 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH12 : (avl_search_cursor_valid g_low_level_spec avl_node_pre data_pre )) ,
  (data_pre < (avl_key_of (g_low_level_spec) (avl_node_pre)))
.

Definition AvlNodeSearchNode_entail_wit_5_1 := 
(
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (g_low_level_spec: avl_model) (PreH1 : (data_pre = (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH2 : (INT_MIN <= data_pre)) (PreH3 : (data_pre <= INT_MAX)) (PreH4 : (avl_tree_valid g_low_level_spec )) (PreH5 : (avl_vvalid g_low_level_spec avl_node_pre )) (PreH6 : (avl_node_pre <> 0)) (PreH7 : (INT_MIN <= (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH8 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH9 : (0 <= (avl_height_of (g_low_level_spec) (avl_node_pre)))) (PreH10 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH11 : (avl_search_cursor_valid g_low_level_spec avl_node_pre data_pre )) ,
  (store_stringLit (LitMap_low_level_spec (("AvlNodeSearchNode %d is existed return the node
"%string))) ("AvlNodeSearchNode %d is existed return the node
"%string) )
  **  (GlobalStrings_missing LitMap_low_level_spec (cons (("AvlNodeSearchNode %d is existed return the node
"%string)) ((@nil string))) )
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "dst_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
|--
  “ ((avl_height_of (g_low_level_spec) (avl_node_pre)) >= 0) ” 
  &&  “ ((avl_key_of (g_low_level_spec) (avl_node_pre)) >= INT_MIN) ” 
  &&  “ (data_pre >= INT_MIN) ” 
  &&  “ (data_pre = (avl_key_of (g_low_level_spec) (avl_node_pre))) ” 
  &&  “ (INT_MIN <= data_pre) ” 
  &&  “ (data_pre <= INT_MAX) ” 
  &&  “ (avl_tree_valid g_low_level_spec ) ” 
  &&  “ (avl_vvalid g_low_level_spec avl_node_pre ) ” 
  &&  “ (avl_node_pre <> 0) ” 
  &&  “ (INT_MIN <= (avl_key_of (g_low_level_spec) (avl_node_pre))) ” 
  &&  “ ((avl_key_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX) ” 
  &&  “ (0 <= (avl_height_of (g_low_level_spec) (avl_node_pre))) ” 
  &&  “ ((avl_height_of (g_low_level_spec) (avl_node_pre)) <= UINT_MAX) ” 
  &&  “ (avl_search_cursor_valid g_low_level_spec avl_node_pre data_pre ) ”
  &&  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  (GlobalStrings LitMap_low_level_spec )
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "dst_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
) \/
(
forall (data_pre: Z) (avl_node_pre: Z) (g_low_level_spec: avl_model) (PreH1 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) >= 0)) (PreH2 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH3 : (data_pre >= INT_MIN)) (PreH4 : (data_pre = (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH5 : (INT_MIN <= data_pre)) (PreH6 : (data_pre <= INT_MAX)) (PreH7 : (avl_tree_valid g_low_level_spec )) (PreH8 : (avl_vvalid g_low_level_spec avl_node_pre )) (PreH9 : (avl_node_pre <> 0)) (PreH10 : (INT_MIN <= (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH11 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH12 : (0 <= (avl_height_of (g_low_level_spec) (avl_node_pre)))) (PreH13 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH14 : (avl_search_cursor_valid g_low_level_spec avl_node_pre data_pre )) ,
  TT && emp 
|--
  TT && emp 
).

Definition AvlNodeSearchNode_entail_wit_5_2 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (g_low_level_spec: avl_model) (retval: Z) (PreH1 : (avl_search_result g_low_level_spec data_pre retval )) (PreH2 : (INT_MIN <= data_pre)) (PreH3 : (data_pre <= INT_MAX)) (PreH4 : (avl_tree_valid g_low_level_spec )) (PreH5 : (avl_vvalid g_low_level_spec avl_node_pre )) (PreH6 : (avl_node_pre <> 0)) (PreH7 : (INT_MIN <= (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH8 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH9 : (0 <= (avl_height_of (g_low_level_spec) (avl_node_pre)))) (PreH10 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH11 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) < data_pre)) (PreH12 : (avl_search_cursor_valid g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) data_pre )) ,
  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "dst_node" ) )) # Ptr  |-> retval)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
|--
  “ ((avl_height_of (g_low_level_spec) (avl_node_pre)) >= 0) ” 
  &&  “ ((avl_key_of (g_low_level_spec) (avl_node_pre)) >= INT_MIN) ” 
  &&  “ (data_pre >= INT_MIN) ” 
  &&  “ (avl_search_result g_low_level_spec data_pre retval ) ” 
  &&  “ (INT_MIN <= data_pre) ” 
  &&  “ (data_pre <= INT_MAX) ” 
  &&  “ (avl_tree_valid g_low_level_spec ) ” 
  &&  “ (avl_vvalid g_low_level_spec avl_node_pre ) ” 
  &&  “ (avl_node_pre <> 0) ” 
  &&  “ (INT_MIN <= (avl_key_of (g_low_level_spec) (avl_node_pre))) ” 
  &&  “ ((avl_key_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX) ” 
  &&  “ (0 <= (avl_height_of (g_low_level_spec) (avl_node_pre))) ” 
  &&  “ ((avl_height_of (g_low_level_spec) (avl_node_pre)) <= UINT_MAX) ” 
  &&  “ ((avl_key_of (g_low_level_spec) (avl_node_pre)) < data_pre) ” 
  &&  “ (avl_search_cursor_valid g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) data_pre ) ”
  &&  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "dst_node" ) )) # Ptr  |-> retval)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
.

Definition AvlNodeSearchNode_entail_wit_5_3 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (g_low_level_spec: avl_model) (retval_2: Z) (PreH1 : (avl_search_result g_low_level_spec data_pre retval_2 )) (PreH2 : (INT_MIN <= data_pre)) (PreH3 : (data_pre <= INT_MAX)) (PreH4 : (avl_tree_valid g_low_level_spec )) (PreH5 : (avl_vvalid g_low_level_spec avl_node_pre )) (PreH6 : (avl_node_pre <> 0)) (PreH7 : (INT_MIN <= (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH8 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH9 : (0 <= (avl_height_of (g_low_level_spec) (avl_node_pre)))) (PreH10 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH11 : (data_pre < (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH12 : (avl_search_cursor_valid g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) data_pre )) ,
  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "dst_node" ) )) # Ptr  |-> retval_2)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
|--
  “ ((avl_height_of (g_low_level_spec) (avl_node_pre)) >= 0) ” 
  &&  “ ((avl_key_of (g_low_level_spec) (avl_node_pre)) >= INT_MIN) ” 
  &&  “ (data_pre >= INT_MIN) ” 
  &&  “ (avl_search_result g_low_level_spec data_pre retval_2 ) ” 
  &&  “ (INT_MIN <= data_pre) ” 
  &&  “ (data_pre <= INT_MAX) ” 
  &&  “ (avl_tree_valid g_low_level_spec ) ” 
  &&  “ (avl_vvalid g_low_level_spec avl_node_pre ) ” 
  &&  “ (avl_node_pre <> 0) ” 
  &&  “ (INT_MIN <= (avl_key_of (g_low_level_spec) (avl_node_pre))) ” 
  &&  “ ((avl_key_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX) ” 
  &&  “ (0 <= (avl_height_of (g_low_level_spec) (avl_node_pre))) ” 
  &&  “ ((avl_height_of (g_low_level_spec) (avl_node_pre)) <= UINT_MAX) ” 
  &&  “ (data_pre < (avl_key_of (g_low_level_spec) (avl_node_pre))) ” 
  &&  “ (avl_search_cursor_valid g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) data_pre ) ”
  &&  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "dst_node" ) )) # Ptr  |-> retval_2)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
.

Definition AvlNodeSearchNode_return_wit_1 := 
(
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (g_low_level_spec: avl_model) (PreH1 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) >= 0)) (PreH2 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH3 : (data_pre >= INT_MIN)) (PreH4 : (data_pre = (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH5 : (INT_MIN <= data_pre)) (PreH6 : (data_pre <= INT_MAX)) (PreH7 : (avl_tree_valid g_low_level_spec )) (PreH8 : (avl_vvalid g_low_level_spec avl_node_pre )) (PreH9 : (avl_node_pre <> 0)) (PreH10 : (INT_MIN <= (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH11 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH12 : (0 <= (avl_height_of (g_low_level_spec) (avl_node_pre)))) (PreH13 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH14 : (avl_search_cursor_valid g_low_level_spec avl_node_pre data_pre )) ,
  (GlobalStrings LitMap_low_level_spec )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
|--
  “ (avl_search_result g_low_level_spec data_pre avl_node_pre ) ”
  &&  (avl_subtree_store_at g_low_level_spec avl_node_pre )
  **  (GlobalStrings LitMap_low_level_spec )
) \/
(
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (g_low_level_spec: avl_model) (PreH1 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) >= 0)) (PreH2 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH3 : (data_pre >= INT_MIN)) (PreH4 : (data_pre = (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH5 : (INT_MIN <= data_pre)) (PreH6 : (data_pre <= INT_MAX)) (PreH7 : (avl_tree_valid g_low_level_spec )) (PreH8 : (avl_vvalid g_low_level_spec avl_node_pre )) (PreH9 : (avl_node_pre <> 0)) (PreH10 : (INT_MIN <= (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH11 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH12 : (0 <= (avl_height_of (g_low_level_spec) (avl_node_pre)))) (PreH13 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH14 : (avl_search_cursor_valid g_low_level_spec avl_node_pre data_pre )) ,
  (GlobalStrings LitMap_low_level_spec )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
|--
  “ (avl_search_result g_low_level_spec data_pre avl_node_pre ) ”
  &&  (avl_subtree_store_at g_low_level_spec avl_node_pre )
  **  (GlobalStrings LitMap_low_level_spec )
).

Definition AvlNodeSearchNode_return_wit_1_split_goal_1 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (g_low_level_spec: avl_model) (PreH1 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) >= 0)) (PreH2 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH3 : (data_pre >= INT_MIN)) (PreH4 : (data_pre = (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH5 : (INT_MIN <= data_pre)) (PreH6 : (data_pre <= INT_MAX)) (PreH7 : (avl_tree_valid g_low_level_spec )) (PreH8 : (avl_vvalid g_low_level_spec avl_node_pre )) (PreH9 : (avl_node_pre <> 0)) (PreH10 : (INT_MIN <= (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH11 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH12 : (0 <= (avl_height_of (g_low_level_spec) (avl_node_pre)))) (PreH13 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH14 : (avl_search_cursor_valid g_low_level_spec avl_node_pre data_pre )) ,
  (GlobalStrings LitMap_low_level_spec )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
|--
  “ (avl_search_result g_low_level_spec data_pre avl_node_pre ) ”
.

Definition AvlNodeSearchNode_return_wit_1_split_goal_spatial := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (g_low_level_spec: avl_model) (PreH1 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) >= 0)) (PreH2 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH3 : (data_pre >= INT_MIN)) (PreH4 : (data_pre = (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH5 : (INT_MIN <= data_pre)) (PreH6 : (data_pre <= INT_MAX)) (PreH7 : (avl_tree_valid g_low_level_spec )) (PreH8 : (avl_vvalid g_low_level_spec avl_node_pre )) (PreH9 : (avl_node_pre <> 0)) (PreH10 : (INT_MIN <= (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH11 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH12 : (0 <= (avl_height_of (g_low_level_spec) (avl_node_pre)))) (PreH13 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH14 : (avl_search_cursor_valid g_low_level_spec avl_node_pre data_pre )) ,
  (GlobalStrings LitMap_low_level_spec )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
|--
  (avl_subtree_store_at g_low_level_spec avl_node_pre )
  **  (GlobalStrings LitMap_low_level_spec )
.

Definition AvlNodeSearchNode_return_wit_2 := 
(
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (g_low_level_spec: avl_model) (retval: Z) (PreH1 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) >= 0)) (PreH2 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH3 : (data_pre >= INT_MIN)) (PreH4 : (avl_search_result g_low_level_spec data_pre retval )) (PreH5 : (INT_MIN <= data_pre)) (PreH6 : (data_pre <= INT_MAX)) (PreH7 : (avl_tree_valid g_low_level_spec )) (PreH8 : (avl_vvalid g_low_level_spec avl_node_pre )) (PreH9 : (avl_node_pre <> 0)) (PreH10 : (INT_MIN <= (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH11 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH12 : (0 <= (avl_height_of (g_low_level_spec) (avl_node_pre)))) (PreH13 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH14 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) < data_pre)) (PreH15 : (avl_search_cursor_valid g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) data_pre )) ,
  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
|--
  “ (avl_search_result g_low_level_spec data_pre retval ) ”
  &&  (avl_subtree_store_at g_low_level_spec avl_node_pre )
  **  (GlobalStrings LitMap_low_level_spec )
) \/
(
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (g_low_level_spec: avl_model) (retval: Z) (PreH1 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) >= 0)) (PreH2 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH3 : (data_pre >= INT_MIN)) (PreH4 : (avl_search_result g_low_level_spec data_pre retval )) (PreH5 : (INT_MIN <= data_pre)) (PreH6 : (data_pre <= INT_MAX)) (PreH7 : (avl_tree_valid g_low_level_spec )) (PreH8 : (avl_vvalid g_low_level_spec avl_node_pre )) (PreH9 : (avl_node_pre <> 0)) (PreH10 : (INT_MIN <= (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH11 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH12 : (0 <= (avl_height_of (g_low_level_spec) (avl_node_pre)))) (PreH13 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH14 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) < data_pre)) (PreH15 : (avl_search_cursor_valid g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) data_pre )) ,
  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
|--
  (avl_subtree_store_at g_low_level_spec avl_node_pre )
  **  (GlobalStrings LitMap_low_level_spec )
).

Definition AvlNodeSearchNode_return_wit_2_split_goal_spatial := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (g_low_level_spec: avl_model) (retval: Z) (PreH1 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) >= 0)) (PreH2 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH3 : (data_pre >= INT_MIN)) (PreH4 : (avl_search_result g_low_level_spec data_pre retval )) (PreH5 : (INT_MIN <= data_pre)) (PreH6 : (data_pre <= INT_MAX)) (PreH7 : (avl_tree_valid g_low_level_spec )) (PreH8 : (avl_vvalid g_low_level_spec avl_node_pre )) (PreH9 : (avl_node_pre <> 0)) (PreH10 : (INT_MIN <= (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH11 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH12 : (0 <= (avl_height_of (g_low_level_spec) (avl_node_pre)))) (PreH13 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH14 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) < data_pre)) (PreH15 : (avl_search_cursor_valid g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) data_pre )) ,
  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
|--
  (avl_subtree_store_at g_low_level_spec avl_node_pre )
  **  (GlobalStrings LitMap_low_level_spec )
.

Definition AvlNodeSearchNode_return_wit_3 := 
(
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (g_low_level_spec: avl_model) (retval: Z) (PreH1 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) >= 0)) (PreH2 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH3 : (data_pre >= INT_MIN)) (PreH4 : (avl_search_result g_low_level_spec data_pre retval )) (PreH5 : (INT_MIN <= data_pre)) (PreH6 : (data_pre <= INT_MAX)) (PreH7 : (avl_tree_valid g_low_level_spec )) (PreH8 : (avl_vvalid g_low_level_spec avl_node_pre )) (PreH9 : (avl_node_pre <> 0)) (PreH10 : (INT_MIN <= (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH11 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH12 : (0 <= (avl_height_of (g_low_level_spec) (avl_node_pre)))) (PreH13 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH14 : (data_pre < (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH15 : (avl_search_cursor_valid g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) data_pre )) ,
  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
|--
  “ (avl_search_result g_low_level_spec data_pre retval ) ”
  &&  (avl_subtree_store_at g_low_level_spec avl_node_pre )
  **  (GlobalStrings LitMap_low_level_spec )
) \/
(
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (g_low_level_spec: avl_model) (retval: Z) (PreH1 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) >= 0)) (PreH2 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH3 : (data_pre >= INT_MIN)) (PreH4 : (avl_search_result g_low_level_spec data_pre retval )) (PreH5 : (INT_MIN <= data_pre)) (PreH6 : (data_pre <= INT_MAX)) (PreH7 : (avl_tree_valid g_low_level_spec )) (PreH8 : (avl_vvalid g_low_level_spec avl_node_pre )) (PreH9 : (avl_node_pre <> 0)) (PreH10 : (INT_MIN <= (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH11 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH12 : (0 <= (avl_height_of (g_low_level_spec) (avl_node_pre)))) (PreH13 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH14 : (data_pre < (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH15 : (avl_search_cursor_valid g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) data_pre )) ,
  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
|--
  (avl_subtree_store_at g_low_level_spec avl_node_pre )
  **  (GlobalStrings LitMap_low_level_spec )
).

Definition AvlNodeSearchNode_return_wit_3_split_goal_spatial := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (g_low_level_spec: avl_model) (retval: Z) (PreH1 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) >= 0)) (PreH2 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH3 : (data_pre >= INT_MIN)) (PreH4 : (avl_search_result g_low_level_spec data_pre retval )) (PreH5 : (INT_MIN <= data_pre)) (PreH6 : (data_pre <= INT_MAX)) (PreH7 : (avl_tree_valid g_low_level_spec )) (PreH8 : (avl_vvalid g_low_level_spec avl_node_pre )) (PreH9 : (avl_node_pre <> 0)) (PreH10 : (INT_MIN <= (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH11 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH12 : (0 <= (avl_height_of (g_low_level_spec) (avl_node_pre)))) (PreH13 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH14 : (data_pre < (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH15 : (avl_search_cursor_valid g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) data_pre )) ,
  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
|--
  (avl_subtree_store_at g_low_level_spec avl_node_pre )
  **  (GlobalStrings LitMap_low_level_spec )
.

Definition AvlNodeSearchNode_return_wit_4 := 
(
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (g_low_level_spec: avl_model) (PreH1 : (INT_MIN <= data_pre)) (PreH2 : (data_pre <= INT_MAX)) (PreH3 : (avl_tree_valid g_low_level_spec )) (PreH4 : (avl_search_cursor_valid g_low_level_spec avl_node_pre data_pre )) (PreH5 : (avl_node_pre = 0)) ,
  (store_stringLit (LitMap_low_level_spec (("AvlNodeSearchNode avl_node is NONE.
"%string))) ("AvlNodeSearchNode avl_node is NONE.
"%string) )
  **  (GlobalStrings_missing LitMap_low_level_spec (cons (("AvlNodeSearchNode avl_node is NONE.
"%string)) ((@nil string))) )
  **  (avl_subtree_store_at g_low_level_spec avl_node_pre )
|--
  “ (avl_search_result g_low_level_spec data_pre 0 ) ”
  &&  (avl_subtree_store_at g_low_level_spec avl_node_pre )
  **  (GlobalStrings LitMap_low_level_spec )
) \/
(
forall (data_pre: Z) (avl_node_pre: Z) (g_low_level_spec: avl_model) (PreH1 : (INT_MIN <= data_pre)) (PreH2 : (data_pre <= INT_MAX)) (PreH3 : (avl_tree_valid g_low_level_spec )) (PreH4 : (avl_search_cursor_valid g_low_level_spec avl_node_pre data_pre )) (PreH5 : (avl_node_pre = 0)) ,
  TT && emp 
|--
  “ (avl_search_result g_low_level_spec data_pre 0 ) ”
  &&  emp
).

Definition AvlNodeSearchNode_return_wit_4_split_goal_1 := 
forall (data_pre: Z) (avl_node_pre: Z) (g_low_level_spec: avl_model) (PreH1 : (INT_MIN <= data_pre)) (PreH2 : (data_pre <= INT_MAX)) (PreH3 : (avl_tree_valid g_low_level_spec )) (PreH4 : (avl_search_cursor_valid g_low_level_spec avl_node_pre data_pre )) (PreH5 : (avl_node_pre = 0)) ,
  (avl_search_result g_low_level_spec data_pre 0 )
.

Definition AvlNodeSearchNode_partial_solve_wit_1_pure := 
(
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (g_low_level_spec: avl_model) (PreH1 : (data_pre = (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH2 : (INT_MIN <= data_pre)) (PreH3 : (data_pre <= INT_MAX)) (PreH4 : (avl_tree_valid g_low_level_spec )) (PreH5 : (avl_vvalid g_low_level_spec avl_node_pre )) (PreH6 : (avl_node_pre <> 0)) (PreH7 : (INT_MIN <= (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH8 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH9 : (0 <= (avl_height_of (g_low_level_spec) (avl_node_pre)))) (PreH10 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH11 : (avl_search_cursor_valid g_low_level_spec avl_node_pre data_pre )) ,
  (store_stringLit (LitMap_low_level_spec (("AvlNodeSearchNode %d is existed return the node
"%string))) ("AvlNodeSearchNode %d is existed return the node
"%string) )
  **  (GlobalStrings_missing LitMap_low_level_spec (cons (("AvlNodeSearchNode %d is existed return the node
"%string)) ((@nil string))) )
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "dst_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
|--
  “ (((LitMap_low_level_spec (("AvlNodeSearchNode %d is existed return the node
"%string))) + (0 * sizeof(CHAR))) = (LitMap_low_level_spec (("AvlNodeSearchNode %d is existed return the node
"%string)))) ”
) \/
(
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (g_low_level_spec: avl_model) (PreH1 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) >= 0)) (PreH2 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH3 : (data_pre >= INT_MIN)) (PreH4 : (data_pre = (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH5 : (INT_MIN <= data_pre)) (PreH6 : (data_pre <= INT_MAX)) (PreH7 : (avl_tree_valid g_low_level_spec )) (PreH8 : (avl_vvalid g_low_level_spec avl_node_pre )) (PreH9 : (avl_node_pre <> 0)) (PreH10 : (INT_MIN <= (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH11 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH12 : (0 <= (avl_height_of (g_low_level_spec) (avl_node_pre)))) (PreH13 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH14 : (avl_search_cursor_valid g_low_level_spec avl_node_pre data_pre )) ,
  (GlobalStrings LitMap_low_level_spec )
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "dst_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
|--
  “ (((LitMap_low_level_spec (("AvlNodeSearchNode %d is existed return the node
"%string))) + (0 * sizeof(CHAR))) = (LitMap_low_level_spec (("AvlNodeSearchNode %d is existed return the node
"%string)))) ”
).

Definition AvlNodeSearchNode_partial_solve_wit_1_pure_split_goal_1 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (g_low_level_spec: avl_model) (PreH1 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) >= 0)) (PreH2 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH3 : (data_pre >= INT_MIN)) (PreH4 : (data_pre = (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH5 : (INT_MIN <= data_pre)) (PreH6 : (data_pre <= INT_MAX)) (PreH7 : (avl_tree_valid g_low_level_spec )) (PreH8 : (avl_vvalid g_low_level_spec avl_node_pre )) (PreH9 : (avl_node_pre <> 0)) (PreH10 : (INT_MIN <= (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH11 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH12 : (0 <= (avl_height_of (g_low_level_spec) (avl_node_pre)))) (PreH13 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH14 : (avl_search_cursor_valid g_low_level_spec avl_node_pre data_pre )) ,
  (GlobalStrings LitMap_low_level_spec )
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "dst_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
|--
  “ (((LitMap_low_level_spec (("AvlNodeSearchNode %d is existed return the node
"%string))) + (0 * sizeof(CHAR))) = (LitMap_low_level_spec (("AvlNodeSearchNode %d is existed return the node
"%string)))) ”
.

Definition AvlNodeSearchNode_partial_solve_wit_1_aux := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (g_low_level_spec: avl_model) (PreH1 : (data_pre = (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH2 : (INT_MIN <= data_pre)) (PreH3 : (data_pre <= INT_MAX)) (PreH4 : (avl_tree_valid g_low_level_spec )) (PreH5 : (avl_vvalid g_low_level_spec avl_node_pre )) (PreH6 : (avl_node_pre <> 0)) (PreH7 : (INT_MIN <= (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH8 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH9 : (0 <= (avl_height_of (g_low_level_spec) (avl_node_pre)))) (PreH10 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH11 : (avl_search_cursor_valid g_low_level_spec avl_node_pre data_pre )) ,
  (store_stringLit (LitMap_low_level_spec (("AvlNodeSearchNode %d is existed return the node
"%string))) ("AvlNodeSearchNode %d is existed return the node
"%string) )
  **  (GlobalStrings_missing LitMap_low_level_spec (cons (("AvlNodeSearchNode %d is existed return the node
"%string)) ((@nil string))) )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
|--
  “ (((LitMap_low_level_spec (("AvlNodeSearchNode %d is existed return the node
"%string))) + (0 * sizeof(CHAR))) = (LitMap_low_level_spec (("AvlNodeSearchNode %d is existed return the node
"%string)))) ” 
  &&  “ (data_pre = (avl_key_of (g_low_level_spec) (avl_node_pre))) ” 
  &&  “ (INT_MIN <= data_pre) ” 
  &&  “ (data_pre <= INT_MAX) ” 
  &&  “ (avl_tree_valid g_low_level_spec ) ” 
  &&  “ (avl_vvalid g_low_level_spec avl_node_pre ) ” 
  &&  “ (avl_node_pre <> 0) ” 
  &&  “ (INT_MIN <= (avl_key_of (g_low_level_spec) (avl_node_pre))) ” 
  &&  “ ((avl_key_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX) ” 
  &&  “ (0 <= (avl_height_of (g_low_level_spec) (avl_node_pre))) ” 
  &&  “ ((avl_height_of (g_low_level_spec) (avl_node_pre)) <= UINT_MAX) ” 
  &&  “ (avl_search_cursor_valid g_low_level_spec avl_node_pre data_pre ) ”
  &&  (store_stringLit (LitMap_low_level_spec (("AvlNodeSearchNode %d is existed return the node
"%string))) ("AvlNodeSearchNode %d is existed return the node
"%string) )
  **  (GlobalStrings_missing LitMap_low_level_spec (cons (("AvlNodeSearchNode %d is existed return the node
"%string)) ((@nil string))) )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
.

Definition AvlNodeSearchNode_partial_solve_wit_1 := AvlNodeSearchNode_partial_solve_wit_1_pure -> AvlNodeSearchNode_partial_solve_wit_1_aux.

Definition AvlNodeSearchNode_partial_solve_wit_2_pure := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (g_low_level_spec: avl_model) (PreH1 : (INT_MIN <= data_pre)) (PreH2 : (data_pre <= INT_MAX)) (PreH3 : (avl_tree_valid g_low_level_spec )) (PreH4 : (avl_vvalid g_low_level_spec avl_node_pre )) (PreH5 : (avl_node_pre <> 0)) (PreH6 : (INT_MIN <= (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH7 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH8 : (0 <= (avl_height_of (g_low_level_spec) (avl_node_pre)))) (PreH9 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH10 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) < data_pre)) (PreH11 : (avl_search_cursor_valid g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) data_pre )) ,
  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "dst_node" ) )) # Ptr  |-> 0)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (avl_tree_valid g_low_level_spec ) ” 
  &&  “ (avl_search_cursor_valid g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) data_pre ) ”
.

Definition AvlNodeSearchNode_partial_solve_wit_2_aux := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (g_low_level_spec: avl_model) (PreH1 : (INT_MIN <= data_pre)) (PreH2 : (data_pre <= INT_MAX)) (PreH3 : (avl_tree_valid g_low_level_spec )) (PreH4 : (avl_vvalid g_low_level_spec avl_node_pre )) (PreH5 : (avl_node_pre <> 0)) (PreH6 : (INT_MIN <= (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH7 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH8 : (0 <= (avl_height_of (g_low_level_spec) (avl_node_pre)))) (PreH9 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH10 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) < data_pre)) (PreH11 : (avl_search_cursor_valid g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) data_pre )) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (avl_tree_valid g_low_level_spec ) ” 
  &&  “ (avl_search_cursor_valid g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) data_pre ) ” 
  &&  “ (INT_MIN <= data_pre) ” 
  &&  “ (data_pre <= INT_MAX) ” 
  &&  “ (avl_tree_valid g_low_level_spec ) ” 
  &&  “ (avl_vvalid g_low_level_spec avl_node_pre ) ” 
  &&  “ (avl_node_pre <> 0) ” 
  &&  “ (INT_MIN <= (avl_key_of (g_low_level_spec) (avl_node_pre))) ” 
  &&  “ ((avl_key_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX) ” 
  &&  “ (0 <= (avl_height_of (g_low_level_spec) (avl_node_pre))) ” 
  &&  “ ((avl_height_of (g_low_level_spec) (avl_node_pre)) <= UINT_MAX) ” 
  &&  “ ((avl_key_of (g_low_level_spec) (avl_node_pre)) < data_pre) ” 
  &&  “ (avl_search_cursor_valid g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) data_pre ) ”
  &&  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
.

Definition AvlNodeSearchNode_partial_solve_wit_2 := AvlNodeSearchNode_partial_solve_wit_2_pure -> AvlNodeSearchNode_partial_solve_wit_2_aux.

Definition AvlNodeSearchNode_partial_solve_wit_3_pure := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (g_low_level_spec: avl_model) (PreH1 : (INT_MIN <= data_pre)) (PreH2 : (data_pre <= INT_MAX)) (PreH3 : (avl_tree_valid g_low_level_spec )) (PreH4 : (avl_vvalid g_low_level_spec avl_node_pre )) (PreH5 : (avl_node_pre <> 0)) (PreH6 : (INT_MIN <= (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH7 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH8 : (0 <= (avl_height_of (g_low_level_spec) (avl_node_pre)))) (PreH9 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH10 : (data_pre < (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH11 : (avl_search_cursor_valid g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) data_pre )) ,
  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "dst_node" ) )) # Ptr  |-> 0)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (avl_tree_valid g_low_level_spec ) ” 
  &&  “ (avl_search_cursor_valid g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) data_pre ) ”
.

Definition AvlNodeSearchNode_partial_solve_wit_3_aux := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (g_low_level_spec: avl_model) (PreH1 : (INT_MIN <= data_pre)) (PreH2 : (data_pre <= INT_MAX)) (PreH3 : (avl_tree_valid g_low_level_spec )) (PreH4 : (avl_vvalid g_low_level_spec avl_node_pre )) (PreH5 : (avl_node_pre <> 0)) (PreH6 : (INT_MIN <= (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH7 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH8 : (0 <= (avl_height_of (g_low_level_spec) (avl_node_pre)))) (PreH9 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH10 : (data_pre < (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH11 : (avl_search_cursor_valid g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) data_pre )) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
|--
  “ (avl_tree_valid g_low_level_spec ) ” 
  &&  “ (avl_search_cursor_valid g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) data_pre ) ” 
  &&  “ (INT_MIN <= data_pre) ” 
  &&  “ (data_pre <= INT_MAX) ” 
  &&  “ (avl_tree_valid g_low_level_spec ) ” 
  &&  “ (avl_vvalid g_low_level_spec avl_node_pre ) ” 
  &&  “ (avl_node_pre <> 0) ” 
  &&  “ (INT_MIN <= (avl_key_of (g_low_level_spec) (avl_node_pre))) ” 
  &&  “ ((avl_key_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX) ” 
  &&  “ (0 <= (avl_height_of (g_low_level_spec) (avl_node_pre))) ” 
  &&  “ ((avl_height_of (g_low_level_spec) (avl_node_pre)) <= UINT_MAX) ” 
  &&  “ (data_pre < (avl_key_of (g_low_level_spec) (avl_node_pre))) ” 
  &&  “ (avl_search_cursor_valid g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) data_pre ) ”
  &&  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  (GlobalStrings LitMap_low_level_spec )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
.

Definition AvlNodeSearchNode_partial_solve_wit_3 := AvlNodeSearchNode_partial_solve_wit_3_pure -> AvlNodeSearchNode_partial_solve_wit_3_aux.

Definition AvlNodeSearchNode_partial_solve_wit_4_pure := 
(
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (g_low_level_spec: avl_model) (PreH1 : (INT_MIN <= data_pre)) (PreH2 : (data_pre <= INT_MAX)) (PreH3 : (avl_tree_valid g_low_level_spec )) (PreH4 : (avl_search_cursor_valid g_low_level_spec avl_node_pre data_pre )) (PreH5 : (avl_node_pre = 0)) ,
  (store_stringLit (LitMap_low_level_spec (("AvlNodeSearchNode avl_node is NONE.
"%string))) ("AvlNodeSearchNode avl_node is NONE.
"%string) )
  **  (GlobalStrings_missing LitMap_low_level_spec (cons (("AvlNodeSearchNode avl_node is NONE.
"%string)) ((@nil string))) )
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "dst_node" ) )) # Ptr  |-> 0)
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  (avl_subtree_store_at g_low_level_spec avl_node_pre )
|--
  “ (((LitMap_low_level_spec (("AvlNodeSearchNode avl_node is NONE.
"%string))) + (0 * sizeof(CHAR))) = (LitMap_low_level_spec (("AvlNodeSearchNode avl_node is NONE.
"%string)))) ”
) \/
(
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (g_low_level_spec: avl_model) (PreH1 : (data_pre >= INT_MIN)) (PreH2 : (INT_MIN <= data_pre)) (PreH3 : (data_pre <= INT_MAX)) (PreH4 : (avl_tree_valid g_low_level_spec )) (PreH5 : (avl_search_cursor_valid g_low_level_spec avl_node_pre data_pre )) (PreH6 : (avl_node_pre = 0)) ,
  (GlobalStrings LitMap_low_level_spec )
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "dst_node" ) )) # Ptr  |-> 0)
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  (avl_subtree_store_at g_low_level_spec avl_node_pre )
|--
  “ (((LitMap_low_level_spec (("AvlNodeSearchNode avl_node is NONE.
"%string))) + (0 * sizeof(CHAR))) = (LitMap_low_level_spec (("AvlNodeSearchNode avl_node is NONE.
"%string)))) ”
).

Definition AvlNodeSearchNode_partial_solve_wit_4_pure_split_goal_1 := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (g_low_level_spec: avl_model) (PreH1 : (data_pre >= INT_MIN)) (PreH2 : (INT_MIN <= data_pre)) (PreH3 : (data_pre <= INT_MAX)) (PreH4 : (avl_tree_valid g_low_level_spec )) (PreH5 : (avl_search_cursor_valid g_low_level_spec avl_node_pre data_pre )) (PreH6 : (avl_node_pre = 0)) ,
  (GlobalStrings LitMap_low_level_spec )
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "dst_node" ) )) # Ptr  |-> 0)
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  (avl_subtree_store_at g_low_level_spec avl_node_pre )
|--
  “ (((LitMap_low_level_spec (("AvlNodeSearchNode avl_node is NONE.
"%string))) + (0 * sizeof(CHAR))) = (LitMap_low_level_spec (("AvlNodeSearchNode avl_node is NONE.
"%string)))) ”
.

Definition AvlNodeSearchNode_partial_solve_wit_4_aux := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_low_level_spec: (string -> Z)) (g_low_level_spec: avl_model) (PreH1 : (INT_MIN <= data_pre)) (PreH2 : (data_pre <= INT_MAX)) (PreH3 : (avl_tree_valid g_low_level_spec )) (PreH4 : (avl_search_cursor_valid g_low_level_spec avl_node_pre data_pre )) (PreH5 : (avl_node_pre = 0)) ,
  (store_stringLit (LitMap_low_level_spec (("AvlNodeSearchNode avl_node is NONE.
"%string))) ("AvlNodeSearchNode avl_node is NONE.
"%string) )
  **  (GlobalStrings_missing LitMap_low_level_spec (cons (("AvlNodeSearchNode avl_node is NONE.
"%string)) ((@nil string))) )
  **  (avl_subtree_store_at g_low_level_spec avl_node_pre )
|--
  “ (((LitMap_low_level_spec (("AvlNodeSearchNode avl_node is NONE.
"%string))) + (0 * sizeof(CHAR))) = (LitMap_low_level_spec (("AvlNodeSearchNode avl_node is NONE.
"%string)))) ” 
  &&  “ (INT_MIN <= data_pre) ” 
  &&  “ (data_pre <= INT_MAX) ” 
  &&  “ (avl_tree_valid g_low_level_spec ) ” 
  &&  “ (avl_search_cursor_valid g_low_level_spec avl_node_pre data_pre ) ” 
  &&  “ (avl_node_pre = 0) ”
  &&  (store_stringLit (LitMap_low_level_spec (("AvlNodeSearchNode avl_node is NONE.
"%string))) ("AvlNodeSearchNode avl_node is NONE.
"%string) )
  **  (GlobalStrings_missing LitMap_low_level_spec (cons (("AvlNodeSearchNode avl_node is NONE.
"%string)) ((@nil string))) )
  **  (avl_subtree_store_at g_low_level_spec avl_node_pre )
.

Definition AvlNodeSearchNode_partial_solve_wit_4 := AvlNodeSearchNode_partial_solve_wit_4_pure -> AvlNodeSearchNode_partial_solve_wit_4_aux.

Definition AvlNodeSearchNode_derive_high_level_spec_by_low_level_spec := 
forall (data_pre: Z) (avl_node_pre: Z) (keys_high_level_spec: (Z -> Prop)) ,
  (avl_balanced_set_root_rep keys_high_level_spec avl_node_pre )
  **  (avl_api_runtime_strings )
|--
EX (g_low_level_spec: avl_model) (LitMap_low_level_spec: (string -> Z)) ,
  (“ (avl_tree_valid g_low_level_spec ) ” 
  &&  “ (avl_search_cursor_valid g_low_level_spec avl_node_pre data_pre ) ”
  &&  (avl_subtree_store_at g_low_level_spec avl_node_pre )
  **  (GlobalStrings LitMap_low_level_spec ))
  **
  ((EX retval_2,
  “ (avl_search_result g_low_level_spec data_pre retval_2 ) ”
  &&  (avl_subtree_store_at g_low_level_spec avl_node_pre )
  **  (GlobalStrings LitMap_low_level_spec ))
  -*
  ((EX g retval,
  “ (avl_set_member keys_high_level_spec data_pre ) ” 
  &&  “ (retval <> 0) ” 
  &&  “ (avl_gvalid g ) ” 
  &&  “ (avl_tree_valid g ) ” 
  &&  “ (avl_balanced g ) ” 
  &&  “ (avl_node_pre = (avl_ptr_of ((avl_root (g))))) ” 
  &&  “ (avl_set_refines_graph keys_high_level_spec g ) ” 
  &&  “ (avl_vvalid g retval ) ” 
  &&  “ ((avl_key_of (g) (retval)) = data_pre) ”
  &&  ((&((retval)  # "AvlNode" ->ₛ "data")) # Int  |-> data_pre)
  **  ((&((retval)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g) (retval)))
  **  ((&((retval)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g) (retval)))))
  **  ((&((retval)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g) (retval)))))
  **  (avl_graph_nodes_store g (avl_nodes_without (g) (retval)) )
  **  (avl_api_runtime_strings ))
  ||
  (EX retval,
  “ ~((avl_set_member keys_high_level_spec data_pre )) ” 
  &&  “ (retval = 0) ”
  &&  (avl_balanced_set_root_rep keys_high_level_spec avl_node_pre )
  **  (avl_api_runtime_strings ))))
.

Definition AvlNodeModifyNode_derive_high_level_spec_by_low_level_spec := 
forall (dst_data_pre: Z) (src_data_pre: Z) (avl_node_pre: Z) (keys_high_level_spec: (Z -> Prop)) ,
  (avl_balanced_set_root_rep keys_high_level_spec avl_node_pre )
  **  (avl_api_runtime_strings )
|--
EX (before_low_level_spec: avl_model) (LitMap_low_level_spec: (string -> Z)) ,
  (“ (avl_gvalid before_low_level_spec ) ” 
  &&  “ (avl_node_pre = (avl_ptr_of ((avl_root (before_low_level_spec))))) ”
  &&  (avl_tree_store before_low_level_spec )
  **  (GlobalStrings LitMap_low_level_spec ))
  **
  (((EX after middle retval_2,
  “ (avl_node_pre <> 0) ” 
  &&  “ (avl_delete_outcome before_low_level_spec middle src_data_pre (avl_ptr_of ((avl_root (middle)))) ) ” 
  &&  “ (strict_insert_outcome middle after dst_data_pre retval_2 ) ”
  &&  (avl_tree_store after )
  **  (GlobalStrings LitMap_low_level_spec ))
  ||
  (EX retval_2,
  “ (avl_node_pre = 0) ” 
  &&  “ (retval_2 = 0) ”
  &&  (avl_tree_store before_low_level_spec )
  **  (GlobalStrings LitMap_low_level_spec )))
  -*
  ((EX retval,
  “ (retval = 0) ”
  &&  (avl_api_modify_failure_rep keys_high_level_spec avl_node_pre src_data_pre dst_data_pre )
  **  (avl_api_runtime_strings ))
  ||
  (EX retval,
  “ (avl_node_pre <> 0) ” 
  &&  “ (retval <> 0) ”
  &&  (avl_balanced_set_root_rep (avl_set_insert ((avl_set_remove (keys_high_level_spec) (src_data_pre))) (dst_data_pre)) retval )
  **  (avl_api_runtime_strings ))
  ||
  (EX retval,
  “ (avl_node_pre = 0) ” 
  &&  “ (retval = 0) ”
  &&  (avl_balanced_set_root_rep keys_high_level_spec avl_node_pre )
  **  (avl_api_runtime_strings ))))
.

Definition AvlTreeDeleteNode_derive_cursor_level_spec_by_low_level_spec := 
forall (data_pre: Z) (avl_node_pre: Z) (LitMap_cursor_level_spec: (string -> Z)) (focus_cursor_level_spec: Z) (before_cursor_level_spec: avl_model) ,
  “ (avl_delete_input before_cursor_level_spec avl_node_pre data_pre ) ” 
  &&  “ (focus_cursor_level_spec <> 0) ” 
  &&  “ (avl_vvalid before_cursor_level_spec focus_cursor_level_spec ) ”
  &&  ((&((focus_cursor_level_spec)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_cursor_level_spec) (focus_cursor_level_spec)))
  **  ((&((focus_cursor_level_spec)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_cursor_level_spec) (focus_cursor_level_spec)))
  **  ((&((focus_cursor_level_spec)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_cursor_level_spec) (focus_cursor_level_spec)))))
  **  ((&((focus_cursor_level_spec)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_cursor_level_spec) (focus_cursor_level_spec)))))
  **  (avl_graph_nodes_store before_cursor_level_spec (avl_nodes_without (before_cursor_level_spec) (focus_cursor_level_spec)) )
  **  (GlobalStrings LitMap_cursor_level_spec )
|--
EX (before_low_level_spec: avl_model) (LitMap_low_level_spec: (string -> Z)) ,
  (“ (avl_gvalid before_low_level_spec ) ” 
  &&  “ (avl_node_pre = (avl_ptr_of ((avl_root (before_low_level_spec))))) ”
  &&  (avl_tree_store before_low_level_spec )
  **  (GlobalStrings LitMap_low_level_spec ))
  **
  ((EX after_2 retval_2,
  “ (avl_delete_outcome before_low_level_spec after_2 data_pre retval_2 ) ” 
  &&  “ (avl_api_delete_identity before_low_level_spec after_2 data_pre ) ”
  &&  (avl_tree_store after_2 )
  **  (GlobalStrings LitMap_low_level_spec ))
  -*
  (EX after retval,
  “ (avl_delete_outcome before_cursor_level_spec after data_pre retval ) ” 
  &&  “ (avl_api_delete_identity before_cursor_level_spec after data_pre ) ”
  &&  (avl_tree_store after )
  **  (GlobalStrings LitMap_cursor_level_spec )))
.

Definition AvlTreeDeleteNode_derive_high_level_spec_by_low_level_spec := 
forall (data_pre: Z) (avl_node_pre: Z) (keys_high_level_spec: (Z -> Prop)) ,
  (avl_balanced_set_root_rep keys_high_level_spec avl_node_pre )
  **  (avl_api_runtime_strings )
|--
EX (before_low_level_spec: avl_model) (LitMap_low_level_spec: (string -> Z)) ,
  (“ (avl_gvalid before_low_level_spec ) ” 
  &&  “ (avl_node_pre = (avl_ptr_of ((avl_root (before_low_level_spec))))) ”
  &&  (avl_tree_store before_low_level_spec )
  **  (GlobalStrings LitMap_low_level_spec ))
  **
  ((EX after retval_2,
  “ (avl_delete_outcome before_low_level_spec after data_pre retval_2 ) ” 
  &&  “ (avl_api_delete_identity before_low_level_spec after data_pre ) ”
  &&  (avl_tree_store after )
  **  (GlobalStrings LitMap_low_level_spec ))
  -*
  ((EX retval,
  “ (avl_set_member keys_high_level_spec data_pre ) ”
  &&  (avl_balanced_set_root_rep (avl_set_remove (keys_high_level_spec) (data_pre)) retval )
  **  (avl_api_runtime_strings ))
  ||
  (EX retval,
  “ ~((avl_set_member keys_high_level_spec data_pre )) ” 
  &&  “ (retval = avl_node_pre) ”
  &&  (avl_balanced_set_root_rep keys_high_level_spec retval )
  **  (avl_api_runtime_strings ))))
.

Definition AvlTreeInsertNode_derive_high_level_spec_by_low_level_spec := 
forall (data_pre: Z) (avl_node_pre: Z) (keys_high_level_spec: (Z -> Prop)) ,
  “ (INT_MIN <= data_pre) ” 
  &&  “ (data_pre <= INT_MAX) ”
  &&  (avl_balanced_set_root_rep keys_high_level_spec avl_node_pre )
  **  (avl_api_runtime_strings )
|--
EX (before_low_level_spec: avl_model) (LitMap_low_level_spec: (string -> Z)) ,
  (“ (avl_insert_input before_low_level_spec avl_node_pre data_pre ) ”
  &&  (avl_subtree_store_at before_low_level_spec avl_node_pre )
  **  (GlobalStrings LitMap_low_level_spec ))
  **
  ((EX after retval_2,
  “ (strict_insert_outcome before_low_level_spec after data_pre retval_2 ) ”
  &&  (avl_tree_store after )
  **  (GlobalStrings LitMap_low_level_spec ))
  -*
  ((EX retval,
  “ (retval = 0) ”
  &&  (avl_api_insert_failure_rep keys_high_level_spec avl_node_pre data_pre )
  **  (avl_api_runtime_strings ))
  ||
  (EX retval,
  “ ~((avl_set_member keys_high_level_spec data_pre )) ” 
  &&  “ (retval <> 0) ”
  &&  (avl_balanced_set_root_rep (avl_set_insert (keys_high_level_spec) (data_pre)) retval )
  **  (avl_api_runtime_strings ))
  ||
  (EX retval,
  “ (avl_set_member keys_high_level_spec data_pre ) ” 
  &&  “ (retval = avl_node_pre) ”
  &&  (avl_balanced_set_root_rep keys_high_level_spec retval )
  **  (avl_api_runtime_strings ))))
.

Module Type VC_Correct.


Axiom proof_of_crtos_avl_height_crtos_safety_wit_1 : crtos_avl_height_crtos_safety_wit_1.
Axiom proof_of_crtos_avl_height_crtos_safety_wit_2 : crtos_avl_height_crtos_safety_wit_2.
Axiom proof_of_crtos_avl_height_crtos_safety_wit_3 : crtos_avl_height_crtos_safety_wit_3.
Axiom proof_of_crtos_avl_height_crtos_entail_wit_1 : crtos_avl_height_crtos_entail_wit_1.
Axiom proof_of_crtos_avl_height_crtos_return_wit_1 : crtos_avl_height_crtos_return_wit_1.
Axiom proof_of_crtos_avl_height_crtos_return_wit_2 : crtos_avl_height_crtos_return_wit_2.
Axiom proof_of_crtos_avl_update_height_crtos_safety_wit_1 : crtos_avl_update_height_crtos_safety_wit_1.
Axiom proof_of_crtos_avl_update_height_crtos_safety_wit_2 : crtos_avl_update_height_crtos_safety_wit_2.
Axiom proof_of_crtos_avl_update_height_crtos_entail_wit_1 : crtos_avl_update_height_crtos_entail_wit_1.
Axiom proof_of_crtos_avl_update_height_crtos_return_wit_1 : crtos_avl_update_height_crtos_return_wit_1.
Axiom proof_of_crtos_avl_update_height_crtos_return_wit_2 : crtos_avl_update_height_crtos_return_wit_2.
Axiom proof_of_crtos_avl_update_height_crtos_return_wit_3 : crtos_avl_update_height_crtos_return_wit_3.
Axiom proof_of_crtos_avl_update_height_crtos_partial_solve_wit_1_pure : crtos_avl_update_height_crtos_partial_solve_wit_1_pure.
Axiom proof_of_crtos_avl_update_height_crtos_partial_solve_wit_1 : crtos_avl_update_height_crtos_partial_solve_wit_1.
Axiom proof_of_crtos_avl_update_height_crtos_partial_solve_wit_2_pure : crtos_avl_update_height_crtos_partial_solve_wit_2_pure.
Axiom proof_of_crtos_avl_update_height_crtos_partial_solve_wit_2 : crtos_avl_update_height_crtos_partial_solve_wit_2.
Axiom proof_of_crtos_avl_update_height_crtos_partial_solve_wit_3_pure : crtos_avl_update_height_crtos_partial_solve_wit_3_pure.
Axiom proof_of_crtos_avl_update_height_crtos_partial_solve_wit_3 : crtos_avl_update_height_crtos_partial_solve_wit_3.
Axiom proof_of_crtos_avl_update_height_crtos_partial_solve_wit_4_pure : crtos_avl_update_height_crtos_partial_solve_wit_4_pure.
Axiom proof_of_crtos_avl_update_height_crtos_partial_solve_wit_4 : crtos_avl_update_height_crtos_partial_solve_wit_4.
Axiom proof_of_crtos_avl_balance_factor_crtos_safety_wit_1 : crtos_avl_balance_factor_crtos_safety_wit_1.
Axiom proof_of_crtos_avl_balance_factor_crtos_entail_wit_1 : crtos_avl_balance_factor_crtos_entail_wit_1.
Axiom proof_of_crtos_avl_balance_factor_crtos_return_wit_1 : crtos_avl_balance_factor_crtos_return_wit_1.
Axiom proof_of_crtos_avl_balance_factor_crtos_return_wit_2 : crtos_avl_balance_factor_crtos_return_wit_2.
Axiom proof_of_crtos_avl_balance_factor_crtos_partial_solve_wit_1_pure : crtos_avl_balance_factor_crtos_partial_solve_wit_1_pure.
Axiom proof_of_crtos_avl_balance_factor_crtos_partial_solve_wit_1 : crtos_avl_balance_factor_crtos_partial_solve_wit_1.
Axiom proof_of_crtos_avl_balance_factor_crtos_partial_solve_wit_2_pure : crtos_avl_balance_factor_crtos_partial_solve_wit_2_pure.
Axiom proof_of_crtos_avl_balance_factor_crtos_partial_solve_wit_2 : crtos_avl_balance_factor_crtos_partial_solve_wit_2.
Axiom proof_of_crtos_avl_right_rotate_crtos_safety_wit_1 : crtos_avl_right_rotate_crtos_safety_wit_1.
Axiom proof_of_crtos_avl_right_rotate_crtos_safety_wit_2 : crtos_avl_right_rotate_crtos_safety_wit_2.
Axiom proof_of_crtos_avl_right_rotate_crtos_safety_wit_3 : crtos_avl_right_rotate_crtos_safety_wit_3.
Axiom proof_of_crtos_avl_right_rotate_crtos_entail_wit_1 : crtos_avl_right_rotate_crtos_entail_wit_1.
Axiom proof_of_crtos_avl_right_rotate_crtos_entail_wit_2 : crtos_avl_right_rotate_crtos_entail_wit_2.
Axiom proof_of_crtos_avl_right_rotate_crtos_entail_wit_3 : crtos_avl_right_rotate_crtos_entail_wit_3.
Axiom proof_of_crtos_avl_right_rotate_crtos_entail_wit_4 : crtos_avl_right_rotate_crtos_entail_wit_4.
Axiom proof_of_crtos_avl_right_rotate_crtos_entail_wit_5 : crtos_avl_right_rotate_crtos_entail_wit_5.
Axiom proof_of_crtos_avl_right_rotate_crtos_return_wit_1 : crtos_avl_right_rotate_crtos_return_wit_1.
Axiom proof_of_crtos_avl_right_rotate_crtos_partial_solve_wit_1 : crtos_avl_right_rotate_crtos_partial_solve_wit_1.
Axiom proof_of_crtos_avl_right_rotate_crtos_partial_solve_wit_2_pure : crtos_avl_right_rotate_crtos_partial_solve_wit_2_pure.
Axiom proof_of_crtos_avl_right_rotate_crtos_partial_solve_wit_2 : crtos_avl_right_rotate_crtos_partial_solve_wit_2.
Axiom proof_of_crtos_avl_right_rotate_crtos_partial_solve_wit_3_pure : crtos_avl_right_rotate_crtos_partial_solve_wit_3_pure.
Axiom proof_of_crtos_avl_right_rotate_crtos_partial_solve_wit_3 : crtos_avl_right_rotate_crtos_partial_solve_wit_3.
Axiom proof_of_crtos_avl_left_rotate_crtos_safety_wit_1 : crtos_avl_left_rotate_crtos_safety_wit_1.
Axiom proof_of_crtos_avl_left_rotate_crtos_safety_wit_2 : crtos_avl_left_rotate_crtos_safety_wit_2.
Axiom proof_of_crtos_avl_left_rotate_crtos_safety_wit_3 : crtos_avl_left_rotate_crtos_safety_wit_3.
Axiom proof_of_crtos_avl_left_rotate_crtos_entail_wit_1 : crtos_avl_left_rotate_crtos_entail_wit_1.
Axiom proof_of_crtos_avl_left_rotate_crtos_entail_wit_2 : crtos_avl_left_rotate_crtos_entail_wit_2.
Axiom proof_of_crtos_avl_left_rotate_crtos_entail_wit_3 : crtos_avl_left_rotate_crtos_entail_wit_3.
Axiom proof_of_crtos_avl_left_rotate_crtos_entail_wit_4 : crtos_avl_left_rotate_crtos_entail_wit_4.
Axiom proof_of_crtos_avl_left_rotate_crtos_entail_wit_5 : crtos_avl_left_rotate_crtos_entail_wit_5.
Axiom proof_of_crtos_avl_left_rotate_crtos_return_wit_1 : crtos_avl_left_rotate_crtos_return_wit_1.
Axiom proof_of_crtos_avl_left_rotate_crtos_partial_solve_wit_1 : crtos_avl_left_rotate_crtos_partial_solve_wit_1.
Axiom proof_of_crtos_avl_left_rotate_crtos_partial_solve_wit_2_pure : crtos_avl_left_rotate_crtos_partial_solve_wit_2_pure.
Axiom proof_of_crtos_avl_left_rotate_crtos_partial_solve_wit_2 : crtos_avl_left_rotate_crtos_partial_solve_wit_2.
Axiom proof_of_crtos_avl_left_rotate_crtos_partial_solve_wit_3_pure : crtos_avl_left_rotate_crtos_partial_solve_wit_3_pure.
Axiom proof_of_crtos_avl_left_rotate_crtos_partial_solve_wit_3 : crtos_avl_left_rotate_crtos_partial_solve_wit_3.
Axiom proof_of_crtos_avl_lr_rotate_crtos_safety_wit_1 : crtos_avl_lr_rotate_crtos_safety_wit_1.
Axiom proof_of_crtos_avl_lr_rotate_crtos_safety_wit_2 : crtos_avl_lr_rotate_crtos_safety_wit_2.
Axiom proof_of_crtos_avl_lr_rotate_crtos_safety_wit_3 : crtos_avl_lr_rotate_crtos_safety_wit_3.
Axiom proof_of_crtos_avl_lr_rotate_crtos_safety_wit_4 : crtos_avl_lr_rotate_crtos_safety_wit_4.
Axiom proof_of_crtos_avl_lr_rotate_crtos_entail_wit_1 : crtos_avl_lr_rotate_crtos_entail_wit_1.
Axiom proof_of_crtos_avl_lr_rotate_crtos_entail_wit_2 : crtos_avl_lr_rotate_crtos_entail_wit_2.
Axiom proof_of_crtos_avl_lr_rotate_crtos_entail_wit_3 : crtos_avl_lr_rotate_crtos_entail_wit_3.
Axiom proof_of_crtos_avl_lr_rotate_crtos_entail_wit_4 : crtos_avl_lr_rotate_crtos_entail_wit_4.
Axiom proof_of_crtos_avl_lr_rotate_crtos_return_wit_1 : crtos_avl_lr_rotate_crtos_return_wit_1.
Axiom proof_of_crtos_avl_lr_rotate_crtos_partial_solve_wit_1_pure : crtos_avl_lr_rotate_crtos_partial_solve_wit_1_pure.
Axiom proof_of_crtos_avl_lr_rotate_crtos_partial_solve_wit_1 : crtos_avl_lr_rotate_crtos_partial_solve_wit_1.
Axiom proof_of_crtos_avl_lr_rotate_crtos_partial_solve_wit_2_pure : crtos_avl_lr_rotate_crtos_partial_solve_wit_2_pure.
Axiom proof_of_crtos_avl_lr_rotate_crtos_partial_solve_wit_2 : crtos_avl_lr_rotate_crtos_partial_solve_wit_2.
Axiom proof_of_crtos_avl_rl_rotate_crtos_safety_wit_1 : crtos_avl_rl_rotate_crtos_safety_wit_1.
Axiom proof_of_crtos_avl_rl_rotate_crtos_safety_wit_2 : crtos_avl_rl_rotate_crtos_safety_wit_2.
Axiom proof_of_crtos_avl_rl_rotate_crtos_safety_wit_3 : crtos_avl_rl_rotate_crtos_safety_wit_3.
Axiom proof_of_crtos_avl_rl_rotate_crtos_safety_wit_4 : crtos_avl_rl_rotate_crtos_safety_wit_4.
Axiom proof_of_crtos_avl_rl_rotate_crtos_entail_wit_1 : crtos_avl_rl_rotate_crtos_entail_wit_1.
Axiom proof_of_crtos_avl_rl_rotate_crtos_entail_wit_2 : crtos_avl_rl_rotate_crtos_entail_wit_2.
Axiom proof_of_crtos_avl_rl_rotate_crtos_entail_wit_3 : crtos_avl_rl_rotate_crtos_entail_wit_3.
Axiom proof_of_crtos_avl_rl_rotate_crtos_entail_wit_4 : crtos_avl_rl_rotate_crtos_entail_wit_4.
Axiom proof_of_crtos_avl_rl_rotate_crtos_return_wit_1 : crtos_avl_rl_rotate_crtos_return_wit_1.
Axiom proof_of_crtos_avl_rl_rotate_crtos_partial_solve_wit_1_pure : crtos_avl_rl_rotate_crtos_partial_solve_wit_1_pure.
Axiom proof_of_crtos_avl_rl_rotate_crtos_partial_solve_wit_1 : crtos_avl_rl_rotate_crtos_partial_solve_wit_1.
Axiom proof_of_crtos_avl_rl_rotate_crtos_partial_solve_wit_2_pure : crtos_avl_rl_rotate_crtos_partial_solve_wit_2_pure.
Axiom proof_of_crtos_avl_rl_rotate_crtos_partial_solve_wit_2 : crtos_avl_rl_rotate_crtos_partial_solve_wit_2.
Axiom proof_of_crtos_avl_balance_crtos_safety_wit_1 : crtos_avl_balance_crtos_safety_wit_1.
Axiom proof_of_crtos_avl_balance_crtos_safety_wit_2 : crtos_avl_balance_crtos_safety_wit_2.
Axiom proof_of_crtos_avl_balance_crtos_safety_wit_3 : crtos_avl_balance_crtos_safety_wit_3.
Axiom proof_of_crtos_avl_balance_crtos_safety_wit_4 : crtos_avl_balance_crtos_safety_wit_4.
Axiom proof_of_crtos_avl_balance_crtos_safety_wit_5 : crtos_avl_balance_crtos_safety_wit_5.
Axiom proof_of_crtos_avl_balance_crtos_safety_wit_6 : crtos_avl_balance_crtos_safety_wit_6.
Axiom proof_of_crtos_avl_balance_crtos_safety_wit_7 : crtos_avl_balance_crtos_safety_wit_7.
Axiom proof_of_crtos_avl_balance_crtos_safety_wit_8 : crtos_avl_balance_crtos_safety_wit_8.
Axiom proof_of_crtos_avl_balance_crtos_safety_wit_9 : crtos_avl_balance_crtos_safety_wit_9.
Axiom proof_of_crtos_avl_balance_crtos_safety_wit_10 : crtos_avl_balance_crtos_safety_wit_10.
Axiom proof_of_crtos_avl_balance_crtos_safety_wit_11 : crtos_avl_balance_crtos_safety_wit_11.
Axiom proof_of_crtos_avl_balance_crtos_safety_wit_12 : crtos_avl_balance_crtos_safety_wit_12.
Axiom proof_of_crtos_avl_balance_crtos_safety_wit_13 : crtos_avl_balance_crtos_safety_wit_13.
Axiom proof_of_crtos_avl_balance_crtos_safety_wit_14 : crtos_avl_balance_crtos_safety_wit_14.
Axiom proof_of_crtos_avl_balance_crtos_entail_wit_1 : crtos_avl_balance_crtos_entail_wit_1.
Axiom proof_of_crtos_avl_balance_crtos_entail_wit_2 : crtos_avl_balance_crtos_entail_wit_2.
Axiom proof_of_crtos_avl_balance_crtos_entail_wit_3_1 : crtos_avl_balance_crtos_entail_wit_3_1.
Axiom proof_of_crtos_avl_balance_crtos_entail_wit_3_2 : crtos_avl_balance_crtos_entail_wit_3_2.
Axiom proof_of_crtos_avl_balance_crtos_entail_wit_4 : crtos_avl_balance_crtos_entail_wit_4.
Axiom proof_of_crtos_avl_balance_crtos_entail_wit_5_1 : crtos_avl_balance_crtos_entail_wit_5_1.
Axiom proof_of_crtos_avl_balance_crtos_entail_wit_5_2 : crtos_avl_balance_crtos_entail_wit_5_2.
Axiom proof_of_crtos_avl_balance_crtos_entail_wit_6 : crtos_avl_balance_crtos_entail_wit_6.
Axiom proof_of_crtos_avl_balance_crtos_return_wit_1 : crtos_avl_balance_crtos_return_wit_1.
Axiom proof_of_crtos_avl_balance_crtos_return_wit_2 : crtos_avl_balance_crtos_return_wit_2.
Axiom proof_of_crtos_avl_balance_crtos_return_wit_3 : crtos_avl_balance_crtos_return_wit_3.
Axiom proof_of_crtos_avl_balance_crtos_return_wit_4 : crtos_avl_balance_crtos_return_wit_4.
Axiom proof_of_crtos_avl_balance_crtos_return_wit_5 : crtos_avl_balance_crtos_return_wit_5.
Axiom proof_of_crtos_avl_balance_crtos_return_wit_6 : crtos_avl_balance_crtos_return_wit_6.
Axiom proof_of_crtos_avl_balance_crtos_partial_solve_wit_1_pure : crtos_avl_balance_crtos_partial_solve_wit_1_pure.
Axiom proof_of_crtos_avl_balance_crtos_partial_solve_wit_1 : crtos_avl_balance_crtos_partial_solve_wit_1.
Axiom proof_of_crtos_avl_balance_crtos_partial_solve_wit_2_pure : crtos_avl_balance_crtos_partial_solve_wit_2_pure.
Axiom proof_of_crtos_avl_balance_crtos_partial_solve_wit_2 : crtos_avl_balance_crtos_partial_solve_wit_2.
Axiom proof_of_crtos_avl_balance_crtos_partial_solve_wit_3_pure : crtos_avl_balance_crtos_partial_solve_wit_3_pure.
Axiom proof_of_crtos_avl_balance_crtos_partial_solve_wit_3 : crtos_avl_balance_crtos_partial_solve_wit_3.
Axiom proof_of_crtos_avl_balance_crtos_partial_solve_wit_4_pure : crtos_avl_balance_crtos_partial_solve_wit_4_pure.
Axiom proof_of_crtos_avl_balance_crtos_partial_solve_wit_4 : crtos_avl_balance_crtos_partial_solve_wit_4.
Axiom proof_of_crtos_avl_balance_crtos_partial_solve_wit_5_pure : crtos_avl_balance_crtos_partial_solve_wit_5_pure.
Axiom proof_of_crtos_avl_balance_crtos_partial_solve_wit_5 : crtos_avl_balance_crtos_partial_solve_wit_5.
Axiom proof_of_crtos_avl_balance_crtos_partial_solve_wit_6_pure : crtos_avl_balance_crtos_partial_solve_wit_6_pure.
Axiom proof_of_crtos_avl_balance_crtos_partial_solve_wit_6 : crtos_avl_balance_crtos_partial_solve_wit_6.
Axiom proof_of_crtos_avl_balance_crtos_partial_solve_wit_7_pure : crtos_avl_balance_crtos_partial_solve_wit_7_pure.
Axiom proof_of_crtos_avl_balance_crtos_partial_solve_wit_7 : crtos_avl_balance_crtos_partial_solve_wit_7.
Axiom proof_of_AvlTreeInsertNode_safety_wit_1 : AvlTreeInsertNode_safety_wit_1.
Axiom proof_of_AvlTreeInsertNode_safety_wit_2 : AvlTreeInsertNode_safety_wit_2.
Axiom proof_of_AvlTreeInsertNode_safety_wit_3 : AvlTreeInsertNode_safety_wit_3.
Axiom proof_of_AvlTreeInsertNode_safety_wit_4 : AvlTreeInsertNode_safety_wit_4.
Axiom proof_of_AvlTreeInsertNode_safety_wit_5 : AvlTreeInsertNode_safety_wit_5.
Axiom proof_of_AvlTreeInsertNode_safety_wit_6 : AvlTreeInsertNode_safety_wit_6.
Axiom proof_of_AvlTreeInsertNode_safety_wit_7 : AvlTreeInsertNode_safety_wit_7.
Axiom proof_of_AvlTreeInsertNode_safety_wit_8 : AvlTreeInsertNode_safety_wit_8.
Axiom proof_of_AvlTreeInsertNode_safety_wit_9 : AvlTreeInsertNode_safety_wit_9.
Axiom proof_of_AvlTreeInsertNode_safety_wit_10 : AvlTreeInsertNode_safety_wit_10.
Axiom proof_of_AvlTreeInsertNode_safety_wit_11 : AvlTreeInsertNode_safety_wit_11.
Axiom proof_of_AvlTreeInsertNode_safety_wit_12 : AvlTreeInsertNode_safety_wit_12.
Axiom proof_of_AvlTreeInsertNode_safety_wit_13 : AvlTreeInsertNode_safety_wit_13.
Axiom proof_of_AvlTreeInsertNode_safety_wit_14 : AvlTreeInsertNode_safety_wit_14.
Axiom proof_of_AvlTreeInsertNode_safety_wit_15 : AvlTreeInsertNode_safety_wit_15.
Axiom proof_of_AvlTreeInsertNode_safety_wit_16 : AvlTreeInsertNode_safety_wit_16.
Axiom proof_of_AvlTreeInsertNode_safety_wit_17 : AvlTreeInsertNode_safety_wit_17.
Axiom proof_of_AvlTreeInsertNode_safety_wit_18 : AvlTreeInsertNode_safety_wit_18.
Axiom proof_of_AvlTreeInsertNode_safety_wit_19 : AvlTreeInsertNode_safety_wit_19.
Axiom proof_of_AvlTreeInsertNode_safety_wit_20 : AvlTreeInsertNode_safety_wit_20.
Axiom proof_of_AvlTreeInsertNode_safety_wit_21 : AvlTreeInsertNode_safety_wit_21.
Axiom proof_of_AvlTreeInsertNode_entail_wit_1 : AvlTreeInsertNode_entail_wit_1.
Axiom proof_of_AvlTreeInsertNode_entail_wit_2 : AvlTreeInsertNode_entail_wit_2.
Axiom proof_of_AvlTreeInsertNode_entail_wit_3 : AvlTreeInsertNode_entail_wit_3.
Axiom proof_of_AvlTreeInsertNode_entail_wit_4_1 : AvlTreeInsertNode_entail_wit_4_1.
Axiom proof_of_AvlTreeInsertNode_entail_wit_4_2 : AvlTreeInsertNode_entail_wit_4_2.
Axiom proof_of_AvlTreeInsertNode_entail_wit_4_3 : AvlTreeInsertNode_entail_wit_4_3.
Axiom proof_of_AvlTreeInsertNode_return_wit_1 : AvlTreeInsertNode_return_wit_1.
Axiom proof_of_AvlTreeInsertNode_return_wit_2 : AvlTreeInsertNode_return_wit_2.
Axiom proof_of_AvlTreeInsertNode_return_wit_3 : AvlTreeInsertNode_return_wit_3.
Axiom proof_of_AvlTreeInsertNode_return_wit_4 : AvlTreeInsertNode_return_wit_4.
Axiom proof_of_AvlTreeInsertNode_return_wit_5 : AvlTreeInsertNode_return_wit_5.
Axiom proof_of_AvlTreeInsertNode_partial_solve_wit_1_pure : AvlTreeInsertNode_partial_solve_wit_1_pure.
Axiom proof_of_AvlTreeInsertNode_partial_solve_wit_1 : AvlTreeInsertNode_partial_solve_wit_1.
Axiom proof_of_AvlTreeInsertNode_partial_solve_wit_2_pure : AvlTreeInsertNode_partial_solve_wit_2_pure.
Axiom proof_of_AvlTreeInsertNode_partial_solve_wit_2 : AvlTreeInsertNode_partial_solve_wit_2.
Axiom proof_of_AvlTreeInsertNode_partial_solve_wit_3_pure : AvlTreeInsertNode_partial_solve_wit_3_pure.
Axiom proof_of_AvlTreeInsertNode_partial_solve_wit_3 : AvlTreeInsertNode_partial_solve_wit_3.
Axiom proof_of_AvlTreeInsertNode_partial_solve_wit_4_pure : AvlTreeInsertNode_partial_solve_wit_4_pure.
Axiom proof_of_AvlTreeInsertNode_partial_solve_wit_4 : AvlTreeInsertNode_partial_solve_wit_4.
Axiom proof_of_AvlTreeInsertNode_partial_solve_wit_5_pure : AvlTreeInsertNode_partial_solve_wit_5_pure.
Axiom proof_of_AvlTreeInsertNode_partial_solve_wit_5 : AvlTreeInsertNode_partial_solve_wit_5.
Axiom proof_of_AvlTreeInsertNode_partial_solve_wit_6_pure : AvlTreeInsertNode_partial_solve_wit_6_pure.
Axiom proof_of_AvlTreeInsertNode_partial_solve_wit_6 : AvlTreeInsertNode_partial_solve_wit_6.
Axiom proof_of_AvlTreeInsertNode_partial_solve_wit_7_pure : AvlTreeInsertNode_partial_solve_wit_7_pure.
Axiom proof_of_AvlTreeInsertNode_partial_solve_wit_7 : AvlTreeInsertNode_partial_solve_wit_7.
Axiom proof_of_AvlTreeInsertNode_partial_solve_wit_8_pure : AvlTreeInsertNode_partial_solve_wit_8_pure.
Axiom proof_of_AvlTreeInsertNode_partial_solve_wit_8 : AvlTreeInsertNode_partial_solve_wit_8.
Axiom proof_of_AvlTreeInsertNode_partial_solve_wit_9_pure : AvlTreeInsertNode_partial_solve_wit_9_pure.
Axiom proof_of_AvlTreeInsertNode_partial_solve_wit_9 : AvlTreeInsertNode_partial_solve_wit_9.
Axiom proof_of_AvlTreeDeleteNode_safety_wit_1 : AvlTreeDeleteNode_safety_wit_1.
Axiom proof_of_AvlTreeDeleteNode_safety_wit_2 : AvlTreeDeleteNode_safety_wit_2.
Axiom proof_of_AvlTreeDeleteNode_safety_wit_3 : AvlTreeDeleteNode_safety_wit_3.
Axiom proof_of_AvlTreeDeleteNode_safety_wit_4 : AvlTreeDeleteNode_safety_wit_4.
Axiom proof_of_AvlTreeDeleteNode_safety_wit_5 : AvlTreeDeleteNode_safety_wit_5.
Axiom proof_of_AvlTreeDeleteNode_safety_wit_6 : AvlTreeDeleteNode_safety_wit_6.
Axiom proof_of_AvlTreeDeleteNode_safety_wit_7 : AvlTreeDeleteNode_safety_wit_7.
Axiom proof_of_AvlTreeDeleteNode_safety_wit_8 : AvlTreeDeleteNode_safety_wit_8.
Axiom proof_of_AvlTreeDeleteNode_safety_wit_9 : AvlTreeDeleteNode_safety_wit_9.
Axiom proof_of_AvlTreeDeleteNode_safety_wit_10 : AvlTreeDeleteNode_safety_wit_10.
Axiom proof_of_AvlTreeDeleteNode_safety_wit_11 : AvlTreeDeleteNode_safety_wit_11.
Axiom proof_of_AvlTreeDeleteNode_safety_wit_12 : AvlTreeDeleteNode_safety_wit_12.
Axiom proof_of_AvlTreeDeleteNode_safety_wit_13 : AvlTreeDeleteNode_safety_wit_13.
Axiom proof_of_AvlTreeDeleteNode_safety_wit_14 : AvlTreeDeleteNode_safety_wit_14.
Axiom proof_of_AvlTreeDeleteNode_entail_wit_1 : AvlTreeDeleteNode_entail_wit_1.
Axiom proof_of_AvlTreeDeleteNode_entail_wit_2 : AvlTreeDeleteNode_entail_wit_2.
Axiom proof_of_AvlTreeDeleteNode_entail_wit_3_1 : AvlTreeDeleteNode_entail_wit_3_1.
Axiom proof_of_AvlTreeDeleteNode_entail_wit_3_2 : AvlTreeDeleteNode_entail_wit_3_2.
Axiom proof_of_AvlTreeDeleteNode_entail_wit_4_1 : AvlTreeDeleteNode_entail_wit_4_1.
Axiom proof_of_AvlTreeDeleteNode_entail_wit_4_2 : AvlTreeDeleteNode_entail_wit_4_2.
Axiom proof_of_AvlTreeDeleteNode_entail_wit_5 : AvlTreeDeleteNode_entail_wit_5.
Axiom proof_of_AvlTreeDeleteNode_entail_wit_6 : AvlTreeDeleteNode_entail_wit_6.
Axiom proof_of_AvlTreeDeleteNode_entail_wit_7 : AvlTreeDeleteNode_entail_wit_7.
Axiom proof_of_AvlTreeDeleteNode_entail_wit_8 : AvlTreeDeleteNode_entail_wit_8.
Axiom proof_of_AvlTreeDeleteNode_entail_wit_9 : AvlTreeDeleteNode_entail_wit_9.
Axiom proof_of_AvlTreeDeleteNode_entail_wit_10 : AvlTreeDeleteNode_entail_wit_10.
Axiom proof_of_AvlTreeDeleteNode_entail_wit_11_1 : AvlTreeDeleteNode_entail_wit_11_1.
Axiom proof_of_AvlTreeDeleteNode_entail_wit_11_2 : AvlTreeDeleteNode_entail_wit_11_2.
Axiom proof_of_AvlTreeDeleteNode_entail_wit_11_3 : AvlTreeDeleteNode_entail_wit_11_3.
Axiom proof_of_AvlTreeDeleteNode_return_wit_1 : AvlTreeDeleteNode_return_wit_1.
Axiom proof_of_AvlTreeDeleteNode_return_wit_2 : AvlTreeDeleteNode_return_wit_2.
Axiom proof_of_AvlTreeDeleteNode_return_wit_3 : AvlTreeDeleteNode_return_wit_3.
Axiom proof_of_AvlTreeDeleteNode_return_wit_4 : AvlTreeDeleteNode_return_wit_4.
Axiom proof_of_AvlTreeDeleteNode_return_wit_5 : AvlTreeDeleteNode_return_wit_5.
Axiom proof_of_AvlTreeDeleteNode_partial_solve_wit_1_pure : AvlTreeDeleteNode_partial_solve_wit_1_pure.
Axiom proof_of_AvlTreeDeleteNode_partial_solve_wit_1 : AvlTreeDeleteNode_partial_solve_wit_1.
Axiom proof_of_AvlTreeDeleteNode_partial_solve_wit_2_pure : AvlTreeDeleteNode_partial_solve_wit_2_pure.
Axiom proof_of_AvlTreeDeleteNode_partial_solve_wit_2 : AvlTreeDeleteNode_partial_solve_wit_2.
Axiom proof_of_AvlTreeDeleteNode_partial_solve_wit_3_pure : AvlTreeDeleteNode_partial_solve_wit_3_pure.
Axiom proof_of_AvlTreeDeleteNode_partial_solve_wit_3 : AvlTreeDeleteNode_partial_solve_wit_3.
Axiom proof_of_AvlTreeDeleteNode_partial_solve_wit_4_pure : AvlTreeDeleteNode_partial_solve_wit_4_pure.
Axiom proof_of_AvlTreeDeleteNode_partial_solve_wit_4 : AvlTreeDeleteNode_partial_solve_wit_4.
Axiom proof_of_AvlTreeDeleteNode_partial_solve_wit_5_pure : AvlTreeDeleteNode_partial_solve_wit_5_pure.
Axiom proof_of_AvlTreeDeleteNode_partial_solve_wit_5 : AvlTreeDeleteNode_partial_solve_wit_5.
Axiom proof_of_AvlTreeDeleteNode_partial_solve_wit_6_pure : AvlTreeDeleteNode_partial_solve_wit_6_pure.
Axiom proof_of_AvlTreeDeleteNode_partial_solve_wit_6 : AvlTreeDeleteNode_partial_solve_wit_6.
Axiom proof_of_AvlTreeDeleteNode_partial_solve_wit_7_pure : AvlTreeDeleteNode_partial_solve_wit_7_pure.
Axiom proof_of_AvlTreeDeleteNode_partial_solve_wit_7 : AvlTreeDeleteNode_partial_solve_wit_7.
Axiom proof_of_AvlTreeDeleteNode_partial_solve_wit_8_pure : AvlTreeDeleteNode_partial_solve_wit_8_pure.
Axiom proof_of_AvlTreeDeleteNode_partial_solve_wit_8 : AvlTreeDeleteNode_partial_solve_wit_8.
Axiom proof_of_AvlTreeDeleteNode_partial_solve_wit_9_pure : AvlTreeDeleteNode_partial_solve_wit_9_pure.
Axiom proof_of_AvlTreeDeleteNode_partial_solve_wit_9 : AvlTreeDeleteNode_partial_solve_wit_9.
Axiom proof_of_AvlTreeDeleteNode_partial_solve_wit_10_pure : AvlTreeDeleteNode_partial_solve_wit_10_pure.
Axiom proof_of_AvlTreeDeleteNode_partial_solve_wit_10 : AvlTreeDeleteNode_partial_solve_wit_10.
Axiom proof_of_AvlTreeDeleteNode_partial_solve_wit_11_pure : AvlTreeDeleteNode_partial_solve_wit_11_pure.
Axiom proof_of_AvlTreeDeleteNode_partial_solve_wit_11 : AvlTreeDeleteNode_partial_solve_wit_11.
Axiom proof_of_AvlTreeDeleteNode_partial_solve_wit_12_pure : AvlTreeDeleteNode_partial_solve_wit_12_pure.
Axiom proof_of_AvlTreeDeleteNode_partial_solve_wit_12 : AvlTreeDeleteNode_partial_solve_wit_12.
Axiom proof_of_AvlTreeDeleteNode_partial_solve_wit_13_pure : AvlTreeDeleteNode_partial_solve_wit_13_pure.
Axiom proof_of_AvlTreeDeleteNode_partial_solve_wit_13 : AvlTreeDeleteNode_partial_solve_wit_13.
Axiom proof_of_AvlNodeModifyNode_safety_wit_1 : AvlNodeModifyNode_safety_wit_1.
Axiom proof_of_AvlNodeModifyNode_safety_wit_2 : AvlNodeModifyNode_safety_wit_2.
Axiom proof_of_AvlNodeModifyNode_safety_wit_3 : AvlNodeModifyNode_safety_wit_3.
Axiom proof_of_AvlNodeModifyNode_entail_wit_1 : AvlNodeModifyNode_entail_wit_1.
Axiom proof_of_AvlNodeModifyNode_entail_wit_2 : AvlNodeModifyNode_entail_wit_2.
Axiom proof_of_AvlNodeModifyNode_return_wit_1 : AvlNodeModifyNode_return_wit_1.
Axiom proof_of_AvlNodeModifyNode_return_wit_2 : AvlNodeModifyNode_return_wit_2.
Axiom proof_of_AvlNodeModifyNode_partial_solve_wit_1_pure : AvlNodeModifyNode_partial_solve_wit_1_pure.
Axiom proof_of_AvlNodeModifyNode_partial_solve_wit_1 : AvlNodeModifyNode_partial_solve_wit_1.
Axiom proof_of_AvlNodeModifyNode_partial_solve_wit_2_pure : AvlNodeModifyNode_partial_solve_wit_2_pure.
Axiom proof_of_AvlNodeModifyNode_partial_solve_wit_2 : AvlNodeModifyNode_partial_solve_wit_2.
Axiom proof_of_AvlNodeModifyNode_partial_solve_wit_3_pure : AvlNodeModifyNode_partial_solve_wit_3_pure.
Axiom proof_of_AvlNodeModifyNode_partial_solve_wit_3 : AvlNodeModifyNode_partial_solve_wit_3.
Axiom proof_of_AvlNodeSearchNode_safety_wit_1 : AvlNodeSearchNode_safety_wit_1.
Axiom proof_of_AvlNodeSearchNode_safety_wit_2 : AvlNodeSearchNode_safety_wit_2.
Axiom proof_of_AvlNodeSearchNode_safety_wit_3 : AvlNodeSearchNode_safety_wit_3.
Axiom proof_of_AvlNodeSearchNode_safety_wit_4 : AvlNodeSearchNode_safety_wit_4.
Axiom proof_of_AvlNodeSearchNode_entail_wit_1 : AvlNodeSearchNode_entail_wit_1.
Axiom proof_of_AvlNodeSearchNode_entail_wit_2 : AvlNodeSearchNode_entail_wit_2.
Axiom proof_of_AvlNodeSearchNode_entail_wit_3 : AvlNodeSearchNode_entail_wit_3.
Axiom proof_of_AvlNodeSearchNode_entail_wit_4 : AvlNodeSearchNode_entail_wit_4.
Axiom proof_of_AvlNodeSearchNode_entail_wit_5_1 : AvlNodeSearchNode_entail_wit_5_1.
Axiom proof_of_AvlNodeSearchNode_entail_wit_5_2 : AvlNodeSearchNode_entail_wit_5_2.
Axiom proof_of_AvlNodeSearchNode_entail_wit_5_3 : AvlNodeSearchNode_entail_wit_5_3.
Axiom proof_of_AvlNodeSearchNode_return_wit_1 : AvlNodeSearchNode_return_wit_1.
Axiom proof_of_AvlNodeSearchNode_return_wit_2 : AvlNodeSearchNode_return_wit_2.
Axiom proof_of_AvlNodeSearchNode_return_wit_3 : AvlNodeSearchNode_return_wit_3.
Axiom proof_of_AvlNodeSearchNode_return_wit_4 : AvlNodeSearchNode_return_wit_4.
Axiom proof_of_AvlNodeSearchNode_partial_solve_wit_1_pure : AvlNodeSearchNode_partial_solve_wit_1_pure.
Axiom proof_of_AvlNodeSearchNode_partial_solve_wit_1 : AvlNodeSearchNode_partial_solve_wit_1.
Axiom proof_of_AvlNodeSearchNode_partial_solve_wit_2_pure : AvlNodeSearchNode_partial_solve_wit_2_pure.
Axiom proof_of_AvlNodeSearchNode_partial_solve_wit_2 : AvlNodeSearchNode_partial_solve_wit_2.
Axiom proof_of_AvlNodeSearchNode_partial_solve_wit_3_pure : AvlNodeSearchNode_partial_solve_wit_3_pure.
Axiom proof_of_AvlNodeSearchNode_partial_solve_wit_3 : AvlNodeSearchNode_partial_solve_wit_3.
Axiom proof_of_AvlNodeSearchNode_partial_solve_wit_4_pure : AvlNodeSearchNode_partial_solve_wit_4_pure.
Axiom proof_of_AvlNodeSearchNode_partial_solve_wit_4 : AvlNodeSearchNode_partial_solve_wit_4.
Axiom proof_of_AvlNodeSearchNode_derive_high_level_spec_by_low_level_spec : AvlNodeSearchNode_derive_high_level_spec_by_low_level_spec.
Axiom proof_of_AvlNodeModifyNode_derive_high_level_spec_by_low_level_spec : AvlNodeModifyNode_derive_high_level_spec_by_low_level_spec.
Axiom proof_of_AvlTreeDeleteNode_derive_cursor_level_spec_by_low_level_spec : AvlTreeDeleteNode_derive_cursor_level_spec_by_low_level_spec.
Axiom proof_of_AvlTreeDeleteNode_derive_high_level_spec_by_low_level_spec : AvlTreeDeleteNode_derive_high_level_spec_by_low_level_spec.
Axiom proof_of_AvlTreeInsertNode_derive_high_level_spec_by_low_level_spec : AvlTreeInsertNode_derive_high_level_spec_by_low_level_spec.

End VC_Correct.
