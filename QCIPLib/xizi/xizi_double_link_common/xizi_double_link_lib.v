Require Import Coq.ZArith.ZArith.
Require Import Coq.Lists.List.
Require Import Coq.Strings.String.
From AUXLib Require Import int_auto Axioms Feq Idents ListLib VMap.
Require Import SetsClass.SetsClass. Import SetsNotation.
From SimpleC.SL Require Import Mem SeparationLogic.
Require Import Logic.LogicGenerator.demo932.Interface.
From QCIPLib.xizi.xizi_double_link_common Require Export xizi_double_link_lib_core.

Local Open Scope Z_scope.
Local Open Scope sets.
Import ListNotations.
Local Open Scope list.
Local Open Scope string_scope.

Import naive_C_Rules.
Local Open Scope sac.

Definition xizi_double_struct_name : string := "SysDoubleLinklistNode".
Definition xizi_double_next_field : string := "node_next".
Definition xizi_double_prev_field : string := "node_prev".

Definition xizi_double_addr_node_store : addr -> addr -> addr -> addr -> Assertion :=
  dll_addr_store
    xizi_double_struct_name xizi_double_next_field xizi_double_prev_field.

Definition xizi_double_head_store : addr -> addr -> addr -> Assertion :=
  dll_head_store
    xizi_double_struct_name xizi_double_next_field xizi_double_prev_field.

Definition xizi_dllseg :
  addr -> addr -> addr -> addr -> list addr -> Assertion :=
  generic_dllseg xizi_double_addr_node_store.

Definition xizi_dll : addr -> list addr -> Assertion :=
  generic_dll_head xizi_double_addr_node_store xizi_double_head_store.

Lemma xizi_dll_nil: forall head,
  xizi_dll head nil |--
    &(head # xizi_double_struct_name ->ₛ xizi_double_next_field) # Ptr |-> head **
    &(head # xizi_double_struct_name ->ₛ xizi_double_prev_field) # Ptr |-> head.
Proof.
  intros.
  unfold xizi_dll, generic_dll_head, xizi_double_head_store,
    dll_head_store, dll_links, dll_next_link, dll_prev_link,
    xizi_double_struct_name, xizi_double_next_field, xizi_double_prev_field.
  unfold xizi_dllseg, generic_dllseg.
  Intros first last.
  Intros.
  subst first last.
  entailer!.
Qed.

Lemma xizi_dll_nil_rev: forall head,
  &(head # xizi_double_struct_name ->ₛ xizi_double_next_field) # Ptr |-> head **
  &(head # xizi_double_struct_name ->ₛ xizi_double_prev_field) # Ptr |-> head |--
  xizi_dll head nil.
Proof.
  intros.
  unfold xizi_dll, generic_dll_head, xizi_double_head_store,
    dll_head_store, dll_links, dll_next_link, dll_prev_link,
    xizi_double_struct_name, xizi_double_next_field, xizi_double_prev_field.
  unfold xizi_dllseg, generic_dllseg.
  Exists head head.
  entailer!.
Qed.

Lemma xizi_dll_cons: forall head l,
  xizi_dll head l |--
    EX first last,
      &(head # xizi_double_struct_name ->ₛ xizi_double_next_field) # Ptr |-> first **
      &(head # xizi_double_struct_name ->ₛ xizi_double_prev_field) # Ptr |-> last **
      xizi_dllseg first head head last l.
Proof.
  intros.
  unfold xizi_dll, generic_dll_head, xizi_double_head_store,
    dll_head_store, dll_links, dll_next_link, dll_prev_link,
    xizi_double_struct_name, xizi_double_next_field, xizi_double_prev_field.
  Intros first last.
  Exists first last.
  entailer!.
Qed.

Lemma xizi_dll_cons_rev: forall head first last l,
  &(head # xizi_double_struct_name ->ₛ xizi_double_next_field) # Ptr |-> first **
  &(head # xizi_double_struct_name ->ₛ xizi_double_prev_field) # Ptr |-> last **
  xizi_dllseg first head head last l |--
  xizi_dll head l.
Proof.
  intros.
  unfold xizi_dll, generic_dll_head, xizi_double_head_store,
    dll_head_store, dll_links, dll_next_link, dll_prev_link,
    xizi_double_struct_name, xizi_double_next_field, xizi_double_prev_field.
  Exists first last.
  entailer!.
Qed.

Lemma xizi_dllseg_same: forall x prev l,
  xizi_dllseg x prev x prev l |-- “ l = nil ” && emp.
Proof.
  intros.
  destruct l as [| d l0].
  - unfold xizi_dllseg.
    simpl.
    Intros.
    entailer!.
  - unfold xizi_dllseg.
    simpl.
    Intros y.
    entailer!.
Qed.

Lemma xizi_dllseg_same_rev: forall x prev,
  emp |-- xizi_dllseg x prev x prev nil.
Proof.
  intros.
  unfold xizi_dllseg.
  simpl.
  entailer!.
Qed.

Lemma xizi_dllseg_not_same: forall x prev tail last l,
  x <> tail ->
  xizi_dllseg x prev tail last l |--
    EX next l0,
      “ l = x :: l0 ” &&
      &(x # xizi_double_struct_name ->ₛ xizi_double_next_field) # Ptr |-> next **
      &(x # xizi_double_struct_name ->ₛ xizi_double_prev_field) # Ptr |-> prev **
      xizi_dllseg next x tail last l0.
Proof.
  intros.
  destruct l as [| d l0].
  - unfold xizi_dllseg.
    simpl.
    Intros.
    subst.
    tauto.
  - unfold xizi_dllseg.
    simpl.
    unfold xizi_double_addr_node_store, dll_addr_store, dll_links,
      dll_next_link, dll_prev_link,
      xizi_double_struct_name, xizi_double_next_field, xizi_double_prev_field.
    Intros next.
    Intros.
    subst d.
    Exists next l0.
    entailer!.
Qed.
