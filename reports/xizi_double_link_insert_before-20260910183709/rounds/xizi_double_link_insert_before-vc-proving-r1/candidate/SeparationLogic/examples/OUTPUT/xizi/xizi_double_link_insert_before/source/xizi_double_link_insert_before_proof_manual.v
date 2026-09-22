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
Import CRules.
From QCIPLib.xizi.xizi_double_link_common Require Import xizi_double_link_lib.
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_insert_before.source Require Import xizi_double_link_insert_before_lib.
Local Open Scope sac.

Lemma proof_of_DoubleLinkListInsertNodeBefore_entail_wit_1 : DoubleLinkListInsertNodeBefore_entail_wit_1.
Proof.
 pre_process.
 prop_apply_p (head_absent__insert_before_dispatch_and_reassembly A storeA_dispatch_case head_dispatch_case nodes_dispatch_case).
 Intros_p Habs.
 sep_apply_l_atomic (XiziLocalDLL.store_dll_decompose storeA_dispatch_case head_dispatch_case nodes_dispatch_case).
 unfold XiziLocalDLL.occupy_dll_node. Intros old_prev old_next.
 destruct PreH1 as [Hin | Ehead].
 - destruct (first_payload_split__insert_before_payload A nodes_dispatch_case linklist_pre Hin)
     as (pre & cur & suf & E & P & N).
   subst nodes_dispatch_case.
   assert (Hr: xizi_insert_before_payload (pre ++ cur :: suf) linklist_pre
       (DLL.Build_DL_Node data_dispatch_case linklist_node_pre)
       (pre ++ DLL.Build_DL_Node data_dispatch_case linklist_node_pre :: cur :: suf)).
   { left. exists pre,cur,suf. repeat split; auto. }
   pose proof (xizi_insert_before_payload_address_semantics _ _ _ _ Hr) as Ha.
   assert (Hop: xizi_double_link_insert_before_nodes (XiziLocalDLL.ptrs (pre ++ cur :: suf)) linklist_pre linklist_node_pre =
       XiziLocalDLL.ptrs pre ++ linklist_node_pre :: linklist_pre :: XiziLocalDLL.ptrs suf).
   { rewrite XiziLocalDLL.ptrs_app. simpl XiziLocalDLL.ptrs. rewrite P.
     apply xizi_insert_before_first_occurrence__insert_before_dispatch_and_reassembly; exact N. }
   sep_apply_l_atomic (payload_insert__insert_before_dispatch_and_reassembly A storeA_dispatch_case pre (cur :: suf) data_dispatch_case linklist_node_pre).
   unfold XiziLocalDLL.addr_store_dll, XiziLocalDLL.store_dll.
   Intros first last.
   fold (XiziLocalDLL.addr_dllseg first head_dispatch_case head_dispatch_case last (XiziLocalDLL.ptrs (pre ++ cur :: suf))).
   rewrite XiziLocalDLL.ptrs_app. simpl XiziLocalDLL.ptrs. rewrite P.
   sep_apply_l_atomic (addr_split__insert_before_dispatch_and_reassembly first head_dispatch_case head_dispatch_case last (XiziLocalDLL.ptrs pre) (linklist_pre :: XiziLocalDLL.ptrs suf)).
   Intros at_anchor prev.
   sep_apply_l_atomic (addr_open__insert_before_dispatch_and_reassembly at_anchor prev head_dispatch_case last linklist_pre (XiziLocalDLL.ptrs suf)).
   Intros next.
   match goal with H: at_anchor = linklist_pre |- _ => rename H into Eat end. subst at_anchor.
   destruct (XiziLocalDLL.ptrs pre) as [|a ps] eqn:Epre.
   + sep_apply_l_atomic (addr_nil__insert_before_dispatch_and_reassembly first head_dispatch_case linklist_pre prev).
     Intros_p Eends. destruct Eends as [Ef Ep]. subst first prev.
     Left. Left. Left.
     Exists linklist_pre last next last head_dispatch_case (@nil Z) (XiziLocalDLL.ptrs suf) old_next old_prev
       (pre ++ DLL.Build_DL_Node data_dispatch_case linklist_node_pre :: cur :: suf) (XiziLocalDLL.ptrs (pre ++ cur :: suf)).
     entailer!; rewrite XiziLocalDLL.ptrs_app, Epre; simpl XiziLocalDLL.ptrs; rewrite P; reflexivity.
   + assert (Hne: a :: ps <> nil) by discriminate.
     destruct (exists_last Hne) as [prefix0 [pred Eps]].
     rewrite Eps.
     sep_apply_l_atomic (addr_split__insert_before_dispatch_and_reassembly first head_dispatch_case linklist_pre prev prefix0 (pred :: nil)).
     Intros at_prev before_prev.
     sep_apply_l_atomic (addr_open__insert_before_dispatch_and_reassembly at_prev before_prev linklist_pre prev pred nil).
     Intros after_prev.
     match goal with H: at_prev = pred |- _ => rename H into Eat end. subst at_prev.
     sep_apply_l_atomic (addr_nil__insert_before_dispatch_and_reassembly after_prev pred linklist_pre prev).
     Intros_p Eends. destruct Eends as [Ea Ep]. subst after_prev prev.
     Left. Left. Right.
     Exists first prefix0 last next before_prev pred (prefix0 ++ pred :: nil) (XiziLocalDLL.ptrs suf) old_next old_prev
       (pre ++ DLL.Build_DL_Node data_dispatch_case linklist_node_pre :: cur :: suf) (XiziLocalDLL.ptrs (pre ++ cur :: suf)).
     entailer!; try (rewrite XiziLocalDLL.ptrs_app, Epre, Eps; simpl XiziLocalDLL.ptrs; rewrite P; reflexivity); try (rewrite <- Eps; assumption).
 - subst linklist_pre.
   assert (Hr: xizi_insert_before_payload nodes_dispatch_case head_dispatch_case
       (DLL.Build_DL_Node data_dispatch_case linklist_node_pre)
       (nodes_dispatch_case ++ DLL.Build_DL_Node data_dispatch_case linklist_node_pre :: nil)).
   { right. auto. }
   pose proof (xizi_insert_before_payload_address_semantics _ _ _ _ Hr) as Ha.
   pose proof (xizi_insert_before_absent_append__insert_before_dispatch_and_reassembly (XiziLocalDLL.ptrs nodes_dispatch_case) head_dispatch_case linklist_node_pre Habs) as Hop.
   sep_apply_l_atomic (payload_append__insert_before_dispatch_and_reassembly A storeA_dispatch_case nodes_dispatch_case data_dispatch_case linklist_node_pre).
   unfold XiziLocalDLL.addr_store_dll, XiziLocalDLL.store_dll.
   Intros first last.
   fold (XiziLocalDLL.addr_dllseg first head_dispatch_case head_dispatch_case last (XiziLocalDLL.ptrs nodes_dispatch_case)).
   destruct (XiziLocalDLL.ptrs nodes_dispatch_case) as [|a ps] eqn:Eptr.
   + sep_apply_l_atomic (addr_nil__insert_before_dispatch_and_reassembly first head_dispatch_case head_dispatch_case last).
     Intros_p Eends. destruct Eends as [Ef El]. subst first last.
     Right.
     Exists head_dispatch_case head_dispatch_case head_dispatch_case old_next old_prev
       (nodes_dispatch_case ++ DLL.Build_DL_Node data_dispatch_case linklist_node_pre :: nil) (@nil Z).
     entailer!.
   + assert (Hne: a :: ps <> nil) by discriminate.
     destruct (exists_last Hne) as [prefix0 [pred Eps]]. rewrite Eps.
     sep_apply_l_atomic (addr_split__insert_before_dispatch_and_reassembly first head_dispatch_case head_dispatch_case last prefix0 (pred :: nil)).
     Intros at_prev before_prev.
     sep_apply_l_atomic (addr_open__insert_before_dispatch_and_reassembly at_prev before_prev head_dispatch_case last pred nil).
     Intros after_prev.
     match goal with H: at_prev = pred |- _ => rename H into Eat end. subst at_prev.
     sep_apply_l_atomic (addr_nil__insert_before_dispatch_and_reassembly after_prev pred head_dispatch_case last).
     Intros_p Eends. destruct Eends as [Ea El]. subst after_prev last.
     Left. Right.
     Exists first before_prev prefix0 pred old_next old_prev
       (nodes_dispatch_case ++ DLL.Build_DL_Node data_dispatch_case linklist_node_pre :: nil) (prefix0 ++ pred :: nil).
     entailer!; rewrite <- Eps; assumption.
Qed. 

Lemma proof_of_DoubleLinkListInsertNodeBefore_return_wit_1 : DoubleLinkListInsertNodeBefore_return_wit_1.
Proof.
 pre_process.
 Exists result_2. split_pure_spatial.
 - sep_apply_r_atomic (XiziLocalDLL.store_dll_compose storeA_dispatch_case head_dispatch_case result_2).
   rewrite PreH4, PreH5, PreH6. simpl List.app.
   unfold XiziLocalDLL.addr_store_dll, XiziLocalDLL.store_dll.
   Exists linklist_node_pre linklist_node_pre.
   unfold XiziLocalDLL.addr_nodes; simpl XiziLocalDLL.dllseg.
   Exists head_dispatch_case. unfold XiziLocalDLL.addr_store; entailer!.
 - dump_pre_spatial. rewrite <- PreH1. exact PreH3.
Qed. 

Lemma proof_of_DoubleLinkListInsertNodeBefore_return_wit_2 : DoubleLinkListInsertNodeBefore_return_wit_2.
Proof.
 pre_process.
 Exists result_2. split_pure_spatial.
 - sep_apply_r_atomic (XiziLocalDLL.store_dll_compose storeA_dispatch_case head_dispatch_case result_2).
   rewrite PreH4, PreH5, PreH6, <- app_assoc. simpl List.app.
   unfold XiziLocalDLL.addr_store_dll, XiziLocalDLL.store_dll.
   Exists first linklist_node_pre.
   fold (XiziLocalDLL.addr_dllseg first head_dispatch_case head_dispatch_case linklist_node_pre (prefix0 ++ prev :: linklist_node_pre :: nil)).
   sepcon_assoc_change. cancel.
   sep_apply_r_atomic (addr_join__insert_before_dispatch_and_reassembly first head_dispatch_case prev before_prev head_dispatch_case linklist_node_pre prefix0 (prev :: linklist_node_pre :: nil)).
   cancel (XiziLocalDLL.addr_dllseg first head_dispatch_case prev before_prev prefix0).
   unfold XiziLocalDLL.addr_dllseg, XiziLocalDLL.addr_nodes; simpl XiziLocalDLL.dllseg.
   Exists linklist_node_pre head_dispatch_case. unfold XiziLocalDLL.addr_store; entailer!.
 - dump_pre_spatial. rewrite <- PreH1. exact PreH3.
Qed. 

Lemma proof_of_DoubleLinkListInsertNodeBefore_return_wit_3 : DoubleLinkListInsertNodeBefore_return_wit_3.
Proof.
 pre_process.
 Exists result_2. split_pure_spatial.
 - sep_apply_r_atomic (XiziLocalDLL.store_dll_compose storeA_dispatch_case head_dispatch_case result_2).
   rewrite PreH3, PreH6, PreH7, <- app_assoc. simpl List.app.
   unfold XiziLocalDLL.addr_store_dll, XiziLocalDLL.store_dll. Exists first last.
   fold (XiziLocalDLL.addr_dllseg first head_dispatch_case head_dispatch_case last (prefix0 ++ prev :: linklist_node_pre :: linklist_pre :: nodes_after)).
   sepcon_assoc_change. cancel.
   sep_apply_r_atomic (addr_join__insert_before_dispatch_and_reassembly first head_dispatch_case prev before_prev head_dispatch_case last prefix0 (prev :: linklist_node_pre :: linklist_pre :: nodes_after)).
   cancel (XiziLocalDLL.addr_dllseg first head_dispatch_case prev before_prev prefix0).
   sepcon_assoc_change. cancel.
   sep_apply_r_atomic (addr_cons__insert_before_dispatch_and_reassembly prev before_prev linklist_node_pre head_dispatch_case last (linklist_node_pre :: linklist_pre :: nodes_after)).
   sepcon_assoc_change. cancel.
   sep_apply_r_atomic (addr_cons__insert_before_dispatch_and_reassembly linklist_node_pre prev linklist_pre head_dispatch_case last (linklist_pre :: nodes_after)).
   sepcon_assoc_change. cancel.
   sep_apply_r_atomic (addr_cons__insert_before_dispatch_and_reassembly linklist_pre linklist_node_pre next head_dispatch_case last nodes_after).
   entailer!.
 - dump_pre_spatial. exact PreH2.
Qed. 

Lemma proof_of_DoubleLinkListInsertNodeBefore_return_wit_4 : DoubleLinkListInsertNodeBefore_return_wit_4.
Proof.
 pre_process.
 Exists result_2. split_pure_spatial.
 - sep_apply_r_atomic (XiziLocalDLL.store_dll_compose storeA_dispatch_case head_dispatch_case result_2).
   rewrite PreH4, PreH7, PreH8. simpl List.app. subst prev before_prev.
   unfold XiziLocalDLL.addr_store_dll, XiziLocalDLL.store_dll. Exists linklist_node_pre last.
   fold (XiziLocalDLL.addr_dllseg linklist_node_pre head_dispatch_case head_dispatch_case last (linklist_node_pre :: first :: nodes_after)).
   sepcon_assoc_change. cancel.
   sepcon_assoc_change. cancel.
   sep_apply_r_atomic (addr_cons__insert_before_dispatch_and_reassembly linklist_node_pre head_dispatch_case first head_dispatch_case last (first :: nodes_after)).
   sepcon_assoc_change. cancel.
   sep_apply_r_atomic (addr_cons__insert_before_dispatch_and_reassembly first linklist_node_pre next head_dispatch_case last nodes_after).
   entailer!.
 - dump_pre_spatial. rewrite <- PreH1. exact PreH3.
Qed. 

Lemma proof_of_DoubleLinkListInsertNodeBefore_derive_sentinel_case_by_dispatch_case : DoubleLinkListInsertNodeBefore_derive_sentinel_case_by_dispatch_case.
Proof.
 pre_process.
 prop_apply_p (head_absent__insert_before_dispatch_and_reassembly A storeA_sentinel_case linklist_pre nodes_sentinel_case).
 Intros_p Habs.
 Exists A storeA_sentinel_case data_sentinel_case linklist_pre nodes_sentinel_case.
 apply sepcon_cancel_end.
 - split_pure_spatial.
   + entailer!.
   + dump_pre_spatial. unfold xizi_double_link_insert_before_anchor; auto.
 - apply derivable1_wand_sepcon_adjoint.
   Intros result.
   match goal with H: xizi_insert_before_payload _ _ _ _ |- _ => rename H into Hr end.
   destruct Hr as [(pre & cur & suf & E & P & N & R) | [N R]].
   + exfalso. apply Habs. rewrite E, XiziLocalDLL.ptrs_app.
     apply in_or_app. right. simpl. left. exact P.
   + subst result. entailer!.
Qed. 

Lemma proof_of_DoubleLinkListInsertNodeBefore_derive_member_case_by_dispatch_case : DoubleLinkListInsertNodeBefore_derive_member_case_by_dispatch_case.
Proof.
 pre_process.
 Exists A storeA_member_case data_member_case head_member_case nodes_member_case.
 apply sepcon_cancel_end.
 - split_pure_spatial.
   + entailer!.
   + dump_pre_spatial. unfold xizi_double_link_insert_before_anchor; auto.
 - apply derivable1_wand_sepcon_adjoint. entailer!.
Qed. 

