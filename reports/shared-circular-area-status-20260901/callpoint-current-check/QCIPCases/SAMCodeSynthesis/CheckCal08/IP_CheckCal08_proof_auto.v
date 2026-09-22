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
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
Require Import QCIPLib.SAMCodeSynthesis.CheckCal08.IP_CheckCal08_lib.
Local Open Scope sac.

Lemma proof_of_CheckCal08Fun_safety_wit_1 : CheckCal08Fun_safety_wit_1.
Proof.
  unfold CheckCal08Fun_safety_wit_1. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_CheckCal08Fun_safety_wit_2 : CheckCal08Fun_safety_wit_2.
Proof.
  unfold CheckCal08Fun_safety_wit_2. intros.
  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.
Qed.

Lemma proof_of_CheckCal08Fun_partial_solve_wit_1 : CheckCal08Fun_partial_solve_wit_1.
Proof.
  unfold CheckCal08Fun_partial_solve_wit_1. intros.
  sep_apply_l_atomic (UCharArray.full_split_to_missing_i pkv_addr i len pkv_list 0).
  - dump_pre_spatial. lia.
  - entailer!.
Qed.

