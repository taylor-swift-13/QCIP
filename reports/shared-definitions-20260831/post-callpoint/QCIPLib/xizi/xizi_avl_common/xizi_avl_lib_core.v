Require Import Coq.ZArith.ZArith.
Require Import Coq.Lists.List.
Require Import Coq.Strings.String.
Require Import Coq.micromega.Lia.
From AUXLib Require Import int_auto Axioms Feq Idents ListLib VMap.
Require Import SetsClass.SetsClass. Import SetsNotation.
From SimpleC.SL Require Import Mem SeparationLogic.
Require Import Logic.LogicGenerator.demo932.Interface.

Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.

Import naive_C_Rules.
Local Open Scope sac.

(** Address-labelled AVL model.  Each non-empty constructor records the
    physical node address, payload, cached height, and both subtrees. *)
Inductive addr_avl_tree : Type :=
  | avl_empty : addr_avl_tree
  | avl_node_model :
      addr -> Z -> Z -> addr_avl_tree -> addr_avl_tree -> addr_avl_tree.

Definition avl_root_addr (t : addr_avl_tree) : addr :=
  match t with
  | avl_empty => NULL
  | avl_node_model p _ _ _ _ => p
  end.

Fixpoint avl_size (t : addr_avl_tree) : Z :=
  match t with
  | avl_empty => 0
  | avl_node_model _ _ _ l r => avl_size l + avl_size r + 1
  end.

Fixpoint avl_depth (t : addr_avl_tree) : Z :=
  match t with
  | avl_empty => 0
  | avl_node_model _ _ _ l r => Z.max (avl_depth l) (avl_depth r) + 1
  end.

Definition avl_balance_factor (t : addr_avl_tree) : Z :=
  match t with
  | avl_empty => 0
  | avl_node_model _ _ _ l r => avl_depth l - avl_depth r
  end.

Definition avl_cached_height (t : addr_avl_tree) : Z :=
  match t with
  | avl_empty => 0
  | avl_node_model _ _ h _ _ => h
  end.

Lemma avl_size_nonneg : forall t, 0 <= avl_size t.
Proof.
  induction t; simpl; lia.
Qed.

Lemma avl_depth_nonneg : forall t, 0 <= avl_depth t.
Proof.
  induction t; simpl; lia.
Qed.

(** Generic recursive ownership.  [store_node] owns exactly the four fields
    of one node; recursive ownership remains in this predicate. *)
Fixpoint generic_store_addr_avl
    (store_node : addr -> Z -> Z -> addr -> addr -> Assertion)
    (p : addr) (t : addr_avl_tree) : Assertion :=
  match t with
  | avl_empty =>
      “ p = NULL ” && emp
  | avl_node_model node data height left_tree right_tree =>
      “ p = node /\ node <> NULL ” &&
      store_node node data height
        (avl_root_addr left_tree) (avl_root_addr right_tree) **
      generic_store_addr_avl store_node (avl_root_addr left_tree) left_tree **
      generic_store_addr_avl store_node (avl_root_addr right_tree) right_tree
  end.

Definition generic_store_addr_avl_shape
    (store_node : addr -> Z -> Z -> addr -> addr -> Assertion)
    (p : addr) : Assertion :=
  EX t : addr_avl_tree, generic_store_addr_avl store_node p t.

Definition generic_store_nonempty_addr_avl
    (store_node : addr -> Z -> Z -> addr -> addr -> Assertion)
    (p : addr) : Assertion :=
  “ p <> NULL ” && generic_store_addr_avl_shape store_node p.

Lemma generic_store_addr_avl_null : forall store_node p t,
  p = NULL ->
  generic_store_addr_avl store_node p t |-- “ t = avl_empty ” && emp.
Proof.
  intros store_node p t Hp.
  subst p.
  destruct t as [| node data height l r].
  - simpl. Intros. entailer!.
  - simpl. Intros. entailer!.
Qed.

Lemma generic_store_addr_avl_empty_rev : forall store_node,
  emp |-- generic_store_addr_avl store_node NULL avl_empty.
Proof.
  intros. simpl. entailer!.
Qed.

Lemma generic_store_addr_avl_nonnull : forall store_node p t,
  p <> NULL ->
  generic_store_addr_avl store_node p t |--
    EX data height left_tree right_tree,
      “ t = avl_node_model p data height left_tree right_tree ” &&
      store_node p data height
        (avl_root_addr left_tree) (avl_root_addr right_tree) **
      generic_store_addr_avl store_node (avl_root_addr left_tree) left_tree **
      generic_store_addr_avl store_node (avl_root_addr right_tree) right_tree.
Proof.
  intros store_node p t Hp.
  destruct t as [| node data height l r].
  - simpl. Intros. entailer!.
  - simpl. Intros.
    destruct H as [Hpn Hnode].
    subst node.
    Exists data height l r.
    entailer!.
Qed.

Lemma generic_store_addr_avl_node_rev : forall
    store_node p data height left_tree right_tree,
  p <> NULL ->
  store_node p data height
      (avl_root_addr left_tree) (avl_root_addr right_tree) **
  generic_store_addr_avl store_node (avl_root_addr left_tree) left_tree **
  generic_store_addr_avl store_node (avl_root_addr right_tree) right_tree |--
  generic_store_addr_avl store_node p
    (avl_node_model p data height left_tree right_tree).
Proof.
  intros. simpl. entailer!.
Qed.

Lemma generic_store_addr_avl_singleton_rev : forall
    store_node p data height,
  p <> NULL ->
  store_node p data height NULL NULL |--
  generic_store_addr_avl store_node p
    (avl_node_model p data height avl_empty avl_empty).
Proof.
  intros. simpl. entailer!.
Qed.

(** Exact pointer-topology relations.  Payloads, cached heights, physical
    addresses, and all fringe subtrees are preserved. *)
Definition avl_left_rotation (before after : addr_avl_tree) : Prop :=
  exists root promoted root_data root_height promoted_data promoted_height a b c,
    before =
      avl_node_model root root_data root_height a
        (avl_node_model promoted promoted_data promoted_height b c) /\
    after =
      avl_node_model promoted promoted_data promoted_height
        (avl_node_model root root_data root_height a b) c.

Definition avl_right_rotation (before after : addr_avl_tree) : Prop :=
  exists root promoted root_data root_height promoted_data promoted_height a b c,
    before =
      avl_node_model root root_data root_height
        (avl_node_model promoted promoted_data promoted_height a b) c /\
    after =
      avl_node_model promoted promoted_data promoted_height a
        (avl_node_model root root_data root_height b c).

Definition avl_lr_rotation (before after : addr_avl_tree) : Prop :=
  exists root left pivot root_data root_height left_data left_height
      pivot_data pivot_height a b c d,
    before =
      avl_node_model root root_data root_height
        (avl_node_model left left_data left_height a
          (avl_node_model pivot pivot_data pivot_height b c)) d /\
    after =
      avl_node_model pivot pivot_data pivot_height
        (avl_node_model left left_data left_height a b)
        (avl_node_model root root_data root_height c d).

Definition avl_rl_rotation (before after : addr_avl_tree) : Prop :=
  exists root right pivot root_data root_height right_data right_height
      pivot_data pivot_height a b c d,
    before =
      avl_node_model root root_data root_height a
        (avl_node_model right right_data right_height
          (avl_node_model pivot pivot_data pivot_height b c) d) /\
    after =
      avl_node_model pivot pivot_data pivot_height
        (avl_node_model root root_data root_height a b)
        (avl_node_model right right_data right_height c d).

Lemma avl_left_rotation_size : forall before after,
  avl_left_rotation before after -> avl_size before = avl_size after.
Proof.
  intros before after H.
  destruct H as (root & promoted & rd & rh & pd & ph & a & b & c & -> & ->).
  simpl. lia.
Qed.

Lemma avl_right_rotation_size : forall before after,
  avl_right_rotation before after -> avl_size before = avl_size after.
Proof.
  intros before after H.
  destruct H as (root & promoted & rd & rh & pd & ph & a & b & c & -> & ->).
  simpl. lia.
Qed.

Lemma avl_lr_rotation_size : forall before after,
  avl_lr_rotation before after -> avl_size before = avl_size after.
Proof.
  intros before after H.
  destruct H as
    (root & left & pivot & rd & rh & ld & lh & pd & ph & a & b & c & d & -> & ->).
  simpl. lia.
Qed.

Lemma avl_rl_rotation_size : forall before after,
  avl_rl_rotation before after -> avl_size before = avl_size after.
Proof.
  intros before after H.
  destruct H as
    (root & right & pivot & rd & rh & xd & xh & pd & ph & a & b & c & d & -> & ->).
  simpl. lia.
Qed.

Definition avl_concrete_node_store
    (struct_name data_field height_field left_field right_field : string)
    (p : addr) (data height : Z) (left right : addr) : Assertion :=
  &(p # struct_name ->ₛ data_field) # Int |-> data **
  &(p # struct_name ->ₛ height_field) # UInt |-> height **
  &(p # struct_name ->ₛ left_field) # Ptr |-> left **
  &(p # struct_name ->ₛ right_field) # Ptr |-> right.

Module Type AVL_LAYOUT.
  Parameter Inline struct_name : string.
  Parameter Inline data_field : string.
  Parameter Inline height_field : string.
  Parameter Inline left_field : string.
  Parameter Inline right_field : string.
End AVL_LAYOUT.

Module AVLLib (Layout : AVL_LAYOUT).

  Import Layout.

  Definition node_store : addr -> Z -> Z -> addr -> addr -> Assertion :=
    avl_concrete_node_store
      struct_name data_field height_field left_field right_field.

  Definition store_addr_avl : addr -> addr_avl_tree -> Assertion :=
    generic_store_addr_avl node_store.

  Definition store_addr_avl_shape : addr -> Assertion :=
    generic_store_addr_avl_shape node_store.

  Definition store_nonempty_addr_avl : addr -> Assertion :=
    generic_store_nonempty_addr_avl node_store.

End AVLLib.
