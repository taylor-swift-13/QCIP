Require Import Coq.Lists.List.
Require Import Coq.ZArith.ZArith.
Require Import Coq.micromega.Lia.
Require Import AUXLib.ListLib.

Import ListNotations.
Local Open Scope Z_scope.

(** The logical result of advancing from the current node.  [nodes_after]
    is the suffix strictly after that node in the sentinel list: an empty
    suffix means that the C-level next link is the sentinel (and the API
    returns [NULL]); otherwise its first address is returned. *)
Definition xizi_double_link_next_rec_last_value
  (nodes_after : list Z) : Z :=
  match nodes_after with
  | nil => 0
  | next :: _ => next
  end.
