Require Import Coq.Lists.List.
Require Import Coq.ZArith.ZArith.
Require Import Coq.Strings.String.
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

(** A single syntactic entry branch for [CircularAreaWrite].  Packaging the
    nullable ownership alternatives lets QCP bind one unambiguous [@pre]
    snapshot while preserving exactly the original four client cases. *)
Definition CircularAreaWriteInput
    (state : circular_area_state) (LitMap : string -> Z)
    (input_contents : list Z)
    (circular_area input_buffer data_length b_force : Z) : Assertion :=
  “ b_force = 0 /\ 0 <= data_length <= Int.max_unsigned ” &&
  GlobalStrings LitMap **
  ((“ circular_area = 0 ” && emp) ||
   (“ circular_area <> 0 ” &&
    store_circular_area state circular_area)) **
  ((“ input_buffer = 0 ” && emp) ||
   (“ input_buffer <> 0 /\ Zlength input_contents = data_length ” &&
    UCharArray.full input_buffer data_length input_contents)).

Definition CircularAreaErrorResult (result : Z) : Prop :=
  result = 1.

Definition CircularAreaStateFullResult
    (state : circular_area_state) (result : Z) : Prop :=
  result = if Z.eq_dec (Zlength (ca_contents state)) (ca_capacity state)
           then 1 else 0.

Definition CircularAreaStateDataLengthResult
    (state : circular_area_state) (result : Z) : Prop :=
  result = Zlength (ca_contents state).

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
Definition CircularAreaWriteResult
    (state : circular_area_state) (requested : Z) (input : list Z)
    (result : Z) (state_after : circular_area_state) : Prop :=
  ((requested = 0 \/
    Zlength (ca_contents state) = ca_capacity state) /\
   result = 1 /\
   state_after = state) \/
  (requested > 0 /\
   Zlength (ca_contents state) < ca_capacity state /\
   let actual :=
     Z.min requested
       (ca_capacity state - Zlength (ca_contents state)) in
   result = 0 /\
   state_after =
     Build_circular_area_state
       (ca_capacity state)
       (ca_contents state ++ sublist 0 actual input)).

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

Require Import Coq.micromega.Lia.
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
