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
  assert (Hsplit :
    forall node prev stop last anchor (prefix suffix : list Z),
      ~ In anchor prefix ->
      xizi_dllseg node prev stop last (prefix ++ anchor :: suffix)
      |--
      EX oldprev next,
        “ anchor <> NULL ” &&
        “ anchor <> stop ” &&
        xizi_dllseg node prev anchor oldprev prefix **
        xizi_dll_links anchor next oldprev **
        xizi_dllseg next anchor stop last suffix).
  {
    intros node prev stop last anchor prefix.
    revert node prev.
    induction prefix as [|a prefix IH]; intros node prev suffix Hnotin.
    - unfold xizi_dllseg, XiziDLL.dllseg at 1.
      simpl.
      Intros next.
      subst node.
      Exists prev next.
      unfold xizi_dllseg, XiziDLL.dllseg at 1.
      simpl.
      entailer!.
    - assert (Hane : a <> anchor).
      { intro Heq. subst a. apply Hnotin. simpl. auto. }
      assert (Htail : ~ In anchor prefix).
      { intro Hin. apply Hnotin. simpl. auto. }
      unfold xizi_dllseg, XiziDLL.dllseg at 1.
      simpl.
      Intros next.
      subst node.
      sep_apply_l_atomic (IH next a suffix Htail).
      Intros oldprev anchor_next.
      Exists oldprev anchor_next.
      unfold xizi_dllseg, XiziDLL.dllseg at 1.
      simpl.
      Exists next.
      split_pure_spatial.
      + cancel (xizi_dll_links a next prev).
        entailer!.
      + split_pures; dump_pre_spatial; auto.
  }
  pre_process.
  unfold xizi_dll_node.
  normalize.
  destruct PreH1 as [Hin | Hsentinel].
  - destruct
      (xizi_double_link_insert_after_lib.xizi_in_first_split_after__implementation_shape
         nodes_dispatch_case linklist_pre Hin)
      as (nodes_before & nodes_after & Hnodes & Hfirst).
    unfold xizi_dll, XiziDLL.dll at 1.
    Intros first last.
    subst nodes_dispatch_case.
    sep_apply_l_atomic
      (Hsplit first head_dispatch_case head_dispatch_case last linklist_pre
         nodes_before nodes_after Hfirst).
    Intros old_prev old_next.
    destruct nodes_after as [|next_node rest].
    + unfold xizi_dllseg, XiziDLL.dllseg at 2.
      simpl.
      Intros_p Heqtail.
      destruct Heqtail as [Holdnext Hlast].
      subst old_next last.
      Left. Left. Right.
      Exists old_prev first nodes_before (@nil Z).
      split_pure_spatial.
      * unfold xizi_dll_links, XiziDLL.links.
        entailer!.
      * split_pures; dump_pre_spatial; auto.
        unfold xizi_double_link_insert_after_dispatch_nodes.
        destruct (Z.eq_dec linklist_pre head_dispatch_case); [contradiction|].
        apply xizi_double_link_insert_after_lib.xizi_insert_after_first_occurrence__implementation_shape.
        exact Hfirst.
    + destruct (Z.eq_dec next_node head_dispatch_case) as [Heq | Hnext].
      * subst next_node.
        unfold xizi_dllseg, XiziDLL.dllseg at 2.
        simpl.
        Intros next_tail.
        subst old_next.
        contradiction.
      * unfold xizi_dllseg, XiziDLL.dllseg at 2.
        simpl.
        Intros next_next.
        subst old_next.
        Left. Left. Left.
        Exists next_next old_prev last first next_node rest
          nodes_before (next_node :: rest).
        split_pure_spatial.
        -- unfold xizi_dll_links, XiziDLL.links.
           entailer!.
        -- split_pures; dump_pre_spatial; auto.
           unfold xizi_double_link_insert_after_dispatch_nodes.
           destruct (Z.eq_dec linklist_pre head_dispatch_case); [contradiction|].
           apply xizi_double_link_insert_after_lib.xizi_insert_after_first_occurrence__implementation_shape.
           exact Hfirst.
  - subst linklist_pre.
    unfold xizi_dll, XiziDLL.dll at 1.
    Intros first last.
    destruct nodes_dispatch_case as [|old_next rest].
    + Right.
      unfold xizi_dllseg, XiziDLL.dllseg.
      simpl.
      Intros_p Heq.
      destruct Heq as [Hfirst Hlast].
      subst first last.
      Exists head_dispatch_case head_dispatch_case head_dispatch_case.
      split_pure_spatial.
      * unfold xizi_dll_links, XiziDLL.links.
        entailer!.
      * split_pures; dump_pre_spatial; auto.
        unfold xizi_double_link_insert_after_dispatch_nodes.
        destruct (Z.eq_dec head_dispatch_case head_dispatch_case); congruence.
    + destruct (Z.eq_dec old_next head_dispatch_case) as [Heq | Hnext].
      * subst old_next.
        unfold xizi_dllseg, XiziDLL.dllseg at 1.
        simpl.
        Intros next_tail.
        subst first.
        contradiction.
      * unfold xizi_dllseg, XiziDLL.dllseg at 1.
        simpl.
        Intros next_next.
        subst first.
        Left. Right.
        Exists next_next last old_next rest.
        split_pure_spatial.
        -- unfold xizi_dll_links, XiziDLL.links.
           entailer!.
        -- split_pures; dump_pre_spatial; auto.
           unfold xizi_double_link_insert_after_dispatch_nodes.
           destruct (Z.eq_dec head_dispatch_case head_dispatch_case); congruence.
Qed.

Lemma proof_of_xizi_double_link_insert_after_return_wit_1 : xizi_double_link_insert_after_return_wit_1.
Proof.
  pre_process.
  subst linklist_pre nodes_dispatch_case first last old_next.
  unfold xizi_double_link_insert_after_dispatch_nodes in *.
  destruct (Z.eq_dec head_dispatch_case head_dispatch_case); [|contradiction].
  simpl in *.
  destruct (Z.eq_dec linklist_node_pre head_dispatch_case) as [Heq | Hneq].
  - subst linklist_node_pre.
    prop_apply
      (dup_store_ptr
         (&(head_dispatch_case # "SysDoubleLinklistNode" ->ₛ "node_next"))
         head_dispatch_case head_dispatch_case).
    Intros_p Hfalse. contradiction.
  - sep_apply_r_atomic
      (xizi_dll_nonempty_rev head_dispatch_case linklist_node_pre
         head_dispatch_case linklist_node_pre nil).
    + entailer!; unfold NULL in *; congruence.
    + entailer!; unfold NULL in *; congruence.
    + entailer!.
    + unfold xizi_dll_links, XiziDLL.links.
      unfold xizi_dllseg, XiziDLL.dllseg.
      simpl.
      entailer!.
Qed.

Lemma proof_of_xizi_double_link_insert_after_return_wit_2 : xizi_double_link_insert_after_return_wit_2.
Proof.
  pre_process.
  subst linklist_pre nodes_dispatch_case.
  unfold xizi_double_link_insert_after_dispatch_nodes in *.
  destruct (Z.eq_dec head_dispatch_case head_dispatch_case); [|contradiction].
  simpl in *.
  destruct (Z.eq_dec linklist_node_pre head_dispatch_case) as [Heq | Hnew].
  - subst linklist_node_pre.
    prop_apply
      (dup_store_ptr
         (&(head_dispatch_case # "SysDoubleLinklistNode" ->ₛ "node_next"))
         old_next head_dispatch_case).
    Intros_p Hfalse. contradiction.
  - destruct (Z.eq_dec old_next head_dispatch_case) as [Heq | Hold].
    + subst old_next.
      prop_apply
        (dup_store_ptr
           (&(head_dispatch_case # "SysDoubleLinklistNode" ->ₛ "node_next"))
           linklist_node_pre next_next).
      Intros_p Hfalse. contradiction.
    + sep_apply_r_atomic
        (xizi_dll_nonempty_rev head_dispatch_case linklist_node_pre
           old_next last (old_next :: rest)).
      * entailer!; unfold NULL in *; congruence.
      * entailer!; unfold NULL in *; congruence.
      * entailer!.
      * unfold xizi_dll_links, XiziDLL.links.
        unfold xizi_dllseg, XiziDLL.dllseg.
        simpl.
        Exists next_next.
        entailer!.
Qed.

Lemma proof_of_xizi_double_link_insert_after_return_wit_3 : xizi_double_link_insert_after_return_wit_3.
Proof.
  assert (Hjoin :
    forall head headfirst headlast node prev mid midprev last
           (prefix suffix : list Z),
      xizi_dll_links head headfirst headlast **
      xizi_dllseg node prev mid midprev prefix **
      xizi_dllseg mid midprev head last suffix
      |--
      xizi_dll_links head headfirst headlast **
      xizi_dllseg node prev head last (prefix ++ suffix)).
  {
    assert (Hswap : forall p next prev,
      xizi_dll_links p next prev |--
      (&(p # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> prev) **
      (&(p # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> next)).
    {
      intros p next prev.
      unfold xizi_dll_links, XiziDLL.links.
      cancel (&(p # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> prev).
      cancel (&(p # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> next).
    }
    assert (Hlinks_neq :
      forall p q pnext pprev qnext qprev,
        xizi_dll_links p pnext pprev **
        xizi_dll_links q qnext qprev |-- “ p <> q ”).
    {
      intros p q pnext pprev qnext qprev.
      destruct (Z.eq_dec p q) as [Heq | Hneq].
      - subst q.
        sep_apply (Hswap p pnext pprev).
        unfold xizi_dll_links, XiziDLL.links.
        sep_apply
          (dup_store_ptr
             (&(p # "SysDoubleLinklistNode" ->ₛ "node_next"))
             pnext qnext).
        entailer!.
      - entailer!.
    }
    assert (Hrotate :
      forall head headnext headprev node next prev (P : Assertion),
        xizi_dll_links head headnext headprev **
        xizi_dll_links node next prev ** P |--
        xizi_dll_links node next prev **
        (xizi_dll_links head headnext headprev ** P)).
    {
      intros head headnext headprev node next prev P.
      cancel (xizi_dll_links node next prev).
      cancel (xizi_dll_links head headnext headprev).
      cancel P.
    }
    assert (Hnotin :
      forall nodes head headfirst headlast node prev stop last,
        xizi_dll_links head headfirst headlast **
        xizi_dllseg node prev stop last nodes |-- “ ~ In head nodes ”).
    {
      induction nodes as [|expected rest IH];
        intros head headfirst headlast node prev stop last.
      - unfold xizi_dllseg, XiziDLL.dllseg.
        simpl.
        entailer!.
      - unfold xizi_dllseg, XiziDLL.dllseg at 1.
        simpl.
        Intros next.
        subst node.
        prop_apply
          (Hlinks_neq head expected headfirst headlast next prev).
        Intros_p Hneq.
        sep_apply
          (Hrotate head headfirst headlast expected next prev
             (xizi_dllseg next expected stop last rest)).
        prop_apply (IH head headfirst headlast next expected stop last).
        Intros_p Htail.
        entailer!.
        intros [Heq | Hin].
        + apply Hneq. symmetry. exact Heq.
        + apply Htail. exact Hin.
    }
    intros head headfirst headlast node prev mid midprev last prefix suffix.
    prop_apply
      (Hnotin prefix head headfirst headlast node prev mid midprev).
    Intros_p Hprefix.
    revert node prev suffix Hprefix.
    induction prefix as [|a prefix IH]; intros node prev suffix Hprefix.
    - unfold xizi_dllseg, XiziDLL.dllseg at 1.
      simpl.
      Intros_p Heq.
      destruct Heq as [Hnode Hprev].
      subst node prev.
      entailer!.
    - assert (Hane : a <> head).
      { intro Heq. subst a. apply Hprefix. simpl. auto. }
      assert (Htail : ~ In head prefix).
      { intro Hin. apply Hprefix. simpl. auto. }
      unfold xizi_dllseg, XiziDLL.dllseg at 1.
      simpl.
      Intros next.
      subst node.
      unfold xizi_dllseg, XiziDLL.dllseg.
      simpl.
      Exists next.
      split_pure_spatial.
      * cancel (xizi_dll_links a next prev).
        sep_apply_l_atomic (IH next a suffix Htail).
        entailer!.
      * split_pures; dump_pre_spatial; auto.
  }
  pre_process.
  subst nodes_after nodes_dispatch_case.
  rewrite PreH6.
  destruct (Z.eq_dec linklist_node_pre head_dispatch_case) as [Heq | Hnew].
  - subst linklist_node_pre.
    prop_apply
      (dup_store_ptr
         (&(head_dispatch_case # "SysDoubleLinklistNode" ->ₛ "node_next"))
         head_dispatch_case first).
    Intros_p Hfalse. contradiction.
  - destruct (Z.eq_dec linklist_pre head_dispatch_case) as [Heq | Hanchor].
    + subst linklist_pre.
      prop_apply
        (dup_store_ptr
           (&(head_dispatch_case # "SysDoubleLinklistNode" ->ₛ "node_next"))
           linklist_node_pre first).
      Intros_p Hfalse. contradiction.
    + sep_apply_r_atomic
        (xizi_dll_close head_dispatch_case first linklist_node_pre
           (nodes_before ++ linklist_pre :: linklist_node_pre :: nil)).
      * entailer!; unfold NULL in *; congruence.
      * sep_apply_r_atomic
          (Hjoin head_dispatch_case first linklist_node_pre
             first head_dispatch_case linklist_pre old_prev linklist_node_pre
             nodes_before (linklist_pre :: linklist_node_pre :: nil)).
        unfold xizi_dll_links, XiziDLL.links.
        unfold xizi_dllseg, XiziDLL.dllseg.
        simpl.
        Exists linklist_node_pre.
        Exists head_dispatch_case.
        entailer!.
        unfold XiziDLL.links.
        entailer!.
Qed.

Lemma proof_of_xizi_double_link_insert_after_return_wit_4 : xizi_double_link_insert_after_return_wit_4.
Proof.
  assert (Hjoin :
    forall head headfirst headlast node prev mid midprev last
           (prefix suffix : list Z),
      xizi_dll_links head headfirst headlast **
      xizi_dllseg node prev mid midprev prefix **
      xizi_dllseg mid midprev head last suffix
      |--
      xizi_dll_links head headfirst headlast **
      xizi_dllseg node prev head last (prefix ++ suffix)).
  {
    assert (Hswap : forall p next prev,
      xizi_dll_links p next prev |--
      (&(p # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> prev) **
      (&(p # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> next)).
    {
      intros p next prev.
      unfold xizi_dll_links, XiziDLL.links.
      cancel (&(p # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> prev).
      cancel (&(p # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> next).
    }
    assert (Hlinks_neq :
      forall p q pnext pprev qnext qprev,
        xizi_dll_links p pnext pprev **
        xizi_dll_links q qnext qprev |-- “ p <> q ”).
    {
      intros p q pnext pprev qnext qprev.
      destruct (Z.eq_dec p q) as [Heq | Hneq].
      - subst q.
        sep_apply (Hswap p pnext pprev).
        unfold xizi_dll_links, XiziDLL.links.
        sep_apply
          (dup_store_ptr
             (&(p # "SysDoubleLinklistNode" ->ₛ "node_next"))
             pnext qnext).
        entailer!.
      - entailer!.
    }
    assert (Hrotate :
      forall head headnext headprev node next prev (P : Assertion),
        xizi_dll_links head headnext headprev **
        xizi_dll_links node next prev ** P |--
        xizi_dll_links node next prev **
        (xizi_dll_links head headnext headprev ** P)).
    {
      intros head headnext headprev node next prev P.
      cancel (xizi_dll_links node next prev).
      cancel (xizi_dll_links head headnext headprev).
      cancel P.
    }
    assert (Hnotin :
      forall nodes head headfirst headlast node prev stop last,
        xizi_dll_links head headfirst headlast **
        xizi_dllseg node prev stop last nodes |-- “ ~ In head nodes ”).
    {
      induction nodes as [|expected rest IH];
        intros head headfirst headlast node prev stop last.
      - unfold xizi_dllseg, XiziDLL.dllseg.
        simpl.
        entailer!.
      - unfold xizi_dllseg, XiziDLL.dllseg at 1.
        simpl.
        Intros next.
        subst node.
        prop_apply
          (Hlinks_neq head expected headfirst headlast next prev).
        Intros_p Hneq.
        sep_apply
          (Hrotate head headfirst headlast expected next prev
             (xizi_dllseg next expected stop last rest)).
        prop_apply (IH head headfirst headlast next expected stop last).
        Intros_p Htail.
        entailer!.
        intros [Heq | Hin].
        + apply Hneq. symmetry. exact Heq.
        + apply Htail. exact Hin.
    }
    intros head headfirst headlast node prev mid midprev last prefix suffix.
    prop_apply
      (Hnotin prefix head headfirst headlast node prev mid midprev).
    Intros_p Hprefix.
    revert node prev suffix Hprefix.
    induction prefix as [|a prefix IH]; intros node prev suffix Hprefix.
    - unfold xizi_dllseg, XiziDLL.dllseg at 1.
      simpl.
      Intros_p Heq.
      destruct Heq as [Hnode Hprev].
      subst node prev.
      entailer!.
    - assert (Hane : a <> head).
      { intro Heq. subst a. apply Hprefix. simpl. auto. }
      assert (Htail : ~ In head prefix).
      { intro Hin. apply Hprefix. simpl. auto. }
      unfold xizi_dllseg, XiziDLL.dllseg at 1.
      simpl.
      Intros next.
      subst node.
      unfold xizi_dllseg, XiziDLL.dllseg.
      simpl.
      Exists next.
      split_pure_spatial.
      * cancel (xizi_dll_links a next prev).
        sep_apply_l_atomic (IH next a suffix Htail).
        entailer!.
      * split_pures; dump_pre_spatial; auto.
  }
  pre_process.
  subst nodes_after nodes_dispatch_case.
  rewrite PreH6.
  destruct (Z.eq_dec linklist_node_pre head_dispatch_case) as [Heq | Hnew].
  - subst linklist_node_pre.
    prop_apply
      (dup_store_ptr
         (&(head_dispatch_case # "SysDoubleLinklistNode" ->ₛ "node_next"))
         old_next first).
    Intros_p Hfalse. contradiction.
  - destruct (Z.eq_dec linklist_pre head_dispatch_case) as [Heq | Hanchor].
    + subst linklist_pre.
      prop_apply
        (dup_store_ptr
           (&(head_dispatch_case # "SysDoubleLinklistNode" ->ₛ "node_next"))
           linklist_node_pre first).
      Intros_p Hfalse. contradiction.
    + destruct (Z.eq_dec old_next head_dispatch_case) as [Heq | Hold].
      * subst old_next.
        prop_apply
          (dup_store_ptr
             (&(head_dispatch_case # "SysDoubleLinklistNode" ->ₛ "node_next"))
             next_next first).
        Intros_p Hfalse. contradiction.
      * sep_apply_r_atomic
          (xizi_dll_close head_dispatch_case first last
             (nodes_before ++
                linklist_pre :: linklist_node_pre :: old_next :: rest)).
        -- entailer!; unfold NULL in *; congruence.
        -- sep_apply_r_atomic
            (Hjoin head_dispatch_case first last
               first head_dispatch_case linklist_pre old_prev last
               nodes_before
               (linklist_pre :: linklist_node_pre :: old_next :: rest)).
           unfold xizi_dll_links, XiziDLL.links.
           unfold xizi_dllseg, XiziDLL.dllseg.
           simpl.
           Exists linklist_node_pre.
           Exists old_next.
           Exists next_next.
           entailer!.
           unfold XiziDLL.links.
           entailer!.
Qed.

Lemma proof_of_xizi_double_link_insert_after_derive_sentinel_case_by_dispatch_case : xizi_double_link_insert_after_derive_sentinel_case_by_dispatch_case.
Proof.
  pre_process.
  Exists linklist_pre nodes_sentinel_case.
  unfold xizi_double_link_insert_after_anchor,
    xizi_double_link_insert_after_dispatch_nodes.
  destruct (Z.eq_dec linklist_pre linklist_pre); [| congruence].
  entailer!.
  apply derivable1_wand_sepcon_adjoint.
  entailer!.
Qed.

Lemma proof_of_xizi_double_link_insert_after_derive_member_case_by_dispatch_case : xizi_double_link_insert_after_derive_member_case_by_dispatch_case.
Proof.
  assert (Hdllseg_stop_notin : forall node prev stop last nodes,
    xizi_dllseg node prev stop last nodes |-- “ ~ In stop nodes ”).
  {
    intros node prev stop last nodes.
    revert node prev.
    induction nodes as [| expected rest IH]; intros node prev.
    - simpl.
      entailer!.
    - simpl.
      Intros next.
      Intros.
      subst expected.
      sep_apply (IH next node).
      Intros.
      entailer!.
      intros [Heq | Hin].
      + exact (H1 Heq).
      + exact (H Hin).
  }
  assert (Hdll_stop_notin : forall head nodes,
    xizi_dll head nodes |-- “ ~ In head nodes ”).
  {
    intros head nodes.
    unfold xizi_dll, XiziDLL.dll.
    Intros first last.
    sep_apply (Hdllseg_stop_notin first head head last nodes).
    entailer!.
  }
  pre_process.
  prop_apply_p (Hdll_stop_notin head_member_case nodes_member_case).
  Intros.
  Exists head_member_case nodes_member_case.
  unfold xizi_double_link_insert_after_anchor,
    xizi_double_link_insert_after_dispatch_nodes.
  destruct (Z.eq_dec linklist_pre head_member_case);
    [subst linklist_pre; contradiction|].
  entailer!.
  apply derivable1_wand_sepcon_adjoint.
  entailer!.
Qed.
