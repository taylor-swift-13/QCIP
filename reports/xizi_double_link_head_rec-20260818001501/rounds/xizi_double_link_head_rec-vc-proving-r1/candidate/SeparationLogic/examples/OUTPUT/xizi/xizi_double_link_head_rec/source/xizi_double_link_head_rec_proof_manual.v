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
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_head_rec.source Require Import xizi_double_link_head_rec_goal.
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_head_rec.source Require Import xizi_double_link_head_rec_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
From QCIPLib.xizi.xizi_double_link_common Require Import xizi_double_link_lib.
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_head_rec.source
      Require Import xizi_double_link_head_rec_lib.
Local Open Scope sac.

Lemma proof_of_xizi_double_link_head_rec_return_wit_1 : xizi_double_link_head_rec_return_wit_1.
Proof.
  right.
  intros linklist_pre nodes_general first last PreH1 PreH2.
  destruct nodes_general as [| node rest].
  - simpl.
    entailer!.
  - unfold xizi_dllseg, XiziDLL.dllseg.
    simpl.
    Intros next.
    Intros.
    subst first.
    contradiction.
Qed.

Lemma proof_of_xizi_double_link_head_rec_return_wit_2 : xizi_double_link_head_rec_return_wit_2.
Proof.
  left.
  intros linklist_pre nodes_general first last PreH1 PreH2.
  destruct nodes_general as [| node rest].
  - unfold xizi_dllseg, XiziDLL.dllseg.
    simpl.
    Intros.
    entailer!.
  - split_pure_spatial.
    + unfold xizi_dll, XiziDLL.dll, xizi_dll_links, XiziDLL.links.
      Exists first last.
      entailer!.
    + unfold xizi_dllseg, XiziDLL.dllseg.
      simpl.
      Intros next.
      Intros.
      subst node.
      entailer!.
Qed.

Lemma proof_of_xizi_double_link_head_rec_derive_nil_case_by_general : xizi_double_link_head_rec_derive_nil_case_by_general.
Proof.
  pre_process.
  Exists (@nil Z).
  rewrite <- sepcon_emp_equiv at 1.
  apply derivable1_sepcon_mono.
  - apply derivable1_refl.
  - rewrite <- derivable1_wand_sepcon_adjoint.
    Intros retval_2.
    Exists 0.
    unfold xizi_double_link_first_value.
    entailer!.
Qed.
