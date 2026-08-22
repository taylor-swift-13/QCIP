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

Definition CircularAreaEmptyResult
    (readidx writeidx b_status result : Z) : Prop :=
  (readidx = writeidx /\ b_status = 0 /\ result = 1) \/
  ((readidx <> writeidx \/ b_status <> 0) /\ result = 0).

Definition CircularAreaDataLengthResult
    (readidx writeidx area_length b_status result : Z) : Prop :=
  (readidx = writeidx /\ b_status <> 0 /\ result = area_length) \/
  ((readidx <> writeidx \/ b_status = 0) /\
   result = Z.rem
              (unsigned_last_nbits
                 (unsigned_last_nbits (writeidx - readidx) 32 + area_length)
                 32)
              area_length).

Definition CircularAreaDivideRdDataResult
    (readidx data_length area_length result : Z) : Prop :=
  (readidx + data_length <= area_length /\ result = 0) \/
  (area_length < readidx + data_length /\ result = 1).

(** Extensional FIFO observation; this is a mathematical ring slice rather
    than an executable model of the C branches. *)
Definition CircularAreaReadBytes
    (buffer_contents : list Z)
    (readidx area_length count : Z)
    (bytes : list Z) : Prop :=
  Zlength bytes = count /\
  bytes =
    if Z.leb (readidx + count) area_length then
      sublist readidx (readidx + count) buffer_contents
    else
      sublist readidx area_length buffer_contents ++
      sublist 0 (readidx + count - area_length) buffer_contents.

Definition CircularAreaActualReadLength
    (readidx writeidx area_length b_status requested actual : Z) : Prop :=
  exists available,
    CircularAreaDataLengthResult
      readidx writeidx area_length b_status available /\
    actual = Z.min requested available.

Definition CircularAreaOutputAfterRead
    (output_before : list Z) (output_capacity : Z)
    (bytes output_after : list Z) : Prop :=
  output_after =
    bytes ++ sublist (Zlength bytes) output_capacity output_before.

Definition CircularAreaReadSuccess
    (readidx writeidx area_length b_status requested output_capacity : Z)
    (buffer_contents output_before : list Z)
    (actual new_readidx : Z)
    (bytes output_after : list Z) : Prop :=
  CircularAreaActualReadLength
    readidx writeidx area_length b_status requested actual /\
  0 < actual <= requested /\
  CircularAreaReadBytes
    buffer_contents readidx area_length actual bytes /\
  new_readidx = Z.rem (readidx + actual) area_length /\
  CircularAreaOutputAfterRead
    output_before output_capacity bytes output_after.

Lemma circular_area_data_length_functional__read_preparation_and_memcpy :
  forall readidx writeidx area_length b_status x y,
    CircularAreaDataLengthResult
      readidx writeidx area_length b_status x ->
    CircularAreaDataLengthResult
      readidx writeidx area_length b_status y ->
    x = y.
Proof.
  unfold CircularAreaDataLengthResult.
  intros readidx writeidx area_length b_status x y Hx Hy.
  destruct Hx as [[Hrw [Hstatus Hx]] | [[Hrw | Hstatus] Hx]];
    destruct Hy as [[Hrw' [Hstatus' Hy]] | [[Hrw' | Hstatus'] Hy]];
    subst; try reflexivity; try contradiction.
Qed.
Lemma circular_area_data_length_bounds__read_preparation_and_memcpy :
  forall readidx writeidx area_length b_status buffer_contents n,
    CircularAreaDescriptorState
      readidx writeidx area_length b_status buffer_contents ->
    CircularAreaDataLengthResult
      readidx writeidx area_length b_status n ->
    0 <= n <= area_length.
Proof.
  unfold CircularAreaDescriptorState, CircularAreaDataLengthResult.
  intros readidx writeidx area_length b_status buffer_contents n
    Hstate Hresult.
  destruct Hstate as [_ [_ [[Harea_pos Harea_bound] _]]].
  destruct Hresult as [[_ [_ Hn]] | [_ Hn]].
  - subst n; lia.
  - subst n.
    pose proof
      (unsigned_Lastnbits_range
         (unsigned_last_nbits (writeidx - readidx) 32 + area_length) 32)
      as Hunsigned.
    specialize (Hunsigned ltac:(lia)).
    pose proof
      (Z.rem_bound_pos
         (unsigned_last_nbits
            (unsigned_last_nbits (writeidx - readidx) 32 + area_length) 32)
         area_length ltac:(lia) ltac:(lia)) as Hrem.
    lia.
Qed.
Lemma circular_area_actual_read_bounds__read_preparation_and_memcpy :
  forall readidx writeidx area_length b_status buffer_contents requested actual,
    0 <= requested ->
    CircularAreaDescriptorState
      readidx writeidx area_length b_status buffer_contents ->
    CircularAreaActualReadLength
      readidx writeidx area_length b_status requested actual ->
    0 <= actual <= requested /\ actual <= area_length.
Proof.
  intros readidx writeidx area_length b_status buffer_contents requested actual
    Hrequested Hstate [available [Havailable Hactual]].
  subst actual.
  pose proof
    (circular_area_data_length_bounds__read_preparation_and_memcpy
       readidx writeidx area_length b_status buffer_contents available
       Hstate Havailable) as Hbounds.
  split.
  - split.
    + apply Z.min_glb; lia.
    + apply Z.le_min_l.
  - eapply Z.le_trans; [apply Z.le_min_r | lia].
Qed.
Lemma circular_area_ring_distance_positive__read_preparation_and_memcpy :
  forall readidx writeidx area_length,
    0 <= readidx < area_length ->
    0 <= writeidx < area_length ->
    area_length <= 256 ->
    readidx <> writeidx ->
    0 < Z.rem
      (unsigned_last_nbits
        (unsigned_last_nbits (writeidx - readidx) 32 + area_length) 32)
      area_length.
Proof.
  unfold unsigned_last_nbits.
  intros readidx writeidx area_length [Hr0 Hr] [Hw0 Hw] Ha Hne.
  change (2 ^ 32) with 4294967296 in *.
  destruct (Z_lt_ge_dec writeidx readidx) as [Hlt | Hge].
  - assert (Hd : (writeidx - readidx) mod 4294967296 =
      4294967296 + (writeidx - readidx)).
    { symmetry. apply Z.mod_unique_pos with (q := -1); [lia | ring]. }
    rewrite Hd.
    assert (Hu : (4294967296 + (writeidx - readidx) + area_length)
      mod 4294967296 = writeidx - readidx + area_length).
    { symmetry. apply Z.mod_unique_pos with (q := 1); [lia | ring]. }
    rewrite Hu.
    assert (Hrem : Z.rem (writeidx - readidx + area_length) area_length =
      writeidx - readidx + area_length).
    { symmetry. apply Z.rem_unique with (q := 0); [lia | lia | ring]. }
    rewrite Hrem; lia.
  - assert (Hd : (writeidx - readidx) mod 4294967296 =
      writeidx - readidx).
    { symmetry. apply Z.mod_unique_pos with (q := 0); [lia | ring]. }
    rewrite Hd.
    assert (Hu : (writeidx - readidx + area_length) mod 4294967296 =
      writeidx - readidx + area_length).
    { symmetry. apply Z.mod_unique_pos with (q := 0); [lia | ring]. }
    rewrite Hu.
    assert (Hrem : Z.rem (writeidx - readidx + area_length) area_length =
      writeidx - readidx).
    { symmetry. apply Z.rem_unique with (q := 1); [lia | lia | ring]. }
    rewrite Hrem; lia.
Qed.
Lemma circular_area_data_length_positive__read_preparation_and_memcpy :
  forall readidx writeidx area_length b_status buffer_contents n,
    CircularAreaDescriptorState
      readidx writeidx area_length b_status buffer_contents ->
    CircularAreaEmptyResult readidx writeidx b_status 0 ->
    CircularAreaDataLengthResult
      readidx writeidx area_length b_status n ->
    0 < n.
Proof.
  unfold CircularAreaDescriptorState, CircularAreaEmptyResult,
    CircularAreaDataLengthResult.
  intros readidx writeidx area_length b_status buffer_contents n
    Hstate Hempty Hdata.
  destruct Hstate as [[Hr0 Hr] [[Hw0 Hw] [[Ha0 Ha] Hrest]]].
  destruct Hempty as [[? [? ?]] | [[Hne | Hstatus] ?]]; try lia.
  all: destruct Hdata as [[? [? ?]] | [[Hne' | Hstatus'] ?]];
    subst; try lia; try contradiction.
  all: eapply circular_area_ring_distance_positive__read_preparation_and_memcpy;
    eauto.
Qed.
