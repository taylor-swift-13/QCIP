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
  pre_process.
  split_pure_spatial.
  - sep_apply_r_atomic (xizi_dll_close linklist_pre first last nodes_general PreH2).
    unfold xizi_dll_links, XiziDLL.links.
    entailer!.
  - split_pures.
    + destruct nodes_general as [| node rest].
      * unfold xizi_dllseg, XiziDLL.dllseg.
        simpl.
        Intros.
        dump_pre_spatial.
        destruct H as [Hfirst _].
        contradiction.
      * dump_pre_spatial.
        discriminate.
    + dump_pre_spatial.
      reflexivity.
Qed.

Lemma proof_of_IsDoubleLinkListEmpty_return_wit_2_general : IsDoubleLinkListEmpty_return_wit_2_general.
Proof.
  pre_process.
  split_pure_spatial.
  - sep_apply_r_atomic (xizi_dll_close linklist_pre first last nodes_general PreH2).
    unfold xizi_dll_links, XiziDLL.links.
    entailer!.
  - split_pures.
    + destruct nodes_general as [| node rest].
      * dump_pre_spatial.
        reflexivity.
      * unfold xizi_dllseg, XiziDLL.dllseg.
        simpl.
        Intros next.
        Intros.
        dump_pre_spatial.
        contradiction.
    + dump_pre_spatial.
      reflexivity.
Qed.

Lemma proof_of_IsDoubleLinkListEmpty_derive_nil_case_by_general : IsDoubleLinkListEmpty_derive_nil_case_by_general.
Proof.
  pre_process.
  Exists (@nil Z).
  rewrite <- sepcon_emp_equiv at 1.
  apply derivable1_sepcon_mono.
  - Left.
    apply derivable1_refl.
  - rewrite <- derivable1_wand_sepcon_adjoint.
    entailer!.
    Split.
    + Intros retval_2.
      contradiction.
    + Intros retval_2.
      Exists 1.
      entailer!.
Qed.
