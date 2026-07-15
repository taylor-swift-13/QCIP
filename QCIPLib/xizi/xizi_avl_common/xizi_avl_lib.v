Require Import Coq.ZArith.ZArith.
Require Import Coq.Strings.String.
From AUXLib Require Import int_auto Axioms Feq Idents ListLib VMap.
Require Import SetsClass.SetsClass. Import SetsNotation.
From SimpleC.SL Require Import Mem SeparationLogic.
Require Import Logic.LogicGenerator.demo932.Interface.
From QCIPLib.xizi.xizi_avl_common Require Export xizi_avl_lib_core.

Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.

Import naive_C_Rules.
Local Open Scope sac.

Definition xizi_avl_struct_name : string := "AvlNode".
Definition xizi_avl_data_field : string := "data".
Definition xizi_avl_height_field : string := "height".
Definition xizi_avl_left_field : string := "left".
Definition xizi_avl_right_field : string := "right".

Definition avl_node_fields
    (p : addr) (data height : Z) (left right : addr) : Assertion :=
  avl_concrete_node_store
    xizi_avl_struct_name xizi_avl_data_field xizi_avl_height_field
    xizi_avl_left_field xizi_avl_right_field p data height left right.

Definition store_addr_avl : addr -> addr_avl_tree -> Assertion :=
  generic_store_addr_avl avl_node_fields.

Definition store_addr_avl_shape : addr -> Assertion :=
  generic_store_addr_avl_shape avl_node_fields.

Definition store_nonempty_addr_avl : addr -> Assertion :=
  generic_store_nonempty_addr_avl avl_node_fields.

Lemma avl_node_fields_unfold : forall p data height left right,
  avl_node_fields p data height left right |--
    &(p # "AvlNode" ->ₛ "data") # Int |-> data **
    &(p # "AvlNode" ->ₛ "height") # UInt |-> height **
    &(p # "AvlNode" ->ₛ "left") # Ptr |-> left **
    &(p # "AvlNode" ->ₛ "right") # Ptr |-> right.
Proof.
  intros. unfold avl_node_fields, avl_concrete_node_store,
    xizi_avl_struct_name, xizi_avl_data_field, xizi_avl_height_field,
    xizi_avl_left_field, xizi_avl_right_field.
  entailer!.
Qed.

Lemma avl_node_fields_fold : forall p data height left right,
  &(p # "AvlNode" ->ₛ "data") # Int |-> data **
  &(p # "AvlNode" ->ₛ "height") # UInt |-> height **
  &(p # "AvlNode" ->ₛ "left") # Ptr |-> left **
  &(p # "AvlNode" ->ₛ "right") # Ptr |-> right |--
  avl_node_fields p data height left right.
Proof.
  intros. unfold avl_node_fields, avl_concrete_node_store,
    xizi_avl_struct_name, xizi_avl_data_field, xizi_avl_height_field,
    xizi_avl_left_field, xizi_avl_right_field.
  entailer!.
Qed.

Lemma store_addr_avl_null : forall p t,
  p = NULL ->
  store_addr_avl p t |-- “ t = avl_empty ” && emp.
Proof.
  intros. unfold store_addr_avl.
  apply generic_store_addr_avl_null; assumption.
Qed.

Lemma store_addr_avl_empty_rev :
  emp |-- store_addr_avl NULL avl_empty.
Proof.
  unfold store_addr_avl.
  apply generic_store_addr_avl_empty_rev.
Qed.

Lemma store_addr_avl_nonnull : forall p t,
  p <> NULL ->
  store_addr_avl p t |--
    EX data height left_tree right_tree,
      “ t = avl_node_model p data height left_tree right_tree ” &&
      avl_node_fields p data height
        (avl_root_addr left_tree) (avl_root_addr right_tree) **
      store_addr_avl (avl_root_addr left_tree) left_tree **
      store_addr_avl (avl_root_addr right_tree) right_tree.
Proof.
  intros. unfold store_addr_avl.
  apply generic_store_addr_avl_nonnull; assumption.
Qed.

Lemma store_addr_avl_node_rev : forall p data height left_tree right_tree,
  p <> NULL ->
  avl_node_fields p data height
      (avl_root_addr left_tree) (avl_root_addr right_tree) **
  store_addr_avl (avl_root_addr left_tree) left_tree **
  store_addr_avl (avl_root_addr right_tree) right_tree |--
  store_addr_avl p
    (avl_node_model p data height left_tree right_tree).
Proof.
  intros. unfold store_addr_avl.
  apply generic_store_addr_avl_node_rev; assumption.
Qed.

Lemma store_addr_avl_singleton : forall p data height,
  p <> NULL ->
  store_addr_avl p (avl_node_model p data height avl_empty avl_empty) |--
  avl_node_fields p data height NULL NULL.
Proof.
  intros. unfold store_addr_avl. simpl. Intros. entailer!.
Qed.

Lemma store_addr_avl_singleton_rev : forall p data height,
  p <> NULL ->
  avl_node_fields p data height NULL NULL |--
  store_addr_avl p (avl_node_model p data height avl_empty avl_empty).
Proof.
  intros. unfold store_addr_avl.
  apply generic_store_addr_avl_singleton_rev; assumption.
Qed.

Lemma store_addr_avl_shape_unfold : forall p,
  store_addr_avl_shape p |-- EX t, store_addr_avl p t.
Proof.
  intros. unfold store_addr_avl_shape, generic_store_addr_avl_shape,
    store_addr_avl. entailer!.
Qed.

Lemma store_addr_avl_shape_fold : forall p t,
  store_addr_avl p t |-- store_addr_avl_shape p.
Proof.
  intros. unfold store_addr_avl_shape, generic_store_addr_avl_shape,
    store_addr_avl. Exists t. entailer!.
Qed.

Lemma store_nonempty_addr_avl_unfold : forall p,
  store_nonempty_addr_avl p |--
    “ p <> NULL ” && store_addr_avl_shape p.
Proof.
  intros. unfold store_nonempty_addr_avl,
    generic_store_nonempty_addr_avl, store_addr_avl_shape.
  entailer!.
Qed.

Lemma store_nonempty_addr_avl_fold : forall p,
  p <> NULL ->
  store_addr_avl_shape p |-- store_nonempty_addr_avl p.
Proof.
  intros. unfold store_nonempty_addr_avl,
    generic_store_nonempty_addr_avl, store_addr_avl_shape.
  entailer!.
Qed.
