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
  aggressive_pre_process.
  unfold CircularAreaDivideRdDataInput.
  Split.
  - Intros_p Hnull.
    entailer!.
  - Intros_p Hinput.
    unfold store_circular_area.
    Intros data_buffer operations readidx writeidx b_status physical.
    destruct Hinput as [Harea [Hnonzero Hlength]].
    subst circular_area_pre.
    match goal with
    | Hstore : area_addr <> 0 /\ data_buffer <> 0 /\
        CircularAreaLogicalState readidx writeidx (ca_capacity state)
          b_status (ca_contents state) physical |- _ =>
        destruct Hstore as [Harea_store [Hbuffer_nonzero Hlogical]]
    end.
    pose proof Hlogical as Hlogical_facts.
    unfold CircularAreaLogicalState in Hlogical_facts.
    Exists operations writeidx b_status physical readidx data_buffer.
    split_pure_spatial.
    + cancel (GlobalStrings LitMap).
      cancel (UCharArray.mixed_full data_buffer (ca_capacity state) physical).
      cancel (&(area_addr # "CircularArea" ->ₛ "data_buffer") # Ptr |-> data_buffer).
      cancel (&(area_addr # "CircularArea" ->ₛ "readidx") # UChar |-> readidx).
      cancel (&(area_addr # "CircularArea" ->ₛ "writeidx") # UChar |-> writeidx).
      cancel (&(area_addr # "CircularArea" ->ₛ "p_head") # Ptr |-> data_buffer).
      cancel (&(area_addr # "CircularArea" ->ₛ "p_tail") # Ptr
        |-> (data_buffer + ca_capacity state)).
      cancel (&(area_addr # "CircularArea" ->ₛ "area_length") # UInt
        |-> ca_capacity state).
      cancel (&(area_addr # "CircularArea" ->ₛ "b_status") # Int |-> b_status).
      cancel (&(area_addr # "CircularArea" ->ₛ "CircularAreaOperations") # Ptr
        |-> operations).
    + split_pures; dump_pre_spatial; auto; lia.
Qed.

Lemma proof_of_CircularAreaDivideRdData_return_wit_1 : CircularAreaDivideRdData_return_wit_1.
Proof.
  aggressive_pre_process.
  - unfold CircularAreaLogicalState in PreH8.
    rewrite (unsigned_last_nbits_eq readidx_2 32) in PreH1 by lia.
    rewrite (unsigned_last_nbits_eq (readidx_2 + data_length_pre) 32) in PreH1 by lia.
    unfold CircularAreaDivideRdDataResult.
    lia.
  - unfold CircularAreaStateDivideRdDataResult, CircularAreaValid.
    unfold CircularAreaLogicalState in PreH8.
    intuition.
Qed.

Lemma proof_of_CircularAreaDivideRdData_return_wit_2 : CircularAreaDivideRdData_return_wit_2.
Proof.
  aggressive_pre_process.
  - unfold CircularAreaLogicalState in PreH8.
    rewrite (unsigned_last_nbits_eq readidx_2 32) in PreH1 by lia.
    rewrite (unsigned_last_nbits_eq (readidx_2 + data_length_pre) 32) in PreH1 by lia.
    unfold CircularAreaDivideRdDataResult.
    lia.
  - unfold CircularAreaStateDivideRdDataResult, CircularAreaValid.
    unfold CircularAreaLogicalState in PreH8.
    intuition.
Qed.

Lemma proof_of_CircularAreaDivideRdData_return_wit_3 : CircularAreaDivideRdData_return_wit_3.
Proof.
  pre_process.
  unfold CircularAreaDivideRdDataInput.
  Split.
  - Intros_p Hnull.
    Right.
    entailer!.
  - Intros_p Hinput.
    entailer!.
Qed.
