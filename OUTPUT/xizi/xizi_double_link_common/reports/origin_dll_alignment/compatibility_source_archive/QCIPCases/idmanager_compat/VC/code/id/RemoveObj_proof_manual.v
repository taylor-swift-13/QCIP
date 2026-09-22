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
From QCIPCases.idmanager_compat.VC.code.id Require Import RemoveObj_goal.
From QCIPCases.idmanager_compat.VC.code.id Require Import RemoveObj_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
From AUXLib Require Import int_auto Axioms Feq Idents ListLib VMap.
Require Import SetsClass.SetsClass. Import SetsNotation.
From SimpleC.SL Require Import Mem SeparationLogic MapLib.
Require Import Logic.LogicGenerator.demo932.Interface.
Import CRules.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string.
Local Open Scope list.
Import ListNotations.
Require Import SimpleC.SL.ConAssertion SimpleC.SL.CriticalSTS SimpleC.SL.NestedCriticalSTS.
From MonadLib.StateRelMonad Require Export StateRelMonad.
Export MonadNotation.
Local Open Scope sac.
Local Open Scope monad.
Require Import QCIPCases.idmanager_compat.lib.idnode.
Import DLL.
Import IDNode.
Local Open Scope sac.

Lemma proof_of_RemoveObj_return_wit_1_split_goal_spatial : RemoveObj_return_wit_1_split_goal_spatial.
Proof. Abort.

Lemma proof_of_RemoveObj_return_wit_1 : RemoveObj_return_wit_1.
Proof.
  unfold RemoveObj_return_wit_1.
  left; intros; subst; simpl in *.
  rewrite Z.rem_mod_nonneg in * by (unfold idbuckets_ok in PreH4; lia).
  unfold store_idmanager_removeobj_post, store_idmanager.
  Exists id_map htable.
  entailer!.
  unfold idmanager_remove, store_id_map, store_uchar_array, idmanager_remove_bucket; simpl.
  Exists bytes.
  entailer!.
  rewrite Z.quot_div_nonneg by (unfold id_map_bytes_ok in PreH3; lia).
  entailer!.
  sep_apply (store_idbuckets_replace (m.(storeA)) htable (m.(hoffset))
    (id mod m.(hoffset))
    (Znth (id mod m.(hoffset)) m.(idbuckets) nil)
    (idlist_remove id (Znth (id mod m.(hoffset)) m.(idbuckets) nil))
    (m.(idbuckets))
    (prefix ++ suffix));
    [ entailer!
    | symmetry; exact PreH8
    | reflexivity
    | apply Z.mod_pos_bound; unfold idbuckets_ok in PreH4; lia ].
  sep_apply (store_ptr_undef_store_ptr
    (&( idnode_pre # "IdNode" ->ₛ "link" .ₛ "node_next"))
    (&( idnode_pre # "IdNode" ->ₛ "link"))).
  sep_apply (store_ptr_undef_store_ptr
    (&( idnode_pre # "IdNode" ->ₛ "link" .ₛ "node_prev"))
    (&( idnode_pre # "IdNode" ->ₛ "link"))).
  entailer!.
Qed. 

Lemma proof_of_RemoveObj_which_implies_wit_1 : RemoveObj_which_implies_wit_1.
Proof.
  unfold RemoveObj_which_implies_wit_1, store_idmanager_remove_ready.
  right; intros.
  Intros id_map htable bytes prefix suffix bucket.
  destruct H as [[Hid0 Hidlt]
    [Hmap [Hold [Hnew [Hbucket [Hbucket_nodes [Hremove HstoreA]]]]]]].
  subst bucket.
  Exists htable id_map prefix suffix bytes.
  entailer!;
    try rewrite Z.rem_mod_nonneg by (unfold idbuckets_ok in Hold; lia);
    try exact Hremove;
    try exact Hbucket_nodes.
  unfold store_uchar_array.
  rewrite Z.quot_div_nonneg by (unfold id_map_bytes_ok in Hmap; lia).
  entailer!.
Qed. 
