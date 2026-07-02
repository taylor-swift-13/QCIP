Require Import Coq.ZArith.ZArith.
Require Import Coq.Lists.List.
Require Import Coq.Strings.String.
From AUXLib Require Import int_auto Axioms Feq Idents ListLib VMap.
Require Import SetsClass.SetsClass. Import SetsNotation.
From SimpleC.SL Require Import Mem SeparationLogic.
Require Import Logic.LogicGenerator.demo932.Interface.
From QCIPLib.xizi.xizi_single_link_common Require Export xizi_single_link_lib_core.

Local Open Scope Z_scope.
Local Open Scope sets.
Import ListNotations.
Local Open Scope list.
Local Open Scope string_scope.

Import naive_C_Rules.
Local Open Scope sac.

Definition xizi_struct_name : string := "SingleLinklistNode".
Definition xizi_next_field : string := "node_next".

Definition xizi_addr_node_store : addr -> addr -> addr -> Assertion :=
  sll_addr_store xizi_struct_name xizi_next_field.

Definition xizi_head_store : addr -> addr -> Assertion :=
  sll_head_store xizi_struct_name xizi_next_field.

Definition xizi_sll : addr -> list addr -> Assertion :=
  generic_sll xizi_addr_node_store.

Definition xizi_sllseg : addr -> addr -> list addr -> Assertion :=
  generic_sllseg xizi_addr_node_store.

Definition xizi_sll_to_target : addr -> addr -> list addr -> Assertion :=
  generic_sll_to_target xizi_addr_node_store.

Definition xizi_sll_not_target : addr -> addr -> list addr -> Assertion :=
  generic_sll_not_target xizi_addr_node_store.

Definition xizi_sll_head : addr -> list addr -> Assertion :=
  generic_sll_head xizi_addr_node_store xizi_head_store.

Lemma xizi_sll_zero: forall x l,
  x = NULL ->
  xizi_sll x l |-- “ l = nil ” && emp.
Proof.
  intros.
  destruct l.
  - entailer!.
  - unfold xizi_sll.
    simpl.
    Intros y.
    entailer!.
Qed.

Lemma xizi_sll_not_zero: forall x l,
  x <> NULL ->
  xizi_sll x l |--
    EX y l0,
      “ l = x :: l0 ” &&
      &(x # xizi_struct_name ->ₛ xizi_next_field) # Ptr |-> y **
      xizi_sll y l0.
Proof.
  intros.
  destruct l as [| d l0].
  - unfold xizi_sll.
    simpl.
    Intros.
    subst.
    tauto.
  - unfold xizi_sll.
    simpl.
    unfold xizi_addr_node_store, sll_addr_store, sll_link,
      xizi_struct_name, xizi_next_field.
    Intros y.
    Intros.
    subst d.
    Exists y l0.
    entailer!.
Qed.

Lemma xizi_sllseg_len1: forall x y,
  x <> NULL ->
  &(x # xizi_struct_name ->ₛ xizi_next_field) # Ptr |-> y |--
  xizi_sllseg x y [x].
Proof.
  intros.
  unfold xizi_sllseg.
  simpl.
  unfold xizi_addr_node_store, xizi_struct_name, xizi_next_field,
    sll_addr_store, sll_link.
  Exists y.
  entailer!.
Qed.

Lemma xizi_sllseg_not_same: forall x y l,
  x <> y ->
  xizi_sllseg x y l |--
    EX z l0,
      “ l = x :: l0 ” &&
      &(x # xizi_struct_name ->ₛ xizi_next_field) # Ptr |-> z **
      xizi_sllseg z y l0.
Proof.
  intros.
  destruct l as [| d l0].
  - unfold xizi_sllseg.
    simpl.
    Intros.
    subst.
    tauto.
  - unfold xizi_sllseg.
    simpl.
    unfold xizi_addr_node_store, sll_addr_store, sll_link,
      xizi_struct_name, xizi_next_field.
    Intros z.
    Intros.
    subst d.
    Exists z l0.
    entailer!.
Qed.

Lemma xizi_sll_to_target_not_same: forall x y l,
  x <> y ->
  xizi_sll_to_target x y l |--
    EX z l0,
      “ l = x :: l0 ” &&
      &(x # xizi_struct_name ->ₛ xizi_next_field) # Ptr |-> z **
      xizi_sll_to_target z y l0.
Proof.
  intros.
  destruct l as [| d l0].
  - unfold xizi_sll_to_target.
    simpl.
    Intros.
    subst.
    tauto.
  - unfold xizi_sll_to_target.
    simpl.
    unfold xizi_addr_node_store, sll_addr_store, sll_link,
      xizi_struct_name, xizi_next_field.
    Intros z.
    Intros.
    subst d.
    Exists z l0.
    entailer!.
Qed.

Lemma xizi_sll_to_target_same: forall x l,
  xizi_sll_to_target x x l |--
  “ l = nil ” && emp.
Proof.
  intros.
  destruct l as [| d l0].
  - unfold xizi_sll_to_target.
    simpl.
    Intros.
    entailer!.
  - unfold xizi_sll_to_target.
    simpl.
    Intros z0.
    entailer!.
Qed.

Lemma xizi_sll_to_target_zero_nonzero: forall y l,
  y <> NULL ->
  xizi_sll_to_target NULL y l |-- “ False ”.
Proof.
  intros.
  destruct l as [| d l0].
  - unfold xizi_sll_to_target.
    simpl.
    Intros.
    subst y.
    tauto.
  - unfold xizi_sll_to_target.
    simpl.
    Intros z0.
    entailer!.
Qed.

Lemma xizi_sll_not_target_not_zero: forall x y l,
  x <> NULL ->
  xizi_sll_not_target x y l |--
    EX z l0,
      “ l = x :: l0 ” &&
      “ x <> y ” &&
      &(x # xizi_struct_name ->ₛ xizi_next_field) # Ptr |-> z **
      xizi_sll_not_target z y l0.
Proof.
  intros.
  destruct l as [| d l0].
  - unfold xizi_sll_not_target.
    simpl.
    Intros.
    subst.
    tauto.
  - unfold xizi_sll_not_target.
    simpl.
    unfold xizi_addr_node_store, sll_addr_store, sll_link,
      xizi_struct_name, xizi_next_field.
    Intros z.
    Intros.
    subst d.
    Exists z l0.
    entailer!.
Qed.

Lemma xizi_sll_not_target_zero: forall y l,
  xizi_sll_not_target NULL y l |-- “ l = nil ” && emp.
Proof.
  intros.
  destruct l as [| d l0].
  - unfold xizi_sll_not_target.
    simpl.
    Intros.
    entailer!.
  - unfold xizi_sll_not_target.
    simpl.
    Intros z0.
    entailer!.
Qed.

Lemma xizi_sll_not_target_same_nonzero: forall x l,
  x <> NULL ->
  xizi_sll_not_target x x l |-- “ False ”.
Proof.
  intros.
  destruct l as [| d l0].
  - unfold xizi_sll_not_target.
    simpl.
    Intros.
    tauto.
  - unfold xizi_sll_not_target.
    simpl.
    Intros z0.
    entailer!.
Qed.

Lemma xizi_sll_not_target_sll: forall x y l,
  xizi_sll_not_target x y l |-- xizi_sll x l.
Proof.
  intros.
  revert x; induction l as [| d l0 IH]; intros.
  - unfold xizi_sll_not_target, xizi_sll.
    simpl.
    Intros.
    entailer!.
  - unfold xizi_sll_not_target at 1.
    unfold xizi_sll at 1.
    simpl.
    fold xizi_sll_not_target.
    fold xizi_sll.
    Intros z.
    Exists z.
    sep_apply IH.
    entailer!.
Qed.

Lemma xizi_sllseg_sllseg: forall x y z l1 l2,
  xizi_sllseg x y l1 ** xizi_sllseg y z l2 |--
  xizi_sllseg x z (l1 ++ l2).
Proof.
  intros.
  revert x; induction l1; intros.
  - unfold xizi_sllseg at 1.
    simpl.
    Intros.
    subst x.
    entailer!.
  - unfold xizi_sllseg at 1.
    unfold xizi_sllseg at 2.
    simpl.
    fold xizi_sllseg.
    Intros z0.
    Exists z0.
    sep_apply IHl1.
    entailer!.
Qed.

Lemma xizi_sllseg_sll: forall x y l1 l2,
  xizi_sllseg x y l1 ** xizi_sll y l2 |--
  xizi_sll x (l1 ++ l2).
Proof.
  intros.
  revert x; induction l1; intros.
  - unfold xizi_sllseg at 1.
    simpl.
    Intros.
    subst x.
    entailer!.
  - unfold xizi_sllseg at 1.
    unfold xizi_sll at 2.
    simpl.
    fold xizi_sllseg.
    fold xizi_sll.
    Intros z0.
    Exists z0.
    sep_apply IHl1.
    entailer!.
Qed.

Lemma xizi_sllseg_0_sll: forall x l,
  xizi_sllseg x 0 l |--
  xizi_sll x l.
Proof.
  intros.
  revert x; induction l; intros.
  - unfold xizi_sllseg, xizi_sll.
    simpl.
    Intros.
    subst x.
    entailer!.
  - unfold xizi_sllseg, xizi_sll.
    simpl.
    fold xizi_sllseg.
    fold xizi_sll.
    Intros z0.
    Exists z0.
    sep_apply IHl.
    entailer!.
Qed.

Lemma xizi_sllseg_zero_nonzero: forall y l,
  y <> NULL ->
  xizi_sllseg NULL y l |-- “ False ”.
Proof.
  intros.
  destruct l as [| d l0].
  - unfold xizi_sllseg.
    simpl.
    Intros.
    subst y.
    tauto.
  - unfold xizi_sllseg.
    simpl.
    Intros z0.
    entailer!.
Qed.

Lemma xizi_sll_cons: forall x y l,
  x <> NULL ->
  &(x # xizi_struct_name ->ₛ xizi_next_field) # Ptr |-> y **
  xizi_sll y l |--
  xizi_sll x (x :: l).
Proof.
  intros.
  unfold xizi_sll.
  simpl.
  unfold xizi_addr_node_store, xizi_struct_name, xizi_next_field,
    sll_addr_store, sll_link.
  Exists y.
  entailer!.
Qed.

Lemma xizi_sll_len1: forall x y,
  x <> NULL ->
  y = NULL ->
  &(x # xizi_struct_name ->ₛ xizi_next_field) # Ptr |-> y |--
  xizi_sll x [x].
Proof.
  intros.
  subst y.
  unfold xizi_sll.
  simpl.
  unfold xizi_addr_node_store, xizi_struct_name, xizi_next_field,
    sll_addr_store, sll_link.
  Exists NULL.
  entailer!.
Qed.
