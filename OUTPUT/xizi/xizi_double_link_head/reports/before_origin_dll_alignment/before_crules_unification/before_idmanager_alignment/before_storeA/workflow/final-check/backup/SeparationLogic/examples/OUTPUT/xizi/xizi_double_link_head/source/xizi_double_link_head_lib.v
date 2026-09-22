Require Import Coq.Lists.List.
Require Import Coq.ZArith.ZArith.
Require Import Coq.micromega.Lia.
Require Import AUXLib.ListLib.

Import ListNotations.
Local Open Scope Z_scope.

(** Mathematical result of observing the first element of a sentinel-headed
    doubly linked list.  The empty list returns the API's null value; a
    nonempty list returns its first node address. *)
Definition xizi_double_link_head_value (nodes : list Z) : Z :=
  match nodes with
  | nil => 0
  | first :: _ => first
  end.
