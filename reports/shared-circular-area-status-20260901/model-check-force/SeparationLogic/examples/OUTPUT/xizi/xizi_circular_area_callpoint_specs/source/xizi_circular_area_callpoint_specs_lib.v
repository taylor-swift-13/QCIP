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

Definition CircularAreaCallResult (ret : Z) : Assertion :=
  (“ ret = 0 ” && emp) ||
  (“ ret = 1 ” && emp).

Definition CircularAreaReadCallResult
    (ret output byte : Z) (output_before : list Z) : Assertion :=
  (“ ret = 0 ” && UCharArray.full output 1 output_before) ||
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

Definition CircularAreaFourBytes (bytes : list Z) : Prop :=
  Zlength bytes = 4 /\
  Forall (fun byte => 0 <= byte <= 255) bytes.

(** Exact physical effect exported by the proved force-mode Write contract.
    It is deliberately separate from [CircularAreaLogicalState]: a general
    force write does not necessarily leave a canonical FIFO. *)
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

Definition CircularAreaForceWriteEffect
    (area_length writeidx requested actual new_writeidx : Z)
    (logical input : list Z)
    (physical_before physical_after : list (option Z)) : Prop :=
  CircularAreaActualWriteLength area_length requested logical actual /\
  0 <= actual <= requested /\
  new_writeidx = (writeidx + actual) mod area_length /\
  CircularAreaPhysicalWrite physical_before input physical_after
                            area_length writeidx actual.

Definition CircularAreaForceWriteResource
    (circular_area data_buffer writeidx area_length operations : Z)
    (physical : list (option Z)) : Assertion :=
  “ circular_area <> 0 /\ data_buffer <> 0 /\
    0 < area_length <= 256 /\
    0 <= writeidx < area_length /\
    Zlength physical = area_length ” &&
  &(circular_area # "CircularArea" ->ₛ "data_buffer") # Ptr
      |-> data_buffer **
  &(circular_area # "CircularArea" ->ₛ "readidx") # UChar
      |-> writeidx **
  &(circular_area # "CircularArea" ->ₛ "writeidx") # UChar
      |-> writeidx **
  &(circular_area # "CircularArea" ->ₛ "p_head") # Ptr
      |-> data_buffer **
  &(circular_area # "CircularArea" ->ₛ "p_tail") # Ptr
      |-> (data_buffer + area_length) **
  &(circular_area # "CircularArea" ->ₛ "area_length") # UInt
      |-> area_length **
  &(circular_area # "CircularArea" ->ₛ "b_status") # Int
      |-> 1 **
  &(circular_area # "CircularArea" ->ₛ "CircularAreaOperations") # Ptr
      |-> operations **
  UCharArray.mixed_full data_buffer area_length physical.

Lemma CircularArea_force_full_fresh_to_backing__state_bridge_and_force_full :
  forall area data_buffer operations input physical_before physical_after
         actual new_writeidx,
    CircularAreaFourBytes input ->
    xizi_circular_area_uninitialized 4 physical_before ->
    CircularAreaForceWriteEffect
      4 0 4 actual new_writeidx nil input physical_before physical_after ->
    CircularAreaForceWriteResource
      area data_buffer new_writeidx 4 operations physical_after |--
    CircularAreaBackingResource
      area data_buffer 0 0 4 1 operations input physical_after.
Proof.
  intros area data_buffer operations input physical_before physical_after
    actual new_writeidx Hfour Hfresh Heffect.
  unfold CircularAreaFourBytes in Hfour.
  destruct Hfour as [Hinput_length Hinput_bytes].
  unfold CircularAreaForceWriteEffect,
    CircularAreaActualWriteLength in Heffect.
  destruct Heffect as
    [Hactual [Hactual_bounds [Hnew_writeidx Hphysical_write]]].
  change (actual = 4) in Hactual.
  assert (Hactual_eq : actual = 4) by exact Hactual.
  subst actual.
  assert (Hnew_writeidx_eq : new_writeidx = 0) by
    (rewrite Hnew_writeidx; reflexivity).
  subst new_writeidx.
  unfold CircularAreaPhysicalWrite in Hphysical_write.
  destruct Hphysical_write as
    [Hphysical_before_length
      [Hphysical_after_length
        [Hwritten_length
          [Harea_positive
            [Hwriteidx_bounds
              [Hactual_area_bounds [Hwritten Hunchanged]]]]]]].
  assert (Hlogical :
    CircularAreaLogicalState 0 0 4 1 input physical_after).
  {
    unfold CircularAreaLogicalState.
    split; [lia |].
    split; [lia |].
    split; [lia |].
    split; [lia |].
    split; [exact Hphysical_after_length |].
    split; [exact Hinput_bytes |].
    split; [rewrite Hinput_length; reflexivity |].
    split; [right; reflexivity |].
    split.
    - split.
      + intros _. exact Hinput_length.
      + intros _. split; reflexivity.
    - split.
      + split.
        * intros [_ Hstatus]. discriminate Hstatus.
        * intros Hempty. rewrite Hinput_length in Hempty. lia.
      + unfold CircularAreaLiveBytes.
        intros k Hk.
        replace (0 + k) with k by lia.
        apply Hwritten.
        lia.
  }
  unfold CircularAreaForceWriteResource,
    CircularAreaBackingResource.
  Intros_p Hresource.
  entailer!.
Qed.
