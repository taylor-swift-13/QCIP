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

Lemma proof_of_xizi_double_link_insert_before_entail_wit_1 : xizi_double_link_insert_before_entail_wit_1.
Proof.
  assert (xizi_dll_links_neq__dll_insert_before_decompose_rebuild :
    forall p q p_next p_prev q_next q_prev,
    xizi_dll_links p p_next p_prev ** xizi_dll_links q q_next q_prev |--
    “ p <> q ”).
  {
    intros.
    unfold xizi_dll_links, XiziDLL.links.
    sep_apply_l_atomic
      (store_ptr_undef_store_ptr
        (&(p # XiziDoubleLinkLayout.struct_name ->ₛ
             XiziDoubleLinkLayout.next_field)) p_next).
    sep_apply_l_atomic
      (store_ptr_undef_store_ptr
        (&(q # XiziDoubleLinkLayout.struct_name ->ₛ
             XiziDoubleLinkLayout.next_field)) q_next).
    unfold undef_store_ptr.
    Intros.
    Intros.
    prop_apply
      (store_4byte_valid
        (&(p # XiziDoubleLinkLayout.struct_name ->ₛ
             XiziDoubleLinkLayout.next_field))
        (&(q # XiziDoubleLinkLayout.struct_name ->ₛ
             XiziDoubleLinkLayout.next_field))).
    Intros.
    dump_pre_spatial.
    intro Heq.
    subst q.
    lia.
  }
  assert (xizi_dll_links_node_neq__dll_insert_before_decompose_rebuild :
    forall p p_next p_prev q,
    xizi_dll_links p p_next p_prev ** xizi_dll_node q |--
    “ p <> q ”).
  {
    intros.
    unfold xizi_dll_links, XiziDLL.links, xizi_dll_node.
    Intros.
    sep_apply_l_atomic
      (store_ptr_undef_store_ptr
        (&(p # XiziDoubleLinkLayout.struct_name ->ₛ
             XiziDoubleLinkLayout.next_field)) p_next).
    unfold poly_undef_store, undef_store_ptr.
    Intros.
    Intros.
    prop_apply
      (store_4byte_valid
        (&(p # XiziDoubleLinkLayout.struct_name ->ₛ
             XiziDoubleLinkLayout.next_field))
        (&(q # XiziDoubleLinkLayout.struct_name ->ₛ
             XiziDoubleLinkLayout.next_field))).
    Intros.
    dump_pre_spatial.
    intro Heq.
    subst q.
    lia.
  }
  assert (xizi_dllseg_split_at_anchor__dll_insert_before_decompose_rebuild :
    forall node prev stop last prefix anchor suffix,
    xizi_dllseg node prev stop last (prefix ++ anchor :: suffix) |--
    EX anchor_prev next,
      “ anchor <> NULL ” &&
      “ anchor <> stop ” &&
      xizi_dllseg node prev anchor anchor_prev prefix **
      xizi_dll_links anchor next anchor_prev **
      xizi_dllseg next anchor stop last suffix).
  {
    intros node prev stop last prefix.
    revert node prev.
    induction prefix as [| expected prefix IH]; intros node prev anchor suffix.
    - simpl.
      Intros next.
      Intros.
      subst anchor.
      Exists prev next.
      simpl.
      unfold xizi_dll_links, XiziDLL.links.
      entailer!.
    - simpl.
      Intros next.
      Intros.
      fold xizi_dll_links.
      sep_apply (IH next node anchor suffix).
      Intros anchor_prev anchor_next.
      Intros.
      Intros.
      Exists anchor_prev anchor_next.
      prop_apply
        (xizi_dll_links_neq__dll_insert_before_decompose_rebuild
           node anchor next prev anchor_next anchor_prev).
      Intros.
      simpl.
      Exists next.
      unfold xizi_dll_links.
      entailer!.
  }
  pre_process.
  sep_apply_l_atomic
    (xizi_dll_open head (prefix ++ linklist_pre :: suffix)).
  Intros first last.
  sep_apply_l_atomic
    (xizi_dllseg_split_at_anchor__dll_insert_before_decompose_rebuild
       first head head last prefix linklist_pre suffix).
  Intros before_prev next.
  Intros.
  Intros.
  destruct (list_snoc_destruct prefix) as [Hnil | [prev [prefix0 Happ]]].
  - subst prefix.
    simpl.
    Intros_p Hseg_nil.
    destruct Hseg_nil as [Hfirst Hbefore].
    subst first before_prev.
    prop_apply
        (xizi_dll_links_neq__dll_insert_before_decompose_rebuild
           linklist_pre head next head linklist_pre last).
    Intros.
    prop_apply
          (xizi_dll_links_node_neq__dll_insert_before_decompose_rebuild
             head linklist_pre last linklist_node_pre).
    Intros.
    prop_apply
            (xizi_dll_links_node_neq__dll_insert_before_decompose_rebuild
               linklist_pre next head linklist_node_pre).
    Intros.
    Left.
    Exists last next last head.
    unfold xizi_dll_links, XiziDLL.links.
    entailer!.
  - subst prefix.
    sep_apply_l_atomic
      (xizi_dllseg_split_at_anchor__dll_insert_before_decompose_rebuild
         first head linklist_pre before_prev prefix0 prev (@nil Z)).
    Intros prev_before prev_next.
    Intros.
    Intros.
    simpl.
    Intros_p Hseg_nil.
    destruct Hseg_nil as [Hnext Hprev].
    subst prev_next before_prev.
    prop_apply
        (xizi_dll_links_node_neq__dll_insert_before_decompose_rebuild
           head first last linklist_node_pre).
    Intros.
    prop_apply
          (xizi_dll_links_node_neq__dll_insert_before_decompose_rebuild
             linklist_pre next prev linklist_node_pre).
    Intros.
    prop_apply
            (xizi_dll_links_neq__dll_insert_before_decompose_rebuild
               prev head linklist_pre prev_before first last).
    Intros.
    prop_apply
               (xizi_dll_links_node_neq__dll_insert_before_decompose_rebuild
                  prev linklist_pre prev_before linklist_node_pre).
    Intros.
    Right.
    Exists first prefix0 last next prev_before prev.
    unfold xizi_dll_links, XiziDLL.links.
    entailer!.
Qed.

Lemma proof_of_xizi_double_link_insert_before_return_wit_1 : xizi_double_link_insert_before_return_wit_1.
Proof.
  assert (xizi_dll_links_neq__dll_insert_before_decompose_rebuild :
    forall p q p_next p_prev q_next q_prev,
    xizi_dll_links p p_next p_prev ** xizi_dll_links q q_next q_prev |--
    “ p <> q ”).
  {
    intros.
    unfold xizi_dll_links, XiziDLL.links.
    sep_apply_l_atomic
      (store_ptr_undef_store_ptr
        (&(p # XiziDoubleLinkLayout.struct_name ->ₛ
             XiziDoubleLinkLayout.next_field)) p_next).
    sep_apply_l_atomic
      (store_ptr_undef_store_ptr
        (&(q # XiziDoubleLinkLayout.struct_name ->ₛ
             XiziDoubleLinkLayout.next_field)) q_next).
    unfold undef_store_ptr.
    Intros.
    Intros.
    prop_apply
      (store_4byte_valid
        (&(p # XiziDoubleLinkLayout.struct_name ->ₛ
             XiziDoubleLinkLayout.next_field))
        (&(q # XiziDoubleLinkLayout.struct_name ->ₛ
             XiziDoubleLinkLayout.next_field))).
    Intros.
    dump_pre_spatial.
    intro Heq.
    subst q.
    lia.
  }
  assert (xizi_dllseg_join_to_head__dll_insert_before_decompose_rebuild :
    forall head first last node prev mid mid_prev prefix tail,
    xizi_dll_links head first last **
    (xizi_dllseg node prev mid mid_prev prefix **
     xizi_dllseg mid mid_prev head last tail) |--
    xizi_dll_links head first last **
    xizi_dllseg node prev head last (prefix ++ tail)).
  {
    intros head first last node prev mid mid_prev prefix.
    revert node prev.
    induction prefix as [| expected prefix IH]; intros node prev tail.
    - simpl.
      Intros.
      destruct H as [Hnode Hprev].
      subst node prev.
      entailer!.
    - simpl.
      Intros next.
      Intros.
      subst expected.
      Exists next.
      fold xizi_dll_links.
      prop_apply
        (xizi_dll_links_neq__dll_insert_before_decompose_rebuild
           node head next prev first last).
      Intros.
      rewrite (IH next node tail).
      entailer!.
  }
  pre_process.
  unfold xizi_dll, XiziDLL.dll.
  Exists first last.
  unfold xizi_double_link_insert_before_nodes.
  rewrite PreH8.
  simpl.
  rewrite <- app_assoc.
  simpl.
  entailer!.
  fold xizi_dll_links.
  fold xizi_dllseg.
  sep_apply_r_atomic
    (xizi_dllseg_join_to_head__dll_insert_before_decompose_rebuild
       head first last first head prev before_prev prefix0
       (prev :: linklist_node_pre :: linklist_pre :: suffix)).
  simpl.
  Exists linklist_node_pre.
  simpl.
  Exists linklist_pre.
  simpl.
  Exists next.
  unfold xizi_dll_links, XiziDLL.links.
  entailer!.
Qed.

Lemma proof_of_xizi_double_link_insert_before_return_wit_2 : xizi_double_link_insert_before_return_wit_2.
Proof.
  pre_process.
  subst first prev before_prev prefix.
  unfold xizi_double_link_insert_before_nodes.
  simpl.
  unfold xizi_dll, XiziDLL.dll.
  Exists linklist_node_pre last.
  simpl.
  Exists linklist_pre.
  simpl.
  Exists next.
  unfold xizi_dll_links, XiziDLL.links.
  entailer!.
Qed.
