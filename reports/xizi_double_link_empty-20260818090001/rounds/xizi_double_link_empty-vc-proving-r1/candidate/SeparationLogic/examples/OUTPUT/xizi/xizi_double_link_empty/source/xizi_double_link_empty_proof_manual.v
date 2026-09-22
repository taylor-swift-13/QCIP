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
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_empty.source Require Import xizi_double_link_empty_goal.
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_empty.source Require Import xizi_double_link_empty_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
From QCIPLib.xizi.xizi_double_link_common Require Import xizi_double_link_lib.
Local Open Scope sac.

Lemma proof_of_xizi_double_link_empty_return_wit_1 : xizi_double_link_empty_return_wit_1.
Proof.
  pre_process.
  destruct nodes_general as [| node rest].
  - unfold xizi_dllseg, XiziDLL.dllseg.
    simpl.
    Intros.
    destruct H as [Hfirst _].
    contradiction.
  - split_pure_spatial.
    + sep_apply_r_atomic
        (xizi_dll_close linklist_pre first last (node :: rest) PreH2).
      entailer!.
    + entailer!.
      discriminate.
Qed.

Lemma proof_of_xizi_double_link_empty_return_wit_2 : xizi_double_link_empty_return_wit_2.
Proof.
  pre_process.
  destruct nodes_general as [| node rest].
  - unfold xizi_dllseg, XiziDLL.dllseg.
    simpl.
    Intros.
    destruct H as [Hfirst Hlast].
    subst first; subst last.
    split_pure_spatial.
    + unfold xizi_dll_links, XiziDLL.links in *.
      sep_apply_r_atomic (xizi_dll_empty_rev linklist_pre PreH2).
      entailer!.
    + entailer!.
  - unfold xizi_dllseg, XiziDLL.dllseg.
    simpl.
    Intros next.
    Intros.
    subst first.
    contradiction.
Qed.

Lemma proof_of_xizi_double_link_empty_derive_nil_case_by_general : xizi_double_link_empty_derive_nil_case_by_general.
Proof.
  pre_process.
  Exists (@nil Z).
  rewrite <- sepcon_emp_equiv at 1.
  apply derivable1_sepcon_mono.
  - apply derivable1_refl.
  - rewrite <- derivable1_wand_sepcon_adjoint.
    Split.
    + Intros retval_2.
      Intros.
      contradiction.
    + Intros retval_2.
      Intros.
      Exists 1.
      entailer!.
Qed.
