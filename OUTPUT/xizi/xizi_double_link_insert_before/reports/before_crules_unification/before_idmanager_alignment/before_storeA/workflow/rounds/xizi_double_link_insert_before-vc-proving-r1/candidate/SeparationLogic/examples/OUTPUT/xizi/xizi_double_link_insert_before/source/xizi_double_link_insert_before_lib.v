Require Import Coq.Lists.List.
Require Import Coq.ZArith.ZArith.
Require Import Coq.micromega.Lia.
Require Import AUXLib.ListLib.

Import ListNotations.
Local Open Scope Z_scope.

(** Pure sequence semantics for inserting [inserted] immediately before the
    first occurrence of [anchor] in the complete abstract sequence.  If the
    anchor is absent the sequence is unchanged.  This is a list-level API
    transformation and does not expose the circular C pointer updates. *)
Fixpoint xizi_double_link_insert_before_nodes
  (nodes : list Z) (anchor inserted : Z) : list Z :=
  match nodes with
  | nil => nil
  | current :: suffix =>
      if Z.eq_dec current anchor
      then inserted :: current :: suffix
      else current ::
           xizi_double_link_insert_before_nodes suffix anchor inserted
  end.
