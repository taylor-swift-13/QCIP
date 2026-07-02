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

Definition sll_link (struct_name next_field: string) (x y: addr): Assertion :=
  &(x # struct_name ->ₛ next_field) # Ptr |-> y.

Fixpoint generic_sll
  {A: Type}
  (storeA: addr -> addr -> A -> Assertion)
  (x: addr)
  (l: list A): Assertion :=
  match l with
  | nil => “ x = NULL ” && emp
  | a :: l0 =>
      “ x <> NULL ” &&
      EX y: addr,
        storeA x y a **
        generic_sll storeA y l0
  end.

Fixpoint generic_sllseg
  {A: Type}
  (storeA: addr -> addr -> A -> Assertion)
  (x y: addr)
  (l: list A): Assertion :=
  match l with
  | nil => “ x = y ” && emp
  | a :: l0 =>
      “ x <> NULL ” &&
      EX z: addr,
        storeA x z a **
        generic_sllseg storeA z y l0
  end.

Fixpoint generic_sll_to_target
  {A: Type}
  (storeA: addr -> addr -> A -> Assertion)
  (x y: addr)
  (l: list A): Assertion :=
  match l with
  | nil => “ x = y ” && emp
  | a :: l0 =>
      “ x <> NULL ” &&
      “ x <> y ” &&
      EX z: addr,
        storeA x z a **
        generic_sll_to_target storeA z y l0
  end.

Fixpoint generic_sll_not_target
  {A: Type}
  (storeA: addr -> addr -> A -> Assertion)
  (x y: addr)
  (l: list A): Assertion :=
  match l with
  | nil => “ x = NULL ” && emp
  | a :: l0 =>
      “ x <> NULL ” &&
      “ x <> y ” &&
      EX z: addr,
        storeA x z a **
        generic_sll_not_target storeA z y l0
  end.

Definition generic_sll_head
  {A: Type}
  (storeA: addr -> addr -> A -> Assertion)
  (store_head: addr -> addr -> Assertion)
  (head: addr)
  (l: list A): Assertion :=
  EX first: addr,
    store_head head first **
    generic_sll storeA first l.

Definition sll_addr_store (struct_name next_field: string)
  (x y p: addr): Assertion :=
  “ x = p ” && sll_link struct_name next_field x y.

Definition sll_head_store (struct_name next_field: string)
  (x y: addr): Assertion :=
  sll_link struct_name next_field x y.

Module Type SLL_LAYOUT.
  Parameter Inline struct_name : string.
  Parameter Inline next_field : string.
End SLL_LAYOUT.

Module SLLLib (Layout : SLL_LAYOUT).

  Import Layout.

  Definition addr_node_store : addr -> addr -> addr -> Assertion :=
    sll_addr_store struct_name next_field.

  Definition head_store : addr -> addr -> Assertion :=
    sll_head_store struct_name next_field.

  Definition sll : addr -> list addr -> Assertion :=
    generic_sll addr_node_store.

  Definition sllseg : addr -> addr -> list addr -> Assertion :=
    generic_sllseg addr_node_store.

  Definition sll_to_target : addr -> addr -> list addr -> Assertion :=
    generic_sll_to_target addr_node_store.

  Definition sll_not_target : addr -> addr -> list addr -> Assertion :=
    generic_sll_not_target addr_node_store.

  Definition sll_head : addr -> list addr -> Assertion :=
    generic_sll_head addr_node_store head_store.

End SLLLib.
