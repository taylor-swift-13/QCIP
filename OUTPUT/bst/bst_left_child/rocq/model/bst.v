Require Import GraphLib.graph_basic.
Require Import GraphLib.reachable.reachable_basic.
Require Import GraphLib.reachable.reachable_restricted.
Require Import GraphLib.directed.rootedtree.
Require Import GraphLib.directed.binarytree.
Require Import GraphLib.subgraph.subgraph.
Require Import GraphLib.Syntax.
Require Import MaxMinLib.MaxMin MaxMinLib.Interface.
Require Import SetsClass.SetsClass.
Require Import Coq.Logic.Classical.
Require Import Coq.Logic.ClassicalDescription.
Require Import Coq.Logic.Classical_Prop.
Require Import Coq.Logic.FunctionalExtensionality.
Require Import Coq.Logic.PropExtensionality.
Require Import Coq.Classes.Morphisms.
Require Import Coq.Classes.RelationClasses.
Require Import Coq.ZArith.ZArith.
Require Import Coq.Lists.List.
Require Import Coq.Sorting.Permutation.
Require Import Lia.
Require Import Coq.Arith.Arith.

Local Open Scope sets_scope.

Record BinaryTreeType {V: Type}:=
{
  vset: V -> Prop;
  theroot: option V;
  left_child: V -> option V;
  right_child: V -> option V;
  listV: list V;
}.

Arguments BinaryTreeType _ : clear implicits.

Notation "tree '.(vset)'" := (vset tree) (at level 1).
Notation "tree '.(root)'" := (theroot tree) (at level 1).
Notation "tree '.(left_child)'" := (left_child tree) (at level 1).
Notation "tree '.(right_child)'" := (right_child tree) (at level 1).

Record BinaryTreeProp {V: Type} (rt: BinaryTreeType V):=
{
  root_valid: forall r, rt.(root) = Some r -> rt.(vset) r;
  root_no_parents: forall v r, rt.(root) = Some r -> ~left_child rt v = Some r /\ ~right_child rt v = Some r;
  father_unique: forall y x1 x2, rt.(vset) x1 -> rt.(vset) x2 ->
    (left_child rt x1 = Some y \/ right_child rt x1 = Some y) ->
    (left_child rt x2 = Some y \/ right_child rt x2 = Some y) ->
    x1 = x2;
  child_valid: forall v1 v2, rt.(vset) v1 -> left_child rt v1 = Some v2 \/ right_child rt v1 = Some v2 -> rt.(vset) v2;
  invalid_child_is_none: forall v, ~rt.(vset) v -> left_child rt v = None /\ right_child rt v = None;
  child_distinct: forall v1 v2 v3, rt.(vset) v1 -> rt.(vset) v2 -> rt.(vset) v3 -> left_child rt v1 = Some v2 -> right_child rt v1 = Some v3 -> v2 <> v3;
  path_exists: forall v, rt.(vset) v -> exists r, rt.(root) = Some r /\ clos_refl_trans (fun x y => left_child rt x = Some y \/ right_child rt x = Some y) r v;
  finite_vertices: forall v, rt.(vset) v -> In v rt.(listV);
  listV_sound: forall v, In v rt.(listV) -> rt.(vset) v;
  listV_NoDup: NoDup rt.(listV);
}.

Arguments BinaryTreeProp _ _ : clear implicits.

Definition bt_vvalid {V: Type} (g: BinaryTreeType V) (v: V): Prop :=
  g.(vset) v.

Definition bt_evalid {V: Type} (g: BinaryTreeType V) (e: V): Prop :=
  exists x, g.(vset) x /\ (g.(left_child) x = Some e \/ g.(right_child) x = Some e).

Record bt_step_aux {V: Type} (g: BinaryTreeType V) (e: V) (x y: V): Prop := 
{ 
  bt_step_x_valid : g.(vset) x;
  bt_step_y_valid : g.(vset) y;
  bt_step_edge_equal : y = e;
  bt_step_child : g.(left_child) x = Some y \/ g.(right_child) x = Some y;
}.

#[export]Program Instance Binarytree_graph {V: Type}:
  graph_basic.Graph (BinaryTreeType V) V V := {
  vvalid := bt_vvalid ;
  evalid := bt_evalid ;
  step_aux := bt_step_aux;
}.

#[export]Instance Binarytree_gvalid {V: Type}:
  graph_basic.GValid (BinaryTreeType V) :=
  @BinaryTreeProp V.

#[export]Instance Binarytree_stepvalid {V: Type}: 
  StepValid (BinaryTreeType V) V V.
Proof.
  split; intros; destruct H; auto.
  subst e; exists x; auto.
Qed. 

#[export]Instance Rootedtree_noemptyedge {V: Type} : 
  graph_basic.NoEmptyEdge (BinaryTreeType V ) V V.
Proof.
  split; intros g e Hg He.
  destruct He as [x [Hx Hchild]].
  assert (He_valid : g.(vset) e).
  { eapply child_valid; eauto. }
  exists x, e.
  constructor; auto.
Qed.

#[export]Instance Rootedtree_directedgragh {V: Type}: 
  graph_basic.StepUniqueDirected (BinaryTreeType V ) V V .
Proof.
  split; intros ? ? ? ? ? ? HH ? ?.
  destruct H.
  destruct H0.
  rewrite <- bt_step_edge_equal1 in bt_step_edge_equal0.
  subst y2. 
  split.
  2: auto.
  eapply father_unique; eauto.
Qed.

#[export]Instance RootedTree_finitegraph {V: Type}:
  graph_basic.FiniteGraph (BinaryTreeType V) V V. 
Proof.
  refine {|graph_basic.listV:= listV;|}.
  - intros; apply finite_vertices; auto.
Defined.

Definition bt_child {V : Type} (t : BinaryTreeType V) (a b : V) : Prop :=
  t.(left_child) a = Some b \/ t.(right_child) a = Some b.

Definition bt_path {V : Type} (t : BinaryTreeType V) (a b : V) : Prop :=
  clos_refl_trans (bt_child t) a b.

Definition bt_left_subtree {V : Type} (t : BinaryTreeType V) (x y : V) : Prop :=
  exists l, t.(left_child) x = Some l /\ bt_path t l y.

Definition bt_right_subtree {V : Type} (t : BinaryTreeType V) (x y : V) : Prop :=
  exists r, t.(right_child) x = Some r /\ bt_path t r y.

Lemma bt_child_valid_early :
  forall {V : Type} (t : BinaryTreeType V) (a b : V),
    gvalid t -> t.(vset) a -> bt_child t a b -> t.(vset) b.
Proof.
  intros V t a b Hvalid Ha Hchild.
  unfold bt_child in Hchild.
  eapply child_valid; eauto.
Qed.

Lemma bt_path_end_valid_early :
  forall {V : Type} (t : BinaryTreeType V) (a b : V),
    gvalid t -> t.(vset) a -> bt_path t a b -> t.(vset) b.
Proof.
  intros V t a b Hvalid Ha Hpath.
  unfold bt_path in Hpath.
  induction_1n Hpath.
  - exact Ha.
  - apply IHrt; auto.
    eapply bt_child_valid_early; eauto.
Qed.

Lemma bt_child_to_step_early :
  forall {V : Type} (t : BinaryTreeType V) (a b : V),
    gvalid t -> t.(vset) a -> bt_child t a b -> step t a b.
Proof.
  intros V t a b Hvalid Ha Hchild.
  unfold step.
  exists b.
  refine {|
    bt_step_x_valid := Ha;
    bt_step_y_valid := _;
    bt_step_edge_equal := eq_refl;
    bt_step_child := Hchild
  |}.
  eapply bt_child_valid_early; eauto.
Qed.

Lemma bt_path_to_reachable_early :
  forall {V : Type} (t : BinaryTreeType V) (a b : V),
    gvalid t -> t.(vset) a -> bt_path t a b -> reachable t a b.
Proof.
  intros V t a b Hvalid Ha Hpath.
  unfold bt_path in Hpath.
  unfold reachable.
  induction_1n Hpath.
  - reflexivity.
  - transitivity_1n a0.
    + eapply bt_child_to_step_early; eauto.
    + apply IHrt; auto.
      eapply bt_child_valid_early; eauto.
Qed.

Lemma reachable_to_bt_path_early :
  forall {V : Type} (t : BinaryTreeType V) (a b : V),
    gvalid t -> reachable t a b -> bt_path t a b.
Proof.
  intros V t a b Hvalid Hreach.
  unfold reachable in Hreach.
  unfold bt_path.
  induction_1n Hreach.
  - reflexivity.
  - transitivity_1n a0.
    + unfold bt_child.
      destruct H as [e Haux].
      destruct Haux as [_ _ _ Hchild].
      exact Hchild.
    + apply IHrt; auto.
Qed.

Lemma bt_root_path_no_self_child :
  forall {V : Type} (t : BinaryTreeType V) (r x : V),
    gvalid t ->
    t.(root) = Some r ->
    bt_path t r x ->
    ~ bt_child t x x.
Proof.
  intros V t r x Hvalid Hroot Hpath Hself.
  unfold bt_path in Hpath.
  induction_n1 Hpath.
  - pose proof (root_no_parents t Hvalid x x Hroot) as [HnL HnR].
    unfold bt_child in Hself.
    destruct Hself as [Hself | Hself]; contradiction.
  - match goal with
    | Hprev : clos_refl_trans (bt_child t) r ?p,
      Hedge : bt_child t ?p ?q |- _ =>
        assert (Hp : t.(vset) p) by (eapply bt_path_end_valid_early; eauto; eapply root_valid; eauto);
        assert (Hq : t.(vset) q) by (eapply bt_child_valid_early; eauto);
        assert (p = q) by (eapply father_unique; eauto);
        subst p;
        eapply IHrt; eauto
    end.
Qed.

Lemma bt_root_path_antisym :
  forall {V : Type} (t : BinaryTreeType V) (r x y : V),
    gvalid t ->
    t.(root) = Some r ->
    bt_path t r x ->
    bt_path t x y ->
    bt_path t y x ->
    x = y.
Proof.
  intros V t r x y Hvalid Hroot Hrx Hxy Hyx.
  revert y Hxy Hyx.
  unfold bt_path in Hrx.
  induction_n1 Hrx.
  - unfold bt_path in Hyx.
    induction_n1 Hyx.
    + reflexivity.
    + exfalso.
      match goal with
      | Hedge : bt_child t ?p x |- _ =>
        pose proof (root_no_parents t Hvalid p x Hroot) as [HnL HnR];
        unfold bt_child in Hedge;
        destruct Hedge as [Hleft | Hright]; contradiction
      end.
  - rename IHrt into IHroot.
    unfold bt_path in Hyx.
    induction_n1 Hyx.
    + reflexivity.
    + match goal with
      | Hroot_edge : bt_child t ?p ?q,
        Hlast_edge : bt_child t ?last ?q,
        Hprefix : clos_refl_trans (bt_child t) ?z ?last,
        Hforward : bt_path t ?q ?z |- _ =>
          assert (Hp : t.(vset) p) by (eapply bt_path_end_valid_early; eauto; eapply root_valid; eauto);
          assert (Hq : t.(vset) q) by (eapply bt_child_valid_early; eauto);
          assert (Hz : t.(vset) z) by (eapply bt_path_end_valid_early with (a:=q); eauto);
          assert (Hlast : t.(vset) last) by (eapply bt_path_end_valid_early with (a:=z); eauto);
          assert (p = last) by (eapply father_unique; eauto);
          subst last;
          assert (Hpz : bt_path t p z) by (unfold bt_path in *; transitivity_1n q; eauto);
          assert (p = z) by (eapply IHroot; eauto);
          subst z;
          assert (Hpq : bt_path t p q) by (unfold bt_path; transitivity_1n q; eauto; reflexivity);
          assert (p = q) by (eapply IHroot; eauto);
          subst p;
          reflexivity
      end.
Qed.

#[export]Instance Binarytree_forest {V: Type} :
  Forest (BinaryTreeType V) V V.
Proof.
  split.
  - intros g x1 x2 e1 e2 y Hg Haux1 Haux2.
    destruct Haux1; destruct Haux2; subst e1; subst e2.
    reflexivity. 
  - intros g x y Hg Hreach Hstep.
    destruct Hstep as [e Haux].
    destruct Haux as [Hy Hx Heq Hchild].
    destruct (path_exists g Hg x Hx) as [r [Hroot Hrx]].
    assert (Hxy : bt_path g x y). { eapply reachable_to_bt_path_early; eauto. }
    assert (Hyx : bt_path g y x).
    { unfold bt_path.
      transitivity_1n x; auto.
      reflexivity. }
    assert (x = y). { eapply bt_root_path_antisym; eauto. }
    subst y.
    eapply bt_root_path_no_self_child; eauto.
Defined.

#[export]Instance simple_graph{V : Type}: 
  graph_basic.SimpleGraph (BinaryTreeType V) V V.
Proof.
  split; intros.
  - eapply father_eunique; eauto.
  - unfold not; intros H0.
    apply step_trivial in H0.
    eapply no_edge_refl; eauto.
    Unshelve. auto.
Qed.

#[export]Instance BinaryTree_binarytree {V: Type}:
  BinaryTree (BinaryTreeType V) V V.
Proof.
  refine {|
    GraphLib.directed.binarytree.bt_root := @theroot V;
    GraphLib.directed.binarytree.left_child := @left_child V;
    GraphLib.directed.binarytree.right_child := @right_child V
  |}.
  - intros g Hg.
    destruct g.(root) as [r |] eqn:Hroot; simpl; auto.
    eapply root_valid; eauto.
  - intros g x Hg Hx.
    destruct (path_exists g Hg x Hx) as [r [Hroot Hpath]].
    exists r.
    split; [exact Hroot|].
    eapply bt_path_to_reachable_early; eauto.
    eapply root_valid; eauto.
  - intros g x y Hg Hx Hl.
    assert (Hy : g.(vset) y).
    { exact (child_valid g Hg x y Hx (or_introl Hl)). }
    unfold step.
    exists y.
    refine {|
      bt_step_x_valid := Hx;
      bt_step_y_valid := Hy;
      bt_step_edge_equal := eq_refl;
      bt_step_child := or_introl Hl
    |}.
  - intros g x y Hg Hx Hr.
    assert (Hy : g.(vset) y).
    { exact (child_valid g Hg x y Hx (or_intror Hr)). }
    unfold step.
    exists y.
    refine {|
      bt_step_x_valid := Hx;
      bt_step_y_valid := Hy;
      bt_step_edge_equal := eq_refl;
      bt_step_child := or_intror Hr
    |}.
  - intros g x y Hg Hstep.
    destruct Hstep as [e Haux].
    destruct Haux as [Hx Hy Heq Hchild].
    subst e.
    exact Hchild.
  - intros g x Hg Hx.
    exact (invalid_child_is_none g Hg x Hx).
  - intros g x y1 y2 Hg Hx Hl Hr.
    assert (Hy1 : g.(vset) y1).
    { exact (child_valid g Hg x y1 Hx (or_introl Hl)). }
    assert (Hy2 : g.(vset) y2).
    { exact (child_valid g Hg x y2 Hx (or_intror Hr)). }
    exact (child_distinct g Hg x y1 y2 Hx Hy1 Hy2 Hl Hr).
Defined.

Section EMPTY_TREE.

Context {V: Type}.

Definition empty_tree : BinaryTreeType V :=
  {|
    vset := fun _ => False;
    theroot := None;
    left_child := fun _ => None;
    right_child := fun _ => None;
    listV := nil;
  |}.

Lemma empty_tree_valid : gvalid empty_tree.
Proof.
  unfold gvalid, empty_tree.
  constructor; simpl.
  - intros r Hroot. discriminate.
  - intros v r Hroot. discriminate.
  - intros y x1 x2 Hx1. contradiction.
  - intros v1 v2 Hv1. contradiction.
  - intros v _. split; reflexivity.
  - intros v1 v2 v3 Hv1. contradiction.
  - intros v Hv. contradiction.
  - intros v Hv. contradiction.
  - intros v Hin. contradiction.
  - constructor.
Qed.

Lemma valid_empty_tree : forall g, gvalid g -> theroot g = None -> g = empty_tree.
Proof.
  intros g gvalid Hroot.
  destruct gvalid as
    [Hroot_valid Hroot_no_parents Hfather_unique Hchild_valid
     Hinvalid_child Hchild_distinct Hpath_exists Hfinite_vertices
     HlistV_sound HlistV_NoDup].
  assert (Hempty: forall v, g.(vset) v -> False).
  { intros v Hv.
    destruct (Hpath_exists v Hv) as [root [Hrroot Hpath]].
    rewrite Hroot in Hrroot. discriminate. }
  assert (Hempty_list: forall v, In v g.(listV) -> False).
  { intros v Hin.
    apply HlistV_sound in Hin.
    apply Hempty in Hin. contradiction. }
  unfold empty_tree.
  destruct g.
  simpl in *.
  subst theroot0.
  assert (Hvset : vset0 = fun _ : V => False).
  { apply functional_extensionality.
    intro v.
    apply propositional_extensionality.
    split.
    - intro Hv.
      apply Hempty in Hv.
      exact Hv.
    - intro Hfalse.
      contradiction. }
  assert (Hlist : listV0 = nil).
  { destruct listV0 as [| x xs].
    - reflexivity.
    - exfalso.
      apply (Hempty_list x).
      simpl.
      left.
      reflexivity. }
  subst vset0.
  assert (Hleft : left_child0 = fun _ : V => None).
  { apply functional_extensionality.
    intro v.
    apply Hinvalid_child.
    intro Hv.
    exact Hv. }
  assert (Hright : right_child0 = fun _ : V => None).
  { apply functional_extensionality.
    intro v.
    apply Hinvalid_child.
    intro Hv.
    exact Hv. }
  subst listV0.
  subst left_child0.
  subst right_child0.
  reflexivity.
Qed.

End EMPTY_TREE.

Section SINGLE_NODE_TREE.

Context {V: Type}.
Definition single_node_tree (root : V) : BinaryTreeType V :=
  {|
    vset := fun x => x = root;
    theroot := Some root;
    left_child := fun _ => None;
    right_child := fun _ => None;
    listV := root :: nil;
  |}.

Lemma single_node_tree_valid : forall root,
  gvalid (single_node_tree root).
Proof.
  intro root.
  unfold gvalid, single_node_tree.
  constructor; simpl.
  - intros r Hroot. congruence.
  - intros v r Hroot. split; discriminate.
  - intros y x1 x2 Hx1 Hx2. congruence.
  - intros v1 v2 Hv1 Hchild. destruct Hchild; discriminate.
  - intros v _. split; reflexivity.
  - intros v1 v2 v3 Hv1 Hv2 Hv3 Hleft. discriminate.
  - intros v Hv.
    subst v.
    exists root.
    split.
    + reflexivity.
    + unfold clos_refl_trans.
      exists 0%nat.
      reflexivity.
  - intros v Hv.
    subst v.
    simpl; auto.
  - intros v [Hv | Hv].
    + symmetry; exact Hv.
    + contradiction.
  - constructor.
    + simpl; tauto.
    + constructor.
Qed.

Lemma valid_single_node_tree : forall g root,
  gvalid g ->
  theroot g = Some root ->
  left_child g root = None ->
  right_child g root = None ->
  g = single_node_tree root.
Proof.
  intros g root Hg Hroot Hleft_root Hright_root.
  pose proof Hg as Hg_full.
  destruct Hg as
    [Hroot_valid Hroot_no_parents Hfather_unique Hchild_valid Hinvalid_child Hchild_distinct Hpath_exists Hfinite_vertices HlistV_sound HlistV_NoDup].
  assert (Honly_root : forall v, g.(vset) v -> v = root).
  { intros v Hv.
    destruct (Hpath_exists v Hv) as [r [Hr Hpath]].
    rewrite Hroot in Hr.
    injection Hr as Hr.
    subst r.
    induction_n1 Hpath.
    - reflexivity.
    - assert (Hroot0_valid : g.(vset) root0).
      { eapply (@bt_path_end_valid_early V g root root0).
        - exact Hg_full.
        - eapply Hroot_valid; eauto.
        - unfold bt_path.
          exact Hpath. }
      assert (Hroot0 : root0 = root).
      { eapply IHrt; eauto. }
      subst root0.
      destruct H as [Hleft | Hright].
      + rewrite Hleft_root in Hleft. discriminate.
      + rewrite Hright_root in Hright. discriminate. }
  unfold single_node_tree.
  destruct g as [vset0 theroot0 left_child0 right_child0 listV0].
  simpl in *.
  subst theroot0.
  assert (Hvset : vset0 = fun v : V => v = root).
  { apply functional_extensionality.
    intro v.
    apply propositional_extensionality.
    split.
    - apply Honly_root.
    - intro Hv.
      subst v.
      apply Hroot_valid with (r := root).
      reflexivity. }
  assert (Hleft : left_child0 = fun _ : V => None).
  { apply functional_extensionality.
    intro v.
    destruct (classic (v = root)) as [Hv | Hv].
    - subst v. exact Hleft_root.
    - apply Hinvalid_child.
      intro Hvalid.
      apply Hv.
      apply Honly_root.
      exact Hvalid. }
  assert (Hright : right_child0 = fun _ : V => None).
  { apply functional_extensionality.
    intro v.
    destruct (classic (v = root)) as [Hv | Hv].
    - subst v. exact Hright_root.
    - apply Hinvalid_child.
      intro Hvalid.
      apply Hv.
      apply Honly_root.
      exact Hvalid. }
  assert (Hlist : listV0 = root :: nil).
  { destruct listV0 as [| x xs].
    - exfalso.
      assert (Hroot_valid' : vset0 root).
      { apply Hroot_valid with (r := root).
        reflexivity. }
      pose proof (Hfinite_vertices root Hroot_valid') as Hin.
      exact Hin.
    - assert (Hx : x = root).
      { apply Honly_root.
        apply HlistV_sound.
        simpl; auto. }
      subst x.
      destruct xs as [| y ys].
      + reflexivity.
      + exfalso.
        inversion HlistV_NoDup as [| ? ? Hnotin Hnodup].
        apply Hnotin.
        assert (Hy : y = root).
        { apply Honly_root.
          apply HlistV_sound.
          simpl; auto. }
        subst y.
        simpl; auto. }
  subst vset0; subst left_child0; subst right_child0; subst listV0.
  reflexivity.
Qed.

End SINGLE_NODE_TREE.

Section BT_OPERATIONS.

Context {V: Type}.
Context (V_eq_dec : forall x y : V, {x = y} + {x <> y}).

Definition override_v_func (u : V) (c : option V): (V -> option V) -> (V -> option V) :=
  fun f v => if V_eq_dec v u then c else f v.

Definition iter_override (base : V -> option V)(ups : list ((V -> option V) -> (V -> option V))): V -> option V :=
  fold_right (fun upd acc => upd acc) base ups.

Lemma iter_override_in :
  forall (base : V -> option V) (l : list V) (value : V -> option V) (a : V),
    In a l ->
    iter_override base (map (fun u => override_v_func u (value u)) l) a = value a.
Proof.
  intros base l value a Hin.
  induction l as [|u l IH]; simpl in *; [contradiction|].
  unfold override_v_func.
  destruct (V_eq_dec a u) as [Hau | Hau].
  - subst u. reflexivity.
  - apply IH.
    destruct Hin as [Hin | Hin]; [subst u; contradiction|exact Hin].
Qed.

Lemma iter_override_not_in :
  forall (base : V -> option V) (l : list V) (value : V -> option V) (a : V),
    ~ In a l ->
    iter_override base (map (fun u => override_v_func u (value u)) l) a = base a.
Proof.
  intros base l value a Hnin.
  induction l as [|u l IH]; simpl in *; [reflexivity|].
  unfold override_v_func.
  destruct (V_eq_dec a u) as [Hau | Hau].
  - subst u. exfalso. apply Hnin. left. reflexivity.
  - apply IH. intro Hin. apply Hnin. right. exact Hin.
Qed.

Definition replace_child (old new : V) (child : option V) : option V :=
  match child with
  | Some v => if V_eq_dec v old then Some new else Some v
  | None => None
  end.

Section LEFT_ROTATION.

Definition left_rotate_left_value
            (t : BinaryTreeType V) (x y u : V) : option V :=
  if V_eq_dec u y then Some x
  else if V_eq_dec u x then t.(left_child) x
  else replace_child x y (t.(left_child) u).

Definition left_rotate_left_child
           (t : BinaryTreeType V) (x y : V) : V -> option V :=
  iter_override t.(left_child) (map (fun u => override_v_func u ((left_rotate_left_value t x y) u)) t.(listV)). 
  
Definition left_rotate_right_value
            (t : BinaryTreeType V) (x y u : V) : option V :=
  if V_eq_dec u x then t.(left_child) y
  else if V_eq_dec u y then t.(right_child) y
  else replace_child x y (t.(right_child) u).

Definition left_rotate_right_child
           (t : BinaryTreeType V) (x y : V) : V -> option V :=
  iter_override t.(right_child) (map (fun u => override_v_func u ((left_rotate_right_value t x y) u)) t.(listV)).

Definition left_rotate_root (t : BinaryTreeType V) (x y : V) : option V :=
  match t.(root) with
  | Some r => if V_eq_dec x r then Some y else Some r
  | None => None
  end.

Definition left_rotate (t : BinaryTreeType V) (x y : V) : BinaryTreeType V :=
  {|
    vset := t.(vset);
    theroot := left_rotate_root t x y;
    left_child := left_rotate_left_child t x y;
    right_child := left_rotate_right_child t x y;
    listV := t.(listV);
  |}.

Definition lr_child (t : BinaryTreeType V) (x y a b : V) : Prop :=
  left_rotate_left_child t x y a = Some b \/
  left_rotate_right_child t x y a = Some b.

Definition lr_path (t : BinaryTreeType V) (x y a b : V) : Prop :=
  clos_refl_trans (lr_child t x y) a b.

Lemma lr_child_source_valid :
  forall (t : BinaryTreeType V) (x y a b : V),
    gvalid t ->
    lr_child t x y a b ->
    t.(vset) a.
Proof.
  intros t x y a b Hvalid Hlr.
  unfold lr_child in Hlr.
  unfold left_rotate_left_child, left_rotate_right_child in Hlr.
  destruct (classic (In a t.(listV))) as [Hin | Hnin].
  - eapply listV_sound; eauto.
  - assert (Hnot_valid : ~ t.(vset) a).
    { intro Ha.
      apply Hnin.
      eapply finite_vertices; eauto. }
    destruct (invalid_child_is_none t Hvalid a Hnot_valid) as [Hleft Hright].
    destruct Hlr as [Hlr | Hlr].
    + rewrite iter_override_not_in in Hlr by exact Hnin.
      rewrite Hleft in Hlr. discriminate.
    + rewrite iter_override_not_in in Hlr by exact Hnin.
      rewrite Hright in Hlr. discriminate.
Qed.

Lemma bt_child_valid :
  forall (t : BinaryTreeType V) (a b : V),
    gvalid t ->
    t.(vset) a ->
    bt_child t a b ->
    t.(vset) b.
Proof.
  intros t a b Hvalid Ha Hchild.
  unfold bt_child in Hchild.
  eapply child_valid; eauto.
Qed.

Lemma bt_child_to_step :
  forall (t : BinaryTreeType V) (a b : V),
    gvalid t ->
    t.(vset) a ->
    bt_child t a b ->
    step t a b.
Proof.
  intros t a b Hvalid Ha Hchild.
  unfold step.
  exists b.
  refine {|
    bt_step_x_valid := Ha;
    bt_step_y_valid := _;
    bt_step_edge_equal := eq_refl;
    bt_step_child := Hchild
  |}.
  eapply bt_child_valid; eauto.
Qed.

Lemma bt_child_parent_unique :
  forall (t : BinaryTreeType V) (p q c : V),
    gvalid t ->
    t.(vset) p ->
    t.(vset) q ->
    bt_child t p c ->
    bt_child t q c ->
    p = q.
Proof.
  intros t p q c Hvalid Hp Hq Hpchild Hqchild.
  eapply father_unique; eauto.
Qed.

Lemma bt_child_parent_neq_false :
  forall (t : BinaryTreeType V) (p q c : V),
    gvalid t ->
    t.(vset) p ->
    t.(vset) q ->
    bt_child t p c ->
    bt_child t q c ->
    p <> q ->
    False.
Proof.
  intros t p q c Hvalid Hp Hq Hpchild Hqchild Hneq.
  apply Hneq.
  eapply bt_child_parent_unique; eauto.
Qed.

Lemma bt_path_to_reachable :
  forall (t : BinaryTreeType V) (a b : V),
    gvalid t ->
    t.(vset) a ->
    bt_path t a b ->
    reachable t a b.
Proof.
  intros t a b Hvalid Ha Hpath.
  unfold bt_path in Hpath.
  unfold reachable.
  induction_1n Hpath.
  - reflexivity.
  - transitivity_1n a0.
    + eapply bt_child_to_step; eauto.
    + apply IHrt; auto.
      eapply bt_child_valid; eauto.
Qed.

Lemma reachable_to_bt_path :
  forall (t : BinaryTreeType V) (a b : V),
    gvalid t ->
    reachable t a b ->
    bt_path t a b.
Proof.
  intros t a b Hvalid Hreach.
  unfold reachable in Hreach.
  unfold bt_path.
  induction_1n Hreach.
  - reflexivity.
  - transitivity_1n a0.
    + unfold bt_child.
      destruct H as [e Haux].
      destruct Haux as [_ _ _ Hchild].
      exact Hchild.
    + apply IHrt; auto.
Qed.

Lemma bt_child_no_back_path :
  forall (t : BinaryTreeType V) (a b : V),
    gvalid t ->
    t.(vset) a ->
    bt_child t a b ->
    ~ bt_path t b a.
Proof.
  intros t a b Hvalid Ha Hchild Hback.
  assert (Hstep : step t a b) by (eapply bt_child_to_step; eauto).
  assert (Hb : t.(vset) b) by (eapply bt_child_valid; eauto).
  assert (Hreach : reachable t b a) by (eapply bt_path_to_reachable; eauto).
  eapply (offspring_not_father (g:=t) (gvalid:=Hvalid) b a); eauto.
Qed.

Lemma bt_child_no_self :
  forall (t : BinaryTreeType V) (a : V),
    gvalid t ->
    t.(vset) a ->
    bt_child t a a ->
    False.
Proof.
  intros t a Hvalid Ha Hchild.
  assert (Hstep : step t a a) by (eapply bt_child_to_step; eauto).
  destruct Hstep as [e He].
  eapply (no_self_loop (g:=t) (gvalid:=Hvalid) a e); eauto.
Qed.

Lemma bt_left_right_same_false :
  forall (t : BinaryTreeType V) (a b : V),
    gvalid t ->
    t.(vset) a ->
    t.(left_child) a = Some b ->
    t.(right_child) a = Some b ->
    False.
Proof.
  intros t a b Hvalid Ha Hleft Hright.
  assert (Hb : t.(vset) b).
  { eapply bt_child_valid; eauto. unfold bt_child; left; exact Hleft. }
  eapply (child_distinct t Hvalid a b b); eauto.
Qed.

Lemma bt_child_no_two_cycle :
  forall (t : BinaryTreeType V) (a b : V),
    gvalid t ->
    t.(vset) a ->
    bt_child t a b ->
    bt_child t b a ->
    False.
Proof.
  intros t a b Hvalid Ha Hab Hba.
  eapply (bt_child_no_back_path t a b); eauto.
  unfold bt_path.
  transitivity_1n a.
  - exact Hba.
  - reflexivity.
Qed.

Lemma bt_sibling_not_child :
  forall (t : BinaryTreeType V) (p l r : V),
    gvalid t ->
    t.(vset) p ->
    t.(left_child) p = Some l ->
    t.(right_child) p = Some r ->
    bt_child t r l ->
    False.
Proof.
  intros t p l r Hvalid Hp Hleft Hright Hrchild.
  assert (Hl : t.(vset) l).
  { eapply (bt_child_valid t p l); eauto. unfold bt_child; left; exact Hleft. }
  assert (Hr : t.(vset) r).
  { eapply (bt_child_valid t p r); eauto. unfold bt_child; right; exact Hright. }
  assert (Hstep_pr : step t p r).
  { eapply (bt_child_to_step t p r); eauto. unfold bt_child; right; exact Hright. }
  assert (Hstep_pl : step t p l).
  { eapply (bt_child_to_step t p l); eauto. unfold bt_child; left; exact Hleft. }
  assert (Hstep_rl : step t r l).
  { eapply (bt_child_to_step t r l); eauto. }
  assert (Hneq : r <> l).
  { intro Heq; subst r.
    eapply (bt_left_right_same_false t p l); eauto. }
  assert (Hbro : brothers (g:=t) p r l).
  { unfold brothers. repeat split; auto. }
  eapply (brothers_not_offspring (g:=t) (gvalid:=Hvalid) r l p); eauto.
  unfold offspring. apply step_rt. exact Hstep_rl.
Qed.

Lemma lr_child_y_x :
  forall (t : BinaryTreeType V) (x y : V),
    gvalid t ->
    t.(vset) x ->
    t.(right_child) x = Some y ->
    lr_child t x y y x.
Proof.
  intros t x y Hvalid Hx Hxy.
  left.
  unfold left_rotate_left_child.
  assert (Hy : t.(vset) y).
  { eapply child_valid; eauto. }
  assert (Hy_in : In y t.(listV)) by (eapply finite_vertices; eauto).
  rewrite iter_override_in by exact Hy_in.
  unfold left_rotate_left_value.
  destruct (V_eq_dec y y); congruence.
Qed.

Lemma lr_child_x_left :
  forall (t : BinaryTreeType V) (x y b : V),
    gvalid t ->
    t.(vset) x ->
    t.(right_child) x = Some y ->
    t.(left_child) x = Some b ->
    lr_child t x y x b.
Proof.
  intros t x y b Hvalid Hx Hright Hleft.
  left.
  unfold left_rotate_left_child.
  assert (Hx_in : In x t.(listV)) by (eapply finite_vertices; eauto).
  assert (Hxy : x <> y).
  { intro Heq; subst y.
    assert (step t x x).
    { unfold step.
      exists x.
      refine {|
        bt_step_x_valid := Hx;
        bt_step_y_valid := Hx;
        bt_step_edge_equal := eq_refl;
        bt_step_child := or_intror Hright
      |}. }
    destruct H as [e He].
    eapply (no_self_loop (g:=t) (gvalid:=Hvalid) x e); eauto. }
  rewrite iter_override_in by exact Hx_in.
  unfold left_rotate_left_value.
  destruct (V_eq_dec x y) as [? | _]; [contradiction|].
  destruct (V_eq_dec x x); congruence.
Qed.

Lemma lr_child_x_y_left :
  forall (t : BinaryTreeType V) (x y b : V),
    gvalid t ->
    t.(vset) x ->
    t.(right_child) x = Some y ->
    t.(left_child) y = Some b ->
    lr_child t x y x b.
Proof.
  intros t x y b Hvalid Hx Hxy Hleft.
  right.
  unfold left_rotate_right_child.
  assert (Hx_in : In x t.(listV)) by (eapply finite_vertices; eauto).
  rewrite iter_override_in by exact Hx_in.
  unfold left_rotate_right_value.
  destruct (V_eq_dec x x); congruence.
Qed.

Lemma lr_child_y_right :
  forall (t : BinaryTreeType V) (x y b : V),
    gvalid t ->
    t.(vset) x ->
    t.(right_child) x = Some y ->
    t.(right_child) y = Some b ->
    lr_child t x y y b.
Proof.
  intros t x y b Hvalid Hx Hxy Hright.
  right.
  unfold left_rotate_right_child.
  assert (Hy : t.(vset) y).
  { eapply child_valid; eauto. }
  assert (Hy_in : In y t.(listV)) by (eapply finite_vertices; eauto).
  rewrite iter_override_in by exact Hy_in.
  unfold left_rotate_right_value.
  destruct (V_eq_dec y x) as [Hyx | _].
  - subst y.
    assert (step t x x).
    { unfold step.
      exists x.
      refine {|
        bt_step_x_valid := Hx;
        bt_step_y_valid := Hx;
        bt_step_edge_equal := eq_refl;
        bt_step_child := or_intror Hxy
      |}. }
    destruct H as [e He].
    exfalso; eapply (no_self_loop (g:=t) (gvalid:=Hvalid) x e); eauto.
  - destruct (V_eq_dec y y); congruence.
Qed.

Lemma lr_child_same :
  forall (t : BinaryTreeType V) (x y a b : V),
    gvalid t ->
    t.(vset) a ->
    a <> x ->
    a <> y ->
    b <> x ->
    bt_child t a b ->
    lr_child t x y a b.
Proof.
  intros t x y a b Hvalid Ha Hax Hay Hbx Hchild.
  assert (Ha_in : In a t.(listV)) by (eapply finite_vertices; eauto).
  unfold bt_child in Hchild.
  unfold lr_child.
  destruct Hchild as [Hleft | Hright].
  - left.
    unfold left_rotate_left_child.
    rewrite iter_override_in by exact Ha_in.
    unfold left_rotate_left_value, replace_child.
    destruct (V_eq_dec a y); [contradiction|].
    destruct (V_eq_dec a x); [contradiction|].
    rewrite Hleft.
    destruct (V_eq_dec b x); congruence.
  - right.
    unfold left_rotate_right_child.
    rewrite iter_override_in by exact Ha_in.
    unfold left_rotate_right_value, replace_child.
    destruct (V_eq_dec a x); [contradiction|].
    destruct (V_eq_dec a y); [contradiction|].
    rewrite Hright.
    destruct (V_eq_dec b x); congruence.
Qed.

Lemma lr_child_parent_to_y :
  forall (t : BinaryTreeType V) (x y a : V),
    gvalid t ->
    t.(vset) a ->
    a <> x ->
    a <> y ->
    bt_child t a x ->
    lr_child t x y a y.
Proof.
  intros t x y a Hvalid Ha Hax Hay Hchild.
  assert (Ha_in : In a t.(listV)) by (eapply finite_vertices; eauto).
  unfold bt_child in Hchild.
  unfold lr_child.
  destruct Hchild as [Hleft | Hright].
  - left.
    unfold left_rotate_left_child.
    rewrite iter_override_in by exact Ha_in.
    unfold left_rotate_left_value, replace_child.
    destruct (V_eq_dec a y); [contradiction|].
    destruct (V_eq_dec a x); [contradiction|].
    rewrite Hleft.
    destruct (V_eq_dec x x); congruence.
  - right.
    unfold left_rotate_right_child.
    rewrite iter_override_in by exact Ha_in.
    unfold left_rotate_right_value, replace_child.
    destruct (V_eq_dec a x); [contradiction|].
    destruct (V_eq_dec a y); [contradiction|].
    rewrite Hright.
    destruct (V_eq_dec x x); congruence.
Qed.

Lemma lr_path_away :
  forall (t : BinaryTreeType V) (x y a b : V),
    gvalid t ->
    t.(right_child) x = Some y ->
    t.(vset) a ->
    bt_path t a b ->
    ~ bt_path t a x ->
    ~ bt_path t a y ->
    lr_path t x y a b.
Proof.
  intros t x y a b Hvalid Hxy Ha Hpath Haway_x Haway_y.
  unfold bt_path in Hpath.
  unfold lr_path.
  induction_1n Hpath.
  - reflexivity.
  - assert (Ha0 : t.(vset) a0).
    { eapply bt_child_valid; eauto. }
    assert (Ha1_ne_x : a1 <> x).
    { intro Heq; subst; apply Haway_x; reflexivity. }
    assert (Ha1_ne_y : a1 <> y).
    { intro Heq; subst; apply Haway_y; reflexivity. }
    assert (Ha0_ne_x : a0 <> x).
    { intro Heq; subst.
      apply Haway_x.
      unfold bt_path.
      transitivity_1n x.
      - exact H.
      - reflexivity. }
    transitivity_1n a0.
    + eapply lr_child_same; eauto.
    + apply IHrt; auto.
      * intro Hcontra.
        apply Haway_x.
        unfold bt_path.
        transitivity_1n a0; auto.
      * intro Hcontra.
        apply Haway_y.
        unfold bt_path.
        transitivity_1n a0; auto.
Qed.

Lemma lr_path_from_y :
  forall (t : BinaryTreeType V) (x y v : V),
    gvalid t ->
    t.(vset) x ->
    t.(right_child) x = Some y ->
    bt_path t y v ->
    lr_path t x y y v.
Proof.
  intros t x y v Hvalid Hx Hxy Hpath.
  assert (Hy : t.(vset) y).
  { eapply child_valid; eauto. }
  unfold bt_path in Hpath.
  unfold lr_path.
  induction_1n Hpath.
  - reflexivity.
  - assert (Hy0 : t.(vset) y0).
    { eapply bt_child_valid; eauto. }
    destruct H as [Hleft | Hright].
    + transitivity_1n x.
      * eapply lr_child_y_x; eauto.
      * transitivity_1n y0.
        -- eapply lr_child_x_y_left; eauto.
        -- assert (Hy0v : bt_path t y0 v) by (unfold bt_path; exact Hpath).
           eapply (lr_path_away t x y y0 v); eauto.
           ++ intro Hcontra.
              assert (bt_path t y0 y).
              { unfold bt_path.
                etransitivity.
                - exact Hcontra.
                - transitivity_1n y.
                  + right; exact Hxy.
                  + reflexivity. }
              eapply (bt_child_no_back_path t y y0); eauto.
              left; exact Hleft.
           ++ intro Hcontra.
              eapply (bt_child_no_back_path t y y0); eauto.
              left; exact Hleft.
    + transitivity_1n y0.
      * eapply lr_child_y_right; eauto.
      * assert (Hy0v : bt_path t y0 v) by (unfold bt_path; exact Hpath).
        eapply (lr_path_away t x y y0 v); eauto.
        -- intro Hcontra.
           assert (bt_path t y0 y).
           { unfold bt_path.
             etransitivity.
             - exact Hcontra.
             - transitivity_1n y.
               + right; exact Hxy.
               + reflexivity. }
           eapply (bt_child_no_back_path t y y0); eauto.
           right; exact Hright.
        -- intro Hcontra.
           eapply (bt_child_no_back_path t y y0); eauto.
           right; exact Hright.
Qed.

Lemma lr_path_from_x :
  forall (t : BinaryTreeType V) (x y v : V),
    gvalid t ->
    t.(vset) x ->
    t.(right_child) x = Some y ->
    bt_path t x v ->
    lr_path t x y y v.
Proof.
  intros t x y v Hvalid Hx Hxy Hpath.
  unfold lr_path.
  destruct (V_eq_dec x v) as [Hxv | Hxv].
  - subst v.
    transitivity_1n x.
    + eapply lr_child_y_x; eauto.
    + reflexivity.
  - assert (Hreach : reachable t x v).
    { eapply bt_path_to_reachable; eauto. }
    destruct (real_offspring (g:=t) (gvalid:=Hvalid) x v Hreach Hxv)
      as [z [Hxz Hzv]].
    assert (Hzpath : bt_path t z v).
    { eapply reachable_to_bt_path; eauto. }
    destruct Hxz as [e Haux].
    destruct Haux as [_ _ _ Hchild].
    destruct Hchild as [Hleft | Hright].
    + transitivity_1n x.
      * eapply lr_child_y_x; eauto.
      * transitivity_1n z.
        -- eapply (lr_child_x_left t x y z).
           ++ exact Hvalid.
           ++ exact Hx.
           ++ exact Hxy.
           ++ exact Hleft.
        -- assert (Hz : t.(vset) z).
           { eapply bt_child_valid; eauto. left; exact Hleft. }
           eapply (lr_path_away t x y z v); eauto.
           ++ intro Hcontra.
              eapply (bt_child_no_back_path t x z); eauto.
              left; exact Hleft.
           ++ intro Hcontra.
              assert (Hzy_reach : offspring t z y).
              { unfold offspring. eapply bt_path_to_reachable; eauto. }
              assert (Hstep_xz : step t x z).
              { eapply bt_child_to_step; eauto. left; exact Hleft. }
              assert (Hstep_xy : step t x y).
              { eapply bt_child_to_step; eauto. right; exact Hxy. }
              assert (Hy : t.(vset) y).
              { eapply (bt_child_valid t x y); eauto. right; exact Hxy. }
              assert (Hzy_neq : z <> y).
              { eapply (child_distinct t Hvalid x z y); eauto. }
              assert (Hbro : brothers (g:=t) x z y).
              { unfold brothers. repeat split; auto. }
              eapply (brothers_not_offspring (g:=t) (gvalid:=Hvalid) z y x); eauto.
    + assert (z = y) by congruence.
      subst z.
      eapply lr_path_from_y; eauto.
Qed.

Lemma lr_path_to_y_from_path_to_x :
  forall (t : BinaryTreeType V) (x y a : V),
    gvalid t ->
    t.(vset) x ->
    t.(right_child) x = Some y ->
    t.(vset) a ->
    bt_path t a x ->
    a <> x ->
    a <> y ->
    lr_path t x y a y.
Proof.
  intros t x y a Hvalid Hx Hxy Ha Hpath Hax Hay.
  unfold bt_path in Hpath.
  unfold lr_path.
  induction_1n Hpath.
  - contradiction.
  - destruct (V_eq_dec a0 x) as [Ha0x | Ha0x].
    + subst a0.
      transitivity_1n y.
      * eapply lr_child_parent_to_y; eauto.
      * reflexivity.
    + assert (Ha0 : t.(vset) a0).
      { eapply bt_child_valid; eauto. }
      assert (Ha0y : a0 <> y).
      { intro Heq; subst a0.
        eapply (bt_child_no_back_path t x y); eauto.
        unfold bt_child; right; exact Hxy. }
      transitivity_1n a0.
      * eapply lr_child_same; eauto.
      * apply IHrt; auto.
Qed.

Lemma lr_path_not_in_x_subtree :
  forall (t : BinaryTreeType V) (x y a b : V),
    gvalid t ->
    t.(vset) x ->
    t.(right_child) x = Some y ->
    t.(vset) a ->
    bt_path t a b ->
    ~ bt_path t x b ->
    a <> x ->
    a <> y ->
    lr_path t x y a b.
Proof.
  intros t x y a b Hvalid Hx Hxy Ha Hpath Hnot_sub Hax Hay.
  unfold bt_path in Hpath.
  unfold lr_path.
  induction_1n Hpath.
  - reflexivity.
  - assert (Ha0 : t.(vset) a0).
    { eapply bt_child_valid; eauto. }
    assert (Ha0x : a0 <> x).
    { intro Heq; subst a0.
      apply Hnot_sub.
      unfold bt_path; exact Hpath. }
    assert (Ha0y : a0 <> y).
    { intro Heq; subst a0.
      apply Hnot_sub.
      unfold bt_path.
      transitivity_1n y.
      - unfold bt_child; right; exact Hxy.
      - exact Hpath. }
    transitivity_1n a0.
    + eapply lr_child_same; eauto.
    + apply IHrt; auto.
Qed.

Lemma lr_child_cases :
  forall (t : BinaryTreeType V) (x y a b : V),
    gvalid t ->
    t.(vset) x ->
    t.(right_child) x = Some y ->
    t.(vset) a ->
    lr_child t x y a b ->
    (a = y /\ b = x) \/
    (a = y /\ t.(right_child) y = Some b) \/
    (a = x /\ t.(left_child) x = Some b) \/
    (a = x /\ t.(left_child) y = Some b) \/
    (a <> x /\ a <> y /\
       ((bt_child t a b /\ b <> x) \/ (bt_child t a x /\ b = y))).
Proof.
  intros t x y a b Hvalid Hx Hxy Ha Hlr.
  assert (Hxy_neq : x <> y).
  { intro Heq; subst y.
    assert (step t x x).
    { unfold step.
      exists x.
      refine {|
        bt_step_x_valid := Hx;
        bt_step_y_valid := Hx;
        bt_step_edge_equal := eq_refl;
        bt_step_child := or_intror Hxy
      |}. }
    destruct H as [e He].
    eapply (no_self_loop (g:=t) (gvalid:=Hvalid) x e); eauto. }
  assert (Ha_in : In a t.(listV)) by (eapply finite_vertices; eauto).
  unfold lr_child in Hlr.
  unfold left_rotate_left_child, left_rotate_right_child in Hlr.
  rewrite !iter_override_in in Hlr by exact Ha_in.
  unfold left_rotate_left_value, left_rotate_right_value, replace_child in Hlr.
  destruct (V_eq_dec a y) as [Hay | Hay];
    destruct (V_eq_dec a x) as [Hax | Hax]; subst.
  - exfalso; apply Hxy_neq; reflexivity.
  - destruct Hlr as [Hlr | Hlr].
    + inversion Hlr; subst; auto.
    + right; left; split; auto.
  - destruct Hlr as [Hlr | Hlr].
    + right; right; left; split; auto.
    + right; right; right; left; split; auto.
  - destruct Hlr as [Hlr | Hlr].
    + destruct (t.(left_child) a) as [c |] eqn:Hchild; try discriminate.
      destruct (V_eq_dec c x) as [Hcx | Hcx]; inversion Hlr; subst.
      * right; right; right; right.
        repeat split; auto.
        right; split; auto.
        unfold bt_child; left; exact Hchild.
      * right; right; right; right.
        repeat split; auto.
        left; split; auto.
        unfold bt_child; left; exact Hchild.
    + destruct (V_eq_dec a x) as [? | _]; [contradiction|].
      destruct (V_eq_dec a y) as [? | _]; [contradiction|].
      destruct (t.(right_child) a) as [c |] eqn:Hchild; try discriminate.
      destruct (V_eq_dec c x) as [Hcx | Hcx]; inversion Hlr; subst.
      * right; right; right; right.
        repeat split; auto.
        right; split; auto.
        unfold bt_child; right; exact Hchild.
      * right; right; right; right.
        repeat split; auto.
        left; split; auto.
        unfold bt_child; right; exact Hchild.
  all: try solve [auto | tauto | congruence].
Qed.

Lemma lr_child_no_new_root :
  forall (t : BinaryTreeType V) (x y a r : V),
    gvalid t ->
    t.(vset) x ->
    t.(right_child) x = Some y ->
    left_rotate_root t x y = Some r ->
    ~ lr_child t x y a r.
Proof.
  intros t x y a r Hvalid Hx Hxy Hnew_root Hlr.
  assert (Hy : t.(vset) y).
  { eapply bt_child_valid; eauto. right; exact Hxy. }
  assert (Hxy_neq : x <> y).
  { intro Heq; subst y.
    eapply (bt_child_no_self t x); eauto.
    right; exact Hxy. }
  assert (Ha : t.(vset) a).
  { eapply lr_child_source_valid; eauto. }
  unfold left_rotate_root in Hnew_root.
  destruct t.(root) as [old_root |] eqn:Hroot; [|discriminate].
  destruct (V_eq_dec x old_root) as [Hxroot | Hxroot].
  - inversion Hnew_root; subst r. subst old_root.
    pose proof (lr_child_cases t x y a y Hvalid Hx Hxy Ha Hlr) as Hcases.
    destruct Hcases as [[? ?]|[[? ?]|[[? ?]|[[? ?]|[?[?[Hold|Hold]]]]]]];
      subst; try congruence.
    + eapply bt_child_no_self; eauto.
      unfold bt_child; right; exact H0.
    + exfalso.
      eapply (child_distinct t Hvalid x y y); eauto; reflexivity.
    + eapply (bt_child_no_self t y); eauto.
      unfold bt_child; left; exact H0.
    + destruct Hold as [Hold _].
      assert (a = x).
      { eapply (father_unique t Hvalid y a x).
        + exact Ha.
        + exact Hx.
        + exact Hold.
        + right; exact Hxy. }
      subst; contradiction.
    + destruct Hold as [Hold Hb]; subst.
      pose proof (root_no_parents t Hvalid a x Hroot) as [HnL HnR].
      unfold bt_child in Hold; destruct Hold; contradiction.
  - inversion Hnew_root; subst r.
    pose proof (lr_child_cases t x y a old_root Hvalid Hx Hxy Ha Hlr) as Hcases.
    destruct Hcases as [[? ?]|[[? ?]|[[? ?]|[[? ?]|[?[?[Hold|Hold]]]]]]];
      subst; try congruence.
    + pose proof (root_no_parents t Hvalid y old_root Hroot) as [_ HnR].
      contradiction.
    + pose proof (root_no_parents t Hvalid x old_root Hroot) as [HnL _].
      contradiction.
    + pose proof (root_no_parents t Hvalid y old_root Hroot) as [HnL _].
      contradiction.
    + destruct Hold as [Hold _].
      pose proof (root_no_parents t Hvalid a old_root Hroot) as [HnL HnR].
      unfold bt_child in Hold; destruct Hold; contradiction.
    + destruct Hold as [_ Hb]; subst.
      pose proof (root_no_parents t Hvalid x y Hroot) as [_ HnR].
      contradiction.
Qed.

Lemma left_rotate_preserves_gvalid :
  forall (t : BinaryTreeType V) (x y : V),
    gvalid t ->
    t.(vset) x ->
    t.(right_child) x = Some y ->
    gvalid (left_rotate t x y).
Proof.
  intros t x y Hvalid Hx Hxy.
  assert (Hy : t.(vset) y).
  { eapply bt_child_valid; eauto. right; exact Hxy. }
  assert (Hxy_neq : x <> y).
  { intro Heq; subst y.
    assert (step t x x).
    { eapply bt_child_to_step; eauto. right; exact Hxy. }
    destruct H as [e He].
    eapply (no_self_loop (g:=t) (gvalid:=Hvalid) x e); eauto. }
  unfold gvalid, Binarytree_gvalid.
  constructor; simpl.
  - intros r Hroot_new.
    unfold left_rotate_root in Hroot_new.
    destruct t.(root) as [old_root |] eqn:Hroot; [|discriminate].
    destruct (V_eq_dec x old_root) as [Hxroot | Hxroot].
    + inversion Hroot_new; subst. exact Hy.
    + inversion Hroot_new; subst.
      eapply root_valid; eauto.
  - intros v r Hroot_new.
    split; intro Hbad.
    + eapply (lr_child_no_new_root t x y v); eauto.
      unfold lr_child; left; exact Hbad.
    + eapply (lr_child_no_new_root t x y v); eauto.
      unfold lr_child; right; exact Hbad.
  - intros z a b Ha Hb Ha_edge Hb_edge.
    assert (Ha_cases := lr_child_cases t x y a z Hvalid Hx Hxy Ha Ha_edge).
    assert (Hb_cases := lr_child_cases t x y b z Hvalid Hx Hxy Hb Hb_edge).
    destruct Ha_cases as [[? ?]|[[? ?]|[[? ?]|[[? ?]|[?[?[Ha_old|Ha_old]]]]]]];
    destruct Hb_cases as [[? ?]|[[? ?]|[[? ?]|[[? ?]|[?[?[Hb_old|Hb_old]]]]]]];
    subst; try reflexivity; try congruence;
      try (destruct Ha_old as [Ha_old ?]);
      try (destruct Hb_old as [Hb_old ?]);
      try (destruct Ha_old as [Ha_old ->]);
      try (destruct Hb_old as [Hb_old ->]);
      try contradiction; try congruence;
      try match goal with
      | H1 : left_child t ?u = Some ?v,
        H2 : right_child t ?u = Some ?v |- _ =>
          exfalso;
          assert (Hv_tmp : t.(vset) v)
            by (eapply bt_child_valid; eauto; unfold bt_child; left; exact H1);
          pose proof (child_distinct t Hvalid u v v) as Hneq_tmp;
          specialize (Hneq_tmp ltac:(eauto) Hv_tmp Hv_tmp H1 H2);
          apply Hneq_tmp; reflexivity
      | H1 : right_child t ?u = Some ?v,
        H2 : left_child t ?u = Some ?v |- _ =>
          exfalso;
          assert (Hv_tmp : t.(vset) v)
            by (eapply bt_child_valid; eauto; unfold bt_child; left; exact H2);
          pose proof (child_distinct t Hvalid u v v) as Hneq_tmp;
          specialize (Hneq_tmp ltac:(eauto) Hv_tmp Hv_tmp H2 H1);
          apply Hneq_tmp; reflexivity
      | H1 : t.(left_child) ?u = Some ?v,
        H2 : t.(right_child) ?u = Some ?v |- _ =>
          exfalso;
          assert (Hv_tmp : t.(vset) v)
            by (eapply bt_child_valid; eauto; unfold bt_child; left; exact H1);
          pose proof (child_distinct t Hvalid u v v) as Hneq_tmp;
          specialize (Hneq_tmp ltac:(eauto) Hv_tmp Hv_tmp H1 H2);
          apply Hneq_tmp; reflexivity
      | H1 : t.(right_child) ?u = Some ?v,
        H2 : t.(left_child) ?u = Some ?v |- _ =>
          exfalso;
          assert (Hv_tmp : t.(vset) v)
            by (eapply bt_child_valid; eauto; unfold bt_child; left; exact H2);
          pose proof (child_distinct t Hvalid u v v) as Hneq_tmp;
          specialize (Hneq_tmp ltac:(eauto) Hv_tmp Hv_tmp H2 H1);
          apply Hneq_tmp; reflexivity
      | H : t.(left_child) ?u = Some ?u |- _ =>
          exfalso; eapply (bt_child_no_self t u); eauto;
          unfold bt_child; left; exact H
      | H : t.(right_child) ?u = Some ?u |- _ =>
          exfalso; eapply (bt_child_no_self t u); eauto;
          unfold bt_child; right; exact H
      | H1 : t.(left_child) ?u = Some ?v,
        H2 : t.(left_child) ?v = Some ?u |- _ =>
          exfalso; eapply (bt_child_no_two_cycle t u v); eauto;
          [unfold bt_child; left; exact H1 | unfold bt_child; left; exact H2]
      | H1 : t.(left_child) ?u = Some ?v,
        H2 : t.(right_child) ?v = Some ?u |- _ =>
          exfalso; eapply (bt_child_no_two_cycle t u v); eauto;
          [unfold bt_child; left; exact H1 | unfold bt_child; right; exact H2]
      | H1 : t.(right_child) ?u = Some ?v,
        H2 : t.(left_child) ?v = Some ?u |- _ =>
          exfalso; eapply (bt_child_no_two_cycle t u v); eauto;
          [unfold bt_child; right; exact H1 | unfold bt_child; left; exact H2]
      | H1 : t.(right_child) ?u = Some ?v,
        H2 : t.(right_child) ?v = Some ?u |- _ =>
          exfalso; eapply (bt_child_no_two_cycle t u v); eauto;
          [unfold bt_child; right; exact H1 | unfold bt_child; right; exact H2]
      end;
      try solve [
        eapply father_unique; eauto;
        try eassumption;
        try (left; eassumption);
        try (right; eassumption)
      ].
      all: try solve [
        congruence
      | contradiction
      | exfalso; eapply (bt_left_right_same_false t y z); eauto
      | exfalso; eapply (bt_left_right_same_false t x z); eauto
      | exfalso; eapply (bt_left_right_same_false t a z); eauto
      | exfalso; eapply (bt_left_right_same_false t b z); eauto
      | subst; exfalso; eapply (bt_left_right_same_false t x y); eauto
      | subst; exfalso; eapply (bt_left_right_same_false t y x); eauto
      | subst; exfalso; eapply (bt_left_right_same_false t a x); eauto
      | subst; exfalso; eapply (bt_left_right_same_false t a y); eauto
      | subst; exfalso; eapply (bt_left_right_same_false t b x); eauto
      | subst; exfalso; eapply (bt_left_right_same_false t b y); eauto
      | subst; exfalso; eapply (bt_child_no_self t x); eauto; unfold bt_child; eauto
      | subst; exfalso; eapply (bt_child_no_self t y); eauto; unfold bt_child; eauto
      | exfalso; eapply (bt_child_no_two_cycle t x y); eauto; unfold bt_child; eauto
      | exfalso; eapply (bt_child_no_two_cycle t y x); eauto; unfold bt_child; eauto
      | exfalso; eapply (bt_child_no_two_cycle t a x); eauto; unfold bt_child; eauto
      | exfalso; eapply (bt_child_no_two_cycle t a y); eauto; unfold bt_child; eauto
      | exfalso; eapply (bt_child_no_two_cycle t b x); eauto; unfold bt_child; eauto
      | exfalso; eapply (bt_child_no_two_cycle t b y); eauto; unfold bt_child; eauto
      | exfalso; eapply (bt_sibling_not_child t x z y); eauto; unfold bt_child; eauto
      | exfalso; eapply (bt_sibling_not_child t x y z); eauto; unfold bt_child; eauto
      | exfalso; eapply (bt_sibling_not_child t a z y); eauto; unfold bt_child; eauto
      | exfalso; eapply (bt_sibling_not_child t a y z); eauto; unfold bt_child; eauto
      | exfalso; eapply (bt_sibling_not_child t b z y); eauto; unfold bt_child; eauto
      | exfalso; eapply (bt_sibling_not_child t b y z); eauto; unfold bt_child; eauto
      | match goal with
        | Hleft : ?tt.(left_child) ?u = Some ?v,
          Hright : ?tt.(right_child) ?u = Some ?v |- _ =>
            exfalso;
            assert (Hv_tmp : tt.(vset) v)
              by (eapply bt_child_valid; eauto; unfold bt_child; left; exact Hleft);
            pose proof (child_distinct tt Hvalid u v v) as Hneq_tmp;
            specialize (Hneq_tmp ltac:(eauto) Hv_tmp Hv_tmp Hleft Hright);
            apply Hneq_tmp; reflexivity
        | Hright : ?tt.(right_child) ?u = Some ?v,
          Hleft : ?tt.(left_child) ?u = Some ?v |- _ =>
            exfalso;
            assert (Hv_tmp : tt.(vset) v)
              by (eapply bt_child_valid; eauto; unfold bt_child; left; exact Hleft);
            pose proof (child_distinct tt Hvalid u v v) as Hneq_tmp;
            specialize (Hneq_tmp ltac:(eauto) Hv_tmp Hv_tmp Hleft Hright);
            apply Hneq_tmp; reflexivity
        end
      | exfalso; eapply child_distinct; eauto;
        try (eapply bt_child_valid; eauto; unfold bt_child; eauto);
        try eassumption; reflexivity
      | exfalso; eapply bt_left_right_same_false; eauto
      | exfalso; eapply bt_child_no_self; eauto; unfold bt_child; eauto
      | exfalso; eapply bt_child_no_two_cycle; eauto; unfold bt_child; eauto
      | eapply father_unique; eauto;
        try eassumption;
        try (left; eassumption);
        try (right; eassumption)
      | eapply bt_child_parent_unique; eauto; unfold bt_child; eauto
      | symmetry; eapply bt_child_parent_unique; eauto; unfold bt_child; eauto
      | exfalso; eapply bt_child_parent_neq_false; eauto; unfold bt_child; eauto
      | subst; exfalso; eapply bt_child_parent_neq_false; eauto; unfold bt_child; eauto
      | exfalso; match goal with
        | Hneq : ?p <> ?q,
          Hchild1 : bt_child ?tt ?p ?c,
          Hchild2 : bt_child ?tt ?q ?c |- _ =>
            eapply (bt_child_parent_neq_false tt p q c); eauto
        end
      | exfalso; match goal with
        | Hneq : ?p <> ?q,
          Hchild1 : bt_child ?tt ?p ?c,
          Hleft : ?tt.(left_child) ?q = Some ?c |- _ =>
            eapply (bt_child_parent_neq_false tt p q c); eauto;
            unfold bt_child; eauto
        end
      | exfalso; match goal with
        | Hneq : ?p <> ?q,
          Hchild1 : bt_child ?tt ?p ?c,
          Hright : ?tt.(right_child) ?q = Some ?c |- _ =>
            eapply (bt_child_parent_neq_false tt p q c); eauto;
            unfold bt_child; eauto
        end
      | subst; exfalso; match goal with
        | Hneq : ?p <> ?q,
          Hchild1 : bt_child ?tt ?p ?c,
          Hchild2 : bt_child ?tt ?q ?c |- _ =>
            eapply (bt_child_parent_neq_false tt p q c); eauto
        end
      | subst; exfalso; match goal with
        | Hneq : ?p <> ?q,
          Hchild1 : bt_child ?tt ?p ?c,
          Hleft : ?tt.(left_child) ?q = Some ?c |- _ =>
            eapply (bt_child_parent_neq_false tt p q c); eauto;
            unfold bt_child; eauto
        end
      | subst; exfalso; match goal with
        | Hneq : ?p <> ?q,
          Hchild1 : bt_child ?tt ?p ?c,
          Hright : ?tt.(right_child) ?q = Some ?c |- _ =>
            eapply (bt_child_parent_neq_false tt p q c); eauto;
            unfold bt_child; eauto
        end
      | eapply father_unique; eauto; [left; eassumption | eassumption]
      | eapply father_unique; eauto; [right; eassumption | eassumption]
      | eapply father_unique; eauto; [eassumption | left; eassumption]
      | eapply father_unique; eauto; [eassumption | right; eassumption]
      | symmetry; eapply father_unique; eauto; [left; eassumption | eassumption]
      | symmetry; eapply father_unique; eauto; [right; eassumption | eassumption]
      | symmetry; eapply father_unique; eauto; [eassumption | left; eassumption]
      | symmetry; eapply father_unique; eauto; [eassumption | right; eassumption]
      | exfalso; match goal with
        | Hneq : ?b <> ?yy, Hchild : bt_child ?tt ?b ?zz,
          Hleft : ?tt.(left_child) ?yy = Some ?zz |- _ =>
            apply Hneq; eapply (father_unique tt Hvalid zz b yy); eauto;
            [exact Hchild | left; exact Hleft]
        end
      | exfalso; match goal with
        | Hneq : ?a <> ?yy, Hchild : bt_child ?tt ?a ?zz,
          Hleft : ?tt.(left_child) ?yy = Some ?zz |- _ =>
            apply Hneq; eapply (father_unique tt Hvalid zz a yy); eauto;
            [exact Hchild | left; exact Hleft]
        end
      ].
  - intros a b Ha Hedge.
    destruct (lr_child_cases t x y a b Hvalid Hx Hxy Ha Hedge)
      as [[? ?]|[[? ?]|[[? ?]|[[? ?]|[?[?[Hold|Hold]]]]]]]; subst; auto.
    + eapply bt_child_valid; eauto. right; eassumption.
    + eapply bt_child_valid; eauto. left; eassumption.
    + eapply (bt_child_valid t y b); eauto. left; eassumption.
    + destruct Hold as [Hold _].
      eapply bt_child_valid; eauto.
    + destruct Hold as [Hold ->].
      exact Hy.
  - intros v Hv.
    assert (Hnin : ~ In v t.(listV)).
    { intro Hin.
      apply Hv.
      eapply listV_sound; eauto. }
    destruct (invalid_child_is_none t Hvalid v Hv) as [Hleft_old Hright_old].
    split.
    + unfold left_rotate_left_child.
      rewrite iter_override_not_in by exact Hnin.
      exact Hleft_old.
    + unfold left_rotate_right_child.
      rewrite iter_override_not_in by exact Hnin.
      exact Hright_old.
  - intros a b c Ha Hb Hc Hleft Hright.
    unfold left_rotate_left_child, left_rotate_right_child in Hleft, Hright.
    assert (Ha_in : In a t.(listV)) by (eapply finite_vertices; eauto).
    rewrite iter_override_in in Hleft by exact Ha_in.
    rewrite iter_override_in in Hright by exact Ha_in.
    unfold left_rotate_left_value, left_rotate_right_value, replace_child in Hleft, Hright.
    destruct (V_eq_dec a y) as [Hay | Hay].
    + subst a.
      destruct (V_eq_dec y x) as [Hyx | Hyx]; [subst; contradiction|].
      destruct (V_eq_dec y y) as [_ | Hyy]; [|contradiction].
      inversion Hleft; subst b.
      destruct (t.(right_child) y) as [yr |] eqn:Hyr; [|discriminate].
      inversion Hright; subst c.
      intro Heq; subst yr.
      eapply (bt_child_no_two_cycle t x y); eauto.
      * unfold bt_child; right; exact Hxy.
      * unfold bt_child; right; exact Hyr.
    + destruct (V_eq_dec a x) as [Hax | Hax].
      * subst a.
        destruct (V_eq_dec x y) as [Hxy_eq | _]; [contradiction|].
        destruct (V_eq_dec x x) as [_ | Hxx]; [|contradiction].
        destruct (t.(left_child) x) as [xl |] eqn:Hxl; [|discriminate].
        inversion Hleft; subst b.
        destruct (t.(left_child) y) as [yl |] eqn:Hyl; [|discriminate].
        inversion Hright; subst c.
        intro Heq; subst yl.
        assert (x = y).
        { eapply (father_unique t Hvalid xl x y); eauto;
            unfold bt_child; eauto. }
        contradiction.
      * destruct (t.(left_child) a) as [lc |] eqn:Hlc; [|discriminate].
        destruct (V_eq_dec lc x) as [Hlcx | Hlcx]; inversion Hleft; subst b.
        { destruct (V_eq_dec a x) as [? | _]; [contradiction|].
           destruct (V_eq_dec a y) as [? | _]; [contradiction|].
           destruct (t.(right_child) a) as [rc |] eqn:Hrc; [|discriminate].
           destruct (V_eq_dec rc x) as [Hrcx | Hrcx]; inversion Hright; subst c.
           - subst lc rc.
              intro Hcontra.
              eapply (bt_left_right_same_false t a x); eauto.
           - subst lc.
              intro Heq; subst rc.
              assert (a = x).
              { eapply (father_unique t Hvalid y a x); eauto. }
              contradiction. }
        { destruct (V_eq_dec a x) as [? | _]; [contradiction|].
           destruct (V_eq_dec a y) as [? | _]; [contradiction|].
           destruct (t.(right_child) a) as [rc |] eqn:Hrc; [|discriminate].
           destruct (V_eq_dec rc x) as [Hrcx | Hrcx]; inversion Hright; subst c.
           - subst rc.
              intro Heq; subst lc.
              assert (a = x).
              { eapply (father_unique t Hvalid y a x); eauto. }
              contradiction.
           - intro Heq; subst rc.
             eapply (child_distinct t Hvalid a lc lc); eauto. }
  - intros v Hv.
    destruct (path_exists t Hvalid v Hv) as [r [Hrroot Hrv]].
    exists (if V_eq_dec x r then y else r).
    split.
    + unfold left_rotate_root.
      rewrite Hrroot.
      destruct (V_eq_dec x r); reflexivity.
    + destruct (V_eq_dec x r) as [Hxroot | Hxroot].
      * subst r.
        eapply lr_path_from_x; eauto.
      * assert (Hr : t.(vset) r).
        { eapply root_valid; eauto. }
        assert (Hr_ne_y : r <> y).
        { intro Hry; subst r.
          pose proof (root_no_parents t Hvalid x y Hrroot) as [_ HnR].
          contradiction. }
        destruct (path_exists t Hvalid x Hx) as [rx [Hrxroot Hrx]].
        rewrite Hrroot in Hrxroot.
        inversion Hrxroot; subst rx.
        change (bt_path t r x) in Hrx.
        change (bt_path t r v) in Hrv.
        destruct (classic (bt_path t x v)) as [Hxv | Hxv].
        -- assert (Hroot_y : lr_path t x y r y).
           { eapply lr_path_to_y_from_path_to_x; eauto. }
           unfold lr_path in *.
           etransitivity.
           ++ exact Hroot_y.
           ++ eapply lr_path_from_x; eauto.
        -- eapply lr_path_not_in_x_subtree; eauto.
  - intros v Hv.
    eapply finite_vertices; eauto.
  - intros v Hv.
    eapply listV_sound; eauto.
  - apply listV_NoDup; auto.
Qed.

End LEFT_ROTATION.

Section RIGHT_ROTATION.

Definition right_rotate_left_child_value
            (t : BinaryTreeType V) (x y u : V) : option V :=
if V_eq_dec u x then t.(right_child) y
else if V_eq_dec u y then t.(left_child) y
else replace_child x y (t.(left_child) u).

Definition right_rotate_left_child
           (t : BinaryTreeType V) (x y: V) : V -> option V :=
  iter_override t.(left_child) (map (fun u => override_v_func u ((right_rotate_left_child_value t x y) u)) t.(listV)).

Definition right_rotate_right_child_value
            (t : BinaryTreeType V) (x y u : V) : option V :=
  if V_eq_dec u y then Some x
  else if V_eq_dec u x then t.(right_child) x
  else replace_child x y (t.(right_child) u).

Definition right_rotate_right_child
           (t : BinaryTreeType V) (x y: V) : V -> option V :=
  iter_override t.(right_child) (map (fun u => override_v_func u ((right_rotate_right_child_value t x y) u)) t.(listV)).

Definition right_rotate_root (t : BinaryTreeType V) (x y : V) : option V :=
  match t.(root) with
  | Some r => if V_eq_dec x r then Some y else Some r
  | None => None
  end.

Definition right_rotate (t : BinaryTreeType V) (x y : V) : BinaryTreeType V :=
  {|
    vset := t.(vset);
    theroot := right_rotate_root t x y;
    right_child := right_rotate_right_child t x y;
    left_child := right_rotate_left_child t x y;
    listV := t.(listV);
  |}.

Definition rr_child (t : BinaryTreeType V) (x y a b : V) : Prop :=
  right_rotate_left_child t x y a = Some b \/
  right_rotate_right_child t x y a = Some b.

Definition rr_path (t : BinaryTreeType V) (x y a b : V) : Prop :=
  clos_refl_trans (rr_child t x y) a b.

Lemma rr_child_source_valid :
  forall (t : BinaryTreeType V) (x y a b : V),
    gvalid t ->
    rr_child t x y a b ->
    t.(vset) a.
Proof.
  intros t x y a b Hvalid Hrr.
  unfold rr_child in Hrr.
  unfold right_rotate_right_child, right_rotate_left_child in Hrr.
  destruct (classic (In a t.(listV))) as [Hin | Hnin].
  - eapply listV_sound; eauto.
  - assert (Hnot_valid : ~ t.(vset) a).
    { intro Ha.
      apply Hnin.
      eapply finite_vertices; eauto. }
    destruct (invalid_child_is_none t Hvalid a Hnot_valid) as [Hleft Hright].
    destruct Hrr as [Hrr | Hrr].
    + rewrite iter_override_not_in in Hrr by exact Hnin.
      rewrite Hleft in Hrr. discriminate.
    + rewrite iter_override_not_in in Hrr by exact Hnin.
      rewrite Hright in Hrr. discriminate.
Qed.

Lemma rr_bt_child_valid :
  forall (t : BinaryTreeType V) (a b : V),
    gvalid t ->
    t.(vset) a ->
    bt_child t a b ->
    t.(vset) b.
Proof.
  intros t a b Hvalid Ha Hchild.
  unfold bt_child in Hchild.
  eapply child_valid; eauto.
Qed.

Lemma rr_bt_child_to_step :
  forall (t : BinaryTreeType V) (a b : V),
    gvalid t ->
    t.(vset) a ->
    bt_child t a b ->
    step t a b.
Proof.
  intros t a b Hvalid Ha Hchild.
  unfold step.
  exists b.
  refine {|
    bt_step_x_valid := Ha;
    bt_step_y_valid := _;
    bt_step_edge_equal := eq_refl;
    bt_step_child := Hchild
  |}.
  eapply rr_bt_child_valid; eauto.
Qed.

Lemma rr_bt_child_parent_unique :
  forall (t : BinaryTreeType V) (p q c : V),
    gvalid t ->
    t.(vset) p ->
    t.(vset) q ->
    bt_child t p c ->
    bt_child t q c ->
    p = q.
Proof.
  intros t p q c Hvalid Hp Hq Hpchild Hqchild.
  eapply father_unique; eauto.
Qed.

Lemma rr_bt_child_parent_neq_false :
  forall (t : BinaryTreeType V) (p q c : V),
    gvalid t ->
    t.(vset) p ->
    t.(vset) q ->
    bt_child t p c ->
    bt_child t q c ->
    p <> q ->
    False.
Proof.
  intros t p q c Hvalid Hp Hq Hpchild Hqchild Hneq.
  apply Hneq.
  eapply rr_bt_child_parent_unique; eauto.
Qed.

Lemma rr_bt_path_to_reachable :
  forall (t : BinaryTreeType V) (a b : V),
    gvalid t ->
    t.(vset) a ->
    bt_path t a b ->
    reachable t a b.
Proof.
  intros t a b Hvalid Ha Hpath.
  unfold bt_path in Hpath.
  unfold reachable.
  induction_1n Hpath.
  - reflexivity.
  - transitivity_1n a0.
    + eapply rr_bt_child_to_step; eauto.
    + apply IHrt; auto.
      eapply rr_bt_child_valid; eauto.
Qed.

Lemma rr_reachable_to_bt_path :
  forall (t : BinaryTreeType V) (a b : V),
    gvalid t ->
    reachable t a b ->
    bt_path t a b.
Proof.
  intros t a b Hvalid Hreach.
  unfold reachable in Hreach.
  unfold bt_path.
  induction_1n Hreach.
  - reflexivity.
  - transitivity_1n a0.
    + unfold bt_child.
      destruct H as [e Haux].
      destruct Haux as [_ _ _ Hchild].
      exact Hchild.
    + apply IHrt; auto.
Qed.

Lemma rr_bt_child_no_back_path :
  forall (t : BinaryTreeType V) (a b : V),
    gvalid t ->
    t.(vset) a ->
    bt_child t a b ->
    ~ bt_path t b a.
Proof.
  intros t a b Hvalid Ha Hchild Hback.
  assert (Hstep : step t a b) by (eapply rr_bt_child_to_step; eauto).
  assert (Hb : t.(vset) b) by (eapply rr_bt_child_valid; eauto).
  assert (Hreach : reachable t b a) by (eapply rr_bt_path_to_reachable; eauto).
  eapply (offspring_not_father (g:=t) (gvalid:=Hvalid) b a); eauto.
Qed.

Lemma rr_bt_child_no_self :
  forall (t : BinaryTreeType V) (a : V),
    gvalid t ->
    t.(vset) a ->
    bt_child t a a ->
    False.
Proof.
  intros t a Hvalid Ha Hchild.
  assert (Hstep : step t a a) by (eapply rr_bt_child_to_step; eauto).
  destruct Hstep as [e He].
  eapply (no_self_loop (g:=t) (gvalid:=Hvalid) a e); eauto.
Qed.

Lemma rr_bt_right_left_same_false :
  forall (t : BinaryTreeType V) (a b : V),
    gvalid t ->
    t.(vset) a ->
    t.(right_child) a = Some b ->
    t.(left_child) a = Some b ->
    False.
Proof.
  intros t a b Hvalid Ha Hright Hleft.
  assert (Hb : t.(vset) b).
  { eapply rr_bt_child_valid; eauto. unfold bt_child; right; exact Hright. }
  eapply (child_distinct t Hvalid a b b); eauto.
Qed.

Lemma rr_bt_child_no_two_cycle :
  forall (t : BinaryTreeType V) (a b : V),
    gvalid t ->
    t.(vset) a ->
    bt_child t a b ->
    bt_child t b a ->
    False.
Proof.
  intros t a b Hvalid Ha Hab Hba.
  eapply (rr_bt_child_no_back_path t a b); eauto.
  unfold bt_path.
  transitivity_1n a.
  - exact Hba.
  - reflexivity.
Qed.

Lemma rr_bt_sibling_not_child :
  forall (t : BinaryTreeType V) (p l r : V),
    gvalid t ->
    t.(vset) p ->
    t.(right_child) p = Some l ->
    t.(left_child) p = Some r ->
    bt_child t r l ->
    False.
Proof.
  intros t p l r Hvalid Hp Hright Hleft Hrchild.
  assert (Hl : t.(vset) l).
  { eapply (rr_bt_child_valid t p l); eauto. unfold bt_child; right; exact Hright. }
  assert (Hr : t.(vset) r).
  { eapply (rr_bt_child_valid t p r); eauto. unfold bt_child; left; exact Hleft. }
  assert (Hstep_pr : step t p r).
  { eapply (rr_bt_child_to_step t p r); eauto. unfold bt_child; left; exact Hleft. }
  assert (Hstep_pl : step t p l).
  { eapply (rr_bt_child_to_step t p l); eauto. unfold bt_child; right; exact Hright. }
  assert (Hstep_rl : step t r l).
  { eapply (rr_bt_child_to_step t r l); eauto. }
  assert (Hneq : r <> l).
  { intro Heq; subst r.
    eapply (rr_bt_right_left_same_false t p l); eauto. }
  assert (Hbro : brothers (g:=t) p r l).
  { unfold brothers. repeat split; auto. }
  eapply (brothers_not_offspring (g:=t) (gvalid:=Hvalid) r l p); eauto.
  unfold offspring. apply step_rt. exact Hstep_rl.
Qed.

Lemma rr_child_y_x :
  forall (t : BinaryTreeType V) (x y : V),
    gvalid t ->
    t.(vset) x ->
    t.(left_child) x = Some y ->
    rr_child t x y y x.
Proof.
  intros t x y Hvalid Hx Hxy.
  right.
  unfold right_rotate_right_child.
  assert (Hy : t.(vset) y).
  { eapply child_valid; eauto. }
  assert (Hy_in : In y t.(listV)) by (eapply finite_vertices; eauto).
  rewrite iter_override_in by exact Hy_in.
  unfold right_rotate_right_child_value.
  destruct (V_eq_dec y y); congruence.
Qed.

Lemma rr_child_x_right :
  forall (t : BinaryTreeType V) (x y b : V),
    gvalid t ->
    t.(vset) x ->
    t.(left_child) x = Some y ->
    t.(right_child) x = Some b ->
    rr_child t x y x b.
Proof.
  intros t x y b Hvalid Hx Hleft Hright.
  right.
  unfold right_rotate_right_child.
  assert (Hx_in : In x t.(listV)) by (eapply finite_vertices; eauto).
  assert (Hxy : x <> y).
  { intro Heq; subst y.
    assert (step t x x).
    { unfold step.
      exists x.
      refine {|
        bt_step_x_valid := Hx;
        bt_step_y_valid := Hx;
        bt_step_edge_equal := eq_refl;
        bt_step_child := or_introl Hleft
      |}. }
    destruct H as [e He].
    eapply (no_self_loop (g:=t) (gvalid:=Hvalid) x e); eauto. }
  rewrite iter_override_in by exact Hx_in.
  unfold right_rotate_right_child_value.
  destruct (V_eq_dec x y) as [? | _]; [contradiction|].
  destruct (V_eq_dec x x); congruence.
Qed.

Lemma rr_child_x_y_right :
  forall (t : BinaryTreeType V) (x y b : V),
    gvalid t ->
    t.(vset) x ->
    t.(left_child) x = Some y ->
    t.(right_child) y = Some b ->
    rr_child t x y x b.
Proof.
  intros t x y b Hvalid Hx Hxy Hright.
  left.
  unfold right_rotate_left_child.
  assert (Hx_in : In x t.(listV)) by (eapply finite_vertices; eauto).
  rewrite iter_override_in by exact Hx_in.
  unfold right_rotate_left_child_value.
  destruct (V_eq_dec x x); congruence.
Qed.

Lemma rr_child_y_left :
  forall (t : BinaryTreeType V) (x y b : V),
    gvalid t ->
    t.(vset) x ->
    t.(left_child) x = Some y ->
    t.(left_child) y = Some b ->
    rr_child t x y y b.
Proof.
  intros t x y b Hvalid Hx Hxy Hleft.
  left.
  unfold right_rotate_left_child.
  assert (Hy : t.(vset) y).
  { eapply child_valid; eauto. }
  assert (Hy_in : In y t.(listV)) by (eapply finite_vertices; eauto).
  rewrite iter_override_in by exact Hy_in.
  unfold right_rotate_left_child_value.
  destruct (V_eq_dec y x) as [Hyx | _].
  - subst y.
    assert (step t x x).
    { unfold step.
      exists x.
      refine {|
        bt_step_x_valid := Hx;
        bt_step_y_valid := Hx;
        bt_step_edge_equal := eq_refl;
        bt_step_child := or_introl Hxy
      |}. }
    destruct H as [e He].
    exfalso; eapply (no_self_loop (g:=t) (gvalid:=Hvalid) x e); eauto.
  - destruct (V_eq_dec y y); congruence.
Qed.

Lemma rr_child_same :
  forall (t : BinaryTreeType V) (x y a b : V),
    gvalid t ->
    t.(vset) a ->
    a <> x ->
    a <> y ->
    b <> x ->
    bt_child t a b ->
    rr_child t x y a b.
Proof.
  intros t x y a b Hvalid Ha Hax Hay Hbx Hchild.
  assert (Ha_in : In a t.(listV)) by (eapply finite_vertices; eauto).
  unfold bt_child in Hchild.
  unfold rr_child.
  destruct Hchild as [Hleft | Hright].
  - left.
    unfold right_rotate_left_child.
    rewrite iter_override_in by exact Ha_in.
    unfold right_rotate_left_child_value, replace_child.
    destruct (V_eq_dec a x); [contradiction|].
    destruct (V_eq_dec a y); [contradiction|].
    rewrite Hleft.
    destruct (V_eq_dec b x); congruence.
  - right.
    unfold right_rotate_right_child.
    rewrite iter_override_in by exact Ha_in.
    unfold right_rotate_right_child_value, replace_child.
    destruct (V_eq_dec a y); [contradiction|].
    destruct (V_eq_dec a x); [contradiction|].
    rewrite Hright.
    destruct (V_eq_dec b x); congruence.
Qed.

Lemma rr_child_parent_to_y :
  forall (t : BinaryTreeType V) (x y a : V),
    gvalid t ->
    t.(vset) a ->
    a <> x ->
    a <> y ->
    bt_child t a x ->
    rr_child t x y a y.
Proof.
  intros t x y a Hvalid Ha Hax Hay Hchild.
  assert (Ha_in : In a t.(listV)) by (eapply finite_vertices; eauto).
  unfold bt_child in Hchild.
  unfold rr_child.
  destruct Hchild as [Hleft | Hright].
  - left.
    unfold right_rotate_left_child.
    rewrite iter_override_in by exact Ha_in.
    unfold right_rotate_left_child_value, replace_child.
    destruct (V_eq_dec a x); [contradiction|].
    destruct (V_eq_dec a y); [contradiction|].
    rewrite Hleft.
    destruct (V_eq_dec x x); congruence.
  - right.
    unfold right_rotate_right_child.
    rewrite iter_override_in by exact Ha_in.
    unfold right_rotate_right_child_value, replace_child.
    destruct (V_eq_dec a y); [contradiction|].
    destruct (V_eq_dec a x); [contradiction|].
    rewrite Hright.
    destruct (V_eq_dec x x); congruence.
Qed.

Lemma rr_path_away :
  forall (t : BinaryTreeType V) (x y a b : V),
    gvalid t ->
    t.(left_child) x = Some y ->
    t.(vset) a ->
    bt_path t a b ->
    ~ bt_path t a x ->
    ~ bt_path t a y ->
    rr_path t x y a b.
Proof.
  intros t x y a b Hvalid Hxy Ha Hpath Haway_x Haway_y.
  unfold bt_path in Hpath.
  unfold rr_path.
  induction_1n Hpath.
  - reflexivity.
  - assert (Ha0 : t.(vset) a0).
    { eapply rr_bt_child_valid; eauto. }
    assert (Ha1_ne_x : a1 <> x).
    { intro Heq; subst; apply Haway_x; reflexivity. }
    assert (Ha1_ne_y : a1 <> y).
    { intro Heq; subst; apply Haway_y; reflexivity. }
    assert (Ha0_ne_x : a0 <> x).
    { intro Heq; subst.
      apply Haway_x.
      unfold bt_path.
      transitivity_1n x.
      - exact H.
      - reflexivity. }
    transitivity_1n a0.
    + eapply rr_child_same; eauto.
    + apply IHrt; auto.
      * intro Hcontra.
        apply Haway_x.
        unfold bt_path.
        transitivity_1n a0; auto.
      * intro Hcontra.
        apply Haway_y.
        unfold bt_path.
        transitivity_1n a0; auto.
Qed.

Lemma rr_path_from_y :
  forall (t : BinaryTreeType V) (x y v : V),
    gvalid t ->
    t.(vset) x ->
    t.(left_child) x = Some y ->
    bt_path t y v ->
    rr_path t x y y v.
Proof.
  intros t x y v Hvalid Hx Hxy Hpath.
  assert (Hy : t.(vset) y).
  { eapply child_valid; eauto. }
  unfold bt_path in Hpath.
  unfold rr_path.
  induction_1n Hpath.
  - reflexivity.
  - assert (Hy0 : t.(vset) y0).
    { eapply rr_bt_child_valid; eauto. }
    destruct H as [Hleft | Hright].
    + transitivity_1n y0.
      * eapply rr_child_y_left; eauto.
      * assert (Hy0v : bt_path t y0 v) by (unfold bt_path; exact Hpath).
        eapply (rr_path_away t x y y0 v); eauto.
        -- intro Hcontra.
           assert (bt_path t y0 y).
           { unfold bt_path.
             etransitivity.
             - exact Hcontra.
             - transitivity_1n y.
               + left; exact Hxy.
               + reflexivity. }
           eapply (rr_bt_child_no_back_path t y y0); eauto.
           left; exact Hleft.
        -- intro Hcontra.
           eapply (rr_bt_child_no_back_path t y y0); eauto.
           left; exact Hleft.
    + transitivity_1n x.
      * eapply rr_child_y_x; eauto.
      * transitivity_1n y0.
        -- eapply rr_child_x_y_right; eauto.
        -- assert (Hy0v : bt_path t y0 v) by (unfold bt_path; exact Hpath).
           eapply (rr_path_away t x y y0 v); eauto.
           ++ intro Hcontra.
              assert (bt_path t y0 y).
              { unfold bt_path.
                etransitivity.
                - exact Hcontra.
                - transitivity_1n y.
                  + left; exact Hxy.
                  + reflexivity. }
              eapply (rr_bt_child_no_back_path t y y0); eauto.
              right; exact Hright.
           ++ intro Hcontra.
              eapply (rr_bt_child_no_back_path t y y0); eauto.
              right; exact Hright.
Qed.

Lemma rr_path_from_x :
  forall (t : BinaryTreeType V) (x y v : V),
    gvalid t ->
    t.(vset) x ->
    t.(left_child) x = Some y ->
    bt_path t x v ->
    rr_path t x y y v.
Proof.
  intros t x y v Hvalid Hx Hxy Hpath.
  unfold rr_path.
  destruct (V_eq_dec x v) as [Hxv | Hxv].
  - subst v.
    transitivity_1n x.
    + eapply rr_child_y_x; eauto.
    + reflexivity.
  - assert (Hreach : reachable t x v).
    { eapply rr_bt_path_to_reachable; eauto. }
    destruct (real_offspring (g:=t) (gvalid:=Hvalid) x v Hreach Hxv)
      as [z [Hxz Hzv]].
    assert (Hzpath : bt_path t z v).
    { eapply rr_reachable_to_bt_path; eauto. }
    destruct Hxz as [e Haux].
    destruct Haux as [_ _ _ Hchild].
    destruct Hchild as [Hleft | Hright].
    + assert (z = y) by congruence.
      subst z.
      eapply rr_path_from_y; eauto.
    + transitivity_1n x.
      * eapply rr_child_y_x; eauto.
      * transitivity_1n z.
        -- eapply (rr_child_x_right t x y z).
           ++ exact Hvalid.
           ++ exact Hx.
           ++ exact Hxy.
           ++ exact Hright.
        -- assert (Hz : t.(vset) z).
           { eapply rr_bt_child_valid; eauto. right; exact Hright. }
           eapply (rr_path_away t x y z v); eauto.
           ++ intro Hcontra.
              eapply (rr_bt_child_no_back_path t x z); eauto.
              right; exact Hright.
           ++ intro Hcontra.
              assert (Hzy_reach : offspring t z y).
              { unfold offspring. eapply rr_bt_path_to_reachable; eauto. }
              assert (Hstep_xz : step t x z).
              { eapply rr_bt_child_to_step; eauto. right; exact Hright. }
              assert (Hstep_xy : step t x y).
              { eapply rr_bt_child_to_step; eauto. left; exact Hxy. }
              assert (Hy : t.(vset) y).
              { eapply (rr_bt_child_valid t x y); eauto. left; exact Hxy. }
              assert (Hzy_neq : z <> y).
              { intro Heq; subst z.
                eapply (child_distinct t Hvalid x y y); eauto. }
              assert (Hbro : brothers (g:=t) x z y).
              { unfold brothers. repeat split; auto. }
              eapply (brothers_not_offspring (g:=t) (gvalid:=Hvalid) z y x); eauto.
Qed.

Lemma rr_path_to_y_from_path_to_x :
  forall (t : BinaryTreeType V) (x y a : V),
    gvalid t ->
    t.(vset) x ->
    t.(left_child) x = Some y ->
    t.(vset) a ->
    bt_path t a x ->
    a <> x ->
    a <> y ->
    rr_path t x y a y.
Proof.
  intros t x y a Hvalid Hx Hxy Ha Hpath Hax Hay.
  unfold bt_path in Hpath.
  unfold rr_path.
  induction_1n Hpath.
  - contradiction.
  - destruct (V_eq_dec a0 x) as [Ha0x | Ha0x].
    + subst a0.
      transitivity_1n y.
      * eapply rr_child_parent_to_y; eauto.
      * reflexivity.
    + assert (Ha0 : t.(vset) a0).
      { eapply rr_bt_child_valid; eauto. }
      assert (Ha0y : a0 <> y).
      { intro Heq; subst a0.
        eapply (rr_bt_child_no_back_path t x y); eauto.
        unfold bt_child; left; exact Hxy. }
      transitivity_1n a0.
      * eapply rr_child_same; eauto.
      * apply IHrt; auto.
Qed.

Lemma rr_path_not_in_x_subtree :
  forall (t : BinaryTreeType V) (x y a b : V),
    gvalid t ->
    t.(vset) x ->
    t.(left_child) x = Some y ->
    t.(vset) a ->
    bt_path t a b ->
    ~ bt_path t x b ->
    a <> x ->
    a <> y ->
    rr_path t x y a b.
Proof.
  intros t x y a b Hvalid Hx Hxy Ha Hpath Hnot_sub Hax Hay.
  unfold bt_path in Hpath.
  unfold rr_path.
  induction_1n Hpath.
  - reflexivity.
  - assert (Ha0 : t.(vset) a0).
    { eapply rr_bt_child_valid; eauto. }
    assert (Ha0x : a0 <> x).
    { intro Heq; subst a0.
      apply Hnot_sub.
      unfold bt_path; exact Hpath. }
    assert (Ha0y : a0 <> y).
    { intro Heq; subst a0.
      apply Hnot_sub.
      unfold bt_path.
      transitivity_1n y.
      - unfold bt_child; left; exact Hxy.
      - exact Hpath. }
    transitivity_1n a0.
    + eapply rr_child_same; eauto.
    + apply IHrt; auto.
Qed.

Lemma rr_child_cases :
  forall (t : BinaryTreeType V) (x y a b : V),
    gvalid t ->
    t.(vset) x ->
    t.(left_child) x = Some y ->
    t.(vset) a ->
    rr_child t x y a b ->
    (a = y /\ b = x) \/
    (a = y /\ t.(left_child) y = Some b) \/
    (a = x /\ t.(right_child) x = Some b) \/
    (a = x /\ t.(right_child) y = Some b) \/
    (a <> x /\ a <> y /\
       ((bt_child t a b /\ b <> x) \/ (bt_child t a x /\ b = y))).
Proof.
  intros t x y a b Hvalid Hx Hxy Ha Hrr.
  assert (Hxy_neq : x <> y).
  { intro Heq; subst y.
    assert (step t x x).
    { unfold step.
      exists x.
      refine {|
        bt_step_x_valid := Hx;
        bt_step_y_valid := Hx;
        bt_step_edge_equal := eq_refl;
        bt_step_child := or_introl Hxy
      |}. }
    destruct H as [e He].
    eapply (no_self_loop (g:=t) (gvalid:=Hvalid) x e); eauto. }
  assert (Ha_in : In a t.(listV)) by (eapply finite_vertices; eauto).
  unfold rr_child in Hrr.
  unfold right_rotate_left_child, right_rotate_right_child in Hrr.
  rewrite !iter_override_in in Hrr by exact Ha_in.
  unfold right_rotate_left_child_value, right_rotate_right_child_value, replace_child in Hrr.
  destruct (V_eq_dec a x) as [Hax | Hax];
    destruct (V_eq_dec a y) as [Hay | Hay]; subst.
  - exfalso; apply Hxy_neq; reflexivity.
  - destruct Hrr as [Hrr | Hrr].
    + right; right; right; left.
      split; auto.
    + right; right; left.
      split; auto.
  - destruct Hrr as [Hrr | Hrr].
    + right; left.
      split; auto.
    + inversion Hrr; subst.
      left; split; auto.
  - destruct Hrr as [Hrr | Hrr].
    + destruct (t.(left_child) a) as [c |] eqn:Hchild; try discriminate.
      destruct (V_eq_dec c x) as [Hcx | Hcx]; inversion Hrr; subst.
      * right; right; right; right.
        repeat split; auto.
        right; split; auto.
        unfold bt_child; left; exact Hchild.
      * right; right; right; right.
        repeat split; auto.
        left; split; auto.
        unfold bt_child; left; exact Hchild.
    + destruct (t.(right_child) a) as [c |] eqn:Hchild; try discriminate.
      destruct (V_eq_dec c x) as [Hcx | Hcx]; inversion Hrr; subst.
      * right; right; right; right.
        repeat split; auto.
        right; split; auto.
        unfold bt_child; right; exact Hchild.
      * right; right; right; right.
        repeat split; auto.
        left; split; auto.
        unfold bt_child; right; exact Hchild.
Qed.

Lemma rr_child_no_new_root :
  forall (t : BinaryTreeType V) (x y a r : V),
    gvalid t ->
    t.(vset) x ->
    t.(left_child) x = Some y ->
    right_rotate_root t x y = Some r ->
    ~ rr_child t x y a r.
Proof.
  intros t x y a r Hvalid Hx Hxy Hnew_root Hrr.
  assert (Hy : t.(vset) y).
  { eapply rr_bt_child_valid; eauto. left; exact Hxy. }
  assert (Hxy_neq : x <> y).
  { intro Heq; subst y.
    eapply (rr_bt_child_no_self t x); eauto.
    left; exact Hxy. }
  assert (Ha : t.(vset) a).
  { eapply rr_child_source_valid; eauto. }
  unfold right_rotate_root in Hnew_root.
  destruct t.(root) as [old_root |] eqn:Hroot; [|discriminate].
  destruct (V_eq_dec x old_root) as [Hxroot | Hxroot].
  - inversion Hnew_root; subst r. subst old_root.
    pose proof (rr_child_cases t x y a y Hvalid Hx Hxy Ha Hrr) as Hcases.
    destruct Hcases as [[? ?]|[[? ?]|[[? ?]|[[? ?]|[?[?[Hold|Hold]]]]]]];
      subst; try congruence.
    + eapply rr_bt_child_no_self; eauto.
      unfold bt_child; left; exact H0.
    + exfalso.
      eapply (child_distinct t Hvalid x y y); eauto; reflexivity.
    + eapply (rr_bt_child_no_self t y); eauto.
      unfold bt_child; right; exact H0.
    + destruct Hold as [Hold _].
      assert (a = x).
      { eapply (father_unique t Hvalid y a x).
        + exact Ha.
        + exact Hx.
        + exact Hold.
        + left; exact Hxy. }
      subst; contradiction.
    + destruct Hold as [Hold Hb]; subst.
      pose proof (root_no_parents t Hvalid a x Hroot) as [HnL HnR].
      unfold bt_child in Hold; destruct Hold; contradiction.
  - inversion Hnew_root; subst r.
    pose proof (rr_child_cases t x y a old_root Hvalid Hx Hxy Ha Hrr) as Hcases.
    destruct Hcases as [[? ?]|[[? ?]|[[? ?]|[[? ?]|[?[?[Hold|Hold]]]]]]];
      subst; try congruence.
    + pose proof (root_no_parents t Hvalid y old_root Hroot) as [HnL _].
      contradiction.
    + pose proof (root_no_parents t Hvalid x old_root Hroot) as [_ HnR].
      contradiction.
    + pose proof (root_no_parents t Hvalid y old_root Hroot) as [_ HnR].
      contradiction.
    + destruct Hold as [Hold _].
      pose proof (root_no_parents t Hvalid a old_root Hroot) as [HnL HnR].
      unfold bt_child in Hold; destruct Hold; contradiction.
    + destruct Hold as [_ Hold].
      subst old_root.
      pose proof (root_no_parents t Hvalid x y Hroot) as [HnL _].
      contradiction.
Qed.

Lemma right_rotate_preserves_gvalid :
  forall (t : BinaryTreeType V) (x y : V),
    gvalid t ->
    t.(vset) x ->
    t.(left_child) x = Some y ->
    gvalid (right_rotate t x y).
Proof.
  intros t x y Hvalid Hx Hxy.
  assert (Hy : t.(vset) y).
  { eapply rr_bt_child_valid; eauto. left; exact Hxy. }
  assert (Hxy_neq : x <> y).
  { intro Heq; subst y.
    assert (step t x x).
    { eapply rr_bt_child_to_step; eauto. left; exact Hxy. }
    destruct H as [e He].
    eapply (no_self_loop (g:=t) (gvalid:=Hvalid) x e); eauto. }
  unfold gvalid, Binarytree_gvalid.
  constructor; simpl.
  - intros r Hroot_new.
    unfold right_rotate_root in Hroot_new.
    destruct t.(root) as [old_root |] eqn:Hroot; [|discriminate].
    destruct (V_eq_dec x old_root) as [Hxroot | Hxroot].
    + inversion Hroot_new; subst. exact Hy.
    + inversion Hroot_new; subst.
      eapply root_valid; eauto.
  - intros v r Hroot_new.
    split; intro Hbad.
    + eapply (rr_child_no_new_root t x y v); eauto.
      unfold rr_child; left; exact Hbad.
    + eapply (rr_child_no_new_root t x y v); eauto.
      unfold rr_child; right; exact Hbad.
  - intros z a b Ha Hb Ha_edge Hb_edge.
    assert (Ha_cases := rr_child_cases t x y a z Hvalid Hx Hxy Ha Ha_edge).
    assert (Hb_cases := rr_child_cases t x y b z Hvalid Hx Hxy Hb Hb_edge).
    destruct Ha_cases as [[? ?]|[[? ?]|[[? ?]|[[? ?]|[?[?[Ha_old|Ha_old]]]]]]];
    destruct Hb_cases as [[? ?]|[[? ?]|[[? ?]|[[? ?]|[?[?[Hb_old|Hb_old]]]]]]];
    subst; try reflexivity; try congruence;
      try (destruct Ha_old as [Ha_old ?]);
      try (destruct Hb_old as [Hb_old ?]);
      try (destruct Ha_old as [Ha_old ->]);
      try (destruct Hb_old as [Hb_old ->]);
      try contradiction; try congruence;
      try match goal with
      | H1 : right_child t ?u = Some ?v,
        H2 : left_child t ?u = Some ?v |- _ =>
          exfalso;
          assert (Hv_tmp : t.(vset) v)
            by (eapply rr_bt_child_valid; eauto; unfold bt_child; right; exact H1);
          pose proof (child_distinct t Hvalid u v v) as Hneq_tmp;
          specialize (Hneq_tmp ltac:(eauto) Hv_tmp Hv_tmp H1 H2);
          apply Hneq_tmp; reflexivity
      | H1 : left_child t ?u = Some ?v,
        H2 : right_child t ?u = Some ?v |- _ =>
          exfalso;
          assert (Hv_tmp : t.(vset) v)
            by (eapply rr_bt_child_valid; eauto; unfold bt_child; right; exact H2);
          pose proof (child_distinct t Hvalid u v v) as Hneq_tmp;
          specialize (Hneq_tmp ltac:(eauto) Hv_tmp Hv_tmp H2 H1);
          apply Hneq_tmp; reflexivity
      | H1 : t.(right_child) ?u = Some ?v,
        H2 : t.(left_child) ?u = Some ?v |- _ =>
          exfalso;
          assert (Hv_tmp : t.(vset) v)
            by (eapply rr_bt_child_valid; eauto; unfold bt_child; right; exact H1);
          pose proof (child_distinct t Hvalid u v v) as Hneq_tmp;
          specialize (Hneq_tmp ltac:(eauto) Hv_tmp Hv_tmp H1 H2);
          apply Hneq_tmp; reflexivity
      | H1 : t.(left_child) ?u = Some ?v,
        H2 : t.(right_child) ?u = Some ?v |- _ =>
          exfalso;
          assert (Hv_tmp : t.(vset) v)
            by (eapply rr_bt_child_valid; eauto; unfold bt_child; right; exact H2);
          pose proof (child_distinct t Hvalid u v v) as Hneq_tmp;
          specialize (Hneq_tmp ltac:(eauto) Hv_tmp Hv_tmp H2 H1);
          apply Hneq_tmp; reflexivity
      | H : t.(right_child) ?u = Some ?u |- _ =>
          exfalso; eapply (rr_bt_child_no_self t u); eauto;
          unfold bt_child; right; exact H
      | H : t.(left_child) ?u = Some ?u |- _ =>
          exfalso; eapply (rr_bt_child_no_self t u); eauto;
          unfold bt_child; left; exact H
      | H1 : t.(right_child) ?u = Some ?v,
        H2 : t.(right_child) ?v = Some ?u |- _ =>
          exfalso; eapply (rr_bt_child_no_two_cycle t u v); eauto;
          [unfold bt_child; right; exact H1 | unfold bt_child; right; exact H2]
      | H1 : t.(right_child) ?u = Some ?v,
        H2 : t.(left_child) ?v = Some ?u |- _ =>
          exfalso; eapply (rr_bt_child_no_two_cycle t u v); eauto;
          [unfold bt_child; right; exact H1 | unfold bt_child; left; exact H2]
      | H1 : t.(left_child) ?u = Some ?v,
        H2 : t.(right_child) ?v = Some ?u |- _ =>
          exfalso; eapply (rr_bt_child_no_two_cycle t u v); eauto;
          [unfold bt_child; left; exact H1 | unfold bt_child; right; exact H2]
      | H1 : t.(left_child) ?u = Some ?v,
        H2 : t.(left_child) ?v = Some ?u |- _ =>
          exfalso; eapply (rr_bt_child_no_two_cycle t u v); eauto;
          [unfold bt_child; left; exact H1 | unfold bt_child; left; exact H2]
      end;
      try solve [
        eapply father_unique; eauto;
        try eassumption;
        try (right; eassumption);
        try (left; eassumption)
      ].
      all: try solve [
        congruence
      | contradiction
      | exfalso; eapply (rr_bt_right_left_same_false t y z); eauto
      | exfalso; eapply (rr_bt_right_left_same_false t x z); eauto
      | exfalso; eapply (rr_bt_right_left_same_false t a z); eauto
      | exfalso; eapply (rr_bt_right_left_same_false t b z); eauto
      | subst; exfalso; eapply (rr_bt_right_left_same_false t x y); eauto
      | subst; exfalso; eapply (rr_bt_right_left_same_false t y x); eauto
      | subst; exfalso; eapply (rr_bt_right_left_same_false t a x); eauto
      | subst; exfalso; eapply (rr_bt_right_left_same_false t a y); eauto
      | subst; exfalso; eapply (rr_bt_right_left_same_false t b x); eauto
      | subst; exfalso; eapply (rr_bt_right_left_same_false t b y); eauto
      | subst; exfalso; eapply (rr_bt_child_no_self t x); eauto; unfold bt_child; eauto
      | subst; exfalso; eapply (rr_bt_child_no_self t y); eauto; unfold bt_child; eauto
      | exfalso; eapply (rr_bt_child_no_two_cycle t x y); eauto; unfold bt_child; eauto
      | exfalso; eapply (rr_bt_child_no_two_cycle t y x); eauto; unfold bt_child; eauto
      | exfalso; eapply (rr_bt_child_no_two_cycle t a x); eauto; unfold bt_child; eauto
      | exfalso; eapply (rr_bt_child_no_two_cycle t a y); eauto; unfold bt_child; eauto
      | exfalso; eapply (rr_bt_child_no_two_cycle t b x); eauto; unfold bt_child; eauto
      | exfalso; eapply (rr_bt_child_no_two_cycle t b y); eauto; unfold bt_child; eauto
      | exfalso; eapply (rr_bt_sibling_not_child t x z y); eauto; unfold bt_child; eauto
      | exfalso; eapply (rr_bt_sibling_not_child t x y z); eauto; unfold bt_child; eauto
      | exfalso; eapply (rr_bt_sibling_not_child t a z y); eauto; unfold bt_child; eauto
      | exfalso; eapply (rr_bt_sibling_not_child t a y z); eauto; unfold bt_child; eauto
      | exfalso; eapply (rr_bt_sibling_not_child t b z y); eauto; unfold bt_child; eauto
      | exfalso; eapply (rr_bt_sibling_not_child t b y z); eauto; unfold bt_child; eauto
      | match goal with
        | Hright : ?tt.(right_child) ?u = Some ?v,
          Hleft : ?tt.(left_child) ?u = Some ?v |- _ =>
            exfalso;
            assert (Hv_tmp : tt.(vset) v)
              by (eapply rr_bt_child_valid; eauto; unfold bt_child; right; exact Hright);
            pose proof (child_distinct tt Hvalid u v v) as Hneq_tmp;
            specialize (Hneq_tmp ltac:(eauto) Hv_tmp Hv_tmp Hright Hleft);
            apply Hneq_tmp; reflexivity
        | Hleft : ?tt.(left_child) ?u = Some ?v,
          Hright : ?tt.(right_child) ?u = Some ?v |- _ =>
            exfalso;
            assert (Hv_tmp : tt.(vset) v)
              by (eapply rr_bt_child_valid; eauto; unfold bt_child; right; exact Hright);
            pose proof (child_distinct tt Hvalid u v v) as Hneq_tmp;
            specialize (Hneq_tmp ltac:(eauto) Hv_tmp Hv_tmp Hright Hleft);
            apply Hneq_tmp; reflexivity
        end
      | exfalso; eapply child_distinct; eauto;
        try (eapply rr_bt_child_valid; eauto; unfold bt_child; eauto);
        try eassumption; reflexivity
      | exfalso; eapply rr_bt_right_left_same_false; eauto
      | exfalso; eapply rr_bt_child_no_self; eauto; unfold bt_child; eauto
      | exfalso; eapply rr_bt_child_no_two_cycle; eauto; unfold bt_child; eauto
      | eapply father_unique; eauto;
        try eassumption;
        try (right; eassumption);
        try (left; eassumption)
      | eapply rr_bt_child_parent_unique; eauto; unfold bt_child; eauto
      | symmetry; eapply rr_bt_child_parent_unique; eauto; unfold bt_child; eauto
      | exfalso; eapply rr_bt_child_parent_neq_false; eauto; unfold bt_child; eauto
      | subst; exfalso; eapply rr_bt_child_parent_neq_false; eauto; unfold bt_child; eauto
      | exfalso; match goal with
        | Hneq : ?p <> ?q,
          Hchild1 : bt_child ?tt ?p ?c,
          Hchild2 : bt_child ?tt ?q ?c |- _ =>
            eapply (rr_bt_child_parent_neq_false tt p q c); eauto
        end
      | exfalso; match goal with
        | Hneq : ?p <> ?q,
          Hchild1 : bt_child ?tt ?p ?c,
          Hright : ?tt.(right_child) ?q = Some ?c |- _ =>
            eapply (rr_bt_child_parent_neq_false tt p q c); eauto;
            unfold bt_child; eauto
        end
      | exfalso; match goal with
        | Hneq : ?p <> ?q,
          Hchild1 : bt_child ?tt ?p ?c,
          Hleft : ?tt.(left_child) ?q = Some ?c |- _ =>
            eapply (rr_bt_child_parent_neq_false tt p q c); eauto;
            unfold bt_child; eauto
        end
      | subst; exfalso; match goal with
        | Hneq : ?p <> ?q,
          Hchild1 : bt_child ?tt ?p ?c,
          Hchild2 : bt_child ?tt ?q ?c |- _ =>
            eapply (rr_bt_child_parent_neq_false tt p q c); eauto
        end
      | subst; exfalso; match goal with
        | Hneq : ?p <> ?q,
          Hchild1 : bt_child ?tt ?p ?c,
          Hright : ?tt.(right_child) ?q = Some ?c |- _ =>
            eapply (rr_bt_child_parent_neq_false tt p q c); eauto;
            unfold bt_child; eauto
        end
      | subst; exfalso; match goal with
        | Hneq : ?p <> ?q,
          Hchild1 : bt_child ?tt ?p ?c,
          Hleft : ?tt.(left_child) ?q = Some ?c |- _ =>
            eapply (rr_bt_child_parent_neq_false tt p q c); eauto;
            unfold bt_child; eauto
        end
      | eapply father_unique; eauto; [right; eassumption | eassumption]
      | eapply father_unique; eauto; [left; eassumption | eassumption]
      | eapply father_unique; eauto; [eassumption | right; eassumption]
      | eapply father_unique; eauto; [eassumption | left; eassumption]
      | symmetry; eapply father_unique; eauto; [right; eassumption | eassumption]
      | symmetry; eapply father_unique; eauto; [left; eassumption | eassumption]
      | symmetry; eapply father_unique; eauto; [eassumption | right; eassumption]
      | symmetry; eapply father_unique; eauto; [eassumption | left; eassumption]
      | exfalso; match goal with
        | Hneq : ?b <> ?yy, Hchild : bt_child ?tt ?b ?zz,
          Hright : ?tt.(right_child) ?yy = Some ?zz |- _ =>
            apply Hneq; eapply (father_unique tt Hvalid zz b yy); eauto;
            [exact Hchild | right; exact Hright]
        end
      | exfalso; match goal with
        | Hneq : ?a <> ?yy, Hchild : bt_child ?tt ?a ?zz,
          Hright : ?tt.(right_child) ?yy = Some ?zz |- _ =>
            apply Hneq; eapply (father_unique tt Hvalid zz a yy); eauto;
            [exact Hchild | right; exact Hright]
        end
      ].
  - intros a b Ha Hedge.
    destruct (rr_child_cases t x y a b Hvalid Hx Hxy Ha Hedge)
      as [[? ?]|[[? ?]|[[? ?]|[[? ?]|[?[?[Hold|Hold]]]]]]]; subst; auto.
    + eapply rr_bt_child_valid; eauto. left; eassumption.
    + eapply rr_bt_child_valid; eauto. right; eassumption.
    + eapply (rr_bt_child_valid t y b); eauto. right; eassumption.
    + destruct Hold as [Hold _].
      eapply rr_bt_child_valid; eauto.
    + destruct Hold as [Hold ->].
      exact Hy.
  - intros v Hv.
    assert (Hnin : ~ In v t.(listV)).
    { intro Hin.
      apply Hv.
      eapply listV_sound; eauto. }
    destruct (invalid_child_is_none t Hvalid v Hv) as [Hleft_old Hright_old].
    split.
    + unfold right_rotate_left_child.
      rewrite iter_override_not_in by exact Hnin.
      exact Hleft_old.
    + unfold right_rotate_right_child.
      rewrite iter_override_not_in by exact Hnin.
      exact Hright_old.
  - intros a b c Ha Hb Hc Hleft_new Hright_new.
    unfold right_rotate_left_child, right_rotate_right_child in Hleft_new, Hright_new.
    assert (Ha_in : In a t.(listV)) by (eapply finite_vertices; eauto).
    rewrite iter_override_in in Hleft_new by exact Ha_in.
    rewrite iter_override_in in Hright_new by exact Ha_in.
    unfold right_rotate_left_child_value, right_rotate_right_child_value, replace_child in Hleft_new, Hright_new.
    destruct (V_eq_dec a y) as [Hay | Hay].
    + subst a.
      destruct (V_eq_dec y x) as [Hyx | Hyx] in Hleft_new; [subst; contradiction|].
      destruct (V_eq_dec y y) as [_ | Hyy] in Hleft_new; [|contradiction].
      destruct (V_eq_dec y y) as [_ | Hyy] in Hright_new; [|contradiction].
      inversion Hright_new; subst c.
      intro Heq; subst b.
      eapply (rr_bt_child_no_two_cycle t x y); eauto.
      * unfold bt_child; left; exact Hxy.
      * unfold bt_child; left; exact Hleft_new.
    + destruct (V_eq_dec a x) as [Hax | Hax].
      * subst a.
        destruct (V_eq_dec x x) as [_ | Hxx] in Hleft_new; [|contradiction].
        destruct (V_eq_dec x y) as [Hxy_eq | _] in Hright_new; [contradiction|].
        destruct (V_eq_dec x x) as [_ | Hxx] in Hright_new; [|contradiction].
        intro Heq; subst c.
        assert (Hyx : y = x).
        { eapply (father_unique t Hvalid b y x); eauto;
            unfold bt_child; eauto. }
        apply Hxy_neq; symmetry; exact Hyx.
      * destruct (t.(left_child) a) as [lc |] eqn:Hlc; [|discriminate].
        destruct (V_eq_dec lc x) as [Hlcx | Hlcx]; inversion Hleft_new; subst b.
        { destruct (t.(right_child) a) as [rc |] eqn:Hrc; [|discriminate].
          destruct (V_eq_dec rc x) as [Hrcx | Hrcx]; inversion Hright_new; subst c.
          - subst lc rc.
            intro Heq.
            eapply (rr_bt_right_left_same_false t a x); eauto.
          - subst lc.
            intro Heq; subst rc.
            assert (a = x).
            { eapply (father_unique t Hvalid y a x); eauto;
                unfold bt_child; eauto. }
            contradiction. }
        { destruct (t.(right_child) a) as [rc |] eqn:Hrc; [|discriminate].
          destruct (V_eq_dec rc x) as [Hrcx | Hrcx]; inversion Hright_new; subst c.
          - subst rc.
            intro Heq; subst lc.
            assert (a = x).
            { eapply (father_unique t Hvalid y a x); eauto;
                unfold bt_child; eauto. }
            contradiction.
          - intro Heq; subst rc.
            eapply (child_distinct t Hvalid a lc lc); eauto. }
  - intros v Hv.
    destruct (path_exists t Hvalid v Hv) as [r [Hrroot Hrv]].
    exists (if V_eq_dec x r then y else r).
    split.
    + unfold right_rotate_root.
      rewrite Hrroot.
      destruct (V_eq_dec x r); reflexivity.
    + destruct (V_eq_dec x r) as [Hxroot | Hxroot].
      * subst r.
        eapply rr_path_from_x; eauto.
      * assert (Hr : t.(vset) r).
        { eapply root_valid; eauto. }
        assert (Hr_ne_y : r <> y).
        { intro Hry; subst r.
          pose proof (root_no_parents t Hvalid x y Hrroot) as [HnL _].
          contradiction. }
        destruct (path_exists t Hvalid x Hx) as [rx [Hrxroot Hrx]].
        rewrite Hrroot in Hrxroot.
        inversion Hrxroot; subst rx.
        change (bt_path t r x) in Hrx.
        change (bt_path t r v) in Hrv.
        destruct (classic (bt_path t x v)) as [Hxv | Hxv].
        -- assert (Hroot_y : rr_path t x y r y).
           { eapply rr_path_to_y_from_path_to_x; eauto. }
           unfold rr_path in *.
           etransitivity.
           ++ exact Hroot_y.
           ++ eapply rr_path_from_x; eauto.
        -- eapply rr_path_not_in_x_subtree; eauto.
  - intros v Hv.
    eapply finite_vertices; eauto.
  - intros v Hv.
    eapply listV_sound; eauto.
  - apply listV_NoDup; auto.
Qed.

End RIGHT_ROTATION.

Section INSERTION.

Definition insert_vset (y : V) (t: BinaryTreeType V) (v: V): Prop :=
  t.(vset) v \/ v = y.

Definition insert_left_child_value (t : BinaryTreeType V) (x: V) (y: V) (v: V) : option V :=
  if V_eq_dec v x then Some y
  else if V_eq_dec v y then None
  else t.(left_child) v.

Definition insert_left_child (t : BinaryTreeType V) (x: V) (y: V) : V -> option V :=
  iter_override t.(left_child)
    (map (fun u => override_v_func u ((insert_left_child_value t x y) u))
       (x :: y :: nil)).

Definition insert_left_right_child_value (t : BinaryTreeType V) (y: V) (v: V) : option V :=
  if V_eq_dec v y then None else t.(right_child) v.

Definition insert_left_right_child (t : BinaryTreeType V) (y: V) : V -> option V :=
  iter_override t.(right_child)
    (map (fun u => override_v_func u ((insert_left_right_child_value t y) u))
       (y :: nil)).

Definition insert_right_child_value (t : BinaryTreeType V) (x: V) (y: V) (v: V) : option V :=
  if V_eq_dec v x then Some y
  else if V_eq_dec v y then None
  else t.(right_child) v.

Definition insert_right_child (t : BinaryTreeType V) (x: V) (y: V) : V -> option V :=
  iter_override t.(right_child)
    (map (fun u => override_v_func u ((insert_right_child_value t x y) u))
       (x :: y :: nil)).

Definition insert_right_left_child_value (t : BinaryTreeType V) (y: V) (v: V) : option V :=
  if V_eq_dec v y then None else t.(left_child) v.

Definition insert_right_left_child (t : BinaryTreeType V) (y: V) : V -> option V :=
  iter_override t.(left_child)
    (map (fun u => override_v_func u ((insert_right_left_child_value t y) u))
       (y :: nil)).

Definition insert_root (t : BinaryTreeType V) (y: V) : BinaryTreeType V :=
{|
  vset := insert_vset y t;
  theroot := Some y;
  left_child := fun v => None;
  right_child := fun v => None;
  listV := y :: t.(listV)
|}.

Definition insert_left (t : BinaryTreeType V) (x: V) (y: V) : BinaryTreeType V :=
{|
  vset := insert_vset y t;
  theroot := t.(theroot);
  left_child := insert_left_child t x y;
  right_child := insert_left_right_child t y;
  listV := y :: t.(listV)
|}.

Definition insert_right (t : BinaryTreeType V) (x: V) (y: V) : BinaryTreeType V :=
{|
  vset := insert_vset y t;
  theroot := t.(theroot);
  left_child := insert_right_left_child t y;
  right_child := insert_right_child t x y;
  listV := y :: t.(listV)
|}.


Lemma insert_left_child_eq :
  forall (t : BinaryTreeType V) (x y v : V),
    insert_left_child t x y v = insert_left_child_value t x y v.
Proof.
  intros t x y v.
  unfold insert_left_child, insert_left_child_value, iter_override.
  simpl. unfold override_v_func, insert_left_child_value.
  repeat destruct (V_eq_dec _ _); congruence.
Qed.

Lemma insert_left_right_child_eq :
  forall (t : BinaryTreeType V) (y v : V),
    insert_left_right_child t y v = insert_left_right_child_value t y v.
Proof.
  intros t y v.
  unfold insert_left_right_child, insert_left_right_child_value, iter_override.
  simpl. unfold override_v_func, insert_left_right_child_value.
  repeat destruct (V_eq_dec _ _); congruence.
Qed.

Lemma insert_right_child_eq :
  forall (t : BinaryTreeType V) (x y v : V),
    insert_right_child t x y v = insert_right_child_value t x y v.
Proof.
  intros t x y v.
  unfold insert_right_child, insert_right_child_value, iter_override.
  simpl. unfold override_v_func, insert_right_child_value.
  repeat destruct (V_eq_dec _ _); congruence.
Qed.

Lemma insert_right_left_child_eq :
  forall (t : BinaryTreeType V) (y v : V),
    insert_right_left_child t y v = insert_right_left_child_value t y v.
Proof.
  intros t y v.
  unfold insert_right_left_child, insert_right_left_child_value, iter_override.
  simpl. unfold override_v_func, insert_right_left_child_value.
  repeat destruct (V_eq_dec _ _); congruence.
Qed.

Lemma insert_root_preserves_gvalid :
  forall (t : BinaryTreeType V) (y : V),
    gvalid t ->
    t.(root) = None ->
    ~ t.(vset) y ->
    gvalid (insert_root t y).
Proof.
  intros t y Hvalid Hroot Hy.
  assert (Hempty : forall v, ~ t.(vset) v).
  { intros v Hv.
    destruct (path_exists t Hvalid v Hv) as [r [Hrroot _]].
    rewrite Hroot in Hrroot. discriminate. }
  unfold gvalid, insert_root, insert_vset.
  constructor; simpl.
  - intros r Hr. inversion Hr; subst. right; reflexivity.
  - intros v r Hr. split; intro Hbad; discriminate.
  - intros c a b Ha Hb Ha_edge Hb_edge.
    destruct Ha as [Ha | Ha]; [exfalso; apply (Hempty a); exact Ha | subst a].
    destruct Hb as [Hb | Hb]; [exfalso; apply (Hempty b); exact Hb | subst b].
    destruct Ha_edge as [Ha_edge | Ha_edge]; discriminate.
  - intros a b Ha Hedge. destruct Hedge as [Hedge | Hedge]; discriminate.
  - intros v Hv. split; reflexivity.
  - intros a b c Ha Hb Hc Hleft Hright. discriminate.
  - intros v Hv.
    destruct Hv as [Hv | Hv]; [exfalso; apply (Hempty v); exact Hv | subst v].
    exists y. split; [reflexivity | reflexivity].
  - intros v Hv.
    destruct Hv as [Hv | Hv]; [exfalso; apply (Hempty v); exact Hv | subst v].
    simpl; auto.
  - intros v Hin.
    simpl in Hin.
    destruct Hin as [Hin | Hin]; subst.
    + right; reflexivity.
    + left. eapply listV_sound; eauto.
  - constructor.
    + intro Hin.
      apply Hy.
      eapply listV_sound; eauto.
    + apply listV_NoDup; auto.
Qed.

Lemma insert_left_old_child :
  forall (t : BinaryTreeType V) (x y a b : V),
    gvalid t ->
    t.(vset) x ->
    ~ t.(vset) y ->
    t.(left_child) x = None ->
	    t.(vset) a ->
	    t.(left_child) a = Some b \/ t.(right_child) a = Some b ->
	    insert_left_child t x y a = Some b \/
	    insert_left_right_child t y a = Some b.
Proof.
  intros t x y a b Hvalid Hx Hy Hxleft Ha Hchild.
  rewrite insert_left_child_eq, insert_left_right_child_eq.
  unfold insert_left_child_value, insert_left_right_child_value.
  destruct (V_eq_dec a x) as [Hax | Hax].
  - subst a.
    destruct Hchild as [Hchild | Hchild].
    + rewrite Hxleft in Hchild; discriminate.
    + destruct (V_eq_dec x y) as [Hxy' | Hxy']; [subst y; contradiction|].
      right; exact Hchild.
  - destruct Hchild as [Hchild | Hchild].
    + destruct (V_eq_dec a y) as [Hay | Hay].
      * subst a. contradiction.
      * left; exact Hchild.
    + destruct (V_eq_dec a y) as [Hay | Hay].
      * subst a. contradiction.
      * right; exact Hchild.
Qed.

Lemma insert_left_preserves_path :
  forall (t : BinaryTreeType V) (x y a b : V),
    gvalid t ->
    t.(vset) x ->
    ~ t.(vset) y ->
    t.(left_child) x = None ->
    t.(vset) a ->
    clos_refl_trans (fun u v => t.(left_child) u = Some v \/ t.(right_child) u = Some v) a b ->
    clos_refl_trans
	      (fun u v =>
	         insert_left_child t x y u = Some v \/
	         insert_left_right_child t y u = Some v)
      a b.
Proof.
  intros t x y a b Hvalid Hx Hy Hxleft Ha Hpath.
  induction_1n Hpath.
  - reflexivity.
  - transitivity_1n a0.
    + eapply insert_left_old_child; eauto.
    + apply IHrt; auto.
      eapply child_valid; eauto.
Qed.

Lemma insert_left_preserves_gvalid :
  forall (t : BinaryTreeType V) (x y : V),
    gvalid t ->
    t.(vset) x ->
    ~ t.(vset) y ->
    t.(left_child) x = None ->
    gvalid (insert_left t x y).
Proof.
  intros t x y Hvalid Hx Hy Hxleft.
  assert (Hxy : x <> y) by (intro H; subst; contradiction).
  unfold gvalid, insert_left, insert_vset.
  constructor; simpl.
  - intros r Hroot.
    left. eapply root_valid; eauto.
  - intros v r Hroot.
    pose proof (root_valid t Hvalid r Hroot) as Hr.
	    pose proof (root_no_parents t Hvalid v r Hroot) as [HnL HnR].
	    split.
	    + rewrite insert_left_child_eq.
	      unfold insert_left_child_value.
	      destruct (V_eq_dec v x) as [Hvx | Hvx].
	      * intro Hbad. inversion Hbad; subst r. contradiction.
	      * destruct (V_eq_dec v y) as [Hvy | Hvy].
	        -- intro Hbad. discriminate.
	        -- exact HnL.
	    + rewrite insert_left_right_child_eq.
	      unfold insert_left_right_child_value.
	      destruct (V_eq_dec v y) as [Hvy | Hvy].
	      * intro Hbad. discriminate.
	      * exact HnR.
	  - intros c a b Ha Hb Ha_edge Hb_edge.
	    repeat rewrite insert_left_child_eq in *.
	    repeat rewrite insert_left_right_child_eq in *.
	    unfold insert_left_child_value, insert_left_right_child_value in *.
	    destruct Ha as [Ha | Ha]; destruct Hb as [Hb | Hb]; subst.
    + destruct Ha_edge as [Ha_edge | Ha_edge];
      destruct Hb_edge as [Hb_edge | Hb_edge].
      * unfold insert_left_child in Ha_edge, Hb_edge.
        destruct (V_eq_dec a x) as [Hax | Hax];
        destruct (V_eq_dec b x) as [Hbx | Hbx].
        -- subst a b. reflexivity.
        -- subst a. inversion Ha_edge; subst c.
           exfalso. apply Hy.
           destruct (V_eq_dec b y) as [Hby | Hby].
           ++ subst b. exact Hb.
           ++ exact (child_valid t Hvalid b y Hb (or_introl Hb_edge)).
        -- subst b. inversion Hb_edge; subst c.
           exfalso. apply Hy.
           destruct (V_eq_dec a y) as [Hay | Hay].
           ++ subst a. exact Ha.
           ++ exact (child_valid t Hvalid a y Ha (or_introl Ha_edge)).
        -- destruct (V_eq_dec a y) as [Hay | Hay].
           ++ subst a. contradiction.
           ++ destruct (V_eq_dec b y) as [Hby | Hby].
              ** subst b. contradiction.
              ** exact (father_unique t Hvalid c a b Ha Hb (or_introl Ha_edge) (or_introl Hb_edge)).
      * unfold insert_left_child in Ha_edge.
        destruct (V_eq_dec a x) as [Hax | Hax].
        -- subst a. inversion Ha_edge; subst c.
           exfalso. apply Hy.
           destruct (V_eq_dec b y) as [Hby | Hby] in Hb_edge.
           ++ discriminate.
           ++ exact (child_valid t Hvalid b y Hb (or_intror Hb_edge)).
        -- destruct (V_eq_dec a y) as [Hay | Hay].
           ++ discriminate.
           ++ destruct (V_eq_dec b y) as [Hby | Hby] in Hb_edge.
              ** discriminate.
              ** exact (father_unique t Hvalid c a b Ha Hb (or_introl Ha_edge) (or_intror Hb_edge)).
      * unfold insert_left_child in Hb_edge.
        destruct (V_eq_dec b x) as [Hbx | Hbx].
        -- subst b. inversion Hb_edge; subst c.
           exfalso. apply Hy.
           destruct (V_eq_dec a y) as [Hay | Hay] in Ha_edge.
           ++ discriminate.
           ++ exact (child_valid t Hvalid a y Ha (or_intror Ha_edge)).
        -- destruct (V_eq_dec a y) as [Hay | Hay] in Ha_edge.
           ++ discriminate.
           ++ destruct (V_eq_dec b y) as [Hby | Hby].
              ** subst b. contradiction.
              ** exact (father_unique t Hvalid c a b Ha Hb (or_intror Ha_edge) (or_introl Hb_edge)).
      * destruct (V_eq_dec a y) as [Hay | Hay] in Ha_edge.
        -- discriminate.
        -- destruct (V_eq_dec b y) as [Hby | Hby] in Hb_edge.
           ++ discriminate.
           ++ exact (father_unique t Hvalid c a b Ha Hb (or_intror Ha_edge) (or_intror Hb_edge)).
    + destruct Hb_edge as [Hb_edge | Hb_edge].
      * unfold insert_left_child in Hb_edge.
        destruct (V_eq_dec y x) as [Hyx | Hyx]; [subst y; contradiction|].
        destruct (V_eq_dec y y) as [_ | Hyy]; [discriminate | contradiction].
      * destruct (V_eq_dec y y) as [_ | Hyy] in Hb_edge; [discriminate | contradiction].
    + destruct Ha_edge as [Ha_edge | Ha_edge].
      * unfold insert_left_child in Ha_edge.
        destruct (V_eq_dec y x) as [Hyx | Hyx]; [subst y; contradiction|].
        destruct (V_eq_dec y y) as [_ | Hyy]; [discriminate | contradiction].
      * destruct (V_eq_dec y y) as [_ | Hyy] in Ha_edge; [discriminate | contradiction].
    + reflexivity.
	  - intros a b Ha Hchild.
	    repeat rewrite insert_left_child_eq in *.
	    repeat rewrite insert_left_right_child_eq in *.
	    unfold insert_left_child_value, insert_left_right_child_value in *.
	    destruct Hchild as [Hchild | Hchild].
    + unfold insert_left_child in Hchild.
      destruct (V_eq_dec a x) as [Hax | Hax].
      * inversion Hchild; subst b. right; reflexivity.
      * destruct (V_eq_dec a y) as [Hay | Hay].
        -- discriminate.
        -- destruct Ha as [Ha | Ha]; subst.
           ++ left. eapply child_valid; eauto.
           ++ contradiction.
    + destruct (V_eq_dec a y) as [Hay | Hay] in Hchild.
      * discriminate.
      * destruct Ha as [Ha | Ha]; subst.
        -- left. eapply child_valid; eauto.
        -- contradiction.
  - intros v Hnot_valid.
    assert (Hnot_old : ~ t.(vset) v).
    { intro Hv.
      apply Hnot_valid.
      left; exact Hv. }
    assert (Hv_ne_y : v <> y).
    { intro Hvy.
      apply Hnot_valid.
      right; exact Hvy. }
	    destruct (invalid_child_is_none t Hvalid v Hnot_old) as [Hleft_old Hright_old].
	    split.
	    + rewrite insert_left_child_eq.
	      unfold insert_left_child_value.
	      destruct (V_eq_dec v x) as [Hvx | Hvx].
	      * subst v. contradiction.
	      * destruct (V_eq_dec v y) as [Hvy | Hvy];
	          [contradiction | exact Hleft_old].
	    + rewrite insert_left_right_child_eq.
	      unfold insert_left_right_child_value.
	      destruct (V_eq_dec v y) as [Hvy | Hvy];
	        [contradiction | exact Hright_old].
	  - intros a b c Ha Hb Hc Hleft Hright.
	    rewrite insert_left_child_eq in Hleft.
	    rewrite insert_left_right_child_eq in Hright.
	    unfold insert_left_child_value in Hleft.
	    unfold insert_left_right_child_value in Hright.
    destruct (V_eq_dec a x) as [Hax | Hax].
    + subst a. inversion Hleft; subst b.
      intro Hcy. subst c.
      destruct Hc as [Hc | Hc].
      * contradiction.
      * exfalso. apply Hy.
        destruct (V_eq_dec x y) as [Hxy' | Hxy'] in Hright; [contradiction|].
        exact (child_valid t Hvalid x y Hx (or_intror Hright)).
    + destruct Ha as [Ha | Ha]; subst.
      * destruct Hb as [Hb | Hb]; destruct Hc as [Hc | Hc]; subst.
        -- destruct (V_eq_dec a y) as [Hay | Hay] in Hleft.
           ++ discriminate.
           ++ destruct (V_eq_dec a y) as [Hay' | Hay'] in Hright.
              ** contradiction.
              ** exact (child_distinct t Hvalid a b c Ha Hb Hc Hleft Hright).
        -- exfalso. apply Hy.
           destruct (V_eq_dec a y) as [Hay | Hay] in Hright.
           ++ subst a. exact Ha.
           ++ exact (child_valid t Hvalid a y Ha (or_intror Hright)).
        -- exfalso. apply Hy.
           destruct (V_eq_dec a y) as [Hay | Hay] in Hleft.
           ++ discriminate.
           ++ exact (child_valid t Hvalid a y Ha (or_introl Hleft)).
        -- exfalso. apply Hy.
           destruct (V_eq_dec a y) as [Hay | Hay] in Hleft.
           ++ discriminate.
           ++ exact (child_valid t Hvalid a y Ha (or_introl Hleft)).
      * unfold insert_left_child in Hleft.
        destruct (V_eq_dec y x) as [Hyx | Hyx]; [subst y; contradiction|].
        destruct (V_eq_dec y y) as [_ | Hyy]; [discriminate | contradiction].
  - intros v Hv.
    destruct Hv as [Hv | Hv]; subst.
    + destruct (path_exists t Hvalid v Hv) as [r [Hrroot Hpath]].
      exists r. split; [exact Hrroot|].
      eapply insert_left_preserves_path; eauto.
      eapply root_valid; eauto.
    + destruct (path_exists t Hvalid x Hx) as [r [Hrroot Hpath]].
      exists r. split; [exact Hrroot|].
      etransitivity.
      * eapply insert_left_preserves_path; eauto.
        eapply root_valid; eauto.
	      * transitivity_1n y.
	        -- rewrite insert_left_child_eq.
	           unfold insert_left_child_value.
	           destruct (V_eq_dec x x); [left; reflexivity | contradiction].
        -- reflexivity.
  - intros v Hv.
    destruct Hv as [Hv | Hv]; subst.
    + simpl; right. eapply finite_vertices; eauto.
    + simpl; left; reflexivity.
  - intros v Hv.
    simpl in Hv. destruct Hv as [Hv | Hv]; subst.
    + right; reflexivity.
    + left. eapply listV_sound; eauto.
  - constructor.
    + intro Hin.
      apply Hy.
      eapply listV_sound; eauto.
    + apply listV_NoDup; auto.
Qed.

Lemma insert_right_old_child :
  forall (t : BinaryTreeType V) (x y a b : V),
    gvalid t ->
    t.(vset) x ->
    ~ t.(vset) y ->
	    t.(right_child) x = None ->
	    t.(vset) a ->
	    t.(left_child) a = Some b \/ t.(right_child) a = Some b ->
	    insert_right_left_child t y a = Some b \/
	    insert_right_child t x y a = Some b.
Proof.
  intros t x y a b Hvalid Hx Hy Hxright Ha Hchild.
  rewrite insert_right_left_child_eq, insert_right_child_eq.
  unfold insert_right_left_child_value, insert_right_child_value.
  destruct (V_eq_dec a x) as [Hax | Hax].
  - subst a.
    destruct Hchild as [Hchild | Hchild].
    + destruct (V_eq_dec x y) as [Hxy' | Hxy']; [subst y; contradiction|].
      left; exact Hchild.
    + rewrite Hxright in Hchild; discriminate.
  - destruct Hchild as [Hchild | Hchild].
    + destruct (V_eq_dec a y) as [Hay | Hay].
      * subst a. contradiction.
      * left; exact Hchild.
    + destruct (V_eq_dec a y) as [Hay | Hay].
      * subst a. contradiction.
      * right; exact Hchild.
Qed.

Lemma insert_right_preserves_path :
  forall (t : BinaryTreeType V) (x y a b : V),
    gvalid t ->
    t.(vset) x ->
    ~ t.(vset) y ->
    t.(right_child) x = None ->
    t.(vset) a ->
    clos_refl_trans (fun u v => t.(left_child) u = Some v \/ t.(right_child) u = Some v) a b ->
    clos_refl_trans
	      (fun u v =>
	         insert_right_left_child t y u = Some v \/
	         insert_right_child t x y u = Some v)
      a b.
Proof.
  intros t x y a b Hvalid Hx Hy Hxright Ha Hpath.
  induction_1n Hpath.
  - reflexivity.
  - transitivity_1n a0.
    + eapply insert_right_old_child; eauto.
    + apply IHrt; auto.
      eapply child_valid; eauto.
Qed.

Lemma insert_right_preserves_gvalid :
  forall (t : BinaryTreeType V) (x y : V),
    gvalid t ->
    t.(vset) x ->
    ~ t.(vset) y ->
    t.(right_child) x = None ->
    gvalid (insert_right t x y).
Proof.
  intros t x y Hvalid Hx Hy Hxright.
  assert (Hxy : x <> y) by (intro H; subst; contradiction).
  unfold gvalid, insert_right, insert_vset.
  constructor; simpl.
  - intros r Hroot.
    left. eapply root_valid; eauto.
  - intros v r Hroot.
	    pose proof (root_valid t Hvalid r Hroot) as Hr.
	    pose proof (root_no_parents t Hvalid v r Hroot) as [HnL HnR].
	    split.
	    + rewrite insert_right_left_child_eq.
	      unfold insert_right_left_child_value.
	      destruct (V_eq_dec v y) as [Hvy | Hvy].
	      * intro Hbad. discriminate.
	      * exact HnL.
	    + rewrite insert_right_child_eq.
	      unfold insert_right_child_value.
	      destruct (V_eq_dec v x) as [Hvx | Hvx].
	      * intro Hbad. inversion Hbad; subst r. contradiction.
	      * destruct (V_eq_dec v y) as [Hvy | Hvy].
	        -- intro Hbad. discriminate.
	        -- exact HnR.
	  - intros c a b Ha Hb Ha_edge Hb_edge.
	    repeat rewrite insert_right_left_child_eq in *.
	    repeat rewrite insert_right_child_eq in *.
	    unfold insert_right_left_child_value, insert_right_child_value in *.
	    destruct Ha as [Ha | Ha]; destruct Hb as [Hb | Hb]; subst.
    + destruct Ha_edge as [Ha_edge | Ha_edge];
      destruct Hb_edge as [Hb_edge | Hb_edge].
      * destruct (V_eq_dec a y) as [Hay | Hay] in Ha_edge.
        -- discriminate.
        -- destruct (V_eq_dec b y) as [Hby | Hby] in Hb_edge.
           ++ discriminate.
           ++ exact (father_unique t Hvalid c a b Ha Hb (or_introl Ha_edge) (or_introl Hb_edge)).
      * unfold insert_right_child in Hb_edge.
        destruct (V_eq_dec b x) as [Hbx | Hbx].
        -- subst b. inversion Hb_edge; subst c.
           exfalso. apply Hy.
           destruct (V_eq_dec a y) as [Hay | Hay] in Ha_edge.
           ++ discriminate.
           ++ exact (child_valid t Hvalid a y Ha (or_introl Ha_edge)).
        -- destruct (V_eq_dec a y) as [Hay | Hay] in Ha_edge.
           ++ discriminate.
           ++ destruct (V_eq_dec b y) as [Hby | Hby] in Hb_edge.
              ** discriminate.
              ** exact (father_unique t Hvalid c a b Ha Hb (or_introl Ha_edge) (or_intror Hb_edge)).
      * unfold insert_right_child in Ha_edge.
        destruct (V_eq_dec a x) as [Hax | Hax].
        -- subst a. inversion Ha_edge; subst c.
           exfalso. apply Hy.
           destruct (V_eq_dec b y) as [Hby | Hby] in Hb_edge.
           ++ discriminate.
           ++ exact (child_valid t Hvalid b y Hb (or_introl Hb_edge)).
        -- destruct (V_eq_dec a y) as [Hay | Hay] in Ha_edge.
           ++ discriminate.
           ++ destruct (V_eq_dec b y) as [Hby | Hby] in Hb_edge.
              ** discriminate.
              ** exact (father_unique t Hvalid c a b Ha Hb (or_intror Ha_edge) (or_introl Hb_edge)).
      * unfold insert_right_child in Ha_edge, Hb_edge.
        destruct (V_eq_dec a x) as [Hax | Hax];
        destruct (V_eq_dec b x) as [Hbx | Hbx].
        -- subst a b. reflexivity.
        -- subst a. inversion Ha_edge; subst c.
           exfalso. apply Hy.
           destruct (V_eq_dec b y) as [Hby | Hby] in Hb_edge.
           ++ discriminate.
           ++ exact (child_valid t Hvalid b y Hb (or_intror Hb_edge)).
        -- subst b. inversion Hb_edge; subst c.
           exfalso. apply Hy.
           destruct (V_eq_dec a y) as [Hay | Hay] in Ha_edge.
           ++ discriminate.
           ++ exact (child_valid t Hvalid a y Ha (or_intror Ha_edge)).
        -- destruct (V_eq_dec a y) as [Hay | Hay] in Ha_edge.
           ++ discriminate.
           ++ destruct (V_eq_dec b y) as [Hby | Hby] in Hb_edge.
              ** discriminate.
              ** exact (father_unique t Hvalid c a b Ha Hb (or_intror Ha_edge) (or_intror Hb_edge)).
    + destruct Hb_edge as [Hb_edge | Hb_edge].
      * destruct (V_eq_dec y y) as [_ | Hyy] in Hb_edge; [discriminate | contradiction].
      * unfold insert_right_child in Hb_edge.
        destruct (V_eq_dec y x) as [Hyx | Hyx]; [subst y; contradiction|].
        destruct (V_eq_dec y y) as [_ | Hyy]; [discriminate | contradiction].
    + destruct Ha_edge as [Ha_edge | Ha_edge].
      * destruct (V_eq_dec y y) as [_ | Hyy] in Ha_edge; [discriminate | contradiction].
      * unfold insert_right_child in Ha_edge.
        destruct (V_eq_dec y x) as [Hyx | Hyx]; [subst y; contradiction|].
        destruct (V_eq_dec y y) as [_ | Hyy]; [discriminate | contradiction].
    + reflexivity.
	  - intros a b Ha Hchild.
	    repeat rewrite insert_right_left_child_eq in *.
	    repeat rewrite insert_right_child_eq in *.
	    unfold insert_right_left_child_value, insert_right_child_value in *.
	    destruct Hchild as [Hchild | Hchild].
    + destruct (V_eq_dec a y) as [Hay | Hay] in Hchild.
      * discriminate.
      * destruct Ha as [Ha | Ha]; subst.
        -- left. eapply child_valid; eauto.
        -- contradiction.
    + unfold insert_right_child in Hchild.
      destruct (V_eq_dec a x) as [Hax | Hax].
      * inversion Hchild; subst b. right; reflexivity.
      * destruct (V_eq_dec a y) as [Hay | Hay].
        -- discriminate.
        -- destruct Ha as [Ha | Ha]; subst.
           ++ left. eapply child_valid; eauto.
           ++ contradiction.
  - intros v Hnot_valid.
    assert (Hnot_old : ~ t.(vset) v).
    { intro Hv.
      apply Hnot_valid.
      left; exact Hv. }
    assert (Hv_ne_y : v <> y).
    { intro Hvy.
      apply Hnot_valid.
      right; exact Hvy. }
	    destruct (invalid_child_is_none t Hvalid v Hnot_old) as [Hleft_old Hright_old].
	    split.
	    + rewrite insert_right_left_child_eq.
	      unfold insert_right_left_child_value.
	      destruct (V_eq_dec v y) as [Hvy | Hvy];
	        [contradiction | exact Hleft_old].
	    + rewrite insert_right_child_eq.
	      unfold insert_right_child_value.
	      destruct (V_eq_dec v x) as [Hvx | Hvx].
	      * subst v. contradiction.
	      * destruct (V_eq_dec v y) as [Hvy | Hvy];
	          [contradiction | exact Hright_old].
	  - intros a b c Ha Hb Hc Hleft Hright.
	    rewrite insert_right_left_child_eq in Hleft.
	    rewrite insert_right_child_eq in Hright.
	    unfold insert_right_left_child_value in Hleft.
	    unfold insert_right_child_value in Hright.
    destruct (V_eq_dec a x) as [Hax | Hax].
    + subst a. inversion Hright; subst c.
      intro Hby. subst b.
      destruct Hb as [Hb | Hb].
      * contradiction.
      * exfalso. apply Hy.
        destruct (V_eq_dec x y) as [Hxy' | Hxy'] in Hleft; [contradiction|].
        exact (child_valid t Hvalid x y Hx (or_introl Hleft)).
    + destruct Ha as [Ha | Ha]; subst.
      * destruct Hb as [Hb | Hb]; destruct Hc as [Hc | Hc]; subst.
        -- destruct (V_eq_dec a y) as [Hay | Hay] in Hleft.
           ++ subst a. contradiction.
           ++ destruct (V_eq_dec a y) as [Hay' | Hay'] in Hright.
              ** contradiction.
              ** exact (child_distinct t Hvalid a b c Ha Hb Hc Hleft Hright).
        -- exfalso. apply Hy.
           destruct (V_eq_dec a y) as [Hay | Hay] in Hright.
           ++ discriminate.
           ++ exact (child_valid t Hvalid a y Ha (or_intror Hright)).
        -- exfalso. apply Hy.
           destruct (V_eq_dec a y) as [Hay | Hay] in Hleft.
           ++ discriminate.
           ++ exact (child_valid t Hvalid a y Ha (or_introl Hleft)).
        -- exfalso. apply Hy.
           destruct (V_eq_dec a y) as [Hay | Hay] in Hleft.
           ++ discriminate.
           ++ exact (child_valid t Hvalid a y Ha (or_introl Hleft)).
      * unfold insert_right_child in Hright.
        destruct (V_eq_dec y x) as [Hyx | Hyx]; [subst y; contradiction|].
        destruct (V_eq_dec y y) as [_ | Hyy]; [discriminate | contradiction].
  - intros v Hv.
    destruct Hv as [Hv | Hv]; subst.
    + destruct (path_exists t Hvalid v Hv) as [r [Hrroot Hpath]].
      exists r. split; [exact Hrroot|].
      eapply insert_right_preserves_path; eauto.
      eapply root_valid; eauto.
    + destruct (path_exists t Hvalid x Hx) as [r [Hrroot Hpath]].
      exists r. split; [exact Hrroot|].
      etransitivity.
      * eapply insert_right_preserves_path; eauto.
        eapply root_valid; eauto.
	      * transitivity_1n y.
	        -- rewrite insert_right_child_eq.
	           unfold insert_right_child_value.
	           destruct (V_eq_dec x x); [right; reflexivity | contradiction].
        -- reflexivity.
  - intros v Hv.
    destruct Hv as [Hv | Hv]; subst.
    + simpl; right. eapply finite_vertices; eauto.
    + simpl; left; reflexivity.
  - intros v Hv.
    simpl in Hv. destruct Hv as [Hv | Hv]; subst.
    + right; reflexivity.
    + left. eapply listV_sound; eauto.
  - constructor.
    + intro Hin.
      apply Hy.
      eapply listV_sound; eauto.
    + apply listV_NoDup; auto.
Qed.

End INSERTION.

Section DELETION.

Definition remove_from_vset (t: BinaryTreeType V) (x: V) (v: V): Prop :=
  t.(vset) v /\ v <> x.

Definition remove_left_vset (t: BinaryTreeType V) (x: V) (v: V): Prop :=
  t.(vset) v /\ t.(left_child) x <> Some v.

Definition remove_right_vset (t: BinaryTreeType V) (x: V) (v: V): Prop :=
  t.(vset) v /\ t.(right_child) x <> Some v.

Definition remove_root (t : BinaryTreeType V) : BinaryTreeType V :=
{|
  vset := fun v => False;
  theroot := None;
  left_child := fun v => None;
  right_child := fun v => None;
  listV := nil
|}.

Definition remove_left_child_value (t : BinaryTreeType V) (x: V) (v: V) : option V :=
  if V_eq_dec v x then None else t.(left_child) v.

Definition remove_left_child (t : BinaryTreeType V) (x: V) : V -> option V :=
  iter_override t.(left_child)
    (map (fun u => override_v_func u ((remove_left_child_value t x) u))
       (x :: nil)).

Definition remove_right_child_value (t : BinaryTreeType V) (x: V) (v: V) : option V :=
  if V_eq_dec v x then None else t.(right_child) v.

Definition remove_right_child (t : BinaryTreeType V) (x: V) : V -> option V :=
  iter_override t.(right_child)
    (map (fun u => override_v_func u ((remove_right_child_value t x) u))
       (x :: nil)).

Definition remove_left_leaf (t : BinaryTreeType V) (x: V) : BinaryTreeType V :=
{|
  vset := remove_left_vset t x;
  theroot := t.(theroot);
  left_child := remove_left_child t x;
  right_child := t.(right_child);
  listV :=
    match t.(left_child) x with
    | Some y => remove V_eq_dec y t.(listV)
    | None => t.(listV)
    end
|}.

Definition remove_right_leaf (t : BinaryTreeType V) (x: V) : BinaryTreeType V :=
{|
  vset := remove_right_vset t x;
  theroot := t.(theroot);
  left_child := t.(left_child);
  right_child := remove_right_child t x;
  listV :=
    match t.(right_child) x with
    | Some y => remove V_eq_dec y t.(listV)
    | None => t.(listV)
    end
|}.


Lemma remove_left_child_eq :
  forall (t : BinaryTreeType V) (x v : V),
    remove_left_child t x v = remove_left_child_value t x v.
Proof.
  intros t x v.
  unfold remove_left_child, remove_left_child_value, iter_override.
  simpl. unfold override_v_func, remove_left_child_value.
  repeat destruct (V_eq_dec _ _); congruence.
Qed.

Lemma remove_right_child_eq :
  forall (t : BinaryTreeType V) (x v : V),
    remove_right_child t x v = remove_right_child_value t x v.
Proof.
  intros t x v.
  unfold remove_right_child, remove_right_child_value, iter_override.
  simpl. unfold override_v_func, remove_right_child_value.
  repeat destruct (V_eq_dec _ _); congruence.
Qed.

Lemma bt_leaf_path_self :
  forall (t : BinaryTreeType V) (y b : V),
    t.(left_child) y = None ->
    t.(right_child) y = None ->
    bt_path t y b ->
    b = y.
Proof.
  intros t y b Hleft Hright Hpath.
  unfold bt_path in Hpath.
  induction_1n Hpath.
  - reflexivity.
  - unfold bt_child in H.
    destruct H as [H | H]; rewrite Hleft in H || rewrite Hright in H; discriminate.
Qed.

Lemma remove_left_old_child :
  forall (t : BinaryTreeType V) (x y a b dst : V),
    t.(left_child) x = Some y ->
    t.(left_child) y = None ->
    t.(right_child) y = None ->
    dst <> y ->
    bt_path t b dst ->
    bt_child t a b ->
    remove_left_child t x a = Some b \/ t.(right_child) a = Some b.
Proof.
  intros t x y a b dst Hxy Hy_left Hy_right Hdstneq Hbdst Hchild.
  unfold bt_child in Hchild.
  rewrite remove_left_child_eq.
  unfold remove_left_child_value.
  destruct Hchild as [Hchild | Hchild].
  - destruct (V_eq_dec a x) as [Hax | Hax].
    + subst a.
      rewrite Hxy in Hchild.
      inversion Hchild; subst b.
      exfalso. apply Hdstneq.
      eapply bt_leaf_path_self; eauto.
    + left; exact Hchild.
  - right; exact Hchild.
Qed.

Lemma remove_left_preserves_path :
  forall (t : BinaryTreeType V) (x y a b : V),
    t.(left_child) x = Some y ->
    t.(left_child) y = None ->
    t.(right_child) y = None ->
    b <> y ->
    bt_path t a b ->
    clos_refl_trans
      (fun u v => remove_left_child t x u = Some v \/ t.(right_child) u = Some v)
      a b.
Proof.
  intros t x y a b Hxy Hy_left Hy_right Hbneq Hpath.
  unfold bt_path in Hpath.
  induction_1n Hpath.
  - reflexivity.
  - transitivity_1n a0.
    + eapply remove_left_old_child with (dst := b); eauto.
    + apply IHrt; auto.
Qed.

Lemma remove_right_old_child :
  forall (t : BinaryTreeType V) (x y a b dst : V),
    t.(right_child) x = Some y ->
    t.(left_child) y = None ->
    t.(right_child) y = None ->
    dst <> y ->
    bt_path t b dst ->
    bt_child t a b ->
    t.(left_child) a = Some b \/ remove_right_child t x a = Some b.
Proof.
  intros t x y a b dst Hxy Hy_left Hy_right Hdstneq Hbdst Hchild.
  unfold bt_child in Hchild.
  rewrite remove_right_child_eq.
  unfold remove_right_child_value.
  destruct Hchild as [Hchild | Hchild].
  - left; exact Hchild.
  - destruct (V_eq_dec a x) as [Hax | Hax].
    + subst a.
      rewrite Hxy in Hchild.
      inversion Hchild; subst b.
      exfalso. apply Hdstneq.
      eapply bt_leaf_path_self; eauto.
    + right; exact Hchild.
Qed.

Lemma remove_right_preserves_path :
  forall (t : BinaryTreeType V) (x y a b : V),
    t.(right_child) x = Some y ->
    t.(left_child) y = None ->
    t.(right_child) y = None ->
    b <> y ->
    bt_path t a b ->
    clos_refl_trans
      (fun u v => t.(left_child) u = Some v \/ remove_right_child t x u = Some v)
      a b.
Proof.
  intros t x y a b Hxy Hy_left Hy_right Hbneq Hpath.
  unfold bt_path in Hpath.
  induction_1n Hpath.
  - reflexivity.
  - transitivity_1n a0.
    + eapply remove_right_old_child with (dst := b); eauto.
    + apply IHrt; auto.
Qed.

Lemma remove_list_keep :
  forall (x y : V) (l : list V),
    x <> y ->
    In x l ->
    In x (remove V_eq_dec y l).
Proof.
  intros x y l Hneq Hin.
  induction l as [|a l IH]; simpl in *; [contradiction|].
  destruct (V_eq_dec y a) as [Hya | Hya].
  - subst a.
    destruct Hin as [Hin | Hin]; [subst x; contradiction|].
    apply IH; exact Hin.
  - destruct Hin as [Hin | Hin].
    + subst a. left; reflexivity.
    + right. apply IH; exact Hin.
Qed.

Lemma remove_list_in_inv :
  forall (x y : V) (l : list V),
    In x (remove V_eq_dec y l) ->
    In x l /\ x <> y.
Proof.
  intros x y l.
  induction l as [|a l IH]; simpl; intro Hin; [contradiction|].
  destruct (V_eq_dec y a) as [Hya | Hya].
  - subst a.
    destruct (IH Hin) as [Hin_old Hneq].
    split; [right; exact Hin_old | exact Hneq].
  - destruct Hin as [Hin | Hin].
    + subst a.
      split; [left; reflexivity|].
      intro Hxy. subst x. contradiction.
    + destruct (IH Hin) as [Hin_old Hneq].
      split; [right; exact Hin_old | exact Hneq].
Qed.

Lemma remove_list_NoDup :
  forall (x : V) (l : list V),
    NoDup l ->
    NoDup (remove V_eq_dec x l).
Proof.
  intros x l Hnodup.
  induction l as [|a l IH]; simpl; [constructor|].
  inversion Hnodup as [|? ? Hnotin Hnodup_tail]; subst.
  destruct (V_eq_dec x a) as [Hxa | Hxa].
  - apply IH; auto.
  - constructor.
    + intro Hin.
      destruct (remove_list_in_inv a x l Hin) as [Hin_old _].
      contradiction.
    + apply IH; auto.
Qed.

Lemma remove_root_preserves_gvalid :
  forall (t : BinaryTreeType V) (x : V),
    gvalid t ->
    t.(vset) x ->
    t.(root) = Some x ->
    t.(left_child) x = None ->
    t.(right_child) x = None ->
    gvalid (remove_root t).
Proof.
  intros t x Hvalid Hx Hroot Hleft Hright.
  unfold gvalid, remove_root.
  constructor; simpl.
  - intros r H; discriminate.
  - intros v r H. discriminate.
  - intros c a b Ha Hb Ha_edge Hb_edge. contradiction.
  - intros a b Ha Hchild. contradiction.
  - intros v Hv. split; reflexivity.
  - intros a b c Ha Hb Hc Hleft' Hright'. contradiction.
  - intros v Hv. contradiction.
  - intros v Hv. contradiction.
  - intros v Hin. contradiction.
  - constructor.
Qed.

Lemma remove_left_child_old :
  forall (t : BinaryTreeType V) (x a b : V),
    remove_left_child t x a = Some b ->
    t.(left_child) a = Some b.
Proof.
  intros t x a b H.
  rewrite remove_left_child_eq in H.
  unfold remove_left_child_value in H.
  destruct (V_eq_dec a x); [discriminate|exact H].
Qed.

Lemma remove_right_child_old :
  forall (t : BinaryTreeType V) (x a b : V),
    remove_right_child t x a = Some b ->
    t.(right_child) a = Some b.
Proof.
  intros t x a b H.
  rewrite remove_right_child_eq in H.
  unfold remove_right_child_value in H.
  destruct (V_eq_dec a x); [discriminate|exact H].
Qed.

Lemma remove_left_leaf_preserves_gvalid :
  forall (t : BinaryTreeType V) (x y : V),
    gvalid t ->
    t.(vset) x ->
    t.(left_child) x = Some y ->
    t.(left_child) y = None ->
    t.(right_child) y = None ->
    gvalid (remove_left_leaf t x).
Proof.
  intros t x y Hvalid Hx Hxy Hy_left Hy_right.
  assert (Hy : t.(vset) y) by (eapply child_valid; eauto).
  unfold gvalid, remove_left_leaf, remove_left_vset.
  constructor; simpl.
  - intros r Hroot.
    split.
    + eapply root_valid; eauto.
    + intro Hxr.
      rewrite Hxy in Hxr.
      inversion Hxr; subst r.
      pose proof (root_no_parents t Hvalid x y Hroot) as [HnL _].
      contradiction.
  - intros v r Hroot.
    pose proof (root_no_parents t Hvalid v r Hroot) as [HnL HnR].
    split.
    + rewrite remove_left_child_eq.
      unfold remove_left_child_value.
      destruct (V_eq_dec v x); [intro H; discriminate|exact HnL].
    + exact HnR.
  - intros c a b Ha Hb Ha_edge Hb_edge.
    destruct Ha as [Ha _].
    destruct Hb as [Hb _].
    assert (Ha_old_edge : t.(left_child) a = Some c \/ t.(right_child) a = Some c).
    { destruct Ha_edge as [Ha_edge | Ha_edge].
      - left. eapply remove_left_child_old; eauto.
      - right. exact Ha_edge. }
    assert (Hb_old_edge : t.(left_child) b = Some c \/ t.(right_child) b = Some c).
    { destruct Hb_edge as [Hb_edge | Hb_edge].
      - left. eapply remove_left_child_old; eauto.
      - right. exact Hb_edge. }
    eapply father_unique; eauto.
  - intros a b Ha Hchild.
    destruct Ha as [Ha Ha_not_deleted].
    assert (Hchild_old : t.(left_child) a = Some b \/ t.(right_child) a = Some b).
    { destruct Hchild as [Hchild | Hchild].
      - left. eapply remove_left_child_old; eauto.
      - right. exact Hchild. }
    split.
    + eapply child_valid; eauto.
    + intro Hxb.
      destruct Hchild as [Hleft_new | Hright_old].
      * assert (Hleft_old : t.(left_child) a = Some b)
          by (eapply remove_left_child_old; eauto).
        pose proof (father_unique t Hvalid b x a Hx Ha
          (or_introl Hxb) (or_introl Hleft_old)) as Hxa.
        subst a.
        rewrite remove_left_child_eq in Hleft_new.
        unfold remove_left_child_value in Hleft_new.
        destruct (V_eq_dec x x); discriminate || contradiction.
      * pose proof (father_unique t Hvalid b x a Hx Ha
          (or_introl Hxb) (or_intror Hright_old)) as Hxa.
        subst a.
        pose proof (child_distinct t Hvalid x b b Hx
          (child_valid t Hvalid x b Hx (or_introl Hxb))
          (child_valid t Hvalid x b Hx (or_intror Hright_old))
          Hxb Hright_old) as Hbb.
        contradiction.
  - intros v Hnot_valid.
    assert (Hcase : ~ t.(vset) v \/ t.(left_child) x = Some v).
    { destruct (classic (t.(vset) v)) as [Hv | Hv].
      - right.
        destruct (classic (t.(left_child) x = Some v)) as [Hdel | Hdel];
          [exact Hdel |].
        exfalso.
        apply Hnot_valid.
        split; assumption.
      - left; exact Hv. }
    destruct Hcase as [Hnot_old | Hdel].
    + destruct (invalid_child_is_none t Hvalid v Hnot_old) as [Hleft_old Hright_old].
      split.
      * rewrite remove_left_child_eq.
        unfold remove_left_child_value.
        destruct (V_eq_dec v x) as [Hvx | Hvx];
          [subst v; contradiction | exact Hleft_old].
      * exact Hright_old.
    + assert (Hvy : v = y).
      { rewrite Hxy in Hdel.
        inversion Hdel; reflexivity. }
      subst v.
      split.
      * rewrite remove_left_child_eq.
        unfold remove_left_child_value.
        destruct (V_eq_dec y x) as [Hyx | Hyx].
        -- subst y. rewrite Hxy in Hy_left. discriminate.
        -- exact Hy_left.
      * exact Hy_right.
  - intros a b c Ha Hb Hc Hleft Hright.
    destruct Ha as [Ha _].
    destruct Hb as [Hb _].
    destruct Hc as [Hc _].
    assert (Hleft_old : t.(left_child) a = Some b)
      by (eapply remove_left_child_old; eauto).
    exact (child_distinct t Hvalid a b c Ha
      (child_valid t Hvalid a b Ha (or_introl Hleft_old))
      (child_valid t Hvalid a c Ha (or_intror Hright))
      Hleft_old Hright).
  - intros v Hv.
    destruct Hv as [Hv Hnot_deleted].
    destruct (path_exists t Hvalid v Hv) as [r [Hroot Hpath]].
    exists r. split; [exact Hroot|].
    eapply remove_left_preserves_path; eauto.
    intro Hvy. subst v. contradiction.
  - intros v Hv.
    destruct Hv as [Hv Hnot_deleted].
    rewrite Hxy.
    apply remove_list_keep.
    + intro Hvy. subst v. contradiction.
    + eapply finite_vertices; eauto.
  - intros v Hin.
    rewrite Hxy in Hin.
    destruct (remove_list_in_inv v y t.(listV) Hin) as [Hin_old Hvy].
    split.
    + eapply listV_sound; eauto.
    + intro Hxv.
      rewrite Hxy in Hxv.
      inversion Hxv; subst v.
      contradiction.
  - rewrite Hxy.
    apply remove_list_NoDup.
    apply listV_NoDup; auto.
Qed.

Lemma remove_right_leaf_preserves_gvalid :
  forall (t : BinaryTreeType V) (x y : V),
    gvalid t ->
    t.(vset) x ->
    t.(right_child) x = Some y ->
    t.(left_child) y = None ->
    t.(right_child) y = None ->
    gvalid (remove_right_leaf t x).
Proof.
  intros t x y Hvalid Hx Hxy Hy_left Hy_right.
  assert (Hy : t.(vset) y) by (eapply child_valid; eauto).
  unfold gvalid, remove_right_leaf, remove_right_vset.
  constructor; simpl.
  - intros r Hroot.
    split.
    + eapply root_valid; eauto.
    + intro Hxr.
      rewrite Hxy in Hxr.
      inversion Hxr; subst r.
      pose proof (root_no_parents t Hvalid x y Hroot) as [_ HnR].
      contradiction.
  - intros v r Hroot.
    pose proof (root_no_parents t Hvalid v r Hroot) as [HnL HnR].
    split.
    + exact HnL.
    + rewrite remove_right_child_eq.
      unfold remove_right_child_value.
      destruct (V_eq_dec v x); [intro H; discriminate|exact HnR].
  - intros c a b Ha Hb Ha_edge Hb_edge.
    destruct Ha as [Ha _].
    destruct Hb as [Hb _].
    assert (Ha_old_edge : t.(left_child) a = Some c \/ t.(right_child) a = Some c).
    { destruct Ha_edge as [Ha_edge | Ha_edge].
      - left. exact Ha_edge.
      - right. eapply remove_right_child_old; eauto. }
    assert (Hb_old_edge : t.(left_child) b = Some c \/ t.(right_child) b = Some c).
    { destruct Hb_edge as [Hb_edge | Hb_edge].
      - left. exact Hb_edge.
      - right. eapply remove_right_child_old; eauto. }
    eapply father_unique; eauto.
  - intros a b Ha Hchild.
    destruct Ha as [Ha Ha_not_deleted].
    assert (Hchild_old : t.(left_child) a = Some b \/ t.(right_child) a = Some b).
    { destruct Hchild as [Hchild | Hchild].
      - left. exact Hchild.
      - right. eapply remove_right_child_old; eauto. }
    split.
    + eapply child_valid; eauto.
    + intro Hxb.
      destruct Hchild as [Hleft_old | Hright_new].
      * pose proof (father_unique t Hvalid b x a Hx Ha
          (or_intror Hxb) (or_introl Hleft_old)) as Hxa.
        subst a.
        pose proof (child_distinct t Hvalid x b b Hx
          (child_valid t Hvalid x b Hx (or_introl Hleft_old))
          (child_valid t Hvalid x b Hx (or_intror Hxb))
          Hleft_old Hxb) as Hbb.
        contradiction.
      * assert (Hright_old : t.(right_child) a = Some b)
          by (eapply remove_right_child_old; eauto).
        pose proof (father_unique t Hvalid b x a Hx Ha
          (or_intror Hxb) (or_intror Hright_old)) as Hxa.
        subst a.
        rewrite remove_right_child_eq in Hright_new.
        unfold remove_right_child_value in Hright_new.
        destruct (V_eq_dec x x); discriminate || contradiction.
  - intros v Hnot_valid.
    assert (Hcase : ~ t.(vset) v \/ t.(right_child) x = Some v).
    { destruct (classic (t.(vset) v)) as [Hv | Hv].
      - right.
        destruct (classic (t.(right_child) x = Some v)) as [Hdel | Hdel];
          [exact Hdel |].
        exfalso.
        apply Hnot_valid.
        split; assumption.
      - left; exact Hv. }
    destruct Hcase as [Hnot_old | Hdel].
    + destruct (invalid_child_is_none t Hvalid v Hnot_old) as [Hleft_old Hright_old].
      split.
      * exact Hleft_old.
      * rewrite remove_right_child_eq.
        unfold remove_right_child_value.
        destruct (V_eq_dec v x) as [Hvx | Hvx];
          [subst v; contradiction | exact Hright_old].
    + assert (Hvy : v = y).
      { rewrite Hxy in Hdel.
        inversion Hdel; reflexivity. }
      subst v.
      split.
      * exact Hy_left.
      * rewrite remove_right_child_eq.
        unfold remove_right_child_value.
        destruct (V_eq_dec y x) as [Hyx | Hyx].
        -- subst y. rewrite Hxy in Hy_right. discriminate.
        -- exact Hy_right.
  - intros a b c Ha Hb Hc Hleft Hright.
    destruct Ha as [Ha _].
    destruct Hb as [Hb _].
    destruct Hc as [Hc _].
    assert (Hright_old : t.(right_child) a = Some c)
      by (eapply remove_right_child_old; eauto).
    exact (child_distinct t Hvalid a b c Ha
      (child_valid t Hvalid a b Ha (or_introl Hleft))
      (child_valid t Hvalid a c Ha (or_intror Hright_old))
      Hleft Hright_old).
  - intros v Hv.
    destruct Hv as [Hv Hnot_deleted].
    destruct (path_exists t Hvalid v Hv) as [r [Hroot Hpath]].
    exists r. split; [exact Hroot|].
    eapply remove_right_preserves_path; eauto.
    intro Hvy. subst v. contradiction.
  - intros v Hv.
    destruct Hv as [Hv Hnot_deleted].
    rewrite Hxy.
    apply remove_list_keep.
    + intro Hvy. subst v. contradiction.
    + eapply finite_vertices; eauto.
  - intros v Hin.
    rewrite Hxy in Hin.
    destruct (remove_list_in_inv v y t.(listV) Hin) as [Hin_old Hvy].
    split.
    + eapply listV_sound; eauto.
    + intro Hxv.
      rewrite Hxy in Hxv.
      inversion Hxv; subst v.
      contradiction.
  - rewrite Hxy.
    apply remove_list_NoDup.
    apply listV_NoDup; auto.
Qed.

End DELETION.

Lemma binarytree_node_domain_from_gvalid : forall (t : BinaryTreeType V), gvalid t -> bst_node_domain_valid t t.(listV).
Proof.
  intros t Hvalid.
  constructor; simpl.
  - reflexivity.
  - intros x; split; intro Hx.
    + eapply listV_sound; eauto.
    + eapply finite_vertices; eauto.
  - intros parent child Hparent Hchild.
    eapply child_valid; eauto.
  - intros x Hx.
    eapply invalid_child_is_none; eauto.
  - apply listV_NoDup; exact Hvalid.
Qed.

Lemma binarytree_gvalid_from_shape : forall (t : BinaryTreeType V) (l : list V), binary_tree_shape_valid t l -> gvalid t.
Proof.
  intros t l Hshape.
  destruct Hshape as [Hdomain Hroot Hroot_no_incoming Hparent_unique Hchildren_distinct Hreachable].
  destruct Hdomain as [Hpermutation Hmembership Hchild_closed Hinvalid_children Hnodup].
  constructor.
  - intros root Hroot_eq.
    destruct t.(root) as [actual_root |] eqn:Hroot_value; [|discriminate].
    inversion Hroot_eq; subst root.
    change (match t.(root) with Some r => t.(vset) r | None => True end) in Hroot.
    rewrite Hroot_value in Hroot.
    exact Hroot.
  - exact Hroot_no_incoming.
  - exact Hparent_unique.
  - exact Hchild_closed.
  - exact Hinvalid_children.
  - intros parent left right Hparent _ _ Hleft Hright.
    eapply Hchildren_distinct; eauto.
  - exact Hreachable.
  - intros x Hx.
    eapply Permutation_in.
    + exact Hpermutation.
    + apply (proj2 (Hmembership x)); exact Hx.
  - intros x Hx.
    apply (proj1 (Hmembership x)).
    eapply Permutation_in.
    + apply Permutation_sym; exact Hpermutation.
    + exact Hx.
  - eapply Permutation_NoDup.
    + exact Hpermutation.
    + exact Hnodup.
Qed.

Lemma left_rotate_preserves_node_domain : forall (t : BinaryTreeType V) (x y : V) (l : list V), bst_node_domain_valid t l -> t.(vset) x -> t.(right_child) x = Some y -> bst_node_domain_valid (left_rotate t x y) l.
Proof.
  intros t x y l Hdomain Hx Hxy.
  pose proof Hdomain as Hdomain_before.
  assert (Hy : t.(vset) y).
  { destruct Hdomain_before as [_ _ Hclosed _ _].
    eapply Hclosed with (parent := x); [exact Hx|right; exact Hxy]. }
  destruct Hdomain_before as [Hperm Hmembership Hclosed Hinvalid Hnodup].
  constructor; simpl.
  - exact Hperm.
  - exact Hmembership.
  - intros parent child Hparent Hchild.
    assert (Hparent_in : In parent t.(listV)).
    { apply (proj2 (node_domain_listV_iff t l Hdomain parent)); exact Hparent. }
    destruct Hchild as [Hchild | Hchild].
    + unfold left_rotate_left_child in Hchild.
      rewrite iter_override_in in Hchild by exact Hparent_in.
      unfold left_rotate_left_value in Hchild.
      destruct (V_eq_dec parent y) as [Heq | Hneq].
      * subst parent; inversion Hchild; subst child; exact Hx.
      * destruct (V_eq_dec parent x) as [Heq | Hneqx].
        -- subst parent; eapply Hclosed; eauto; left; exact Hchild.
        -- unfold replace_child in Hchild.
           destruct (t.(left_child) parent) as [old_child |] eqn:Hold; [|discriminate].
           destruct (V_eq_dec old_child x) as [Heq | Hneqold].
           ++ subst old_child; inversion Hchild; subst child; exact Hy.
           ++ inversion Hchild; subst child; eapply Hclosed; eauto; left; exact Hold.
    + unfold left_rotate_right_child in Hchild.
      rewrite iter_override_in in Hchild by exact Hparent_in.
      unfold left_rotate_right_value in Hchild.
      destruct (V_eq_dec parent x) as [Heq | Hneq].
      * subst parent; eapply Hclosed with (parent := y); [exact Hy|left; exact Hchild].
      * destruct (V_eq_dec parent y) as [Heq | Hneqy].
        -- subst parent; eapply Hclosed; eauto; right; exact Hchild.
        -- unfold replace_child in Hchild.
           destruct (t.(right_child) parent) as [old_child |] eqn:Hold; [|discriminate].
           destruct (V_eq_dec old_child x) as [Heq | Hneqold].
           ++ subst old_child; inversion Hchild; subst child; exact Hy.
           ++ inversion Hchild; subst child; eapply Hclosed; eauto; right; exact Hold.
  - intros z Hz.
    assert (Hz_not_in : ~ In z t.(listV)).
    { intro Hin.
      apply Hz.
      apply (proj1 (node_domain_listV_iff t l Hdomain z)); exact Hin. }
    destruct (Hinvalid z Hz) as [Hleft Hright].
    split.
    + unfold left_rotate_left_child.
      rewrite iter_override_not_in by exact Hz_not_in.
      exact Hleft.
    + unfold left_rotate_right_child.
      rewrite iter_override_not_in by exact Hz_not_in.
      exact Hright.
  - exact Hnodup.
Qed.

Lemma right_rotate_preserves_node_domain : forall (t : BinaryTreeType V) (x y : V) (l : list V), bst_node_domain_valid t l -> t.(vset) x -> t.(left_child) x = Some y -> bst_node_domain_valid (right_rotate t x y) l.
Proof.
  intros t x y l Hdomain Hx Hxy.
  pose proof Hdomain as Hdomain_before.
  assert (Hy : t.(vset) y).
  { destruct Hdomain_before as [_ _ Hclosed _ _].
    eapply Hclosed with (parent := x); [exact Hx|left; exact Hxy]. }
  destruct Hdomain_before as [Hperm Hmembership Hclosed Hinvalid Hnodup].
  constructor; simpl.
  - exact Hperm.
  - exact Hmembership.
  - intros parent child Hparent Hchild.
    assert (Hparent_in : In parent t.(listV)).
    { apply (proj2 (node_domain_listV_iff t l Hdomain parent)); exact Hparent. }
    destruct Hchild as [Hchild | Hchild].
    + unfold right_rotate_left_child in Hchild.
      rewrite iter_override_in in Hchild by exact Hparent_in.
      unfold right_rotate_left_child_value in Hchild.
      destruct (V_eq_dec parent x) as [Heq | Hneq].
      * subst parent; eapply Hclosed with (parent := y); [exact Hy|right; exact Hchild].
      * destruct (V_eq_dec parent y) as [Heq | Hneqy].
        -- subst parent; eapply Hclosed; eauto; left; exact Hchild.
        -- unfold replace_child in Hchild.
           destruct (t.(left_child) parent) as [old_child |] eqn:Hold; [|discriminate].
           destruct (V_eq_dec old_child x) as [Heq | Hneqold].
           ++ subst old_child; inversion Hchild; subst child; exact Hy.
           ++ inversion Hchild; subst child; eapply Hclosed; eauto; left; exact Hold.
    + unfold right_rotate_right_child in Hchild.
      rewrite iter_override_in in Hchild by exact Hparent_in.
      unfold right_rotate_right_child_value in Hchild.
      destruct (V_eq_dec parent y) as [Heq | Hneq].
      * subst parent; inversion Hchild; subst child; exact Hx.
      * destruct (V_eq_dec parent x) as [Heq | Hneqx].
        -- subst parent; eapply Hclosed; eauto; right; exact Hchild.
        -- unfold replace_child in Hchild.
           destruct (t.(right_child) parent) as [old_child |] eqn:Hold; [|discriminate].
           destruct (V_eq_dec old_child x) as [Heq | Hneqold].
           ++ subst old_child; inversion Hchild; subst child; exact Hy.
           ++ inversion Hchild; subst child; eapply Hclosed; eauto; right; exact Hold.
  - intros z Hz.
    assert (Hz_not_in : ~ In z t.(listV)).
    { intro Hin.
      apply Hz.
      apply (proj1 (node_domain_listV_iff t l Hdomain z)); exact Hin. }
    destruct (Hinvalid z Hz) as [Hleft Hright].
    split.
    + unfold right_rotate_left_child.
      rewrite iter_override_not_in by exact Hz_not_in.
      exact Hleft.
    + unfold right_rotate_right_child.
      rewrite iter_override_not_in by exact Hz_not_in.
      exact Hright.
  - exact Hnodup.
Qed.

Lemma left_rotate_node_domain_sound : forall (t : BinaryTreeType V) (x y : V) (l : list V), bst_node_domain_valid t l -> t.(vset) x -> t.(right_child) x = Some y -> x <> y -> left_rotation_node_domain_valid t (left_rotate t x y) l x y.
Proof.
  intros t x y l Hdomain Hx Hxy Hneq.
  pose proof Hdomain as Hdomain_before.
  assert (Hy : t.(vset) y).
  { destruct Hdomain_before as [_ _ Hclosed _ _].
    eapply Hclosed with (parent := x); [exact Hx|right; exact Hxy]. }
  assert (Hx_in : In x t.(listV)).
  { apply (proj2 (node_domain_listV_iff t l Hdomain x)); exact Hx. }
  assert (Hy_in : In y t.(listV)).
  { apply (proj2 (node_domain_listV_iff t l Hdomain y)); exact Hy. }
  constructor.
  - split; [exact Hdomain|].
    eapply left_rotate_preserves_node_domain; eauto.
  - constructor; simpl.
    + exact Hx.
    + exact Hxy.
    + exact Hneq.
    + intros z; reflexivity.
    + repeat split.
      * intro Hroot.
        unfold left_rotate_root.
        rewrite Hroot.
        destruct (V_eq_dec x x); congruence.
      * intros root Hroot Hroot_neq.
        unfold left_rotate_root.
        rewrite Hroot.
        destruct (V_eq_dec x root); congruence.
      * intro Hroot.
        unfold left_rotate_root.
        rewrite Hroot.
        reflexivity.
    + repeat split.
      * unfold left_rotate_left_child.
        rewrite iter_override_in by exact Hy_in.
        unfold left_rotate_left_value.
        destruct (V_eq_dec y y); congruence.
      * unfold left_rotate_right_child.
        rewrite iter_override_in by exact Hy_in.
        unfold left_rotate_right_value.
        destruct (V_eq_dec y x) as [Heq | Heq]; [congruence|].
        destruct (V_eq_dec y y); congruence.
      * unfold left_rotate_left_child.
        rewrite iter_override_in by exact Hx_in.
        unfold left_rotate_left_value.
        destruct (V_eq_dec x y) as [Heq | Heq]; [congruence|].
        destruct (V_eq_dec x x); congruence.
      * unfold left_rotate_right_child.
        rewrite iter_override_in by exact Hx_in.
        unfold left_rotate_right_value.
        destruct (V_eq_dec x x); congruence.
    + split.
      * intros z Hz Hzx Hzy Hchild.
        assert (Hz_in : In z t.(listV)).
        { apply (proj2 (node_domain_listV_iff t l Hdomain z)); exact Hz. }
        unfold left_rotate_left_child.
        rewrite iter_override_in by exact Hz_in.
        unfold left_rotate_left_value, replace_child.
        destruct (V_eq_dec z y); [contradiction|].
        destruct (V_eq_dec z x); [contradiction|].
        rewrite Hchild.
        destruct (V_eq_dec x x); congruence.
      * intros z Hz Hzx Hzy Hchild.
        assert (Hz_in : In z t.(listV)).
        { apply (proj2 (node_domain_listV_iff t l Hdomain z)); exact Hz. }
        unfold left_rotate_right_child.
        rewrite iter_override_in by exact Hz_in.
        unfold left_rotate_right_value, replace_child.
        destruct (V_eq_dec z x); [contradiction|].
        destruct (V_eq_dec z y); [contradiction|].
        rewrite Hchild.
        destruct (V_eq_dec x x); congruence.
    + split.
      * intros z Hz Hzx Hzy Hchild.
        assert (Hz_in : In z t.(listV)).
        { apply (proj2 (node_domain_listV_iff t l Hdomain z)); exact Hz. }
        unfold left_rotate_left_child.
        rewrite iter_override_in by exact Hz_in.
        unfold left_rotate_left_value, replace_child.
        destruct (V_eq_dec z y); [contradiction|].
        destruct (V_eq_dec z x); [contradiction|].
        destruct (t.(left_child) z) as [child |] eqn:Hold; [|reflexivity].
        destruct (V_eq_dec child x) as [Heq | Heq]; [subst; contradiction|reflexivity].
      * intros z Hz Hzx Hzy Hchild.
        assert (Hz_in : In z t.(listV)).
        { apply (proj2 (node_domain_listV_iff t l Hdomain z)); exact Hz. }
        unfold left_rotate_right_child.
        rewrite iter_override_in by exact Hz_in.
        unfold left_rotate_right_value, replace_child.
        destruct (V_eq_dec z x); [contradiction|].
        destruct (V_eq_dec z y); [contradiction|].
        destruct (t.(right_child) z) as [child |] eqn:Hold; [|reflexivity].
        destruct (V_eq_dec child x) as [Heq | Heq]; [subst; contradiction|reflexivity].
Qed.

Lemma right_rotate_node_domain_sound : forall (t : BinaryTreeType V) (x y : V) (l : list V), bst_node_domain_valid t l -> t.(vset) x -> t.(left_child) x = Some y -> x <> y -> right_rotation_node_domain_valid t (right_rotate t x y) l x y.
Proof.
  intros t x y l Hdomain Hx Hxy Hneq.
  pose proof Hdomain as Hdomain_before.
  assert (Hy : t.(vset) y).
  { destruct Hdomain_before as [_ _ Hclosed _ _].
    eapply Hclosed with (parent := x); [exact Hx|left; exact Hxy]. }
  assert (Hx_in : In x t.(listV)).
  { apply (proj2 (node_domain_listV_iff t l Hdomain x)); exact Hx. }
  assert (Hy_in : In y t.(listV)).
  { apply (proj2 (node_domain_listV_iff t l Hdomain y)); exact Hy. }
  constructor.
  - split; [exact Hdomain|].
    eapply right_rotate_preserves_node_domain; eauto.
  - constructor; simpl.
    + exact Hx.
    + exact Hxy.
    + exact Hneq.
    + intros z; reflexivity.
    + repeat split.
      * intro Hroot.
        unfold right_rotate_root.
        rewrite Hroot.
        destruct (V_eq_dec x x); congruence.
      * intros root Hroot Hroot_neq.
        unfold right_rotate_root.
        rewrite Hroot.
        destruct (V_eq_dec x root); congruence.
      * intro Hroot.
        unfold right_rotate_root.
        rewrite Hroot.
        reflexivity.
    + repeat split.
      * unfold right_rotate_right_child.
        rewrite iter_override_in by exact Hy_in.
        unfold right_rotate_right_child_value.
        destruct (V_eq_dec y y); congruence.
      * unfold right_rotate_left_child.
        rewrite iter_override_in by exact Hy_in.
        unfold right_rotate_left_child_value.
        destruct (V_eq_dec y x) as [Heq | Heq]; [congruence|].
        destruct (V_eq_dec y y); congruence.
      * unfold right_rotate_right_child.
        rewrite iter_override_in by exact Hx_in.
        unfold right_rotate_right_child_value.
        destruct (V_eq_dec x y) as [Heq | Heq]; [congruence|].
        destruct (V_eq_dec x x); congruence.
      * unfold right_rotate_left_child.
        rewrite iter_override_in by exact Hx_in.
        unfold right_rotate_left_child_value.
        destruct (V_eq_dec x x); congruence.
    + split.
      * intros z Hz Hzx Hzy Hchild.
        assert (Hz_in : In z t.(listV)).
        { apply (proj2 (node_domain_listV_iff t l Hdomain z)); exact Hz. }
        unfold right_rotate_left_child.
        rewrite iter_override_in by exact Hz_in.
        unfold right_rotate_left_child_value, replace_child.
        destruct (V_eq_dec z x); [contradiction|].
        destruct (V_eq_dec z y); [contradiction|].
        rewrite Hchild.
        destruct (V_eq_dec x x); congruence.
      * intros z Hz Hzx Hzy Hchild.
        assert (Hz_in : In z t.(listV)).
        { apply (proj2 (node_domain_listV_iff t l Hdomain z)); exact Hz. }
        unfold right_rotate_right_child.
        rewrite iter_override_in by exact Hz_in.
        unfold right_rotate_right_child_value, replace_child.
        destruct (V_eq_dec z y); [contradiction|].
        destruct (V_eq_dec z x); [contradiction|].
        rewrite Hchild.
        destruct (V_eq_dec x x); congruence.
    + split.
      * intros z Hz Hzx Hzy Hchild.
        assert (Hz_in : In z t.(listV)).
        { apply (proj2 (node_domain_listV_iff t l Hdomain z)); exact Hz. }
        unfold right_rotate_left_child.
        rewrite iter_override_in by exact Hz_in.
        unfold right_rotate_left_child_value, replace_child.
        destruct (V_eq_dec z x); [contradiction|].
        destruct (V_eq_dec z y); [contradiction|].
        destruct (t.(left_child) z) as [child |] eqn:Hold; [|reflexivity].
        destruct (V_eq_dec child x) as [Heq | Heq]; [subst; contradiction|reflexivity].
      * intros z Hz Hzx Hzy Hchild.
        assert (Hz_in : In z t.(listV)).
        { apply (proj2 (node_domain_listV_iff t l Hdomain z)); exact Hz. }
        unfold right_rotate_right_child.
        rewrite iter_override_in by exact Hz_in.
        unfold right_rotate_right_child_value, replace_child.
        destruct (V_eq_dec z y); [contradiction|].
        destruct (V_eq_dec z x); [contradiction|].
        destruct (t.(right_child) z) as [child |] eqn:Hold; [|reflexivity].
        destruct (V_eq_dec child x) as [Heq | Heq]; [subst; contradiction|reflexivity].
Qed.

End BT_OPERATIONS.

#[export] Instance BinaryTree_rotate_operations
  {V : Type}
  (V_eq_dec : forall x y : V, {x = y} + {x <> y})
  : @BinaryTreeRotateOperation (BinaryTreeType V) V V _ _ _ _ _ _.
Proof.
  refine {|
    GraphLib.directed.binarytree.left_rotate := @left_rotate V V_eq_dec;
    GraphLib.directed.binarytree.right_rotate := @right_rotate V V_eq_dec
  |}.
  - intros g x y Hg Hx Hxy.
    change (g.(vset) x) in Hx.
    change (g.(right_child) x = Some y) in Hxy.
    assert (Hneq : x <> y).
    { intro Heq; subst y.
      eapply (bt_child_no_self g x); eauto.
      unfold bt_child; right; exact Hxy. }
    pose proof (left_rotate_node_domain_sound V_eq_dec g x y g.(listV) (binarytree_node_domain_from_gvalid g Hg) Hx Hxy Hneq) as Hnode_domain.
    constructor.
    + split; [exact Hg|].
      exact (left_rotate_preserves_gvalid V_eq_dec g x y Hg Hx Hxy).
    + exact (lrnd_core_valid _ _ _ _ _ Hnode_domain).
  - intros g x y Hg Hx Hxy.
    change (g.(vset) x) in Hx.
    change (g.(left_child) x = Some y) in Hxy.
    assert (Hneq : x <> y).
    { intro Heq; subst y.
      eapply (bt_child_no_self g x); eauto.
      unfold bt_child; left; exact Hxy. }
    pose proof (right_rotate_node_domain_sound V_eq_dec g x y g.(listV) (binarytree_node_domain_from_gvalid g Hg) Hx Hxy Hneq) as Hnode_domain.
    constructor.
    + split; [exact Hg|].
      exact (right_rotate_preserves_gvalid V_eq_dec g x y Hg Hx Hxy).
    + exact (rrnd_core_valid _ _ _ _ _ Hnode_domain).
Defined.

#[export] Instance BinaryTree_insert_operations
  {V : Type}
  (V_eq_dec : forall x y : V, {x = y} + {x <> y})
  : @BinaryTreeInsertOperation (BinaryTreeType V) V V _ _ _ _ _ _ _.
Proof.
  refine {|
    GraphLib.directed.binarytree.insert_root := @insert_root V;
    GraphLib.directed.binarytree.insert_left := @insert_left V V_eq_dec;
    GraphLib.directed.binarytree.insert_right := @insert_right V V_eq_dec
  |}.
  - intros g y Hg Hroot Hy.
    change (g.(root) = None) in Hroot.
    pose proof (insert_root_preserves_gvalid g y Hg Hroot Hy) as Hg'.
    constructor; simpl.
    + exists g.(listV); split.
      * constructor; simpl.
        -- reflexivity.
        -- intros v; split; intro Hv.
           ++ eapply listV_sound; eauto.
           ++ eapply finite_vertices; eauto.
        -- intros parent child Hparent Hchild; exact (child_valid g Hg parent child Hparent Hchild).
        -- intros v Hv; exact (invalid_child_is_none g Hg v Hv).
        -- exact (listV_NoDup g Hg).
      * constructor; simpl.
        -- reflexivity.
        -- intros v; split; intro Hv.
           ++ destruct Hv as [Hvy | Hv].
              ** right; symmetry; exact Hvy.
              ** left; eapply listV_sound; eauto.
           ++ destruct Hv as [Hv | Hvy].
              ** right; eapply finite_vertices; eauto.
              ** left; symmetry; exact Hvy.
        -- intros parent child Hparent Hchild; exact (child_valid (insert_root g y) Hg' parent child Hparent Hchild).
        -- intros v Hv; exact (invalid_child_is_none (insert_root g y) Hg' v Hv).
        -- exact (listV_NoDup (insert_root g y) Hg').
    + exact Hroot.
    + exact Hy.
    + intros z; split; intro Hz; exact Hz.
    + reflexivity.
    + split; reflexivity.
    + split; intros z Hz.
      * exfalso.
        destruct (path_exists g Hg z Hz) as [r [Hrroot _]].
        rewrite Hroot in Hrroot. discriminate.
      * exfalso.
        destruct (path_exists g Hg z Hz) as [r [Hrroot _]].
        rewrite Hroot in Hrroot. discriminate.
  - intros g x y Hg Hx Hy Hleft.
    change (g.(vset) x) in Hx.
    change (g.(left_child) x = None) in Hleft.
    assert (Hxy : x <> y) by (intro H; subst; contradiction).
    pose proof (insert_left_preserves_gvalid V_eq_dec g x y Hg Hx Hy Hleft) as Hg'.
    constructor; simpl.
    + exists g.(listV); split.
      * constructor; simpl.
        -- reflexivity.
        -- intros v; split; intro Hv.
           ++ eapply listV_sound; eauto.
           ++ eapply finite_vertices; eauto.
        -- intros parent child Hparent Hchild; exact (child_valid g Hg parent child Hparent Hchild).
        -- intros v Hv; exact (invalid_child_is_none g Hg v Hv).
        -- exact (listV_NoDup g Hg).
      * constructor; simpl.
        -- reflexivity.
        -- intros v; split; intro Hv.
           ++ destruct Hv as [Hvy | Hv].
              ** right; symmetry; exact Hvy.
              ** left; eapply listV_sound; eauto.
           ++ destruct Hv as [Hv | Hvy].
              ** right; eapply finite_vertices; eauto.
              ** left; symmetry; exact Hvy.
        -- intros parent child Hparent Hchild; exact (child_valid (insert_left V_eq_dec g x y) Hg' parent child Hparent Hchild).
        -- intros v Hv; exact (invalid_child_is_none (insert_left V_eq_dec g x y) Hg' v Hv).
        -- exact (listV_NoDup (insert_left V_eq_dec g x y) Hg').
    + exact Hx.
    + exact Hy.
    + exact Hleft.
    + intros z; split; intro Hz; exact Hz.
    + reflexivity.
	    + rewrite insert_left_child_eq.
	      unfold insert_left_child_value.
	      destruct (V_eq_dec x x); [reflexivity | contradiction].
	    + split.
	      * rewrite insert_left_child_eq.
	        unfold insert_left_child_value.
	        destruct (V_eq_dec y x) as [Hyx | Hyx]; [subst y; contradiction |].
	        destruct (V_eq_dec y y) as [_ | Hyy]; [reflexivity | contradiction].
	      * rewrite insert_left_right_child_eq.
	        unfold insert_left_right_child_value.
	        destruct (V_eq_dec y y) as [_ | Hyy]; [reflexivity | contradiction].
	    + split.
	      * intros z Hz Hzx.
	        rewrite insert_left_child_eq.
	        unfold insert_left_child_value.
	        destruct (V_eq_dec z x) as [Hzx' | Hzx']; [contradiction |].
	        destruct (V_eq_dec z y) as [Hzy | Hzy]; [subst z; contradiction | reflexivity].
	      * intros z Hz.
	        rewrite insert_left_right_child_eq.
	        unfold insert_left_right_child_value.
	        destruct (V_eq_dec z y) as [Hzy | Hzy]; [subst z; contradiction | reflexivity].
  - intros g x y Hg Hx Hy Hright.
    change (g.(vset) x) in Hx.
    change (g.(right_child) x = None) in Hright.
    assert (Hxy : x <> y) by (intro H; subst; contradiction).
    pose proof (insert_right_preserves_gvalid V_eq_dec g x y Hg Hx Hy Hright) as Hg'.
    constructor; simpl.
    + exists g.(listV); split.
      * constructor; simpl.
        -- reflexivity.
        -- intros v; split; intro Hv.
           ++ eapply listV_sound; eauto.
           ++ eapply finite_vertices; eauto.
        -- intros parent child Hparent Hchild; exact (child_valid g Hg parent child Hparent Hchild).
        -- intros v Hv; exact (invalid_child_is_none g Hg v Hv).
        -- exact (listV_NoDup g Hg).
      * constructor; simpl.
        -- reflexivity.
        -- intros v; split; intro Hv.
           ++ destruct Hv as [Hvy | Hv].
              ** right; symmetry; exact Hvy.
              ** left; eapply listV_sound; eauto.
           ++ destruct Hv as [Hv | Hvy].
              ** right; eapply finite_vertices; eauto.
              ** left; symmetry; exact Hvy.
        -- intros parent child Hparent Hchild; exact (child_valid (insert_right V_eq_dec g x y) Hg' parent child Hparent Hchild).
        -- intros v Hv; exact (invalid_child_is_none (insert_right V_eq_dec g x y) Hg' v Hv).
        -- exact (listV_NoDup (insert_right V_eq_dec g x y) Hg').
    + exact Hx.
    + exact Hy.
    + exact Hright.
    + intros z; split; intro Hz; exact Hz.
    + reflexivity.
	    + rewrite insert_right_child_eq.
	      unfold insert_right_child_value.
	      destruct (V_eq_dec x x); [reflexivity | contradiction].
	    + split.
	      * rewrite insert_right_left_child_eq.
	        unfold insert_right_left_child_value.
	        destruct (V_eq_dec y y) as [_ | Hyy]; [reflexivity | contradiction].
	      * rewrite insert_right_child_eq.
	        unfold insert_right_child_value.
	        destruct (V_eq_dec y x) as [Hyx | Hyx]; [subst y; contradiction |].
	        destruct (V_eq_dec y y) as [_ | Hyy]; [reflexivity | contradiction].
	    + split.
	      * intros z Hz.
	        rewrite insert_right_left_child_eq.
	        unfold insert_right_left_child_value.
	        destruct (V_eq_dec z y) as [Hzy | Hzy]; [subst z; contradiction | reflexivity].
	      * intros z Hz Hzx.
	        rewrite insert_right_child_eq.
	        unfold insert_right_child_value.
	        destruct (V_eq_dec z x) as [Hzx' | Hzx']; [contradiction |].
	        destruct (V_eq_dec z y) as [Hzy | Hzy]; [subst z; contradiction | reflexivity].
Qed.

#[export] Instance BinaryTree_remove_operations
  {V : Type}
  (V_eq_dec : forall x y : V, {x = y} + {x <> y})
  : @BinaryTreeRemoveOperation (BinaryTreeType V) V V _ _ _ _ _ _.
Proof.
  refine {|
    GraphLib.directed.binarytree.remove_root := @remove_root V;
    GraphLib.directed.binarytree.remove_left := @remove_left_leaf V V_eq_dec;
    GraphLib.directed.binarytree.remove_right := @remove_right_leaf V V_eq_dec
  |}.
  - intros g x Hg Hx Hroot Hleft Hright.
    change (g.(vset) x) in Hx.
    change (g.(root) = Some x) in Hroot.
    change (g.(left_child) x = None) in Hleft.
    change (g.(right_child) x = None) in Hright.
    constructor; simpl.
    + split; [exact Hg|].
      split; [exact (remove_root_preserves_gvalid g x Hg Hx Hroot Hleft Hright)|].
      split; [exact Hx|].
      intro H; contradiction.
    + split; [exact Hroot|reflexivity].
    + split; [exact Hleft|exact Hright].
    + intros z; split; intro Hz.
      * contradiction.
      * destruct Hz as [Hz Hneq].
        destruct (path_exists g Hg z Hz) as [r [Hrroot Hpath]].
        rewrite Hroot in Hrroot.
        inversion Hrroot; subst r.
        pose proof (bt_leaf_path_self g x z Hleft Hright Hpath) as Hzx.
        subst z. contradiction.
    + intros z; split; reflexivity.
  - intros g x y Hg Hx Hxy Hleft Hright.
    change (g.(vset) x) in Hx.
    change (g.(left_child) x = Some y) in Hxy.
    change (g.(left_child) y = None) in Hleft.
    change (g.(right_child) y = None) in Hright.
    assert (Hy : g.(vset) y) by (eapply child_valid; eauto).
    constructor; simpl.
    + split; [exact Hg|].
      split; [exact (remove_left_leaf_preserves_gvalid V_eq_dec g x y Hg Hx Hxy Hleft Hright)|].
      repeat split; auto.
      intro Hy_new. destruct Hy_new as [_ Hnot]. contradiction.
    + exact Hxy.
    + split; [exact Hleft|exact Hright].
    + intros z; split; intro Hz.
      * destruct Hz as [Hz Hnot].
        split; [exact Hz|].
        intro Hzy. subst z. contradiction.
      * destruct Hz as [Hz Hzy].
        split; [exact Hz|].
        intro Hxz.
        rewrite Hxy in Hxz.
        inversion Hxz; subst z.
        contradiction.
    + reflexivity.
	    + rewrite remove_left_child_eq.
	      unfold remove_left_child_value.
	      destruct (V_eq_dec x x); [reflexivity|contradiction].
	    + split.
	      * intros z Hz Hzx.
	        rewrite remove_left_child_eq.
	        unfold remove_left_child_value.
	        destruct (V_eq_dec z x) as [Hzx' | Hzx']; [contradiction|reflexivity].
	      * intros z Hz. reflexivity.
  - intros g x y Hg Hx Hxy Hleft Hright.
    change (g.(vset) x) in Hx.
    change (g.(right_child) x = Some y) in Hxy.
    change (g.(left_child) y = None) in Hleft.
    change (g.(right_child) y = None) in Hright.
    assert (Hy : g.(vset) y) by (eapply child_valid; eauto).
    constructor; simpl.
    + split; [exact Hg|].
      split; [exact (remove_right_leaf_preserves_gvalid V_eq_dec g x y Hg Hx Hxy Hleft Hright)|].
      repeat split; auto.
      intro Hy_new. destruct Hy_new as [_ Hnot]. contradiction.
    + exact Hxy.
    + split; [exact Hleft|exact Hright].
    + intros z; split; intro Hz.
      * destruct Hz as [Hz Hnot].
        split; [exact Hz|].
        intro Hzy. subst z. contradiction.
      * destruct Hz as [Hz Hzy].
        split; [exact Hz|].
        intro Hxz.
        rewrite Hxy in Hxz.
        inversion Hxz; subst z.
        contradiction.
    + reflexivity.
	    + rewrite remove_right_child_eq.
	      unfold remove_right_child_value.
	      destruct (V_eq_dec x x); [reflexivity|contradiction].
	    + split.
	      * intros z Hz. reflexivity.
	      * intros z Hz Hzx.
	        rewrite remove_right_child_eq.
	        unfold remove_right_child_value.
	        destruct (V_eq_dec z x) as [Hzx' | Hzx']; [contradiction|reflexivity].
Qed.

Record BinarySearchTreeType (V : Type) := {
  bst_tree : BinaryTreeType V;
  bst_key : V -> Z;
}.

Arguments bst_tree {V} _.
Arguments bst_key {V} _ _.

Record BinarySearchTreeProp
  {V : Type}
  (bst : BinarySearchTreeType V) : Prop :=
{
  bst_binary_tree : BinaryTreeProp V (bst_tree bst);
  bst_left_order : forall v1 v2 : V,
    (bst_tree bst).(vset) v1 ->
    bt_left_subtree (bst_tree bst) v1 v2 ->
    Z.lt (bst_key bst v2) (bst_key bst v1);
  bst_right_order : forall v1 v2 : V,
    (bst_tree bst).(vset) v1 ->
    bt_right_subtree (bst_tree bst) v1 v2 ->
    Z.lt (bst_key bst v1) (bst_key bst v2);
}.

Definition bst_vvalid {V: Type} (g: BinarySearchTreeType V) (v: V): Prop :=
  bt_vvalid (bst_tree g) v.

Definition bst_evalid {V: Type} (g: BinarySearchTreeType V) (e: V): Prop :=
  bt_evalid (bst_tree g) e.

Definition bst_step_aux {V: Type} (g: BinarySearchTreeType V) (e: V) (x y: V): Prop :=
  bt_step_aux (bst_tree g) e x y.


#[export]Program Instance BST_graph {V: Type}:
  graph_basic.Graph (BinarySearchTreeType V) V V := {
  vvalid := bst_vvalid;
  evalid := bst_evalid;
  step_aux := bst_step_aux;
}.

#[export]Instance BST_gvalid {V: Type}:
  graph_basic.GValid (BinarySearchTreeType V) :=
  @BinarySearchTreeProp V.

#[export]Instance BST_stepvalid {V: Type}:
  StepValid (BinarySearchTreeType V) V V.
Proof.
  split; intros; destruct H; simpl in *; auto.
  subst e; exists x; split; auto.
Qed.

#[export]Instance BST_noemptyedge {V: Type} :
  graph_basic.NoEmptyEdge (BinarySearchTreeType V) V V.
Proof.
  split; intros g e Hg He.
  destruct He as [x [Hx Hchild]].
  pose proof (bst_binary_tree g Hg) as Htree.
  assert (He_valid : (bst_tree g).(vset) e).
  { eapply child_valid; eauto. }
  exists x, e.
  constructor; simpl; auto.
Qed.

#[export]Instance BST_stepunique_directed {V: Type}:
  graph_basic.StepUniqueDirected (BinarySearchTreeType V) V V.
Proof.
  split; intros g e x1 y1 x2 y2 Hg Haux1 Haux2.
  destruct Haux1 as [Hx1 Hy1 Heq1 Hchild1].
  destruct Haux2 as [Hx2 Hy2 Heq2 Hchild2].
  subst y1 y2.
  split; [|reflexivity].
  eapply father_unique; eauto.
  exact (bst_binary_tree g Hg).
Qed.

#[export]Instance BST_finitegraph {V: Type}:
  graph_basic.FiniteGraph (BinarySearchTreeType V) V V.
Proof.
  refine {|graph_basic.listV := fun g => (bst_tree g).(listV);|}.
  - intros g Hg v Hv.
    eapply finite_vertices; eauto.
    exact (bst_binary_tree g Hg).
Defined.

Lemma bst_reachable_to_bt_path :
  forall {V : Type} (g : BinarySearchTreeType V) (a b : V),
    reachable g a b ->
    bt_path (bst_tree g) a b.
Proof.
  intros V g a b Hreach.
  unfold reachable in Hreach.
  unfold bt_path.
  induction_1n Hreach.
  - reflexivity.
  - transitivity_1n a0.
    + destruct H as [e Haux].
      destruct Haux as [_ _ _ Hchild].
      exact Hchild.
    + apply IHrt.
Qed.

Lemma bst_bt_path_to_reachable :
  forall {V : Type} (g : BinarySearchTreeType V) (a b : V),
    gvalid g ->
    (bst_tree g).(vset) a ->
    bt_path (bst_tree g) a b ->
    reachable g a b.
Proof.
  intros V g a b Hg Ha Hpath.
  pose proof (bst_binary_tree g Hg) as Htree.
  unfold bt_path in Hpath.
  unfold reachable.
  induction_1n Hpath.
  - reflexivity.
  - transitivity_1n a0.
    + exists a0.
      refine {|
        bt_step_x_valid := Ha;
        bt_step_y_valid := _;
        bt_step_edge_equal := eq_refl;
        bt_step_child := H
      |}.
      exact (child_valid (bst_tree g) Htree a1 a0 Ha H).
    + apply IHrt.
      * exact Hg.
      * exact (child_valid (bst_tree g) Htree a1 a0 Ha H).
      * exact Htree.
Qed.

Lemma bst_step_to_bt_step :
  forall {V : Type} (g : BinarySearchTreeType V) (x y : V),
    step g x y -> step (bst_tree g) x y.
Proof.
  intros V g x y Hstep.
  destruct Hstep as [e Haux].
  destruct Haux as [Hx Hy Heq Hchild].
  subst e.
  exists y.
  constructor; auto.
Qed.

#[export]Instance BST_forest {V: Type} :
  Forest (BinarySearchTreeType V) V V.
Proof.
  split.
  - intros g x1 x2 e1 e2 y Hg Haux1 Haux2.
    destruct Haux1.
    destruct Haux2.
    subst e1 e2.
    reflexivity.
  - intros g x y Hg Hreach Hstep.
    pose proof (bst_binary_tree g Hg) as Htree.
    pose proof Hstep as Hstep_tree.
    apply bst_step_to_bt_step in Hstep_tree.
    assert (Hx : (bst_tree g).(vset) x).
    { destruct Hstep as [e Haux].
      destruct Haux; auto. }
    assert (Hreach_tree : reachable (bst_tree g) x y).
    { eapply bt_path_to_reachable_early; eauto.
      apply bst_reachable_to_bt_path; auto. }
    eapply no_reachable_back_edge; eauto.
Defined.

#[export]Instance BST_simple_graph{V : Type}: 
  graph_basic.SimpleGraph (BinarySearchTreeType V) V V.
Proof.
  split.
  - intros g e1 e2 x y Hg Haux1 Haux2.
    destruct Haux1 as [_ _ Heq1 _].
    destruct Haux2 as [_ _ Heq2 _].
    subst e1 e2.
    reflexivity.
  - intros g e x Hg Haux.
    pose proof (bst_binary_tree g Hg) as Htree.
    assert (Hstep_tree : step (bst_tree g) x x).
    { exists e.
      exact Haux. }
    pose proof (no_edge_refl (g := bst_tree g) (gvalid := Htree) x x Hstep_tree) as Hno.
    exact (Hno Hstep_tree).
Defined.

#[export]Instance BST_binarytree {V: Type}:
  BinaryTree (BinarySearchTreeType V) V V.
Proof.
  refine {|
    GraphLib.directed.binarytree.bt_root := fun g => (bst_tree g).(root);
    GraphLib.directed.binarytree.left_child := fun g => (bst_tree g).(left_child);
    GraphLib.directed.binarytree.right_child := fun g => (bst_tree g).(right_child)
  |}.
  - intros g Hg.
    destruct (bst_tree g).(root) as [r |] eqn:Hroot; simpl; auto.
    eapply root_valid; eauto.
    exact (bst_binary_tree g Hg).
  - intros g x Hg Hx.
    pose proof (bst_binary_tree g Hg) as Htree.
    destruct (path_exists (bst_tree g) Htree x Hx) as [r [Hroot Hpath]].
    exists r.
    split; [exact Hroot|].
    eapply bst_bt_path_to_reachable; eauto.
    exact (root_valid (bst_tree g) Htree r Hroot).
  - intros g x y Hg Hx Hl.
    pose proof (bst_binary_tree g Hg) as Htree.
    assert (Hy : (bst_tree g).(vset) y).
    { exact (child_valid (bst_tree g) Htree x y Hx (or_introl Hl)). }
    exists y.
    constructor; simpl; auto.
  - intros g x y Hg Hx Hr.
    pose proof (bst_binary_tree g Hg) as Htree.
    assert (Hy : (bst_tree g).(vset) y).
    { exact (child_valid (bst_tree g) Htree x y Hx (or_intror Hr)). }
    exists y.
    constructor; simpl; auto.
  - intros g x y Hg Hstep.
    destruct Hstep as [e Haux].
    destruct Haux as [_ _ Heq Hchild].
    subst e.
    exact Hchild.
  - intros g x Hg Hx.
    eapply invalid_child_is_none; eauto.
    exact (bst_binary_tree g Hg).
  - intros g x y1 y2 Hg Hx Hl Hr.
    pose proof (bst_binary_tree g Hg) as Htree.
    assert (Hy1 : (bst_tree g).(vset) y1).
    { exact (child_valid (bst_tree g) Htree x y1 Hx (or_introl Hl)). }
    assert (Hy2 : (bst_tree g).(vset) y2).
    { exact (child_valid (bst_tree g) Htree x y2 Hx (or_intror Hr)). }
    exact (child_distinct (bst_tree g) Htree x y1 y2 Hx Hy1 Hy2 Hl Hr).
Defined.

#[export] Instance BST_binarytree_with_key {V: Type}:
  GraphLib.directed.binarytree.BinaryTreeWithKey
    (BinarySearchTreeType V) V V := {
  GraphLib.directed.binarytree.bt_key := @bst_key V
}.

#[export]Instance BST_bst {V: Type}:
  GraphLib.directed.binarytree.BinarySearchTree
    (BinarySearchTreeType V) V V.
Proof.
  constructor.
  - intros g x l y Hg Hx Hleft Hoff.
    pose proof (bst_binary_tree g Hg) as Htree.
    eapply bst_left_order; eauto.
    exists l.
    split; [exact Hleft|].
    apply bst_reachable_to_bt_path.
    exact Hoff.
  - intros g x r y Hg Hx Hright Hoff.
    pose proof (bst_binary_tree g Hg) as Htree.
    apply Z.compare_gt_iff.
    eapply bst_right_order; eauto.
    exists r.
    split; [exact Hright|].
    apply bst_reachable_to_bt_path.
    exact Hoff.
Defined.

Definition empty_bst {V : Type} (g : BinarySearchTreeType V) : Prop :=
  bst_tree g = @empty_tree V.

Definition single_node_bst {V : Type}
  (g : BinarySearchTreeType V) (root : V) : Prop :=
  bst_tree g = single_node_tree root.

Lemma empty_bst_valid {V : Type} :
  forall g : BinarySearchTreeType V,
    empty_bst g ->
    gvalid g.
Proof.
  intros [tree key] Hempty.
  unfold empty_bst in Hempty.
  simpl in Hempty.
  subst tree.
  constructor.
  - apply empty_tree_valid.
  - intros v1 v2 Hv _.
    contradiction.
  - intros v1 v2 Hv _.
    contradiction.
Qed.

Lemma single_node_bst_valid {V : Type} :
  forall (g : BinarySearchTreeType V) (root : V),
    single_node_bst g root ->
    gvalid g.
Proof.
  intros [tree key] root Hsingle.
  unfold single_node_bst in Hsingle.
  simpl in Hsingle.
  subst tree.
  constructor.
  - apply single_node_tree_valid.
  - intros v1 v2 Hv Hsubtree.
    unfold bt_left_subtree in Hsubtree.
    destruct Hsubtree as [child [Hchild _]].
    simpl in Hchild.
    discriminate.
  - intros v1 v2 Hv Hsubtree.
    unfold bt_right_subtree in Hsubtree.
    destruct Hsubtree as [child [Hchild _]].
    simpl in Hchild.
    discriminate.
Qed.

Lemma bst_listV_spec :
  forall {V : Type} (g : BinarySearchTreeType V) x,
    gvalid g -> In x (bst_tree g).(listV) <-> bst_vvalid g x.
Proof.
  intros V g x Hg; split.
  - intro Hin; eapply listV_sound; eauto; exact (bst_binary_tree g Hg).
  - intro Hx; eapply finite_vertices; eauto; exact (bst_binary_tree g Hg).
Qed.

Lemma bst_listV_NoDup :
  forall {V : Type} (g : BinarySearchTreeType V),
    gvalid g -> NoDup (bst_tree g).(listV).
Proof. intros V g Hg; apply listV_NoDup; exact (bst_binary_tree g Hg). Qed.

Lemma single_node_bst_listV :
  forall {V : Type} (g : BinarySearchTreeType V) root,
    single_node_bst g root -> (bst_tree g).(listV) = root :: nil.
Proof. intros V g root Hsingle; unfold single_node_bst in Hsingle; rewrite Hsingle; reflexivity. Qed.

Section BST_OPERATIONS.

Context {V : Type}.
Context (V_eq_dec : forall x y : V, {x = y} + {x <> y}).

Definition bst_with_tree (g : BinarySearchTreeType V) (t : BinaryTreeType V)
  : BinarySearchTreeType V :=
{|
  bst_tree := t;
  bst_key := bst_key g;
|}.

Definition bst_with_tree_and_key
  (g : BinarySearchTreeType V) (t : BinaryTreeType V) (k : V -> Z)
  : BinarySearchTreeType V :=
{|
  bst_tree := t;
  bst_key := k;
|}.

Definition bst_key_set (g : BinarySearchTreeType V) (x : V) (key : Z) (v : V) : Z :=
  if V_eq_dec v x then key else bst_key g v.

Definition bst_keyed_update_op
  (g : BinarySearchTreeType V) (p : V) (k : Z) : BinarySearchTreeType V :=
  bst_with_tree_and_key g (bst_tree g) (bst_key_set g p k).

Definition bst_keyed_set_left_tree
  (t : BinaryTreeType V) (parent : V) (target : option V) : BinaryTreeType V :=
{|
  vset := t.(vset);
  theroot := t.(theroot);
  left_child := override_v_func V_eq_dec parent target t.(left_child);
  right_child := t.(right_child);
  listV := t.(listV)
|}.

Definition bst_keyed_set_right_tree
  (t : BinaryTreeType V) (parent : V) (target : option V) : BinaryTreeType V :=
{|
  vset := t.(vset);
  theroot := t.(theroot);
  left_child := t.(left_child);
  right_child := override_v_func V_eq_dec parent target t.(right_child);
  listV := t.(listV)
|}.

Definition bst_keyed_set_left_op
  (g : BinarySearchTreeType V) (parent : V) (target : option V)
  : BinarySearchTreeType V :=
  bst_with_tree g (bst_keyed_set_left_tree (bst_tree g) parent target).

Definition bst_keyed_set_right_op
  (g : BinarySearchTreeType V) (parent : V) (target : option V)
  : BinarySearchTreeType V :=
  bst_with_tree g (bst_keyed_set_right_tree (bst_tree g) parent target).

Definition bst_keyed_set_root_tree (t : BinaryTreeType V) (target : option V) : BinaryTreeType V :=
{|
  vset := t.(vset);
  theroot := target;
  left_child := t.(left_child);
  right_child := t.(right_child);
  listV := t.(listV)
|}.

Definition bst_keyed_redirect_root_op (g : BinarySearchTreeType V) (target : option V) : BinarySearchTreeType V :=
  bst_with_tree g (bst_keyed_set_root_tree (bst_tree g) target).

Definition bst_keyed_union_tree
  (g1 g2 : BinarySearchTreeType V) : BinaryTreeType V :=
{|
  vset := fun x => vvalid g1 x \/ vvalid g2 x;
  theroot := (bst_tree g1).(theroot);
  left_child := fun x =>
    if in_dec V_eq_dec x (bst_tree g1).(listV)
    then (bst_tree g1).(left_child) x
    else (bst_tree g2).(left_child) x;
  right_child := fun x =>
    if in_dec V_eq_dec x (bst_tree g1).(listV)
    then (bst_tree g1).(right_child) x
    else (bst_tree g2).(right_child) x;
  listV := (bst_tree g1).(listV) ++ (bst_tree g2).(listV)
|}.

Definition bst_keyed_union_key
  (g1 g2 : BinarySearchTreeType V) (x : V) : Z :=
  if in_dec V_eq_dec x (bst_tree g1).(listV)
  then bst_key g1 x
  else bst_key g2 x.

Definition bst_keyed_union_op
  (g1 g2 : BinarySearchTreeType V) : BinarySearchTreeType V :=
  bst_with_tree_and_key g1 (bst_keyed_union_tree g1 g2)
    (bst_keyed_union_key g1 g2).

Definition bst_keyed_weak_insert_root_op (g1 g2 : BinarySearchTreeType V) (target : V) : BinarySearchTreeType V :=
  bst_keyed_redirect_root_op (bst_keyed_union_op g1 g2) (Some target).

Definition bst_keyed_weak_insert_left_op
  (g1 g2 : BinarySearchTreeType V) (parent target : V)
  : BinarySearchTreeType V :=
  bst_keyed_set_left_op (bst_keyed_union_op g1 g2) parent (Some target).

Definition bst_keyed_weak_insert_right_op
  (g1 g2 : BinarySearchTreeType V) (parent target : V)
  : BinarySearchTreeType V :=
  bst_keyed_set_right_op (bst_keyed_union_op g1 g2) parent (Some target).

Lemma bst_node_domain_iff_tree_node_domain : forall (g : BinarySearchTreeType V) (l : list V), bst_node_domain_valid g l <-> bst_node_domain_valid (bst_tree g) l.
Proof.
  intros g l.
  split; intro Hdomain; destruct Hdomain; constructor; simpl in *; auto.
Qed.

Lemma bst_node_domain_listV_iff :
  forall (g : BinarySearchTreeType V) (l : list V),
    bst_node_domain_valid g l ->
    forall x, In x (bst_tree g).(listV) <-> vvalid g x.
Proof.
  intros g l Hdomain x.
  destruct Hdomain as [Hperm Hmem Hclosed Hnone Hnodup].
  split; intro Hx.
  - apply Hmem.
    eapply Permutation_in; [apply Permutation_sym; exact Hperm | exact Hx].
  - eapply Permutation_in; [exact Hperm |].
    apply Hmem; exact Hx.
Qed.

Lemma bst_keyed_set_root_domain_valid : forall (g : BinarySearchTreeType V) (l : list V) (target : option V), bst_node_domain_valid g l -> bst_node_domain_valid (bst_keyed_redirect_root_op g target) l.
Proof.
  intros g l target Hdomain.
  destruct Hdomain; constructor; simpl in *; assumption.
Qed.

Lemma bst_keyed_set_left_domain_valid :
  forall (g : BinarySearchTreeType V) (l : list V) (parent : V) (target : option V),
    bst_node_domain_valid g l -> vvalid g parent ->
    (target = None \/ exists x, target = Some x /\ vvalid g x) ->
    bst_node_domain_valid (bst_keyed_set_left_op g parent target) l.
Proof.
  intros g l parent target Hdomain Hparent Htarget.
  destruct Hdomain as [Hperm Hmem Hclosed Hnone Hnodup].
  constructor; simpl.
  - exact Hperm.
  - exact Hmem.
  - intros x child Hx [Hchild | Hchild].
    + unfold override_v_func in Hchild.
      destruct (V_eq_dec x parent) as [-> | Hneq].
      * destruct Htarget as [-> | [y [-> Hy]]]; [discriminate |].
        inversion Hchild; subst child; exact Hy.
      * eapply Hclosed; eauto.
    + eapply Hclosed; eauto.
  - intros x Hx.
    assert (Hneq : x <> parent) by (intro; subst; contradiction).
    specialize (Hnone x Hx) as [Hl Hr].
    split; [|exact Hr].
    unfold override_v_func.
    destruct (V_eq_dec x parent); [contradiction | exact Hl].
  - exact Hnodup.
Qed.

Lemma bst_keyed_set_right_domain_valid :
  forall (g : BinarySearchTreeType V) (l : list V) (parent : V) (target : option V),
    bst_node_domain_valid g l -> vvalid g parent ->
    (target = None \/ exists x, target = Some x /\ vvalid g x) ->
    bst_node_domain_valid (bst_keyed_set_right_op g parent target) l.
Proof.
  intros g l parent target Hdomain Hparent Htarget.
  destruct Hdomain as [Hperm Hmem Hclosed Hnone Hnodup].
  constructor; simpl.
  - exact Hperm.
  - exact Hmem.
  - intros x child Hx [Hchild | Hchild].
    + eapply Hclosed; eauto.
    + unfold override_v_func in Hchild.
      destruct (V_eq_dec x parent) as [-> | Hneq].
      * destruct Htarget as [-> | [y [-> Hy]]]; [discriminate |].
        inversion Hchild; subst child; exact Hy.
      * eapply Hclosed; eauto.
  - intros x Hx.
    assert (Hneq : x <> parent) by (intro; subst; contradiction).
    specialize (Hnone x Hx) as [Hl Hr].
    split; [exact Hl|].
    unfold override_v_func.
    destruct (V_eq_dec x parent); [contradiction | exact Hr].
  - exact Hnodup.
Qed.

Lemma bst_keyed_union_domain_valid :
  forall (g1 g2 : BinarySearchTreeType V) (l1 l2 : list V),
    bst_node_domain_valid g1 l1 -> bst_node_domain_valid g2 l2 ->
    (forall x, vvalid g1 x -> ~ vvalid g2 x) ->
    bst_node_domain_valid (bst_keyed_union_op g1 g2) (l1 ++ l2).
Proof.
  intros g1 g2 l1 l2 Hdomain1 Hdomain2 Hdisjoint.
  pose proof (bst_node_domain_listV_iff g1 l1 Hdomain1) as Hlist1.
  destruct Hdomain1 as [Hperm1 Hmem1 Hclosed1 Hnone1 Hnodup1].
  destruct Hdomain2 as [Hperm2 Hmem2 Hclosed2 Hnone2 Hnodup2].
  constructor; simpl.
  - apply Permutation_app; assumption.
  - intro x.
    change (In x (l1 ++ l2) <-> vvalid g1 x \/ vvalid g2 x).
    rewrite in_app_iff, Hmem1, Hmem2; reflexivity.
  - intros parent child [Hparent1 | Hparent2] [Hchild | Hchild].
    + left.
      assert (Hin := proj2 (Hlist1 parent) Hparent1).
      destruct (in_dec V_eq_dec parent (bst_tree g1).(listV)); [|contradiction].
      eapply Hclosed1; [exact Hparent1 | left; exact Hchild].
    + left.
      assert (Hin := proj2 (Hlist1 parent) Hparent1).
      destruct (in_dec V_eq_dec parent (bst_tree g1).(listV)); [|contradiction].
      eapply Hclosed1; [exact Hparent1 | right; exact Hchild].
    + right.
      assert (Hnotin : ~ In parent (bst_tree g1).(listV)).
      { intro Hin; apply Hlist1 in Hin; exact (Hdisjoint parent Hin Hparent2). }
      destruct (in_dec V_eq_dec parent (bst_tree g1).(listV)); [contradiction|].
      eapply Hclosed2; [exact Hparent2 | left; exact Hchild].
    + right.
      assert (Hnotin : ~ In parent (bst_tree g1).(listV)).
      { intro Hin; apply Hlist1 in Hin; exact (Hdisjoint parent Hin Hparent2). }
      destruct (in_dec V_eq_dec parent (bst_tree g1).(listV)); [contradiction|].
      eapply Hclosed2; [exact Hparent2 | right; exact Hchild].
  - intros x Hx.
    change (~ (vvalid g1 x \/ vvalid g2 x)) in Hx.
    assert (Hx1 : ~ vvalid g1 x) by tauto.
    assert (Hx2 : ~ vvalid g2 x) by tauto.
    specialize (Hnone2 x Hx2) as [Hl Hr].
    split.
    + destruct (in_dec V_eq_dec x (bst_tree g1).(listV)) as [Hin | Hnotin].
      * apply Hlist1 in Hin; contradiction.
      * exact Hl.
    + destruct (in_dec V_eq_dec x (bst_tree g1).(listV)) as [Hin | Hnotin].
      * apply Hlist1 in Hin; contradiction.
      * exact Hr.
  - apply NoDup_app; repeat split; try assumption.
    intros x Hx1 Hx2.
    apply (Hdisjoint x (proj1 (Hmem1 x) Hx1)).
    exact (proj1 (Hmem2 x) Hx2).
Qed.

Lemma bst_keyed_union_g1_left :
  forall g1 g2 l1 x, bst_node_domain_valid g1 l1 -> vvalid g1 x ->
    GraphLib.directed.binarytree.left_child (bst_keyed_union_op g1 g2) x =
    GraphLib.directed.binarytree.left_child g1 x.
Proof.
  intros g1 g2 l1 x Hdomain Hx.
  unfold bst_keyed_union_op, bst_keyed_union_tree, bst_with_tree_and_key; simpl.
  destruct (in_dec V_eq_dec x (bst_tree g1).(listV)); [reflexivity|].
  exfalso; apply n; apply (proj2 (bst_node_domain_listV_iff g1 l1 Hdomain x)); exact Hx.
Qed.

Lemma bst_keyed_union_g1_right :
  forall g1 g2 l1 x, bst_node_domain_valid g1 l1 -> vvalid g1 x ->
    GraphLib.directed.binarytree.right_child (bst_keyed_union_op g1 g2) x =
    GraphLib.directed.binarytree.right_child g1 x.
Proof.
  intros g1 g2 l1 x Hdomain Hx.
  unfold bst_keyed_union_op, bst_keyed_union_tree, bst_with_tree_and_key; simpl.
  destruct (in_dec V_eq_dec x (bst_tree g1).(listV)); [reflexivity|].
  exfalso; apply n; apply (proj2 (bst_node_domain_listV_iff g1 l1 Hdomain x)); exact Hx.
Qed.

Lemma bst_keyed_union_g1_key :
  forall g1 g2 l1 x, bst_node_domain_valid g1 l1 -> vvalid g1 x ->
    bt_key (bst_keyed_union_op g1 g2) x = bt_key g1 x.
Proof.
  intros g1 g2 l1 x Hdomain Hx.
  unfold bst_keyed_union_op, bst_keyed_union_key, bst_with_tree_and_key; simpl.
  destruct (in_dec V_eq_dec x (bst_tree g1).(listV)); [reflexivity|].
  exfalso; apply n; apply (proj2 (bst_node_domain_listV_iff g1 l1 Hdomain x)); exact Hx.
Qed.

Lemma bst_keyed_union_g2_left :
  forall g1 g2 l1 x, bst_node_domain_valid g1 l1 ->
    (forall y, vvalid g1 y -> ~ vvalid g2 y) -> vvalid g2 x ->
    GraphLib.directed.binarytree.left_child (bst_keyed_union_op g1 g2) x =
    GraphLib.directed.binarytree.left_child g2 x.
Proof.
  intros g1 g2 l1 x Hdomain Hdisjoint Hx.
  unfold bst_keyed_union_op, bst_keyed_union_tree, bst_with_tree_and_key; simpl.
  destruct (in_dec V_eq_dec x (bst_tree g1).(listV)); [|reflexivity].
  apply (proj1 (bst_node_domain_listV_iff g1 l1 Hdomain x)) in i.
  exact (False_rect _ (Hdisjoint x i Hx)).
Qed.

Lemma bst_keyed_union_g2_right :
  forall g1 g2 l1 x, bst_node_domain_valid g1 l1 ->
    (forall y, vvalid g1 y -> ~ vvalid g2 y) -> vvalid g2 x ->
    GraphLib.directed.binarytree.right_child (bst_keyed_union_op g1 g2) x =
    GraphLib.directed.binarytree.right_child g2 x.
Proof.
  intros g1 g2 l1 x Hdomain Hdisjoint Hx.
  unfold bst_keyed_union_op, bst_keyed_union_tree, bst_with_tree_and_key; simpl.
  destruct (in_dec V_eq_dec x (bst_tree g1).(listV)); [|reflexivity].
  apply (proj1 (bst_node_domain_listV_iff g1 l1 Hdomain x)) in i.
  exact (False_rect _ (Hdisjoint x i Hx)).
Qed.

Lemma bst_keyed_union_g2_key :
  forall g1 g2 l1 x, bst_node_domain_valid g1 l1 ->
    (forall y, vvalid g1 y -> ~ vvalid g2 y) -> vvalid g2 x ->
    bt_key (bst_keyed_union_op g1 g2) x = bt_key g2 x.
Proof.
  intros g1 g2 l1 x Hdomain Hdisjoint Hx.
  unfold bst_keyed_union_op, bst_keyed_union_key, bst_with_tree_and_key; simpl.
  destruct (in_dec V_eq_dec x (bst_tree g1).(listV)); [|reflexivity].
  apply (proj1 (bst_node_domain_listV_iff g1 l1 Hdomain x)) in i.
  exact (False_rect _ (Hdisjoint x i Hx)).
Qed.

Lemma bst_keyed_update_sound_local :
  forall (g : BinarySearchTreeType V) (p : V) (k : Z) (l : list V),
    bst_node_domain_valid g l -> vvalid g p ->
    keyed_key_update_valid g (bst_keyed_update_op g p k) p k.
Proof.
  intros g p k l Hdomain Hp.
  assert (Hdomain' : bst_node_domain_valid (bst_keyed_update_op g p k) l).
  { destruct Hdomain as [Hperm Hmem Hclosed Hnone Hnodup].
    constructor; simpl; assumption. }
  constructor.
  - exists l; auto.
  - exact Hp.
  - reflexivity.
  - reflexivity.
  - unfold bst_keyed_update_op, bst_with_tree_and_key, bst_key_set; simpl.
    destruct (V_eq_dec p p); [reflexivity|contradiction].
  - intros x Hneq.
    unfold bst_keyed_update_op, bst_with_tree_and_key, bst_key_set; simpl.
    destruct (V_eq_dec x p); [contradiction|reflexivity].
Qed.

Lemma bst_keyed_redirect_root_sound_local :
  forall (g : BinarySearchTreeType V) (target : option V) (l : list V),
    bst_node_domain_valid g l ->
    (target = None \/ exists x, target = Some x /\ vvalid g x) ->
    keyed_redirect_root_valid g (bst_keyed_redirect_root_op g target) target.
Proof.
  intros g target l Hdomain Htarget.
  constructor; simpl.
  - exists l; split; [exact Hdomain |].
    eapply bst_keyed_set_root_domain_valid; eauto.
  - exact Htarget.
  - reflexivity.
  - reflexivity.
  - reflexivity.
  - reflexivity.
Qed.

Lemma bst_keyed_redirect_left_sound_local :
  forall (g : BinarySearchTreeType V) (parent : V) (target : option V) (l : list V),
    bst_node_domain_valid g l -> vvalid g parent ->
    (target = None \/ exists x, target = Some x /\ vvalid g x) ->
    keyed_redirect_left_valid g (bst_keyed_set_left_op g parent target) parent target.
Proof.
  intros g parent target l Hdomain Hparent Htarget.
  constructor; simpl.
  - exists l; split; [exact Hdomain|].
    eapply bst_keyed_set_left_domain_valid; eauto.
  - exact Hparent.
  - exact Htarget.
  - reflexivity.
  - unfold override_v_func; destruct (V_eq_dec parent parent); [reflexivity|contradiction].
  - intros x Hneq; unfold override_v_func.
    destruct (V_eq_dec x parent); [contradiction|reflexivity].
  - reflexivity.
  - reflexivity.
Qed.

Lemma bst_keyed_redirect_right_sound_local :
  forall (g : BinarySearchTreeType V) (parent : V) (target : option V) (l : list V),
    bst_node_domain_valid g l -> vvalid g parent ->
    (target = None \/ exists x, target = Some x /\ vvalid g x) ->
    keyed_redirect_right_valid g (bst_keyed_set_right_op g parent target) parent target.
Proof.
  intros g parent target l Hdomain Hparent Htarget.
  constructor; simpl.
  - exists l; split; [exact Hdomain|].
    eapply bst_keyed_set_right_domain_valid; eauto.
  - exact Hparent.
  - exact Htarget.
  - reflexivity.
  - unfold override_v_func; destruct (V_eq_dec parent parent); [reflexivity|contradiction].
  - reflexivity.
  - intros x Hneq; unfold override_v_func.
    destruct (V_eq_dec x parent); [contradiction|reflexivity].
  - reflexivity.
Qed.

Lemma bst_keyed_weak_union_sound_local : forall (g1 g2 : BinarySearchTreeType V) (l1 l2 : list V), bst_node_domain_valid g1 l1 -> bst_node_domain_valid g2 l2 -> (forall x, vvalid g1 x -> ~ vvalid g2 x) -> keyed_weak_union_valid g1 g2 (bst_keyed_union_op g1 g2).
Proof.
  intros g1 g2 l1 l2 Hdomain1 Hdomain2 Hdisjoint.
  pose proof (bst_keyed_union_domain_valid g1 g2 l1 l2 Hdomain1 Hdomain2 Hdisjoint) as Hdomain.
  constructor.
  - exists l1, l2, (l1 ++ l2).
    split; [exact Hdomain1 |].
    split; [exact Hdomain2 |].
    split; [exact Hdomain | reflexivity].
  - exact Hdisjoint.
  - reflexivity.
  - intros; eapply bst_keyed_union_g1_left; eauto.
  - intros; eapply bst_keyed_union_g1_right; eauto.
  - intros; eapply bst_keyed_union_g1_key; eauto.
  - intros; eapply bst_keyed_union_g2_left; eauto.
  - intros; eapply bst_keyed_union_g2_right; eauto.
  - intros; eapply bst_keyed_union_g2_key; eauto.
Qed.

Lemma bst_keyed_weak_insert_root_sound_local :
  forall (g1 g2 : BinarySearchTreeType V) (target : V) (l1 l2 : list V),
    bst_node_domain_valid g1 l1 -> bst_node_domain_valid g2 l2 ->
    (forall x, vvalid g1 x -> ~ vvalid g2 x) -> vvalid g2 target ->
    keyed_weak_insert_root_valid g1 g2 (bst_keyed_weak_insert_root_op g1 g2 target) target.
Proof.
  intros g1 g2 target l1 l2 Hdomain1 Hdomain2 Hdisjoint Htarget.
  pose proof (bst_keyed_union_domain_valid g1 g2 l1 l2
    Hdomain1 Hdomain2 Hdisjoint) as Hdomain.
  assert (Hdomain' : bst_node_domain_valid (bst_keyed_weak_insert_root_op g1 g2 target) (l1 ++ l2)).
  { eapply bst_keyed_set_root_domain_valid; exact Hdomain. }
  constructor.
  - exists l1, l2, (l1 ++ l2).
    split; [exact Hdomain1|].
    split; [exact Hdomain2|].
    split; [exact Hdomain'|reflexivity].
  - exact Hdisjoint.
  - exact Htarget.
  - reflexivity.
  - intros; eapply bst_keyed_union_g1_left; eauto.
  - intros; eapply bst_keyed_union_g1_right; eauto.
  - intros; eapply bst_keyed_union_g1_key; eauto.
  - intros; eapply bst_keyed_union_g2_left; eauto.
  - intros; eapply bst_keyed_union_g2_right; eauto.
  - intros; eapply bst_keyed_union_g2_key; eauto.
Qed.

Lemma bst_keyed_weak_insert_left_sound_local :
  forall (g1 g2 : BinarySearchTreeType V) (parent target : V) (l1 l2 : list V),
    bst_node_domain_valid g1 l1 -> bst_node_domain_valid g2 l2 ->
    (forall x, vvalid g1 x -> ~ vvalid g2 x) ->
    vvalid g1 parent -> vvalid g2 target ->
    keyed_weak_insert_left_valid g1 g2
      (bst_keyed_weak_insert_left_op g1 g2 parent target) parent target.
Proof.
  intros g1 g2 parent target l1 l2 Hdomain1 Hdomain2 Hdisjoint Hparent Htarget.
  pose proof (bst_keyed_union_domain_valid g1 g2 l1 l2
    Hdomain1 Hdomain2 Hdisjoint) as Hunion.
  assert (Hparent' : vvalid (bst_keyed_union_op g1 g2) parent).
  { unfold bst_keyed_union_op, bst_keyed_union_tree, bst_with_tree_and_key; simpl.
    left; exact Hparent. }
  assert (Htarget' : vvalid (bst_keyed_union_op g1 g2) target).
  { unfold bst_keyed_union_op, bst_keyed_union_tree, bst_with_tree_and_key; simpl.
    right; exact Htarget. }
  pose proof (bst_keyed_set_left_domain_valid
    (bst_keyed_union_op g1 g2) (l1 ++ l2) parent (Some target)
    Hunion Hparent' (or_intror (ex_intro _ target (conj eq_refl Htarget')))) as Hdomain.
  constructor.
  - exists l1, l2, (l1 ++ l2).
    split; [exact Hdomain1|].
    split; [exact Hdomain2|].
    split; [exact Hdomain|reflexivity].
  - exact Hdisjoint.
  - exact Hparent.
  - exact Htarget.
  - reflexivity.
  - unfold bst_keyed_weak_insert_left_op, bst_keyed_set_left_op,
      bst_keyed_set_left_tree, bst_with_tree; simpl.
    unfold override_v_func.
    destruct (V_eq_dec parent parent); [reflexivity|contradiction].
  - intros x Hx Hneq.
    unfold bst_keyed_weak_insert_left_op, bst_keyed_set_left_op,
      bst_keyed_set_left_tree, bst_with_tree; simpl.
    unfold override_v_func.
    destruct (V_eq_dec x parent); [contradiction|].
    eapply bst_keyed_union_g1_left; eauto.
  - intros x Hx; eapply bst_keyed_union_g1_right; eauto.
  - intros x Hx; eapply bst_keyed_union_g1_key; eauto.
  - intros x Hx.
    assert (Hneq : x <> parent).
    { intro; subst; exact (Hdisjoint parent Hparent Hx). }
    unfold bst_keyed_weak_insert_left_op, bst_keyed_set_left_op,
      bst_keyed_set_left_tree, bst_with_tree; simpl.
    unfold override_v_func.
    destruct (V_eq_dec x parent); [contradiction|].
    eapply bst_keyed_union_g2_left; eauto.
  - intros x Hx; eapply bst_keyed_union_g2_right; eauto.
  - intros x Hx; eapply bst_keyed_union_g2_key; eauto.
Qed.

Lemma bst_keyed_weak_insert_right_sound_local :
  forall (g1 g2 : BinarySearchTreeType V) (parent target : V) (l1 l2 : list V),
    bst_node_domain_valid g1 l1 -> bst_node_domain_valid g2 l2 ->
    (forall x, vvalid g1 x -> ~ vvalid g2 x) ->
    vvalid g1 parent -> vvalid g2 target ->
    keyed_weak_insert_right_valid g1 g2
      (bst_keyed_weak_insert_right_op g1 g2 parent target) parent target.
Proof.
  intros g1 g2 parent target l1 l2 Hdomain1 Hdomain2 Hdisjoint Hparent Htarget.
  pose proof (bst_keyed_union_domain_valid g1 g2 l1 l2
    Hdomain1 Hdomain2 Hdisjoint) as Hunion.
  assert (Hparent' : vvalid (bst_keyed_union_op g1 g2) parent).
  { unfold bst_keyed_union_op, bst_keyed_union_tree, bst_with_tree_and_key; simpl.
    left; exact Hparent. }
  assert (Htarget' : vvalid (bst_keyed_union_op g1 g2) target).
  { unfold bst_keyed_union_op, bst_keyed_union_tree, bst_with_tree_and_key; simpl.
    right; exact Htarget. }
  pose proof (bst_keyed_set_right_domain_valid
    (bst_keyed_union_op g1 g2) (l1 ++ l2) parent (Some target)
    Hunion Hparent' (or_intror (ex_intro _ target (conj eq_refl Htarget')))) as Hdomain.
  constructor.
  - exists l1, l2, (l1 ++ l2).
    split; [exact Hdomain1|].
    split; [exact Hdomain2|].
    split; [exact Hdomain|reflexivity].
  - exact Hdisjoint.
  - exact Hparent.
  - exact Htarget.
  - reflexivity.
  - unfold bst_keyed_weak_insert_right_op, bst_keyed_set_right_op,
      bst_keyed_set_right_tree, bst_with_tree; simpl.
    unfold override_v_func.
    destruct (V_eq_dec parent parent); [reflexivity|contradiction].
  - intros x Hx; eapply bst_keyed_union_g1_left; eauto.
  - intros x Hx Hneq.
    unfold bst_keyed_weak_insert_right_op, bst_keyed_set_right_op,
      bst_keyed_set_right_tree, bst_with_tree; simpl.
    unfold override_v_func.
    destruct (V_eq_dec x parent); [contradiction|].
    eapply bst_keyed_union_g1_right; eauto.
  - intros x Hx; eapply bst_keyed_union_g1_key; eauto.
  - intros x Hx; eapply bst_keyed_union_g2_left; eauto.
  - intros x Hx.
    assert (Hneq : x <> parent).
    { intro; subst; exact (Hdisjoint parent Hparent Hx). }
    unfold bst_keyed_weak_insert_right_op, bst_keyed_set_right_op,
      bst_keyed_set_right_tree, bst_with_tree; simpl.
    unfold override_v_func.
    destruct (V_eq_dec x parent); [contradiction|].
    eapply bst_keyed_union_g2_right; eauto.
  - intros x Hx; eapply bst_keyed_union_g2_key; eauto.
Qed.

#[export] Instance BST_keyed_update_operations :
  GraphLib.directed.binarytree.BinaryTreeWithKeyUpdateOperation
    (G := BinarySearchTreeType V) (V := V) (E := V).
Proof.
  refine {|
    GraphLib.directed.binarytree.keyed_update_key := bst_keyed_update_op
  |}.
  intros; eapply bst_keyed_update_sound_local; eauto.
Defined.

#[export] Instance BST_keyed_redirect_operations :
  GraphLib.directed.binarytree.BinaryTreeWithKeyRedirectOperation
    (G := BinarySearchTreeType V) (V := V) (E := V).
Proof.
  refine {|
    GraphLib.directed.binarytree.keyed_redirect_root := bst_keyed_redirect_root_op;
    GraphLib.directed.binarytree.keyed_redirect_left := bst_keyed_set_left_op;
    GraphLib.directed.binarytree.keyed_redirect_right := bst_keyed_set_right_op
  |}.
  - intros; eapply bst_keyed_redirect_root_sound_local; eauto.
  - intros; eapply bst_keyed_redirect_left_sound_local; eauto.
  - intros; eapply bst_keyed_redirect_right_sound_local; eauto.
Defined.

#[export] Instance BST_keyed_weak_insert_operations :
  GraphLib.directed.binarytree.BinaryTreeWithKeyWeakInsertOperation
    (G := BinarySearchTreeType V) (V := V) (E := V).
Proof.
  refine {|
    GraphLib.directed.binarytree.keyed_weak_insert_root := bst_keyed_weak_insert_root_op;
    GraphLib.directed.binarytree.keyed_weak_insert_left := bst_keyed_weak_insert_left_op;
    GraphLib.directed.binarytree.keyed_weak_insert_right := bst_keyed_weak_insert_right_op
  |}.
  - intros; eapply bst_keyed_weak_insert_root_sound_local; eauto.
  - intros; eapply bst_keyed_weak_insert_left_sound_local; eauto.
  - intros; eapply bst_keyed_weak_insert_right_sound_local; eauto.
Defined.

Lemma bst_with_tree_key_preserved :
  forall (g : BinarySearchTreeType V) (t : BinaryTreeType V) (x : V),
    bst_key (bst_with_tree g t) x = bst_key g x.
Proof.
  reflexivity.
Qed.

Definition bst_insert_root_op (g : BinarySearchTreeType V) (y : V) (key : Z)
  : BinarySearchTreeType V :=
  bst_with_tree_and_key g
    (insert_root (bst_tree g) y)
    (bst_key_set g y key).

Definition bst_insert_left_op (g : BinarySearchTreeType V) (parent x : V) (key : Z)
  : BinarySearchTreeType V :=
  bst_with_tree_and_key g
    (insert_left V_eq_dec (bst_tree g) parent x)
    (bst_key_set g x key).

Definition bst_insert_right_op (g : BinarySearchTreeType V) (parent x : V) (key : Z)
  : BinarySearchTreeType V :=
  bst_with_tree_and_key g
    (insert_right V_eq_dec (bst_tree g) parent x)
    (bst_key_set g x key).

Definition bst_insert_duplicate_op (g : BinarySearchTreeType V) (_ : V)
  : BinarySearchTreeType V :=
  g.

Definition replace_child_option (old : V) (new : option V)
  (child : option V) : option V :=
  match child with
  | Some v => if V_eq_dec v old then new else Some v
  | None => None
  end.

Definition delete_node_vset (t : BinaryTreeType V) (x : V) (v : V) : Prop :=
  t.(vset) v /\ v <> x.

Definition delete_node_root (t : BinaryTreeType V) (x : V)
  (child : option V) : option V :=
  match t.(root) with
  | Some r => if V_eq_dec r x then child else Some r
  | None => None
  end.

Definition delete_node_left_child (t : BinaryTreeType V) (x : V)
  (child : option V) (v : V) : option V :=
  if V_eq_dec v x
  then None
  else replace_child_option x child (t.(left_child) v).

Definition delete_node_right_child (t : BinaryTreeType V) (x : V)
  (child : option V) (v : V) : option V :=
  if V_eq_dec v x
  then None
  else replace_child_option x child (t.(right_child) v).

Definition delete_node (t : BinaryTreeType V) (x : V)
  (child : option V) : BinaryTreeType V :=
{|
  vset := delete_node_vset t x;
  theroot := delete_node_root t x child;
  left_child := delete_node_left_child t x child;
  right_child := delete_node_right_child t x child;
  listV := remove V_eq_dec x t.(listV)
|}.

Definition vertex_swap (x s v : V) : V :=
  if V_eq_dec v x then s
  else if V_eq_dec v s then x
  else v.

Definition option_vertex_swap (x s : V) (o : option V) : option V :=
  match o with
  | Some v => Some (vertex_swap x s v)
  | None => None
  end.

Definition vertex_swap_tree (t : BinaryTreeType V) (x s : V)
  : BinaryTreeType V :=
{|
  vset := fun v => t.(vset) (vertex_swap x s v);
  theroot := option_vertex_swap x s t.(root);
  left_child := fun v =>
    option_vertex_swap x s (t.(left_child) (vertex_swap x s v));
  right_child := fun v =>
    option_vertex_swap x s (t.(right_child) (vertex_swap x s v));
  listV := map (vertex_swap x s) t.(listV)
|}.

Definition bst_vertex_swap_with_key
  (g : BinarySearchTreeType V) (x s : V) (key_of : V -> Z)
  : BinarySearchTreeType V :=
{|
  bst_tree := vertex_swap_tree (bst_tree g) x s;
  bst_key := key_of
|}.

(* Internal key-copy model used only to transport the BST-order proof. *)
Local Definition bst_key_replace (g : BinarySearchTreeType V) (x s v : V) : Z :=
  if V_eq_dec v x then bst_key g s else bst_key g v.

Definition bst_delete_min_op (g : BinarySearchTreeType V) (r m : V)
  : BinarySearchTreeType V :=
  bst_with_tree g
    (delete_node (bst_tree g) m ((bst_tree g).(right_child) m)).

Definition bst_delete_transplant_op
  (g : BinarySearchTreeType V) (x : V) (child : option V) (_ : Z)
  : BinarySearchTreeType V :=
  bst_with_tree g (delete_node (bst_tree g) x child).

Local Definition bst_delete_successor_keycopy_op
  (g : BinarySearchTreeType V) (x s : V) (_ : Z)
  : BinarySearchTreeType V :=
  bst_with_tree_and_key g
    (delete_node (bst_tree g) s ((bst_tree g).(right_child) s))
    (bst_key_replace g x s).

Definition bst_delete_successor_op
  (g : BinarySearchTreeType V) (x s : V) (key : Z)
  : BinarySearchTreeType V :=
  bst_vertex_swap_with_key
    (bst_delete_successor_keycopy_op g x s key) x s (bst_key g).

Definition bst_delete_noop_op
  (g : BinarySearchTreeType V) (_ : Z) : BinarySearchTreeType V :=
  g.

Lemma delete_node_vvalid_iff :
  forall (t : BinaryTreeType V) (x : V) (child : option V) (z : V),
    (delete_node t x child).(vset) z <-> t.(vset) z /\ z <> x.
Proof.
  reflexivity.
Qed.

Lemma delete_node_root_eq_deleted :
  forall (t : BinaryTreeType V) (x : V) (child : option V),
    t.(root) = Some x ->
    (delete_node t x child).(root) = child.
Proof.
  intros t x child Hroot.
  unfold delete_node; simpl.
  unfold delete_node_root.
  rewrite Hroot.
  destruct (V_eq_dec x x); [reflexivity|contradiction].
Qed.

Lemma delete_node_root_eq_old :
  forall (t : BinaryTreeType V) (x root : V) (child : option V),
    t.(root) = Some root ->
    root <> x ->
    (delete_node t x child).(root) = Some root.
Proof.
  intros t x root child Hroot Hneq.
  unfold delete_node; simpl.
  unfold delete_node_root.
  rewrite Hroot.
  destruct (V_eq_dec root x); [contradiction|reflexivity].
Qed.

Lemma delete_node_root_none :
  forall (t : BinaryTreeType V) (x : V) (child : option V),
    t.(root) = None ->
    (delete_node t x child).(root) = None.
Proof.
  intros t x child Hroot.
  unfold delete_node; simpl.
  unfold delete_node_root.
  rewrite Hroot.
  reflexivity.
Qed.

Lemma delete_node_left_deleted :
  forall (t : BinaryTreeType V) (x : V) (child : option V),
    (delete_node t x child).(left_child) x = None.
Proof.
  intros t x child.
  unfold delete_node; simpl.
  unfold delete_node_left_child.
  destruct (V_eq_dec x x); [reflexivity|contradiction].
Qed.

Lemma delete_node_right_deleted :
  forall (t : BinaryTreeType V) (x : V) (child : option V),
    (delete_node t x child).(right_child) x = None.
Proof.
  intros t x child.
  unfold delete_node; simpl.
  unfold delete_node_right_child.
  destruct (V_eq_dec x x); [reflexivity|contradiction].
Qed.

Lemma delete_node_left_redirect :
  forall (t : BinaryTreeType V) (x z : V) (child : option V),
    z <> x ->
    t.(left_child) z = Some x ->
    (delete_node t x child).(left_child) z = child.
Proof.
  intros t x z child Hzx Hleft.
  unfold delete_node; simpl.
  unfold delete_node_left_child, replace_child_option.
  destruct (V_eq_dec z x); [contradiction|].
  rewrite Hleft.
  destruct (V_eq_dec x x); [reflexivity|contradiction].
Qed.

Lemma delete_node_right_redirect :
  forall (t : BinaryTreeType V) (x z : V) (child : option V),
    z <> x ->
    t.(right_child) z = Some x ->
    (delete_node t x child).(right_child) z = child.
Proof.
  intros t x z child Hzx Hright.
  unfold delete_node; simpl.
  unfold delete_node_right_child, replace_child_option.
  destruct (V_eq_dec z x); [contradiction|].
  rewrite Hright.
  destruct (V_eq_dec x x); [reflexivity|contradiction].
Qed.

Lemma delete_node_left_frame :
  forall (t : BinaryTreeType V) (x z : V) (child : option V),
    z <> x ->
    t.(left_child) z <> Some x ->
    (delete_node t x child).(left_child) z = t.(left_child) z.
Proof.
  intros t x z child Hzx Hleft.
  unfold delete_node; simpl.
  unfold delete_node_left_child, replace_child_option.
  destruct (V_eq_dec z x); [contradiction|].
  destruct (t.(left_child) z) as [c |] eqn:Hchild; [|reflexivity].
  destruct (V_eq_dec c x) as [Hcx | Hcx]; [subst c; contradiction|reflexivity].
Qed.

Lemma delete_node_right_frame :
  forall (t : BinaryTreeType V) (x z : V) (child : option V),
    z <> x ->
    t.(right_child) z <> Some x ->
    (delete_node t x child).(right_child) z = t.(right_child) z.
Proof.
  intros t x z child Hzx Hright.
  unfold delete_node; simpl.
  unfold delete_node_right_child, replace_child_option.
  destruct (V_eq_dec z x); [contradiction|].
  destruct (t.(right_child) z) as [c |] eqn:Hchild; [|reflexivity].
  destruct (V_eq_dec c x) as [Hcx | Hcx]; [subst c; contradiction|reflexivity].
Qed.

Local Lemma bst_key_replace_same :
  forall (g : BinarySearchTreeType V) (x s : V),
    bst_key_replace g x s x = bst_key g s.
Proof.
  intros g x s.
  unfold bst_key_replace.
  destruct (V_eq_dec x x); [reflexivity|contradiction].
Qed.

Local Lemma bst_key_replace_other :
  forall (g : BinarySearchTreeType V) (x s z : V),
    z <> x ->
    bst_key_replace g x s z = bst_key g z.
Proof.
  intros g x s z Hzx.
  unfold bst_key_replace.
  destruct (V_eq_dec z x); [contradiction|reflexivity].
Qed.

Lemma vertex_swap_x :
  forall x s : V, vertex_swap x s x = s.
Proof.
  intros x s.
  unfold vertex_swap.
  destruct (V_eq_dec x x); [reflexivity|contradiction].
Qed.

Lemma vertex_swap_s :
  forall x s : V, vertex_swap x s s = x.
Proof.
  intros x s.
  unfold vertex_swap.
  destruct (V_eq_dec s x) as [Hsx | Hsx].
  - subst s. reflexivity.
  - destruct (V_eq_dec s s); [reflexivity|contradiction].
Qed.

Lemma vertex_swap_other :
  forall x s v : V,
    v <> x -> v <> s -> vertex_swap x s v = v.
Proof.
  intros x s v Hvx Hvs.
  unfold vertex_swap.
  destruct (V_eq_dec v x); [contradiction|].
  destruct (V_eq_dec v s); [contradiction|reflexivity].
Qed.

Lemma vertex_swap_involutive :
  forall x s v : V,
    vertex_swap x s (vertex_swap x s v) = v.
Proof.
  intros x s v.
  destruct (V_eq_dec v x) as [Hvx | Hvx].
  - subst v. rewrite vertex_swap_x, vertex_swap_s. reflexivity.
  - destruct (V_eq_dec v s) as [Hvs | Hvs].
    + subst v. rewrite vertex_swap_s, vertex_swap_x. reflexivity.
    + rewrite (vertex_swap_other x s v Hvx Hvs).
      apply vertex_swap_other; assumption.
Qed.

Lemma vertex_swap_injective :
  forall x s a b : V,
    vertex_swap x s a = vertex_swap x s b -> a = b.
Proof.
  intros x s a b Hab.
  pose proof (f_equal (vertex_swap x s) Hab) as H.
  rewrite !vertex_swap_involutive in H.
  exact H.
Qed.

Lemma option_vertex_swap_some_iff :
  forall x s v (o : option V),
    option_vertex_swap x s o = Some v <->
    o = Some (vertex_swap x s v).
Proof.
  intros x s v [a |]; simpl.
  - split; intro H.
    + inversion H; subst v.
      rewrite vertex_swap_involutive. reflexivity.
    + inversion H; subst a.
      rewrite vertex_swap_involutive. reflexivity.
  - split; discriminate.
Qed.

Lemma option_vertex_swap_frame :
  forall x s (o : option V),
    o <> Some x -> o <> Some s -> option_vertex_swap x s o = o.
Proof.
  intros x s [v |] Hx Hs; [|reflexivity].
  simpl.
  rewrite vertex_swap_other.
  - reflexivity.
  - intro Hvx. subst v. contradiction.
  - intro Hvs. subst v. contradiction.
Qed.

Lemma vertex_swap_map_NoDup :
  forall (l : list V) x s,
    NoDup l -> NoDup (map (vertex_swap x s) l).
Proof.
  intros l x s Hnodup.
  induction Hnodup as [|a l Hnotin Hnodup IH]; simpl.
  - constructor.
  - constructor.
    + intro Hin.
      apply in_map_iff in Hin.
      destruct Hin as [b [Hb Hin]].
      apply Hnotin.
      apply vertex_swap_injective in Hb.
      subst b. exact Hin.
    + exact IH.
Qed.

Lemma vertex_swap_tree_child_iff :
  forall (t : BinaryTreeType V) x s a b,
    bt_child (vertex_swap_tree t x s) a b <->
    bt_child t (vertex_swap x s a) (vertex_swap x s b).
Proof.
  intros t x s a b.
  unfold bt_child, vertex_swap_tree; simpl.
  rewrite !option_vertex_swap_some_iff.
  tauto.
Qed.

Lemma vertex_swap_tree_path_to_old :
  forall (t : BinaryTreeType V) x s a b,
    bt_path (vertex_swap_tree t x s) a b ->
    bt_path t (vertex_swap x s a) (vertex_swap x s b).
Proof.
  intros t x s a b Hpath.
  unfold bt_path in Hpath |- *.
  induction_1n Hpath.
  - reflexivity.
  - transitivity_1n (vertex_swap x s a0).
    + apply (proj1 (vertex_swap_tree_child_iff t x s a1 a0)).
      exact H.
    + exact IHrt.
Qed.

Lemma vertex_swap_tree_path_from_old :
  forall (t : BinaryTreeType V) x s a b,
    bt_path t a b ->
    bt_path (vertex_swap_tree t x s)
      (vertex_swap x s a) (vertex_swap x s b).
Proof.
  intros t x s a b Hpath.
  unfold bt_path in Hpath |- *.
  induction_1n Hpath.
  - reflexivity.
  - transitivity_1n (vertex_swap x s a0).
    + apply (proj2 (vertex_swap_tree_child_iff t x s
        (vertex_swap x s a1) (vertex_swap x s a0))).
      rewrite !vertex_swap_involutive.
      exact H.
    + exact IHrt.
Qed.

Lemma vertex_swap_tree_preserves_gvalid :
  forall (t : BinaryTreeType V) x s,
    gvalid t -> gvalid (vertex_swap_tree t x s).
Proof.
  intros t x s Hvalid.
  constructor.
  - intros r Hroot.
    change (option_vertex_swap x s t.(root) = Some r) in Hroot.
    change (t.(vset) (vertex_swap x s r)).
    eapply root_valid; eauto.
    apply (proj1 (option_vertex_swap_some_iff x s r t.(root))).
    exact Hroot.
  - intros v r Hroot.
    change (option_vertex_swap x s t.(root) = Some r) in Hroot.
    pose proof (proj1 (option_vertex_swap_some_iff x s r t.(root)) Hroot)
      as Hroot_old.
    pose proof (root_no_parents t Hvalid
      (vertex_swap x s v) (vertex_swap x s r) Hroot_old)
      as [Hleft_old Hright_old].
    split; intro Hchild.
    + apply Hleft_old.
      apply (proj1 (option_vertex_swap_some_iff x s r
        (t.(left_child) (vertex_swap x s v)))).
      exact Hchild.
    + apply Hright_old.
      apply (proj1 (option_vertex_swap_some_iff x s r
        (t.(right_child) (vertex_swap x s v)))).
      exact Hchild.
  - intros y x1 x2 Hx1 Hx2 Hchild1 Hchild2.
    apply (vertex_swap_injective x s).
    eapply father_unique; eauto.
    + apply (proj1 (vertex_swap_tree_child_iff t x s x1 y)).
      exact Hchild1.
    + apply (proj1 (vertex_swap_tree_child_iff t x s x2 y)).
      exact Hchild2.
  - intros v1 v2 Hv1 Hchild.
    change (t.(vset) (vertex_swap x s v1)) in Hv1.
    change (t.(vset) (vertex_swap x s v2)).
    apply (child_valid t Hvalid (vertex_swap x s v1)
      (vertex_swap x s v2) Hv1).
    apply (proj1 (vertex_swap_tree_child_iff t x s v1 v2)); exact Hchild.
  - intros v Hnot.
    change (~ t.(vset) (vertex_swap x s v)) in Hnot.
    destruct (invalid_child_is_none t Hvalid (vertex_swap x s v) Hnot)
      as [Hleft Hright].
    change
      (option_vertex_swap x s (t.(left_child) (vertex_swap x s v)) = None /\
       option_vertex_swap x s (t.(right_child) (vertex_swap x s v)) = None).
    rewrite Hleft, Hright. split; reflexivity.
  - intros v1 v2 v3 Hv1 Hv2 Hv3 Hleft Hright.
    intro Hv23. subst v3.
    eapply (child_distinct t Hvalid
      (vertex_swap x s v1) (vertex_swap x s v2) (vertex_swap x s v2)); eauto.
    + apply (proj1 (option_vertex_swap_some_iff x s v2
        (t.(left_child) (vertex_swap x s v1)))).
      exact Hleft.
    + apply (proj1 (option_vertex_swap_some_iff x s v2
        (t.(right_child) (vertex_swap x s v1)))).
      exact Hright.
  - intros v Hv.
    destruct (path_exists t Hvalid (vertex_swap x s v) Hv)
      as [r [Hroot Hpath]].
    exists (vertex_swap x s r).
    split.
    + change (option_vertex_swap x s t.(root) =
        Some (vertex_swap x s r)).
      rewrite Hroot. reflexivity.
    + pose proof (vertex_swap_tree_path_from_old t x s r
        (vertex_swap x s v) Hpath) as Hpath_new.
      rewrite vertex_swap_involutive in Hpath_new.
      exact Hpath_new.
  - intros v Hv.
    change (t.(vset) (vertex_swap x s v)) in Hv.
    apply in_map_iff.
    exists (vertex_swap x s v).
    split.
    + apply vertex_swap_involutive.
    + eapply finite_vertices; eauto.
  - intros v Hin.
    change (In v (map (vertex_swap x s) t.(listV))) in Hin.
    apply in_map_iff in Hin.
    destruct Hin as [u [Hu Hin]].
    change (t.(vset) (vertex_swap x s v)).
    subst v.
    rewrite vertex_swap_involutive.
    eapply listV_sound; eauto.
  - apply vertex_swap_map_NoDup.
    apply listV_NoDup; exact Hvalid.
Qed.

Lemma bst_vertex_swap_with_key_preserves_gvalid :
  forall (g : BinarySearchTreeType V) x s (key_of : V -> Z),
    gvalid g ->
    (forall v,
      (vertex_swap_tree (bst_tree g) x s).(vset) v ->
      key_of v = bst_key g (vertex_swap x s v)) ->
    gvalid (bst_vertex_swap_with_key g x s key_of).
Proof.
  intros g x s key_of Hg Hkey.
  pose proof (vertex_swap_tree_preserves_gvalid
    (bst_tree g) x s (bst_binary_tree g Hg)) as Htree_new.
  constructor.
  - exact Htree_new.
  - intros v1 v2 Hv1 [l [Hleft Hpath]].
    assert (Hl : (vertex_swap_tree (bst_tree g) x s).(vset) l).
    { exact (child_valid _ Htree_new v1 l Hv1 (or_introl Hleft)). }
    assert (Hv2 : (vertex_swap_tree (bst_tree g) x s).(vset) v2).
    { eapply bt_path_end_valid_early; eauto. }
    change (Z.lt (key_of v2) (key_of v1)).
    rewrite (Hkey v2 Hv2), (Hkey v1 Hv1).
    eapply bst_left_order; eauto.
    exists (vertex_swap x s l).
    split.
    + apply (proj1 (option_vertex_swap_some_iff x s l
        ((bst_tree g).(left_child) (vertex_swap x s v1)))).
      exact Hleft.
    + apply vertex_swap_tree_path_to_old. exact Hpath.
  - intros v1 v2 Hv1 [r [Hright Hpath]].
    assert (Hr : (vertex_swap_tree (bst_tree g) x s).(vset) r).
    { exact (child_valid _ Htree_new v1 r Hv1 (or_intror Hright)). }
    assert (Hv2 : (vertex_swap_tree (bst_tree g) x s).(vset) v2).
    { eapply bt_path_end_valid_early; eauto. }
    change (Z.lt (key_of v1) (key_of v2)).
    rewrite (Hkey v1 Hv1), (Hkey v2 Hv2).
    eapply bst_right_order; eauto.
    exists (vertex_swap x s r).
    split.
    + apply (proj1 (option_vertex_swap_some_iff x s r
        ((bst_tree g).(right_child) (vertex_swap x s v1)))).
      exact Hright.
    + apply vertex_swap_tree_path_to_old. exact Hpath.
Qed.

Definition delete_node_child_condition
  (t : BinaryTreeType V) (x : V) (child : option V) : Prop :=
  (t.(right_child) x = None /\ child = t.(left_child) x) \/
  (t.(left_child) x = None /\ child = t.(right_child) x).

Lemma delete_node_child_condition_valid :
  forall (t : BinaryTreeType V) (x c : V) (child : option V),
    gvalid t ->
    t.(vset) x ->
    delete_node_child_condition t x child ->
    child = Some c ->
    t.(vset) c /\ c <> x /\ bt_child t x c.
Proof.
  intros t x c child Hvalid Hx Hcond Hchild.
  unfold delete_node_child_condition in Hcond.
  destruct Hcond as [[Hright Hchild_eq] | [Hleft Hchild_eq]].
  - rewrite Hchild_eq in Hchild.
    split.
    + exact (child_valid t Hvalid x c Hx (or_introl Hchild)).
    + split.
      * intro Hcx. subst c.
        eapply bt_child_no_self; eauto.
        unfold bt_child. left; exact Hchild.
      * unfold bt_child. left; exact Hchild.
  - rewrite Hchild_eq in Hchild.
    split.
    + exact (child_valid t Hvalid x c Hx (or_intror Hchild)).
    + split.
      * intro Hcx. subst c.
        eapply bt_child_no_self; eauto.
        unfold bt_child. right; exact Hchild.
      * unfold bt_child. right; exact Hchild.
Qed.

Lemma delete_node_left_child_inv :
  forall (t : BinaryTreeType V) (x z b : V) (child : option V),
    (delete_node t x child).(left_child) z = Some b ->
    z <> x /\
    ((t.(left_child) z = Some b /\ b <> x) \/
     (t.(left_child) z = Some x /\ child = Some b)).
Proof.
  intros t x z b child Hleft.
  unfold delete_node in Hleft; simpl in Hleft.
  unfold delete_node_left_child, replace_child_option in Hleft.
  destruct (V_eq_dec z x) as [Hzx | Hzx]; [discriminate|].
  split; [exact Hzx|].
  destruct (t.(left_child) z) as [c |] eqn:Hold; [|discriminate].
  destruct (V_eq_dec c x) as [Hcx | Hcx].
  - right. split; [subst c; reflexivity|exact Hleft].
  - inversion Hleft; subst b.
    left. split; [reflexivity|exact Hcx].
Qed.

Lemma delete_node_right_child_inv :
  forall (t : BinaryTreeType V) (x z b : V) (child : option V),
    (delete_node t x child).(right_child) z = Some b ->
    z <> x /\
    ((t.(right_child) z = Some b /\ b <> x) \/
     (t.(right_child) z = Some x /\ child = Some b)).
Proof.
  intros t x z b child Hright.
  unfold delete_node in Hright; simpl in Hright.
  unfold delete_node_right_child, replace_child_option in Hright.
  destruct (V_eq_dec z x) as [Hzx | Hzx]; [discriminate|].
  split; [exact Hzx|].
  destruct (t.(right_child) z) as [c |] eqn:Hold; [|discriminate].
  destruct (V_eq_dec c x) as [Hcx | Hcx].
  - right. split; [subst c; reflexivity|exact Hright].
  - inversion Hright; subst b.
    left. split; [reflexivity|exact Hcx].
Qed.

Lemma delete_node_child_inv :
  forall (t : BinaryTreeType V) (x z b : V) (child : option V),
    bt_child (delete_node t x child) z b ->
    z <> x /\
    (bt_child t z b /\ b <> x \/
     bt_child t z x /\ child = Some b).
Proof.
  intros t x z b child Hchild.
  unfold bt_child in Hchild.
  destruct Hchild as [Hleft | Hright].
  - destruct (delete_node_left_child_inv t x z b child Hleft)
      as [Hzx Hcase].
    split; [exact Hzx|].
    destruct Hcase as [[Hold Hb] | [Hold Hchild_eq]].
    + left. split; [unfold bt_child; left; exact Hold|exact Hb].
    + right. split; [unfold bt_child; left; exact Hold|exact Hchild_eq].
  - destruct (delete_node_right_child_inv t x z b child Hright)
      as [Hzx Hcase].
    split; [exact Hzx|].
    destruct Hcase as [[Hold Hb] | [Hold Hchild_eq]].
    + left. split; [unfold bt_child; right; exact Hold|exact Hb].
    + right. split; [unfold bt_child; right; exact Hold|exact Hchild_eq].
Qed.

Lemma delete_node_old_child_preserved :
  forall (t : BinaryTreeType V) (x z b : V) (child : option V),
    z <> x ->
    b <> x ->
    bt_child t z b ->
    bt_child (delete_node t x child) z b.
Proof.
  intros t x z b child Hzx Hbx Hchild.
  unfold bt_child in Hchild |- *.
  destruct Hchild as [Hleft | Hright].
  - left.
    rewrite delete_node_left_frame; auto.
    intro Hbad. rewrite Hleft in Hbad. inversion Hbad; subst b. contradiction.
  - right.
    rewrite delete_node_right_frame; auto.
    intro Hbad. rewrite Hright in Hbad. inversion Hbad; subst b. contradiction.
Qed.

Lemma delete_node_redirect_child :
  forall (t : BinaryTreeType V) (x z c : V) (child : option V),
    z <> x ->
    bt_child t z x ->
    child = Some c ->
    bt_child (delete_node t x child) z c.
Proof.
  intros t x z c child Hzx Hchild Hchild_eq.
  unfold bt_child in Hchild |- *.
  destruct Hchild as [Hleft | Hright].
  - left.
    rewrite delete_node_left_redirect; auto.
  - right.
    rewrite delete_node_right_redirect; auto.
Qed.

Lemma delete_node_path_not_in_deleted_subtree :
  forall (t : BinaryTreeType V) (x a b : V) (child : option V),
    a <> x ->
    b <> x ->
    ~ bt_path t x b ->
    bt_path t a b ->
    bt_path (delete_node t x child) a b.
Proof.
  intros t x a b child Hax Hbx Hnot Hpath.
  unfold bt_path in Hpath.
  induction_1n Hpath.
  - reflexivity.
  - assert (Ha0x : a0 <> x).
    { intro Ha0x. subst a0.
      apply Hnot.
      unfold bt_path. exact Hpath. }
    unfold bt_path.
    transitivity_1n a0.
    + eapply delete_node_old_child_preserved; eauto.
    + apply IHrt; auto.
Qed.

Lemma delete_node_path_avoiding_deleted :
  forall (t : BinaryTreeType V) (x a b : V) (child : option V),
    a <> x ->
    b <> x ->
    ~ bt_path t a x ->
    bt_path t a b ->
    bt_path (delete_node t x child) a b.
Proof.
  intros t x a b child Hax Hbx Hnot Hpath.
  unfold bt_path in Hpath.
  induction_1n Hpath.
  - reflexivity.
  - assert (Ha0x : a0 <> x).
    { intro Ha0x. subst a0.
      apply Hnot.
      unfold bt_path.
      transitivity_1n x; [exact H|reflexivity]. }
    assert (Hnot_tail : ~ bt_path t a0 x).
    { intro Htail.
      apply Hnot.
      unfold bt_path.
      transitivity_1n a0; [exact H|exact Htail]. }
    unfold bt_path.
    transitivity_1n a0.
    + eapply delete_node_old_child_preserved; eauto.
    + apply IHrt; auto.
Qed.

Lemma delete_node_child_path_preserved :
  forall (t : BinaryTreeType V) (x c b : V) (child : option V),
    gvalid t ->
    t.(vset) x ->
    delete_node_child_condition t x child ->
    child = Some c ->
    b <> x ->
    bt_path t c b ->
    bt_path (delete_node t x child) c b.
Proof.
  intros t x c b child Hvalid Hx Hcond Hchild Hbx Hpath.
  destruct (delete_node_child_condition_valid t x c child Hvalid Hx Hcond Hchild)
    as [Hc [Hcx Hxc]].
  eapply delete_node_path_avoiding_deleted; eauto.
  intro Hcx_path.
  eapply (bt_child_no_back_path t x c); eauto.
Qed.

Lemma delete_node_path_from_deleted :
  forall (t : BinaryTreeType V) (x c b : V) (child : option V),
    gvalid t ->
    t.(vset) x ->
    delete_node_child_condition t x child ->
    child = Some c ->
    b <> x ->
    bt_path t x b ->
    bt_path (delete_node t x child) c b.
Proof.
  intros t x c b child Hvalid Hx Hcond Hchild Hbx Hpath.
  destruct (delete_node_child_condition_valid t x c child Hvalid Hx Hcond Hchild)
    as [Hc [Hcx Hxc]].
  assert (Hreach_xb : reachable t x b).
  { eapply bt_path_to_reachable; eauto. }
  assert (Hxb : x <> b) by (intro H; subst b; contradiction).
  destruct (real_offspring (g:=t) (gvalid:=Hvalid) x b Hreach_xb Hxb)
    as [z [Hxz Hzb]].
  assert (Hzpath : bt_path t z b).
  { eapply reachable_to_bt_path; eauto. }
  destruct Hxz as [e Haux].
  destruct Haux as [_ _ _ Hzchild].
  assert (Hz_eq_c : z = c).
  { unfold delete_node_child_condition in Hcond.
    destruct Hcond as [[Hright Hchild_eq] | [Hleft Hchild_eq]].
    - rewrite Hchild_eq in Hchild.
      destruct Hzchild as [Hzleft | Hzright].
      + rewrite Hchild in Hzleft. inversion Hzleft; reflexivity.
      + rewrite Hright in Hzright. discriminate.
    - rewrite Hchild_eq in Hchild.
      destruct Hzchild as [Hzleft | Hzright].
      + rewrite Hleft in Hzleft. discriminate.
      + rewrite Hchild in Hzright. inversion Hzright; reflexivity. }
  subst z.
  eapply delete_node_child_path_preserved; eauto.
Qed.

Lemma delete_node_path_to_deleted_child :
  forall (t : BinaryTreeType V) (x c a : V) (child : option V),
    a <> x ->
    child = Some c ->
    bt_path t a x ->
    bt_path (delete_node t x child) a c.
Proof.
  intros t x c a child Hax Hchild Hpath.
  unfold bt_path in Hpath.
  induction_1n Hpath.
  - contradiction.
  - destruct (V_eq_dec a0 x) as [Ha0x | Ha0x].
    + subst a0.
      unfold bt_path.
      transitivity_1n c.
      * eapply delete_node_redirect_child; eauto.
      * reflexivity.
    + unfold bt_path.
      transitivity_1n a0.
      * eapply delete_node_old_child_preserved; eauto.
      * apply IHrt; auto.
Qed.

Lemma delete_node_child_to_old_path :
  forall (t : BinaryTreeType V) (x z b : V) (child : option V),
    gvalid t ->
    t.(vset) x ->
    delete_node_child_condition t x child ->
    bt_child (delete_node t x child) z b ->
    z <> x /\ b <> x /\ bt_path t z b.
Proof.
  intros t x z b child Hvalid Hx Hcond Hchild.
  destruct (delete_node_child_inv t x z b child Hchild)
    as [Hzx Hcase].
  split; [exact Hzx|].
  destruct Hcase as [[Hold Hb_neq] | [Hold Hchild_eq]].
  - split; [exact Hb_neq|].
    unfold bt_path.
    transitivity_1n b.
    + exact Hold.
    + reflexivity.
  - destruct (delete_node_child_condition_valid t x b child
      Hvalid Hx Hcond Hchild_eq) as [_ [Hb_neq Hxb]].
    split; [exact Hb_neq|].
    unfold bt_path.
    transitivity_1n x.
    + exact Hold.
    + transitivity_1n b.
      * exact Hxb.
      * reflexivity.
Qed.

Lemma delete_node_path_to_old_path :
  forall (t : BinaryTreeType V) (x a b : V) (child : option V),
    gvalid t ->
    t.(vset) x ->
    delete_node_child_condition t x child ->
    a <> x ->
    b <> x ->
    bt_path (delete_node t x child) a b ->
    bt_path t a b.
Proof.
  intros t x a b child Hvalid Hx Hcond Hax Hbx Hpath.
  unfold bt_path in Hpath.
  induction_1n Hpath.
  - reflexivity.
  - destruct (delete_node_child_to_old_path t x a1 a0 child
      Hvalid Hx Hcond H) as [Ha1x [Ha0x Hold_path]].
    unfold bt_path.
    etransitivity.
    + exact Hold_path.
    + apply IHrt; auto.
Qed.

Lemma delete_node_preserves_gvalid :
  forall (t : BinaryTreeType V) (x : V) (child : option V),
    gvalid t ->
    t.(vset) x ->
    delete_node_child_condition t x child ->
    gvalid (delete_node t x child).
Proof.
  intros t x child Hvalid Hx Hcond.
  constructor; simpl.
  - intros r Hroot.
    unfold delete_node_root in Hroot.
    destruct t.(root) as [root |] eqn:Hroot_old; [|discriminate].
    destruct (V_eq_dec root x) as [Hrootx | Hrootx].
    + subst root.
      destruct child as [c |] eqn:Hchild; [|discriminate].
      inversion Hroot; subst r.
      destruct (delete_node_child_condition_valid t x c (Some c)
        Hvalid Hx Hcond eq_refl) as [Hc [Hcx _]].
      split; assumption.
    + inversion Hroot; subst r.
      split.
      * eapply root_valid; eauto.
      * exact Hrootx.
  - intros v r Hroot.
    split; intro Hbad.
    + destruct (delete_node_left_child_inv t x v r child Hbad)
        as [Hvx Hcase].
      unfold delete_node_root in Hroot.
      destruct t.(root) as [root |] eqn:Hroot_old; [|discriminate].
      destruct (V_eq_dec root x) as [Hrootx | Hrootx].
      * subst root.
        destruct child as [c |] eqn:Hchild; [|discriminate].
        inversion Hroot; subst r.
        destruct Hcase as [[Hold _] | [Hold Hchild_eq]].
        -- destruct (delete_node_child_condition_valid t x c (Some c)
             Hvalid Hx Hcond eq_refl) as [_ [_ Hxc]].
           assert (Hv_old : t.(vset) v).
           { destruct (classic (t.(vset) v)) as [Hv_old | Hnot]; [exact Hv_old|].
             destruct (invalid_child_is_none t Hvalid v Hnot) as [Hnone _].
             rewrite Hnone in Hold. discriminate. }
           pose proof (father_unique t Hvalid c v x Hv_old Hx
             (or_introl Hold) Hxc) as Hvx_eq.
           contradiction.
        -- inversion Hchild_eq.
           pose proof (root_no_parents t Hvalid v x Hroot_old) as [HnL _].
           contradiction.
      * inversion Hroot; subst r.
        destruct Hcase as [[Hold _] | [Hold Hchild_eq]].
        -- pose proof (root_no_parents t Hvalid v root Hroot_old) as [HnL _].
           contradiction.
        -- destruct child as [c |] eqn:Hchild; [|discriminate Hchild_eq].
           inversion Hchild_eq; subst c.
           destruct (delete_node_child_condition_valid t x root (Some root)
             Hvalid Hx Hcond eq_refl) as [_ [_ Hxroot]].
           pose proof (root_no_parents t Hvalid x root Hroot_old) as [HnL HnR].
           unfold bt_child in Hxroot.
           destruct Hxroot as [Hxleft | Hxright]; contradiction.
    + destruct (delete_node_right_child_inv t x v r child Hbad)
        as [Hvx Hcase].
      unfold delete_node_root in Hroot.
      destruct t.(root) as [root |] eqn:Hroot_old; [|discriminate].
      destruct (V_eq_dec root x) as [Hrootx | Hrootx].
      * subst root.
        destruct child as [c |] eqn:Hchild; [|discriminate].
        inversion Hroot; subst r.
        destruct Hcase as [[Hold _] | [Hold Hchild_eq]].
        -- destruct (delete_node_child_condition_valid t x c (Some c)
             Hvalid Hx Hcond eq_refl) as [_ [_ Hxc]].
           assert (Hv_old : t.(vset) v).
           { destruct (classic (t.(vset) v)) as [Hv_old | Hnot]; [exact Hv_old|].
             destruct (invalid_child_is_none t Hvalid v Hnot) as [_ Hnone].
             rewrite Hnone in Hold. discriminate. }
           pose proof (father_unique t Hvalid c v x Hv_old Hx
             (or_intror Hold) Hxc) as Hvx_eq.
           contradiction.
        -- inversion Hchild_eq.
           pose proof (root_no_parents t Hvalid v x Hroot_old) as [_ HnR].
           contradiction.
      * inversion Hroot; subst r.
        destruct Hcase as [[Hold _] | [Hold Hchild_eq]].
        -- pose proof (root_no_parents t Hvalid v root Hroot_old) as [_ HnR].
           contradiction.
        -- destruct child as [c |] eqn:Hchild; [|discriminate Hchild_eq].
           inversion Hchild_eq; subst c.
           destruct (delete_node_child_condition_valid t x root (Some root)
             Hvalid Hx Hcond eq_refl) as [_ [_ Hxroot]].
           pose proof (root_no_parents t Hvalid x root Hroot_old) as [HnL HnR].
           unfold bt_child in Hxroot.
           destruct Hxroot as [Hxleft | Hxright]; contradiction.
  - intros y a b Ha Hb Ha_edge Hb_edge.
    destruct Ha as [Ha Ha_neq].
    destruct Hb as [Hb Hb_neq].
    destruct (delete_node_child_inv t x a y child Ha_edge)
      as [Ha_not_x Ha_case].
    destruct (delete_node_child_inv t x b y child Hb_edge)
      as [Hb_not_x Hb_case].
    destruct Ha_case as [[Ha_old Hy_neq] | [Ha_old Hchild_y]];
    destruct Hb_case as [[Hb_old _] | [Hb_old Hchild_y']].
    + eapply father_unique; eauto.
    + destruct child as [c |] eqn:Hchild; [|discriminate].
      inversion Hchild_y'; subst c.
      destruct (delete_node_child_condition_valid t x y (Some y)
        Hvalid Hx Hcond Hchild_y') as [Hy [_ Hxy]].
      pose proof (father_unique t Hvalid y a x Ha Hx Ha_old Hxy) as Hax.
      subst a. contradiction.
    + destruct child as [c |] eqn:Hchild; [|discriminate].
      inversion Hchild_y; subst c.
      destruct (delete_node_child_condition_valid t x y (Some y)
        Hvalid Hx Hcond Hchild_y) as [Hy [_ Hxy]].
      pose proof (father_unique t Hvalid y x b Hx Hb Hxy Hb_old) as Hxb.
      subst b. contradiction.
    + eapply father_unique; eauto.
  - intros a b Ha Hchild.
    destruct Ha as [Ha Ha_neq].
    destruct (delete_node_child_inv t x a b child Hchild)
      as [_ Hcase].
    destruct Hcase as [[Hold Hb_neq] | [Hold Hchild_eq]].
    + split.
      * eapply child_valid; eauto.
      * exact Hb_neq.
    + destruct child as [c |] eqn:Hchild_opt; [|discriminate].
      inversion Hchild_eq; subst c.
      destruct (delete_node_child_condition_valid t x b (Some b)
        Hvalid Hx Hcond Hchild_eq) as [Hb [Hb_neq _]].
      split; assumption.
  - intros v Hnot.
    destruct (V_eq_dec v x) as [Hvx | Hvx].
    + subst v. split.
      * apply delete_node_left_deleted.
      * apply delete_node_right_deleted.
    + assert (Hnot_old : ~ t.(vset) v).
      { intro Hv.
        apply Hnot.
        split; assumption. }
      destruct (invalid_child_is_none t Hvalid v Hnot_old)
        as [Hleft Hright].
      split.
      * unfold delete_node; simpl.
        unfold delete_node_left_child, replace_child_option.
        destruct (V_eq_dec v x); [contradiction|].
        rewrite Hleft. reflexivity.
      * unfold delete_node; simpl.
        unfold delete_node_right_child, replace_child_option.
        destruct (V_eq_dec v x); [contradiction|].
        rewrite Hright. reflexivity.
  - intros a b c Ha Hb Hc Hleft Hright.
    destruct Ha as [Ha Ha_neq].
    destruct Hb as [Hb Hb_neq].
    destruct Hc as [Hc Hc_neq].
    destruct (delete_node_left_child_inv t x a b child Hleft)
      as [Ha_not_x Hleft_case].
    destruct (delete_node_right_child_inv t x a c child Hright)
      as [_ Hright_case].
    destruct Hleft_case as [[Hleft_old Hb_not_x] | [Hleft_old Hchild_b]];
    destruct Hright_case as [[Hright_old Hc_not_x] | [Hright_old Hchild_c]].
    + exact (child_distinct t Hvalid a b c Ha Hb Hc
        Hleft_old Hright_old).
    + destruct child as [ch |] eqn:Hchild_opt; [|discriminate Hchild_c].
      inversion Hchild_c; subst ch.
      destruct (delete_node_child_condition_valid t x c (Some c)
        Hvalid Hx Hcond eq_refl) as [Hc_old [_ Hxc]].
      intro Hbc. subst c.
      pose proof (father_unique t Hvalid b a x Ha Hx
        (or_introl Hleft_old) Hxc) as Hax.
      contradiction.
    + destruct child as [ch |] eqn:Hchild_opt; [|discriminate Hchild_b].
      inversion Hchild_b; subst ch.
      destruct (delete_node_child_condition_valid t x b (Some b)
        Hvalid Hx Hcond eq_refl) as [Hb_old [_ Hxb]].
      intro Hbc. subst c.
      pose proof (father_unique t Hvalid b x a Hx Ha
        Hxb (or_intror Hright_old)) as Hxa.
      subst a. contradiction.
    + rewrite Hchild_b in Hchild_c. inversion Hchild_c; subst c.
      intro Hbc.
      exact (bt_left_right_same_false t a x Hvalid Ha Hleft_old Hright_old).
  - intros v Hv.
    destruct Hv as [Hv Hv_neq].
    destruct (path_exists t Hvalid v Hv) as [root [Hroot Hpath]].
    destruct (V_eq_dec root x) as [Hrootx | Hrootx].
    + subst root.
      destruct child as [c |] eqn:Hchild.
      * exists c.
        split.
        -- eapply delete_node_root_eq_deleted; eauto.
        -- eapply delete_node_path_from_deleted; eauto.
      * exfalso.
        destruct (V_eq_dec v x) as [Hvx | Hvx]; [contradiction|].
        assert (Hreach_xv : reachable t x v).
        { eapply bt_path_to_reachable; eauto. }
        destruct (real_offspring (g:=t) (gvalid:=Hvalid) x v Hreach_xv)
          as [z [Hxz _]].
        { intro Hxv. subst v. contradiction. }
        destruct Hxz as [e Haux].
        destruct Haux as [_ _ _ Hchild_edge].
        unfold delete_node_child_condition in Hcond.
        destruct Hcond as [[Hright Hleft] | [Hleft Hright]].
        -- destruct Hchild_edge as [Hzleft | Hzright].
           ++ rewrite <- Hleft in Hzleft. discriminate.
           ++ rewrite Hright in Hzright. discriminate.
        -- destruct Hchild_edge as [Hzleft | Hzright].
           ++ rewrite Hleft in Hzleft. discriminate.
           ++ rewrite <- Hright in Hzright. discriminate.
    + exists root.
      split.
      * eapply delete_node_root_eq_old; eauto.
      * destruct (classic (bt_path t x v)) as [Hxv_path | Hnot_sub].
        -- destruct child as [c |] eqn:Hchild.
           ++ assert (Hrootx_path : bt_path t root x).
              { destruct (path_exists t Hvalid x Hx) as [root' [Hroot' Hroot'x]].
                rewrite Hroot in Hroot'. inversion Hroot'; subst root'.
                exact Hroot'x. }
              unfold bt_path.
              etransitivity.
              ** eapply delete_node_path_to_deleted_child; eauto.
              ** eapply delete_node_path_from_deleted; eauto.
           ++ exfalso.
              assert (Hreach_xv : reachable t x v).
              { eapply bt_path_to_reachable; eauto. }
              destruct (real_offspring (g:=t) (gvalid:=Hvalid) x v Hreach_xv)
                as [z [Hxz _]].
              { intro Hxv. subst v. contradiction. }
              destruct Hxz as [e Haux].
              destruct Haux as [_ _ _ Hchild_edge].
              unfold delete_node_child_condition in Hcond.
              destruct Hcond as [[Hright Hleft] | [Hleft Hright]].
              ** destruct Hchild_edge as [Hzleft | Hzright].
                 --- rewrite <- Hleft in Hzleft. discriminate.
                 --- rewrite Hright in Hzright. discriminate.
              ** destruct Hchild_edge as [Hzleft | Hzright].
                 --- rewrite Hleft in Hzleft. discriminate.
                 --- rewrite <- Hright in Hzright. discriminate.
        -- eapply delete_node_path_not_in_deleted_subtree; eauto.
  - intros v Hv.
    destruct Hv as [Hv Hv_neq].
    apply remove_list_keep.
    + exact Hv_neq.
    + eapply finite_vertices; eauto.
  - intros v Hin.
    destruct (remove_list_in_inv V_eq_dec v x t.(listV) Hin)
      as [Hin_old Hv_neq].
    split.
    + eapply listV_sound; eauto.
    + exact Hv_neq.
  - apply remove_list_NoDup.
    apply listV_NoDup; auto.
Qed.

Lemma bst_delete_node_preserves_gvalid :
  forall (g : BinarySearchTreeType V) (x : V) (child : option V),
    gvalid g ->
    (bst_tree g).(vset) x ->
    delete_node_child_condition (bst_tree g) x child ->
    gvalid (bst_with_tree g (delete_node (bst_tree g) x child)).
Proof.
  intros g x child Hg Hx Hcond.
  pose proof (bst_binary_tree g Hg) as Htree.
  pose proof (delete_node_preserves_gvalid (bst_tree g) x child
    Htree Hx Hcond) as Hnew_tree.
  constructor.
  - simpl. exact Hnew_tree.
  - intros v1 v2 Hv1 Hsub.
    simpl in Hv1, Hsub.
    destruct Hv1 as [Hv1_old Hv1_neq].
    destruct Hsub as [l [Hleft Hpath]].
    assert (Hl_new : (delete_node (bst_tree g) x child).(vset) l).
    { exact (child_valid (delete_node (bst_tree g) x child) Hnew_tree
        v1 l (conj Hv1_old Hv1_neq) (or_introl Hleft)). }
    assert (Hv2_new : (delete_node (bst_tree g) x child).(vset) v2).
    { eapply bt_path_end_valid_early; eauto. }
    simpl in Hl_new, Hv2_new.
    destruct Hl_new as [Hl_old Hl_neq].
    destruct Hv2_new as [Hv2_old Hv2_neq].
    destruct (delete_node_left_child_inv (bst_tree g) x v1 l child Hleft)
      as [_ Hleft_case].
    destruct Hleft_case as [[Hleft_old _] | [Hleft_old Hchild_eq]].
    + assert (Hold_path : bt_path (bst_tree g) l v2).
      { exact (delete_node_path_to_old_path (bst_tree g) x l v2 child
          Htree Hx Hcond Hl_neq Hv2_neq Hpath). }
      exact (bst_left_order g Hg v1 v2 Hv1_old
        (ex_intro _ l (conj Hleft_old Hold_path))).
    + assert (Hold_path_l : bt_path (bst_tree g) l v2).
      { exact (delete_node_path_to_old_path (bst_tree g) x l v2 child
          Htree Hx Hcond Hl_neq Hv2_neq Hpath). }
      destruct (delete_node_child_condition_valid (bst_tree g) x l child
        Htree Hx Hcond Hchild_eq) as [_ [_ Hxl]].
      assert (Hold_path : bt_path (bst_tree g) x v2).
      { unfold bt_path.
        transitivity_1n l.
        - exact Hxl.
        - exact Hold_path_l. }
      exact (bst_left_order g Hg v1 v2 Hv1_old
        (ex_intro _ x (conj Hleft_old Hold_path))).
  - intros v1 v2 Hv1 Hsub.
    simpl in Hv1, Hsub.
    destruct Hv1 as [Hv1_old Hv1_neq].
    destruct Hsub as [r [Hright Hpath]].
    assert (Hr_new : (delete_node (bst_tree g) x child).(vset) r).
    { exact (child_valid (delete_node (bst_tree g) x child) Hnew_tree
        v1 r (conj Hv1_old Hv1_neq) (or_intror Hright)). }
    assert (Hv2_new : (delete_node (bst_tree g) x child).(vset) v2).
    { eapply bt_path_end_valid_early; eauto. }
    simpl in Hr_new, Hv2_new.
    destruct Hr_new as [Hr_old Hr_neq].
    destruct Hv2_new as [Hv2_old Hv2_neq].
    destruct (delete_node_right_child_inv (bst_tree g) x v1 r child Hright)
      as [_ Hright_case].
    destruct Hright_case as [[Hright_old _] | [Hright_old Hchild_eq]].
    + assert (Hold_path : bt_path (bst_tree g) r v2).
      { exact (delete_node_path_to_old_path (bst_tree g) x r v2 child
          Htree Hx Hcond Hr_neq Hv2_neq Hpath). }
      exact (bst_right_order g Hg v1 v2 Hv1_old
        (ex_intro _ r (conj Hright_old Hold_path))).
    + assert (Hold_path_r : bt_path (bst_tree g) r v2).
      { exact (delete_node_path_to_old_path (bst_tree g) x r v2 child
          Htree Hx Hcond Hr_neq Hv2_neq Hpath). }
      destruct (delete_node_child_condition_valid (bst_tree g) x r child
        Htree Hx Hcond Hchild_eq) as [_ [_ Hxr]].
      assert (Hold_path : bt_path (bst_tree g) x v2).
      { unfold bt_path.
        transitivity_1n r.
        - exact Hxr.
        - exact Hold_path_r. }
      exact (bst_right_order g Hg v1 v2 Hv1_old
        (ex_intro _ x (conj Hright_old Hold_path))).
Qed.

Lemma bst_delete_min_sound_local :
  forall (g : BinarySearchTreeType V) (r m : V),
    gvalid g ->
    (bst_tree g).(vset) r ->
    (bst_tree g).(vset) m ->
    GraphLib.directed.binarytree.bst_min_node g r m ->
    GraphLib.directed.binarytree.bst_delete_min_valid
      g (bst_delete_min_op g r m) r m.
Proof.
  intros g r m Hg Hr Hm Hmin.
  destruct Hmin as [Hrm [Hm_left Hmin_key]].
  constructor.
  - refine (conj Hg (conj _ (conj Hr (conj Hm _)))).
    + apply bst_delete_node_preserves_gvalid; auto.
      unfold delete_node_child_condition.
      right. split.
      * exact Hm_left.
      * reflexivity.
    + repeat split; auto.
  - intros z; split; intro Hz; exact Hz.
  - repeat split.
    + intro Hroot.
      eapply delete_node_root_eq_deleted; eauto.
    + intros root Hroot Hrootm.
      eapply delete_node_root_eq_old; eauto.
    + intro Hroot.
      eapply delete_node_root_none; eauto.
  - split.
    + intros z Hz Hzm Hleft.
      eapply delete_node_left_redirect; eauto.
    + intros z Hz Hzm Hright.
      eapply delete_node_right_redirect; eauto.
  - split.
    + intros z Hz Hzm Hleft.
      eapply delete_node_left_frame; eauto.
    + intros z Hz Hzm Hright.
      eapply delete_node_right_frame; eauto.
  - intro z; reflexivity.
Qed.

Lemma bst_delete_transplant_sound_local :
  forall (g : BinarySearchTreeType V) (x : V) (child : option V) (key : Z),
    gvalid g ->
    (bst_tree g).(vset) x ->
    bst_key g x = key ->
    ((bst_tree g).(right_child) x = None /\ child = (bst_tree g).(left_child) x) \/
    ((bst_tree g).(left_child) x = None /\ child = (bst_tree g).(right_child) x) ->
    GraphLib.directed.binarytree.bst_delete_transplant_valid
      g (bst_delete_transplant_op g x child key) x child key.
Proof.
  intros g x child key Hg Hx Hkey Hcond.
  constructor.
  - refine (conj Hg (conj _ (conj Hx _))).
    + exact (bst_delete_node_preserves_gvalid g x child Hg Hx Hcond).
    + intro Hbad. simpl in Hbad. destruct Hbad as [_ Hneq]. contradiction.
  - exact Hkey.
  - exact Hcond.
  - intros z; split; intro Hz; exact Hz.
  - repeat split.
    + intro Hroot.
      eapply delete_node_root_eq_deleted; eauto.
    + intros root Hroot Hrootx.
      eapply delete_node_root_eq_old; eauto.
    + intro Hroot.
      eapply delete_node_root_none; eauto.
  - split.
    + intros z Hz Hzx Hleft.
      eapply delete_node_left_redirect; eauto.
    + intros z Hz Hzx Hright.
      eapply delete_node_right_redirect; eauto.
  - split.
    + intros z Hz Hzx Hleft.
      eapply delete_node_left_frame; eauto.
    + intros z Hz Hzx Hright.
      eapply delete_node_right_frame; eauto.
  - intro z; reflexivity.
Qed.

Lemma bt_left_subtree_not_self :
  forall (t : BinaryTreeType V) (x : V),
    gvalid t ->
    t.(vset) x ->
    ~ bt_left_subtree t x x.
Proof.
  intros t x Hvalid Hx [l [Hleft Hpath]].
  exact (bt_child_no_back_path t x l Hvalid Hx
    (or_introl Hleft) Hpath).
Qed.

Lemma bt_right_subtree_not_self :
  forall (t : BinaryTreeType V) (x : V),
    gvalid t ->
    t.(vset) x ->
    ~ bt_right_subtree t x x.
Proof.
  intros t x Hvalid Hx [r [Hright Hpath]].
  exact (bt_child_no_back_path t x r Hvalid Hx
    (or_intror Hright) Hpath).
Qed.

Lemma bst_bt_path_to_offspring :
  forall (g : BinarySearchTreeType V) (a b : V),
    gvalid g ->
    (bst_tree g).(vset) a ->
    bt_path (bst_tree g) a b ->
    offspring g a b.
Proof.
  intros g a b Hg Ha Hpath.
  unfold offspring.
  eapply bst_bt_path_to_reachable; eauto.
Qed.

Lemma bt_path_trans :
  forall (t : BinaryTreeType V) (a b c : V),
    bt_path t a b ->
    bt_path t b c ->
    bt_path t a c.
Proof.
  intros t a b c Hab Hbc.
  unfold bt_path in *.
  etransitivity; eauto.
Qed.

Local Lemma bst_delete_successor_keycopy_preserves_gvalid :
  forall (g : BinarySearchTreeType V) (x r s : V) (key : Z),
    gvalid g ->
    (bst_tree g).(vset) x ->
    (bst_tree g).(vset) s ->
    (bst_tree g).(left_child) x <> None ->
    (bst_tree g).(right_child) x = Some r ->
    GraphLib.directed.binarytree.bst_min_node g r s ->
    gvalid (bst_delete_successor_keycopy_op g x s key).
Proof.
  intros g x r s key Hg Hx Hs Hx_left Hx_right Hmin.
  pose proof (bst_binary_tree g Hg) as Htree.
  destruct Hmin as [Hrs_off [Hs_left Hmin_key]].
  assert (Hrs_path : bt_path (bst_tree g) r s).
  { apply bst_reachable_to_bt_path. exact Hrs_off. }
  assert (Hxs_path : bt_path (bst_tree g) x s).
  { unfold bt_path.
    transitivity_1n r.
    - unfold bt_child. right; exact Hx_right.
    - exact Hrs_path. }
  assert (Hxs : x <> s).
  { intro Hxs_eq. subst s.
    eapply bt_right_subtree_not_self; eauto.
    exists r; split; [exact Hx_right|exact Hrs_path]. }
  assert (Hkey_xs : Z.lt (bst_key g x) (bst_key g s)).
  { eapply bst_right_order; eauto.
    exists r; split; [exact Hx_right|exact Hrs_path]. }
  pose proof (delete_node_preserves_gvalid (bst_tree g) s
    ((bst_tree g).(right_child) s) Htree Hs) as Hnew_tree_base.
  assert (Hcond_s : delete_node_child_condition
      (bst_tree g) s ((bst_tree g).(right_child) s)).
  { unfold delete_node_child_condition.
    right. split; [exact Hs_left|reflexivity]. }
  pose proof (Hnew_tree_base Hcond_s) as Hnew_tree.
  constructor.
  - simpl. exact Hnew_tree.
  - intros v1 v2 Hv1 Hsub.
    simpl in Hv1, Hsub.
    destruct Hv1 as [Hv1_old Hv1_ne_s].
    destruct Hsub as [l [Hleft Hpath]].
    assert (Hl_new : (delete_node (bst_tree g) s ((bst_tree g).(right_child) s)).(vset) l).
    { exact (child_valid (delete_node (bst_tree g) s ((bst_tree g).(right_child) s))
        Hnew_tree v1 l (conj Hv1_old Hv1_ne_s) (or_introl Hleft)). }
    assert (Hv2_new : (delete_node (bst_tree g) s ((bst_tree g).(right_child) s)).(vset) v2).
    { eapply bt_path_end_valid_early; eauto. }
    simpl in Hl_new, Hv2_new.
    destruct Hl_new as [Hl_old Hl_ne_s].
    destruct Hv2_new as [Hv2_old Hv2_ne_s].
    assert (Holdsub : bt_left_subtree (bst_tree g) v1 v2).
    { destruct (delete_node_left_child_inv (bst_tree g) s v1 l
        ((bst_tree g).(right_child) s) Hleft) as [_ Hleft_case].
      destruct Hleft_case as [[Hleft_old _] | [Hleft_old Hchild_eq]].
      - assert (Hold_path : bt_path (bst_tree g) l v2).
        { exact (delete_node_path_to_old_path (bst_tree g) s l v2
            ((bst_tree g).(right_child) s) Htree Hs Hcond_s
            Hl_ne_s Hv2_ne_s Hpath). }
        exists l; split; [exact Hleft_old|exact Hold_path].
      - assert (Hold_path_l : bt_path (bst_tree g) l v2).
        { exact (delete_node_path_to_old_path (bst_tree g) s l v2
            ((bst_tree g).(right_child) s) Htree Hs Hcond_s
            Hl_ne_s Hv2_ne_s Hpath). }
        destruct (delete_node_child_condition_valid (bst_tree g) s l
          ((bst_tree g).(right_child) s) Htree Hs Hcond_s Hchild_eq)
          as [_ [_ Hsl]].
        exists s. split; [exact Hleft_old|].
        unfold bt_path.
        transitivity_1n l; [exact Hsl|exact Hold_path_l]. }
    destruct (V_eq_dec v1 x) as [Hv1x | Hv1x];
    destruct (V_eq_dec v2 x) as [Hv2x | Hv2x].
    + subst v1 v2.
      exfalso.
      exact (bt_left_subtree_not_self
        (delete_node (bst_tree g) s ((bst_tree g).(right_child) s))
        x Hnew_tree (conj Hx Hxs)
        (ex_intro _ l (conj Hleft Hpath))).
    + subst v1.
      simpl.
      rewrite bst_key_replace_same.
      rewrite bst_key_replace_other by exact Hv2x.
      pose proof (bst_left_order g Hg x v2 Hx Holdsub) as Hlt_old.
      lia.
    + subst v2.
      simpl.
      rewrite bst_key_replace_same.
      rewrite bst_key_replace_other by exact Hv1x.
      destruct Holdsub as [l0 [Hleft0 Hpath0]].
      assert (Hsub_s : bt_left_subtree (bst_tree g) v1 s).
      { exists l0. split; [exact Hleft0|].
        eapply bt_path_trans; [exact Hpath0|exact Hxs_path]. }
      exact (bst_left_order g Hg v1 s Hv1_old Hsub_s).
    + simpl.
      rewrite bst_key_replace_other by exact Hv2x.
      rewrite bst_key_replace_other by exact Hv1x.
      exact (bst_left_order g Hg v1 v2 Hv1_old Holdsub).
  - intros v1 v2 Hv1 Hsub.
    simpl in Hv1, Hsub.
    destruct Hv1 as [Hv1_old Hv1_ne_s].
    destruct Hsub as [r0 [Hright Hpath]].
    assert (Hr_new : (delete_node (bst_tree g) s ((bst_tree g).(right_child) s)).(vset) r0).
    { exact (child_valid (delete_node (bst_tree g) s ((bst_tree g).(right_child) s))
        Hnew_tree v1 r0 (conj Hv1_old Hv1_ne_s) (or_intror Hright)). }
    assert (Hv2_new : (delete_node (bst_tree g) s ((bst_tree g).(right_child) s)).(vset) v2).
    { eapply bt_path_end_valid_early; eauto. }
    simpl in Hr_new, Hv2_new.
    destruct Hr_new as [Hr_old Hr_ne_s].
    destruct Hv2_new as [Hv2_old Hv2_ne_s].
    assert (Holdsub : bt_right_subtree (bst_tree g) v1 v2).
    { destruct (delete_node_right_child_inv (bst_tree g) s v1 r0
        ((bst_tree g).(right_child) s) Hright) as [_ Hright_case].
      destruct Hright_case as [[Hright_old _] | [Hright_old Hchild_eq]].
      - assert (Hold_path : bt_path (bst_tree g) r0 v2).
        { exact (delete_node_path_to_old_path (bst_tree g) s r0 v2
            ((bst_tree g).(right_child) s) Htree Hs Hcond_s
            Hr_ne_s Hv2_ne_s Hpath). }
        exists r0; split; [exact Hright_old|exact Hold_path].
      - assert (Hold_path_r : bt_path (bst_tree g) r0 v2).
        { exact (delete_node_path_to_old_path (bst_tree g) s r0 v2
            ((bst_tree g).(right_child) s) Htree Hs Hcond_s
            Hr_ne_s Hv2_ne_s Hpath). }
        destruct (delete_node_child_condition_valid (bst_tree g) s r0
          ((bst_tree g).(right_child) s) Htree Hs Hcond_s Hchild_eq)
          as [_ [_ Hsr]].
        exists s. split; [exact Hright_old|].
        unfold bt_path.
        transitivity_1n r0; [exact Hsr|exact Hold_path_r]. }
    destruct (V_eq_dec v1 x) as [Hv1x | Hv1x];
    destruct (V_eq_dec v2 x) as [Hv2x | Hv2x].
    + subst v1 v2.
      exfalso.
      exact (bt_right_subtree_not_self
        (delete_node (bst_tree g) s ((bst_tree g).(right_child) s))
        x Hnew_tree (conj Hx Hxs)
        (ex_intro _ r0 (conj Hright Hpath))).
    + subst v1.
      simpl.
      rewrite bst_key_replace_same.
      rewrite bst_key_replace_other by exact Hv2x.
      destruct Holdsub as [rr [Hright0 Hpath0]].
      assert (rr = r).
      { congruence. }
      subst rr.
      assert (Hoffs_r_v2 : offspring g r v2).
      { eapply bst_bt_path_to_offspring; eauto.
        exact (child_valid (bst_tree g) Htree x r Hx
          (or_intror Hx_right)). }
      exact (Hmin_key v2 Hoffs_r_v2 Hv2_ne_s).
    + subst v2.
      simpl.
      rewrite bst_key_replace_same.
      rewrite bst_key_replace_other by exact Hv1x.
      destruct Holdsub as [rr [Hright0 Hpath0]].
      assert (Hsub_s : bt_right_subtree (bst_tree g) v1 s).
      { exists rr. split; [exact Hright0|].
        eapply bt_path_trans; [exact Hpath0|exact Hxs_path]. }
      pose proof (bst_right_order g Hg v1 s Hv1_old Hsub_s) as Hlt.
      exact Hlt.
    + simpl.
      rewrite bst_key_replace_other by exact Hv1x.
      rewrite bst_key_replace_other by exact Hv2x.
      exact (bst_right_order g Hg v1 v2 Hv1_old Holdsub).
Qed.

Lemma bst_delete_successor_preserves_gvalid :
  forall (g : BinarySearchTreeType V) (x r s : V) (key : Z),
    gvalid g ->
    (bst_tree g).(vset) x ->
    (bst_tree g).(vset) s ->
    (bst_tree g).(left_child) x <> None ->
    (bst_tree g).(right_child) x = Some r ->
    GraphLib.directed.binarytree.bst_min_node g r s ->
    gvalid (bst_delete_successor_op g x s key).
Proof.
  intros g x r s key Hg Hx Hs Hx_left Hx_right Hmin.
  assert (Hxs : x <> s).
  { destruct Hmin as [Hrs_off _].
    assert (Hrs_path : bt_path (bst_tree g) r s).
    { apply bst_reachable_to_bt_path. exact Hrs_off. }
    intro Hxs_eq. subst s.
    eapply bt_right_subtree_not_self.
    - exact (bst_binary_tree g Hg).
    - exact Hx.
    - exists r; split; assumption. }
  unfold bst_delete_successor_op.
  apply bst_vertex_swap_with_key_preserves_gvalid.
  - eapply bst_delete_successor_keycopy_preserves_gvalid; eauto.
  - intros v Hv.
    change
      ((delete_node (bst_tree g) s ((bst_tree g).(right_child) s)).(vset)
        (vertex_swap x s v)) in Hv.
    change
      (bst_key g v = bst_key_replace g x s (vertex_swap x s v)).
    destruct (V_eq_dec v x) as [Hvx | Hvx].
    + subst v.
      exfalso.
      destruct Hv as [_ Hnot_s].
      apply Hnot_s. apply vertex_swap_x.
    + destruct (V_eq_dec v s) as [Hvs | Hvs].
      * subst v.
        rewrite vertex_swap_s, bst_key_replace_same.
        reflexivity.
      * rewrite (vertex_swap_other x s v Hvx Hvs).
        symmetry. apply bst_key_replace_other. exact Hvx.
Qed.

Lemma vertex_swap_tree_vvalid_replace :
  forall (t : BinaryTreeType V) x s z,
    t.(vset) x -> ~ t.(vset) s ->
    (vertex_swap_tree t x s).(vset) z <->
      (t.(vset) z /\ z <> x) \/ z = s.
Proof.
  intros t x s z Hx Hs.
  assert (Hxs : x <> s) by (intro H; subst s; contradiction).
  change (t.(vset) (vertex_swap x s z) <->
    (t.(vset) z /\ z <> x) \/ z = s).
  destruct (V_eq_dec z x) as [Hzx | Hzx].
  - subst z. rewrite vertex_swap_x.
    split; intro H.
    + contradiction.
    + destruct H as [[_ Hbad] | Hbad]; contradiction.
  - destruct (V_eq_dec z s) as [Hzs | Hzs].
    + subst z. rewrite vertex_swap_s.
      split; intro H; [right; reflexivity|exact Hx].
    + rewrite (vertex_swap_other x s z Hzx Hzs).
      split; intro H.
      * left; split; assumption.
      * destruct H as [[H _] | Hbad]; [exact H|contradiction].
Qed.

Lemma vertex_swap_tree_root_replace :
  forall (t : BinaryTreeType V) x s,
    gvalid t -> t.(vset) x -> ~ t.(vset) s ->
    (t.(root) = Some x -> (vertex_swap_tree t x s).(root) = Some s) /\
    (forall root, t.(root) = Some root -> root <> x ->
       (vertex_swap_tree t x s).(root) = Some root) /\
    (t.(root) = None -> (vertex_swap_tree t x s).(root) = None).
Proof.
  intros t x s Hvalid Hx Hs.
  split.
  - intro Hroot. change (option_vertex_swap x s t.(root) = Some s).
    rewrite Hroot. simpl. rewrite vertex_swap_x. reflexivity.
  - split.
    + intros root Hroot Hrootx.
      assert (Hroots : root <> s).
      { intro H; subst root. apply Hs. eapply root_valid; eauto. }
      change (option_vertex_swap x s t.(root) = Some root).
      rewrite Hroot. simpl.
      rewrite (vertex_swap_other x s root Hrootx Hroots).
      reflexivity.
    + intro Hroot. change (option_vertex_swap x s t.(root) = None).
      rewrite Hroot. reflexivity.
Qed.

Lemma vertex_swap_tree_left_redirect :
  forall (t : BinaryTreeType V) x s z,
    gvalid t -> t.(vset) z -> ~ t.(vset) s -> z <> x ->
    t.(left_child) z = Some x ->
    (vertex_swap_tree t x s).(left_child) z = Some s.
Proof.
  intros t x s z Hvalid Hz Hs Hzx Hleft.
  assert (Hzs : z <> s) by (intro H; subst z; contradiction).
  change (option_vertex_swap x s
    (t.(left_child) (vertex_swap x s z)) = Some s).
  rewrite (vertex_swap_other x s z Hzx Hzs), Hleft.
  simpl. rewrite vertex_swap_x. reflexivity.
Qed.

Lemma vertex_swap_tree_right_redirect :
  forall (t : BinaryTreeType V) x s z,
    gvalid t -> t.(vset) z -> ~ t.(vset) s -> z <> x ->
    t.(right_child) z = Some x ->
    (vertex_swap_tree t x s).(right_child) z = Some s.
Proof.
  intros t x s z Hvalid Hz Hs Hzx Hright.
  assert (Hzs : z <> s) by (intro H; subst z; contradiction).
  change (option_vertex_swap x s
    (t.(right_child) (vertex_swap x s z)) = Some s).
  rewrite (vertex_swap_other x s z Hzx Hzs), Hright.
  simpl. rewrite vertex_swap_x. reflexivity.
Qed.

Lemma vertex_swap_tree_left_frame :
  forall (t : BinaryTreeType V) x s z,
    gvalid t -> t.(vset) z -> ~ t.(vset) s -> z <> x ->
    t.(left_child) z <> Some x ->
    (vertex_swap_tree t x s).(left_child) z = t.(left_child) z.
Proof.
  intros t x s z Hvalid Hz Hs Hzx Hleft_x.
  assert (Hzs : z <> s) by (intro H; subst z; contradiction).
  assert (Hleft_s : t.(left_child) z <> Some s).
  { intro Hleft. apply Hs.
    exact (child_valid t Hvalid z s Hz (or_introl Hleft)). }
  change (option_vertex_swap x s
    (t.(left_child) (vertex_swap x s z)) = t.(left_child) z).
  rewrite (vertex_swap_other x s z Hzx Hzs).
  apply option_vertex_swap_frame; assumption.
Qed.

Lemma vertex_swap_tree_right_frame :
  forall (t : BinaryTreeType V) x s z,
    gvalid t -> t.(vset) z -> ~ t.(vset) s -> z <> x ->
    t.(right_child) z <> Some x ->
    (vertex_swap_tree t x s).(right_child) z = t.(right_child) z.
Proof.
  intros t x s z Hvalid Hz Hs Hzx Hright_x.
  assert (Hzs : z <> s) by (intro H; subst z; contradiction).
  assert (Hright_s : t.(right_child) z <> Some s).
  { intro Hright. apply Hs.
    exact (child_valid t Hvalid z s Hz (or_intror Hright)). }
  change (option_vertex_swap x s
    (t.(right_child) (vertex_swap x s z)) = t.(right_child) z).
  rewrite (vertex_swap_other x s z Hzx Hzs).
  apply option_vertex_swap_frame; assumption.
Qed.

Lemma vertex_swap_tree_left_moved :
  forall (t : BinaryTreeType V) x s,
    gvalid t -> t.(vset) x -> ~ t.(vset) s ->
    (vertex_swap_tree t x s).(left_child) s = t.(left_child) x.
Proof.
  intros t x s Hvalid Hx Hs.
  assert (Hleft_x : t.(left_child) x <> Some x).
  { intro Hleft. eapply bt_child_no_self; eauto. left; exact Hleft. }
  assert (Hleft_s : t.(left_child) x <> Some s).
  { intro Hleft. apply Hs.
    exact (child_valid t Hvalid x s Hx (or_introl Hleft)). }
  change (option_vertex_swap x s
    (t.(left_child) (vertex_swap x s s)) = t.(left_child) x).
  rewrite vertex_swap_s.
  apply option_vertex_swap_frame; assumption.
Qed.

Lemma vertex_swap_tree_right_moved :
  forall (t : BinaryTreeType V) x s,
    gvalid t -> t.(vset) x -> ~ t.(vset) s ->
    (vertex_swap_tree t x s).(right_child) s = t.(right_child) x.
Proof.
  intros t x s Hvalid Hx Hs.
  assert (Hright_x : t.(right_child) x <> Some x).
  { intro Hright. eapply bt_child_no_self; eauto. right; exact Hright. }
  assert (Hright_s : t.(right_child) x <> Some s).
  { intro Hright. apply Hs.
    exact (child_valid t Hvalid x s Hx (or_intror Hright)). }
  change (option_vertex_swap x s
    (t.(right_child) (vertex_swap x s s)) = t.(right_child) x).
  rewrite vertex_swap_s.
  apply option_vertex_swap_frame; assumption.
Qed.

Lemma bst_delete_successor_sound_local :
  forall (g : BinarySearchTreeType V) (x r s : V) (key : Z),
    gvalid g ->
    (bst_tree g).(vset) x ->
    bst_key g x = key ->
    (bst_tree g).(vset) s ->
    (bst_tree g).(left_child) x <> None ->
    (bst_tree g).(right_child) x = Some r ->
    GraphLib.directed.binarytree.bst_min_node g r s ->
    GraphLib.directed.binarytree.bst_delete_successor_valid
      g (bst_delete_min_op g r s) (bst_delete_successor_op g x s key)
      x r s key.
Proof.
  intros g x r s key Hg Hx Hkey Hs Hx_left Hx_right Hmin.
  pose proof Hmin as Hmin_saved.
  destruct Hmin as [Hrs_off [Hs_left Hmin_key]].
  pose proof (bst_binary_tree g Hg) as Htree.
  assert (Hrs_path : bt_path (bst_tree g) r s).
  { apply bst_reachable_to_bt_path. exact Hrs_off. }
  assert (Hxs_path : bt_path (bst_tree g) x s).
  { unfold bt_path.
    transitivity_1n r.
    - unfold bt_child. right; exact Hx_right.
    - exact Hrs_path. }
  assert (Hxs : x <> s).
  { intro Hxs_eq. subst s.
    eapply bt_right_subtree_not_self.
    - exact (bst_binary_tree g Hg).
    - exact Hx.
    - exists r. split; [exact Hx_right|exact Hrs_path]. }
  assert (Hr : (bst_tree g).(vset) r).
  { exact (child_valid (bst_tree g) Htree x r Hx (or_intror Hx_right)). }
  pose proof (bst_delete_min_sound_local g r s Hg Hr Hs Hmin_saved)
    as Hdetach.
  assert (Hg1 : gvalid (bst_delete_min_op g r s)).
  { exact (proj1 (proj2
      (GraphLib.directed.binarytree.bst_dm_gvalid _ _ _ _ Hdetach))). }
  pose proof (bst_binary_tree (bst_delete_min_op g r s) Hg1) as Htree1.
  assert (Hx1 : (bst_tree (bst_delete_min_op g r s)).(vset) x).
  { apply (proj2 (GraphLib.directed.binarytree.bst_dm_vvalid
      _ _ _ _ Hdetach x)). split; assumption. }
  assert (Hs1 : ~ (bst_tree (bst_delete_min_op g r s)).(vset) s).
  { intro Hs1.
    apply (proj1 (GraphLib.directed.binarytree.bst_dm_vvalid
      _ _ _ _ Hdetach s)) in Hs1.
    destruct Hs1 as [_ Hbad]. contradiction. }
  assert (Hg2 : gvalid (bst_delete_successor_op g x s key)).
  { eapply bst_delete_successor_preserves_gvalid; eauto. }
  constructor.
  - exact (conj Hg (conj Hg1 Hg2)).
  - split; assumption.
  - exact (conj Hx_left (conj Hx_right Hmin_saved)).
  - exact Hdetach.
  - refine (conj Hx1 (conj Hs1 (conj _ _))).
    + intro Hx2.
      change
        ((vertex_swap_tree (bst_tree (bst_delete_min_op g r s)) x s).(vset) x)
        in Hx2.
      apply (proj1 (vertex_swap_tree_vvalid_replace
        (bst_tree (bst_delete_min_op g r s)) x s x Hx1 Hs1)) in Hx2.
      destruct Hx2 as [[_ Hbad] | Hbad]; contradiction.
    + change
        ((vertex_swap_tree (bst_tree (bst_delete_min_op g r s)) x s).(vset) s).
      apply (proj2 (vertex_swap_tree_vvalid_replace
        (bst_tree (bst_delete_min_op g r s)) x s s Hx1 Hs1)).
      right; reflexivity.
  - intro z.
    change
      ((vertex_swap_tree (bst_tree (bst_delete_min_op g r s)) x s).(vset) z <->
       ((bst_tree (bst_delete_min_op g r s)).(vset) z /\ z <> x) \/ z = s).
    apply vertex_swap_tree_vvalid_replace; assumption.
  - change
      (((bst_tree (bst_delete_min_op g r s)).(root) = Some x ->
          (vertex_swap_tree (bst_tree (bst_delete_min_op g r s)) x s).(root) = Some s) /\
       (forall root,
          (bst_tree (bst_delete_min_op g r s)).(root) = Some root -> root <> x ->
          (vertex_swap_tree (bst_tree (bst_delete_min_op g r s)) x s).(root) = Some root) /\
       ((bst_tree (bst_delete_min_op g r s)).(root) = None ->
          (vertex_swap_tree (bst_tree (bst_delete_min_op g r s)) x s).(root) = None)).
    exact (vertex_swap_tree_root_replace
      (bst_tree (bst_delete_min_op g r s)) x s Htree1 Hx1 Hs1).
  - split.
    + intros z Hz Hzx Hleft.
      change
        ((vertex_swap_tree (bst_tree (bst_delete_min_op g r s)) x s).(left_child) z = Some s).
      eapply vertex_swap_tree_left_redirect; eauto.
    + intros z Hz Hzx Hright.
      change
        ((vertex_swap_tree (bst_tree (bst_delete_min_op g r s)) x s).(right_child) z = Some s).
      eapply vertex_swap_tree_right_redirect; eauto.
  - split.
    + intros z Hz Hzx Hleft.
      change
        ((vertex_swap_tree (bst_tree (bst_delete_min_op g r s)) x s).(left_child) z =
         (bst_tree (bst_delete_min_op g r s)).(left_child) z).
      eapply vertex_swap_tree_left_frame; eauto.
    + intros z Hz Hzx Hright.
      change
        ((vertex_swap_tree (bst_tree (bst_delete_min_op g r s)) x s).(right_child) z =
         (bst_tree (bst_delete_min_op g r s)).(right_child) z).
      eapply vertex_swap_tree_right_frame; eauto.
  - split.
    + change
        ((vertex_swap_tree (bst_tree (bst_delete_min_op g r s)) x s).(left_child) s =
         (bst_tree (bst_delete_min_op g r s)).(left_child) x).
      apply vertex_swap_tree_left_moved; assumption.
    + change
        ((vertex_swap_tree (bst_tree (bst_delete_min_op g r s)) x s).(right_child) s =
         (bst_tree (bst_delete_min_op g r s)).(right_child) x).
      apply vertex_swap_tree_right_moved; assumption.
  - reflexivity.
  - intros z Hzx. reflexivity.
Qed.

Lemma bst_insert_left_child_inv :
  forall (t : BinaryTreeType V) (x y a b : V),
    x <> y ->
    insert_left_child V_eq_dec t x y a = Some b \/
    insert_left_right_child V_eq_dec t y a = Some b ->
    (a = x /\ b = y) \/ bt_child t a b.
Proof.
  intros t x y a b Hxy Hchild.
  rewrite insert_left_child_eq in Hchild.
  rewrite insert_left_right_child_eq in Hchild.
  unfold insert_left_child_value, insert_left_right_child_value in Hchild.
  destruct Hchild as [Hchild | Hchild].
  - destruct (V_eq_dec a x) as [Hax | Hax].
    + inversion Hchild; subst; auto.
    + destruct (V_eq_dec a y) as [Hay | Hay]; [discriminate|].
      right. unfold bt_child. left. exact Hchild.
  - destruct (V_eq_dec a y) as [Hay | Hay]; [discriminate|].
    right. unfold bt_child. right. exact Hchild.
Qed.

Lemma bst_insert_right_child_inv :
  forall (t : BinaryTreeType V) (x y a b : V),
    x <> y ->
    insert_right_left_child V_eq_dec t y a = Some b \/
    insert_right_child V_eq_dec t x y a = Some b ->
    (a = x /\ b = y) \/ bt_child t a b.
Proof.
  intros t x y a b Hxy Hchild.
  rewrite insert_right_left_child_eq in Hchild.
  rewrite insert_right_child_eq in Hchild.
  unfold insert_right_left_child_value, insert_right_child_value in Hchild.
  destruct Hchild as [Hchild | Hchild].
  - destruct (V_eq_dec a y) as [Hay | Hay]; [discriminate|].
    right. unfold bt_child. left. exact Hchild.
  - destruct (V_eq_dec a x) as [Hax | Hax].
    + inversion Hchild; subst; auto.
    + destruct (V_eq_dec a y) as [Hay | Hay]; [discriminate|].
      right. unfold bt_child. right. exact Hchild.
Qed.

Lemma bst_insert_left_new_leaf_path_self :
  forall (t : BinaryTreeType V) (x y b : V),
    x <> y ->
    bt_path (insert_left V_eq_dec t x y) y b ->
    b = y.
Proof.
  intros t x y b Hxy Hpath.
  eapply bt_leaf_path_self; eauto.
  - simpl.
    rewrite insert_left_child_eq.
    unfold insert_left_child_value.
    destruct (V_eq_dec y x) as [Hyx | Hyx]; [congruence|].
    destruct (V_eq_dec y y); [reflexivity|congruence].
  - simpl.
    rewrite insert_left_right_child_eq.
    unfold insert_left_right_child_value.
    destruct (V_eq_dec y y); [reflexivity|congruence].
Qed.

Lemma bst_insert_right_new_leaf_path_self :
  forall (t : BinaryTreeType V) (x y b : V),
    x <> y ->
    bt_path (insert_right V_eq_dec t x y) y b ->
    b = y.
Proof.
  intros t x y b Hxy Hpath.
  eapply bt_leaf_path_self; eauto.
  - simpl.
    rewrite insert_right_left_child_eq.
    unfold insert_right_left_child_value.
    destruct (V_eq_dec y y); [reflexivity|congruence].
  - simpl.
    rewrite insert_right_child_eq.
    unfold insert_right_child_value.
    destruct (V_eq_dec y x) as [Hyx | Hyx]; [congruence|].
    destruct (V_eq_dec y y); [reflexivity|congruence].
Qed.

Lemma bst_insert_left_path_old_end :
  forall (t : BinaryTreeType V) (x y a b : V),
    gvalid t ->
    ~ t.(vset) y ->
    t.(vset) b ->
    x <> y ->
    bt_path (insert_left V_eq_dec t x y) a b ->
    bt_path t a b.
Proof.
  intros t x y a b Hvalid Hy Hb Hxy Hpath.
  unfold bt_path in Hpath.
  induction_1n Hpath.
  - reflexivity.
  - simpl in H.
    pose proof (bst_insert_left_child_inv t x y a1 a0 Hxy H) as Hstep.
    destruct Hstep as [[Ha1x Ha0y] | Holdstep].
    + subst a1 a0.
      assert (Htail : bt_path (insert_left V_eq_dec t x y) y b)
        by (unfold bt_path; exact Hpath).
      pose proof (bst_insert_left_new_leaf_path_self t x y b Hxy Htail).
      subst b. contradiction.
    + unfold bt_path.
      transitivity_1n a0.
      * exact Holdstep.
      * apply IHrt; auto.
Qed.

Lemma bst_insert_right_path_old_end :
  forall (t : BinaryTreeType V) (x y a b : V),
    gvalid t ->
    ~ t.(vset) y ->
    t.(vset) b ->
    x <> y ->
    bt_path (insert_right V_eq_dec t x y) a b ->
    bt_path t a b.
Proof.
  intros t x y a b Hvalid Hy Hb Hxy Hpath.
  unfold bt_path in Hpath.
  induction_1n Hpath.
  - reflexivity.
  - simpl in H.
    pose proof (bst_insert_right_child_inv t x y a1 a0 Hxy H) as Hstep.
    destruct Hstep as [[Ha1x Ha0y] | Holdstep].
    + subst a1 a0.
      assert (Htail : bt_path (insert_right V_eq_dec t x y) y b)
        by (unfold bt_path; exact Hpath).
      pose proof (bst_insert_right_new_leaf_path_self t x y b Hxy Htail).
      subst b. contradiction.
    + unfold bt_path.
      transitivity_1n a0.
      * exact Holdstep.
      * apply IHrt; auto.
Qed.

Lemma bst_insert_left_path_to_new :
  forall (t : BinaryTreeType V) (x y a : V),
    gvalid t ->
    t.(vset) x ->
    ~ t.(vset) y ->
    t.(left_child) x = None ->
    t.(vset) a ->
    x <> y ->
    bt_path (insert_left V_eq_dec t x y) a y ->
    bt_path t a x.
Proof.
  intros t x y a Hvalid Hx Hy Hleft Ha Hxy Hpath.
  pose proof (insert_left_preserves_gvalid V_eq_dec t x y Hvalid Hx Hy Hleft)
    as Hnew_valid.
  assert (Ha_new : (insert_left V_eq_dec t x y).(vset) a).
  { simpl. left; exact Ha. }
  assert (Hstep_xy : step (insert_left V_eq_dec t x y) x y).
  { unfold step.
    exists y.
    constructor; simpl.
    - left; exact Hx.
    - right; reflexivity.
    - reflexivity.
    - left.
      rewrite insert_left_child_eq.
      unfold insert_left_child_value.
      destruct (V_eq_dec x x); [reflexivity|contradiction]. }
  assert (Hreach_ay : reachable (insert_left V_eq_dec t x y) a y).
  { eapply bt_path_to_reachable; eauto. }
  assert (Hreach_ax : reachable (insert_left V_eq_dec t x y) a x).
  { eapply (one_reachable_down_up (g:=insert_left V_eq_dec t x y)
              (gvalid:=Hnew_valid) a x y); eauto.
    intro Hay. subst a. contradiction. }
  assert (Hpath_ax_new : bt_path (insert_left V_eq_dec t x y) a x).
  { eapply reachable_to_bt_path; eauto. }
  eapply bst_insert_left_path_old_end; eauto.
Qed.

Lemma bst_insert_right_path_to_new :
  forall (t : BinaryTreeType V) (x y a : V),
    gvalid t ->
    t.(vset) x ->
    ~ t.(vset) y ->
    t.(right_child) x = None ->
    t.(vset) a ->
    x <> y ->
    bt_path (insert_right V_eq_dec t x y) a y ->
    bt_path t a x.
Proof.
  intros t x y a Hvalid Hx Hy Hright Ha Hxy Hpath.
  pose proof (insert_right_preserves_gvalid V_eq_dec t x y Hvalid Hx Hy Hright)
    as Hnew_valid.
  assert (Ha_new : (insert_right V_eq_dec t x y).(vset) a).
  { simpl. left; exact Ha. }
  assert (Hstep_xy : step (insert_right V_eq_dec t x y) x y).
  { unfold step.
    exists y.
    constructor; simpl.
    - left; exact Hx.
    - right; reflexivity.
    - reflexivity.
    - right.
      rewrite insert_right_child_eq.
      unfold insert_right_child_value.
      destruct (V_eq_dec x x); [reflexivity|contradiction]. }
  assert (Hreach_ay : reachable (insert_right V_eq_dec t x y) a y).
  { eapply bt_path_to_reachable; eauto. }
  assert (Hreach_ax : reachable (insert_right V_eq_dec t x y) a x).
  { eapply (one_reachable_down_up (g:=insert_right V_eq_dec t x y)
              (gvalid:=Hnew_valid) a x y); eauto.
    intro Hay. subst a. contradiction. }
  assert (Hpath_ax_new : bt_path (insert_right V_eq_dec t x y) a x).
  { eapply reachable_to_bt_path; eauto. }
  eapply bst_insert_right_path_old_end; eauto.
Qed.

Lemma bst_bt_left_subtree_to_in_left :
  forall (g : BinarySearchTreeType V) (a b : V),
    gvalid g ->
    (bst_tree g).(vset) a ->
    bt_left_subtree (bst_tree g) a b ->
    GraphLib.directed.binarytree.in_left_subtree (g:=g) a b.
Proof.
  intros g a b Hg Ha [l [Hleft Hpath]].
  exists l.
  split; [exact Hleft|].
  unfold offspring.
  pose proof (bst_binary_tree g Hg) as Htree.
  eapply bst_bt_path_to_reachable.
  - exact Hg.
  - exact (child_valid (bst_tree g) Htree a l Ha (or_introl Hleft)).
  - exact Hpath.
Qed.

Lemma bst_bt_right_subtree_to_in_right :
  forall (g : BinarySearchTreeType V) (a b : V),
    gvalid g ->
    (bst_tree g).(vset) a ->
    bt_right_subtree (bst_tree g) a b ->
    GraphLib.directed.binarytree.in_right_subtree (g:=g) a b.
Proof.
  intros g a b Hg Ha [r [Hright Hpath]].
  exists r.
  split; [exact Hright|].
  unfold offspring.
  pose proof (bst_binary_tree g Hg) as Htree.
  eapply bst_bt_path_to_reachable.
  - exact Hg.
  - exact (child_valid (bst_tree g) Htree a r Ha (or_intror Hright)).
  - exact Hpath.
Qed.

Lemma bst_insert_root_preserves_gvalid :
  forall (g : BinarySearchTreeType V) (y : V) (key : Z),
    gvalid g ->
    (bst_tree g).(root) = None ->
    ~ (bst_tree g).(vset) y ->
    gvalid (bst_insert_root_op g y key).
Proof.
  intros g y key Hg Hroot Hy.
  pose proof (bst_binary_tree g Hg) as Htree.
  constructor.
  - simpl.
    eapply insert_root_preserves_gvalid; eauto.
  - intros v1 v2 Hv1 [l [Hleft _]].
    simpl in Hv1, Hleft.
    destruct Hv1 as [Hv1 | Hv1].
    + destruct (path_exists (bst_tree g) Htree v1 Hv1) as [r [Hr _]].
      rewrite Hroot in Hr. discriminate.
    + subst v1.
      discriminate.
  - intros v1 v2 Hv1 [r [Hright _]].
    simpl in Hv1, Hright.
    destruct Hv1 as [Hv1 | Hv1].
    + destruct (path_exists (bst_tree g) Htree v1 Hv1) as [root [Hr _]].
      rewrite Hroot in Hr. discriminate.
    + subst v1.
      discriminate.
Qed.

Lemma bst_insert_left_preserves_gvalid :
  forall (g : BinarySearchTreeType V) (x y : V) (key : Z),
    gvalid g ->
    (bst_tree g).(vset) x ->
    ~ (bst_tree g).(vset) y ->
    (bst_tree g).(left_child) x = None ->
    GraphLib.directed.binarytree.bst_search_left_key_constraint g x key ->
    gvalid (bst_insert_left_op g x y key).
Proof.
  intros g x y key Hg Hx Hy Hleft_none Hkey.
  pose proof (bst_binary_tree g Hg) as Htree.
  pose proof (insert_left_preserves_gvalid V_eq_dec (bst_tree g) x y
                Htree Hx Hy Hleft_none) as Hnew_tree.
  destruct Hkey as [Hyx [Hkey_left Hkey_right]].
  assert (Hxy : x <> y) by (intro H; subst; contradiction).
  constructor.
  - simpl. exact Hnew_tree.
  - intros v1 v2 Hv1 Hsub.
    simpl in Hv1, Hsub.
    destruct Hsub as [l [Hnew_left Hnew_path]].
    pose proof Hnew_left as Hnew_left_child.
    assert (Hl_new : (insert_left V_eq_dec (bst_tree g) x y).(vset) l).
    { exact (child_valid (insert_left V_eq_dec (bst_tree g) x y)
        Hnew_tree v1 l Hv1 (or_introl Hnew_left_child)). }
    assert (Hv2_new : (insert_left V_eq_dec (bst_tree g) x y).(vset) v2).
    { eapply bt_path_end_valid_early; eauto. }
    simpl in Hv2_new.
    destruct Hv1 as [Hv1_old | Hv1_new].
    2:{
      subst v1.
      change (insert_left_child V_eq_dec (bst_tree g) x y y = Some l) in Hnew_left.
      rewrite insert_left_child_eq in Hnew_left.
      unfold insert_left_child_value in Hnew_left.
      destruct (V_eq_dec y x) as [Hyx_eq | Hyx_eq]; [congruence|].
      destruct (V_eq_dec y y); discriminate || congruence. }
    change (insert_left_child V_eq_dec (bst_tree g) x y v1 = Some l) in Hnew_left.
    rewrite insert_left_child_eq in Hnew_left.
    unfold insert_left_child_value in Hnew_left.
    destruct (V_eq_dec v1 x) as [Hv1x | Hv1x].
    + subst v1.
      inversion Hnew_left; subst l.
	      pose proof (bst_insert_left_new_leaf_path_self
	                    (bst_tree g) x y v2 Hxy Hnew_path) as Hv2y.
	      subst v2.
	      simpl.
	      unfold bst_key_set.
	      destruct (V_eq_dec y y); [|contradiction].
	      destruct (V_eq_dec x y); [contradiction|].
	      exact Hyx.
    + destruct (V_eq_dec v1 y) as [Hv1y | Hv1y]; [subst; contradiction|].
      destruct Hv2_new as [Hv2_old | Hv2_new].
      * assert (Hold_path : bt_path (bst_tree g) l v2).
        { exact (bst_insert_left_path_old_end
            (bst_tree g) x y l v2 Htree Hy Hv2_old Hxy Hnew_path). }
	        assert (Holdsub : bt_left_subtree (bst_tree g) v1 v2).
	        { exists l; split; [exact Hnew_left|exact Hold_path]. }
	        simpl.
	        unfold bst_key_set.
	        destruct (V_eq_dec v2 y) as [Hv2y | Hv2y]; [subst; contradiction|].
	        destruct (V_eq_dec v1 y) as [Hv1y' | Hv1y']; [subst; contradiction|].
	        exact (bst_left_order g Hg v1 v2 Hv1_old Holdsub).
      * subst v2.
        assert (Hpath_lx : bt_path (bst_tree g) l x).
        { exact (bst_insert_left_path_to_new
            (bst_tree g) x y l Htree Hx Hy Hleft_none
            (child_valid (bst_tree g) Htree v1 l Hv1_old (or_introl Hnew_left))
            Hxy Hnew_path). }
	        simpl.
	        unfold bst_key_set.
	        destruct (V_eq_dec y y); [|contradiction].
	        destruct (V_eq_dec v1 y) as [Hv1y' | Hv1y']; [subst; contradiction|].
	        apply Hkey_left.
	        -- exact Hv1_old.
	        -- eapply bst_bt_left_subtree_to_in_left; eauto.
	           exists l; split; [exact Hnew_left|exact Hpath_lx].
  - intros v1 v2 Hv1 Hsub.
    simpl in Hv1, Hsub.
    destruct Hsub as [r [Hnew_right Hnew_path]].
    pose proof Hnew_right as Hnew_right_child.
    assert (Hr_new : (insert_left V_eq_dec (bst_tree g) x y).(vset) r).
    { exact (child_valid (insert_left V_eq_dec (bst_tree g) x y)
        Hnew_tree v1 r Hv1 (or_intror Hnew_right_child)). }
    assert (Hv2_new : (insert_left V_eq_dec (bst_tree g) x y).(vset) v2).
    { eapply bt_path_end_valid_early; eauto. }
    simpl in Hv2_new.
    destruct Hv1 as [Hv1_old | Hv1_new].
    2:{
      subst v1.
      change (insert_left_right_child V_eq_dec (bst_tree g) y y = Some r) in Hnew_right.
      rewrite insert_left_right_child_eq in Hnew_right.
      unfold insert_left_right_child_value in Hnew_right.
      destruct (V_eq_dec y y); discriminate || congruence. }
    change (insert_left_right_child V_eq_dec (bst_tree g) y v1 = Some r) in Hnew_right.
    rewrite insert_left_right_child_eq in Hnew_right.
    unfold insert_left_right_child_value in Hnew_right.
    destruct (V_eq_dec v1 y) as [Hv1y | Hv1y]; [subst; contradiction|].
    destruct Hv2_new as [Hv2_old | Hv2_new].
    + assert (Hold_path : bt_path (bst_tree g) r v2).
      { exact (bst_insert_left_path_old_end
          (bst_tree g) x y r v2 Htree Hy Hv2_old Hxy Hnew_path). }
	      assert (Holdsub : bt_right_subtree (bst_tree g) v1 v2).
	      { exists r; split; [exact Hnew_right|exact Hold_path]. }
	      simpl.
	      unfold bst_key_set.
	      destruct (V_eq_dec v2 y) as [Hv2y | Hv2y]; [subst; contradiction|].
	      destruct (V_eq_dec v1 y) as [Hv1y' | Hv1y']; [subst; contradiction|].
	      exact (bst_right_order g Hg v1 v2 Hv1_old Holdsub).
    + subst v2.
      assert (Hpath_rx : bt_path (bst_tree g) r x).
      { exact (bst_insert_left_path_to_new
          (bst_tree g) x y r Htree Hx Hy Hleft_none
          (child_valid (bst_tree g) Htree v1 r Hv1_old (or_intror Hnew_right))
          Hxy Hnew_path). }
      assert (Hin_right : GraphLib.directed.binarytree.in_right_subtree (g:=g) v1 x).
      { eapply bst_bt_right_subtree_to_in_right; eauto.
        exists r; split; [exact Hnew_right|exact Hpath_rx]. }
	      simpl.
	      unfold bst_key_set.
	      destruct (V_eq_dec y y); [|contradiction].
	      destruct (V_eq_dec v1 y) as [Hv1y' | Hv1y']; [subst; contradiction|].
	      unfold Z.gt in Hkey_right.
	      apply Z.compare_gt_iff.
	      exact (Hkey_right v1 Hv1_old Hin_right).
Qed.

Lemma bst_insert_right_preserves_gvalid :
  forall (g : BinarySearchTreeType V) (x y : V) (key : Z),
    gvalid g ->
    (bst_tree g).(vset) x ->
    ~ (bst_tree g).(vset) y ->
    (bst_tree g).(right_child) x = None ->
    GraphLib.directed.binarytree.bst_search_right_key_constraint g x key ->
    gvalid (bst_insert_right_op g x y key).
Proof.
  intros g x y key Hg Hx Hy Hright_none Hkey.
  pose proof (bst_binary_tree g Hg) as Htree.
  pose proof (insert_right_preserves_gvalid V_eq_dec (bst_tree g) x y
                Htree Hx Hy Hright_none) as Hnew_tree.
  destruct Hkey as [Hyx [Hkey_left Hkey_right]].
  assert (Hxy : x <> y) by (intro H; subst; contradiction).
  constructor.
  - simpl. exact Hnew_tree.
  - intros v1 v2 Hv1 Hsub.
    simpl in Hv1, Hsub.
    destruct Hsub as [l [Hnew_left Hnew_path]].
    pose proof Hnew_left as Hnew_left_child.
    assert (Hl_new : (insert_right V_eq_dec (bst_tree g) x y).(vset) l).
    { exact (child_valid (insert_right V_eq_dec (bst_tree g) x y)
        Hnew_tree v1 l Hv1 (or_introl Hnew_left_child)). }
    assert (Hv2_new : (insert_right V_eq_dec (bst_tree g) x y).(vset) v2).
    { eapply bt_path_end_valid_early; eauto. }
    simpl in Hv2_new.
    destruct Hv1 as [Hv1_old | Hv1_new].
    2:{
      subst v1.
      change (insert_right_left_child V_eq_dec (bst_tree g) y y = Some l) in Hnew_left.
      rewrite insert_right_left_child_eq in Hnew_left.
      unfold insert_right_left_child_value in Hnew_left.
      destruct (V_eq_dec y y); discriminate || congruence. }
    change (insert_right_left_child V_eq_dec (bst_tree g) y v1 = Some l) in Hnew_left.
    rewrite insert_right_left_child_eq in Hnew_left.
    unfold insert_right_left_child_value in Hnew_left.
    destruct (V_eq_dec v1 y) as [Hv1y | Hv1y]; [subst; contradiction|].
    destruct Hv2_new as [Hv2_old | Hv2_new].
    + assert (Hold_path : bt_path (bst_tree g) l v2).
      { exact (bst_insert_right_path_old_end
          (bst_tree g) x y l v2 Htree Hy Hv2_old Hxy Hnew_path). }
	      assert (Holdsub : bt_left_subtree (bst_tree g) v1 v2).
	      { exists l; split; [exact Hnew_left|exact Hold_path]. }
	      simpl.
	      unfold bst_key_set.
	      destruct (V_eq_dec v2 y) as [Hv2y | Hv2y]; [subst; contradiction|].
	      destruct (V_eq_dec v1 y) as [Hv1y' | Hv1y']; [subst; contradiction|].
	      exact (bst_left_order g Hg v1 v2 Hv1_old Holdsub).
    + subst v2.
      assert (Hpath_lx : bt_path (bst_tree g) l x).
      { exact (bst_insert_right_path_to_new
          (bst_tree g) x y l Htree Hx Hy Hright_none
          (child_valid (bst_tree g) Htree v1 l Hv1_old (or_introl Hnew_left))
          Hxy Hnew_path). }
      assert (Hin_left : GraphLib.directed.binarytree.in_left_subtree (g:=g) v1 x).
      { eapply bst_bt_left_subtree_to_in_left; eauto.
        exists l; split; [exact Hnew_left|exact Hpath_lx]. }
	      simpl.
	      unfold bst_key_set.
	      destruct (V_eq_dec y y); [|contradiction].
	      destruct (V_eq_dec v1 y) as [Hv1y' | Hv1y']; [subst; contradiction|].
	      exact (Hkey_left v1 Hv1_old Hin_left).
  - intros v1 v2 Hv1 Hsub.
    simpl in Hv1, Hsub.
    destruct Hsub as [r [Hnew_right Hnew_path]].
    pose proof Hnew_right as Hnew_right_child.
    assert (Hr_new : (insert_right V_eq_dec (bst_tree g) x y).(vset) r).
    { exact (child_valid (insert_right V_eq_dec (bst_tree g) x y)
        Hnew_tree v1 r Hv1 (or_intror Hnew_right_child)). }
    assert (Hv2_new : (insert_right V_eq_dec (bst_tree g) x y).(vset) v2).
    { eapply bt_path_end_valid_early; eauto. }
    simpl in Hv2_new.
    destruct Hv1 as [Hv1_old | Hv1_new].
    2:{
      subst v1.
      change (insert_right_child V_eq_dec (bst_tree g) x y y = Some r) in Hnew_right.
      rewrite insert_right_child_eq in Hnew_right.
      unfold insert_right_child_value in Hnew_right.
      destruct (V_eq_dec y x) as [Hyx_eq | Hyx_eq]; [congruence|].
      destruct (V_eq_dec y y); discriminate || congruence. }
    change (insert_right_child V_eq_dec (bst_tree g) x y v1 = Some r) in Hnew_right.
    rewrite insert_right_child_eq in Hnew_right.
    unfold insert_right_child_value in Hnew_right.
    destruct (V_eq_dec v1 x) as [Hv1x | Hv1x].
    + subst v1.
      inversion Hnew_right; subst r.
	      pose proof (bst_insert_right_new_leaf_path_self
	                    (bst_tree g) x y v2 Hxy Hnew_path) as Hv2y.
	      subst v2.
	      simpl.
	      unfold bst_key_set.
	      destruct (V_eq_dec y y); [|contradiction].
	      destruct (V_eq_dec x y); [contradiction|].
	      unfold Z.gt in Hyx.
	      apply Z.compare_gt_iff.
	      exact Hyx.
    + destruct (V_eq_dec v1 y) as [Hv1y | Hv1y]; [subst; contradiction|].
      destruct Hv2_new as [Hv2_old | Hv2_new].
      * assert (Hold_path : bt_path (bst_tree g) r v2).
        { exact (bst_insert_right_path_old_end
            (bst_tree g) x y r v2 Htree Hy Hv2_old Hxy Hnew_path). }
	        assert (Holdsub : bt_right_subtree (bst_tree g) v1 v2).
	        { exists r; split; [exact Hnew_right|exact Hold_path]. }
	        simpl.
	        unfold bst_key_set.
	        destruct (V_eq_dec v2 y) as [Hv2y | Hv2y]; [subst; contradiction|].
	        destruct (V_eq_dec v1 y) as [Hv1y' | Hv1y']; [subst; contradiction|].
	        exact (bst_right_order g Hg v1 v2 Hv1_old Holdsub).
      * subst v2.
        assert (Hpath_rx : bt_path (bst_tree g) r x).
        { exact (bst_insert_right_path_to_new
            (bst_tree g) x y r Htree Hx Hy Hright_none
            (child_valid (bst_tree g) Htree v1 r Hv1_old (or_intror Hnew_right))
            Hxy Hnew_path). }
        assert (Hin_right : GraphLib.directed.binarytree.in_right_subtree (g:=g) v1 x).
        { eapply bst_bt_right_subtree_to_in_right; eauto.
          exists r; split; [exact Hnew_right|exact Hpath_rx]. }
	        simpl.
	        unfold bst_key_set.
	        destruct (V_eq_dec y y); [|contradiction].
	        destruct (V_eq_dec v1 y) as [Hv1y' | Hv1y']; [subst; contradiction|].
	        unfold Z.gt in Hkey_right.
	        apply Z.compare_gt_iff.
	        exact (Hkey_right v1 Hv1_old Hin_right).
Qed.

#[export] Instance BST_insert_operations :
  GraphLib.directed.binarytree.BinarySearchTreeInsertOperation
    (G := BinarySearchTreeType V) (V := V) (E := V).
Proof.
  refine {|
    GraphLib.directed.binarytree.bst_insert_root := bst_insert_root_op;
    GraphLib.directed.binarytree.bst_insert_left := bst_insert_left_op;
    GraphLib.directed.binarytree.bst_insert_right := bst_insert_right_op;
    GraphLib.directed.binarytree.bst_insert_duplicate := bst_insert_duplicate_op
  |}.
  - intros g y key Hg Hroot Hy.
    change ((bst_tree g).(root) = None) in Hroot.
    change (~ (bst_tree g).(vset) y) in Hy.
    pose proof (bst_insert_root_preserves_gvalid g y key Hg Hroot Hy) as Hg'.
    assert (Hdomain : bst_node_domain_valid g (bst_tree g).(listV)).
    { constructor; simpl.
      - reflexivity.
      - intros v; apply bst_listV_spec; exact Hg.
      - intros parent child Hparent Hchild; exact (child_valid (bst_tree g) (bst_binary_tree g Hg) parent child Hparent Hchild).
      - intros v Hv; exact (invalid_child_is_none (bst_tree g) (bst_binary_tree g Hg) v Hv).
      - exact (bst_listV_NoDup g Hg). }
    assert (Hdomain' : bst_node_domain_valid (bst_insert_root_op g y key) (y :: (bst_tree g).(listV))).
    { constructor; simpl.
      - reflexivity.
      - intros v.
        change (In v (bst_tree (bst_insert_root_op g y key)).(listV) <-> bst_vvalid (bst_insert_root_op g y key) v).
        apply bst_listV_spec; exact Hg'.
      - intros parent child Hparent Hchild; exact (child_valid (bst_tree (bst_insert_root_op g y key)) (bst_binary_tree (bst_insert_root_op g y key) Hg') parent child Hparent Hchild).
      - intros v Hv; exact (invalid_child_is_none (bst_tree (bst_insert_root_op g y key)) (bst_binary_tree (bst_insert_root_op g y key) Hg') v Hv).
      - exact (bst_listV_NoDup (bst_insert_root_op g y key) Hg'). }
    constructor.
    + constructor.
      * constructor; simpl.
        -- exists (bst_tree g).(listV); split; assumption.
        -- exact Hroot.
        -- exact Hy.
        -- intros z; split; intro Hz; exact Hz.
        -- reflexivity.
        -- split; reflexivity.
        -- split; intros z Hz.
           ++ exfalso.
              destruct (path_exists (bst_tree g) (bst_binary_tree g Hg) z Hz) as [r [Hrroot _]].
              rewrite Hroot in Hrroot. discriminate.
           ++ exfalso.
              destruct (path_exists (bst_tree g) (bst_binary_tree g Hg) z Hz) as [r [Hrroot _]].
              rewrite Hroot in Hrroot. discriminate.
      * unfold bst_insert_root_op, bst_with_tree_and_key.
        simpl.
        unfold bst_key_set.
        change ((if V_eq_dec y y then key else bst_key g y) = key).
        destruct (V_eq_dec y y); [reflexivity | contradiction].
      * unfold bst_insert_root_op, bst_with_tree_and_key.
        simpl.
        unfold bst_key_set.
        intros z Hzy.
        change ((if V_eq_dec z y then key else bst_key g z) = bst_key g z).
        destruct (V_eq_dec z y); [contradiction | reflexivity].
    + split; assumption.
  - intros g x key y Hg Hnode Hlt Hy.
    pose proof Hnode as Hnode_copy.
    destruct Hnode as [Hx [Hcase Hsubtree]].
    destruct Hcase as [[Hleft Hlt_case] | [Hright Hgt_case]].
    2:{ lia. }
    unfold GraphLib.directed.binarytree.bst_search_node_in_subtree in Hsubtree.
    change (GraphLib.directed.binarytree.bt_root g) with ((bst_tree g).(root)) in Hsubtree.
    destruct ((bst_tree g).(root)) as [root |] eqn:Hroot.
    2:{
      destruct (path_exists (bst_tree g) (bst_binary_tree g Hg) x Hx)
        as [r [Hrroot _]].
      rewrite Hroot in Hrroot. discriminate. }
    destruct Hsubtree as [_ [_ Hkey]].
    assert (Hkey_insert :
      GraphLib.directed.binarytree.bst_search_left_key_constraint g x key).
    { split; auto. }
    change ((bst_tree g).(vset) x) in Hx.
    change (~ (bst_tree g).(vset) y) in Hy.
    change ((bst_tree g).(left_child) x = None) in Hleft.
    assert (Hxy : x <> y) by (intro H; subst; contradiction).
    pose proof (bst_insert_left_preserves_gvalid g x y key Hg Hx Hy Hleft Hkey_insert) as Hg'.
    assert (Hdomain : bst_node_domain_valid g (bst_tree g).(listV)).
    { constructor; simpl.
      - reflexivity.
      - intros v; apply bst_listV_spec; exact Hg.
      - intros parent child Hparent Hchild; exact (child_valid (bst_tree g) (bst_binary_tree g Hg) parent child Hparent Hchild).
      - intros v Hv; exact (invalid_child_is_none (bst_tree g) (bst_binary_tree g Hg) v Hv).
      - exact (bst_listV_NoDup g Hg). }
    assert (Hdomain' : bst_node_domain_valid (bst_insert_left_op g x y key) (y :: (bst_tree g).(listV))).
    { constructor; simpl.
      - reflexivity.
      - intros v.
        change (In v (bst_tree (bst_insert_left_op g x y key)).(listV) <-> bst_vvalid (bst_insert_left_op g x y key) v).
        apply bst_listV_spec; exact Hg'.
      - intros parent child Hparent Hchild; exact (child_valid (bst_tree (bst_insert_left_op g x y key)) (bst_binary_tree (bst_insert_left_op g x y key) Hg') parent child Hparent Hchild).
      - intros v Hv; exact (invalid_child_is_none (bst_tree (bst_insert_left_op g x y key)) (bst_binary_tree (bst_insert_left_op g x y key) Hg') v Hv).
      - exact (bst_listV_NoDup (bst_insert_left_op g x y key) Hg'). }
    constructor.
    + constructor.
      * constructor; simpl.
        -- exists (bst_tree g).(listV); split; assumption.
        -- exact Hx.
        -- exact Hy.
        -- exact Hleft.
        -- intros z; split; intro Hz; exact Hz.
        -- reflexivity.
        -- rewrite insert_left_child_eq.
           unfold insert_left_child_value.
           destruct (V_eq_dec x x); [reflexivity | contradiction].
        -- split.
           ++ rewrite insert_left_child_eq.
              unfold insert_left_child_value.
              destruct (V_eq_dec y x) as [Hyx | Hyx]; [subst y; contradiction |].
              destruct (V_eq_dec y y) as [_ | Hyy]; [reflexivity | contradiction].
           ++ rewrite insert_left_right_child_eq.
              unfold insert_left_right_child_value.
              destruct (V_eq_dec y y) as [_ | Hyy]; [reflexivity | contradiction].
        -- split.
           ++ intros z Hz Hzx.
              rewrite insert_left_child_eq.
              unfold insert_left_child_value.
              destruct (V_eq_dec z x) as [Hzx' | Hzx']; [contradiction |].
              destruct (V_eq_dec z y) as [Hzy | Hzy]; [subst z; contradiction | reflexivity].
           ++ intros z Hz.
              rewrite insert_left_right_child_eq.
              unfold insert_left_right_child_value.
              destruct (V_eq_dec z y) as [Hzy | Hzy]; [subst z; contradiction | reflexivity].
      * unfold bst_insert_left_op, bst_with_tree_and_key.
        simpl.
        unfold bst_key_set.
        change ((if V_eq_dec y y then key else bst_key g y) = key).
        destruct (V_eq_dec y y); [reflexivity | contradiction].
      * unfold bst_insert_left_op, bst_with_tree_and_key.
        simpl.
        unfold bst_key_set.
        intros z Hzy.
        change ((if V_eq_dec z y then key else bst_key g z) = bst_key g z).
        destruct (V_eq_dec z y); [contradiction | reflexivity].
    + split; assumption.
    + split; [exact Hy | exact Hnode_copy].
    + exact Hlt.
  - intros g x key y Hg Hnode Hgt Hy.
    pose proof Hnode as Hnode_copy.
    destruct Hnode as [Hx [Hcase Hsubtree]].
    destruct Hcase as [[Hleft Hlt_case] | [Hright Hgt_case]].
    { lia. }
    unfold GraphLib.directed.binarytree.bst_search_node_in_subtree in Hsubtree.
    change (GraphLib.directed.binarytree.bt_root g) with ((bst_tree g).(root)) in Hsubtree.
    destruct ((bst_tree g).(root)) as [root |] eqn:Hroot.
    2:{
      destruct (path_exists (bst_tree g) (bst_binary_tree g Hg) x Hx)
        as [r [Hrroot _]].
      rewrite Hroot in Hrroot. discriminate. }
    destruct Hsubtree as [_ [_ Hkey]].
    assert (Hkey_insert :
      GraphLib.directed.binarytree.bst_search_right_key_constraint g x key).
    { split; auto. }
    change ((bst_tree g).(vset) x) in Hx.
    change (~ (bst_tree g).(vset) y) in Hy.
    change ((bst_tree g).(right_child) x = None) in Hright.
    assert (Hxy : x <> y) by (intro H; subst; contradiction).
    pose proof (bst_insert_right_preserves_gvalid g x y key Hg Hx Hy Hright Hkey_insert) as Hg'.
    assert (Hdomain : bst_node_domain_valid g (bst_tree g).(listV)).
    { constructor; simpl.
      - reflexivity.
      - intros v; apply bst_listV_spec; exact Hg.
      - intros parent child Hparent Hchild; exact (child_valid (bst_tree g) (bst_binary_tree g Hg) parent child Hparent Hchild).
      - intros v Hv; exact (invalid_child_is_none (bst_tree g) (bst_binary_tree g Hg) v Hv).
      - exact (bst_listV_NoDup g Hg). }
    assert (Hdomain' : bst_node_domain_valid (bst_insert_right_op g x y key) (y :: (bst_tree g).(listV))).
    { constructor; simpl.
      - reflexivity.
      - intros v.
        change (In v (bst_tree (bst_insert_right_op g x y key)).(listV) <-> bst_vvalid (bst_insert_right_op g x y key) v).
        apply bst_listV_spec; exact Hg'.
      - intros parent child Hparent Hchild; exact (child_valid (bst_tree (bst_insert_right_op g x y key)) (bst_binary_tree (bst_insert_right_op g x y key) Hg') parent child Hparent Hchild).
      - intros v Hv; exact (invalid_child_is_none (bst_tree (bst_insert_right_op g x y key)) (bst_binary_tree (bst_insert_right_op g x y key) Hg') v Hv).
      - exact (bst_listV_NoDup (bst_insert_right_op g x y key) Hg'). }
    constructor.
    + constructor.
      * constructor; simpl.
        -- exists (bst_tree g).(listV); split; assumption.
        -- exact Hx.
        -- exact Hy.
        -- exact Hright.
        -- intros z; split; intro Hz; exact Hz.
        -- reflexivity.
        -- rewrite insert_right_child_eq.
           unfold insert_right_child_value.
           destruct (V_eq_dec x x); [reflexivity | contradiction].
        -- split.
           ++ rewrite insert_right_left_child_eq.
              unfold insert_right_left_child_value.
              destruct (V_eq_dec y y) as [_ | Hyy]; [reflexivity | contradiction].
           ++ rewrite insert_right_child_eq.
              unfold insert_right_child_value.
              destruct (V_eq_dec y x) as [Hyx | Hyx]; [subst y; contradiction |].
              destruct (V_eq_dec y y) as [_ | Hyy]; [reflexivity | contradiction].
        -- split.
           ++ intros z Hz.
              rewrite insert_right_left_child_eq.
              unfold insert_right_left_child_value.
              destruct (V_eq_dec z y) as [Hzy | Hzy]; [subst z; contradiction | reflexivity].
           ++ intros z Hz Hzx.
              rewrite insert_right_child_eq.
              unfold insert_right_child_value.
              destruct (V_eq_dec z x) as [Hzx' | Hzx']; [contradiction |].
              destruct (V_eq_dec z y) as [Hzy | Hzy]; [subst z; contradiction | reflexivity].
      * unfold bst_insert_right_op, bst_with_tree_and_key.
        simpl.
        unfold bst_key_set.
        change ((if V_eq_dec y y then key else bst_key g y) = key).
        destruct (V_eq_dec y y); [reflexivity | contradiction].
      * unfold bst_insert_right_op, bst_with_tree_and_key.
        simpl.
        unfold bst_key_set.
        intros z Hzy.
        change ((if V_eq_dec z y then key else bst_key g z) = bst_key g z).
        destruct (V_eq_dec z y); [contradiction | reflexivity].
    + split; assumption.
    + split; [exact Hy | exact Hnode_copy].
    + exact Hgt.
  - intros g x key Hg Hnode Hkey.
    constructor; simpl.
    + split; [exact Hg|].
      exact Hg.
    + exact Hnode.
    + exact Hkey.
    + reflexivity.
Qed.

#[export] Instance BST_delete_operations :
  GraphLib.directed.binarytree.BinarySearchTreeDeleteOperation
    (G := BinarySearchTreeType V) (V := V) (E := V).
Proof.
  refine {|
    GraphLib.directed.binarytree.bst_delete_min := bst_delete_min_op;
    GraphLib.directed.binarytree.bst_delete_transplant := bst_delete_transplant_op;
    GraphLib.directed.binarytree.bst_delete_successor := bst_delete_successor_op;
    GraphLib.directed.binarytree.bst_delete_noop := bst_delete_noop_op
  |}.
  - intros g r m Hg Hr Hm Hmin.
    change ((bst_tree g).(vset) r) in Hr.
    change ((bst_tree g).(vset) m) in Hm.
    exact (bst_delete_min_sound_local g r m Hg Hr Hm Hmin).
  - intros g x child key Hg [Hx Hkey] Hcond.
    change ((bst_tree g).(vset) x) in Hx.
    exact (bst_delete_transplant_sound_local g x child key Hg Hx Hkey Hcond).
  - intros g x r s key Hg [Hx Hkey] Hs Hleft Hright Hmin.
    change ((bst_tree g).(vset) x) in Hx.
    change ((bst_tree g).(vset) s) in Hs.
    change ((bst_tree g).(left_child) x <> None) in Hleft.
    change ((bst_tree g).(right_child) x = Some r) in Hright.
    exact (bst_delete_successor_sound_local g x r s key
      Hg Hx Hkey Hs Hleft Hright Hmin).
  - intros g key Hg Habsent.
    constructor; simpl.
    + split; exact Hg.
    + exact Habsent.
    + reflexivity.
Qed.


End BST_OPERATIONS.
