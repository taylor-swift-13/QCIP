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
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_len.source Require Import xizi_double_link_len_goal.
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_len.source Require Import xizi_double_link_len_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
From QCIPLib.xizi.xizi_double_link_common Require Import xizi_double_link_lib.
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_len.source Require Import xizi_double_link_len_lib.
Local Open Scope sac.

Lemma proof_of_DoubleLinkListLenGet_entail_wit_1 : DoubleLinkListLenGet_entail_wit_1.
Proof.
  pre_process.
  unfold XiziLocalDLL.store_dll. Intros first last.
  Exists first last (@nil (DLL.DL_Node A)) nodes_general.
  simpl [XiziLocalDLL.dllseg_shift]. entailer!.
Qed. 

Lemma proof_of_DoubleLinkListLenGet_entail_wit_2 : DoubleLinkListLenGet_entail_wit_2.
Proof.
  pre_process.
  sep_apply_l_atomic (XiziLocalDLL.dllseg_neq storeA_general next tmp_node
    linklist_pre last_2 todo PreH1).
  Intros after node rest. Intros.
  Exists after last_2 done_2 node rest.
  subst next todo. entailer!.
  rewrite Zlength_cons in PreH4. lia.
Qed. 

Lemma proof_of_DoubleLinkListLenGet_entail_wit_3 : DoubleLinkListLenGet_entail_wit_3.
Proof.
  pre_process.
assert (Hcapacity : forall px py xs,
 XiziLocalDLL.dllseg_shift storeA_general px py xs |-- store_align4_n (2 * Zlength xs) ** TT).
  {
 intros px py xs; revert px.
 induction xs as [|a xs IH]; intros px.
 - simpl [XiziLocalDLL.dllseg_shift]. Intros.
   unfold store_align4_n. Exists (@nil Z). entailer!.
   + simpl. entailer!.
   + constructor.
 - simpl [XiziLocalDLL.dllseg_shift]. Intros x.
   sep_apply_l_atomic (IH x).
   sep_apply store_ptr_align4_32.
   sep_apply store_ptr_align4_32.
   sep_apply (store_align4_merge 1 1).
   replace (1 + 1) with 2 by lia.
   sep_apply (store_align4_merge 2 (2 * Zlength xs)).
   rewrite Zlength_cons.
   replace (2 + 2 * Zlength xs) with (2 * Z.succ (Zlength xs)) by lia.
   fold (Z.mul 2 (Z.succ (Zlength xs))).
   cancel (store_align4_n (2 * Z.succ (Zlength xs))).
   apply derivable1_truep_intros.
  }
assert (Hbound : forall px py xs,
 XiziLocalDLL.dllseg_shift storeA_general px py xs |-- “ 0 <= Zlength xs + 1 < 2 ^ 32 ”).
  {
 intros.
 sep_apply_l_atomic (Hcapacity px py xs).
 prop_apply store_align4_n_valid. Intros_p Hcap.
 rewrite addr_max_unsigned_eq_int in Hcap.
 replace Int.max_unsigned with 4294967295 in Hcap by reflexivity.
 replace (4294967295 / 4) with 1073741823 in Hcap by reflexivity.
 pose proof (Zlength_nonneg xs).
 replace (2 ^ 32) with 4294967296 by reflexivity.
 entailer!.
  }
  prop_apply_p (Hbound linklist_pre tmp_node done_2). Intros.
  destruct node as [data ptr]. simpl in *.
  sep_apply_l_atomic (XiziLocalDLL.dllseg_shift_contact_a storeA_general
    linklist_pre tmp_node ptr data done_2).
  Exists after last_2 (done_2 ++ DLL.Build_DL_Node data ptr :: nil) rest.
  entailer!.
  - rewrite Zlength_app, Zlength_cons, Zlength_nil. lia.
  - rewrite Zlength_app, Zlength_cons, Zlength_nil.
    subst linklist_length. unfold unsigned_last_nbits.
    rewrite Z.mod_small; lia.
  - rewrite <- app_assoc. simpl. exact PreH1.
Qed. 

Lemma proof_of_DoubleLinkListLenGet_return_wit_1 : DoubleLinkListLenGet_return_wit_1.
Proof.
  pre_process. subst next.
  destruct todo as [|node rest].
  - simpl [XiziLocalDLL.dllseg]. Intros.
    destruct H as [_ Hprev]. subst tmp_node.
    rewrite app_nil_r in PreH2. subst nodes_general.
    sep_apply_l_atomic (XiziLocalDLL.dllseg_shift_to_dllseg
      storeA_general linklist_pre last linklist_pre done).
    Intros first. unfold XiziLocalDLL.store_dll. Exists first last.
    entailer!.
  - simpl [XiziLocalDLL.dllseg]. Intros after.
    sep_apply_l_atomic (dup_store_ptr
      (&(linklist_pre # "SysDoubleLinklistNode" ->ₛ "node_prev")) last tmp_node).
    entailer!.
Qed. 

Lemma proof_of_DoubleLinkListLenGet_derive_nil_case_by_general : DoubleLinkListLenGet_derive_nil_case_by_general.
Proof.
  pre_process.
  Exists A storeA_nil_case (@nil (DLL.DL_Node A)).
  apply sepcon_cancel_end; [cancel|].
  apply derivable1_wand_sepcon_adjoint.
  Intros retval. Intros.
  Exists retval. simpl in *. entailer!.
Qed. 

