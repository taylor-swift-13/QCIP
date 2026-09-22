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
  aggressive_pre_process.
  all: unfold CircularAreaBackingResource.
  all: Intros_p Hresource.
  all: entailer!.
Qed.

Lemma proof_of_CircularAreaIsFull_return_wit_1 : CircularAreaIsFull_return_wit_1.
Proof.
  right.
  aggressive_pre_process.
  all: unfold CircularAreaBackingResource; try entailer!.
  all: unfold CircularAreaFullResult.
  all: pose proof
    (circular_area_distinct_indices_imply_nonfull__is_full_contract
       readidx_state_spec writeidx_state_spec area_length_state_spec
       b_status_state_spec logical_state_spec physical_state_spec
       PreH8 PreH5) as Hnonfull.
  all: destruct (Z.eq_dec (Zlength logical_state_spec) area_length_state_spec);
    [lia | reflexivity].
Qed.

Lemma proof_of_CircularAreaIsFull_return_wit_2 : CircularAreaIsFull_return_wit_2.
Proof.
  right.
  aggressive_pre_process.
  all: unfold CircularAreaBackingResource; try entailer!.
  all: unfold CircularAreaFullResult.
  all: pose proof PreH9 as Hstate.
  all: unfold CircularAreaLogicalState in Hstate.
  all: destruct Hstate as
    [_ [_ [_ [_ [_ [_ [_ [_ [Hbzero _]]]]]]]]].
  all: apply Hbzero in PreH5.
  all: destruct (Z.eq_dec (Zlength logical_state_spec) area_length_state_spec);
    [lia | reflexivity].
Qed.

Lemma proof_of_CircularAreaIsFull_return_wit_3 : CircularAreaIsFull_return_wit_3.
Proof.
  right.
  aggressive_pre_process.
  all: unfold CircularAreaBackingResource; try entailer!.
  all: unfold CircularAreaFullResult.
  all: pose proof PreH9 as Hstate.
  all: unfold CircularAreaLogicalState in Hstate.
  all: destruct Hstate as
    [_ [_ [_ [Hlogical [_ [_ [_ [_ [Hbzero _]]]]]]]]].
  all: destruct Hlogical as [_ Hlogical_bound].
  all: assert (~ Zlength logical_state_spec < area_length_state_spec)
    as Hnot_short by
      (intro Hshort; apply PreH5; apply Hbzero; exact Hshort).
  all: assert (Zlength logical_state_spec = area_length_state_spec) as Hfull by lia.
  all: destruct (Z.eq_dec (Zlength logical_state_spec) area_length_state_spec);
    [reflexivity | contradiction].
Qed.

Lemma proof_of_CircularAreaIsFull_return_wit_4 : CircularAreaIsFull_return_wit_4.
Proof.
  left.
  aggressive_pre_process.
  all: unfold CircularAreaBackingResource.
  all: Intros_p Hresource.
  all: entailer!.
Qed.

Lemma proof_of_CircularAreaIsFull_partial_solve_wit_1_pure : CircularAreaIsFull_partial_solve_wit_1_pure.
Proof.
  right.
  aggressive_pre_process.
  all: entailer!.
Qed.

Lemma proof_of_CircularAreaGetDataLength_safety_wit_7 : CircularAreaGetDataLength_safety_wit_7.
Proof.
  pre_process.
  unfold CircularAreaLogicalState in PreH4.
  destruct PreH4 as (Hlen & _).
  entailer!.
Qed.

Lemma proof_of_CircularAreaGetDataLength_safety_wit_8 : CircularAreaGetDataLength_safety_wit_8.
Proof.
  pre_process.
  unfold CircularAreaLogicalState in PreH4.
  destruct PreH4 as (Hcap & Hr & Hw & _).
  entailer!.
Qed.

Lemma proof_of_CircularAreaGetDataLength_entail_wit_1 : CircularAreaGetDataLength_entail_wit_1.
Proof.
  aggressive_pre_process.
  - subst area_addr.
    unfold CircularAreaBackingResource.
    Intros_p Hresource.
    repeat cancel.
  - unfold CircularAreaBackingResource.
    entailer!.
  - dump_pre_spatial.
    unfold CircularAreaFullResult in PreH1.
    destruct (Z.eq_dec (Zlength logical) area_length); congruence.
  - unfold CircularAreaBackingResource.
    entailer!.
Qed.

Lemma proof_of_CircularAreaGetDataLength_entail_wit_2 : CircularAreaGetDataLength_entail_wit_2.
Proof.
  aggressive_pre_process.
  - subst area_addr.
    unfold CircularAreaBackingResource.
    Intros_p Hresource.
    repeat cancel.
  - unfold CircularAreaBackingResource.
    entailer!.
  - unfold CircularAreaBackingResource.
    Intros_p Hresource.
    dump_pre_spatial.
    destruct Hresource as (_ & _ & Hstate).
    unfold CircularAreaLogicalState in Hstate.
    destruct Hstate as (_ & _ & _ & Hlogical_bounds & _).
    unfold CircularAreaFullResult in PreH1.
    destruct (Z.eq_dec (Zlength logical) area_length); congruence || lia.
  - unfold CircularAreaBackingResource.
    entailer!.
Qed.

Lemma proof_of_CircularAreaGetDataLength_return_wit_1 : CircularAreaGetDataLength_return_wit_1.
Proof.
  pre_process.
  Right.
  unfold CircularAreaDataLengthResult.
  unfold CircularAreaBackingResource.
  split_pure_spatial.
  - repeat cancel.
  - split_pures.
    + dump_pre_spatial.
      assert (Hmod :
        (writeidx - readidx + area_length) mod area_length = Zlength logical).
      {
        eapply circular_area_nonfull_mod_length__data_length_contract; eauto.
      }
      pose proof PreH4 as Hstate.
      unfold CircularAreaLogicalState in Hstate.
      destruct Hstate as
          (Hcapacity & Hread & Hwrite & Hlogical_bounds & Hphysical_length &
           Hbytes & Hwrite_equation & Hstatus_full & Hstatus_nonfull & Hlive).
      rewrite unsigned_unsigned_add_l by lia.
      assert (Hwrapped :
        0 <= writeidx - readidx + area_length < 2 ^ 32).
      {
        replace (2 ^ 32) with 4294967296 by reflexivity.
        lia.
      }
      rewrite unsigned_last_nbits_eq by exact Hwrapped.
      rewrite Z.rem_mod by lia.
      rewrite Z.sgn_pos by lia.
      rewrite !Z.abs_eq by lia.
      lia.
    + dump_pre_spatial.
      unfold CircularAreaLogicalState in PreH4.
      destruct PreH4 as
          (Hcapacity & Hread & Hwrite & Hlogical_bounds & Hphysical_length &
           Hbytes & Hwrite_equation & Hstatus_full & Hstatus_nonfull & Hlive).
      repeat split; try assumption; lia.
Qed.

Lemma proof_of_CircularAreaGetDataLength_return_wit_2 : CircularAreaGetDataLength_return_wit_2.
Proof.
  pre_process.
  Right.
  unfold CircularAreaDataLengthResult.
  unfold CircularAreaBackingResource.
  entailer!.
Qed.

Lemma proof_of_CircularAreaGetDataLength_return_wit_3 : CircularAreaGetDataLength_return_wit_3.
Proof.
  pre_process.
  Left.
  unfold CircularAreaErrorResult.
  entailer!.
Qed.

Lemma proof_of_CircularAreaGetDataLength_return_wit_4 : CircularAreaGetDataLength_return_wit_4.
Proof.
  pre_process.
  Left.
  unfold CircularAreaErrorResult.
  unfold CircularAreaBackingResource.
  entailer!.
Qed.
