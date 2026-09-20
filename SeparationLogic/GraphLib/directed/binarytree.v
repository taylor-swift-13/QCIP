Require Import GraphLib.graph_basic.
Require Import GraphLib.reachable.reachable_basic.
Require Import GraphLib.reachable.reachable_restricted.
Require Import GraphLib.directed.rootedtree.
Require Import GraphLib.Syntax.
Require Import SetsClass.
Require Import Coq.ZArith.ZArith.
Require Import Coq.Logic.Classical.
Require Import Coq.Lists.List.
Require Import Coq.Sorting.Permutation.
Require Import Lia.

Class BinaryTree (G V E: Type) {pg: Graph G V E} {gv: GValid G} `{Forest G V E} := {
    bt_root : G -> option V;
    bt_root_is_valid: forall g, gvalid g -> match bt_root g with
                                        | Some r => vvalid g r
                                        | None => True
                                        end;
    bt_root_reaches_all: forall g x, gvalid g -> vvalid g x -> exists r, bt_root g = Some r /\ reachable g r x;

    left_child  : G -> V -> option V;
    right_child : G -> V -> option V;
    left_child_step_exists: forall g x y, gvalid g -> vvalid g x -> left_child g x = Some y -> step g x y;
    right_child_step_exists: forall g x y, gvalid g -> vvalid g x -> right_child g x = Some y -> step g x y;
    child_complete: forall g x y, gvalid g -> step g x y -> left_child g x = Some y \/ right_child g x = Some y;
    invalid_no_child: forall g x, gvalid g -> ~ vvalid g x -> left_child g x = None /\ right_child g x = None;
    left_right_children_distinct: forall g x y1 y2, gvalid g -> vvalid g x -> left_child g x = Some y1 -> right_child g x = Some y2 -> y1 <> y2;
}.

Section BINARYTREE.
Context {G V E: Type} 
        {pg: Graph G V E} 
        {gv: GValid G}
        {stepvalid: StepValid G V E}
        {step_aux_unique : StepUniqueDirected G V E}
        {forest: Forest G V E}
        {binarytree: BinaryTree G V E}
        {g: G}.

Section SINGLE_GRAPH.
Context {gvalid: gvalid g}.

Definition is_left_child (x y: V) : Prop :=
  left_child g x = Some y.

Definition is_right_child (x y: V) : Prop :=
  right_child g x = Some y.

Definition has_no_left_child (x: V) : Prop :=
  left_child g x = None.

Definition has_no_right_child (x: V) : Prop :=
  right_child g x = None.

Lemma left_child_vunique: forall x y1 y2,
  left_child g x = Some y1 ->
  left_child g x = Some y2 ->
  y1 = y2.
Proof.
    intros x y1 y2 H1 H2.
    rewrite H1 in H2.
    inversion H2.
    reflexivity.
Qed.

Lemma right_child_vunique: forall x y1 y2,
  right_child g x = Some y1 ->
  right_child g x = Some y2 ->
  y1 = y2.
Proof.
    intros x y1 y2 H1 H2.
    rewrite H1 in H2.
    inversion H2.
    reflexivity.
Qed.

Lemma at_most_two_children : forall x y1 y2 y3,
  step g x y1 ->
  step g x y2 ->
  step g x y3 ->
  y1 = y2 \/ y1 = y3 \/ y2 = y3.
Proof.
    intros x y1 y2 y3 H1 H2 H3.
    apply child_complete in H1; auto.
    apply child_complete in H2; auto.
    apply child_complete in H3; auto.
    destruct H1 as [H1 | H1]; destruct H2 as [H2 | H2]; destruct H3 as [H3 | H3].
    - left. eapply left_child_vunique; eauto.
    - left. eapply left_child_vunique; eauto.
    - right. left. eapply left_child_vunique; eauto.
    - right. right. eapply right_child_vunique; eauto.
    - right. right. eapply left_child_vunique; eauto.
    - right. left. eapply right_child_vunique; eauto.
    - left. eapply right_child_vunique; eauto.
    - left. eapply right_child_vunique; eauto.
Qed.

Lemma left_right_subtree_disjoint :forall x l r y,
    vvalid g x -> left_child g x = Some l -> right_child g x = Some r -> offspring g l y -> offspring g r y -> False.
Proof.
    intros.
    assert (Hlr : l <> r). { eapply left_right_children_distinct; eauto. }
    eapply left_child_step_exists in H0; eauto.
    eapply right_child_step_exists in H1; eauto.
    assert (Hb: brothers (g:=g) x l r).
    {
        unfold brothers.
        auto.
    }
    destruct (offspring_one_reachable (gvalid:=gvalid) l r y H2 H3) as [H4|H5].
    - assert (brothers (g:=g) x r l). { eapply brothers_sym; eauto. }
      assert (~ offspring g r l). { eapply brothers_not_offspring; eauto. Unshelve. auto. }
      contradiction.
    - assert (~ offspring g l r). { eapply brothers_not_offspring; eauto. Unshelve. auto. }
      contradiction.
Qed.

Lemma descendant_direction_unique: forall x y l r, vvalid g x -> left_child g x = Some l -> right_child g x = Some r -> offspring g x y -> x <> y -> (offspring g l y /\ ~ offspring g r y) \/ (offspring g r y /\ ~ offspring g l y).
Proof.
  intros x y l r Hx Hl Hr Hxy Hneq.
  destruct (real_offspring (g:=g) (gvalid:=gvalid) x y Hxy Hneq) as [z [Hxz Hzy]].
  apply child_complete in Hxz; auto.
  destruct Hxz as [Hzl | Hzr].
  - left.
    assert (l = z) by (eapply left_child_vunique; eauto).
    subst z.
    split; auto.
    intro Hry.
    eapply left_right_subtree_disjoint; eauto.
  - right.
    assert (r = z) by (eapply right_child_vunique; eauto).
    subst z.
    split; auto.
    intro Hly.
    eapply left_right_subtree_disjoint; eauto.
Qed.

End SINGLE_GRAPH.

Section SUBTREE.

Definition in_left_subtree (x y: V) : Prop :=
  exists l, left_child g x = Some l /\ offspring g l y.

Definition in_right_subtree (x y: V) : Prop :=
  exists r, right_child g x = Some r /\ offspring g r y.

Definition subtree (x : option V) (y : V) : Prop :=
  match x with
  | Some r => in_left_subtree r y \/ in_right_subtree r y
  | None => False
  end.

Lemma in_left_subtree_parent_or_lift :
  forall a p child,
    gvalid g -> vvalid g a -> vvalid g p ->
    (left_child g p = Some child \/ right_child g p = Some child) ->
    in_left_subtree a child ->
    a = p \/ in_left_subtree a p.
Proof.
  intros a p child Hg Ha Hp Hpchild [branch [Hbranch Hreach]].
  destruct (classic (a = p)) as [-> | Hneq]; [left; reflexivity | right].
  exists branch; split; [exact Hbranch |].
  eapply one_reachable_down_up.
  - exact Hreach.
  - destruct Hpchild as [Hleft | Hright].
    + eapply left_child_step_exists; eauto.
    + eapply right_child_step_exists; eauto.
  - intro Heq; subst branch.
    apply Hneq.
    eapply father_vunique.
    + eapply left_child_step_exists; eauto.
    + destruct Hpchild as [Hleft | Hright].
      * eapply left_child_step_exists; eauto.
      * eapply right_child_step_exists; eauto.
Unshelve.
  all: exact Hg.
Qed.

Lemma in_right_subtree_parent_or_lift :
  forall a p child,
    gvalid g -> vvalid g a -> vvalid g p ->
    (left_child g p = Some child \/ right_child g p = Some child) ->
    in_right_subtree a child ->
    a = p \/ in_right_subtree a p.
Proof.
  intros a p child Hg Ha Hp Hpchild [branch [Hbranch Hreach]].
  destruct (classic (a = p)) as [-> | Hneq]; [left; reflexivity | right].
  exists branch; split; [exact Hbranch |].
  eapply one_reachable_down_up.
  - exact Hreach.
  - destruct Hpchild as [Hleft | Hright].
    + eapply left_child_step_exists; eauto.
    + eapply right_child_step_exists; eauto.
  - intro Heq; subst branch.
    apply Hneq.
    eapply father_vunique.
    + eapply right_child_step_exists; eauto.
    + destruct Hpchild as [Hleft | Hright].
      * eapply left_child_step_exists; eauto.
      * eapply right_child_step_exists; eauto.
Unshelve.
  all: exact Hg.
Qed.

Record is_subtree (g g' : G) (x : option V): Prop := {
  subtree_root : bt_root g' = x;
  subtree_gvalid : gvalid g /\ gvalid g';
  subtree_vvalid :
    forall y, vvalid g' y <->
    match x with
      | Some r => vvalid g y /\ offspring g r y
      | None => False
    end;
  subtree_left_child :
    forall y z, vvalid g' y -> left_child g' y = z <-> left_child g y = z;
  subtree_right_child :
    forall y z, vvalid g' y -> right_child g' y = z <-> right_child g y = z
}.

Class BinaryTreeSubtree := {
  subtree_at_child: forall x y, vvalid g x -> left_child g x = y \/ right_child g x = y -> exists g', is_subtree g g' y;
  subtree_at_root: exists g', is_subtree g g' (bt_root g)
}.

End SUBTREE.

Section TREE_PROPS.
Context {finitegraph : FiniteGraph G V E}.
Record bst_node_domain_valid (g: G) (l: list V): Prop:= {
  bst_node_domain_permutation : Permutation l (graph_basic.listV g);
  bst_node_domain_membership : forall v, In v l <-> vvalid g v;
  bst_node_domain_child_closed : forall parent child,
      vvalid g parent -> (left_child g parent = Some child \/right_child g parent = Some child) -> vvalid g child;
  bst_node_domain_invalid_children_none : forall v,
      ~ vvalid g v -> left_child g v = None /\ right_child g v = None;
  bst_node_domain_nodup : NoDup l
}.

Definition binary_tree_child (g : G) (x y : V) : Prop :=
  left_child g x = Some y \/ right_child g x = Some y.

Definition binary_tree_reachable (g : G) (x y : V) : Prop :=
  clos_refl_trans (binary_tree_child g) x y.

Record binary_tree_shape_valid (g : G) (l : list V) : Prop := {
  bt_shape_domain : bst_node_domain_valid g l;
  bt_shape_root_valid : match bt_root g with Some r => vvalid g r | None => True end;
  bt_shape_root_no_incoming : forall parent root, bt_root g = Some root -> left_child g parent <> Some root /\ right_child g parent <> Some root;
  bt_shape_parent_unique : forall child parent1 parent2, vvalid g parent1 -> vvalid g parent2 -> binary_tree_child g parent1 child -> binary_tree_child g parent2 child -> parent1 = parent2;
  bt_shape_children_distinct : forall parent left right, vvalid g parent -> left_child g parent = Some left -> right_child g parent = Some right -> left <> right;
  bt_shape_root_reachable : forall x, vvalid g x -> exists root, bt_root g = Some root /\ binary_tree_reachable g root x
}.

Lemma node_domain_listV_iff : forall (g0 : G) (l : list V), bst_node_domain_valid g0 l -> forall x, In x (graph_basic.listV g0) <-> vvalid g0 x.
Proof.
  intros g0 l Hdomain x.
  destruct Hdomain as [Hperm Hmembership _ _ _].
  split; intro Hx.
  - apply Hmembership.
    eapply Permutation_in; [apply Permutation_sym; exact Hperm|exact Hx].
  - eapply Permutation_in; [exact Hperm|].
    apply Hmembership; exact Hx.
Qed.

Lemma reachable_binary_tree_reachable : forall (g0 : G) (x y : V), gvalid g0 -> reachable g0 x y -> binary_tree_reachable g0 x y.
Proof.
  intros g0 x y Hg Hreach.
  unfold binary_tree_reachable, reachable in *.
  induction_1n Hreach.
  - reflexivity.
  - etransitivity_1n.
    + unfold binary_tree_child. eapply child_complete; eauto.
    + apply IHrt; exact Hg.
Qed.

Lemma binary_tree_shape_from_gvalid : forall (g0 : G) (l : list V), gvalid g0 -> bst_node_domain_valid g0 l -> binary_tree_shape_valid g0 l.
Proof.
  intros g0 l Hg Hdomain.
  constructor.
  - exact Hdomain.
  - apply bt_root_is_valid; exact Hg.
  - intros parent root Hroot.
    destruct (classic (vvalid g0 parent)) as [Hparent | Hparent].
    + split; intro Hchild.
      * pose proof (left_child_step_exists g0 parent root Hg Hparent Hchild) as Hstep.
        destruct (bt_root_reaches_all g0 parent Hg Hparent) as [root' [Hroot' Hreach]].
        rewrite Hroot in Hroot'; inversion Hroot'; subst root'.
        eapply (@no_reachable_back_edge G V E pg gv stepvalid step_aux_unique forest g0 root parent Hg Hreach); exact Hstep.
      * pose proof (right_child_step_exists g0 parent root Hg Hparent Hchild) as Hstep.
        destruct (bt_root_reaches_all g0 parent Hg Hparent) as [root' [Hroot' Hreach]].
        rewrite Hroot in Hroot'; inversion Hroot'; subst root'.
        eapply (@no_reachable_back_edge G V E pg gv stepvalid step_aux_unique forest g0 root parent Hg Hreach); exact Hstep.
    + destruct (bst_node_domain_invalid_children_none _ _ Hdomain parent Hparent) as [Hleft Hright].
      rewrite Hleft, Hright; split; discriminate.
  - intros child parent1 parent2 Hparent1 Hparent2 Hchild1 Hchild2.
    apply (father_vunique (g := g0) (gvalid := Hg) parent1 parent2 child).
    + destruct Hchild1 as [Hleft | Hright].
      * eapply left_child_step_exists; eauto.
      * eapply right_child_step_exists; eauto.
    + destruct Hchild2 as [Hleft | Hright].
      * eapply left_child_step_exists; eauto.
      * eapply right_child_step_exists; eauto.
  - intros parent left right Hparent Hleft Hright.
    eapply left_right_children_distinct; eauto.
  - intros x Hx.
    destruct (bt_root_reaches_all g0 x Hg Hx) as [root [Hroot Hreach]].
    exists root; split; [exact Hroot |].
    eapply reachable_binary_tree_reachable; eauto.
Qed.

End TREE_PROPS.

Section OPERATION_INTERFACE.

Context {finitegraph : FiniteGraph G V E}.

Record left_rotation_core_valid (g g' : G) (x y : V) : Prop := {
  lrc_vertex : vvalid g x;
  lrc_right_child : right_child g x = Some y;
  lrc_pivots_distinct : x <> y;
  lrc_vvalid : forall z, vvalid g' z <-> vvalid g z;
  lrc_root : (bt_root g = Some x -> bt_root g' = Some y) /\ (forall r, bt_root g = Some r -> r <> x -> bt_root g' = Some r) /\ (bt_root g = None -> bt_root g' = None);
  lrc_pivot_children : left_child g' y = Some x /\ right_child g' y = right_child g y /\ left_child g' x = left_child g x /\ right_child g' x = left_child g y;
  lrc_parent_redirect :
    (forall z, vvalid g z -> z <> x -> z <> y -> left_child g z = Some x -> left_child g' z = Some y) /\
    (forall z, vvalid g z -> z <> x -> z <> y -> right_child g z = Some x -> right_child g' z = Some y);
  lrc_children_frame :
    (forall z, vvalid g z -> z <> x -> z <> y -> left_child g z <> Some x -> left_child g' z = left_child g z) /\
    (forall z, vvalid g z -> z <> x -> z <> y -> right_child g z <> Some x -> right_child g' z = right_child g z)
}.

Record right_rotation_core_valid (g g' : G) (x y : V) : Prop := {
  rrc_vertex : vvalid g x;
  rrc_left_child : left_child g x = Some y;
  rrc_pivots_distinct : x <> y;
  rrc_vvalid : forall z, vvalid g' z <-> vvalid g z;
  rrc_root : (bt_root g = Some x -> bt_root g' = Some y) /\ (forall r, bt_root g = Some r -> r <> x -> bt_root g' = Some r) /\ (bt_root g = None -> bt_root g' = None);
  rrc_pivot_children : right_child g' y = Some x /\ left_child g' y = left_child g y /\ right_child g' x = right_child g x /\ left_child g' x = right_child g y;
  rrc_parent_redirect :
    (forall z, vvalid g z -> z <> x -> z <> y -> left_child g z = Some x -> left_child g' z = Some y) /\
    (forall z, vvalid g z -> z <> x -> z <> y -> right_child g z = Some x -> right_child g' z = Some y);
  rrc_children_frame :
    (forall z, vvalid g z -> z <> x -> z <> y -> left_child g z <> Some x -> left_child g' z = left_child g z) /\
    (forall z, vvalid g z -> z <> x -> z <> y -> right_child g z <> Some x -> right_child g' z = right_child g z)
}.

Record left_rotation_valid (g g' : G) (x y : V) : Prop := {
  lr_gvalid : gvalid g /\ gvalid g';
  lr_core_valid : left_rotation_core_valid g g' x y
}.

Record right_rotation_valid (g g' : G) (x y : V) : Prop := {
  rr_gvalid : gvalid g /\ gvalid g';
  rr_core_valid : right_rotation_core_valid g g' x y
}.

Record left_rotation_node_domain_valid (g g' : G) (l : list V) (x y : V) : Prop := {
  lrnd_domain : bst_node_domain_valid g l /\ bst_node_domain_valid g' l;
  lrnd_core_valid : left_rotation_core_valid g g' x y
}.

Record right_rotation_node_domain_valid (g g' : G) (l : list V) (x y : V) : Prop := {
  rrnd_domain : bst_node_domain_valid g l /\ bst_node_domain_valid g' l;
  rrnd_core_valid : right_rotation_core_valid g g' x y
}.

Record insert_root_valid (g g' : G) (y : V) : Prop := {
  ir_domain : exists l, bst_node_domain_valid g l /\ bst_node_domain_valid g' (y :: l);
  ir_root_before : bt_root g = None;
  ir_fresh : ~ vvalid g y;
  ir_vvalid : forall z, vvalid g' z <-> vvalid g z \/ z = y;
  ir_root : bt_root g' = Some y;
  ir_new_children : left_child g' y = None /\ right_child g' y = None;
  ir_old_children_frame :(forall z, vvalid g z -> left_child g' z = left_child g z) /\(forall z, vvalid g z -> right_child g' z = right_child g z)
}.

Record insert_left_valid (g g' : G) (x y : V) : Prop := {
  il_domain : exists l, bst_node_domain_valid g l /\ bst_node_domain_valid g' (y :: l);
  il_parent_valid : vvalid g x;
  il_fresh : ~ vvalid g y;
  il_empty : left_child g x = None;
  il_vvalid : forall z, vvalid g' z <-> vvalid g z \/ z = y;
  il_root : bt_root g' = bt_root g;
  il_new_parent_child : left_child g' x = Some y;
  il_new_vertex_children : left_child g' y = None /\ right_child g' y = None;
  il_children_frame : (forall z, vvalid g z -> z <> x -> left_child g' z = left_child g z) /\ (forall z, vvalid g z -> right_child g' z = right_child g z)
}.

Record insert_right_valid (g g' : G) (x y : V) : Prop := {
  irt_domain : exists l, bst_node_domain_valid g l /\ bst_node_domain_valid g' (y :: l);
  irt_parent_valid : vvalid g x;
  irt_fresh : ~ vvalid g y;
  irt_empty : right_child g x = None;
  irt_vvalid : forall z, vvalid g' z <-> vvalid g z \/ z = y;
  irt_root : bt_root g' = bt_root g;
  irt_new_parent_child : right_child g' x = Some y;
  irt_new_vertex_children : left_child g' y = None /\ right_child g' y = None;
  irt_children_frame : (forall z, vvalid g z -> left_child g' z = left_child g z) /\ (forall z, vvalid g z -> z <> x -> right_child g' z = right_child g z)
}.

Record remove_root_valid (g g' : G) (x : V) : Prop := {
  rroot_gvalid : gvalid g /\ gvalid g' /\ vvalid g x /\ ~ vvalid g' x;
  rroot_root : bt_root g = Some x /\ bt_root g' = None;
  rroot_leaf : left_child g x = None /\ right_child g x = None;
  rroot_vvalid : forall z, vvalid g' z <-> vvalid g z /\ z <> x;
  rroot_children_empty : forall z, left_child g' z = None /\ right_child g' z = None
}. 

Record remove_left_leaf_valid (g g' : G) (x y : V) : Prop := {
  rml_gvalid : gvalid g /\ gvalid g' /\ vvalid g x /\ vvalid g y /\ ~ vvalid g' y;
  rml_deleted_child : left_child g x = Some y;
  rml_deleted_is_leaf : left_child g y = None /\ right_child g y = None;
  rml_vvalid : forall z, vvalid g' z <-> vvalid g z /\ z <> y;
  rml_root : bt_root g' = bt_root g;
  rml_parent_child : left_child g' x = None;
  rml_children_frame : (forall z, vvalid g z -> z <> x -> left_child g' z = left_child g z) /\ (forall z, vvalid g z -> right_child g' z = right_child g z)
}.

Record remove_right_leaf_valid (g g' : G) (x y : V) : Prop := {
  rmr_gvalid : gvalid g /\ gvalid g' /\ vvalid g x /\ vvalid g y /\ ~ vvalid g' y;
  rmr_deleted_child : right_child g x = Some y;
  rmr_deleted_is_leaf : left_child g y = None /\ right_child g y = None;
  rmr_vvalid : forall z, vvalid g' z <-> vvalid g z /\ z <> y;
  rmr_root : bt_root g' = bt_root g;
  rmr_parent_child : right_child g' x = None;
  rmr_children_frame : (forall z, vvalid g z -> left_child g' z = left_child g z) /\ (forall z, vvalid g z -> z <> x -> right_child g' z = right_child g z)
}.

Class BinaryTreeRotateOperation := {
  left_rotate : G -> V -> V -> G;
  right_rotate : G -> V -> V -> G;
  left_rotate_sound : forall (g : G) (x y : V), gvalid g -> vvalid g x ->  right_child g x = Some y -> left_rotation_valid g (left_rotate g x y) x y;
  right_rotate_sound : forall (g : G) (x y : V), gvalid g -> vvalid g x -> left_child g x = Some y -> right_rotation_valid g (right_rotate g x y) x y
}.

Class BinaryTreeInsertOperation := {
  insert_root : G -> V -> G;
  insert_left : G -> V -> V -> G;
  insert_right : G -> V -> V -> G;
  insert_root_sound : forall (g : G) (y : V), gvalid g -> bt_root g = None -> ~ vvalid g y -> insert_root_valid g (insert_root g y) y;
  insert_left_sound : forall (g : G) (x y : V), gvalid g -> vvalid g x -> ~ vvalid g y -> left_child g x = None -> insert_left_valid g (insert_left g x y) x y;
  insert_right_sound : forall (g : G) (x y : V), gvalid g -> vvalid g x -> ~ vvalid g y -> right_child g x = None -> insert_right_valid g (insert_right g x y) x y
}.

Class BinaryTreeRemoveOperation := {
  remove_root : G -> G;
  remove_left : G -> V -> G;
  remove_right : G -> V -> G;
  remove_root_sound : forall (g : G) (x : V), gvalid g -> vvalid g x -> bt_root g = Some x -> left_child g x = None -> right_child g x = None -> remove_root_valid g (remove_root g) x;
  remove_left_leaf_sound : forall (g : G) (x y : V), gvalid g -> vvalid g x -> left_child g x = Some y -> left_child g y = None -> right_child g y = None -> remove_left_leaf_valid g (remove_left g x) x y;
  remove_right_leaf_sound : forall (g : G) (x y : V), gvalid g -> vvalid g x -> right_child g x = Some y -> left_child g y = None -> right_child g y = None -> remove_right_leaf_valid g (remove_right g x) x y
}.

End OPERATION_INTERFACE.

End BINARYTREE.

Class BinaryTreeWithParent (G V E: Type) {pg: Graph G V E} {gv: GValid G} {stepvalid: StepValid G V E} {step_aux_unique: StepUniqueDirected G V E} {forest: Forest G V E} {binarytree: BinaryTree G V E} := {
  bt_parent : G -> V -> option V;
  bt_parent_spec : forall g x p, gvalid g -> bt_parent g x = Some p <-> step g p x
}.

Section BINARY_TREE_WITH_PARENT.

Context {G V E: Type}
        {pg: Graph G V E}
        {gv: GValid G}
        {stepvalid: StepValid G V E}
        {step_aux_unique: StepUniqueDirected G V E}
        {forest: Forest G V E}
        {binarytree: BinaryTree G V E}
        {binarytree_with_parent: BinaryTreeWithParent G V E}
        {finitegraph: FiniteGraph G V E}.

Record binary_tree_with_parent_shape_valid (g : G) (l : list V) : Prop := {
  btwp_shape : binary_tree_shape_valid g l;
  btwp_parent_child : forall child parent, bt_parent g child = Some parent <-> vvalid g child /\ vvalid g parent /\ binary_tree_child g parent child
}.

Lemma binary_tree_with_parent_shape_from_gvalid : forall (g : G) (l : list V), gvalid g -> bst_node_domain_valid g l -> binary_tree_with_parent_shape_valid g l.
Proof.
  intros g l Hg Hdomain.
  constructor.
  - eapply binary_tree_shape_from_gvalid; eauto.
  - intros child parent; split.
    + intro Hparent.
      apply bt_parent_spec in Hparent as Hstep; auto.
      pose proof (step_vvalid parent child Hstep) as [Hparent_valid Hchild_valid].
      split; [exact Hchild_valid |].
      split; [exact Hparent_valid |].
      eapply child_complete; eauto.
    + intros [Hchild [Hparent Hrelation]].
      apply bt_parent_spec; auto.
      destruct Hrelation as [Hleft | Hright].
      * eapply left_child_step_exists; eauto.
      * eapply right_child_step_exists; eauto.
Qed.

Lemma bt_parent_sound : forall g x p, gvalid g -> bt_parent g x = Some p ->
  vvalid g x /\ vvalid g p /\ (left_child g p = Some x \/ right_child g p = Some x).
Proof.
  intros g x p Hg Hparent.
  apply bt_parent_spec in Hparent as Hstep; auto.
  pose proof (step_vvalid p x Hstep) as [Hp Hx].
  pose proof (child_complete g p x Hg Hstep) as Hchild.
  auto.
Qed.

Lemma bt_left_child_parent : forall g p x, gvalid g -> vvalid g p ->
  left_child g p = Some x -> bt_parent g x = Some p.
Proof.
  intros g p x Hg Hp Hleft.
  apply bt_parent_spec; auto.
  eapply left_child_step_exists; eauto.
Qed.

Lemma bt_right_child_parent : forall g p x, gvalid g -> vvalid g p ->
  right_child g p = Some x -> bt_parent g x = Some p.
Proof.
  intros g p x Hg Hp Hright.
  apply bt_parent_spec; auto.
  eapply right_child_step_exists; eauto.
Qed.

Lemma bt_invalid_parent_none : forall g x, gvalid g -> ~ vvalid g x ->
  bt_parent g x = None.
Proof.
  intros g x Hg Hx.
  destruct (bt_parent g x) as [p |] eqn:Hparent; auto.
  exfalso.
  pose proof (bt_parent_sound g x p Hg Hparent) as [Hxvalid _].
  contradiction.
Qed.

Lemma bt_root_parent_none : forall g r, gvalid g -> bt_root g = Some r ->
  bt_parent g r = None.
Proof.
  intros g r Hg Hroot.
  destruct (bt_parent g r) as [p |] eqn:Hparent; auto.
  exfalso.
  apply bt_parent_spec in Hparent as Hstep; auto.
  pose proof (step_vvalid p r Hstep) as [Hp _].
  destruct (bt_root_reaches_all g p Hg Hp) as [r' [Hroot' Hreach]].
  rewrite Hroot in Hroot'.
  inversion Hroot'; subst r'.
  eapply no_reachable_back_edge; eauto.
Qed.

Lemma bt_parent_exists : forall g x, gvalid g -> vvalid g x ->
  bt_root g <> Some x ->
  exists p, vvalid g p /\ bt_parent g x = Some p /\
    (left_child g p = Some x \/ right_child g p = Some x).
Proof.
  intros g x Hg Hx Hnotroot.
  destruct (bt_root_reaches_all g x Hg Hx) as [r [Hroot Hreach]].
  assert (Hrx : r <> x).
  {
    intro Heq.
    subst r.
    contradiction.
  }
  unfold reachable in Hreach.
  induction_n1 Hreach.
  - contradiction.
  - match goal with
    | Hlast : step g ?p x |- _ =>
        pose proof (step_vvalid p x Hlast) as [Hp _];
        pose proof (child_complete g p x Hg Hlast) as Hchild;
        exists p;
        split; [exact Hp |];
        split; [apply bt_parent_spec; auto | exact Hchild]
    end.
Qed.

End BINARY_TREE_WITH_PARENT.

Class BinaryTreeWithKey
      (G V E: Type)
      {pg: Graph G V E}
      {gv: GValid G}
      {stepvalid: StepValid G V E}
      {step_aux_unique: StepUniqueDirected G V E}
      {forest: Forest G V E}
      {binarytree: BinaryTree G V E} := {
  bt_key : G -> V -> Z
}.

Class BinaryTreeWithValue (G V A : Type) := {
  node_value : G -> V -> A
}.

Class KeyedBinaryTreeWithValue (G V E A : Type) {pg: Graph G V E} {gv: GValid G} {stepvalid: StepValid G V E} {step_aux_unique: StepUniqueDirected G V E} {forest: Forest G V E} {binarytree: BinaryTree G V E} := {
  #[export] kbtv_binarytree_with_key :: BinaryTreeWithKey G V E;
  #[export] kbtv_binarytree_with_value :: BinaryTreeWithValue G V A
}.

Class KeyedBinaryTreeWithParent (G V E: Type) {pg: Graph G V E} {gv: GValid G} {stepvalid: StepValid G V E} {step_aux_unique: StepUniqueDirected G V E} {forest: Forest G V E} {binarytree: BinaryTree G V E} := {
  #[export] kbtp_binarytree_with_key :: BinaryTreeWithKey G V E;
  #[export] kbtp_binarytree_with_parent :: BinaryTreeWithParent G V E
}.

Section BINARY_TREE_WITH_KEY_OPERATION_INTERFACE.

Context {G V E: Type}
        {pg: Graph G V E}
        {gv: GValid G}
        {stepvalid: StepValid G V E}
        {step_aux_unique: StepUniqueDirected G V E}
        {forest: Forest G V E}
        {binarytree: BinaryTree G V E}
        {finitegraph: FiniteGraph G V E}
        {binarytree_with_key: BinaryTreeWithKey G V E}.

Record keyed_key_update_valid (g g' : G) (p : V) (k : Z) : Prop := {
  kuk_domain : exists l, bst_node_domain_valid g l /\ bst_node_domain_valid g' l;
  kuk_vertex_valid : vvalid g p;
  kuk_left_child_frame : forall x, left_child g' x = left_child g x;
  kuk_right_child_frame : forall x, right_child g' x = right_child g x;
  kuk_key_updated : bt_key g' p = k;
  kuk_key_frame : forall x, x <> p -> bt_key g' x = bt_key g x
}.

Class BinaryTreeWithKeyUpdateOperation := {
  keyed_update_key : G -> V -> Z -> G;
  keyed_update_key_sound : forall (g : G) (p : V) (k : Z) (l : list V),
    bst_node_domain_valid g l -> vvalid g p ->
    keyed_key_update_valid g (keyed_update_key g p k) p k
}.

Section KEYED_KEY_UPDATE_RELATION.
Context {keyed_update_operation : BinaryTreeWithKeyUpdateOperation}.

Definition keyed_key_update (g g' : G) (p : V) (k : Z) : Prop :=
  g' = keyed_update_key g p k.

End KEYED_KEY_UPDATE_RELATION.

Record keyed_redirect_root_valid (g g' : G) (target : option V) : Prop := {
  krr_domain : exists l, bst_node_domain_valid g l /\ bst_node_domain_valid g' l;
  krr_target_valid : target = None \/ exists x, target = Some x /\ vvalid g x;
  krr_redirect : bt_root g' = target;
  krr_left_child_frame : forall x, left_child g' x = left_child g x;
  krr_right_child_frame : forall x, right_child g' x = right_child g x;
  krr_key_frame : forall x, bt_key g' x = bt_key g x
}.

Record keyed_redirect_left_valid (g g' : G) (parent : V) (target : option V) : Prop := {
  krl_domain : exists l, bst_node_domain_valid g l /\ bst_node_domain_valid g' l;
  krl_parent_valid : vvalid g parent;
  krl_target_valid : target = None \/ exists x, target = Some x /\ vvalid g x;
  krl_root_frame : bt_root g' = bt_root g;
  krl_redirect : left_child g' parent = target;
  krl_left_child_frame : forall x, x <> parent -> left_child g' x = left_child g x;
  krl_right_child_frame : forall x, right_child g' x = right_child g x;
  krl_key_frame : forall x, bt_key g' x = bt_key g x
}.

Record keyed_redirect_right_valid (g g' : G) (parent : V) (target : option V) : Prop := {
  krrt_domain : exists l, bst_node_domain_valid g l /\ bst_node_domain_valid g' l;
  krrt_parent_valid : vvalid g parent;
  krrt_target_valid : target = None \/ exists x, target = Some x /\ vvalid g x;
  krrt_root_frame : bt_root g' = bt_root g;
  krrt_redirect : right_child g' parent = target;
  krrt_left_child_frame : forall x, left_child g' x = left_child g x;
  krrt_right_child_frame : forall x, x <> parent -> right_child g' x = right_child g x;
  krrt_key_frame : forall x, bt_key g' x = bt_key g x
}.

Class BinaryTreeWithKeyRedirectOperation := {
  keyed_redirect_root : G -> option V -> G;
  keyed_redirect_left : G -> V -> option V -> G;
  keyed_redirect_right : G -> V -> option V -> G;
  keyed_redirect_root_sound : forall (g : G) (target : option V) (l : list V),
    bst_node_domain_valid g l -> (target = None \/ exists x, target = Some x /\ vvalid g x) ->
    keyed_redirect_root_valid g (keyed_redirect_root g target) target;
  keyed_redirect_left_sound : forall (g : G) (parent : V) (target : option V) (l : list V),
    bst_node_domain_valid g l -> vvalid g parent ->
    (target = None \/ exists x, target = Some x /\ vvalid g x) ->
    keyed_redirect_left_valid g (keyed_redirect_left g parent target) parent target;
  keyed_redirect_right_sound : forall (g : G) (parent : V) (target : option V) (l : list V),
    bst_node_domain_valid g l -> vvalid g parent ->
    (target = None \/ exists x, target = Some x /\ vvalid g x) ->
    keyed_redirect_right_valid g (keyed_redirect_right g parent target) parent target
}.

Section KEYED_REDIRECT_RELATION.
Context {keyed_redirect_operation : BinaryTreeWithKeyRedirectOperation}.

Definition keyed_redirect_root_relation (g g' : G) (target : option V) : Prop :=
  g' = keyed_redirect_root g target.

Definition keyed_redirect_left_relation (g g' : G) (parent : V) (target : option V) : Prop :=
  g' = keyed_redirect_left g parent target.

Definition keyed_redirect_right_relation (g g' : G) (parent : V) (target : option V) : Prop :=
  g' = keyed_redirect_right g parent target.

End KEYED_REDIRECT_RELATION.

Record keyed_insert_root_valid (g g' : G) (target : V) (key : Z) : Prop := {
  kir_tree_valid : insert_root_valid g g' target;
  kir_key_new : bt_key g' target = key;
  kir_key_frame : forall x, x <> target -> bt_key g' x = bt_key g x
}.

Record keyed_insert_left_valid (g g' : G) (parent target : V) (key : Z) : Prop := {
  kil_tree_valid : insert_left_valid g g' parent target;
  kil_key_new : bt_key g' target = key;
  kil_key_frame : forall x, x <> target -> bt_key g' x = bt_key g x
}.

Record keyed_insert_right_valid (g g' : G) (parent target : V) (key : Z) : Prop := {
  kirt_tree_valid : insert_right_valid g g' parent target;
  kirt_key_new : bt_key g' target = key;
  kirt_key_frame : forall x, x <> target -> bt_key g' x = bt_key g x
}.

Class BinaryTreeWithKeyInsertOperation := {
  keyed_insert_root : G -> V -> Z -> G;
  keyed_insert_left : G -> V -> V -> Z -> G;
  keyed_insert_right : G -> V -> V -> Z -> G;
  keyed_insert_root_sound : forall (g : G) (target : V) (key : Z) (l : list V), bst_node_domain_valid g l -> bt_root g = None -> ~ vvalid g target -> keyed_insert_root_valid g (keyed_insert_root g target key) target key;
  keyed_insert_left_sound : forall (g : G) (parent target : V) (key : Z) (l : list V), bst_node_domain_valid g l -> vvalid g parent -> ~ vvalid g target -> left_child g parent = None -> keyed_insert_left_valid g (keyed_insert_left g parent target key) parent target key;
  keyed_insert_right_sound : forall (g : G) (parent target : V) (key : Z) (l : list V), bst_node_domain_valid g l -> vvalid g parent -> ~ vvalid g target -> right_child g parent = None -> keyed_insert_right_valid g (keyed_insert_right g parent target key) parent target key
}.

Section KEYED_INSERT_RELATION.
Context {keyed_insert_operation : BinaryTreeWithKeyInsertOperation}.

Definition keyed_insert_root_relation (g g' : G) (target : V) (key : Z) : Prop :=
  g' = keyed_insert_root g target key.

Definition keyed_insert_left_relation (g g' : G) (parent target : V) (key : Z) : Prop :=
  g' = keyed_insert_left g parent target key.

Definition keyed_insert_right_relation (g g' : G) (parent target : V) (key : Z) : Prop :=
  g' = keyed_insert_right g parent target key.

End KEYED_INSERT_RELATION.

Record keyed_weak_union_valid (g1 g2 g' : G) : Prop := {
  kwu_domain_union : exists l1 l2 l', bst_node_domain_valid g1 l1 /\ bst_node_domain_valid g2 l2 /\ bst_node_domain_valid g' l' /\ Permutation l' (l1 ++ l2);
  kwu_disjoint : forall x, vvalid g1 x -> ~ vvalid g2 x;
  kwu_root : bt_root g' = bt_root g1;
  kwu_g1_left_child_frame : forall x, vvalid g1 x -> left_child g' x = left_child g1 x;
  kwu_g1_right_child_frame : forall x, vvalid g1 x -> right_child g' x = right_child g1 x;
  kwu_g1_key_frame : forall x, vvalid g1 x -> bt_key g' x = bt_key g1 x;
  kwu_g2_left_child_frame : forall x, vvalid g2 x -> left_child g' x = left_child g2 x;
  kwu_g2_right_child_frame : forall x, vvalid g2 x -> right_child g' x = right_child g2 x;
  kwu_g2_key_frame : forall x, vvalid g2 x -> bt_key g' x = bt_key g2 x
}.

Record keyed_weak_insert_root_valid (g1 g2 g' : G) (target : V) : Prop := {
  kwir_domain_union : exists l1 l2 l', bst_node_domain_valid g1 l1 /\ bst_node_domain_valid g2 l2 /\ bst_node_domain_valid g' l' /\ Permutation l' (l1 ++ l2);
  kwir_disjoint : forall x, vvalid g1 x -> ~ vvalid g2 x;
  kwir_target_valid : vvalid g2 target;
  kwir_insert : bt_root g' = Some target;
  kwir_g1_left_child_frame : forall x, vvalid g1 x -> left_child g' x = left_child g1 x;
  kwir_g1_right_child_frame : forall x, vvalid g1 x -> right_child g' x = right_child g1 x;
  kwir_g1_key_frame : forall x, vvalid g1 x -> bt_key g' x = bt_key g1 x;
  kwir_g2_left_child_frame : forall x, vvalid g2 x -> left_child g' x = left_child g2 x;
  kwir_g2_right_child_frame : forall x, vvalid g2 x -> right_child g' x = right_child g2 x;
  kwir_g2_key_frame : forall x, vvalid g2 x -> bt_key g' x = bt_key g2 x
}.

Record keyed_weak_insert_left_valid (g1 g2 g' : G) (parent target : V) : Prop := {
  kwil_domain_union : exists l1 l2 l', bst_node_domain_valid g1 l1 /\ bst_node_domain_valid g2 l2 /\ bst_node_domain_valid g' l' /\ Permutation l' (l1 ++ l2);
  kwil_disjoint : forall x, vvalid g1 x -> ~ vvalid g2 x;
  kwil_parent_valid : vvalid g1 parent;
  kwil_target_valid : vvalid g2 target;
  kwil_root_frame : bt_root g' = bt_root g1;
  kwil_insert : left_child g' parent = Some target;
  kwil_g1_left_child_frame : forall x, vvalid g1 x -> x <> parent -> left_child g' x = left_child g1 x;
  kwil_g1_right_child_frame : forall x, vvalid g1 x -> right_child g' x = right_child g1 x;
  kwil_g1_key_frame : forall x, vvalid g1 x -> bt_key g' x = bt_key g1 x;
  kwil_g2_left_child_frame : forall x, vvalid g2 x -> left_child g' x = left_child g2 x;
  kwil_g2_right_child_frame : forall x, vvalid g2 x -> right_child g' x = right_child g2 x;
  kwil_g2_key_frame : forall x, vvalid g2 x -> bt_key g' x = bt_key g2 x
}.

Record keyed_weak_insert_right_valid (g1 g2 g' : G) (parent target : V) : Prop := {
  kwirt_domain_union : exists l1 l2 l', bst_node_domain_valid g1 l1 /\ bst_node_domain_valid g2 l2 /\ bst_node_domain_valid g' l' /\ Permutation l' (l1 ++ l2);
  kwirt_disjoint : forall x, vvalid g1 x -> ~ vvalid g2 x;
  kwirt_parent_valid : vvalid g1 parent;
  kwirt_target_valid : vvalid g2 target;
  kwirt_root_frame : bt_root g' = bt_root g1;
  kwirt_insert : right_child g' parent = Some target;
  kwirt_g1_left_child_frame : forall x, vvalid g1 x -> left_child g' x = left_child g1 x;
  kwirt_g1_right_child_frame : forall x, vvalid g1 x -> x <> parent -> right_child g' x = right_child g1 x;
  kwirt_g1_key_frame : forall x, vvalid g1 x -> bt_key g' x = bt_key g1 x;
  kwirt_g2_left_child_frame : forall x, vvalid g2 x -> left_child g' x = left_child g2 x;
  kwirt_g2_right_child_frame : forall x, vvalid g2 x -> right_child g' x = right_child g2 x;
  kwirt_g2_key_frame : forall x, vvalid g2 x -> bt_key g' x = bt_key g2 x
}.

Class BinaryTreeWithKeyWeakInsertOperation := {
  keyed_weak_insert_root : G -> G -> V -> G;
  keyed_weak_insert_left : G -> G -> V -> V -> G;
  keyed_weak_insert_right : G -> G -> V -> V -> G;
  keyed_weak_insert_root_sound : forall (g1 g2 : G) (target : V) (l1 l2 : list V), bst_node_domain_valid g1 l1 -> bst_node_domain_valid g2 l2 -> (forall x, vvalid g1 x -> ~ vvalid g2 x) -> vvalid g2 target -> keyed_weak_insert_root_valid g1 g2 (keyed_weak_insert_root g1 g2 target) target;
  keyed_weak_insert_left_sound : forall (g1 g2 : G) (parent target : V) (l1 l2 : list V), bst_node_domain_valid g1 l1 -> bst_node_domain_valid g2 l2 -> (forall x, vvalid g1 x -> ~ vvalid g2 x) -> vvalid g1 parent -> vvalid g2 target -> keyed_weak_insert_left_valid g1 g2 (keyed_weak_insert_left g1 g2 parent target) parent target;
  keyed_weak_insert_right_sound : forall (g1 g2 : G) (parent target : V) (l1 l2 : list V), bst_node_domain_valid g1 l1 -> bst_node_domain_valid g2 l2 -> (forall x, vvalid g1 x -> ~ vvalid g2 x) -> vvalid g1 parent -> vvalid g2 target -> keyed_weak_insert_right_valid g1 g2 (keyed_weak_insert_right g1 g2 parent target) parent target
}.

Section KEYED_WEAK_INSERT_RELATION.
Context {keyed_weak_insert_operation : BinaryTreeWithKeyWeakInsertOperation}.

Definition keyed_weak_insert_root_relation (g1 g2 g' : G) (target : V) : Prop :=
  g' = keyed_weak_insert_root g1 g2 target.

Definition keyed_weak_insert_left_relation (g1 g2 g' : G) (parent target : V) : Prop :=
  g' = keyed_weak_insert_left g1 g2 parent target.

Definition keyed_weak_insert_right_relation (g1 g2 g' : G) (parent target : V) : Prop :=
  g' = keyed_weak_insert_right g1 g2 parent target.

End KEYED_WEAK_INSERT_RELATION.

End BINARY_TREE_WITH_KEY_OPERATION_INTERFACE.

Class BinarySearchTree
      (G V E: Type)
      {pg: Graph G V E}
      {gv: GValid G}
      {stepvalid: StepValid G V E}
      {step_aux_unique : StepUniqueDirected G V E}
      {forest: Forest G V E}
      {binarytree: BinaryTree G V E}
      {binarytree_with_key: BinaryTreeWithKey G V E} := {
  bst_left_subtree_key_lt : forall g x l y, gvalid g -> vvalid g x ->
      left_child g x = Some l -> offspring g l y ->
      Z.lt (bt_key g y) (bt_key g x);
  bst_right_subtree_key_gt : forall g x r y, gvalid g -> vvalid g x ->
      right_child g x = Some r -> offspring g r y ->
      Z.gt (bt_key g y) (bt_key g x)
}.

Section BINARY_SEARCH_TREE.

Context {G V E: Type}
        {pg: Graph G V E}
        {gv: GValid G}
        {stepvalid: StepValid G V E}
        {step_aux_unique : StepUniqueDirected G V E}
        {forest: Forest G V E}
        {binarytree: BinaryTree G V E}
        {binarytree_with_key: BinaryTreeWithKey G V E}
        {bst: BinarySearchTree G V E}.

Lemma bst_left_child_key_lt :
  forall g x y,
    gvalid g ->
    vvalid g x ->
    left_child g x = Some y ->
    Z.lt (bt_key g y) (bt_key g x).
Proof.
  intros g x y Hg Hx Hleft.
  eapply bst_left_subtree_key_lt; eauto.
  unfold offspring, reachable.
  reflexivity.
Qed.

Lemma bst_right_child_key_gt :
  forall g x y,
    gvalid g ->
    vvalid g x ->
    right_child g x = Some y ->
    Z.gt (bt_key g y) (bt_key g x).
Proof.
  intros g x y Hg Hx Hright.
  eapply bst_right_subtree_key_gt; eauto.
  unfold offspring, reachable.
  reflexivity.
Qed.

End BINARY_SEARCH_TREE.

Section BINARY_SEARCH_TREE_OPERATION_INTERFACE.

Context {G V E: Type}
        {pg: Graph G V E}
        {gv: GValid G}
        {stepvalid: StepValid G V E}
        {step_aux_unique : StepUniqueDirected G V E}
        {forest: Forest G V E}
        {binarytree: BinaryTree G V E}
        {finitegraph: FiniteGraph G V E}
        {binarytree_with_key: BinaryTreeWithKey G V E}
        {bst: BinarySearchTree G V E}.

Definition bst_key_preserved (g g' : G) : Prop :=
  forall x, bt_key g' x = bt_key g x.

Definition bst_key_preserved_except (g g' : G) (x : V) : Prop :=
  forall z, z <> x -> bt_key g' z = bt_key g z.

Definition bst_search_key_constraint (g : G) (parent : V) (key : Z) : Prop :=
  (forall a, vvalid g a -> in_left_subtree (g:=g) a parent -> Z.lt key (bt_key g a)) /\
  (forall a, vvalid g a -> in_right_subtree (g:=g) a parent -> Z.gt key (bt_key g a)).

Definition bst_search_left_key_constraint (g : G) (parent : V) (key : Z) : Prop :=
  Z.lt key (bt_key g parent) /\ bst_search_key_constraint g parent key.

Definition bst_search_right_key_constraint (g : G) (parent : V) (key : Z) : Prop :=
  Z.gt key (bt_key g parent) /\ bst_search_key_constraint g parent key.

Definition bst_search_node_in_subtree (g : G) (node :V) (key : Z) : Prop :=
  match bt_root g with
  | None => True
  | Some root => offspring g root node /\ vvalid g node /\ bst_search_key_constraint g node key
  end. 

Definition bst_insert_node_lr (g : G) (parent : V) (key : Z) : Prop :=
  vvalid g parent /\
  (left_child g parent = None /\ Z.lt key (bt_key g parent) \/
  right_child g parent = None /\ Z.gt key (bt_key g parent)) /\
  bst_search_node_in_subtree g parent key.

Definition bst_insert_duplicate_node (g : G) (key : Z) : Prop :=
  exists root node, bt_root g = Some root /\ offspring g root node /\ bt_key g node = key.

Record bst_insert_root_valid (g g' : G) (x : V) (key : Z) : Prop := {
  bst_ir_keyed_valid : keyed_insert_root_valid g g' x key;
  bst_ir_gvalid : gvalid g /\ gvalid g'
}.

Record bst_insert_left_valid (g g' : G) (parent x : V) (key : Z) : Prop := {
  bst_il_keyed_valid : keyed_insert_left_valid g g' parent x key;
  bst_il_gvalid : gvalid g /\ gvalid g';
  bst_il_insert_node : ~ vvalid g x /\ bst_insert_node_lr g parent key;
  bst_il_direction : Z.lt key (bt_key g parent)
}.

Record bst_insert_right_valid (g g' : G) (parent x : V) (key : Z) : Prop := {
  bst_irt_keyed_valid : keyed_insert_right_valid g g' parent x key;
  bst_irt_gvalid : gvalid g /\ gvalid g';
  bst_irt_insert_node : ~ vvalid g x /\ bst_insert_node_lr g parent key;
  bst_irt_direction : Z.gt key (bt_key g parent)
}.

Definition bst_ir_tree_valid (g g' : G) (x : V) (key : Z) (Hvalid : bst_insert_root_valid g g' x key) : insert_root_valid g g' x :=
  kir_tree_valid _ _ _ _ (bst_ir_keyed_valid _ _ _ _ Hvalid).

Definition bst_ir_key_new (g g' : G) (x : V) (key : Z) (Hvalid : bst_insert_root_valid g g' x key) : bt_key g' x = key :=
  kir_key_new _ _ _ _ (bst_ir_keyed_valid _ _ _ _ Hvalid).

Definition bst_ir_key_frame (g g' : G) (x : V) (key : Z) (Hvalid : bst_insert_root_valid g g' x key) : bst_key_preserved_except g g' x :=
  kir_key_frame _ _ _ _ (bst_ir_keyed_valid _ _ _ _ Hvalid).

Definition bst_il_tree_valid (g g' : G) (parent x : V) (key : Z) (Hvalid : bst_insert_left_valid g g' parent x key) : insert_left_valid g g' parent x :=
  kil_tree_valid _ _ _ _ _ (bst_il_keyed_valid _ _ _ _ _ Hvalid).

Definition bst_il_key_new (g g' : G) (parent x : V) (key : Z) (Hvalid : bst_insert_left_valid g g' parent x key) : bt_key g' x = key :=
  kil_key_new _ _ _ _ _ (bst_il_keyed_valid _ _ _ _ _ Hvalid).

Definition bst_il_key_frame (g g' : G) (parent x : V) (key : Z) (Hvalid : bst_insert_left_valid g g' parent x key) : bst_key_preserved_except g g' x :=
  kil_key_frame _ _ _ _ _ (bst_il_keyed_valid _ _ _ _ _ Hvalid).

Definition bst_irt_tree_valid (g g' : G) (parent x : V) (key : Z) (Hvalid : bst_insert_right_valid g g' parent x key) : insert_right_valid g g' parent x :=
  kirt_tree_valid _ _ _ _ _ (bst_irt_keyed_valid _ _ _ _ _ Hvalid).

Definition bst_irt_key_new (g g' : G) (parent x : V) (key : Z) (Hvalid : bst_insert_right_valid g g' parent x key) : bt_key g' x = key :=
  kirt_key_new _ _ _ _ _ (bst_irt_keyed_valid _ _ _ _ _ Hvalid).

Definition bst_irt_key_frame (g g' : G) (parent x : V) (key : Z) (Hvalid : bst_insert_right_valid g g' parent x key) : bst_key_preserved_except g g' x :=
  kirt_key_frame _ _ _ _ _ (bst_irt_keyed_valid _ _ _ _ _ Hvalid).

Record bst_insert_duplicate_valid (g g' : G) (x : V) (key : Z) : Prop := {
  bst_id_gvalid : gvalid g /\ gvalid g';
  bst_id_duplicate_node : bst_insert_duplicate_node g key;
  bst_id_key : bt_key g x = key;
  bst_id_graph : g' = g
}.

Record bst_left_rotation_valid (g g' : G) (x y : V) : Prop := {
  bst_lr_tree_valid : left_rotation_valid g g' x y;
  bst_lr_key_frame : bst_key_preserved g g'
}.

Record bst_right_rotation_valid (g g' : G) (x y : V) : Prop := {
  bst_rr_tree_valid : right_rotation_valid g g' x y;
  bst_rr_key_frame : bst_key_preserved g g'
}.

Definition bst_min_node (g : G) (r m : V) : Prop :=
  offspring g r m /\ left_child g m = None /\
  forall z, offspring g r z -> z <> m -> Z.lt (bt_key g m) (bt_key g z).

Definition bst_max_node (g : G) (r m : V) : Prop :=
  offspring g r m /\ right_child g m = None /\
  forall z, offspring g r z -> z <> m -> Z.gt (bt_key g m) (bt_key g z).

Definition bst_delete_node (g : G) (x : V) (key : Z) : Prop :=
  vvalid g x /\ bt_key g x = key.

Definition bst_delete_key_absent (g : G) (key : Z) : Prop :=
  forall x, vvalid g x -> bt_key g x <> key.

Record bst_delete_min_valid (g g' : G) (r m : V) : Prop := {
  bst_dm_gvalid : gvalid g /\ gvalid g' /\ vvalid g r /\ vvalid g m /\ bst_min_node g r m;
  bst_dm_vvalid : forall z, vvalid g' z <-> vvalid g z /\ z <> m;
  bst_dm_root :
    (bt_root g = Some m -> bt_root g' = right_child g m) /\
    (forall root, bt_root g = Some root -> root <> m -> bt_root g' = Some root) /\
    (bt_root g = None -> bt_root g' = None);
  bst_dm_parent_redirect :
    (forall z, vvalid g z -> z <> m -> left_child g z = Some m ->
       left_child g' z = right_child g m) /\
    (forall z, vvalid g z -> z <> m -> right_child g z = Some m ->
       right_child g' z = right_child g m);
  bst_dm_children_frame :
    (forall z, vvalid g z -> z <> m -> left_child g z <> Some m ->
       left_child g' z = left_child g z) /\
    (forall z, vvalid g z -> z <> m -> right_child g z <> Some m ->
       right_child g' z = right_child g z);
  bst_dm_key_frame : bst_key_preserved g g'
}.

Record bst_delete_transplant_valid
    (g g' : G) (x : V) (child : option V) (key : Z) : Prop := {
  bst_dt_gvalid : gvalid g /\ gvalid g' /\ vvalid g x /\ ~ vvalid g' x;
  bst_dt_deleted_key : bt_key g x = key;
  bst_dt_child :
    (right_child g x = None /\ child = left_child g x) \/
    (left_child g x = None /\ child = right_child g x);
  bst_dt_vvalid : forall z, vvalid g' z <-> vvalid g z /\ z <> x;
  bst_dt_root :
    (bt_root g = Some x -> bt_root g' = child) /\
    (forall root, bt_root g = Some root -> root <> x -> bt_root g' = Some root) /\
    (bt_root g = None -> bt_root g' = None);
  bst_dt_parent_redirect :
    (forall z, vvalid g z -> z <> x -> left_child g z = Some x -> left_child g' z = child) /\
    (forall z, vvalid g z -> z <> x -> right_child g z = Some x -> right_child g' z = child);
  bst_dt_children_frame :
    (forall z, vvalid g z -> z <> x -> left_child g z <> Some x -> left_child g' z = left_child g z) /\
    (forall z, vvalid g z -> z <> x -> right_child g z <> Some x -> right_child g' z = right_child g z);
  bst_dt_key_frame : bst_key_preserved g g'
}.

Record bst_delete_successor_valid
    (g g1 g2 : G) (x r s : V) (key : Z) : Prop := {
  bst_ds_gvalid : gvalid g /\ gvalid g1 /\ gvalid g2;
  bst_ds_deleted_node : bst_delete_node g x key;
  bst_ds_children :
    left_child g x <> None /\
    right_child g x = Some r /\
    bst_min_node g r s;
  bst_ds_detach : bst_delete_min_valid g g1 r s;
  bst_ds_vertices :
    vvalid g1 x /\ ~ vvalid g1 s /\ ~ vvalid g2 x /\ vvalid g2 s;
  bst_ds_vvalid : forall z,
    vvalid g2 z <-> (vvalid g1 z /\ z <> x) \/ z = s;
  bst_ds_root :
    (bt_root g1 = Some x -> bt_root g2 = Some s) /\
    (forall root, bt_root g1 = Some root -> root <> x ->
       bt_root g2 = Some root) /\
    (bt_root g1 = None -> bt_root g2 = None);
  bst_ds_parent_redirect :
    (forall z, vvalid g1 z -> z <> x -> left_child g1 z = Some x ->
       left_child g2 z = Some s) /\
    (forall z, vvalid g1 z -> z <> x -> right_child g1 z = Some x ->
       right_child g2 z = Some s);
  bst_ds_children_frame :
    (forall z, vvalid g1 z -> z <> x -> left_child g1 z <> Some x ->
       left_child g2 z = left_child g1 z) /\
    (forall z, vvalid g1 z -> z <> x -> right_child g1 z <> Some x ->
       right_child g2 z = right_child g1 z);
  bst_ds_moved_children :
    left_child g2 s = left_child g1 x /\
    right_child g2 s = right_child g1 x;
  bst_ds_key_moved : bt_key g2 s = bt_key g1 s;
  bst_ds_key_frame : bst_key_preserved_except g1 g2 x
}.

Lemma bst_delete_successor_target_neq_successor :
  forall g g1 g2 x r s key,
    bst_delete_successor_valid g g1 g2 x r s key ->
    x <> s.
Proof.
  intros g g1 g2 x r s key Hdelete Heq; subst s.
  destruct (bst_ds_vertices _ _ _ _ _ _ _ Hdelete)
    as [Hx1 [Hnotx1 _]].
  contradiction.
Qed.

Lemma bst_delete_successor_key_unchanged :
  forall g g1 g2 x r s key,
    bst_delete_successor_valid g g1 g2 x r s key ->
    bt_key g2 s = bt_key g s.
Proof.
  intros g g1 g2 x r s key Hdelete.
  rewrite (bst_ds_key_moved _ _ _ _ _ _ _ Hdelete).
  exact (bst_dm_key_frame _ _ _ _
    (bst_ds_detach _ _ _ _ _ _ _ Hdelete) s).
Qed.

Lemma bst_delete_successor_root_replaced :
  forall g g1 g2 x r s key,
    bst_delete_successor_valid g g1 g2 x r s key ->
    bt_root g = Some x -> bt_root g2 = Some s.
Proof.
  intros g g1 g2 x r s key Hdelete Hroot.
  pose proof (bst_delete_successor_target_neq_successor
    _ _ _ _ _ _ _ Hdelete) as Hxs.
  apply (proj1 (bst_ds_root _ _ _ _ _ _ _ Hdelete)).
  apply (proj1 (proj2 (bst_dm_root _ _ _ _
    (bst_ds_detach _ _ _ _ _ _ _ Hdelete)))) with (root := x);
    assumption.
Qed.

Lemma bst_delete_successor_original_vvalid :
  forall g g1 g2 x r s key z,
    bst_delete_successor_valid g g1 g2 x r s key ->
    (vvalid g2 z <-> vvalid g z /\ z <> x).
Proof.
  intros g g1 g2 x r s key z Hdelete.
  pose proof (bst_ds_detach _ _ _ _ _ _ _ Hdelete) as Hdetach.
  pose proof (bst_ds_vertices _ _ _ _ _ _ _ Hdelete)
    as [Hx1 [Hs1 _]].
  assert (Hxs : x <> s).
  { intro Heq; subst s; contradiction. }
  rewrite (bst_ds_vvalid _ _ _ _ _ _ _ Hdelete z).
  split.
  - intros [[Hz1 Hzx] | ->].
    + apply (proj1 (bst_dm_vvalid _ _ _ _ Hdetach z)) in Hz1.
      tauto.
    + split.
      * exact (proj1 (proj2 (proj2 (proj2
          (bst_dm_gvalid _ _ _ _ Hdetach))))).
      * congruence.
  - intros [Hz Hzx].
    destruct (classic (z = s)) as [-> | Hzs]; [right; reflexivity |].
    left; split; [| exact Hzx].
    apply (proj2 (bst_dm_vvalid _ _ _ _ Hdetach z)); tauto.
Qed.

Lemma bst_delete_successor_original_key_frame :
  forall g g1 g2 x r s key,
    bst_delete_successor_valid g g1 g2 x r s key ->
    bst_key_preserved_except g g2 x.
Proof.
  intros g g1 g2 x r s key Hdelete z Hzx.
  rewrite (bst_ds_key_frame _ _ _ _ _ _ _ Hdelete z Hzx).
  exact (bst_dm_key_frame _ _ _ _
    (bst_ds_detach _ _ _ _ _ _ _ Hdelete) z).
Qed.

Record bst_delete_noop_valid (g g' : G) (key : Z) : Prop := {
  bst_dn_gvalid : gvalid g /\ gvalid g';
  bst_dn_key_absent : bst_delete_key_absent g key;
  bst_dn_graph : g' = g
}.

Class BinarySearchTreeRotateOperation := {
  bst_left_rotate : G -> V -> V -> G;
  bst_right_rotate : G -> V -> V -> G;
  bst_left_rotate_sound : forall (g : G) (x y : V),
    gvalid g -> vvalid g x -> right_child g x = Some y ->
    bst_left_rotation_valid g (bst_left_rotate g x y) x y;
  bst_right_rotate_sound : forall (g : G) (x y : V),
    gvalid g -> vvalid g x -> left_child g x = Some y ->
    bst_right_rotation_valid g (bst_right_rotate g x y) x y
}.

Class BinarySearchTreeInsertOperation := {
  bst_insert_root : G -> V -> Z -> G;
  bst_insert_left : G -> V -> V -> Z -> G;
  bst_insert_right : G -> V -> V -> Z -> G;
  bst_insert_duplicate : G -> V -> G;
  bst_insert_root_sound : forall (g : G) (x : V) (key : Z),
    gvalid g -> bt_root g = None -> ~ vvalid g x ->
    bst_insert_root_valid g (bst_insert_root g x key) x key;
  bst_insert_left_sound : forall (g : G) (parent : V) (key: Z) (x : V),
    gvalid g -> bst_insert_node_lr g parent key -> Z.lt key (bt_key g parent) -> ~ vvalid g x -> bst_insert_left_valid g (bst_insert_left g parent x key) parent x key;
  bst_insert_right_sound : forall (g : G) (parent : V) (key: Z) (x : V),
    gvalid g -> bst_insert_node_lr g parent key -> Z.gt key (bt_key g parent) -> ~ vvalid g x -> bst_insert_right_valid g (bst_insert_right g parent x key) parent x key;
  bst_insert_duplicate_sound : forall (g : G) (x : V) (key : Z),
    gvalid g -> bst_insert_duplicate_node g key -> bt_key g x = key ->
    bst_insert_duplicate_valid g (bst_insert_duplicate g x) x key
}.

Section BST_INSERT_RELATION.
Context {bst_insert_operation : BinarySearchTreeInsertOperation}.

Definition bst_insert (g g' : G) (x : V) (key : Z) : Prop :=
  (g' = bst_insert_root g x key) \/
  (exists parent,
    g' = bst_insert_left g parent x key \/ g' = bst_insert_right g parent x key) \/
  (g' = bst_insert_duplicate g x /\ bst_insert_duplicate_node g key /\ bt_key g x = key).

Definition bst_insert_valid (g g' : G) (x : V) (key : Z) : Prop :=
  (bst_insert_root_valid g g' x key) \/
  (exists parent,
    bst_insert_left_valid g g' parent x key \/
    bst_insert_right_valid g g' parent x key) \/
  (bst_insert_duplicate_valid g g' x key).

End BST_INSERT_RELATION.

Class BinarySearchTreeDeleteOperation := {
  bst_delete_min : G -> V -> V -> G;
  bst_delete_transplant : G -> V -> option V -> Z -> G;
  bst_delete_successor : G -> V -> V -> Z -> G;
  bst_delete_noop : G -> Z -> G;
  bst_delete_min_sound : forall (g : G) (r m : V),
    gvalid g -> vvalid g r -> vvalid g m -> bst_min_node g r m ->
    bst_delete_min_valid g (bst_delete_min g r m) r m;
  bst_delete_transplant_sound : forall
      (g : G) (x : V) (child : option V) (key : Z),
    gvalid g -> bst_delete_node g x key ->
    ((right_child g x = None /\ child = left_child g x) \/
     (left_child g x = None /\ child = right_child g x)) ->
    bst_delete_transplant_valid
      g (bst_delete_transplant g x child key) x child key;
  bst_delete_successor_sound : forall
      (g : G) (x r s : V) (key : Z),
    gvalid g -> bst_delete_node g x key -> vvalid g s ->
    left_child g x <> None -> right_child g x = Some r -> bst_min_node g r s ->
    bst_delete_successor_valid
      g (bst_delete_min g r s) (bst_delete_successor g x s key)
      x r s key;
  bst_delete_noop_sound : forall (g : G) (key : Z),
    gvalid g -> bst_delete_key_absent g key ->
    bst_delete_noop_valid g (bst_delete_noop g key) key
}.

Definition bst_delete (g g' : G) (x : V) (key : Z) : Prop :=
  (exists child,
    bst_delete_transplant_valid g g' x child key) \/
  (exists g1 r s,
    bst_delete_successor_valid g g1 g' x r s key) \/
  bst_delete_noop_valid g g' key.

Section BST_DELETE_OPERATION_SOUND.
Context {bst_delete_operation : BinarySearchTreeDeleteOperation}.

Lemma bst_delete_transplant_is_delete :
  forall (g : G) (x : V) (child : option V) (key : Z),
    gvalid g -> bst_delete_node g x key ->
    ((right_child g x = None /\ child = left_child g x) \/
     (left_child g x = None /\ child = right_child g x)) ->
    bst_delete g (bst_delete_transplant g x child key) x key.
Proof.
  intros g x child key Hg Hnode Hchild.
  left; exists child.
  eapply bst_delete_transplant_sound; eauto.
Qed.

Lemma bst_delete_successor_is_delete :
  forall (g : G) (x r s : V) (key : Z),
    gvalid g -> bst_delete_node g x key -> vvalid g s ->
    left_child g x <> None -> right_child g x = Some r ->
    bst_min_node g r s ->
    bst_delete g (bst_delete_successor g x s key) x key.
Proof.
  intros g x r s key Hg Hnode Hs Hleft Hright Hmin.
  right; left.
  exists (bst_delete_min g r s), r, s.
  eapply bst_delete_successor_sound; eauto.
Qed.

Lemma bst_delete_noop_is_delete :
  forall (g : G) (x : V) (key : Z),
    gvalid g -> bst_delete_key_absent g key ->
    bst_delete g (bst_delete_noop g key) x key.
Proof.
  intros g x key Hg Habsent.
  right; right.
  eapply bst_delete_noop_sound; eauto.
Qed.

End BST_DELETE_OPERATION_SOUND.

End BINARY_SEARCH_TREE_OPERATION_INTERFACE.
