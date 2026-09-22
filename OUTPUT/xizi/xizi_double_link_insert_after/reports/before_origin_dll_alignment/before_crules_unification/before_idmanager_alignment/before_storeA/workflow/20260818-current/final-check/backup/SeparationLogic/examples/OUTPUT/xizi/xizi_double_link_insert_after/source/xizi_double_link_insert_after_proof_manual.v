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

Lemma proof_of_xizi_double_link_insert_after_entail_wit_1 : xizi_double_link_insert_after_entail_wit_1.
Proof.
  assert (links_neq : forall p q p_next p_prev q_next q_prev,
    xizi_dll_links p p_next p_prev ** xizi_dll_links q q_next q_prev |--
    “ p <> q ”).
  {
    intros p q p_next p_prev q_next q_prev.
    destruct (Z.eq_dec p q) as [Heq | Hneq].
    - subst q.
      unfold xizi_dll_links, XiziDLL.links.
      transitivity
        ((&(p # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> p_next **
          &(p # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> q_next) **
         (&(p # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> p_prev **
          &(p # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> q_prev)).
      + entailer!.
      + sep_apply_l_atomic
          (dup_store_ptr
            (&(p # "SysDoubleLinklistNode" ->ₛ "node_next")) p_next q_next).
        entailer!.
    - entailer!.
  }
  assert (split_at_anchor : forall node prev stop last prefix anchor suffix,
    xizi_dllseg node prev stop last (prefix ++ anchor :: suffix) |--
    EX anchor_prev next,
      “ anchor <> NULL ” &&
      xizi_dllseg node prev anchor anchor_prev prefix **
      xizi_dll_links anchor next anchor_prev **
      xizi_dllseg next anchor stop last suffix).
  {
    intros node prev stop last prefix.
    revert node prev.
    induction prefix as [| x xs IH]; intros node prev anchor suffix.
    - simpl.
      unfold xizi_dllseg, XiziDLL.dllseg at 1.
      simpl.
      Intros next.
      Intros.
      subst node.
      Exists prev next.
      simpl.
      unfold xizi_dll_links, XiziDLL.links.
      entailer!.
    - simpl app.
      unfold xizi_dllseg, XiziDLL.dllseg at 1.
      simpl.
      Intros next.
      Intros.
      subst node.
      change (xizi_dll_links x next prev **
        xizi_dllseg next x stop last (xs ++ anchor :: suffix) |--
        EX anchor_prev anchor_next,
          “ anchor <> NULL ” &&
          xizi_dllseg x prev anchor anchor_prev (x :: xs) **
          xizi_dll_links anchor anchor_next anchor_prev **
          xizi_dllseg anchor_next anchor stop last suffix).
      sep_apply_l_atomic (IH next x anchor suffix).
      Intros anchor_prev anchor_next.
      Exists anchor_prev anchor_next.
      simpl.
      Exists next.
      prop_apply
        (links_neq x anchor next prev anchor_next anchor_prev).
      Intros.
      unfold xizi_dll_links, XiziDLL.links.
      entailer!.
  }
  assert (first_occurrence : forall (anchor : Z) (nodes : list Z),
    In anchor nodes ->
    exists prefix suffix,
      nodes = prefix ++ anchor :: suffix /\ ~ In anchor prefix).
  {
    intros anchor nodes Hin.
    induction nodes as [| x xs IH].
    - inversion Hin.
    - simpl in Hin.
      destruct (Z.eq_dec x anchor) as [Heq | Hneq].
      + subst x.
        exists nil, xs.
        simpl.
        split; [reflexivity | tauto].
      + destruct Hin as [Heq | Hin].
        * contradiction.
        * destruct (IH Hin) as [prefix [suffix [Hnodes Hnotin]]].
          exists (x :: prefix), suffix.
          split.
          -- simpl. rewrite Hnodes. reflexivity.
          -- simpl. intros [Heq | Hinprefix].
             ++ contradiction.
             ++ contradiction.
  }
  assert (insert_first : forall (prefix suffix : list Z) (anchor inserted : Z),
    ~ In anchor prefix ->
    xizi_double_link_insert_after_nodes
      (prefix ++ anchor :: suffix) anchor inserted =
    prefix ++ anchor :: inserted :: suffix).
  {
    induction prefix as [| x xs IH]; intros suffix anchor inserted Hnotin.
    - simpl.
      destruct (Z.eq_dec anchor anchor); [reflexivity | contradiction].
    - simpl in Hnotin |- *.
      assert (Hneq : x <> anchor).
      { intro Heq. apply Hnotin. left. exact Heq. }
      assert (Hnotin_xs : ~ In anchor xs).
      { intro Hin. apply Hnotin. right. exact Hin. }
      destruct (Z.eq_dec x anchor) as [Heq | Hneq']; [contradiction |].
      f_equal.
      apply IH.
      exact Hnotin_xs.
  }
  unfold xizi_double_link_insert_after_entail_wit_1.
  intros linklist_node_pre linklist_pre nodes head PreH1.
  destruct (first_occurrence linklist_pre nodes PreH1)
    as [nodes_before [nodes_after [Hnodes Hnotin]]].
  subst nodes.
  unfold xizi_dll, XiziDLL.dll.
  Intros first last.
  sep_apply_l_atomic
    (split_at_anchor first head head last nodes_before linklist_pre nodes_after).
  Intros old_prev old_next.
  Intros.
  destruct nodes_after as [| next rest].
  - Left.
    simpl xizi_dllseg.
    Intros.
    destruct H1 as [Hnext Hlast].
    subst old_next; subst last.
    Exists old_prev first nodes_before nil.
    unfold xizi_dll_links, XiziDLL.links, xizi_dll_node.
    rewrite (insert_first nodes_before nil linklist_pre linklist_node_pre Hnotin).
    entailer!.
  - Right.
    simpl xizi_dllseg.
    Intros next_next.
    Intros.
    subst old_next.
    Exists next_next old_prev last first next rest nodes_before (next :: rest).
    unfold xizi_dll_links, XiziDLL.links, xizi_dll_node.
    rewrite
      (insert_first nodes_before (next :: rest) linklist_pre
         linklist_node_pre Hnotin).
    entailer!.
Qed.

Lemma proof_of_xizi_double_link_insert_after_return_wit_1 : xizi_double_link_insert_after_return_wit_1.
Proof.
  assert (links_neq : forall p q p_next p_prev q_next q_prev,
    xizi_dll_links p p_next p_prev ** xizi_dll_links q q_next q_prev |--
    “ p <> q ”).
  {
    intros p q p_next p_prev q_next q_prev.
    destruct (Z.eq_dec p q) as [Heq | Hneq].
    - subst q.
      unfold xizi_dll_links, XiziDLL.links.
      transitivity
        ((&(p # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> p_next **
          &(p # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> q_next) **
         (&(p # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> p_prev **
          &(p # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> q_prev)).
      + entailer!.
      + sep_apply_l_atomic
          (dup_store_ptr
            (&(p # "SysDoubleLinklistNode" ->ₛ "node_next")) p_next q_next).
        entailer!.
    - entailer!.
  }
  assert (join_to_head :
    forall head0 head_next head_prev node prev mid mid_prev prefix tail,
      xizi_dll_links head0 head_next head_prev **
      (xizi_dllseg node prev mid mid_prev prefix **
       xizi_dllseg mid mid_prev head0 head_prev tail) |--
      xizi_dll_links head0 head_next head_prev **
      xizi_dllseg node prev head0 head_prev (prefix ++ tail)).
  {
    intros head0 head_next head_prev node prev mid mid_prev prefix.
    revert node prev.
    induction prefix as [| x xs IH]; intros node prev tail.
    - simpl app.
      unfold xizi_dllseg, XiziDLL.dllseg at 1.
      simpl.
      Intros.
      destruct H as [Hnode Hprev].
      subst node; subst prev.
      entailer!.
    - simpl app.
      unfold xizi_dllseg, XiziDLL.dllseg at 1.
      simpl.
      Intros next.
      Intros.
      subst node.
      fold XiziDLL.dllseg.
      fold xizi_dllseg.
      fold xizi_dll_links.
      prop_apply
        (links_neq head0 x head_next head_prev next prev).
      Intros.
      transitivity
        (xizi_dll_links x next prev **
         (xizi_dll_links head0 head_next head_prev **
          (xizi_dllseg next x mid mid_prev xs **
           xizi_dllseg mid mid_prev head0 head_prev tail))).
      + entailer!.
      + transitivity
          (xizi_dll_links x next prev **
           (xizi_dll_links head0 head_next head_prev **
            xizi_dllseg next x head0 head_prev (xs ++ tail))).
        * cancel (xizi_dll_links x next prev).
          apply (IH next x tail).
        * Exists next.
          unfold xizi_dll_links, XiziDLL.links.
          entailer!.
  }
  assert (prepend_two :
    forall node prev inserted next stop last tail,
      node <> NULL -> node <> stop ->
      inserted <> NULL -> inserted <> stop ->
      xizi_dll_links node inserted prev **
      xizi_dll_links inserted next node **
      xizi_dllseg next inserted stop last tail |--
      xizi_dllseg node prev stop last (node :: inserted :: tail)).
  {
    intros node prev inserted next stop last tail
      Hnode_nonnull Hnode_neq Hins_nonnull Hins_neq.
    simpl.
    Exists inserted next.
    unfold xizi_dll_links, XiziDLL.links.
    entailer!.
  }
  assert (prepend_one :
    forall node prev next stop last tail,
      node <> NULL -> node <> stop ->
      xizi_dll_links node next prev **
      xizi_dllseg next node stop last tail |--
      xizi_dllseg node prev stop last (node :: tail)).
  {
    intros node prev next stop last tail Hnonnull Hneq.
    simpl.
    Exists next.
    unfold xizi_dll_links, XiziDLL.links.
    entailer!.
  }
  assert (join_insert_after :
    forall head0 first0 last0 anchor old_prev0 inserted after prefix suffix,
      head0 <> NULL -> anchor <> NULL -> inserted <> NULL ->
      xizi_dll_links head0 first0 last0 **
      xizi_dllseg first0 head0 anchor old_prev0 prefix **
      xizi_dll_links anchor inserted old_prev0 **
      xizi_dll_links inserted after anchor **
      xizi_dllseg after inserted head0 last0 suffix |--
      xizi_dll head0 (prefix ++ anchor :: inserted :: suffix)).
  {
    intros head0 first0 last0 anchor old_prev0 inserted after prefix suffix
      Hhead Hanchor Hinserted.
    prop_apply
      (links_neq head0 anchor first0 last0 inserted old_prev0).
    Intros.
    prop_apply
      (links_neq head0 inserted first0 last0 after anchor).
    Intros.
    transitivity
      (xizi_dll_links head0 first0 last0 **
        (xizi_dllseg first0 head0 anchor old_prev0 prefix **
         (xizi_dll_links anchor inserted old_prev0 **
          xizi_dll_links inserted after anchor **
          xizi_dllseg after inserted head0 last0 suffix))).
    - entailer!.
    - transitivity
        (xizi_dll_links head0 first0 last0 **
          (xizi_dllseg first0 head0 anchor old_prev0 prefix **
           xizi_dllseg anchor old_prev0 head0 last0
             (anchor :: inserted :: suffix))).
      + cancel (xizi_dll_links head0 first0 last0).
        cancel (xizi_dllseg first0 head0 anchor old_prev0 prefix).
        transitivity
          (xizi_dll_links anchor inserted old_prev0 **
           xizi_dll_links inserted after anchor **
           xizi_dllseg after inserted head0 last0 suffix).
        * entailer!.
        * apply
            (prepend_two anchor old_prev0 inserted after head0 last0 suffix);
            try assumption; congruence.
      + transitivity
          (xizi_dll_links head0 first0 last0 **
           xizi_dllseg first0 head0 head0 last0
             (prefix ++ anchor :: inserted :: suffix)).
        * apply
            (join_to_head head0 first0 last0 first0 head0 anchor old_prev0
              prefix (anchor :: inserted :: suffix)).
        * apply xizi_dll_close; assumption.
  }
  assert (join_insert_after_nonempty :
    forall head0 first0 last0 anchor old_prev0 inserted old_next0 next_next0
      prefix rest0,
      head0 <> NULL -> anchor <> NULL -> inserted <> NULL ->
      old_next0 <> NULL ->
      xizi_dll_links inserted old_next0 anchor **
      xizi_dll_links head0 first0 last0 **
      xizi_dllseg first0 head0 anchor old_prev0 prefix **
      xizi_dll_links anchor inserted old_prev0 **
      xizi_dll_links old_next0 next_next0 inserted **
      xizi_dllseg next_next0 old_next0 head0 last0 rest0 |--
      xizi_dll head0 (prefix ++ anchor :: inserted :: old_next0 :: rest0)).
  {
    intros head0 first0 last0 anchor old_prev0 inserted old_next0 next_next0
      prefix rest0 Hhead Hanchor Hinserted Hold_next.
    transitivity
      (xizi_dll_links head0 first0 last0 **
       xizi_dll_links old_next0 next_next0 inserted **
       (xizi_dll_links inserted old_next0 anchor **
        xizi_dllseg first0 head0 anchor old_prev0 prefix **
        xizi_dll_links anchor inserted old_prev0 **
        xizi_dllseg next_next0 old_next0 head0 last0 rest0)).
    - entailer!.
    - prop_apply
        (links_neq head0 old_next0 first0 last0 next_next0 inserted).
      Intros.
      assert (Hold_next_head : old_next0 <> head0) by congruence.
      transitivity
        (xizi_dll_links head0 first0 last0 **
         (xizi_dllseg first0 head0 anchor old_prev0 prefix **
          (xizi_dll_links anchor inserted old_prev0 **
           (xizi_dll_links inserted old_next0 anchor **
            (xizi_dll_links old_next0 next_next0 inserted **
             xizi_dllseg next_next0 old_next0 head0 last0 rest0))))).
      + entailer!.
      + transitivity
          (xizi_dll_links head0 first0 last0 **
           (xizi_dllseg first0 head0 anchor old_prev0 prefix **
            (xizi_dll_links anchor inserted old_prev0 **
             (xizi_dll_links inserted old_next0 anchor **
              xizi_dllseg old_next0 inserted head0 last0
                (old_next0 :: rest0))))).
        * cancel (xizi_dll_links head0 first0 last0).
          cancel (xizi_dllseg first0 head0 anchor old_prev0 prefix).
          cancel (xizi_dll_links anchor inserted old_prev0).
          cancel (xizi_dll_links inserted old_next0 anchor).
          transitivity
            (xizi_dll_links old_next0 next_next0 inserted **
             xizi_dllseg next_next0 old_next0 head0 last0 rest0).
          -- entailer!.
          -- apply
               (prepend_one old_next0 inserted next_next0 head0 last0 rest0);
               assumption.
        * transitivity
            (xizi_dll_links head0 first0 last0 **
             xizi_dllseg first0 head0 anchor old_prev0 prefix **
             xizi_dll_links anchor inserted old_prev0 **
             xizi_dll_links inserted old_next0 anchor **
             xizi_dllseg old_next0 inserted head0 last0
               (old_next0 :: rest0)).
          -- entailer!.
          -- apply
               (join_insert_after head0 first0 last0 anchor old_prev0 inserted
                 old_next0 prefix (old_next0 :: rest0)); assumption.
  }
  pre_process.
  subst nodes_after.
  rewrite PreH4.
  transitivity
    (xizi_dll_links linklist_node_pre old_next linklist_pre **
     xizi_dll_links head first last **
     xizi_dllseg first head linklist_pre old_prev nodes_before **
     xizi_dll_links linklist_pre linklist_node_pre old_prev **
     xizi_dll_links old_next next_next linklist_node_pre **
     xizi_dllseg next_next old_next head last rest).
  - unfold xizi_dll_links, XiziDLL.links.
    entailer!.
  - apply
      (join_insert_after_nonempty head first last linklist_pre old_prev
        linklist_node_pre old_next next_next nodes_before rest);
      assumption.
Qed.

Lemma proof_of_xizi_double_link_insert_after_return_wit_2 : xizi_double_link_insert_after_return_wit_2.
Proof.
  assert (links_neq : forall p q p_next p_prev q_next q_prev,
    xizi_dll_links p p_next p_prev ** xizi_dll_links q q_next q_prev |--
    “ p <> q ”).
  {
    intros p q p_next p_prev q_next q_prev.
    destruct (Z.eq_dec p q) as [Heq | Hneq].
    - subst q.
      unfold xizi_dll_links, XiziDLL.links.
      transitivity
        ((&(p # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> p_next **
          &(p # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> q_next) **
         (&(p # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> p_prev **
          &(p # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> q_prev)).
      + entailer!.
      + sep_apply_l_atomic
          (dup_store_ptr
            (&(p # "SysDoubleLinklistNode" ->ₛ "node_next")) p_next q_next).
        entailer!.
    - entailer!.
  }
  assert (join_to_head :
    forall head0 head_next head_prev node prev mid mid_prev prefix tail,
      xizi_dll_links head0 head_next head_prev **
      (xizi_dllseg node prev mid mid_prev prefix **
       xizi_dllseg mid mid_prev head0 head_prev tail) |--
      xizi_dll_links head0 head_next head_prev **
      xizi_dllseg node prev head0 head_prev (prefix ++ tail)).
  {
    intros head0 head_next head_prev node prev mid mid_prev prefix.
    revert node prev.
    induction prefix as [| x xs IH]; intros node prev tail.
    - simpl app.
      unfold xizi_dllseg, XiziDLL.dllseg at 1.
      simpl.
      Intros.
      destruct H as [Hnode Hprev].
      subst node; subst prev.
      entailer!.
    - simpl app.
      unfold xizi_dllseg, XiziDLL.dllseg at 1.
      simpl.
      Intros next.
      Intros.
      subst node.
      fold XiziDLL.dllseg.
      fold xizi_dllseg.
      fold xizi_dll_links.
      prop_apply
        (links_neq head0 x head_next head_prev next prev).
      Intros.
      transitivity
        (xizi_dll_links x next prev **
         (xizi_dll_links head0 head_next head_prev **
          (xizi_dllseg next x mid mid_prev xs **
           xizi_dllseg mid mid_prev head0 head_prev tail))).
      + entailer!.
      + transitivity
          (xizi_dll_links x next prev **
           (xizi_dll_links head0 head_next head_prev **
            xizi_dllseg next x head0 head_prev (xs ++ tail))).
        * cancel (xizi_dll_links x next prev).
          apply (IH next x tail).
        * Exists next.
          unfold xizi_dll_links, XiziDLL.links.
          entailer!.
  }
  assert (prepend_two :
    forall node prev inserted next stop last tail,
      node <> NULL -> node <> stop ->
      inserted <> NULL -> inserted <> stop ->
      xizi_dll_links node inserted prev **
      xizi_dll_links inserted next node **
      xizi_dllseg next inserted stop last tail |--
      xizi_dllseg node prev stop last (node :: inserted :: tail)).
  {
    intros node prev inserted next stop last tail
      Hnode_nonnull Hnode_neq Hins_nonnull Hins_neq.
    simpl.
    Exists inserted next.
    unfold xizi_dll_links, XiziDLL.links.
    entailer!.
  }
  assert (join_insert_after :
    forall head0 first0 last0 anchor old_prev0 inserted after prefix suffix,
      head0 <> NULL -> anchor <> NULL -> inserted <> NULL ->
      xizi_dll_links head0 first0 last0 **
      xizi_dllseg first0 head0 anchor old_prev0 prefix **
      xizi_dll_links anchor inserted old_prev0 **
      xizi_dll_links inserted after anchor **
      xizi_dllseg after inserted head0 last0 suffix |--
      xizi_dll head0 (prefix ++ anchor :: inserted :: suffix)).
  {
    intros head0 first0 last0 anchor old_prev0 inserted after prefix suffix
      Hhead Hanchor Hinserted.
    prop_apply
      (links_neq head0 anchor first0 last0 inserted old_prev0).
    Intros.
    prop_apply
      (links_neq head0 inserted first0 last0 after anchor).
    Intros.
    transitivity
      (xizi_dll_links head0 first0 last0 **
        (xizi_dllseg first0 head0 anchor old_prev0 prefix **
         (xizi_dll_links anchor inserted old_prev0 **
          xizi_dll_links inserted after anchor **
          xizi_dllseg after inserted head0 last0 suffix))).
    - entailer!.
    - transitivity
        (xizi_dll_links head0 first0 last0 **
          (xizi_dllseg first0 head0 anchor old_prev0 prefix **
           xizi_dllseg anchor old_prev0 head0 last0
             (anchor :: inserted :: suffix))).
      + cancel (xizi_dll_links head0 first0 last0).
        cancel (xizi_dllseg first0 head0 anchor old_prev0 prefix).
        transitivity
          (xizi_dll_links anchor inserted old_prev0 **
           xizi_dll_links inserted after anchor **
           xizi_dllseg after inserted head0 last0 suffix).
        * entailer!.
        * apply
            (prepend_two anchor old_prev0 inserted after head0 last0 suffix);
            try assumption; congruence.
      + transitivity
          (xizi_dll_links head0 first0 last0 **
           xizi_dllseg first0 head0 head0 last0
             (prefix ++ anchor :: inserted :: suffix)).
        * apply
            (join_to_head head0 first0 last0 first0 head0 anchor old_prev0
              prefix (anchor :: inserted :: suffix)).
        * apply xizi_dll_close; assumption.
  }
  pre_process.
  subst nodes_after.
  rewrite PreH4.
  transitivity
    (xizi_dll_links linklist_node_pre head linklist_pre **
     xizi_dll_links head first linklist_node_pre **
     xizi_dllseg first head linklist_pre old_prev nodes_before **
     xizi_dll_links linklist_pre linklist_node_pre old_prev).
  - unfold xizi_dll_links, XiziDLL.links.
    entailer!.
  - transitivity
      (xizi_dll_links head first linklist_node_pre **
       xizi_dllseg first head linklist_pre old_prev nodes_before **
       xizi_dll_links linklist_pre linklist_node_pre old_prev **
       xizi_dll_links linklist_node_pre head linklist_pre **
       xizi_dllseg head linklist_node_pre head linklist_node_pre nil).
    + simpl.
      entailer!.
    + apply
        (join_insert_after head first linklist_node_pre linklist_pre old_prev
          linklist_node_pre head nodes_before nil);
        assumption.
Qed.
