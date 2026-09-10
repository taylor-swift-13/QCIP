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
Local Open Scope sac.

Lemma proof_of_DoubleLinkListLenGet_entail_wit_1 : DoubleLinkListLenGet_entail_wit_1.
Proof.
  pre_process.
  sep_apply_l_atomic (dll_decompose__storeA_shared storeA_general linklist_pre nodes_general).
  unfold xizi_dll, XiziDLL.dll.
  Intros first last. Intros.
  Exists last first (@nil Z) (xizi_dll_ptrs nodes_general).
  unfold XiziDLL.links.
  rewrite dll_ptrs_Zlength__dll_len_payload_cycle.
  entailer!.
Qed. 

Lemma proof_of_DoubleLinkListLenGet_entail_wit_2_1 : DoubleLinkListLenGet_entail_wit_2_1.
Proof.
  pre_process.
  sep_apply_l_atomic
    (xizi_dllseg_unfold_full__dll_len_payload_cycle
      next tmp_node linklist_pre last_2 todo_2 PreH1).
  Intros next3 rest.
  Intros.
  sep_apply_l_atomic
    (xizi_dll_links_fold__dll_len_payload_cycle
      tmp_node next prev_2).
  sep_apply_l_atomic
    (xizi_dllseg_advance__dll_len_payload_cycle
      first_2 linklist_pre tmp_node prev_2 next next3 before_2 PreH7).
    Intros.
    Exists next3 tmp_node last_2 first_2
      ((before_2 ++ tmp_node :: nil)%list)
      ((done_2 ++ next :: nil)%list) rest.
    rewrite unsigned_last_nbits_eq.
    + entailer!.
      * rewrite PreH6.
        reflexivity.
      * rewrite H in PreH5.
        rewrite Zlength_cons in PreH5.
        rewrite Zlength_app, Zlength_cons, Zlength_nil.
        unfold Z.succ in PreH5 |-.
        change (Zlength nodes_general = Zlength done_2 + 1 + Zlength rest).
        lia.
      * rewrite Zlength_app, Zlength_cons, Zlength_nil.
        lia.
      * rewrite PreH2, H.
        rewrite <- app_assoc.
        reflexivity.
    + split.
      * pose proof (Zlength_nonneg done_2).
        lia.
      * rewrite PreH4, PreH6, Zlength_app, Zlength_cons, Zlength_nil.
        unfold Z.succ.
        replace (0 + 1)%Z with 1 by reflexivity.
        replace (Zlength before_2 + 1 + 1)%Z
          with (Zlength before_2 + 2)%Z by lia.
        exact H1.
Qed. 

Lemma proof_of_DoubleLinkListLenGet_entail_wit_2_2 : DoubleLinkListLenGet_entail_wit_2_2.
Proof.
  pre_process.
  sep_apply_l_atomic
    (xizi_dllseg_unfold_full__dll_len_payload_cycle
      first_2 linklist_pre linklist_pre last_2 todo_2 PreH1).
  Intros next2 rest.
  Intros.
  subst tmp_node.
  Exists next2 linklist_pre last_2 first_2
    (@nil Z) (first_2 :: nil)%list rest.
  rewrite unsigned_last_nbits_eq.
  - unfold xizi_dllseg, XiziDLL.dllseg at 2.
    simpl.
    entailer!.
    + rewrite H in PreH5.
      rewrite Zlength_cons in PreH5.
      unfold Z.succ in PreH5 |-.
      rewrite PreH6, Zlength_nil in PreH5.
      change (Zlength nodes_general = 1 + Zlength rest).
      lia.
    + rewrite PreH4, PreH6, Zlength_nil, Zlength_cons, Zlength_nil.
      unfold Z.succ.
      reflexivity.
    + rewrite PreH2, PreH6, H.
      reflexivity.
  - rewrite PreH4, PreH6, Zlength_nil.
    split; lia.
Qed. 

Lemma proof_of_DoubleLinkListLenGet_return_wit_1 : DoubleLinkListLenGet_return_wit_1.
Proof.
  pre_process.
  subst next.
  sep_apply_l_atomic
    (xizi_dllseg_stop__dll_len_payload_cycle
      linklist_pre tmp_node last todo).
  Intros.
  subst todo.
  subst last.
  subst done.
  rewrite app_nil_r in PreH2.

  sep_apply_l_atomic
    (xizi_dll_links_fold__dll_len_payload_cycle
      tmp_node linklist_pre prev).
  sep_apply_l_atomic
    (xizi_dll_links_fold__dll_len_payload_cycle
      linklist_pre first tmp_node).
  sep_apply_l_atomic
    (xizi_dllseg_snoc__dll_len_payload_cycle
      first linklist_pre tmp_node prev linklist_pre first before PreH7).
  sep_apply_l_atomic
    (xizi_dll_close
      linklist_pre first tmp_node (before ++ tmp_node :: nil) PreH3).
  rewrite <- PreH2.
  sep_apply_l_atomic (dll_compose__storeA_shared storeA_general linklist_pre nodes_general).
  entailer!. rewrite Zlength_nil in PreH5. lia.
Qed. 

Lemma proof_of_DoubleLinkListLenGet_return_wit_2 : DoubleLinkListLenGet_return_wit_2.
Proof.
  pre_process.
  subst first.
  subst tmp_node.
  sep_apply_l_atomic
    (xizi_dllseg_stop__dll_len_payload_cycle
      linklist_pre linklist_pre last todo).
  Intros.
  subst todo.
  subst last.
  rewrite PreH6 in PreH2, PreH4.
  simpl in PreH2, PreH4.

  sep_apply_l_atomic
    (xizi_dll_links_fold__dll_len_payload_cycle
      linklist_pre linklist_pre linklist_pre).
  sep_apply_l_atomic (xizi_dll_empty_rev linklist_pre PreH3).
  rewrite <- PreH2.
  sep_apply_l_atomic (dll_compose__storeA_shared storeA_general linklist_pre nodes_general).
  entailer!. rewrite PreH6 in PreH5. rewrite !Zlength_nil in PreH4, PreH5. rewrite Zlength_nil in PreH5. lia.
Qed. 

Lemma proof_of_DoubleLinkListLenGet_derive_nil_case_by_general : DoubleLinkListLenGet_derive_nil_case_by_general.
Proof.
  pre_process.
  Exists A storeA_nil_case (@nil (XiziStoreADLL.DL_Node A)).
  apply sepcon_cancel_end.
  - cancel.
  - apply derivable1_wand_sepcon_adjoint.
    Intros retval_2. Intros.
    Exists retval_2.
    entailer!.
Qed. 

