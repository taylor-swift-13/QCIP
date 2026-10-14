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

(*----- Function xizi_avl_lr_rotate -----*)

Definition xizi_avl_lr_rotate_entail_wit_1 := 
(
forall (avl_node_pre: Z) (root_cached_height_high_level_spec: Z) (before_high_level_spec: avl_model) (PreH1 : (avl_lr_rotation_input before_high_level_spec avl_node_pre )) ,
  (avl_tree_store (avl_with_root_cache (before_high_level_spec) (avl_node_pre) (root_cached_height_high_level_spec)) )
|--
  “ (avl_lr_rotation_input before_high_level_spec avl_node_pre ) ” 
  &&  “ (avl_left_rotation_cached_input (avl_subtree_model (before_high_level_spec) ((avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))) (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) ) ”
  &&  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> root_cached_height_high_level_spec)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_tree_store (avl_with_root_cache ((avl_subtree_model (before_high_level_spec) ((avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre))))))) ((avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre))))) ((avl_height_of (before_high_level_spec) ((avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))))) )
  **  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) )
) \/
(
forall (avl_node_pre: Z) (root_cached_height_high_level_spec: Z) (before_high_level_spec: avl_model) (PreH1 : (avl_lr_rotation_input before_high_level_spec avl_node_pre )) ,
  (avl_tree_store (avl_with_root_cache (before_high_level_spec) (avl_node_pre) (root_cached_height_high_level_spec)) )
|--
  “ (avl_left_rotation_cached_input (avl_subtree_model (before_high_level_spec) ((avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))) (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) ) ”
  &&  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> root_cached_height_high_level_spec)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_tree_store (avl_with_root_cache ((avl_subtree_model (before_high_level_spec) ((avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre))))))) ((avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre))))) ((avl_height_of (before_high_level_spec) ((avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))))) )
  **  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) )
).

Definition xizi_avl_lr_rotate_entail_wit_1_split_goal_1 := 
forall (avl_node_pre: Z) (root_cached_height_high_level_spec: Z) (before_high_level_spec: avl_model) (PreH1 : (avl_lr_rotation_input before_high_level_spec avl_node_pre )) ,
  (avl_tree_store (avl_with_root_cache (before_high_level_spec) (avl_node_pre) (root_cached_height_high_level_spec)) )
|--
  “ (avl_left_rotation_cached_input (avl_subtree_model (before_high_level_spec) ((avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))) (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) ) ”
.

Definition xizi_avl_lr_rotate_entail_wit_1_split_goal_spatial := 
forall (avl_node_pre: Z) (root_cached_height_high_level_spec: Z) (before_high_level_spec: avl_model) (PreH1 : (avl_lr_rotation_input before_high_level_spec avl_node_pre )) ,
  (avl_tree_store (avl_with_root_cache (before_high_level_spec) (avl_node_pre) (root_cached_height_high_level_spec)) )
|--
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> root_cached_height_high_level_spec)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_tree_store (avl_with_root_cache ((avl_subtree_model (before_high_level_spec) ((avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre))))))) ((avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre))))) ((avl_height_of (before_high_level_spec) ((avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))))) )
  **  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) )
.

Definition xizi_avl_lr_rotate_entail_wit_2 := 
(
forall (avl_node_pre: Z) (root_cached_height_high_level_spec: Z) (before_high_level_spec: avl_model) (retval: Z) (PreH1 : (avl_lr_rotation_input before_high_level_spec avl_node_pre )) (PreH2 : (avl_left_rotation_cached_input (avl_subtree_model (before_high_level_spec) ((avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))) (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) )) ,
  (avl_left_rotation_post (avl_subtree_model (before_high_level_spec) ((avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))) (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) retval )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> root_cached_height_high_level_spec)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> retval)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) )
|--
  EX (middle: avl_model) ,
  “ (avl_lr_rotation_input before_high_level_spec avl_node_pre ) ” 
  &&  “ (avl_lr_middle before_high_level_spec middle avl_node_pre (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_right (before_high_level_spec) ((avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))))) ) ” 
  &&  “ (avl_right_rotation_input middle avl_node_pre ) ”
  &&  (avl_tree_store (avl_with_root_cache (middle) (avl_node_pre) (root_cached_height_high_level_spec)) )
) \/
(
forall (avl_node_pre: Z) (root_cached_height_high_level_spec: Z) (before_high_level_spec: avl_model) (retval: Z) (PreH1 : (root_cached_height_high_level_spec <= UINT_MAX)) (PreH2 : (root_cached_height_high_level_spec >= 0)) (PreH3 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : ((avl_key_of (before_high_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH5 : (avl_lr_rotation_input before_high_level_spec avl_node_pre )) (PreH6 : (avl_left_rotation_cached_input (avl_subtree_model (before_high_level_spec) ((avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))) (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) )) ,
  (avl_left_rotation_post (avl_subtree_model (before_high_level_spec) ((avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))) (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) retval )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> root_cached_height_high_level_spec)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> retval)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) )
|--
  EX (middle: avl_model) ,
  “ (avl_lr_rotation_input before_high_level_spec avl_node_pre ) ” 
  &&  “ (avl_lr_middle before_high_level_spec middle avl_node_pre (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_right (before_high_level_spec) ((avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))))) ) ” 
  &&  “ (avl_right_rotation_input middle avl_node_pre ) ”
  &&  (avl_tree_store (avl_with_root_cache (middle) (avl_node_pre) (root_cached_height_high_level_spec)) )
).

Definition xizi_avl_lr_rotate_return_wit_1 := 
(
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (middle: avl_model) (retval: Z) (PreH1 : (avl_lr_rotation_input before_high_level_spec avl_node_pre )) (PreH2 : (avl_lr_middle before_high_level_spec middle avl_node_pre (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_right (before_high_level_spec) ((avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))))) )) (PreH3 : (avl_right_rotation_input middle avl_node_pre )) ,
  (avl_right_rotation_post middle avl_node_pre retval )
|--
  (avl_lr_rotation_post before_high_level_spec avl_node_pre retval )
) \/
(
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (middle: avl_model) (retval: Z) (PreH1 : (avl_lr_rotation_input before_high_level_spec avl_node_pre )) (PreH2 : (avl_lr_middle before_high_level_spec middle avl_node_pre (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_right (before_high_level_spec) ((avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))))) )) (PreH3 : (avl_right_rotation_input middle avl_node_pre )) ,
  (avl_right_rotation_post middle avl_node_pre retval )
|--
  (avl_lr_rotation_post before_high_level_spec avl_node_pre retval )
).

Definition xizi_avl_lr_rotate_return_wit_1_split_goal_spatial := 
forall (avl_node_pre: Z) (before_high_level_spec: avl_model) (middle: avl_model) (retval: Z) (PreH1 : (avl_lr_rotation_input before_high_level_spec avl_node_pre )) (PreH2 : (avl_lr_middle before_high_level_spec middle avl_node_pre (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_right (before_high_level_spec) ((avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))))) )) (PreH3 : (avl_right_rotation_input middle avl_node_pre )) ,
  (avl_right_rotation_post middle avl_node_pre retval )
|--
  (avl_lr_rotation_post before_high_level_spec avl_node_pre retval )
.

Definition xizi_avl_lr_rotate_partial_solve_wit_1_pure := 
forall (avl_node_pre: Z) (root_cached_height_high_level_spec: Z) (before_high_level_spec: avl_model) (PreH1 : (avl_lr_rotation_input before_high_level_spec avl_node_pre )) (PreH2 : (avl_left_rotation_cached_input (avl_subtree_model (before_high_level_spec) ((avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))) (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) )) ,
  ((( &( "left_node" ) )) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> root_cached_height_high_level_spec)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_tree_store (avl_with_root_cache ((avl_subtree_model (before_high_level_spec) ((avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre))))))) ((avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre))))) ((avl_height_of (before_high_level_spec) ((avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))))) )
  **  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) )
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
|--
  “ (avl_left_rotation_cached_input (avl_subtree_model (before_high_level_spec) ((avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))) (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) ) ”
.

Definition xizi_avl_lr_rotate_partial_solve_wit_1_aux := 
forall (avl_node_pre: Z) (root_cached_height_high_level_spec: Z) (before_high_level_spec: avl_model) (PreH1 : (avl_lr_rotation_input before_high_level_spec avl_node_pre )) (PreH2 : (avl_left_rotation_cached_input (avl_subtree_model (before_high_level_spec) ((avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))) (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) )) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> root_cached_height_high_level_spec)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_tree_store (avl_with_root_cache ((avl_subtree_model (before_high_level_spec) ((avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre))))))) ((avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre))))) ((avl_height_of (before_high_level_spec) ((avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))))) )
  **  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) )
|--
  “ (avl_left_rotation_cached_input (avl_subtree_model (before_high_level_spec) ((avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))) (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) ) ” 
  &&  “ (avl_lr_rotation_input before_high_level_spec avl_node_pre ) ” 
  &&  “ (avl_left_rotation_cached_input (avl_subtree_model (before_high_level_spec) ((avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))) (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) ) ”
  &&  (avl_tree_store (avl_with_root_cache ((avl_subtree_model (before_high_level_spec) ((avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre))))))) ((avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre))))) ((avl_height_of (before_high_level_spec) ((avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))))) )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (before_high_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> root_cached_height_high_level_spec)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))))
  **  (avl_subtree_store_at before_high_level_spec (avl_ptr_of ((avl_right (before_high_level_spec) (avl_node_pre)))) )
.

Definition xizi_avl_lr_rotate_partial_solve_wit_1 := xizi_avl_lr_rotate_partial_solve_wit_1_pure -> xizi_avl_lr_rotate_partial_solve_wit_1_aux.

Definition xizi_avl_lr_rotate_partial_solve_wit_2_pure := 
forall (avl_node_pre: Z) (root_cached_height_high_level_spec: Z) (before_high_level_spec: avl_model) (middle: avl_model) (PreH1 : (avl_lr_rotation_input before_high_level_spec avl_node_pre )) (PreH2 : (avl_lr_middle before_high_level_spec middle avl_node_pre (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_right (before_high_level_spec) ((avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))))) )) (PreH3 : (avl_right_rotation_input middle avl_node_pre )) ,
  ((( &( "new_node" ) )) # Ptr  |->_)
  **  (avl_tree_store (avl_with_root_cache (middle) (avl_node_pre) (root_cached_height_high_level_spec)) )
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "left_node" ) )) # Ptr  |-> (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))
|--
  “ (avl_right_rotation_input middle avl_node_pre ) ”
.

Definition xizi_avl_lr_rotate_partial_solve_wit_2_aux := 
forall (avl_node_pre: Z) (root_cached_height_high_level_spec: Z) (before_high_level_spec: avl_model) (middle: avl_model) (PreH1 : (avl_lr_rotation_input before_high_level_spec avl_node_pre )) (PreH2 : (avl_lr_middle before_high_level_spec middle avl_node_pre (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_right (before_high_level_spec) ((avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))))) )) (PreH3 : (avl_right_rotation_input middle avl_node_pre )) ,
  (avl_tree_store (avl_with_root_cache (middle) (avl_node_pre) (root_cached_height_high_level_spec)) )
|--
  “ (avl_right_rotation_input middle avl_node_pre ) ” 
  &&  “ (avl_lr_rotation_input before_high_level_spec avl_node_pre ) ” 
  &&  “ (avl_lr_middle before_high_level_spec middle avl_node_pre (avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))) (avl_ptr_of ((avl_right (before_high_level_spec) ((avl_ptr_of ((avl_left (before_high_level_spec) (avl_node_pre)))))))) ) ” 
  &&  “ (avl_right_rotation_input middle avl_node_pre ) ”
  &&  (avl_tree_store (avl_with_root_cache (middle) (avl_node_pre) (root_cached_height_high_level_spec)) )
.

Definition xizi_avl_lr_rotate_partial_solve_wit_2 := xizi_avl_lr_rotate_partial_solve_wit_2_pure -> xizi_avl_lr_rotate_partial_solve_wit_2_aux.

Module Type VC_Correct.


Axiom proof_of_xizi_avl_lr_rotate_entail_wit_1 : xizi_avl_lr_rotate_entail_wit_1.
Axiom proof_of_xizi_avl_lr_rotate_entail_wit_2 : xizi_avl_lr_rotate_entail_wit_2.
Axiom proof_of_xizi_avl_lr_rotate_return_wit_1 : xizi_avl_lr_rotate_return_wit_1.
Axiom proof_of_xizi_avl_lr_rotate_partial_solve_wit_1_pure : xizi_avl_lr_rotate_partial_solve_wit_1_pure.
Axiom proof_of_xizi_avl_lr_rotate_partial_solve_wit_1 : xizi_avl_lr_rotate_partial_solve_wit_1.
Axiom proof_of_xizi_avl_lr_rotate_partial_solve_wit_2_pure : xizi_avl_lr_rotate_partial_solve_wit_2_pure.
Axiom proof_of_xizi_avl_lr_rotate_partial_solve_wit_2 : xizi_avl_lr_rotate_partial_solve_wit_2.

End VC_Correct.
