Require Import Coq.Lists.List.
Require Import Coq.ZArith.ZArith.
Require Import Coq.micromega.Lia.
Require Import AUXLib.ListLib.
Require Export QCIPLib.xizi.xizi_circular_area_common.xizi_circular_area_lib.

Import ListNotations.
Local Open Scope Z_scope.

(** [ret] states whether a circular read of [data_length] bytes starting at
    [readidx] must be split into a tail segment and a head segment. *)
Definition CircularAreaDivideRdDataResult
    (readidx data_length area_length ret : Z) : Prop :=
  (readidx + data_length <= area_length /\ ret = 0) \/
  (area_length < readidx + data_length /\ ret = 1).
