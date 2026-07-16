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
From QCIPCases.SAMCodeSynthesis.CheckCal08 Require Import IP_CheckCal08_goal.
From QCIPCases.SAMCodeSynthesis.CheckCal08 Require Import IP_CheckCal08_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
Require Import QCIPLib.SAMCodeSynthesis.CheckCal08.IP_CheckCal08_lib.
Local Open Scope sac.

Lemma proof_of_CheckCal08Fun_safety_wit_3_split_goal_1 : CheckCal08Fun_safety_wit_3_split_goal_1.
Proof.
  unfold CheckCal08Fun_safety_wit_3_split_goal_1. intros.
  pre_process_default.
  prop_apply (valid_store_uchar ((&((pIp)  # "__CheckCal08" ->ₛ "chksum"))) chksum).
  Intros.
  sep_apply_l_atomic (UCharArray.full_split_to_missing_i pkv_addr i len pkv_list 0).
  - dump_pre_spatial. lia.
  - prop_apply (valid_store_uchar (pkv_addr + i * sizeof ( UCHAR )) (Znth i pkv_list 0)).
    Intros.
    apply derivable1s_coq_prop_r.
    destruct H as [Hchksum _].
    destruct H0 as [Hrange _].
    unfold CheckCal08Inv in PreH4.
    destruct PreH4 as [_ [_ Hsum]].
    assert (Hchksum_range: 0 <= chksum <= 255).
    { rewrite Hsum. apply sum_mod256_range. }
    unfold Byte.max_unsigned, Byte.modulus, Byte.wordsize in *.
    simpl in *. lia.
Qed.

Lemma proof_of_CheckCal08Fun_safety_wit_3_split_goal_2 : CheckCal08Fun_safety_wit_3_split_goal_2.
Proof.
  unfold CheckCal08Fun_safety_wit_3_split_goal_2. intros.
  pre_process_default.
  prop_apply (valid_store_uchar ((&((pIp)  # "__CheckCal08" ->ₛ "chksum"))) chksum).
  Intros.
  sep_apply_l_atomic (UCharArray.full_split_to_missing_i pkv_addr i len pkv_list 0).
  - dump_pre_spatial. lia.
  - prop_apply (valid_store_uchar (pkv_addr + i * sizeof ( UCHAR )) (Znth i pkv_list 0)).
    Intros.
    apply derivable1s_coq_prop_r.
    destruct H as [Hchksum _].
    destruct H0 as [Hrange _].
    unfold CheckCal08Inv in PreH4.
    destruct PreH4 as [_ [_ Hsum]].
    assert (Hchksum_range: 0 <= chksum <= 255).
    { rewrite Hsum. apply sum_mod256_range. }
    unfold Byte.max_unsigned, Byte.modulus, Byte.wordsize in *.
    simpl in *. lia.
Qed.

Lemma proof_of_CheckCal08Fun_safety_wit_3 : CheckCal08Fun_safety_wit_3.
Proof.
  unfold CheckCal08Fun_safety_wit_3.
  left. intros.
  apply _derivable1_andp_intros.
  - pose proof (proof_of_CheckCal08Fun_safety_wit_3_split_goal_1 pkv_addr len pkv_list pIp chksum i PreH1 PreH2 PreH3 PreH4) as H.
    exact H.
  - pose proof (proof_of_CheckCal08Fun_safety_wit_3_split_goal_2 pkv_addr len pkv_list pIp chksum i PreH1 PreH2 PreH3 PreH4) as H.
    exact H.
Qed. 

Lemma proof_of_CheckCal08Fun_entail_wit_1_split_goal_1 : CheckCal08Fun_entail_wit_1_split_goal_1.
Proof.
  unfold CheckCal08Fun_entail_wit_1_split_goal_1. intros.
  apply CheckCal08Inv_init; auto.
Qed.

Lemma proof_of_CheckCal08Fun_entail_wit_1 : CheckCal08Fun_entail_wit_1.
Proof.
  unfold CheckCal08Fun_entail_wit_1.
  right. intros.
  apply _derivable1_andp_intros.
  - apply derivable1s_coq_prop_r. apply proof_of_CheckCal08Fun_entail_wit_1_split_goal_1; auto.
  - entailer!.
Qed. 

Lemma proof_of_CheckCal08Fun_entail_wit_2_split_goal_1 : CheckCal08Fun_entail_wit_2_split_goal_1.
Proof.
  unfold CheckCal08Fun_entail_wit_2_split_goal_1. intros.
  unfold unsigned_last_nbits.
  apply CheckCal08Inv_step; auto.
Qed.

Lemma proof_of_CheckCal08Fun_entail_wit_2 : CheckCal08Fun_entail_wit_2.
Proof.
  unfold CheckCal08Fun_entail_wit_2.
  right. intros.
  apply _derivable1_andp_intros.
  - apply derivable1s_coq_prop_r. apply proof_of_CheckCal08Fun_entail_wit_2_split_goal_1; auto.
  - entailer!.
Qed. 

Lemma proof_of_CheckCal08Fun_return_wit_1 : CheckCal08Fun_return_wit_1.
Proof.
  unfold CheckCal08Fun_return_wit_1.
  left. intros.
  Exists chksum.
  apply _derivable1_andp_intros.
  - apply derivable1s_coq_prop_r.
    apply (CheckCal08Inv_implies_post _ _ i _); auto.
    lia.
  - entailer!.
Qed. 

