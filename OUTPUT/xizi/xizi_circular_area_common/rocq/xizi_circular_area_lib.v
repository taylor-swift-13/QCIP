Require Import Coq.ZArith.ZArith.
Require Import Coq.Lists.List.
Require Import Coq.Strings.String.
From AUXLib Require Import ListLib.
From SimpleC.SL Require Import Mem SeparationLogic.
Require Import Logic.LogicGenerator.demo932.Interface.
Require Import SimpleC.SL.IntLib.
Require Import Coq.micromega.Lia.

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

(** CircularAreaWrite contract and proof support. *)

(** A single syntactic entry branch for [CircularAreaWrite].  Packaging the
    nullable ownership alternatives lets QCP bind one unambiguous [@pre]
    snapshot while preserving exactly the original four client cases. *)
Definition CircularAreaWriteInput
    (state : circular_area_state) (input_contents : list Z)
    (circular_area input_buffer data_length b_force : Z) : Assertion :=
  “ 0 <= data_length <= Int.max_unsigned ” &&
  ((“ circular_area = 0 ” && emp) ||
   (“ circular_area <> 0 ” && store_circular_area state circular_area)) **
  ((“ input_buffer = 0 ” && emp) ||
   (“ input_buffer <> 0 /\ Zlength input_contents = data_length ” &&
    UCharArray.full input_buffer data_length input_contents)).

Definition CircularAreaInputOwnership
    (input_buffer data_length : Z) (input_contents : list Z) : Assertion :=
  ((“ input_buffer = 0 ” && emp) ||
   (“ input_buffer <> 0 /\ Zlength input_contents = data_length ” &&
    UCharArray.full input_buffer data_length input_contents)).

Definition CircularAreaDescriptorOwnership
    (state : circular_area_state) (circular_area : Z) : Assertion :=
  ((“ circular_area = 0 ” && emp) ||
   (“ circular_area <> 0 ” && store_circular_area state circular_area)).

Definition CircularAreaErrorResult (result : Z) : Prop :=
  result = 1.

Definition CircularAreaStateFullResult
    (state : circular_area_state) (result : Z) : Prop :=
  result = if Z.eq_dec (Zlength (ca_contents state)) (ca_capacity state)
           then 1 else 0.

Definition CircularAreaStateDataLengthResult
    (state : circular_area_state) (result : Z) : Prop :=
  result = Zlength (ca_contents state).

(** Query results are tied directly to the descriptor fields that the helpers
    read and preserve.  [CircularAreaLogicalState] in their preconditions
    connects these concrete fields to the abstract FIFO snapshot. *)
Definition CircularAreaFullByFieldsResult
    (readidx writeidx b_status result : Z) : Prop :=
  result = if Z.eq_dec readidx writeidx then
             (if Z.eq_dec b_status 0 then 0 else 1)
           else 0.

Definition CircularAreaDataLengthByFieldsResult
    (readidx writeidx b_status capacity result : Z) : Prop :=
  0 < capacity /\
  result = if Z.eq_dec readidx writeidx then
             (if Z.eq_dec b_status 0 then 0 else capacity)
           else (writeidx - readidx + capacity) mod capacity.

(** The divide helper is a state-preserving implementation query.  Its branch
    result depends on the hidden write index, so the abstract contract exposes
    only the two legitimate boolean observations. *)
Definition CircularAreaStateDivideWrDataResult
    (state : circular_area_state) (data_length result : Z) : Prop :=
  CircularAreaValid state /\
  0 <= data_length <= ca_capacity state - Zlength (ca_contents state) /\
  (result = 0 \/ result = 1).

(** Complete public semantics for ordinary ([b_force = 0]) writes.  Invalid
    zero-length and full-ring requests preserve the abstract FIFO; successful
    calls append exactly the prefix that fits and preserve the capacity. *)
(** Mathematical FIFO behavior, independent of the physical copy split. *)
Definition CircularAreaLastCapacity (capacity : Z) (xs : list Z) : list Z :=
  sublist (Zlength xs - capacity) (Zlength xs) xs.

Definition CircularAreaWriteResult
    (state : circular_area_state) (requested : Z) (input : list Z)
    (b_force circular_area input_buffer result : Z)
    (state_after : circular_area_state) : Prop :=
  ((circular_area = 0 \/ input_buffer = 0 \/ requested = 0) /\
   result = 1 /\ state_after = state) \/
  (circular_area <> 0 /\ input_buffer <> 0 /\ requested > 0 /\
   b_force = 0 /\ Zlength (ca_contents state) = ca_capacity state /\
   result = 1 /\ state_after = state) \/
  (circular_area <> 0 /\ input_buffer <> 0 /\ requested > 0 /\
   b_force = 0 /\ Zlength (ca_contents state) < ca_capacity state /\
   Zlength input = requested /\
   let actual := Z.min requested
       (ca_capacity state - Zlength (ca_contents state)) in
   result = 0 /\
   state_after = Build_circular_area_state (ca_capacity state)
       (ca_contents state ++ sublist 0 actual input)) \/
  (circular_area <> 0 /\ input_buffer <> 0 /\ requested > 0 /\
   b_force <> 0 /\ Zlength input = requested /\ result = 0 /\
   state_after = Build_circular_area_state (ca_capacity state)
       (CircularAreaLastCapacity (ca_capacity state)
          (ca_contents state ++ input))).

Definition CircularAreaDivideWrDataResult
    (writeidx data_length area_length result : Z) : Prop :=
  (writeidx + data_length <= area_length /\ result = 0) \/
  (area_length < writeidx + data_length /\ result = 1).

Definition CircularAreaActualWriteLength
    (area_length requested : Z) (logical : list Z) (actual : Z) : Prop :=
  actual = Z.min requested (area_length - Zlength logical).

(** The option-list representation of a sequence of bytes known to have been
    initialized.  It is kept as a small mathematical adapter between ordinary
    input arrays and the mixed backing buffer. *)
Definition CircularAreaSomeBytes (bytes : list Z) : list (option Z) :=
  map (@Some Z) bytes.

(** Extensional ring update: exactly the positions reached by the written
    prefix contain the corresponding input bytes; every other cell retains its
    previous [None]/[Some] value. *)
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

(** Mathematical effect promised by every successful non-force call. *)
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

Lemma circular_area_some_bytes_Znth__write_returns :
  forall (l : list Z) i,
    0 <= i < Zlength l ->
    Znth i (CircularAreaSomeBytes l) None = Some (Znth i l 0).
Proof.
  intros l i Hi.
  unfold CircularAreaSomeBytes, Znth.
  assert (Hnat : (Z.to_nat i < Datatypes.length l)%nat).
  { rewrite Zlength_correct in Hi. lia. }
  rewrite (@nth_indep (option Z) (map (@Some Z) l) (Z.to_nat i) None (Some 0)).
  2: { rewrite length_map. exact Hnat. }
  rewrite map_nth.
  reflexivity.
Qed.
Lemma circular_area_some_bytes_Zlength__write_returns :
  forall l, Zlength (CircularAreaSomeBytes l) = Zlength l.
Proof.
  intros l.
  unfold CircularAreaSomeBytes.
  repeat rewrite Zlength_correct.
  rewrite length_map.
  reflexivity.
Qed.
Lemma circular_area_uchar_seg_forall__write_returns : forall x lo hi l,
  UCharArray.seg x lo hi l |--
  “ Forall (fun byte : Z => 0 <= byte <= 255) l ”.
Proof.
  intros x lo hi l.
  unfold UCharArray.seg.
  revert lo.
  induction l as [|a l IH]; intros lo.
  - simpl store_array_rec. entailer!.
  - simpl store_array_rec.
    sep_apply store_uchar_range.
    prop_apply (IH (lo + 1)).
    entailer!.
Qed.
Lemma circular_area_uchar_full_forall__write_returns : forall x n l,
  UCharArray.full x n l |--
  “ Forall (fun byte : Z => 0 <= byte <= 255) l ”.
Proof.
  intros.
  unfold UCharArray.full, store_array.
  apply circular_area_uchar_seg_forall__write_returns.
Qed.
Lemma circular_area_forall_Znth__write_returns
    {A : Type} (P : A -> Prop) (d : A) (l : list A) :
  Forall P l <-> (forall i, 0 <= i < Zlength l -> P (Znth i l d)).
Proof.
  induction l as [|a l IH].
  - rewrite Zlength_nil. split.
    + intros _ i Hi. lia.
    + intros _. constructor.
  - rewrite Zlength_cons. pose proof (Zlength_nonneg l) as Hlen.
    split.
    + intros HF i Hi. inversion HF as [|? ? Ha Hl]; subst.
      destruct (Z.eq_dec i 0) as [->|Hne].
      * rewrite Znth0_cons. exact Ha.
      * rewrite Znth_cons by lia.
        apply (proj1 IH Hl). lia.
    + intros H. constructor.
      * specialize (H 0). rewrite Znth0_cons in H. apply H. lia.
      * apply (proj2 IH). intros i Hi.
        specialize (H (i + 1)). rewrite Znth_cons in H by lia.
        replace (i + 1 - 1) with i in H by lia.
        apply H. lia.
Qed.
Lemma circular_area_forall_sublist__write_returns
    {A : Type} (P : A -> Prop) (d : A) :
  forall l lo hi,
    Forall P l -> 0 <= lo <= hi -> hi <= Zlength l ->
    Forall P (sublist lo hi l).
Proof.
  intros l lo hi HF Hrange Hhi.
  apply (proj2 (circular_area_forall_Znth__write_returns P d _)).
  intros i Hi.
  rewrite Zlength_sublist in Hi by lia.
  rewrite Znth_sublist by lia.
  apply (proj1 (circular_area_forall_Znth__write_returns P d l) HF).
  lia.
Qed.
Lemma circular_area_mod_add_mod_left__write_returns : forall x y n,
  n <> 0 -> ((x mod n) + y) mod n = (x + y) mod n.
Proof.
  intros.
  rewrite Z.add_mod by exact H.
  rewrite Z.mod_mod by exact H.
  rewrite <- Z.add_mod by exact H.
  reflexivity.
Qed.
Lemma circular_area_mod_strict_window_neq__write_returns : forall n x y,
  0 < n -> 0 <= x < 2 * n -> x < y < 2 * n -> y < x + n ->
  x mod n <> y mod n.
Proof.
  intros n x y Hn Hx Hy Hyx Heq.
  destruct (Z_lt_ge_dec x n) as [Hxn|Hxn].
  - rewrite Z.mod_small in Heq by lia.
    destruct (Z_lt_ge_dec y n) as [Hyn|Hyn].
    + rewrite Z.mod_small in Heq by lia. lia.
    + assert (Hymod : y mod n = y - n).
      { symmetry. apply Z.mod_unique with (q := 1); lia. }
      rewrite Hymod in Heq. lia.
  - assert (Hxmod : x mod n = x - n).
    { symmetry. apply Z.mod_unique with (q := 1); lia. }
    assert (Hymod : y mod n = y - n).
    { symmetry. apply Z.mod_unique with (q := 1); lia. }
    rewrite Hxmod, Hymod in Heq. lia.
Qed.
Lemma circular_area_logical_state_after_write__write_returns :
  forall readidx writeidx area_length b_status logical physical
         input physical_after actual,
    CircularAreaLogicalState readidx writeidx area_length b_status
      logical physical ->
    CircularAreaPhysicalWrite physical input physical_after
      area_length writeidx actual ->
    Forall (fun byte : Z => 0 <= byte <= 255) input ->
    0 < actual ->
    actual <= area_length - Zlength logical ->
    CircularAreaLogicalState readidx ((writeidx + actual) mod area_length)
      area_length 1 (logical ++ sublist 0 actual input) physical_after.
Proof.
  intros readidx writeidx area_length b_status logical physical
         input physical_after actual Hstate Hphysicalwrite Hinputbytes
         Hactualpos Hfree.
  unfold CircularAreaLogicalState in Hstate |- *.
  destruct Hstate as
    [Harea [Hread [Hwrite [Hlogical [Hphysical
    [Hlogicalbytes [Hindex [Hstatus [Hfull [Hempty Hlive]]]]]]]]]].
  unfold CircularAreaPhysicalWrite in Hphysicalwrite.
  destruct Hphysicalwrite as
    [Hphysical0 [Hphysicalafter [Hinput [Harea0 [Hwrite0
    [Hactualrange [Hwritten Hunchanged]]]]]]].
  assert (Hsub_len : Zlength (sublist 0 actual input) = actual).
  { rewrite Zlength_sublist by lia. lia. }
  assert (Hnewlen : Zlength (logical ++ sublist 0 actual input) =
                    Zlength logical + actual).
  { rewrite Zlength_app, Hsub_len. reflexivity. }
  assert (Hnewbounds :
    0 < Zlength logical + actual <= area_length) by lia.
  assert (Hnewindex :
    (writeidx + actual) mod area_length =
    (readidx + Zlength (logical ++ sublist 0 actual input)) mod area_length).
  {
    rewrite Hnewlen.
    replace (readidx + (Zlength logical + actual))
      with ((readidx + Zlength logical) + actual) by lia.
    rewrite Hindex.
    apply circular_area_mod_add_mod_left__write_returns. lia.
  }
  assert (Hnewbytes : Forall (fun byte : Z => 0 <= byte <= 255)
    (logical ++ sublist 0 actual input)).
  {
    apply Forall_app. split; [exact Hlogicalbytes|].
    eapply circular_area_forall_sublist__write_returns; eauto; lia.
  }
  assert (Hfullnew :
    (readidx = (writeidx + actual) mod area_length /\ 1 = 1 <->
     Zlength (logical ++ sublist 0 actual input) = area_length)).
  {
    rewrite Hnewlen.
    split.
    - intros [Heq _]. rewrite Hnewindex, Hnewlen in Heq.
      destruct (Z_lt_ge_dec (readidx + (Zlength logical + actual))
                            area_length) as [Hsmall|Hlarge].
      + rewrite Z.mod_small in Heq by lia. lia.
      + assert (Hmodone :
          (readidx + (Zlength logical + actual)) mod area_length =
          readidx + (Zlength logical + actual) - area_length).
        { symmetry. apply Z.mod_unique with (q := 1); lia. }
        rewrite Hmodone in Heq. lia.
    - intros Hlen. split; [|reflexivity].
      rewrite Hnewindex, Hnewlen.
      assert (Hmodone :
        (readidx + (Zlength logical + actual)) mod area_length = readidx).
      { symmetry. apply Z.mod_unique with (q := 1); lia. }
      symmetry. exact Hmodone.
  }
  assert (Hemptynew :
    (readidx = (writeidx + actual) mod area_length /\ 1 = 0 <->
     Zlength (logical ++ sublist 0 actual input) = 0)) by (rewrite Hnewlen; lia).
  assert (Hlivenew : CircularAreaLiveBytes readidx area_length
    (logical ++ sublist 0 actual input) physical_after).
  {
    unfold CircularAreaLiveBytes in Hlive |- *.
    intros k Hk.
    rewrite Hnewlen in Hk.
    destruct (Z_lt_ge_dec k (Zlength logical)) as [Hold|Hnew].
    - rewrite app_Znth1 by lia.
      rewrite Hunchanged.
      + apply Hlive. lia.
      + apply Z.mod_pos_bound. lia.
      + intros j Hj Heq.
        rewrite Hindex in Heq.
        rewrite circular_area_mod_add_mod_left__write_returns in Heq by lia.
        apply (circular_area_mod_strict_window_neq__write_returns area_length
          (readidx + k) (readidx + Zlength logical + j)); try lia.
    - assert (Hj : 0 <= k - Zlength logical < actual) by lia.
      rewrite app_Znth2 by lia.
      assert (Hidx : (readidx + k) mod area_length =
        (writeidx + (k - Zlength logical)) mod area_length).
      {
        rewrite Hindex.
        rewrite circular_area_mod_add_mod_left__write_returns by lia.
        replace (readidx + Zlength logical + (k - Zlength logical))
          with (readidx + k) by lia.
        reflexivity.
      }
      rewrite Hidx.
      rewrite Hwritten with (j := k - Zlength logical) by exact Hj.
      rewrite Znth_sublist0 by lia.
      replace (k - Zlength logical - 0) with (k - Zlength logical) by lia.
      reflexivity.
  }
  repeat split; try assumption; try lia.
  all: pose proof (Z.mod_pos_bound (writeidx + actual) area_length ltac:(lia)); lia.
Qed.
Lemma circular_area_physical_write_wrap__write_returns :
  forall (physical : list (option Z)) (input : list Z)
         area_length writeidx actual write_len_up write_len_down,
    Zlength physical = area_length ->
    actual <= Zlength input ->
    0 < area_length ->
    0 <= writeidx < area_length ->
    write_len_up = area_length - writeidx ->
    write_len_down = actual - write_len_up ->
    0 <= write_len_down <= writeidx ->
    0 <= actual <= area_length ->
    CircularAreaPhysicalWrite
      physical input
      (CircularAreaSomeBytes (sublist write_len_up actual input) ++
       sublist write_len_down writeidx physical ++
       CircularAreaSomeBytes (sublist 0 write_len_up input))
      area_length writeidx actual.
Proof.
  intros physical input area_length writeidx actual write_len_up
         write_len_down Hphysical Hinput Harea Hwrite Hup Hdown
         Hdownrange Hactual.
  unfold CircularAreaPhysicalWrite.
  repeat split; try lia.
  - repeat rewrite Zlength_app.
    repeat rewrite circular_area_some_bytes_Zlength__write_returns.
    repeat rewrite Zlength_sublist by lia.
    lia.
  - intros j Hj.
    destruct (Z_lt_ge_dec j write_len_up) as [Htail | Hhead].
    + rewrite Z.mod_small by lia.
      rewrite app_Znth2 by
        (rewrite circular_area_some_bytes_Zlength__write_returns,
                 Zlength_sublist by lia; lia).
      rewrite circular_area_some_bytes_Zlength__write_returns,
              Zlength_sublist by lia.
      rewrite app_Znth2 by (rewrite Zlength_sublist by lia; lia).
      rewrite Zlength_sublist by lia.
      rewrite circular_area_some_bytes_Znth__write_returns.
      2: { rewrite Zlength_sublist by lia. lia. }
      rewrite Znth_sublist0 by lia.
      replace (writeidx + j - (actual - write_len_up) -
               (writeidx - write_len_down)) with j by lia.
      reflexivity.
    + replace ((writeidx + j) mod area_length)
        with (j - write_len_up).
      2: {
        apply Z.mod_unique with (q := 1).
        - left. lia.
        - lia.
      }
      rewrite app_Znth1.
      2: {
        rewrite circular_area_some_bytes_Zlength__write_returns,
                Zlength_sublist by lia.
        lia.
      }
      rewrite circular_area_some_bytes_Znth__write_returns.
      2: { rewrite Zlength_sublist by lia. lia. }
      rewrite Znth_sublist by lia.
      replace (j - write_len_up + write_len_up) with j by lia.
      reflexivity.
  - intros i Hi Hnotwritten.
    assert (Hilo : write_len_down <= i).
    {
      apply Z.nlt_ge.
      intro Hbelow.
      specialize (Hnotwritten (write_len_up + i)).
      assert (Hj : 0 <= write_len_up + i < actual) by lia.
      specialize (Hnotwritten Hj).
      assert (Hmod : (writeidx + (write_len_up + i)) mod area_length = i).
      {
        symmetry.
        apply Z.mod_unique with (q := 1).
        - left. lia.
        - lia.
      }
      lia.
    }
    assert (Hihi : i < writeidx).
    {
      apply Z.lt_nge.
      intro Habove.
      specialize (Hnotwritten (i - writeidx)).
      assert (Hj : 0 <= i - writeidx < actual) by lia.
      specialize (Hnotwritten Hj).
      rewrite Z.mod_small in Hnotwritten by lia.
      lia.
    }
    rewrite app_Znth2 by
      (rewrite circular_area_some_bytes_Zlength__write_returns,
               Zlength_sublist by lia; lia).
    rewrite circular_area_some_bytes_Zlength__write_returns,
            Zlength_sublist by lia.
    rewrite app_Znth1 by (rewrite Zlength_sublist by lia; lia).
    rewrite Znth_sublist by lia.
    replace (i - (actual - write_len_up) + write_len_down) with i by lia.
    reflexivity.
Qed.
Lemma circular_area_physical_write_nowrap__write_returns :
  forall (physical : list (option Z)) (input : list Z)
         area_length writeidx actual,
    Zlength physical = area_length ->
    actual <= Zlength input ->
    0 < area_length ->
    0 <= writeidx ->
    writeidx < area_length ->
    writeidx + actual <= area_length ->
    0 <= actual ->
    CircularAreaPhysicalWrite
      physical input
      (sublist 0 writeidx physical ++
       CircularAreaSomeBytes (sublist 0 actual input) ++
       sublist (writeidx + actual) area_length physical)
      area_length writeidx actual.
Proof.
  intros physical input area_length writeidx actual
         Hphysical Hinput Harea Hwrite Hwritebound Hend Hactual.
  unfold CircularAreaPhysicalWrite.
  repeat split; try lia.
  - repeat rewrite Zlength_app.
    rewrite circular_area_some_bytes_Zlength__write_returns.
    repeat rewrite Zlength_sublist by lia.
    lia.
  - intros j Hj.
    rewrite Z.mod_small by lia.
    rewrite app_Znth2 by (rewrite Zlength_sublist by lia; lia).
    rewrite Zlength_sublist by lia.
    rewrite app_Znth1.
    2: {
      rewrite circular_area_some_bytes_Zlength__write_returns.
      rewrite Zlength_sublist by lia.
      lia.
    }
    rewrite circular_area_some_bytes_Znth__write_returns.
    2: { rewrite Zlength_sublist by lia. lia. }
    rewrite Znth_sublist0 by lia.
    replace (writeidx + j - (writeidx - 0)) with j by lia.
    reflexivity.
  - intros i Hi Hnotwritten.
    destruct (Z_lt_ge_dec i writeidx) as [Hleft | Hnotleft].
    + rewrite app_Znth1 by (rewrite Zlength_sublist by lia; lia).
      rewrite Znth_sublist0 by lia.
      reflexivity.
    + assert (Hright : writeidx + actual <= i).
      {
        apply Z.nlt_ge.
        intro Hmiddle.
        specialize (Hnotwritten (i - writeidx)).
        assert (Hj : 0 <= i - writeidx < actual) by lia.
        specialize (Hnotwritten Hj).
        rewrite Z.mod_small in Hnotwritten by lia.
        lia.
      }
      rewrite app_Znth2 by (rewrite Zlength_sublist by lia; lia).
      rewrite Zlength_sublist by lia.
      rewrite app_Znth2.
      2: {
        rewrite circular_area_some_bytes_Zlength__write_returns.
        rewrite Zlength_sublist by lia.
        lia.
      }
      rewrite circular_area_some_bytes_Zlength__write_returns.
      rewrite Zlength_sublist by lia.
      rewrite Znth_sublist by lia.
      replace (i - (writeidx - 0) - (actual - 0) +
               (writeidx + actual)) with i by lia.
      reflexivity.
Qed.

Lemma circular_area_query_length__state_queries :
  forall readidx writeidx area_length logical_length,
    0 < area_length <= 256 ->
    0 <= readidx < area_length ->
    0 <= writeidx < area_length ->
    0 <= logical_length < area_length ->
    writeidx = (readidx + logical_length) mod area_length ->
    Z.rem
      (unsigned_last_nbits
        (unsigned_last_nbits (writeidx - readidx) 32 + area_length) 32)
      area_length = logical_length.
Proof.
  intros readidx writeidx area_length logical_length
    Hcap Hread Hwrite Hlen Hindex.
  rewrite unsigned_unsigned_add_l by lia.
  assert (Hcast :
    unsigned_last_nbits (writeidx - readidx + area_length) 32 =
    writeidx - readidx + area_length).
  {
    apply unsigned_last_nbits_eq.
    change (0 <= writeidx - readidx + area_length < 4294967296).
    lia.
  }
  rewrite Hcast.
  destruct (Z_lt_ge_dec (readidx + logical_length) area_length)
    as [Hnowrap | Hwrap].
  - assert (Hmod : (readidx + logical_length) mod area_length =
                   readidx + logical_length).
    { apply Z.mod_small. lia. }
    rewrite Hmod in Hindex.
    subst writeidx.
    symmetry.
    apply Z.rem_unique with (q := 1); lia.
  - assert (Hmod : (readidx + logical_length) mod area_length =
                   readidx + logical_length - area_length).
    { symmetry. apply Z.mod_unique with (q := 1); [left; lia | lia]. }
    rewrite Hmod in Hindex.
    subst writeidx.
    replace (readidx + logical_length - area_length - readidx + area_length)
      with logical_length by lia.
    apply Z.rem_small. lia.
Qed.

Lemma circular_area_zero_or_one_nonzero__write_branch_preparation :
  forall r : Z, (r = 0 \/ r = 1) -> r <> 0 -> r = 1.
Proof.
  intros r [Hr | Hr] Hnonzero; congruence.
Qed.
Lemma circular_area_not_full_result_zero__write_branch_preparation :
  forall state,
    CircularAreaStateFullResult state 0 ->
    Zlength (ca_contents state) <> ca_capacity state.
Proof.
  intros state Hresult Heq.
  unfold CircularAreaStateFullResult in Hresult.
  destruct (Z.eq_dec (Zlength (ca_contents state)) (ca_capacity state));
    congruence.
Qed.
Lemma circular_area_free_unsigned_positive__write_branch_preparation :
  forall area_length logical_length,
    0 < area_length <= 256 ->
    0 <= logical_length <= area_length ->
    logical_length <> area_length ->
    unsigned_last_nbits (area_length - logical_length) 32 =
      area_length - logical_length /\
    0 < area_length - logical_length.
Proof.
  intros area_length logical_length Harea Hlogical Hneq.
  split.
  - apply unsigned_last_nbits_eq.
    change (0 <= area_length - logical_length < 4294967296).
    lia.
  - lia.
Qed.
Lemma circular_area_actual_write_free__write_branch_preparation :
  forall area_length requested logical,
    0 <= Zlength logical <= area_length ->
    requested > area_length - Zlength logical ->
    CircularAreaActualWriteLength area_length requested logical
      (area_length - Zlength logical).
Proof.
  intros area_length requested logical Hlength Hrequested.
  unfold CircularAreaActualWriteLength.
  rewrite Z.min_r by lia.
  reflexivity.
Qed.
Lemma circular_area_actual_write_requested__write_branch_preparation :
  forall area_length requested logical,
    requested <= area_length - Zlength logical ->
    CircularAreaActualWriteLength area_length requested logical requested.
Proof.
  intros area_length requested logical Hrequested.
  unfold CircularAreaActualWriteLength.
  rewrite Z.min_l by exact Hrequested.
  reflexivity.
Qed.
Lemma circular_area_wrap_prepare__write_branch_preparation :
  forall state readidx writeidx b_status physical data_length,
    CircularAreaLogicalState readidx writeidx (ca_capacity state) b_status
      (ca_contents state) physical ->
    CircularAreaStateDivideWrDataResult state data_length 1 ->
    CircularAreaDivideWrDataResult writeidx data_length
      (ca_capacity state) 1 ->
    0 <= writeidx < ca_capacity state /\
    unsigned_last_nbits writeidx 32 = writeidx /\
    unsigned_last_nbits
      (ca_capacity state - unsigned_last_nbits writeidx 32) 32 =
      ca_capacity state - writeidx /\
    unsigned_last_nbits
      (data_length -
       unsigned_last_nbits
         (ca_capacity state - unsigned_last_nbits writeidx 32) 32) 32 =
      data_length - (ca_capacity state - writeidx) /\
    0 <= unsigned_last_nbits
      (ca_capacity state - unsigned_last_nbits writeidx 32) 32 <= data_length.
Proof.
  intros state readidx writeidx b_status physical data_length
    Hlogical Hstate Hdivide.
  unfold CircularAreaLogicalState in Hlogical.
  destruct Hlogical as [Hcap [_ [Hwrite [Hlen _]]]].
  unfold CircularAreaStateDivideWrDataResult in Hstate.
  destruct Hstate as [_ [Hdata _]].
  unfold CircularAreaDivideWrDataResult in Hdivide.
  destruct Hdivide as [[_ Hbad] | [Hwrap _]]; [discriminate|].
  assert (Hwritecast : unsigned_last_nbits writeidx 32 = writeidx).
  { apply unsigned_last_nbits_eq.
    change (0 <= writeidx < 4294967296).
    lia. }
  assert (Hfreecast :
    unsigned_last_nbits (ca_capacity state - writeidx) 32 =
      ca_capacity state - writeidx).
  { apply unsigned_last_nbits_eq.
    change (0 <= ca_capacity state - writeidx < 4294967296).
    lia. }
  assert (Hdowncast :
    unsigned_last_nbits
      (data_length - (ca_capacity state - writeidx)) 32 =
      data_length - (ca_capacity state - writeidx)).
  { apply unsigned_last_nbits_eq.
    change
      (0 <= data_length - (ca_capacity state - writeidx) < 4294967296).
    lia. }
  rewrite Hwritecast, Hfreecast, Hdowncast.
  repeat split; lia.
Qed.
Lemma circular_area_wrap_segment_bounds__write_branch_preparation :
  forall state readidx writeidx b_status physical data_length,
    CircularAreaLogicalState readidx writeidx (ca_capacity state) b_status
      (ca_contents state) physical ->
    CircularAreaStateDivideWrDataResult state data_length 1 ->
    CircularAreaDivideWrDataResult writeidx data_length
      (ca_capacity state) 1 ->
    0 <= ca_capacity state - writeidx <= data_length /\
    0 <= data_length - (ca_capacity state - writeidx) <= writeidx.
Proof.
  intros state readidx writeidx b_status physical data_length
    Hlogical Hstate Hdivide.
  unfold CircularAreaLogicalState in Hlogical.
  destruct Hlogical as [Hcap [_ [Hwrite [Hlen _]]]].
  unfold CircularAreaStateDivideWrDataResult in Hstate.
  destruct Hstate as [_ [Hdata _]].
  unfold CircularAreaDivideWrDataResult in Hdivide.
  destruct Hdivide as [[_ Hbad] | [Hwrap _]]; [discriminate|].
  split; lia.
Qed.
Lemma circular_area_sublist_split_facts__write_branch_preparation :
  forall (input : list Z) write_len_up data_length,
    0 <= write_len_up <= data_length ->
    data_length <= Zlength input ->
    Zlength (sublist write_len_up data_length input) =
      data_length - write_len_up /\
    sublist write_len_up (Zlength input) input =
      List.app (sublist write_len_up data_length input)
        (sublist data_length (Zlength input) input).
Proof.
  intros input write_len_up data_length Hup Hdata.
  split.
  - rewrite Zlength_sublist by lia. lia.
  - rewrite
      (sublist_split write_len_up (Zlength input) data_length input)
      by lia.
    reflexivity.
Qed.
Lemma circular_area_nonwrap_segment_bounds__write_branch_preparation :
  forall writeidx data_length area_length,
    CircularAreaDivideWrDataResult writeidx data_length area_length 0 ->
    0 <= writeidx ->
    0 <= data_length ->
    0 <= writeidx /\
    writeidx <= writeidx + data_length /\
    writeidx + data_length <= area_length.
Proof.
  intros writeidx data_length area_length Hdivide Hwrite Hdata.
  unfold CircularAreaDivideWrDataResult in Hdivide.
  destruct Hdivide as [[Hwithin _] | [_ Hbad]]; [lia|discriminate].
Qed.

(** Byte destination address retained across annotation cutpoints. *)
Definition CircularAreaWriteDestination (base offset destination : Z) : Prop :=
  destination = base + offset.

Lemma circular_area_query_expr__state_queries_errors :
  forall readidx writeidx area_length logical_length,
    0 < area_length <= 256 ->
    0 <= readidx < area_length ->
    0 <= writeidx < area_length ->
    0 <= logical_length < area_length ->
    writeidx = (readidx + logical_length) mod area_length ->
    Z.rem
      (unsigned_last_nbits
        (unsigned_last_nbits
          (unsigned_last_nbits writeidx 32 + area_length) 32 -
         unsigned_last_nbits readidx 32) 32)
      area_length = logical_length.
Proof.
  intros readidx writeidx area_length logical_length Harea Hread Hwrite
    Hlength Hindex.
  rewrite unsigned_unsigned_add_l by lia.
  assert (Hwrite_cast : unsigned_last_nbits writeidx 32 = writeidx).
  { apply unsigned_last_nbits_eq. change (0 <= writeidx < 2 ^ 32). lia. }
  assert (Hread_cast : unsigned_last_nbits readidx 32 = readidx).
  { apply unsigned_last_nbits_eq. change (0 <= readidx < 2 ^ 32). lia. }
  assert (Hsum_cast : unsigned_last_nbits (writeidx + area_length) 32 =
      writeidx + area_length).
  { apply unsigned_last_nbits_eq. change (0 <= writeidx + area_length < 2 ^ 32). lia. }
  rewrite Hsum_cast, Hread_cast.
  assert (Hsub_cast : unsigned_last_nbits (writeidx + area_length - readidx) 32 =
      writeidx + area_length - readidx).
  { apply unsigned_last_nbits_eq. change (0 <= writeidx + area_length - readidx < 2 ^ 32). lia. }
  rewrite Hsub_cast.
  destruct (Z_lt_ge_dec (readidx + logical_length) area_length)
    as [Hnowrap|Hwrap].
  - assert (Hmod : (readidx + logical_length) mod area_length =
                   readidx + logical_length).
    { apply Z.mod_small. lia. }
    rewrite Hmod in Hindex. subst writeidx.
    symmetry. apply Z.rem_unique with (q := 1); lia.
  - assert (Hmod : (readidx + logical_length) mod area_length =
                   readidx + logical_length - area_length).
    { symmetry. apply Z.mod_unique with (q := 1); [left; lia|lia]. }
    rewrite Hmod in Hindex. subst writeidx.
    replace (readidx + logical_length - area_length + area_length - readidx)
      with logical_length by lia.
    apply Z.rem_small. lia.
Qed.
Lemma circular_area_data_length_fields__state_queries_errors :
  forall readidx writeidx area_length b_status logical physical,
    CircularAreaLogicalState readidx writeidx area_length b_status logical physical ->
    Zlength logical < area_length ->
    CircularAreaDataLengthByFieldsResult readidx writeidx b_status area_length
      (Zlength logical).
Proof.
  intros readidx writeidx area_length b_status logical physical Hstate Hshort.
  unfold CircularAreaLogicalState in Hstate.
  destruct Hstate as [Harea [Hread [Hwrite [Hlen [_ [_ [Hindex [Hstatus
    [Hfull [Hempty _]]]]]]]]]].
  unfold CircularAreaDataLengthByFieldsResult.
  split; [lia|].
  destruct (Z.eq_dec readidx writeidx) as [Heq|Hneq].
  - assert (Hbzero : b_status = 0).
    {
      destruct Hstatus as [Hzero|Hone]; [exact Hzero|].
      exfalso. pose proof (proj1 Hfull (conj Heq Hone)). lia.
    }
    assert (Hlenzero : Zlength logical = 0).
    { apply (proj1 Hempty). split; assumption. }
    rewrite Hbzero, Hlenzero.
    destruct (Z.eq_dec readidx readidx); [reflexivity|congruence].
  - destruct (Z_lt_ge_dec (readidx + Zlength logical) area_length)
      as [Hnowrap|Hwrap].
    + assert (Hmod : (readidx + Zlength logical) mod area_length =
                     readidx + Zlength logical).
      { apply Z.mod_small. lia. }
      rewrite Hmod in Hindex. subst writeidx.
      replace (readidx + Zlength logical - readidx + area_length)
        with (Zlength logical + area_length) by lia.
      rewrite Z.add_mod by lia.
      assert (Hlenmod : Zlength logical mod area_length = Zlength logical)
        by (apply Z.mod_small; lia).
      assert (Hcapmod : area_length mod area_length = 0)
        by (apply Z.mod_same; lia).
      rewrite Hlenmod, Hcapmod, Z.add_0_r.
      symmetry. apply Z.mod_small. lia.
    + assert (Hmod : (readidx + Zlength logical) mod area_length =
                     readidx + Zlength logical - area_length).
      { symmetry. apply Z.mod_unique with (q := 1); [left; lia|lia]. }
      rewrite Hmod in Hindex. subst writeidx.
      replace (readidx + Zlength logical - area_length - readidx + area_length)
        with (Zlength logical) by lia.
      symmetry. apply Z.mod_small. lia.
Qed.
Lemma circular_area_descriptor_owned__state_queries_errors :
  forall state area, area <> 0 ->
  store_circular_area state area |-- CircularAreaDescriptorOwnership state area.
Proof.
  intros state area Harea. unfold CircularAreaDescriptorOwnership.
  Right. entailer!.
Qed.
Lemma circular_area_input_owned__state_queries_errors :
  forall input n contents, input <> 0 -> Zlength contents = n ->
  UCharArray.full input n contents |-- CircularAreaInputOwnership input n contents.
Proof.
  intros input n contents Hinput Hlen. unfold CircularAreaInputOwnership.
  Right. entailer!.
Qed.
Lemma circular_short_equal__wrap_returns : forall r n c,
  0 < c -> 0 <= r < c -> 0 <= n < c ->
  (r = (r+n) mod c <-> n = 0).
Proof.
  intros r n c Hc Hr Hn. split.
  - intro Heq. destruct (Z_lt_ge_dec (r+n) c).
    + rewrite Z.mod_small in Heq by lia. lia.
    + assert (Hm : (r+n) mod c = r+n-c).
      { symmetry. apply Z.mod_unique with (q:=1); lia. }
      rewrite Hm in Heq. lia.
  - intro H; subst n. rewrite Z.add_0_r, Z.mod_small by lia. reflexivity.
Qed.
Lemma circular_drop_state__wrap_returns : forall r w c b old phys d,
  CircularAreaLogicalState r w c b old phys ->
  0 < d <= Zlength old ->
  CircularAreaLogicalState ((r+d) mod c) w c 0
    (sublist d (Zlength old) old) phys.
Proof.
  intros r w c b old phys d Hs Hd.
  unfold CircularAreaLogicalState in Hs |- *.
  destruct Hs as [Hc [Hr [Hw [Hl [Hp [Hb [Hi [Hs [Hf [He Hlive]]]]]]]]]].
  assert (Hlen : Zlength (sublist d (Zlength old) old) = Zlength old-d).
  { rewrite Zlength_sublist by lia. lia. }
  assert (Hrm : 0 <= (r+d) mod c < c) by (apply Z.mod_pos_bound; lia).
  assert (Hindex : w = (((r+d) mod c) + Zlength (sublist d (Zlength old) old)) mod c).
  { rewrite Hlen, circular_area_mod_add_mod_left__write_returns by lia.
    replace (r+d+(Zlength old-d)) with (r+Zlength old) by lia. exact Hi. }
  assert (Hempty : ((r+d) mod c = w <-> Zlength (sublist d (Zlength old) old) = 0)).
  { rewrite Hindex. apply circular_short_equal__wrap_returns; try lia. }
  assert (Hbytes : Forall (fun byte : Z => 0 <= byte <= 255) (sublist d (Zlength old) old)).
  { eapply (circular_area_forall_sublist__write_returns _ 0); eauto; lia. }
  assert (Hlive' : CircularAreaLiveBytes ((r+d) mod c) c (sublist d (Zlength old) old) phys).
  { unfold CircularAreaLiveBytes in *. intros k Hk.
    rewrite circular_area_mod_add_mod_left__write_returns by lia.
    rewrite Znth_sublist by (rewrite Hlen in Hk; lia).
    replace (r+d+k) with (r+(k+d)) by lia.
    apply Hlive. rewrite Hlen in Hk. lia. }
  repeat split; try tauto; try lia.
Qed.
Lemma uchar_rebase__wrap_returns : forall x lo n xs,
  UCharArray.seg (x+lo) 0 n xs --||-- UCharArray.seg x lo (lo+n) xs.
Proof.
  intros. rewrite (UCharArray.seg_0_shift x lo (lo+n) xs).
  simpl. replace (lo+n-lo) with n by lia.
  replace (x+lo*1) with (x+lo) by lia.
  split; cancel (UCharArray.seg (x+lo) 0 n xs).
Qed.
Lemma source_join__wrap_returns : forall src off a n xs,
  0 <= off -> 0 <= a -> off+a <= n -> n = Zlength xs ->
  UCharArray.seg src 0 off (sublist 0 off xs) **
  UCharArray.seg (src+off) 0 a (sublist off (off+a) xs) **
  UCharArray.seg src (off+a) n (sublist (off+a) n xs) |--
  UCharArray.full src n xs.
Proof.
  intros src off a n xs Hoff Ha Hn Hlen.
  rewrite uchar_rebase__wrap_returns.
  sep_apply (UCharArray.seg_merge_to_seg src 0 off (off+a)
    (sublist 0 off xs) (sublist off (off+a) xs) ltac:(lia)).
  rewrite <- sublist_split by lia.
  sep_apply (UCharArray.seg_merge_to_seg src 0 (off+a) n
    (sublist 0 (off+a) xs) (sublist (off+a) n xs) ltac:(lia)).
  rewrite <- sublist_split by lia.
  rewrite sublist_self by lia.
  change (UCharArray.seg src 0 n xs |-- UCharArray.seg src 0 n xs).
  cancel (UCharArray.seg src 0 n xs).
Qed.
Lemma destination_join__wrap_returns : forall base w a c phys copied,
  0 <= w -> 0 <= a -> w+a <= c ->
  UCharArray.seg (base+w) 0 a copied **
  UCharArray.mixed_seg base 0 w (sublist 0 w phys) **
  UCharArray.mixed_seg base (w+a) c (sublist (w+a) c phys) |--
  UCharArray.mixed_full base c
    (sublist 0 w phys ++ CircularAreaSomeBytes copied ++ sublist (w+a) c phys).
Proof.
  intros base w a c phys copied Hw Ha Hc.
  rewrite uchar_rebase__wrap_returns.
  sep_apply (UCharArray.seg_to_mixed_seg base w (w+a) copied).
  sep_apply (UCharArray.mixed_seg_merge_to_mixed_seg base w (w+a) c
    (map (@Some Z) copied) (sublist (w+a) c phys) ltac:(lia)).
  sep_apply (UCharArray.mixed_seg_merge_to_mixed_seg base 0 w c
    (sublist 0 w phys) (map (@Some Z) copied ++ sublist (w+a) c phys) ltac:(lia)).
  change (UCharArray.mixed_seg base 0 c (sublist 0 w phys ++ map (@Some Z) copied ++ sublist (w+a) c phys) |-- UCharArray.mixed_seg base 0 c (sublist 0 w phys ++ map (@Some Z) copied ++ sublist (w+a) c phys)).
  cancel (UCharArray.mixed_seg base 0 c
    (sublist 0 w phys ++ map (@Some Z) copied ++ sublist (w+a) c phys)).
Qed.
Lemma last_capacity_fit__wrap_returns : forall c xs,
  Zlength xs <= c -> CircularAreaLastCapacity c xs = xs.
Proof.
  intros c xs Hlen. unfold CircularAreaLastCapacity, sublist.
  assert (Hz : Z.to_nat (Zlength xs-c) = O) by lia.
  rewrite Hz. simpl. rewrite Zlength_correct, Nat2Z.id, firstn_all. reflexivity.
Qed.
Lemma last_capacity_split__wrap_returns : forall c old xs,
  0 <= Zlength old+Zlength xs-c <= Zlength old ->
  CircularAreaLastCapacity c (old++xs) =
    List.app (sublist (Zlength old+Zlength xs-c) (Zlength old) old) xs.
Proof.
  intros c old xs Hrange. unfold CircularAreaLastCapacity.
  rewrite Zlength_app.
  rewrite (sublist_split (Zlength old+Zlength xs-c)
    (Zlength old+Zlength xs) (Zlength old) (old++xs)) by (rewrite ?Zlength_app; pose proof (Zlength_nonneg xs); lia).
  rewrite sublist_split_app_l by lia.
  rewrite (sublist_split_app_r _ _ (Zlength old)) by (pose proof (Zlength_nonneg xs); lia).
  replace (Zlength old-Zlength old) with 0 by lia.
  replace (Zlength old+Zlength xs-Zlength old) with (Zlength xs) by lia.
  rewrite sublist_self by reflexivity. reflexivity.
Qed.
Lemma last_capacity_full_input__wrap_returns : forall c old xs off,
  0 <= c -> 0 <= off -> off+c = Zlength xs ->
  CircularAreaLastCapacity c (old++xs) = sublist off (Zlength xs) xs.
Proof.
  intros c old xs off Hc Hoff Hlen.
  unfold CircularAreaLastCapacity. rewrite Zlength_app.
  rewrite (sublist_split_app_r _ _ (Zlength old)) by (pose proof (Zlength_nonneg old); lia).
  replace (Zlength old+Zlength xs-c-Zlength old) with off by lia.
  replace (Zlength old+Zlength xs-Zlength old) with (Zlength xs) by lia. reflexivity.
Qed.
Lemma empty_at_write__wrap_returns : forall w c phys,
  0 < c <= 256 -> 0 <= w < c -> Zlength phys = c ->
  CircularAreaLogicalState w w c 0 nil phys.
Proof.
  intros w c phys Hc Hw Hp. unfold CircularAreaLogicalState, CircularAreaLiveBytes.
  rewrite Zlength_nil. replace (w+0) with w by lia.
  rewrite Z.mod_small by lia. repeat split; try lia; try constructor; intros; lia.
Qed.
Lemma force_after__wrap_returns : forall r w c b old phys xs off a rm phys_after,
  CircularAreaLogicalState r w c b old phys ->
  Forall (fun byte : Z => 0 <= byte <= 255) xs ->
  0 < a <= c -> 0 <= off -> off+a = Zlength xs ->
  (off=0 \/ a=c) ->
  ((a <= c-Zlength old /\ rm=r) \/
   (a > c-Zlength old /\ rm=(r+a-(c-Zlength old)) mod c)) ->
  CircularAreaPhysicalWrite phys (sublist off (off+a) xs) phys_after c w a ->
  CircularAreaLogicalState rm ((w+a) mod c) c 1
    (CircularAreaLastCapacity c (old++xs)) phys_after.
Proof.
  intros r w c b old phys xs off a rm pa Hstate Hbytes Ha Hoff Hlen Hchoice Hr Hwrite.
  pose proof Hstate as Hparts. unfold CircularAreaLogicalState in Hparts.
  destruct Hparts as [Hc [Hread [Hw [Hl [Hp [Hb [Hi Hrest]]]]]]].
  destruct Hchoice as [Hz|Hfull].
  - subst off. replace (0+a) with a in * by lia.
    rewrite (sublist_self xs a Hlen) in Hwrite.
    destruct Hr as [[Hfit ->]|[Hover ->]].
    + rewrite last_capacity_fit__wrap_returns by (rewrite Zlength_app; lia).
      pose proof (circular_area_logical_state_after_write__write_returns r w c b old phys xs pa a Hstate Hwrite Hbytes ltac:(lia) Hfit) as Hout.
      rewrite sublist_self in Hout by lia. exact Hout.
    + rewrite last_capacity_split__wrap_returns by lia.
      assert (Hd : 0 < Zlength old+a-c <= Zlength old) by lia.
      pose proof (circular_drop_state__wrap_returns r w c b old phys
        (Zlength old+a-c) Hstate Hd) as Hdrop.
      replace (r+a-(c-Zlength old)) with (r+(Zlength old+a-c)) by lia.
      replace (Zlength old+Zlength xs-c) with (Zlength old+a-c) by lia.
      pose proof (circular_area_logical_state_after_write__write_returns ((r+(Zlength old+a-c)) mod c) w c 0 (sublist (Zlength old+a-c) (Zlength old) old) phys xs pa a Hdrop Hwrite Hbytes ltac:(lia) ltac:(rewrite Zlength_sublist by lia; lia)) as Hout.
      rewrite sublist_self in Hout by lia. exact Hout.
  - subst a.
    assert (Hrm : rm=w).
    { destruct Hr as [[Hfit Hrm]|[Hover Hrm]].
      - assert (Hz : Zlength old=0) by lia.
        rewrite Hz, Z.add_0_r, Z.mod_small in Hi by lia. lia.
      - rewrite Hrm. replace (r+c-(c-Zlength old)) with (r+Zlength old) by lia. symmetry; exact Hi. }
    subst rm.
    rewrite (last_capacity_full_input__wrap_returns c old xs off ltac:(lia) Hoff Hlen).
    assert (Hcopied : sublist off (off+c) xs = sublist off (Zlength xs) xs) by (rewrite Hlen; reflexivity).
    rewrite Hcopied in Hwrite.
    pose proof (empty_at_write__wrap_returns w c phys Hc Hw Hp) as Hemp.
    assert (Hcb : Forall (fun byte : Z => 0 <= byte <= 255) (sublist off (Zlength xs) xs)).
    { eapply (circular_area_forall_sublist__write_returns _ 0); eauto; lia. }
    pose proof (circular_area_logical_state_after_write__write_returns w w c 0 nil phys
      (sublist off (Zlength xs) xs) pa c Hemp Hwrite Hcb ltac:(lia) ltac:(rewrite Zlength_nil; lia)) as Hout.
    simpl List.app in Hout.
    rewrite sublist_self in Hout by (rewrite Zlength_sublist by lia; lia).
    exact Hout.
Qed.
Lemma nowrap_result_state__wrap_returns : forall state r w b phys xs off a rm force n ca src pa,
  CircularAreaLogicalState r w (ca_capacity state) b (ca_contents state) phys ->
  Forall (fun byte : Z => 0 <= byte <= 255) xs ->
  ca <> 0 -> src <> 0 -> n > 0 -> n=Zlength xs ->
  0 <= off ->
  ((force=0 /\ Zlength (ca_contents state)<ca_capacity state /\
    off=0 /\ rm=r /\ 0<a /\ a<=n /\
    a<=ca_capacity state-Zlength (ca_contents state) /\
    (a=n \/ a=ca_capacity state-Zlength (ca_contents state))) \/
   (force<>0 /\ off+a=n /\ 0<a /\ a<=ca_capacity state /\
    (off=0 \/ a=ca_capacity state) /\
    ((a<=ca_capacity state-Zlength (ca_contents state) /\ rm=r) \/
     (a>ca_capacity state-Zlength (ca_contents state) /\
      rm=(r+a-(ca_capacity state-Zlength (ca_contents state))) mod ca_capacity state)))) ->
  CircularAreaPhysicalWrite phys (sublist off (off+a) xs) pa (ca_capacity state) w a ->
  exists state_after,
    CircularAreaWriteResult state n xs force ca src 0 state_after /\
    CircularAreaLogicalState rm ((w+a) mod ca_capacity state)
      (ca_capacity state_after) 1 (ca_contents state_after) pa /\
    ca_capacity state_after=ca_capacity state.
Proof.
  intros state r w b phys xs off a rm force n ca src pa Hs Hb Hca Hsrc Hn Hlen Hoff Hbranches Hp.
  destruct Hbranches as [[Hf [Hnotfull [Hz [Hrm [Ha [Han [Hfree Hmin]]]]]]]|[Hf [Htotal [Ha [Hac [Hchoice Hr]]]]]].
  - subst off rm force.
    assert (Hactual : a=Z.min n (ca_capacity state-Zlength (ca_contents state))).
    { destruct Hmin as [-> | ->]; [rewrite Z.min_l|rewrite Z.min_r]; lia. }
    exists (Build_circular_area_state (ca_capacity state) (ca_contents state++sublist 0 a xs)).
    split.
    + unfold CircularAreaWriteResult. right; right; left.
      repeat split; try lia. simpl. rewrite <- Hactual. reflexivity.
    + split; [|reflexivity]. simpl.
      replace (0+a) with a in Hp by lia.
      assert (Hprefix : sublist 0 a (sublist 0 a xs)=sublist 0 a xs).
      { apply sublist_self. rewrite Zlength_sublist by lia. lia. }
      pose proof (circular_area_forall_sublist__write_returns
        (fun byte : Z => 0 <= byte <= 255) 0 xs 0 a Hb ltac:(lia) ltac:(lia)) as Hbc.
      pose proof (circular_area_logical_state_after_write__write_returns r w (ca_capacity state) b
        (ca_contents state) phys (sublist 0 a xs) pa a Hs Hp Hbc Ha Hfree) as Hout.
      rewrite Hprefix in Hout. exact Hout.
  - exists (Build_circular_area_state (ca_capacity state)
      (CircularAreaLastCapacity (ca_capacity state) (ca_contents state++xs))).
    split.
    + unfold CircularAreaWriteResult. right; right; right. repeat split; try lia; reflexivity.
    + split; [|reflexivity]. simpl.
      eapply force_after__wrap_returns; eauto; lia.
Qed.
Lemma pack_descriptor__wrap_returns : forall state ca base ops r w phys,
  ca<>0 -> base<>0 ->
  CircularAreaLogicalState r w (ca_capacity state) 1 (ca_contents state) phys ->
  (&(ca # "CircularArea" ->ₛ "data_buffer") # Ptr |-> base) **
  (&(ca # "CircularArea" ->ₛ "readidx") # UChar |-> r) **
  (&(ca # "CircularArea" ->ₛ "writeidx") # UChar |-> w) **
  (&(ca # "CircularArea" ->ₛ "p_head") # Ptr |-> base) **
  (&(ca # "CircularArea" ->ₛ "p_tail") # Ptr |-> (base+ca_capacity state)) **
  (&(ca # "CircularArea" ->ₛ "area_length") # UInt |-> ca_capacity state) **
  (&(ca # "CircularArea" ->ₛ "b_status") # Int |-> 1) **
  (&(ca # "CircularArea" ->ₛ "CircularAreaOperations") # Ptr |-> ops) **
  UCharArray.mixed_full base (ca_capacity state) phys |--
  CircularAreaDescriptorOwnership state ca.
Proof.
  intros state ca base ops r w phys Hca Hbase Hs.
  unfold CircularAreaDescriptorOwnership. Right. split_pure_spatial.
  - unfold store_circular_area. Exists base ops r w 1 phys.
    split_pure_spatial.
    + cancel (&(ca # "CircularArea" ->ₛ "data_buffer") # Ptr |-> base).
      cancel (&(ca # "CircularArea" ->ₛ "readidx") # UChar |-> r).
      cancel (&(ca # "CircularArea" ->ₛ "writeidx") # UChar |-> w).
      cancel (&(ca # "CircularArea" ->ₛ "p_head") # Ptr |-> base).
      cancel (&(ca # "CircularArea" ->ₛ "p_tail") # Ptr |-> (base+ca_capacity state)).
      cancel (&(ca # "CircularArea" ->ₛ "area_length") # UInt |-> ca_capacity state).
      cancel (&(ca # "CircularArea" ->ₛ "b_status") # Int |-> 1).
      cancel (&(ca # "CircularArea" ->ₛ "CircularAreaOperations") # Ptr |-> ops).
      cancel (UCharArray.mixed_full base (ca_capacity state) phys).
    + dump_pre_spatial. auto.
  - dump_pre_spatial. exact Hca.
Qed.
Lemma pack_input__wrap_returns : forall src n xs,
  src<>0 -> Zlength xs=n ->
  UCharArray.full src n xs |-- CircularAreaInputOwnership src n xs.
Proof.
  intros src n xs Hsrc Hlen. unfold CircularAreaInputOwnership.
  Right. split_pure_spatial.
  - cancel (UCharArray.full src n xs).
  - dump_pre_spatial. auto.
Qed.
Lemma index_cast__wrap_returns : forall w a c,
  0<c<=256 -> 0<=w<c -> 0<=a -> w+a<=c ->
  unsigned_last_nbits (Z.rem (unsigned_last_nbits (unsigned_last_nbits w 32+a) 32) c) 8 =
  (w+a) mod c.
Proof.
  intros w a c Hc Hw Ha Hend.
  assert (Huw : unsigned_last_nbits w 32=w).
  { apply unsigned_last_nbits_eq. change (0<=w<4294967296). lia. }
  rewrite Huw.
  assert (Hua : unsigned_last_nbits (w+a) 32=w+a).
  { apply unsigned_last_nbits_eq. change (0<=w+a<4294967296). lia. }
  rewrite Hua, Z.rem_mod_nonneg by lia.
  apply unsigned_last_nbits_eq. change (0<=(w+a) mod c<256).
  pose proof (Z.mod_pos_bound (w+a) c ltac:(lia)); lia.
Qed.
Lemma wrap_source_join__wrap_returns : forall src off up down n xs,
  0 <= off -> 0 <= up -> 0 <= down -> off+up+down <= n -> n=Zlength xs ->
  UCharArray.seg src 0 off (sublist 0 off xs) **
  UCharArray.seg (src+off) 0 up (sublist off (off+up) xs) **
  UCharArray.seg (src+off+up) 0 down (sublist (off+up) (off+up+down) xs) **
  UCharArray.seg src (off+up+down) n (sublist (off+up+down) n xs) |--
  UCharArray.full src n xs.
Proof.
  intros src off up down n xs Hoff Hup Hdown Hrange Hlen.
  rewrite (uchar_rebase__wrap_returns src off up (sublist off (off+up) xs)).
  replace (src+off+up) with (src+(off+up)) by lia.
  rewrite (uchar_rebase__wrap_returns src (off+up) down
    (sublist (off+up) (off+up+down) xs)).
  sep_apply (UCharArray.seg_merge_to_seg src 0 off (off+up)
    (sublist 0 off xs) (sublist off (off+up) xs) ltac:(lia)).
  rewrite <- (sublist_split 0 (off+up) off xs) by lia.
  sep_apply (UCharArray.seg_merge_to_seg src 0 (off+up) (off+up+down)
    (sublist 0 (off+up) xs) (sublist (off+up) (off+up+down) xs) ltac:(lia)).
  rewrite <- (sublist_split 0 (off+up+down) (off+up) xs) by lia.
  sep_apply (UCharArray.seg_merge_to_seg src 0 (off+up+down) n
    (sublist 0 (off+up+down) xs) (sublist (off+up+down) n xs) ltac:(lia)).
  rewrite <- (sublist_split 0 n (off+up+down) xs) by lia.
  rewrite sublist_self by lia.
  change (UCharArray.seg src 0 n xs |-- UCharArray.seg src 0 n xs).
  cancel (UCharArray.seg src 0 n xs).
Qed.
Lemma wrap_source_join_prefix__wrap_returns : forall src off up down xs,
  0 <= off -> 0 <= up -> 0 <= down -> off+up+down=Zlength xs ->
  UCharArray.seg src 0 off (sublist 0 off xs) **
  UCharArray.seg (src+off) 0 up (sublist off (off+up) xs) **
  UCharArray.seg (src+off+up) 0 down (sublist (off+up) (off+up+down) xs) |--
  UCharArray.full src (Zlength xs) xs.
Proof.
  intros src off up down xs Hoff Hup Hdown Hlen.
  rewrite (uchar_rebase__wrap_returns src off up (sublist off (off+up) xs)).
  replace (src+off+up) with (src+(off+up)) by lia.
  rewrite (uchar_rebase__wrap_returns src (off+up) down
    (sublist (off+up) (off+up+down) xs)).
  sep_apply (UCharArray.seg_merge_to_seg src 0 off (off+up)
    (sublist 0 off xs) (sublist off (off+up) xs) ltac:(lia)).
  rewrite <- (sublist_split 0 (off+up) off xs) by lia.
  sep_apply (UCharArray.seg_merge_to_seg src 0 (off+up) (off+up+down)
    (sublist 0 (off+up) xs) (sublist (off+up) (off+up+down) xs) ltac:(lia)).
  rewrite <- (sublist_split 0 (off+up+down) (off+up) xs) by lia.
  rewrite Hlen, sublist_self by lia.
  sep_apply (UCharArray.seg_to_full src 0 (Zlength xs) xs).
  replace (src+0*sizeof(UCHAR)) with src by (f_equal; lia).
  replace (Zlength xs-0) with (Zlength xs) by lia.
  cancel (UCharArray.full src (Zlength xs) xs).
Qed.
Lemma wrap_destination_join__wrap_returns : forall base down w up tail mid head,
  0 <= down <= w -> 0 <= up -> w+up <= 256 ->
  UCharArray.seg base 0 down tail **
  UCharArray.mixed_seg base down w mid **
  UCharArray.seg (base+w) 0 up head |--
  UCharArray.mixed_full base (w+up)
    (CircularAreaSomeBytes tail ++ mid ++ CircularAreaSomeBytes head).
Proof.
  intros base down w up tail mid head Hdown Hup Hend.
  rewrite (uchar_rebase__wrap_returns base w up head).
  sep_apply (UCharArray.seg_to_mixed_seg base 0 down tail).
  sep_apply (UCharArray.seg_to_mixed_seg base w (w+up) head).
  sep_apply (UCharArray.mixed_seg_merge_to_mixed_seg base down w (w+up)
    mid (map (@Some Z) head) ltac:(lia)).
  sep_apply (UCharArray.mixed_seg_merge_to_mixed_full base 0 down (w+up)
    (map (@Some Z) tail) (mid ++ map (@Some Z) head) ltac:(lia)).
  unfold CircularAreaSomeBytes.
  replace (base+0*sizeof(UCHAR)) with base by (f_equal; lia).
  replace (w+up-0) with (w+up) by lia.
  cancel (UCharArray.mixed_full base (w+up)
    (map (@Some Z) tail ++ mid ++ map (@Some Z) head)).
Qed.
Lemma circular_short_equal__nowrap_returns : forall r n c,
  0 < c -> 0 <= r < c -> 0 <= n < c ->
  (r = (r+n) mod c <-> n = 0).
Proof.
  intros r n c Hc Hr Hn. split.
  - intro Heq. destruct (Z_lt_ge_dec (r+n) c).
    + rewrite Z.mod_small in Heq by lia. lia.
    + assert (Hm : (r+n) mod c = r+n-c).
      { symmetry. apply Z.mod_unique with (q:=1); lia. }
      rewrite Hm in Heq. lia.
  - intro H; subst n. rewrite Z.add_0_r, Z.mod_small by lia. reflexivity.
Qed.
Lemma circular_drop_state__nowrap_returns : forall r w c b old phys d,
  CircularAreaLogicalState r w c b old phys ->
  0 < d <= Zlength old ->
  CircularAreaLogicalState ((r+d) mod c) w c 0
    (sublist d (Zlength old) old) phys.
Proof.
  intros r w c b old phys d Hs Hd.
  unfold CircularAreaLogicalState in Hs |- *.
  destruct Hs as [Hc [Hr [Hw [Hl [Hp [Hb [Hi [Hs [Hf [He Hlive]]]]]]]]]].
  assert (Hlen : Zlength (sublist d (Zlength old) old) = Zlength old-d).
  { rewrite Zlength_sublist by lia. lia. }
  assert (Hrm : 0 <= (r+d) mod c < c) by (apply Z.mod_pos_bound; lia).
  assert (Hindex : w = (((r+d) mod c) + Zlength (sublist d (Zlength old) old)) mod c).
  { rewrite Hlen, circular_area_mod_add_mod_left__write_returns by lia.
    replace (r+d+(Zlength old-d)) with (r+Zlength old) by lia. exact Hi. }
  assert (Hempty : ((r+d) mod c = w <-> Zlength (sublist d (Zlength old) old) = 0)).
  { rewrite Hindex. apply circular_short_equal__nowrap_returns; try lia. }
  assert (Hbytes : Forall (fun byte : Z => 0 <= byte <= 255) (sublist d (Zlength old) old)).
  { eapply (circular_area_forall_sublist__write_returns _ 0); eauto; lia. }
  assert (Hlive' : CircularAreaLiveBytes ((r+d) mod c) c (sublist d (Zlength old) old) phys).
  { unfold CircularAreaLiveBytes in *. intros k Hk.
    rewrite circular_area_mod_add_mod_left__write_returns by lia.
    rewrite Znth_sublist by (rewrite Hlen in Hk; lia).
    replace (r+d+k) with (r+(k+d)) by lia.
    apply Hlive. rewrite Hlen in Hk. lia. }
  repeat split; try tauto; try lia.
Qed.
Lemma uchar_rebase__nowrap_returns : forall x lo n xs,
  UCharArray.seg (x+lo) 0 n xs --||-- UCharArray.seg x lo (lo+n) xs.
Proof.
  intros. rewrite (UCharArray.seg_0_shift x lo (lo+n) xs).
  simpl. replace (lo+n-lo) with n by lia.
  replace (x+lo*1) with (x+lo) by lia.
  split; cancel (UCharArray.seg (x+lo) 0 n xs).
Qed.
Lemma source_join__nowrap_returns : forall src off a n xs,
  0 <= off -> 0 <= a -> off+a <= n -> n = Zlength xs ->
  UCharArray.seg src 0 off (sublist 0 off xs) **
  UCharArray.seg (src+off) 0 a (sublist off (off+a) xs) **
  UCharArray.seg src (off+a) n (sublist (off+a) n xs) |--
  UCharArray.full src n xs.
Proof.
  intros src off a n xs Hoff Ha Hn Hlen.
  rewrite uchar_rebase__nowrap_returns.
  sep_apply (UCharArray.seg_merge_to_seg src 0 off (off+a)
    (sublist 0 off xs) (sublist off (off+a) xs) ltac:(lia)).
  rewrite <- sublist_split by lia.
  sep_apply (UCharArray.seg_merge_to_seg src 0 (off+a) n
    (sublist 0 (off+a) xs) (sublist (off+a) n xs) ltac:(lia)).
  rewrite <- sublist_split by lia.
  rewrite sublist_self by lia.
  change (UCharArray.seg src 0 n xs |-- UCharArray.seg src 0 n xs).
  cancel (UCharArray.seg src 0 n xs).
Qed.
Lemma destination_join__nowrap_returns : forall base w a c phys copied,
  0 <= w -> 0 <= a -> w+a <= c ->
  UCharArray.seg (base+w) 0 a copied **
  UCharArray.mixed_seg base 0 w (sublist 0 w phys) **
  UCharArray.mixed_seg base (w+a) c (sublist (w+a) c phys) |--
  UCharArray.mixed_full base c
    (sublist 0 w phys ++ CircularAreaSomeBytes copied ++ sublist (w+a) c phys).
Proof.
  intros base w a c phys copied Hw Ha Hc.
  rewrite uchar_rebase__nowrap_returns.
  sep_apply (UCharArray.seg_to_mixed_seg base w (w+a) copied).
  sep_apply (UCharArray.mixed_seg_merge_to_mixed_seg base w (w+a) c
    (map (@Some Z) copied) (sublist (w+a) c phys) ltac:(lia)).
  sep_apply (UCharArray.mixed_seg_merge_to_mixed_seg base 0 w c
    (sublist 0 w phys) (map (@Some Z) copied ++ sublist (w+a) c phys) ltac:(lia)).
  change (UCharArray.mixed_seg base 0 c (sublist 0 w phys ++ map (@Some Z) copied ++ sublist (w+a) c phys) |-- UCharArray.mixed_seg base 0 c (sublist 0 w phys ++ map (@Some Z) copied ++ sublist (w+a) c phys)).
  cancel (UCharArray.mixed_seg base 0 c
    (sublist 0 w phys ++ map (@Some Z) copied ++ sublist (w+a) c phys)).
Qed.
Lemma last_capacity_fit__nowrap_returns : forall c xs,
  Zlength xs <= c -> CircularAreaLastCapacity c xs = xs.
Proof.
  intros c xs Hlen. unfold CircularAreaLastCapacity, sublist.
  assert (Hz : Z.to_nat (Zlength xs-c) = O) by lia.
  rewrite Hz. simpl. rewrite Zlength_correct, Nat2Z.id, firstn_all. reflexivity.
Qed.
Lemma last_capacity_split__nowrap_returns : forall c old xs,
  0 <= Zlength old+Zlength xs-c <= Zlength old ->
  CircularAreaLastCapacity c (old++xs) =
    List.app (sublist (Zlength old+Zlength xs-c) (Zlength old) old) xs.
Proof.
  intros c old xs Hrange. unfold CircularAreaLastCapacity.
  rewrite Zlength_app.
  rewrite (sublist_split (Zlength old+Zlength xs-c)
    (Zlength old+Zlength xs) (Zlength old) (old++xs)) by (rewrite ?Zlength_app; pose proof (Zlength_nonneg xs); lia).
  rewrite sublist_split_app_l by lia.
  rewrite (sublist_split_app_r _ _ (Zlength old)) by (pose proof (Zlength_nonneg xs); lia).
  replace (Zlength old-Zlength old) with 0 by lia.
  replace (Zlength old+Zlength xs-Zlength old) with (Zlength xs) by lia.
  rewrite sublist_self by reflexivity. reflexivity.
Qed.
Lemma last_capacity_full_input__nowrap_returns : forall c old xs off,
  0 <= c -> 0 <= off -> off+c = Zlength xs ->
  CircularAreaLastCapacity c (old++xs) = sublist off (Zlength xs) xs.
Proof.
  intros c old xs off Hc Hoff Hlen.
  unfold CircularAreaLastCapacity. rewrite Zlength_app.
  rewrite (sublist_split_app_r _ _ (Zlength old)) by (pose proof (Zlength_nonneg old); lia).
  replace (Zlength old+Zlength xs-c-Zlength old) with off by lia.
  replace (Zlength old+Zlength xs-Zlength old) with (Zlength xs) by lia. reflexivity.
Qed.
Lemma empty_at_write__nowrap_returns : forall w c phys,
  0 < c <= 256 -> 0 <= w < c -> Zlength phys = c ->
  CircularAreaLogicalState w w c 0 nil phys.
Proof.
  intros w c phys Hc Hw Hp. unfold CircularAreaLogicalState, CircularAreaLiveBytes.
  rewrite Zlength_nil. replace (w+0) with w by lia.
  rewrite Z.mod_small by lia. repeat split; try lia; try constructor; intros; lia.
Qed.
Lemma force_after__nowrap_returns : forall r w c b old phys xs off a rm phys_after,
  CircularAreaLogicalState r w c b old phys ->
  Forall (fun byte : Z => 0 <= byte <= 255) xs ->
  0 < a <= c -> 0 <= off -> off+a = Zlength xs ->
  (off=0 \/ a=c) ->
  ((a <= c-Zlength old /\ rm=r) \/
   (a > c-Zlength old /\ rm=(r+a-(c-Zlength old)) mod c)) ->
  CircularAreaPhysicalWrite phys (sublist off (off+a) xs) phys_after c w a ->
  CircularAreaLogicalState rm ((w+a) mod c) c 1
    (CircularAreaLastCapacity c (old++xs)) phys_after.
Proof.
  intros r w c b old phys xs off a rm pa Hstate Hbytes Ha Hoff Hlen Hchoice Hr Hwrite.
  pose proof Hstate as Hparts. unfold CircularAreaLogicalState in Hparts.
  destruct Hparts as [Hc [Hread [Hw [Hl [Hp [Hb [Hi Hrest]]]]]]].
  destruct Hchoice as [Hz|Hfull].
  - subst off. replace (0+a) with a in * by lia.
    rewrite (sublist_self xs a Hlen) in Hwrite.
    destruct Hr as [[Hfit ->]|[Hover ->]].
    + rewrite last_capacity_fit__nowrap_returns by (rewrite Zlength_app; lia).
      pose proof (circular_area_logical_state_after_write__write_returns r w c b old phys xs pa a Hstate Hwrite Hbytes ltac:(lia) Hfit) as Hout.
      rewrite sublist_self in Hout by lia. exact Hout.
    + rewrite last_capacity_split__nowrap_returns by lia.
      assert (Hd : 0 < Zlength old+a-c <= Zlength old) by lia.
      pose proof (circular_drop_state__nowrap_returns r w c b old phys
        (Zlength old+a-c) Hstate Hd) as Hdrop.
      replace (r+a-(c-Zlength old)) with (r+(Zlength old+a-c)) by lia.
      replace (Zlength old+Zlength xs-c) with (Zlength old+a-c) by lia.
      pose proof (circular_area_logical_state_after_write__write_returns ((r+(Zlength old+a-c)) mod c) w c 0 (sublist (Zlength old+a-c) (Zlength old) old) phys xs pa a Hdrop Hwrite Hbytes ltac:(lia) ltac:(rewrite Zlength_sublist by lia; lia)) as Hout.
      rewrite sublist_self in Hout by lia. exact Hout.
  - subst a.
    assert (Hrm : rm=w).
    { destruct Hr as [[Hfit Hrm]|[Hover Hrm]].
      - assert (Hz : Zlength old=0) by lia.
        rewrite Hz, Z.add_0_r, Z.mod_small in Hi by lia. lia.
      - rewrite Hrm. replace (r+c-(c-Zlength old)) with (r+Zlength old) by lia. symmetry; exact Hi. }
    subst rm.
    rewrite (last_capacity_full_input__nowrap_returns c old xs off ltac:(lia) Hoff Hlen).
    assert (Hcopied : sublist off (off+c) xs = sublist off (Zlength xs) xs) by (rewrite Hlen; reflexivity).
    rewrite Hcopied in Hwrite.
    pose proof (empty_at_write__nowrap_returns w c phys Hc Hw Hp) as Hemp.
    assert (Hcb : Forall (fun byte : Z => 0 <= byte <= 255) (sublist off (Zlength xs) xs)).
    { eapply (circular_area_forall_sublist__write_returns _ 0); eauto; lia. }
    pose proof (circular_area_logical_state_after_write__write_returns w w c 0 nil phys
      (sublist off (Zlength xs) xs) pa c Hemp Hwrite Hcb ltac:(lia) ltac:(rewrite Zlength_nil; lia)) as Hout.
    simpl List.app in Hout.
    rewrite sublist_self in Hout by (rewrite Zlength_sublist by lia; lia).
    exact Hout.
Qed.
Lemma nowrap_result_state__nowrap_returns : forall state r w b phys xs off a rm force n ca src pa,
  CircularAreaLogicalState r w (ca_capacity state) b (ca_contents state) phys ->
  Forall (fun byte : Z => 0 <= byte <= 255) xs ->
  ca <> 0 -> src <> 0 -> n > 0 -> n=Zlength xs ->
  0 <= off ->
  ((force=0 /\ Zlength (ca_contents state)<ca_capacity state /\
    off=0 /\ rm=r /\ 0<a /\ a<=n /\
    a<=ca_capacity state-Zlength (ca_contents state) /\
    (a=n \/ a=ca_capacity state-Zlength (ca_contents state))) \/
   (force<>0 /\ off+a=n /\ 0<a /\ a<=ca_capacity state /\
    (off=0 \/ a=ca_capacity state) /\
    ((a<=ca_capacity state-Zlength (ca_contents state) /\ rm=r) \/
     (a>ca_capacity state-Zlength (ca_contents state) /\
      rm=(r+a-(ca_capacity state-Zlength (ca_contents state))) mod ca_capacity state)))) ->
  CircularAreaPhysicalWrite phys (sublist off (off+a) xs) pa (ca_capacity state) w a ->
  exists state_after,
    CircularAreaWriteResult state n xs force ca src 0 state_after /\
    CircularAreaLogicalState rm ((w+a) mod ca_capacity state)
      (ca_capacity state_after) 1 (ca_contents state_after) pa /\
    ca_capacity state_after=ca_capacity state.
Proof.
  intros state r w b phys xs off a rm force n ca src pa Hs Hb Hca Hsrc Hn Hlen Hoff Hbranches Hp.
  destruct Hbranches as [[Hf [Hnotfull [Hz [Hrm [Ha [Han [Hfree Hmin]]]]]]]|[Hf [Htotal [Ha [Hac [Hchoice Hr]]]]]].
  - subst off rm force.
    assert (Hactual : a=Z.min n (ca_capacity state-Zlength (ca_contents state))).
    { destruct Hmin as [-> | ->]; [rewrite Z.min_l|rewrite Z.min_r]; lia. }
    exists (Build_circular_area_state (ca_capacity state) (ca_contents state++sublist 0 a xs)).
    split.
    + unfold CircularAreaWriteResult. right; right; left.
      repeat split; try lia. simpl. rewrite <- Hactual. reflexivity.
    + split; [|reflexivity]. simpl.
      replace (0+a) with a in Hp by lia.
      assert (Hprefix : sublist 0 a (sublist 0 a xs)=sublist 0 a xs).
      { apply sublist_self. rewrite Zlength_sublist by lia. lia. }
      pose proof (circular_area_forall_sublist__write_returns
        (fun byte : Z => 0 <= byte <= 255) 0 xs 0 a Hb ltac:(lia) ltac:(lia)) as Hbc.
      pose proof (circular_area_logical_state_after_write__write_returns r w (ca_capacity state) b
        (ca_contents state) phys (sublist 0 a xs) pa a Hs Hp Hbc Ha Hfree) as Hout.
      rewrite Hprefix in Hout. exact Hout.
  - exists (Build_circular_area_state (ca_capacity state)
      (CircularAreaLastCapacity (ca_capacity state) (ca_contents state++xs))).
    split.
    + unfold CircularAreaWriteResult. right; right; right. repeat split; try lia; reflexivity.
    + split; [|reflexivity]. simpl.
      eapply force_after__nowrap_returns; eauto; lia.
Qed.
Lemma pack_descriptor__nowrap_returns : forall state ca base ops r w phys,
  ca<>0 -> base<>0 ->
  CircularAreaLogicalState r w (ca_capacity state) 1 (ca_contents state) phys ->
  (&(ca # "CircularArea" ->ₛ "data_buffer") # Ptr |-> base) **
  (&(ca # "CircularArea" ->ₛ "readidx") # UChar |-> r) **
  (&(ca # "CircularArea" ->ₛ "writeidx") # UChar |-> w) **
  (&(ca # "CircularArea" ->ₛ "p_head") # Ptr |-> base) **
  (&(ca # "CircularArea" ->ₛ "p_tail") # Ptr |-> (base+ca_capacity state)) **
  (&(ca # "CircularArea" ->ₛ "area_length") # UInt |-> ca_capacity state) **
  (&(ca # "CircularArea" ->ₛ "b_status") # Int |-> 1) **
  (&(ca # "CircularArea" ->ₛ "CircularAreaOperations") # Ptr |-> ops) **
  UCharArray.mixed_full base (ca_capacity state) phys |--
  CircularAreaDescriptorOwnership state ca.
Proof.
  intros state ca base ops r w phys Hca Hbase Hs.
  unfold CircularAreaDescriptorOwnership. Right. split_pure_spatial.
  - unfold store_circular_area. Exists base ops r w 1 phys.
    split_pure_spatial.
    + cancel (&(ca # "CircularArea" ->ₛ "data_buffer") # Ptr |-> base).
      cancel (&(ca # "CircularArea" ->ₛ "readidx") # UChar |-> r).
      cancel (&(ca # "CircularArea" ->ₛ "writeidx") # UChar |-> w).
      cancel (&(ca # "CircularArea" ->ₛ "p_head") # Ptr |-> base).
      cancel (&(ca # "CircularArea" ->ₛ "p_tail") # Ptr |-> (base+ca_capacity state)).
      cancel (&(ca # "CircularArea" ->ₛ "area_length") # UInt |-> ca_capacity state).
      cancel (&(ca # "CircularArea" ->ₛ "b_status") # Int |-> 1).
      cancel (&(ca # "CircularArea" ->ₛ "CircularAreaOperations") # Ptr |-> ops).
      cancel (UCharArray.mixed_full base (ca_capacity state) phys).
    + dump_pre_spatial. auto.
  - dump_pre_spatial. exact Hca.
Qed.
Lemma pack_input__nowrap_returns : forall src n xs,
  src<>0 -> Zlength xs=n ->
  UCharArray.full src n xs |-- CircularAreaInputOwnership src n xs.
Proof.
  intros src n xs Hsrc Hlen. unfold CircularAreaInputOwnership.
  Right. split_pure_spatial.
  - cancel (UCharArray.full src n xs).
  - dump_pre_spatial. auto.
Qed.
Lemma index_cast__nowrap_returns : forall w a c,
  0<c<=256 -> 0<=w<c -> 0<=a -> w+a<=c ->
  unsigned_last_nbits (Z.rem (unsigned_last_nbits (unsigned_last_nbits w 32+a) 32) c) 8 =
  (w+a) mod c.
Proof.
  intros w a c Hc Hw Ha Hend.
  assert (Huw : unsigned_last_nbits w 32=w).
  { apply unsigned_last_nbits_eq. change (0<=w<4294967296). lia. }
  rewrite Huw.
  assert (Hua : unsigned_last_nbits (w+a) 32=w+a).
  { apply unsigned_last_nbits_eq. change (0<=w+a<4294967296). lia. }
  rewrite Hua, Z.rem_mod_nonneg by lia.
  apply unsigned_last_nbits_eq. change (0<=(w+a) mod c<256).
  pose proof (Z.mod_pos_bound (w+a) c ltac:(lia)); lia.
Qed.
Lemma circular_u32__wrap_preparation : forall x,
  0 <= x <= 512 -> unsigned_last_nbits x 32 = x.
Proof. intros x Hx. apply unsigned_last_nbits_eq.
  change (0 <= x < 4294967296). lia. Qed.
Lemma circular_nonfull_status__wrap_preparation : forall r w c b l p,
  CircularAreaLogicalState r w c b l p -> Zlength l < c ->
  b = 0 \/ r <> w.
Proof.
  intros r w c b l p H Hlt. unfold CircularAreaLogicalState in H.
  destruct H as [_ [_ [_ [_ [_ [_ [_ [Hb [Hfull _]]]]]]]]].
  destruct Hb as [Hb|Hb]; [auto|right]. intro Heq.
  pose proof (proj1 Hfull (conj Heq Hb)). lia.
Qed.
Lemma circular_physical_split__wrap_preparation : forall base c w down ps,
  0 <= down <= w -> w <= c ->
  UCharArray.mixed_full base c ps |--
  UCharArray.mixed_seg base 0 down (sublist 0 down ps) **
  UCharArray.mixed_seg base down w (sublist down w ps) **
  UCharArray.mixed_seg (base + w) 0 (c-w) (sublist w c ps).
Proof.
  intros base c w down ps Hd Hw.
  sep_apply_l_atomic (UCharArray.mixed_full_split_to_mixed_seg base w c ps ltac:(lia)).
  sep_apply_l_atomic (UCharArray.mixed_seg_split_to_mixed_seg base 0 down w (sublist 0 w ps) ltac:(lia)).
  repeat rewrite Z.sub_0_r.
  repeat rewrite Zsublist_Zsublist0 by lia.
  rewrite (UCharArray.mixed_seg_0_shift base w c (sublist w c ps)).
  simpl. repeat rewrite Z.mul_1_r. entailer!.
Qed.
Lemma circular_input_split__wrap_preparation : forall base n off up a xs,
  0 <= off -> 0 <= up <= a -> off + a <= n ->
  UCharArray.full base n xs |--
  UCharArray.seg base 0 off (sublist 0 off xs) **
  UCharArray.seg (base+off) 0 up (sublist off (off+up) xs) **
  UCharArray.seg (base+off+up) 0 (a-up) (sublist (off+up) (off+a) xs) **
  UCharArray.seg base (off+a) n (sublist (off+a) n xs).
Proof.
  intros base n off up a xs Ho Hu Hn.
  sep_apply_l_atomic (UCharArray.full_split_to_seg base (off+a) n xs ltac:(lia)).
  sep_apply_l_atomic (UCharArray.seg_split_to_seg base 0 (off+up) (off+a) (sublist 0 (off+a) xs) ltac:(lia)).
  repeat rewrite Z.sub_0_r.
  repeat rewrite Zsublist_Zsublist0 by lia.
  sep_apply_l_atomic (UCharArray.seg_split_to_seg base 0 off (off+up) (sublist 0 (off+up) xs) ltac:(lia)).
  repeat rewrite Z.sub_0_r.
  repeat rewrite Zsublist_Zsublist0 by lia.
  rewrite (UCharArray.seg_0_shift base off (off+up) (sublist off (off+up) xs)).
  rewrite (UCharArray.seg_0_shift base (off+up) (off+a) (sublist (off+up) (off+a) xs)).
  simpl. repeat rewrite Z.mul_1_r.
  replace (off+up-off) with up by lia.
  replace (off+a-(off+up)) with (a-up) by lia.
  replace (base+(off+up)) with (base+off+up) by lia.
  entailer!.
Qed.
Lemma circular_read_update__wrap_preparation : forall r c free a,
  0 < c <= 256 -> 0 <= r < c -> 0 <= free -> free < a <= c ->
  unsigned_last_nbits (Z.rem (unsigned_last_nbits
    (unsigned_last_nbits r 32 + (a-free)) 32) c) 8 =
  Z.rem (r+a-free) c.
Proof.
  intros r c free a Hc Hr Hfree Ha.
  rewrite (circular_u32__wrap_preparation r) by lia.
  rewrite (circular_u32__wrap_preparation (r+(a-free))) by lia.
  replace (r+(a-free)) with (r+a-free) by lia.
  apply unsigned_last_nbits_eq.
  change (0 <= Z.rem (r+a-free) c < 256).
  pose proof (Z.rem_nonneg (r+a-free) c ltac:(lia)).
  pose proof (Z.rem_bound_pos (r+a-free) c ltac:(lia) ltac:(lia)).
  lia.
Qed.
Lemma circular_u32__nowrap_preparation : forall x,
  0 <= x <= 512 -> unsigned_last_nbits x 32 = x.
Proof. intros x Hx. apply unsigned_last_nbits_eq.
  change (0 <= x < 4294967296). lia. Qed.
Lemma circular_nonfull_status__nowrap_preparation : forall r w c b l p,
  CircularAreaLogicalState r w c b l p -> Zlength l < c ->
  b = 0 \/ r <> w.
Proof.
  intros r w c b l p H Hlt. unfold CircularAreaLogicalState in H.
  destruct H as [_ [_ [_ [_ [_ [_ [_ [Hb [Hfull _]]]]]]]]].
  destruct Hb as [Hb|Hb]; [auto|right]. intro Heq.
  pose proof (proj1 Hfull (conj Heq Hb)). lia.
Qed.
Lemma circular_read_update__nowrap_preparation : forall r c free a,
  0 < c <= 256 -> 0 <= r < c -> 0 <= free -> free < a <= c ->
  unsigned_last_nbits (Z.rem (unsigned_last_nbits
    (unsigned_last_nbits r 32 + (a-free)) 32) c) 8 =
  Z.rem (r+a-free) c.
Proof.
  intros r c free a Hc Hr Hfree Ha.
  rewrite (circular_u32__nowrap_preparation r) by lia.
  rewrite (circular_u32__nowrap_preparation (r+(a-free))) by lia.
  replace (r+(a-free)) with (r+a-free) by lia.
  apply unsigned_last_nbits_eq.
  change (0 <= Z.rem (r+a-free) c < 256).
  pose proof (Z.rem_nonneg (r+a-free) c ltac:(lia)).
  pose proof (Z.rem_bound_pos (r+a-free) c ltac:(lia) ltac:(lia)).
  lia.
Qed.
Lemma circular_physical_split__nowrap_preparation : forall base c w a ps,
  0 <= w -> 0 <= a -> w+a <= c ->
  UCharArray.mixed_full base c ps |--
  UCharArray.mixed_seg base 0 w (sublist 0 w ps) **
  UCharArray.mixed_seg (base+w) 0 a (sublist w (w+a) ps) **
  UCharArray.mixed_seg base (w+a) c (sublist (w+a) c ps).
Proof.
 intros base c w a ps Hw Ha Hc.
 sep_apply_l_atomic (UCharArray.mixed_full_split_to_mixed_seg base (w+a) c ps ltac:(lia)).
 sep_apply_l_atomic (UCharArray.mixed_seg_split_to_mixed_seg base 0 w (w+a) (sublist 0 (w+a) ps) ltac:(lia)).
 repeat rewrite Z.sub_0_r.
 repeat rewrite Zsublist_Zsublist0 by lia.
 rewrite (UCharArray.mixed_seg_0_shift base w (w+a) (sublist w (w+a) ps)).
 simpl. repeat rewrite Z.mul_1_r.
 replace (w+a-w) with a by lia.
 entailer!.
Qed.
Lemma circular_input_split__nowrap_preparation : forall base n off a xs,
  0 <= off -> 0 <= a -> off+a <= n ->
  UCharArray.full base n xs |--
  UCharArray.seg base 0 off (sublist 0 off xs) **
  UCharArray.seg (base+off) 0 a (sublist off (off+a) xs) **
  UCharArray.seg base (off+a) n (sublist (off+a) n xs).
Proof.
 intros base n off a xs Ho Ha Hn.
 sep_apply_l_atomic (UCharArray.full_split_to_seg base (off+a) n xs ltac:(lia)).
 sep_apply_l_atomic (UCharArray.seg_split_to_seg base 0 off (off+a) (sublist 0 (off+a) xs) ltac:(lia)).
 repeat rewrite Z.sub_0_r.
 repeat rewrite Zsublist_Zsublist0 by lia.
 rewrite (UCharArray.seg_0_shift base off (off+a) (sublist off (off+a) xs)).
 simpl. repeat rewrite Z.mul_1_r.
 replace (off+a-off) with a by lia.
 entailer!.
Qed.
