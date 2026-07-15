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

(*----- Function xizi_avl_lr_rotate -----*)

Definition xizi_avl_lr_rotate_return_wit_1 := 
forall (avl_node_pre: Z) (r1: Z) (l: Z) (tr: tree) (tr1: tree) (tr2: tree) (retval_2: Z) (retval: Z) (PreH1 : (retval = r1)) (PreH2 : (retval_2 = r1)) (PreH3 : (tr = (make_tree (tr1) (tr2)))) (PreH4 : (r1 <> 0)) (PreH5 : (avl_node_pre <> 0)) (PreH6 : (l <> 0)) ,
  (store_non_empty_tree r1 )
|--
  “ (retval = r1) ”
  &&  (store_non_empty_tree r1 )
.

Definition xizi_avl_lr_rotate_partial_solve_wit_1 := 
forall (avl_node_pre: Z) (r1: Z) (l1: Z) (h1: Z) (d1: Z) (r: Z) (l: Z) (h: Z) (d: Z) (PreH1 : (avl_node_pre <> 0)) (PreH2 : (l <> 0)) ,
  (single_tree_node avl_node_pre d h l r )
  **  (single_tree_node l d1 h1 l1 r1 )
  **  (store_tree_shape r )
  **  (store_tree_shape l1 )
  **  (store_non_empty_tree r1 )
|--
  EX (tr2: tree)  (tr1: tree)  (r_2: Z)  (l_2: Z)  (h_2: Z)  (d_2: Z)  (tr_3: tree)  (tr_2: tree)  (tr: tree) ,
  “ (tr_3 = (make_tree (tr1) (tr2))) ” 
  &&  “ (r1 <> 0) ” 
  &&  “ (avl_node_pre <> 0) ” 
  &&  “ (l <> 0) ”
  &&  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> l)
  **  ((&((l)  # "AvlNode" ->ₛ "right")) # Ptr  |-> r1)
  **  ((&((l)  # "AvlNode" ->ₛ "left")) # Ptr  |-> l1)
  **  ((&((l)  # "AvlNode" ->ₛ "height")) # UInt  |-> h1)
  **  ((&((l)  # "AvlNode" ->ₛ "data")) # Int  |-> d1)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> r)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> h)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> d)
  **  ((&((r1)  # "AvlNode" ->ₛ "right")) # Ptr  |-> r_2)
  **  ((&((r1)  # "AvlNode" ->ₛ "left")) # Ptr  |-> l_2)
  **  ((&((r1)  # "AvlNode" ->ₛ "height")) # UInt  |-> h_2)
  **  ((&((r1)  # "AvlNode" ->ₛ "data")) # Int  |-> d_2)
  **  (store_tree r_2 tr2 )
  **  (store_tree l_2 tr1 )
  **  (store_tree l1 tr_2 )
  **  (store_tree r tr )
.

Definition xizi_avl_lr_rotate_partial_solve_wit_2_pure := 
forall (avl_node_pre: Z) (r1: Z) (l1: Z) (h1: Z) (d1: Z) (r: Z) (l: Z) (h: Z) (d: Z) (tr: tree) (tr_2: tree) (tr_3: tree) (d_2: Z) (h_2: Z) (l_2: Z) (r_2: Z) (tr1: tree) (tr2: tree) (PreH1 : (tr_3 = (make_tree (tr1) (tr2)))) (PreH2 : (r1 <> 0)) (PreH3 : (avl_node_pre <> 0)) (PreH4 : (l <> 0)) ,
  (single_tree_node r1 d_2 h_2 l_2 r_2 )
  **  (single_tree_node avl_node_pre d h l r )
  **  (single_tree_node l d1 h1 l1 r1 )
  **  (store_tree r_2 tr2 )
  **  (store_tree l_2 tr1 )
  **  (store_tree l1 tr_2 )
  **  (store_tree r tr )
  **  ((( &( "left_node" ) )) # Ptr  |-> l)
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
|--
  “ (l <> 0) ”
.

Definition xizi_avl_lr_rotate_partial_solve_wit_2_aux := 
forall (avl_node_pre: Z) (r1: Z) (l1: Z) (h1: Z) (d1: Z) (r: Z) (l: Z) (h: Z) (d: Z) (tr: tree) (tr_2: tree) (tr_3: tree) (d_2: Z) (h_2: Z) (l_2: Z) (r_2: Z) (tr1: tree) (tr2: tree) (PreH1 : (tr_3 = (make_tree (tr1) (tr2)))) (PreH2 : (r1 <> 0)) (PreH3 : (avl_node_pre <> 0)) (PreH4 : (l <> 0)) ,
  (single_tree_node r1 d_2 h_2 l_2 r_2 )
  **  (single_tree_node avl_node_pre d h l r )
  **  (single_tree_node l d1 h1 l1 r1 )
  **  (store_tree r_2 tr2 )
  **  (store_tree l_2 tr1 )
  **  (store_tree l1 tr_2 )
  **  (store_tree r tr )
|--
  “ (l <> 0) ” 
  &&  “ (tr_3 = (make_tree (tr1) (tr2))) ” 
  &&  “ (r1 <> 0) ” 
  &&  “ (avl_node_pre <> 0) ” 
  &&  “ (l <> 0) ”
  &&  (single_tree_node l d1 h1 l1 r1 )
  **  (store_tree_shape l1 )
  **  (store_non_empty_tree r1 )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> r)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> l)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> h)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> d)
  **  (store_tree r tr )
.

Definition xizi_avl_lr_rotate_partial_solve_wit_2 := xizi_avl_lr_rotate_partial_solve_wit_2_pure -> xizi_avl_lr_rotate_partial_solve_wit_2_aux.

Definition xizi_avl_lr_rotate_partial_solve_wit_3_pure := 
forall (avl_node_pre: Z) (r1: Z) (r: Z) (l: Z) (h: Z) (d: Z) (tr: tree) (tr_2: tree) (tr1: tree) (tr2: tree) (retval: Z) (PreH1 : (retval = r1)) (PreH2 : (tr_2 = (make_tree (tr1) (tr2)))) (PreH3 : (r1 <> 0)) (PreH4 : (avl_node_pre <> 0)) (PreH5 : (l <> 0)) ,
  ((( &( "new_node" ) )) # Ptr  |->_)
  **  (store_non_empty_tree r1 )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> r)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> retval)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> h)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> d)
  **  (store_tree r tr )
  **  ((( &( "left_node" ) )) # Ptr  |-> l)
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
|--
  “ (avl_node_pre <> 0) ”
.

Definition xizi_avl_lr_rotate_partial_solve_wit_3_aux := 
forall (avl_node_pre: Z) (r1: Z) (r: Z) (l: Z) (h: Z) (d: Z) (tr: tree) (tr_2: tree) (tr1: tree) (tr2: tree) (retval: Z) (PreH1 : (retval = r1)) (PreH2 : (tr_2 = (make_tree (tr1) (tr2)))) (PreH3 : (r1 <> 0)) (PreH4 : (avl_node_pre <> 0)) (PreH5 : (l <> 0)) ,
  (store_non_empty_tree r1 )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> r)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> retval)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> h)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> d)
  **  (store_tree r tr )
|--
  “ (avl_node_pre <> 0) ” 
  &&  “ (retval = r1) ” 
  &&  “ (tr_2 = (make_tree (tr1) (tr2))) ” 
  &&  “ (r1 <> 0) ” 
  &&  “ (avl_node_pre <> 0) ” 
  &&  “ (l <> 0) ”
  &&  (single_tree_node avl_node_pre d h r1 r )
  **  (store_non_empty_tree r1 )
  **  (store_tree_shape r )
.

Definition xizi_avl_lr_rotate_partial_solve_wit_3 := xizi_avl_lr_rotate_partial_solve_wit_3_pure -> xizi_avl_lr_rotate_partial_solve_wit_3_aux.

Module Type VC_Correct.

Include xizi_avl_Strategy_Correct.

Axiom proof_of_xizi_avl_lr_rotate_return_wit_1 : xizi_avl_lr_rotate_return_wit_1.
Axiom proof_of_xizi_avl_lr_rotate_partial_solve_wit_1 : xizi_avl_lr_rotate_partial_solve_wit_1.
Axiom proof_of_xizi_avl_lr_rotate_partial_solve_wit_2_pure : xizi_avl_lr_rotate_partial_solve_wit_2_pure.
Axiom proof_of_xizi_avl_lr_rotate_partial_solve_wit_2 : xizi_avl_lr_rotate_partial_solve_wit_2.
Axiom proof_of_xizi_avl_lr_rotate_partial_solve_wit_3_pure : xizi_avl_lr_rotate_partial_solve_wit_3_pure.
Axiom proof_of_xizi_avl_lr_rotate_partial_solve_wit_3 : xizi_avl_lr_rotate_partial_solve_wit_3.

End VC_Correct.
