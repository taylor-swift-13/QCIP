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

(*----- Function xizi_avl_balance_factor -----*)

Definition xizi_avl_balance_factor_safety_wit_1 := 
forall (avl_node_pre: Z) (tr: tree) (PreH1 : ((tree_depth (tr)) <= INT_MAX)) ,
  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  (store_tree avl_node_pre tr )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition xizi_avl_balance_factor_safety_wit_2 := 
forall (avl_node_pre: Z) (tr: tree) (PreH1 : (avl_node_pre = 0)) (PreH2 : ((tree_depth (tr)) <= INT_MAX)) ,
  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
  **  (store_tree avl_node_pre tr )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition xizi_avl_balance_factor_safety_wit_3 := 
(
forall (avl_node_pre: Z) (tr: tree) (d: Z) (h: Z) (l: Z) (r: Z) (tr1: tree) (tr2: tree) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (tree_depth (tr2)))) (PreH2 : (retval = (tree_depth (tr1)))) (PreH3 : (tr = (make_tree (tr1) (tr2)))) (PreH4 : (avl_node_pre <> 0)) (PreH5 : ((tree_depth (tr)) <= INT_MAX)) ,
  (store_tree r tr2 )
  **  ((( &( "rh" ) )) # Int  |-> retval_2)
  **  (store_tree l tr1 )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> r)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> l)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> h)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> d)
  **  ((( &( "lh" ) )) # Int  |-> retval)
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
|--
  “ ((retval - retval_2 ) <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= (retval - retval_2 )) ”
) \/
(
forall (avl_node_pre: Z) (tr: tree) (d: Z) (h: Z) (l: Z) (r: Z) (tr1: tree) (tr2: tree) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (tree_depth (tr2)))) (PreH2 : (retval = (tree_depth (tr1)))) (PreH3 : (tr = (make_tree (tr1) (tr2)))) (PreH4 : (avl_node_pre <> 0)) (PreH5 : ((tree_depth (tr)) <= INT_MAX)) ,
  (store_tree r tr2 )
  **  ((( &( "rh" ) )) # Int  |-> retval_2)
  **  (store_tree l tr1 )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> r)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> l)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> h)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> d)
  **  ((( &( "lh" ) )) # Int  |-> retval)
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
|--
  “ ((retval - retval_2 ) <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= (retval - retval_2 )) ”
).

Definition xizi_avl_balance_factor_safety_wit_3_split_goal_1 := 
forall (avl_node_pre: Z) (tr: tree) (d: Z) (h: Z) (l: Z) (r: Z) (tr1: tree) (tr2: tree) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (tree_depth (tr2)))) (PreH2 : (retval = (tree_depth (tr1)))) (PreH3 : (tr = (make_tree (tr1) (tr2)))) (PreH4 : (avl_node_pre <> 0)) (PreH5 : ((tree_depth (tr)) <= INT_MAX)) ,
  (store_tree r tr2 )
  **  ((( &( "rh" ) )) # Int  |-> retval_2)
  **  (store_tree l tr1 )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> r)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> l)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> h)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> d)
  **  ((( &( "lh" ) )) # Int  |-> retval)
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
|--
  “ ((retval - retval_2 ) <= INT_MAX) ”
.

Definition xizi_avl_balance_factor_safety_wit_3_split_goal_2 := 
forall (avl_node_pre: Z) (tr: tree) (d: Z) (h: Z) (l: Z) (r: Z) (tr1: tree) (tr2: tree) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (tree_depth (tr2)))) (PreH2 : (retval = (tree_depth (tr1)))) (PreH3 : (tr = (make_tree (tr1) (tr2)))) (PreH4 : (avl_node_pre <> 0)) (PreH5 : ((tree_depth (tr)) <= INT_MAX)) ,
  (store_tree r tr2 )
  **  ((( &( "rh" ) )) # Int  |-> retval_2)
  **  (store_tree l tr1 )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> r)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> l)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> h)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> d)
  **  ((( &( "lh" ) )) # Int  |-> retval)
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
|--
  “ ((INT_MIN) <= (retval - retval_2 )) ”
.

Definition xizi_avl_balance_factor_return_wit_1 := 
(
forall (avl_node_pre: Z) (tr: tree) (d: Z) (h: Z) (l: Z) (r: Z) (tr1: tree) (tr2: tree) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (tree_depth (tr2)))) (PreH2 : (retval = (tree_depth (tr1)))) (PreH3 : (tr = (make_tree (tr1) (tr2)))) (PreH4 : (avl_node_pre <> 0)) (PreH5 : ((tree_depth (tr)) <= INT_MAX)) ,
  (store_tree r tr2 )
  **  (store_tree l tr1 )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> r)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> l)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> h)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> d)
|--
  “ ((retval - retval_2 ) = (tree_balance_factor (tr))) ”
  &&  (store_tree avl_node_pre tr )
) \/
(
forall (avl_node_pre: Z) (tr: tree) (tr1: tree) (tr2: tree) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (tree_depth (tr2)))) (PreH2 : (retval = (tree_depth (tr1)))) (PreH3 : (tr = (make_tree (tr1) (tr2)))) (PreH4 : (avl_node_pre <> 0)) (PreH5 : ((tree_depth (tr)) <= INT_MAX)) ,
  TT && emp 
|--
  “ ((retval - retval_2 ) = (tree_balance_factor (tr))) ”
  &&  emp
).

Definition xizi_avl_balance_factor_return_wit_1_split_goal_1 := 
forall (avl_node_pre: Z) (tr: tree) (tr1: tree) (tr2: tree) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (tree_depth (tr2)))) (PreH2 : (retval = (tree_depth (tr1)))) (PreH3 : (tr = (make_tree (tr1) (tr2)))) (PreH4 : (avl_node_pre <> 0)) (PreH5 : ((tree_depth (tr)) <= INT_MAX)) ,
  TT && emp 
|--
  “ ((retval - retval_2 ) = (tree_balance_factor (tr))) ”
.

Definition xizi_avl_balance_factor_return_wit_2 := 
(
forall (avl_node_pre: Z) (tr: tree) (PreH1 : (avl_node_pre = 0)) (PreH2 : ((tree_depth (tr)) <= INT_MAX)) ,
  (store_tree avl_node_pre tr )
|--
  “ (0 = (tree_balance_factor (tr))) ”
  &&  (store_tree avl_node_pre tr )
) \/
(
forall (avl_node_pre: Z) (tr: tree) (PreH1 : (avl_node_pre = 0)) (PreH2 : ((tree_depth (tr)) <= INT_MAX)) ,
  TT && emp 
|--
  “ (0 = (tree_balance_factor (tr))) ”
  &&  emp
).

Definition xizi_avl_balance_factor_return_wit_2_split_goal_1 := 
forall (avl_node_pre: Z) (tr: tree) (PreH1 : (avl_node_pre = 0)) (PreH2 : ((tree_depth (tr)) <= INT_MAX)) ,
  TT && emp 
|--
  “ (0 = (tree_balance_factor (tr))) ”
.

Definition xizi_avl_balance_factor_partial_solve_wit_1 := 
forall (avl_node_pre: Z) (tr: tree) (PreH1 : (avl_node_pre <> 0)) (PreH2 : ((tree_depth (tr)) <= INT_MAX)) ,
  (store_tree avl_node_pre tr )
|--
  EX (tr2: tree)  (tr1: tree)  (r: Z)  (l: Z)  (h: Z)  (d: Z) ,
  “ (tr = (make_tree (tr1) (tr2))) ” 
  &&  “ (avl_node_pre <> 0) ” 
  &&  “ ((tree_depth (tr)) <= INT_MAX) ”
  &&  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> l)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> r)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> h)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> d)
  **  (store_tree r tr2 )
  **  (store_tree l tr1 )
.

Definition xizi_avl_balance_factor_partial_solve_wit_2_pure := 
(
forall (avl_node_pre: Z) (tr: tree) (d: Z) (h: Z) (l: Z) (r: Z) (tr1: tree) (tr2: tree) (PreH1 : (tr = (make_tree (tr1) (tr2)))) (PreH2 : (avl_node_pre <> 0)) (PreH3 : ((tree_depth (tr)) <= INT_MAX)) ,
  (single_tree_node avl_node_pre d h l r )
  **  (store_tree r tr2 )
  **  (store_tree l tr1 )
  **  ((( &( "lh" ) )) # Int  |->_)
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
|--
  “ ((tree_depth (tr1)) <= INT_MAX) ”
) \/
(
forall (avl_node_pre: Z) (tr: tree) (d: Z) (h: Z) (l: Z) (r: Z) (tr1: tree) (tr2: tree) (PreH1 : (h <= UINT_MAX)) (PreH2 : (h >= 0)) (PreH3 : (d <= INT_MAX)) (PreH4 : (d >= INT_MIN)) (PreH5 : (tr = (make_tree (tr1) (tr2)))) (PreH6 : (avl_node_pre <> 0)) (PreH7 : ((tree_depth (tr)) <= INT_MAX)) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> r)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> l)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> h)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> d)
  **  (store_tree r tr2 )
  **  (store_tree l tr1 )
  **  ((( &( "lh" ) )) # Int  |->_)
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
|--
  “ ((tree_depth (tr1)) <= INT_MAX) ”
).

Definition xizi_avl_balance_factor_partial_solve_wit_2_pure_split_goal_1 := 
forall (avl_node_pre: Z) (tr: tree) (d: Z) (h: Z) (l: Z) (r: Z) (tr1: tree) (tr2: tree) (PreH1 : (h <= UINT_MAX)) (PreH2 : (h >= 0)) (PreH3 : (d <= INT_MAX)) (PreH4 : (d >= INT_MIN)) (PreH5 : (tr = (make_tree (tr1) (tr2)))) (PreH6 : (avl_node_pre <> 0)) (PreH7 : ((tree_depth (tr)) <= INT_MAX)) ,
  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> r)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> l)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> h)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> d)
  **  (store_tree r tr2 )
  **  (store_tree l tr1 )
  **  ((( &( "lh" ) )) # Int  |->_)
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
|--
  “ ((tree_depth (tr1)) <= INT_MAX) ”
.

Definition xizi_avl_balance_factor_partial_solve_wit_2_aux := 
forall (avl_node_pre: Z) (tr: tree) (d: Z) (h: Z) (l: Z) (r: Z) (tr1: tree) (tr2: tree) (PreH1 : (tr = (make_tree (tr1) (tr2)))) (PreH2 : (avl_node_pre <> 0)) (PreH3 : ((tree_depth (tr)) <= INT_MAX)) ,
  (single_tree_node avl_node_pre d h l r )
  **  (store_tree r tr2 )
  **  (store_tree l tr1 )
|--
  “ ((tree_depth (tr1)) <= INT_MAX) ” 
  &&  “ (tr = (make_tree (tr1) (tr2))) ” 
  &&  “ (avl_node_pre <> 0) ” 
  &&  “ ((tree_depth (tr)) <= INT_MAX) ”
  &&  (store_tree l tr1 )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> r)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> l)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> h)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> d)
  **  (store_tree r tr2 )
.

Definition xizi_avl_balance_factor_partial_solve_wit_2 := xizi_avl_balance_factor_partial_solve_wit_2_pure -> xizi_avl_balance_factor_partial_solve_wit_2_aux.

Definition xizi_avl_balance_factor_partial_solve_wit_3_pure := 
(
forall (avl_node_pre: Z) (tr: tree) (d: Z) (h: Z) (l: Z) (r: Z) (tr1: tree) (tr2: tree) (retval: Z) (PreH1 : (retval = (tree_depth (tr1)))) (PreH2 : (tr = (make_tree (tr1) (tr2)))) (PreH3 : (avl_node_pre <> 0)) (PreH4 : ((tree_depth (tr)) <= INT_MAX)) ,
  ((( &( "rh" ) )) # Int  |->_)
  **  (store_tree l tr1 )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> r)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> l)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> h)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> d)
  **  (store_tree r tr2 )
  **  ((( &( "lh" ) )) # Int  |-> retval)
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
|--
  “ ((tree_depth (tr2)) <= INT_MAX) ”
) \/
(
forall (avl_node_pre: Z) (tr: tree) (d: Z) (h: Z) (l: Z) (r: Z) (tr1: tree) (tr2: tree) (retval: Z) (PreH1 : (h <= UINT_MAX)) (PreH2 : (h >= 0)) (PreH3 : (retval <= INT_MAX)) (PreH4 : (d <= INT_MAX)) (PreH5 : (retval >= INT_MIN)) (PreH6 : (d >= INT_MIN)) (PreH7 : (retval = (tree_depth (tr1)))) (PreH8 : (tr = (make_tree (tr1) (tr2)))) (PreH9 : (avl_node_pre <> 0)) (PreH10 : ((tree_depth (tr)) <= INT_MAX)) ,
  ((( &( "rh" ) )) # Int  |->_)
  **  (store_tree l tr1 )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> r)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> l)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> h)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> d)
  **  (store_tree r tr2 )
  **  ((( &( "lh" ) )) # Int  |-> retval)
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
|--
  “ ((tree_depth (tr2)) <= INT_MAX) ”
).

Definition xizi_avl_balance_factor_partial_solve_wit_3_pure_split_goal_1 := 
forall (avl_node_pre: Z) (tr: tree) (d: Z) (h: Z) (l: Z) (r: Z) (tr1: tree) (tr2: tree) (retval: Z) (PreH1 : (h <= UINT_MAX)) (PreH2 : (h >= 0)) (PreH3 : (retval <= INT_MAX)) (PreH4 : (d <= INT_MAX)) (PreH5 : (retval >= INT_MIN)) (PreH6 : (d >= INT_MIN)) (PreH7 : (retval = (tree_depth (tr1)))) (PreH8 : (tr = (make_tree (tr1) (tr2)))) (PreH9 : (avl_node_pre <> 0)) (PreH10 : ((tree_depth (tr)) <= INT_MAX)) ,
  ((( &( "rh" ) )) # Int  |->_)
  **  (store_tree l tr1 )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> r)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> l)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> h)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> d)
  **  (store_tree r tr2 )
  **  ((( &( "lh" ) )) # Int  |-> retval)
  **  ((( &( "avl_node" ) )) # Ptr  |-> avl_node_pre)
|--
  “ ((tree_depth (tr2)) <= INT_MAX) ”
.

Definition xizi_avl_balance_factor_partial_solve_wit_3_aux := 
forall (avl_node_pre: Z) (tr: tree) (d: Z) (h: Z) (l: Z) (r: Z) (tr1: tree) (tr2: tree) (retval: Z) (PreH1 : (retval = (tree_depth (tr1)))) (PreH2 : (tr = (make_tree (tr1) (tr2)))) (PreH3 : (avl_node_pre <> 0)) (PreH4 : ((tree_depth (tr)) <= INT_MAX)) ,
  (store_tree l tr1 )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> r)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> l)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> h)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> d)
  **  (store_tree r tr2 )
|--
  “ ((tree_depth (tr2)) <= INT_MAX) ” 
  &&  “ (retval = (tree_depth (tr1))) ” 
  &&  “ (tr = (make_tree (tr1) (tr2))) ” 
  &&  “ (avl_node_pre <> 0) ” 
  &&  “ ((tree_depth (tr)) <= INT_MAX) ”
  &&  (store_tree r tr2 )
  **  (store_tree l tr1 )
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "right")) # Ptr  |-> r)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "left")) # Ptr  |-> l)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "height")) # UInt  |-> h)
  **  ((&((avl_node_pre)  # "AvlNode" ->ₛ "data")) # Int  |-> d)
.

Definition xizi_avl_balance_factor_partial_solve_wit_3 := xizi_avl_balance_factor_partial_solve_wit_3_pure -> xizi_avl_balance_factor_partial_solve_wit_3_aux.

Module Type VC_Correct.

Include xizi_avl_Strategy_Correct.

Axiom proof_of_xizi_avl_balance_factor_safety_wit_1 : xizi_avl_balance_factor_safety_wit_1.
Axiom proof_of_xizi_avl_balance_factor_safety_wit_2 : xizi_avl_balance_factor_safety_wit_2.
Axiom proof_of_xizi_avl_balance_factor_safety_wit_3 : xizi_avl_balance_factor_safety_wit_3.
Axiom proof_of_xizi_avl_balance_factor_return_wit_1 : xizi_avl_balance_factor_return_wit_1.
Axiom proof_of_xizi_avl_balance_factor_return_wit_2 : xizi_avl_balance_factor_return_wit_2.
Axiom proof_of_xizi_avl_balance_factor_partial_solve_wit_1 : xizi_avl_balance_factor_partial_solve_wit_1.
Axiom proof_of_xizi_avl_balance_factor_partial_solve_wit_2_pure : xizi_avl_balance_factor_partial_solve_wit_2_pure.
Axiom proof_of_xizi_avl_balance_factor_partial_solve_wit_2 : xizi_avl_balance_factor_partial_solve_wit_2.
Axiom proof_of_xizi_avl_balance_factor_partial_solve_wit_3_pure : xizi_avl_balance_factor_partial_solve_wit_3_pure.
Axiom proof_of_xizi_avl_balance_factor_partial_solve_wit_3 : xizi_avl_balance_factor_partial_solve_wit_3.

End VC_Correct.
