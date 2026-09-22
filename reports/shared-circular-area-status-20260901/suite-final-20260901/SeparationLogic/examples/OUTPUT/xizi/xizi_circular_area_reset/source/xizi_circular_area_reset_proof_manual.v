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
  pre_process.
  subst circular_area_pre_p_tail_2.
  Exists 0 (data_buffer0 + area_length0) 0 0.
  split_pure_spatial.
  - entailer!.
  - split_pures.
    all: try entailer!.
    unfold CircularAreaLogicalState in *.
    destruct PreH3 as
      (Hcap & Hread & Hwrite & Hlogical_length & Hphysical_length &
       Hbytes & Hwrite_position & Hstatus & Hfull & Hempty & Hlive).
    rewrite Zlength_nil in *.
    repeat split; simpl in *; try assumption; try constructor; try lia.
    unfold CircularAreaLiveBytes.
    intros k Hk.
    rewrite Zlength_nil in Hk.
    lia.
Qed.
