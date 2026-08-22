Require Import Coq.Lists.List.
Require Import Coq.ZArith.ZArith.
Require Import Coq.micromega.Lia.
Require Import AUXLib.ListLib.

Import ListNotations.
Local Open Scope Z_scope.

Definition CircularAreaEmptyResult
    (readidx writeidx b_status ret : Z) : Prop :=
  (readidx = writeidx /\ b_status = 0 /\ ret = 1) \/
  ((readidx <> writeidx \/ b_status <> 0) /\ ret = 0).

Definition xizi_circular_area_error_result (result : Z) : Prop :=
  result = 1.
