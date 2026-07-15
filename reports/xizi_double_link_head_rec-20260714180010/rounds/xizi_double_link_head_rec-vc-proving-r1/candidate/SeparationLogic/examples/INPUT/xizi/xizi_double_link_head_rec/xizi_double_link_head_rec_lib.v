Require Import Coq.Lists.List.
Require Import Coq.ZArith.ZArith.
Require Import Coq.micromega.Lia.
Require Import AUXLib.ListLib.
From SimpleC.SL Require Import Mem SeparationLogic.
Require Import Logic.LogicGenerator.demo932.Interface.

Import ListNotations.
Local Open Scope Z_scope.
Import naive_C_Rules.
Local Open Scope sac.

(** [xizi_double_link_rec prev cur sentinel l] owns the non-sentinel nodes
    reached from [cur].  The sequence records node addresses in traversal
    order.  Every nonempty step owns both links of its current node; the
    empty suffix states that traversal has reached the sentinel.  Sentinel
    fields remain outside this predicate so a client may observe its head
    and tail while preserving the recursive resource. *)
Fixpoint xizi_double_link_rec
    (prev cur sentinel : addr) (l : list Z) : Assertion :=
  match l with
  | nil =>
      “ cur = sentinel ” && emp
  | node :: rest =>
      “ cur = node /\ cur <> sentinel ” &&
      EX next : addr,
        &(cur # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> next **
        &(cur # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> prev **
        xizi_double_link_rec cur next sentinel rest
  end.

Require Import Coq.Strings.String.
Local Open Scope string_scope.

(** [xizi_double_link_rec prev cur sentinel l] owns the non-sentinel nodes
    reached from [cur].  The sequence records node addresses in traversal
    order.  Every nonempty step owns both links of its current node; the
    empty suffix states that traversal has reached the sentinel.  Sentinel
    fields remain outside this predicate so a client may observe its head
    and tail while preserving the recursive resource. *)
