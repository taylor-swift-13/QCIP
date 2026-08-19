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
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_next_rec_last.source Require Import xizi_double_link_next_rec_last_goal.
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_next_rec_last.source Require Import xizi_double_link_next_rec_last_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
From QCIPLib.xizi.xizi_double_link_common Require Import xizi_double_link_lib.
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_next_rec_last.source
      Require Import xizi_double_link_next_rec_last_lib.
Local Open Scope sac.

Lemma proof_of_xizi_double_link_next_rec_last_entail_wit_1 : xizi_double_link_next_rec_last_entail_wit_1.
Proof.
  assert (dll_head_nonnull__dll_dispatch_all : forall head nodes,
    xizi_dll head nodes |-- “ head <> NULL ”).
  {
    intros head nodes.
    unfold xizi_dll, XiziDLL.dll.
    Intros first last.
    entailer!.
  }
  assert (in_split_first__dll_dispatch_all : forall (node : Z) (nodes : list Z),
    In node nodes ->
    exists before after,
      nodes = List.app before (node :: after) /\ ~ In node before).
  {
    intros node nodes Hin.
    induction nodes as [| current rest IH].
    - inversion Hin.
    - destruct (Z.eq_dec current node) as [Heq | Hneq].
      + subst current. exists nil, rest. simpl. tauto.
      + assert (Hin_rest : In node rest).
        { destruct Hin as [Heq | Hin_rest]; [congruence | exact Hin_rest]. }
        destruct (IH Hin_rest) as [before [after [Hlist Hnotin]]].
        exists (current :: before), after.
        split.
        * simpl. now rewrite Hlist.
        * simpl. intros [Heq | Hin_before]; [congruence | contradiction].
  }
  assert (dispatch_first_occurrence__dll_dispatch_all : forall head node before after,
    node <> head -> ~ In node before ->
    xizi_double_link_next_dispatch_value
      (List.app before (node :: after)) head node =
    xizi_double_link_first_value after).
  {
    intros head node before after Hnode_head Hnotin.
    unfold xizi_double_link_next_dispatch_value.
    destruct (Z.eq_dec node head); [contradiction |].
    induction before as [| current before IH].
    - simpl. destruct (Z.eq_dec node node); [reflexivity | congruence].
    - simpl in Hnotin |- *.
      destruct (Z.eq_dec current node) as [Heq | Hneq].
      + subst current. exfalso. apply Hnotin. left. reflexivity.
      + apply IH. intro Hin. apply Hnotin. right. exact Hin.
  }
  assert (dll_split_at_member__dll_dispatch_all :
    forall head head_first last first prev node before after,
    ~ In node before ->
    XiziDLL.links head head_first last **
    XiziDLL.dllseg first prev head last (before ++ node :: after) |--
    EX node_next node_prev,
      “ node <> NULL ” && “ node <> head ” &&
      XiziDLL.links head head_first last **
      XiziDLL.dllseg first prev node node_prev before **
      XiziDLL.links node node_next node_prev **
      XiziDLL.dllseg node_next node head last after).
  {
    intros head head_first last first prev node before.
    revert first prev.
    induction before as [| expected before IH]; intros first prev after Hnotin.
    - simpl.
      unfold XiziDLL.dllseg at 1.
      simpl. fold XiziDLL.dllseg.
      Intros node_next. Intros.
      subst first.
      Exists node_next prev.
      unfold XiziDLL.dllseg at 2.
      simpl.
      entailer!.
    - simpl.
      unfold XiziDLL.dllseg at 1.
      simpl. fold XiziDLL.dllseg.
      Intros first_next. Intros.
      subst first.
      assert (Hexpected_node : expected <> node).
      { intro Heq. apply Hnotin. left. exact Heq. }
      assert (Htail_notin : ~ In node before).
      { intro Hin. apply Hnotin. right. exact Hin. }
      sep_apply (IH first_next expected after Htail_notin).
      Intros node_next node_prev.
      Exists node_next node_prev.
      unfold XiziDLL.dllseg at 2.
      simpl. fold XiziDLL.dllseg.
      Exists first_next.
      entailer!.
  }
  pre_process.
  prop_apply_p (dll_head_nonnull__dll_dispatch_all
    linklist_pre nodes_dispatch_case).
  Intros.
  destruct PreH1 as [Hin | Heq].
  - destruct (in_split_first__dll_dispatch_all
      linklist_node_pre nodes_dispatch_case Hin)
      as [nodes_before [nodes_after [Hnodes Hnotin]]].
    subst nodes_dispatch_case.
    sep_apply (xizi_dll_open linklist_pre
      (nodes_before ++ linklist_node_pre :: nodes_after)).
    Intros first last.
    pose proof (dll_split_at_member__dll_dispatch_all
      linklist_pre first last first linklist_pre linklist_node_pre
      nodes_before nodes_after Hnotin) as Hsplit.
    sep_apply Hsplit.
    Intros node_next node_prev.
    Right.
    Exists node_next node_prev nodes_before nodes_after last first.
    unfold XiziDLL.links, xizi_dll_links.
    entailer!.
  - subst linklist_node_pre.
    sep_apply (xizi_dll_open linklist_pre nodes_dispatch_case).
    Intros first last.
    Left.
    Exists last first.
    unfold XiziDLL.links, xizi_dll_links.
    entailer!.
    unfold xizi_double_link_next_dispatch_value.
    destruct (Z.eq_dec linklist_pre linklist_pre); congruence.
Qed.

Lemma proof_of_xizi_double_link_next_rec_last_return_wit_1 : xizi_double_link_next_rec_last_return_wit_1.
Proof.
  aggressive_pre_process.
  subst linklist_node_pre.
  subst first.
  destruct nodes_dispatch_case as [| expected rest].
  - Exists linklist_pre.
    entailer!.
  - unfold xizi_dllseg, XiziDLL.dllseg at 1.
    simpl.
    Intros next.
    Intros.
    congruence.
Qed.

Lemma proof_of_xizi_double_link_next_rec_last_return_wit_2 : xizi_double_link_next_rec_last_return_wit_2.
Proof.
  assert (dll_links_neq__dll_dispatch_all : forall p p_next p_prev q q_next q_prev,
    XiziDLL.links p p_next p_prev ** XiziDLL.links q q_next q_prev |--
    “ p <> q ”).
  {
    intros.
    destruct (Z.eq_dec p q) as [Heq | Hneq].
    - subst q.
      unfold XiziDLL.links.
      eapply derivable1_trans.
      2: apply (derivable1_trans _ (“ False ” ** TT)).
      3: entailer!.
      2: apply derivable1_sepcon_mono.
      3: entailer!.
      2: apply (dup_store_ptr
        (&(p # "SysDoubleLinklistNode" ->ₛ "node_next")) p_next q_next).
      entailer!.
    - entailer!.
  }
  assert (dll_join_at_member__dll_dispatch_all :
    forall head head_first last first prev node node_prev next before after,
    node <> NULL -> node <> head ->
    XiziDLL.links head head_first last **
    XiziDLL.dllseg first prev node node_prev before **
    XiziDLL.links node next node_prev **
    XiziDLL.dllseg next node head last after |--
    XiziDLL.links head head_first last **
    XiziDLL.dllseg first prev head last (before ++ node :: after)).
  {
    intros head head_first last first prev node node_prev next before after
      Hnode_nonnull Hnode_head.
    revert first prev.
    induction before as [| expected before IH]; intros first prev.
    - unfold XiziDLL.dllseg at 1.
      simpl. Intros.
      destruct H as [Hfirst Hprev].
      subst first. subst prev.
      unfold XiziDLL.dllseg at 2.
      simpl. fold XiziDLL.dllseg.
      Exists next.
      entailer!.
    - unfold XiziDLL.dllseg at 1.
      simpl. fold XiziDLL.dllseg.
      Intros first_next. Intros.
      subst expected.
      unfold XiziDLL.dllseg at 2.
      simpl. fold XiziDLL.dllseg.
      Exists first_next.
      prop_apply_p (dll_links_neq__dll_dispatch_all
        head head_first last first first_next prev).
      Intros.
      sep_apply (IH first_next first).
      entailer!.
  }
  pre_process.
  subst node_next.
  subst nodes_dispatch_case.
  destruct nodes_after as [| after_first after_rest].
  - entailer!.
    pose proof (dll_join_at_member__dll_dispatch_all
      linklist_pre first last first linklist_pre
      linklist_node_pre node_prev linklist_pre nodes_before nil
      PreH6 PreH7) as Hjoin.
    unfold XiziDLL.links in Hjoin.
    lazymatch type of Hjoin with
    | ?P |-- _ => eapply (derivable1_trans _ P)
    end.
    + entailer!.
    + eapply derivable1_trans.
      * exact Hjoin.
      * unfold xizi_dll, XiziDLL.dll.
        Exists first last.
        unfold XiziDLL.links.
        entailer!.
  - unfold xizi_dllseg, XiziDLL.dllseg at 2.
    simpl.
    Intros after_next.
    Intros.
    congruence.
Qed.

Lemma proof_of_xizi_double_link_next_rec_last_return_wit_3 : xizi_double_link_next_rec_last_return_wit_3.
Proof.
  assert (dllseg_first_value__dll_dispatch_all : forall node prev stop last nodes,
    node <> stop ->
    xizi_dllseg node prev stop last nodes |--
    “ node = xizi_double_link_first_value nodes ”).
  {
    intros node prev stop last nodes Hneq.
    destruct nodes as [| expected rest].
    - unfold xizi_dllseg, XiziDLL.dllseg.
      simpl. Intros.
      destruct H as [Hsame _]. contradiction.
    - unfold xizi_dllseg, XiziDLL.dllseg,
        xizi_double_link_first_value at 1.
      simpl. Intros next. entailer!.
  }
  assert (dll_links_neq__dll_dispatch_all : forall p p_next p_prev q q_next q_prev,
    XiziDLL.links p p_next p_prev ** XiziDLL.links q q_next q_prev |--
    “ p <> q ”).
  {
    intros.
    destruct (Z.eq_dec p q) as [Heq | Hneq].
    - subst q.
      unfold XiziDLL.links.
      eapply derivable1_trans.
      2: apply (derivable1_trans _ (“ False ” ** TT)).
      3: entailer!.
      2: apply derivable1_sepcon_mono.
      3: entailer!.
      2: apply (dup_store_ptr
        (&(p # "SysDoubleLinklistNode" ->ₛ "node_next")) p_next q_next).
      entailer!.
    - entailer!.
  }
  assert (dll_join_at_member__dll_dispatch_all :
    forall head head_first last first prev node node_prev next before after,
    node <> NULL -> node <> head ->
    XiziDLL.links head head_first last **
    XiziDLL.dllseg first prev node node_prev before **
    XiziDLL.links node next node_prev **
    XiziDLL.dllseg next node head last after |--
    XiziDLL.links head head_first last **
    XiziDLL.dllseg first prev head last (before ++ node :: after)).
  {
    intros head head_first last first prev node node_prev next before after
      Hnode_nonnull Hnode_head.
    revert first prev.
    induction before as [| expected before IH]; intros first prev.
    - unfold XiziDLL.dllseg at 1.
      simpl. Intros.
      destruct H as [Hfirst Hprev].
      subst first. subst prev.
      unfold XiziDLL.dllseg at 2.
      simpl. fold XiziDLL.dllseg.
      Exists next.
      entailer!.
    - unfold XiziDLL.dllseg at 1.
      simpl. fold XiziDLL.dllseg.
      Intros first_next. Intros.
      subst expected.
      unfold XiziDLL.dllseg at 2.
      simpl. fold XiziDLL.dllseg.
      Exists first_next.
      prop_apply_p (dll_links_neq__dll_dispatch_all
        head head_first last first first_next prev).
      Intros.
      sep_apply (IH first_next first).
      entailer!.
  }
  pre_process.
  subst nodes_dispatch_case.
  prop_apply_p (dllseg_first_value__dll_dispatch_all
    node_next linklist_node_pre linklist_pre last nodes_after PreH1).
  Intros.
  entailer!.
  pose proof (dll_join_at_member__dll_dispatch_all
    linklist_pre first last first linklist_pre
    linklist_node_pre node_prev node_next nodes_before nodes_after
    PreH6 PreH7) as Hjoin.
  unfold XiziDLL.links in Hjoin.
  lazymatch type of Hjoin with
  | ?P |-- _ => eapply (derivable1_trans _ P)
  end.
  - entailer!.
    unfold xizi_dllseg.
    entailer!.
  - eapply derivable1_trans.
    + exact Hjoin.
    + unfold xizi_dll, XiziDLL.dll.
      Exists first last.
      unfold XiziDLL.links.
      entailer!.
Qed.

Lemma proof_of_xizi_double_link_next_rec_last_return_wit_4 : xizi_double_link_next_rec_last_return_wit_4.
Proof.
  pre_process.
  subst linklist_node_pre.
  destruct nodes_dispatch_case as [| expected rest].
  - unfold xizi_dllseg, XiziDLL.dllseg at 1.
    simpl. Intros.
    destruct H as [Hfirst _]. congruence.
  - unfold xizi_dllseg, XiziDLL.dllseg at 1.
    simpl. fold XiziDLL.dllseg.
    Intros next. Intros.
    subst expected.
    entailer!.
    unfold xizi_dll, XiziDLL.dll.
    Exists first last.
    unfold XiziDLL.links.
    entailer!.
    unfold XiziDLL.dllseg at 2.
    simpl. fold XiziDLL.dllseg.
    Exists next.
    unfold XiziDLL.links.
    entailer!.
Qed.

Lemma proof_of_xizi_double_link_next_rec_last_derive_sentinel_case_by_dispatch_case : xizi_double_link_next_rec_last_derive_sentinel_case_by_dispatch_case.
Proof.
  pre_process.
  Exists nodes_sentinel_case.
  entailer!.
  apply derivable1_wand_sepcon_adjoint.
  Intros retval_2.
  Exists retval_2.
  entailer!.
  - rewrite H0.
    unfold xizi_double_link_next_dispatch_value.
    destruct (Z.eq_dec linklist_node_pre linklist_pre).
    + reflexivity.
    + contradiction.
  - unfold xizi_double_link_next_anchor.
    right; exact H.
Qed.

Lemma proof_of_xizi_double_link_next_rec_last_derive_member_case_by_dispatch_case : xizi_double_link_next_rec_last_derive_member_case_by_dispatch_case.
Proof.
  assert (dllseg_head_notin__dll_dispatch_all : forall node prev stop last nodes,
    xizi_dllseg node prev stop last nodes |-- “ ~ In stop nodes ”).
  {
    intros node prev stop last nodes.
    revert node prev.
    induction nodes as [| expected rest IH]; intros node prev.
    - unfold xizi_dllseg, XiziDLL.dllseg.
      simpl. entailer!.
    - unfold xizi_dllseg, XiziDLL.dllseg at 1.
      simpl. fold xizi_dllseg.
      Intros next. Intros.
      sep_apply (IH next node).
      Intros.
      entailer!.
      intros [Heq | Hin].
      * congruence.
      * contradiction.
  }
  assert (dll_head_notin__dll_dispatch_all : forall head nodes,
    xizi_dll head nodes |-- “ ~ In head nodes ”).
  {
    intros head nodes.
    unfold xizi_dll, XiziDLL.dll.
    Intros first last.
    sep_apply (dllseg_head_notin__dll_dispatch_all
      first head head last nodes).
    Intros.
    entailer!.
  }
  pre_process.
  prop_apply_p (dll_head_notin__dll_dispatch_all
    linklist_pre nodes_member_case).
  Intros.
  Exists nodes_member_case.
  entailer!.
  unfold xizi_double_link_next_anchor.
  entailer!.
  apply derivable1_wand_sepcon_adjoint.
  Intros retval_2.
  Exists retval_2.
  entailer!.
  - rewrite H1.
    unfold xizi_double_link_next_dispatch_value.
    destruct (Z.eq_dec linklist_node_pre linklist_pre).
    + subst linklist_node_pre. contradiction.
    + reflexivity.
  - entailer!.
  unfold xizi_double_link_next_anchor.
  left; exact H.
Qed.
