Require Import Coq.Lists.List.
Require Import Coq.ZArith.ZArith.
Require Import Coq.micromega.Lia.
Require Import AUXLib.ListLib.
From SimpleC.SL Require Import Mem SeparationLogic.
Require Import Logic.LogicGenerator.demo932.Interface.
Require Export
  QCIPLib.xizi.xizi_circular_area_common.xizi_circular_area_lib.

Import ListNotations.
Import naive_C_Rules.
Local Open Scope Z_scope.
Local Open Scope sac.

Lemma CircularArea_div4_aligned_range__init_return_branches :
  forall requested : Z,
    0 < requested ->
    requested <= 4294967295 ->
    0 <= (requested ÷ 4) * 4 < 2 ^ 32.
Proof.
  intros requested Hpos Hmax.
  replace (2 ^ 32) with 4294967296 by reflexivity.
  pose proof (Z.mul_quot_le requested 4 ltac:(lia) ltac:(lia)) as Hquot.
  lia.
Qed.

Require Import Coq.ZArith.Zquot.
Lemma CircularArea_quot_eq_div_nonneg__init_return_branch_construction :
  forall requested : Z,
    0 <= requested ->
    requested ÷ 4 = requested / 4.
Proof.
  intros requested Hnonneg.
  apply Zquot_Zdiv_pos; lia.
Qed.
