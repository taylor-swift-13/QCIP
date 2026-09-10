Require Import Coq.Lists.List.
Require Import Coq.ZArith.ZArith.
Require Import Coq.micromega.Lia.
Require Import AUXLib.ListLib.

From SimpleC.SL Require Import Mem SeparationLogic.
Require Import Logic.LogicGenerator.demo932.Interface.
From QCIPLib.xizi.xizi_double_link_common Require Import xizi_double_link_lib.

Import ListNotations.
Import naive_C_Rules.
Local Open Scope list.
Local Open Scope string_scope.
Local Open Scope sac.
Local Open Scope Z_scope.

(** A valid public query targets either an abstract member or the sentinel.
    The sentinel remains outside the abstract node sequence. *)
Definition xizi_double_link_next_anchor
  (head : Z) (nodes : list Z) (node : Z) : Prop :=
  In node nodes \/ node = head.

(** The abstract head of a suffix.  The empty suffix corresponds to the
    circular sentinel, which the public C API reports as [NONE] / [NULL]. *)
Definition xizi_double_link_first_value (nodes : list Z) : Z :=
  match nodes with
  | nil => 0
  | next :: _ => next
  end.

(** Mathematical observation returned by [xizi_double_link_next].

    The definition searches the complete abstract node sequence for the
    queried node and returns the following abstract node.  If the queried
    node is last, or is absent, the result is [NULL].  It describes only the
    sequence-level API result and does not mirror the circular C control
    flow. *)
Fixpoint xizi_double_link_next_value
  (nodes : list Z) (node : Z) : Z :=
  match nodes with
  | nil => 0
  | current :: suffix =>
      if Z.eq_dec current node
      then xizi_double_link_first_value suffix
      else xizi_double_link_next_value suffix node
  end.

(** Unified list-level result for the public dispatch specification.  A
    sentinel query observes the abstract first node, while a member query
    observes its successor in the complete abstract sequence. *)
Definition xizi_double_link_next_dispatch_value
  (head : Z) (nodes : list Z) (node : Z) : Z :=
  if Z.eq_dec node head
  then xizi_double_link_first_value nodes
  else xizi_double_link_next_value nodes node.

Lemma xizi_double_link_in_first_occurrence__dll_dispatch_forbidden_free :
  forall (nodes : list Z) node,
    In node nodes ->
    exists before after,
      nodes = before ++ node :: after /\ ~ In node before.
Proof.
  induction nodes as [| current rest IH]; intros node Hin.
  - contradiction.
  - destruct (Z.eq_dec current node) as [Heq | Hneq].
    + subst current. exists nil, rest. simpl. tauto.
    + simpl in Hin. destruct Hin as [Heq | Hin]; [contradiction |].
      destruct (IH node Hin) as [before [after [Hnodes Hnotin]]].
      exists (current :: before), after. simpl. subst rest. tauto.
Qed.
Lemma xizi_double_link_next_value_at_first_occurrence__dll_dispatch_forbidden_free :
  forall (head node : Z) (nodes before after : list Z),
    node <> head ->
    nodes = before ++ node :: after ->
    ~ In node before ->
    xizi_double_link_next_dispatch_value head nodes node =
      xizi_double_link_first_value after.
Proof.
  intros head node nodes before after Hneq Hnodes Hnotin.
  unfold xizi_double_link_next_dispatch_value.
  destruct (Z.eq_dec node head); [contradiction |].
  subst nodes.
  induction before as [| current rest IH].
  - simpl. destruct (Z.eq_dec node node); congruence.
  - simpl in Hnotin |- *.
    assert (Hcurrent : current <> node) by
      (intro Heq; apply Hnotin; left; exact Heq).
    assert (Hrest : ~ In node rest) by
      (intro Hin; apply Hnotin; right; exact Hin).
    destruct (Z.eq_dec current node); [contradiction |].
    apply IH. exact Hrest.
Qed.

Require Import Coq.Strings.String.
Lemma next_addr_cons__next_dispatch_resources : forall x px y py a xs,
  XiziLocalDLL.addr_dllseg x px y py (a :: xs) |--
  EX q, “ x = a ” &&
  &(x # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> px **
  &(x # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> q **
  XiziLocalDLL.addr_dllseg q x y py xs.
Proof.
  intros. unfold XiziLocalDLL.addr_dllseg, XiziLocalDLL.addr_nodes,
    XiziLocalDLL.addr_store; simpl [XiziLocalDLL.dllseg].
  Intros q. Exists q. split_pure_spatial.
  - sepcon_right_assoc. repeat progress cancel.
  - dump_pre_spatial. exact H.
Qed.
Lemma next_addr_cons_rev__next_dispatch_resources : forall x px y py q xs,
  &(x # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> px **
  &(x # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> q **
  XiziLocalDLL.addr_dllseg q x y py xs |--
  XiziLocalDLL.addr_dllseg x px y py (x :: xs).
Proof.
  intros. unfold XiziLocalDLL.addr_dllseg, XiziLocalDLL.addr_nodes,
    XiziLocalDLL.addr_store; simpl [XiziLocalDLL.dllseg].
  Exists q. split_pure_spatial.
  - sepcon_right_assoc. repeat progress cancel.
  - dump_pre_spatial. reflexivity.
Qed.
Lemma next_field_exclusion__next_dispatch_resources : forall xs s v x px y py,
  &(s # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> v **
  XiziLocalDLL.addr_dllseg x px y py xs |-- “ ~ In s xs ”.
Proof.
  induction xs as [|a xs IH]; intros s v x px y py.
  - dump_pre_spatial. simpl. tauto.
  - sep_apply_l_atomic (next_addr_cons__next_dispatch_resources x px y py a xs).
    Intros q. rename H into Hx. subst x.
    destruct (Z.eq_dec s a) as [Heq | Hneq].
    + subst s. sep_apply_l_atomic (dup_store_ptr
        (&(a # "SysDoubleLinklistNode" ->ₛ "node_next")) v q).
      Intros_p Hfalse. contradiction.
    + prop_apply_p (IH s v q a y py). Intros_p Hnotin.
      dump_pre_spatial. simpl. intuition congruence.
Qed.
Lemma next_empty_observation__next_dispatch_resources : forall xs h v p l,
  &(h # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> v **
  XiziLocalDLL.addr_dllseg h p h l xs |-- “ xs = nil ”.
Proof.
  intros xs h v p l. destruct xs as [|a xs].
  - dump_pre_spatial. reflexivity.
  - sep_apply_l_atomic (next_addr_cons__next_dispatch_resources h p h l a xs).
    Intros q. rename H into Hx.
    sep_apply_l_atomic (dup_store_ptr
      (&(h # "SysDoubleLinklistNode" ->ₛ "node_next")) v q).
    Intros_p Hfalse. contradiction.
Qed.
Lemma next_nonempty_observation__next_dispatch_resources : forall xs x px y py,
  x <> y -> XiziLocalDLL.addr_dllseg x px y py xs |--
  “ x = xizi_double_link_first_value xs ”.
Proof.
  intros xs x px y py Hneq. destruct xs as [|a xs].
  - unfold XiziLocalDLL.addr_dllseg, XiziLocalDLL.addr_nodes.
    simpl [XiziLocalDLL.dllseg]. Intros_p H. destruct H; contradiction.
  - sep_apply_l_atomic (next_addr_cons__next_dispatch_resources x px y py a xs).
    Intros q. dump_pre_spatial. exact H.
Qed.
Lemma next_addr_segment_cut__next_dispatch_resources : forall before after f h t l n,
  XiziLocalDLL.addr_dllseg f h t l (before ++ n :: after) |--
  EX p q, XiziLocalDLL.addr_dllseg f h n p before **
  &(n # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> p **
  &(n # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> q **
  XiziLocalDLL.addr_dllseg q n t l after.
Proof.
  intros. unfold XiziLocalDLL.addr_dllseg at 1.
  rewrite XiziLocalDLL.addr_nodes_app.
  sep_apply_l_atomic (XiziLocalDLL.dllseg_split XiziLocalDLL.addr_store f h t l
    (XiziLocalDLL.addr_nodes before) (XiziLocalDLL.addr_nodes (n :: after))).
  Intros z p.
  fold (XiziLocalDLL.addr_dllseg f h z p before).
  fold (XiziLocalDLL.addr_dllseg z p t l (n :: after)).
  sep_apply_l_atomic (next_addr_cons__next_dispatch_resources z p t l n after).
  Intros q. subst z. Exists p q. sepcon_right_assoc. repeat progress cancel.
Qed.
Lemma next_addr_segment_rejoin__next_dispatch_resources : forall before after f h t l n p q,
  XiziLocalDLL.addr_dllseg f h n p before **
  &(n # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> p **
  &(n # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> q **
  XiziLocalDLL.addr_dllseg q n t l after |--
  XiziLocalDLL.addr_dllseg f h t l (before ++ n :: after).
Proof.
  intros. sep_apply_l_atomic (next_addr_cons_rev__next_dispatch_resources n p t l q after).
  unfold XiziLocalDLL.addr_dllseg. rewrite XiziLocalDLL.addr_nodes_app.
  sep_apply_l_atomic (XiziLocalDLL.dllseg_concat XiziLocalDLL.addr_store f h n p t l
    (XiziLocalDLL.addr_nodes before) (XiziLocalDLL.addr_nodes (n :: after))).
  sepcon_right_assoc. repeat progress cancel.
Qed.
Lemma next_store_close__next_dispatch_resources : forall A (storeA : Z -> A -> Assertion) h nodes f l,
  XiziLocalDLL.payloads storeA nodes **
  &(h # "SysDoubleLinklistNode" ->ₛ "node_next") # Ptr |-> f **
  &(h # "SysDoubleLinklistNode" ->ₛ "node_prev") # Ptr |-> l **
  XiziLocalDLL.addr_dllseg f h h l (XiziLocalDLL.ptrs nodes) |--
  XiziLocalDLL.store_dll storeA h nodes.
Proof.
  intros. sep_apply_r_atomic (XiziLocalDLL.store_dll_compose storeA h nodes).
  unfold XiziLocalDLL.addr_store_dll, XiziLocalDLL.store_dll.
  Exists f l. unfold XiziLocalDLL.addr_dllseg. sepcon_right_assoc. repeat progress cancel.
Qed.
Lemma next_store_exclusion__next_dispatch_resources : forall A (storeA : Z -> A -> Assertion) h nodes,
  XiziLocalDLL.store_dll storeA h nodes |-- “ ~ In h (XiziLocalDLL.ptrs nodes) ”.
Proof.
  intros. sep_apply_l_atomic (XiziLocalDLL.store_dll_decompose storeA h nodes).
  unfold XiziLocalDLL.addr_store_dll, XiziLocalDLL.store_dll.
  Intros f l. fold (XiziLocalDLL.addr_dllseg f h h l (XiziLocalDLL.ptrs nodes)).
  sep_apply_l_atomic (next_field_exclusion__next_dispatch_resources (XiziLocalDLL.ptrs nodes) h f f h h l).
  Intros_p H. dump_pre_spatial. exact H.
Qed.
