Require Import Coq.Lists.List.
Require Import Coq.ZArith.ZArith.
Require Import Coq.micromega.Lia.
Require Import AUXLib.ListLib.

Import ListNotations.
Local Open Scope Z_scope.

(** [aligned] is exactly the four-byte downward alignment of a valid caller
    capacity.  Small positive requests may align to zero and therefore cannot
    satisfy the successful descriptor predicate below. *)
Definition CircularAreaAlignedLength (requested aligned : Z) : Prop :=
  0 < requested /\
  requested <= 256 /\
  aligned = (requested / 4) * 4.

(** Mathematical descriptor state returned by a successful initialization.
    The operations address is explicit, so callers can connect the descriptor
    to the concrete CRTOS operation table rather than to an arbitrary table. *)
Definition CircularAreaInitDescriptorState
    (aligned circular_area data_buffer readidx writeidx p_head p_tail
     area_length b_status operations expected_operations : Z) : Prop :=
  0 < aligned <= 256 /\
  circular_area <> 0 /\
  data_buffer <> 0 /\
  readidx = 0 /\
  writeidx = 0 /\
  p_head = data_buffer /\
  p_tail = data_buffer + aligned /\
  area_length = aligned /\
  b_status = 0 /\
  operations = expected_operations.

(** Observable initialized portion of the descriptor leaked when the second
    allocation returns null.  The remaining four fields are deliberately left
    uninitialized and are represented spatially by permissions in the C spec. *)
Definition CircularAreaInitLeakedDescriptorState
    (circular_area data_buffer readidx writeidx b_status : Z) : Prop :=
  circular_area <> 0 /\
  data_buffer = 0 /\
  readidx = 0 /\
  writeidx = 0 /\
  b_status = 0.

Lemma CircularArea_div4_aligned_range__init_return_branches :
  forall requested : Z,
    0 < requested ->
    requested <= 4294967295 ->
    0 <= (requested ÷ 4) * 4 < 2 ^ 32.
Proof.
  intros requested Hpos Hmax.
  replace (2 ^ 32) with 4294967296 by reflexivity.
  pose proof (Z.mul_quot_le requested 4 ltac:(lia) ltac:(lia)) as Hquot.
  lia.
Qed.

Require Import Coq.ZArith.Zquot.
Lemma CircularArea_quot_eq_div_nonneg__init_return_branch_construction :
  forall requested : Z,
    0 <= requested ->
    requested ÷ 4 = requested / 4.
Proof.
  intros requested Hnonneg.
  apply Zquot_Zdiv_pos; lia.
Qed.
