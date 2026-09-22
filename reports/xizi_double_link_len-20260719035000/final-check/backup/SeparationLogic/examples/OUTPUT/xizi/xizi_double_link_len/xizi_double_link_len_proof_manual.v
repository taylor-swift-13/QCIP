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
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_len Require Import xizi_double_link_len_goal.
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_len Require Import xizi_double_link_len_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
From QCIPLib.xizi.xizi_double_link_common Require Import xizi_double_link_lib.
From SimpleC.EE.OUTPUT.xizi.xizi_double_link_len Require Import xizi_double_link_len_lib.
Local Open Scope sac.

Lemma proof_of_xizi_double_link_len_entail_wit_1 : xizi_double_link_len_entail_wit_1.
Proof.
  aggressive_pre_process.
  Exists nodes.
  entailer!.
Qed.

Lemma proof_of_xizi_double_link_len_entail_wit_2_1 : xizi_double_link_len_entail_wit_2_1.
Proof.
  assert (Hlinks_neq : forall a an ap b bn bp,
    xizi_dll_links a an ap ** xizi_dll_links b bn bp |-- “ a <> b ”).
  {
    intros.
    unfold xizi_dll_links, XiziDLL.links.
    sep_apply_l_atomic (poly_store_poly_undef_store
      (&(a # "SysDoubleLinklistNode" ->ₛ "node_next")) FET_ptr an).
    sep_apply_l_atomic (poly_store_poly_undef_store
      (&(b # "SysDoubleLinklistNode" ->ₛ "node_next")) FET_ptr bn).
    unfold poly_undef_store, undef_store_ptr.
    Intros.
    prop_apply (store_4byte_valid
      (&(a # "SysDoubleLinklistNode" ->ₛ "node_next"))
      (&(b # "SysDoubleLinklistNode" ->ₛ "node_next"))).
    Intros.
    dump_pre_spatial.
    intro Heq; subst b; lia.
  }
  assert (Hsnoc : forall first head current prev before next nextn nextp,
    current <> 0 ->
    xizi_dllseg first head current prev before **
    xizi_dll_links current next prev **
    xizi_dll_links next nextn nextp |--
    xizi_dllseg first head next current (before +:: current) **
    xizi_dll_links next nextn nextp).
  {
    intros first0 head current prev0 before0.
    revert first0 head.
    induction before0 as [| node rest IH];
      intros first0 head next0 nextn nextp Hcurrent.
    - unfold xizi_dllseg, XiziDLL.dllseg.
      simpl. Intros. destruct H as [Hfirst Hhead].
      subst first0; subst prev0.
      prop_apply_p (Hlinks_neq current next0 head next0 nextn nextp).
      Intros. Exists next0. entailer!.
    - unfold xizi_dllseg, XiziDLL.dllseg at 1.
      simpl. Intros following. Intros. subst first0.
      rewrite (logic_equiv_sepcon_assoc
        (xizi_dllseg following node current prev0 rest)
        (xizi_dll_links current next0 prev0)
        (xizi_dll_links next0 nextn nextp)).
      rewrite (logic_equiv_sepcon_comm
        (xizi_dllseg following node current prev0 rest **
         xizi_dll_links current next0 prev0)
        (xizi_dll_links next0 nextn nextp)).
      rewrite (logic_equiv_sepcon_assoc
        (xizi_dll_links node following head)
        (xizi_dll_links next0 nextn nextp)
        (xizi_dllseg following node current prev0 rest **
         xizi_dll_links current next0 prev0)).
      prop_apply_p (Hlinks_neq node following head next0 nextn nextp).
      Intros.
      rewrite (logic_equiv_sepcon_comm
        (xizi_dll_links next0 nextn nextp)
        (xizi_dllseg following node current prev0 rest **
         xizi_dll_links current next0 prev0)).
      rewrite <- (logic_equiv_sepcon_assoc
        (xizi_dllseg following node current prev0 rest)
        (xizi_dll_links current next0 prev0)
        (xizi_dll_links next0 nextn nextp)).
      sep_apply (IH following node next0 nextn nextp Hcurrent).
      Exists following. entailer!.
      rewrite logic_equiv_sepcon_comm. entailer!.
  }
  pre_process.
  unfold xizi_dllseg, XiziDLL.dllseg at 2.
  destruct todo_2 as [| expected l0].
  - simpl. Intros. destruct H as [Heq _]. contradiction.
  - simpl. Intros next_3. Intros. subst expected.
    rewrite (logic_equiv_sepcon_assoc
      (((&((linklist_pre) # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr |-> first_2))
      (((&((linklist_pre) # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr |-> last_2))
      (xizi_dllseg first_2 linklist_pre tmp_node prev_2 before_2 **
       xizi_dll_links tmp_node next_2 prev_2)).
    rewrite (logic_equiv_sepcon_assoc
      (xizi_dllseg next_3 next_2 linklist_pre last_2 l0)
      ((((&((linklist_pre) # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr |-> first_2)) **
        ((&((linklist_pre) # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr |-> last_2))
      (xizi_dllseg first_2 linklist_pre tmp_node prev_2 before_2 **
       xizi_dll_links tmp_node next_2 prev_2)).
    rewrite (logic_equiv_sepcon_comm
      (xizi_dll_links next_2 next_3 tmp_node)
      ((xizi_dllseg next_3 next_2 linklist_pre last_2 l0 **
        (((&((linklist_pre) # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr |-> first_2) **
         ((&((linklist_pre) # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr |-> last_2))) **
       (xizi_dllseg first_2 linklist_pre tmp_node prev_2 before_2 **
        xizi_dll_links tmp_node next_2 prev_2))).
    rewrite <- (logic_equiv_sepcon_assoc
      (xizi_dllseg next_3 next_2 linklist_pre last_2 l0 **
        (((&((linklist_pre) # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr |-> first_2) **
         ((&((linklist_pre) # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr |-> last_2)))
      (xizi_dllseg first_2 linklist_pre tmp_node prev_2 before_2 **
       xizi_dll_links tmp_node next_2 prev_2)
      (xizi_dll_links next_2 next_3 tmp_node)).
    rewrite <- (logic_equiv_sepcon_assoc
      (xizi_dllseg first_2 linklist_pre tmp_node prev_2 before_2)
      (xizi_dll_links tmp_node next_2 prev_2)
      (xizi_dll_links next_2 next_3 tmp_node)).
    sep_apply (Hsnoc first_2 linklist_pre tmp_node prev_2 before_2
      next_2 next_3 tmp_node PreH8).
    subst done_2.
    Exists next_3 tmp_node last_2 first_2
      (before_2 +:: tmp_node)
      ((before_2 +:: tmp_node) +:: next_2) l0.
    unfold xizi_double_link_size in *.
    entailer!.
    + unfold xizi_dll_links, XiziDLL.links. entailer!.
    + rewrite !Zlength_app, !Zlength_cons, !Zlength_nil in *. lia.
    + rewrite !Zlength_app, !Zlength_cons, !Zlength_nil in *.
      pose proof (Zlength_nonneg before_2).
      pose proof (Zlength_nonneg l0).
      rewrite unsigned_last_nbits_eq.
      2: change (2 ^ 32) with 4294967296; lia.
      lia.
    + rewrite <- app_assoc. simpl. exact PreH2.
Qed.

Lemma proof_of_xizi_double_link_len_entail_wit_2_2 : xizi_double_link_len_entail_wit_2_2.
Proof.
  pre_process.
  subst tmp_node; subst done_2.
  unfold xizi_dllseg, XiziDLL.dllseg at 1.
  destruct todo_2 as [| expected l0].
  - simpl. Intros. destruct H as [Heq _]. contradiction.
  - simpl. Intros next_2. Intros. subst expected.
    Exists next_2 linklist_pre last_2 first_2 nil
      (first_2 :: nil) l0.
    unfold xizi_double_link_size in *.
    entailer!.
    + unfold xizi_dllseg, XiziDLL.dllseg, xizi_dll_links, XiziDLL.links.
      entailer!.
    + rewrite ?Zlength_app, ?Zlength_cons, ?Zlength_nil in *.
      pose proof (Zlength_nonneg l0). lia.
    + rewrite ?Zlength_app, ?Zlength_cons, ?Zlength_nil in *.
      pose proof (Zlength_nonneg l0).
      rewrite unsigned_last_nbits_eq.
      2: change (2 ^ 32) with 4294967296; lia.
      lia.
Qed.

Lemma proof_of_xizi_double_link_len_return_wit_1 : xizi_double_link_len_return_wit_1.
Proof.
  assert (Hlinks_neq : forall a an ap b bn bp,
    xizi_dll_links a an ap ** xizi_dll_links b bn bp |-- “ a <> b ”).
  {
    intros.
    unfold xizi_dll_links, XiziDLL.links.
    sep_apply_l_atomic (poly_store_poly_undef_store
      (&(a # "SysDoubleLinklistNode" ->ₛ "node_next")) FET_ptr an).
    sep_apply_l_atomic (poly_store_poly_undef_store
      (&(b # "SysDoubleLinklistNode" ->ₛ "node_next")) FET_ptr bn).
    unfold poly_undef_store, undef_store_ptr.
    Intros.
    prop_apply (store_4byte_valid
      (&(a # "SysDoubleLinklistNode" ->ₛ "node_next"))
      (&(b # "SysDoubleLinklistNode" ->ₛ "node_next"))).
    Intros. dump_pre_spatial.
    intro Heq; subst b; lia.
  }
  assert (Hsnoc : forall first0 head current prev0 before0 next0 nextn nextp,
    current <> 0 ->
    xizi_dllseg first0 head current prev0 before0 **
    xizi_dll_links current next0 prev0 **
    xizi_dll_links next0 nextn nextp |--
    xizi_dllseg first0 head next0 current (before0 +:: current) **
    xizi_dll_links next0 nextn nextp).
  {
    intros first0 head current prev0 before0.
    revert first0 head.
    induction before0 as [| node rest IH];
      intros first0 head next0 nextn nextp Hcurrent.
    - unfold xizi_dllseg, XiziDLL.dllseg.
      simpl. Intros. destruct H as [Hfirst Hhead].
      subst first0; subst prev0.
      prop_apply_p (Hlinks_neq current next0 head next0 nextn nextp).
      Intros. Exists next0. entailer!.
    - unfold xizi_dllseg, XiziDLL.dllseg at 1.
      simpl. Intros following. Intros. subst first0.
      rewrite (logic_equiv_sepcon_assoc
        (xizi_dllseg following node current prev0 rest)
        (xizi_dll_links current next0 prev0)
        (xizi_dll_links next0 nextn nextp)).
      rewrite (logic_equiv_sepcon_comm
        (xizi_dllseg following node current prev0 rest **
         xizi_dll_links current next0 prev0)
        (xizi_dll_links next0 nextn nextp)).
      rewrite (logic_equiv_sepcon_assoc
        (xizi_dll_links node following head)
        (xizi_dll_links next0 nextn nextp)
        (xizi_dllseg following node current prev0 rest **
         xizi_dll_links current next0 prev0)).
      prop_apply_p (Hlinks_neq node following head next0 nextn nextp).
      Intros.
      rewrite (logic_equiv_sepcon_comm
        (xizi_dll_links next0 nextn nextp)
        (xizi_dllseg following node current prev0 rest **
         xizi_dll_links current next0 prev0)).
      rewrite <- (logic_equiv_sepcon_assoc
        (xizi_dllseg following node current prev0 rest)
        (xizi_dll_links current next0 prev0)
        (xizi_dll_links next0 nextn nextp)).
      sep_apply (IH following node next0 nextn nextp Hcurrent).
      Exists following. entailer!.
      rewrite logic_equiv_sepcon_comm. entailer!.
  }
  pre_process.
  subst next; subst done.
  unfold xizi_dllseg, XiziDLL.dllseg at 2.
  destruct todo as [| expected rest].
  - simpl. Intros. destruct H as [_ Hlast]. subst last.
    simpl in PreH2. subst nodes.
    fold xizi_dllseg.
    rewrite (logic_equiv_sepcon_assoc
      ((&((linklist_pre) # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr |-> first)
      ((&((linklist_pre) # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr |-> tmp_node)
      (xizi_dllseg first linklist_pre tmp_node prev before **
       (((&((tmp_node) # "SysDoubleLinklistNode" ->ₛ "node_next")) # Ptr |-> linklist_pre) **
        ((&((tmp_node) # "SysDoubleLinklistNode" ->ₛ "node_prev")) # Ptr |-> prev)))).
    rewrite app_nil_r in *.
    change
      (xizi_dll_links linklist_pre first tmp_node **
       (xizi_dllseg first linklist_pre tmp_node prev before **
        xizi_dll_links tmp_node linklist_pre prev) |--
       “ linklist_length = xizi_double_link_size (before +:: tmp_node) ” &&
       xizi_dll linklist_pre (before +:: tmp_node)).
    rewrite (logic_equiv_sepcon_comm
      (xizi_dll_links linklist_pre first tmp_node)
      (xizi_dllseg first linklist_pre tmp_node prev before **
       xizi_dll_links tmp_node linklist_pre prev)).
    rewrite <- (logic_equiv_sepcon_assoc
      (xizi_dllseg first linklist_pre tmp_node prev before)
      (xizi_dll_links tmp_node linklist_pre prev)
      (xizi_dll_links linklist_pre first tmp_node)).
    sep_apply (Hsnoc first linklist_pre tmp_node prev before
      linklist_pre first tmp_node PreH8).
    rewrite logic_equiv_sepcon_comm.
    sep_apply (xizi_dll_close linklist_pre first tmp_node
      (before +:: tmp_node)).
    unfold xizi_double_link_size in *.
    entailer!.
  - simpl. Intros following. Intros. contradiction.
Qed.

Lemma proof_of_xizi_double_link_len_return_wit_2 : xizi_double_link_len_return_wit_2.
Proof.
  pre_process.
  subst tmp_node; subst first; subst done.
  simpl in PreH2.
  subst nodes.
  unfold xizi_dllseg, XiziDLL.dllseg at 1.
  destruct todo.
  - simpl. Intros. destruct H as [Hfirst Hlast].
    subst last.
    change (xizi_dll_links linklist_pre linklist_pre linklist_pre |--
      “ linklist_length = xizi_double_link_size nil ” &&
      xizi_dll linklist_pre nil).
    sep_apply xizi_dll_empty_rev.
    unfold xizi_double_link_size.
    entailer!.
  - simpl. Intros next0. Intros. contradiction.
Qed.
