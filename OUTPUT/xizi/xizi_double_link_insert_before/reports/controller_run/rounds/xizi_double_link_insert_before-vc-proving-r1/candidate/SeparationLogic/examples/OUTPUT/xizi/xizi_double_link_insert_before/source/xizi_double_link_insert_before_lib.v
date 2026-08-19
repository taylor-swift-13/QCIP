Require Import Coq.Lists.List.
Require Import Coq.ZArith.ZArith.
Require Import Coq.micromega.Lia.
Require Import AUXLib.ListLib.

Import ListNotations.
Local Open Scope Z_scope.

(** An admissible public anchor is either an abstract member or the sentinel
    itself.  Keeping this as a proposition avoids exposing either internal
    predecessor cut in the public contracts. *)
Definition xizi_double_link_insert_before_anchor
  (head : Z) (nodes : list Z) (anchor : Z) : Prop :=
  In anchor nodes \/ anchor = head.

(** Pure sequence semantics for inserting [inserted] immediately before the
    first occurrence of [anchor] in the complete abstract sequence.  Reaching
    the end appends [inserted]; in particular this is the public sentinel-head
    behavior, because the sentinel is not an element of the abstract node
    sequence.  This is a list-level API transformation and does not expose the
    circular C pointer updates. *)
Fixpoint xizi_double_link_insert_before_nodes
  (nodes : list Z) (anchor inserted : Z) : list Z :=
  match nodes with
  | nil => inserted :: nil
  | current :: suffix =>
      if Z.eq_dec current anchor
      then inserted :: current :: suffix
      else current ::
           xizi_double_link_insert_before_nodes suffix anchor inserted
  end.
