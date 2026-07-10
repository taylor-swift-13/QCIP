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
(* Binary tree shape representation.                                 *)
(*                                                                   *)
(* The abstract [tree] records only the *structure* of a binary      *)
(* tree; the key/value/height stored at each node are existentially  *)
(* quantified inside [store_tree].  This is the same shape predicate  *)
(* used by the verified AVL demo (avl_shape.v), reused here so that   *)
(* the fold/unfold strategies stay sound.                            *)
(* ================================================================= *)

Definition key := Z.
Definition value := Z.

Inductive tree : Type :=
  | empty : tree
  | make_tree : tree -> tree -> tree.

Fixpoint store_tree (p: addr) (tr: tree): Assertion :=
    match tr with
    | empty =>
        “ p = NULL ” && emp
    | make_tree l r =>
        EX pl pr k v h,
            “ p <> NULL ” &&
            &(p # "tree" ->ₛ "key") # Int |-> k **
            &(p # "tree" ->ₛ "value") # Int |-> v **
            &(p # "tree" ->ₛ "height") # UChar |-> h **
            &(p # "tree" ->ₛ "lchild") # Ptr |-> pl **
            &(p # "tree" ->ₛ "rchild") # Ptr |-> pr **
            store_tree pl l **
            store_tree pr r
    end.

Definition store_tree_shape (p:addr): Assertion :=
    EX tr, store_tree p tr.

Definition store_non_empty_tree (p: addr): Assertion :=
    “ p <> NULL ” && store_tree_shape p.

Definition single_tree_node (p: addr) (k: key) (v: value) (h: Z) (l r: addr): Assertion :=
    &(p # "tree" ->ₛ "key") # Int |-> k **
    &(p # "tree" ->ₛ "value") # Int |-> v **
    &(p # "tree" ->ₛ "height") # UChar |-> h **
    &(p # "tree" ->ₛ "lchild") # Ptr |-> l **
    &(p # "tree" ->ₛ "rchild") # Ptr |-> r.

(* ================================================================= *)
(* Pure structural measures used by the functional specifications.    *)
(* These are strict mathematical functions on the abstract shape,     *)
(* not mirrors of the C algorithms.                                   *)
(* ================================================================= *)

(* Number of internal (non-empty) nodes. *)
Fixpoint tree_size (tr: tree) : Z :=
    match tr with
    | empty => 0
    | make_tree l r => tree_size l + tree_size r + 1
    end.

(* Height (longest root-to-leaf path), with the empty tree at 0. *)
Fixpoint tree_depth (tr: tree) : Z :=
    match tr with
    | empty => 0
    | make_tree l r => Z.max (tree_depth l) (tree_depth r) + 1
    end.

(* Mirror image: recursively swap the two subtrees at every node. *)
Fixpoint tree_mirror (tr: tree) : tree :=
    match tr with
    | empty => empty
    | make_tree l r => make_tree (tree_mirror r) (tree_mirror l)
    end.

Lemma tree_size_nonneg : forall tr, 0 <= tree_size tr.
Proof.
  induction tr; simpl; lia.
Qed.

Lemma tree_depth_nonneg : forall tr, 0 <= tree_depth tr.
Proof.
  induction tr; simpl; lia.
Qed.

Lemma tree_mirror_involutive : forall tr, tree_mirror (tree_mirror tr) = tr.
Proof.
  induction tr; simpl.
  - reflexivity.
  - rewrite IHtr1, IHtr2. reflexivity.
Qed.

Lemma tree_size_mirror : forall tr, tree_size (tree_mirror tr) = tree_size tr.
Proof.
  induction tr; simpl.
  - reflexivity.
  - rewrite IHtr1, IHtr2. lia.
Qed.

Lemma tree_depth_mirror : forall tr, tree_depth (tree_mirror tr) = tree_depth tr.
Proof.
  induction tr; simpl.
  - reflexivity.
  - rewrite IHtr1, IHtr2. lia.
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
    Intros pl pr k v h.
    contradiction.
Qed.
