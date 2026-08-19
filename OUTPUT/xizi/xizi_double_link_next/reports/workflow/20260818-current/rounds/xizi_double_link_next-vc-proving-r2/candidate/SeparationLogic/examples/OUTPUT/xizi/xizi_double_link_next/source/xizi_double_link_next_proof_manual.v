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
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_next.source Require Import xizi_double_link_next_goal.
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_next.source Require Import xizi_double_link_next_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
From QCIPLib.xizi.xizi_double_link_common Require Import xizi_double_link_lib.
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_next.source Require Import xizi_double_link_next_lib.
Local Open Scope sac.

Lemma proof_of_xizi_double_link_next_entail_wit_1 : xizi_double_link_next_entail_wit_1.
Proof.
  pre_process.
  assert (Hsplit : forall nodes first prev stop last target,
    In target nodes ->
    xizi_dllseg first prev stop last nodes |--
    EX before after node_next node_prev,
      “ nodes = before ++ target :: after /\ ~ In target before /\
        target <> 0 /\ target <> stop ” &&
      xizi_dllseg first prev target node_prev before **
      xizi_dll_links target node_next node_prev **
      xizi_dllseg node_next target stop last after).
  {
    intros nodes.
    induction nodes as [| expected rest IH]; intros first prev stop last target Hin.
    - inversion Hin.
    - destruct (Z.eq_dec expected target) as [Heq | Hneq].
      + subst expected.
        unfold xizi_dllseg, XiziDLL.dllseg at 1.
        simpl.
        Intros. Intros next. Intros.
        subst first.
        match goal with Hnz : target <> NULL |- _ => unfold NULL in Hnz end.
        Exists (@nil Z) rest next prev.
        simpl.
        unfold xizi_dllseg, XiziDLL.dllseg.
        entailer!.
      + assert (Hinrest : In target rest) by
          (simpl in Hin; destruct Hin; congruence || assumption).
        unfold xizi_dllseg, XiziDLL.dllseg at 1.
        simpl.
        Intros. Intros next. Intros.
        subst first.
        fold XiziDLL.dllseg.
        fold xizi_dllseg.
        sep_apply_l_atomic (IH next expected stop last target Hinrest).
        Intros before after node_next node_prev.
        Intros.
        match goal with
        | Hsplitinfo : rest = _ /\ ~ In target _ /\ target <> 0 /\ target <> stop |- _ =>
            destruct Hsplitinfo as [Hdecomp [Hnotin [Htarget0 Htargetstop]]]
        end.
        Exists (expected :: before) after node_next node_prev.
        simpl.
        Exists next.
        entailer!.
        * now f_equal.
        * intros [Heq' | Hin']; [congruence | auto].
  }
  assert (Hstart_nonzero : forall node prev stop last nodes,
    stop <> 0 ->
    xizi_dllseg node prev stop last nodes |-- “ node <> 0 ”).
  {
    intros node prev stop last nodes Hstop0.
    destruct nodes as [| expected rest].
    - unfold xizi_dllseg, XiziDLL.dllseg.
      simpl. Intros. destruct H. subst node. entailer!.
    - unfold xizi_dllseg, XiziDLL.dllseg.
      simpl. Intros next. Intros. unfold NULL in H0. entailer!.
  }
  unfold xizi_double_link_next_anchor in PreH1.
  destruct PreH1 as [Hin | Heq].
  - Right.
    unfold xizi_dll, XiziDLL.dll at 1.
    Intros first last.
    Intros.
    sep_apply_l_atomic
      (Hsplit nodes_dispatch_case first linklist_pre linklist_pre last
        linklist_node_pre Hin).
    Intros nodes_before nodes_after node_next node_prev.
    Intros.
    destruct H0 as [Hdecomp [Hnotin [Hnode0 Hnodehead]]].
    unfold NULL in H.
    prop_apply_p
      (Hstart_nonzero node_next linklist_node_pre linklist_pre last nodes_after H).
    Intros_p Hnext0.
    prop_apply_p
      (Hstart_nonzero first linklist_pre linklist_node_pre node_prev nodes_before Hnode0).
    Intros_p Hfirst0.
    Exists node_prev last node_next nodes_before nodes_after first.
    unfold xizi_dll_links, XiziDLL.links.
    entailer!.
    rewrite Hdecomp.
    unfold xizi_double_link_next_dispatch_value.
    destruct (Z.eq_dec linklist_node_pre linklist_pre); [congruence |].
    apply xizi_double_link_next_value_first_occurrence__next_dispatch_split_reassemble_and_derive.
    exact Hnotin.
  - Left.
    subst linklist_node_pre.
    unfold xizi_dll, XiziDLL.dll at 1.
    Intros first last.
    Intros.
    unfold NULL in H.
    prop_apply_p
      (Hstart_nonzero first linklist_pre linklist_pre last nodes_dispatch_case H).
    Intros_p Hfirst0.
    Exists last first.
    unfold xizi_double_link_next_dispatch_value.
    destruct (Z.eq_dec linklist_pre linklist_pre); [| contradiction].
    unfold XiziDLL.links.
    entailer!.
Qed.

Lemma proof_of_xizi_double_link_next_return_wit_1 : xizi_double_link_next_return_wit_1.
Proof.
  left.
  pre_process.
  assert (Hseg_cons_neq_stop : forall node prev stop last expected rest,
    xizi_dllseg node prev stop last (expected :: rest) |-- “ node <> stop ”).
  {
    intros.
    unfold xizi_dllseg, XiziDLL.dllseg.
    simpl.
    Intros next.
    Intros.
    entailer!.
  }
  destruct nodes_dispatch_case as [| expected rest].
  - simpl in PreH5.
    rewrite PreH4 in PreH5.
    rewrite PreH4.
    unfold xizi_dll, XiziDLL.dll.
    Exists first last.
    unfold XiziDLL.links.
    entailer!.
  - prop_apply_p
      (Hseg_cons_neq_stop first linklist_pre linklist_pre last expected rest).
    Intros_p Hneq.
    congruence.
Qed.

Lemma proof_of_xizi_double_link_next_return_wit_2 : xizi_double_link_next_return_wit_2.
Proof.
  left.
  pre_process.
  assert (Hmerge : forall before anchor_first first prev head last mid midprev node_next after,
    head <> 0 -> mid <> 0 -> mid <> head ->
    (&((head) # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> anchor_first) **
    (&((head) # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> last) **
    xizi_dllseg first prev mid midprev before **
    (&((mid) # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> node_next) **
    (&((mid) # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> midprev) **
    xizi_dllseg node_next mid head last after |--
    (&((head) # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> anchor_first) **
    (&((head) # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> last) **
    xizi_dllseg first prev head last (before ++ mid :: after)).
  {
    intros before.
    induction before as [| expected rest IH];
      intros anchor_first0 first0 prev0 head0 last0 mid0 midprev0 node_next0 after0
        Hhead0 Hmid0 Hmidhead.
    - unfold xizi_dllseg, XiziDLL.dllseg at 1.
      simpl.
      Intros.
      destruct H as [Hfirst Hprev].
      subst first0; subst midprev0.
      simpl.
      Exists node_next0.
      unfold NULL in Hmid0.
      entailer!.
    - unfold xizi_dllseg, XiziDLL.dllseg at 1.
      simpl.
      Intros next.
      Intros.
      subst first0.
      fold XiziDLL.dllseg.
      fold xizi_dllseg.
      destruct (Z.eq_dec expected head0) as [Heq | Hexpectedhead].
      + subst expected.
        unfold XiziDLL.links.
        eapply derivable1_trans with
          ((&((head0) # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> anchor_first0) **
           (&((head0) # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> next) ** TT).
        * cancel (&((head0) # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> anchor_first0).
          cancel (&((head0) # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> next).
          entailer!.
        * sep_apply_l_atomic
            (dup_store_ptr
              (&(head0 # "SysDoubleLinklistNode" ->ₛ "node_next")) anchor_first0 next).
          entailer!.
      + sep_apply_l_atomic
          (IH anchor_first0 next expected head0 last0 mid0 midprev0 node_next0 after0
            Hhead0 Hmid0 Hmidhead).
        simpl.
        Exists next.
        entailer!.
  }
  assert (Hendpoint : forall node prev stop last nodes,
    node = stop ->
    xizi_dllseg node prev stop last nodes |-- “ nodes = nil ”).
  {
    intros node0 prev0 stop0 last0 nodes0 Heq0.
    destruct nodes0 as [| expected rest].
    - entailer!.
    - unfold xizi_dllseg, XiziDLL.dllseg.
      simpl.
      Intros next.
      Intros.
      congruence.
  }
  prop_apply_p
    (Hendpoint node_next linklist_node_pre linklist_pre last nodes_after PreH1).
  Intros_p Hafter.
  subst nodes_after.
  simpl in PreH6.
  rewrite PreH4 in PreH6.
  sep_apply_l_atomic
    (Hmerge nodes_before first first linklist_pre linklist_pre last
      linklist_node_pre node_prev node_next nil PreH2 PreH7 PreH8).
  rewrite PreH4.
  unfold xizi_dll, XiziDLL.dll.
  Exists first last.
  unfold XiziDLL.links.
  entailer!.
Qed.

Lemma proof_of_xizi_double_link_next_return_wit_3 : xizi_double_link_next_return_wit_3.
Proof.
  left.
  pre_process.
  assert (Hmerge : forall before anchor_first first prev head last mid midprev node_next after,
    head <> 0 -> mid <> 0 -> mid <> head ->
    (&((head) # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> anchor_first) **
    (&((head) # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> last) **
    xizi_dllseg first prev mid midprev before **
    (&((mid) # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> node_next) **
    (&((mid) # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> midprev) **
    xizi_dllseg node_next mid head last after |--
    (&((head) # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> anchor_first) **
    (&((head) # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> last) **
    xizi_dllseg first prev head last (before ++ mid :: after)).
  {
    intros before.
    induction before as [| expected rest IH];
      intros anchor_first0 first0 prev0 head0 last0 mid0 midprev0 node_next0 after0
        Hhead0 Hmid0 Hmidhead.
    - unfold xizi_dllseg, XiziDLL.dllseg at 1.
      simpl.
      Intros.
      destruct H as [Hfirst Hprev].
      subst first0; subst midprev0.
      simpl.
      Exists node_next0.
      unfold NULL in Hmid0.
      entailer!.
    - unfold xizi_dllseg, XiziDLL.dllseg at 1.
      simpl.
      Intros next.
      Intros.
      subst first0.
      fold XiziDLL.dllseg.
      fold xizi_dllseg.
      destruct (Z.eq_dec expected head0) as [Heq | Hexpectedhead].
      + subst expected.
        unfold XiziDLL.links.
        eapply derivable1_trans with
          ((&((head0) # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> anchor_first0) **
           (&((head0) # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> next) ** TT).
        * cancel (&((head0) # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> anchor_first0).
          cancel (&((head0) # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> next).
          entailer!.
        * sep_apply_l_atomic
            (dup_store_ptr
              (&(head0 # "SysDoubleLinklistNode" ->ₛ "node_next")) anchor_first0 next).
          entailer!.
      + sep_apply_l_atomic
          (IH anchor_first0 next expected head0 last0 mid0 midprev0 node_next0 after0
            Hhead0 Hmid0 Hmidhead).
        simpl.
        Exists next.
        entailer!.
  }
  assert (Hseg_nil_eq : forall node prev stop last,
    xizi_dllseg node prev stop last nil |-- “ node = stop ”).
  {
    intros.
    unfold xizi_dllseg, XiziDLL.dllseg.
    simpl.
    Intros.
    destruct H.
    entailer!.
  }
  assert (Hseg_cons_eq : forall node prev stop last expected rest,
    xizi_dllseg node prev stop last (expected :: rest) |-- “ node = expected ”).
  {
    intros.
    unfold xizi_dllseg, XiziDLL.dllseg.
    simpl.
    Intros next.
    Intros.
    entailer!.
  }
  destruct nodes_after as [| expected rest].
  - prop_apply_p (Hseg_nil_eq node_next linklist_node_pre linklist_pre last).
    Intros_p Hsame.
    congruence.
  - prop_apply_p
      (Hseg_cons_eq node_next linklist_node_pre linklist_pre last expected rest).
    Intros_p Hfirst.
    subst expected.
    simpl in PreH6.
    rewrite PreH4 in PreH6.
    sep_apply_l_atomic
      (Hmerge nodes_before first first linklist_pre linklist_pre last
        linklist_node_pre node_prev node_next (node_next :: rest)
        PreH2 PreH7 PreH8).
    rewrite PreH4.
    unfold xizi_dll, XiziDLL.dll.
    Exists first last.
    unfold XiziDLL.links.
    entailer!.
Qed.

Lemma proof_of_xizi_double_link_next_return_wit_4 : xizi_double_link_next_return_wit_4.
Proof.
  left.
  pre_process.
  assert (Hseg_nil_eq : forall node prev stop last,
    xizi_dllseg node prev stop last nil |-- “ node = stop ”).
  {
    intros.
    unfold xizi_dllseg, XiziDLL.dllseg.
    simpl.
    Intros.
    destruct H.
    entailer!.
  }
  assert (Hseg_cons_eq : forall node prev stop last expected rest,
    xizi_dllseg node prev stop last (expected :: rest) |-- “ node = expected ”).
  {
    intros.
    unfold xizi_dllseg, XiziDLL.dllseg.
    simpl.
    Intros next.
    Intros.
    entailer!.
  }
  destruct nodes_dispatch_case as [| expected rest].
  - prop_apply_p (Hseg_nil_eq first linklist_pre linklist_pre last).
    Intros_p Hsame.
    congruence.
  - prop_apply_p
      (Hseg_cons_eq first linklist_pre linklist_pre last expected rest).
    Intros_p Hfirst.
    subst expected.
    simpl in PreH5.
    rewrite PreH4 in PreH5.
    rewrite PreH4.
    unfold xizi_dll, XiziDLL.dll.
    Exists first last.
    unfold XiziDLL.links.
    entailer!.
Qed.

Lemma proof_of_xizi_double_link_next_derive_sentinel_case_by_dispatch_case : xizi_double_link_next_derive_sentinel_case_by_dispatch_case.
Proof.
  pre_process.
  Exists nodes_sentinel_case.
  unfold xizi_double_link_next_anchor.
  unfold xizi_double_link_next_dispatch_value.
  destruct (Z.eq_dec linklist_node_pre linklist_pre) as [Heq | Hneq].
  - entailer!.
    rewrite <- derivable1_wand_sepcon_adjoint.
    Intros retval_2.
    Exists retval_2.
    entailer!.
  - congruence.
Qed.

Lemma proof_of_xizi_double_link_next_derive_member_case_by_dispatch_case : xizi_double_link_next_derive_member_case_by_dispatch_case.
Proof.
  pre_process.
  assert (Hsplit : forall nodes first prev stop last target,
    In target nodes ->
    xizi_dllseg first prev stop last nodes |--
    EX before after node_next node_prev,
      “ nodes = before ++ target :: after /\ ~ In target before /\
        target <> 0 /\ target <> stop ” &&
      xizi_dllseg first prev target node_prev before **
      xizi_dll_links target node_next node_prev **
      xizi_dllseg node_next target stop last after).
  {
    intros nodes.
    induction nodes as [| expected rest IH]; intros first prev stop last target Hin.
    - inversion Hin.
    - destruct (Z.eq_dec expected target) as [Heq | Hneq].
      + subst expected.
        unfold xizi_dllseg, XiziDLL.dllseg at 1.
        simpl.
        Intros. Intros next. Intros.
        subst first.
        match goal with Hnz : target <> NULL |- _ => unfold NULL in Hnz end.
        Exists (@nil Z) rest next prev.
        simpl.
        unfold xizi_dllseg, XiziDLL.dllseg.
        entailer!.
      + assert (Hinrest : In target rest) by
          (simpl in Hin; destruct Hin; congruence || assumption).
        unfold xizi_dllseg, XiziDLL.dllseg at 1.
        simpl.
        Intros. Intros next. Intros.
        subst first.
        fold XiziDLL.dllseg.
        fold xizi_dllseg.
        sep_apply_l_atomic (IH next expected stop last target Hinrest).
        Intros before after node_next node_prev.
        Intros.
        match goal with
        | Hsplitinfo : rest = _ /\ ~ In target _ /\ target <> 0 /\ target <> stop |- _ =>
            destruct Hsplitinfo as [Hdecomp [Hnotin [Htarget0 Htargetstop]]]
        end.
        Exists (expected :: before) after node_next node_prev.
        simpl.
        Exists next.
        entailer!.
        * now f_equal.
        * intros [Heq' | Hin']; [congruence | auto].
  }
  assert (Hmemberneq : forall head nodes node,
    In node nodes ->
    xizi_dll head nodes |-- “ node <> head ”).
  {
    intros head nodes node Hin.
    unfold xizi_dll, XiziDLL.dll.
    Intros first last.
    Intros.
    sep_apply_l_atomic (Hsplit nodes first head head last node Hin).
    Intros before after node_next node_prev.
    destruct H1 as [Hdecomp [Hnotin [Hnode0 Hnodehead]]].
    entailer!.
  }
  prop_apply_p
    (Hmemberneq linklist_pre nodes_member_case linklist_node_pre H).
  Intros_p Hneq.
  Exists nodes_member_case.
  unfold xizi_double_link_next_anchor.
  unfold xizi_double_link_next_dispatch_value.
  destruct (Z.eq_dec linklist_node_pre linklist_pre); [congruence |].
  entailer!.
  rewrite <- derivable1_wand_sepcon_adjoint.
  Intros retval_2.
  Exists retval_2.
  entailer!.
Qed.
