Require Import Coq.ZArith.ZArith.

Local Open Scope Z_scope.

(* Predicate-first post-state relation for STSTransDataSave.
   The relation records the externally visible field update without mirroring
   the C control-flow or the byte-copy implementation. *)

Definition STSTransDataSavePost
    (old_ptr new_ptr copy_len : Z) : Prop :=
  copy_len = 248 /\
  ((old_ptr < 776 /\ new_ptr = old_ptr + copy_len) \/
   (old_ptr >= 776 /\ new_ptr = old_ptr)).
