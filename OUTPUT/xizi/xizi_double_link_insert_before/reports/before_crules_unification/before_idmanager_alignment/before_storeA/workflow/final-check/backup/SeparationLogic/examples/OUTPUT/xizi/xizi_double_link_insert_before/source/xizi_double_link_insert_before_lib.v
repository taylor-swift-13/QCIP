Require Import Coq.Lists.List.
Require Import Coq.ZArith.ZArith.
Require Import Coq.micromega.Lia.
Require Import AUXLib.ListLib.

Import ListNotations.
Local Open Scope Z_scope.

(** Pure sequence semantics for inserting [inserted] immediately before
    [anchor].  [prefix] and [suffix] witness the anchor's position in the
    pre-state list; this definition states only the mathematical result and
    is independent of the implementation's pointer-write order. *)
Definition xizi_double_link_insert_before_nodes
  (prefix : list Z) (anchor inserted : Z) (suffix : list Z) : list Z :=
  prefix ++ inserted :: anchor :: suffix.
