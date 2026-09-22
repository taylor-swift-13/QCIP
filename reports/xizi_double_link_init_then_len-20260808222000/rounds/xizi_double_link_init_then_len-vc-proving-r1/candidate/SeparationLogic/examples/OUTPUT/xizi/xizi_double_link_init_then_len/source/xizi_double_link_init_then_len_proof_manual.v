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
  assert (Hraw_links_neq : forall p q p_next p_prev q_next q_prev,
    (&(p # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> p_next) **
    (&(p # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> p_prev) **
    xizi_dll_links q q_next q_prev |--
    “ p <> q ”).
  {
    intros.
    unfold xizi_dll_links, XiziDLL.links.
    sep_apply_l_atomic
      (store_ptr_undef_store_ptr
        (&(p # "SysDoubleLinklistNode" ->ₛ "node_next")) p_next).
    sep_apply_l_atomic
      (store_ptr_undef_store_ptr
        (&(q # "SysDoubleLinklistNode" ->ₛ "node_next")) q_next).
    unfold undef_store_ptr.
    Intros.
    Intros.
    prop_apply
      (store_4byte_valid
        (&(p # "SysDoubleLinklistNode" ->ₛ "node_next"))
        (&(q # "SysDoubleLinklistNode" ->ₛ "node_next"))).
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
  assert (Hdllseg_align4 : forall first prev stop last nodes,
    xizi_dllseg first prev stop last nodes |--
    store_align4_n (2 * Zlength nodes)).
  {
    intros first prev stop last nodes.
    revert first prev.
    induction nodes as [| expected nodes IH]; intros first prev.
    - simpl.
      unfold xizi_dllseg, XiziDLL.dllseg, store_align4_n.
      Intros.
      Exists nil.
      simpl.
      entailer!.
      constructor.
    - unfold xizi_dllseg, XiziDLL.dllseg at 1.
      simpl.
      Intros next.
      Intros.
      subst expected.
      fold (XiziDLL.dllseg next first stop last nodes).
      fold xizi_dllseg.
      unfold xizi_dll_links, XiziDLL.links.
      sep_apply
        (store_ptr_align4
          (&(first # "SysDoubleLinklistNode" ->ₛ "node_next")) next).
      sep_apply
        (store_ptr_align4
          (&(first # "SysDoubleLinklistNode" ->ₛ "node_prev")) prev).
      sep_apply (IH next first).
      sep_apply (store_align4_merge 1 1).
      replace (1 + 1) with 2 by lia.
      sep_apply (store_align4_merge 2 (2 * Zlength nodes)).
      replace (2 + 2 * Zlength nodes)
        with (2 * Zlength (first :: nodes)) by
        (rewrite Zlength_cons; lia).
      change
        (store_align4_n (2 * Zlength (first :: nodes)) |--
         store_align4_n (2 * Zlength (first :: nodes))).
      apply derivable1_refl.
  }
  assert (Hdllseg_length_max : forall first prev stop last nodes,
    xizi_dllseg first prev stop last nodes |--
    “ 2 * Zlength nodes <= Int.max_unsigned / 4 + 1 ”).
  {
    intros.
    sep_apply (Hdllseg_align4 first prev stop last nodes).
    prop_apply store_align4_n_valid.
    Intros.
    dump_pre_spatial.
    exact H.
  }
  pre_process.
  prop_apply
    (Hdllseg_length_max first_2 linklist_pre tmp_node prev_2 before_2).
  Intros.
  prop_apply_p
    (Hdllseg_nonnull next_2 tmp_node linklist_pre last_2 todo_2 PreH1).
  Intros.
  sep_apply_l_atomic
    (xizi_dllseg_unfold next_2 tmp_node linklist_pre last_2 todo_2 PreH1).
  Intros next rest.
  Intros.
  fold xizi_dll_links.
  prop_apply_p
    (Hraw_links_neq tmp_node next_2 next_2 prev_2 next tmp_node).
  Intros.
  Exists next tmp_node last_2 first_2 done_2
    (done_2 ++ next_2 :: nil) rest.
  entailer!.
  - rewrite PreH6.
    fold xizi_dll_links.
    sep_apply_r_atomic
      (Hdllseg_advance first_2 linklist_pre tmp_node prev_2 before_2
        next_2 next PreH7).
    entailer!.
  - rewrite H1 in PreH5.
    rewrite !Zlength_app, !Zlength_cons, !Zlength_nil in *.
    change
      (Zlength nodes_general = Zlength done_2 + (Zlength rest + 1))
      in PreH5.
    change
      (Zlength nodes_general = Zlength done_2 + 1 + Zlength rest).
    lia.
  - rewrite Zlength_app, Zlength_cons, Zlength_nil.
    assert (Hrange : 0 <= linklist_length + 1 < 2 ^ 32).
    {
      rewrite PreH4, PreH6, Zlength_app, Zlength_cons, Zlength_nil.
      pose proof (Zlength_nonneg before_2).
      assert (Hmax : Int.max_unsigned = 4294967295) by reflexivity.
      assert (Hpow : 2 ^ 32 = 4294967296) by reflexivity.
      rewrite Hmax in H.
      rewrite Hpow.
      change (2 * Zlength before_2 <= 1073741824) in H.
      change (0 <= Zlength before_2 + 1 + 1 < 4294967296).
      lia.
    }
    rewrite (unsigned_last_nbits_eq (linklist_length + 1) 32 Hrange).
    rewrite PreH4.
    simpl.
    reflexivity.
  - rewrite PreH2, PreH6, H1.
    simpl.
    exact
      (List.app_assoc (before_2 ++ tmp_node :: nil) (next_2 :: nil) rest).
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
      (logic_equiv_sepcon_comm
        (xizi_dll_links linklist_pre first tmp_node)
        (xizi_dllseg first linklist_pre linklist_pre tmp_node
          (before ++ tmp_node :: nil))).
    sep_apply_r_atomic
      (Hdllseg_advance first linklist_pre tmp_node prev before
        linklist_pre first PreH7).
    entailer!.
    Unshelve.
    unfold xizi_dll_links, XiziDLL.links.
    entailer!.
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
  pre_process.
Qed.

Lemma proof_of_xizi_double_link_len_derive_nil_case_by_general : xizi_double_link_len_derive_nil_case_by_general.
Proof.
  pre_process.
  Exists (@nil Z).
  apply derivable1s_emp_l_unfold.
  apply derivable1_wand_sepcon_adjoint.
  Intros retval_2.
  Exists 0.
  entailer!.
Qed.
