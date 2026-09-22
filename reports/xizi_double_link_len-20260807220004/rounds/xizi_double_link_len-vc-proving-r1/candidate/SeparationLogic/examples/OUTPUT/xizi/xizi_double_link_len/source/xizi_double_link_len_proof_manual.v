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
  sep_apply_l_atomic (xizi_dll_open linklist_pre nodes).
  Intros first last.
  Exists last first (@nil addr) nodes.
  entailer!.
Qed.

Lemma proof_of_xizi_double_link_len_entail_wit_2_1 : xizi_double_link_len_entail_wit_2_1.
Proof.
  assert (Hlinks_distinct : forall p q pn pp qn qp,
    xizi_dll_links p pn pp ** xizi_dll_links q qn qp |-- “ p <> q ”).
  {
    intros p q pn pp qn qp.
    destruct (Z.eq_dec p q) as [Heq | Hneq].
    - subst q.
      unfold xizi_dll_links, XiziDLL.links.
      rewrite <- !logic_equiv_sepcon_assoc.
      rewrite (logic_equiv_sepcon_swap
        (&(p # XiziDoubleLinkLayout.struct_name ->ₛ
                XiziDoubleLinkLayout.prev_field) # Ptr |-> pp)
        (&(p # XiziDoubleLinkLayout.struct_name ->ₛ
                XiziDoubleLinkLayout.next_field) # Ptr |-> qn)
        (&(p # XiziDoubleLinkLayout.struct_name ->ₛ
                XiziDoubleLinkLayout.prev_field) # Ptr |-> qp)).
      rewrite !logic_equiv_sepcon_assoc.
      rewrite <- logic_equiv_sepcon_assoc.
      eapply derivable1_trans.
      + apply derivable1_sepcon_mono.
        * apply dup_store_ptr.
        * apply derivable1_refl.
      + entailer!.
    - entailer!.
  }
  assert (Hunfold_nonnull : forall node prev stop last nodes,
    node <> stop ->
    xizi_dllseg node prev stop last nodes |--
    EX next rest,
      “ nodes = node :: rest /\ node <> NULL ” &&
      xizi_dll_links node next prev **
      xizi_dllseg next node stop last rest).
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
      subst expected.
      Exists next rest.
      unfold xizi_dll_links, XiziDLL.links.
      entailer!.
  }
  assert (Hextend : forall (stop first p tmp prev next nextnext last : addr)
    (before rest : list addr),
    tmp <> NULL ->
    xizi_dllseg first p tmp prev before **
    xizi_dll_links tmp next prev **
    xizi_dll_links next nextnext tmp **
    xizi_dllseg nextnext next stop last rest
    |--
    xizi_dllseg first p next tmp (before ++ (tmp :: nil)) **
    xizi_dll_links next nextnext tmp **
    xizi_dllseg nextnext next stop last rest).
  {
    intros stop first p tmp prev next nextnext last before rest Htmp.
    revert first p.
    induction before as [| x before IH]; intros first p.
    - unfold xizi_dllseg, XiziDLL.dllseg.
      simpl.
      Intros.
      destruct H as [Hfirst Hp].
      subst first; subst p.
      prop_apply_p (Hlinks_distinct tmp next next prev nextnext tmp).
      Exists next.
      entailer!.
    - unfold xizi_dllseg, XiziDLL.dllseg.
      simpl.
      Intros next_x.
      Intros.
      subst first.
      Exists next_x.
      fold XiziDLL.dllseg.
      fold xizi_dllseg.
      fold xizi_dll_links.
      sep_apply_l_atomic (IH next_x x).
      prop_apply_p (Hlinks_distinct x next next_x p nextnext tmp).
      entailer!.
  }
  pre_process.
  sep_apply_l_atomic
    (Hunfold_nonnull next_2 tmp_node linklist_pre last_2 todo_2 PreH1).
  Intros next_cur rest.
  Intros.
  Exists next_cur tmp_node last_2 first_2 (before_2 ++ (tmp_node :: nil))
    ((before_2 ++ (tmp_node :: nil)) ++ (next_2 :: nil)) rest.
  eapply derivable1_trans with (y :=
    (&(linklist_pre # XiziDoubleLinkLayout.struct_name ->ₛ
      XiziDoubleLinkLayout.next_field) # Ptr |-> first_2) **
    (&(linklist_pre # XiziDoubleLinkLayout.struct_name ->ₛ
      XiziDoubleLinkLayout.prev_field) # Ptr |-> last_2) **
    xizi_dllseg first_2 linklist_pre tmp_node prev_2 before_2 **
    xizi_dll_links tmp_node next_2 prev_2 **
    xizi_dll_links next_2 next_cur tmp_node **
    xizi_dllseg next_cur next_2 linklist_pre last_2 rest).
  - unfold xizi_dll_links, XiziDLL.links.
    entailer!.
  - sep_apply_l_atomic
      (Hextend linklist_pre first_2 linklist_pre tmp_node prev_2
        next_2 next_cur last_2 before_2 rest PreH8).
    unfold xizi_dll_links, XiziDLL.links.
    rewrite logic_equiv_sepcon_comm.
    rewrite <- logic_equiv_sepcon_assoc.
    entailer!.
    all: destruct H as [Htodo Hnext].
    all: subst nodes; subst todo_2; subst done_2; subst linklist_length.
    all: rewrite !Zlength_app, !Zlength_cons, !Zlength_nil in *.
    + rewrite <- !Z.add_1_r.
      rewrite (Z.add_comm (Zlength rest) 1).
      rewrite Z.add_assoc.
      reflexivity.
    + rewrite <- !Z.add_1_r.
      rewrite unsigned_last_nbits_eq.
      * reflexivity.
      * split.
        -- apply Z.add_nonneg_nonneg.
           ++ apply Z.add_nonneg_nonneg.
              ** apply Zlength_nonneg.
              ** compute; congruence.
           ++ compute; congruence.
        -- pose proof (Zlength_nonneg rest) as Hrest_nonneg.
           assert (Hone : 1 <= Zlength rest + 1).
           { apply (proj1 (Z.add_le_mono_r 0 (Zlength rest) 1)).
             exact Hrest_nonneg. }
           assert (Hnew_le_total :
             Zlength before_2 + 1 + 1 <=
             Zlength before_2 + 1 + (Zlength rest + 1)).
           { apply Z.add_le_mono_l. exact Hone. }
           apply Z.le_lt_trans with 4294967295.
           ++ exact (Z.le_trans _ _ _ Hnew_le_total PreH6).
           ++ compute; congruence.
    + exact (app_assoc (before_2 ++ (tmp_node :: nil))
        (next_2 :: nil) rest).
Qed.

Lemma proof_of_xizi_double_link_len_entail_wit_2_2 : xizi_double_link_len_entail_wit_2_2.
Proof.
  assert (Hunfold_nonnull : forall node prev stop last nodes,
    node <> stop ->
    xizi_dllseg node prev stop last nodes |--
    EX next rest,
      “ nodes = node :: rest /\ node <> NULL ” &&
      xizi_dll_links node next prev **
      xizi_dllseg next node stop last rest).
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
      subst expected.
      Exists next rest.
      unfold xizi_dll_links, XiziDLL.links.
      entailer!.
  }
  pre_process.
  sep_apply_l_atomic
    (Hunfold_nonnull first_2 linklist_pre linklist_pre last_2 todo_2 PreH1).
  Intros next_cur rest.
  Intros.
  Exists next_cur linklist_pre last_2 first_2 (@nil addr)
    (first_2 :: nil) rest.
  unfold xizi_dllseg, XiziDLL.dllseg.
  simpl.
  unfold xizi_dll_links, XiziDLL.links.
  entailer!.
  all: destruct H as [Htodo Hfirst].
  all: subst nodes; subst todo_2; subst done_2; subst linklist_length;
    subst tmp_node.
  all: rewrite !Zlength_app, !Zlength_cons, !Zlength_nil in *.
  all: try rewrite Z.add_0_l.
  all: try reflexivity.
  all: symmetry; exact (Z.add_1_l (Zlength rest)).
Qed.

Lemma proof_of_xizi_double_link_len_return_wit_1 : xizi_double_link_len_return_wit_1.
Proof.
  assert (Hlinks_distinct : forall p q pn pp qn qp,
    xizi_dll_links p pn pp ** xizi_dll_links q qn qp |-- “ p <> q ”).
  {
    intros p q pn pp qn qp.
    destruct (Z.eq_dec p q) as [Heq | Hneq].
    - subst q.
      unfold xizi_dll_links, XiziDLL.links.
      rewrite <- !logic_equiv_sepcon_assoc.
      rewrite (logic_equiv_sepcon_swap
        (&(p # XiziDoubleLinkLayout.struct_name ->ₛ
                XiziDoubleLinkLayout.prev_field) # Ptr |-> pp)
        (&(p # XiziDoubleLinkLayout.struct_name ->ₛ
                XiziDoubleLinkLayout.next_field) # Ptr |-> qn)
        (&(p # XiziDoubleLinkLayout.struct_name ->ₛ
                XiziDoubleLinkLayout.prev_field) # Ptr |-> qp)).
      rewrite !logic_equiv_sepcon_assoc.
      rewrite <- logic_equiv_sepcon_assoc.
      eapply derivable1_trans.
      + apply derivable1_sepcon_mono.
        * apply dup_store_ptr.
        * apply derivable1_refl.
      + entailer!.
    - entailer!.
  }
  assert (Hextend_to_stop : forall (first p tmp prev stop next : addr)
    (before : list addr),
    tmp <> NULL ->
    xizi_dllseg first p tmp prev before **
    xizi_dll_links tmp stop prev **
    xizi_dll_links stop next tmp
    |--
    xizi_dllseg first p stop tmp (before ++ (tmp :: nil)) **
    xizi_dll_links stop next tmp).
  {
    intros first p tmp prev stop next before Htmp.
    revert first p.
    induction before as [| x before IH]; intros first p.
    - unfold xizi_dllseg, XiziDLL.dllseg.
      simpl.
      Intros.
      destruct H as [Hfirst Hp].
      subst first; subst p.
      prop_apply_p (Hlinks_distinct tmp stop stop prev next tmp).
      Exists stop.
      entailer!.
    - unfold xizi_dllseg, XiziDLL.dllseg.
      simpl.
      Intros next_x.
      Intros.
      subst first.
      Exists next_x.
      fold XiziDLL.dllseg.
      fold xizi_dllseg.
      fold xizi_dll_links.
      sep_apply_l_atomic (IH next_x x).
      prop_apply_p (Hlinks_distinct x stop next_x p next tmp).
      entailer!.
  }
  pre_process.
  subst next.
  destruct todo as [| x rest].
  - unfold xizi_dllseg, XiziDLL.dllseg at 1.
    simpl.
    Intros.
    destruct H as [Hhead Hlast].
    subst last.
    subst nodes; subst done; subst linklist_length.
    rewrite !app_nil_r in *.
    eapply derivable1_trans with (y :=
      xizi_dllseg first linklist_pre tmp_node prev before **
      xizi_dll_links tmp_node linklist_pre prev **
      xizi_dll_links linklist_pre first tmp_node).
    + unfold xizi_dll_links, XiziDLL.links.
      entailer!.
    + sep_apply_l_atomic
        (Hextend_to_stop first linklist_pre tmp_node prev linklist_pre
          first before PreH8).
      eapply derivable1_trans with (y :=
        xizi_dll_links linklist_pre first tmp_node **
        xizi_dllseg first linklist_pre linklist_pre tmp_node
          (before ++ (tmp_node :: nil))).
      * rewrite logic_equiv_sepcon_comm.
        apply derivable1_refl.
      * sep_apply_l_atomic
          (xizi_dll_close linklist_pre first tmp_node
            (before ++ (tmp_node :: nil)) PreH3).
        unfold xizi_double_link_len_lib.xizi_double_link_size.
        entailer!.
  - unfold xizi_dllseg, XiziDLL.dllseg at 1.
    simpl.
    Intros next_x.
    Intros.
    contradiction.
Qed.

Lemma proof_of_xizi_double_link_len_return_wit_2 : xizi_double_link_len_return_wit_2.
Proof.
  pre_process.
  subst first; subst tmp_node; subst done; subst nodes.
  destruct todo as [| x rest].
  - unfold xizi_dllseg, XiziDLL.dllseg at 1.
    simpl.
    Intros.
    destruct H as [Hhead Hlast].
    subst last.
    sep_apply_l_atomic (xizi_dll_empty_rev linklist_pre PreH3).
    unfold xizi_double_link_len_lib.xizi_double_link_size.
    entailer!.
  - unfold xizi_dllseg, XiziDLL.dllseg at 1.
    simpl.
    Intros next_x.
    Intros.
    contradiction.
Qed.
