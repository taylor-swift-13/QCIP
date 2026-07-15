Require Import Coq.Lists.List.
Require Import Coq.ZArith.ZArith.
Require Import Coq.Strings.String.
Require Import Coq.micromega.Lia.
Require Import AUXLib.ListLib.
From SimpleC.SL Require Import Mem SeparationLogic.
Require Import Logic.LogicGenerator.demo932.Interface.

Import ListNotations.
Import naive_C_Rules.
Local Open Scope Z_scope.
Local Open Scope string_scope.
Local Open Scope sac.

(** [xizi_dll_tail cur prev anchor xs] owns the part of a circular
    doubly linked list starting at [cur].  [xs] is the exact sequence of
    node addresses before returning to [anchor], and every owned [prev]
    field agrees with the preceding address. *)
Fixpoint xizi_dll_tail
    (cur prev anchor : Z) (xs : list Z) : Assertion :=
  match xs with
  | nil =>
      “ cur = anchor ” &&
      &(anchor # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> prev
  | x :: xs' =>
      “ cur = x ” &&
      EX next : Z,
        &(cur # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> next **
        &(cur # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> prev **
        xizi_dll_tail next cur anchor xs'
  end.

(** The residual ownership after exposing [anchor.next] and
    [first.prev].  Keeping these two fields outside the predicate is exactly
    the local footprint needed by insert-after. *)
Definition xizi_dll_rest
    (anchor first : Z) (xs : list Z) : Assertion :=
  match xs with
  | nil => “ first = anchor ” && emp
  | x :: xs' =>
      “ first = x ” &&
      EX next : Z,
        &(first # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> next **
        xizi_dll_tail next first anchor xs'
  end.

(** A complete sentinel circular doubly linked list whose nodes following
    [anchor] occur in exactly the address sequence [xs]. *)
Definition xizi_dll (anchor : Z) (xs : list Z) : Assertion :=
  EX first : Z,
    &(anchor # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> first **
    &(first # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> anchor **
    xizi_dll_rest anchor first xs.

Lemma xizi_dll_tail_from_prev_rest__return_rebuild :
  forall anchor first prev xs,
    &(first # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> prev **
    xizi_dll_rest anchor first xs |--
    xizi_dll_tail first prev anchor xs.
Proof.
  intros anchor first prev xs.
  destruct xs as [| x xs].
  - simpl.
    entailer!.
  - simpl.
    entailer!.
Qed.
