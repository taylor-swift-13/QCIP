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
From SimpleC.EE.OUTPUT.xizi.xizi_circular_area_init.source Require Import xizi_circular_area_init_goal.
From SimpleC.EE.OUTPUT.xizi.xizi_circular_area_init.source Require Import xizi_circular_area_init_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
Require Import
      SimpleC.EE.OUTPUT.xizi.xizi_circular_area_init.source.xizi_circular_area_init_lib.
Local Open Scope sac.

Lemma proof_of_CircularAreaInit_return_wit_1 : CircularAreaInit_return_wit_1.
Proof.
  right.
  intros.
  pre_process.
  assert (Halign :
    unsigned_last_nbits ((circular_area_length_pre ÷ 4) * 4) 32 =
      (circular_area_length_pre ÷ 4) * 4).
  { apply unsigned_last_nbits_eq.
    apply CircularArea_div4_aligned_range__init_return_branches;
      lia. }
  unfold CircularAreaInitDescriptorState, CircularAreaAlignedLength.
  entailer!.
  rewrite Halign, Z.quot_div_nonneg, PreH9 by lia.
  reflexivity.
Qed.

Lemma proof_of_CircularAreaInit_return_wit_2 : CircularAreaInit_return_wit_2.
Proof.
  intros.
  pre_process.
  assert (Halign :
    unsigned_last_nbits ((circular_area_length_pre ÷ 4) * 4) 32 =
      (circular_area_length_pre ÷ 4) * 4).
  { apply unsigned_last_nbits_eq.
    apply CircularArea_div4_aligned_range__init_return_branches;
      lia. }
  Left.
  Left.
  Exists circular_area_callee_b_status circular_area_callee_writeidx
    circular_area_callee_readidx retval_2 retval
    (unsigned_last_nbits ((circular_area_length_pre ÷ 4) * 4) 32).
  unfold CircularAreaInitLeakedDescriptorState, CircularAreaAlignedLength.
  entailer!.
  rewrite Halign, Z.quot_div_nonneg, PreH9 by lia.
  reflexivity.
Qed.

Lemma proof_of_CircularAreaInit_return_wit_3 : CircularAreaInit_return_wit_3.
Proof.
  intros.
  pre_process.
  assert (Halign :
    unsigned_last_nbits ((circular_area_length_pre ÷ 4) * 4) 32 =
      (circular_area_length_pre ÷ 4) * 4).
  { apply unsigned_last_nbits_eq.
    apply CircularArea_div4_aligned_range__init_return_branches;
      lia. }
  Right.
  Exists (unsigned_last_nbits ((circular_area_length_pre ÷ 4) * 4) 32).
  unfold CircularAreaAlignedLength.
  entailer!.
  rewrite Halign, Z.quot_div_nonneg, PreH4 by lia.
  reflexivity.
Qed.
