Require Import Coq.Lists.List.
Require Import Coq.ZArith.ZArith.
Require Import Coq.micromega.Lia.
Require Import AUXLib.ListLib.
Require Import QCIPLib.xizi.xizi_circular_area_common.xizi_circular_area_lib.

Import ListNotations.
Local Open Scope Z_scope.

Definition xizi_circular_area_is_full_result
           (readidx writeidx b_status result : Z) : Prop :=
  (readidx = writeidx /\ b_status <> 0 /\ result = 1) \/
  ((readidx <> writeidx \/ b_status = 0) /\ result = 0).
