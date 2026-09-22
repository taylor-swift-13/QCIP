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
  assert (Hnext_fields_neq: forall p q p_next q_next,
    (&(p # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> p_next) **
    (&(q # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> q_next) |--
    “ p <> q ”).
  {
    intros p q p_next q_next.
    sep_apply_l_atomic
      (store_ptr_undef_store_ptr
        (&(p # "SysDoubleLinklistNode" ->ₛ "node_next")) p_next).
    sep_apply_l_atomic
      (store_ptr_undef_store_ptr
        (&(q # "SysDoubleLinklistNode" ->ₛ "node_next")) q_next).
    unfold undef_store_ptr.
    Intros.
    Intros.
    prop_apply
      (store_4byte_valid
        (&(p # "SysDoubleLinklistNode" ->ₛ "node_next"))
        (&(q # "SysDoubleLinklistNode" ->ₛ "node_next"))).
    Intros.
    dump_pre_spatial.
    intro Heq.
    subst q.
    lia.
  }
  assert (Hlinks_neq: forall p q p_next p_prev q_next q_prev,
    xizi_dll_links p p_next p_prev **
    xizi_dll_links q q_next q_prev |-- “ p <> q ”).
  {
    intros p q p_next p_prev q_next q_prev.
    unfold xizi_dll_links, XiziDLL.links,
      XiziDoubleLinkLayout.struct_name,
      XiziDoubleLinkLayout.next_field,
      XiziDoubleLinkLayout.prev_field.
    sep_apply_l_atomic
      (store_ptr_undef_store_ptr
        (&(p # "SysDoubleLinklistNode" ->ₛ "node_next")) p_next).
    sep_apply_l_atomic
      (store_ptr_undef_store_ptr
        (&(q # "SysDoubleLinklistNode" ->ₛ "node_next")) q_next).
    unfold undef_store_ptr.
    Intros.
    Intros.
    prop_apply
      (store_4byte_valid
        (&(p # "SysDoubleLinklistNode" ->ₛ "node_next"))
        (&(q # "SysDoubleLinklistNode" ->ₛ "node_next"))).
    Intros.
    dump_pre_spatial.
    intro Heq.
    subst q.
    lia.
  }
  assert (Hsplit: forall root prev stop last prefix node suffix,
    xizi_dllseg root prev stop last (prefix ++ node :: suffix) |--
    EX node_prev node_next,
      “ node <> NULL ” &&
      “ node <> stop ” &&
      xizi_dllseg root prev node node_prev prefix **
      xizi_dll_links node node_next node_prev **
      xizi_dllseg node_next node stop last suffix).
  {
    intros root prev stop last prefix.
    revert root prev.
    induction prefix as [| current prefix IH];
      intros root prev node suffix.
    - simpl.
      unfold xizi_dllseg, XiziDLL.dllseg at 1.
      simpl.
      Intros next.
      Intros.
      subst node.
      Exists prev next.
      unfold xizi_dll_links, XiziDLL.links,
        XiziDoubleLinkLayout.struct_name,
        XiziDoubleLinkLayout.next_field,
        XiziDoubleLinkLayout.prev_field.
      entailer!.
    - simpl.
      unfold xizi_dllseg, XiziDLL.dllseg at 1.
      simpl.
      Intros next.
      Intros.
      subst current.
      fold XiziDLL.dllseg.
      sep_apply (IH next root node suffix).
      Intros node_prev node_next.
      Intros.
      fold xizi_dll_links.
      L_sepcon_lift' (xizi_dll_links root next prev).
      L_sepcon_lift' (xizi_dll_links node node_next node_prev).
      prop_apply_p
        (Hlinks_neq root node next prev node_next node_prev).
      Intros.
      Exists node_prev node_next.
      simpl xizi_dllseg.
      Exists next.
      unfold xizi_dll_links, XiziDLL.links,
        XiziDoubleLinkLayout.struct_name,
        XiziDoubleLinkLayout.next_field,
        XiziDoubleLinkLayout.prev_field.
      entailer!.
  }
  assert (Hseg_stop_not_in: forall node prev stop last nodes,
    xizi_dllseg node prev stop last nodes |-- “ ~ In stop nodes ”).
  {
    intros node prev stop last nodes.
    revert node prev.
    induction nodes as [| current nodes IH]; intros node prev.
    - simpl.
      entailer!.
    - unfold xizi_dllseg, XiziDLL.dllseg at 1.
      simpl.
      Intros next.
      Intros.
      subst current.
      fold XiziDLL.dllseg.
      change
        (xizi_dll_links node next prev **
         xizi_dllseg next node stop last nodes |--
         “ ~ In stop (node :: nodes) ”).
      prop_apply_p (IH next node).
      Intros.
      dump_pre_spatial.
      intros [Heq | Hin]; contradiction.
  }
  assert (Hdll_head_nonnull: forall head nodes,
    xizi_dll head nodes |-- “ head <> NULL ”).
  {
    intros head nodes.
    unfold xizi_dll, XiziDLL.dll.
    Intros first last.
    entailer!.
  }
  assert (Hdll_node_nonnull: forall node,
    xizi_dll_node node |-- “ node <> NULL ”).
  {
    intros node.
    unfold xizi_dll_node.
    entailer!.
  }
  pre_process.
  prop_apply_p (Hdll_head_nonnull head_dispatch_case nodes_dispatch_case).
  Intros.
  prop_apply_p (Hdll_node_nonnull linklist_node_pre).
  Intros.
  destruct PreH1 as [Hin | Heq].
  - destruct
      (xizi_in_first_split__dll_insert_before_all_cases
        nodes_dispatch_case linklist_pre Hin)
      as [nodes_before [nodes_after [Hnodes Hnotin]]].
    subst nodes_dispatch_case.
    sep_apply (xizi_dll_open head_dispatch_case
      (nodes_before ++ linklist_pre :: nodes_after)).
    Intros first last.
    prop_apply_p
      (Hseg_stop_not_in first head_dispatch_case head_dispatch_case last
        (nodes_before ++ linklist_pre :: nodes_after)).
    Intros.
    rename H1 into Hhead_notin.
    sep_apply (Hsplit first head_dispatch_case head_dispatch_case last
      nodes_before linklist_pre nodes_after).
    Intros anchor_prev next.
    destruct nodes_before as [| current prefix].
    + simpl in Hnotin |- *.
      simpl xizi_dllseg.
      Intros.
      repeat match goal with Hc : _ /\ _ |- _ => destruct Hc end.
      subst_eqs.
      Left; Left; Left.
      Exists linklist_pre last next last anchor_prev nil nodes_after.
      simpl xizi_double_link_insert_before_nodes.
      unfold xizi_dll_links, XiziDLL.links,
        XiziDoubleLinkLayout.struct_name,
        XiziDoubleLinkLayout.next_field,
        XiziDoubleLinkLayout.prev_field.
      entailer!.
      destruct (Z.eq_dec linklist_pre linklist_pre);
        [reflexivity | contradiction].
    + destruct (list_snoc_destruct (current :: prefix))
        as [Hnil | [prev [prefix0 Hprefix]]].
      * discriminate.
      * rewrite Hprefix in *.
        assert (Hprev_head: prev <> head_dispatch_case).
        {
          intro Heq_prev.
          subst prev.
          apply Hhead_notin.
          apply in_or_app.
          left.
          apply in_or_app.
          right.
          simpl; auto.
        }
        sep_apply (Hsplit first head_dispatch_case linklist_pre anchor_prev
          prefix0 prev nil).
        Intros before_prev prev_next.
        simpl xizi_dllseg.
        Intros.
        repeat match goal with Hc : _ /\ _ |- _ => destruct Hc end.
        subst_eqs.
        Left; Left; Right.
        Exists first prefix0 last next before_prev anchor_prev
          (prefix0 ++ anchor_prev :: nil) nodes_after.
        pose proof
          (xizi_insert_before_first_occurrence__dll_insert_before_all_cases
            (prefix0 ++ anchor_prev :: nil) nodes_after linklist_pre
            linklist_node_pre Hnotin) as Hinsert.
        repeat rewrite app_assoc in Hinsert.
        simpl in Hinsert.
        unfold xizi_dll_links, XiziDLL.links,
          XiziDoubleLinkLayout.struct_name,
          XiziDoubleLinkLayout.next_field,
          XiziDoubleLinkLayout.prev_field.
        entailer!.
  - subst linklist_pre.
    sep_apply (xizi_dll_open head_dispatch_case nodes_dispatch_case).
    Intros first last.
    prop_apply_p
      (Hseg_stop_not_in first head_dispatch_case head_dispatch_case last
        nodes_dispatch_case).
    Intros.
    rename H1 into Hhead_notin_sentinel.
    destruct (list_snoc_destruct nodes_dispatch_case)
      as [Hnil | [prev [prefix0 Hnodes]]].
    + subst nodes_dispatch_case.
      simpl xizi_dllseg.
      Intros.
      repeat match goal with Hc : _ /\ _ |- _ => destruct Hc end.
      subst_eqs.
      Right.
      Exists last last last.
      simpl xizi_double_link_insert_before_nodes.
      unfold xizi_dll_links, XiziDLL.links,
        XiziDoubleLinkLayout.struct_name,
        XiziDoubleLinkLayout.next_field,
        XiziDoubleLinkLayout.prev_field.
      entailer!.
    + subst nodes_dispatch_case.
      assert (Hprev_head: prev <> head_dispatch_case).
      {
        intro Heq_prev.
        subst prev.
        apply Hhead_notin_sentinel.
        apply in_or_app.
        right.
        simpl; auto.
      }
      sep_apply (Hsplit first head_dispatch_case head_dispatch_case last
        prefix0 prev nil).
      Intros before_prev prev_next.
      simpl xizi_dllseg.
      Intros.
      repeat match goal with Hc : _ /\ _ |- _ => destruct Hc end.
      subst_eqs.
      Left; Right.
      Exists first before_prev prefix0 last.
      pose proof
        (xizi_insert_before_absent_append__dll_insert_before_all_cases
          (prefix0 ++ last :: nil) head_dispatch_case linklist_node_pre
          Hhead_notin_sentinel) as Hinsert.
      repeat rewrite app_assoc in Hinsert.
      simpl in Hinsert.
      unfold xizi_dll_links, XiziDLL.links,
        XiziDoubleLinkLayout.struct_name,
        XiziDoubleLinkLayout.next_field,
        XiziDoubleLinkLayout.prev_field.
      entailer!.
Qed.

Lemma proof_of_xizi_double_link_insert_before_return_wit_1 : xizi_double_link_insert_before_return_wit_1.
Proof.
  assert (Hnext_fields_neq: forall p q p_next q_next,
    (&(p # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> p_next) **
    (&(q # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> q_next) |--
    “ p <> q ”).
  {
    intros p q p_next q_next.
    sep_apply_l_atomic
      (store_ptr_undef_store_ptr
        (&(p # "SysDoubleLinklistNode" ->ₛ "node_next")) p_next).
    sep_apply_l_atomic
      (store_ptr_undef_store_ptr
        (&(q # "SysDoubleLinklistNode" ->ₛ "node_next")) q_next).
    unfold undef_store_ptr.
    Intros.
    Intros.
    prop_apply
      (store_4byte_valid
        (&(p # "SysDoubleLinklistNode" ->ₛ "node_next"))
        (&(q # "SysDoubleLinklistNode" ->ₛ "node_next"))).
    Intros.
    dump_pre_spatial.
    intro Heq.
    subst q.
    lia.
  }
  pre_process.
  subst linklist_pre nodes_dispatch_case first prev before_prev.
  L_sepcon_lift'
    (&(linklist_node_pre # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr
      |-> head_dispatch_case).
  L_sepcon_lift'
    (&(head_dispatch_case # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr
      |-> linklist_node_pre).
  prop_apply_p
    (Hnext_fields_neq linklist_node_pre head_dispatch_case
      head_dispatch_case linklist_node_pre).
  Intros.
  rewrite PreH5.
  unfold xizi_dll, XiziDLL.dll.
  Exists linklist_node_pre linklist_node_pre.
  simpl xizi_dllseg.
  simpl XiziDLL.dllseg.
  Exists head_dispatch_case.
  unfold XiziDLL.links,
    XiziDoubleLinkLayout.struct_name,
    XiziDoubleLinkLayout.next_field,
    XiziDoubleLinkLayout.prev_field.
  entailer!.
Qed.

Lemma proof_of_xizi_double_link_insert_before_return_wit_2 : xizi_double_link_insert_before_return_wit_2.
Proof.
  assert (Hnext_fields_neq: forall p q p_next q_next,
    (&(p # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> p_next) **
    (&(q # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> q_next) |--
    “ p <> q ”).
  {
    intros p q p_next q_next.
    sep_apply_l_atomic
      (store_ptr_undef_store_ptr
        (&(p # "SysDoubleLinklistNode" ->ₛ "node_next")) p_next).
    sep_apply_l_atomic
      (store_ptr_undef_store_ptr
        (&(q # "SysDoubleLinklistNode" ->ₛ "node_next")) q_next).
    unfold undef_store_ptr.
    Intros.
    Intros.
    prop_apply
      (store_4byte_valid
        (&(p # "SysDoubleLinklistNode" ->ₛ "node_next"))
        (&(q # "SysDoubleLinklistNode" ->ₛ "node_next"))).
    Intros.
    dump_pre_spatial.
    intro Heq.
    subst q.
    lia.
  }
  assert (Hjoin: forall root prev mid mid_prev stop last stop_next xs ys,
    (&(stop # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> stop_next) **
    xizi_dllseg root prev mid mid_prev xs **
    xizi_dllseg mid mid_prev stop last ys |--
    (&(stop # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> stop_next) **
    xizi_dllseg root prev stop last (xs ++ ys)).
  {
    intros root prev mid mid_prev stop last stop_next xs.
    revert root prev.
    induction xs as [| current xs IH]; intros root prev ys.
    - simpl.
      unfold xizi_dllseg, XiziDLL.dllseg at 1.
      simpl.
      Intros.
      destruct H as [Hroot Hprev].
      subst root prev.
      entailer!.
    - simpl.
      unfold xizi_dllseg, XiziDLL.dllseg at 1.
      simpl.
      Intros next.
      Intros.
      subst current.
      fold XiziDLL.dllseg.
      fold xizi_dllseg.
      unfold xizi_dll_links, XiziDLL.links,
        XiziDoubleLinkLayout.struct_name,
        XiziDoubleLinkLayout.next_field,
        XiziDoubleLinkLayout.prev_field.
      try (L_sepcon_lift'
        (&(stop # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr
          |-> stop_next)).
      prop_apply_p (Hnext_fields_neq stop root stop_next next).
      Intros.
      try (L_sepcon_lift'
        (&(root # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr
          |-> prev)).
      try (L_sepcon_lift'
        (&(root # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr
          |-> next)).
      try (L_sepcon_lift'
        (&(stop # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr
          |-> stop_next)).
      try (L_sepcon_lift'
        (&(root # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr
          |-> prev)).
      try (L_sepcon_lift'
        (&(root # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr
          |-> next)).
      sep_apply (IH next root ys).
      simpl xizi_dllseg.
      Exists next.
      unfold xizi_dll_links, XiziDLL.links,
        XiziDoubleLinkLayout.struct_name,
        XiziDoubleLinkLayout.next_field,
        XiziDoubleLinkLayout.prev_field.
      entailer!.
  }
  assert (Htwo_seg: forall prev before_prev inserted head,
    prev <> NULL -> prev <> head -> inserted <> NULL -> inserted <> head ->
    xizi_dll_links prev inserted before_prev **
    xizi_dll_links inserted head prev |--
    xizi_dllseg prev before_prev head inserted (prev :: inserted :: nil)).
  {
    intros prev before_prev inserted head Hprev0 Hprevhead Hins0 Hinshead.
    simpl xizi_dllseg.
    Exists inserted.
    Exists head.
    unfold xizi_dll_links, XiziDLL.links,
      XiziDoubleLinkLayout.struct_name,
      XiziDoubleLinkLayout.next_field,
      XiziDoubleLinkLayout.prev_field.
    entailer!.
  }
  pre_process.
  subst linklist_pre nodes_dispatch_case.
  L_sepcon_lift'
    (&(linklist_node_pre # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr
      |-> head_dispatch_case).
  L_sepcon_lift'
    (&(head_dispatch_case # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr
      |-> first).
  prop_apply_p
    (Hnext_fields_neq linklist_node_pre head_dispatch_case
      head_dispatch_case first).
  Intros.
  try (L_sepcon_lift'
    (&(linklist_node_pre # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr
      |-> prev)).
  try (L_sepcon_lift'
    (&(linklist_node_pre # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr
      |-> head_dispatch_case)).
  try (L_sepcon_lift'
    (&(prev # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr
      |-> before_prev)).
  try (L_sepcon_lift'
    (&(prev # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr
      |-> linklist_node_pre)).
  try (L_sepcon_lift'
    (&(head_dispatch_case # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr
      |-> linklist_node_pre)).
  try (L_sepcon_lift'
    (&(head_dispatch_case # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr
      |-> first)).
  try (L_sepcon_lift'
    (xizi_dllseg first head_dispatch_case prev before_prev prefix0)).
  pose proof
    (Htwo_seg prev before_prev linklist_node_pre head_dispatch_case
      PreH7 PreH8 PreH1 H) as Htwo.
  unfold xizi_dll_links, XiziDLL.links,
    XiziDoubleLinkLayout.struct_name,
    XiziDoubleLinkLayout.next_field,
    XiziDoubleLinkLayout.prev_field in Htwo.
  rewrite (derivable1_sepcon_assoc1
    (&(prev # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr
      |-> linklist_node_pre)
    (&(prev # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr
      |-> before_prev)
    ((&(linklist_node_pre # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr
        |-> head_dispatch_case) **
     (&(linklist_node_pre # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr
        |-> prev))).
  rewrite Htwo.
  clear Htwo.
  sep_apply (Hjoin first head_dispatch_case prev before_prev
    head_dispatch_case linklist_node_pre first prefix0
    (prev :: linklist_node_pre :: nil)).
  try (L_sepcon_lift'
    (&(head_dispatch_case # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr
      |-> linklist_node_pre)).
  try (L_sepcon_lift'
    (&(head_dispatch_case # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr
      |-> first)).
  pose proof
    (xizi_dll_close head_dispatch_case first linklist_node_pre
      (prefix0 ++ prev :: linklist_node_pre :: nil) PreH3) as Hclose.
  unfold xizi_dll_links, XiziDLL.links,
    XiziDoubleLinkLayout.struct_name,
    XiziDoubleLinkLayout.next_field,
    XiziDoubleLinkLayout.prev_field in Hclose.
  rewrite (derivable1_sepcon_assoc1
    (&(head_dispatch_case # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr
      |-> first)
    (&(head_dispatch_case # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr
      |-> linklist_node_pre)
    (xizi_dllseg first head_dispatch_case head_dispatch_case
      linklist_node_pre (prefix0 ++ prev :: linklist_node_pre :: nil))).
  rewrite Hclose.
  clear Hclose.
  rewrite PreH5.
  rewrite <- app_assoc.
  simpl.
  entailer!.
Qed.

Lemma proof_of_xizi_double_link_insert_before_return_wit_3 : xizi_double_link_insert_before_return_wit_3.
Proof.
  assert (Hnext_fields_neq: forall p q p_next q_next,
    (&(p # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> p_next) **
    (&(q # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> q_next) |--
    “ p <> q ”).
  {
    intros p q p_next q_next.
    sep_apply_l_atomic
      (store_ptr_undef_store_ptr
        (&(p # "SysDoubleLinklistNode" ->ₛ "node_next")) p_next).
    sep_apply_l_atomic
      (store_ptr_undef_store_ptr
        (&(q # "SysDoubleLinklistNode" ->ₛ "node_next")) q_next).
    unfold undef_store_ptr.
    Intros.
    Intros.
    prop_apply
      (store_4byte_valid
        (&(p # "SysDoubleLinklistNode" ->ₛ "node_next"))
        (&(q # "SysDoubleLinklistNode" ->ₛ "node_next"))).
    Intros.
    dump_pre_spatial.
    intro Heq.
    subst q.
    lia.
  }
  assert (Hjoin: forall root prev mid mid_prev stop last stop_next xs ys,
    (&(stop # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> stop_next) **
    xizi_dllseg root prev mid mid_prev xs **
    xizi_dllseg mid mid_prev stop last ys |--
    (&(stop # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> stop_next) **
    xizi_dllseg root prev stop last (xs ++ ys)).
  {
    intros root prev mid mid_prev stop last stop_next xs.
    revert root prev.
    induction xs as [| current xs IH]; intros root prev ys.
    - simpl.
      unfold xizi_dllseg, XiziDLL.dllseg at 1.
      simpl.
      Intros.
      destruct H as [Hroot Hprev].
      subst root prev.
      entailer!.
    - simpl.
      unfold xizi_dllseg, XiziDLL.dllseg at 1.
      simpl.
      Intros next0.
      Intros.
      subst current.
      fold XiziDLL.dllseg.
      fold xizi_dllseg.
      unfold xizi_dll_links, XiziDLL.links,
        XiziDoubleLinkLayout.struct_name,
        XiziDoubleLinkLayout.next_field,
        XiziDoubleLinkLayout.prev_field.
      try (L_sepcon_lift'
        (&(stop # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr
          |-> stop_next)).
      prop_apply_p (Hnext_fields_neq stop root stop_next next0).
      Intros.
      try (L_sepcon_lift'
        (&(root # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr
          |-> prev)).
      try (L_sepcon_lift'
        (&(root # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr
          |-> next0)).
      try (L_sepcon_lift'
        (&(stop # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr
          |-> stop_next)).
      try (L_sepcon_lift'
        (&(root # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr
          |-> prev)).
      try (L_sepcon_lift'
        (&(root # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr
          |-> next0)).
      sep_apply (IH next0 root ys).
      simpl xizi_dllseg.
      Exists next0.
      unfold xizi_dll_links, XiziDLL.links,
        XiziDoubleLinkLayout.struct_name,
        XiziDoubleLinkLayout.next_field,
        XiziDoubleLinkLayout.prev_field.
      entailer!.
  }
  assert (Hthree_seg: forall prev before_prev inserted anchor next0 stop last rest,
    prev <> NULL -> prev <> stop ->
    inserted <> NULL -> inserted <> stop ->
    anchor <> NULL -> anchor <> stop ->
    xizi_dll_links prev inserted before_prev **
    xizi_dll_links inserted anchor prev **
    xizi_dll_links anchor next0 inserted **
    xizi_dllseg next0 anchor stop last rest |--
    xizi_dllseg prev before_prev stop last
      (prev :: inserted :: anchor :: rest)).
  {
    intros prev before_prev inserted anchor next0 stop last rest
      Hprev0 Hprevstop Hins0 Hinsstop Hanchor0 Hanchorstop.
    simpl xizi_dllseg.
    Exists inserted.
    Exists anchor.
    Exists next0.
    unfold xizi_dll_links, XiziDLL.links,
      XiziDoubleLinkLayout.struct_name,
      XiziDoubleLinkLayout.next_field,
      XiziDoubleLinkLayout.prev_field.
    entailer!.
  }
  pre_process.
  L_sepcon_lift'
    (&(linklist_node_pre # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr
      |-> linklist_pre).
  L_sepcon_lift'
    (&(head_dispatch_case # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr
      |-> first).
  prop_apply_p
    (Hnext_fields_neq linklist_node_pre head_dispatch_case
      linklist_pre first).
  Intros.
  try (L_sepcon_lift'
    (xizi_dllseg next linklist_pre head_dispatch_case last nodes_after)).
  try (L_sepcon_lift'
    (&(linklist_pre # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr
      |-> linklist_node_pre)).
  try (L_sepcon_lift'
    (&(linklist_pre # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr
      |-> next)).
  try (L_sepcon_lift'
    (&(linklist_node_pre # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr
      |-> prev)).
  try (L_sepcon_lift'
    (&(linklist_node_pre # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr
      |-> linklist_pre)).
  try (L_sepcon_lift'
    (&(prev # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr
      |-> before_prev)).
  try (L_sepcon_lift'
    (&(prev # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr
      |-> linklist_node_pre)).
  try (L_sepcon_lift'
    (xizi_dllseg first head_dispatch_case prev before_prev prefix0)).
  try (L_sepcon_lift'
    (&(head_dispatch_case # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr
      |-> last)).
  try (L_sepcon_lift'
    (&(head_dispatch_case # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr
      |-> first)).
  pose proof
    (Hthree_seg prev before_prev linklist_node_pre linklist_pre next
      head_dispatch_case last nodes_after PreH10 PreH11 PreH1 H PreH7 PreH8)
    as Hthree.
  unfold xizi_dll_links, XiziDLL.links,
    XiziDoubleLinkLayout.struct_name,
    XiziDoubleLinkLayout.next_field,
    XiziDoubleLinkLayout.prev_field in Hthree.
  rewrite (derivable1_sepcon_assoc1
    (&(prev # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr
      |-> linklist_node_pre)
    (&(prev # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr
      |-> before_prev)
    ((&(linklist_node_pre # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr
        |-> linklist_pre) **
     ((&(linklist_node_pre # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr
        |-> prev) **
      ((&(linklist_pre # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr
        |-> next) **
       ((&(linklist_pre # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr
        |-> linklist_node_pre) **
        xizi_dllseg next linklist_pre head_dispatch_case last nodes_after))))).
  rewrite (derivable1_sepcon_assoc1
    (&(linklist_node_pre # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr
      |-> linklist_pre)
    (&(linklist_node_pre # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr
      |-> prev)
    ((&(linklist_pre # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr
      |-> next) **
     ((&(linklist_pre # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr
      |-> linklist_node_pre) **
      xizi_dllseg next linklist_pre head_dispatch_case last nodes_after))).
  rewrite (derivable1_sepcon_assoc1
    (&(linklist_pre # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr
      |-> next)
    (&(linklist_pre # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr
      |-> linklist_node_pre)
    (xizi_dllseg next linklist_pre head_dispatch_case last nodes_after)).
  rewrite (derivable1_sepcon_assoc1
    ((&(prev # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr
        |-> linklist_node_pre) **
     (&(prev # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr
        |-> before_prev))
    ((&(linklist_node_pre # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr
        |-> linklist_pre) **
     (&(linklist_node_pre # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr
        |-> prev))
    (((&(linklist_pre # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr
        |-> next) **
      (&(linklist_pre # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr
        |-> linklist_node_pre)) **
     xizi_dllseg next linklist_pre head_dispatch_case last nodes_after)).
  rewrite (derivable1_sepcon_assoc1
    (((&(prev # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr
        |-> linklist_node_pre) **
      (&(prev # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr
        |-> before_prev)) **
     ((&(linklist_node_pre # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr
        |-> linklist_pre) **
      (&(linklist_node_pre # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr
        |-> prev)))
    ((&(linklist_pre # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr
      |-> next) **
     (&(linklist_pre # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr
      |-> linklist_node_pre))
    (xizi_dllseg next linklist_pre head_dispatch_case last nodes_after)).
  rewrite Hthree.
  clear Hthree.
  sep_apply (Hjoin first head_dispatch_case prev before_prev
    head_dispatch_case last first prefix0
    (prev :: linklist_node_pre :: linklist_pre :: nodes_after)).
  try (L_sepcon_lift'
    (&(head_dispatch_case # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr
      |-> last)).
  try (L_sepcon_lift'
    (&(head_dispatch_case # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr
      |-> first)).
  pose proof
    (xizi_dll_close head_dispatch_case first last
      (prefix0 ++ prev :: linklist_node_pre :: linklist_pre :: nodes_after)
      PreH2) as Hclose.
  unfold xizi_dll_links, XiziDLL.links,
    XiziDoubleLinkLayout.struct_name,
    XiziDoubleLinkLayout.next_field,
    XiziDoubleLinkLayout.prev_field in Hclose.
  rewrite (derivable1_sepcon_assoc1
    (&(head_dispatch_case # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr
      |-> first)
    (&(head_dispatch_case # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr
      |-> last)
    (xizi_dllseg first head_dispatch_case head_dispatch_case last
      (prefix0 ++ prev :: linklist_node_pre :: linklist_pre :: nodes_after))).
  rewrite Hclose.
  clear Hclose.
  rewrite PreH6, PreH9.
  rewrite <- app_assoc.
  simpl.
  entailer!.
Qed.

Lemma proof_of_xizi_double_link_insert_before_return_wit_4 : xizi_double_link_insert_before_return_wit_4.
Proof.
  assert (Hnext_fields_neq: forall p q p_next q_next,
    (&(p # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> p_next) **
    (&(q # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> q_next) |--
    “ p <> q ”).
  {
    intros p q p_next q_next.
    sep_apply_l_atomic
      (store_ptr_undef_store_ptr
        (&(p # "SysDoubleLinklistNode" ->ₛ "node_next")) p_next).
    sep_apply_l_atomic
      (store_ptr_undef_store_ptr
        (&(q # "SysDoubleLinklistNode" ->ₛ "node_next")) q_next).
    unfold undef_store_ptr.
    Intros.
    Intros.
    prop_apply
      (store_4byte_valid
        (&(p # "SysDoubleLinklistNode" ->ₛ "node_next"))
        (&(q # "SysDoubleLinklistNode" ->ₛ "node_next"))).
    Intros.
    dump_pre_spatial.
    intro Heq.
    subst q.
    lia.
  }
  assert (Hcons_seg: forall node prev stop last next rest,
    node <> NULL -> node <> stop ->
    xizi_dll_links node next prev **
    xizi_dllseg next node stop last rest |--
    xizi_dllseg node prev stop last (node :: rest)).
  {
    intros node prev stop last next rest Hnonnull Hnotstop.
    simpl xizi_dllseg.
    Exists next.
    unfold xizi_dll_links, XiziDLL.links,
      XiziDoubleLinkLayout.struct_name,
      XiziDoubleLinkLayout.next_field,
      XiziDoubleLinkLayout.prev_field.
    entailer!.
  }
  pre_process.
  subst linklist_pre nodes_before prev before_prev nodes_dispatch_case.
  L_sepcon_lift'
    (&(linklist_node_pre # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr
      |-> first).
  L_sepcon_lift'
    (&(head_dispatch_case # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr
      |-> linklist_node_pre).
  prop_apply_p
    (Hnext_fields_neq linklist_node_pre head_dispatch_case
      first linklist_node_pre).
  Intros.
  pose proof
    (Hcons_seg first linklist_node_pre head_dispatch_case last next
      nodes_after PreH8 PreH9) as Hcons.
  unfold xizi_dll_links, XiziDLL.links,
    XiziDoubleLinkLayout.struct_name,
    XiziDoubleLinkLayout.next_field,
    XiziDoubleLinkLayout.prev_field in Hcons.
  rewrite (derivable1_sepcon_assoc1
    (&(first # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> next)
    (&(first # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr
      |-> linklist_node_pre)
    (xizi_dllseg next first head_dispatch_case last nodes_after)).
  rewrite Hcons.
  clear Hcons.
  try (L_sepcon_lift'
    (xizi_dllseg first linklist_node_pre head_dispatch_case last
      (first :: nodes_after))).
  try (L_sepcon_lift'
    (&(linklist_node_pre # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr
      |-> head_dispatch_case)).
  try (L_sepcon_lift'
    (&(linklist_node_pre # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr
      |-> first)).
  try (L_sepcon_lift'
    (&(head_dispatch_case # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr
      |-> last)).
  try (L_sepcon_lift'
    (&(head_dispatch_case # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr
      |-> linklist_node_pre)).
  pose proof
    (xizi_dll_nonempty_rev head_dispatch_case linklist_node_pre first last
      (first :: nodes_after) PreH3 PreH1 H) as Hrev.
  unfold xizi_dll_links, XiziDLL.links,
    XiziDoubleLinkLayout.struct_name,
    XiziDoubleLinkLayout.next_field,
    XiziDoubleLinkLayout.prev_field in Hrev.
  rewrite (derivable1_sepcon_assoc1
    (&(head_dispatch_case # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr
      |-> linklist_node_pre)
    (&(head_dispatch_case # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr
      |-> last)
    ((&(linklist_node_pre # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr
      |-> first) **
     ((&(linklist_node_pre # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr
      |-> head_dispatch_case) **
      xizi_dllseg first linklist_node_pre head_dispatch_case last
        (first :: nodes_after)))).
  rewrite (derivable1_sepcon_assoc1
    (&(linklist_node_pre # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr
      |-> first)
    (&(linklist_node_pre # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr
      |-> head_dispatch_case)
    (xizi_dllseg first linklist_node_pre head_dispatch_case last
      (first :: nodes_after))).
  rewrite (derivable1_sepcon_assoc1
    ((&(head_dispatch_case # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr
      |-> linklist_node_pre) **
     (&(head_dispatch_case # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr
      |-> last))
    ((&(linklist_node_pre # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr
      |-> first) **
     (&(linklist_node_pre # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr
      |-> head_dispatch_case))
    (xizi_dllseg first linklist_node_pre head_dispatch_case last
      (first :: nodes_after))).
  rewrite Hrev.
  clear Hrev.
  rewrite PreH7.
  entailer!.
Qed.

Lemma proof_of_xizi_double_link_insert_before_derive_sentinel_case_by_dispatch_case : xizi_double_link_insert_before_derive_sentinel_case_by_dispatch_case.
Proof.
  assert (Hseg_stop_not_in: forall node prev stop last nodes,
    xizi_dllseg node prev stop last nodes |-- “ ~ In stop nodes ”).
  {
    intros node prev stop last nodes.
    revert node prev.
    induction nodes as [| current nodes IH]; intros node prev.
    - simpl.
      entailer!.
    - unfold xizi_dllseg, XiziDLL.dllseg at 1.
      simpl.
      Intros next.
      Intros.
      subst current.
      fold XiziDLL.dllseg.
      change
        (xizi_dll_links node next prev **
         xizi_dllseg next node stop last nodes |--
         “ ~ In stop (node :: nodes) ”).
      prop_apply_p (IH next node).
      Intros.
      dump_pre_spatial.
      intros [Heq | Hin].
      * contradiction.
      * contradiction.
  }
  assert (Hdll_head_not_in: forall head nodes,
    xizi_dll head nodes |-- “ ~ In head nodes ”).
  {
    intros head nodes.
    sep_apply (xizi_dll_open head nodes).
    Intros first last.
    prop_apply_p (Hseg_stop_not_in first head head last nodes).
    Intros.
    entailer!.
  }
  pre_process.
  prop_apply_p (Hdll_head_not_in linklist_pre nodes_sentinel_case).
  Intros.
  Exists linklist_pre nodes_sentinel_case.
  rewrite
    (xizi_insert_before_absent_append__dll_insert_before_all_cases
      nodes_sentinel_case linklist_pre linklist_node_pre H).
  unfold xizi_double_link_insert_before_anchor.
  entailer!.
  apply_sepcon_adjoint.
  elim_emp.
  apply derivable1_refl.
Qed.

Lemma proof_of_xizi_double_link_insert_before_derive_member_case_by_dispatch_case : xizi_double_link_insert_before_derive_member_case_by_dispatch_case.
Proof.
  pre_process.
  Exists head_member_case nodes_member_case.
  unfold xizi_double_link_insert_before_anchor.
  entailer!.
  apply_sepcon_adjoint.
  elim_emp.
  apply derivable1_refl.
Qed.
