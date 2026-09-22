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
From SimpleC.EE.OUTPUT.xizi.xizi_circular_area_reset.source Require Import xizi_circular_area_reset_goal.
From SimpleC.EE.OUTPUT.xizi.xizi_circular_area_reset.source Require Import xizi_circular_area_reset_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
Require Import
      SimpleC.EE.OUTPUT.xizi.xizi_circular_area_reset.source.xizi_circular_area_reset_lib.
Local Open Scope sac.

Lemma proof_of_CircularAreaReset_entail_wit_1 : CircularAreaReset_entail_wit_1.
Proof.
  aggressive_pre_process.
  unfold store_circular_area.
  Intros data_buffer operations readidx writeidx b_status physical.
  destruct H as (Hca & Hbuf & Hstate).
  unfold CircularAreaLogicalState in Hstate.
  destruct Hstate as (Hcap & _ & _ & _ & Hlen & _).
  destruct Hcap as [Hcaplo Hcaphi].
  Exists operations b_status writeidx readidx physical data_buffer.
  entailer!.
Qed.

Lemma proof_of_CircularAreaReset_return_wit_1 : CircularAreaReset_return_wit_1.
Proof.
  pre_process.
  rewrite PreH6, PreH7.
  unfold store_circular_area.
  Exists data_buffer0 operations0 0 0 0 physical.
  entailer!.
  unfold CircularAreaLogicalState, CircularAreaLiveBytes.
  rewrite !Zlength_nil.
  simpl.
  assert (Hcapnz : ca_capacity state <> 0) by lia.
  rewrite Z.mod_0_l by exact Hcapnz.
  split; [lia |].
  split; [lia |].
  split; [lia |].
  split; [lia |].
  split; [exact PreH5 |].
  split; [constructor |].
  split; [reflexivity |].
  split; [left; reflexivity |].
  split.
  - split.
    + intros [_ Hcontra]. lia.
    + intro Hzero. split; [reflexivity | lia].
  - split.
    + split.
      * intros Hempty. reflexivity.
      * intro Hzero. split; reflexivity.
    + intros k Hk. lia.
Qed.
