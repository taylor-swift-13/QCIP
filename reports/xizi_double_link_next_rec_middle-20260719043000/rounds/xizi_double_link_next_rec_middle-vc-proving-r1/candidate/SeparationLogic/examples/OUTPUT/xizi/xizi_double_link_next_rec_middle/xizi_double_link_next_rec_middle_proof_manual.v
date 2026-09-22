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
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_next_rec_middle Require Import xizi_double_link_next_rec_middle_goal.
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_next_rec_middle Require Import xizi_double_link_next_rec_middle_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
From QCIPLib.xizi.xizi_double_link_common Require Import xizi_double_link_lib.
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_next_rec_middle Require Import xizi_double_link_next_rec_middle_lib.
Local Open Scope sac.

Lemma proof_of_xizi_double_link_next_rec_middle_entail_wit_1 : xizi_double_link_next_rec_middle_entail_wit_1.
Proof.
  assert (Hnode_sep : forall a an ap b bn bp,
    XiziDLL.links a an ap ** XiziDLL.links b bn bp |-- “ a <> b ”).
  {
    intros.
    unfold XiziDLL.links.
    sep_apply_l_atomic (store_ptr_undef_store_ptr
      (&(a # "SysDoubleLinklistNode" ->ₛ "node_next")) an).
    sep_apply_l_atomic (store_ptr_undef_store_ptr
      (&(b # "SysDoubleLinklistNode" ->ₛ "node_next")) bn).
    unfold undef_store_ptr.
    Intros.
    prop_apply_p (store_4byte_valid
      (&(a # "SysDoubleLinklistNode" ->ₛ "node_next"))
      (&(b # "SysDoubleLinklistNode" ->ₛ "node_next"))).
    Intros_p Hsep.
    dump_pre_spatial.
    intro Hab; subst b; lia.
  }
  assert (Hsplit : forall start prev stop last before node after,
    xizi_dllseg start prev stop last (before ++ node :: after) |--
    EX node_prev node_next,
      xizi_dllseg start prev node node_prev before **
      xizi_dll_links node node_next node_prev **
      xizi_dllseg node_next node stop last after).
  {
    intros start prev stop last before.
    revert start prev.
    induction before as [| expected before IH]; intros start prev node after.
    - simpl app.
      unfold xizi_dllseg, XiziDLL.dllseg at 1.
      simpl.
      Intros next.
      Intros.
      subst start.
      Exists prev next.
      unfold xizi_dllseg, XiziDLL.dllseg at 1.
      simpl.
      entailer!.
    - simpl app.
      unfold xizi_dllseg, XiziDLL.dllseg at 1.
      simpl.
      Intros next.
      Intros.
      subst start.
      sep_apply_l_atomic (IH next expected node after).
      Intros node_prev node_next.
      unfold xizi_dll_links.
      prop_apply (Hnode_sep node node_next node_prev expected next prev).
      Intros.
      Exists node_prev node_next.
      unfold xizi_dllseg, XiziDLL.dllseg at 1.
      simpl.
      Exists next.
      entailer!.
  }
  pre_process.
  subst linklist_pre; subst linklist_node_pre.
  sep_apply_l_atomic (xizi_dll_open head (nodes_before ++ node :: nodes_after)).
  Intros first last.
  sep_apply_l_atomic (Hsplit first head head last nodes_before node nodes_after).
  Intros node_prev node_next.
  Exists node_next node_prev last first.
  unfold xizi_dll_links, XiziDLL.links.
  entailer!.
Qed.

Lemma proof_of_xizi_double_link_next_rec_middle_return_wit_1 : xizi_double_link_next_rec_middle_return_wit_1.
Proof.
  assert (Hsame_stop : forall stop prev last nodes,
    xizi_dllseg stop prev stop last nodes |--
    “ xizi_double_link_next_value nodes = 0 ”).
  {
    intros stop prev last [|expected rest].
    - unfold xizi_dllseg, XiziDLL.dllseg; simpl; entailer!.
    - unfold xizi_dllseg, XiziDLL.dllseg; simpl.
      Intros next; Intros; entailer!.
  }
  assert (Hraw_recompose : forall stop guard_next guard_prev start prev last
      node node_prev node_next before after,
    node <> NULL ->
    XiziDLL.dllseg start prev node node_prev before **
    ((&(node # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr |-> node_next **
    ((&(node # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr |-> node_prev **
    (XiziDLL.dllseg node_next node stop last after **
    ((&(stop # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr |-> guard_next **
    (&(stop # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr |-> guard_prev)))) |--
    XiziDLL.dllseg start prev stop last (before ++ node :: after) **
    ((&(stop # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr |-> guard_next **
    (&(stop # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr |-> guard_prev)).
  {
    assert (Hraw_node_sep : forall a an b bn,
      (&(a # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr |-> an **
      (&(b # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr |-> bn |--
      “ a <> b ”).
    {
      intros.
      sep_apply_l_atomic (store_ptr_undef_store_ptr
        (&(a # "SysDoubleLinklistNode" ->ₛ "node_next")) an).
      sep_apply_l_atomic (store_ptr_undef_store_ptr
        (&(b # "SysDoubleLinklistNode" ->ₛ "node_next")) bn).
      unfold undef_store_ptr.
      Intros.
      prop_apply_p (store_4byte_valid
        (&(a # "SysDoubleLinklistNode" ->ₛ "node_next"))
        (&(b # "SysDoubleLinklistNode" ->ₛ "node_next"))).
      Intros_p Hsep.
      dump_pre_spatial.
      intro Hab; subst b; lia.
    }
    intros stop guard_next guard_prev start prev last node node_prev node_next before.
    revert start prev.
    induction before as [|expected before IH]; intros start prev after Hnonnull.
    - unfold XiziDLL.dllseg at 1; simpl.
      Intros.
      destruct H as [Hstart Hprev].
      subst start; subst node_prev.
      prop_apply (Hraw_node_sep node node_next stop guard_next).
      Intros.
      unfold XiziDLL.dllseg at 1; simpl.
      Exists node_next.
      entailer!.
      fold XiziDLL.links; fold XiziDLL.dllseg; entailer!.
    - unfold XiziDLL.dllseg at 1; simpl.
      Intros next; Intros; subst start.
      fold XiziDLL.dllseg.
      Exists next.
      split_pure_spatial.
      + rewrite <- derivable1_sepcon_assoc1.
        eapply derivable1_sepcon_mono.
        * apply derivable1_refl.
        * exact (IH next expected after Hnonnull).
      + unfold XiziDLL.links.
        sepcon_lift ((&(expected # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr |-> next).
        sepcon_lift ((&(stop # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr |-> guard_next).
        prop_apply (Hraw_node_sep stop guard_next expected next).
        Intros.
        entailer!.
  }
  pre_process.
  subst linklist_pre; subst linklist_node_pre; subst node_next.
  prop_apply (Hsame_stop head node last nodes_after).
  Intros.
  assert (Hnonnull : node <> NULL) by (unfold NULL; lia).
  split_pure_spatial.
  - unfold xizi_dll, XiziDLL.dll.
    Exists first last.
    unfold xizi_dll_links, XiziDLL.links, xizi_dllseg.
    sepcon_lift (XiziDLL.dllseg first head head last
      (nodes_before ++ node :: nodes_after)).
    sep_apply_r_atomic (Hraw_recompose head first last first head last node
      node_prev head nodes_before nodes_after Hnonnull).
    entailer!.
  - entailer!.
Qed.

Lemma proof_of_xizi_double_link_next_rec_middle_return_wit_2 : xizi_double_link_next_rec_middle_return_wit_2.
Proof.
  assert (Hdifferent_stop : forall start prev stop last nodes,
    start <> stop ->
    xizi_dllseg start prev stop last nodes |--
    “ start = xizi_double_link_next_value nodes ”).
  {
    intros start prev stop last [|expected rest] Hneq.
    - unfold xizi_dllseg, XiziDLL.dllseg; simpl; Intros; entailer!.
    - unfold xizi_dllseg, XiziDLL.dllseg; simpl.
      Intros next; Intros; entailer!.
  }
  assert (Hraw_recompose : forall stop guard_next guard_prev start prev last
      node node_prev node_next before after,
    node <> NULL ->
    XiziDLL.dllseg start prev node node_prev before **
    ((&(node # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr |-> node_next **
    ((&(node # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr |-> node_prev **
    (XiziDLL.dllseg node_next node stop last after **
    ((&(stop # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr |-> guard_next **
    (&(stop # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr |-> guard_prev)))) |--
    XiziDLL.dllseg start prev stop last (before ++ node :: after) **
    ((&(stop # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr |-> guard_next **
    (&(stop # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr |-> guard_prev)).
  {
    assert (Hraw_node_sep : forall a an b bn,
      (&(a # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr |-> an **
      (&(b # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr |-> bn |--
      “ a <> b ”).
    {
      intros.
      sep_apply_l_atomic (store_ptr_undef_store_ptr
        (&(a # "SysDoubleLinklistNode" ->ₛ "node_next")) an).
      sep_apply_l_atomic (store_ptr_undef_store_ptr
        (&(b # "SysDoubleLinklistNode" ->ₛ "node_next")) bn).
      unfold undef_store_ptr.
      Intros.
      prop_apply_p (store_4byte_valid
        (&(a # "SysDoubleLinklistNode" ->ₛ "node_next"))
        (&(b # "SysDoubleLinklistNode" ->ₛ "node_next"))).
      Intros_p Hsep.
      dump_pre_spatial.
      intro Hab; subst b; lia.
    }
    intros stop guard_next guard_prev start prev last node node_prev node_next before.
    revert start prev.
    induction before as [|expected before IH]; intros start prev after Hnonnull.
    - unfold XiziDLL.dllseg at 1; simpl.
      Intros.
      destruct H as [Hstart Hprev].
      subst start; subst node_prev.
      prop_apply (Hraw_node_sep node node_next stop guard_next).
      Intros.
      unfold XiziDLL.dllseg at 1; simpl.
      Exists node_next.
      entailer!.
      fold XiziDLL.links; fold XiziDLL.dllseg; entailer!.
    - unfold XiziDLL.dllseg at 1; simpl.
      Intros next; Intros; subst start.
      fold XiziDLL.dllseg.
      Exists next.
      split_pure_spatial.
      + rewrite <- derivable1_sepcon_assoc1.
        eapply derivable1_sepcon_mono.
        * apply derivable1_refl.
        * exact (IH next expected after Hnonnull).
      + unfold XiziDLL.links.
        sepcon_lift ((&(expected # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr |-> next).
        sepcon_lift ((&(stop # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr |-> guard_next).
        prop_apply (Hraw_node_sep stop guard_next expected next).
        Intros.
        entailer!.
  }
  pre_process.
  subst linklist_pre; subst linklist_node_pre.
  prop_apply (Hdifferent_stop node_next node head last nodes_after PreH1).
  Intros.
  assert (Hnonnull : node <> NULL) by (unfold NULL; lia).
  split_pure_spatial.
  - unfold xizi_dll, XiziDLL.dll.
    Exists first last.
    unfold xizi_dll_links, XiziDLL.links, xizi_dllseg.
    sepcon_lift (XiziDLL.dllseg first head head last
      (nodes_before ++ node :: nodes_after)).
    sep_apply_r_atomic (Hraw_recompose head first last first head last node
      node_prev node_next nodes_before nodes_after Hnonnull).
    entailer!.
  - entailer!.
Qed.
