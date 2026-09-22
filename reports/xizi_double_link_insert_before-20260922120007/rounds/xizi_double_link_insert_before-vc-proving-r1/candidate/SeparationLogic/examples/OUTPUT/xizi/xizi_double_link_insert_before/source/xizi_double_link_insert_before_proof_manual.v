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
Import DLL.
Local Open Scope sac.

Lemma proof_of_DoubleLinkListInsertNodeBefore_entail_wit_1 : DoubleLinkListInsertNodeBefore_entail_wit_1.
Proof.
  pre_process.
  unfold xizi_double_link_insert_before_anchor in PreH1.
  destruct PreH1 as [Hin | Heq].
  - destruct (first_payload_split__insert_before_payload A nodes_dispatch_case linklist_pre Hin)
      as (prefix & current & suffix & Hnodes & Hptr & Hfirst).
    subst nodes_dispatch_case.
    set (inserted := Build_DL_Node data_dispatch_case linklist_node_pre).
    set (result := prefix ++ inserted :: current :: suffix).
    assert (Hpayload : xizi_insert_before_payload
      (prefix ++ current :: suffix) linklist_pre inserted result).
    { left. exists prefix, current, suffix. repeat split; auto. }
    assert (Haddrsem : ptrs result =
      xizi_double_link_insert_before_nodes (ptrs (prefix ++ current :: suffix))
        linklist_pre linklist_node_pre).
    { change (ptrs result =
        xizi_double_link_insert_before_nodes (ptrs (prefix ++ current :: suffix))
          linklist_pre (getPtr inserted)).
      apply xizi_insert_before_payload_address_semantics. exact Hpayload. }
    assert (Hinsert : xizi_double_link_insert_before_nodes
      (ptrs (prefix ++ current :: suffix)) linklist_pre linklist_node_pre =
      ptrs prefix ++ linklist_node_pre :: linklist_pre :: ptrs suffix).
    { unfold ptrs. rewrite !map_app. simpl. rewrite Hptr.
      apply xizi_insert_before_first_occurrence__insert_before_dispatch_and_reassembly.
      exact Hfirst. }
    sep_apply_l_atomic (store_dll_decompose storeA_dispatch_case head_dispatch_case
      (prefix ++ current :: suffix)).
    sep_apply_l_atomic (payload_insert__insert_before_dispatch_and_reassembly
      A storeA_dispatch_case prefix (current :: suffix)
      data_dispatch_case linklist_node_pre).
    sep_apply_l_atomic (addr_store_dll_unfold__entail_dispatch_decomposition
      head_dispatch_case (ptrs (prefix ++ current :: suffix))).
    Intros first last.
    unfold occupy_dll_node.
    Intros old_prev old_next.
    destruct (list_snoc_destruct prefix) as [Hnil | (previous & prefix0 & Hsnoc)].
    + subst prefix. simpl [ptrs] in *.
      rewrite Hptr in *.
      sep_apply_l_atomic (addr_open__insert_before_dispatch_and_reassembly
        first head_dispatch_case head_dispatch_case last linklist_pre (ptrs suffix)).
      Intros next. Intros. subst first.
      Left. Left. Left.
      Exists linklist_pre last next last head_dispatch_case (@nil Z) (ptrs suffix)
        old_next old_prev result (linklist_pre :: ptrs suffix).
      entailer!.
      * unfold result, inserted. simpl [payloads]. entailer!. rewrite Hptr; entailer!.
      * unfold result, inserted. simpl [ptrs]. rewrite Hptr. exact Haddrsem.
    + subst prefix.
      assert (Hptrs_snoc : ptrs (prefix0 +:: previous) =
        ptrs prefix0 +:: getPtr previous).
      { unfold ptrs. rewrite map_app. reflexivity. }
      repeat rewrite ptrs_app in Hinsert.
      repeat rewrite ptrs_app in Haddrsem.
      repeat rewrite ptrs_app in Hfirst.
      simpl [ptrs] in Hinsert, Haddrsem, Hfirst.
      rewrite Hptr in Hinsert, Haddrsem.
      repeat rewrite <- app_assoc in Hinsert, Haddrsem.
      repeat rewrite ptrs_app.
      simpl [ptrs]. rewrite Hptr. rewrite <- app_assoc.
      sep_apply_l_atomic (addr_split__insert_before_dispatch_and_reassembly
        first head_dispatch_case head_dispatch_case last (ptrs prefix0)
        (getPtr previous :: linklist_pre :: ptrs suffix)).
      Intros middle middle_prev.
      sep_apply_l_atomic (addr_open__insert_before_dispatch_and_reassembly
        middle middle_prev head_dispatch_case last (getPtr previous)
        (linklist_pre :: ptrs suffix)).
      Intros after_previous. Intros. subst middle.
      sep_apply_l_atomic (addr_open__insert_before_dispatch_and_reassembly
        after_previous (getPtr previous) head_dispatch_case last linklist_pre
        (ptrs suffix)).
      Intros next. Intros. subst after_previous.
      Left. Left. Right.
      Exists first (ptrs prefix0) last next middle_prev (getPtr previous)
        (ptrs prefix0 ++ getPtr previous :: nil) (ptrs suffix)
        old_next old_prev result
        (ptrs prefix0 ++ getPtr previous :: linklist_pre :: ptrs suffix).
      entailer!.
      all: try (rewrite app_assoc; reflexivity).
      all: try exact Hfirst.
      rewrite <- app_assoc; reflexivity.
  - subst linklist_pre.
    prop_apply_p (head_absent__insert_before_dispatch_and_reassembly
      A storeA_dispatch_case head_dispatch_case nodes_dispatch_case).
    Intros_p Habsent.
    set (inserted := Build_DL_Node data_dispatch_case linklist_node_pre).
    set (result := nodes_dispatch_case ++ inserted :: nil).
    assert (Hpayload : xizi_insert_before_payload nodes_dispatch_case
      head_dispatch_case inserted result).
    { right. split; [exact Habsent | reflexivity]. }
    assert (Haddrsem : ptrs result =
      xizi_double_link_insert_before_nodes (ptrs nodes_dispatch_case)
        head_dispatch_case linklist_node_pre).
    { change (ptrs result =
        xizi_double_link_insert_before_nodes (ptrs nodes_dispatch_case)
          head_dispatch_case (getPtr inserted)).
      apply xizi_insert_before_payload_address_semantics. exact Hpayload. }
    assert (Happend : xizi_double_link_insert_before_nodes
      (ptrs nodes_dispatch_case) head_dispatch_case linklist_node_pre =
      ptrs nodes_dispatch_case ++ linklist_node_pre :: nil).
    { apply xizi_insert_before_absent_append__insert_before_dispatch_and_reassembly.
      exact Habsent. }
    sep_apply_l_atomic (store_dll_decompose storeA_dispatch_case
      head_dispatch_case nodes_dispatch_case).
    sep_apply_l_atomic (payload_append__insert_before_dispatch_and_reassembly
      A storeA_dispatch_case nodes_dispatch_case data_dispatch_case
      linklist_node_pre).
    sep_apply_l_atomic (addr_store_dll_unfold__entail_dispatch_decomposition
      head_dispatch_case (ptrs nodes_dispatch_case)).
    Intros first last.
    unfold occupy_dll_node.
    Intros old_prev old_next.
    destruct (list_snoc_destruct nodes_dispatch_case)
      as [Hnil | (previous & prefix & Hsnoc)].
    + subst nodes_dispatch_case. simpl [ptrs] in *.
      sep_apply_l_atomic (addr_nil__insert_before_dispatch_and_reassembly
        first head_dispatch_case head_dispatch_case last).
      Intros. destruct H as [Hfirst Hlast]. subst first. subst last.
      Right.
      Exists head_dispatch_case head_dispatch_case head_dispatch_case
        old_next old_prev result (@nil Z).
      entailer!.
      * unfold result, inserted. simpl [payloads]. entailer!.
    + subst nodes_dispatch_case.
      assert (Hptrs_snoc2 : ptrs (prefix +:: previous) =
        ptrs prefix +:: getPtr previous).
      { unfold ptrs. rewrite map_app. reflexivity. }
      rewrite Hptrs_snoc2 in Happend, Haddrsem, Habsent.
      rewrite ptrs_app. simpl [ptrs].
      sep_apply_l_atomic (addr_split__insert_before_dispatch_and_reassembly
        first head_dispatch_case head_dispatch_case last (ptrs prefix)
        (getPtr previous :: nil)).
      Intros middle middle_prev.
      sep_apply_l_atomic (addr_open__insert_before_dispatch_and_reassembly
        middle middle_prev head_dispatch_case last (getPtr previous) nil).
      Intros after_previous. Intros. subst middle.
      sep_apply_l_atomic (addr_nil__insert_before_dispatch_and_reassembly
        after_previous (getPtr previous) head_dispatch_case last).
      Intros. destruct H as [Hafter Hlast]. subst after_previous. subst last.
      Left. Right.
      Exists first middle_prev (ptrs prefix) (getPtr previous)
        old_next old_prev result (ptrs prefix ++ getPtr previous :: nil).
      entailer!.
Qed.

Lemma proof_of_DoubleLinkListInsertNodeBefore_return_wit_1 : DoubleLinkListInsertNodeBefore_return_wit_1.
Proof.
  pre_process.
  Exists result_2.
  split_pure_spatial.
  - sep_apply_r_atomic (store_dll_compose storeA_dispatch_case head_dispatch_case result_2).
    rewrite PreH4, PreH5, PreH6.
    sep_apply_r_atomic (addr_store_single__return_store_reassembly
      head_dispatch_case linklist_node_pre).
    entailer!.
  - entailer!.
    rewrite <- PreH1.
    exact PreH3.
Qed.

Lemma proof_of_DoubleLinkListInsertNodeBefore_return_wit_2 : DoubleLinkListInsertNodeBefore_return_wit_2.
Proof.
  pre_process.
  Exists result_2.
  split_pure_spatial.
  - sep_apply_r_atomic (store_dll_compose storeA_dispatch_case head_dispatch_case result_2).
    rewrite PreH4, PreH5, PreH6.
    sep_apply_r_atomic (addr_store_append__return_store_reassembly
      head_dispatch_case first prev before_prev prefix0 linklist_node_pre).
    entailer!.
  - entailer!.
    rewrite <- PreH1.
    exact PreH3.
Qed.

Lemma proof_of_DoubleLinkListInsertNodeBefore_return_wit_3 : DoubleLinkListInsertNodeBefore_return_wit_3.
Proof.
  pre_process.
  Exists result_2.
  split_pure_spatial.
  - sep_apply_r_atomic (store_dll_compose storeA_dispatch_case head_dispatch_case result_2).
    rewrite PreH3, PreH6, PreH7.
    sep_apply_r_atomic (addr_store_middle__return_store_reassembly
      head_dispatch_case first last prev before_prev prefix0 linklist_node_pre
      linklist_pre next nodes_after).
    entailer!.
  - entailer!.
Qed.

Lemma proof_of_DoubleLinkListInsertNodeBefore_return_wit_4 : DoubleLinkListInsertNodeBefore_return_wit_4.
Proof.
  pre_process.
  Exists result_2.
  split_pure_spatial.
  - sep_apply_r_atomic (store_dll_compose storeA_dispatch_case head_dispatch_case result_2).
    rewrite PreH4, PreH7, PreH8, PreH9, PreH10.
    simpl.
    sep_apply_r_atomic (addr_store_front__return_store_reassembly
      head_dispatch_case last linklist_node_pre first next nodes_after).
    entailer!.
  - entailer!.
    rewrite <- PreH1.
    exact PreH3.
Qed.

Lemma proof_of_DoubleLinkListInsertNodeBefore_derive_sentinel_case_by_dispatch_case : DoubleLinkListInsertNodeBefore_derive_sentinel_case_by_dispatch_case.
Proof.
  pre_process.
  prop_apply_p (head_absent__insert_before_dispatch_and_reassembly
    A storeA_sentinel_case linklist_pre nodes_sentinel_case).
  Intros_p Habs.
  Exists A storeA_sentinel_case data_sentinel_case linklist_pre nodes_sentinel_case.
  apply sepcon_cancel_end.
  - split_pure_spatial.
    + entailer!.
    + dump_pre_spatial.
      unfold xizi_double_link_insert_before_anchor.
      auto.
  - apply derivable1_wand_sepcon_adjoint.
    Intros result.
    match goal with
    | H : xizi_insert_before_payload _ _ _ _ |- _ => rename H into Hr
    end.
    destruct Hr as [(pre & cur & suf & E & P & N & R) | [N R]].
    + exfalso.
      apply Habs.
      rewrite E, ptrs_app.
      apply in_or_app.
      right.
      simpl.
      left.
      exact P.
    + subst result.
      entailer!.
Qed. 

Lemma proof_of_DoubleLinkListInsertNodeBefore_derive_member_case_by_dispatch_case : DoubleLinkListInsertNodeBefore_derive_member_case_by_dispatch_case.
Proof.
  pre_process.
  Exists A storeA_member_case data_member_case head_member_case nodes_member_case.
  apply sepcon_cancel_end.
  - split_pure_spatial.
    + entailer!.
    + dump_pre_spatial.
      unfold xizi_double_link_insert_before_anchor.
      auto.
  - apply derivable1_wand_sepcon_adjoint.
    entailer!.
Qed. 
