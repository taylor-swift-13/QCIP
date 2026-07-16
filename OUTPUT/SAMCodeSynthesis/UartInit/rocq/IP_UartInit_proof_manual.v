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
From QCIPCases.SAMCodeSynthesis.UartInit Require Import IP_UartInit_goal.
From QCIPCases.SAMCodeSynthesis.UartInit Require Import IP_UartInit_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
Require Import QCIPLib.SAMCodeSynthesis.UartInit.IP_UartInit_lib.
Local Open Scope sac.

Lemma proof_of_UartInitFun_return_wit_1_split_goal_1 :
  UartInitFun_return_wit_1_split_goal_1.
Proof.
  unfold UartInitFun_return_wit_1_split_goal_1.
  intros. unfold UartInitPost. exact I.
Qed.

Lemma proof_of_UartInitFun_return_wit_1 : UartInitFun_return_wit_1.
Proof.
  unfold UartInitFun_return_wit_1.
  left. intros.
  apply _derivable1_andp_intros.
  - apply derivable1s_coq_prop_r.
    apply proof_of_UartInitFun_return_wit_1_split_goal_1.
  - entailer!.
Qed.

