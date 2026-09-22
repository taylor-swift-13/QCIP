Require Import Coq.Lists.List.
Require Import Coq.ZArith.ZArith.
Require Import Coq.micromega.Lia.
Require Import AUXLib.ListLib.
Require Import Coq.Strings.String.
From SimpleC.SL Require Import Mem SeparationLogic.
Require Import Logic.LogicGenerator.demo932.Interface.
Require Export QCIPLib.xizi.xizi_circular_area_common.xizi_circular_area_lib.

Import ListNotations.
Import naive_C_Rules.
Local Open Scope Z_scope.
Local Open Scope list_scope.
Local Open Scope string_scope.
Local Open Scope sac.

(** Public harness result: allocation failure returns zero and every successful
    composition returns one. *)
Definition CircularAreaCallResult (ret : Z) : Assertion :=
  (“ ret = 0 ” && emp) ||
  (“ ret = 1 ” && emp).

(** Observable result of the harnesses which perform one successful read.
    Read buffers use [mixed_full], matching the verified public Read contract. *)
Definition CircularAreaReadCallResult
    (ret output byte : Z) (output_before : list (option Z)) : Assertion :=
  (“ ret = 0 ” && UCharArray.mixed_full output 1 output_before) ||
  (“ ret = 1 ” && UCharArray.mixed_full output 1 [Some byte]).

Definition CircularAreaStateEmptyResult
    (state : circular_area_state) (ret : Z) : Prop :=
  ret = match ca_contents state with nil => 1 | _ :: _ => 0 end.

Definition CircularAreaStateFullResult
    (state : circular_area_state) (ret : Z) : Prop :=
  ret = if Z.eq_dec (Zlength (ca_contents state)) (ca_capacity state)
        then 1 else 0.

Definition CircularAreaStateDataLengthResult
    (state : circular_area_state) (ret : Z) : Prop :=
  ret = Zlength (ca_contents state).

Definition CircularAreaFourBytes (bytes : list Z) : Prop :=
  Zlength bytes = 4 /\
  Forall (fun byte => 0 <= byte <= 255) bytes.

Definition CircularAreaActualWriteLength
    (area_length requested : Z) (logical : list Z) (actual : Z) : Prop :=
  actual = Z.min requested (area_length - Zlength logical).

Definition CircularAreaPhysicalWrite
    (physical_before : list (option Z)) (input : list Z)
    (physical_after : list (option Z))
    (area_length writeidx actual : Z) : Prop :=
  Zlength physical_before = area_length /\
  Zlength physical_after = area_length /\
  actual <= Zlength input /\
  0 < area_length /\ 0 <= writeidx < area_length /\
  0 <= actual <= area_length /\
  (forall j,
      0 <= j < actual ->
      Znth ((writeidx + j) mod area_length) physical_after None =
        Some (Znth j input 0)) /\
  (forall i,
      0 <= i < area_length ->
      (forall j,
          0 <= j < actual ->
          i <> (writeidx + j) mod area_length) ->
      Znth i physical_after None = Znth i physical_before None).

(** Force mode deliberately returns a raw physical state.  It is not a
    canonical FIFO resource unless a separate recovery proof is available. *)
Record forced_circular_area_state : Type :=
  Build_forced_circular_area_state {
    fca_capacity : Z;
    fca_forced_index : Z;
    fca_physical : list (option Z)
  }.

Arguments Build_forced_circular_area_state _ _ _ : assert.

Definition CircularAreaForceWriteResult
    (state : circular_area_state) (requested : Z) (input : list Z)
    (result : Z) (raw_after : forced_circular_area_state) : Prop :=
  requested > 0 /\
  Zlength input = requested /\
  Forall (fun byte : Z => 0 <= byte <= 255) input /\
  result = 0 /\
  exists readidx writeidx b_status physical_before actual,
    CircularAreaLogicalState
      readidx writeidx (ca_capacity state) b_status
      (ca_contents state) physical_before /\
    actual =
      Z.min requested
        (ca_capacity state - Zlength (ca_contents state)) /\
    fca_capacity raw_after = ca_capacity state /\
    fca_forced_index raw_after =
      (writeidx + actual) mod ca_capacity state /\
    CircularAreaPhysicalWrite
      physical_before input (fca_physical raw_after)
      (ca_capacity state) writeidx actual.

Definition store_forced_circular_area
    (raw : forced_circular_area_state) (circular_area : addr) : Assertion :=
  EX data_buffer operations : addr,
    “ circular_area <> 0 /\ data_buffer <> 0 /\
      0 < fca_capacity raw <= 256 /\
      0 <= fca_forced_index raw < fca_capacity raw /\
      Zlength (fca_physical raw) = fca_capacity raw ” &&
    &(circular_area # "CircularArea" ->ₛ "data_buffer") # Ptr
        |-> data_buffer **
    &(circular_area # "CircularArea" ->ₛ "readidx") # UChar
        |-> fca_forced_index raw **
    &(circular_area # "CircularArea" ->ₛ "writeidx") # UChar
        |-> fca_forced_index raw **
    &(circular_area # "CircularArea" ->ₛ "p_head") # Ptr
        |-> data_buffer **
    &(circular_area # "CircularArea" ->ₛ "p_tail") # Ptr
        |-> (data_buffer + fca_capacity raw) **
    &(circular_area # "CircularArea" ->ₛ "area_length") # UInt
        |-> fca_capacity raw **
    &(circular_area # "CircularArea" ->ₛ "b_status") # Int
        |-> 1 **
    &(circular_area # "CircularArea" ->ₛ "CircularAreaOperations") # Ptr
        |-> operations **
    UCharArray.mixed_full
      data_buffer (fca_capacity raw) (fca_physical raw).

(** The only recovery exported to this client is the proved fresh/full case.
    General force-mode results remain raw. *)
Lemma CircularArea_force_fresh_full_to_store__callpoint_seed :
  forall area input raw_after,
    CircularAreaFourBytes input ->
    CircularAreaForceWriteResult
      (CircularAreaInitState 4) 4 input 0 raw_after ->
    store_forced_circular_area raw_after area |--
    store_circular_area (Build_circular_area_state 4 input) area.
Proof.
  intros area input raw_after Hfour Hforce.
  unfold CircularAreaFourBytes in Hfour.
  destruct Hfour as [Hinput_length Hinput_bytes].
  unfold CircularAreaForceWriteResult in Hforce.
  destruct Hforce as
    [_ [Hforce_input_length [_ [_
      [readidx [writeidx [b_status [physical_before [actual
        [Hbefore [Hactual [Hraw_capacity [Hraw_index Hphysical]]]]]]]]]]]]].
  unfold CircularAreaInitState in Hbefore, Hactual, Hraw_capacity,
    Hraw_index, Hphysical.
  simpl in Hbefore, Hactual, Hraw_capacity, Hraw_index, Hphysical.
  unfold CircularAreaLogicalState in Hbefore.
  destruct Hbefore as [Hcap Hbefore].
  destruct Hbefore as [Hread Hbefore].
  destruct Hbefore as [Hwrite Hbefore].
  destruct Hbefore as [Hlogical_length Hbefore].
  destruct Hbefore as [Hphysical_before_length Hbefore].
  destruct Hbefore as [Hlogical_bytes Hbefore].
  destruct Hbefore as [Hwrite_relation Hbefore].
  destruct Hbefore as [Hstatus Hbefore].
  destruct Hbefore as [Hfull_iff Hbefore].
  destruct Hbefore as [Hempty_iff Hlive_before].
  simpl in Hlogical_length, Hlogical_bytes, Hwrite_relation,
    Hfull_iff, Hempty_iff, Hlive_before.
  assert (Hactual_eq : actual = 4) by (rewrite Hactual; reflexivity).
  clear Hactual.
  subst actual.
  unfold CircularAreaPhysicalWrite in Hphysical.
  destruct Hphysical as
    [Hphysical_before_length'
      [Hphysical_after_length
        [Hwritten_length
          [Harea_positive
            [Hwriteidx_bounds
              [Hactual_area_bounds [Hwritten Hunchanged]]]]]]].
  assert (Hraw_index_eq : fca_forced_index raw_after = writeidx).
  {
    rewrite Hraw_index.
    replace (writeidx + 4) with (1 * 4 + writeidx) by lia.
    symmetry.
    apply Z.mod_unique with (q := 1); lia.
  }
  assert (Hlogical_after :
    CircularAreaLogicalState
      (fca_forced_index raw_after) (fca_forced_index raw_after)
      4 1 input (fca_physical raw_after)).
  {
    unfold CircularAreaLogicalState.
    split; [lia |].
    split; [rewrite Hraw_index_eq; exact Hwriteidx_bounds |].
    split; [rewrite Hraw_index_eq; exact Hwriteidx_bounds |].
    split; [rewrite Hinput_length; lia |].
    split; [exact Hphysical_after_length |].
    split; [exact Hinput_bytes |].
    split.
    - rewrite Hinput_length, Hraw_index_eq.
      replace (writeidx + 4) with (1 * 4 + writeidx) by lia.
      apply Z.mod_unique with (q := 1); lia.
    - split; [right; reflexivity |].
      split.
      + rewrite Hinput_length. tauto.
      + split.
        * rewrite Hinput_length. lia.
        * unfold CircularAreaLiveBytes.
          intros k Hk.
          rewrite Hraw_index_eq.
          apply Hwritten.
          rewrite Hinput_length in Hk.
          lia.
  }
  unfold store_forced_circular_area, store_circular_area.
  Intros data_buffer operations.
  Exists data_buffer operations
    (fca_forced_index raw_after) (fca_forced_index raw_after) 1
    (fca_physical raw_after).
  entailer!.
  simpl.
  rewrite Hraw_capacity.
  cancel.
Qed.
