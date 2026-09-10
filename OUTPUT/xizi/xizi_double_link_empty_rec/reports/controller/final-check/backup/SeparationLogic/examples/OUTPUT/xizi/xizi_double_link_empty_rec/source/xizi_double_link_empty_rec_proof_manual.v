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
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_empty_rec.source Require Import xizi_double_link_empty_rec_goal.
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_empty_rec.source Require Import xizi_double_link_empty_rec_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
From QCIPLib.xizi.xizi_double_link_common Require Import xizi_double_link_lib.
Local Open Scope sac.

Lemma proof_of_IsDoubleLinkListEmpty_return_wit_1_general : IsDoubleLinkListEmpty_return_wit_1_general.
Proof.
  unfold IsDoubleLinkListEmpty_return_wit_1_general.
  left.
  intros linklist_pre nodes_general first last PreH1 PreH2.
  destruct nodes_general as [| expected rest].
  - unfold xizi_dllseg, XiziDLL.dllseg.
    simpl.
    Intros.
    intuition.
  - unfold xizi_dll, XiziDLL.dll.
    Exists first last.
    unfold XiziDLL.links.
    entailer!.
    discriminate.
Qed.

Lemma proof_of_IsDoubleLinkListEmpty_return_wit_2_general : IsDoubleLinkListEmpty_return_wit_2_general.
Proof.
  unfold IsDoubleLinkListEmpty_return_wit_2_general.
  right.
  intros linklist_pre nodes_general first last PreH1 PreH2.
  destruct nodes_general as [| expected rest].
  - entailer!.
  - unfold xizi_dllseg, XiziDLL.dllseg.
    simpl.
    Intros next.
    Intros.
    intuition.
Qed.

Lemma proof_of_IsDoubleLinkListEmpty_derive_nil_case_by_general : IsDoubleLinkListEmpty_derive_nil_case_by_general.
Proof.
  unfold IsDoubleLinkListEmpty_derive_nil_case_by_general.
  intros linklist_pre.
  Exists (@nil Z).
  assert (Hchoice :
    xizi_dll linklist_pre nil |--
      (xizi_dll linklist_pre nil || xizi_dll linklist_pre nil)).
  {
    Right.
    cancel (xizi_dll linklist_pre nil).
  }
  sep_apply_r_atomic Hchoice.
  cancel (xizi_dll linklist_pre nil).
  apply derivable1_wand_sepcon_adjoint.
  Split.
  - Intros retval_2.
    Intros.
    intuition.
  - Intros retval_2.
    Intros.
    Exists 1.
    entailer!.
Qed.
