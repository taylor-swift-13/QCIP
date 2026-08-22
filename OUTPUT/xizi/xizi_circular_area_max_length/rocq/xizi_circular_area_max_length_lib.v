Require Import Coq.Lists.List.
Require Import Coq.ZArith.ZArith.
Require Import Coq.micromega.Lia.
Require Import AUXLib.ListLib.

Import ListNotations.
Local Open Scope Z_scope.

(** Pure value-level consistency carried by a fully-owned CircularArea
    descriptor.  The spatial field and buffer ownership stays explicit in C
    annotations so QCP can open exactly the field touched by each API. *)
Definition CircularAreaDescriptorState
  (readidx writeidx area_length b_status : Z)
  (buffer_contents : list Z) : Prop :=
  0 <= readidx <= 255 /\
  0 <= writeidx <= 255 /\
  0 <= area_length <= 4294967295 /\
  (-2147483648 <= b_status <= 2147483647) /\
  Zlength buffer_contents = area_length.

(** Mathematical result relation for the projection implemented by
    [CircularAreaGetMaxLength].  It is intentionally implementation-free. *)
Definition CircularAreaGetMaxLengthResult
  (circular_area entry_area_length result : Z) : Prop :=
  (circular_area = 0 /\ result = 1) \/
  (circular_area <> 0 /\ result = entry_area_length).
