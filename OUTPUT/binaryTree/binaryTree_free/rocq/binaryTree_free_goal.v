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

(*----- Function free_tree -----*)

Definition free_tree_safety_wit_1 := 
forall (root_pre: Z) (tr: tree) ,
  ((( &( "root" ) )) # Ptr  |-> root_pre)
  **  (store_tree root_pre tr )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition free_tree_return_wit_1 := 
forall (root_pre: Z) (tr: tree) (PreH1 : (root_pre = 0)) ,
  (store_tree root_pre tr )
|--
  TT && emp 
.

Definition free_tree_return_wit_2 := 
forall (root_pre: Z) (tr: tree) (h: Z) (tr1: tree) (tr2: tree) (PreH1 : (h <= 255)) (PreH2 : (h >= 0)) (PreH3 : (tr = (make_tree (tr1) (tr2)))) (PreH4 : (root_pre <> 0)) ,
  TT && emp 
|--
  TT && emp 
.

Definition free_tree_partial_solve_wit_1 := 
forall (root_pre: Z) (tr: tree) (PreH1 : (root_pre <> 0)) ,
  (store_tree root_pre tr )
|--
  EX (tr2: tree)  (tr1: tree)  (r: Z)  (l: Z)  (h: Z)  (v: Z)  (k: Z) ,
  “ (h <= 255) ” 
  &&  “ (h >= 0) ” 
  &&  “ (tr = (make_tree (tr1) (tr2))) ” 
  &&  “ (root_pre <> 0) ”
  &&  ((&((root_pre)  # "tree" ->ₛ "lchild")) # Ptr  |-> l)
  **  ((&((root_pre)  # "tree" ->ₛ "rchild")) # Ptr  |-> r)
  **  ((&((root_pre)  # "tree" ->ₛ "height")) # UChar  |-> h)
  **  ((&((root_pre)  # "tree" ->ₛ "value")) # Int  |-> v)
  **  ((&((root_pre)  # "tree" ->ₛ "key")) # Int  |-> k)
  **  (store_tree r tr2 )
  **  (store_tree l tr1 )
.

Definition free_tree_partial_solve_wit_2 := 
forall (root_pre: Z) (tr: tree) (k: Z) (v: Z) (h: Z) (l: Z) (r: Z) (tr1: tree) (tr2: tree) (PreH1 : (h <= 255)) (PreH2 : (h >= 0)) (PreH3 : (tr = (make_tree (tr1) (tr2)))) (PreH4 : (root_pre <> 0)) ,
  (single_tree_node root_pre k v h l r )
  **  (store_tree r tr2 )
  **  (store_tree l tr1 )
|--
  “ (h <= 255) ” 
  &&  “ (h >= 0) ” 
  &&  “ (tr = (make_tree (tr1) (tr2))) ” 
  &&  “ (root_pre <> 0) ”
  &&  (store_tree l tr1 )
  **  ((&((root_pre)  # "tree" ->ₛ "rchild")) # Ptr  |-> r)
  **  ((&((root_pre)  # "tree" ->ₛ "lchild")) # Ptr  |-> l)
  **  ((&((root_pre)  # "tree" ->ₛ "height")) # UChar  |-> h)
  **  ((&((root_pre)  # "tree" ->ₛ "value")) # Int  |-> v)
  **  ((&((root_pre)  # "tree" ->ₛ "key")) # Int  |-> k)
  **  (store_tree r tr2 )
.

Definition free_tree_partial_solve_wit_3 := 
forall (root_pre: Z) (tr: tree) (k: Z) (v: Z) (h: Z) (l: Z) (r: Z) (tr1: tree) (tr2: tree) (PreH1 : (h <= 255)) (PreH2 : (h >= 0)) (PreH3 : (tr = (make_tree (tr1) (tr2)))) (PreH4 : (root_pre <> 0)) ,
  ((&((root_pre)  # "tree" ->ₛ "rchild")) # Ptr  |-> r)
  **  ((&((root_pre)  # "tree" ->ₛ "lchild")) # Ptr  |-> l)
  **  ((&((root_pre)  # "tree" ->ₛ "height")) # UChar  |-> h)
  **  ((&((root_pre)  # "tree" ->ₛ "value")) # Int  |-> v)
  **  ((&((root_pre)  # "tree" ->ₛ "key")) # Int  |-> k)
  **  (store_tree r tr2 )
|--
  “ (h <= 255) ” 
  &&  “ (h >= 0) ” 
  &&  “ (tr = (make_tree (tr1) (tr2))) ” 
  &&  “ (root_pre <> 0) ”
  &&  (store_tree r tr2 )
  **  ((&((root_pre)  # "tree" ->ₛ "rchild")) # Ptr  |-> r)
  **  ((&((root_pre)  # "tree" ->ₛ "lchild")) # Ptr  |-> l)
  **  ((&((root_pre)  # "tree" ->ₛ "height")) # UChar  |-> h)
  **  ((&((root_pre)  # "tree" ->ₛ "value")) # Int  |-> v)
  **  ((&((root_pre)  # "tree" ->ₛ "key")) # Int  |-> k)
.

Definition free_tree_partial_solve_wit_4 := 
forall (root_pre: Z) (tr: tree) (k: Z) (v: Z) (h: Z) (l: Z) (r: Z) (tr1: tree) (tr2: tree) (PreH1 : (h <= 255)) (PreH2 : (h >= 0)) (PreH3 : (tr = (make_tree (tr1) (tr2)))) (PreH4 : (root_pre <> 0)) ,
  ((&((root_pre)  # "tree" ->ₛ "rchild")) # Ptr  |-> r)
  **  ((&((root_pre)  # "tree" ->ₛ "lchild")) # Ptr  |-> l)
  **  ((&((root_pre)  # "tree" ->ₛ "height")) # UChar  |-> h)
  **  ((&((root_pre)  # "tree" ->ₛ "value")) # Int  |-> v)
  **  ((&((root_pre)  # "tree" ->ₛ "key")) # Int  |-> k)
|--
  “ (h <= 255) ” 
  &&  “ (h >= 0) ” 
  &&  “ (tr = (make_tree (tr1) (tr2))) ” 
  &&  “ (root_pre <> 0) ”
  &&  (single_tree_node root_pre k v h l r )
.

Module Type VC_Correct.

Include binaryTree_Strategy_Correct.

Axiom proof_of_free_tree_safety_wit_1 : free_tree_safety_wit_1.
Axiom proof_of_free_tree_return_wit_1 : free_tree_return_wit_1.
Axiom proof_of_free_tree_return_wit_2 : free_tree_return_wit_2.
Axiom proof_of_free_tree_partial_solve_wit_1 : free_tree_partial_solve_wit_1.
Axiom proof_of_free_tree_partial_solve_wit_2 : free_tree_partial_solve_wit_2.
Axiom proof_of_free_tree_partial_solve_wit_3 : free_tree_partial_solve_wit_3.
Axiom proof_of_free_tree_partial_solve_wit_4 : free_tree_partial_solve_wit_4.

End VC_Correct.
