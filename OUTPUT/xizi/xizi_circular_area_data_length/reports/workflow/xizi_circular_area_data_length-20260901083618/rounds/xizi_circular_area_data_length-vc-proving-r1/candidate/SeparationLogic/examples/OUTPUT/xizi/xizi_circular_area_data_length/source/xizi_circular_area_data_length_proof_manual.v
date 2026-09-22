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
From SimpleC.EE.OUTPUT.xizi.xizi_circular_area_data_length.source Require Import xizi_circular_area_data_length_goal.
From SimpleC.EE.OUTPUT.xizi.xizi_circular_area_data_length.source Require Import xizi_circular_area_data_length_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
From SimpleC.EE.OUTPUT.xizi.xizi_circular_area_data_length.source Require Import xizi_circular_area_data_length_lib.
Local Open Scope sac.

Lemma proof_of_CircularAreaIsFull_entail_wit_1 : CircularAreaIsFull_entail_wit_1.
Proof.
  pre_process.
  subst circular_area_pre.
  unfold CircularAreaBackingResource.
  entailer!.
Qed.

Lemma proof_of_CircularAreaIsFull_return_wit_1 : CircularAreaIsFull_return_wit_1.
Proof.
  pre_process.
  unfold CircularAreaBackingResource.
  assert (Hlt : Zlength logical_state_spec < area_length_state_spec).
  {
    eapply circular_area_distinct_indices_imply_nonfull__is_full_contract;
      eauto.
  }
  unfold CircularAreaFullResult.
  destruct (Z.eq_dec (Zlength logical_state_spec) area_length_state_spec);
    [lia | entailer!].
Qed.

Lemma proof_of_CircularAreaIsFull_return_wit_2 : CircularAreaIsFull_return_wit_2.
Proof.
  pre_process.
  unfold CircularAreaBackingResource.
  assert (Hempty : Zlength logical_state_spec = 0).
  {
    unfold CircularAreaLogicalState in PreH6.
    destruct PreH6 as
      (_ & _ & _ & _ & _ & _ & _ & _ & _ & Hempty_iff & _).
    apply (proj1 Hempty_iff).
    auto.
  }
  assert (Hcapacity : 0 < area_length_state_spec).
  {
    unfold CircularAreaLogicalState in PreH6.
    lia.
  }
  unfold CircularAreaFullResult.
  destruct (Z.eq_dec (Zlength logical_state_spec) area_length_state_spec);
    [lia | entailer!].
Qed.

Lemma proof_of_CircularAreaIsFull_return_wit_3 : CircularAreaIsFull_return_wit_3.
Proof.
  pre_process.
  unfold CircularAreaBackingResource.
  assert (Hfull : Zlength logical_state_spec = area_length_state_spec).
  {
    unfold CircularAreaLogicalState in PreH6.
    destruct PreH6 as
      (_ & _ & _ & _ & _ & _ & _ & Hstatus & Hfull_iff & _).
    apply (proj1 Hfull_iff).
    split; [assumption |].
    destruct Hstatus; lia.
  }
  unfold CircularAreaFullResult.
  destruct (Z.eq_dec (Zlength logical_state_spec) area_length_state_spec);
    [entailer! | contradiction].
Qed.

Lemma proof_of_CircularAreaIsFull_return_wit_4 : CircularAreaIsFull_return_wit_4.
Proof.
  pre_process.
  unfold CircularAreaBackingResource.
  entailer!.
Qed.

Lemma proof_of_CircularAreaIsFull_partial_solve_wit_1_pure : CircularAreaIsFull_partial_solve_wit_1_pure.
Proof.
  pre_process.
Qed.

Lemma proof_of_CircularAreaGetDataLength_safety_wit_7_state_spec : CircularAreaGetDataLength_safety_wit_7_state_spec.
Proof.
  aggressive_pre_process.
  unfold CircularAreaLogicalState in PreH4.
  split_pures; dump_pre_spatial; lia.
Qed.

Lemma proof_of_CircularAreaGetDataLength_safety_wit_8_state_spec : CircularAreaGetDataLength_safety_wit_8_state_spec.
Proof.
  aggressive_pre_process.
  split_pures.
  - unfold CircularAreaLogicalState in PreH4. dump_pre_spatial. lia.
  - unfold CircularAreaLogicalState in PreH4. dump_pre_spatial. lia.
Qed.

Lemma proof_of_CircularAreaGetDataLength_entail_wit_1_state_spec : CircularAreaGetDataLength_entail_wit_1_state_spec.
Proof.
  aggressive_pre_process.
  all: unfold CircularAreaFullResult in PreH1.
  all: destruct (Z.eq_dec (Zlength logical_state_spec) area_length_state_spec).
  all: try congruence.
  all: subst.
  all: unfold CircularAreaBackingResource.
  all: entailer!.
Qed.

Lemma proof_of_CircularAreaGetDataLength_entail_wit_2_state_spec : CircularAreaGetDataLength_entail_wit_2_state_spec.
Proof.
  aggressive_pre_process.
  all: unfold CircularAreaFullResult in PreH1.
  all: destruct (Z.eq_dec (Zlength logical_state_spec) area_length_state_spec).
  all: try congruence.
  all: subst circular_area_pre.
  all: unfold CircularAreaBackingResource.
  all: entailer!.
  all: unfold CircularAreaLogicalState in *; lia.
Qed.

Lemma proof_of_CircularAreaGetDataLength_return_wit_1_state_spec : CircularAreaGetDataLength_return_wit_1_state_spec.
Proof.
  aggressive_pre_process.
  - unfold CircularAreaBackingResource.
    entailer!.
  - dump_pre_spatial.
    unfold CircularAreaDataLengthResult, unsigned_last_nbits.
    apply circular_area_unsigned_nonfull_mod_length__data_length_query with
        (b_status := b_status_state_spec) (physical := physical_state_spec);
      assumption.
Qed.

Lemma proof_of_CircularAreaGetDataLength_return_wit_2_state_spec : CircularAreaGetDataLength_return_wit_2_state_spec.
Proof.
  aggressive_pre_process.
  - unfold CircularAreaBackingResource.
    entailer!.
  - dump_pre_spatial.
    unfold CircularAreaDataLengthResult.
    lia.
Qed.

Lemma proof_of_CircularAreaGetDataLength_return_wit_3_null_spec : CircularAreaGetDataLength_return_wit_3_null_spec.
Proof.
  left.
  intros.
  subst circular_area_pre.
  unfold CircularAreaErrorResult.
  entailer!.
Qed.

Lemma proof_of_CircularAreaGetDataLength_return_wit_4_state_spec : CircularAreaGetDataLength_return_wit_4_state_spec.
Proof.
  pre_process.
  all: subst area_addr_state_spec.
  all: unfold CircularAreaBackingResource.
  all: entailer!.
Qed.
