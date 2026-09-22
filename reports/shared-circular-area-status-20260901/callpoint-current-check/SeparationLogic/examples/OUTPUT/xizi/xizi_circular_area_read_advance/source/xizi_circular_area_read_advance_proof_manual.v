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
From SimpleC.EE.OUTPUT.xizi.xizi_circular_area_read_advance.source Require Import xizi_circular_area_read_advance_goal.
From SimpleC.EE.OUTPUT.xizi.xizi_circular_area_read_advance.source Require Import xizi_circular_area_read_advance_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
From SimpleC.EE.OUTPUT.xizi.xizi_circular_area_read_advance.source Require Import xizi_circular_area_read_advance_lib.
Local Open Scope sac.

Lemma proof_of_CircularAreaDivideRdData_entail_wit_1 : CircularAreaDivideRdData_entail_wit_1.
Proof.
  pre_process.
  unfold CircularAreaDivideRdDataInput.
  Split.
  - Right.
    Intros_p Hzero.
    entailer!.
  - Left.
    unfold CircularAreaBackingResource.
    Intros_p Hinput.
    Intros_p Hbacking.
    unfold CircularAreaLogicalState in Hinput, Hbacking.
    entailer!.
    unfold CircularAreaLogicalState.
    tauto.
Qed.

Lemma proof_of_CircularAreaDivideRdData_return_wit_1 : CircularAreaDivideRdData_return_wit_1.
Proof.
  pre_process.
  subst circular_area_pre data_length_pre.
  pose proof PreH10 as Hstate.
  unfold CircularAreaLogicalState in Hstate.
  destruct Hstate as [[Harea_pos Harea_max] [[Hread_nonneg Hread_lt] _]].
  assert (Hread_bits : 0 <= readidx < 2 ^ 32).
  { split; [exact Hread_nonneg |].
    change (readidx < 4294967296).
    eapply Z.lt_trans; [exact Hread_lt |].
    eapply Z.le_lt_trans.
    - exact Harea_max.
    - reflexivity. }
  assert (Hsum_bits : 0 <= readidx + entry_data_length < 2 ^ 32).
  { split.
    - apply Z.add_nonneg_nonneg; assumption.
    - change (readidx + entry_data_length < 4294967296).
      eapply Z.le_lt_trans.
      + exact PreH9.
      + reflexivity. }
  rewrite (unsigned_last_nbits_eq readidx 32 Hread_bits) in PreH1.
  rewrite (unsigned_last_nbits_eq (readidx + entry_data_length) 32 Hsum_bits) in PreH1.
  unfold CircularAreaDivideRdDataResult, CircularAreaBackingResource.
  entailer!.
Qed.

Lemma proof_of_CircularAreaDivideRdData_return_wit_2 : CircularAreaDivideRdData_return_wit_2.
Proof.
  pre_process.
  subst circular_area_pre data_length_pre.
  pose proof PreH10 as Hstate.
  unfold CircularAreaLogicalState in Hstate.
  destruct Hstate as [[Harea_pos Harea_max] [[Hread_nonneg Hread_lt] _]].
  assert (Hread_bits : 0 <= readidx < 2 ^ 32).
  { split; [exact Hread_nonneg |].
    change (readidx < 4294967296).
    eapply Z.lt_trans; [exact Hread_lt |].
    eapply Z.le_lt_trans.
    - exact Harea_max.
    - reflexivity. }
  assert (Hsum_bits : 0 <= readidx + entry_data_length < 2 ^ 32).
  { split.
    - apply Z.add_nonneg_nonneg; assumption.
    - change (readidx + entry_data_length < 4294967296).
      eapply Z.le_lt_trans.
      + exact PreH9.
      + reflexivity. }
  rewrite (unsigned_last_nbits_eq readidx 32 Hread_bits) in PreH1.
  rewrite (unsigned_last_nbits_eq (readidx + entry_data_length) 32 Hsum_bits) in PreH1.
  unfold CircularAreaDivideRdDataResult, CircularAreaBackingResource.
  entailer!.
Qed.
