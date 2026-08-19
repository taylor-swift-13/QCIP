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
    “ node <> 0 ” && EX node_next node_prev,
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
  aggressive_pre_process.
  destruct (Hfirst_occurrence nodes linklist_node_pre PreH2)
    as [nodes_before [nodes_after [Hnodes Hfresh]]].
  subst nodes.
  sep_apply (Hsplit first_2 linklist_pre linklist_pre last_2
                    nodes_before linklist_node_pre nodes_after).
  Intros.
  Intros node_next node_prev.
  Exists node_next node_prev nodes_before nodes_after.
  entailer!.
Qed.

Lemma proof_of_xizi_double_link_next_return_wit_1 : xizi_double_link_next_return_wit_1.
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
  subst nodes.
  prop_apply (Hstop_nil linklist_node_pre linklist_pre last nodes_after).
  Intros.
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
                   linklist_node_pre node_prev linklist_pre nil PreH5 PreH6).
    + sep_apply (xizi_dll_close linklist_pre first last
                               (nodes_before ++ linklist_node_pre :: nil) PreH5).
      entailer!.
Qed.

Lemma proof_of_xizi_double_link_next_return_wit_2 : xizi_double_link_next_return_wit_2.
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
  subst nodes.
  prop_apply (Hvalue node_next linklist_node_pre linklist_pre last nodes_after PreH1).
  Intros.
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
                   linklist_node_pre node_prev node_next nodes_after PreH5 PreH6).
    + sep_apply (xizi_dll_close linklist_pre first last
                               (nodes_before ++ linklist_node_pre :: nodes_after) PreH5).
      entailer!.
Qed.
