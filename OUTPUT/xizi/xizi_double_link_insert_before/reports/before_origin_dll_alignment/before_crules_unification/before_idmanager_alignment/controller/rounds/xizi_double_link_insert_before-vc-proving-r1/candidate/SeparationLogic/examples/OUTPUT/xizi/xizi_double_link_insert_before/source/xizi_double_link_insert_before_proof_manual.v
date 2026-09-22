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
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_insert_before.source Require Import xizi_double_link_insert_before_goal.
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_insert_before.source Require Import xizi_double_link_insert_before_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
From QCIPLib.xizi.xizi_double_link_common Require Import xizi_double_link_lib.
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_insert_before.source Require Import xizi_double_link_insert_before_lib.
Local Open Scope sac.

Lemma proof_of_DoubleLinkListInsertNodeBefore_entail_wit_1 : DoubleLinkListInsertNodeBefore_entail_wit_1.
Proof.
 pre_process.
 rename linklist_node_pre into ins.
 rename linklist_pre into a.
 rename nodes_dispatch_case into xs.
 rename head_dispatch_case into h.
 rename data_dispatch_case into d.
 rename storeA_dispatch_case into storeA.
 prop_apply_p (node_nonzero__insert_before_payload ins). Intros_p Hn.
 sep_apply_l_atomic (dll_decompose__storeA_shared storeA h xs).
 prop_apply_p (dll_nonzero__insert_before_payload h (xizi_dll_ptrs xs)). Intros_p Hh.
 prop_apply_p (dll_absent__insert_before_payload h (xizi_dll_ptrs xs)). Intros_p Habs.
 destruct PreH1 as [Hin|Ha].
 - destruct (first_payload_split__insert_before_payload A xs a Hin) as (pre&cur&suf&E&Hcur&Hfirst).
   subst xs.
   assert (R : xizi_insert_before_payload (pre ++ cur :: suf) a (XiziStoreADLL.Build_DL_Node d ins)
     (pre ++ XiziStoreADLL.Build_DL_Node d ins :: cur :: suf)).
   { left. exists pre,cur,suf. repeat split; auto. }
   pose proof (xizi_insert_before_payload_address_semantics _ _ _ _ R) as Rptr.
   pose proof (payload_insert__insert_before_payload A storeA pre (cur::suf) (XiziStoreADLL.Build_DL_Node d ins)) as Pins.
   cbn [XiziStoreADLL.getPtr XiziStoreADLL.getData] in Pins.
   sep_apply_l_atomic Pins.
   unfold xizi_dll, XiziDLL.dll at 1. Intros f l.
   fold xizi_dll_links xizi_dllseg.
   unfold xizi_dll_ptrs in *; rewrite !map_app in *; simpl in *; rewrite Hcur in *.
   sep_apply_l_atomic (seg_cut__insert_before_payload (map XiziStoreADLL.getPtr pre) (map XiziStoreADLL.getPtr suf) f h h l a).
   Intros ap an.
   pose proof (xizi_insert_before_first_occurrence__insert_before_dispatch_and_reassembly
     (map XiziStoreADLL.getPtr pre) (map XiziStoreADLL.getPtr suf) a ins Hfirst) as Hop.
   destruct (list_last__insert_before_payload (map XiziStoreADLL.getPtr pre)) as [Ep|(prefix0&pv&Ep)].
   + Left. Left. Left.
     rewrite Ep in *.
     unfold xizi_dllseg at 1. simpl. Intros.
     destruct H2 as [Ef Eap]. subst f ap.
     Exists a l an l h (@nil Z) (map XiziStoreADLL.getPtr suf)
       (pre ++ XiziStoreADLL.Build_DL_Node d ins :: cur :: suf)
       (a :: map XiziStoreADLL.getPtr suf).
     unfold xizi_dll_links, XiziDLL.links.
     rewrite !map_app; simpl; rewrite Hcur, Ep; simpl.
     entailer!.
   + Left. Left. Right.
     rewrite Ep in *.
     sep_apply_l_atomic (seg_cut__insert_before_payload prefix0 nil f h a ap pv).
     Intros bp pn.
     unfold xizi_dllseg at 2. simpl. Intros.
     destruct H4 as [En Ea]. subst pn ap.
     prop_apply_p (xizi_dll_links_neq__dll_len_payload_cycle pv a bp h f l).
     Intros_p Hpv.
     Exists f prefix0 l an bp pv (prefix0 ++ pv :: nil) (map XiziStoreADLL.getPtr suf)
       (pre ++ XiziStoreADLL.Build_DL_Node d ins :: cur :: suf)
       ((prefix0 ++ pv :: nil) ++ a :: map XiziStoreADLL.getPtr suf).
     unfold xizi_dll_links, XiziDLL.links.
     rewrite !map_app; simpl; rewrite Hcur, Ep.
     entailer!.
 - subst a.
   assert (R : xizi_insert_before_payload xs h (XiziStoreADLL.Build_DL_Node d ins)
     (xs ++ XiziStoreADLL.Build_DL_Node d ins :: nil)).
   { right. auto. }
   pose proof (xizi_insert_before_payload_address_semantics _ _ _ _ R) as Rptr.
   pose proof (xizi_insert_before_absent_append__insert_before_dispatch_and_reassembly
      (xizi_dll_ptrs xs) h ins Habs) as Hop.
   pose proof (payload_insert__insert_before_payload A storeA xs nil (XiziStoreADLL.Build_DL_Node d ins)) as Pins.
   rewrite app_nil_r in Pins.
   cbn [XiziStoreADLL.getPtr XiziStoreADLL.getData] in Pins.
   sep_apply_l_atomic Pins.
   unfold xizi_dll, XiziDLL.dll at 1. Intros f l.
   fold xizi_dll_links xizi_dllseg.
   destruct (list_last__insert_before_payload (xizi_dll_ptrs xs)) as [Ep|(prefix0&pv&Ep)].
   + Right.
     rewrite Ep in *.
     unfold xizi_dllseg at 1. simpl. Intros.
     destruct H0 as [Ef El]. subst f l.
     Exists h h h (xs ++ XiziStoreADLL.Build_DL_Node d ins :: nil) (@nil Z).
     unfold xizi_dll_links, XiziDLL.links.
     entailer!.
   + Left. Right.
     rewrite Ep in *.
     sep_apply_l_atomic (seg_cut__insert_before_payload prefix0 nil f h h l pv).
     Intros bp pn.
     unfold xizi_dllseg at 2. simpl. Intros.
     destruct H2 as [En El]. subst pn l.
     Exists f bp prefix0 pv (xs ++ XiziStoreADLL.Build_DL_Node d ins :: nil) (prefix0 ++ pv :: nil).
     unfold xizi_dll_links, XiziDLL.links.
     entailer!.
Qed. 

Lemma proof_of_DoubleLinkListInsertNodeBefore_return_wit_1 : DoubleLinkListInsertNodeBefore_return_wit_1.
Proof.
 pre_process.
 Exists result_2.
 split_pure_spatial.
 - sep_apply_r_atomic (dll_compose__storeA_shared storeA_dispatch_case head_dispatch_case result_2).
   rewrite PreH5, PreH8, PreH9. simpl.
   cancel (xizi_dll_payloads storeA_dispatch_case result_2).
   sep_apply_l_atomic (xizi_dll_links_fold__dll_len_payload_cycle linklist_node_pre head_dispatch_case head_dispatch_case).
   sep_apply_l_atomic (xizi_dll_links_fold__dll_len_payload_cycle head_dispatch_case linklist_node_pre linklist_node_pre).
   prop_apply_p (xizi_dll_links_neq__dll_len_payload_cycle linklist_node_pre head_dispatch_case head_dispatch_case head_dispatch_case linklist_node_pre linklist_node_pre).
   Intros.
   unfold xizi_dll, XiziDLL.dll, xizi_dllseg.
   Exists linklist_node_pre linklist_node_pre.
   simpl. Exists head_dispatch_case. entailer!.
 - dump_pre_spatial. rewrite <- PreH2. exact PreH4.
Qed. 

Lemma proof_of_DoubleLinkListInsertNodeBefore_return_wit_2 : DoubleLinkListInsertNodeBefore_return_wit_2.
Proof.
 pre_process. Exists result_2. split_pure_spatial.
 - sep_apply_r_atomic (dll_compose__storeA_shared storeA_dispatch_case head_dispatch_case result_2).
   rewrite PreH5, PreH8, PreH9, <- app_assoc. simpl.
   cancel (xizi_dll_payloads storeA_dispatch_case result_2).
   sep_apply_l_atomic (xizi_dll_links_fold__dll_len_payload_cycle linklist_node_pre head_dispatch_case prev).
   sep_apply_l_atomic (xizi_dll_links_fold__dll_len_payload_cycle prev linklist_node_pre before_prev).
   sep_apply_l_atomic (xizi_dll_links_fold__dll_len_payload_cycle head_dispatch_case first linklist_node_pre).
   prop_apply_p (xizi_dll_links_neq__dll_len_payload_cycle linklist_node_pre head_dispatch_case prev head_dispatch_case first linklist_node_pre).
   Intros_p Hnew.
   sep_apply_l_atomic (seg_single__insert_before_payload linklist_node_pre prev head_dispatch_case PreH1 Hnew).
   sep_apply_l_atomic (seg_cons__insert_before_payload prev linklist_node_pre before_prev head_dispatch_case linklist_node_pre (linklist_node_pre :: nil) PreH10 PreH11).
   sep_apply_l_atomic (seg_join__insert_before_payload prefix0 (prev :: linklist_node_pre :: nil) first head_dispatch_case prev before_prev head_dispatch_case linklist_node_pre first linklist_node_pre).
   sep_apply_l_atomic (xizi_dll_close head_dispatch_case first linklist_node_pre (prefix0 ++ prev :: linklist_node_pre :: nil) PreH6).
   entailer!.
 - dump_pre_spatial. rewrite <- PreH2. exact PreH4.
Qed. 

Lemma proof_of_DoubleLinkListInsertNodeBefore_return_wit_3 : DoubleLinkListInsertNodeBefore_return_wit_3.
Proof.
 pre_process. Exists result_2. split_pure_spatial.
 - sep_apply_r_atomic (dll_compose__storeA_shared storeA_dispatch_case head_dispatch_case result_2).
   rewrite PreH4, PreH9, PreH12, <- app_assoc. simpl.
   cancel (xizi_dll_payloads storeA_dispatch_case result_2).
   sep_apply_l_atomic (xizi_dll_links_fold__dll_len_payload_cycle linklist_node_pre linklist_pre prev).
   sep_apply_l_atomic (xizi_dll_links_fold__dll_len_payload_cycle prev linklist_node_pre before_prev).
   sep_apply_l_atomic (xizi_dll_links_fold__dll_len_payload_cycle linklist_pre next linklist_node_pre).
   sep_apply_l_atomic (xizi_dll_links_fold__dll_len_payload_cycle head_dispatch_case first last).
   prop_apply_p (xizi_dll_links_neq__dll_len_payload_cycle linklist_node_pre linklist_pre prev head_dispatch_case first last).
   Intros_p Hnew.
   sep_apply_l_atomic (seg_cons__insert_before_payload linklist_pre next linklist_node_pre head_dispatch_case last nodes_after PreH10 PreH11).
   sep_apply_l_atomic (seg_cons__insert_before_payload linklist_node_pre linklist_pre prev head_dispatch_case last (linklist_pre :: nodes_after) PreH1 Hnew).
   sep_apply_l_atomic (seg_cons__insert_before_payload prev linklist_node_pre before_prev head_dispatch_case last (linklist_node_pre :: linklist_pre :: nodes_after) PreH13 PreH14).
   sep_apply_l_atomic (seg_join__insert_before_payload prefix0 (prev :: linklist_node_pre :: linklist_pre :: nodes_after) first head_dispatch_case prev before_prev head_dispatch_case last first last).
   sep_apply_l_atomic (xizi_dll_close head_dispatch_case first last (prefix0 ++ prev :: linklist_node_pre :: linklist_pre :: nodes_after) PreH5).
   entailer!.
 - dump_pre_spatial. exact PreH3.
Qed. 

Lemma proof_of_DoubleLinkListInsertNodeBefore_return_wit_4 : DoubleLinkListInsertNodeBefore_return_wit_4.
Proof.
 pre_process. Exists result_2. split_pure_spatial.
 - sep_apply_r_atomic (dll_compose__storeA_shared storeA_dispatch_case head_dispatch_case result_2).
   rewrite PreH5, PreH10, PreH13. simpl.
   cancel (xizi_dll_payloads storeA_dispatch_case result_2).
   subst prev before_prev.
   sep_apply_l_atomic (xizi_dll_links_fold__dll_len_payload_cycle linklist_node_pre first head_dispatch_case).
   sep_apply_l_atomic (xizi_dll_links_fold__dll_len_payload_cycle first next linklist_node_pre).
   sep_apply_l_atomic (xizi_dll_links_fold__dll_len_payload_cycle head_dispatch_case linklist_node_pre last).
   prop_apply_p (xizi_dll_links_neq__dll_len_payload_cycle linklist_node_pre first head_dispatch_case head_dispatch_case linklist_node_pre last).
   Intros_p Hnew.
   sep_apply_l_atomic (seg_cons__insert_before_payload first next linklist_node_pre head_dispatch_case last nodes_after PreH11 PreH12).
   sep_apply_l_atomic (seg_cons__insert_before_payload linklist_node_pre first head_dispatch_case head_dispatch_case last (first :: nodes_after) PreH1 Hnew).
   sep_apply_l_atomic (xizi_dll_close head_dispatch_case linklist_node_pre last (linklist_node_pre :: first :: nodes_after) PreH6).
   entailer!.
 - dump_pre_spatial. rewrite <- PreH2. exact PreH4.
Qed. 

Lemma proof_of_DoubleLinkListInsertNodeBefore_derive_sentinel_case_by_dispatch_case : DoubleLinkListInsertNodeBefore_derive_sentinel_case_by_dispatch_case.
Proof.
 pre_process.
 prop_apply_p (store_dll_absent__insert_before_payload A storeA_sentinel_case linklist_pre nodes_sentinel_case).
 Intros_p Habs.
 Exists A storeA_sentinel_case data_sentinel_case linklist_pre nodes_sentinel_case.
 apply sepcon_cancel_end.
 - unfold xizi_double_link_insert_before_anchor. entailer!.
 - apply derivable1_wand_sepcon_adjoint.
   Intros result. rename H into Hpayload.
   pose proof (payload_absent_result__insert_before_payload A nodes_sentinel_case result linklist_pre (XiziStoreADLL.Build_DL_Node data_sentinel_case linklist_node_pre) Habs Hpayload) as E.
   subst result. entailer!.
Qed. 

Lemma proof_of_DoubleLinkListInsertNodeBefore_derive_member_case_by_dispatch_case : DoubleLinkListInsertNodeBefore_derive_member_case_by_dispatch_case.
Proof.
 pre_process.
 Exists A storeA_member_case data_member_case head_member_case nodes_member_case.
 apply sepcon_cancel_end.
 - unfold xizi_double_link_insert_before_anchor. entailer!.
 - apply derivable1_wand_sepcon_adjoint. entailer!.
Qed. 

