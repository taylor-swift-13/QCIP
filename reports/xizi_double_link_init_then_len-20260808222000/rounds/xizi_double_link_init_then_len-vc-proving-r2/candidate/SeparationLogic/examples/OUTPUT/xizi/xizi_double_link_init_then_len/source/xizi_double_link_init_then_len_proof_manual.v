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
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_init_then_len.source Require Import xizi_double_link_init_then_len_goal.
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_init_then_len.source Require Import xizi_double_link_init_then_len_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
From QCIPLib.xizi.xizi_double_link_common Require Import xizi_double_link_lib.
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_init_then_len.source Require Import xizi_double_link_init_then_len_lib.
Local Open Scope sac.

Lemma proof_of_xizi_double_link_len_entail_wit_1 : xizi_double_link_len_entail_wit_1.
Proof.
  aggressive_pre_process.
  Exists nodes_general.
  entailer!.
Qed.

Lemma proof_of_xizi_double_link_len_entail_wit_2_1 : xizi_double_link_len_entail_wit_2_1.
Proof.
  assert (Hlinks_neq : forall p q p_next p_prev q_next q_prev,
    xizi_dll_links p p_next p_prev ** xizi_dll_links q q_next q_prev |--
    “ p <> q ”).
  {
    intros.
    unfold xizi_dll_links, XiziDLL.links.
    sep_apply_l_atomic
      (store_ptr_undef_store_ptr
        (&(p # XiziDoubleLinkLayout.struct_name ->ₛ
             XiziDoubleLinkLayout.next_field)) p_next).
    sep_apply_l_atomic
      (store_ptr_undef_store_ptr
        (&(q # XiziDoubleLinkLayout.struct_name ->ₛ
             XiziDoubleLinkLayout.next_field)) q_next).
    unfold undef_store_ptr.
    Intros.
    Intros.
    prop_apply
      (store_4byte_valid
        (&(p # XiziDoubleLinkLayout.struct_name ->ₛ
             XiziDoubleLinkLayout.next_field))
        (&(q # XiziDoubleLinkLayout.struct_name ->ₛ
             XiziDoubleLinkLayout.next_field))).
    Intros.
    dump_pre_spatial.
    intro Heq.
    subst q.
    lia.
  }
  assert (Hdllseg_nonnull : forall node prev stop last nodes,
    node <> stop ->
    xizi_dllseg node prev stop last nodes |-- “ node <> NULL ”).
  {
    intros node prev stop last nodes Hneq.
    destruct nodes as [| expected rest].
    - unfold xizi_dllseg, XiziDLL.dllseg.
      simpl.
      Intros.
      destruct H as [Hsame _].
      contradiction.
    - unfold xizi_dllseg, XiziDLL.dllseg.
      simpl.
      Intros next.
      Intros.
      entailer!.
  }
  assert (Hdllseg_advance : forall first prev middle middle_prev before next after,
    middle <> NULL ->
    xizi_dllseg first prev middle middle_prev before **
    xizi_dll_links middle next middle_prev **
    xizi_dll_links next after middle |--
    xizi_dllseg first prev next middle (before ++ middle :: nil) **
    xizi_dll_links next after middle).
  {
    intros first prev middle middle_prev before.
    revert first prev.
    induction before as [| expected before IH];
      intros first prev next after Hmiddle.
    - simpl.
      Intros.
      destruct H as [Hfirst Hprev].
      subst first prev.
      prop_apply (Hlinks_neq middle next next middle_prev after middle).
      Intros.
      simpl.
      Exists next.
      unfold xizi_dll_links, XiziDLL.links.
      entailer!.
    - simpl.
      Intros first_next.
      Intros.
      subst expected.
      fold xizi_dll_links.
      prop_apply (Hlinks_neq first next first_next prev after middle).
      Intros.
      simpl.
      Exists first_next.
      sep_apply (IH first_next first next after Hmiddle).
      unfold xizi_dll_links.
      entailer!.
  }
  assert (Hdllseg_align4 : forall first prev stop last nodes,
    xizi_dllseg first prev stop last nodes |--
    store_align4_n (2 * Zlength nodes)).
  {
    intros first prev stop last nodes.
    revert first prev.
    induction nodes as [| expected rest IH]; intros first prev.
    - unfold xizi_dllseg, XiziDLL.dllseg.
      simpl.
      Intros.
      unfold store_align4_n.
      Exists nil.
      simpl.
      entailer!.
      constructor.
    - unfold xizi_dllseg, XiziDLL.dllseg at 1.
      simpl.
      Intros next.
      Intros.
      subst expected.
      change
        (&(first # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> next **
         &(first # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> prev **
         xizi_dllseg next first stop last rest |--
         store_align4_n (2 * Zlength (first :: rest))).
      sep_apply
        (store_ptr_align4
          (&(first # "SysDoubleLinklistNode" ->ₛ "node_next")) next).
      sep_apply
        (store_ptr_align4
          (&(first # "SysDoubleLinklistNode" ->ₛ "node_prev")) prev).
      sep_apply (store_align4_merge 1 1).
      sep_apply (IH next first).
      sep_apply (store_align4_merge (2 * Zlength rest) (1 + 1)).
      replace (2 * Zlength rest + (1 + 1)) with
        (2 * Zlength (first :: rest)) by
        (rewrite Zlength_cons; lia).
      cancel (store_align4_n (2 * Zlength (first :: rest))).
  }
  assert (Hdllseg_length_bound :
    forall first prev middle middle_prev before next,
    xizi_dllseg first prev middle middle_prev before **
    &(middle # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> next **
    &(middle # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> middle_prev |--
    “ Zlength before + 2 < 2 ^ 32 ”).
  {
    intros.
    sep_apply (Hdllseg_align4 first prev middle middle_prev before).
    sep_apply
      (store_ptr_align4
        (&(middle # "SysDoubleLinklistNode" ->ₛ "node_next")) next).
    sep_apply
      (store_ptr_align4
        (&(middle # "SysDoubleLinklistNode" ->ₛ "node_prev")) middle_prev).
    sep_apply (store_align4_merge (2 * Zlength before) 1).
    sep_apply (store_align4_merge (2 * Zlength before + 1) 1).
    prop_apply
      (store_align4_n_valid
        (2 * Zlength before + 1 + 1)).
    Intros.
    dump_pre_spatial.
    replace Int.max_unsigned with 4294967295 in H by reflexivity.
    replace (4294967295 / 4 + 1) with 1073741824 in H by reflexivity.
    replace (2 ^ 32) with 4294967296 by reflexivity.
    lia.
  }
  pre_process.
  prop_apply
    (Hdllseg_nonnull next_2 tmp_node linklist_pre last_2 todo_2 PreH1).
  Intros.
  sep_apply_l_atomic
    (xizi_dllseg_unfold next_2 tmp_node linklist_pre last_2 todo_2 PreH1).
  Intros next rest.
  Intros.
  subst todo_2.
  prop_apply
    (Hdllseg_length_bound first_2 linklist_pre tmp_node prev_2 before_2
      next_2).
  Intros.
  Exists next tmp_node last_2 first_2
    (before_2 ++ tmp_node :: nil)
    ((before_2 ++ tmp_node :: nil) ++ next_2 :: nil)
    rest.
  entailer!.
  - rewrite
      (logic_equiv_sepcon_assoc
        (&(tmp_node # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> next_2)
        (&(tmp_node # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> prev_2)
        (xizi_dll_links next_2 next tmp_node)).
    rewrite
      (logic_equiv_sepcon_assoc
        (xizi_dllseg first_2 linklist_pre tmp_node prev_2 before_2)
        (&(tmp_node # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> next_2 **
         &(tmp_node # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> prev_2)
        (xizi_dll_links next_2 next tmp_node)).
    change
      (xizi_dllseg first_2 linklist_pre tmp_node prev_2 before_2 **
       xizi_dll_links tmp_node next_2 prev_2 **
       xizi_dll_links next_2 next tmp_node |--
       xizi_dllseg first_2 linklist_pre next_2 tmp_node
         (before_2 ++ tmp_node :: nil) **
       xizi_dll_links next_2 next tmp_node).
    apply
      (Hdllseg_advance first_2 linklist_pre tmp_node prev_2 before_2
        next_2 next PreH7).
  - rewrite PreH2, PreH6.
    rewrite <- Zlength_app.
    f_equal.
    exact
      (List.app_assoc (before_2 ++ tmp_node :: nil)
        (next_2 :: nil) rest).
  - rewrite unsigned_last_nbits_eq.
    + rewrite PreH4, PreH6.
      repeat rewrite Zlength_app.
      repeat rewrite Zlength_cons.
      rewrite Zlength_nil.
      unfold Z.succ.
      ring.
    + split.
      * rewrite PreH4, PreH6.
        repeat rewrite Zlength_app.
        repeat rewrite Zlength_cons.
        rewrite Zlength_nil.
        unfold Z.succ.
        pose proof (Zlength_nonneg before_2).
        lia.
      * rewrite PreH4, PreH6.
        repeat rewrite Zlength_app.
        repeat rewrite Zlength_cons.
        rewrite Zlength_nil.
        unfold Z.succ.
        replace (Zlength before_2 + (0 + 1) + 1) with
          (Zlength before_2 + 2) by ring.
        exact H0.
  - rewrite PreH2, PreH6.
    exact
      (List.app_assoc (before_2 ++ tmp_node :: nil)
        (next_2 :: nil) rest).
Qed.

Lemma proof_of_xizi_double_link_len_entail_wit_2_2 : xizi_double_link_len_entail_wit_2_2.
Proof.
  assert (Hdllseg_nonnull : forall node prev stop last nodes,
    node <> stop ->
    xizi_dllseg node prev stop last nodes |-- “ node <> NULL ”).
  {
    intros node prev stop last nodes Hneq.
    destruct nodes as [| expected rest].
    - unfold xizi_dllseg, XiziDLL.dllseg.
      simpl.
      Intros.
      destruct H as [Hsame _].
      contradiction.
    - unfold xizi_dllseg, XiziDLL.dllseg.
      simpl.
      Intros next.
      Intros.
      entailer!.
  }
  left.
  pre_process.
  prop_apply_p
    (Hdllseg_nonnull first_2 linklist_pre linklist_pre last_2 todo_2
      PreH1).
  Intros.
  sep_apply_l_atomic
    (xizi_dllseg_unfold first_2 linklist_pre linklist_pre last_2 todo_2
      PreH1).
  Intros next rest.
  Intros.
  subst tmp_node.
  subst done_2.
  subst todo_2.
  subst nodes_general.
  subst linklist_length.
  Exists next linklist_pre last_2 first_2 (@nil Z)
    (first_2 :: nil) rest.
  entailer!.
  all: try (rewrite unsigned_last_nbits_eq by lia).
  all: simpl in *.
  all: try lia.
  all: try reflexivity.
  Unshelve.
  - unfold xizi_dll_links, XiziDLL.links.
    unfold xizi_dllseg, XiziDLL.dllseg.
    simpl.
    entailer!.
  - rewrite Zlength_cons.
    change (Z.succ (Zlength rest) = 1 + Zlength rest).
    rewrite Z.add_1_l.
    reflexivity.
Qed.

Lemma proof_of_xizi_double_link_len_return_wit_1 : xizi_double_link_len_return_wit_1.
Proof.
  assert (Hdllseg_stop : forall stop prev last nodes,
    xizi_dllseg stop prev stop last nodes |--
    “ nodes = nil /\ prev = last ” && emp).
  {
    intros stop prev last nodes.
    destruct nodes as [| expected rest].
    - unfold xizi_dllseg, XiziDLL.dllseg.
      simpl.
      Intros.
      destruct H as [_ Hprev].
      subst last.
      entailer!.
    - unfold xizi_dllseg, XiziDLL.dllseg.
      simpl.
      Intros next.
      Intros.
      contradiction.
  }
  assert (Hlinks_neq : forall p q p_next p_prev q_next q_prev,
    xizi_dll_links p p_next p_prev ** xizi_dll_links q q_next q_prev |--
    “ p <> q ”).
  {
    intros.
    unfold xizi_dll_links, XiziDLL.links.
    sep_apply_l_atomic
      (store_ptr_undef_store_ptr
        (&(p # XiziDoubleLinkLayout.struct_name ->ₛ
             XiziDoubleLinkLayout.next_field)) p_next).
    sep_apply_l_atomic
      (store_ptr_undef_store_ptr
        (&(q # XiziDoubleLinkLayout.struct_name ->ₛ
             XiziDoubleLinkLayout.next_field)) q_next).
    unfold undef_store_ptr.
    Intros.
    Intros.
    prop_apply
      (store_4byte_valid
        (&(p # XiziDoubleLinkLayout.struct_name ->ₛ
             XiziDoubleLinkLayout.next_field))
        (&(q # XiziDoubleLinkLayout.struct_name ->ₛ
             XiziDoubleLinkLayout.next_field))).
    Intros.
    dump_pre_spatial.
    intro Heq.
    subst q.
    lia.
  }
  assert (Hdllseg_advance : forall first prev middle middle_prev before next after,
    middle <> NULL ->
    xizi_dllseg first prev middle middle_prev before **
    xizi_dll_links middle next middle_prev **
    xizi_dll_links next after middle |--
    xizi_dllseg first prev next middle (before ++ middle :: nil) **
    xizi_dll_links next after middle).
  {
    intros first prev middle middle_prev before.
    revert first prev.
    induction before as [| expected before IH];
      intros first prev next after Hmiddle.
    - simpl.
      Intros.
      destruct H as [Hfirst Hprev].
      subst first prev.
      prop_apply (Hlinks_neq middle next next middle_prev after middle).
      Intros.
      simpl.
      Exists next.
      unfold xizi_dll_links, XiziDLL.links.
      entailer!.
    - simpl.
      Intros first_next.
      Intros.
      subst expected.
      fold xizi_dll_links.
      prop_apply (Hlinks_neq first next first_next prev after middle).
      Intros.
      simpl.
      Exists first_next.
      sep_apply (IH first_next first next after Hmiddle).
      unfold xizi_dll_links.
      entailer!.
  }
  left.
  pre_process.
  subst next.
  sep_apply_l_atomic
    (Hdllseg_stop linklist_pre tmp_node last todo).
  Intros.
  destruct H as [Htodo Hlast].
  subst todo last.
  fold xizi_dll_links.
  unfold xizi_dll, XiziDLL.dll.
  Exists first tmp_node.
  entailer!.
  - fold xizi_dll_links.
    fold xizi_dllseg.
    rewrite PreH2, PreH6.
    simpl.
    rewrite app_nil_r.
    rewrite
      (logic_equiv_sepcon_assoc
        (&(linklist_pre # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> first)
        (&(linklist_pre # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> tmp_node)
        (xizi_dllseg first linklist_pre tmp_node prev before **
         (&(tmp_node # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> linklist_pre **
          &(tmp_node # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> prev))).
    change
      (xizi_dll_links linklist_pre first tmp_node **
       (xizi_dllseg first linklist_pre tmp_node prev before **
        xizi_dll_links tmp_node linklist_pre prev) |--
       xizi_dll_links linklist_pre first tmp_node **
       xizi_dllseg first linklist_pre linklist_pre tmp_node
         (before ++ tmp_node :: nil)).
    assert (Hreorder :
      xizi_dll_links linklist_pre first tmp_node **
      (xizi_dllseg first linklist_pre tmp_node prev before **
       xizi_dll_links tmp_node linklist_pre prev) |--
      (xizi_dllseg first linklist_pre tmp_node prev before **
       xizi_dll_links tmp_node linklist_pre prev) **
      xizi_dll_links linklist_pre first tmp_node).
    {
      apply derivable1_sepcon_comm.
    }
    rewrite Hreorder.
    rewrite
      (Hdllseg_advance first linklist_pre tmp_node prev before
        linklist_pre first PreH7).
    apply derivable1_sepcon_comm.
  - rewrite PreH2, PreH4.
    rewrite app_nil_r.
    reflexivity.
Qed.

Lemma proof_of_xizi_double_link_len_return_wit_2 : xizi_double_link_len_return_wit_2.
Proof.
  right.
  assert (Hdllseg_stop : forall stop prev last nodes,
    xizi_dllseg stop prev stop last nodes |--
    “ nodes = nil /\ prev = last ” && emp).
  {
    intros stop prev last nodes.
    destruct nodes as [| expected rest].
    - unfold xizi_dllseg, XiziDLL.dllseg.
      simpl.
      Intros.
      destruct H as [_ Hprev].
      subst last.
      entailer!.
    - unfold xizi_dllseg, XiziDLL.dllseg.
      simpl.
      Intros next.
      Intros.
      contradiction.
  }
  pre_process.
  subst first tmp_node done.
  sep_apply_l_atomic
    (Hdllseg_stop linklist_pre linklist_pre last todo).
  Intros.
  destruct H as [Htodo Hlast].
  subst todo last.
  subst nodes_general linklist_length.
  Exists linklist_pre.
  unfold xizi_dllseg, XiziDLL.dllseg.
  simpl.
  entailer!.
Qed.

Lemma proof_of_xizi_double_link_init_then_len_return_wit_1 : xizi_double_link_init_then_len_return_wit_1.
Proof.
  aggressive_pre_process.
Qed.

Lemma proof_of_xizi_double_link_len_derive_nil_case_by_general : xizi_double_link_len_derive_nil_case_by_general.
Proof.
  pre_process.
  Exists (@nil Z).
  entailer!.
  rewrite <- sepcon_emp_equiv at 1.
  apply derivable1_sepcon_mono.
  - entailer!.
  - rewrite <- derivable1_wand_sepcon_adjoint.
    entailer!.
Qed.
