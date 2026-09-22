Require Import Coq.ZArith.ZArith.
Require Import Coq.Lists.List.
Require Import Coq.Strings.String.
From AUXLib Require Import ListLib.
From SimpleC.SL Require Import Mem SeparationLogic.
Require Import Logic.LogicGenerator.demo932.Interface.

Import ListNotations.
Import naive_C_Rules.
Local Open Scope Z_scope.
Local Open Scope list_scope.
Local Open Scope string_scope.
Local Open Scope sac.

(** The option-list shape returned by a successful backing-buffer allocation.
    No byte is claimed to be initialized at this point. *)
Definition xizi_circular_area_uninitialized
    (area_length : Z) (physical : list (option Z)) : Prop :=
  physical = repeat None (Z.to_nat area_length).

(** The logical FIFO occupies initialized cells of the physical ring.  Cells
    outside the live interval may be either [None] or historical [Some] data. *)
Definition CircularAreaLiveBytes
    (readidx area_length : Z)
    (logical : list Z) (physical : list (option Z)) : Prop :=
  forall k : Z,
    0 <= k < Zlength logical ->
    Znth ((readidx + k) mod area_length) physical None =
      Some (Znth k logical 0).

(** Canonical pure representation invariant for every initialized circular
    area.  [logical] is the FIFO view; [physical] tracks initialization of the
    allocated cells used by [UCharArray.mixed_full].  The production status
    bit records the last direction only for resolving equal-index states:
    non-equal indices may carry either status value. *)
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
  (b_status = 0 \/ b_status = 1) /\
  (readidx = writeidx /\ b_status = 1 <->
     Zlength logical = area_length) /\
  (readidx = writeidx /\ b_status = 0 <->
     Zlength logical = 0) /\
  CircularAreaLiveBytes readidx area_length logical physical.

(** Public logical state, following the CRTOS [idmanager] style.  Clients see
    only the fixed capacity and FIFO contents.  Ring indices, the status bit,
    physical cells, and implementation pointers are representation details of
    [store_circular_area]. *)
Record circular_area_state : Type :=
  Build_circular_area_state {
    ca_capacity : Z;
    ca_contents : list Z
  }.

Arguments Build_circular_area_state _ _ : assert.

(** Pure facts available to clients without exposing a concrete ring layout. *)
Definition CircularAreaValid (state : circular_area_state) : Prop :=
  0 < ca_capacity state <= 256 /\
  0 <= Zlength (ca_contents state) <= ca_capacity state /\
  Forall (fun byte => 0 <= byte <= 255) (ca_contents state).

(** The public state returned by a successful [CircularAreaInit]. *)
Definition CircularAreaInitState (requested : Z) : circular_area_state :=
  Build_circular_area_state ((requested / 4) * 4) nil.

Arguments CircularAreaInitState _ : assert.

(** Unified ownership of a descriptor and its backing allocation.  The
    backing-buffer and operations-table addresses are representation details,
    existentially hidden exactly like [store_idmanager] hides [id_map] and
    [htable]. *)
Definition store_circular_area
    (state : circular_area_state) (circular_area : addr) : Assertion :=
  EX data_buffer operations : addr,
  EX readidx writeidx b_status : Z,
  EX physical : list (option Z),
    “ circular_area <> 0 /\ data_buffer <> 0 /\
      CircularAreaLogicalState
        readidx writeidx (ca_capacity state) b_status
        (ca_contents state) physical ” &&
    &(circular_area # "CircularArea" ->ₛ "data_buffer") # Ptr
        |-> data_buffer **
    &(circular_area # "CircularArea" ->ₛ "readidx") # UChar
        |-> readidx **
    &(circular_area # "CircularArea" ->ₛ "writeidx") # UChar
        |-> writeidx **
    &(circular_area # "CircularArea" ->ₛ "p_head") # Ptr
        |-> data_buffer **
    &(circular_area # "CircularArea" ->ₛ "p_tail") # Ptr
        |-> (data_buffer + ca_capacity state) **
    &(circular_area # "CircularArea" ->ₛ "area_length") # UInt
        |-> ca_capacity state **
    &(circular_area # "CircularArea" ->ₛ "b_status") # Int
        |-> b_status **
    &(circular_area # "CircularArea" ->ₛ "CircularAreaOperations") # Ptr
        |-> operations **
    UCharArray.mixed_full
      data_buffer (ca_capacity state) physical.

Definition CircularAreaAlignedLength (requested aligned : Z) : Prop :=
  4 <= requested /\
  requested <= 256 /\
  aligned = (requested / 4) * 4.

Lemma xizi_Znth_replace_Znth_same :
  forall {A : Type} (i : Z) (x d : A) (l : list A),
    0 <= i < Zlength l ->
    Znth i (replace_Znth i x l) d = x.
Proof.
  intros.
  apply Znth_replace_Znth_Same.
  exact H.
Qed.

Lemma xizi_Znth_replace_Znth_diff :
  forall {A : Type} (k i : Z) (x d : A) (l : list A),
    0 <= k < Zlength l ->
    0 <= i < Zlength l ->
    k <> i ->
    Znth k (replace_Znth i x l) d = Znth k l d.
Proof.
  intros.
  eapply Znth_replace_Znth_Diff; eauto.
Qed.
