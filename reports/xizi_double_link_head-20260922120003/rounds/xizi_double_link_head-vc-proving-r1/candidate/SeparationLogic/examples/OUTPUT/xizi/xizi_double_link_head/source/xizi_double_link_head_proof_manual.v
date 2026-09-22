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
Import CRules.
From QCIPLib.xizi.xizi_double_link_common Require Import xizi_double_link_lib.
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_head.source
      Require Import xizi_double_link_head_lib.
Import DLL.
Local Open Scope sac.

Lemma proof_of_DoubleLinkListGetHead_entail_wit_1 : DoubleLinkListGetHead_entail_wit_1.
Proof.
  pre_process.
  unfold store_dll.
  Intros first last.
  Exists last first.
  entailer!.
Qed.

Lemma proof_of_DoubleLinkListGetHead_return_wit_1 : DoubleLinkListGetHead_return_wit_1.
Proof.
  pre_process.
  subst nodes_general.
  unfold store_dll.
  Exists first_out last_out.
  entailer!.
Qed.

Lemma proof_of_DoubleLinkListGetHead_return_wit_2 : DoubleLinkListGetHead_return_wit_2.
Proof.
  pre_process.
  destruct nodes_general as [| node nodes].
  - contradiction.
  - simpl [dllseg].
    Intros next.
    Intros.
    subst first_out.
    unfold store_dll.
    Exists (getPtr node) last_out.
    split_pure_spatial.
    + simpl [dllseg].
      Exists next.
      entailer!.
    + dump_pre_spatial.
      reflexivity.
Qed.

Lemma proof_of_DoubleLinkListGetHead_derive_nil_case_by_general : DoubleLinkListGetHead_derive_nil_case_by_general.
Proof.
  pre_process.
  Exists A storeA_nil_case (@nil (DL_Node A)).
  cancel (store_dll storeA_nil_case linklist_pre nil).
  apply derivable1_wand_sepcon_adjoint.
  Intros retval_2.
  Exists 0.
  entailer!.
Qed.

Lemma proof_of_IsDoubleLinkListEmpty_derive_expanded_by_general : IsDoubleLinkListEmpty_derive_expanded_by_general.
Proof.
  pre_process.
  Exists A storeA_expanded nodes_expanded.
  unfold store_dll at 1.
  Exists first_link_expanded last_link_expanded.
  cancel (dllseg storeA_expanded first_link_expanded linklist_pre
                 linklist_pre last_link_expanded nodes_expanded).
  cancel (&(linklist_pre # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr
          |-> first_link_expanded).
  cancel (&(linklist_pre # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr
          |-> last_link_expanded).
  apply derivable1_wand_sepcon_adjoint.
  Split.
  - Intros retval_2.
    Left.
    unfold store_dll.
    Intros first last.
    Exists last first 0.
    entailer!.
  - Intros retval_2.
    Right.
    unfold store_dll.
    Intros first last.
    Exists last first 1.
    entailer!.
Qed.
