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
From SimpleC.EE.INPUT.xizi.xizi_double_link_empty Require Import xizi_double_link_empty_goal.
From SimpleC.EE.INPUT.xizi.xizi_double_link_empty Require Import xizi_double_link_empty_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
Require Import SimpleC.EE.INPUT.xizi.xizi_double_link_empty.xizi_double_link_empty_lib.
Local Open Scope sac.

Lemma proof_of_xizi_double_link_empty_entail_wit_1 : xizi_double_link_empty_entail_wit_1.
Proof.
  pre_process.
  unfold xizi_dll.
  Intros first last.
  subst linklist_pre.
  Exists last first.
  entailer!.
Qed.

Lemma proof_of_xizi_double_link_empty_return_wit_1 : xizi_double_link_empty_return_wit_1.
Proof.
  pre_process.
  prop_apply
    (xizi_dll_front_empty_iff__dll_empty_classification head first last l).
  Intros_p Hempty.
  unfold xizi_dll.
  Exists first last.
  entailer!.
  intro Hnil.
  exfalso.
  apply PreH1.
  apply (proj2 Hempty).
  exact Hnil.
Qed.

Lemma proof_of_xizi_double_link_empty_return_wit_2 : xizi_double_link_empty_return_wit_2.
Proof.
  pre_process.
  prop_apply
    (xizi_dll_front_empty_iff__dll_empty_classification head first last l).
  Intros_p Hempty.
  unfold xizi_dll.
  Exists first last.
  entailer!.
  intro Hnonnull.
  exfalso.
  apply Hnonnull.
  apply (proj1 Hempty).
  exact PreH1.
Qed.
