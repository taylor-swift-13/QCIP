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
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_insert_after.source Require Import xizi_double_link_insert_after_goal.
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_insert_after.source Require Import xizi_double_link_insert_after_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
From QCIPLib.xizi.xizi_double_link_common Require Import xizi_double_link_lib.
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_insert_after.source Require Import xizi_double_link_insert_after_lib.
Local Open Scope sac.

Lemma proof_of_DoubleLinkListInsertNodeAfter_entail_wit_1 : DoubleLinkListInsertNodeAfter_entail_wit_1.
Proof.
  pre_process.
  rename linklist_node_pre into n; rename linklist_pre into a;
  rename nodes_dispatch_case into nodes; rename head_dispatch_case into h;
  rename data_dispatch_case into data; rename storeA_dispatch_case into S.
  sep_apply_l_atomic (payload_node_nonzero__payload_insert_after n). Intros.
  unfold xizi_store_dll, XiziStoreADLL.store_dll.
  Intros first last.
  destruct (Z.eq_dec a h) as [Heq|Hneq].
  - subst a. destruct nodes as [|[v ptr] rest].
    + simpl; Intros; destruct H1 as [Hfirst Hlast]; subst first last.
      Right. Exists h h h.
      unfold xizi_dll_links, XiziDLL.links.
      entailer!; unfold xizi_insert_after_dispatch_payload; auto.
    + simpl; Intros next; subst first.
      Left; Right. Exists next last v ptr rest.
      unfold xizi_dll_links, XiziDLL.links.
      entailer!; unfold xizi_insert_after_dispatch_payload; auto.
  - destruct PreH1 as [Hin|Heq]; [|contradiction].
    destruct (payload_first_split__payload_insert_after nodes a Hin)
      as (prefix & value & suffix & Hnodes & Hfirst).
    subst nodes.
    sep_apply_l_atomic (payload_segment_cut__payload_insert_after S prefix value a suffix first h h last Hfirst).
    Intros before. simpl XiziStoreADLL.dllseg at 2. Intros next.
    destruct suffix as [|[v ptr] rest].
    + simpl XiziStoreADLL.dllseg at 1. Intros.
      destruct H4 as [Hnext Hlast]; subst next last.
      Left; Left; Left. Exists before first prefix value (@nil (XiziStoreADLL.DL_Node A)).
      unfold xizi_dll_links, XiziDLL.links.
      entailer!; unfold xizi_insert_after_dispatch_payload, xizi_insert_after_payload;
        right; split; [assumption|]; exists prefix, (XiziStoreADLL.Build_DL_Node value a), nil; auto.
    + simpl XiziStoreADLL.dllseg at 1. Intros next_next; subst next.
      Left; Left; Right. Exists next_next before last first v ptr rest prefix value
        (XiziStoreADLL.Build_DL_Node v ptr :: rest).
      unfold xizi_dll_links, XiziDLL.links.
      entailer!; unfold xizi_insert_after_dispatch_payload, xizi_insert_after_payload;
        right; split; [assumption|]; exists prefix, (XiziStoreADLL.Build_DL_Node value a),
          (XiziStoreADLL.Build_DL_Node v ptr :: rest); auto.
Qed. 

Lemma proof_of_DoubleLinkListInsertNodeAfter_return_wit_1 : DoubleLinkListInsertNodeAfter_return_wit_1.
Proof.
  pre_process.
  subst linklist_pre nodes_dispatch_case.
  prop_apply_p (payload_next_neq__payload_insert_after linklist_node_pre head_dispatch_case
    head_dispatch_case linklist_node_pre). Intros.
  Exists (XiziStoreADLL.Build_DL_Node data_dispatch_case linklist_node_pre :: nil).
  unfold xizi_store_dll, XiziStoreADLL.store_dll.
  Exists linklist_node_pre linklist_node_pre.
  simpl. Exists head_dispatch_case.
  unfold xizi_dll_links, XiziDLL.links; entailer!.
Qed. 

Lemma proof_of_DoubleLinkListInsertNodeAfter_return_wit_2 : DoubleLinkListInsertNodeAfter_return_wit_2.
Proof.
  pre_process.
  subst linklist_pre nodes_dispatch_case.
  prop_apply_p (payload_next_neq__payload_insert_after linklist_node_pre head_dispatch_case
    old_next linklist_node_pre). Intros.
  prop_apply_p (payload_next_neq__payload_insert_after old_next head_dispatch_case
    next_next linklist_node_pre). Intros.
  Exists (XiziStoreADLL.Build_DL_Node data_dispatch_case linklist_node_pre ::
          XiziStoreADLL.Build_DL_Node next_data old_next :: rest).
  unfold xizi_store_dll, XiziStoreADLL.store_dll.
  Exists linklist_node_pre last.
  simpl. Exists old_next next_next.
  unfold xizi_dll_links, XiziDLL.links; entailer!.
Qed. 

Lemma proof_of_DoubleLinkListInsertNodeAfter_return_wit_3 : DoubleLinkListInsertNodeAfter_return_wit_3.
Proof.
  pre_process.
  subst nodes_after.
  sep_apply_l_atomic (payload_segment_frame_exclusion__payload_insert_after storeA_dispatch_case
    nodes_before first head_dispatch_case linklist_pre old_prev head_dispatch_case first). Intros.
  prop_apply_p (payload_next_neq__payload_insert_after linklist_pre head_dispatch_case
    linklist_node_pre first). Intros.
  prop_apply_p (payload_next_neq__payload_insert_after linklist_node_pre head_dispatch_case
    old_next first). Intros.
  prop_apply_p (payload_next_neq__payload_insert_after old_next head_dispatch_case
    next_next first). Intros.
  Exists (nodes_before ++ XiziStoreADLL.Build_DL_Node anchor_data linklist_pre ::
    XiziStoreADLL.Build_DL_Node data_dispatch_case linklist_node_pre ::
    XiziStoreADLL.Build_DL_Node next_data old_next :: rest).
  split_pure_spatial.
  - unfold xizi_store_dll, XiziStoreADLL.store_dll.
    Exists first last.
    unfold xizi_dll_links, XiziDLL.links; entailer!.
    sep_apply_r_atomic (payload_segment_append__payload_insert_after storeA_dispatch_case nodes_before
      (XiziStoreADLL.Build_DL_Node anchor_data linklist_pre ::
       XiziStoreADLL.Build_DL_Node data_dispatch_case linklist_node_pre ::
       XiziStoreADLL.Build_DL_Node next_data old_next :: rest)
      first head_dispatch_case linklist_pre old_prev head_dispatch_case last H).
    simpl XiziStoreADLL.dllseg. Exists linklist_node_pre old_next next_next.
    unfold xizi_dll_links, XiziDLL.links; entailer!.
  - dump_pre_spatial; exact PreH6.
Qed. 

Lemma proof_of_DoubleLinkListInsertNodeAfter_return_wit_4 : DoubleLinkListInsertNodeAfter_return_wit_4.
Proof.
  pre_process.
  subst nodes_after.
  sep_apply_l_atomic (payload_segment_frame_exclusion__payload_insert_after storeA_dispatch_case
    nodes_before first head_dispatch_case linklist_pre old_prev head_dispatch_case first). Intros.
  prop_apply_p (payload_next_neq__payload_insert_after linklist_pre head_dispatch_case
    linklist_node_pre first). Intros.
  prop_apply_p (payload_next_neq__payload_insert_after linklist_node_pre head_dispatch_case
    head_dispatch_case first). Intros.
  Exists (nodes_before ++ XiziStoreADLL.Build_DL_Node anchor_data linklist_pre ::
    XiziStoreADLL.Build_DL_Node data_dispatch_case linklist_node_pre :: nil).
  split_pure_spatial.
  - unfold xizi_store_dll, XiziStoreADLL.store_dll.
    Exists first linklist_node_pre.
    unfold xizi_dll_links, XiziDLL.links; entailer!.
    sep_apply_r_atomic (payload_segment_append__payload_insert_after storeA_dispatch_case nodes_before
      (XiziStoreADLL.Build_DL_Node anchor_data linklist_pre ::
       XiziStoreADLL.Build_DL_Node data_dispatch_case linklist_node_pre :: nil)
      first head_dispatch_case linklist_pre old_prev head_dispatch_case linklist_node_pre H).
    simpl XiziStoreADLL.dllseg. Exists linklist_node_pre head_dispatch_case.
    unfold xizi_dll_links, XiziDLL.links; entailer!.
  - dump_pre_spatial; exact PreH6.
Qed. 

Lemma proof_of_DoubleLinkListInsertNodeAfter_derive_sentinel_case_by_dispatch_case : DoubleLinkListInsertNodeAfter_derive_sentinel_case_by_dispatch_case.
Proof.
  pre_process.
  Exists A storeA_sentinel_case data_sentinel_case linklist_pre nodes_sentinel_case.
  apply sepcon_cancel_end.
  - entailer!; unfold xizi_double_link_insert_after_anchor; auto.
  - apply derivable1_wand_sepcon_adjoint.
    Intros result.
    unfold xizi_insert_after_dispatch_payload in H.
    destruct H as [[_ Heq]|[Hneq _]]; [subst result; entailer!|contradiction].
Qed. 

Lemma proof_of_DoubleLinkListInsertNodeAfter_derive_member_case_by_dispatch_case : DoubleLinkListInsertNodeAfter_derive_member_case_by_dispatch_case.
Proof.
  pre_process.
  sep_apply_l_atomic (payload_store_dll_member_not_head__payload_insert_after storeA_member_case
    head_member_case nodes_member_case linklist_pre H). Intros.
  Exists A storeA_member_case data_member_case head_member_case nodes_member_case.
  apply sepcon_cancel_end.
  - entailer!; unfold xizi_double_link_insert_after_anchor; auto.
  - apply derivable1_wand_sepcon_adjoint.
    Intros result.
    Exists result. entailer!.
    unfold xizi_insert_after_dispatch_payload in H1.
    destruct H1 as [[Heq _]|[_ Hmember]]; [contradiction|exact Hmember].
Qed. 

