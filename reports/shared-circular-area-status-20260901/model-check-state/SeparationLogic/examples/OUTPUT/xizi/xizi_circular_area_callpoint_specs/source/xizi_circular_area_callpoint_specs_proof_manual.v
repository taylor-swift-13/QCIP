Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Strings.String.
Require Import Coq.Strings.Ascii.
Require Import Coq.Lists.List.
Require Import Coq.Classes.RelationClasses.
Require Import Coq.Classes.Morphisms.
Require Import Coq.micromega.Psatz.
Require Import Coq.Sorting.Permutation.
From AUXLib Require Import int_auto Axioms Feq Idents ListLib VMap.
Require Import SetsClass.SetsClass. Import SetsNotation.
From SimpleC.SL Require Import Mem SeparationLogic.
From SimpleC.EE.OUTPUT.xizi.xizi_circular_area_callpoint_specs.source Require Import xizi_circular_area_callpoint_specs_goal.
From SimpleC.EE.OUTPUT.xizi.xizi_circular_area_callpoint_specs.source Require Import xizi_circular_area_callpoint_specs_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
From SimpleC.EE.OUTPUT.xizi.xizi_circular_area_callpoint_specs.source
      Require Import xizi_circular_area_callpoint_specs_lib.
Local Open Scope sac.

Lemma proof_of_xizi_circular_area_call_init_metadata_release_return_wit_1 : xizi_circular_area_call_init_metadata_release_return_wit_1.
Proof.
  unfold xizi_circular_area_call_init_metadata_release_return_wit_1.
  right; intros.
  unfold CircularAreaCallResult.
  Right; entailer!.
Qed.

Lemma proof_of_xizi_circular_area_call_init_metadata_release_return_wit_2 : xizi_circular_area_call_init_metadata_release_return_wit_2.
Proof.
  unfold xizi_circular_area_call_init_metadata_release_return_wit_2.
  right; intros.
  unfold CircularAreaCallResult.
  Left; entailer!.
Qed.

Lemma proof_of_xizi_circular_area_call_init_empty_read_release_return_wit_1 : xizi_circular_area_call_init_empty_read_release_return_wit_1.
Proof.
  unfold xizi_circular_area_call_init_empty_read_release_return_wit_1.
  right; intros.
  unfold CircularAreaCallResult.
  Right; entailer!.
Qed.

Lemma proof_of_xizi_circular_area_call_init_empty_read_release_return_wit_2 : xizi_circular_area_call_init_empty_read_release_return_wit_2.
Proof.
  unfold xizi_circular_area_call_init_empty_read_release_return_wit_2.
  right; intros.
  unfold CircularAreaCallResult.
  Left; entailer!.
Qed.

Lemma proof_of_xizi_circular_area_call_init_first_write_release_return_wit_1 : xizi_circular_area_call_init_first_write_release_return_wit_1.
Proof.
  unfold xizi_circular_area_call_init_first_write_release_return_wit_1.
  right; intros.
  unfold CircularAreaCallResult.
  Right; entailer!.
Qed.

Lemma proof_of_xizi_circular_area_call_init_first_write_release_return_wit_2 : xizi_circular_area_call_init_first_write_release_return_wit_2.
Proof.
  unfold xizi_circular_area_call_init_first_write_release_return_wit_2.
  right; intros.
  unfold CircularAreaCallResult.
  Left; entailer!.
Qed.

Lemma proof_of_xizi_circular_area_call_write_read_release_return_wit_1 : xizi_circular_area_call_write_read_release_return_wit_1.
Proof.
  unfold xizi_circular_area_call_write_read_release_return_wit_1.
  right.
  intros.
  unfold CircularAreaReadCallResult.
  Right.
  entailer!.
Qed.

Lemma proof_of_xizi_circular_area_call_write_read_release_return_wit_2 : xizi_circular_area_call_write_read_release_return_wit_2.
Proof.
  unfold xizi_circular_area_call_write_read_release_return_wit_2.
  right.
  intros.
  unfold CircularAreaReadCallResult.
  Left.
  entailer!.
Qed.

Lemma proof_of_xizi_circular_area_call_repeated_write_release_return_wit_1 : xizi_circular_area_call_repeated_write_release_return_wit_1.
Proof.
  unfold xizi_circular_area_call_repeated_write_release_return_wit_1.
  right; intros.
  unfold CircularAreaCallResult.
  Right; entailer!.
Qed.

Lemma proof_of_xizi_circular_area_call_repeated_write_release_return_wit_2 : xizi_circular_area_call_repeated_write_release_return_wit_2.
Proof.
  unfold xizi_circular_area_call_repeated_write_release_return_wit_2.
  right; intros.
  unfold CircularAreaCallResult.
  Left; entailer!.
Qed.

Lemma proof_of_xizi_circular_area_call_repeated_write_release_partial_solve_wit_3_pure : xizi_circular_area_call_repeated_write_release_partial_solve_wit_3_pure.
Proof.
  pre_process.
  unfold CircularAreaAlignedLength in PreH4.
  pose proof (proj2 (proj2 PreH4)) as Harea_length.
  assert (Hquotient : 1 <= requested_pre / 4).
  {
    apply Z.div_le_lower_bound; lia.
  }
  cbn [Zlength].
  split_pures.
  all: dump_pre_spatial.
  - lia.
  - lia.
  - rewrite Zlength_cons, Zlength_nil. nia.
Qed.

Lemma proof_of_xizi_circular_area_call_read_then_write_release_return_wit_1 : xizi_circular_area_call_read_then_write_release_return_wit_1.
Proof.
  unfold xizi_circular_area_call_read_then_write_release_return_wit_1.
  right.
  intros.
  unfold CircularAreaReadCallResult.
  Right.
  entailer!.
Qed.

Lemma proof_of_xizi_circular_area_call_read_then_write_release_return_wit_2 : xizi_circular_area_call_read_then_write_release_return_wit_2.
Proof.
  unfold xizi_circular_area_call_read_then_write_release_return_wit_2.
  right.
  intros.
  unfold CircularAreaReadCallResult.
  Left.
  entailer!.
Qed.

Lemma proof_of_xizi_circular_area_call_reset_release_return_wit_1 : xizi_circular_area_call_reset_release_return_wit_1.
Proof.
  unfold xizi_circular_area_call_reset_release_return_wit_1.
  right; intros.
  unfold CircularAreaCallResult.
  Right; entailer!.
Qed.

Lemma proof_of_xizi_circular_area_call_reset_release_return_wit_2 : xizi_circular_area_call_reset_release_return_wit_2.
Proof.
  unfold xizi_circular_area_call_reset_release_return_wit_2.
  right; intros.
  unfold CircularAreaCallResult.
  Left; entailer!.
Qed.

Lemma proof_of_xizi_circular_area_call_force_full_release_entail_wit_1 : xizi_circular_area_call_force_full_release_entail_wit_1.
Proof.
  pre_process.
  unfold CircularAreaAlignedLength in PreH3.
  pose proof (proj2 (proj2 PreH3)) as Harea_length.
  cbn in Harea_length.
  subst area_length.
  Exists data_buffer_2 operations_2 physical_2.
  entailer!.
Qed.

Lemma proof_of_xizi_circular_area_call_force_full_release_entail_wit_2 : xizi_circular_area_call_force_full_release_entail_wit_2.
Proof.
  pre_process.
  sep_apply
    (CircularArea_force_full_fresh_to_backing__state_bridge_and_force_full
       area data_buffer_2 operations_2 input_contents physical physical_after_2
       actual new_writeidx PreH3 PreH4 PreH1).
  Exists data_buffer_2 operations_2 physical_after_2.
  entailer!.
Qed.

Lemma proof_of_xizi_circular_area_call_force_full_release_return_wit_1 : xizi_circular_area_call_force_full_release_return_wit_1.
Proof.
  unfold xizi_circular_area_call_force_full_release_return_wit_1.
  right; intros.
  unfold CircularAreaCallResult.
  Right; entailer!.
Qed.

Lemma proof_of_xizi_circular_area_call_force_full_release_return_wit_2 : xizi_circular_area_call_force_full_release_return_wit_2.
Proof.
  unfold xizi_circular_area_call_force_full_release_return_wit_2.
  right; intros.
  unfold CircularAreaCallResult.
  Left; entailer!.
Qed.
