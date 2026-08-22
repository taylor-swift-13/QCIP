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
From SimpleC.EE.OUTPUT.xizi.xizi_circular_area_reset.source Require Import xizi_circular_area_reset_goal.
From SimpleC.EE.OUTPUT.xizi.xizi_circular_area_reset.source Require Import xizi_circular_area_reset_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
Require Import
      SimpleC.EE.OUTPUT.xizi.xizi_circular_area_reset.source.xizi_circular_area_reset_lib.
Local Open Scope sac.

Lemma proof_of_CircularAreaReset_return_wit_1 : CircularAreaReset_return_wit_1.
Proof.
  unfold CircularAreaReset_return_wit_1.
  right.
  intros operations0 area_length0 p_tail0 p_head0 data_buffer0.
  unfold CircularAreaResetPost.
  entailer!.
Qed.
