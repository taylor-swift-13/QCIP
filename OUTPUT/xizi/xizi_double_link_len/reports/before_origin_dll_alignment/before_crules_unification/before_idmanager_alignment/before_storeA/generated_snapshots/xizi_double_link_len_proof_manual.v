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
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_len.source Require Import xizi_double_link_len_goal.
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_len.source Require Import xizi_double_link_len_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
From QCIPLib.xizi.xizi_double_link_common Require Import xizi_double_link_lib.
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_len.source Require Import xizi_double_link_len_lib.
Local Open Scope sac.

Lemma proof_of_xizi_double_link_len_entail_wit_1 : xizi_double_link_len_entail_wit_1.
Proof.
  pre_process.
  unfold xizi_dll, XiziDLL.dll.
  Intros first last.
  Intros.
  Exists last first (@nil Z) nodes.
  unfold XiziDLL.links.
  entailer!.
Qed.

Lemma proof_of_xizi_double_link_len_entail_wit_2_1 : xizi_double_link_len_entail_wit_2_1.
Proof.
  assert (xizi_dll_links_align4__dll_len_invariant_cycle :
    forall node next prev,
      xizi_dll_links node next prev |-- store_align4_n 2).
  {
    intros.
    unfold xizi_dll_links, XiziDLL.links.
    sep_apply store_ptr_align4.
    sep_apply store_ptr_align4.
    sep_apply (store_align4_merge 1 1).
    replace (1 + 1) with 2 by lia.
    entailer!.
  }
  assert (xizi_dllseg_align4__dll_len_invariant_cycle :
    forall node prev stop last nodes,
      xizi_dllseg node prev stop last nodes |--
      store_align4_n (2 * Zlength nodes)).
  {
    intros node prev stop last nodes0.
    generalize dependent node.
    generalize dependent prev.
    induction nodes0 as [| expected rest IH]; intros.
    - unfold xizi_dllseg, XiziDLL.dllseg.
      simpl.
      Intros.
      unfold store_align4_n.
      Exists (@nil Z).
      entailer!.
      constructor.
    - unfold xizi_dllseg, XiziDLL.dllseg.
      simpl.
      Intros next0.
      Intros.
      sep_apply xizi_dll_links_align4__dll_len_invariant_cycle.
      sep_apply IH.
      sep_apply (store_align4_merge 2 (2 * Zlength rest)).
      rewrite Zlength_cons.
      replace (2 + 2 * Zlength rest) with
        (2 * (Zlength rest + 1)) by lia.
      entailer!.
  }
  assert (xizi_dllseg_unfold_full__dll_len_invariant_cycle :
    forall node prev stop last nodes0,
      node <> stop ->
      xizi_dllseg node prev stop last nodes0 |--
      EX next0 rest,
        “ nodes0 = node :: rest ” &&
        “ node <> 0 ” &&
        xizi_dll_links node next0 prev **
        xizi_dllseg next0 node stop last rest).
  {
    intros node prev stop last nodes0 Hneq.
    destruct nodes0 as [| expected rest].
    - unfold xizi_dllseg, XiziDLL.dllseg.
      simpl.
      Intros.
      destruct H as [Hsame _].
      contradiction.
    - unfold xizi_dllseg, XiziDLL.dllseg.
      simpl.
      Intros next0.
      Intros.
      subst expected.
      Exists next0 rest.
      entailer!.
  }
  assert (xizi_dll_links_neq__dll_len_invariant_cycle :
    forall a a_next a_prev b b_next b_prev,
      xizi_dll_links a a_next a_prev **
      xizi_dll_links b b_next b_prev |-- “ a <> b ”).
  {
    intros.
    destruct (Z.eq_dec a b) as [Heq | Hneq].
    - subst b.
      unfold xizi_dll_links, XiziDLL.links.
      sepcon_lift
        (&(a # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> b_next).
      sep_apply_l_atomic
        (dup_store_ptr
          (&(a # "SysDoubleLinklistNode" ->ₛ "node_next"))
          b_next a_next).
      entailer!.
    - entailer!.
  }
  assert (xizi_dll_links_fold__dll_len_invariant_cycle :
    forall node next0 prev,
      (&(node # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> next0) **
      (&(node # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> prev) |--
      xizi_dll_links node next0 prev).
  {
    intros.
    unfold xizi_dll_links, XiziDLL.links.
    entailer!.
  }
  assert (xizi_dllseg_snoc__dll_len_invariant_cycle :
    forall node prev middle middle_prev next0 next_after nodes0,
      middle <> 0 ->
      xizi_dllseg node prev middle middle_prev nodes0 **
      xizi_dll_links middle next0 middle_prev **
      xizi_dll_links next0 next_after middle |--
      xizi_dllseg node prev next0 middle (nodes0 ++ middle :: nil) **
      xizi_dll_links next0 next_after middle).
  {
    intros node prev middle middle_prev next0 next_after nodes0 Hnonzero.
    generalize dependent node.
    generalize dependent prev.
    induction nodes0 as [| expected rest IH]; intros.
    - unfold xizi_dllseg, XiziDLL.dllseg.
      simpl.
      Intros.
      destruct H as [Hnode Hprev].
      subst node; subst prev.
      destruct (Z.eq_dec middle next0) as [Heq | Hneq].
      + subst next0.
        sep_apply_l_atomic
          (xizi_dll_links_neq__dll_len_invariant_cycle
            middle middle middle_prev middle next_after middle).
        entailer!.
      + Exists next0.
        entailer!.
    - change
        ((“ node = expected ” && “ node <> NULL ” && “ node <> middle ” &&
          (EX next1 : addr,
            xizi_dll_links node next1 prev **
            xizi_dllseg next1 node middle middle_prev rest)) **
         xizi_dll_links middle next0 middle_prev **
         xizi_dll_links next0 next_after middle |--
         (“ node = expected ” && “ node <> NULL ” && “ node <> next0 ” &&
          (EX next1 : addr,
            xizi_dll_links node next1 prev **
            xizi_dllseg next1 node next0 middle (rest ++ middle :: nil))) **
         xizi_dll_links next0 next_after middle).
      Intros next1.
      Intros.
      destruct (Z.eq_dec node next0) as [Heqnode | Hnode].
      + subst next0.
        unfold xizi_dll_links, XiziDLL.links.
        sepcon_lift
          (&(node # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> next_after).
        sep_apply_l_atomic
          (dup_store_ptr
            (&(node # "SysDoubleLinklistNode" ->ₛ "node_next"))
            next_after next1).
        entailer!.
      + sep_apply_l_atomic (IH node next1).
        Exists next1.
        entailer!.
  }
  assert (xizi_dllseg_two_links_uint_bound__dll_len_invariant_cycle :
    forall node prev middle middle_prev next0 next_after nodes0,
      xizi_dllseg node prev middle middle_prev nodes0 **
      xizi_dll_links middle next0 middle_prev **
      xizi_dll_links next0 next_after middle |--
      “ Zlength nodes0 + 2 < 2 ^ 32 ”).
  {
    intros.
    sep_apply xizi_dllseg_align4__dll_len_invariant_cycle.
    sep_apply xizi_dll_links_align4__dll_len_invariant_cycle.
    sep_apply xizi_dll_links_align4__dll_len_invariant_cycle.
    sep_apply (store_align4_merge (2 * Zlength nodes0) 2).
    sep_apply (store_align4_merge (2 * Zlength nodes0 + 2) 2).
    prop_apply store_align4_n_valid.
    Intros.
    replace Int.max_unsigned with 4294967295 in H by reflexivity.
    replace (4294967295 / 4) with 1073741823 in H by reflexivity.
    replace (2 ^ 32) with 4294967296 by reflexivity.
    entailer!.
  }
  assert (xizi_dllseg_advance__dll_len_invariant_cycle :
    forall node prev middle middle_prev next0 next_after nodes0,
      middle <> 0 ->
      xizi_dllseg node prev middle middle_prev nodes0 **
      xizi_dll_links middle next0 middle_prev **
      xizi_dll_links next0 next_after middle |--
      “ Zlength nodes0 + 2 < 2 ^ 32 ” &&
      xizi_dllseg node prev next0 middle (nodes0 ++ middle :: nil) **
      xizi_dll_links next0 next_after middle).
  {
    intros.
    prop_apply_p
      (xizi_dllseg_two_links_uint_bound__dll_len_invariant_cycle
        node prev middle middle_prev next0 next_after nodes0).
    Intros.
    sep_apply_l_atomic
      (xizi_dllseg_snoc__dll_len_invariant_cycle
        node prev middle middle_prev next0 next_after nodes0 H).
    entailer!.
  }
  pre_process.
  sep_apply_l_atomic
    (xizi_dllseg_unfold_full__dll_len_invariant_cycle
      next_2 tmp_node linklist_pre last_2 todo_2 PreH1).
  Intros next3 rest.
  Intros.
  sep_apply_l_atomic
    (xizi_dll_links_fold__dll_len_invariant_cycle
      tmp_node next_2 prev_2).
  sep_apply_l_atomic
    (xizi_dllseg_advance__dll_len_invariant_cycle
      first_2 linklist_pre tmp_node prev_2 next_2 next3 before_2 PreH7).
    Intros.
    Exists next3 tmp_node last_2 first_2
      ((before_2 ++ tmp_node :: nil)%list)
      ((done_2 ++ next_2 :: nil)%list) rest.
    rewrite unsigned_last_nbits_eq.
    + entailer!.
      * rewrite PreH6.
        reflexivity.
      * rewrite H in PreH5.
        rewrite Zlength_cons in PreH5.
        rewrite Zlength_app, Zlength_cons, Zlength_nil.
        unfold Z.succ in PreH5 |-.
        change (Zlength nodes = Zlength done_2 + 1 + Zlength rest).
        lia.
      * rewrite Zlength_app, Zlength_cons, Zlength_nil.
        lia.
      * rewrite PreH2, H.
        rewrite <- app_assoc.
        reflexivity.
    + split.
      * pose proof (Zlength_nonneg done_2).
        lia.
      * rewrite PreH4, PreH6, Zlength_app, Zlength_cons, Zlength_nil.
        unfold Z.succ.
        replace (0 + 1)%Z with 1 by reflexivity.
        replace (Zlength before_2 + 1 + 1)%Z
          with (Zlength before_2 + 2)%Z by lia.
        exact H1.
Qed.

Lemma proof_of_xizi_double_link_len_entail_wit_2_2 : xizi_double_link_len_entail_wit_2_2.
Proof.
  assert (xizi_dllseg_unfold_full__dll_len_invariant_cycle :
    forall node prev stop last nodes0,
      node <> stop ->
      xizi_dllseg node prev stop last nodes0 |--
      EX next0 rest,
        “ nodes0 = node :: rest ” &&
        “ node <> 0 ” &&
        xizi_dll_links node next0 prev **
        xizi_dllseg next0 node stop last rest).
  {
    intros node prev stop last nodes0 Hneq.
    destruct nodes0 as [| expected rest].
    - unfold xizi_dllseg, XiziDLL.dllseg.
      simpl.
      Intros.
      destruct H as [Hsame _].
      contradiction.
    - unfold xizi_dllseg, XiziDLL.dllseg.
      simpl.
      Intros next0.
      Intros.
      subst expected.
      Exists next0 rest.
      entailer!.
  }
  pre_process.
  sep_apply_l_atomic
    (xizi_dllseg_unfold_full__dll_len_invariant_cycle
      first_2 linklist_pre linklist_pre last_2 todo_2 PreH1).
  Intros next2 rest.
  Intros.
  subst tmp_node.
  Exists next2 linklist_pre last_2 first_2
    (@nil Z) (first_2 :: nil)%list rest.
  rewrite unsigned_last_nbits_eq.
  - unfold xizi_dllseg, XiziDLL.dllseg at 2.
    simpl.
    entailer!.
    + rewrite H in PreH5.
      rewrite Zlength_cons in PreH5.
      unfold Z.succ in PreH5 |-.
      rewrite PreH6, Zlength_nil in PreH5.
      change (Zlength nodes = 1 + Zlength rest).
      lia.
    + rewrite PreH4, PreH6, Zlength_nil, Zlength_cons, Zlength_nil.
      unfold Z.succ.
      reflexivity.
    + rewrite PreH2, PreH6, H.
      reflexivity.
  - rewrite PreH4, PreH6, Zlength_nil.
    split; lia.
Qed.

Lemma proof_of_xizi_double_link_len_return_wit_1 : xizi_double_link_len_return_wit_1.
Proof.
  assert (xizi_dll_links_neq__dll_len_invariant_cycle :
    forall a a_next a_prev b b_next b_prev,
      xizi_dll_links a a_next a_prev **
      xizi_dll_links b b_next b_prev |-- “ a <> b ”).
  {
    intros.
    destruct (Z.eq_dec a b) as [Heq | Hneq].
    - subst b.
      unfold xizi_dll_links, XiziDLL.links.
      sepcon_lift
        (&(a # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> b_next).
      sep_apply_l_atomic
        (dup_store_ptr
          (&(a # "SysDoubleLinklistNode" ->ₛ "node_next"))
          b_next a_next).
      entailer!.
    - entailer!.
  }
  assert (xizi_dll_links_fold__dll_len_invariant_cycle :
    forall node next0 prev,
      (&(node # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> next0) **
      (&(node # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> prev) |--
      xizi_dll_links node next0 prev).
  {
    intros.
    unfold xizi_dll_links, XiziDLL.links.
    entailer!.
  }
  assert (xizi_dllseg_snoc__dll_len_invariant_cycle :
    forall node prev middle middle_prev next0 next_after nodes0,
      middle <> 0 ->
      xizi_dllseg node prev middle middle_prev nodes0 **
      xizi_dll_links middle next0 middle_prev **
      xizi_dll_links next0 next_after middle |--
      xizi_dllseg node prev next0 middle (nodes0 ++ middle :: nil) **
      xizi_dll_links next0 next_after middle).
  {
    intros node prev middle middle_prev next0 next_after nodes0 Hnonzero.
    generalize dependent node.
    generalize dependent prev.
    induction nodes0 as [| expected rest IH]; intros.
    - unfold xizi_dllseg, XiziDLL.dllseg.
      simpl.
      Intros.
      destruct H as [Hnode Hprev].
      subst node; subst prev.
      destruct (Z.eq_dec middle next0) as [Heq | Hneq].
      + subst next0.
        sep_apply_l_atomic
          (xizi_dll_links_neq__dll_len_invariant_cycle
            middle middle middle_prev middle next_after middle).
        entailer!.
      + Exists next0.
        entailer!.
    - change
        ((“ node = expected ” && “ node <> NULL ” && “ node <> middle ” &&
          (EX next1 : addr,
            xizi_dll_links node next1 prev **
            xizi_dllseg next1 node middle middle_prev rest)) **
         xizi_dll_links middle next0 middle_prev **
         xizi_dll_links next0 next_after middle |--
         (“ node = expected ” && “ node <> NULL ” && “ node <> next0 ” &&
          (EX next1 : addr,
            xizi_dll_links node next1 prev **
            xizi_dllseg next1 node next0 middle (rest ++ middle :: nil))) **
         xizi_dll_links next0 next_after middle).
      Intros next1.
      Intros.
      destruct (Z.eq_dec node next0) as [Heqnode | Hnode].
      + subst next0.
        unfold xizi_dll_links, XiziDLL.links.
        sepcon_lift
          (&(node # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> next_after).
        sep_apply_l_atomic
          (dup_store_ptr
            (&(node # "SysDoubleLinklistNode" ->ₛ "node_next"))
            next_after next1).
        entailer!.
      + sep_apply_l_atomic (IH node next1).
        Exists next1.
        entailer!.
  }
  assert (xizi_dllseg_stop__dll_len_invariant_cycle :
    forall stop prev last nodes0,
      xizi_dllseg stop prev stop last nodes0 |--
      “ nodes0 = nil ” && “ prev = last ” && emp).
  {
    intros stop prev last nodes0.
    destruct nodes0 as [| expected rest].
    - unfold xizi_dllseg, XiziDLL.dllseg.
      simpl.
      Intros.
      entailer!.
    - unfold xizi_dllseg, XiziDLL.dllseg.
      simpl.
      Intros.
      Intros next0.
      Intros.
      contradiction.
  }
  pre_process.
  subst next.
  sep_apply_l_atomic
    (xizi_dllseg_stop__dll_len_invariant_cycle
      linklist_pre tmp_node last todo).
  Intros.
  subst todo.
  subst last.
  subst done.
  rewrite app_nil_r in PreH2.
  subst nodes.
  sep_apply_l_atomic
    (xizi_dll_links_fold__dll_len_invariant_cycle
      tmp_node linklist_pre prev).
  sep_apply_l_atomic
    (xizi_dll_links_fold__dll_len_invariant_cycle
      linklist_pre first tmp_node).
  sep_apply_l_atomic
    (xizi_dllseg_snoc__dll_len_invariant_cycle
      first linklist_pre tmp_node prev linklist_pre first before PreH7).
  sep_apply_l_atomic
    (xizi_dll_close
      linklist_pre first tmp_node (before ++ tmp_node :: nil) PreH3).
  entailer!.
Qed.

Lemma proof_of_xizi_double_link_len_return_wit_2 : xizi_double_link_len_return_wit_2.
Proof.
  assert (xizi_dll_links_fold__dll_len_invariant_cycle :
    forall node next0 prev,
      (&(node # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> next0) **
      (&(node # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> prev) |--
      xizi_dll_links node next0 prev).
  {
    intros.
    unfold xizi_dll_links, XiziDLL.links.
    entailer!.
  }
  assert (xizi_dllseg_stop__dll_len_invariant_cycle :
    forall stop prev last nodes0,
      xizi_dllseg stop prev stop last nodes0 |--
      “ nodes0 = nil ” && “ prev = last ” && emp).
  {
    intros stop prev last nodes0.
    destruct nodes0 as [| expected rest].
    - unfold xizi_dllseg, XiziDLL.dllseg.
      simpl.
      Intros.
      entailer!.
    - unfold xizi_dllseg, XiziDLL.dllseg.
      simpl.
      Intros.
      Intros next0.
      Intros.
      contradiction.
  }
  pre_process.
  subst first.
  subst tmp_node.
  sep_apply_l_atomic
    (xizi_dllseg_stop__dll_len_invariant_cycle
      linklist_pre linklist_pre last todo).
  Intros.
  subst todo.
  subst last.
  rewrite PreH6 in PreH2, PreH4.
  simpl in PreH2, PreH4.
  subst nodes.
  sep_apply_l_atomic
    (xizi_dll_links_fold__dll_len_invariant_cycle
      linklist_pre linklist_pre linklist_pre).
  sep_apply_l_atomic (xizi_dll_empty_rev linklist_pre PreH3).
  entailer!.
Qed.
