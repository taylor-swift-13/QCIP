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
From SimpleC.EE.OUTPUT.xizi.xizi_circular_area_write_advance.source Require Import xizi_circular_area_write_advance_goal.
From SimpleC.EE.OUTPUT.xizi.xizi_circular_area_write_advance.source Require Import xizi_circular_area_write_advance_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
Require Import
      SimpleC.EE.OUTPUT.xizi.xizi_circular_area_write_advance.source.xizi_circular_area_write_advance_lib.
Local Open Scope sac.

Lemma proof_of_CircularAreaDivideWrData_entail_wit_1 : CircularAreaDivideWrData_entail_wit_1.
Proof.
  aggressive_pre_process.
  unfold store_circular_area.
  Intros data_buffer operations readidx writeidx b_status physical.
  Exists operations readidx writeidx b_status physical data_buffer.
  entailer!.
Qed.

Lemma proof_of_CircularAreaDivideWrData_return_wit_1 : CircularAreaDivideWrData_return_wit_1.
Proof.
  pre_process.
  Exists circular_area_operations_2 readidx_2 writeidx_2 b_status_2 physical_2 data_buffer_2.
  entailer!.
  unfold CircularAreaLogicalState in PreH6.
  destruct PreH6 as [Hcap [_ [Hwrite _]]].
  unfold CircularAreaDivideWrDataResult.
  right.
  split; [| reflexivity].
  rewrite (unsigned_last_nbits_eq writeidx_2 32) in PreH1 by psatzl Z.
  rewrite (unsigned_last_nbits_eq (writeidx_2 + entry_data_length) 32) in PreH1 by psatzl Z.
  psatzl Z.
Qed.

Lemma proof_of_CircularAreaDivideWrData_return_wit_2 : CircularAreaDivideWrData_return_wit_2.
Proof.
  pre_process.
  Exists circular_area_operations_2 readidx_2 writeidx_2 b_status_2 physical_2 data_buffer_2.
  entailer!.
  unfold CircularAreaLogicalState in PreH6.
  destruct PreH6 as [Hcap [_ [Hwrite _]]].
  unfold CircularAreaDivideWrDataResult.
  left.
  split; [| reflexivity].
  rewrite (unsigned_last_nbits_eq writeidx_2 32) in PreH1 by psatzl Z.
  rewrite (unsigned_last_nbits_eq (writeidx_2 + entry_data_length) 32) in PreH1 by psatzl Z.
  psatzl Z.
Qed.
