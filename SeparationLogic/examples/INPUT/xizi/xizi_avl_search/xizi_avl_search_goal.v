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

(*----- Function xizi_avl_search -----*)

Definition xizi_avl_search_safety_wit_1 := 
forall (data_pre: Z) (avl_node_pre: Z) (g_low_level_spec: avl_model) (PreH1 : (avl_tree_valid g_low_level_spec )) (PreH2 : (avl_search_cursor_valid g_low_level_spec avl_node_pre data_pre )) ,
  ((( &( "destination_node" ) )) # Ptr  |->_)
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  (avl_subtree_store_at g_low_level_spec avl_node_pre )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition xizi_avl_search_safety_wit_2 := 
forall (data_pre: Z) (avl_node_pre: Z) (g_low_level_spec: avl_model) (PreH1 : (INT_MIN <= data_pre)) (PreH2 : (data_pre <= INT_MAX)) (PreH3 : (avl_tree_valid g_low_level_spec )) (PreH4 : (avl_search_cursor_valid g_low_level_spec avl_node_pre data_pre )) ,
  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "destination_node" ) )) # Ptr  |-> 0)
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  (avl_subtree_store_at g_low_level_spec avl_node_pre )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition xizi_avl_search_safety_wit_3 := 
forall (data_pre: Z) (avl_node_pre: Z) (g_low_level_spec: avl_model) (PreH1 : (avl_node_pre = 0)) (PreH2 : (INT_MIN <= data_pre)) (PreH3 : (data_pre <= INT_MAX)) (PreH4 : (avl_tree_valid g_low_level_spec )) (PreH5 : (avl_search_cursor_valid g_low_level_spec avl_node_pre data_pre )) ,
  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "destination_node" ) )) # Ptr  |-> 0)
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  (avl_subtree_store_at g_low_level_spec avl_node_pre )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition xizi_avl_search_entail_wit_1 := 
forall (data_pre: Z) (avl_node_pre: Z) (g_low_level_spec: avl_model) (PreH1 : (avl_tree_valid g_low_level_spec )) (PreH2 : (avl_search_cursor_valid g_low_level_spec avl_node_pre data_pre )) ,
  ((( &( "destination_node" ) )) # Ptr  |-> 0)
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  (avl_subtree_store_at g_low_level_spec avl_node_pre )
|--
  “ (INT_MIN <= data_pre) ” 
  &&  “ (data_pre <= INT_MAX) ” 
  &&  “ (avl_tree_valid g_low_level_spec ) ” 
  &&  “ (avl_search_cursor_valid g_low_level_spec avl_node_pre data_pre ) ”
  &&  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "destination_node" ) )) # Ptr  |-> 0)
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  (avl_subtree_store_at g_low_level_spec avl_node_pre )
.

Definition xizi_avl_search_entail_wit_2 := 
(
forall (data_pre: Z) (avl_node_pre: Z) (g_low_level_spec: avl_model) (PreH1 : (avl_node_pre <> 0)) (PreH2 : (INT_MIN <= data_pre)) (PreH3 : (data_pre <= INT_MAX)) (PreH4 : (avl_tree_valid g_low_level_spec )) (PreH5 : (avl_search_cursor_valid g_low_level_spec avl_node_pre data_pre )) ,
  (avl_subtree_store_at g_low_level_spec avl_node_pre )
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
) \/
(
forall (data_pre: Z) (avl_node_pre: Z) (g_low_level_spec: avl_model) (PreH1 : (avl_node_pre <> 0)) (PreH2 : (INT_MIN <= data_pre)) (PreH3 : (data_pre <= INT_MAX)) (PreH4 : (avl_tree_valid g_low_level_spec )) (PreH5 : (avl_search_cursor_valid g_low_level_spec avl_node_pre data_pre )) ,
  (avl_subtree_store_at g_low_level_spec avl_node_pre )
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
).

Definition xizi_avl_search_entail_wit_2_split_goal_1 := 
forall (data_pre: Z) (avl_node_pre: Z) (g_low_level_spec: avl_model) (PreH1 : (avl_node_pre <> 0)) (PreH2 : (INT_MIN <= data_pre)) (PreH3 : (data_pre <= INT_MAX)) (PreH4 : (avl_tree_valid g_low_level_spec )) (PreH5 : (avl_search_cursor_valid g_low_level_spec avl_node_pre data_pre )) ,
  (avl_subtree_store_at g_low_level_spec avl_node_pre )
|--
  “ ((avl_height_of (g_low_level_spec) (avl_node_pre)) <= UINT_MAX) ”
.

Definition xizi_avl_search_entail_wit_2_split_goal_2 := 
forall (data_pre: Z) (avl_node_pre: Z) (g_low_level_spec: avl_model) (PreH1 : (avl_node_pre <> 0)) (PreH2 : (INT_MIN <= data_pre)) (PreH3 : (data_pre <= INT_MAX)) (PreH4 : (avl_tree_valid g_low_level_spec )) (PreH5 : (avl_search_cursor_valid g_low_level_spec avl_node_pre data_pre )) ,
  (avl_subtree_store_at g_low_level_spec avl_node_pre )
|--
  “ (0 <= (avl_height_of (g_low_level_spec) (avl_node_pre))) ”
.

Definition xizi_avl_search_entail_wit_2_split_goal_3 := 
forall (data_pre: Z) (avl_node_pre: Z) (g_low_level_spec: avl_model) (PreH1 : (avl_node_pre <> 0)) (PreH2 : (INT_MIN <= data_pre)) (PreH3 : (data_pre <= INT_MAX)) (PreH4 : (avl_tree_valid g_low_level_spec )) (PreH5 : (avl_search_cursor_valid g_low_level_spec avl_node_pre data_pre )) ,
  (avl_subtree_store_at g_low_level_spec avl_node_pre )
|--
  “ ((avl_key_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX) ”
.

Definition xizi_avl_search_entail_wit_2_split_goal_4 := 
forall (data_pre: Z) (avl_node_pre: Z) (g_low_level_spec: avl_model) (PreH1 : (avl_node_pre <> 0)) (PreH2 : (INT_MIN <= data_pre)) (PreH3 : (data_pre <= INT_MAX)) (PreH4 : (avl_tree_valid g_low_level_spec )) (PreH5 : (avl_search_cursor_valid g_low_level_spec avl_node_pre data_pre )) ,
  (avl_subtree_store_at g_low_level_spec avl_node_pre )
|--
  “ (INT_MIN <= (avl_key_of (g_low_level_spec) (avl_node_pre))) ”
.

Definition xizi_avl_search_entail_wit_2_split_goal_5 := 
forall (data_pre: Z) (avl_node_pre: Z) (g_low_level_spec: avl_model) (PreH1 : (avl_node_pre <> 0)) (PreH2 : (INT_MIN <= data_pre)) (PreH3 : (data_pre <= INT_MAX)) (PreH4 : (avl_tree_valid g_low_level_spec )) (PreH5 : (avl_search_cursor_valid g_low_level_spec avl_node_pre data_pre )) ,
  (avl_subtree_store_at g_low_level_spec avl_node_pre )
|--
  “ (avl_vvalid g_low_level_spec avl_node_pre ) ”
.

Definition xizi_avl_search_entail_wit_2_split_goal_spatial := 
forall (data_pre: Z) (avl_node_pre: Z) (g_low_level_spec: avl_model) (PreH1 : (avl_node_pre <> 0)) (PreH2 : (INT_MIN <= data_pre)) (PreH3 : (data_pre <= INT_MAX)) (PreH4 : (avl_tree_valid g_low_level_spec )) (PreH5 : (avl_search_cursor_valid g_low_level_spec avl_node_pre data_pre )) ,
  (avl_subtree_store_at g_low_level_spec avl_node_pre )
|--
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
.

Definition xizi_avl_search_entail_wit_3 := 
(
forall (data_pre: Z) (avl_node_pre: Z) (g_low_level_spec: avl_model) (PreH1 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) < data_pre)) (PreH2 : (data_pre <> (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH3 : (INT_MIN <= data_pre)) (PreH4 : (data_pre <= INT_MAX)) (PreH5 : (avl_tree_valid g_low_level_spec )) (PreH6 : (avl_vvalid g_low_level_spec avl_node_pre )) (PreH7 : (avl_node_pre <> 0)) (PreH8 : (INT_MIN <= (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH9 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH10 : (0 <= (avl_height_of (g_low_level_spec) (avl_node_pre)))) (PreH11 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH12 : (avl_search_cursor_valid g_low_level_spec avl_node_pre data_pre )) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
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
) \/
(
forall (data_pre: Z) (avl_node_pre: Z) (g_low_level_spec: avl_model) (PreH1 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) < data_pre)) (PreH2 : (data_pre <> (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH3 : (INT_MIN <= data_pre)) (PreH4 : (data_pre <= INT_MAX)) (PreH5 : (avl_tree_valid g_low_level_spec )) (PreH6 : (avl_vvalid g_low_level_spec avl_node_pre )) (PreH7 : (avl_node_pre <> 0)) (PreH8 : (INT_MIN <= (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH9 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH10 : (0 <= (avl_height_of (g_low_level_spec) (avl_node_pre)))) (PreH11 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH12 : (avl_search_cursor_valid g_low_level_spec avl_node_pre data_pre )) ,
  TT && emp 
|--
  “ (avl_search_cursor_valid g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) data_pre ) ”
  &&  emp
).

Definition xizi_avl_search_entail_wit_3_split_goal_1 := 
forall (data_pre: Z) (avl_node_pre: Z) (g_low_level_spec: avl_model) (PreH1 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) < data_pre)) (PreH2 : (data_pre <> (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH3 : (INT_MIN <= data_pre)) (PreH4 : (data_pre <= INT_MAX)) (PreH5 : (avl_tree_valid g_low_level_spec )) (PreH6 : (avl_vvalid g_low_level_spec avl_node_pre )) (PreH7 : (avl_node_pre <> 0)) (PreH8 : (INT_MIN <= (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH9 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH10 : (0 <= (avl_height_of (g_low_level_spec) (avl_node_pre)))) (PreH11 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH12 : (avl_search_cursor_valid g_low_level_spec avl_node_pre data_pre )) ,
  (avl_search_cursor_valid g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) data_pre )
.

Definition xizi_avl_search_entail_wit_4 := 
(
forall (data_pre: Z) (avl_node_pre: Z) (g_low_level_spec: avl_model) (PreH1 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) >= data_pre)) (PreH2 : (data_pre <> (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH3 : (INT_MIN <= data_pre)) (PreH4 : (data_pre <= INT_MAX)) (PreH5 : (avl_tree_valid g_low_level_spec )) (PreH6 : (avl_vvalid g_low_level_spec avl_node_pre )) (PreH7 : (avl_node_pre <> 0)) (PreH8 : (INT_MIN <= (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH9 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH10 : (0 <= (avl_height_of (g_low_level_spec) (avl_node_pre)))) (PreH11 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH12 : (avl_search_cursor_valid g_low_level_spec avl_node_pre data_pre )) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
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
) \/
(
forall (data_pre: Z) (avl_node_pre: Z) (g_low_level_spec: avl_model) (PreH1 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) >= data_pre)) (PreH2 : (data_pre <> (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH3 : (INT_MIN <= data_pre)) (PreH4 : (data_pre <= INT_MAX)) (PreH5 : (avl_tree_valid g_low_level_spec )) (PreH6 : (avl_vvalid g_low_level_spec avl_node_pre )) (PreH7 : (avl_node_pre <> 0)) (PreH8 : (INT_MIN <= (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH9 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH10 : (0 <= (avl_height_of (g_low_level_spec) (avl_node_pre)))) (PreH11 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH12 : (avl_search_cursor_valid g_low_level_spec avl_node_pre data_pre )) ,
  TT && emp 
|--
  “ (avl_search_cursor_valid g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) data_pre ) ” 
  &&  “ (data_pre < (avl_key_of (g_low_level_spec) (avl_node_pre))) ”
  &&  emp
).

Definition xizi_avl_search_entail_wit_4_split_goal_1 := 
forall (data_pre: Z) (avl_node_pre: Z) (g_low_level_spec: avl_model) (PreH1 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) >= data_pre)) (PreH2 : (data_pre <> (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH3 : (INT_MIN <= data_pre)) (PreH4 : (data_pre <= INT_MAX)) (PreH5 : (avl_tree_valid g_low_level_spec )) (PreH6 : (avl_vvalid g_low_level_spec avl_node_pre )) (PreH7 : (avl_node_pre <> 0)) (PreH8 : (INT_MIN <= (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH9 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH10 : (0 <= (avl_height_of (g_low_level_spec) (avl_node_pre)))) (PreH11 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH12 : (avl_search_cursor_valid g_low_level_spec avl_node_pre data_pre )) ,
  (avl_search_cursor_valid g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) data_pre )
.

Definition xizi_avl_search_entail_wit_4_split_goal_2 := 
forall (data_pre: Z) (avl_node_pre: Z) (g_low_level_spec: avl_model) (PreH1 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) >= data_pre)) (PreH2 : (data_pre <> (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH3 : (INT_MIN <= data_pre)) (PreH4 : (data_pre <= INT_MAX)) (PreH5 : (avl_tree_valid g_low_level_spec )) (PreH6 : (avl_vvalid g_low_level_spec avl_node_pre )) (PreH7 : (avl_node_pre <> 0)) (PreH8 : (INT_MIN <= (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH9 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH10 : (0 <= (avl_height_of (g_low_level_spec) (avl_node_pre)))) (PreH11 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH12 : (avl_search_cursor_valid g_low_level_spec avl_node_pre data_pre )) ,
  (data_pre < (avl_key_of (g_low_level_spec) (avl_node_pre)))
.

Definition xizi_avl_search_entail_wit_5_1 := 
forall (data_pre: Z) (avl_node_pre: Z) (g_low_level_spec: avl_model) (PreH1 : (data_pre = (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH2 : (INT_MIN <= data_pre)) (PreH3 : (data_pre <= INT_MAX)) (PreH4 : (avl_tree_valid g_low_level_spec )) (PreH5 : (avl_vvalid g_low_level_spec avl_node_pre )) (PreH6 : (avl_node_pre <> 0)) (PreH7 : (INT_MIN <= (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH8 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH9 : (0 <= (avl_height_of (g_low_level_spec) (avl_node_pre)))) (PreH10 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH11 : (avl_search_cursor_valid g_low_level_spec avl_node_pre data_pre )) ,
  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "destination_node" ) )) # Ptr  |-> avl_node_pre)
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
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "destination_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
.

Definition xizi_avl_search_entail_wit_5_2 := 
forall (data_pre: Z) (avl_node_pre: Z) (g_low_level_spec: avl_model) (retval: Z) (PreH1 : (avl_search_result g_low_level_spec data_pre retval )) (PreH2 : (INT_MIN <= data_pre)) (PreH3 : (data_pre <= INT_MAX)) (PreH4 : (avl_tree_valid g_low_level_spec )) (PreH5 : (avl_vvalid g_low_level_spec avl_node_pre )) (PreH6 : (avl_node_pre <> 0)) (PreH7 : (INT_MIN <= (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH8 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH9 : (0 <= (avl_height_of (g_low_level_spec) (avl_node_pre)))) (PreH10 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH11 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) < data_pre)) (PreH12 : (avl_search_cursor_valid g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) data_pre )) ,
  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "destination_node" ) )) # Ptr  |-> retval)
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
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "destination_node" ) )) # Ptr  |-> retval)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
.

Definition xizi_avl_search_entail_wit_5_3 := 
forall (data_pre: Z) (avl_node_pre: Z) (g_low_level_spec: avl_model) (retval_2: Z) (PreH1 : (avl_search_result g_low_level_spec data_pre retval_2 )) (PreH2 : (INT_MIN <= data_pre)) (PreH3 : (data_pre <= INT_MAX)) (PreH4 : (avl_tree_valid g_low_level_spec )) (PreH5 : (avl_vvalid g_low_level_spec avl_node_pre )) (PreH6 : (avl_node_pre <> 0)) (PreH7 : (INT_MIN <= (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH8 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH9 : (0 <= (avl_height_of (g_low_level_spec) (avl_node_pre)))) (PreH10 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH11 : (data_pre < (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH12 : (avl_search_cursor_valid g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) data_pre )) ,
  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "destination_node" ) )) # Ptr  |-> retval_2)
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
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "destination_node" ) )) # Ptr  |-> retval_2)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
.

Definition xizi_avl_search_return_wit_1 := 
(
forall (data_pre: Z) (avl_node_pre: Z) (g_low_level_spec: avl_model) (PreH1 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) >= 0)) (PreH2 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH3 : (data_pre >= INT_MIN)) (PreH4 : (data_pre = (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH5 : (INT_MIN <= data_pre)) (PreH6 : (data_pre <= INT_MAX)) (PreH7 : (avl_tree_valid g_low_level_spec )) (PreH8 : (avl_vvalid g_low_level_spec avl_node_pre )) (PreH9 : (avl_node_pre <> 0)) (PreH10 : (INT_MIN <= (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH11 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH12 : (0 <= (avl_height_of (g_low_level_spec) (avl_node_pre)))) (PreH13 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH14 : (avl_search_cursor_valid g_low_level_spec avl_node_pre data_pre )) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
|--
  “ (avl_search_result g_low_level_spec data_pre avl_node_pre ) ”
  &&  (avl_subtree_store_at g_low_level_spec avl_node_pre )
) \/
(
forall (data_pre: Z) (avl_node_pre: Z) (g_low_level_spec: avl_model) (PreH1 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) >= 0)) (PreH2 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH3 : (data_pre >= INT_MIN)) (PreH4 : (data_pre = (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH5 : (INT_MIN <= data_pre)) (PreH6 : (data_pre <= INT_MAX)) (PreH7 : (avl_tree_valid g_low_level_spec )) (PreH8 : (avl_vvalid g_low_level_spec avl_node_pre )) (PreH9 : (avl_node_pre <> 0)) (PreH10 : (INT_MIN <= (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH11 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH12 : (0 <= (avl_height_of (g_low_level_spec) (avl_node_pre)))) (PreH13 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH14 : (avl_search_cursor_valid g_low_level_spec avl_node_pre data_pre )) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
|--
  “ (avl_search_result g_low_level_spec data_pre avl_node_pre ) ”
  &&  (avl_subtree_store_at g_low_level_spec avl_node_pre )
).

Definition xizi_avl_search_return_wit_1_split_goal_1 := 
forall (data_pre: Z) (avl_node_pre: Z) (g_low_level_spec: avl_model) (PreH1 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) >= 0)) (PreH2 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH3 : (data_pre >= INT_MIN)) (PreH4 : (data_pre = (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH5 : (INT_MIN <= data_pre)) (PreH6 : (data_pre <= INT_MAX)) (PreH7 : (avl_tree_valid g_low_level_spec )) (PreH8 : (avl_vvalid g_low_level_spec avl_node_pre )) (PreH9 : (avl_node_pre <> 0)) (PreH10 : (INT_MIN <= (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH11 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH12 : (0 <= (avl_height_of (g_low_level_spec) (avl_node_pre)))) (PreH13 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH14 : (avl_search_cursor_valid g_low_level_spec avl_node_pre data_pre )) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
|--
  “ (avl_search_result g_low_level_spec data_pre avl_node_pre ) ”
.

Definition xizi_avl_search_return_wit_1_split_goal_spatial := 
forall (data_pre: Z) (avl_node_pre: Z) (g_low_level_spec: avl_model) (PreH1 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) >= 0)) (PreH2 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH3 : (data_pre >= INT_MIN)) (PreH4 : (data_pre = (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH5 : (INT_MIN <= data_pre)) (PreH6 : (data_pre <= INT_MAX)) (PreH7 : (avl_tree_valid g_low_level_spec )) (PreH8 : (avl_vvalid g_low_level_spec avl_node_pre )) (PreH9 : (avl_node_pre <> 0)) (PreH10 : (INT_MIN <= (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH11 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH12 : (0 <= (avl_height_of (g_low_level_spec) (avl_node_pre)))) (PreH13 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH14 : (avl_search_cursor_valid g_low_level_spec avl_node_pre data_pre )) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
|--
  (avl_subtree_store_at g_low_level_spec avl_node_pre )
.

Definition xizi_avl_search_return_wit_2 := 
(
forall (data_pre: Z) (avl_node_pre: Z) (g_low_level_spec: avl_model) (retval: Z) (PreH1 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) >= 0)) (PreH2 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH3 : (data_pre >= INT_MIN)) (PreH4 : (avl_search_result g_low_level_spec data_pre retval )) (PreH5 : (INT_MIN <= data_pre)) (PreH6 : (data_pre <= INT_MAX)) (PreH7 : (avl_tree_valid g_low_level_spec )) (PreH8 : (avl_vvalid g_low_level_spec avl_node_pre )) (PreH9 : (avl_node_pre <> 0)) (PreH10 : (INT_MIN <= (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH11 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH12 : (0 <= (avl_height_of (g_low_level_spec) (avl_node_pre)))) (PreH13 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH14 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) < data_pre)) (PreH15 : (avl_search_cursor_valid g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) data_pre )) ,
  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
|--
  “ (avl_search_result g_low_level_spec data_pre retval ) ”
  &&  (avl_subtree_store_at g_low_level_spec avl_node_pre )
) \/
(
forall (data_pre: Z) (avl_node_pre: Z) (g_low_level_spec: avl_model) (retval: Z) (PreH1 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) >= 0)) (PreH2 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH3 : (data_pre >= INT_MIN)) (PreH4 : (avl_search_result g_low_level_spec data_pre retval )) (PreH5 : (INT_MIN <= data_pre)) (PreH6 : (data_pre <= INT_MAX)) (PreH7 : (avl_tree_valid g_low_level_spec )) (PreH8 : (avl_vvalid g_low_level_spec avl_node_pre )) (PreH9 : (avl_node_pre <> 0)) (PreH10 : (INT_MIN <= (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH11 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH12 : (0 <= (avl_height_of (g_low_level_spec) (avl_node_pre)))) (PreH13 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH14 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) < data_pre)) (PreH15 : (avl_search_cursor_valid g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) data_pre )) ,
  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
|--
  (avl_subtree_store_at g_low_level_spec avl_node_pre )
).

Definition xizi_avl_search_return_wit_2_split_goal_spatial := 
forall (data_pre: Z) (avl_node_pre: Z) (g_low_level_spec: avl_model) (retval: Z) (PreH1 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) >= 0)) (PreH2 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH3 : (data_pre >= INT_MIN)) (PreH4 : (avl_search_result g_low_level_spec data_pre retval )) (PreH5 : (INT_MIN <= data_pre)) (PreH6 : (data_pre <= INT_MAX)) (PreH7 : (avl_tree_valid g_low_level_spec )) (PreH8 : (avl_vvalid g_low_level_spec avl_node_pre )) (PreH9 : (avl_node_pre <> 0)) (PreH10 : (INT_MIN <= (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH11 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH12 : (0 <= (avl_height_of (g_low_level_spec) (avl_node_pre)))) (PreH13 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH14 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) < data_pre)) (PreH15 : (avl_search_cursor_valid g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) data_pre )) ,
  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
|--
  (avl_subtree_store_at g_low_level_spec avl_node_pre )
.

Definition xizi_avl_search_return_wit_3 := 
(
forall (data_pre: Z) (avl_node_pre: Z) (g_low_level_spec: avl_model) (retval: Z) (PreH1 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) >= 0)) (PreH2 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH3 : (data_pre >= INT_MIN)) (PreH4 : (avl_search_result g_low_level_spec data_pre retval )) (PreH5 : (INT_MIN <= data_pre)) (PreH6 : (data_pre <= INT_MAX)) (PreH7 : (avl_tree_valid g_low_level_spec )) (PreH8 : (avl_vvalid g_low_level_spec avl_node_pre )) (PreH9 : (avl_node_pre <> 0)) (PreH10 : (INT_MIN <= (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH11 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH12 : (0 <= (avl_height_of (g_low_level_spec) (avl_node_pre)))) (PreH13 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH14 : (data_pre < (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH15 : (avl_search_cursor_valid g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) data_pre )) ,
  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
|--
  “ (avl_search_result g_low_level_spec data_pre retval ) ”
  &&  (avl_subtree_store_at g_low_level_spec avl_node_pre )
) \/
(
forall (data_pre: Z) (avl_node_pre: Z) (g_low_level_spec: avl_model) (retval: Z) (PreH1 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) >= 0)) (PreH2 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH3 : (data_pre >= INT_MIN)) (PreH4 : (avl_search_result g_low_level_spec data_pre retval )) (PreH5 : (INT_MIN <= data_pre)) (PreH6 : (data_pre <= INT_MAX)) (PreH7 : (avl_tree_valid g_low_level_spec )) (PreH8 : (avl_vvalid g_low_level_spec avl_node_pre )) (PreH9 : (avl_node_pre <> 0)) (PreH10 : (INT_MIN <= (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH11 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH12 : (0 <= (avl_height_of (g_low_level_spec) (avl_node_pre)))) (PreH13 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH14 : (data_pre < (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH15 : (avl_search_cursor_valid g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) data_pre )) ,
  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
|--
  (avl_subtree_store_at g_low_level_spec avl_node_pre )
).

Definition xizi_avl_search_return_wit_3_split_goal_spatial := 
forall (data_pre: Z) (avl_node_pre: Z) (g_low_level_spec: avl_model) (retval: Z) (PreH1 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) >= 0)) (PreH2 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH3 : (data_pre >= INT_MIN)) (PreH4 : (avl_search_result g_low_level_spec data_pre retval )) (PreH5 : (INT_MIN <= data_pre)) (PreH6 : (data_pre <= INT_MAX)) (PreH7 : (avl_tree_valid g_low_level_spec )) (PreH8 : (avl_vvalid g_low_level_spec avl_node_pre )) (PreH9 : (avl_node_pre <> 0)) (PreH10 : (INT_MIN <= (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH11 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH12 : (0 <= (avl_height_of (g_low_level_spec) (avl_node_pre)))) (PreH13 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH14 : (data_pre < (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH15 : (avl_search_cursor_valid g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) data_pre )) ,
  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
|--
  (avl_subtree_store_at g_low_level_spec avl_node_pre )
.

Definition xizi_avl_search_return_wit_4 := 
(
forall (data_pre: Z) (avl_node_pre: Z) (g_low_level_spec: avl_model) (PreH1 : (avl_node_pre = 0)) (PreH2 : (INT_MIN <= data_pre)) (PreH3 : (data_pre <= INT_MAX)) (PreH4 : (avl_tree_valid g_low_level_spec )) (PreH5 : (avl_search_cursor_valid g_low_level_spec avl_node_pre data_pre )) ,
  (avl_subtree_store_at g_low_level_spec avl_node_pre )
|--
  “ (avl_search_result g_low_level_spec data_pre 0 ) ”
  &&  (avl_subtree_store_at g_low_level_spec avl_node_pre )
) \/
(
forall (data_pre: Z) (avl_node_pre: Z) (g_low_level_spec: avl_model) (PreH1 : (avl_node_pre = 0)) (PreH2 : (INT_MIN <= data_pre)) (PreH3 : (data_pre <= INT_MAX)) (PreH4 : (avl_tree_valid g_low_level_spec )) (PreH5 : (avl_search_cursor_valid g_low_level_spec avl_node_pre data_pre )) ,
  TT && emp 
|--
  “ (avl_search_result g_low_level_spec data_pre 0 ) ”
  &&  emp
).

Definition xizi_avl_search_return_wit_4_split_goal_1 := 
forall (data_pre: Z) (avl_node_pre: Z) (g_low_level_spec: avl_model) (PreH1 : (avl_node_pre = 0)) (PreH2 : (INT_MIN <= data_pre)) (PreH3 : (data_pre <= INT_MAX)) (PreH4 : (avl_tree_valid g_low_level_spec )) (PreH5 : (avl_search_cursor_valid g_low_level_spec avl_node_pre data_pre )) ,
  (avl_search_result g_low_level_spec data_pre 0 )
.

Definition xizi_avl_search_partial_solve_wit_1_pure := 
forall (data_pre: Z) (avl_node_pre: Z) (g_low_level_spec: avl_model) (PreH1 : (INT_MIN <= data_pre)) (PreH2 : (data_pre <= INT_MAX)) (PreH3 : (avl_tree_valid g_low_level_spec )) (PreH4 : (avl_vvalid g_low_level_spec avl_node_pre )) (PreH5 : (avl_node_pre <> 0)) (PreH6 : (INT_MIN <= (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH7 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH8 : (0 <= (avl_height_of (g_low_level_spec) (avl_node_pre)))) (PreH9 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH10 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) < data_pre)) (PreH11 : (avl_search_cursor_valid g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) data_pre )) ,
  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "destination_node" ) )) # Ptr  |-> 0)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
|--
  “ (avl_tree_valid g_low_level_spec ) ” 
  &&  “ (avl_search_cursor_valid g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) data_pre ) ”
.

Definition xizi_avl_search_partial_solve_wit_1_aux := 
forall (data_pre: Z) (avl_node_pre: Z) (g_low_level_spec: avl_model) (PreH1 : (INT_MIN <= data_pre)) (PreH2 : (data_pre <= INT_MAX)) (PreH3 : (avl_tree_valid g_low_level_spec )) (PreH4 : (avl_vvalid g_low_level_spec avl_node_pre )) (PreH5 : (avl_node_pre <> 0)) (PreH6 : (INT_MIN <= (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH7 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH8 : (0 <= (avl_height_of (g_low_level_spec) (avl_node_pre)))) (PreH9 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH10 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) < data_pre)) (PreH11 : (avl_search_cursor_valid g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) data_pre )) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
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
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
.

Definition xizi_avl_search_partial_solve_wit_1 := xizi_avl_search_partial_solve_wit_1_pure -> xizi_avl_search_partial_solve_wit_1_aux.

Definition xizi_avl_search_partial_solve_wit_2_pure := 
forall (data_pre: Z) (avl_node_pre: Z) (g_low_level_spec: avl_model) (PreH1 : (INT_MIN <= data_pre)) (PreH2 : (data_pre <= INT_MAX)) (PreH3 : (avl_tree_valid g_low_level_spec )) (PreH4 : (avl_vvalid g_low_level_spec avl_node_pre )) (PreH5 : (avl_node_pre <> 0)) (PreH6 : (INT_MIN <= (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH7 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH8 : (0 <= (avl_height_of (g_low_level_spec) (avl_node_pre)))) (PreH9 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH10 : (data_pre < (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH11 : (avl_search_cursor_valid g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) data_pre )) ,
  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "data" ) )) # Int  |-> data_pre)
  **  ((( &( "destination_node" ) )) # Ptr  |-> 0)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
|--
  “ (avl_tree_valid g_low_level_spec ) ” 
  &&  “ (avl_search_cursor_valid g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) data_pre ) ”
.

Definition xizi_avl_search_partial_solve_wit_2_aux := 
forall (data_pre: Z) (avl_node_pre: Z) (g_low_level_spec: avl_model) (PreH1 : (INT_MIN <= data_pre)) (PreH2 : (data_pre <= INT_MAX)) (PreH3 : (avl_tree_valid g_low_level_spec )) (PreH4 : (avl_vvalid g_low_level_spec avl_node_pre )) (PreH5 : (avl_node_pre <> 0)) (PreH6 : (INT_MIN <= (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH7 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH8 : (0 <= (avl_height_of (g_low_level_spec) (avl_node_pre)))) (PreH9 : ((avl_height_of (g_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH10 : (data_pre < (avl_key_of (g_low_level_spec) (avl_node_pre)))) (PreH11 : (avl_search_cursor_valid g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) data_pre )) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
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
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
.

Definition xizi_avl_search_partial_solve_wit_2 := xizi_avl_search_partial_solve_wit_2_pure -> xizi_avl_search_partial_solve_wit_2_aux.

Definition xizi_avl_search_derive_high_level_spec_by_low_level_spec := 
forall (data_pre: Z) (avl_node_pre: Z) (m_high_level_spec: (Z -> (@option Z))) ,
  (avl_mapping_root_rep m_high_level_spec avl_node_pre )
|--
EX (g_low_level_spec: avl_model) ,
  (“ (avl_tree_valid g_low_level_spec ) ” 
  &&  “ (avl_search_cursor_valid g_low_level_spec avl_node_pre data_pre ) ”
  &&  (avl_subtree_store_at g_low_level_spec avl_node_pre ))
  **
  ((EX retval_2,
  “ (avl_search_result g_low_level_spec data_pre retval_2 ) ”
  &&  (avl_subtree_store_at g_low_level_spec avl_node_pre ))
  -*
  ((EX retval,
  “ ((m_high_level_spec (data_pre)) = (Some (retval))) ” 
  &&  “ (retval <> 0) ”
  &&  (avl_mapping_root_rep m_high_level_spec avl_node_pre ))
  ||
  (EX retval,
  “ ((m_high_level_spec (data_pre)) = None) ” 
  &&  “ (retval = 0) ”
  &&  (avl_mapping_root_rep m_high_level_spec avl_node_pre ))))
.

Module Type VC_Correct.


Axiom proof_of_xizi_avl_search_safety_wit_1 : xizi_avl_search_safety_wit_1.
Axiom proof_of_xizi_avl_search_safety_wit_2 : xizi_avl_search_safety_wit_2.
Axiom proof_of_xizi_avl_search_safety_wit_3 : xizi_avl_search_safety_wit_3.
Axiom proof_of_xizi_avl_search_entail_wit_1 : xizi_avl_search_entail_wit_1.
Axiom proof_of_xizi_avl_search_entail_wit_2 : xizi_avl_search_entail_wit_2.
Axiom proof_of_xizi_avl_search_entail_wit_3 : xizi_avl_search_entail_wit_3.
Axiom proof_of_xizi_avl_search_entail_wit_4 : xizi_avl_search_entail_wit_4.
Axiom proof_of_xizi_avl_search_entail_wit_5_1 : xizi_avl_search_entail_wit_5_1.
Axiom proof_of_xizi_avl_search_entail_wit_5_2 : xizi_avl_search_entail_wit_5_2.
Axiom proof_of_xizi_avl_search_entail_wit_5_3 : xizi_avl_search_entail_wit_5_3.
Axiom proof_of_xizi_avl_search_return_wit_1 : xizi_avl_search_return_wit_1.
Axiom proof_of_xizi_avl_search_return_wit_2 : xizi_avl_search_return_wit_2.
Axiom proof_of_xizi_avl_search_return_wit_3 : xizi_avl_search_return_wit_3.
Axiom proof_of_xizi_avl_search_return_wit_4 : xizi_avl_search_return_wit_4.
Axiom proof_of_xizi_avl_search_partial_solve_wit_1_pure : xizi_avl_search_partial_solve_wit_1_pure.
Axiom proof_of_xizi_avl_search_partial_solve_wit_1 : xizi_avl_search_partial_solve_wit_1.
Axiom proof_of_xizi_avl_search_partial_solve_wit_2_pure : xizi_avl_search_partial_solve_wit_2_pure.
Axiom proof_of_xizi_avl_search_partial_solve_wit_2 : xizi_avl_search_partial_solve_wit_2.
Axiom proof_of_xizi_avl_search_derive_high_level_spec_by_low_level_spec : xizi_avl_search_derive_high_level_spec_by_low_level_spec.

End VC_Correct.
