Require Import Coq.ZArith.ZArith.
Require Import Coq.Lists.List.
Require Import Coq.Strings.String.
From AUXLib Require Import int_auto Axioms Feq Idents ListLib VMap.
Require Import SetsClass.SetsClass. Import SetsNotation.
From SimpleC.SL Require Import Mem SeparationLogic.
Require Import Logic.LogicGenerator.demo932.Interface.

Local Open Scope Z_scope.
Local Open Scope sets.
Import ListNotations.
Local Open Scope list.
Local Open Scope string_scope.

Import naive_C_Rules.
Local Open Scope sac.

Definition dll_next_link (struct_name next_field: string)
  (x y: addr): Assertion :=
  &(x # struct_name ->ₛ next_field) # Ptr |-> y.

Definition dll_prev_link (struct_name prev_field: string)
  (x y: addr): Assertion :=
  &(x # struct_name ->ₛ prev_field) # Ptr |-> y.

Definition dll_links (struct_name next_field prev_field: string)
  (x next prev: addr): Assertion :=
  dll_next_link struct_name next_field x next **
  dll_prev_link struct_name prev_field x prev.

Fixpoint generic_dllseg
  {A: Type}
  (storeA: addr -> addr -> addr -> A -> Assertion)
  (x prev tail last: addr)
  (l: list A): Assertion :=
  match l with
  | nil => “ x = tail ” && “ prev = last ” && emp
  | a :: l0 =>
      “ x <> NULL ” &&
      EX y: addr,
        storeA x y prev a **
        generic_dllseg storeA y x tail last l0
  end.

Definition generic_dll_head
  {A: Type}
  (storeA: addr -> addr -> addr -> A -> Assertion)
  (store_head: addr -> addr -> addr -> Assertion)
  (head: addr)
  (l: list A): Assertion :=
  EX first: addr,
  EX last: addr,
    store_head head first last **
    generic_dllseg storeA first head head last l.

Definition dll_addr_store (struct_name next_field prev_field: string)
  (x next prev p: addr): Assertion :=
  “ x = p ” && dll_links struct_name next_field prev_field x next prev.

Definition dll_head_store (struct_name next_field prev_field: string)
  (head first last: addr): Assertion :=
  dll_links struct_name next_field prev_field head first last.

Module Type DLL_LAYOUT.
  Parameter Inline struct_name : string.
  Parameter Inline next_field : string.
  Parameter Inline prev_field : string.
End DLL_LAYOUT.

Module DLLLib (Layout : DLL_LAYOUT).

  Import Layout.

  Definition addr_node_store : addr -> addr -> addr -> addr -> Assertion :=
    dll_addr_store struct_name next_field prev_field.

  Definition head_store : addr -> addr -> addr -> Assertion :=
    dll_head_store struct_name next_field prev_field.

  Definition dllseg : addr -> addr -> addr -> addr -> list addr -> Assertion :=
    generic_dllseg addr_node_store.

  Definition dll : addr -> list addr -> Assertion :=
    generic_dll_head addr_node_store head_store.

End DLLLib.
