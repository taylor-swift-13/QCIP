Require Import Coq.Lists.List.
Require Import Coq.ZArith.ZArith.
Require Import Coq.micromega.Lia.
Require Import AUXLib.ListLib.

Import ListNotations.
Local Open Scope Z_scope.

(** Pure consistency facts for a live circular-buffer descriptor.  Spatial
    ownership of every field and of the complete byte buffer remains explicit
    in the C contract so symbolic execution can open only the fields it reads. *)
Definition CircularAreaDescriptorState
    (readidx writeidx area_length b_status : Z)
    (buffer_contents : list Z) : Prop :=
  0 <= readidx < area_length /\
  0 <= writeidx < area_length /\
  0 < area_length <= 256 /\
  (-2147483648 <= b_status <= 2147483647) /\
  Zlength buffer_contents = area_length.

(** [ret] states whether a circular read of [data_length] bytes starting at
    [readidx] must be split into a tail segment and a head segment. *)
Definition CircularAreaDivideRdDataResult
    (readidx data_length area_length ret : Z) : Prop :=
  (readidx + data_length <= area_length /\ ret = 0) \/
  (area_length < readidx + data_length /\ ret = 1).
