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
  assert (Hlinks_neq : forall p q pn pp qn qp,
    xizi_dll_links p pn pp ** xizi_dll_links q qn qp |-- “ p <> q ”).
  {
    intros p q pn pp qn qp.
    unfold xizi_dll_links, XiziDLL.links.
    destruct (Z.eq_dec p q) as [Heq | Hneq].
    - subst q.
      assert (Hreorder :
        (&(p # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> pn **
         &(p # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> pp) **
        (&(p # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> qn **
         &(p # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> qp) |--
        (&(p # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> pn **
         &(p # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> qn) **
        (&(p # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> pp **
         &(p # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> qp)).
      {
        sepcon_right_assoc.
        cancel (&(p # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> pn).
        cancel (&(p # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> qn).
        cancel (&(p # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> pp).
        cancel (&(p # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> qp).
      }
      change (((&(p # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> pn **
                &(p # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> pp) **
               (&(p # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> qn **
                &(p # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> qp)) |--
              “ p <> p ”).
      etransitivity.
      + exact Hreorder.
      + sep_apply (dup_store_ptr (&(p # "SysDoubleLinklistNode" ->ₛ "node_next")) pn qn).
        entailer!.
    - entailer!.
  }
  assert (Hsplit : forall first prev stop last before node after,
    xizi_dllseg first prev stop last (before ++ node :: after) |--
    “ node <> 0 ” && “ node <> stop ” && EX node_next node_prev,
      xizi_dllseg first prev node node_prev before **
      xizi_dll_links node node_next node_prev **
      xizi_dllseg node_next node stop last after).
  {
    intros first prev stop last before node after.
    revert first prev.
    induction before as [| a before IH].
    - intros first prev.
      unfold xizi_dllseg, XiziDLL.dllseg; simpl.
      Intros next.
      Exists next prev.
      unfold xizi_dll_links.
      entailer!.
      subst first.
      reflexivity.
      unfold NULL in *; congruence.
    - intros first prev.
      unfold xizi_dllseg at 1; simpl.
      Intros next.
      sep_apply_l_atomic (IH next first).
      Intros.
      Intros node_next node_prev.
      assert (Hreorder :
        xizi_dllseg next first node node_prev before **
        (xizi_dll_links node node_next node_prev **
         (xizi_dllseg node_next node stop last after **
          XiziDLL.links first next prev)) |--
        (xizi_dll_links first next prev **
         xizi_dll_links node node_next node_prev) **
        (xizi_dllseg next first node node_prev before **
         xizi_dllseg node_next node stop last after)).
      {
        sepcon_right_assoc.
        cancel (xizi_dll_links first next prev).
        cancel (xizi_dll_links node node_next node_prev).
        cancel (xizi_dllseg next first node node_prev before).
        cancel (xizi_dllseg node_next node stop last after).
        entailer!.
      }
      etransitivity.
      + exact Hreorder.
      + prop_apply (Hlinks_neq first node next prev node_next node_prev).
        Intros.
        Exists node_next node_prev.
        unfold xizi_dllseg at 3; simpl.
        Exists next.
        unfold xizi_dll_links, XiziDLL.links.
        entailer!.
  }
  assert (Hfirst_occurrence : forall (xs : list Z) x,
    In x xs ->
    exists before after,
      xs = before ++ x :: after /\ ~ In x before).
  {
    intros xs x Hin.
    induction xs as [| a xs IH].
    - contradiction.
    - destruct (Z.eq_dec a x) as [Heq | Hneq].
      + subst a.
        exists nil, xs.
        simpl; tauto.
      + simpl in Hin.
        destruct Hin as [Heq | Hin].
        * contradiction.
        * destruct (IH Hin) as [before [after [Hxs Hfresh]]].
          exists (a :: before), after.
          simpl; subst xs; split; [reflexivity | tauto].
  }
  assert (Hnext_value : forall (before : list Z) node after,
    ~ In node before ->
    xizi_double_link_next_value (before ++ node :: after) node =
      xizi_double_link_first_value after).
  {
    intros before node after Hfresh.
    induction before as [| a before IH].
    - simpl.
      destruct (Z.eq_dec node node); [reflexivity | contradiction].
    - simpl in Hfresh |- *.
      destruct (Z.eq_dec a node) as [Heq | Hneq].
      + subst a; tauto.
      + apply IH; tauto.
  }
  pre_process.
  unfold xizi_double_link_next_anchor in PreH1.
  destruct PreH1 as [Hin | Heq].
  - destruct (Hfirst_occurrence nodes_dispatch_case linklist_node_pre Hin)
      as [nodes_before [nodes_after [Hnodes Hfresh]]].
    unfold xizi_dll, XiziDLL.dll at 1.
    Intros first last.
    rewrite Hnodes.
    sep_apply (Hsplit first linklist_pre linklist_pre last
                      nodes_before linklist_node_pre nodes_after).
    Intros node_next node_prev.
    Right.
    Exists node_next node_prev nodes_before nodes_after last first.
    unfold xizi_dll_links, XiziDLL.links.
    unfold xizi_double_link_next_dispatch_value.
    destruct (Z.eq_dec linklist_node_pre linklist_pre).
    + entailer!.
    + rewrite Hnext_value by exact Hfresh.
      entailer!.
  - subst linklist_node_pre.
    unfold xizi_dll, XiziDLL.dll at 1.
    Intros first last.
    Left.
    Exists last first.
    unfold xizi_dll_links, XiziDLL.links.
    unfold xizi_double_link_next_dispatch_value.
    destruct (Z.eq_dec linklist_pre linklist_pre); [| contradiction].
    entailer!.
Qed.

Lemma proof_of_xizi_double_link_next_rec_last_return_wit_1 : xizi_double_link_next_rec_last_return_wit_1.
Proof.
  left.
  assert (Hstop_nil : forall prev stop last nodes,
    xizi_dllseg stop prev stop last nodes |-- “ nodes = nil ”).
  {
    intros prev stop last nodes.
    destruct nodes as [| node rest].
    - entailer!.
    - unfold xizi_dllseg, XiziDLL.dllseg; simpl.
      Intros next.
      Intros.
      contradiction.
  }
  pre_process.
  subst first.
  subst linklist_node_pre.
  prop_apply (Hstop_nil linklist_pre linklist_pre last nodes_dispatch_case).
  Intros_p Hnodes.
  subst nodes_dispatch_case.
  unfold xizi_dll, XiziDLL.dll.
  Exists linklist_pre last.
  unfold XiziDLL.links.
  unfold xizi_double_link_next_dispatch_value,
         xizi_double_link_first_value in *.
  destruct (Z.eq_dec linklist_pre linklist_pre); [| contradiction].
  entailer!.
Qed.

Lemma proof_of_xizi_double_link_next_rec_last_return_wit_2 : xizi_double_link_next_rec_last_return_wit_2.
Proof.
  left.
  assert (Hlinks_neq : forall p q pn pp qn qp,
    xizi_dll_links p pn pp ** xizi_dll_links q qn qp |-- “ p <> q ”).
  {
    intros p q pn pp qn qp.
    unfold xizi_dll_links, XiziDLL.links.
    destruct (Z.eq_dec p q) as [Heq | Hneq].
    - subst q.
      assert (Hreorder :
        (&(p # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> pn **
         &(p # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> pp) **
        (&(p # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> qn **
         &(p # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> qp) |--
        (&(p # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> pn **
         &(p # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> qn) **
        (&(p # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> pp **
         &(p # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> qp)).
      {
        sepcon_right_assoc.
        cancel (&(p # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> pn).
        cancel (&(p # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> qn).
        cancel (&(p # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> pp).
        cancel (&(p # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> qp).
      }
      change (((&(p # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> pn **
                &(p # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> pp) **
               (&(p # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> qn **
                &(p # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> qp)) |--
              “ p <> p ”).
      etransitivity.
      + exact Hreorder.
      + sep_apply (dup_store_ptr (&(p # "SysDoubleLinklistNode" ->ₛ "node_next")) pn qn).
        entailer!.
    - entailer!.
  }
  assert (Hstop_nil : forall prev stop last nodes,
    xizi_dllseg stop prev stop last nodes |-- “ nodes = nil ”).
  {
    intros prev stop last nodes.
    destruct nodes as [| node rest].
    - entailer!.
    - unfold xizi_dllseg, XiziDLL.dllseg; simpl.
      Intros next.
      Intros.
      contradiction.
  }
  assert (Hjoin : forall head sent_first sent_last first prev before
                         node node_prev node_next after,
    head <> 0 -> node <> 0 ->
    xizi_dll_links head sent_first sent_last **
    xizi_dllseg first prev node node_prev before **
    xizi_dll_links node node_next node_prev **
    xizi_dllseg node_next node head sent_last after |--
    xizi_dll_links head sent_first sent_last **
    xizi_dllseg first prev head sent_last (before ++ node :: after)).
  {
    intros head sent_first sent_last first prev before
           node node_prev node_next after Hhead Hnode.
    revert first prev.
    induction before as [| a before IH].
    - intros first prev.
      unfold xizi_dllseg at 1; simpl.
      Intros.
      prop_apply (Hlinks_neq head node sent_first sent_last node_next node_prev).
      Intros.
      destruct H as [Hfirst Hprev].
      subst first; subst prev.
      Exists node_next.
      unfold xizi_dll_links, XiziDLL.links.
      entailer!.
    - intros first prev.
      unfold xizi_dllseg at 1; simpl.
      Intros next.
      assert (Hreorder1 :
        XiziDLL.links first next prev **
        (XiziDLL.dllseg next first node node_prev before **
         (xizi_dll_links head sent_first sent_last **
          (xizi_dll_links node node_next node_prev **
           xizi_dllseg node_next node head sent_last after))) |--
        XiziDLL.links first next prev **
        (xizi_dll_links head sent_first sent_last **
         xizi_dllseg next first node node_prev before **
         xizi_dll_links node node_next node_prev **
         xizi_dllseg node_next node head sent_last after)).
      {
        sepcon_right_assoc.
        cancel (XiziDLL.links first next prev).
        cancel (xizi_dll_links head sent_first sent_last).
        cancel (xizi_dllseg next first node node_prev before).
        cancel (xizi_dll_links node node_next node_prev).
        cancel (xizi_dllseg node_next node head sent_last after).
      }
      etransitivity.
      + exact Hreorder1.
      + sep_apply_l_atomic (IH next first).
        assert (Hreorder2 :
          xizi_dll_links head sent_first sent_last **
          (xizi_dllseg next first head sent_last (before ++ node :: after) **
           XiziDLL.links first next prev) |--
          (xizi_dll_links head sent_first sent_last **
           xizi_dll_links first next prev) **
          xizi_dllseg next first head sent_last (before ++ node :: after)).
        {
          sepcon_right_assoc.
          cancel (xizi_dll_links head sent_first sent_last).
          cancel (xizi_dll_links first next prev).
          cancel (xizi_dllseg next first head sent_last
                               (before ++ node :: after)).
          entailer!.
        }
        etransitivity.
        * exact Hreorder2.
        * prop_apply (Hlinks_neq head first sent_first sent_last next prev).
          Intros.
          Exists next.
          unfold xizi_dll_links, XiziDLL.links.
          entailer!.
  }
  pre_process.
  subst node_next.
  subst nodes_dispatch_case.
  prop_apply (Hstop_nil linklist_node_pre linklist_pre last nodes_after).
  Intros_p Hafter.
  subst nodes_after.
  assert (Hlayout :
    xizi_dllseg linklist_pre linklist_node_pre linklist_pre last nil **
    ((&(linklist_pre # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> first) **
     ((&(linklist_pre # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> last) **
      (xizi_dllseg first linklist_pre linklist_node_pre node_prev nodes_before **
       ((&(linklist_node_pre # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> linklist_pre) **
        (&(linklist_node_pre # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> node_prev))))) |--
    xizi_dll_links linklist_pre first last **
    xizi_dllseg first linklist_pre linklist_node_pre node_prev nodes_before **
    xizi_dll_links linklist_node_pre linklist_pre node_prev **
    xizi_dllseg linklist_pre linklist_node_pre linklist_pre last nil).
  {
    unfold xizi_dll_links, XiziDLL.links.
    sepcon_right_assoc.
    cancel (&(linklist_pre # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> first).
    cancel (&(linklist_pre # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> last).
    cancel (xizi_dllseg first linklist_pre linklist_node_pre node_prev nodes_before).
    cancel (&(linklist_node_pre # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> linklist_pre).
    cancel (&(linklist_node_pre # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> node_prev).
    cancel (xizi_dllseg linklist_pre linklist_node_pre linklist_pre last nil).
  }
  etransitivity.
  - exact Hlayout.
  - etransitivity.
    + apply (Hjoin linklist_pre first last first linklist_pre nodes_before
                   linklist_node_pre node_prev linklist_pre nil PreH2 PreH6).
    + sep_apply (xizi_dll_close linklist_pre first last
                               (nodes_before ++ linklist_node_pre :: nil) PreH2).
      simpl in PreH5.
      entailer!.
Qed.

Lemma proof_of_xizi_double_link_next_rec_last_return_wit_3 : xizi_double_link_next_rec_last_return_wit_3.
Proof.
  left.
  assert (Hlinks_neq : forall p q pn pp qn qp,
    xizi_dll_links p pn pp ** xizi_dll_links q qn qp |-- “ p <> q ”).
  {
    intros p q pn pp qn qp.
    unfold xizi_dll_links, XiziDLL.links.
    destruct (Z.eq_dec p q) as [Heq | Hneq].
    - subst q.
      assert (Hreorder :
        (&(p # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> pn **
         &(p # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> pp) **
        (&(p # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> qn **
         &(p # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> qp) |--
        (&(p # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> pn **
         &(p # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> qn) **
        (&(p # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> pp **
         &(p # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> qp)).
      {
        sepcon_right_assoc.
        cancel (&(p # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> pn).
        cancel (&(p # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> qn).
        cancel (&(p # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> pp).
        cancel (&(p # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> qp).
      }
      change (((&(p # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> pn **
                &(p # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> pp) **
               (&(p # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> qn **
                &(p # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> qp)) |--
              “ p <> p ”).
      etransitivity.
      + exact Hreorder.
      + sep_apply (dup_store_ptr (&(p # "SysDoubleLinklistNode" ->ₛ "node_next")) pn qn).
        entailer!.
    - entailer!.
  }
  assert (Hvalue : forall node prev stop last nodes,
    node <> stop ->
    xizi_dllseg node prev stop last nodes |--
    “ node = xizi_double_link_first_value nodes ”).
  {
    intros node prev stop last nodes Hneq.
    destruct nodes as [| expected rest].
    - unfold xizi_dllseg, XiziDLL.dllseg; simpl.
      Intros.
      destruct H as [Hsame _].
      contradiction.
    - unfold xizi_dllseg, XiziDLL.dllseg; simpl.
      Intros next.
      Intros.
      subst expected.
      entailer!.
  }
  assert (Hjoin : forall head sent_first sent_last first prev before
                         node node_prev node_next after,
    head <> 0 -> node <> 0 ->
    xizi_dll_links head sent_first sent_last **
    xizi_dllseg first prev node node_prev before **
    xizi_dll_links node node_next node_prev **
    xizi_dllseg node_next node head sent_last after |--
    xizi_dll_links head sent_first sent_last **
    xizi_dllseg first prev head sent_last (before ++ node :: after)).
  {
    intros head sent_first sent_last first prev before
           node node_prev node_next after Hhead Hnode.
    revert first prev.
    induction before as [| a before IH].
    - intros first prev.
      unfold xizi_dllseg at 1; simpl.
      Intros.
      prop_apply (Hlinks_neq head node sent_first sent_last node_next node_prev).
      Intros.
      destruct H as [Hfirst Hprev].
      subst first; subst prev.
      Exists node_next.
      unfold xizi_dll_links, XiziDLL.links.
      entailer!.
    - intros first prev.
      unfold xizi_dllseg at 1; simpl.
      Intros next.
      assert (Hreorder1 :
        XiziDLL.links first next prev **
        (XiziDLL.dllseg next first node node_prev before **
         (xizi_dll_links head sent_first sent_last **
          (xizi_dll_links node node_next node_prev **
           xizi_dllseg node_next node head sent_last after))) |--
        XiziDLL.links first next prev **
        (xizi_dll_links head sent_first sent_last **
         xizi_dllseg next first node node_prev before **
         xizi_dll_links node node_next node_prev **
         xizi_dllseg node_next node head sent_last after)).
      {
        sepcon_right_assoc.
        cancel (XiziDLL.links first next prev).
        cancel (xizi_dll_links head sent_first sent_last).
        cancel (xizi_dllseg next first node node_prev before).
        cancel (xizi_dll_links node node_next node_prev).
        cancel (xizi_dllseg node_next node head sent_last after).
      }
      etransitivity.
      + exact Hreorder1.
      + sep_apply_l_atomic (IH next first).
        assert (Hreorder2 :
          xizi_dll_links head sent_first sent_last **
          (xizi_dllseg next first head sent_last (before ++ node :: after) **
           XiziDLL.links first next prev) |--
          (xizi_dll_links head sent_first sent_last **
           xizi_dll_links first next prev) **
          xizi_dllseg next first head sent_last (before ++ node :: after)).
        {
          sepcon_right_assoc.
          cancel (xizi_dll_links head sent_first sent_last).
          cancel (xizi_dll_links first next prev).
          cancel (xizi_dllseg next first head sent_last
                               (before ++ node :: after)).
          entailer!.
        }
        etransitivity.
        * exact Hreorder2.
        * prop_apply (Hlinks_neq head first sent_first sent_last next prev).
          Intros.
          Exists next.
          unfold xizi_dll_links, XiziDLL.links.
          entailer!.
  }
  pre_process.
  subst nodes_dispatch_case.
  prop_apply (Hvalue node_next linklist_node_pre linklist_pre last
                     nodes_after PreH1).
  Intros_p Hnextvalue.
  assert (Hlayout :
    xizi_dllseg node_next linklist_node_pre linklist_pre last nodes_after **
    ((&(linklist_pre # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> first) **
     ((&(linklist_pre # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> last) **
      (xizi_dllseg first linklist_pre linklist_node_pre node_prev nodes_before **
       ((&(linklist_node_pre # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> node_next) **
        (&(linklist_node_pre # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> node_prev))))) |--
    xizi_dll_links linklist_pre first last **
    xizi_dllseg first linklist_pre linklist_node_pre node_prev nodes_before **
    xizi_dll_links linklist_node_pre node_next node_prev **
    xizi_dllseg node_next linklist_node_pre linklist_pre last nodes_after).
  {
    unfold xizi_dll_links, XiziDLL.links.
    sepcon_right_assoc.
    cancel (&(linklist_pre # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> first).
    cancel (&(linklist_pre # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> last).
    cancel (xizi_dllseg first linklist_pre linklist_node_pre node_prev nodes_before).
    cancel (&(linklist_node_pre # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> node_next).
    cancel (&(linklist_node_pre # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> node_prev).
    cancel (xizi_dllseg node_next linklist_node_pre linklist_pre last nodes_after).
  }
  etransitivity.
  - exact Hlayout.
  - etransitivity.
    + apply (Hjoin linklist_pre first last first linklist_pre nodes_before
                   linklist_node_pre node_prev node_next nodes_after PreH2 PreH6).
    + sep_apply (xizi_dll_close linklist_pre first last
                               (nodes_before ++ linklist_node_pre :: nodes_after) PreH2).
      entailer!.
Qed.

Lemma proof_of_xizi_double_link_next_rec_last_return_wit_4 : xizi_double_link_next_rec_last_return_wit_4.
Proof.
  left.
  assert (Hvalue : forall node prev stop last nodes,
    node <> stop ->
    xizi_dllseg node prev stop last nodes |--
    “ node = xizi_double_link_first_value nodes ”).
  {
    intros node prev stop last nodes Hneq.
    destruct nodes as [| expected rest].
    - unfold xizi_dllseg, XiziDLL.dllseg; simpl.
      Intros.
      destruct H as [Hsame _].
      contradiction.
    - unfold xizi_dllseg, XiziDLL.dllseg; simpl.
      Intros next.
      Intros.
      subst expected.
      entailer!.
  }
  pre_process.
  subst linklist_node_pre.
  prop_apply (Hvalue first linklist_pre linklist_pre last
                     nodes_dispatch_case PreH1).
  Intros_p Hfirstvalue.
  unfold xizi_dll, XiziDLL.dll.
  Exists first last.
  unfold XiziDLL.links.
  unfold xizi_double_link_next_dispatch_value in PreH4.
  destruct (Z.eq_dec linklist_pre linklist_pre) in PreH4;
    [| contradiction].
  entailer!.
  unfold xizi_double_link_next_dispatch_value.
  destruct (Z.eq_dec linklist_pre linklist_pre);
    [exact Hfirstvalue | contradiction].
Qed.

Lemma proof_of_xizi_double_link_next_rec_last_derive_sentinel_case_by_dispatch_case : xizi_double_link_next_rec_last_derive_sentinel_case_by_dispatch_case.
Proof.
  pre_process.
  Exists nodes_sentinel_case.
  assert (HW : emp |--
    ((EX retval_2,
      “ retval_2 = xizi_double_link_next_dispatch_value
          nodes_sentinel_case linklist_pre linklist_node_pre ” &&
      xizi_dll linklist_pre nodes_sentinel_case) -*
     (EX retval,
      “ retval = xizi_double_link_first_value nodes_sentinel_case ” &&
      xizi_dll linklist_pre nodes_sentinel_case))).
  {
    apply derivable1s_wand_sepcon_adjoint.
    pre_process.
    Intros retval_2.
    Exists (xizi_double_link_first_value nodes_sentinel_case).
    subst linklist_node_pre.
    unfold xizi_double_link_next_dispatch_value in H0.
    destruct (Z.eq_dec linklist_pre linklist_pre) in H0;
      [| contradiction].
    entailer!.
  }
  apply sepcon_cancel_end.
  - unfold xizi_double_link_next_anchor.
    entailer!.
  - exact HW.
Qed.

Lemma proof_of_xizi_double_link_next_rec_last_derive_member_case_by_dispatch_case : xizi_double_link_next_rec_last_derive_member_case_by_dispatch_case.
Proof.
  assert (Hstop_not_in : forall node prev stop last nodes,
    xizi_dllseg node prev stop last nodes |-- “ ~ In stop nodes ”).
  {
    intros node prev stop last nodes.
    revert node prev.
    induction nodes as [| expected rest IH].
    - intros node prev.
      simpl.
      entailer!.
    - intros node prev.
      unfold xizi_dllseg at 1; simpl.
      Intros next.
      sep_apply_l_atomic (IH next node).
      Intros_p Hrest.
      dump_pre_spatial.
      subst expected.
      simpl; tauto.
  }
  pre_process.
  assert (Hdispatch_member :
    xizi_dll linklist_pre nodes_member_case |--
    “ xizi_double_link_next_dispatch_value nodes_member_case
        linklist_pre linklist_node_pre =
      xizi_double_link_next_value nodes_member_case linklist_node_pre ”).
  {
    sep_apply_l_atomic (xizi_dll_open linklist_pre nodes_member_case).
    Intros first last.
    prop_apply (Hstop_not_in first linklist_pre linklist_pre last
                             nodes_member_case).
    Intros_p Hnotin.
    dump_pre_spatial.
    unfold xizi_double_link_next_dispatch_value.
    destruct (Z.eq_dec linklist_node_pre linklist_pre); [subst | reflexivity].
    contradiction.
  }
  Exists nodes_member_case.
  assert (HW : emp |--
    ((EX retval_2,
      “ retval_2 = xizi_double_link_next_dispatch_value
          nodes_member_case linklist_pre linklist_node_pre ” &&
      xizi_dll linklist_pre nodes_member_case) -*
     (EX retval,
      “ retval = xizi_double_link_next_value
          nodes_member_case linklist_node_pre ” &&
      xizi_dll linklist_pre nodes_member_case))).
  {
    apply derivable1s_wand_sepcon_adjoint.
    pre_process.
    Intros retval_2.
    prop_apply Hdispatch_member.
    Intros_p Hdispatch.
    Exists (xizi_double_link_next_value nodes_member_case linklist_node_pre).
    entailer!.
  }
  apply sepcon_cancel_end.
  - unfold xizi_double_link_next_anchor.
    entailer!.
  - exact HW.
Qed.
