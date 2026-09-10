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

Lemma proof_of_DoubleLinkListLenGet_entail_wit_1 : DoubleLinkListLenGet_entail_wit_1.
Proof.
  assert (Hdll_head_nonnull : forall head nodes,
    xizi_dll head nodes |-- “ head <> NULL ”).
  { intros head nodes.
    unfold xizi_dll, XiziDLL.dll.
    Intros first last.
    entailer!. }
  pre_process.
  prop_apply_p
    (Hdll_head_nonnull linklist_pre nodes_general).
  Intros_p Hhead.
  sep_apply_l_atomic (xizi_dll_open linklist_pre nodes_general).
  Intros first last.
  Exists last first (@nil Z) nodes_general.
  unfold xizi_dll_links, XiziDLL.links.
  entailer!.
Qed.

Lemma proof_of_DoubleLinkListLenGet_entail_wit_2_1 : DoubleLinkListLenGet_entail_wit_2_1.
Proof.
  assert (Hseg_head_nonnull : forall node previous stop last xs,
    node <> stop ->
    xizi_dllseg node previous stop last xs |-- “ node <> NULL ”).
  { intros node previous stop last xs Hneq.
    destruct xs as [| expected rest].
    - unfold xizi_dllseg, XiziDLL.dllseg; simpl; entailer!.
    - unfold xizi_dllseg, XiziDLL.dllseg; simpl; Intros next; entailer!. }
  assert (Hlinks_align4 : forall node next previous,
    xizi_dll_links node next previous |-- store_align4_n 2).
  { intros node next previous.
    unfold xizi_dll_links, XiziDLL.links.
    sep_apply (store_ptr_align4
      (&(node # "SysDoubleLinklistNode" ->ₛ "node_next")) next).
    sep_apply (store_ptr_align4
      (&(node # "SysDoubleLinklistNode" ->ₛ "node_prev")) previous).
    sep_apply (store_align4_merge 1 1).
    replace (1 + 1) with 2 by lia.
    cancel (store_align4_n 2). }
  assert (Hseg_align4 : forall node previous stop last xs,
    xizi_dllseg node previous stop last xs |--
      store_align4_n (Zlength xs + Zlength xs)).
  { intros node previous stop last xs.
    revert node previous.
    induction xs as [| expected rest IH]; intros node previous.
    - unfold xizi_dllseg, XiziDLL.dllseg; simpl.
      unfold store_align4_n.
      Exists nil.
      simpl.
      split_pure_spatial.
      + Intros_p Hnil; cancel.
      + dump_pre_spatial.
        split; [rewrite Zlength_nil; reflexivity | constructor].
    - unfold xizi_dllseg, XiziDLL.dllseg; simpl.
      Intros next.
      sep_apply (Hlinks_align4 node next previous).
      sep_apply (IH next node).
      sep_apply (store_align4_merge 2
        (Zlength rest + Zlength rest)).
      replace (Zlength (expected :: rest) + Zlength (expected :: rest))
        with (2 + (Zlength rest + Zlength rest))
        by (rewrite !Zlength_cons; lia).
      cancel (store_align4_n (2 + (Zlength rest + Zlength rest))). }
  assert (Hlength_bound : forall node previous stop last xs next after,
    xizi_dllseg node previous stop last xs **
    xizi_dll_links stop next after |--
      “ 0 <= Zlength (xs ++ (stop :: nil)) < 2 ^ 32 ”).
  { intros node previous stop last xs next after.
    sep_apply (Hseg_align4 node previous stop last xs).
    sep_apply (Hlinks_align4 stop next after).
    sep_apply (store_align4_merge (Zlength xs + Zlength xs) 2).
    prop_apply store_align4_n_valid.
    Intros.
    dump_pre_spatial.
    rewrite Zlength_app, Zlength_cons, Zlength_nil.
    replace Int.max_unsigned with 4294967295 in H by reflexivity.
    replace (4294967295 / 4 + 1) with 1073741824 in H by reflexivity.
    replace (2 ^ 32) with 4294967296 by reflexivity.
    pose proof (Zlength_nonneg xs).
    lia. }
  assert (Hlinks_neq : forall node1 next1 previous1 node2 next2 previous2
      (R1 R2 : Assertion),
    xizi_dll_links node1 next1 previous1 **
    (R1 ** (R2 ** xizi_dll_links node2 next2 previous2)) |--
      “ node1 <> node2 ”).
  { intros node1 next1 previous1 node2 next2 previous2 R1 R2.
    destruct (Z.eq_dec node1 node2) as [Heq | Hneq].
    - subst node2.
      unfold xizi_dll_links, XiziDLL.links.
      set (N1 := (&(node1 # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr |-> next1).
      set (N2 := (&(node1 # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr |-> next2).
      set (P1 := (&(node1 # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr |-> previous1).
      set (P2 := (&(node1 # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr |-> previous2).
      transitivity ((N1 ** N2) ** (P1 ** (R1 ** (R2 ** P2)))).
      + entailer!.
      + unfold N1, N2, P1, P2.
        sep_apply (dup_store_ptr
          (&(node1 # "SysDoubleLinklistNode" ->ₛ "node_next")) next1 next2).
        entailer!.
    - entailer!. }
  assert (Hsnoc : forall node previous stop last xs next after,
    stop <> NULL ->
    xizi_dllseg node previous stop last xs **
    xizi_dll_links stop next last **
    xizi_dll_links next after stop |--
      xizi_dllseg node previous next stop (xs ++ (stop :: nil)) **
      xizi_dll_links next after stop).
  { intros node previous stop last xs next after Hstop.
    destruct (Z.eq_dec stop next) as [Heq | Hnext].
    - subst next.
      transitivity
        (xizi_dll_links stop stop last **
         (xizi_dllseg node previous stop last xs **
          (emp ** xizi_dll_links stop after stop))).
      + entailer!.
      + transitivity (“ stop <> stop ”).
        * exact (Hlinks_neq stop stop last stop after stop
            (xizi_dllseg node previous stop last xs) emp).
        * entailer!.
    - revert node previous.
      induction xs as [| expected rest IH]; intros node previous.
      + unfold xizi_dllseg, XiziDLL.dllseg; simpl.
        Intros.
        destruct H as [Hnode Hprevious].
        subst node; subst previous.
        Exists next.
        entailer!.
      + unfold xizi_dllseg, XiziDLL.dllseg; simpl.
        Intros current_next.
        fold xizi_dll_links.
        fold xizi_dllseg.
        destruct (Z.eq_dec node next) as [Heq | Hnode_next].
        * subst next.
          lazymatch goal with
          | |- xizi_dll_links node current_next previous **
               (?R1 ** (?R2 ** xizi_dll_links node after stop)) |-- _ =>
              transitivity (“ node <> node ”);
              [ exact (Hlinks_neq node current_next previous node after stop R1 R2)
              | entailer! ]
          end.
        * pose proof (IH current_next node) as IH0.
          unfold xizi_dllseg in IH0 at 1.
          unfold XiziDLL.dllseg in IH0 at 1.
          fold xizi_dll_links in IH0.
          sep_apply_l_atomic IH0.
          Exists current_next.
          entailer!. }
  pre_process.
  prop_apply_p
    (Hseg_head_nonnull
      next_2 tmp_node linklist_pre last_2 todo_2 PreH1).
  Intros_p Hnext_nonnull.
  sep_apply_l_atomic
    (xizi_dllseg_unfold next_2 tmp_node linklist_pre last_2 todo_2 PreH1).
  Intros next_3 rest.
  fold xizi_dll_links.
  fold xizi_dllseg.
  transitivity
    ((xizi_dllseg first_2 linklist_pre tmp_node prev_2 before_2 **
      xizi_dll_links tmp_node next_2 prev_2 **
      xizi_dll_links next_2 next_3 tmp_node) **
     (xizi_dllseg next_3 next_2 linklist_pre last_2 rest **
      xizi_dll_links linklist_pre first_2 last_2)).
  - unfold xizi_dll_links, XiziDLL.links.
    entailer!.
  - sep_apply (Hsnoc
      first_2 linklist_pre tmp_node prev_2 before_2 next_2 next_3 PreH7).
    transitivity
      ((xizi_dllseg first_2 linklist_pre next_2 tmp_node
          (before_2 ++ (tmp_node :: nil)) **
        xizi_dll_links next_2 next_3 tmp_node) **
       (xizi_dllseg next_3 next_2 linklist_pre last_2 rest **
        xizi_dll_links linklist_pre first_2 last_2)).
    + entailer!.
    + prop_apply_p
        (Hlength_bound
          first_2 linklist_pre next_2 tmp_node
          (before_2 ++ (tmp_node :: nil)) next_3 tmp_node).
      Intros_p Hbound.
      Exists next_3 tmp_node last_2 first_2
        ((before_2 ++ (tmp_node :: nil))%list)
        (((before_2 ++ (tmp_node :: nil)) ++ (next_2 :: nil))%list) rest.
      rewrite unsigned_last_nbits_eq.
      * unfold xizi_dll_links, XiziDLL.links.
        entailer!.
        -- assert (Hnodes :
             nodes_general =
               ((((before_2 ++ (tmp_node :: nil)) ++
                  (next_2 :: nil)) ++ rest)%list)).
           { rewrite <- app_assoc.
             simpl.
             rewrite PreH6, H in PreH2.
             exact PreH2. }
           rewrite Hnodes, Zlength_app.
           reflexivity.
        -- rewrite PreH4, PreH6.
           repeat rewrite Zlength_app.
           repeat rewrite Zlength_cons.
           repeat rewrite Zlength_nil.
           lia.
        -- rewrite <- app_assoc.
           simpl.
           rewrite PreH6, H in PreH2.
           exact PreH2.
      * rewrite PreH4, PreH6.
        repeat rewrite Zlength_app in Hbound |- *.
        repeat rewrite Zlength_cons in Hbound |- *.
        repeat rewrite Zlength_nil in Hbound |- *.
        rewrite Zlength_app_cons in Hbound.
        lia.
Qed.

Lemma proof_of_DoubleLinkListLenGet_entail_wit_2_2 : DoubleLinkListLenGet_entail_wit_2_2.
Proof.
  assert (Hseg_head_nonnull : forall node previous stop last xs,
    node <> stop ->
    xizi_dllseg node previous stop last xs |-- “ node <> NULL ”).
  { intros node previous stop last xs Hneq.
    destruct xs as [| expected rest].
    - unfold xizi_dllseg, XiziDLL.dllseg; simpl; entailer!.
    - unfold xizi_dllseg, XiziDLL.dllseg; simpl; Intros next; entailer!. }
  pre_process.
  subst done_2 tmp_node.
  prop_apply_p
    (Hseg_head_nonnull
      first_2 linklist_pre linklist_pre last_2 todo_2 PreH1).
  Intros_p Hfirst_nonnull.
  sep_apply_l_atomic
    (xizi_dllseg_unfold first_2 linklist_pre linklist_pre last_2 todo_2 PreH1).
  Intros next rest.
  Exists next linklist_pre last_2 first_2 (@nil Z)
    (first_2 :: nil) rest.
  rewrite unsigned_last_nbits_eq.
  - unfold xizi_dll_links, XiziDLL.links.
    entailer!.
    + unfold xizi_dllseg, XiziDLL.dllseg.
      simpl.
      entailer!.
    + rewrite H in PreH5.
      transitivity (Zlength (@nil Z) + Z.succ (Zlength rest)).
      * rewrite Zlength_cons in PreH5.
        exact PreH5.
      * rewrite Zlength_nil, Zlength_cons, Zlength_nil.
        change (Z.succ (Zlength rest) = 1 + Zlength rest).
        lia.
    + rewrite PreH4, Zlength_nil, Zlength_cons, Zlength_nil.
      reflexivity.
    + rewrite H in PreH2.
      simpl in PreH2 |- *.
      exact PreH2.
  - rewrite PreH4, Zlength_nil.
    change (0 <= 1 < 4294967296).
    lia.
Qed.

Lemma proof_of_DoubleLinkListLenGet_return_wit_1 : DoubleLinkListLenGet_return_wit_1.
Proof.
  assert (Hlinks_neq : forall node1 next1 previous1 node2 next2 previous2
      (R1 R2 : Assertion),
    xizi_dll_links node1 next1 previous1 **
    (R1 ** (R2 ** xizi_dll_links node2 next2 previous2)) |--
      “ node1 <> node2 ”).
  { intros node1 next1 previous1 node2 next2 previous2 R1 R2.
    destruct (Z.eq_dec node1 node2) as [Heq | Hneq].
    - subst node2.
      unfold xizi_dll_links, XiziDLL.links.
      set (N1 := (&(node1 # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr |-> next1).
      set (N2 := (&(node1 # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr |-> next2).
      set (P1 := (&(node1 # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr |-> previous1).
      set (P2 := (&(node1 # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr |-> previous2).
      transitivity ((N1 ** N2) ** (P1 ** (R1 ** (R2 ** P2)))).
      + entailer!.
      + unfold N1, N2, P1, P2.
        sep_apply (dup_store_ptr
          (&(node1 # "SysDoubleLinklistNode" ->ₛ "node_next")) next1 next2).
        entailer!.
    - entailer!. }
  assert (Hsnoc : forall node previous stop last xs next after,
    stop <> NULL ->
    xizi_dllseg node previous stop last xs **
    xizi_dll_links stop next last **
    xizi_dll_links next after stop |--
      xizi_dllseg node previous next stop (xs ++ (stop :: nil)) **
      xizi_dll_links next after stop).
  { intros node previous stop last xs next after Hstop.
    destruct (Z.eq_dec stop next) as [Heq | Hnext].
    - subst next.
      transitivity
        (xizi_dll_links stop stop last **
         (xizi_dllseg node previous stop last xs **
          (emp ** xizi_dll_links stop after stop))).
      + entailer!.
      + transitivity (“ stop <> stop ”).
        * exact (Hlinks_neq stop stop last stop after stop
            (xizi_dllseg node previous stop last xs) emp).
        * entailer!.
    - revert node previous.
      induction xs as [| expected rest IH]; intros node previous.
      + unfold xizi_dllseg, XiziDLL.dllseg; simpl.
        Intros.
        destruct H as [Hnode Hprevious].
        subst node; subst previous.
        Exists next.
        entailer!.
      + unfold xizi_dllseg, XiziDLL.dllseg; simpl.
        Intros current_next.
        fold xizi_dll_links.
        fold xizi_dllseg.
        destruct (Z.eq_dec node next) as [Heq | Hnode_next].
        * subst next.
          lazymatch goal with
          | |- xizi_dll_links node current_next previous **
               (?R1 ** (?R2 ** xizi_dll_links node after stop)) |-- _ =>
              transitivity (“ node <> node ”);
              [ exact (Hlinks_neq node current_next previous node after stop R1 R2)
              | entailer! ]
          end.
        * pose proof (IH current_next node) as IH0.
          unfold xizi_dllseg in IH0 at 1.
          unfold XiziDLL.dllseg in IH0 at 1.
          fold xizi_dll_links in IH0.
          sep_apply_l_atomic IH0.
          Exists current_next.
          entailer!. }
  assert (Hsame_nil : forall node previous last xs,
    xizi_dllseg node previous node last xs |-- “ xs = nil ”).
  { intros node previous last xs.
    destruct xs as [| expected rest].
    - entailer!.
    - unfold xizi_dllseg, XiziDLL.dllseg; simpl.
      Intros next.
      Intros.
      contradiction. }
  assert (Hnil_facts : forall node previous stop last,
    xizi_dllseg node previous stop last nil |--
      “ node = stop /\ previous = last ”).
  { intros node previous stop last.
    unfold xizi_dllseg, XiziDLL.dllseg; simpl; entailer!. }
  assert (Hnil_emp : forall node previous stop last,
    xizi_dllseg node previous stop last nil |-- emp).
  { intros node previous stop last.
    unfold xizi_dllseg, XiziDLL.dllseg; simpl; entailer!. }
  pre_process.
  subst next.
  prop_apply_p
    (Hsame_nil
      linklist_pre tmp_node last todo).
  Intros_p Htodo.
  subst todo.
  prop_apply_p
    (Hnil_facts
      linklist_pre tmp_node linklist_pre last).
  Intros_p Htail.
  destruct Htail as [_ Hlast].
  subst last.
  sep_apply_l_atomic
    (Hnil_emp
      linklist_pre tmp_node linklist_pre tmp_node).
  fold xizi_dll_links.
  transitivity
    (xizi_dllseg first linklist_pre tmp_node prev before **
     xizi_dll_links tmp_node linklist_pre prev **
     xizi_dll_links linklist_pre first tmp_node).
  - unfold xizi_dll_links, XiziDLL.links.
    entailer!.
  - sep_apply (Hsnoc
      first linklist_pre tmp_node prev before linklist_pre first PreH7).
    sep_apply (xizi_dll_close linklist_pre first tmp_node
      (before ++ (tmp_node :: nil)) PreH3).
    entailer!.
    + rewrite PreH2, PreH6.
      simpl.
      rewrite app_nil_r.
      entailer!.
    + rewrite PreH4.
      rewrite Zlength_nil, Z.add_0_r in PreH5.
      symmetry.
      exact PreH5.
Qed.

Lemma proof_of_DoubleLinkListLenGet_return_wit_2 : DoubleLinkListLenGet_return_wit_2.
Proof.
  assert (Hsame_nil : forall node previous last xs,
    xizi_dllseg node previous node last xs |-- “ xs = nil ”).
  { intros node previous last xs.
    destruct xs as [| expected rest].
    - entailer!.
    - unfold xizi_dllseg, XiziDLL.dllseg; simpl.
      Intros next.
      Intros.
      contradiction. }
  assert (Hnil_facts : forall node previous stop last,
    xizi_dllseg node previous stop last nil |--
      “ node = stop /\ previous = last ”).
  { intros node previous stop last.
    unfold xizi_dllseg, XiziDLL.dllseg; simpl; entailer!. }
  assert (Hnil_emp : forall node previous stop last,
    xizi_dllseg node previous stop last nil |-- emp).
  { intros node previous stop last.
    unfold xizi_dllseg, XiziDLL.dllseg; simpl; entailer!. }
  pre_process.
  subst first tmp_node done.
  prop_apply_p
    (Hsame_nil
      linklist_pre linklist_pre last todo).
  Intros_p Htodo.
  subst todo.
  prop_apply_p
    (Hnil_facts
      linklist_pre linklist_pre linklist_pre last).
  Intros_p Htail.
  destruct Htail as [_ Hlast].
  subst last.
  sep_apply_l_atomic
    (Hnil_emp
      linklist_pre linklist_pre linklist_pre linklist_pre).
  fold xizi_dll_links.
  sep_apply_l_atomic (xizi_dll_empty_rev linklist_pre PreH3).
  entailer!.
  - rewrite PreH2.
    simpl.
    entailer!.
  - rewrite PreH4, PreH2.
    reflexivity.
Qed.

Lemma proof_of_DoubleLinkListLenGet_derive_nil_case_by_general : DoubleLinkListLenGet_derive_nil_case_by_general.
Proof.
  intros linklist_pre.
  Exists (@nil Z).
  fold xizi_dll.
  rewrite <- sepcon_emp_equiv at 1.
  cancel (xizi_dll linklist_pre nil).
  rewrite <- derivable1_wand_sepcon_adjoint.
  Intros retval_2.
  Exists 0.
  entailer!.
Qed.
