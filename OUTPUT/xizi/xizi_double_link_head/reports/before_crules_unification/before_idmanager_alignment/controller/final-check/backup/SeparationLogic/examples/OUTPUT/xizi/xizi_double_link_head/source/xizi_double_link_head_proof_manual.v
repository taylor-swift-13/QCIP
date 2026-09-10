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
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_head.source Require Import xizi_double_link_head_goal.
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_head.source Require Import xizi_double_link_head_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
From QCIPLib.xizi.xizi_double_link_common Require Import xizi_double_link_lib.
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_head.source
      Require Import xizi_double_link_head_lib.
Local Open Scope sac.

Lemma proof_of_DoubleLinkListGetHead_return_wit_1 : DoubleLinkListGetHead_return_wit_1.
Proof.
  unfold DoubleLinkListGetHead_return_wit_1.
  right.
  intros linklist_pre nodes_general first last PreH1 PreH2.
  subst first.
  destruct nodes_general as [| expected rest].
  - unfold xizi_dllseg, XiziDLL.dllseg.
    simpl.
    entailer!.
  - unfold xizi_dllseg, XiziDLL.dllseg.
    simpl.
    Intros next.
    Intros.
    congruence.
Qed.

Lemma proof_of_DoubleLinkListGetHead_return_wit_2 : DoubleLinkListGetHead_return_wit_2.
Proof.
  unfold DoubleLinkListGetHead_return_wit_2.
  left.
  intros linklist_pre nodes_general first last PreH1 PreH2.
  destruct nodes_general as [| expected rest].
  - unfold xizi_dllseg at 1.
    simpl.
    Intros.
    destruct H as [Hsame Hlast].
    contradiction.
  - unfold xizi_dllseg at 1.
    simpl.
    Intros next.
    Intros.
    subst expected.
    simpl xizi_double_link_first_value.
    entailer!.
    sep_apply_r_atomic
      (xizi_dll_nonempty_rev linklist_pre first next last rest
        PreH2 H0 PreH1).
    unfold xizi_dll_links, XiziDLL.links.
    entailer!.
Qed.

Lemma proof_of_DoubleLinkListGetHead_derive_nil_case_by_general : DoubleLinkListGetHead_derive_nil_case_by_general.
Proof.
  unfold DoubleLinkListGetHead_derive_nil_case_by_general.
  intros linklist_pre.
  Exists (@nil Z).
  simpl xizi_double_link_first_value.
  entailer!.
  apply derivable1s_emp_l_unfold.
  apply derivable1_wand_sepcon_adjoint.
  Intros retval_2.
  Exists 0.
  entailer!.
Qed.
