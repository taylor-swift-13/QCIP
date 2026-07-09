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
From QCIPCases.xizi.xizi_circular_area_force_write Require Import xizi_circular_area_force_write_goal.
From QCIPCases.xizi.xizi_circular_area_force_write Require Import xizi_circular_area_force_write_proof_auto.
From QCIPLib.xizi.xizi_circular_area_common Require Import xizi_circular_area_lib.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
Local Open Scope sac.

Lemma proof_of_xizi_circular_area_force_write_return_wit_1 : xizi_circular_area_force_write_return_wit_1.
Proof.
  pre_process.
  set (w := Z.rem (Znth 1 l 0 + data_length_pre) area_length_pre).
  Exists (replace_Znth 0 w
    (replace_Znth 2 1
      (replace_Znth 1 w l))).
  entailer!.
  - intros Hforce.
    repeat rewrite Zlength_replace_Znth in *.
    try rewrite (xizi_Znth_replace_Znth_same 0 w 0
      (replace_Znth 2 1 (replace_Znth 1 w l)))
      by (rewrite ?Zlength_replace_Znth in *; lia).
    try rewrite (xizi_Znth_replace_Znth_diff 1 0 w 0
      (replace_Znth 2 1 (replace_Znth 1 w l)))
      by (rewrite ?Zlength_replace_Znth in *; lia).
    try rewrite (xizi_Znth_replace_Znth_diff 1 2 1 0
      (replace_Znth 1 w l))
      by (rewrite ?Zlength_replace_Znth in *; lia).
    try rewrite (xizi_Znth_replace_Znth_same 1 w 0 l) by lia.
    reflexivity.
  - repeat rewrite Zlength_replace_Znth in *.
    try rewrite (xizi_Znth_replace_Znth_diff 2 0 w 0
      (replace_Znth 2 1 (replace_Znth 1 w l)))
      by (rewrite ?Zlength_replace_Znth in *; lia).
    try rewrite (xizi_Znth_replace_Znth_same 2 1 0
      (replace_Znth 1 w l))
      by (rewrite ?Zlength_replace_Znth in *; lia).
    reflexivity.
  - intro Heq.
    repeat rewrite Zlength_replace_Znth in *.
    try rewrite (xizi_Znth_replace_Znth_diff 1 0 w 0
      (replace_Znth 2 1 (replace_Znth 1 w l)))
      by (rewrite ?Zlength_replace_Znth in *; lia).
    try rewrite (xizi_Znth_replace_Znth_diff 1 2 1 0
      (replace_Znth 1 w l))
      by (rewrite ?Zlength_replace_Znth in *; lia).
    try rewrite (xizi_Znth_replace_Znth_same 1 w 0 l) by lia.
    unfold w.
    rewrite Heq.
    rewrite Z.rem_same by lia.
    reflexivity.
  - intro Hlt.
    repeat rewrite Zlength_replace_Znth in *.
    try rewrite (xizi_Znth_replace_Znth_diff 1 0 w 0
      (replace_Znth 2 1 (replace_Znth 1 w l)))
      by (rewrite ?Zlength_replace_Znth in *; lia).
    try rewrite (xizi_Znth_replace_Znth_diff 1 2 1 0
      (replace_Znth 1 w l))
      by (rewrite ?Zlength_replace_Znth in *; lia).
    try rewrite (xizi_Znth_replace_Znth_same 1 w 0 l) by lia.
    unfold w.
    rewrite Z.rem_small by lia.
    reflexivity.
  - repeat rewrite Zlength_replace_Znth in *.
    try rewrite (xizi_Znth_replace_Znth_diff 1 0 w 0
      (replace_Znth 2 1 (replace_Znth 1 w l)))
      by (rewrite ?Zlength_replace_Znth in *; lia).
    try rewrite (xizi_Znth_replace_Znth_diff 1 2 1 0
      (replace_Znth 1 w l))
      by (rewrite ?Zlength_replace_Znth in *; lia).
    try rewrite (xizi_Znth_replace_Znth_same 1 w 0 l) by lia.
    unfold w.
    pose proof (Z.rem_bound_pos
      (Znth 1 l 0 + data_length_pre) area_length_pre ltac:(lia) ltac:(lia)).
    lia.
  - repeat rewrite Zlength_replace_Znth in *.
    try rewrite (xizi_Znth_replace_Znth_diff 1 0 w 0
      (replace_Znth 2 1 (replace_Znth 1 w l)))
      by (rewrite ?Zlength_replace_Znth in *; lia).
    try rewrite (xizi_Znth_replace_Znth_diff 1 2 1 0
      (replace_Znth 1 w l))
      by (rewrite ?Zlength_replace_Znth in *; lia).
    try rewrite (xizi_Znth_replace_Znth_same 1 w 0 l) by lia.
    unfold w.
    pose proof (Z.rem_bound_pos
      (Znth 1 l 0 + data_length_pre) area_length_pre ltac:(lia) ltac:(lia)).
    lia.
  - repeat rewrite Zlength_replace_Znth in *.
    lia.
Qed.

Lemma proof_of_xizi_circular_area_force_write_return_wit_2 : xizi_circular_area_force_write_return_wit_2.
Proof.
  pre_process.
  set (w := data_length_pre - (area_length_pre - Znth 1 l 0)).
  Exists (replace_Znth 0 w
    (replace_Znth 2 1
      (replace_Znth 1 w l))).
  entailer!.
  - intros Hforce.
    repeat rewrite Zlength_replace_Znth in *.
    try rewrite (xizi_Znth_replace_Znth_same 0 w 0
      (replace_Znth 2 1 (replace_Znth 1 w l)))
      by (rewrite ?Zlength_replace_Znth in *; lia).
    try rewrite (xizi_Znth_replace_Znth_diff 1 0 w 0
      (replace_Znth 2 1 (replace_Znth 1 w l)))
      by (rewrite ?Zlength_replace_Znth in *; lia).
    try rewrite (xizi_Znth_replace_Znth_diff 1 2 1 0
      (replace_Znth 1 w l))
      by (rewrite ?Zlength_replace_Znth in *; lia).
    try rewrite (xizi_Znth_replace_Znth_same 1 w 0 l) by lia.
    lia.
  - repeat rewrite Zlength_replace_Znth in *.
    try rewrite (xizi_Znth_replace_Znth_diff 2 0 w 0
      (replace_Znth 2 1 (replace_Znth 1 w l)))
      by (rewrite ?Zlength_replace_Znth in *; lia).
    try rewrite (xizi_Znth_replace_Znth_same 2 1 0
      (replace_Znth 1 w l))
      by (rewrite ?Zlength_replace_Znth in *; lia).
    reflexivity.
  - intro Hgt.
    repeat rewrite Zlength_replace_Znth in *.
    try rewrite (xizi_Znth_replace_Znth_diff 1 0 w 0
      (replace_Znth 2 1 (replace_Znth 1 w l)))
      by (rewrite ?Zlength_replace_Znth in *; lia).
    try rewrite (xizi_Znth_replace_Znth_diff 1 2 1 0
      (replace_Znth 1 w l))
      by (rewrite ?Zlength_replace_Znth in *; lia).
    try rewrite (xizi_Znth_replace_Znth_same 1 w 0 l) by lia.
    unfold w.
    lia.
  - repeat rewrite Zlength_replace_Znth in *.
    try rewrite (xizi_Znth_replace_Znth_diff 1 0 w 0
      (replace_Znth 2 1 (replace_Znth 1 w l)))
      by (rewrite ?Zlength_replace_Znth in *; lia).
    try rewrite (xizi_Znth_replace_Znth_diff 1 2 1 0
      (replace_Znth 1 w l))
      by (rewrite ?Zlength_replace_Znth in *; lia).
    try rewrite (xizi_Znth_replace_Znth_same 1 w 0 l) by lia.
    unfold w.
    lia.
  - repeat rewrite Zlength_replace_Znth in *.
    try rewrite (xizi_Znth_replace_Znth_diff 1 0 w 0
      (replace_Znth 2 1 (replace_Znth 1 w l)))
      by (rewrite ?Zlength_replace_Znth in *; lia).
    try rewrite (xizi_Znth_replace_Znth_diff 1 2 1 0
      (replace_Znth 1 w l))
      by (rewrite ?Zlength_replace_Znth in *; lia).
    try rewrite (xizi_Znth_replace_Znth_same 1 w 0 l) by lia.
    unfold w.
    lia.
  - repeat rewrite Zlength_replace_Znth in *.
    lia.
Qed.

Lemma proof_of_xizi_circular_area_force_write_return_wit_3 : xizi_circular_area_force_write_return_wit_3.
Proof.
  pre_process.
  set (w := Z.rem (Znth 1 l 0 + data_length_pre) area_length_pre).
  Exists (replace_Znth 2 1
    (replace_Znth 1 w l)).
  entailer!.
  - intros Hforce_zero.
    repeat rewrite Zlength_replace_Znth in *.
    try rewrite (xizi_Znth_replace_Znth_diff 0 2 1 0
      (replace_Znth 1 w l))
      by (rewrite ?Zlength_replace_Znth in *; lia).
    try rewrite (xizi_Znth_replace_Znth_diff 0 1 w 0 l)
      by lia.
    reflexivity.
  - repeat rewrite Zlength_replace_Znth in *.
    try rewrite (xizi_Znth_replace_Znth_same 2 1 0
      (replace_Znth 1 w l))
      by (rewrite ?Zlength_replace_Znth in *; lia).
    reflexivity.
  - intro Heq.
    repeat rewrite Zlength_replace_Znth in *.
    try rewrite (xizi_Znth_replace_Znth_diff 1 2 1 0
      (replace_Znth 1 w l))
      by (rewrite ?Zlength_replace_Znth in *; lia).
    try rewrite (xizi_Znth_replace_Znth_same 1 w 0 l) by lia.
    unfold w.
    rewrite Heq.
    rewrite Z.rem_same by lia.
    reflexivity.
  - intro Hlt.
    repeat rewrite Zlength_replace_Znth in *.
    try rewrite (xizi_Znth_replace_Znth_diff 1 2 1 0
      (replace_Znth 1 w l))
      by (rewrite ?Zlength_replace_Znth in *; lia).
    try rewrite (xizi_Znth_replace_Znth_same 1 w 0 l) by lia.
    unfold w.
    rewrite Z.rem_small by lia.
    reflexivity.
  - repeat rewrite Zlength_replace_Znth in *.
    try rewrite (xizi_Znth_replace_Znth_diff 1 2 1 0
      (replace_Znth 1 w l))
      by (rewrite ?Zlength_replace_Znth in *; lia).
    try rewrite (xizi_Znth_replace_Znth_same 1 w 0 l) by lia.
    unfold w.
    pose proof (Z.rem_bound_pos
      (Znth 1 l 0 + data_length_pre) area_length_pre ltac:(lia) ltac:(lia)).
    lia.
  - repeat rewrite Zlength_replace_Znth in *.
    try rewrite (xizi_Znth_replace_Znth_diff 1 2 1 0
      (replace_Znth 1 w l))
      by (rewrite ?Zlength_replace_Znth in *; lia).
    try rewrite (xizi_Znth_replace_Znth_same 1 w 0 l) by lia.
    unfold w.
    pose proof (Z.rem_bound_pos
      (Znth 1 l 0 + data_length_pre) area_length_pre ltac:(lia) ltac:(lia)).
    lia.
  - repeat rewrite Zlength_replace_Znth in *.
    lia.
Qed.

Lemma proof_of_xizi_circular_area_force_write_return_wit_4 : xizi_circular_area_force_write_return_wit_4.
Proof.
  pre_process.
  set (w := data_length_pre - (area_length_pre - Znth 1 l 0)).
  Exists (replace_Znth 2 1
    (replace_Znth 1 w l)).
  entailer!.
  - intros Hforce_zero.
    repeat rewrite Zlength_replace_Znth in *.
    try rewrite (xizi_Znth_replace_Znth_diff 0 2 1 0
      (replace_Znth 1 w l))
      by (rewrite ?Zlength_replace_Znth in *; lia).
    try rewrite (xizi_Znth_replace_Znth_diff 0 1 w 0 l)
      by lia.
    reflexivity.
  - repeat rewrite Zlength_replace_Znth in *.
    try rewrite (xizi_Znth_replace_Znth_same 2 1 0
      (replace_Znth 1 w l))
      by (rewrite ?Zlength_replace_Znth in *; lia).
    reflexivity.
  - intro Hgt.
    repeat rewrite Zlength_replace_Znth in *.
    try rewrite (xizi_Znth_replace_Znth_diff 1 2 1 0
      (replace_Znth 1 w l))
      by (rewrite ?Zlength_replace_Znth in *; lia).
    try rewrite (xizi_Znth_replace_Znth_same 1 w 0 l) by lia.
    unfold w.
    lia.
  - repeat rewrite Zlength_replace_Znth in *.
    try rewrite (xizi_Znth_replace_Znth_diff 1 2 1 0
      (replace_Znth 1 w l))
      by (rewrite ?Zlength_replace_Znth in *; lia).
    try rewrite (xizi_Znth_replace_Znth_same 1 w 0 l) by lia.
    unfold w.
    lia.
  - repeat rewrite Zlength_replace_Znth in *.
    try rewrite (xizi_Znth_replace_Znth_diff 1 2 1 0
      (replace_Znth 1 w l))
      by (rewrite ?Zlength_replace_Znth in *; lia).
    try rewrite (xizi_Znth_replace_Znth_same 1 w 0 l) by lia.
    unfold w.
    lia.
  - repeat rewrite Zlength_replace_Znth in *.
    lia.
Qed.
