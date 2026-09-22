Require Import Coq.Lists.List.
Require Import Coq.ZArith.ZArith.
Require Import Coq.Strings.String.
Require Import Coq.micromega.Lia.
Require Import AUXLib.ListLib.
Require Import SimpleC.SL.IntLib.
From SimpleC.SL Require Import Mem SeparationLogic.
Require Export QCIPLib.xizi.xizi_circular_area_common.xizi_circular_area_lib.

Import ListNotations.
Import naive_C_Rules.
Local Open Scope Z_scope.
Local Open Scope list_scope.
Local Open Scope string_scope.
Local Open Scope sac.

(** Standard observations needed by the real CRTOS helper functions.  They are
    kept in this case library so the force-write verification does not depend
    on another generated case module. *)
Definition CircularAreaErrorResult (result : Z) : Prop :=
  result = 1.

Definition CircularAreaStateFullResult
    (state : circular_area_state) (result : Z) : Prop :=
  result = if Z.eq_dec (Zlength (ca_contents state)) (ca_capacity state)
           then 1 else 0.

Definition CircularAreaStateDataLengthResult
    (state : circular_area_state) (result : Z) : Prop :=
  result = Zlength (ca_contents state).

(** The branch of the private divide helper depends on the hidden write
    index.  Abstract callers only need that it is a Boolean query over a valid
    state and a write length that fits in the free space. *)
Definition CircularAreaStateDivideWrDataResult
    (state : circular_area_state) (data_length result : Z) : Prop :=
  CircularAreaValid state /\
  0 <= data_length <= ca_capacity state - Zlength (ca_contents state) /\
  (result = 0 \/ result = 1).

Definition CircularAreaDivideWrDataResult
    (writeidx data_length area_length result : Z) : Prop :=
  (writeidx + data_length <= area_length /\ result = 0) \/
  (area_length < writeidx + data_length /\ result = 1).

Definition CircularAreaActualWriteLength
    (area_length requested : Z) (logical : list Z) (actual : Z) : Prop :=
  actual = Z.min requested (area_length - Zlength logical).

(** Initialized input bytes embedded into the option-valued backing-store
    model. *)
Definition CircularAreaSomeBytes (bytes : list Z) : list (option Z) :=
  map (@Some Z) bytes.

(** Extensional mathematical description of a ring write.  Written cells are
    exactly the first [actual] input bytes at their wrapped destinations; all
    other physical cells retain their old values. *)
Definition CircularAreaPhysicalWrite
    (physical_before : list (option Z)) (input : list Z)
    (physical_after : list (option Z))
    (area_length writeidx actual : Z) : Prop :=
  Zlength physical_before = area_length /\
  Zlength physical_after = area_length /\
  actual <= Zlength input /\
  0 < area_length /\
  0 <= writeidx < area_length /\
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

(** A compact property interface for the exact successful write effect. *)
Definition CircularAreaWriteSuccess
    (area_length writeidx requested actual new_writeidx : Z)
    (logical input logical_after : list Z)
    (physical_before physical_after : list (option Z)) : Prop :=
  CircularAreaActualWriteLength area_length requested logical actual /\
  0 < actual <= requested /\
  logical_after = List.app logical (sublist 0 actual input) /\
  new_writeidx = (writeidx + actual) mod area_length /\
  CircularAreaPhysicalWrite physical_before input physical_after
                            area_length writeidx actual.

(** Ordinary-write vocabulary remains defined locally because it appears in
    the shared C extern signature, although force success below deliberately
    does not return this ordinary FIFO state. *)
Definition CircularAreaWriteResult
    (state : circular_area_state) (requested : Z) (input : list Z)
    (result : Z) (state_after : circular_area_state) : Prop :=
  ((requested = 0 \/
    Zlength (ca_contents state) = ca_capacity state) /\
   result = 1 /\ state_after = state) \/
  (requested > 0 /\
   Zlength (ca_contents state) < ca_capacity state /\
   let actual :=
     Z.min requested
       (ca_capacity state - Zlength (ca_contents state)) in
   result = 0 /\
   state_after =
     Build_circular_area_state
       (ca_capacity state)
       (List.app (ca_contents state) (sublist 0 actual input))).

(** A successful force write may leave equal indices and status 1 without
    having filled the old FIFO's entire free region.  This record therefore
    exposes only abstract raw state, while descriptor pointers and operations
    remain hidden by [store_forced_circular_area]. *)
Record forced_circular_area_state : Type :=
  Build_forced_circular_area_state {
    fca_capacity : Z;
    fca_forced_index : Z;
    fca_physical : list (option Z)
  }.

Arguments Build_forced_circular_area_state _ _ _ : assert.

(** Exact successful force-write relation: [actual] is the request truncated
    to the pre-state free space, and the raw bytes are precisely the
    extensional ring update of that input prefix. *)
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

(** Raw ownership of the exact descriptor layout left by the implementation.
    In particular, this predicate intentionally omits
    [CircularAreaLogicalState]. *)
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

(** Resource-sensitive outcome for non-null arguments.  Zero requests retain
    the ordinary FIFO; positive force requests return only raw ownership. *)
Definition CircularAreaForceWriteOutcome
    (state : circular_area_state) (requested : Z) (input : list Z)
    (result circular_area : Z) : Assertion :=
  (“ requested = 0 /\ CircularAreaErrorResult result ” &&
     store_circular_area state circular_area) ||
  (EX raw_after : forced_circular_area_state,
     “ CircularAreaForceWriteResult
         state requested input result raw_after ” &&
     store_forced_circular_area raw_after circular_area).

(** A raw result is recoverable only when its bytes separately satisfy the
    ordinary full-ring invariant.  This is intentionally not an unconditional
    bridge back to [store_circular_area]. *)
Definition CircularAreaForceRawRecoverable
    (raw : forced_circular_area_state)
    (recovered : circular_area_state) : Prop :=
  ca_capacity recovered = fca_capacity raw /\
  Zlength (ca_contents recovered) = fca_capacity raw /\
  CircularAreaLogicalState
    (fca_forced_index raw) (fca_forced_index raw)
    (fca_capacity raw) 1 (ca_contents recovered) (fca_physical raw).

(** The fill-to-capacity case is expressible for a later proved recovery
    bridge without pretending that under-filled force writes form a FIFO. *)
Definition CircularAreaForceFillToCapacity
    (state : circular_area_state) (requested : Z) (input : list Z)
    (raw_after : forced_circular_area_state)
    (recovered : circular_area_state) : Prop :=
  CircularAreaForceWriteResult state requested input 0 raw_after /\
  let actual :=
    Z.min requested
      (ca_capacity state - Zlength (ca_contents state)) in
  Zlength (ca_contents state) + actual = ca_capacity state /\
  recovered =
    Build_circular_area_state
      (ca_capacity state)
      (List.app (ca_contents state) (sublist 0 actual input)).

Lemma uchar_seg_forall_bytes__force_write_outcomes :
  forall p lo hi (l : list Z),
    UCharArray.seg p lo hi l |--
      “ Forall (fun byte : Z => 0 <= byte <= 255) l ”.
Proof.
  intros p lo hi l.
  revert p lo hi.
  induction l as [|a l IH]; intros p lo hi.
  - rewrite UCharArray.seg_empty.
    entailer!.
  - rewrite UCharArray.seg_unfold.
    prop_apply store_uchar_range.
    Intros.
    sep_apply (IH p (lo + 1) hi).
    entailer!.
Qed.
Lemma uchar_full_forall_bytes__force_write_outcomes :
  forall p n (l : list Z),
    UCharArray.full p n l |--
      “ Forall (fun byte : Z => 0 <= byte <= 255) l ”.
Proof.
  intros p n l.
  sep_apply UCharArray.full_to_seg.
  sep_apply uchar_seg_forall_bytes__force_write_outcomes.
  entailer!.
Qed.
Lemma Znth_some_bytes__force_write_outcomes :
  forall (l : list Z) i,
    0 <= i < Zlength l ->
    Znth i (CircularAreaSomeBytes l) None = Some (Znth i l 0).
Proof.
  intros l i Hi.
  unfold CircularAreaSomeBytes, Znth.
  rewrite (map_nth_len Z (option Z) (@Some Z) l (Z.to_nat i) None 0)
    by (rewrite Zlength_correct in Hi; lia).
  reflexivity.
Qed.
Lemma Zlength_some_bytes__force_write_outcomes :
  forall l,
    Zlength (CircularAreaSomeBytes l) = Zlength l.
Proof.
  intros l.
  unfold CircularAreaSomeBytes.
  rewrite !Zlength_correct, length_map.
  reflexivity.
Qed.
Lemma force_physical_write_no_wrap__force_write_outcomes :
  forall physical input area_length writeidx actual,
    Zlength physical = area_length ->
    0 < area_length ->
    0 <= writeidx < area_length ->
    0 <= actual <= area_length ->
    actual <= Zlength input ->
    writeidx + actual <= area_length ->
    CircularAreaPhysicalWrite physical input
      (sublist 0 writeidx physical ++
       CircularAreaSomeBytes (sublist 0 actual input) ++
       sublist (writeidx + actual) area_length physical)
      area_length writeidx actual.
Proof.
  intros physical input area_length writeidx actual
    Hphysical Harea Hwrite Hactual Hinput Hnowrap.
  unfold CircularAreaPhysicalWrite.
  repeat split; try lia.
  - rewrite !Zlength_app, !Zlength_some_bytes__force_write_outcomes.
    rewrite !Zlength_sublist by lia.
    lia.
  - intros j Hj.
    rewrite Z.mod_small by lia.
    rewrite app_Znth2 by (rewrite Zlength_sublist by lia; lia).
    rewrite Zlength_sublist by lia.
    rewrite app_Znth1 by
      (rewrite Zlength_some_bytes__force_write_outcomes, Zlength_sublist by lia; lia).
    rewrite Znth_some_bytes__force_write_outcomes by
      (rewrite Zlength_sublist by lia; lia).
    rewrite Znth_sublist0 by lia.
    replace (writeidx + j - (writeidx - 0)) with j by lia.
    reflexivity.
  - intros i Hi Houtside.
    destruct (Z_lt_ge_dec i writeidx) as [Hleft | Hnotleft].
    + rewrite app_Znth1 by (rewrite Zlength_sublist by lia; lia).
      rewrite Znth_sublist0 by lia.
      reflexivity.
    + assert (Hright : writeidx + actual <= i).
      { destruct (Z_lt_ge_dec i (writeidx + actual)) as [Hinside | Hafter].
        - exfalso.
          specialize (Houtside (i - writeidx) ltac:(lia)).
          rewrite Z.mod_small in Houtside by lia.
          lia.
        - lia. }
      rewrite app_Znth2 by (rewrite Zlength_sublist by lia; lia).
      rewrite Zlength_sublist by lia.
      rewrite app_Znth2 by
        (rewrite Zlength_some_bytes__force_write_outcomes, Zlength_sublist by lia; lia).
      rewrite Zlength_some_bytes__force_write_outcomes, Zlength_sublist by lia.
      rewrite Znth_sublist by lia.
      replace (i - (writeidx - 0) - (actual - 0) + (writeidx + actual))
        with i by lia.
      reflexivity.
Qed.
Lemma force_physical_write_wrap__force_write_outcomes :
  forall physical input area_length writeidx actual write_len_up write_len_down,
    Zlength physical = area_length ->
    0 < area_length ->
    0 <= writeidx < area_length ->
    0 <= actual <= area_length ->
    actual <= Zlength input ->
    write_len_up = area_length - writeidx ->
    write_len_down = actual - write_len_up ->
    0 <= write_len_down <= writeidx ->
    area_length < writeidx + actual ->
    CircularAreaPhysicalWrite physical input
      (CircularAreaSomeBytes (sublist write_len_up actual input) ++
       sublist write_len_down writeidx physical ++
       CircularAreaSomeBytes (sublist 0 write_len_up input))
      area_length writeidx actual.
Proof.
  intros physical input area_length writeidx actual write_len_up write_len_down
    Hphysical Harea Hwrite Hactual Hinput Hup Hdown Hdown_bounds Hwrap.
  assert (Hup_bounds : 0 < write_len_up < actual) by lia.
  unfold CircularAreaPhysicalWrite.
  repeat split; try lia.
  - rewrite !Zlength_app, !Zlength_some_bytes__force_write_outcomes.
    rewrite !Zlength_sublist by lia.
    lia.
  - intros j Hj.
    destruct (Z_lt_ge_dec j write_len_up) as [Hupper | Hlower].
    + rewrite Z.mod_small by lia.
      rewrite app_Znth2 by
        (rewrite Zlength_some_bytes__force_write_outcomes, Zlength_sublist by lia; lia).
      rewrite Zlength_some_bytes__force_write_outcomes, Zlength_sublist by lia.
      rewrite app_Znth2 by
        (rewrite Zlength_sublist by lia; lia).
      rewrite Zlength_sublist by lia.
      rewrite Znth_some_bytes__force_write_outcomes by
        (rewrite Zlength_sublist by lia; lia).
      rewrite Znth_sublist0 by lia.
      replace
        (writeidx + j - (actual - write_len_up) -
         (writeidx - write_len_down)) with j by lia.
      reflexivity.
    + replace (writeidx + j) with
        ((j - write_len_up) + 1 * area_length) by lia.
      rewrite Z_mod_plus by lia.
      rewrite Z.mod_small by lia.
      rewrite app_Znth1 by
        (rewrite Zlength_some_bytes__force_write_outcomes, Zlength_sublist by lia; lia).
      rewrite Znth_some_bytes__force_write_outcomes by
        (rewrite Zlength_sublist by lia; lia).
      rewrite Znth_sublist by lia.
      replace (j - write_len_up + write_len_up) with j by lia.
      reflexivity.
  - intros i Hi Houtside.
    assert (Hlo : write_len_down <= i).
    { destruct (Z_lt_ge_dec i write_len_down) as [Hwritten | Hge]; [|lia].
      exfalso.
      specialize (Houtside (write_len_up + i) ltac:(lia)).
      replace (writeidx + (write_len_up + i)) with (i + 1 * area_length)
        in Houtside by lia.
      rewrite Z_mod_plus in Houtside by lia.
      rewrite Z.mod_small in Houtside by lia.
      exact (Houtside eq_refl). }
    assert (Hhi : i < writeidx).
    { destruct (Z_lt_ge_dec i writeidx) as [Hlt | Hwritten]; [lia|].
      exfalso.
      specialize (Houtside (i - writeidx) ltac:(lia)).
      rewrite Z.mod_small in Houtside by lia.
      apply Houtside.
      lia. }
    rewrite app_Znth2 by
      (rewrite Zlength_some_bytes__force_write_outcomes, Zlength_sublist by lia; lia).
    rewrite Zlength_some_bytes__force_write_outcomes, Zlength_sublist by lia.
    rewrite app_Znth1 by (rewrite Zlength_sublist by lia; lia).
    rewrite Znth_sublist by lia.
    replace (i - (actual - write_len_up) + write_len_down) with i by lia.
    reflexivity.
Qed.
Lemma force_success_no_wrap_package__force_write_outcomes :
  forall state requested input readidx writeidx b_status physical actual,
    requested > 0 ->
    Zlength input = requested ->
    Forall (fun byte : Z => 0 <= byte <= 255) input ->
    CircularAreaActualWriteLength
      (ca_capacity state) requested (ca_contents state) actual ->
    0 <= actual ->
    actual <= requested ->
    writeidx + actual <= ca_capacity state ->
    CircularAreaLogicalState readidx writeidx (ca_capacity state) b_status
      (ca_contents state) physical ->
    let physical_after :=
      List.app (sublist 0 writeidx physical)
        (List.app (CircularAreaSomeBytes (sublist 0 actual input))
          (sublist (writeidx + actual) (ca_capacity state) physical)) in
    let raw_after :=
      Build_forced_circular_area_state
        (ca_capacity state)
        ((writeidx + actual) mod ca_capacity state)
        physical_after in
    CircularAreaForceWriteResult state requested input 0 raw_after /\
    0 < fca_capacity raw_after <= 256 /\
    0 <= fca_forced_index raw_after < fca_capacity raw_after /\
    Zlength (fca_physical raw_after) = fca_capacity raw_after.
Proof.
  intros state requested input readidx writeidx b_status physical actual
    Hrequested Hinput Hbytes Hactual Hactual_nonneg Hactual_requested
    Hnowrap Hlogical.
  simpl.
  pose proof Hlogical as Hlogical0.
  unfold CircularAreaLogicalState in Hlogical.
  destruct Hlogical as
    [Hcap [Hread [Hwrite [Hlogical_len [Hphysical_len
     [Hlogical_bytes [Hindex [Hstatus [Hfull [Hempty Hlive]]]]]]]]]].
  assert (Hphysical_write :
    CircularAreaPhysicalWrite physical input
      (sublist 0 writeidx physical ++
       CircularAreaSomeBytes (sublist 0 actual input) ++
       sublist (writeidx + actual) (ca_capacity state) physical)
      (ca_capacity state) writeidx actual).
  { eapply force_physical_write_no_wrap__force_write_outcomes; eauto; lia. }
  assert (Hnewindex :
    0 <= (writeidx + actual) mod ca_capacity state < ca_capacity state).
  { apply Z.mod_pos_bound. lia. }
  assert (Hphysical_after :
    Zlength
      (sublist 0 writeidx physical ++
       CircularAreaSomeBytes (sublist 0 actual input) ++
       sublist (writeidx + actual) (ca_capacity state) physical) =
    ca_capacity state).
  { unfold CircularAreaPhysicalWrite in Hphysical_write. tauto. }
  split.
  - unfold CircularAreaForceWriteResult.
    split; [exact Hrequested |].
    split; [exact Hinput |].
    split; [exact Hbytes |].
    split; [reflexivity |].
    exists readidx, writeidx, b_status, physical, actual.
    unfold CircularAreaActualWriteLength in Hactual.
    split; [exact Hlogical0 |].
    split; [exact Hactual |].
    split; [reflexivity |].
    split; [reflexivity |].
    exact Hphysical_write.
  - repeat split; try assumption; try lia.
Qed.
Lemma force_success_wrap_package__force_write_outcomes :
  forall state requested input readidx writeidx b_status physical actual
         write_len_up write_len_down,
    requested > 0 ->
    Zlength input = requested ->
    Forall (fun byte : Z => 0 <= byte <= 255) input ->
    CircularAreaActualWriteLength
      (ca_capacity state) requested (ca_contents state) actual ->
    write_len_up = ca_capacity state - writeidx ->
    write_len_down = actual - write_len_up ->
    0 <= write_len_down <= writeidx ->
    ca_capacity state < writeidx + actual ->
    CircularAreaLogicalState readidx writeidx (ca_capacity state) b_status
      (ca_contents state) physical ->
    let physical_after :=
      List.app (CircularAreaSomeBytes (sublist write_len_up actual input))
        (List.app (sublist write_len_down writeidx physical)
          (CircularAreaSomeBytes (sublist 0 write_len_up input))) in
    let raw_after :=
      Build_forced_circular_area_state
        (ca_capacity state) write_len_down physical_after in
    CircularAreaForceWriteResult state requested input 0 raw_after /\
    0 < fca_capacity raw_after <= 256 /\
    0 <= fca_forced_index raw_after < fca_capacity raw_after /\
    Zlength (fca_physical raw_after) = fca_capacity raw_after.
Proof.
  intros state requested input readidx writeidx b_status physical actual
    write_len_up write_len_down Hrequested Hinput Hbytes Hactual Hup Hdown
    Hdown_bounds Hwrap Hlogical.
  simpl.
  pose proof Hlogical as Hlogical0.
  unfold CircularAreaLogicalState in Hlogical.
  destruct Hlogical as
    [Hcap [Hread [Hwrite [Hlogical_len [Hphysical_len
     [Hlogical_bytes [Hindex [Hstatus [Hfull [Hempty Hlive]]]]]]]]]].
  assert (Hactual_requested : actual <= requested).
  { unfold CircularAreaActualWriteLength in Hactual.
    rewrite Hactual.
    apply Z.le_min_l. }
  assert (Hactual_bounds : 0 <= actual <= ca_capacity state) by lia.
  assert (Hphysical_write :
    CircularAreaPhysicalWrite physical input
      (CircularAreaSomeBytes (sublist write_len_up actual input) ++
       sublist write_len_down writeidx physical ++
       CircularAreaSomeBytes (sublist 0 write_len_up input))
      (ca_capacity state) writeidx actual).
  { eapply force_physical_write_wrap__force_write_outcomes; eauto; lia. }
  assert (Hnewindex :
    write_len_down = (writeidx + actual) mod ca_capacity state).
  { replace (writeidx + actual) with
      (write_len_down + 1 * ca_capacity state) by lia.
    rewrite Z_mod_plus by lia.
    rewrite Z.mod_small by lia.
    reflexivity. }
  assert (Hphysical_after :
    Zlength
      (CircularAreaSomeBytes (sublist write_len_up actual input) ++
       sublist write_len_down writeidx physical ++
       CircularAreaSomeBytes (sublist 0 write_len_up input)) =
    ca_capacity state).
  { unfold CircularAreaPhysicalWrite in Hphysical_write. tauto. }
  split.
  - unfold CircularAreaForceWriteResult.
    split; [exact Hrequested |].
    split; [exact Hinput |].
    split; [exact Hbytes |].
    split; [reflexivity |].
    exists readidx, writeidx, b_status, physical, actual.
    unfold CircularAreaActualWriteLength in Hactual.
    split; [exact Hlogical0 |].
    split; [exact Hactual |].
    split; [reflexivity |].
    split; [exact Hnewindex |].
    exact Hphysical_write.
  - repeat split; try assumption; try lia.
Qed.
