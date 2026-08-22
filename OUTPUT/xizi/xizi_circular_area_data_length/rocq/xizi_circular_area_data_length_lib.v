Require Import Coq.Lists.List.
Require Import Coq.ZArith.ZArith.
Require Import Coq.micromega.Lia.
Require Import AUXLib.ListLib.
Require Import SimpleC.SL.IntLib.

Import ListNotations.
Local Open Scope Z_scope.

Definition CircularAreaErrorResult (result : Z) : Prop :=
  result = 1.

Definition CircularAreaDescriptorState
    (readidx writeidx area_length b_status : Z)
    (buffer_contents : list Z) : Prop :=
  0 <= readidx < area_length /\
  0 <= writeidx < area_length /\
  0 < area_length <= 256 /\
  (-2147483648 <= b_status <= 2147483647) /\
  Zlength buffer_contents = area_length.

Definition CircularAreaIsFullResult
    (readidx writeidx b_status result : Z) : Prop :=
  (readidx = writeidx /\ b_status <> 0 /\ result = 1) \/
  ((readidx <> writeidx \/ b_status = 0) /\ result = 0).

Definition CircularAreaDataLengthResult
    (readidx writeidx area_length b_status result : Z) : Prop :=
  (readidx = writeidx /\ b_status <> 0 /\ result = area_length) \/
  ((readidx <> writeidx \/ b_status = 0) /\
   result = Z.rem
              (unsigned_last_nbits
                 (unsigned_last_nbits (writeidx - readidx) 32 + area_length)
                 32)
              area_length).
