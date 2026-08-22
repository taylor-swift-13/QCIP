Require Import Coq.Lists.List.
Require Import Coq.ZArith.ZArith.
Require Import Coq.micromega.Lia.
Require Import AUXLib.ListLib.

Import ListNotations.
Local Open Scope Z_scope.

Definition CircularAreaDivideWrDataResult
           (writeidx data_length area_length result : Z) : Prop :=
  (writeidx + data_length <= area_length /\ result = 0) \/
  (area_length < writeidx + data_length /\ result = 1).
