Require Import Coq.Lists.List.
Require Import Coq.ZArith.ZArith.
Require Import Coq.micromega.Lia.
Require Import AUXLib.ListLib.

Import ListNotations.
Local Open Scope Z_scope.

(** Mathematical result of initializing a list and then observing its length. *)
Definition xizi_double_link_init_then_len_result (ret : Z) : Prop :=
  ret = 0.
