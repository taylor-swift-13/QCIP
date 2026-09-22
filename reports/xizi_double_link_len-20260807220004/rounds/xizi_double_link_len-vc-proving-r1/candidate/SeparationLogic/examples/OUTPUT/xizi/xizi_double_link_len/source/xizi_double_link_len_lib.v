Require Import Coq.Lists.List.
Require Import Coq.ZArith.ZArith.
Require Import Coq.micromega.Lia.
Require Import AUXLib.ListLib.

Import ListNotations.
Local Open Scope Z_scope.

(** Mathematical size of the data-node sequence represented by a circular
    sentinel double-linked list.  This definition depends only on the
    abstract sequence, not on the traversal algorithm or cursor state, so it
    can be reused by clients of the list predicate. *)
Definition xizi_double_link_size (nodes : list Z) : Z := Zlength nodes.
