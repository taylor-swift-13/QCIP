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
  pre_process.
  unfold CircularAreaCallResult.
  Right.
  entailer!.
Qed.

Lemma proof_of_xizi_circular_area_call_init_metadata_release_return_wit_2 : xizi_circular_area_call_init_metadata_release_return_wit_2.
Proof.
  pre_process.
  unfold CircularAreaCallResult.
  Left.
  Exists failed_area.
  entailer!.
Qed.

Lemma proof_of_xizi_circular_area_call_init_empty_read_release_return_wit_1 : xizi_circular_area_call_init_empty_read_release_return_wit_1.
Proof.
  pre_process.
  unfold CircularAreaCallResult.
  Right.
  entailer!.
Qed.

Lemma proof_of_xizi_circular_area_call_init_empty_read_release_return_wit_2 : xizi_circular_area_call_init_empty_read_release_return_wit_2.
Proof.
  pre_process.
  unfold CircularAreaCallResult.
  Left.
  Exists failed_area.
  entailer!.
Qed.

Lemma proof_of_xizi_circular_area_call_init_first_write_release_return_wit_1 : xizi_circular_area_call_init_first_write_release_return_wit_1.
Proof.
  pre_process.
  unfold CircularAreaCallResult.
  Right.
  entailer!.
Qed.

Lemma proof_of_xizi_circular_area_call_init_first_write_release_return_wit_2 : xizi_circular_area_call_init_first_write_release_return_wit_2.
Proof.
  pre_process.
  unfold CircularAreaCallResult.
  Left.
  Exists failed_area.
  entailer!.
Qed.

Lemma proof_of_xizi_circular_area_call_write_read_release_return_wit_1 : xizi_circular_area_call_write_read_release_return_wit_1.
Proof.
  pre_process.
  unfold CircularAreaReadCallResult.
  Right.
  entailer!.
Qed.

Lemma proof_of_xizi_circular_area_call_write_read_release_return_wit_2 : xizi_circular_area_call_write_read_release_return_wit_2.
Proof.
  pre_process.
  unfold CircularAreaReadCallResult.
  Left.
  Exists failed_area.
  entailer!.
Qed.

Lemma proof_of_xizi_circular_area_call_repeated_write_release_return_wit_1 : xizi_circular_area_call_repeated_write_release_return_wit_1.
Proof.
  pre_process.
  unfold CircularAreaCallResult.
  Right.
  entailer!.
Qed.

Lemma proof_of_xizi_circular_area_call_repeated_write_release_return_wit_2 : xizi_circular_area_call_repeated_write_release_return_wit_2.
Proof.
  pre_process.
  unfold CircularAreaCallResult.
  Left.
  Exists failed_area.
  entailer!.
Qed.

Lemma proof_of_xizi_circular_area_call_repeated_write_release_partial_solve_wit_3_pure : xizi_circular_area_call_repeated_write_release_partial_solve_wit_3_pure.
Proof.
  pre_process.
  unfold CircularAreaBackingResource.
  Intros_p Hstate.
  split_pures.
  - dump_pre_spatial. reflexivity.
  - dump_pre_spatial. reflexivity.
  - dump_pre_spatial.
    unfold CircularAreaLogicalState in Hstate.
    destruct Hstate as
      (Hcircular & Hdata & Harea & Hread & Hwrite & Hlogical &
       Hphysical & Hbytes & Hwriteidx & Hfull & Hnotfull & Hlive).
    apply (proj1 Hnotfull).
    reflexivity.
Qed.

Lemma proof_of_xizi_circular_area_call_read_then_write_release_return_wit_1 : xizi_circular_area_call_read_then_write_release_return_wit_1.
Proof.
  pre_process.
  unfold CircularAreaReadCallResult.
  Right.
  entailer!.
Qed.

Lemma proof_of_xizi_circular_area_call_read_then_write_release_return_wit_2 : xizi_circular_area_call_read_then_write_release_return_wit_2.
Proof.
  pre_process.
  unfold CircularAreaReadCallResult.
  Left.
  Exists failed_area.
  entailer!.
Qed.

Lemma proof_of_xizi_circular_area_call_reset_release_return_wit_1 : xizi_circular_area_call_reset_release_return_wit_1.
Proof.
  pre_process.
  unfold CircularAreaCallResult.
  Right.
  entailer!.
Qed.

Lemma proof_of_xizi_circular_area_call_reset_release_return_wit_2 : xizi_circular_area_call_reset_release_return_wit_2.
Proof.
  pre_process.
  unfold CircularAreaCallResult.
  Left.
  Exists failed_area.
  entailer!.
Qed.
