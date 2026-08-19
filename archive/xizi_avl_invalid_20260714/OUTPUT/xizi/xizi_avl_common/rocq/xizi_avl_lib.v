Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Strings.String.
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
Local Open Scope string.
Local Open Scope list.
Import naive_C_Rules.
Local Open Scope sac.
Require Import Coq.Structures.Orders.
Require Import Coq.Structures.OrdersFacts.
From AUXLib Require Import BinaryTree OrdersDecFact.

(* ================================================================= *)
(* Shape representation of the crtos AVL tree (kernel/thread/avl_tree.c).*)
(*                                                                   *)
(*   struct AvlNode { int32 data; uint32 height;                     *)
(*                    struct AvlNode *left, *right; };               *)
(*                                                                   *)
(* The abstract [tree] records only the structure; the data and      *)
(* height stored at each node are existentially quantified inside     *)
(* [store_tree].                                                     *)
(* ================================================================= *)

Definition key := Z.

Inductive tree : Type :=
  | empty : tree
  | make_tree : tree -> tree -> tree.

Fixpoint store_tree (p: addr) (tr: tree): Assertion :=
    match tr with
    | empty =>
        “ p = NULL ” && emp
    | make_tree l r =>
        EX pl pr d h,
            “ p <> NULL ” &&
            &(p # "AvlNode" ->ₛ "data") # Int |-> d **
            &(p # "AvlNode" ->ₛ "height") # UInt |-> h **
            &(p # "AvlNode" ->ₛ "left") # Ptr |-> pl **
            &(p # "AvlNode" ->ₛ "right") # Ptr |-> pr **
            store_tree pl l **
            store_tree pr r
    end.

Definition store_tree_shape (p:addr): Assertion :=
    EX tr, store_tree p tr.

Definition store_non_empty_tree (p: addr): Assertion :=
    “ p <> NULL ” && store_tree_shape p.

Definition single_tree_node (p: addr) (d: key) (h: Z) (l r: addr): Assertion :=
    &(p # "AvlNode" ->ₛ "data") # Int |-> d **
    &(p # "AvlNode" ->ₛ "height") # UInt |-> h **
    &(p # "AvlNode" ->ₛ "left") # Ptr |-> l **
    &(p # "AvlNode" ->ₛ "right") # Ptr |-> r.

(* ================================================================= *)
(* Pure structural measure: height (longest root-to-leaf path).      *)
(* empty has height 0.  This is the mathematical meaning of the C     *)
(* recursive function AvlTreeGetNodeHeight.                          *)
(* ================================================================= *)

Fixpoint tree_depth (tr: tree) : Z :=
    match tr with
    | empty => 0
    | make_tree l r => Z.max (tree_depth l) (tree_depth r) + 1
    end.

Fixpoint tree_size (tr: tree) : Z :=
    match tr with
    | empty => 0
    | make_tree l r => tree_size l + tree_size r + 1
    end.

(* Balance factor of a node: height of left subtree minus height of right    *)
(* subtree (the empty tree is balanced with factor 0).  This is the           *)
(* mathematical meaning of the C routine AvlTreeGetNodeBalanceFactor.         *)
Definition tree_balance_factor (tr: tree) : Z :=
    match tr with
    | empty => 0
    | make_tree l r => tree_depth l - tree_depth r
    end.

Lemma tree_depth_nonneg : forall tr, 0 <= tree_depth tr.
Proof.
  induction tr; simpl; lia.
Qed.

Lemma tree_size_nonneg : forall tr, 0 <= tree_size tr.
Proof.
  induction tr; simpl; lia.
Qed.

(* A tree stored at the NULL address is necessarily the empty tree. *)
Theorem store_tree_zero:
  forall p tr,
    p = 0 -> store_tree p tr |-- “ tr = empty ” && emp.
Proof.
  intros p tr Hp.
  destruct tr.
  - simpl. subst p.
    split_pure_spatial.
    + Intros_p Hnull. cancel.
    + dump_pre_spatial. reflexivity.
  - simpl. subst p.
    Intros pl pr d h.
    contradiction.
Qed.
