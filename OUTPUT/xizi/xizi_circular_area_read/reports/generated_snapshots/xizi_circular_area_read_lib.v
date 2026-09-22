Require Import Coq.Lists.List.
Require Import Coq.ZArith.ZArith.
Require Import Coq.Strings.String.
Require Import AUXLib.ListLib.
From SimpleC.SL Require Import Mem SeparationLogic.
Require Import Logic.LogicGenerator.demo932.Interface.
Require Export
  QCIPLib.xizi.xizi_circular_area_common.xizi_circular_area_lib.

Import ListNotations.
Import naive_C_Rules.
Local Open Scope Z_scope.
Local Open Scope list_scope.
Local Open Scope sac.

(** A single syntactic entry branch for [CircularAreaRead].  Packaging the
    nullable ownership alternatives lets QCP bind one unambiguous [@pre]
    snapshot while preserving exactly the original three client cases. *)
Definition CircularAreaReadInput
    (state : circular_area_state) (LitMap : string -> Z)
    (output_capacity : Z) (output_before : list (option Z))
    (circular_area output_buffer data_length : Z) : Assertion :=
  “ 0 <= data_length <= Int.max_unsigned ” &&
  GlobalStrings LitMap **
  ((“ circular_area = 0 ” && emp) ||
   (“ circular_area <> 0 ” &&
    store_circular_area state circular_area **
    ((“ output_buffer = 0 ” && emp) ||
     (“ output_buffer <> 0 /\ data_length <= output_capacity ” &&
      UCharArray.mixed_full
        output_buffer output_capacity output_before)))).

Definition CircularAreaErrorResult (result : Z) : Prop :=
  result = 1.

(** Abstract query observations.  These mention only the client-visible state;
    descriptor fields and the physical ring remain existentially owned by
    [store_circular_area]. *)
Definition CircularAreaStateFullResult
    (state : circular_area_state) (result : Z) : Prop :=
  result = if Z.eq_dec (Zlength (ca_contents state)) (ca_capacity state)
           then 1 else 0.

Definition CircularAreaStateEmptyResult
    (state : circular_area_state) (result : Z) : Prop :=
  result = match ca_contents state with nil => 1 | _ => 0 end.

Definition CircularAreaStateDataLengthResult
    (state : circular_area_state) (result : Z) : Prop :=
  result = Zlength (ca_contents state).

(** [CircularAreaDivideRdData] is an implementation-control query.  Its
    externally relevant abstract effect is only that it preserves the FIFO;
    both returned booleans are legitimate observations of different hidden
    ring layouts representing the same abstract state. *)
Definition CircularAreaStateDivideRdDataResult
    (state : circular_area_state) (data_length result : Z) : Prop :=
  CircularAreaValid state /\
  0 <= data_length <= Zlength (ca_contents state) /\
  (result = 0 \/ result = 1).

(** Complete extensional result relation for [CircularAreaRead].  Error leaves
    both client-visible resources unchanged.  Success copies the FIFO prefix,
    drops precisely that prefix, and preserves the fixed capacity. *)
Definition CircularAreaReadResult
    (state : circular_area_state) (requested output_capacity : Z)
    (output_before : list (option Z)) (result : Z)
    (state_after : circular_area_state)
    (output_after : list (option Z)) : Prop :=
  ((requested = 0 \/ ca_contents state = nil) /\
   result = 1 /\
   state_after = state /\
   output_after = output_before) \/
  (requested > 0 /\
   ca_contents state <> nil /\
   let actual := Z.min requested (Zlength (ca_contents state)) in
   result = 0 /\
   state_after =
     Build_circular_area_state
       (ca_capacity state)
       (sublist actual (Zlength (ca_contents state)) (ca_contents state)) /\
   output_after =
     map (@Some Z) (sublist 0 actual (ca_contents state)) ++
     sublist actual output_capacity output_before).

(** Extensional query semantics kept in the Read case library so that this
    case depends only on the tracked shared circular-area representation. *)
Definition CircularAreaFullResult
    (area_length : Z) (logical : list Z) (result : Z) : Prop :=
  result = if Z.eq_dec (Zlength logical) area_length then 1 else 0.

Definition CircularAreaEmptyResult
    (logical : list Z) (result : Z) : Prop :=
  result = match logical with nil => 1 | _ => 0 end.

Definition CircularAreaDataLengthResult
    (logical : list Z) (result : Z) : Prop :=
  result = Zlength logical.

Definition CircularAreaDivideRdDataResult
    (readidx data_length area_length result : Z) : Prop :=
  (readidx + data_length <= area_length /\ result = 0) \/
  (area_length < readidx + data_length /\ result = 1).

Definition CircularAreaActualReadLength
    (logical : list Z) (requested actual : Z) : Prop :=
  actual = Z.min requested (Zlength logical).

(** The selected physical interval contains precisely the initialized bytes
    that are safe for memcpy to consume.  No fact is asserted about the
    initialization state outside this interval. *)
Definition CircularAreaInitializedSlice
    (physical : list (option Z)) (lo hi : Z) (bytes : list Z) : Prop :=
  sublist lo hi physical = map (@Some Z) bytes.

Definition CircularAreaSomeBytes
    (bytes : list Z) : list (option Z) :=
  map (@Some Z) bytes.

Definition CircularAreaOutputAfterRead
    (output_before : list (option Z)) (output_capacity : Z)
    (bytes : list Z) (output_after : list (option Z)) : Prop :=
  output_after =
    CircularAreaSomeBytes bytes ++
    sublist (Zlength bytes) output_capacity output_before.

(** Extensional FIFO read semantics: the consumed bytes are the logical
    prefix, and the remaining logical resource is the corresponding suffix. *)
Definition CircularAreaReadSuccess
    (readidx area_length requested output_capacity : Z)
    (logical : list Z) (output_before : list (option Z))
    (actual new_readidx : Z)
    (bytes logical_after : list Z)
    (output_after : list (option Z)) : Prop :=
  CircularAreaActualReadLength logical requested actual /\
  0 < actual <= requested /\
  bytes = sublist 0 actual logical /\
  logical_after = sublist actual (Zlength logical) logical /\
  new_readidx = (readidx + actual) mod area_length /\
  CircularAreaOutputAfterRead
    output_before output_capacity bytes output_after.

Require Import Coq.micromega.Lia.
Require Import Coq.ZArith.BinInt.
Require Import Coq.ZArith.Zcomplements.
Lemma CircularArea_index_eq_cases__query_state_results :
  forall readidx writeidx area_length logical_length,
    0 < area_length ->
    0 <= readidx < area_length ->
    0 <= logical_length <= area_length ->
    writeidx = (readidx + logical_length) mod area_length ->
    writeidx = readidx ->
    logical_length = 0 \/ logical_length = area_length.
Proof.
  intros readidx writeidx area_length logical_length
    Harea Hread Hlength Hwrite Heq.
  destruct (Z_lt_ge_dec (readidx + logical_length) area_length) as [Hsmall | Hlarge].
  - left.
    rewrite Z.mod_small in Hwrite by lia.
    lia.
  - right.
    assert (Hrange : 0 <= readidx + logical_length - area_length < area_length) by lia.
    assert (Hmod : readidx + logical_length - area_length =
                   (readidx + logical_length) mod area_length).
    { apply Z.mod_unique with (q := 1); lia. }
    lia.
Qed.
Lemma CircularArea_full_read_ne__query_state_results :
  forall readidx writeidx area_length b_status logical physical,
    CircularAreaLogicalState readidx writeidx area_length b_status logical physical ->
    readidx <> writeidx ->
    CircularAreaFullResult area_length logical 0.
Proof.
  intros readidx writeidx area_length b_status logical physical Hstate Hne.
  unfold CircularAreaLogicalState in Hstate.
  destruct Hstate as
    [Harea [Hread [Hwriteidx [Hlength [_ [_ [Hwrite [_ [_ _]]]]]]]]].
  unfold CircularAreaFullResult.
  destruct (Z.eq_dec (Zlength logical) area_length) as [Hfull | Hnotfull].
  - exfalso. apply Hne.
    rewrite Hwrite, Hfull.
    replace (readidx + area_length) with (readidx + 1 * area_length) by ring.
    rewrite Z.mod_add by lia.
    rewrite Z.mod_small by lia.
    reflexivity.
  - reflexivity.
Qed.
Lemma CircularArea_full_status_zero__query_state_results :
  forall readidx writeidx area_length b_status logical physical,
    CircularAreaLogicalState readidx writeidx area_length b_status logical physical ->
    b_status = 0 ->
    CircularAreaFullResult area_length logical 0.
Proof.
  intros readidx writeidx area_length b_status logical physical Hstate Hzero.
  unfold CircularAreaLogicalState in Hstate.
  destruct Hstate as
    [_ [_ [_ [_ [_ [_ [_ [_ [Hfull_iff [_ _]]]]]]]]]].
  unfold CircularAreaFullResult.
  destruct (Z.eq_dec (Zlength logical) area_length) as [Hfull | Hnotfull].
  - pose proof (proj2 Hfull_iff Hfull) as [_ Hstatus_one].
    lia.
  - reflexivity.
Qed.
Lemma CircularArea_full_status_nonzero__query_state_results :
  forall readidx writeidx area_length b_status logical physical,
    CircularAreaLogicalState readidx writeidx area_length b_status logical physical ->
    b_status <> 0 ->
    readidx = writeidx ->
    CircularAreaFullResult area_length logical 1.
Proof.
  intros readidx writeidx area_length b_status logical physical
    Hstate Hnonzero Hequal.
  unfold CircularAreaLogicalState in Hstate.
  destruct Hstate as
    [_ [_ [_ [_ [_ [_ [_ [Hstatus [Hfull_iff [_ _]]]]]]]]]].
  assert (Hstatus_one : b_status = 1) by lia.
  pose proof (proj1 Hfull_iff (conj Hequal Hstatus_one)) as Hlogical_full.
  unfold CircularAreaFullResult.
  destruct (Z.eq_dec (Zlength logical) area_length) as [Hfull | Hnotfull].
  - reflexivity.
  - contradiction.
Qed.
Lemma CircularArea_empty_read_ne__query_state_results :
  forall readidx writeidx area_length b_status logical physical,
    CircularAreaLogicalState readidx writeidx area_length b_status logical physical ->
    readidx <> writeidx ->
    CircularAreaEmptyResult logical 0.
Proof.
  intros readidx writeidx area_length b_status logical physical Hstate Hne.
  unfold CircularAreaLogicalState in Hstate.
  destruct Hstate as [Harea [Hread [_ [_ [_ [_ [Hwrite _]]]]]]].
  unfold CircularAreaEmptyResult.
  destruct logical as [|x xs].
  - simpl in Hwrite.
    exfalso.
    apply Hne.
    rewrite Hwrite.
    rewrite Z.add_0_r, Z.mod_small by lia.
    reflexivity.
  - reflexivity.
Qed.
Lemma CircularArea_empty_status_nonzero__query_state_results :
  forall readidx writeidx area_length b_status logical physical,
    CircularAreaLogicalState readidx writeidx area_length b_status logical physical ->
    b_status <> 0 ->
    CircularAreaEmptyResult logical 0.
Proof.
  intros readidx writeidx area_length b_status logical physical Hstate Hnonzero.
  unfold CircularAreaLogicalState in Hstate.
  destruct Hstate as
    [_ [_ [_ [_ [_ [_ [_ [_ [_ [Hempty_iff _]]]]]]]]]].
  unfold CircularAreaEmptyResult.
  destruct logical as [|x xs].
  - exfalso.
    pose proof (proj2 Hempty_iff eq_refl) as [_ Hstatus_zero].
    contradiction.
  - reflexivity.
Qed.
Lemma CircularArea_empty_status_zero_equal__query_state_results :
  forall readidx writeidx area_length b_status logical physical,
    CircularAreaLogicalState readidx writeidx area_length b_status logical physical ->
    b_status = 0 ->
    readidx = writeidx ->
    CircularAreaEmptyResult logical 1.
Proof.
  intros readidx writeidx area_length b_status logical physical Hstate Hzero Heq.
  unfold CircularAreaLogicalState in Hstate.
  destruct Hstate as
    [_ [_ [_ [_ [_ [_ [_ [_ [_ [Hempty_iff _]]]]]]]]]].
  pose proof (proj1 Hempty_iff (conj Heq Hzero)) as Hnil.
  apply Zlength_nil_inv in Hnil.
  subst logical.
  reflexivity.
Qed.
Lemma CircularArea_data_length_mod__length_and_divide_results :
  forall readidx writeidx area_length logical_length,
    0 < area_length <= 256 ->
    0 <= readidx < area_length ->
    0 <= writeidx < area_length ->
    0 <= logical_length < area_length ->
    writeidx = (readidx + logical_length) mod area_length ->
    Z.rem (writeidx - readidx + area_length) area_length = logical_length.
Proof.
  intros readidx writeidx area_length logical_length
    Harea Hread Hwrite Hlength Hwriteeq.
  destruct (Z_lt_ge_dec (readidx + logical_length) area_length)
    as [Hsmall | Hwrap].
  - rewrite Z.mod_small in Hwriteeq by lia.
    subst writeidx.
    replace (readidx + logical_length - readidx + area_length)
      with (logical_length + 1 * area_length) by lia.
    rewrite Z.rem_add by lia.
    rewrite Z.rem_small by lia.
    reflexivity.
  - assert (Hsum : readidx + logical_length < 2 * area_length) by lia.
    assert (Hdiv : 1 = (readidx + logical_length) / area_length).
    { apply Z.div_unique with (r := readidx + logical_length - area_length).
      - left. lia.
      - lia. }
    rewrite Z.mod_eq in Hwriteeq by lia.
    rewrite <- Hdiv in Hwriteeq.
    subst writeidx.
    replace (area_length * 1) with area_length by lia.
    replace (readidx + logical_length - area_length - readidx + area_length)
      with logical_length by lia.
    rewrite Z.rem_small by lia.
    reflexivity.
Qed.
Lemma CircularArea_zlength_cons_pos__read_call_normalization
    {A : Type} (x : A) (xs : list A) :
  0 < Zlength (x :: xs).
Proof.
  rewrite Zlength_cons.
  pose proof (Zlength_nonneg xs).
  lia.
Qed.
Lemma CircularArea_zmin_right__read_call_normalization
    (x y : Z) :
  y <= x -> Z.min x y = y.
Proof.
  intros Hxy.
  apply Z.min_r.
  exact Hxy.
Qed.
Lemma CircularArea_zmin_left__read_call_normalization
    (x y : Z) :
  x <= y -> Z.min x y = x.
Proof.
  intros Hxy.
  apply Z.min_l.
  exact Hxy.
Qed.
Lemma CircularAreaInitializedSlice_nonwrap__read_copy_slices :
  forall physical logical readidx area_length n,
    0 < area_length ->
    0 <= readidx ->
    readidx + n <= area_length ->
    0 <= n <= Zlength logical ->
    Zlength physical = area_length ->
    CircularAreaLiveBytes readidx area_length logical physical ->
    CircularAreaInitializedSlice physical readidx (readidx + n)
      (sublist 0 n logical).
Proof.
  intros physical logical readidx area_length n Harea Hread Hfit Hn Hphys Hlive.
  unfold CircularAreaInitializedSlice.
  apply (proj2 (list_eq_ext _ _ None)).
  split.
  - rewrite Zlength_sublist by lia.
    rewrite Zlength_correct, map_length, <- Zlength_correct.
    rewrite Zlength_sublist by lia.
    lia.
  - intros i Hi.
    rewrite Zlength_sublist in Hi by lia.
    rewrite (Znth_sublist None readidx i (readidx + n) physical) by lia.
    unfold Znth at 2.
    rewrite (map_nth_len Z (option Z) (@Some Z)
      (sublist 0 n logical) (Z.to_nat i) None 0).
    2: {
      rewrite sublist_length by lia.
      lia.
    }
    fold (Znth i (sublist 0 n logical) 0).
    rewrite (Znth_sublist0 0 i n logical) by lia.
    specialize (Hlive i ltac:(lia)).
    rewrite Z.mod_small in Hlive by lia.
    replace (i + readidx) with (readidx + i) by lia.
    exact Hlive.
Qed.
Lemma CircularAreaInitializedSlice_wrap_head__read_copy_slices :
  forall physical logical readidx area_length up down,
    0 < area_length ->
    0 <= readidx < area_length ->
    up = area_length - readidx ->
    0 <= down <= readidx ->
    0 <= up ->
    up + down <= Zlength logical ->
    Zlength physical = area_length ->
    CircularAreaLiveBytes readidx area_length logical physical ->
    CircularAreaInitializedSlice physical 0 down
      (sublist up (up + down) logical).
Proof.
  intros physical logical readidx area_length up down
    Harea Hread Hup Hdown Hup0 Hlogical Hphys Hlive.
  unfold CircularAreaInitializedSlice.
  apply (proj2 (list_eq_ext _ _ None)).
  split.
  - rewrite Zlength_sublist by lia.
    rewrite Zlength_correct, map_length, <- Zlength_correct.
    rewrite Zlength_sublist by lia.
    lia.
  - intros i Hi.
    rewrite Zlength_sublist in Hi by lia.
    rewrite (Znth_sublist None 0 i down physical) by lia.
    unfold Znth at 2.
    rewrite (map_nth_len Z (option Z) (@Some Z)
      (sublist up (up + down) logical) (Z.to_nat i) None 0).
    2: { rewrite sublist_length by lia; lia. }
    fold (Znth i (sublist up (up + down) logical) 0).
    rewrite (Znth_sublist 0 up i (up + down) logical) by lia.
    specialize (Hlive (up + i) ltac:(lia)).
    replace ((readidx + (up + i)) mod area_length) with i in Hlive.
    2: {
      replace (readidx + (up + i)) with (area_length + i) by lia.
      rewrite Z.add_mod by lia.
      rewrite Z.mod_same by lia.
      simpl.
      rewrite Z.mod_mod by lia.
      rewrite Z.mod_small by lia.
      reflexivity.
    }
    replace (i + up) with (up + i) by lia.
    replace (i + 0) with i by lia.
    exact Hlive.
Qed.
Lemma CircularArea_consume_logical_state__read_postconditions :
  forall readidx writeidx area_length b_status requested actual logical physical,
    CircularAreaLogicalState readidx writeidx area_length b_status logical physical ->
    CircularAreaActualReadLength logical requested actual ->
    0 < actual ->
    CircularAreaLogicalState
      ((readidx + actual) mod area_length) writeidx area_length 0
      (sublist actual (Zlength logical) logical) physical.
Proof.
  intros readidx writeidx area_length b_status requested actual logical physical
    Hstate Hactual Hpositive.
  unfold CircularAreaLogicalState in *.
  unfold CircularAreaActualReadLength in Hactual.
  destruct Hstate as
    (Harea & Hread & Hwrite & Hlogical & Hphysical & Hbytes & Hwriteidx &
     Hstatus & Hfull & Hempty & Hlive).
  destruct Harea as [Harea_pos Harea_max].
  destruct Hread as [Hread_nonneg Hread_lt].
  destruct Hwrite as [Hwrite_nonneg Hwrite_lt].
  destruct Hlogical as [Hlogical_nonneg Hlogical_le].
  pose proof (Z.le_min_r requested (Zlength logical)).
  assert (Hactual_le : actual <= Zlength logical) by lia.
  assert (Hsuffix_len :
      Zlength (sublist actual (Zlength logical) logical) =
      Zlength logical - actual).
  { rewrite Zlength_sublist by lia. lia. }
  assert (Hnewread :
      0 <= (readidx + actual) mod area_length < area_length).
  { apply Z.mod_pos_bound. lia. }
  assert (Hsuffix_bounds :
      0 <= Zlength logical - actual < area_length) by lia.
  assert (Hnewwrite :
      writeidx =
        (((readidx + actual) mod area_length) +
         (Zlength logical - actual)) mod area_length).
  { rewrite Hwriteidx.
    replace (readidx + Zlength logical)
      with ((readidx + actual) + (Zlength logical - actual)) by ring.
    assert (Hsufmod :
        (Zlength logical - actual) mod area_length =
        Zlength logical - actual).
    { apply Z.mod_small. exact Hsuffix_bounds. }
    rewrite Z.add_mod by lia.
    rewrite Hsufmod.
    reflexivity. }
  assert (Hfull_after :
      (((readidx + actual) mod area_length = writeidx /\ 0 = 1) <->
       Zlength (sublist actual (Zlength logical) logical) = area_length)).
  { rewrite Hsuffix_len.
    split; intros; lia. }
  assert (Hnot_full_after :
      Zlength (sublist actual (Zlength logical) logical) <> area_length).
  { rewrite Hsuffix_len. lia. }
  assert (Hempty_after :
      (((readidx + actual) mod area_length = writeidx /\ 0 = 0) <->
       Zlength (sublist actual (Zlength logical) logical) = 0)).
  { rewrite Hsuffix_len.
    split.
    - intros [Hequal _].
      assert (Hcases :
          Zlength logical - actual = 0 \/
          Zlength logical - actual = area_length).
      { apply
          (CircularArea_index_eq_cases__query_state_results
             ((readidx + actual) mod area_length) writeidx area_length
             (Zlength logical - actual)).
        - exact Harea_pos.
        - exact Hnewread.
        - lia.
        - exact Hnewwrite.
        - symmetry. exact Hequal. }
      destruct Hcases; lia.
    - intros Hzero.
      split; [|reflexivity].
      rewrite Hzero, Z.add_0_r in Hnewwrite.
      rewrite Z.mod_small in Hnewwrite by exact Hnewread.
      symmetry.
      exact Hnewwrite. }
  repeat split.
  - exact Harea_pos.
  - exact Harea_max.
  - apply Z.mod_pos_bound. lia.
  - apply Z.mod_pos_bound. lia.
  - exact Hwrite_nonneg.
  - exact Hwrite_lt.
  - rewrite Hsuffix_len. lia.
  - rewrite Hsuffix_len. lia.
  - exact Hphysical.
  - assert (Hsplit :
        logical = sublist 0 actual logical ++
          sublist actual (Zlength logical) logical).
    { rewrite <- (sublist_self logical (Zlength logical)) at 1 by reflexivity.
      apply sublist_split; lia. }
    rewrite Hsplit in Hbytes.
    apply Forall_app in Hbytes.
    tauto.
  - rewrite Hsuffix_len.
    exact Hnewwrite.
  - left. reflexivity.
  - exact (proj1 Hfull_after).
  - exfalso. apply Hnot_full_after. assumption.
  - exfalso. apply Hnot_full_after. assumption.
  - exact (proj1 Hempty_after).
  - apply (fun Hlen => proj1 (proj2 Hempty_after Hlen)). assumption.
  - intros k Hk.
    rewrite Hsuffix_len in Hk.
    rewrite Znth_sublist by lia.
    replace (k + actual) with (actual + k) by ring.
    specialize (Hlive (actual + k)).
    assert (Hrange : 0 <= actual + k < Zlength logical) by lia.
    specialize (Hlive Hrange).
    rewrite <- Hlive.
    f_equal.
    rewrite Z.add_mod by lia.
    rewrite Z.mod_mod by lia.
    rewrite <- Z.add_mod by lia.
    f_equal. ring.
Qed.

Lemma CircularArea_empty_result_zero_length_pos__read_call_normalization
    (logical : list Z) (result : Z) :
  CircularAreaEmptyResult logical result ->
  result = 0 ->
  0 < Zlength logical.
Proof.
  intros Hempty Hresult.
  unfold CircularAreaEmptyResult in Hempty.
  destruct logical as [| x xs].
  - simpl in Hempty. lia.
  - apply CircularArea_zlength_cons_pos__read_call_normalization.
Qed.

Lemma CircularArea_unsigned_ring_sum__length_and_divide_results :
  forall readidx writeidx area_length,
    0 < area_length <= 256 ->
    0 <= readidx < area_length ->
    0 <= writeidx < area_length ->
    (((writeidx - readidx) mod (2 ^ 32) + area_length) mod (2 ^ 32)) =
      writeidx - readidx + area_length.
Proof.
  intros readidx writeidx area_length Harea Hread Hwrite.
  change (((writeidx - readidx) mod 4294967296 + area_length) mod
          4294967296 = writeidx - readidx + area_length).
  destruct (Z_lt_ge_dec (writeidx - readidx) 0) as [Hneg | Hnonneg].
  - assert (Hinner : (writeidx - readidx) mod 4294967296 =
                     writeidx - readidx + 4294967296).
    { symmetry. apply Z.mod_unique with (q := -1); lia. }
    rewrite Hinner.
    symmetry. apply Z.mod_unique with (q := 1); lia.
  - assert (Hinner : (writeidx - readidx) mod 4294967296 =
                     writeidx - readidx).
    { apply Z.mod_small; lia. }
    rewrite Hinner.
    rewrite Z.mod_small by lia.
    reflexivity.
Qed.
Lemma CircularArea_actual_read_length_le__read_post_and_memcpy_lengths :
  forall logical requested actual,
    CircularAreaActualReadLength logical requested actual ->
    actual <= Zlength logical.
Proof.
  intros logical requested actual Hactual.
  unfold CircularAreaActualReadLength in Hactual.
  subst actual.
  apply Z.le_min_r.
Qed.
Lemma CircularArea_physical_split_three__read_post_and_memcpy_lengths :
  forall (physical : list (option Z)) readidx actual area_length,
    Zlength physical = area_length ->
    0 <= readidx ->
    0 <= actual ->
    readidx + actual <= area_length ->
    sublist 0 readidx physical ++
      sublist readidx (readidx + actual) physical ++
      sublist (readidx + actual) area_length physical = physical.
Proof.
  intros physical readidx actual area_length Hlen Hread Hactual Hbound.
  transitivity (sublist 0 area_length physical).
  2: { apply sublist_self. symmetry. exact Hlen. }
  rewrite (sublist_split 0 area_length readidx physical) by lia.
  rewrite (sublist_split readidx area_length (readidx + actual) physical)
    by lia.
  rewrite app_assoc.
  reflexivity.
Qed.

Lemma Forall_Znth__read_postconditions :
  forall (P : Z -> Prop) (l : list Z) i d,
    Forall P l ->
    0 <= i < Zlength l ->
    P (Znth i l d).
Proof.
  intros P l i d HForall Hrange.
  apply Forall_forall with (x := Znth i l d) in HForall.
  - exact HForall.
  - unfold Znth.
    apply nth_In.
    rewrite Zlength_correct in Hrange.
    lia.
Qed.
Lemma Forall_sublist__read_postconditions :
  forall (P : Z -> Prop) (l : list Z) lo hi,
    0 <= lo <= hi ->
    hi <= Zlength l ->
    Forall P l ->
    Forall P (sublist lo hi l).
Proof.
  intros P l lo hi Hlohi Hhilen HForall.
  remember (Z.to_nat (hi - lo)) as n eqn:Hn.
  revert lo hi Hlohi Hhilen Hn.
  induction n; intros lo hi Hlohi Hhilen Hn.
  - assert (hi = lo) by lia.
    subst hi.
    rewrite Zsublist_nil by lia.
    constructor.
  - assert (lo < hi) by lia.
    rewrite (sublist_split lo hi (lo + 1) l) by lia.
    rewrite (@sublist_single Z 0 lo l) by lia.
    constructor.
    + simpl.
      eapply Forall_Znth__read_postconditions; eauto; lia.
    + apply IHn; lia.
Qed.
Lemma CircularArea_read_consume_state__read_postconditions :
  forall readidx writeidx area_length b_status logical physical actual,
    CircularAreaLogicalState
      readidx writeidx area_length b_status logical physical ->
    0 < actual <= Zlength logical ->
    CircularAreaLogicalState
      ((readidx + actual) mod area_length) writeidx area_length 0
      (sublist actual (Zlength logical) logical) physical.
Proof.
  intros readidx writeidx area_length b_status logical physical actual
    Hstate Hactual.
  unfold CircularAreaLogicalState in Hstate.
  destruct Hstate as
    [Harea [Hread [Hwriteidx [Hlen [Hphys [Hbytes
      [Hwrite [_ [Hfull [Hempty Hlive]]]]]]]]]].
  assert (Hsuffixlen :
    Zlength (sublist actual (Zlength logical) logical) =
      Zlength logical - actual).
  { rewrite Zlength_sublist by lia. lia. }
  assert (Hnewread :
    0 <= (readidx + actual) mod area_length < area_length).
  { apply Z.mod_pos_bound. lia. }
  assert (Hnewwrite :
    writeidx =
      (((readidx + actual) mod area_length) +
       Zlength (sublist actual (Zlength logical) logical)) mod area_length).
  {
    rewrite Hsuffixlen.
    rewrite Z.add_mod by lia.
    rewrite Z.mod_mod by lia.
    rewrite <- Z.add_mod by lia.
    replace (readidx + actual + (Zlength logical - actual))
      with (readidx + Zlength logical) by lia.
    exact Hwrite.
  }
  split; [exact Harea |].
  split; [exact Hnewread |].
  split; [exact Hwriteidx |].
  split; [rewrite Hsuffixlen; lia |].
  split; [exact Hphys |].
  split.
  - eapply Forall_sublist__read_postconditions; eauto; lia.
  - split; [exact Hnewwrite |].
    split; [left; reflexivity |].
    split.
    + split.
      * intros [_ Hfalse]. discriminate.
      * intro Hfullsuffix. rewrite Hsuffixlen in Hfullsuffix. lia.
    + split.
      * split.
        -- intros [Heq _].
           pose proof
             (CircularArea_index_eq_cases__query_state_results
               ((readidx + actual) mod area_length) writeidx area_length
               (Zlength (sublist actual (Zlength logical) logical))
               ltac:(lia) Hnewread ltac:(rewrite Hsuffixlen; lia)
               Hnewwrite (eq_sym Heq)) as Hcases.
           destruct Hcases; [assumption |].
           rewrite Hsuffixlen in H. lia.
        -- intro Hzero.
           split; [|reflexivity].
           rewrite Hnewwrite, Hzero, Z.add_0_r.
           symmetry.
           apply Z.mod_small.
           exact Hnewread.
      * unfold CircularAreaLiveBytes in *.
        intros k Hk.
        rewrite Znth_sublist by (rewrite Hsuffixlen in Hk; lia).
        rewrite Z.add_mod by lia.
        rewrite Z.mod_mod by lia.
        rewrite <- Z.add_mod by lia.
        replace (readidx + actual + k) with (readidx + (actual + k)) by lia.
        replace (k + actual) with (actual + k) by lia.
        apply Hlive.
        rewrite Hsuffixlen in Hk.
        lia.
Qed.
