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
Require Import QCIPLib.xizi.xizi_avl_common.xizi_avl_lib.
Local Open Scope sac.
From QCIPLib.xizi.xizi_avl_common Require Import xizi_avl_strategy_goal.
From QCIPLib.xizi.xizi_avl_common Require Import xizi_avl_strategy_proof.

(*----- Function xizi_avl_right_rotate -----*)

Definition xizi_avl_right_rotate_return_wit_1 := 
forall (avl_node_pre: Z) (r: Z) (l: Z) (h: Z) (d: Z) (tr: tree) (tr_2: tree) (d_2: Z) (h_2: Z) (l_2: Z) (r_2: Z) (tr1: tree) (tr2: tree) (PreH1 : (tr_2 = (make_tree (tr1) (tr2)))) (PreH2 : (l <> 0)) (PreH3 : (avl_node_pre <> 0)) ,
  (single_tree_node l d_2 h_2 l_2 avl_node_pre )
  **  (single_tree_node avl_node_pre d h r_2 r )
  **  (store_tree r_2 tr2 )
  **  (store_tree l_2 tr1 )
  **  (store_tree r tr )
|--
  “ (l = l) ”
  &&  (store_non_empty_tree l )
.

Definition xizi_avl_right_rotate_partial_solve_wit_1 := 
forall (avl_node_pre: Z) (r: Z) (l: Z) (h: Z) (d: Z) (PreH1 : (avl_node_pre <> 0)) ,
  (single_tree_node avl_node_pre d h l r )
  **  (store_non_empty_tree l )
  **  (store_tree_shape r )
|--
  EX (tr2: tree)  (tr1: tree)  (r_2: Z)  (l_2: Z)  (h_2: Z)  (d_2: Z)  (tr_2: tree)  (tr: tree) ,
  “ (tr_2 = (make_tree (tr1) (tr2))) ” 
  &&  “ (l <> 0) ” 
  &&  “ (avl_node_pre <> 0) ”
  &&  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> l)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> r)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> h)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> d)
  **  ((&((l)  # "AvlNode" ->ₛ "right")) # Ptr  |-> r_2)
  **  ((&((l)  # "AvlNode" ->ₛ "left")) # Ptr  |-> l_2)
  **  ((&((l)  # "AvlNode" ->ₛ "height")) # UInt  |-> h_2)
  **  ((&((l)  # "AvlNode" ->ₛ "data")) # Int  |-> d_2)
  **  (store_tree r_2 tr2 )
  **  (store_tree l_2 tr1 )
  **  (store_tree r tr )
.

Definition xizi_avl_right_rotate_partial_solve_wit_2 := 
forall (avl_node_pre: Z) (r: Z) (l: Z) (h: Z) (d: Z) (tr: tree) (tr_2: tree) (d_2: Z) (h_2: Z) (l_2: Z) (r_2: Z) (tr1: tree) (tr2: tree) (PreH1 : (tr_2 = (make_tree (tr1) (tr2)))) (PreH2 : (l <> 0)) (PreH3 : (avl_node_pre <> 0)) ,
  (single_tree_node l d_2 h_2 l_2 r_2 )
  **  (single_tree_node avl_node_pre d h l r )
  **  (store_tree r_2 tr2 )
  **  (store_tree l_2 tr1 )
  **  (store_tree r tr )
|--
  “ (tr_2 = (make_tree (tr1) (tr2))) ” 
  &&  “ (l <> 0) ” 
  &&  “ (avl_node_pre <> 0) ”
  &&  ((&((l)  # "AvlNode" ->ₛ "right")) # Ptr  |-> r_2)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> r)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> l)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> h)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> d)
  **  ((&((l)  # "AvlNode" ->ₛ "left")) # Ptr  |-> l_2)
  **  ((&((l)  # "AvlNode" ->ₛ "height")) # UInt  |-> h_2)
  **  ((&((l)  # "AvlNode" ->ₛ "data")) # Int  |-> d_2)
  **  (store_tree r_2 tr2 )
  **  (store_tree l_2 tr1 )
  **  (store_tree r tr )
.

Definition xizi_avl_right_rotate_partial_solve_wit_3 := 
forall (avl_node_pre: Z) (r: Z) (l: Z) (h: Z) (d: Z) (tr: tree) (tr_2: tree) (d_2: Z) (h_2: Z) (l_2: Z) (r_2: Z) (tr1: tree) (tr2: tree) (PreH1 : (tr_2 = (make_tree (tr1) (tr2)))) (PreH2 : (l <> 0)) (PreH3 : (avl_node_pre <> 0)) ,
  (single_tree_node l d_2 h_2 l_2 r_2 )
  **  (single_tree_node avl_node_pre d h l r )
  **  (store_tree r_2 tr2 )
  **  (store_tree l_2 tr1 )
  **  (store_tree r tr )
|--
  “ (tr_2 = (make_tree (tr1) (tr2))) ” 
  &&  “ (l <> 0) ” 
  &&  “ (avl_node_pre <> 0) ”
  &&  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |->_)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> r)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> h)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> d)
  **  ((&((l)  # "AvlNode" ->ₛ "right")) # Ptr  |-> r_2)
  **  ((&((l)  # "AvlNode" ->ₛ "left")) # Ptr  |-> l_2)
  **  ((&((l)  # "AvlNode" ->ₛ "height")) # UInt  |-> h_2)
  **  ((&((l)  # "AvlNode" ->ₛ "data")) # Int  |-> d_2)
  **  (store_tree r_2 tr2 )
  **  (store_tree l_2 tr1 )
  **  (store_tree r tr )
.

Definition xizi_avl_right_rotate_partial_solve_wit_4 := 
forall (avl_node_pre: Z) (r: Z) (l: Z) (h: Z) (d: Z) (tr: tree) (tr_2: tree) (d_2: Z) (h_2: Z) (l_2: Z) (r_2: Z) (tr1: tree) (tr2: tree) (PreH1 : (tr_2 = (make_tree (tr1) (tr2)))) (PreH2 : (l <> 0)) (PreH3 : (avl_node_pre <> 0)) ,
  (single_tree_node l d_2 h_2 l_2 r_2 )
  **  (single_tree_node avl_node_pre d h r_2 r )
  **  (store_tree r_2 tr2 )
  **  (store_tree l_2 tr1 )
  **  (store_tree r tr )
|--
  “ (tr_2 = (make_tree (tr1) (tr2))) ” 
  &&  “ (l <> 0) ” 
  &&  “ (avl_node_pre <> 0) ”
  &&  ((&((l)  # "AvlNode" ->ₛ "right")) # Ptr  |->_)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> r)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> r_2)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> h)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> d)
  **  ((&((l)  # "AvlNode" ->ₛ "left")) # Ptr  |-> l_2)
  **  ((&((l)  # "AvlNode" ->ₛ "height")) # UInt  |-> h_2)
  **  ((&((l)  # "AvlNode" ->ₛ "data")) # Int  |-> d_2)
  **  (store_tree r_2 tr2 )
  **  (store_tree l_2 tr1 )
  **  (store_tree r tr )
.

Module Type VC_Correct.

Include xizi_avl_Strategy_Correct.

Axiom proof_of_xizi_avl_right_rotate_return_wit_1 : xizi_avl_right_rotate_return_wit_1.
Axiom proof_of_xizi_avl_right_rotate_partial_solve_wit_1 : xizi_avl_right_rotate_partial_solve_wit_1.
Axiom proof_of_xizi_avl_right_rotate_partial_solve_wit_2 : xizi_avl_right_rotate_partial_solve_wit_2.
Axiom proof_of_xizi_avl_right_rotate_partial_solve_wit_3 : xizi_avl_right_rotate_partial_solve_wit_3.
Axiom proof_of_xizi_avl_right_rotate_partial_solve_wit_4 : xizi_avl_right_rotate_partial_solve_wit_4.

End VC_Correct.
