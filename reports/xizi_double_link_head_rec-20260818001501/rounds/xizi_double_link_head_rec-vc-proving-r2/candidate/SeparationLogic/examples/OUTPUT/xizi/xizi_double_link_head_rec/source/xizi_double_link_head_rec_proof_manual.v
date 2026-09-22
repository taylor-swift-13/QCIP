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
  unfold xizi_double_link_head_rec_return_wit_1.
  right.
  intros linklist_pre nodes_general first last PreH1 PreH2.
  destruct nodes_general as [| node rest].
  - unfold xizi_double_link_first_value.
    simpl.
    entailer!.
  - unfold xizi_dllseg.
    simpl.
    Intros next.
    Intros.
    contradiction.
Qed.

Lemma proof_of_xizi_double_link_head_rec_return_wit_2 : xizi_double_link_head_rec_return_wit_2.
Proof.
  unfold xizi_double_link_head_rec_return_wit_2.
  left.
  intros linklist_pre nodes_general first last PreH1 PreH2.
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

Lemma proof_of_xizi_double_link_head_rec_derive_nil_case_by_general : xizi_double_link_head_rec_derive_nil_case_by_general.
Proof.
  unfold xizi_double_link_head_rec_derive_nil_case_by_general.
  intros linklist_pre.
  Exists (@nil Z).
  rewrite <- sepcon_emp_equiv at 1.
  cancel (xizi_dll linklist_pre nil).
  apply_sepcon_adjoint.
  Intros retval_2.
  Intros.
  Exists 0.
  simpl in *.
  entailer!.
Qed.
