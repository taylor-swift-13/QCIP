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
  left.
  pre_process.
  destruct nodes_general as [| expected rest].
  - unfold xizi_dllseg, XiziDLL.dllseg.
    simpl.
    Intros.
    destruct H as [Hfirst _].
    contradiction.
  - split_pure_spatial.
    + unfold xizi_dll, XiziDLL.dll, xizi_dll_links, XiziDLL.links.
      Exists first last.
      entailer!.
    + split_pures.
      * dump_pre_spatial.
        discriminate.
      * dump_pre_spatial.
        reflexivity.
Qed.

Lemma proof_of_xizi_double_link_empty_return_wit_2 : xizi_double_link_empty_return_wit_2.
Proof.
  left.
  pre_process.
  destruct nodes_general as [| expected rest].
  - split_pure_spatial.
    + unfold xizi_dll, XiziDLL.dll, xizi_dll_links, XiziDLL.links.
      Exists first last.
      entailer!.
    + split_pures.
      * dump_pre_spatial.
        reflexivity.
      * dump_pre_spatial.
        reflexivity.
  - unfold xizi_dllseg, XiziDLL.dllseg.
    simpl.
    Intros next.
    Intros.
    contradiction.
Qed.

Lemma proof_of_xizi_double_link_empty_derive_nil_case_by_general : xizi_double_link_empty_derive_nil_case_by_general.
Proof.
  pre_process.
  Exists (@nil Z).
  rewrite <- sepcon_emp_equiv at 1.
  cancel (xizi_dll linklist_pre nil).
  apply_sepcon_adjoint.
  Split.
  - Intros retval_2.
    exfalso.
    apply H.
    reflexivity.
  - Intros retval_2.
    Exists 1.
    split_pure_spatial.
    + entailer!.
    + dump_pre_spatial.
      reflexivity.
Qed.
