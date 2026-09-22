Require Import Coq.Lists.List.
Require Import Coq.ZArith.ZArith.
Require Import Coq.micromega.Lia.
Require Import AUXLib.ListLib.
Require Import Coq.Strings.String.
From SimpleC.SL Require Import Mem SeparationLogic.
Require Import Logic.LogicGenerator.demo932.Interface.

Import ListNotations.
Import naive_C_Rules.
Local Open Scope Z_scope.
Local Open Scope list_scope.
Local Open Scope string_scope.
Local Open Scope sac.

(** The physical option-list immediately returned by the allocator.  This
    definition intentionally does not claim initialized byte values. *)
Definition xizi_circular_area_uninitialized
    (area_length : Z) (physical : list (option Z)) : Prop :=
  physical = repeat None (Z.to_nat area_length).

(** The logical FIFO bytes occupy initialized cells of the physical ring.
    Cells outside this live interval are deliberately unconstrained. *)
Definition CircularAreaLiveBytes
    (readidx area_length : Z)
    (logical : list Z) (physical : list (option Z)) : Prop :=
  forall k : Z,
    0 <= k < Zlength logical ->
    Znth ((readidx + k) mod area_length) physical None =
      Some (Znth k logical 0).

(** A representation relation between descriptor metadata, logical FIFO
    contents, and the possibly-partially-initialized physical allocation. *)
Definition CircularAreaLogicalState
    (readidx writeidx area_length b_status : Z)
    (logical : list Z) (physical : list (option Z)) : Prop :=
  0 < area_length <= 256 /\
  0 <= readidx < area_length /\
  0 <= writeidx < area_length /\
  0 <= Zlength logical <= area_length /\
  Zlength physical = area_length /\
  Forall (fun byte => 0 <= byte <= 255) logical /\
  writeidx = (readidx + Zlength logical) mod area_length /\
  (b_status = 1 <-> Zlength logical = area_length) /\
  (b_status = 0 <-> Zlength logical < area_length) /\
  CircularAreaLiveBytes readidx area_length logical physical.

(** Exact ownership used by every API contract.  The no-space [&(] spelling
    is required by the separation-logic address notation parser. *)
Definition CircularAreaBackingResource
    (circular_area data_buffer readidx writeidx area_length b_status
     operations : Z)
    (logical : list Z) (physical : list (option Z)) : Assertion :=
  “ circular_area <> 0 /\ data_buffer <> 0 /\
    CircularAreaLogicalState readidx writeidx area_length b_status
                             logical physical ” &&
  &(circular_area # "CircularArea" ->ₛ "data_buffer") # Ptr
      |-> data_buffer **
  &(circular_area # "CircularArea" ->ₛ "readidx") # UChar
      |-> readidx **
  &(circular_area # "CircularArea" ->ₛ "writeidx") # UChar
      |-> writeidx **
  &(circular_area # "CircularArea" ->ₛ "p_head") # Ptr
      |-> data_buffer **
  &(circular_area # "CircularArea" ->ₛ "p_tail") # Ptr
      |-> (data_buffer + area_length) **
  &(circular_area # "CircularArea" ->ₛ "area_length") # UInt
      |-> area_length **
  &(circular_area # "CircularArea" ->ₛ "b_status") # Int
      |-> b_status **
  &(circular_area # "CircularArea" ->ₛ "CircularAreaOperations") # Ptr
      |-> operations **
  UCharArray.mixed_full data_buffer area_length physical.

Definition CircularAreaAlignedLength (requested aligned : Z) : Prop :=
  4 <= requested /\
  requested <= 256 /\
  aligned = (requested / 4) * 4.

(** Failure preserves exactly the descriptor resources reachable after the
    two production allocation failure branches. *)
Definition CircularAreaInitFailureResource (failed_area : Z) : Assertion :=
  (“ failed_area = 0 ” && emp) ||
  (“ failed_area <> 0 ” &&
   &(failed_area # "CircularArea" ->ₛ "data_buffer") # Ptr |-> 0 **
   &(failed_area # "CircularArea" ->ₛ "readidx") # UChar |-> 0 **
   &(failed_area # "CircularArea" ->ₛ "writeidx") # UChar |-> 0 **
   &(failed_area # "CircularArea" ->ₛ "p_head") # Ptr |->_ **
   &(failed_area # "CircularArea" ->ₛ "p_tail") # Ptr |->_ **
   &(failed_area # "CircularArea" ->ₛ "area_length") # UInt |->_ **
   &(failed_area # "CircularArea" ->ₛ "b_status") # Int |-> 0 **
   &(failed_area # "CircularArea" ->ₛ "CircularAreaOperations") # Ptr
       |->_).

Definition CircularAreaCallResult (ret : Z) : Assertion :=
  (“ ret = 0 ” && EX failed_area : Z,
     CircularAreaInitFailureResource failed_area) ||
  (“ ret = 1 ” && emp).

Definition CircularAreaReadCallResult
    (ret output byte : Z) : Assertion :=
  (“ ret = 0 ” && EX failed_area : Z,
     CircularAreaInitFailureResource failed_area **
     UCharArray.undef_full output 1) ||
  (“ ret = 1 ” && UCharArray.full output 1 (byte :: nil)).

Definition CircularAreaEmptyResult (logical : list Z) (ret : Z) : Prop :=
  ret = match logical with nil => 1 | _ :: _ => 0 end.

Definition CircularAreaFullResult
    (area_length : Z) (logical : list Z) (ret : Z) : Prop :=
  ret = if Z.eq_dec (Zlength logical) area_length then 1 else 0.

Definition CircularAreaDataLengthResult
    (logical : list Z) (ret : Z) : Prop :=
  ret = Zlength logical.

Definition CircularAreaMaxLengthResult
    (area_length ret : Z) : Prop :=
  ret = area_length.
