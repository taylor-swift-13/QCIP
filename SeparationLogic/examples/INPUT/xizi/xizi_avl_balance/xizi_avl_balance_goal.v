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

(*----- Function xizi_avl_balance -----*)

Definition xizi_avl_balance_safety_wit_1 := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (PreH1 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) ,
  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  (avl_tree_store before_high_level_spec )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition xizi_avl_balance_safety_wit_2 := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (PreH1 : (avl_node_pre = 0)) (PreH2 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) ,
  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  (avl_tree_store before_high_level_spec )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition xizi_avl_balance_safety_wit_3 := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (retval: Z) (PreH1 : (avl_balance_factor_or_null before_high_level_spec avl_node_pre retval )) (PreH2 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH3 : (avl_node_pre <> 0)) (PreH4 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH5 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH6 : (avl_vvalid before_high_level_spec avl_node_pre )) (PreH7 : (avl_node_pre <> 0)) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_graph_nodes_store before_high_level_spec (avl_nodes_without (before_high_level_spec) (avl_node_pre)) )
  **  ((( &( "balance_factor" ) )) # Int  |-> retval)
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition xizi_avl_balance_safety_wit_4 := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (retval: Z) (retval_2: Z) (PreH1 : (avl_balance_factor_or_null before_high_level_spec (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) retval_2 )) (PreH2 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH3 : (avl_node_pre <> 0)) (PreH4 : (retval > 1)) (PreH5 : (avl_balance_factor_or_null before_high_level_spec avl_node_pre retval )) (PreH6 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH7 : (avl_node_pre <> 0)) (PreH8 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH9 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH10 : (avl_vvalid before_high_level_spec avl_node_pre )) (PreH11 : (avl_node_pre <> 0)) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_graph_nodes_store before_high_level_spec (avl_nodes_without (before_high_level_spec) (avl_node_pre)) )
  **  ((( &( "child_factor" ) )) # Int  |-> retval_2)
  **  ((( &( "balance_factor" ) )) # Int  |-> retval)
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition xizi_avl_balance_safety_wit_5 := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (retval: Z) (PreH1 : (retval <= 1)) (PreH2 : (avl_balance_factor_or_null before_high_level_spec avl_node_pre retval )) (PreH3 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH4 : (avl_node_pre <> 0)) (PreH5 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH6 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH7 : (avl_vvalid before_high_level_spec avl_node_pre )) (PreH8 : (avl_node_pre <> 0)) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_graph_nodes_store before_high_level_spec (avl_nodes_without (before_high_level_spec) (avl_node_pre)) )
  **  ((( &( "balance_factor" ) )) # Int  |-> retval)
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
|--
  “ (1 <> (INT_MIN)) ”
.

Definition xizi_avl_balance_safety_wit_6 := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (retval: Z) (PreH1 : (retval <= 1)) (PreH2 : (avl_balance_factor_or_null before_high_level_spec avl_node_pre retval )) (PreH3 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH4 : (avl_node_pre <> 0)) (PreH5 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH6 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH7 : (avl_vvalid before_high_level_spec avl_node_pre )) (PreH8 : (avl_node_pre <> 0)) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_graph_nodes_store before_high_level_spec (avl_nodes_without (before_high_level_spec) (avl_node_pre)) )
  **  ((( &( "balance_factor" ) )) # Int  |-> retval)
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition xizi_avl_balance_safety_wit_7 := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (retval: Z) (retval_2: Z) (PreH1 : (avl_balance_factor_or_null before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) retval_2 )) (PreH2 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH3 : (avl_node_pre <> 0)) (PreH4 : (retval < (-1))) (PreH5 : (retval <= 1)) (PreH6 : (avl_balance_factor_or_null before_high_level_spec avl_node_pre retval )) (PreH7 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH8 : (avl_node_pre <> 0)) (PreH9 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH10 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH11 : (avl_vvalid before_high_level_spec avl_node_pre )) (PreH12 : (avl_node_pre <> 0)) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_graph_nodes_store before_high_level_spec (avl_nodes_without (before_high_level_spec) (avl_node_pre)) )
  **  ((( &( "child_factor" ) )) # Int  |-> retval_2)
  **  ((( &( "balance_factor" ) )) # Int  |-> retval)
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition xizi_avl_balance_entail_wit_1 := 
(
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (PreH1 : (avl_node_pre <> 0)) (PreH2 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) ,
  (avl_tree_store before_high_level_spec )
|--
  “ (avl_balance_graph_input before_high_level_spec avl_node_pre ) ” 
  &&  “ (avl_balance_factor_input_valid before_high_level_spec ) ” 
  &&  “ (avl_vvalid before_high_level_spec avl_node_pre ) ” 
  &&  “ (avl_node_pre <> 0) ”
  &&  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_graph_nodes_store before_high_level_spec (avl_nodes_without (before_high_level_spec) (avl_node_pre)) )
) \/
(
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (PreH1 : (avl_node_pre <> 0)) (PreH2 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) ,
  (avl_tree_store before_high_level_spec )
|--
  “ (avl_vvalid before_high_level_spec avl_node_pre ) ” 
  &&  “ (avl_balance_factor_input_valid before_high_level_spec ) ”
  &&  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_graph_nodes_store before_high_level_spec (avl_nodes_without (before_high_level_spec) (avl_node_pre)) )
).

Definition xizi_avl_balance_entail_wit_1_split_goal_1 := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (PreH1 : (avl_node_pre <> 0)) (PreH2 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) ,
  (avl_tree_store before_high_level_spec )
|--
  “ (avl_vvalid before_high_level_spec avl_node_pre ) ”
.

Definition xizi_avl_balance_entail_wit_1_split_goal_2 := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (PreH1 : (avl_node_pre <> 0)) (PreH2 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) ,
  (avl_tree_store before_high_level_spec )
|--
  “ (avl_balance_factor_input_valid before_high_level_spec ) ”
.

Definition xizi_avl_balance_entail_wit_1_split_goal_spatial := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (PreH1 : (avl_node_pre <> 0)) (PreH2 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) ,
  (avl_tree_store before_high_level_spec )
|--
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_graph_nodes_store before_high_level_spec (avl_nodes_without (before_high_level_spec) (avl_node_pre)) )
.

Definition xizi_avl_balance_entail_wit_2 := 
(
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (retval_2: Z) (retval: Z) (PreH1 : (retval >= 0)) (PreH2 : (avl_balance_factor_or_null before_high_level_spec (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) retval )) (PreH3 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH4 : (avl_node_pre <> 0)) (PreH5 : (retval_2 > 1)) (PreH6 : (avl_balance_factor_or_null before_high_level_spec avl_node_pre retval_2 )) (PreH7 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH8 : (avl_node_pre <> 0)) (PreH9 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH10 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH11 : (avl_vvalid before_high_level_spec avl_node_pre )) (PreH12 : (avl_node_pre <> 0)) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_graph_nodes_store before_high_level_spec (avl_nodes_without (before_high_level_spec) (avl_node_pre)) )
  **  ((( &( "balance_factor" ) )) # Int  |-> retval_2)
|--
  “ (avl_balance_graph_input before_high_level_spec avl_node_pre ) ” 
  &&  “ ((avl_model_balance_factor (before_high_level_spec) (avl_node_pre)) > 1) ” 
  &&  “ (avl_balance_factor_or_null before_high_level_spec (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) retval ) ” 
  &&  “ (retval >= 0) ” 
  &&  “ (avl_right_rotation_input before_high_level_spec avl_node_pre ) ”
  &&  (avl_tree_store (avl_with_root_cache (before_high_level_spec) (avl_node_pre) ((avl_height_of (before_high_level_spec) (avl_node_pre)))) )
  **  ((( &( "balance_factor" ) )) # Int  |-> (avl_model_balance_factor (before_high_level_spec) (avl_node_pre)))
) \/
(
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (retval_2: Z) (retval: Z) (PreH1 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH2 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) >= 0)) (PreH3 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH5 : (retval >= 0)) (PreH6 : (avl_balance_factor_or_null before_high_level_spec (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) retval )) (PreH7 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH8 : (avl_node_pre <> 0)) (PreH9 : (retval_2 > 1)) (PreH10 : (avl_balance_factor_or_null before_high_level_spec avl_node_pre retval_2 )) (PreH11 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH12 : (avl_node_pre <> 0)) (PreH13 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH14 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH15 : (avl_vvalid before_high_level_spec avl_node_pre )) (PreH16 : (avl_node_pre <> 0)) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_graph_nodes_store before_high_level_spec (avl_nodes_without (before_high_level_spec) (avl_node_pre)) )
|--
  “ (avl_right_rotation_input before_high_level_spec avl_node_pre ) ” 
  &&  “ ((avl_model_balance_factor (before_high_level_spec) (avl_node_pre)) > 1) ” 
  &&  “ (retval_2 = (avl_model_balance_factor (before_high_level_spec) (avl_node_pre))) ”
  &&  (avl_tree_store (avl_with_root_cache (before_high_level_spec) (avl_node_pre) ((avl_height_of (before_high_level_spec) (avl_node_pre)))) )
).

Definition xizi_avl_balance_entail_wit_2_split_goal_1 := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (retval_2: Z) (retval: Z) (PreH1 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH2 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) >= 0)) (PreH3 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH5 : (retval >= 0)) (PreH6 : (avl_balance_factor_or_null before_high_level_spec (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) retval )) (PreH7 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH8 : (avl_node_pre <> 0)) (PreH9 : (retval_2 > 1)) (PreH10 : (avl_balance_factor_or_null before_high_level_spec avl_node_pre retval_2 )) (PreH11 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH12 : (avl_node_pre <> 0)) (PreH13 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH14 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH15 : (avl_vvalid before_high_level_spec avl_node_pre )) (PreH16 : (avl_node_pre <> 0)) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_graph_nodes_store before_high_level_spec (avl_nodes_without (before_high_level_spec) (avl_node_pre)) )
|--
  “ (avl_right_rotation_input before_high_level_spec avl_node_pre ) ”
.

Definition xizi_avl_balance_entail_wit_2_split_goal_2 := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (retval_2: Z) (retval: Z) (PreH1 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH2 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) >= 0)) (PreH3 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH5 : (retval >= 0)) (PreH6 : (avl_balance_factor_or_null before_high_level_spec (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) retval )) (PreH7 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH8 : (avl_node_pre <> 0)) (PreH9 : (retval_2 > 1)) (PreH10 : (avl_balance_factor_or_null before_high_level_spec avl_node_pre retval_2 )) (PreH11 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH12 : (avl_node_pre <> 0)) (PreH13 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH14 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH15 : (avl_vvalid before_high_level_spec avl_node_pre )) (PreH16 : (avl_node_pre <> 0)) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_graph_nodes_store before_high_level_spec (avl_nodes_without (before_high_level_spec) (avl_node_pre)) )
|--
  “ ((avl_model_balance_factor (before_high_level_spec) (avl_node_pre)) > 1) ”
.

Definition xizi_avl_balance_entail_wit_2_split_goal_3 := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (retval_2: Z) (retval: Z) (PreH1 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH2 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) >= 0)) (PreH3 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH5 : (retval >= 0)) (PreH6 : (avl_balance_factor_or_null before_high_level_spec (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) retval )) (PreH7 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH8 : (avl_node_pre <> 0)) (PreH9 : (retval_2 > 1)) (PreH10 : (avl_balance_factor_or_null before_high_level_spec avl_node_pre retval_2 )) (PreH11 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH12 : (avl_node_pre <> 0)) (PreH13 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH14 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH15 : (avl_vvalid before_high_level_spec avl_node_pre )) (PreH16 : (avl_node_pre <> 0)) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_graph_nodes_store before_high_level_spec (avl_nodes_without (before_high_level_spec) (avl_node_pre)) )
|--
  “ (retval_2 = (avl_model_balance_factor (before_high_level_spec) (avl_node_pre))) ”
.

Definition xizi_avl_balance_entail_wit_2_split_goal_spatial := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (retval_2: Z) (retval: Z) (PreH1 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH2 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) >= 0)) (PreH3 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH5 : (retval >= 0)) (PreH6 : (avl_balance_factor_or_null before_high_level_spec (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) retval )) (PreH7 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH8 : (avl_node_pre <> 0)) (PreH9 : (retval_2 > 1)) (PreH10 : (avl_balance_factor_or_null before_high_level_spec avl_node_pre retval_2 )) (PreH11 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH12 : (avl_node_pre <> 0)) (PreH13 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH14 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH15 : (avl_vvalid before_high_level_spec avl_node_pre )) (PreH16 : (avl_node_pre <> 0)) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_graph_nodes_store before_high_level_spec (avl_nodes_without (before_high_level_spec) (avl_node_pre)) )
|--
  (avl_tree_store (avl_with_root_cache (before_high_level_spec) (avl_node_pre) ((avl_height_of (before_high_level_spec) (avl_node_pre)))) )
.

Definition xizi_avl_balance_entail_wit_3 := 
(
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (retval_2: Z) (retval: Z) (PreH1 : (retval < 0)) (PreH2 : (avl_balance_factor_or_null before_high_level_spec (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) retval )) (PreH3 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH4 : (avl_node_pre <> 0)) (PreH5 : (retval_2 > 1)) (PreH6 : (avl_balance_factor_or_null before_high_level_spec avl_node_pre retval_2 )) (PreH7 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH8 : (avl_node_pre <> 0)) (PreH9 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH10 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH11 : (avl_vvalid before_high_level_spec avl_node_pre )) (PreH12 : (avl_node_pre <> 0)) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_graph_nodes_store before_high_level_spec (avl_nodes_without (before_high_level_spec) (avl_node_pre)) )
  **  ((( &( "balance_factor" ) )) # Int  |-> retval_2)
|--
  “ (avl_balance_graph_input before_high_level_spec avl_node_pre ) ” 
  &&  “ ((avl_model_balance_factor (before_high_level_spec) (avl_node_pre)) > 1) ” 
  &&  “ (avl_balance_factor_or_null before_high_level_spec (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) retval ) ” 
  &&  “ (retval < 0) ” 
  &&  “ (avl_lr_rotation_input before_high_level_spec avl_node_pre ) ”
  &&  (avl_tree_store (avl_with_root_cache (before_high_level_spec) (avl_node_pre) ((avl_height_of (before_high_level_spec) (avl_node_pre)))) )
  **  ((( &( "balance_factor" ) )) # Int  |-> (avl_model_balance_factor (before_high_level_spec) (avl_node_pre)))
) \/
(
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (retval_2: Z) (retval: Z) (PreH1 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH2 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) >= 0)) (PreH3 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH5 : (retval < 0)) (PreH6 : (avl_balance_factor_or_null before_high_level_spec (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) retval )) (PreH7 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH8 : (avl_node_pre <> 0)) (PreH9 : (retval_2 > 1)) (PreH10 : (avl_balance_factor_or_null before_high_level_spec avl_node_pre retval_2 )) (PreH11 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH12 : (avl_node_pre <> 0)) (PreH13 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH14 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH15 : (avl_vvalid before_high_level_spec avl_node_pre )) (PreH16 : (avl_node_pre <> 0)) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_graph_nodes_store before_high_level_spec (avl_nodes_without (before_high_level_spec) (avl_node_pre)) )
|--
  “ (avl_lr_rotation_input before_high_level_spec avl_node_pre ) ” 
  &&  “ ((avl_model_balance_factor (before_high_level_spec) (avl_node_pre)) > 1) ” 
  &&  “ (retval_2 = (avl_model_balance_factor (before_high_level_spec) (avl_node_pre))) ”
  &&  (avl_tree_store (avl_with_root_cache (before_high_level_spec) (avl_node_pre) ((avl_height_of (before_high_level_spec) (avl_node_pre)))) )
).

Definition xizi_avl_balance_entail_wit_3_split_goal_1 := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (retval_2: Z) (retval: Z) (PreH1 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH2 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) >= 0)) (PreH3 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH5 : (retval < 0)) (PreH6 : (avl_balance_factor_or_null before_high_level_spec (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) retval )) (PreH7 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH8 : (avl_node_pre <> 0)) (PreH9 : (retval_2 > 1)) (PreH10 : (avl_balance_factor_or_null before_high_level_spec avl_node_pre retval_2 )) (PreH11 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH12 : (avl_node_pre <> 0)) (PreH13 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH14 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH15 : (avl_vvalid before_high_level_spec avl_node_pre )) (PreH16 : (avl_node_pre <> 0)) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_graph_nodes_store before_high_level_spec (avl_nodes_without (before_high_level_spec) (avl_node_pre)) )
|--
  “ (avl_lr_rotation_input before_high_level_spec avl_node_pre ) ”
.

Definition xizi_avl_balance_entail_wit_3_split_goal_2 := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (retval_2: Z) (retval: Z) (PreH1 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH2 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) >= 0)) (PreH3 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH5 : (retval < 0)) (PreH6 : (avl_balance_factor_or_null before_high_level_spec (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) retval )) (PreH7 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH8 : (avl_node_pre <> 0)) (PreH9 : (retval_2 > 1)) (PreH10 : (avl_balance_factor_or_null before_high_level_spec avl_node_pre retval_2 )) (PreH11 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH12 : (avl_node_pre <> 0)) (PreH13 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH14 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH15 : (avl_vvalid before_high_level_spec avl_node_pre )) (PreH16 : (avl_node_pre <> 0)) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_graph_nodes_store before_high_level_spec (avl_nodes_without (before_high_level_spec) (avl_node_pre)) )
|--
  “ ((avl_model_balance_factor (before_high_level_spec) (avl_node_pre)) > 1) ”
.

Definition xizi_avl_balance_entail_wit_3_split_goal_3 := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (retval_2: Z) (retval: Z) (PreH1 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH2 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) >= 0)) (PreH3 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH5 : (retval < 0)) (PreH6 : (avl_balance_factor_or_null before_high_level_spec (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) retval )) (PreH7 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH8 : (avl_node_pre <> 0)) (PreH9 : (retval_2 > 1)) (PreH10 : (avl_balance_factor_or_null before_high_level_spec avl_node_pre retval_2 )) (PreH11 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH12 : (avl_node_pre <> 0)) (PreH13 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH14 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH15 : (avl_vvalid before_high_level_spec avl_node_pre )) (PreH16 : (avl_node_pre <> 0)) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_graph_nodes_store before_high_level_spec (avl_nodes_without (before_high_level_spec) (avl_node_pre)) )
|--
  “ (retval_2 = (avl_model_balance_factor (before_high_level_spec) (avl_node_pre))) ”
.

Definition xizi_avl_balance_entail_wit_3_split_goal_spatial := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (retval_2: Z) (retval: Z) (PreH1 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH2 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) >= 0)) (PreH3 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH5 : (retval < 0)) (PreH6 : (avl_balance_factor_or_null before_high_level_spec (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) retval )) (PreH7 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH8 : (avl_node_pre <> 0)) (PreH9 : (retval_2 > 1)) (PreH10 : (avl_balance_factor_or_null before_high_level_spec avl_node_pre retval_2 )) (PreH11 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH12 : (avl_node_pre <> 0)) (PreH13 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH14 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH15 : (avl_vvalid before_high_level_spec avl_node_pre )) (PreH16 : (avl_node_pre <> 0)) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_graph_nodes_store before_high_level_spec (avl_nodes_without (before_high_level_spec) (avl_node_pre)) )
|--
  (avl_tree_store (avl_with_root_cache (before_high_level_spec) (avl_node_pre) ((avl_height_of (before_high_level_spec) (avl_node_pre)))) )
.

Definition xizi_avl_balance_entail_wit_4 := 
(
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (retval_2: Z) (retval: Z) (PreH1 : (retval <= 0)) (PreH2 : (avl_balance_factor_or_null before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) retval )) (PreH3 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH4 : (avl_node_pre <> 0)) (PreH5 : (retval_2 < (-1))) (PreH6 : (retval_2 <= 1)) (PreH7 : (avl_balance_factor_or_null before_high_level_spec avl_node_pre retval_2 )) (PreH8 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH9 : (avl_node_pre <> 0)) (PreH10 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH11 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH12 : (avl_vvalid before_high_level_spec avl_node_pre )) (PreH13 : (avl_node_pre <> 0)) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_graph_nodes_store before_high_level_spec (avl_nodes_without (before_high_level_spec) (avl_node_pre)) )
  **  ((( &( "balance_factor" ) )) # Int  |-> retval_2)
|--
  “ (avl_balance_graph_input before_high_level_spec avl_node_pre ) ” 
  &&  “ ((avl_model_balance_factor (before_high_level_spec) (avl_node_pre)) < (-1)) ” 
  &&  “ (avl_balance_factor_or_null before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) retval ) ” 
  &&  “ (retval <= 0) ” 
  &&  “ (avl_left_rotation_cached_input before_high_level_spec avl_node_pre ) ”
  &&  (avl_tree_store (avl_with_root_cache (before_high_level_spec) (avl_node_pre) ((avl_height_of (before_high_level_spec) (avl_node_pre)))) )
  **  ((( &( "balance_factor" ) )) # Int  |-> (avl_model_balance_factor (before_high_level_spec) (avl_node_pre)))
) \/
(
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (retval_2: Z) (retval: Z) (PreH1 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH2 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) >= 0)) (PreH3 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH5 : (retval <= 0)) (PreH6 : (avl_balance_factor_or_null before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) retval )) (PreH7 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH8 : (avl_node_pre <> 0)) (PreH9 : (retval_2 < (-1))) (PreH10 : (retval_2 <= 1)) (PreH11 : (avl_balance_factor_or_null before_high_level_spec avl_node_pre retval_2 )) (PreH12 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH13 : (avl_node_pre <> 0)) (PreH14 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH15 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH16 : (avl_vvalid before_high_level_spec avl_node_pre )) (PreH17 : (avl_node_pre <> 0)) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_graph_nodes_store before_high_level_spec (avl_nodes_without (before_high_level_spec) (avl_node_pre)) )
|--
  “ (avl_left_rotation_cached_input before_high_level_spec avl_node_pre ) ” 
  &&  “ ((avl_model_balance_factor (before_high_level_spec) (avl_node_pre)) < (-1)) ” 
  &&  “ (retval_2 = (avl_model_balance_factor (before_high_level_spec) (avl_node_pre))) ”
  &&  (avl_tree_store (avl_with_root_cache (before_high_level_spec) (avl_node_pre) ((avl_height_of (before_high_level_spec) (avl_node_pre)))) )
).

Definition xizi_avl_balance_entail_wit_4_split_goal_1 := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (retval_2: Z) (retval: Z) (PreH1 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH2 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) >= 0)) (PreH3 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH5 : (retval <= 0)) (PreH6 : (avl_balance_factor_or_null before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) retval )) (PreH7 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH8 : (avl_node_pre <> 0)) (PreH9 : (retval_2 < (-1))) (PreH10 : (retval_2 <= 1)) (PreH11 : (avl_balance_factor_or_null before_high_level_spec avl_node_pre retval_2 )) (PreH12 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH13 : (avl_node_pre <> 0)) (PreH14 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH15 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH16 : (avl_vvalid before_high_level_spec avl_node_pre )) (PreH17 : (avl_node_pre <> 0)) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_graph_nodes_store before_high_level_spec (avl_nodes_without (before_high_level_spec) (avl_node_pre)) )
|--
  “ (avl_left_rotation_cached_input before_high_level_spec avl_node_pre ) ”
.

Definition xizi_avl_balance_entail_wit_4_split_goal_2 := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (retval_2: Z) (retval: Z) (PreH1 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH2 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) >= 0)) (PreH3 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH5 : (retval <= 0)) (PreH6 : (avl_balance_factor_or_null before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) retval )) (PreH7 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH8 : (avl_node_pre <> 0)) (PreH9 : (retval_2 < (-1))) (PreH10 : (retval_2 <= 1)) (PreH11 : (avl_balance_factor_or_null before_high_level_spec avl_node_pre retval_2 )) (PreH12 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH13 : (avl_node_pre <> 0)) (PreH14 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH15 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH16 : (avl_vvalid before_high_level_spec avl_node_pre )) (PreH17 : (avl_node_pre <> 0)) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_graph_nodes_store before_high_level_spec (avl_nodes_without (before_high_level_spec) (avl_node_pre)) )
|--
  “ ((avl_model_balance_factor (before_high_level_spec) (avl_node_pre)) < (-1)) ”
.

Definition xizi_avl_balance_entail_wit_4_split_goal_3 := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (retval_2: Z) (retval: Z) (PreH1 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH2 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) >= 0)) (PreH3 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH5 : (retval <= 0)) (PreH6 : (avl_balance_factor_or_null before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) retval )) (PreH7 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH8 : (avl_node_pre <> 0)) (PreH9 : (retval_2 < (-1))) (PreH10 : (retval_2 <= 1)) (PreH11 : (avl_balance_factor_or_null before_high_level_spec avl_node_pre retval_2 )) (PreH12 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH13 : (avl_node_pre <> 0)) (PreH14 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH15 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH16 : (avl_vvalid before_high_level_spec avl_node_pre )) (PreH17 : (avl_node_pre <> 0)) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_graph_nodes_store before_high_level_spec (avl_nodes_without (before_high_level_spec) (avl_node_pre)) )
|--
  “ (retval_2 = (avl_model_balance_factor (before_high_level_spec) (avl_node_pre))) ”
.

Definition xizi_avl_balance_entail_wit_4_split_goal_spatial := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (retval_2: Z) (retval: Z) (PreH1 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH2 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) >= 0)) (PreH3 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH5 : (retval <= 0)) (PreH6 : (avl_balance_factor_or_null before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) retval )) (PreH7 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH8 : (avl_node_pre <> 0)) (PreH9 : (retval_2 < (-1))) (PreH10 : (retval_2 <= 1)) (PreH11 : (avl_balance_factor_or_null before_high_level_spec avl_node_pre retval_2 )) (PreH12 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH13 : (avl_node_pre <> 0)) (PreH14 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH15 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH16 : (avl_vvalid before_high_level_spec avl_node_pre )) (PreH17 : (avl_node_pre <> 0)) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_graph_nodes_store before_high_level_spec (avl_nodes_without (before_high_level_spec) (avl_node_pre)) )
|--
  (avl_tree_store (avl_with_root_cache (before_high_level_spec) (avl_node_pre) ((avl_height_of (before_high_level_spec) (avl_node_pre)))) )
.

Definition xizi_avl_balance_entail_wit_5 := 
(
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (retval_2: Z) (retval: Z) (PreH1 : (retval > 0)) (PreH2 : (avl_balance_factor_or_null before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) retval )) (PreH3 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH4 : (avl_node_pre <> 0)) (PreH5 : (retval_2 < (-1))) (PreH6 : (retval_2 <= 1)) (PreH7 : (avl_balance_factor_or_null before_high_level_spec avl_node_pre retval_2 )) (PreH8 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH9 : (avl_node_pre <> 0)) (PreH10 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH11 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH12 : (avl_vvalid before_high_level_spec avl_node_pre )) (PreH13 : (avl_node_pre <> 0)) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_graph_nodes_store before_high_level_spec (avl_nodes_without (before_high_level_spec) (avl_node_pre)) )
  **  ((( &( "balance_factor" ) )) # Int  |-> retval_2)
|--
  “ (avl_balance_graph_input before_high_level_spec avl_node_pre ) ” 
  &&  “ ((avl_model_balance_factor (before_high_level_spec) (avl_node_pre)) < (-1)) ” 
  &&  “ (avl_balance_factor_or_null before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) retval ) ” 
  &&  “ (retval > 0) ” 
  &&  “ (avl_rl_rotation_input before_high_level_spec avl_node_pre ) ”
  &&  (avl_tree_store (avl_with_root_cache (before_high_level_spec) (avl_node_pre) ((avl_height_of (before_high_level_spec) (avl_node_pre)))) )
  **  ((( &( "balance_factor" ) )) # Int  |-> (avl_model_balance_factor (before_high_level_spec) (avl_node_pre)))
) \/
(
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (retval_2: Z) (retval: Z) (PreH1 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH2 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) >= 0)) (PreH3 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH5 : (retval > 0)) (PreH6 : (avl_balance_factor_or_null before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) retval )) (PreH7 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH8 : (avl_node_pre <> 0)) (PreH9 : (retval_2 < (-1))) (PreH10 : (retval_2 <= 1)) (PreH11 : (avl_balance_factor_or_null before_high_level_spec avl_node_pre retval_2 )) (PreH12 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH13 : (avl_node_pre <> 0)) (PreH14 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH15 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH16 : (avl_vvalid before_high_level_spec avl_node_pre )) (PreH17 : (avl_node_pre <> 0)) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_graph_nodes_store before_high_level_spec (avl_nodes_without (before_high_level_spec) (avl_node_pre)) )
|--
  “ (avl_rl_rotation_input before_high_level_spec avl_node_pre ) ” 
  &&  “ ((avl_model_balance_factor (before_high_level_spec) (avl_node_pre)) < (-1)) ” 
  &&  “ (retval_2 = (avl_model_balance_factor (before_high_level_spec) (avl_node_pre))) ”
  &&  (avl_tree_store (avl_with_root_cache (before_high_level_spec) (avl_node_pre) ((avl_height_of (before_high_level_spec) (avl_node_pre)))) )
).

Definition xizi_avl_balance_entail_wit_5_split_goal_1 := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (retval_2: Z) (retval: Z) (PreH1 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH2 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) >= 0)) (PreH3 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH5 : (retval > 0)) (PreH6 : (avl_balance_factor_or_null before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) retval )) (PreH7 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH8 : (avl_node_pre <> 0)) (PreH9 : (retval_2 < (-1))) (PreH10 : (retval_2 <= 1)) (PreH11 : (avl_balance_factor_or_null before_high_level_spec avl_node_pre retval_2 )) (PreH12 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH13 : (avl_node_pre <> 0)) (PreH14 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH15 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH16 : (avl_vvalid before_high_level_spec avl_node_pre )) (PreH17 : (avl_node_pre <> 0)) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_graph_nodes_store before_high_level_spec (avl_nodes_without (before_high_level_spec) (avl_node_pre)) )
|--
  “ (avl_rl_rotation_input before_high_level_spec avl_node_pre ) ”
.

Definition xizi_avl_balance_entail_wit_5_split_goal_2 := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (retval_2: Z) (retval: Z) (PreH1 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH2 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) >= 0)) (PreH3 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH5 : (retval > 0)) (PreH6 : (avl_balance_factor_or_null before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) retval )) (PreH7 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH8 : (avl_node_pre <> 0)) (PreH9 : (retval_2 < (-1))) (PreH10 : (retval_2 <= 1)) (PreH11 : (avl_balance_factor_or_null before_high_level_spec avl_node_pre retval_2 )) (PreH12 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH13 : (avl_node_pre <> 0)) (PreH14 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH15 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH16 : (avl_vvalid before_high_level_spec avl_node_pre )) (PreH17 : (avl_node_pre <> 0)) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_graph_nodes_store before_high_level_spec (avl_nodes_without (before_high_level_spec) (avl_node_pre)) )
|--
  “ ((avl_model_balance_factor (before_high_level_spec) (avl_node_pre)) < (-1)) ”
.

Definition xizi_avl_balance_entail_wit_5_split_goal_3 := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (retval_2: Z) (retval: Z) (PreH1 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH2 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) >= 0)) (PreH3 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH5 : (retval > 0)) (PreH6 : (avl_balance_factor_or_null before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) retval )) (PreH7 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH8 : (avl_node_pre <> 0)) (PreH9 : (retval_2 < (-1))) (PreH10 : (retval_2 <= 1)) (PreH11 : (avl_balance_factor_or_null before_high_level_spec avl_node_pre retval_2 )) (PreH12 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH13 : (avl_node_pre <> 0)) (PreH14 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH15 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH16 : (avl_vvalid before_high_level_spec avl_node_pre )) (PreH17 : (avl_node_pre <> 0)) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_graph_nodes_store before_high_level_spec (avl_nodes_without (before_high_level_spec) (avl_node_pre)) )
|--
  “ (retval_2 = (avl_model_balance_factor (before_high_level_spec) (avl_node_pre))) ”
.

Definition xizi_avl_balance_entail_wit_5_split_goal_spatial := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (retval_2: Z) (retval: Z) (PreH1 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH2 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) >= 0)) (PreH3 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH5 : (retval > 0)) (PreH6 : (avl_balance_factor_or_null before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) retval )) (PreH7 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH8 : (avl_node_pre <> 0)) (PreH9 : (retval_2 < (-1))) (PreH10 : (retval_2 <= 1)) (PreH11 : (avl_balance_factor_or_null before_high_level_spec avl_node_pre retval_2 )) (PreH12 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH13 : (avl_node_pre <> 0)) (PreH14 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH15 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH16 : (avl_vvalid before_high_level_spec avl_node_pre )) (PreH17 : (avl_node_pre <> 0)) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_graph_nodes_store before_high_level_spec (avl_nodes_without (before_high_level_spec) (avl_node_pre)) )
|--
  (avl_tree_store (avl_with_root_cache (before_high_level_spec) (avl_node_pre) ((avl_height_of (before_high_level_spec) (avl_node_pre)))) )
.

Definition xizi_avl_balance_return_wit_1 := 
(
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (retval: Z) (PreH1 : (retval >= (-1))) (PreH2 : (retval <= 1)) (PreH3 : (avl_balance_factor_or_null before_high_level_spec avl_node_pre retval )) (PreH4 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH5 : (avl_node_pre <> 0)) (PreH6 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH7 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH8 : (avl_vvalid before_high_level_spec avl_node_pre )) (PreH9 : (avl_node_pre <> 0)) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_graph_nodes_store before_high_level_spec (avl_nodes_without (before_high_level_spec) (avl_node_pre)) )
|--
  EX (after: avl_model) ,
  “ (avl_balance_graph_result before_high_level_spec after avl_node_pre ) ”
  &&  (avl_tree_store after )
) \/
(
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (retval: Z) (PreH1 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH2 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) >= 0)) (PreH3 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH5 : (retval >= (-1))) (PreH6 : (retval <= 1)) (PreH7 : (avl_balance_factor_or_null before_high_level_spec avl_node_pre retval )) (PreH8 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH9 : (avl_node_pre <> 0)) (PreH10 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH11 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH12 : (avl_vvalid before_high_level_spec avl_node_pre )) (PreH13 : (avl_node_pre <> 0)) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_graph_nodes_store before_high_level_spec (avl_nodes_without (before_high_level_spec) (avl_node_pre)) )
|--
  EX (after: avl_model) ,
  “ (avl_balance_graph_result before_high_level_spec after avl_node_pre ) ”
  &&  (avl_tree_store after )
).

Definition xizi_avl_balance_return_wit_2 := 
(
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (child_factor: Z) (retval: Z) (PreH1 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH2 : ((avl_model_balance_factor (before_high_level_spec) (avl_node_pre)) < (-1))) (PreH3 : (avl_balance_factor_or_null before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) child_factor )) (PreH4 : (child_factor > 0)) (PreH5 : (avl_rl_rotation_input before_high_level_spec avl_node_pre )) ,
  (avl_rl_rotation_post before_high_level_spec avl_node_pre retval )
|--
  EX (after: avl_model) ,
  “ (avl_balance_graph_result before_high_level_spec after retval ) ”
  &&  (avl_tree_store after )
) \/
(
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (child_factor: Z) (retval: Z) (PreH1 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH2 : ((avl_model_balance_factor (before_high_level_spec) (avl_node_pre)) < (-1))) (PreH3 : (avl_balance_factor_or_null before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) child_factor )) (PreH4 : (child_factor > 0)) (PreH5 : (avl_rl_rotation_input before_high_level_spec avl_node_pre )) ,
  (avl_rl_rotation_post before_high_level_spec avl_node_pre retval )
|--
  EX (after: avl_model) ,
  “ (avl_balance_graph_result before_high_level_spec after retval ) ”
  &&  (avl_tree_store after )
).

Definition xizi_avl_balance_return_wit_3 := 
(
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (child_factor: Z) (retval: Z) (PreH1 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH2 : ((avl_model_balance_factor (before_high_level_spec) (avl_node_pre)) < (-1))) (PreH3 : (avl_balance_factor_or_null before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) child_factor )) (PreH4 : (child_factor <= 0)) (PreH5 : (avl_left_rotation_cached_input before_high_level_spec avl_node_pre )) ,
  (avl_left_rotation_post before_high_level_spec avl_node_pre retval )
|--
  EX (after: avl_model) ,
  “ (avl_balance_graph_result before_high_level_spec after retval ) ”
  &&  (avl_tree_store after )
) \/
(
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (child_factor: Z) (retval: Z) (PreH1 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH2 : ((avl_model_balance_factor (before_high_level_spec) (avl_node_pre)) < (-1))) (PreH3 : (avl_balance_factor_or_null before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) child_factor )) (PreH4 : (child_factor <= 0)) (PreH5 : (avl_left_rotation_cached_input before_high_level_spec avl_node_pre )) ,
  (avl_left_rotation_post before_high_level_spec avl_node_pre retval )
|--
  EX (after: avl_model) ,
  “ (avl_balance_graph_result before_high_level_spec after retval ) ”
  &&  (avl_tree_store after )
).

Definition xizi_avl_balance_return_wit_4 := 
(
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (child_factor: Z) (retval: Z) (PreH1 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH2 : ((avl_model_balance_factor (before_high_level_spec) (avl_node_pre)) > 1)) (PreH3 : (avl_balance_factor_or_null before_high_level_spec (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) child_factor )) (PreH4 : (child_factor < 0)) (PreH5 : (avl_lr_rotation_input before_high_level_spec avl_node_pre )) ,
  (avl_lr_rotation_post before_high_level_spec avl_node_pre retval )
|--
  EX (after: avl_model) ,
  “ (avl_balance_graph_result before_high_level_spec after retval ) ”
  &&  (avl_tree_store after )
) \/
(
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (child_factor: Z) (retval: Z) (PreH1 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH2 : ((avl_model_balance_factor (before_high_level_spec) (avl_node_pre)) > 1)) (PreH3 : (avl_balance_factor_or_null before_high_level_spec (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) child_factor )) (PreH4 : (child_factor < 0)) (PreH5 : (avl_lr_rotation_input before_high_level_spec avl_node_pre )) ,
  (avl_lr_rotation_post before_high_level_spec avl_node_pre retval )
|--
  EX (after: avl_model) ,
  “ (avl_balance_graph_result before_high_level_spec after retval ) ”
  &&  (avl_tree_store after )
).

Definition xizi_avl_balance_return_wit_5 := 
(
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (child_factor: Z) (retval: Z) (PreH1 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH2 : ((avl_model_balance_factor (before_high_level_spec) (avl_node_pre)) > 1)) (PreH3 : (avl_balance_factor_or_null before_high_level_spec (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) child_factor )) (PreH4 : (child_factor >= 0)) (PreH5 : (avl_right_rotation_input before_high_level_spec avl_node_pre )) ,
  (avl_right_rotation_post before_high_level_spec avl_node_pre retval )
|--
  EX (after: avl_model) ,
  “ (avl_balance_graph_result before_high_level_spec after retval ) ”
  &&  (avl_tree_store after )
) \/
(
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (child_factor: Z) (retval: Z) (PreH1 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH2 : ((avl_model_balance_factor (before_high_level_spec) (avl_node_pre)) > 1)) (PreH3 : (avl_balance_factor_or_null before_high_level_spec (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) child_factor )) (PreH4 : (child_factor >= 0)) (PreH5 : (avl_right_rotation_input before_high_level_spec avl_node_pre )) ,
  (avl_right_rotation_post before_high_level_spec avl_node_pre retval )
|--
  EX (after: avl_model) ,
  “ (avl_balance_graph_result before_high_level_spec after retval ) ”
  &&  (avl_tree_store after )
).

Definition xizi_avl_balance_return_wit_6 := 
(
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (PreH1 : (avl_node_pre = 0)) (PreH2 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) ,
  (avl_tree_store before_high_level_spec )
|--
  EX (after: avl_model) ,
  “ (avl_balance_graph_result before_high_level_spec after 0 ) ”
  &&  (avl_tree_store after )
) \/
(
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (PreH1 : (avl_node_pre = 0)) (PreH2 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) ,
  TT && emp 
|--
  “ (avl_balance_graph_result before_high_level_spec before_high_level_spec 0 ) ”
  &&  emp
).

Definition xizi_avl_balance_return_wit_6_split_goal_1 := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (PreH1 : (avl_node_pre = 0)) (PreH2 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) ,
  (avl_balance_graph_result before_high_level_spec before_high_level_spec 0 )
.

Definition xizi_avl_balance_partial_solve_wit_1_pure := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (PreH1 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH2 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH3 : (avl_vvalid before_high_level_spec avl_node_pre )) (PreH4 : (avl_node_pre <> 0)) ,
  ((( &( "balance_factor" ) )) # Int  |->_)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_graph_nodes_store before_high_level_spec (avl_nodes_without (before_high_level_spec) (avl_node_pre)) )
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
|--
  “ (avl_node_pre = avl_node_pre) ” 
  &&  “ (avl_balance_factor_input_valid before_high_level_spec ) ” 
  &&  “ (avl_vvalid before_high_level_spec avl_node_pre ) ” 
  &&  “ (avl_node_pre <> 0) ”
.

Definition xizi_avl_balance_partial_solve_wit_1_aux := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (PreH1 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH2 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH3 : (avl_vvalid before_high_level_spec avl_node_pre )) (PreH4 : (avl_node_pre <> 0)) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_graph_nodes_store before_high_level_spec (avl_nodes_without (before_high_level_spec) (avl_node_pre)) )
|--
  “ (avl_node_pre = avl_node_pre) ” 
  &&  “ (avl_balance_factor_input_valid before_high_level_spec ) ” 
  &&  “ (avl_vvalid before_high_level_spec avl_node_pre ) ” 
  &&  “ (avl_node_pre <> 0) ” 
  &&  “ (avl_balance_graph_input before_high_level_spec avl_node_pre ) ” 
  &&  “ (avl_balance_factor_input_valid before_high_level_spec ) ” 
  &&  “ (avl_vvalid before_high_level_spec avl_node_pre ) ” 
  &&  “ (avl_node_pre <> 0) ”
  &&  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_graph_nodes_store before_high_level_spec (avl_nodes_without (before_high_level_spec) (avl_node_pre)) )
.

Definition xizi_avl_balance_partial_solve_wit_1 := xizi_avl_balance_partial_solve_wit_1_pure -> xizi_avl_balance_partial_solve_wit_1_aux.

Definition xizi_avl_balance_partial_solve_wit_2_pure := 
(
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (retval: Z) (PreH1 : (retval > 1)) (PreH2 : (avl_balance_factor_or_null before_high_level_spec avl_node_pre retval )) (PreH3 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH4 : (avl_node_pre <> 0)) (PreH5 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH6 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH7 : (avl_vvalid before_high_level_spec avl_node_pre )) (PreH8 : (avl_node_pre <> 0)) ,
  ((( &( "child_factor" ) )) # Int  |->_)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_graph_nodes_store before_high_level_spec (avl_nodes_without (before_high_level_spec) (avl_node_pre)) )
  **  ((( &( "balance_factor" ) )) # Int  |-> retval)
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
|--
  “ ((avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) = (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre))))) ” 
  &&  “ (avl_balance_factor_input_valid before_high_level_spec ) ” 
  &&  “ (avl_node_pre <> 0) ” 
  &&  “ (avl_vvalid before_high_level_spec (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) ) ”
) \/
(
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (retval: Z) (PreH1 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH2 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) >= 0)) (PreH3 : (retval <= INT_MAX)) (PreH4 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH5 : (retval >= INT_MIN)) (PreH6 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH7 : (retval > 1)) (PreH8 : (avl_balance_factor_or_null before_high_level_spec avl_node_pre retval )) (PreH9 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH10 : (avl_node_pre <> 0)) (PreH11 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH12 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH13 : (avl_vvalid before_high_level_spec avl_node_pre )) (PreH14 : (avl_node_pre <> 0)) ,
  ((( &( "child_factor" ) )) # Int  |->_)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_graph_nodes_store before_high_level_spec (avl_nodes_without (before_high_level_spec) (avl_node_pre)) )
  **  ((( &( "balance_factor" ) )) # Int  |-> retval)
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
|--
  “ (avl_vvalid before_high_level_spec (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) ) ”
).

Definition xizi_avl_balance_partial_solve_wit_2_pure_split_goal_1 := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (retval: Z) (PreH1 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH2 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) >= 0)) (PreH3 : (retval <= INT_MAX)) (PreH4 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH5 : (retval >= INT_MIN)) (PreH6 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH7 : (retval > 1)) (PreH8 : (avl_balance_factor_or_null before_high_level_spec avl_node_pre retval )) (PreH9 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH10 : (avl_node_pre <> 0)) (PreH11 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH12 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH13 : (avl_vvalid before_high_level_spec avl_node_pre )) (PreH14 : (avl_node_pre <> 0)) ,
  ((( &( "child_factor" ) )) # Int  |->_)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_graph_nodes_store before_high_level_spec (avl_nodes_without (before_high_level_spec) (avl_node_pre)) )
  **  ((( &( "balance_factor" ) )) # Int  |-> retval)
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
|--
  “ (avl_vvalid before_high_level_spec (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) ) ”
.

Definition xizi_avl_balance_partial_solve_wit_2_aux := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (retval: Z) (PreH1 : (retval > 1)) (PreH2 : (avl_balance_factor_or_null before_high_level_spec avl_node_pre retval )) (PreH3 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH4 : (avl_node_pre <> 0)) (PreH5 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH6 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH7 : (avl_vvalid before_high_level_spec avl_node_pre )) (PreH8 : (avl_node_pre <> 0)) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_graph_nodes_store before_high_level_spec (avl_nodes_without (before_high_level_spec) (avl_node_pre)) )
|--
  “ ((avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) = (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre))))) ” 
  &&  “ (avl_balance_factor_input_valid before_high_level_spec ) ” 
  &&  “ (avl_node_pre <> 0) ” 
  &&  “ (avl_vvalid before_high_level_spec (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) ) ” 
  &&  “ (retval > 1) ” 
  &&  “ (avl_balance_factor_or_null before_high_level_spec avl_node_pre retval ) ” 
  &&  “ (avl_balance_factor_input_valid before_high_level_spec ) ” 
  &&  “ (avl_node_pre <> 0) ” 
  &&  “ (avl_balance_graph_input before_high_level_spec avl_node_pre ) ” 
  &&  “ (avl_balance_factor_input_valid before_high_level_spec ) ” 
  &&  “ (avl_vvalid before_high_level_spec avl_node_pre ) ” 
  &&  “ (avl_node_pre <> 0) ”
  &&  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_graph_nodes_store before_high_level_spec (avl_nodes_without (before_high_level_spec) (avl_node_pre)) )
.

Definition xizi_avl_balance_partial_solve_wit_2 := xizi_avl_balance_partial_solve_wit_2_pure -> xizi_avl_balance_partial_solve_wit_2_aux.

Definition xizi_avl_balance_partial_solve_wit_3_pure := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (child_factor: Z) (PreH1 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH2 : ((avl_model_balance_factor (before_high_level_spec) (avl_node_pre)) > 1)) (PreH3 : (avl_balance_factor_or_null before_high_level_spec (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) child_factor )) (PreH4 : (child_factor >= 0)) (PreH5 : (avl_right_rotation_input before_high_level_spec avl_node_pre )) ,
  ((( &( "child_factor" ) )) # Int  |-> child_factor)
  **  (avl_tree_store (avl_with_root_cache (before_high_level_spec) (avl_node_pre) ((avl_height_of (before_high_level_spec) (avl_node_pre)))) )
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "balance_factor" ) )) # Int  |-> (avl_model_balance_factor (before_high_level_spec) (avl_node_pre)))
|--
  “ (avl_right_rotation_input before_high_level_spec avl_node_pre ) ”
.

Definition xizi_avl_balance_partial_solve_wit_3_aux := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (child_factor: Z) (PreH1 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH2 : ((avl_model_balance_factor (before_high_level_spec) (avl_node_pre)) > 1)) (PreH3 : (avl_balance_factor_or_null before_high_level_spec (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) child_factor )) (PreH4 : (child_factor >= 0)) (PreH5 : (avl_right_rotation_input before_high_level_spec avl_node_pre )) ,
  (avl_tree_store (avl_with_root_cache (before_high_level_spec) (avl_node_pre) ((avl_height_of (before_high_level_spec) (avl_node_pre)))) )
|--
  “ (avl_right_rotation_input before_high_level_spec avl_node_pre ) ” 
  &&  “ (avl_balance_graph_input before_high_level_spec avl_node_pre ) ” 
  &&  “ ((avl_model_balance_factor (before_high_level_spec) (avl_node_pre)) > 1) ” 
  &&  “ (avl_balance_factor_or_null before_high_level_spec (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) child_factor ) ” 
  &&  “ (child_factor >= 0) ” 
  &&  “ (avl_right_rotation_input before_high_level_spec avl_node_pre ) ”
  &&  (avl_tree_store (avl_with_root_cache (before_high_level_spec) (avl_node_pre) ((avl_height_of (before_high_level_spec) (avl_node_pre)))) )
.

Definition xizi_avl_balance_partial_solve_wit_3 := xizi_avl_balance_partial_solve_wit_3_pure -> xizi_avl_balance_partial_solve_wit_3_aux.

Definition xizi_avl_balance_partial_solve_wit_4_pure := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (child_factor: Z) (PreH1 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH2 : ((avl_model_balance_factor (before_high_level_spec) (avl_node_pre)) > 1)) (PreH3 : (avl_balance_factor_or_null before_high_level_spec (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) child_factor )) (PreH4 : (child_factor < 0)) (PreH5 : (avl_lr_rotation_input before_high_level_spec avl_node_pre )) ,
  ((( &( "child_factor" ) )) # Int  |-> child_factor)
  **  (avl_tree_store (avl_with_root_cache (before_high_level_spec) (avl_node_pre) ((avl_height_of (before_high_level_spec) (avl_node_pre)))) )
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "balance_factor" ) )) # Int  |-> (avl_model_balance_factor (before_high_level_spec) (avl_node_pre)))
|--
  “ (avl_lr_rotation_input before_high_level_spec avl_node_pre ) ”
.

Definition xizi_avl_balance_partial_solve_wit_4_aux := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (child_factor: Z) (PreH1 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH2 : ((avl_model_balance_factor (before_high_level_spec) (avl_node_pre)) > 1)) (PreH3 : (avl_balance_factor_or_null before_high_level_spec (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) child_factor )) (PreH4 : (child_factor < 0)) (PreH5 : (avl_lr_rotation_input before_high_level_spec avl_node_pre )) ,
  (avl_tree_store (avl_with_root_cache (before_high_level_spec) (avl_node_pre) ((avl_height_of (before_high_level_spec) (avl_node_pre)))) )
|--
  “ (avl_lr_rotation_input before_high_level_spec avl_node_pre ) ” 
  &&  “ (avl_balance_graph_input before_high_level_spec avl_node_pre ) ” 
  &&  “ ((avl_model_balance_factor (before_high_level_spec) (avl_node_pre)) > 1) ” 
  &&  “ (avl_balance_factor_or_null before_high_level_spec (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) child_factor ) ” 
  &&  “ (child_factor < 0) ” 
  &&  “ (avl_lr_rotation_input before_high_level_spec avl_node_pre ) ”
  &&  (avl_tree_store (avl_with_root_cache (before_high_level_spec) (avl_node_pre) ((avl_height_of (before_high_level_spec) (avl_node_pre)))) )
.

Definition xizi_avl_balance_partial_solve_wit_4 := xizi_avl_balance_partial_solve_wit_4_pure -> xizi_avl_balance_partial_solve_wit_4_aux.

Definition xizi_avl_balance_partial_solve_wit_5_pure := 
(
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (retval: Z) (PreH1 : (retval < (-1))) (PreH2 : (retval <= 1)) (PreH3 : (avl_balance_factor_or_null before_high_level_spec avl_node_pre retval )) (PreH4 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH5 : (avl_node_pre <> 0)) (PreH6 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH7 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH8 : (avl_vvalid before_high_level_spec avl_node_pre )) (PreH9 : (avl_node_pre <> 0)) ,
  ((( &( "child_factor" ) )) # Int  |->_)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_graph_nodes_store before_high_level_spec (avl_nodes_without (before_high_level_spec) (avl_node_pre)) )
  **  ((( &( "balance_factor" ) )) # Int  |-> retval)
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
|--
  “ ((avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) = (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre))))) ” 
  &&  “ (avl_balance_factor_input_valid before_high_level_spec ) ” 
  &&  “ (avl_node_pre <> 0) ” 
  &&  “ (avl_vvalid before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) ) ”
) \/
(
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (retval: Z) (PreH1 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH2 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) >= 0)) (PreH3 : (retval <= INT_MAX)) (PreH4 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH5 : (retval >= INT_MIN)) (PreH6 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH7 : (retval < (-1))) (PreH8 : (retval <= 1)) (PreH9 : (avl_balance_factor_or_null before_high_level_spec avl_node_pre retval )) (PreH10 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH11 : (avl_node_pre <> 0)) (PreH12 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH13 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH14 : (avl_vvalid before_high_level_spec avl_node_pre )) (PreH15 : (avl_node_pre <> 0)) ,
  ((( &( "child_factor" ) )) # Int  |->_)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_graph_nodes_store before_high_level_spec (avl_nodes_without (before_high_level_spec) (avl_node_pre)) )
  **  ((( &( "balance_factor" ) )) # Int  |-> retval)
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
|--
  “ (avl_vvalid before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) ) ”
).

Definition xizi_avl_balance_partial_solve_wit_5_pure_split_goal_1 := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (retval: Z) (PreH1 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH2 : ((avl_height_of (before_high_level_spec) (avl_node_pre)) >= 0)) (PreH3 : (retval <= INT_MAX)) (PreH4 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH5 : (retval >= INT_MIN)) (PreH6 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH7 : (retval < (-1))) (PreH8 : (retval <= 1)) (PreH9 : (avl_balance_factor_or_null before_high_level_spec avl_node_pre retval )) (PreH10 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH11 : (avl_node_pre <> 0)) (PreH12 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH13 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH14 : (avl_vvalid before_high_level_spec avl_node_pre )) (PreH15 : (avl_node_pre <> 0)) ,
  ((( &( "child_factor" ) )) # Int  |->_)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_graph_nodes_store before_high_level_spec (avl_nodes_without (before_high_level_spec) (avl_node_pre)) )
  **  ((( &( "balance_factor" ) )) # Int  |-> retval)
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
|--
  “ (avl_vvalid before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) ) ”
.

Definition xizi_avl_balance_partial_solve_wit_5_aux := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (retval: Z) (PreH1 : (retval < (-1))) (PreH2 : (retval <= 1)) (PreH3 : (avl_balance_factor_or_null before_high_level_spec avl_node_pre retval )) (PreH4 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH5 : (avl_node_pre <> 0)) (PreH6 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH7 : (avl_balance_factor_input_valid before_high_level_spec )) (PreH8 : (avl_vvalid before_high_level_spec avl_node_pre )) (PreH9 : (avl_node_pre <> 0)) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_graph_nodes_store before_high_level_spec (avl_nodes_without (before_high_level_spec) (avl_node_pre)) )
|--
  “ ((avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) = (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre))))) ” 
  &&  “ (avl_balance_factor_input_valid before_high_level_spec ) ” 
  &&  “ (avl_node_pre <> 0) ” 
  &&  “ (avl_vvalid before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) ) ” 
  &&  “ (retval < (-1)) ” 
  &&  “ (retval <= 1) ” 
  &&  “ (avl_balance_factor_or_null before_high_level_spec avl_node_pre retval ) ” 
  &&  “ (avl_balance_factor_input_valid before_high_level_spec ) ” 
  &&  “ (avl_node_pre <> 0) ” 
  &&  “ (avl_balance_graph_input before_high_level_spec avl_node_pre ) ” 
  &&  “ (avl_balance_factor_input_valid before_high_level_spec ) ” 
  &&  “ (avl_vvalid before_high_level_spec avl_node_pre ) ” 
  &&  “ (avl_node_pre <> 0) ”
  &&  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_graph_nodes_store before_high_level_spec (avl_nodes_without (before_high_level_spec) (avl_node_pre)) )
.

Definition xizi_avl_balance_partial_solve_wit_5 := xizi_avl_balance_partial_solve_wit_5_pure -> xizi_avl_balance_partial_solve_wit_5_aux.

Definition xizi_avl_balance_partial_solve_wit_6_pure := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (child_factor: Z) (PreH1 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH2 : ((avl_model_balance_factor (before_high_level_spec) (avl_node_pre)) < (-1))) (PreH3 : (avl_balance_factor_or_null before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) child_factor )) (PreH4 : (child_factor <= 0)) (PreH5 : (avl_left_rotation_cached_input before_high_level_spec avl_node_pre )) ,
  ((( &( "child_factor" ) )) # Int  |-> child_factor)
  **  (avl_tree_store (avl_with_root_cache (before_high_level_spec) (avl_node_pre) ((avl_height_of (before_high_level_spec) (avl_node_pre)))) )
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "balance_factor" ) )) # Int  |-> (avl_model_balance_factor (before_high_level_spec) (avl_node_pre)))
|--
  “ (avl_left_rotation_cached_input before_high_level_spec avl_node_pre ) ”
.

Definition xizi_avl_balance_partial_solve_wit_6_aux := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (child_factor: Z) (PreH1 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH2 : ((avl_model_balance_factor (before_high_level_spec) (avl_node_pre)) < (-1))) (PreH3 : (avl_balance_factor_or_null before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) child_factor )) (PreH4 : (child_factor <= 0)) (PreH5 : (avl_left_rotation_cached_input before_high_level_spec avl_node_pre )) ,
  (avl_tree_store (avl_with_root_cache (before_high_level_spec) (avl_node_pre) ((avl_height_of (before_high_level_spec) (avl_node_pre)))) )
|--
  “ (avl_left_rotation_cached_input before_high_level_spec avl_node_pre ) ” 
  &&  “ (avl_balance_graph_input before_high_level_spec avl_node_pre ) ” 
  &&  “ ((avl_model_balance_factor (before_high_level_spec) (avl_node_pre)) < (-1)) ” 
  &&  “ (avl_balance_factor_or_null before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) child_factor ) ” 
  &&  “ (child_factor <= 0) ” 
  &&  “ (avl_left_rotation_cached_input before_high_level_spec avl_node_pre ) ”
  &&  (avl_tree_store (avl_with_root_cache (before_high_level_spec) (avl_node_pre) ((avl_height_of (before_high_level_spec) (avl_node_pre)))) )
.

Definition xizi_avl_balance_partial_solve_wit_6 := xizi_avl_balance_partial_solve_wit_6_pure -> xizi_avl_balance_partial_solve_wit_6_aux.

Definition xizi_avl_balance_partial_solve_wit_7_pure := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (child_factor: Z) (PreH1 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH2 : ((avl_model_balance_factor (before_high_level_spec) (avl_node_pre)) < (-1))) (PreH3 : (avl_balance_factor_or_null before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) child_factor )) (PreH4 : (child_factor > 0)) (PreH5 : (avl_rl_rotation_input before_high_level_spec avl_node_pre )) ,
  ((( &( "child_factor" ) )) # Int  |-> child_factor)
  **  (avl_tree_store (avl_with_root_cache (before_high_level_spec) (avl_node_pre) ((avl_height_of (before_high_level_spec) (avl_node_pre)))) )
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "balance_factor" ) )) # Int  |-> (avl_model_balance_factor (before_high_level_spec) (avl_node_pre)))
|--
  “ (avl_rl_rotation_input before_high_level_spec avl_node_pre ) ”
.

Definition xizi_avl_balance_partial_solve_wit_7_aux := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (child_factor: Z) (PreH1 : (avl_balance_graph_input before_high_level_spec avl_node_pre )) (PreH2 : ((avl_model_balance_factor (before_high_level_spec) (avl_node_pre)) < (-1))) (PreH3 : (avl_balance_factor_or_null before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) child_factor )) (PreH4 : (child_factor > 0)) (PreH5 : (avl_rl_rotation_input before_high_level_spec avl_node_pre )) ,
  (avl_tree_store (avl_with_root_cache (before_high_level_spec) (avl_node_pre) ((avl_height_of (before_high_level_spec) (avl_node_pre)))) )
|--
  “ (avl_rl_rotation_input before_high_level_spec avl_node_pre ) ” 
  &&  “ (avl_balance_graph_input before_high_level_spec avl_node_pre ) ” 
  &&  “ ((avl_model_balance_factor (before_high_level_spec) (avl_node_pre)) < (-1)) ” 
  &&  “ (avl_balance_factor_or_null before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) child_factor ) ” 
  &&  “ (child_factor > 0) ” 
  &&  “ (avl_rl_rotation_input before_high_level_spec avl_node_pre ) ”
  &&  (avl_tree_store (avl_with_root_cache (before_high_level_spec) (avl_node_pre) ((avl_height_of (before_high_level_spec) (avl_node_pre)))) )
.

Definition xizi_avl_balance_partial_solve_wit_7 := xizi_avl_balance_partial_solve_wit_7_pure -> xizi_avl_balance_partial_solve_wit_7_aux.

Module Type VC_Correct.


Axiom proof_of_xizi_avl_balance_safety_wit_1 : xizi_avl_balance_safety_wit_1.
Axiom proof_of_xizi_avl_balance_safety_wit_2 : xizi_avl_balance_safety_wit_2.
Axiom proof_of_xizi_avl_balance_safety_wit_3 : xizi_avl_balance_safety_wit_3.
Axiom proof_of_xizi_avl_balance_safety_wit_4 : xizi_avl_balance_safety_wit_4.
Axiom proof_of_xizi_avl_balance_safety_wit_5 : xizi_avl_balance_safety_wit_5.
Axiom proof_of_xizi_avl_balance_safety_wit_6 : xizi_avl_balance_safety_wit_6.
Axiom proof_of_xizi_avl_balance_safety_wit_7 : xizi_avl_balance_safety_wit_7.
Axiom proof_of_xizi_avl_balance_entail_wit_1 : xizi_avl_balance_entail_wit_1.
Axiom proof_of_xizi_avl_balance_entail_wit_2 : xizi_avl_balance_entail_wit_2.
Axiom proof_of_xizi_avl_balance_entail_wit_3 : xizi_avl_balance_entail_wit_3.
Axiom proof_of_xizi_avl_balance_entail_wit_4 : xizi_avl_balance_entail_wit_4.
Axiom proof_of_xizi_avl_balance_entail_wit_5 : xizi_avl_balance_entail_wit_5.
Axiom proof_of_xizi_avl_balance_return_wit_1 : xizi_avl_balance_return_wit_1.
Axiom proof_of_xizi_avl_balance_return_wit_2 : xizi_avl_balance_return_wit_2.
Axiom proof_of_xizi_avl_balance_return_wit_3 : xizi_avl_balance_return_wit_3.
Axiom proof_of_xizi_avl_balance_return_wit_4 : xizi_avl_balance_return_wit_4.
Axiom proof_of_xizi_avl_balance_return_wit_5 : xizi_avl_balance_return_wit_5.
Axiom proof_of_xizi_avl_balance_return_wit_6 : xizi_avl_balance_return_wit_6.
Axiom proof_of_xizi_avl_balance_partial_solve_wit_1_pure : xizi_avl_balance_partial_solve_wit_1_pure.
Axiom proof_of_xizi_avl_balance_partial_solve_wit_1 : xizi_avl_balance_partial_solve_wit_1.
Axiom proof_of_xizi_avl_balance_partial_solve_wit_2_pure : xizi_avl_balance_partial_solve_wit_2_pure.
Axiom proof_of_xizi_avl_balance_partial_solve_wit_2 : xizi_avl_balance_partial_solve_wit_2.
Axiom proof_of_xizi_avl_balance_partial_solve_wit_3_pure : xizi_avl_balance_partial_solve_wit_3_pure.
Axiom proof_of_xizi_avl_balance_partial_solve_wit_3 : xizi_avl_balance_partial_solve_wit_3.
Axiom proof_of_xizi_avl_balance_partial_solve_wit_4_pure : xizi_avl_balance_partial_solve_wit_4_pure.
Axiom proof_of_xizi_avl_balance_partial_solve_wit_4 : xizi_avl_balance_partial_solve_wit_4.
Axiom proof_of_xizi_avl_balance_partial_solve_wit_5_pure : xizi_avl_balance_partial_solve_wit_5_pure.
Axiom proof_of_xizi_avl_balance_partial_solve_wit_5 : xizi_avl_balance_partial_solve_wit_5.
Axiom proof_of_xizi_avl_balance_partial_solve_wit_6_pure : xizi_avl_balance_partial_solve_wit_6_pure.
Axiom proof_of_xizi_avl_balance_partial_solve_wit_6 : xizi_avl_balance_partial_solve_wit_6.
Axiom proof_of_xizi_avl_balance_partial_solve_wit_7_pure : xizi_avl_balance_partial_solve_wit_7_pure.
Axiom proof_of_xizi_avl_balance_partial_solve_wit_7 : xizi_avl_balance_partial_solve_wit_7.

End VC_Correct.
