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
Require Import xizi_circular_area_data_length_lib.
Local Open Scope sac.

Lemma proof_of_CircularAreaIsFull_return_wit_1 : CircularAreaIsFull_return_wit_1.
Proof.
  right.
  intros.
  entailer!.
  unfold CircularAreaIsFullResult.
  right.
  split; [left; exact PreH1 | reflexivity].
Qed.

Lemma proof_of_CircularAreaIsFull_return_wit_2 : CircularAreaIsFull_return_wit_2.
Proof.
  right.
  intros.
  entailer!.
  unfold CircularAreaIsFullResult.
  right.
  split; [right; exact PreH1 | reflexivity].
Qed.

Lemma proof_of_CircularAreaIsFull_return_wit_3 : CircularAreaIsFull_return_wit_3.
Proof.
  right.
  intros.
  entailer!.
  unfold CircularAreaIsFullResult.
  left.
  repeat split; assumption || reflexivity.
Qed.

Lemma proof_of_CircularAreaGetDataLength_return_wit_1 : CircularAreaGetDataLength_return_wit_1.
Proof.
  right.
  intros.
  entailer!.
  unfold CircularAreaIsFullResult in PreH1.
  unfold CircularAreaDataLengthResult.
  destruct PreH1 as [[_ [_ Hresult]] | [Hnotfull Hresult]].
  - rewrite PreH12 in Hresult.
    discriminate.
  - right.
    split; [exact Hnotfull | reflexivity].
Qed.

Lemma proof_of_CircularAreaGetDataLength_return_wit_2 : CircularAreaGetDataLength_return_wit_2.
Proof.
  right.
  intros.
  entailer!.
  unfold CircularAreaIsFullResult in PreH1.
  unfold CircularAreaDataLengthResult.
  destruct PreH1 as [[Hindices [Hstatus Hresult]] | [_ Hresult]].
  - left.
    repeat split; assumption || reflexivity.
  - rewrite Hresult in PreH12.
    contradiction.
Qed.
