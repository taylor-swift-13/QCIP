Require Import Coq.Lists.List.
Require Import Coq.ZArith.ZArith.
Require Import Coq.micromega.Lia.
Require Import AUXLib.ListLib.
Require Import SimpleC.SL.IntLib.

Import ListNotations.
Local Open Scope Z_scope.

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

Definition CircularAreaDivideWrDataResult
    (writeidx data_length area_length result : Z) : Prop :=
  (writeidx + data_length <= area_length /\ result = 0) \/
  (area_length < writeidx + data_length /\ result = 1).

Definition CircularAreaDescriptorState
    (readidx writeidx area_length b_status : Z)
    (contents : list Z) : Prop :=
  0 <= readidx <= 255 /\ readidx < area_length /\
  0 <= writeidx <= 255 /\ writeidx < area_length /\
  0 < area_length <= 256 /\
  (-2147483648 <= b_status <= 2147483647) /\
  Zlength contents = area_length.

Definition CircularAreaActualWriteLength
    (readidx writeidx area_length b_status requested actual : Z) : Prop :=
  exists used,
    CircularAreaDataLengthResult
      readidx writeidx area_length b_status used /\
    actual = Z.min requested (area_length - used).

(** Every byte actually written to the ring equals the matching byte of the
    requested input prefix, and all other ring positions are preserved. *)
Definition CircularAreaRingUpdate
    (before input after : list Z)
    (area_length writeidx actual : Z) : Prop :=
  Zlength before = area_length /\
  Zlength after = area_length /\
  actual <= Zlength input /\
  0 < area_length /\ 0 <= writeidx < area_length /\
  0 <= actual <= area_length /\
  (forall j,
      0 <= j < actual ->
      Znth (Z.rem (writeidx + j) area_length) after 0 =
      Znth j input 0) /\
  (forall i,
      0 <= i < area_length ->
      (forall j,
          0 <= j < actual ->
          i <> Z.rem (writeidx + j) area_length) ->
      Znth i after 0 = Znth i before 0).

Definition CircularAreaWriteSuccess
    (readidx writeidx area_length b_status requested force : Z)
    (input before after : list Z)
    (readidx_after writeidx_after b_status_after result : Z) : Prop :=
  exists used actual,
    CircularAreaDataLengthResult
      readidx writeidx area_length b_status used /\
    actual = Z.min requested (area_length - used) /\
    writeidx + actual <= 4294967295 /\
    CircularAreaRingUpdate
      before input after area_length writeidx actual /\
    writeidx_after =
      unsigned_last_nbits (Z.rem (writeidx + actual) area_length) 8 /\
    ((force = 0 /\ readidx_after = readidx) \/
     (force <> 0 /\ readidx_after = writeidx_after)) /\
    b_status_after = 1 /\
    result = 0.

Lemma CircularAreaActualWriteLength_upper_bound__write_branch_segmentation :
  forall readidx writeidx area_length b_status requested actual contents,
    CircularAreaDescriptorState
      readidx writeidx area_length b_status contents ->
    CircularAreaActualWriteLength
      readidx writeidx area_length b_status requested actual ->
    actual <= area_length.
Proof.
  intros readidx writeidx area_length b_status requested actual contents
    Hstate [used [Hused ->]].
  assert (Hused_nonneg : 0 <= used).
  {
    unfold CircularAreaDataLengthResult in Hused.
    destruct Hused as [[_ [_ Hused]] | [_ Hused]]; subst used.
    - unfold CircularAreaDescriptorState in Hstate. lia.
    - apply Z.rem_nonneg.
      + unfold CircularAreaDescriptorState in Hstate. lia.
      + pose proof (unsigned_Lastnbits_range
          (unsigned_last_nbits (writeidx - readidx) 32 + area_length)
          32 ltac:(lia)).
        lia.
  }
  pose proof (Z.le_min_r requested (area_length - used)).
  lia.
Qed.
Lemma circular_area_ring_update_nowrap__write_exit_ring_reconstruction :
  forall before input area_length writeidx actual,
    Zlength before = area_length ->
    actual <= Zlength input ->
    0 < area_length ->
    0 <= writeidx < area_length ->
    0 <= actual ->
    writeidx + actual <= area_length ->
    CircularAreaRingUpdate before input
      ((sublist 0 writeidx before ++ sublist 0 actual input) ++
       sublist (writeidx + actual) area_length before)
      area_length writeidx actual.
Proof.
  intros before input area_length writeidx actual
    Hbefore Hinput Harea Hwrite Hactual Hend.
  unfold CircularAreaRingUpdate.
  assert (Hprefix : Zlength (sublist 0 writeidx before) = writeidx).
  { rewrite Zlength_sublist by lia. lia. }
  assert (Hwritten : Zlength (sublist 0 actual input) = actual).
  { rewrite Zlength_sublist by lia. lia. }
  assert (Hsuffix :
      Zlength (sublist (writeidx + actual) area_length before) =
      area_length - (writeidx + actual)).
  { rewrite Zlength_sublist by lia. lia. }
  repeat split; try assumption; try lia.
  - repeat rewrite Zlength_app.
    lia.
  - intros j Hj.
    rewrite Z.rem_small by lia.
    rewrite app_Znth1 by (rewrite Zlength_app; lia).
    rewrite app_Znth2 by lia.
    rewrite Znth_sublist by lia.
    f_equal; lia.
  - intros i Hi Hnot_written.
    destruct (Z_lt_dec i writeidx) as [Hleft | Hnleft].
    + rewrite app_Znth1 by (rewrite Zlength_app; lia).
      rewrite app_Znth1 by lia.
      rewrite Znth_sublist0 by lia.
      reflexivity.
    + destruct (Z_lt_dec i (writeidx + actual)) as [Hmiddle | Hright].
      * exfalso.
        specialize (Hnot_written (i - writeidx)).
        rewrite Z.rem_small in Hnot_written by lia.
        apply Hnot_written; lia.
      * rewrite app_Znth2 by (rewrite Zlength_app; lia).
        rewrite Zlength_app, Hprefix, Hwritten.
        rewrite Znth_sublist by lia.
        f_equal; lia.
Qed.
Lemma circular_area_wrap_mod_index__write_exit_ring_reconstruction :
  forall area_length writeidx actual up down,
    0 < area_length ->
    0 <= writeidx < area_length ->
    up = area_length - writeidx ->
    down = actual - up ->
    0 <= down <= writeidx ->
    Z.rem (writeidx + actual) area_length = down.
Proof.
  intros area_length writeidx actual up down
    Harea Hwrite Hup Hdown Hdown_bounds.
  replace (writeidx + actual) with (down + 1 * area_length) by lia.
  rewrite Z.rem_add by (try lia; nia).
  rewrite Z.rem_small by lia.
  reflexivity.
Qed.
Lemma circular_area_ring_update_wrap__write_exit_ring_reconstruction :
  forall before input area_length writeidx actual up down,
    Zlength before = area_length ->
    actual <= Zlength input ->
    0 < area_length ->
    0 <= writeidx < area_length ->
    up = area_length - writeidx ->
    down = actual - up ->
    0 <= down <= writeidx ->
    actual <= area_length ->
    CircularAreaRingUpdate before input
      ((sublist up actual input ++ sublist down writeidx before) ++
       sublist 0 up input)
      area_length writeidx actual.
Proof.
  intros before input area_length writeidx actual up down
    Hbefore Hinput Harea Hwrite Hup Hdown Hdown_bounds Hactual_area.
  unfold CircularAreaRingUpdate.
  assert (Hhead : Zlength (sublist up actual input) = down).
  { rewrite Zlength_sublist by lia. lia. }
  assert (Hmiddle : Zlength (sublist down writeidx before) = writeidx - down).
  { rewrite Zlength_sublist by lia. lia. }
  assert (Htail : Zlength (sublist 0 up input) = up).
  { rewrite Zlength_sublist by lia. lia. }
  repeat split; try assumption; try lia.
  - repeat rewrite Zlength_app. lia.
  - intros j Hj.
    destruct (Z_lt_dec j up) as [Hjup | Hjnup].
    + rewrite Z.rem_small by lia.
      rewrite app_Znth2 by (rewrite Zlength_app; lia).
      rewrite Zlength_app, Hhead, Hmiddle.
      rewrite Znth_sublist0 by lia.
      f_equal; lia.
    + assert (Hrem : Z.rem (writeidx + j) area_length = j - up).
      { replace (writeidx + j) with ((j - up) + 1 * area_length) by lia.
        rewrite Z.rem_add by (try lia; nia).
        rewrite Z.rem_small by lia.
        reflexivity. }
      rewrite Hrem.
      rewrite app_Znth1 by (rewrite Zlength_app; lia).
      rewrite app_Znth1 by lia.
      rewrite Znth_sublist by lia.
      f_equal; lia.
  - intros i Hi Hnot_written.
    assert (Hnot_left : down <= i).
    { destruct (Z_lt_dec i down) as [Hidown | ?]; try lia.
      exfalso.
      specialize (Hnot_written (up + i)).
      assert (Hrem : Z.rem (writeidx + (up + i)) area_length = i).
      { replace (writeidx + (up + i)) with (i + 1 * area_length) by lia.
        rewrite Z.rem_add by (try lia; nia).
        rewrite Z.rem_small by lia.
        reflexivity. }
      rewrite Hrem in Hnot_written.
      apply Hnot_written; lia. }
    assert (Hnot_right : i < writeidx).
    { destruct (Z_lt_dec i writeidx) as [? | Hiwrite]; try lia.
      exfalso.
      specialize (Hnot_written (i - writeidx)).
      rewrite Z.rem_small in Hnot_written by lia.
      apply Hnot_written; lia. }
    rewrite app_Znth1 by (rewrite Zlength_app; lia).
    rewrite app_Znth2 by lia.
    rewrite Hhead.
    rewrite Znth_sublist by lia.
    f_equal; lia.
Qed.
