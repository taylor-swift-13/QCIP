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
Require Import QCIPLib.binaryTree.common.binaryTree_lib.
Local Open Scope sac.
From QCIPLib.binaryTree.common Require Import binaryTree_strategy_goal.
From QCIPLib.binaryTree.common Require Import binaryTree_strategy_proof.

(*----- Function count_nodes -----*)

Definition count_nodes_safety_wit_1 := 
forall (root_pre: Z) (tr: tree) (PreH1 : ((tree_size (tr)) <= INT_MAX)) ,
  ((( &( "root" ) )) # Ptr  |-> root_pre)
  **  (store_tree root_pre tr )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition count_nodes_safety_wit_2 := 
forall (root_pre: Z) (tr: tree) (PreH1 : (root_pre = 0)) (PreH2 : ((tree_size (tr)) <= INT_MAX)) ,
  ((( &( "root" ) )) # Ptr  |-> root_pre)
  **  (store_tree root_pre tr )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition count_nodes_safety_wit_3 := 
(
forall (root_pre: Z) (tr: tree) (k: Z) (v: Z) (h: Z) (l: Z) (r: Z) (tr1: tree) (tr2: tree) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (tree_size (tr2)))) (PreH2 : (retval = (tree_size (tr1)))) (PreH3 : (h <= 255)) (PreH4 : (h >= 0)) (PreH5 : (tr = (make_tree (tr1) (tr2)))) (PreH6 : (root_pre <> 0)) (PreH7 : ((tree_size (tr)) <= INT_MAX)) ,
  (store_tree r tr2 )
  **  ((( &( "rs" ) )) # Int  |-> retval_2)
  **  (store_tree l tr1 )
  **  ((&((root_pre)  # "tree" ->ₛ "rchild")) # Ptr  |-> r)
  **  ((&((root_pre)  # "tree" ->ₛ "lchild")) # Ptr  |-> l)
  **  ((&((root_pre)  # "tree" ->ₛ "height")) # UChar  |-> h)
  **  ((&((root_pre)  # "tree" ->ₛ "value")) # Int  |-> v)
  **  ((&((root_pre)  # "tree" ->ₛ "key")) # Int  |-> k)
  **  ((( &( "ls" ) )) # Int  |-> retval)
  **  ((( &( "root" ) )) # Ptr  |-> root_pre)
|--
  “ (((retval + retval_2 ) + 1 ) <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= ((retval + retval_2 ) + 1 )) ”
) \/
(
forall (root_pre: Z) (tr: tree) (k: Z) (v: Z) (h: Z) (l: Z) (r: Z) (tr1: tree) (tr2: tree) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (tree_size (tr2)))) (PreH2 : (retval = (tree_size (tr1)))) (PreH3 : (h <= 255)) (PreH4 : (h >= 0)) (PreH5 : (tr = (make_tree (tr1) (tr2)))) (PreH6 : (root_pre <> 0)) (PreH7 : ((tree_size (tr)) <= INT_MAX)) ,
  (store_tree r tr2 )
  **  ((( &( "rs" ) )) # Int  |-> retval_2)
  **  (store_tree l tr1 )
  **  ((&((root_pre)  # "tree" ->ₛ "rchild")) # Ptr  |-> r)
  **  ((&((root_pre)  # "tree" ->ₛ "lchild")) # Ptr  |-> l)
  **  ((&((root_pre)  # "tree" ->ₛ "height")) # UChar  |-> h)
  **  ((&((root_pre)  # "tree" ->ₛ "value")) # Int  |-> v)
  **  ((&((root_pre)  # "tree" ->ₛ "key")) # Int  |-> k)
  **  ((( &( "ls" ) )) # Int  |-> retval)
  **  ((( &( "root" ) )) # Ptr  |-> root_pre)
|--
  “ (((retval + retval_2 ) + 1 ) <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= ((retval + retval_2 ) + 1 )) ”
).

Definition count_nodes_safety_wit_3_split_goal_1 := 
forall (root_pre: Z) (tr: tree) (k: Z) (v: Z) (h: Z) (l: Z) (r: Z) (tr1: tree) (tr2: tree) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (tree_size (tr2)))) (PreH2 : (retval = (tree_size (tr1)))) (PreH3 : (h <= 255)) (PreH4 : (h >= 0)) (PreH5 : (tr = (make_tree (tr1) (tr2)))) (PreH6 : (root_pre <> 0)) (PreH7 : ((tree_size (tr)) <= INT_MAX)) ,
  (store_tree r tr2 )
  **  ((( &( "rs" ) )) # Int  |-> retval_2)
  **  (store_tree l tr1 )
  **  ((&((root_pre)  # "tree" ->ₛ "rchild")) # Ptr  |-> r)
  **  ((&((root_pre)  # "tree" ->ₛ "lchild")) # Ptr  |-> l)
  **  ((&((root_pre)  # "tree" ->ₛ "height")) # UChar  |-> h)
  **  ((&((root_pre)  # "tree" ->ₛ "value")) # Int  |-> v)
  **  ((&((root_pre)  # "tree" ->ₛ "key")) # Int  |-> k)
  **  ((( &( "ls" ) )) # Int  |-> retval)
  **  ((( &( "root" ) )) # Ptr  |-> root_pre)
|--
  “ (((retval + retval_2 ) + 1 ) <= INT_MAX) ”
.

Definition count_nodes_safety_wit_3_split_goal_2 := 
forall (root_pre: Z) (tr: tree) (k: Z) (v: Z) (h: Z) (l: Z) (r: Z) (tr1: tree) (tr2: tree) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (tree_size (tr2)))) (PreH2 : (retval = (tree_size (tr1)))) (PreH3 : (h <= 255)) (PreH4 : (h >= 0)) (PreH5 : (tr = (make_tree (tr1) (tr2)))) (PreH6 : (root_pre <> 0)) (PreH7 : ((tree_size (tr)) <= INT_MAX)) ,
  (store_tree r tr2 )
  **  ((( &( "rs" ) )) # Int  |-> retval_2)
  **  (store_tree l tr1 )
  **  ((&((root_pre)  # "tree" ->ₛ "rchild")) # Ptr  |-> r)
  **  ((&((root_pre)  # "tree" ->ₛ "lchild")) # Ptr  |-> l)
  **  ((&((root_pre)  # "tree" ->ₛ "height")) # UChar  |-> h)
  **  ((&((root_pre)  # "tree" ->ₛ "value")) # Int  |-> v)
  **  ((&((root_pre)  # "tree" ->ₛ "key")) # Int  |-> k)
  **  ((( &( "ls" ) )) # Int  |-> retval)
  **  ((( &( "root" ) )) # Ptr  |-> root_pre)
|--
  “ ((INT_MIN) <= ((retval + retval_2 ) + 1 )) ”
.

Definition count_nodes_safety_wit_4 := 
(
forall (root_pre: Z) (tr: tree) (k: Z) (v: Z) (h: Z) (l: Z) (r: Z) (tr1: tree) (tr2: tree) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (tree_size (tr2)))) (PreH2 : (retval = (tree_size (tr1)))) (PreH3 : (h <= 255)) (PreH4 : (h >= 0)) (PreH5 : (tr = (make_tree (tr1) (tr2)))) (PreH6 : (root_pre <> 0)) (PreH7 : ((tree_size (tr)) <= INT_MAX)) ,
  (store_tree r tr2 )
  **  ((( &( "rs" ) )) # Int  |-> retval_2)
  **  (store_tree l tr1 )
  **  ((&((root_pre)  # "tree" ->ₛ "rchild")) # Ptr  |-> r)
  **  ((&((root_pre)  # "tree" ->ₛ "lchild")) # Ptr  |-> l)
  **  ((&((root_pre)  # "tree" ->ₛ "height")) # UChar  |-> h)
  **  ((&((root_pre)  # "tree" ->ₛ "value")) # Int  |-> v)
  **  ((&((root_pre)  # "tree" ->ₛ "key")) # Int  |-> k)
  **  ((( &( "ls" ) )) # Int  |-> retval)
  **  ((( &( "root" ) )) # Ptr  |-> root_pre)
|--
  “ ((retval + retval_2 ) <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= (retval + retval_2 )) ”
) \/
(
forall (root_pre: Z) (tr: tree) (k: Z) (v: Z) (h: Z) (l: Z) (r: Z) (tr1: tree) (tr2: tree) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (tree_size (tr2)))) (PreH2 : (retval = (tree_size (tr1)))) (PreH3 : (h <= 255)) (PreH4 : (h >= 0)) (PreH5 : (tr = (make_tree (tr1) (tr2)))) (PreH6 : (root_pre <> 0)) (PreH7 : ((tree_size (tr)) <= INT_MAX)) ,
  (store_tree r tr2 )
  **  ((( &( "rs" ) )) # Int  |-> retval_2)
  **  (store_tree l tr1 )
  **  ((&((root_pre)  # "tree" ->ₛ "rchild")) # Ptr  |-> r)
  **  ((&((root_pre)  # "tree" ->ₛ "lchild")) # Ptr  |-> l)
  **  ((&((root_pre)  # "tree" ->ₛ "height")) # UChar  |-> h)
  **  ((&((root_pre)  # "tree" ->ₛ "value")) # Int  |-> v)
  **  ((&((root_pre)  # "tree" ->ₛ "key")) # Int  |-> k)
  **  ((( &( "ls" ) )) # Int  |-> retval)
  **  ((( &( "root" ) )) # Ptr  |-> root_pre)
|--
  “ ((retval + retval_2 ) <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= (retval + retval_2 )) ”
).

Definition count_nodes_safety_wit_4_split_goal_1 := 
forall (root_pre: Z) (tr: tree) (k: Z) (v: Z) (h: Z) (l: Z) (r: Z) (tr1: tree) (tr2: tree) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (tree_size (tr2)))) (PreH2 : (retval = (tree_size (tr1)))) (PreH3 : (h <= 255)) (PreH4 : (h >= 0)) (PreH5 : (tr = (make_tree (tr1) (tr2)))) (PreH6 : (root_pre <> 0)) (PreH7 : ((tree_size (tr)) <= INT_MAX)) ,
  (store_tree r tr2 )
  **  ((( &( "rs" ) )) # Int  |-> retval_2)
  **  (store_tree l tr1 )
  **  ((&((root_pre)  # "tree" ->ₛ "rchild")) # Ptr  |-> r)
  **  ((&((root_pre)  # "tree" ->ₛ "lchild")) # Ptr  |-> l)
  **  ((&((root_pre)  # "tree" ->ₛ "height")) # UChar  |-> h)
  **  ((&((root_pre)  # "tree" ->ₛ "value")) # Int  |-> v)
  **  ((&((root_pre)  # "tree" ->ₛ "key")) # Int  |-> k)
  **  ((( &( "ls" ) )) # Int  |-> retval)
  **  ((( &( "root" ) )) # Ptr  |-> root_pre)
|--
  “ ((retval + retval_2 ) <= INT_MAX) ”
.

Definition count_nodes_safety_wit_4_split_goal_2 := 
forall (root_pre: Z) (tr: tree) (k: Z) (v: Z) (h: Z) (l: Z) (r: Z) (tr1: tree) (tr2: tree) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (tree_size (tr2)))) (PreH2 : (retval = (tree_size (tr1)))) (PreH3 : (h <= 255)) (PreH4 : (h >= 0)) (PreH5 : (tr = (make_tree (tr1) (tr2)))) (PreH6 : (root_pre <> 0)) (PreH7 : ((tree_size (tr)) <= INT_MAX)) ,
  (store_tree r tr2 )
  **  ((( &( "rs" ) )) # Int  |-> retval_2)
  **  (store_tree l tr1 )
  **  ((&((root_pre)  # "tree" ->ₛ "rchild")) # Ptr  |-> r)
  **  ((&((root_pre)  # "tree" ->ₛ "lchild")) # Ptr  |-> l)
  **  ((&((root_pre)  # "tree" ->ₛ "height")) # UChar  |-> h)
  **  ((&((root_pre)  # "tree" ->ₛ "value")) # Int  |-> v)
  **  ((&((root_pre)  # "tree" ->ₛ "key")) # Int  |-> k)
  **  ((( &( "ls" ) )) # Int  |-> retval)
  **  ((( &( "root" ) )) # Ptr  |-> root_pre)
|--
  “ ((INT_MIN) <= (retval + retval_2 )) ”
.

Definition count_nodes_safety_wit_5 := 
forall (root_pre: Z) (tr: tree) (k: Z) (v: Z) (h: Z) (l: Z) (r: Z) (tr1: tree) (tr2: tree) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (tree_size (tr2)))) (PreH2 : (retval = (tree_size (tr1)))) (PreH3 : (h <= 255)) (PreH4 : (h >= 0)) (PreH5 : (tr = (make_tree (tr1) (tr2)))) (PreH6 : (root_pre <> 0)) (PreH7 : ((tree_size (tr)) <= INT_MAX)) ,
  (store_tree r tr2 )
  **  ((( &( "rs" ) )) # Int  |-> retval_2)
  **  (store_tree l tr1 )
  **  ((&((root_pre)  # "tree" ->ₛ "rchild")) # Ptr  |-> r)
  **  ((&((root_pre)  # "tree" ->ₛ "lchild")) # Ptr  |-> l)
  **  ((&((root_pre)  # "tree" ->ₛ "height")) # UChar  |-> h)
  **  ((&((root_pre)  # "tree" ->ₛ "value")) # Int  |-> v)
  **  ((&((root_pre)  # "tree" ->ₛ "key")) # Int  |-> k)
  **  ((( &( "ls" ) )) # Int  |-> retval)
  **  ((( &( "root" ) )) # Ptr  |-> root_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition count_nodes_return_wit_1 := 
(
forall (root_pre: Z) (tr: tree) (k: Z) (v: Z) (h: Z) (l: Z) (r: Z) (tr1: tree) (tr2: tree) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (tree_size (tr2)))) (PreH2 : (retval = (tree_size (tr1)))) (PreH3 : (h <= 255)) (PreH4 : (h >= 0)) (PreH5 : (tr = (make_tree (tr1) (tr2)))) (PreH6 : (root_pre <> 0)) (PreH7 : ((tree_size (tr)) <= INT_MAX)) ,
  (store_tree r tr2 )
  **  (store_tree l tr1 )
  **  ((&((root_pre)  # "tree" ->ₛ "rchild")) # Ptr  |-> r)
  **  ((&((root_pre)  # "tree" ->ₛ "lchild")) # Ptr  |-> l)
  **  ((&((root_pre)  # "tree" ->ₛ "height")) # UChar  |-> h)
  **  ((&((root_pre)  # "tree" ->ₛ "value")) # Int  |-> v)
  **  ((&((root_pre)  # "tree" ->ₛ "key")) # Int  |-> k)
|--
  “ (((retval + retval_2 ) + 1 ) = (tree_size (tr))) ”
  &&  (store_tree root_pre tr )
) \/
(
forall (root_pre: Z) (tr: tree) (h: Z) (tr1: tree) (tr2: tree) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (tree_size (tr2)))) (PreH2 : (retval = (tree_size (tr1)))) (PreH3 : (h <= 255)) (PreH4 : (h >= 0)) (PreH5 : (tr = (make_tree (tr1) (tr2)))) (PreH6 : (root_pre <> 0)) (PreH7 : ((tree_size (tr)) <= INT_MAX)) ,
  TT && emp 
|--
  “ (((retval + retval_2 ) + 1 ) = (tree_size (tr))) ”
  &&  emp
).

Definition count_nodes_return_wit_1_split_goal_1 := 
forall (root_pre: Z) (tr: tree) (h: Z) (tr1: tree) (tr2: tree) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (tree_size (tr2)))) (PreH2 : (retval = (tree_size (tr1)))) (PreH3 : (h <= 255)) (PreH4 : (h >= 0)) (PreH5 : (tr = (make_tree (tr1) (tr2)))) (PreH6 : (root_pre <> 0)) (PreH7 : ((tree_size (tr)) <= INT_MAX)) ,
  TT && emp 
|--
  “ (((retval + retval_2 ) + 1 ) = (tree_size (tr))) ”
.

Definition count_nodes_return_wit_2 := 
(
forall (root_pre: Z) (tr: tree) (PreH1 : (root_pre = 0)) (PreH2 : ((tree_size (tr)) <= INT_MAX)) ,
  (store_tree root_pre tr )
|--
  “ (0 = (tree_size (tr))) ”
  &&  (store_tree root_pre tr )
) \/
(
forall (root_pre: Z) (tr: tree) (PreH1 : (root_pre = 0)) (PreH2 : ((tree_size (tr)) <= INT_MAX)) ,
  TT && emp 
|--
  “ (0 = (tree_size (tr))) ”
  &&  emp
).

Definition count_nodes_return_wit_2_split_goal_1 := 
forall (root_pre: Z) (tr: tree) (PreH1 : (root_pre = 0)) (PreH2 : ((tree_size (tr)) <= INT_MAX)) ,
  TT && emp 
|--
  “ (0 = (tree_size (tr))) ”
.

Definition count_nodes_partial_solve_wit_1 := 
forall (root_pre: Z) (tr: tree) (PreH1 : (root_pre <> 0)) (PreH2 : ((tree_size (tr)) <= INT_MAX)) ,
  (store_tree root_pre tr )
|--
  EX (tr2: tree)  (tr1: tree)  (r: Z)  (l: Z)  (h: Z)  (v: Z)  (k: Z) ,
  “ (h <= 255) ” 
  &&  “ (h >= 0) ” 
  &&  “ (tr = (make_tree (tr1) (tr2))) ” 
  &&  “ (root_pre <> 0) ” 
  &&  “ ((tree_size (tr)) <= INT_MAX) ”
  &&  ((&((root_pre)  # "tree" ->ₛ "lchild")) # Ptr  |-> l)
  **  ((&((root_pre)  # "tree" ->ₛ "rchild")) # Ptr  |-> r)
  **  ((&((root_pre)  # "tree" ->ₛ "height")) # UChar  |-> h)
  **  ((&((root_pre)  # "tree" ->ₛ "value")) # Int  |-> v)
  **  ((&((root_pre)  # "tree" ->ₛ "key")) # Int  |-> k)
  **  (store_tree r tr2 )
  **  (store_tree l tr1 )
.

Definition count_nodes_partial_solve_wit_2_pure := 
(
forall (root_pre: Z) (tr: tree) (k: Z) (v: Z) (h: Z) (l: Z) (r: Z) (tr1: tree) (tr2: tree) (PreH1 : (h <= 255)) (PreH2 : (h >= 0)) (PreH3 : (tr = (make_tree (tr1) (tr2)))) (PreH4 : (root_pre <> 0)) (PreH5 : ((tree_size (tr)) <= INT_MAX)) ,
  (single_tree_node root_pre k v h l r )
  **  (store_tree r tr2 )
  **  (store_tree l tr1 )
  **  ((( &( "ls" ) )) # Int  |->_)
  **  ((( &( "root" ) )) # Ptr  |-> root_pre)
|--
  “ ((tree_size (tr1)) <= INT_MAX) ”
) \/
(
forall (root_pre: Z) (tr: tree) (k: Z) (v: Z) (h: Z) (l: Z) (r: Z) (tr1: tree) (tr2: tree) (PreH1 : (k <= INT_MAX)) (PreH2 : (v <= INT_MAX)) (PreH3 : (k >= INT_MIN)) (PreH4 : (v >= INT_MIN)) (PreH5 : (h <= 255)) (PreH6 : (h >= 0)) (PreH7 : (tr = (make_tree (tr1) (tr2)))) (PreH8 : (root_pre <> 0)) (PreH9 : ((tree_size (tr)) <= INT_MAX)) ,
  ((&((root_pre)  # "tree" ->ₛ "rchild")) # Ptr  |-> r)
  **  ((&((root_pre)  # "tree" ->ₛ "lchild")) # Ptr  |-> l)
  **  ((&((root_pre)  # "tree" ->ₛ "height")) # UChar  |-> h)
  **  ((&((root_pre)  # "tree" ->ₛ "value")) # Int  |-> v)
  **  ((&((root_pre)  # "tree" ->ₛ "key")) # Int  |-> k)
  **  (store_tree r tr2 )
  **  (store_tree l tr1 )
  **  ((( &( "ls" ) )) # Int  |->_)
  **  ((( &( "root" ) )) # Ptr  |-> root_pre)
|--
  “ ((tree_size (tr1)) <= INT_MAX) ”
).

Definition count_nodes_partial_solve_wit_2_pure_split_goal_1 := 
forall (root_pre: Z) (tr: tree) (k: Z) (v: Z) (h: Z) (l: Z) (r: Z) (tr1: tree) (tr2: tree) (PreH1 : (k <= INT_MAX)) (PreH2 : (v <= INT_MAX)) (PreH3 : (k >= INT_MIN)) (PreH4 : (v >= INT_MIN)) (PreH5 : (h <= 255)) (PreH6 : (h >= 0)) (PreH7 : (tr = (make_tree (tr1) (tr2)))) (PreH8 : (root_pre <> 0)) (PreH9 : ((tree_size (tr)) <= INT_MAX)) ,
  ((&((root_pre)  # "tree" ->ₛ "rchild")) # Ptr  |-> r)
  **  ((&((root_pre)  # "tree" ->ₛ "lchild")) # Ptr  |-> l)
  **  ((&((root_pre)  # "tree" ->ₛ "height")) # UChar  |-> h)
  **  ((&((root_pre)  # "tree" ->ₛ "value")) # Int  |-> v)
  **  ((&((root_pre)  # "tree" ->ₛ "key")) # Int  |-> k)
  **  (store_tree r tr2 )
  **  (store_tree l tr1 )
  **  ((( &( "ls" ) )) # Int  |->_)
  **  ((( &( "root" ) )) # Ptr  |-> root_pre)
|--
  “ ((tree_size (tr1)) <= INT_MAX) ”
.

Definition count_nodes_partial_solve_wit_2_aux := 
forall (root_pre: Z) (tr: tree) (k: Z) (v: Z) (h: Z) (l: Z) (r: Z) (tr1: tree) (tr2: tree) (PreH1 : (h <= 255)) (PreH2 : (h >= 0)) (PreH3 : (tr = (make_tree (tr1) (tr2)))) (PreH4 : (root_pre <> 0)) (PreH5 : ((tree_size (tr)) <= INT_MAX)) ,
  (single_tree_node root_pre k v h l r )
  **  (store_tree r tr2 )
  **  (store_tree l tr1 )
|--
  “ ((tree_size (tr1)) <= INT_MAX) ” 
  &&  “ (h <= 255) ” 
  &&  “ (h >= 0) ” 
  &&  “ (tr = (make_tree (tr1) (tr2))) ” 
  &&  “ (root_pre <> 0) ” 
  &&  “ ((tree_size (tr)) <= INT_MAX) ”
  &&  (store_tree l tr1 )
  **  ((&((root_pre)  # "tree" ->ₛ "rchild")) # Ptr  |-> r)
  **  ((&((root_pre)  # "tree" ->ₛ "lchild")) # Ptr  |-> l)
  **  ((&((root_pre)  # "tree" ->ₛ "height")) # UChar  |-> h)
  **  ((&((root_pre)  # "tree" ->ₛ "value")) # Int  |-> v)
  **  ((&((root_pre)  # "tree" ->ₛ "key")) # Int  |-> k)
  **  (store_tree r tr2 )
.

Definition count_nodes_partial_solve_wit_2 := count_nodes_partial_solve_wit_2_pure -> count_nodes_partial_solve_wit_2_aux.

Definition count_nodes_partial_solve_wit_3_pure := 
(
forall (root_pre: Z) (tr: tree) (k: Z) (v: Z) (h: Z) (l: Z) (r: Z) (tr1: tree) (tr2: tree) (retval: Z) (PreH1 : (retval = (tree_size (tr1)))) (PreH2 : (h <= 255)) (PreH3 : (h >= 0)) (PreH4 : (tr = (make_tree (tr1) (tr2)))) (PreH5 : (root_pre <> 0)) (PreH6 : ((tree_size (tr)) <= INT_MAX)) ,
  ((( &( "rs" ) )) # Int  |->_)
  **  (store_tree l tr1 )
  **  ((&((root_pre)  # "tree" ->ₛ "rchild")) # Ptr  |-> r)
  **  ((&((root_pre)  # "tree" ->ₛ "lchild")) # Ptr  |-> l)
  **  ((&((root_pre)  # "tree" ->ₛ "height")) # UChar  |-> h)
  **  ((&((root_pre)  # "tree" ->ₛ "value")) # Int  |-> v)
  **  ((&((root_pre)  # "tree" ->ₛ "key")) # Int  |-> k)
  **  (store_tree r tr2 )
  **  ((( &( "ls" ) )) # Int  |-> retval)
  **  ((( &( "root" ) )) # Ptr  |-> root_pre)
|--
  “ ((tree_size (tr2)) <= INT_MAX) ”
) \/
(
forall (root_pre: Z) (tr: tree) (k: Z) (v: Z) (h: Z) (l: Z) (r: Z) (tr1: tree) (tr2: tree) (retval: Z) (PreH1 : (retval <= INT_MAX)) (PreH2 : (k <= INT_MAX)) (PreH3 : (v <= INT_MAX)) (PreH4 : (retval >= INT_MIN)) (PreH5 : (k >= INT_MIN)) (PreH6 : (v >= INT_MIN)) (PreH7 : (retval = (tree_size (tr1)))) (PreH8 : (h <= 255)) (PreH9 : (h >= 0)) (PreH10 : (tr = (make_tree (tr1) (tr2)))) (PreH11 : (root_pre <> 0)) (PreH12 : ((tree_size (tr)) <= INT_MAX)) ,
  ((( &( "rs" ) )) # Int  |->_)
  **  (store_tree l tr1 )
  **  ((&((root_pre)  # "tree" ->ₛ "rchild")) # Ptr  |-> r)
  **  ((&((root_pre)  # "tree" ->ₛ "lchild")) # Ptr  |-> l)
  **  ((&((root_pre)  # "tree" ->ₛ "height")) # UChar  |-> h)
  **  ((&((root_pre)  # "tree" ->ₛ "value")) # Int  |-> v)
  **  ((&((root_pre)  # "tree" ->ₛ "key")) # Int  |-> k)
  **  (store_tree r tr2 )
  **  ((( &( "ls" ) )) # Int  |-> retval)
  **  ((( &( "root" ) )) # Ptr  |-> root_pre)
|--
  “ ((tree_size (tr2)) <= INT_MAX) ”
).

Definition count_nodes_partial_solve_wit_3_pure_split_goal_1 := 
forall (root_pre: Z) (tr: tree) (k: Z) (v: Z) (h: Z) (l: Z) (r: Z) (tr1: tree) (tr2: tree) (retval: Z) (PreH1 : (retval <= INT_MAX)) (PreH2 : (k <= INT_MAX)) (PreH3 : (v <= INT_MAX)) (PreH4 : (retval >= INT_MIN)) (PreH5 : (k >= INT_MIN)) (PreH6 : (v >= INT_MIN)) (PreH7 : (retval = (tree_size (tr1)))) (PreH8 : (h <= 255)) (PreH9 : (h >= 0)) (PreH10 : (tr = (make_tree (tr1) (tr2)))) (PreH11 : (root_pre <> 0)) (PreH12 : ((tree_size (tr)) <= INT_MAX)) ,
  ((( &( "rs" ) )) # Int  |->_)
  **  (store_tree l tr1 )
  **  ((&((root_pre)  # "tree" ->ₛ "rchild")) # Ptr  |-> r)
  **  ((&((root_pre)  # "tree" ->ₛ "lchild")) # Ptr  |-> l)
  **  ((&((root_pre)  # "tree" ->ₛ "height")) # UChar  |-> h)
  **  ((&((root_pre)  # "tree" ->ₛ "value")) # Int  |-> v)
  **  ((&((root_pre)  # "tree" ->ₛ "key")) # Int  |-> k)
  **  (store_tree r tr2 )
  **  ((( &( "ls" ) )) # Int  |-> retval)
  **  ((( &( "root" ) )) # Ptr  |-> root_pre)
|--
  “ ((tree_size (tr2)) <= INT_MAX) ”
.

Definition count_nodes_partial_solve_wit_3_aux := 
forall (root_pre: Z) (tr: tree) (k: Z) (v: Z) (h: Z) (l: Z) (r: Z) (tr1: tree) (tr2: tree) (retval: Z) (PreH1 : (retval = (tree_size (tr1)))) (PreH2 : (h <= 255)) (PreH3 : (h >= 0)) (PreH4 : (tr = (make_tree (tr1) (tr2)))) (PreH5 : (root_pre <> 0)) (PreH6 : ((tree_size (tr)) <= INT_MAX)) ,
  (store_tree l tr1 )
  **  ((&((root_pre)  # "tree" ->ₛ "rchild")) # Ptr  |-> r)
  **  ((&((root_pre)  # "tree" ->ₛ "lchild")) # Ptr  |-> l)
  **  ((&((root_pre)  # "tree" ->ₛ "height")) # UChar  |-> h)
  **  ((&((root_pre)  # "tree" ->ₛ "value")) # Int  |-> v)
  **  ((&((root_pre)  # "tree" ->ₛ "key")) # Int  |-> k)
  **  (store_tree r tr2 )
|--
  “ ((tree_size (tr2)) <= INT_MAX) ” 
  &&  “ (retval = (tree_size (tr1))) ” 
  &&  “ (h <= 255) ” 
  &&  “ (h >= 0) ” 
  &&  “ (tr = (make_tree (tr1) (tr2))) ” 
  &&  “ (root_pre <> 0) ” 
  &&  “ ((tree_size (tr)) <= INT_MAX) ”
  &&  (store_tree r tr2 )
  **  (store_tree l tr1 )
  **  ((&((root_pre)  # "tree" ->ₛ "rchild")) # Ptr  |-> r)
  **  ((&((root_pre)  # "tree" ->ₛ "lchild")) # Ptr  |-> l)
  **  ((&((root_pre)  # "tree" ->ₛ "height")) # UChar  |-> h)
  **  ((&((root_pre)  # "tree" ->ₛ "value")) # Int  |-> v)
  **  ((&((root_pre)  # "tree" ->ₛ "key")) # Int  |-> k)
.

Definition count_nodes_partial_solve_wit_3 := count_nodes_partial_solve_wit_3_pure -> count_nodes_partial_solve_wit_3_aux.

Module Type VC_Correct.

Include binaryTree_Strategy_Correct.

Axiom proof_of_count_nodes_safety_wit_1 : count_nodes_safety_wit_1.
Axiom proof_of_count_nodes_safety_wit_2 : count_nodes_safety_wit_2.
Axiom proof_of_count_nodes_safety_wit_3 : count_nodes_safety_wit_3.
Axiom proof_of_count_nodes_safety_wit_4 : count_nodes_safety_wit_4.
Axiom proof_of_count_nodes_safety_wit_5 : count_nodes_safety_wit_5.
Axiom proof_of_count_nodes_return_wit_1 : count_nodes_return_wit_1.
Axiom proof_of_count_nodes_return_wit_2 : count_nodes_return_wit_2.
Axiom proof_of_count_nodes_partial_solve_wit_1 : count_nodes_partial_solve_wit_1.
Axiom proof_of_count_nodes_partial_solve_wit_2_pure : count_nodes_partial_solve_wit_2_pure.
Axiom proof_of_count_nodes_partial_solve_wit_2 : count_nodes_partial_solve_wit_2.
Axiom proof_of_count_nodes_partial_solve_wit_3_pure : count_nodes_partial_solve_wit_3_pure.
Axiom proof_of_count_nodes_partial_solve_wit_3 : count_nodes_partial_solve_wit_3.

End VC_Correct.
