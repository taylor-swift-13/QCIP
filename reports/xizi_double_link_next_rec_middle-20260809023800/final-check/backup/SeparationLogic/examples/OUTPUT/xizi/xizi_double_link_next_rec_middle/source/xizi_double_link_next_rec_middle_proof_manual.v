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
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_next_rec_middle.source Require Import xizi_double_link_next_rec_middle_goal.
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_next_rec_middle.source Require Import xizi_double_link_next_rec_middle_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
From QCIPLib.xizi.xizi_double_link_common Require Import xizi_double_link_lib.
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_next_rec_middle.source Require Import xizi_double_link_next_rec_middle_lib.
Local Open Scope sac.

Lemma proof_of_xizi_double_link_next_rec_middle_entail_wit_1 : xizi_double_link_next_rec_middle_entail_wit_1.
Proof.
  assert (Hsplit : forall before first prev head node last after,
    xizi_dllseg first prev head last (before ++ node :: after) |--
    EX node_next node_prev,
      xizi_dllseg first prev node node_prev before **
      xizi_dll_links node node_next node_prev **
      xizi_dllseg node_next node head last after).
  {
    intros before.
    induction before as [| a before IH]; intros first prev head node last after.
    - simpl.
      Intros next.
      subst first.
      Exists next prev.
      simpl.
      entailer!.
    - simpl.
      Intros next.
      subst first.
      sep_apply (IH next a head node last after).
      Intros node_next node_prev.
      destruct (Z.eq_dec a node) as [Heq | Haneq].
      + subst node.
        unfold xizi_dll_links, XiziDLL.links.
        transitivity
          ((&(a # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> node_next **
            &(a # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> next) ** TT).
        * cancel (&(a # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> node_next).
          cancel (&(a # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> next).
          entailer!.
        * sep_apply (dup_store_ptr (&(a # "SysDoubleLinklistNode" ->ₛ "node_next")) node_next next).
          entailer!.
      + Exists node_next node_prev.
        simpl.
        Exists next.
        entailer!.
  }
  pre_process.
  subst linklist_pre.
  subst linklist_node_pre.
  unfold xizi_dll, XiziDLL.dll.
  Intros first last.
  sep_apply (Hsplit nodes_before first head head node last nodes_after).
  Intros node_next node_prev.
  Exists node_next node_prev last first.
  unfold xizi_dll_links, XiziDLL.links.
  entailer!.
Qed.

Lemma proof_of_xizi_double_link_next_rec_middle_return_wit_1 : xizi_double_link_next_rec_middle_return_wit_1.
Proof.
  assert (Hsame_nil : forall stop prev last nodes,
    xizi_dllseg stop prev stop last nodes |--
    “ nodes = nil /\ prev = last ” && emp).
  {
    intros stop prev last nodes.
    destruct nodes as [| a nodes].
    - simpl.
      Intros.
      entailer!.
    - simpl.
      Intros next.
      contradiction.
  }
  assert (Hrebuild : forall before first prev stop stop_first stop_last node node_prev last after node_next,
    node <> NULL ->
    xizi_dll_links stop stop_first stop_last **
    (xizi_dllseg first prev node node_prev before **
     xizi_dll_links node node_next node_prev **
     xizi_dllseg node_next node stop last after) |--
    xizi_dll_links stop stop_first stop_last **
    xizi_dllseg first prev stop last (before ++ node :: after)).
  {
    intros before.
    induction before as [| a before IH]; intros first prev stop stop_first stop_last node node_prev last after node_next Hnode.
    - simpl.
      Intros.
      destruct H as [Hfirst Hprev].
      subst first.
      subst node_prev.
      destruct (Z.eq_dec node stop) as [Heq | Hneq].
      + subst node.
        unfold xizi_dll_links, XiziDLL.links.
        transitivity
          ((&(stop # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> stop_first **
            &(stop # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> node_next) ** TT).
        * cancel (&(stop # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> stop_first).
          cancel (&(stop # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> node_next).
          entailer!.
        * sep_apply (dup_store_ptr (&(stop # "SysDoubleLinklistNode" ->ₛ "node_next")) stop_first node_next).
          entailer!.
      + Exists node_next.
        entailer!.
    - simpl.
      Intros next.
      subst first.
      destruct (Z.eq_dec a stop) as [Heq | Hneq].
      + subst a.
        unfold xizi_dll_links, XiziDLL.links.
        transitivity
          ((&(stop # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> stop_first **
            &(stop # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> next) ** TT).
        * cancel (&(stop # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> stop_first).
          cancel (&(stop # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> next).
          entailer!.
        * sep_apply (dup_store_ptr (&(stop # "SysDoubleLinklistNode" ->ₛ "node_next")) stop_first next).
          entailer!.
      + Exists next.
        split_pure_spatial.
        * cancel (xizi_dll_links a next prev).
          transitivity
            (xizi_dll_links stop stop_first stop_last **
             (xizi_dllseg next a node node_prev before **
              xizi_dll_links node node_next node_prev **
              xizi_dllseg node_next node stop last after)).
          -- cancel (xizi_dll_links stop stop_first stop_last).
             cancel (xizi_dllseg next a node node_prev before).
             cancel (xizi_dll_links node node_next node_prev).
             cancel (xizi_dllseg node_next node stop last after).
          -- transitivity
               (xizi_dll_links stop stop_first stop_last **
                xizi_dllseg next a stop last (before ++ node :: after)).
             ++ apply (IH next a stop stop_first stop_last node node_prev last after node_next Hnode).
             ++ cancel (xizi_dll_links stop stop_first stop_last).
                cancel (xizi_dllseg next a stop last (before ++ node :: after)).
        * entailer!.
  }
  pre_process.
  subst linklist_pre.
  subst linklist_node_pre.
  subst node_next.
  sep_apply (Hsame_nil head node last nodes_after).
  Intros.
  destruct H as [Hnodes Hlast].
  subst nodes_after.
  transitivity
    (xizi_dll_links head first last **
     (xizi_dllseg first head node node_prev nodes_before **
      xizi_dll_links node head node_prev **
      xizi_dllseg head node head last nil)).
  - unfold xizi_dll_links, XiziDLL.links.
    simpl.
    entailer!.
  - transitivity
      (xizi_dll_links head first last **
       xizi_dllseg first head head last (nodes_before ++ node :: nil)).
    + apply (Hrebuild nodes_before first head head first last node node_prev last nil head PreH5).
    + unfold xizi_dll, XiziDLL.dll.
      Exists first last.
      entailer!.
Qed.

Lemma proof_of_xizi_double_link_next_rec_middle_return_wit_2 : xizi_double_link_next_rec_middle_return_wit_2.
Proof.
  assert (Hhead_value : forall node prev stop last nodes,
    node <> stop ->
    xizi_dllseg node prev stop last nodes |--
    “ node = xizi_double_link_next_value nodes ” &&
    xizi_dllseg node prev stop last nodes).
  {
    intros node prev stop last nodes Hneq.
    destruct nodes as [| a nodes].
    - simpl.
      Intros.
      destruct H as [Hsame _].
      contradiction.
    - simpl.
      Intros next.
      Exists next.
      entailer!.
  }
  assert (Hrebuild : forall before first prev stop stop_first stop_last node node_prev last after node_next,
    node <> NULL ->
    xizi_dll_links stop stop_first stop_last **
    (xizi_dllseg first prev node node_prev before **
     xizi_dll_links node node_next node_prev **
     xizi_dllseg node_next node stop last after) |--
    xizi_dll_links stop stop_first stop_last **
    xizi_dllseg first prev stop last (before ++ node :: after)).
  {
    intros before.
    induction before as [| a before IH]; intros first prev stop stop_first stop_last node node_prev last after node_next Hnode.
    - simpl.
      Intros.
      destruct H as [Hfirst Hprev].
      subst first.
      subst node_prev.
      destruct (Z.eq_dec node stop) as [Heq | Hneq].
      + subst node.
        unfold xizi_dll_links, XiziDLL.links.
        transitivity
          ((&(stop # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> stop_first **
            &(stop # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> node_next) ** TT).
        * cancel (&(stop # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> stop_first).
          cancel (&(stop # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> node_next).
          entailer!.
        * sep_apply (dup_store_ptr (&(stop # "SysDoubleLinklistNode" ->ₛ "node_next")) stop_first node_next).
          entailer!.
      + Exists node_next.
        entailer!.
    - simpl.
      Intros next.
      subst first.
      destruct (Z.eq_dec a stop) as [Heq | Hneq].
      + subst a.
        unfold xizi_dll_links, XiziDLL.links.
        transitivity
          ((&(stop # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> stop_first **
            &(stop # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> next) ** TT).
        * cancel (&(stop # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> stop_first).
          cancel (&(stop # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> next).
          entailer!.
        * sep_apply (dup_store_ptr (&(stop # "SysDoubleLinklistNode" ->ₛ "node_next")) stop_first next).
          entailer!.
      + Exists next.
        split_pure_spatial.
        * cancel (xizi_dll_links a next prev).
          transitivity
            (xizi_dll_links stop stop_first stop_last **
             (xizi_dllseg next a node node_prev before **
              xizi_dll_links node node_next node_prev **
              xizi_dllseg node_next node stop last after)).
          -- cancel (xizi_dll_links stop stop_first stop_last).
             cancel (xizi_dllseg next a node node_prev before).
             cancel (xizi_dll_links node node_next node_prev).
             cancel (xizi_dllseg node_next node stop last after).
          -- transitivity
               (xizi_dll_links stop stop_first stop_last **
                xizi_dllseg next a stop last (before ++ node :: after)).
             ++ apply (IH next a stop stop_first stop_last node node_prev last after node_next Hnode).
             ++ cancel (xizi_dll_links stop stop_first stop_last).
                cancel (xizi_dllseg next a stop last (before ++ node :: after)).
        * entailer!.
  }
  pre_process.
  subst linklist_pre.
  subst linklist_node_pre.
  sep_apply (Hhead_value node_next node head last nodes_after PreH1).
  Intros.
  transitivity
    (xizi_dll_links head first last **
     (xizi_dllseg first head node node_prev nodes_before **
      xizi_dll_links node node_next node_prev **
      xizi_dllseg node_next node head last nodes_after)).
  - unfold xizi_dll_links, XiziDLL.links.
    entailer!.
  - transitivity
      (xizi_dll_links head first last **
       xizi_dllseg first head head last (nodes_before ++ node :: nodes_after)).
    + apply (Hrebuild nodes_before first head head first last node node_prev last nodes_after node_next PreH5).
    + unfold xizi_dll, XiziDLL.dll.
      Exists first last.
      entailer!.
Qed.
