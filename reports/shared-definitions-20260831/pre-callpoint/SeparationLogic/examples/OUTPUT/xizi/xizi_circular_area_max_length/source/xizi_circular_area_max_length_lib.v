Require Import Coq.Lists.List.
Require Import Coq.ZArith.ZArith.
Require Import Coq.micromega.Lia.
Require Import AUXLib.ListLib.
Require Export QCIPLib.xizi.xizi_circular_area_common.xizi_circular_area_lib.

Import ListNotations.
Local Open Scope Z_scope.

(** Mathematical result relation for the projection implemented by
    [CircularAreaGetMaxLength].  It is intentionally implementation-free. *)
Definition CircularAreaGetMaxLengthResult
  (circular_area entry_area_length result : Z) : Prop :=
  (circular_area = 0 /\ result = 1) \/
  (circular_area <> 0 /\ result = entry_area_length).
