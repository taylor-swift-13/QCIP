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
From SimpleC.EE.OUTPUT.xizi.xizi_circular_area_read_advance.source Require Import xizi_circular_area_read_advance_goal.
From SimpleC.EE.OUTPUT.xizi.xizi_circular_area_read_advance.source Require Import xizi_circular_area_read_advance_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
From SimpleC.EE.OUTPUT.xizi.xizi_circular_area_read_advance.source Require Import xizi_circular_area_read_advance_lib.
Local Open Scope sac.

Lemma proof_of_CircularAreaDivideRdData_return_wit_1 : CircularAreaDivideRdData_return_wit_1.
Proof.
  aggressive_pre_process.
  unfold CircularAreaDescriptorState in PreH7.
  destruct PreH7 as (Hread & Hwrite & Harea & Hbstatus & Hlen).
  assert (Hread32 : unsigned_last_nbits readidx 32 = readidx).
  { apply unsigned_last_nbits_eq. lia. }
  assert (Hsum32 : unsigned_last_nbits (readidx + data_length_pre) 32 =
                   readidx + data_length_pre).
  { apply unsigned_last_nbits_eq. lia. }
  rewrite Hread32, Hsum32 in PreH1.
  unfold CircularAreaDivideRdDataResult.
  entailer!.
Qed.

Lemma proof_of_CircularAreaDivideRdData_return_wit_2 : CircularAreaDivideRdData_return_wit_2.
Proof.
  aggressive_pre_process.
  unfold CircularAreaDescriptorState in PreH7.
  destruct PreH7 as (Hread & Hwrite & Harea & Hbstatus & Hlen).
  assert (Hread32 : unsigned_last_nbits readidx 32 = readidx).
  { apply unsigned_last_nbits_eq. lia. }
  assert (Hsum32 : unsigned_last_nbits (readidx + data_length_pre) 32 =
                   readidx + data_length_pre).
  { apply unsigned_last_nbits_eq. lia. }
  rewrite Hread32, Hsum32 in PreH1.
  unfold CircularAreaDivideRdDataResult.
  entailer!.
Qed.
