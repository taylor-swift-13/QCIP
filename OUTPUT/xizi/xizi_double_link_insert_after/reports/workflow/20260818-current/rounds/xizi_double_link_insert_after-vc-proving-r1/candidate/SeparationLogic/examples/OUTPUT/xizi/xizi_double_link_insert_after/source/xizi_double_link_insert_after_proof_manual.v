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
  assert (Hextract : forall nodes first prev stop last anchor,
    In anchor nodes ->
    XiziDLL.dllseg first prev stop last nodes
    |--
    EX prefix suffix old_prev next,
      “ nodes = prefix ++ anchor :: suffix /\
        ~ In anchor prefix /\ anchor <> NULL /\ anchor <> stop ” &&
      XiziDLL.dllseg first prev anchor old_prev prefix **
      XiziDLL.links anchor next old_prev **
      XiziDLL.dllseg next anchor stop last suffix).
  { induction nodes as [| represented rest IH]; intros first prev stop last anchor Hin.
    - contradiction.
    - simpl.
      Intros next.
      Intros.
      subst first.
      destruct (Z.eq_dec represented anchor) as [Heq | Hneq].
      + subst represented.
        Exists nil rest prev next.
        simpl.
        unfold XiziDLL.links.
        entailer!.
      + destruct Hin as [Heq | Hinrest]; [contradiction |].
        sep_apply (IH next represented stop last anchor Hinrest).
        Intros prefix suffix old_prev found_next.
        match goal with
        | Hsplit : rest = prefix ++ anchor :: suffix /\ _ |- _ =>
            destruct Hsplit as [Hseq [Hfirst [Hanchor0 Hanchorstop]]]
        end.
        Exists (represented :: prefix) suffix old_prev found_next.
        simpl.
        Exists next.
        unfold XiziDLL.links.
        entailer!.
        * rewrite Hseq.
          reflexivity.
        * intros [Heq | Hinprefix]; [contradiction | auto]. }
  unfold xizi_double_link_insert_after_entail_wit_1.
  intros linklist_node_pre linklist_pre nodes_dispatch_case head_dispatch_case
    Hanchor.
  destruct Hanchor as [Hin | Heq].
  - unfold xizi_dll, XiziDLL.dll.
    Intros first last.
    Intros.
    sep_apply (Hextract nodes_dispatch_case first head_dispatch_case
      head_dispatch_case last linklist_pre Hin).
    Intros nodes_before nodes_after old_prev old_next.
    match goal with
    | Hsplit : nodes_dispatch_case = nodes_before ++ linklist_pre :: nodes_after /\ _ |- _ =>
        destruct Hsplit as [Hseq [Hfirst [Hlink0 Hlink_head]]]
    end.
    assert (Hdispatch :
      xizi_double_link_insert_after_dispatch_nodes head_dispatch_case
        nodes_dispatch_case linklist_pre linklist_node_pre =
      nodes_before ++ linklist_pre :: linklist_node_pre :: nodes_after).
    { unfold xizi_double_link_insert_after_dispatch_nodes.
      destruct (Z.eq_dec linklist_pre head_dispatch_case) as [Heq | Hneq].
      - contradiction.
      - rewrite Hseq.
        apply xizi_insert_after_first_occurrence__implementation_dll_split_reassembly.
        exact Hfirst. }
    destruct nodes_after as [| next_node rest].
    + simpl XiziDLL.dllseg.
      Intros_p Htail.
      match goal with
      | Htail' : old_next = head_dispatch_case /\ linklist_pre = last |- _ =>
          destruct Htail' as [Hnext Hlast]
      end.
      subst old_next last.
      Left; Left; Right.
      Exists old_prev first nodes_before (@nil Z).
      unfold xizi_dll_node, xizi_dllseg, XiziDLL.links.
      entailer!.
    + simpl XiziDLL.dllseg.
      Intros next_next.
      Intros.
      subst old_next.
      Left; Left; Left.
      Exists next_next old_prev last first next_node rest nodes_before
        (next_node :: rest).
      unfold xizi_dll_node, xizi_dllseg, XiziDLL.links.
      entailer!.
  - subst linklist_pre.
    unfold xizi_dll, XiziDLL.dll.
    Intros first last.
    Intros.
    assert (Hdispatch :
      xizi_double_link_insert_after_dispatch_nodes head_dispatch_case
        nodes_dispatch_case head_dispatch_case linklist_node_pre =
      linklist_node_pre :: nodes_dispatch_case).
    { unfold xizi_double_link_insert_after_dispatch_nodes.
      destruct (Z.eq_dec head_dispatch_case head_dispatch_case);
        [reflexivity | contradiction]. }
    destruct nodes_dispatch_case as [| old_next rest].
    + simpl XiziDLL.dllseg.
      Intros_p Hempty.
      match goal with
      | Hempty' : first = head_dispatch_case /\ head_dispatch_case = last |- _ =>
          destruct Hempty' as [Hfirst Hlast]
      end.
      subst first last.
      Right.
      Exists head_dispatch_case head_dispatch_case head_dispatch_case.
      unfold xizi_dll_node, XiziDLL.links.
      entailer!.
    + simpl XiziDLL.dllseg.
      Intros next_next.
      Intros.
      subst first.
      Left; Right.
      Exists next_next last old_next rest.
      unfold xizi_dll_node, xizi_dllseg, XiziDLL.links.
      entailer!.
Qed.

Lemma proof_of_xizi_double_link_insert_after_return_wit_1 : xizi_double_link_insert_after_return_wit_1.
Proof.
  unfold xizi_double_link_insert_after_return_wit_1.
  left.
  intros.
  subst linklist_pre nodes_dispatch_case first last old_next.
  destruct (Z.eq_dec linklist_node_pre head_dispatch_case) as [Heq | Hneq].
  - subst linklist_node_pre.
    sep_apply (dup_store_ptr
      (&( head_dispatch_case # "SysDoubleLinklistNode" ->ₛ "node_next"))
      head_dispatch_case head_dispatch_case).
    entailer!.
  - unfold xizi_dll, XiziDLL.dll.
    rewrite PreH5.
    Exists linklist_node_pre linklist_node_pre.
    unfold xizi_dllseg, XiziDLL.dllseg, XiziDLL.links.
    simpl.
    Exists head_dispatch_case.
    entailer!.
Qed.

Lemma proof_of_xizi_double_link_insert_after_return_wit_2 : xizi_double_link_insert_after_return_wit_2.
Proof.
  assert (Hnext_neq : forall p q v1 v2,
    &(p # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> v1 **
    &(q # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> v2
    |-- “ p <> q ”).
  { intros p q v1 v2.
    destruct (Z.eq_dec p q) as [Heq | Hneq].
    - subst q.
      sep_apply (dup_store_ptr
        (&( p # "SysDoubleLinklistNode" ->ₛ "node_next")) v1 v2).
      entailer!.
    - entailer!. }
  unfold xizi_double_link_insert_after_return_wit_2.
  left.
  intros.
  subst linklist_pre nodes_dispatch_case.
  prop_apply (Hnext_neq linklist_node_pre head_dispatch_case old_next linklist_node_pre).
  Intros.
  prop_apply (Hnext_neq head_dispatch_case old_next linklist_node_pre next_next).
  Intros.
  unfold xizi_dll, XiziDLL.dll.
  rewrite PreH5.
  Exists linklist_node_pre last.
  unfold xizi_dllseg, XiziDLL.dllseg, XiziDLL.links.
  simpl.
  Exists old_next next_next.
  entailer!.
Qed.

Lemma proof_of_xizi_double_link_insert_after_return_wit_3 : xizi_double_link_insert_after_return_wit_3.
Proof.
  assert (Hlinks_neq : forall p q p_next p_prev q_next q_prev,
    XiziDLL.links p p_next p_prev ** XiziDLL.links q q_next q_prev
    |-- “ p <> q ”).
  { intros p q p_next p_prev q_next q_prev.
    unfold XiziDLL.links.
    destruct (Z.eq_dec p q) as [Heq | Hneq].
    - subst q.
      eapply derivable1_trans with
        (y := ((&( p # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> q_next) **
               (&( p # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> p_next)) **
              ((&( p # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> p_prev) **
               (&( p # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> q_prev))).
      + entailer!.
      + sep_apply (dup_store_ptr
          (&( p # "SysDoubleLinklistNode" ->ₛ "node_next")) q_next p_next).
        entailer!.
    - entailer!. }
  assert (Hcompose : forall prefix stop head_first last first prev mid old_prev
      inserted after suffix,
    mid <> NULL ->
    inserted <> NULL ->
    XiziDLL.links stop head_first last **
    XiziDLL.dllseg first prev mid old_prev prefix **
    XiziDLL.links mid inserted old_prev **
    XiziDLL.links inserted after mid **
    XiziDLL.dllseg after inserted stop last suffix
    |--
    XiziDLL.links stop head_first last **
    XiziDLL.dllseg first prev stop last (prefix ++ mid :: inserted :: suffix)).
  { induction prefix as [| represented rest IH].
    - intros stop head_first last first prev mid old_prev inserted after suffix
        Hmid Hins.
      simpl.
      Intros_p Hempty.
      destruct Hempty as [Hfirst Hprev].
      subst first old_prev.
      prop_apply (Hlinks_neq stop mid head_first last inserted prev).
      Intros.
      prop_apply (Hlinks_neq stop inserted head_first last after mid).
      Intros.
      simpl.
      Exists inserted after.
      unfold XiziDLL.links.
      entailer!.
    - intros stop head_first last first prev mid old_prev inserted after suffix
        Hmid Hins.
      simpl.
      Intros next.
      Intros.
      subst first.
      prop_apply (Hlinks_neq stop represented head_first last next prev).
      Intros.
      simpl.
      Exists next.
      sep_apply (IH stop head_first last next represented mid old_prev
        inserted after suffix Hmid Hins).
      unfold XiziDLL.links.
      entailer!. }
  assert (Hcompose_empty : forall prefix stop head_first first prev mid old_prev
      inserted,
    mid <> NULL ->
    inserted <> NULL ->
    XiziDLL.links stop head_first inserted **
    XiziDLL.dllseg first prev mid old_prev prefix **
    XiziDLL.links mid inserted old_prev **
    XiziDLL.links inserted stop mid
    |--
    XiziDLL.links stop head_first inserted **
    XiziDLL.dllseg first prev stop inserted (prefix ++ mid :: inserted :: nil)).
  { intros prefix stop head_first first prev mid old_prev inserted Hmid Hins.
    eapply derivable1_trans with
      (y := XiziDLL.links stop head_first inserted **
            XiziDLL.dllseg first prev mid old_prev prefix **
            XiziDLL.links mid inserted old_prev **
            XiziDLL.links inserted stop mid **
            XiziDLL.dllseg stop inserted stop inserted nil).
    - simpl.
      entailer!.
    - apply (Hcompose prefix stop head_first inserted first prev mid old_prev
        inserted stop nil Hmid Hins). }
  unfold xizi_double_link_insert_after_return_wit_3.
  left.
  intros.
  subst nodes_after.
  unfold xizi_dll, XiziDLL.dll.
  rewrite PreH6.
  Exists first linklist_node_pre.
  split_pure_spatial.
  - eapply derivable1_trans with
      (y := XiziDLL.links head_dispatch_case first linklist_node_pre **
            XiziDLL.dllseg first head_dispatch_case linklist_pre old_prev nodes_before **
            XiziDLL.links linklist_pre linklist_node_pre old_prev **
            XiziDLL.links linklist_node_pre head_dispatch_case linklist_pre).
    + unfold xizi_dllseg, XiziDLL.links.
      entailer!.
    + apply (Hcompose_empty nodes_before head_dispatch_case first first
        head_dispatch_case linklist_pre old_prev linklist_node_pre PreH7 PreH3).
  - entailer!.
Qed.

Lemma proof_of_xizi_double_link_insert_after_return_wit_4 : xizi_double_link_insert_after_return_wit_4.
Proof.
  assert (Hlinks_neq : forall p q p_next p_prev q_next q_prev,
    XiziDLL.links p p_next p_prev ** XiziDLL.links q q_next q_prev
    |-- “ p <> q ”).
  { intros p q p_next p_prev q_next q_prev.
    unfold XiziDLL.links.
    destruct (Z.eq_dec p q) as [Heq | Hneq].
    - subst q.
      eapply derivable1_trans with
        (y := ((&( p # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> q_next) **
               (&( p # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> p_next)) **
              ((&( p # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> p_prev) **
               (&( p # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> q_prev))).
      + entailer!.
      + sep_apply (dup_store_ptr
          (&( p # "SysDoubleLinklistNode" ->ₛ "node_next")) q_next p_next).
        entailer!.
    - entailer!. }
  assert (Hcompose : forall prefix stop head_first last first prev mid old_prev
      inserted after suffix,
    mid <> NULL ->
    inserted <> NULL ->
    XiziDLL.links stop head_first last **
    XiziDLL.dllseg first prev mid old_prev prefix **
    XiziDLL.links mid inserted old_prev **
    XiziDLL.links inserted after mid **
    XiziDLL.dllseg after inserted stop last suffix
    |--
    XiziDLL.links stop head_first last **
    XiziDLL.dllseg first prev stop last (prefix ++ mid :: inserted :: suffix)).
  { induction prefix as [| represented rest IH].
    - intros stop head_first last first prev mid old_prev inserted after suffix
        Hmid Hins.
      simpl.
      Intros_p Hempty.
      destruct Hempty as [Hfirst Hprev].
      subst first old_prev.
      prop_apply (Hlinks_neq stop mid head_first last inserted prev).
      Intros.
      prop_apply (Hlinks_neq stop inserted head_first last after mid).
      Intros.
      simpl.
      Exists inserted after.
      unfold XiziDLL.links.
      entailer!.
    - intros stop head_first last first prev mid old_prev inserted after suffix
        Hmid Hins.
      simpl.
      Intros next.
      Intros.
      subst first.
      prop_apply (Hlinks_neq stop represented head_first last next prev).
      Intros.
      simpl.
      Exists next.
      sep_apply (IH stop head_first last next represented mid old_prev
        inserted after suffix Hmid Hins).
      unfold XiziDLL.links.
      entailer!. }
  assert (Hcompose_nonempty : forall prefix stop head_first last first prev mid
      old_prev inserted after next rest,
    mid <> NULL ->
    inserted <> NULL ->
    after <> NULL ->
    after <> stop ->
    XiziDLL.links stop head_first last **
    XiziDLL.dllseg first prev mid old_prev prefix **
    XiziDLL.links mid inserted old_prev **
    XiziDLL.links inserted after mid **
    XiziDLL.links after next inserted **
    XiziDLL.dllseg next after stop last rest
    |--
    XiziDLL.links stop head_first last **
    XiziDLL.dllseg first prev stop last
      (prefix ++ mid :: inserted :: after :: rest)).
  { intros prefix stop head_first last first prev mid old_prev inserted after next
      rest Hmid Hins Hafter Hafter_stop.
    eapply derivable1_trans with
      (y := XiziDLL.links stop head_first last **
            XiziDLL.dllseg first prev mid old_prev prefix **
            XiziDLL.links mid inserted old_prev **
            XiziDLL.links inserted after mid **
            XiziDLL.dllseg after inserted stop last (after :: rest)).
    - simpl.
      Exists next.
      unfold XiziDLL.links.
      entailer!.
    - apply (Hcompose prefix stop head_first last first prev mid old_prev
        inserted after (after :: rest) Hmid Hins). }
  unfold xizi_double_link_insert_after_return_wit_4.
  left.
  intros.
  subst nodes_after.
  destruct (Z.eq_dec old_next head_dispatch_case) as [Heq | Hold_head].
  - subst old_next.
    eapply derivable1_trans with
      (y := (XiziDLL.links head_dispatch_case first last **
             XiziDLL.links head_dispatch_case next_next linklist_node_pre) **
            (XiziDLL.links linklist_node_pre head_dispatch_case linklist_pre **
             XiziDLL.dllseg first head_dispatch_case linklist_pre old_prev nodes_before **
             XiziDLL.links linklist_pre linklist_node_pre old_prev **
             XiziDLL.dllseg next_next head_dispatch_case head_dispatch_case last rest)).
    + unfold xizi_dllseg, XiziDLL.links.
      entailer!.
    + prop_apply_p (Hlinks_neq head_dispatch_case head_dispatch_case
        first last next_next linklist_node_pre).
      Intros_p Hbad.
      contradiction.
  - unfold xizi_dll, XiziDLL.dll.
    rewrite PreH6.
    Exists first last.
    split_pure_spatial.
    + eapply derivable1_trans with
        (y := XiziDLL.links head_dispatch_case first last **
              XiziDLL.dllseg first head_dispatch_case linklist_pre old_prev nodes_before **
              XiziDLL.links linklist_pre linklist_node_pre old_prev **
              XiziDLL.links linklist_node_pre old_next linklist_pre **
              XiziDLL.links old_next next_next linklist_node_pre **
              XiziDLL.dllseg next_next old_next head_dispatch_case last rest).
      * unfold xizi_dllseg, XiziDLL.links.
        entailer!.
      * apply (Hcompose_nonempty nodes_before head_dispatch_case first last first
          head_dispatch_case linklist_pre old_prev linklist_node_pre old_next next_next
          rest PreH7 PreH3 PreH9 Hold_head).
    + entailer!.
Qed.

Lemma proof_of_xizi_double_link_insert_after_derive_sentinel_case_by_dispatch_case : xizi_double_link_insert_after_derive_sentinel_case_by_dispatch_case.
Proof.
  pre_process.
  Exists linklist_pre nodes_sentinel_case.
  entailer!.
  - apply derivable1_wand_sepcon_adjoint.
    unfold xizi_double_link_insert_after_dispatch_nodes.
    destruct (Z.eq_dec linklist_pre linklist_pre) as [_ | Hneq].
    + entailer!.
    + contradiction.
  - unfold xizi_double_link_insert_after_anchor.
    right; reflexivity.
Qed.

Lemma proof_of_xizi_double_link_insert_after_derive_member_case_by_dispatch_case : xizi_double_link_insert_after_derive_member_case_by_dispatch_case.
Proof.
  pre_process.
  assert (Hdllseg_stop_not_in : forall node prev stop last nodes,
    xizi_dllseg node prev stop last nodes |-- “ ~ In stop nodes ”).
  {
    intros node prev stop last nodes.
    revert node prev.
    induction nodes as [| expected rest IH]; intros node prev.
    - unfold xizi_dllseg, XiziDLL.dllseg.
      simpl.
      entailer!.
    - unfold xizi_dllseg, XiziDLL.dllseg.
      simpl.
      Intros next.
      Intros.
      sep_apply_l_atomic (IH next node).
      entailer!.
      intros [Heq | Hin].
      + subst expected; contradiction.
      + contradiction.
  }
  assert (Hdll_head_not_in_nodes : forall head nodes,
    xizi_dll head nodes |-- “ ~ In head nodes ”).
  {
    intros head nodes.
    unfold xizi_dll, XiziDLL.dll.
    Intros first last.
    prop_apply_p (Hdllseg_stop_not_in first head head last nodes).
    entailer!.
  }
  prop_apply_p (Hdll_head_not_in_nodes head_member_case nodes_member_case).
  Exists head_member_case nodes_member_case.
  entailer!.
  - apply derivable1_wand_sepcon_adjoint.
    unfold xizi_double_link_insert_after_dispatch_nodes.
    destruct (Z.eq_dec linklist_pre head_member_case) as [Heq | Hneq].
    + subst linklist_pre.
      contradiction.
    + entailer!.
  - unfold xizi_double_link_insert_after_anchor.
    left; exact H.
Qed.
