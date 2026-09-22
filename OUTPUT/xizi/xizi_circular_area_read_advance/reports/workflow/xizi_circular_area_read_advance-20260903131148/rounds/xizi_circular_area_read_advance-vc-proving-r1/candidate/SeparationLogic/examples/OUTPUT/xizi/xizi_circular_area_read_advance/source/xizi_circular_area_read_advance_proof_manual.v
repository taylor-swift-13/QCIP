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

Lemma proof_of_CircularAreaDivideRdData_entail_wit_1_state_spec : CircularAreaDivideRdData_entail_wit_1_state_spec.
Proof.
  pre_process.
  subst data_length_pre circular_area_pre.
  unfold store_circular_area.
  Intros data_buffer operations readidx writeidx b_status physical.
  Exists operations writeidx b_status physical readidx data_buffer.
  destruct H as [Haddr [Hbuf Hlogical]].
  split_pure_spatial.
  - repeat cancel.
  - split_pures; dump_pre_spatial.
    + exact PreH1.
    + exact Hbuf.
    + exact PreH5.
    + exact PreH6.
    + unfold CircularAreaLogicalState in Hlogical. lia.
    + exact Hlogical.
Qed.

Lemma proof_of_CircularAreaDivideRdData_return_wit_1_state_spec : CircularAreaDivideRdData_return_wit_1_state_spec.
Proof.
  pre_process.
  Exists operations_2 writeidx_2 b_status_2 physical_2 readidx_2 data_buffer_2.
  entailer!.
  - unfold CircularAreaDivideRdDataResult.
    rewrite (unsigned_last_nbits_eq readidx_2 32) in PreH1 by
        (change (0 <= readidx_2 < 4294967296);
         unfold CircularAreaLogicalState in PreH7; lia).
    rewrite (unsigned_last_nbits_eq (readidx_2 + d0_state_spec) 32) in PreH1 by
        (change (0 <= readidx_2 + d0_state_spec < 4294967296);
         unfold CircularAreaLogicalState in PreH7; lia).
    right. lia.
  - unfold CircularAreaStateDivideRdDataResult, CircularAreaValid.
    unfold CircularAreaLogicalState in PreH7.
    intuition lia.
Qed.

Lemma proof_of_CircularAreaDivideRdData_return_wit_2_state_spec : CircularAreaDivideRdData_return_wit_2_state_spec.
Proof.
  pre_process.
  Exists operations_2 writeidx_2 b_status_2 physical_2 readidx_2 data_buffer_2.
  entailer!.
  - unfold CircularAreaDivideRdDataResult.
    rewrite (unsigned_last_nbits_eq readidx_2 32) in PreH1 by
        (change (0 <= readidx_2 < 4294967296);
         unfold CircularAreaLogicalState in PreH7; lia).
    rewrite (unsigned_last_nbits_eq (readidx_2 + d0_state_spec) 32) in PreH1 by
        (change (0 <= readidx_2 + d0_state_spec < 4294967296);
         unfold CircularAreaLogicalState in PreH7; lia).
    left. lia.
  - unfold CircularAreaStateDivideRdDataResult, CircularAreaValid.
    unfold CircularAreaLogicalState in PreH7.
    intuition lia.
Qed.
