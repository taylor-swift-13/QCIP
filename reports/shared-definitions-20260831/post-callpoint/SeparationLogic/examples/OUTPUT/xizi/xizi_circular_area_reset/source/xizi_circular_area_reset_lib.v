Require Import Coq.Lists.List.
Require Import Coq.ZArith.ZArith.
Require Import Coq.micromega.Lia.
Require Import AUXLib.ListLib.

Import ListNotations.
Local Open Scope Z_scope.

(** Mathematical state relation for [CircularAreaReset].  The descriptor's
    buffer identity, capacity, endpoint pointers, and operations table are
    preserved, while the read/write cursors are reset to the common origin and
    the full flag is cleared.  The accompanying C specification separately
    retains exact ownership of the complete buffer contents. *)
Definition CircularAreaResetPost
    (data_buffer_before p_head_before p_tail_before area_length_before
     operations_before data_buffer_after readidx_after writeidx_after
     p_head_after p_tail_after area_length_after b_status_after
     operations_after : Z) : Prop :=
  data_buffer_after = data_buffer_before /\
  readidx_after = 0 /\
  writeidx_after = 0 /\
  p_head_after = p_head_before /\
  p_tail_after = p_tail_before /\
  area_length_after = area_length_before /\
  b_status_after = 0 /\
  operations_after = operations_before.
