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

Lemma proof_of_DoubleLinkListGetHead_return_wit_1 : DoubleLinkListGetHead_return_wit_1.
Proof.
  right.
  pre_process.
  subst first.
  destruct nodes_general as [| node rest].
  - simpl.
    entailer!.
  - unfold xizi_dllseg, XiziDLL.dllseg.
    simpl.
    Intros next.
    Intros.
    contradiction.
Qed.

Lemma proof_of_DoubleLinkListGetHead_return_wit_2 : DoubleLinkListGetHead_return_wit_2.
Proof.
  left.
  pre_process.
  destruct nodes_general as [| node rest].
  - unfold xizi_double_link_first_value, xizi_dllseg.
    simpl.
    entailer!.
  - split_pure_spatial.
    + sep_apply_r_atomic
        (xizi_dll_close linklist_pre first last (node :: rest) PreH2).
      unfold xizi_dll_links, XiziDLL.links.
      entailer!.
    + unfold xizi_double_link_first_value, xizi_dllseg.
      simpl.
      Intros next.
      Intros.
      congruence.
Qed.

Lemma proof_of_DoubleLinkListGetHead_derive_nil_case_by_general : DoubleLinkListGetHead_derive_nil_case_by_general.
Proof.
  pre_process.
  Exists (@nil Z).
  eapply derivable1_trans.
  - apply derivable1_sepcon_emp_r.
  - apply derivable1_sepcon_mono.
    + apply derivable1_refl.
    + apply derivable1_wand_sepcon_adjoint.
  Intros retval_2.
  Exists 0.
  entailer!.
Qed.
