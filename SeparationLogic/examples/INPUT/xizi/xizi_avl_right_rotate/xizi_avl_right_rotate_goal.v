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

(*----- Function xizi_avl_right_rotate -----*)

Definition xizi_avl_right_rotate_entail_wit_1_1 := 
(
forall (avl_node_pre: Z) (promoted_low_level_spec: Z) (rotated_low_level_spec: avl_model) (g_low_level_spec: avl_model) (retval: Z) (retval_2: Z) (PreH1 : ((unsigned_last_nbits (retval) (32)) > (unsigned_last_nbits (retval_2) (32)))) (PreH2 : (avl_height_result g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) retval_2 )) (PreH3 : (avl_height_result g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (promoted_low_level_spec)))) retval )) (PreH4 : (avl_height_input_valid g_low_level_spec )) (PreH5 : (avl_height_input_valid rotated_low_level_spec )) (PreH6 : (avl_vvalid g_low_level_spec avl_node_pre )) (PreH7 : (avl_node_pre <> 0)) (PreH8 : ((avl_root (g_low_level_spec)) = (Some (avl_node_pre)))) (PreH9 : ((avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) = promoted_low_level_spec)) (PreH10 : (promoted_low_level_spec <> 0)) (PreH11 : (avl_vvalid g_low_level_spec promoted_low_level_spec )) (PreH12 : (avl_right_rotation_model g_low_level_spec rotated_low_level_spec avl_node_pre promoted_low_level_spec )) (PreH13 : ((avl_root (rotated_low_level_spec)) = (Some (promoted_low_level_spec)))) (PreH14 : (avl_height_int_result_safe g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )) (PreH15 : (avl_height_int_result_safe g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (promoted_low_level_spec)))) )) (PreH16 : (avl_height_int_result_safe rotated_low_level_spec avl_node_pre )) (PreH17 : (avl_height_int_result_safe g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))) )) (PreH18 : (0 <= (avl_height_of (rotated_low_level_spec) (avl_node_pre)))) (PreH19 : ((avl_height_of (rotated_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH20 : (0 <= (avl_height_of (rotated_low_level_spec) (promoted_low_level_spec)))) (PreH21 : ((avl_height_of (rotated_low_level_spec) (promoted_low_level_spec)) <= UINT_MAX)) ,
  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (promoted_low_level_spec)))) )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (unsigned_last_nbits (((unsigned_last_nbits (retval) (32)) + 1 )) (32)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (promoted_low_level_spec)))))
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (promoted_low_level_spec)))
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (promoted_low_level_spec)))
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "right")) # Ptr  |-> avl_node_pre)
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))) )
|--
  “ (avl_height_input_valid g_low_level_spec ) ” 
  &&  “ (avl_height_input_valid rotated_low_level_spec ) ” 
  &&  “ (avl_height_int_result_safe rotated_low_level_spec avl_node_pre ) ” 
  &&  “ (avl_height_int_result_safe g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))) ) ” 
  &&  “ (avl_right_rotation_model g_low_level_spec rotated_low_level_spec avl_node_pre promoted_low_level_spec ) ” 
  &&  “ ((avl_root (rotated_low_level_spec)) = (Some (promoted_low_level_spec))) ” 
  &&  “ (0 <= (avl_height_of (rotated_low_level_spec) (promoted_low_level_spec))) ” 
  &&  “ ((avl_height_of (rotated_low_level_spec) (promoted_low_level_spec)) <= UINT_MAX) ”
  &&  (avl_subtree_store_at rotated_low_level_spec avl_node_pre )
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (promoted_low_level_spec)))
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (promoted_low_level_spec)))
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "right")) # Ptr  |-> avl_node_pre)
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))) )
) \/
(
forall (avl_node_pre: Z) (promoted_low_level_spec: Z) (rotated_low_level_spec: avl_model) (g_low_level_spec: avl_model) (retval: Z) (retval_2: Z) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (retval) (32)) + 1 )) (32)) <= UINT_MAX)) (PreH2 : ((unsigned_last_nbits (((unsigned_last_nbits (retval) (32)) + 1 )) (32)) >= 0)) (PreH3 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH5 : ((unsigned_last_nbits (retval) (32)) > (unsigned_last_nbits (retval_2) (32)))) (PreH6 : (avl_height_result g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) retval_2 )) (PreH7 : (avl_height_result g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (promoted_low_level_spec)))) retval )) (PreH8 : (avl_height_input_valid g_low_level_spec )) (PreH9 : (avl_height_input_valid rotated_low_level_spec )) (PreH10 : (avl_vvalid g_low_level_spec avl_node_pre )) (PreH11 : (avl_node_pre <> 0)) (PreH12 : ((avl_root (g_low_level_spec)) = (Some (avl_node_pre)))) (PreH13 : ((avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) = promoted_low_level_spec)) (PreH14 : (promoted_low_level_spec <> 0)) (PreH15 : (avl_vvalid g_low_level_spec promoted_low_level_spec )) (PreH16 : (avl_right_rotation_model g_low_level_spec rotated_low_level_spec avl_node_pre promoted_low_level_spec )) (PreH17 : ((avl_root (rotated_low_level_spec)) = (Some (promoted_low_level_spec)))) (PreH18 : (avl_height_int_result_safe g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )) (PreH19 : (avl_height_int_result_safe g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (promoted_low_level_spec)))) )) (PreH20 : (avl_height_int_result_safe rotated_low_level_spec avl_node_pre )) (PreH21 : (avl_height_int_result_safe g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))) )) (PreH22 : (0 <= (avl_height_of (rotated_low_level_spec) (avl_node_pre)))) (PreH23 : ((avl_height_of (rotated_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH24 : (0 <= (avl_height_of (rotated_low_level_spec) (promoted_low_level_spec)))) (PreH25 : ((avl_height_of (rotated_low_level_spec) (promoted_low_level_spec)) <= UINT_MAX)) ,
  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (promoted_low_level_spec)))) )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (unsigned_last_nbits (((unsigned_last_nbits (retval) (32)) + 1 )) (32)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (promoted_low_level_spec)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))) )
|--
  (avl_subtree_store_at rotated_low_level_spec avl_node_pre )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))) )
).

Definition xizi_avl_right_rotate_entail_wit_1_1_split_goal_spatial := 
forall (avl_node_pre: Z) (promoted_low_level_spec: Z) (rotated_low_level_spec: avl_model) (g_low_level_spec: avl_model) (retval: Z) (retval_2: Z) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (retval) (32)) + 1 )) (32)) <= UINT_MAX)) (PreH2 : ((unsigned_last_nbits (((unsigned_last_nbits (retval) (32)) + 1 )) (32)) >= 0)) (PreH3 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH5 : ((unsigned_last_nbits (retval) (32)) > (unsigned_last_nbits (retval_2) (32)))) (PreH6 : (avl_height_result g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) retval_2 )) (PreH7 : (avl_height_result g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (promoted_low_level_spec)))) retval )) (PreH8 : (avl_height_input_valid g_low_level_spec )) (PreH9 : (avl_height_input_valid rotated_low_level_spec )) (PreH10 : (avl_vvalid g_low_level_spec avl_node_pre )) (PreH11 : (avl_node_pre <> 0)) (PreH12 : ((avl_root (g_low_level_spec)) = (Some (avl_node_pre)))) (PreH13 : ((avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) = promoted_low_level_spec)) (PreH14 : (promoted_low_level_spec <> 0)) (PreH15 : (avl_vvalid g_low_level_spec promoted_low_level_spec )) (PreH16 : (avl_right_rotation_model g_low_level_spec rotated_low_level_spec avl_node_pre promoted_low_level_spec )) (PreH17 : ((avl_root (rotated_low_level_spec)) = (Some (promoted_low_level_spec)))) (PreH18 : (avl_height_int_result_safe g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )) (PreH19 : (avl_height_int_result_safe g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (promoted_low_level_spec)))) )) (PreH20 : (avl_height_int_result_safe rotated_low_level_spec avl_node_pre )) (PreH21 : (avl_height_int_result_safe g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))) )) (PreH22 : (0 <= (avl_height_of (rotated_low_level_spec) (avl_node_pre)))) (PreH23 : ((avl_height_of (rotated_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH24 : (0 <= (avl_height_of (rotated_low_level_spec) (promoted_low_level_spec)))) (PreH25 : ((avl_height_of (rotated_low_level_spec) (promoted_low_level_spec)) <= UINT_MAX)) ,
  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (promoted_low_level_spec)))) )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (unsigned_last_nbits (((unsigned_last_nbits (retval) (32)) + 1 )) (32)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (promoted_low_level_spec)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))) )
|--
  (avl_subtree_store_at rotated_low_level_spec avl_node_pre )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))) )
.

Definition xizi_avl_right_rotate_entail_wit_1_2 := 
(
forall (avl_node_pre: Z) (promoted_low_level_spec: Z) (rotated_low_level_spec: avl_model) (g_low_level_spec: avl_model) (retval: Z) (retval_2: Z) (PreH1 : ((unsigned_last_nbits (retval) (32)) <= (unsigned_last_nbits (retval_2) (32)))) (PreH2 : (avl_height_result g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) retval_2 )) (PreH3 : (avl_height_result g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (promoted_low_level_spec)))) retval )) (PreH4 : (avl_height_input_valid g_low_level_spec )) (PreH5 : (avl_height_input_valid rotated_low_level_spec )) (PreH6 : (avl_vvalid g_low_level_spec avl_node_pre )) (PreH7 : (avl_node_pre <> 0)) (PreH8 : ((avl_root (g_low_level_spec)) = (Some (avl_node_pre)))) (PreH9 : ((avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) = promoted_low_level_spec)) (PreH10 : (promoted_low_level_spec <> 0)) (PreH11 : (avl_vvalid g_low_level_spec promoted_low_level_spec )) (PreH12 : (avl_right_rotation_model g_low_level_spec rotated_low_level_spec avl_node_pre promoted_low_level_spec )) (PreH13 : ((avl_root (rotated_low_level_spec)) = (Some (promoted_low_level_spec)))) (PreH14 : (avl_height_int_result_safe g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )) (PreH15 : (avl_height_int_result_safe g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (promoted_low_level_spec)))) )) (PreH16 : (avl_height_int_result_safe rotated_low_level_spec avl_node_pre )) (PreH17 : (avl_height_int_result_safe g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))) )) (PreH18 : (0 <= (avl_height_of (rotated_low_level_spec) (avl_node_pre)))) (PreH19 : ((avl_height_of (rotated_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH20 : (0 <= (avl_height_of (rotated_low_level_spec) (promoted_low_level_spec)))) (PreH21 : ((avl_height_of (rotated_low_level_spec) (promoted_low_level_spec)) <= UINT_MAX)) ,
  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (promoted_low_level_spec)))) )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (unsigned_last_nbits (((unsigned_last_nbits (retval_2) (32)) + 1 )) (32)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (promoted_low_level_spec)))))
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (promoted_low_level_spec)))
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (promoted_low_level_spec)))
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "right")) # Ptr  |-> avl_node_pre)
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))) )
|--
  “ (avl_height_input_valid g_low_level_spec ) ” 
  &&  “ (avl_height_input_valid rotated_low_level_spec ) ” 
  &&  “ (avl_height_int_result_safe rotated_low_level_spec avl_node_pre ) ” 
  &&  “ (avl_height_int_result_safe g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))) ) ” 
  &&  “ (avl_right_rotation_model g_low_level_spec rotated_low_level_spec avl_node_pre promoted_low_level_spec ) ” 
  &&  “ ((avl_root (rotated_low_level_spec)) = (Some (promoted_low_level_spec))) ” 
  &&  “ (0 <= (avl_height_of (rotated_low_level_spec) (promoted_low_level_spec))) ” 
  &&  “ ((avl_height_of (rotated_low_level_spec) (promoted_low_level_spec)) <= UINT_MAX) ”
  &&  (avl_subtree_store_at rotated_low_level_spec avl_node_pre )
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (promoted_low_level_spec)))
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (promoted_low_level_spec)))
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "right")) # Ptr  |-> avl_node_pre)
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))) )
) \/
(
forall (avl_node_pre: Z) (promoted_low_level_spec: Z) (rotated_low_level_spec: avl_model) (g_low_level_spec: avl_model) (retval: Z) (retval_2: Z) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (retval_2) (32)) + 1 )) (32)) <= UINT_MAX)) (PreH2 : ((unsigned_last_nbits (((unsigned_last_nbits (retval_2) (32)) + 1 )) (32)) >= 0)) (PreH3 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH5 : ((unsigned_last_nbits (retval) (32)) <= (unsigned_last_nbits (retval_2) (32)))) (PreH6 : (avl_height_result g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) retval_2 )) (PreH7 : (avl_height_result g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (promoted_low_level_spec)))) retval )) (PreH8 : (avl_height_input_valid g_low_level_spec )) (PreH9 : (avl_height_input_valid rotated_low_level_spec )) (PreH10 : (avl_vvalid g_low_level_spec avl_node_pre )) (PreH11 : (avl_node_pre <> 0)) (PreH12 : ((avl_root (g_low_level_spec)) = (Some (avl_node_pre)))) (PreH13 : ((avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) = promoted_low_level_spec)) (PreH14 : (promoted_low_level_spec <> 0)) (PreH15 : (avl_vvalid g_low_level_spec promoted_low_level_spec )) (PreH16 : (avl_right_rotation_model g_low_level_spec rotated_low_level_spec avl_node_pre promoted_low_level_spec )) (PreH17 : ((avl_root (rotated_low_level_spec)) = (Some (promoted_low_level_spec)))) (PreH18 : (avl_height_int_result_safe g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )) (PreH19 : (avl_height_int_result_safe g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (promoted_low_level_spec)))) )) (PreH20 : (avl_height_int_result_safe rotated_low_level_spec avl_node_pre )) (PreH21 : (avl_height_int_result_safe g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))) )) (PreH22 : (0 <= (avl_height_of (rotated_low_level_spec) (avl_node_pre)))) (PreH23 : ((avl_height_of (rotated_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH24 : (0 <= (avl_height_of (rotated_low_level_spec) (promoted_low_level_spec)))) (PreH25 : ((avl_height_of (rotated_low_level_spec) (promoted_low_level_spec)) <= UINT_MAX)) ,
  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (promoted_low_level_spec)))) )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (unsigned_last_nbits (((unsigned_last_nbits (retval_2) (32)) + 1 )) (32)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (promoted_low_level_spec)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))) )
|--
  (avl_subtree_store_at rotated_low_level_spec avl_node_pre )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))) )
).

Definition xizi_avl_right_rotate_entail_wit_1_2_split_goal_spatial := 
forall (avl_node_pre: Z) (promoted_low_level_spec: Z) (rotated_low_level_spec: avl_model) (g_low_level_spec: avl_model) (retval: Z) (retval_2: Z) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (retval_2) (32)) + 1 )) (32)) <= UINT_MAX)) (PreH2 : ((unsigned_last_nbits (((unsigned_last_nbits (retval_2) (32)) + 1 )) (32)) >= 0)) (PreH3 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) <= INT_MAX)) (PreH4 : ((avl_key_of (g_low_level_spec) (avl_node_pre)) >= INT_MIN)) (PreH5 : ((unsigned_last_nbits (retval) (32)) <= (unsigned_last_nbits (retval_2) (32)))) (PreH6 : (avl_height_result g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) retval_2 )) (PreH7 : (avl_height_result g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (promoted_low_level_spec)))) retval )) (PreH8 : (avl_height_input_valid g_low_level_spec )) (PreH9 : (avl_height_input_valid rotated_low_level_spec )) (PreH10 : (avl_vvalid g_low_level_spec avl_node_pre )) (PreH11 : (avl_node_pre <> 0)) (PreH12 : ((avl_root (g_low_level_spec)) = (Some (avl_node_pre)))) (PreH13 : ((avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) = promoted_low_level_spec)) (PreH14 : (promoted_low_level_spec <> 0)) (PreH15 : (avl_vvalid g_low_level_spec promoted_low_level_spec )) (PreH16 : (avl_right_rotation_model g_low_level_spec rotated_low_level_spec avl_node_pre promoted_low_level_spec )) (PreH17 : ((avl_root (rotated_low_level_spec)) = (Some (promoted_low_level_spec)))) (PreH18 : (avl_height_int_result_safe g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )) (PreH19 : (avl_height_int_result_safe g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (promoted_low_level_spec)))) )) (PreH20 : (avl_height_int_result_safe rotated_low_level_spec avl_node_pre )) (PreH21 : (avl_height_int_result_safe g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))) )) (PreH22 : (0 <= (avl_height_of (rotated_low_level_spec) (avl_node_pre)))) (PreH23 : ((avl_height_of (rotated_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH24 : (0 <= (avl_height_of (rotated_low_level_spec) (promoted_low_level_spec)))) (PreH25 : ((avl_height_of (rotated_low_level_spec) (promoted_low_level_spec)) <= UINT_MAX)) ,
  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (promoted_low_level_spec)))) )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> (unsigned_last_nbits (((unsigned_last_nbits (retval_2) (32)) + 1 )) (32)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (promoted_low_level_spec)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))) )
|--
  (avl_subtree_store_at rotated_low_level_spec avl_node_pre )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))) )
.

Definition xizi_avl_right_rotate_return_wit_1 := 
(
forall (avl_node_pre: Z) (promoted_low_level_spec: Z) (rotated_low_level_spec: avl_model) (g_low_level_spec: avl_model) (retval: Z) (retval_2: Z) (PreH1 : ((unsigned_last_nbits (retval) (32)) > (unsigned_last_nbits (retval_2) (32)))) (PreH2 : (avl_height_result rotated_low_level_spec avl_node_pre retval_2 )) (PreH3 : (avl_height_result g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))) retval )) (PreH4 : (avl_height_input_valid g_low_level_spec )) (PreH5 : (avl_height_input_valid rotated_low_level_spec )) (PreH6 : (avl_height_int_result_safe rotated_low_level_spec avl_node_pre )) (PreH7 : (avl_height_int_result_safe g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))) )) (PreH8 : (avl_right_rotation_model g_low_level_spec rotated_low_level_spec avl_node_pre promoted_low_level_spec )) (PreH9 : ((avl_root (rotated_low_level_spec)) = (Some (promoted_low_level_spec)))) (PreH10 : (0 <= (avl_height_of (rotated_low_level_spec) (promoted_low_level_spec)))) (PreH11 : ((avl_height_of (rotated_low_level_spec) (promoted_low_level_spec)) <= UINT_MAX)) ,
  (avl_subtree_store_at rotated_low_level_spec avl_node_pre )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))) )
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (promoted_low_level_spec)))
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "height")) # UInt  |-> (unsigned_last_nbits (((unsigned_last_nbits (retval) (32)) + 1 )) (32)))
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "right")) # Ptr  |-> avl_node_pre)
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))))
|--
  “ (promoted_low_level_spec = promoted_low_level_spec) ” 
  &&  “ (avl_right_rotation_model g_low_level_spec rotated_low_level_spec avl_node_pre promoted_low_level_spec ) ” 
  &&  “ ((avl_root (rotated_low_level_spec)) = (Some (promoted_low_level_spec))) ”
  &&  (avl_tree_store rotated_low_level_spec )
) \/
(
forall (avl_node_pre: Z) (promoted_low_level_spec: Z) (rotated_low_level_spec: avl_model) (g_low_level_spec: avl_model) (retval: Z) (retval_2: Z) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (retval) (32)) + 1 )) (32)) <= UINT_MAX)) (PreH2 : ((unsigned_last_nbits (((unsigned_last_nbits (retval) (32)) + 1 )) (32)) >= 0)) (PreH3 : ((avl_key_of (g_low_level_spec) (promoted_low_level_spec)) <= INT_MAX)) (PreH4 : ((avl_key_of (g_low_level_spec) (promoted_low_level_spec)) >= INT_MIN)) (PreH5 : ((unsigned_last_nbits (retval) (32)) > (unsigned_last_nbits (retval_2) (32)))) (PreH6 : (avl_height_result rotated_low_level_spec avl_node_pre retval_2 )) (PreH7 : (avl_height_result g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))) retval )) (PreH8 : (avl_height_input_valid g_low_level_spec )) (PreH9 : (avl_height_input_valid rotated_low_level_spec )) (PreH10 : (avl_height_int_result_safe rotated_low_level_spec avl_node_pre )) (PreH11 : (avl_height_int_result_safe g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))) )) (PreH12 : (avl_right_rotation_model g_low_level_spec rotated_low_level_spec avl_node_pre promoted_low_level_spec )) (PreH13 : ((avl_root (rotated_low_level_spec)) = (Some (promoted_low_level_spec)))) (PreH14 : (0 <= (avl_height_of (rotated_low_level_spec) (promoted_low_level_spec)))) (PreH15 : ((avl_height_of (rotated_low_level_spec) (promoted_low_level_spec)) <= UINT_MAX)) ,
  (avl_subtree_store_at rotated_low_level_spec avl_node_pre )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))) )
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (promoted_low_level_spec)))
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "height")) # UInt  |-> (unsigned_last_nbits (((unsigned_last_nbits (retval) (32)) + 1 )) (32)))
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "right")) # Ptr  |-> avl_node_pre)
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))))
|--
  (avl_tree_store rotated_low_level_spec )
).

Definition xizi_avl_right_rotate_return_wit_1_split_goal_spatial := 
forall (avl_node_pre: Z) (promoted_low_level_spec: Z) (rotated_low_level_spec: avl_model) (g_low_level_spec: avl_model) (retval: Z) (retval_2: Z) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (retval) (32)) + 1 )) (32)) <= UINT_MAX)) (PreH2 : ((unsigned_last_nbits (((unsigned_last_nbits (retval) (32)) + 1 )) (32)) >= 0)) (PreH3 : ((avl_key_of (g_low_level_spec) (promoted_low_level_spec)) <= INT_MAX)) (PreH4 : ((avl_key_of (g_low_level_spec) (promoted_low_level_spec)) >= INT_MIN)) (PreH5 : ((unsigned_last_nbits (retval) (32)) > (unsigned_last_nbits (retval_2) (32)))) (PreH6 : (avl_height_result rotated_low_level_spec avl_node_pre retval_2 )) (PreH7 : (avl_height_result g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))) retval )) (PreH8 : (avl_height_input_valid g_low_level_spec )) (PreH9 : (avl_height_input_valid rotated_low_level_spec )) (PreH10 : (avl_height_int_result_safe rotated_low_level_spec avl_node_pre )) (PreH11 : (avl_height_int_result_safe g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))) )) (PreH12 : (avl_right_rotation_model g_low_level_spec rotated_low_level_spec avl_node_pre promoted_low_level_spec )) (PreH13 : ((avl_root (rotated_low_level_spec)) = (Some (promoted_low_level_spec)))) (PreH14 : (0 <= (avl_height_of (rotated_low_level_spec) (promoted_low_level_spec)))) (PreH15 : ((avl_height_of (rotated_low_level_spec) (promoted_low_level_spec)) <= UINT_MAX)) ,
  (avl_subtree_store_at rotated_low_level_spec avl_node_pre )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))) )
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (promoted_low_level_spec)))
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "height")) # UInt  |-> (unsigned_last_nbits (((unsigned_last_nbits (retval) (32)) + 1 )) (32)))
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "right")) # Ptr  |-> avl_node_pre)
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))))
|--
  (avl_tree_store rotated_low_level_spec )
.

Definition xizi_avl_right_rotate_return_wit_2 := 
(
forall (avl_node_pre: Z) (promoted_low_level_spec: Z) (rotated_low_level_spec: avl_model) (g_low_level_spec: avl_model) (retval: Z) (retval_2: Z) (PreH1 : ((unsigned_last_nbits (retval) (32)) <= (unsigned_last_nbits (retval_2) (32)))) (PreH2 : (avl_height_result rotated_low_level_spec avl_node_pre retval_2 )) (PreH3 : (avl_height_result g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))) retval )) (PreH4 : (avl_height_input_valid g_low_level_spec )) (PreH5 : (avl_height_input_valid rotated_low_level_spec )) (PreH6 : (avl_height_int_result_safe rotated_low_level_spec avl_node_pre )) (PreH7 : (avl_height_int_result_safe g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))) )) (PreH8 : (avl_right_rotation_model g_low_level_spec rotated_low_level_spec avl_node_pre promoted_low_level_spec )) (PreH9 : ((avl_root (rotated_low_level_spec)) = (Some (promoted_low_level_spec)))) (PreH10 : (0 <= (avl_height_of (rotated_low_level_spec) (promoted_low_level_spec)))) (PreH11 : ((avl_height_of (rotated_low_level_spec) (promoted_low_level_spec)) <= UINT_MAX)) ,
  (avl_subtree_store_at rotated_low_level_spec avl_node_pre )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))) )
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (promoted_low_level_spec)))
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "height")) # UInt  |-> (unsigned_last_nbits (((unsigned_last_nbits (retval_2) (32)) + 1 )) (32)))
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "right")) # Ptr  |-> avl_node_pre)
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))))
|--
  “ (promoted_low_level_spec = promoted_low_level_spec) ” 
  &&  “ (avl_right_rotation_model g_low_level_spec rotated_low_level_spec avl_node_pre promoted_low_level_spec ) ” 
  &&  “ ((avl_root (rotated_low_level_spec)) = (Some (promoted_low_level_spec))) ”
  &&  (avl_tree_store rotated_low_level_spec )
) \/
(
forall (avl_node_pre: Z) (promoted_low_level_spec: Z) (rotated_low_level_spec: avl_model) (g_low_level_spec: avl_model) (retval: Z) (retval_2: Z) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (retval_2) (32)) + 1 )) (32)) <= UINT_MAX)) (PreH2 : ((unsigned_last_nbits (((unsigned_last_nbits (retval_2) (32)) + 1 )) (32)) >= 0)) (PreH3 : ((avl_key_of (g_low_level_spec) (promoted_low_level_spec)) <= INT_MAX)) (PreH4 : ((avl_key_of (g_low_level_spec) (promoted_low_level_spec)) >= INT_MIN)) (PreH5 : ((unsigned_last_nbits (retval) (32)) <= (unsigned_last_nbits (retval_2) (32)))) (PreH6 : (avl_height_result rotated_low_level_spec avl_node_pre retval_2 )) (PreH7 : (avl_height_result g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))) retval )) (PreH8 : (avl_height_input_valid g_low_level_spec )) (PreH9 : (avl_height_input_valid rotated_low_level_spec )) (PreH10 : (avl_height_int_result_safe rotated_low_level_spec avl_node_pre )) (PreH11 : (avl_height_int_result_safe g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))) )) (PreH12 : (avl_right_rotation_model g_low_level_spec rotated_low_level_spec avl_node_pre promoted_low_level_spec )) (PreH13 : ((avl_root (rotated_low_level_spec)) = (Some (promoted_low_level_spec)))) (PreH14 : (0 <= (avl_height_of (rotated_low_level_spec) (promoted_low_level_spec)))) (PreH15 : ((avl_height_of (rotated_low_level_spec) (promoted_low_level_spec)) <= UINT_MAX)) ,
  (avl_subtree_store_at rotated_low_level_spec avl_node_pre )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))) )
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (promoted_low_level_spec)))
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "height")) # UInt  |-> (unsigned_last_nbits (((unsigned_last_nbits (retval_2) (32)) + 1 )) (32)))
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "right")) # Ptr  |-> avl_node_pre)
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))))
|--
  (avl_tree_store rotated_low_level_spec )
).

Definition xizi_avl_right_rotate_return_wit_2_split_goal_spatial := 
forall (avl_node_pre: Z) (promoted_low_level_spec: Z) (rotated_low_level_spec: avl_model) (g_low_level_spec: avl_model) (retval: Z) (retval_2: Z) (PreH1 : ((unsigned_last_nbits (((unsigned_last_nbits (retval_2) (32)) + 1 )) (32)) <= UINT_MAX)) (PreH2 : ((unsigned_last_nbits (((unsigned_last_nbits (retval_2) (32)) + 1 )) (32)) >= 0)) (PreH3 : ((avl_key_of (g_low_level_spec) (promoted_low_level_spec)) <= INT_MAX)) (PreH4 : ((avl_key_of (g_low_level_spec) (promoted_low_level_spec)) >= INT_MIN)) (PreH5 : ((unsigned_last_nbits (retval) (32)) <= (unsigned_last_nbits (retval_2) (32)))) (PreH6 : (avl_height_result rotated_low_level_spec avl_node_pre retval_2 )) (PreH7 : (avl_height_result g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))) retval )) (PreH8 : (avl_height_input_valid g_low_level_spec )) (PreH9 : (avl_height_input_valid rotated_low_level_spec )) (PreH10 : (avl_height_int_result_safe rotated_low_level_spec avl_node_pre )) (PreH11 : (avl_height_int_result_safe g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))) )) (PreH12 : (avl_right_rotation_model g_low_level_spec rotated_low_level_spec avl_node_pre promoted_low_level_spec )) (PreH13 : ((avl_root (rotated_low_level_spec)) = (Some (promoted_low_level_spec)))) (PreH14 : (0 <= (avl_height_of (rotated_low_level_spec) (promoted_low_level_spec)))) (PreH15 : ((avl_height_of (rotated_low_level_spec) (promoted_low_level_spec)) <= UINT_MAX)) ,
  (avl_subtree_store_at rotated_low_level_spec avl_node_pre )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))) )
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (promoted_low_level_spec)))
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "height")) # UInt  |-> (unsigned_last_nbits (((unsigned_last_nbits (retval_2) (32)) + 1 )) (32)))
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "right")) # Ptr  |-> avl_node_pre)
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))))
|--
  (avl_tree_store rotated_low_level_spec )
.

Definition xizi_avl_right_rotate_partial_solve_wit_1_pure := 
forall (avl_node_pre: Z) (root_cached_height_low_level_spec: Z) (promoted_low_level_spec: Z) (rotated_low_level_spec: avl_model) (g_low_level_spec: avl_model) (PreH1 : (avl_height_input_valid g_low_level_spec )) (PreH2 : (avl_height_input_valid rotated_low_level_spec )) (PreH3 : (avl_vvalid g_low_level_spec avl_node_pre )) (PreH4 : (avl_node_pre <> 0)) (PreH5 : ((avl_root (g_low_level_spec)) = (Some (avl_node_pre)))) (PreH6 : ((avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) = promoted_low_level_spec)) (PreH7 : (promoted_low_level_spec <> 0)) (PreH8 : (avl_vvalid g_low_level_spec promoted_low_level_spec )) (PreH9 : (avl_right_rotation_model g_low_level_spec rotated_low_level_spec avl_node_pre promoted_low_level_spec )) (PreH10 : ((avl_root (rotated_low_level_spec)) = (Some (promoted_low_level_spec)))) (PreH11 : (avl_height_int_result_safe g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )) (PreH12 : (avl_height_int_result_safe g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (promoted_low_level_spec)))) )) (PreH13 : (avl_height_int_result_safe rotated_low_level_spec avl_node_pre )) (PreH14 : (avl_height_int_result_safe g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))) )) (PreH15 : (0 <= (avl_height_of (rotated_low_level_spec) (avl_node_pre)))) (PreH16 : ((avl_height_of (rotated_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH17 : (0 <= (avl_height_of (rotated_low_level_spec) (promoted_low_level_spec)))) (PreH18 : ((avl_height_of (rotated_low_level_spec) (promoted_low_level_spec)) <= UINT_MAX)) ,
  ((( &( "left_height" ) )) # UInt  |->_)
  **  ((( &( "new_node" ) )) # Ptr  |-> promoted_low_level_spec)
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> root_cached_height_low_level_spec)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (promoted_low_level_spec)))))
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (promoted_low_level_spec)))
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (promoted_low_level_spec)))
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "right")) # Ptr  |-> avl_node_pre)
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (promoted_low_level_spec)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))) )
|--
  “ ((avl_ptr_of ((avl_right (g_low_level_spec) (promoted_low_level_spec)))) = (avl_ptr_of ((avl_right (g_low_level_spec) (promoted_low_level_spec))))) ” 
  &&  “ (avl_height_input_valid g_low_level_spec ) ” 
  &&  “ (avl_height_int_result_safe g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (promoted_low_level_spec)))) ) ”
.

Definition xizi_avl_right_rotate_partial_solve_wit_1_aux := 
forall (avl_node_pre: Z) (root_cached_height_low_level_spec: Z) (promoted_low_level_spec: Z) (rotated_low_level_spec: avl_model) (g_low_level_spec: avl_model) (PreH1 : (avl_height_input_valid g_low_level_spec )) (PreH2 : (avl_height_input_valid rotated_low_level_spec )) (PreH3 : (avl_vvalid g_low_level_spec avl_node_pre )) (PreH4 : (avl_node_pre <> 0)) (PreH5 : ((avl_root (g_low_level_spec)) = (Some (avl_node_pre)))) (PreH6 : ((avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) = promoted_low_level_spec)) (PreH7 : (promoted_low_level_spec <> 0)) (PreH8 : (avl_vvalid g_low_level_spec promoted_low_level_spec )) (PreH9 : (avl_right_rotation_model g_low_level_spec rotated_low_level_spec avl_node_pre promoted_low_level_spec )) (PreH10 : ((avl_root (rotated_low_level_spec)) = (Some (promoted_low_level_spec)))) (PreH11 : (avl_height_int_result_safe g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )) (PreH12 : (avl_height_int_result_safe g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (promoted_low_level_spec)))) )) (PreH13 : (avl_height_int_result_safe rotated_low_level_spec avl_node_pre )) (PreH14 : (avl_height_int_result_safe g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))) )) (PreH15 : (0 <= (avl_height_of (rotated_low_level_spec) (avl_node_pre)))) (PreH16 : ((avl_height_of (rotated_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH17 : (0 <= (avl_height_of (rotated_low_level_spec) (promoted_low_level_spec)))) (PreH18 : ((avl_height_of (rotated_low_level_spec) (promoted_low_level_spec)) <= UINT_MAX)) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> root_cached_height_low_level_spec)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (promoted_low_level_spec)))))
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (promoted_low_level_spec)))
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (promoted_low_level_spec)))
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "right")) # Ptr  |-> avl_node_pre)
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (promoted_low_level_spec)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))) )
|--
  “ ((avl_ptr_of ((avl_right (g_low_level_spec) (promoted_low_level_spec)))) = (avl_ptr_of ((avl_right (g_low_level_spec) (promoted_low_level_spec))))) ” 
  &&  “ (avl_height_input_valid g_low_level_spec ) ” 
  &&  “ (avl_height_int_result_safe g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (promoted_low_level_spec)))) ) ” 
  &&  “ (avl_height_input_valid g_low_level_spec ) ” 
  &&  “ (avl_height_input_valid rotated_low_level_spec ) ” 
  &&  “ (avl_vvalid g_low_level_spec avl_node_pre ) ” 
  &&  “ (avl_node_pre <> 0) ” 
  &&  “ ((avl_root (g_low_level_spec)) = (Some (avl_node_pre))) ” 
  &&  “ ((avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) = promoted_low_level_spec) ” 
  &&  “ (promoted_low_level_spec <> 0) ” 
  &&  “ (avl_vvalid g_low_level_spec promoted_low_level_spec ) ” 
  &&  “ (avl_right_rotation_model g_low_level_spec rotated_low_level_spec avl_node_pre promoted_low_level_spec ) ” 
  &&  “ ((avl_root (rotated_low_level_spec)) = (Some (promoted_low_level_spec))) ” 
  &&  “ (avl_height_int_result_safe g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) ) ” 
  &&  “ (avl_height_int_result_safe g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (promoted_low_level_spec)))) ) ” 
  &&  “ (avl_height_int_result_safe rotated_low_level_spec avl_node_pre ) ” 
  &&  “ (avl_height_int_result_safe g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))) ) ” 
  &&  “ (0 <= (avl_height_of (rotated_low_level_spec) (avl_node_pre))) ” 
  &&  “ ((avl_height_of (rotated_low_level_spec) (avl_node_pre)) <= UINT_MAX) ” 
  &&  “ (0 <= (avl_height_of (rotated_low_level_spec) (promoted_low_level_spec))) ” 
  &&  “ ((avl_height_of (rotated_low_level_spec) (promoted_low_level_spec)) <= UINT_MAX) ”
  &&  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (promoted_low_level_spec)))) )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> root_cached_height_low_level_spec)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (promoted_low_level_spec)))))
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (promoted_low_level_spec)))
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (promoted_low_level_spec)))
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "right")) # Ptr  |-> avl_node_pre)
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))) )
.

Definition xizi_avl_right_rotate_partial_solve_wit_1 := xizi_avl_right_rotate_partial_solve_wit_1_pure -> xizi_avl_right_rotate_partial_solve_wit_1_aux.

Definition xizi_avl_right_rotate_partial_solve_wit_2_pure := 
forall (avl_node_pre: Z) (root_cached_height_low_level_spec: Z) (promoted_low_level_spec: Z) (rotated_low_level_spec: avl_model) (g_low_level_spec: avl_model) (retval: Z) (PreH1 : (avl_height_result g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (promoted_low_level_spec)))) retval )) (PreH2 : (avl_height_input_valid g_low_level_spec )) (PreH3 : (avl_height_input_valid rotated_low_level_spec )) (PreH4 : (avl_vvalid g_low_level_spec avl_node_pre )) (PreH5 : (avl_node_pre <> 0)) (PreH6 : ((avl_root (g_low_level_spec)) = (Some (avl_node_pre)))) (PreH7 : ((avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) = promoted_low_level_spec)) (PreH8 : (promoted_low_level_spec <> 0)) (PreH9 : (avl_vvalid g_low_level_spec promoted_low_level_spec )) (PreH10 : (avl_right_rotation_model g_low_level_spec rotated_low_level_spec avl_node_pre promoted_low_level_spec )) (PreH11 : ((avl_root (rotated_low_level_spec)) = (Some (promoted_low_level_spec)))) (PreH12 : (avl_height_int_result_safe g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )) (PreH13 : (avl_height_int_result_safe g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (promoted_low_level_spec)))) )) (PreH14 : (avl_height_int_result_safe rotated_low_level_spec avl_node_pre )) (PreH15 : (avl_height_int_result_safe g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))) )) (PreH16 : (0 <= (avl_height_of (rotated_low_level_spec) (avl_node_pre)))) (PreH17 : ((avl_height_of (rotated_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH18 : (0 <= (avl_height_of (rotated_low_level_spec) (promoted_low_level_spec)))) (PreH19 : ((avl_height_of (rotated_low_level_spec) (promoted_low_level_spec)) <= UINT_MAX)) ,
  ((( &( "right_height" ) )) # UInt  |->_)
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (promoted_low_level_spec)))) )
  **  ((( &( "left_height" ) )) # UInt  |-> (unsigned_last_nbits (retval) (32)))
  **  ((( &( "new_node" ) )) # Ptr  |-> promoted_low_level_spec)
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> root_cached_height_low_level_spec)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (promoted_low_level_spec)))))
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (promoted_low_level_spec)))
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (promoted_low_level_spec)))
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "right")) # Ptr  |-> avl_node_pre)
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))) )
|--
  “ ((avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) = (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre))))) ” 
  &&  “ (avl_height_input_valid g_low_level_spec ) ” 
  &&  “ (avl_height_int_result_safe g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) ) ”
.

Definition xizi_avl_right_rotate_partial_solve_wit_2_aux := 
forall (avl_node_pre: Z) (root_cached_height_low_level_spec: Z) (promoted_low_level_spec: Z) (rotated_low_level_spec: avl_model) (g_low_level_spec: avl_model) (retval: Z) (PreH1 : (avl_height_result g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (promoted_low_level_spec)))) retval )) (PreH2 : (avl_height_input_valid g_low_level_spec )) (PreH3 : (avl_height_input_valid rotated_low_level_spec )) (PreH4 : (avl_vvalid g_low_level_spec avl_node_pre )) (PreH5 : (avl_node_pre <> 0)) (PreH6 : ((avl_root (g_low_level_spec)) = (Some (avl_node_pre)))) (PreH7 : ((avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) = promoted_low_level_spec)) (PreH8 : (promoted_low_level_spec <> 0)) (PreH9 : (avl_vvalid g_low_level_spec promoted_low_level_spec )) (PreH10 : (avl_right_rotation_model g_low_level_spec rotated_low_level_spec avl_node_pre promoted_low_level_spec )) (PreH11 : ((avl_root (rotated_low_level_spec)) = (Some (promoted_low_level_spec)))) (PreH12 : (avl_height_int_result_safe g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )) (PreH13 : (avl_height_int_result_safe g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (promoted_low_level_spec)))) )) (PreH14 : (avl_height_int_result_safe rotated_low_level_spec avl_node_pre )) (PreH15 : (avl_height_int_result_safe g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))) )) (PreH16 : (0 <= (avl_height_of (rotated_low_level_spec) (avl_node_pre)))) (PreH17 : ((avl_height_of (rotated_low_level_spec) (avl_node_pre)) <= UINT_MAX)) (PreH18 : (0 <= (avl_height_of (rotated_low_level_spec) (promoted_low_level_spec)))) (PreH19 : ((avl_height_of (rotated_low_level_spec) (promoted_low_level_spec)) <= UINT_MAX)) ,
  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (promoted_low_level_spec)))) )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> root_cached_height_low_level_spec)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (promoted_low_level_spec)))))
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (promoted_low_level_spec)))
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (promoted_low_level_spec)))
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "right")) # Ptr  |-> avl_node_pre)
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))) )
|--
  “ ((avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) = (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre))))) ” 
  &&  “ (avl_height_input_valid g_low_level_spec ) ” 
  &&  “ (avl_height_int_result_safe g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) ) ” 
  &&  “ (avl_height_result g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (promoted_low_level_spec)))) retval ) ” 
  &&  “ (avl_height_input_valid g_low_level_spec ) ” 
  &&  “ (avl_height_input_valid rotated_low_level_spec ) ” 
  &&  “ (avl_vvalid g_low_level_spec avl_node_pre ) ” 
  &&  “ (avl_node_pre <> 0) ” 
  &&  “ ((avl_root (g_low_level_spec)) = (Some (avl_node_pre))) ” 
  &&  “ ((avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) = promoted_low_level_spec) ” 
  &&  “ (promoted_low_level_spec <> 0) ” 
  &&  “ (avl_vvalid g_low_level_spec promoted_low_level_spec ) ” 
  &&  “ (avl_right_rotation_model g_low_level_spec rotated_low_level_spec avl_node_pre promoted_low_level_spec ) ” 
  &&  “ ((avl_root (rotated_low_level_spec)) = (Some (promoted_low_level_spec))) ” 
  &&  “ (avl_height_int_result_safe g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) ) ” 
  &&  “ (avl_height_int_result_safe g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (promoted_low_level_spec)))) ) ” 
  &&  “ (avl_height_int_result_safe rotated_low_level_spec avl_node_pre ) ” 
  &&  “ (avl_height_int_result_safe g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))) ) ” 
  &&  “ (0 <= (avl_height_of (rotated_low_level_spec) (avl_node_pre))) ” 
  &&  “ ((avl_height_of (rotated_low_level_spec) (avl_node_pre)) <= UINT_MAX) ” 
  &&  “ (0 <= (avl_height_of (rotated_low_level_spec) (promoted_low_level_spec))) ” 
  &&  “ ((avl_height_of (rotated_low_level_spec) (promoted_low_level_spec)) <= UINT_MAX) ”
  &&  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (promoted_low_level_spec)))) )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> root_cached_height_low_level_spec)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (promoted_low_level_spec)))))
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (promoted_low_level_spec)))
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (promoted_low_level_spec)))
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "right")) # Ptr  |-> avl_node_pre)
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))) )
.

Definition xizi_avl_right_rotate_partial_solve_wit_2 := xizi_avl_right_rotate_partial_solve_wit_2_pure -> xizi_avl_right_rotate_partial_solve_wit_2_aux.

Definition xizi_avl_right_rotate_partial_solve_wit_3_pure := 
forall (avl_node_pre: Z) (promoted_low_level_spec: Z) (rotated_low_level_spec: avl_model) (g_low_level_spec: avl_model) (lh: Z) (rh: Z) (PreH1 : (avl_height_input_valid g_low_level_spec )) (PreH2 : (avl_height_input_valid rotated_low_level_spec )) (PreH3 : (avl_height_int_result_safe rotated_low_level_spec avl_node_pre )) (PreH4 : (avl_height_int_result_safe g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))) )) (PreH5 : (avl_right_rotation_model g_low_level_spec rotated_low_level_spec avl_node_pre promoted_low_level_spec )) (PreH6 : ((avl_root (rotated_low_level_spec)) = (Some (promoted_low_level_spec)))) (PreH7 : (0 <= (avl_height_of (rotated_low_level_spec) (promoted_low_level_spec)))) (PreH8 : ((avl_height_of (rotated_low_level_spec) (promoted_low_level_spec)) <= UINT_MAX)) ,
  (avl_subtree_store_at rotated_low_level_spec avl_node_pre )
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (promoted_low_level_spec)))
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (promoted_low_level_spec)))
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "right")) # Ptr  |-> avl_node_pre)
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))) )
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "new_node" ) )) # Ptr  |-> promoted_low_level_spec)
  **  ((( &( "left_height" ) )) # UInt  |-> lh)
  **  ((( &( "right_height" ) )) # UInt  |-> rh)
|--
  “ ((avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))) = (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec))))) ” 
  &&  “ (avl_height_input_valid g_low_level_spec ) ” 
  &&  “ (avl_height_int_result_safe g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))) ) ”
.

Definition xizi_avl_right_rotate_partial_solve_wit_3_aux := 
forall (avl_node_pre: Z) (promoted_low_level_spec: Z) (rotated_low_level_spec: avl_model) (g_low_level_spec: avl_model) (PreH1 : (avl_height_input_valid g_low_level_spec )) (PreH2 : (avl_height_input_valid rotated_low_level_spec )) (PreH3 : (avl_height_int_result_safe rotated_low_level_spec avl_node_pre )) (PreH4 : (avl_height_int_result_safe g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))) )) (PreH5 : (avl_right_rotation_model g_low_level_spec rotated_low_level_spec avl_node_pre promoted_low_level_spec )) (PreH6 : ((avl_root (rotated_low_level_spec)) = (Some (promoted_low_level_spec)))) (PreH7 : (0 <= (avl_height_of (rotated_low_level_spec) (promoted_low_level_spec)))) (PreH8 : ((avl_height_of (rotated_low_level_spec) (promoted_low_level_spec)) <= UINT_MAX)) ,
  (avl_subtree_store_at rotated_low_level_spec avl_node_pre )
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (promoted_low_level_spec)))
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (promoted_low_level_spec)))
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "right")) # Ptr  |-> avl_node_pre)
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))) )
|--
  “ ((avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))) = (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec))))) ” 
  &&  “ (avl_height_input_valid g_low_level_spec ) ” 
  &&  “ (avl_height_int_result_safe g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))) ) ” 
  &&  “ (avl_height_input_valid g_low_level_spec ) ” 
  &&  “ (avl_height_input_valid rotated_low_level_spec ) ” 
  &&  “ (avl_height_int_result_safe rotated_low_level_spec avl_node_pre ) ” 
  &&  “ (avl_height_int_result_safe g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))) ) ” 
  &&  “ (avl_right_rotation_model g_low_level_spec rotated_low_level_spec avl_node_pre promoted_low_level_spec ) ” 
  &&  “ ((avl_root (rotated_low_level_spec)) = (Some (promoted_low_level_spec))) ” 
  &&  “ (0 <= (avl_height_of (rotated_low_level_spec) (promoted_low_level_spec))) ” 
  &&  “ ((avl_height_of (rotated_low_level_spec) (promoted_low_level_spec)) <= UINT_MAX) ”
  &&  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))) )
  **  (avl_subtree_store_at rotated_low_level_spec avl_node_pre )
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (promoted_low_level_spec)))
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (promoted_low_level_spec)))
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "right")) # Ptr  |-> avl_node_pre)
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))))
.

Definition xizi_avl_right_rotate_partial_solve_wit_3 := xizi_avl_right_rotate_partial_solve_wit_3_pure -> xizi_avl_right_rotate_partial_solve_wit_3_aux.

Definition xizi_avl_right_rotate_partial_solve_wit_4_pure := 
forall (avl_node_pre: Z) (promoted_low_level_spec: Z) (rotated_low_level_spec: avl_model) (g_low_level_spec: avl_model) (rh: Z) (retval: Z) (PreH1 : (avl_height_result g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))) retval )) (PreH2 : (avl_height_input_valid g_low_level_spec )) (PreH3 : (avl_height_input_valid rotated_low_level_spec )) (PreH4 : (avl_height_int_result_safe rotated_low_level_spec avl_node_pre )) (PreH5 : (avl_height_int_result_safe g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))) )) (PreH6 : (avl_right_rotation_model g_low_level_spec rotated_low_level_spec avl_node_pre promoted_low_level_spec )) (PreH7 : ((avl_root (rotated_low_level_spec)) = (Some (promoted_low_level_spec)))) (PreH8 : (0 <= (avl_height_of (rotated_low_level_spec) (promoted_low_level_spec)))) (PreH9 : ((avl_height_of (rotated_low_level_spec) (promoted_low_level_spec)) <= UINT_MAX)) ,
  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))) )
  **  (avl_subtree_store_at rotated_low_level_spec avl_node_pre )
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (promoted_low_level_spec)))
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (promoted_low_level_spec)))
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "right")) # Ptr  |-> avl_node_pre)
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))))
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  ((( &( "new_node" ) )) # Ptr  |-> promoted_low_level_spec)
  **  ((( &( "left_height" ) )) # UInt  |-> (unsigned_last_nbits (retval) (32)))
  **  ((( &( "right_height" ) )) # UInt  |-> rh)
|--
  “ (avl_node_pre = avl_node_pre) ” 
  &&  “ (avl_height_input_valid rotated_low_level_spec ) ” 
  &&  “ (avl_height_int_result_safe rotated_low_level_spec avl_node_pre ) ”
.

Definition xizi_avl_right_rotate_partial_solve_wit_4_aux := 
forall (avl_node_pre: Z) (promoted_low_level_spec: Z) (rotated_low_level_spec: avl_model) (g_low_level_spec: avl_model) (retval: Z) (PreH1 : (avl_height_result g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))) retval )) (PreH2 : (avl_height_input_valid g_low_level_spec )) (PreH3 : (avl_height_input_valid rotated_low_level_spec )) (PreH4 : (avl_height_int_result_safe rotated_low_level_spec avl_node_pre )) (PreH5 : (avl_height_int_result_safe g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))) )) (PreH6 : (avl_right_rotation_model g_low_level_spec rotated_low_level_spec avl_node_pre promoted_low_level_spec )) (PreH7 : ((avl_root (rotated_low_level_spec)) = (Some (promoted_low_level_spec)))) (PreH8 : (0 <= (avl_height_of (rotated_low_level_spec) (promoted_low_level_spec)))) (PreH9 : ((avl_height_of (rotated_low_level_spec) (promoted_low_level_spec)) <= UINT_MAX)) ,
  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))) )
  **  (avl_subtree_store_at rotated_low_level_spec avl_node_pre )
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (promoted_low_level_spec)))
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (promoted_low_level_spec)))
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "right")) # Ptr  |-> avl_node_pre)
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))))
|--
  “ (avl_node_pre = avl_node_pre) ” 
  &&  “ (avl_height_input_valid rotated_low_level_spec ) ” 
  &&  “ (avl_height_int_result_safe rotated_low_level_spec avl_node_pre ) ” 
  &&  “ (avl_height_result g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))) retval ) ” 
  &&  “ (avl_height_input_valid g_low_level_spec ) ” 
  &&  “ (avl_height_input_valid rotated_low_level_spec ) ” 
  &&  “ (avl_height_int_result_safe rotated_low_level_spec avl_node_pre ) ” 
  &&  “ (avl_height_int_result_safe g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))) ) ” 
  &&  “ (avl_right_rotation_model g_low_level_spec rotated_low_level_spec avl_node_pre promoted_low_level_spec ) ” 
  &&  “ ((avl_root (rotated_low_level_spec)) = (Some (promoted_low_level_spec))) ” 
  &&  “ (0 <= (avl_height_of (rotated_low_level_spec) (promoted_low_level_spec))) ” 
  &&  “ ((avl_height_of (rotated_low_level_spec) (promoted_low_level_spec)) <= UINT_MAX) ”
  &&  (avl_subtree_store_at rotated_low_level_spec avl_node_pre )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))) )
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (promoted_low_level_spec)))
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (promoted_low_level_spec)))
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "right")) # Ptr  |-> avl_node_pre)
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))))
.

Definition xizi_avl_right_rotate_partial_solve_wit_4 := xizi_avl_right_rotate_partial_solve_wit_4_pure -> xizi_avl_right_rotate_partial_solve_wit_4_aux.

Definition xizi_avl_right_rotate_derive_high_level_spec_by_low_level_spec := 
forall (avl_node_pre: Z) (root_cached_height_high_level_spec: Z) (before_high_level_spec: avl_model) ,
  “ (avl_right_rotation_input before_high_level_spec avl_node_pre ) ”
  &&  (avl_tree_store (avl_with_root_cache (before_high_level_spec) (avl_node_pre) (root_cached_height_high_level_spec)) )
|--
EX (g_low_level_spec: avl_model) (rotated_low_level_spec: avl_model) (promoted_low_level_spec: Z) (root_cached_height_low_level_spec: Z) ,
  (“ (avl_height_input_valid g_low_level_spec ) ” 
  &&  “ (avl_height_input_valid rotated_low_level_spec ) ” 
  &&  “ (avl_vvalid g_low_level_spec avl_node_pre ) ” 
  &&  “ (avl_node_pre <> 0) ” 
  &&  “ ((avl_root (g_low_level_spec)) = (Some (avl_node_pre))) ” 
  &&  “ ((avl_ptr_of ((avl_left (g_low_level_spec) (avl_node_pre)))) = promoted_low_level_spec) ” 
  &&  “ (promoted_low_level_spec <> 0) ” 
  &&  “ (avl_vvalid g_low_level_spec promoted_low_level_spec ) ” 
  &&  “ (avl_right_rotation_model g_low_level_spec rotated_low_level_spec avl_node_pre promoted_low_level_spec ) ” 
  &&  “ ((avl_root (rotated_low_level_spec)) = (Some (promoted_low_level_spec))) ” 
  &&  “ (avl_height_int_result_safe g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) ) ” 
  &&  “ (avl_height_int_result_safe g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (promoted_low_level_spec)))) ) ” 
  &&  “ (avl_height_int_result_safe rotated_low_level_spec avl_node_pre ) ” 
  &&  “ (avl_height_int_result_safe g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))) ) ” 
  &&  “ (0 <= (avl_height_of (rotated_low_level_spec) (avl_node_pre))) ” 
  &&  “ ((avl_height_of (rotated_low_level_spec) (avl_node_pre)) <= UINT_MAX) ” 
  &&  “ (0 <= (avl_height_of (rotated_low_level_spec) (promoted_low_level_spec))) ” 
  &&  “ ((avl_height_of (rotated_low_level_spec) (promoted_low_level_spec)) <= UINT_MAX) ”
  &&  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (avl_node_pre)))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> root_cached_height_low_level_spec)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))))
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> promoted_low_level_spec)
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "data")) # Int  |-> (avl_key_of (g_low_level_spec) (promoted_low_level_spec)))
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "height")) # UInt  |-> (avl_height_of (g_low_level_spec) (promoted_low_level_spec)))
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "right")) # Ptr  |-> (avl_ptr_of ((avl_right (g_low_level_spec) (promoted_low_level_spec)))))
  **  ((&((promoted_low_level_spec)  # "AvlNode" ->ₛ "left")) # Ptr  |-> (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))))
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (avl_node_pre)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_right (g_low_level_spec) (promoted_low_level_spec)))) )
  **  (avl_subtree_store_at g_low_level_spec (avl_ptr_of ((avl_left (g_low_level_spec) (promoted_low_level_spec)))) ))
  **
  ((EX retval_2,
  “ (retval_2 = promoted_low_level_spec) ” 
  &&  “ (avl_right_rotation_model g_low_level_spec rotated_low_level_spec avl_node_pre promoted_low_level_spec ) ” 
  &&  “ ((avl_root (rotated_low_level_spec)) = (Some (retval_2))) ”
  &&  (avl_tree_store rotated_low_level_spec ))
  -*
  (EX retval,
  (avl_right_rotation_post before_high_level_spec avl_node_pre retval )))
.

Module Type VC_Correct.


Axiom proof_of_xizi_avl_right_rotate_entail_wit_1_1 : xizi_avl_right_rotate_entail_wit_1_1.
Axiom proof_of_xizi_avl_right_rotate_entail_wit_1_2 : xizi_avl_right_rotate_entail_wit_1_2.
Axiom proof_of_xizi_avl_right_rotate_return_wit_1 : xizi_avl_right_rotate_return_wit_1.
Axiom proof_of_xizi_avl_right_rotate_return_wit_2 : xizi_avl_right_rotate_return_wit_2.
Axiom proof_of_xizi_avl_right_rotate_partial_solve_wit_1_pure : xizi_avl_right_rotate_partial_solve_wit_1_pure.
Axiom proof_of_xizi_avl_right_rotate_partial_solve_wit_1 : xizi_avl_right_rotate_partial_solve_wit_1.
Axiom proof_of_xizi_avl_right_rotate_partial_solve_wit_2_pure : xizi_avl_right_rotate_partial_solve_wit_2_pure.
Axiom proof_of_xizi_avl_right_rotate_partial_solve_wit_2 : xizi_avl_right_rotate_partial_solve_wit_2.
Axiom proof_of_xizi_avl_right_rotate_partial_solve_wit_3_pure : xizi_avl_right_rotate_partial_solve_wit_3_pure.
Axiom proof_of_xizi_avl_right_rotate_partial_solve_wit_3 : xizi_avl_right_rotate_partial_solve_wit_3.
Axiom proof_of_xizi_avl_right_rotate_partial_solve_wit_4_pure : xizi_avl_right_rotate_partial_solve_wit_4_pure.
Axiom proof_of_xizi_avl_right_rotate_partial_solve_wit_4 : xizi_avl_right_rotate_partial_solve_wit_4.
Axiom proof_of_xizi_avl_right_rotate_derive_high_level_spec_by_low_level_spec : xizi_avl_right_rotate_derive_high_level_spec_by_low_level_spec.

End VC_Correct.
