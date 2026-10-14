Require Import Coq.ZArith.ZArith.
Require Import Coq.micromega.Lia.
Require Import Coq.Lists.List.
Require Import Coq.Strings.String.
From AUXLib Require Import int_auto Axioms Feq Idents ListLib VMap.
Require Import SetsClass.SetsClass. Import SetsNotation.
From SimpleC.SL Require Import Mem SeparationLogic.
Require Import Logic.LogicGenerator.demo932.Interface.
Require Import GraphLib.graph_basic.
Require Import GraphLib.directed.binarytree.
Require GraphLib.examples.bst.

Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.

Import naive_C_Rules.
Local Open Scope sac.

(** An AVL state is a binary-search-tree graph plus the value stored in each
    node's cached [height] field.  Keeping height outside the BST graph lets
    pointer rotations reuse GraphLib's BST operations while height writes are
    described independently. *)
Record avl_model : Type := {
  avl_bst : GraphLib.examples.bst.BinarySearchTreeType addr;
  avl_height_of : addr -> Z;
}.

Definition avl_root (g : avl_model) : option addr :=
  (GraphLib.examples.bst.bst_tree (avl_bst g)).(GraphLib.examples.bst.theroot).

Definition avl_left (g : avl_model) (x : addr) : option addr :=
  (GraphLib.examples.bst.bst_tree (avl_bst g)).(GraphLib.examples.bst.left_child) x.

Definition avl_right (g : avl_model) (x : addr) : option addr :=
  (GraphLib.examples.bst.bst_tree (avl_bst g)).(GraphLib.examples.bst.right_child) x.

Definition avl_nodes (g : avl_model) : list addr :=
  (GraphLib.examples.bst.bst_tree (avl_bst g)).(GraphLib.examples.bst.listV).

Definition avl_key_of (g : avl_model) (x : addr) : Z :=
  GraphLib.examples.bst.bst_key (avl_bst g) x.

Definition avl_keys (g : avl_model) : list Z :=
  map (avl_key_of g) (avl_nodes g).

Definition avl_vvalid (g : avl_model) (x : addr) : Prop :=
  GraphLib.examples.bst.bst_vvalid (avl_bst g) x.

Definition avl_ptr_of (x : option addr) : addr :=
  match x with
  | None => NULL
  | Some p => p
  end.

Definition avl_child_height (g : avl_model) (child : option addr) : Z :=
  match child with
  | None => 0
  | Some x => avl_height_of g x
  end.

Definition avl_model_balance_factor (g : avl_model) (x : addr) : Z :=
  avl_child_height g (avl_left g x) -
  avl_child_height g (avl_right g x).

(** The cached height is a local equation over the graph.  Since [gvalid]
    makes the finite graph a rooted tree, these equations uniquely describe
    the ordinary recursive tree height without adding a second tree model. *)
Definition avl_height_consistent (g : avl_model) : Prop :=
  forall x,
    avl_vvalid g x ->
    1 <= avl_height_of g x <= UINT_MAX /\
    avl_height_of g x =
      Z.max
        (avl_child_height g (avl_left g x))
        (avl_child_height g (avl_right g x)) + 1.

Definition avl_balanced (g : avl_model) : Prop :=
  forall x,
    avl_vvalid g x ->
    Z.abs (avl_model_balance_factor g x) <= 1.

Definition avl_bst_valid (g : avl_model) : Prop :=
  @gvalid (GraphLib.examples.bst.BinarySearchTreeType addr)
    GraphLib.examples.bst.BST_gvalid (avl_bst g).

Definition avl_vertices_nonnull (g : avl_model) : Prop :=
  forall x, avl_vvalid g x -> x <> NULL.

Definition avl_gvalid (g : avl_model) : Prop :=
  avl_bst_valid g /\
  avl_height_consistent g /\
  avl_balanced g /\
  avl_vertices_nonnull g.

(** A height read needs a finite valid BST graph, non-null represented
    vertices, and cached heights consistent with the child-height equation.
    It deliberately does not require the AVL balance bound: balance-factor
    reads also occur while the root is temporarily imbalanced. The owned
    subtree supplies the concrete field-range facts for the C representation. *)
Definition avl_tree_valid (g : avl_model) : Prop :=
  avl_bst_valid g /\
  avl_height_consistent g /\
  avl_vertices_nonnull g.

(** Compatibility name for existing height and rotation callers. *)
Definition avl_height_input_valid : avl_model -> Prop := avl_tree_valid.

Lemma avl_gvalid_tree_valid_iff : forall g,
  avl_gvalid g <-> avl_tree_valid g /\ avl_balanced g.
Proof. intros g. unfold avl_gvalid, avl_tree_valid. tauto. Qed.

Lemma avl_gvalid_tree_valid : forall g, avl_gvalid g -> avl_tree_valid g.
Proof. intros g H. apply (proj1 (avl_gvalid_tree_valid_iff g)) in H. tauto. Qed.

(** The public accessor returns signed [int] from an unsigned cache field.
    Only the selected non-null node needs to fit that return type. *)
Definition avl_height_int_result_safe (g : avl_model) (cursor : addr) : Prop :=
  cursor <> NULL -> avl_height_of g cursor <= INT_MAX.

(** The graph-local cached-height equations characterize the structural
    height at each subtree root; the empty subtree has height zero. *)
Definition avl_height_result (g : avl_model) (cursor : addr) (result : Z) : Prop :=
  (cursor = NULL /\ result = 0) \/
  (exists x, cursor = x /\ avl_vvalid g x /\ result = avl_height_of g x).

(** Concrete ownership follows [bst_lib_1.tree_store]: one assertion per
    graph vertex, collected with [iter_sepcon].  Validity is intentionally not
    baked into this predicate, because rotations temporarily pass through
    states whose cached heights have not all been refreshed. *)
Definition avl_graph_node_store (g : avl_model) (x : addr) : Assertion :=
  “ avl_vvalid g x ” &&
  “ x <> NULL ” &&
  “ INT_MIN <= avl_key_of g x <= INT_MAX ” &&
  “ 0 <= avl_height_of g x <= UINT_MAX ” &&
  &(x # "AvlNode" ->ₛ "data") # Int |-> avl_key_of g x **
  &(x # "AvlNode" ->ₛ "height") # UInt |-> avl_height_of g x **
  &(x # "AvlNode" ->ₛ "left") # Ptr |-> avl_ptr_of (avl_left g x) **
  &(x # "AvlNode" ->ₛ "right") # Ptr |-> avl_ptr_of (avl_right g x).

Definition avl_graph_nodes_store (g : avl_model) (xs : list addr) : Assertion :=
  iter_sepcon (map (avl_graph_node_store g) xs).

Definition avl_tree_store (g : avl_model) : Assertion :=
  avl_graph_nodes_store g (avl_nodes g).

Definition avl_nodes_without (g : avl_model) (x : addr) : list addr :=
  remove addr_dec x (avl_nodes g).

Definition avl_rep (g : avl_model) : Assertion :=
  “ avl_gvalid g ” && avl_tree_store g.

(** Expose the current cursor's fields separately while retaining ownership of
    every other graph vertex.  Recursive search contracts can use this view at
    each cursor without treating the whole graph predicate as an opaque node. *)
Definition avl_graph_rep_at (g : avl_model) (cursor : addr) : Assertion :=
  “ avl_gvalid g /\ avl_vvalid g cursor ” &&
  avl_graph_node_store g cursor **
  avl_graph_nodes_store g (remove addr_dec cursor (avl_nodes g)).

Definition avl_height_update
    (height : addr -> Z) (x : addr) (value : Z) : addr -> Z :=
  fun y => if Z.eq_dec y x then value else height y.

Definition avl_recomputed_at (g : avl_model) (x : addr) : Prop :=
  avl_height_of g x =
    Z.max
      (avl_child_height g (avl_left g x))
      (avl_child_height g (avl_right g x)) + 1.

Definition avl_same_nonlocal_heights
    (before after : avl_model) (x y : addr) : Prop :=
  forall z,
    z <> x -> z <> y ->
    avl_height_of after z = avl_height_of before z.

(** Rotation relations reuse GraphLib's exact BST topology operation.  The
    two participating cached-height fields are recomputed in the post-state;
    every other cached height is preserved. *)
Definition avl_left_rotation_model
    (before after : avl_model) (root promoted : addr) : Prop :=
  avl_vvalid before root /\
  avl_right before root = Some promoted /\
  avl_bst after =
    GraphLib.examples.bst.bst_with_tree (avl_bst before)
      (GraphLib.examples.bst.left_rotate
        Z.eq_dec
        (GraphLib.examples.bst.bst_tree (avl_bst before)) root promoted) /\
  avl_recomputed_at after root /\
  avl_recomputed_at after promoted /\
  avl_same_nonlocal_heights before after root promoted.

Definition avl_right_rotation_model
    (before after : avl_model) (root promoted : addr) : Prop :=
  avl_vvalid before root /\
  avl_left before root = Some promoted /\
  avl_bst after =
    GraphLib.examples.bst.bst_with_tree (avl_bst before)
      (GraphLib.examples.bst.right_rotate
        Z.eq_dec
        (GraphLib.examples.bst.bst_tree (avl_bst before)) root promoted) /\
  avl_recomputed_at after root /\
  avl_recomputed_at after promoted /\
  avl_same_nonlocal_heights before after root promoted.

Definition avl_lr_rotation_model
    (before after : avl_model) (root left pivot : addr) : Prop :=
  exists middle,
    avl_left_rotation_model before middle left pivot /\
    avl_right_rotation_model middle after root pivot.

Definition avl_rl_rotation_model
    (before after : avl_model) (root right pivot : addr) : Prop :=
  exists middle,
    avl_right_rotation_model before middle right pivot /\
    avl_left_rotation_model middle after root pivot.

(** Operation-level relations deliberately state both the reused BST
    semantics and restoration of the AVL invariant.  They are suitable as
    public postconditions for insert/delete; helper functions may use the
    weaker topology relations above for intermediate states. *)
Definition avl_insert_result
    (before after : avl_model) (key : Z) : Prop :=
  avl_gvalid before /\
  avl_gvalid after /\
  (forall value,
    In value (avl_keys after) <->
    value = key \/ In value (avl_keys before)).

Definition avl_delete_result
    (before after : avl_model) (key : Z) : Prop :=
  avl_gvalid before /\
  avl_gvalid after /\
  (forall value,
    In value (avl_keys after) <->
    In value (avl_keys before) /\ value <> key).

Definition avl_modify_result
    (before after : avl_model) (source_key target_key : Z) : Prop :=
  avl_gvalid before /\
  avl_gvalid after /\
  (forall value,
    In value (avl_keys after) <->
    value = target_key \/
      (In value (avl_keys before) /\ value <> source_key)).

Definition avl_search_result
    (g : avl_model) (key ret : Z) : Prop :=
  (ret = NULL /\
    forall x, avl_vvalid g x -> avl_key_of g x <> key) \/
  (ret <> NULL /\ avl_vvalid g ret /\ avl_key_of g ret = key).

(** The public search model is a partial map from integer keys to node
    addresses.  Its lookup result is the unique abstract answer; the concrete
    graph is related to the map separately by [avl_mapping_refines_graph]. *)
Definition avl_mapping : Type := Z -> option addr.

Definition avl_mapping_search_result
    (m : avl_mapping) (key ret : Z) : Prop :=
  ret = avl_ptr_of (m key).

(** A map refines a graph when it records exactly the valid vertices under
    their stored keys.  This is a representation relation, not a search
    algorithm definition. *)
Definition avl_mapping_refines_graph
    (m : avl_mapping) (g : avl_model) : Prop :=
  forall key x,
    m key = Some x <-> avl_vvalid g x /\ avl_key_of g x = key.

(** Sign of an exact AVL balance factor guarantees a child on that side.
    The implication is conditional: a balanced node may legitimately have
    either child absent, and a left-heavy node need not have a right child. *)
Definition avl_factor_child_availability (g : avl_model) : Prop :=
  forall x, avl_vvalid g x ->
    (avl_model_balance_factor g x > 0 ->
       exists l, avl_left g x = Some l /\ avl_vvalid g l) /\
    (avl_model_balance_factor g x < 0 ->
       exists r, avl_right g x = Some r /\ avl_vvalid g r).

Definition avl_balance_input_valid (g : avl_model) (node : addr) : Prop :=
  avl_bst_valid g /\
  avl_height_consistent g /\
  avl_vertices_nonnull g /\
  (forall x, avl_vvalid g x -> x <> node ->
    Z.abs (avl_model_balance_factor g x) <= 1) /\
  (forall x, avl_vvalid g x -> avl_height_of g x <= INT_MAX) /\
  (node = NULL -> avl_root g = None) /\
  (node <> NULL -> avl_root g = Some node).

Definition avl_balance_factor_input_valid (g : avl_model) : Prop :=
  avl_bst_valid g /\
  avl_height_consistent g /\
  avl_vertices_nonnull g /\
  avl_factor_child_availability g /\
  (forall x, avl_vvalid g x -> avl_height_of g x <= INT_MAX).

Definition avl_rotation_input_valid (g : avl_model) (node : addr) : Prop :=
  avl_bst_valid g /\
  avl_height_consistent g /\
  avl_vertices_nonnull g /\
  (forall x, avl_vvalid g x -> avl_height_of g x <= UINT_MAX) /\
  node <> NULL /\ avl_vvalid g node /\ avl_root g = Some node.

Definition avl_balance_factor_or_null
    (g : avl_model) (node : addr) (factor : Z) : Prop :=
  (node = NULL /\ factor = 0) \/
  (node <> NULL /\ avl_vvalid g node /\
   factor = avl_model_balance_factor g node /\
   INT_MIN < factor /\ factor <= INT_MAX).

(** Rotation relations describe the current implementation: rewiring is followed
    by recomputing cached heights at the demoted root and promoted child. Their
    root clause handles both a standalone root rotation and an internal
    rotation of a double rotation. *)
Definition avl_left_rotation_shape
    (before after : avl_model) (root promoted : addr) : Prop :=
  avl_left_rotation_model before after root promoted /\
  ((avl_root before = Some root /\ avl_root after = Some promoted) \/
   (avl_root before <> Some root /\ avl_root after = avl_root before)).

Definition avl_right_rotation_shape
    (before after : avl_model) (root promoted : addr) : Prop :=
  avl_right_rotation_model before after root promoted /\
  ((avl_root before = Some root /\ avl_root after = Some promoted) \/
   (avl_root before <> Some root /\ avl_root after = avl_root before)).

Definition avl_lr_rotation_shape
    (before after : avl_model) (root left pivot : addr) : Prop :=
  exists middle,
    avl_left_rotation_shape before middle left pivot /\
    avl_right_rotation_shape middle after root pivot.

Definition avl_rl_rotation_shape
    (before after : avl_model) (root right pivot : addr) : Prop :=
  exists middle,
    avl_right_rotation_shape before middle right pivot /\
    avl_left_rotation_shape middle after root pivot.

(** Exact source-order result relation for the balance wrapper. *)
Definition avl_balance_output
    (m : avl_mapping) (before after : avl_model)
    (node ret : addr) : Prop :=
  avl_mapping_refines_graph m before /\
  avl_mapping_refines_graph m after /\
  ((node = NULL /\ ret = NULL /\ after = before) \/
   (node <> NULL /\
    Z.abs (avl_model_balance_factor before node) <= 1 /\
    ret = node /\ after = before) \/
   (node <> NULL /\
    avl_model_balance_factor before node > 1 /\
    avl_model_balance_factor before (avl_ptr_of (avl_left before node)) >= 0 /\
    exists promoted,
      avl_right_rotation_shape before after node promoted /\
      avl_root after = Some promoted /\ ret = promoted) \/
   (node <> NULL /\
    avl_model_balance_factor before node > 1 /\
    avl_model_balance_factor before (avl_ptr_of (avl_left before node)) < 0 /\
    exists promoted,
      avl_lr_rotation_shape before after node
        (avl_ptr_of (avl_left before node)) promoted /\
      avl_root after = Some promoted /\ ret = promoted) \/
   (node <> NULL /\
    avl_model_balance_factor before node < -1 /\
    avl_model_balance_factor before (avl_ptr_of (avl_right before node)) <= 0 /\
    exists promoted,
      avl_left_rotation_shape before after node promoted /\
      avl_root after = Some promoted /\ ret = promoted) \/
   (node <> NULL /\
    avl_model_balance_factor before node < -1 /\
    avl_model_balance_factor before (avl_ptr_of (avl_right before node)) > 0 /\
    exists promoted,
      avl_rl_rotation_shape before after node
        (avl_ptr_of (avl_right before node)) promoted /\
      avl_root after = Some promoted /\ ret = promoted)).

Lemma avl_left_child_valid_from_bst__balance_input :
  forall g x child,
    avl_bst_valid g -> avl_vvalid g x ->
    avl_left g x = Some child -> avl_vvalid g child.
Proof.
  intros g x child Hbst Hx Hchild.
  unfold avl_bst_valid in Hbst.
  unfold avl_vvalid in *.
  unfold avl_left in Hchild.
  exact (GraphLib.examples.bst.child_valid
    (GraphLib.examples.bst.bst_tree (avl_bst g))
    (GraphLib.examples.bst.bst_binary_tree (avl_bst g) Hbst)
    x child Hx (or_introl Hchild)).
Qed.

Lemma avl_right_child_valid_from_bst__balance_input :
  forall g x child,
    avl_bst_valid g -> avl_vvalid g x ->
    avl_right g x = Some child -> avl_vvalid g child.
Proof.
  intros g x child Hbst Hx Hchild.
  unfold avl_bst_valid in Hbst.
  unfold avl_vvalid in *.
  unfold avl_right in Hchild.
  exact (GraphLib.examples.bst.child_valid
    (GraphLib.examples.bst.bst_tree (avl_bst g))
    (GraphLib.examples.bst.bst_binary_tree (avl_bst g) Hbst)
    x child Hx (or_intror Hchild)).
Qed.

(** The child-availability conjunct above is a consequence of exact cached
    heights and BST child validity: a positive factor cannot have an empty
    left child, and a negative factor cannot have an empty right child. *)
Lemma avl_factor_child_availability_follows_from_shape__balance_input :
  forall g,
    avl_bst_valid g -> avl_height_consistent g ->
    avl_factor_child_availability g.
Proof.
  intros g Hbst Hheight x Hx.
  unfold avl_factor_child_availability.
  destruct (avl_left g x) as [left|] eqn:Hleft;
  destruct (avl_right g x) as [right|] eqn:Hright.
  - assert (Hleft_valid : avl_vvalid g left).
    { exact (avl_left_child_valid_from_bst__balance_input
        g x left Hbst Hx Hleft). }
    assert (Hright_valid : avl_vvalid g right).
    { exact (avl_right_child_valid_from_bst__balance_input
        g x right Hbst Hx Hright). }
    split; intro Hfactor.
    + exists left. auto.
    + exists right. auto.
  - assert (Hleft_valid : avl_vvalid g left).
    { exact (avl_left_child_valid_from_bst__balance_input
        g x left Hbst Hx Hleft). }
    specialize (Hheight left Hleft_valid) as [Hleft_height _].
    split; intro Hfactor.
    + exists left. auto.
    + unfold avl_model_balance_factor, avl_child_height in Hfactor.
      rewrite Hleft, Hright in Hfactor. simpl in Hfactor. lia.
  - assert (Hright_valid : avl_vvalid g right).
    { exact (avl_right_child_valid_from_bst__balance_input
        g x right Hbst Hx Hright). }
    specialize (Hheight right Hright_valid) as [Hright_height _].
    split; intro Hfactor.
    + unfold avl_model_balance_factor, avl_child_height in Hfactor.
      rewrite Hleft, Hright in Hfactor. simpl in Hfactor. lia.
    + exists right. auto.
  - split; intro Hfactor;
      unfold avl_model_balance_factor, avl_child_height in Hfactor;
      rewrite Hleft, Hright in Hfactor; simpl in Hfactor; lia.
Qed.

Definition avl_mapping_rep (m : avl_mapping) : Assertion :=
  EX g,
    “ avl_gvalid g /\ avl_mapping_refines_graph m g ” && avl_rep g.

Definition avl_mapping_root_rep (m : avl_mapping) (root : addr) : Assertion :=
  EX g,
    “ avl_tree_valid g /\ root = avl_ptr_of (avl_root g) /\
      avl_mapping_refines_graph m g ” && avl_tree_store g.

(** The recursive implementation's mathematical result is the map entry when
    that entry lies below the current cursor in the BST topology.  This
    predicate describes a subtree lookup result without defining a recursive
    search procedure. *)
Definition avl_mapping_subtree_search_result
    (m : avl_mapping) (g : avl_model) (cursor : addr)
    (key ret : Z) : Prop :=
  (ret = NULL /\
    forall x, m key = Some x ->
      ~ GraphLib.examples.bst.bt_path
          (GraphLib.examples.bst.bst_tree (avl_bst g)) cursor x) \/
  (exists x,
    ret = x /\ m key = Some x /\
      GraphLib.examples.bst.bt_path
      (GraphLib.examples.bst.bst_tree (avl_bst g)) cursor x).

Definition avl_reachable (g : avl_model) (x y : addr) : Prop :=
  GraphLib.examples.bst.bt_path
    (GraphLib.examples.bst.bst_tree (avl_bst g)) x y.

(** The result is the greatest-key vertex of the left subtree, or the input
    vertex itself when there is no left subtree.  This is a graph property,
    independent of any particular traversal implementation. *)
Definition avl_predecessor_result
    (g : avl_model) (node ret : addr) : Prop :=
  avl_vvalid g node /\
  ((avl_left g node = None /\ ret = node) \/
   (exists left,
      avl_left g node = Some left /\
      avl_reachable g left ret /\
      avl_vvalid g ret /\
      avl_key_of g ret < avl_key_of g node /\
      forall x, avl_reachable g left x ->
        avl_key_of g x <= avl_key_of g ret)).

(** During right-spine traversal, each node in the start subtree is either
    no greater than the cursor or remains in the cursor's subtree. *)
Definition avl_right_spine_cursor_valid
    (g : avl_model) (start cursor : addr) : Prop :=
  avl_reachable g start cursor /\
  forall x, avl_reachable g start x ->
    avl_key_of g x <= avl_key_of g cursor \/ avl_reachable g cursor x.

Definition avl_mapping_predecessor_result
    (m : avl_mapping) (g : avl_model) (node ret : addr) : Prop :=
  avl_mapping_refines_graph m g /\
  avl_predecessor_result g node ret.

Definition avl_subtree_nodes (g : avl_model) (cursor : addr) : list addr :=
  valid_NoDup_list (avl_reachable g cursor) (avl_nodes g).

Definition avl_subtree_store_at (g : avl_model) (cursor : addr) : Assertion :=
  “ cursor <> NULL -> avl_vvalid g cursor ” &&
  avl_graph_nodes_store g (avl_subtree_nodes g cursor).

Definition avl_search_cursor_valid
    (g : avl_model) (cursor : addr) (key : Z) : Prop :=
  forall x,
    avl_vvalid g x ->
    avl_key_of g x = key ->
    avl_reachable g cursor x.

Require Import Coq.Sorting.Permutation.
Require Import Coq.micromega.Lia.
Require Import Coq.Logic.ClassicalDescription.
Lemma avl_subtree_path_classify__graph_store_decomposition :
  forall (g : avl_model) (x y : addr),
    avl_reachable g x y ->
    y = x \/
    avl_reachable g (avl_ptr_of (avl_left g x)) y \/
    avl_reachable g (avl_ptr_of (avl_right g x)) y.
Proof.
  intros g x y Hpath.
  unfold avl_reachable, GraphLib.examples.bst.bt_path in Hpath.
  destruct Hpath as [n Hn].
  destruct n.
  - unfold Rels.id in Hn. left; congruence.
  - simpl in Hn.
    destruct Hn as [z [Hedge Htail]].
    unfold Sets.test1 in Hedge; simpl in Hedge.
    unfold Sets.lift1 in Htail; simpl in Htail.
    change (GraphLib.examples.bst.bt_child
      (GraphLib.examples.bst.bst_tree (avl_bst g)) x z) in Hedge.
    destruct Hedge as [Hleft | Hright].
    + right; left.
      unfold avl_reachable, GraphLib.examples.bst.bt_path,
        avl_ptr_of, avl_left.
      rewrite Hleft. exists n. exact Htail.
    + right; right.
      unfold avl_reachable, GraphLib.examples.bst.bt_path,
        avl_ptr_of, avl_right.
      rewrite Hright. exists n. exact Htail.
Qed.
Lemma avl_subtree_invalid_path_empty__graph_store_decomposition :
  forall (g : avl_model) (x y : addr),
    avl_gvalid g ->
    ~ avl_vvalid g x ->
    avl_vvalid g y ->
    ~ avl_reachable g x y.
Proof.
  intros g x y Hg Hnx Hvy Hpath.
  unfold avl_reachable, GraphLib.examples.bst.bt_path in Hpath.
  destruct Hpath as [n Hn].
  destruct n.
  - unfold Rels.id in Hn. inversion Hn; subst. contradiction.
  - simpl in Hn. destruct Hn as [z [Hedge Htail]].
    unfold Sets.test1 in Hedge; simpl in Hedge.
    change (GraphLib.examples.bst.bt_child
      (GraphLib.examples.bst.bst_tree (avl_bst g)) x z) in Hedge.
    pose proof (proj1 Hg) as Hbst.
    pose proof (GraphLib.examples.bst.bst_binary_tree (avl_bst g) Hbst) as Htree.
    destruct (GraphLib.examples.bst.invalid_child_is_none
      (GraphLib.examples.bst.bst_tree (avl_bst g)) Htree x Hnx)
      as [Hleft Hright].
    destruct Hedge as [He | He].
    + unfold GraphLib.examples.bst.bt_child in He.
      rewrite Hleft in He. discriminate.
    + unfold GraphLib.examples.bst.bt_child in He.
      rewrite Hright in He. discriminate.
Qed.
Lemma avl_subtree_path_prepend__graph_store_decomposition :
  forall (g : avl_model) (x child y : addr),
    (avl_left g x = Some child \/ avl_right g x = Some child) ->
    avl_reachable g child y ->
    avl_reachable g x y.
Proof.
  intros g x child y Hchild Htail.
  unfold avl_reachable, GraphLib.examples.bst.bt_path in *.
  destruct Htail as [n Htail].
  exists (S n). simpl.
  exists child. split.
  - unfold GraphLib.examples.bst.bt_child, avl_left, avl_right in *.
    destruct Hchild as [Hleft | Hright].
    + left; exact Hleft.
    + right; exact Hright.
  - exact Htail.
Qed.


(** Reachable graph nodes partition into the cursor and the two child stores. *)
Lemma avl_subtree_nodes_partition__graph_store_decomposition :
  forall (g : avl_model) (x : addr),
    avl_gvalid g -> avl_vvalid g x ->
    Permutation (avl_subtree_nodes g x)
      (x :: avl_subtree_nodes g (avl_ptr_of (avl_left g x)) ++
           avl_subtree_nodes g (avl_ptr_of (avl_right g x))).
Proof.
 intros g x Hg Hv.
 unfold avl_subtree_nodes.
 apply NoDup_Permutation.
 - apply GraphLib.graph_basic.valid_NoDup_list_NoDup.
 - apply NoDup_cons.
   + intro Hin. apply in_app_iff in Hin. destruct Hin as [Hin|Hin].
     * apply GraphLib.graph_basic.valid_NoDup_list_spec in Hin as [_ Hpath].
       destruct (avl_left g x) as [l|] eqn:Hleft.
       -- pose proof (proj1 Hg) as Hbst.
          pose proof (GraphLib.examples.bst.bst_binary_tree (avl_bst g) Hbst) as Htree.
          assert (Hsub : GraphLib.examples.bst.bt_left_subtree
              (GraphLib.examples.bst.bst_tree (avl_bst g)) x x).
          { unfold GraphLib.examples.bst.bt_left_subtree. exists l. split.
            - exact Hleft.
            - exact Hpath. }
          exact (GraphLib.examples.bst.bt_left_subtree_not_self
            (GraphLib.examples.bst.bst_tree (avl_bst g)) x Htree Hv Hsub).
       -- simpl in Hpath.
          assert (Hnull : ~ avl_vvalid g NULL).
          { pose proof Hg as Hgcopy. unfold avl_gvalid in Hgcopy.
            destruct Hgcopy as [_ [_ [_ Hnonnull]]].
            intro Hnull. specialize (Hnonnull NULL Hnull). contradiction. }
          unfold avl_reachable, GraphLib.examples.bst.bt_path in Hpath.
          destruct Hpath as [n Hn]. destruct n.
          ++ unfold Rels.id in Hn; inversion Hn; subst; contradiction.
          ++ simpl in Hn; destruct Hn as [z [Hedge Htail]].
             unfold Sets.test1 in Hedge; simpl in Hedge.
             change (GraphLib.examples.bst.bt_child
               (GraphLib.examples.bst.bst_tree (avl_bst g)) NULL z) in Hedge.
             pose proof (proj1 Hg) as Hbst.
             pose proof (GraphLib.examples.bst.bst_binary_tree (avl_bst g) Hbst) as Htree.
             destruct (GraphLib.examples.bst.invalid_child_is_none
               (GraphLib.examples.bst.bst_tree (avl_bst g)) Htree NULL Hnull)
               as [Hleftnull Hrightnull].
             destruct Hedge as [He|He].
             ** unfold GraphLib.examples.bst.bt_child in He. rewrite Hleftnull in He. discriminate.
             ** unfold GraphLib.examples.bst.bt_child in He. rewrite Hrightnull in He. discriminate.
     * apply GraphLib.graph_basic.valid_NoDup_list_spec in Hin as [_ Hpath].
       destruct (avl_right g x) as [r|] eqn:Hright.
       -- pose proof (proj1 Hg) as Hbst.
          pose proof (GraphLib.examples.bst.bst_binary_tree (avl_bst g) Hbst) as Htree.
          assert (Hsub : GraphLib.examples.bst.bt_right_subtree
              (GraphLib.examples.bst.bst_tree (avl_bst g)) x x).
          { unfold GraphLib.examples.bst.bt_right_subtree. exists r. split.
            - exact Hright.
            - exact Hpath. }
          exact (GraphLib.examples.bst.bt_right_subtree_not_self
            (GraphLib.examples.bst.bst_tree (avl_bst g)) x Htree Hv Hsub).
       -- simpl in Hpath.
          assert (Hnull : ~ avl_vvalid g NULL).
          { pose proof Hg as Hgcopy. unfold avl_gvalid in Hgcopy.
            destruct Hgcopy as [_ [_ [_ Hnonnull]]].
            intro Hnull. specialize (Hnonnull NULL Hnull). contradiction. }
          unfold avl_reachable, GraphLib.examples.bst.bt_path in Hpath.
          destruct Hpath as [n Hn]. destruct n.
          ++ unfold Rels.id in Hn; inversion Hn; subst; contradiction.
          ++ simpl in Hn; destruct Hn as [z [Hedge Htail]].
             unfold Sets.test1 in Hedge; simpl in Hedge.
             change (GraphLib.examples.bst.bt_child
               (GraphLib.examples.bst.bst_tree (avl_bst g)) NULL z) in Hedge.
             pose proof (proj1 Hg) as Hbst.
             pose proof (GraphLib.examples.bst.bst_binary_tree (avl_bst g) Hbst) as Htree.
             destruct (GraphLib.examples.bst.invalid_child_is_none
               (GraphLib.examples.bst.bst_tree (avl_bst g)) Htree NULL Hnull)
               as [Hleftnull Hrightnull].
             destruct Hedge as [He|He].
             ** unfold GraphLib.examples.bst.bt_child in He. rewrite Hleftnull in He. discriminate.
             ** unfold GraphLib.examples.bst.bt_child in He. rewrite Hrightnull in He. discriminate.
   + apply NoDup_app.
     * apply GraphLib.graph_basic.valid_NoDup_list_NoDup.
     * apply GraphLib.graph_basic.valid_NoDup_list_NoDup.
     * intros a Hlin Hrin.
       apply GraphLib.graph_basic.valid_NoDup_list_spec in Hlin as [HnodesL HpathL].
       apply GraphLib.graph_basic.valid_NoDup_list_spec in Hrin as [HnodesR HpathR].
       pose proof (proj1 Hg) as Hbst.
       assert (Hav : avl_vvalid g a).
       { apply (proj1 (GraphLib.examples.bst.bst_listV_spec (avl_bst g) a Hbst)).
         exact HnodesL. }
       destruct (avl_left g x) as [l|] eqn:Hleft;
       destruct (avl_right g x) as [r|] eqn:Hright.
       -- assert (HsubL : GraphLib.examples.bst.bt_left_subtree
              (GraphLib.examples.bst.bst_tree (avl_bst g)) x a).
          { unfold GraphLib.examples.bst.bt_left_subtree. exists l. split; [exact Hleft|exact HpathL]. }
          assert (HsubR : GraphLib.examples.bst.bt_right_subtree
              (GraphLib.examples.bst.bst_tree (avl_bst g)) x a).
          { unfold GraphLib.examples.bst.bt_right_subtree. exists r. split; [exact Hright|exact HpathR]. }
          pose proof (GraphLib.examples.bst.bst_left_order (avl_bst g) Hbst x a Hv HsubL) as Hlt1.
          pose proof (GraphLib.examples.bst.bst_right_order (avl_bst g) Hbst x a Hv HsubR) as Hlt2.
          unfold avl_key_of in Hlt1, Hlt2. lia.
       -- assert (Hnull : ~ avl_vvalid g NULL).
          { pose proof Hg as Hgcopy. unfold avl_gvalid in Hgcopy.
            destruct Hgcopy as [_ [_ [_ Hnonnull]]].
            intro Hnull. specialize (Hnonnull NULL Hnull). contradiction. }
          simpl in HpathR.
          exact (avl_subtree_invalid_path_empty__graph_store_decomposition g NULL a Hg Hnull Hav HpathR).
       -- assert (Hnull : ~ avl_vvalid g NULL).
          { pose proof Hg as Hgcopy. unfold avl_gvalid in Hgcopy.
            destruct Hgcopy as [_ [_ [_ Hnonnull]]].
            intro Hnull. specialize (Hnonnull NULL Hnull). contradiction. }
          simpl in HpathL.
          exact (avl_subtree_invalid_path_empty__graph_store_decomposition g NULL a Hg Hnull Hav HpathL).
       -- assert (Hnull : ~ avl_vvalid g NULL).
          { pose proof Hg as Hgcopy. unfold avl_gvalid in Hgcopy.
            destruct Hgcopy as [_ [_ [_ Hnonnull]]].
            intro Hnull. specialize (Hnonnull NULL Hnull). contradiction. }
          simpl in HpathL.
          exact (avl_subtree_invalid_path_empty__graph_store_decomposition g NULL a Hg Hnull Hav HpathL).
 - intros a. split; intro Hin.
   + apply GraphLib.graph_basic.valid_NoDup_list_spec in Hin as [Hnodes Hpath].
     pose proof (avl_subtree_path_classify__graph_store_decomposition g x a Hpath) as Hcase.
     destruct Hcase as [->|[Hleftpath|Hrightpath]].
     * simpl. left; reflexivity.
     * right. apply in_app_iff. left.
       apply GraphLib.graph_basic.valid_NoDup_list_spec. split; assumption.
     * right. apply in_app_iff. right.
       apply GraphLib.graph_basic.valid_NoDup_list_spec. split; assumption.
   + simpl in Hin. destruct Hin as [Heq|Hin].
     * subst a. apply GraphLib.graph_basic.valid_NoDup_list_spec. split.
       -- apply (proj2 (GraphLib.examples.bst.bst_listV_spec (avl_bst g) x (proj1 Hg))). exact Hv.
       -- unfold avl_reachable, GraphLib.examples.bst.bt_path. exists 0%nat. simpl. reflexivity.
     * apply in_app_iff in Hin. destruct Hin as [HinL|HinR].
       -- apply GraphLib.graph_basic.valid_NoDup_list_spec in HinL as [Hnodes Hpath].
          destruct (avl_left g x) as [l|] eqn:Hleft.
          ++ apply GraphLib.graph_basic.valid_NoDup_list_spec. split; [exact Hnodes|].
             eapply avl_subtree_path_prepend__graph_store_decomposition.
             ** left; exact Hleft.
             ** exact Hpath.
          ++ assert (Hnull : ~ avl_vvalid g NULL).
             { pose proof Hg as Hgcopy. unfold avl_gvalid in Hgcopy.
               destruct Hgcopy as [_ [_ [_ Hnonnull]]].
               intro Hnull. specialize (Hnonnull NULL Hnull). contradiction. }
             simpl in Hpath.
             assert (Ha : avl_vvalid g a).
             { apply (proj1 (GraphLib.examples.bst.bst_listV_spec (avl_bst g) a (proj1 Hg))). exact Hnodes. }
             exfalso. eapply (avl_subtree_invalid_path_empty__graph_store_decomposition g NULL a Hg Hnull Ha Hpath).
       -- apply GraphLib.graph_basic.valid_NoDup_list_spec in HinR as [Hnodes Hpath].
          destruct (avl_right g x) as [r|] eqn:Hright.
          ++ apply GraphLib.graph_basic.valid_NoDup_list_spec. split; [exact Hnodes|].
             eapply avl_subtree_path_prepend__graph_store_decomposition.
             ** right; exact Hright.
             ** exact Hpath.
          ++ assert (Hnull : ~ avl_vvalid g NULL).
             { pose proof Hg as Hgcopy. unfold avl_gvalid in Hgcopy.
               destruct Hgcopy as [_ [_ [_ Hnonnull]]].
               intro Hnull. specialize (Hnonnull NULL Hnull). contradiction. }
             simpl in Hpath.
             assert (Ha : avl_vvalid g a).
             { apply (proj1 (GraphLib.examples.bst.bst_listV_spec (avl_bst g) a (proj1 Hg))). exact Hnodes. }
             exfalso. eapply (avl_subtree_invalid_path_empty__graph_store_decomposition g NULL a Hg Hnull Ha Hpath).
Qed.
Lemma avl_graph_nodes_store_app__graph_store_decomposition :
  forall g xs ys,
    avl_graph_nodes_store g xs ** avl_graph_nodes_store g ys
    |-- avl_graph_nodes_store g (xs ++ ys).
Proof.
  intros g xs ys. unfold avl_graph_nodes_store. rewrite map_app.
  apply derivable1_sepcon_iter_sepcon1.
Qed.
Lemma avl_graph_nodes_store_split__graph_store_decomposition :
  forall g xs ys,
    avl_graph_nodes_store g (xs ++ ys)
    |-- avl_graph_nodes_store g xs ** avl_graph_nodes_store g ys.
Proof.
  intros g xs ys. unfold avl_graph_nodes_store. rewrite map_app.
  apply derivable1_sepcon_iter_sepcon2.
Qed.
Lemma avl_emp_sepcon_clean__graph_store_decomposition :
  forall P, emp ** P --||-- P.
Proof.
  intros P. unfold logic_equiv, derivable1, sepcon, emp. split.
  - intros m [m1 [m2 [Hjoin [Hunit HP]]]].
    pose proof (unit_spec m2 m m1 Hunit (join_comm _ _ _ Hjoin)) as Heq.
    subst m. exact HP.
  - intros m HP. destruct (unit_join m) as [u [Hunit Hjoin]].
    exists u, m. split; [apply join_comm; exact Hjoin|]. split; auto.
Qed.
Lemma avl_graph_nodes_store_cons__graph_store_decomposition :
  forall g x xs,
    avl_graph_nodes_store g (x :: xs)
    --||-- avl_graph_node_store g x ** avl_graph_nodes_store g xs.
Proof.
  intros g x xs. split.
  - change (x :: xs) with ((x :: nil) ++ xs).
    sep_apply avl_graph_nodes_store_split__graph_store_decomposition.
    rewrite (avl_emp_sepcon_clean__graph_store_decomposition (avl_graph_node_store g x)).
    cancel.
  - change (x :: xs) with ((x :: nil) ++ xs).
    rewrite <- (avl_emp_sepcon_clean__graph_store_decomposition (avl_graph_node_store g x)).
    change (emp ** avl_graph_node_store g x) with (avl_graph_nodes_store g (x :: nil)).
    sep_apply (avl_graph_nodes_store_app__graph_store_decomposition g (x :: nil) xs).
    reflexivity.
Qed.
Lemma avl_graph_nodes_store_nil__graph_store_decomposition :
  forall g, avl_graph_nodes_store g nil --||-- emp.
Proof.
  intros. unfold avl_graph_nodes_store. simpl. split; entailer!.
Qed.
Lemma avl_graph_nodes_store_permutation__graph_store_decomposition :
  forall g xs ys, Permutation xs ys ->
    avl_graph_nodes_store g xs --||-- avl_graph_nodes_store g ys.
Proof.
  intros g xs ys Hperm. induction Hperm.
  - split; entailer!.
  - rewrite !avl_graph_nodes_store_cons__graph_store_decomposition.
    rewrite IHHperm. reflexivity.
  - rewrite !avl_graph_nodes_store_cons__graph_store_decomposition.
    split; cancel.
  - rewrite IHHperm1. exact IHHperm2.
Qed.
Lemma avl_subtree_graph_store_decompose__graph_store_decomposition :
  forall g x,
    avl_gvalid g -> avl_vvalid g x ->
    avl_graph_nodes_store g (avl_subtree_nodes g x)
    |-- avl_graph_node_store g x **
        avl_graph_nodes_store g
          (avl_subtree_nodes g (avl_ptr_of (avl_left g x)) ++
           avl_subtree_nodes g (avl_ptr_of (avl_right g x))).
Proof.
  intros g x Hg Hv.
  rewrite (avl_graph_nodes_store_permutation__graph_store_decomposition g _ _
    (avl_subtree_nodes_partition__graph_store_decomposition g x Hg Hv)).
  rewrite avl_graph_nodes_store_cons__graph_store_decomposition.
  entailer!.
Qed.
Lemma avl_graph_nodes_store_singleton__graph_store_decomposition :
  forall g x,
    avl_graph_nodes_store g (x :: nil) --||-- avl_graph_node_store g x.
Proof.
  intros. rewrite avl_graph_nodes_store_cons__graph_store_decomposition.
  rewrite avl_graph_nodes_store_nil__graph_store_decomposition.
  rewrite sepcon_emp_equiv. reflexivity.
Qed.
Lemma avl_subtree_graph_store_fold__graph_store_decomposition :
  forall g x,
    avl_gvalid g -> avl_vvalid g x ->
    avl_graph_node_store g x **
      (avl_graph_nodes_store g (avl_subtree_nodes g (avl_ptr_of (avl_left g x))) **
       avl_graph_nodes_store g (avl_subtree_nodes g (avl_ptr_of (avl_right g x))))
    |-- avl_graph_nodes_store g (avl_subtree_nodes g x).
Proof.
  intros g x Hg Hv.
  assert (Hsingle : avl_graph_node_store g x |-- avl_graph_nodes_store g (x :: nil)).
  { pose proof (avl_graph_nodes_store_singleton__graph_store_decomposition g x) as Hs.
    destruct Hs as [_ Hs]. exact Hs. }
  pose proof (avl_subtree_nodes_partition__graph_store_decomposition g x Hg Hv) as Hp.
  pose proof (avl_graph_nodes_store_permutation__graph_store_decomposition g _ _ Hp) as Hstore.
  destruct Hstore as [_ Hback].
  sep_apply_l_atomic Hsingle.
  sep_apply_l_atomic (avl_graph_nodes_store_app__graph_store_decomposition g
    (avl_subtree_nodes g (avl_ptr_of (avl_left g x)))
    (avl_subtree_nodes g (avl_ptr_of (avl_right g x)))).
  sep_apply_l_atomic (avl_graph_nodes_store_app__graph_store_decomposition g
    (x :: nil)
    (avl_subtree_nodes g (avl_ptr_of (avl_left g x)) ++
     avl_subtree_nodes g (avl_ptr_of (avl_right g x)))).
  exact Hback.
Qed.
Lemma avl_subtree_store_fold__graph_store_decomposition :
  forall g x,
    avl_gvalid g -> x <> NULL -> avl_vvalid g x ->
    avl_graph_node_store g x **
      (avl_subtree_store_at g (avl_ptr_of (avl_left g x)) **
       avl_subtree_store_at g (avl_ptr_of (avl_right g x)))
    |-- avl_subtree_store_at g x.
Proof.
  intros g x Hg Hx Hv. unfold avl_subtree_store_at.
  entailer!.
  eapply avl_subtree_graph_store_fold__graph_store_decomposition; eauto.
Qed.
Lemma avl_left_child_nonnull_valid__graph_store_decomposition :
  forall g x,
    avl_gvalid g -> avl_vvalid g x ->
    avl_ptr_of (avl_left g x) <> NULL ->
    avl_vvalid g (avl_ptr_of (avl_left g x)).
Proof.
  intros g x Hg Hv Hnonnull.
  unfold avl_ptr_of, avl_left in *.
  destruct ((GraphLib.examples.bst.bst_tree (avl_bst g)).(GraphLib.examples.bst.left_child) x) as [l|] eqn:Hl; simpl in *.
  - exact (GraphLib.examples.bst.child_valid
      (GraphLib.examples.bst.bst_tree (avl_bst g))
      (GraphLib.examples.bst.bst_binary_tree (avl_bst g) (proj1 Hg))
      x l Hv (or_introl Hl)).
  - contradiction.
Qed.
Lemma avl_right_child_nonnull_valid__graph_store_decomposition :
  forall g x,
    avl_gvalid g -> avl_vvalid g x ->
    avl_ptr_of (avl_right g x) <> NULL ->
    avl_vvalid g (avl_ptr_of (avl_right g x)).
Proof.
  intros g x Hg Hv Hnonnull.
  unfold avl_ptr_of, avl_right in *.
  destruct ((GraphLib.examples.bst.bst_tree (avl_bst g)).(GraphLib.examples.bst.right_child) x) as [r|] eqn:Hr; simpl in *.
  - exact (GraphLib.examples.bst.child_valid
      (GraphLib.examples.bst.bst_tree (avl_bst g))
      (GraphLib.examples.bst.bst_binary_tree (avl_bst g) (proj1 Hg))
      x r Hv (or_intror Hr)).
  - contradiction.
Qed.
Lemma avl_subtree_store_decompose__graph_store_decomposition :
  forall g x,
    avl_gvalid g -> x <> NULL -> avl_vvalid g x ->
    avl_subtree_store_at g x
    |-- avl_graph_node_store g x **
        (avl_subtree_store_at g (avl_ptr_of (avl_left g x)) **
         avl_subtree_store_at g (avl_ptr_of (avl_right g x))).
Proof.
  intros g x Hg Hx Hv. unfold avl_subtree_store_at.
  entailer!.
  sep_apply_l_atomic (avl_subtree_graph_store_decompose__graph_store_decomposition g x Hg Hv).
  sep_apply_l_atomic (avl_graph_nodes_store_split__graph_store_decomposition g
    (avl_subtree_nodes g (avl_ptr_of (avl_left g x)))
    (avl_subtree_nodes g (avl_ptr_of (avl_right g x)))).
  all: entailer!.
  all: try (eapply avl_left_child_nonnull_valid__graph_store_decomposition; eauto).
  all: try (eapply avl_right_child_nonnull_valid__graph_store_decomposition; eauto).
Qed.
Lemma avl_subtree_store_valid_guard__graph_store_decomposition :
  forall g x,
    avl_subtree_store_at g x |-- “ x <> NULL -> avl_vvalid g x ”.
Proof.
  intros g x. unfold avl_subtree_store_at. entailer!.
Qed.
Lemma avl_graph_node_store_height_upper__graph_store_decomposition :
  forall g x,
    avl_graph_node_store g x |-- “ avl_height_of g x <= UINT_MAX ”.
Proof.
  intros g x. unfold avl_graph_node_store. entailer!.
Qed.
Lemma avl_search_cursor_descend_right__cursor_branch_invariant__tree_valid :
  forall g cursor key,
    avl_tree_valid g ->
    avl_vvalid g cursor ->
    avl_key_of g cursor < key ->
    avl_search_cursor_valid g cursor key ->
    avl_search_cursor_valid g (avl_ptr_of (avl_right g cursor)) key.
Proof.
  intros g cursor key Hg Hcursor_valid Hlt Hvalid x Hx Hkey.
  unfold avl_search_cursor_valid, avl_reachable in *.
  unfold GraphLib.examples.bst.bt_path in Hvalid.
  specialize (Hvalid x Hx Hkey).
  destruct Hg as [Hbst _].
  destruct Hbst as [Htree Hleft_order _].
  induction_1n Hvalid.
  - unfold avl_key_of in Hlt, Hkey. lia.
  - destruct H as [Hleft | Hright].
    + assert (Horder : GraphLib.examples.bst.bst_key (avl_bst g) x <
          GraphLib.examples.bst.bst_key (avl_bst g) cursor).
      { apply Hleft_order; [exact Hcursor_valid |].
        exists cursor0. split; assumption. }
      change (GraphLib.examples.bst.bst_key (avl_bst g) cursor < key) in Hlt.
      change (GraphLib.examples.bst.bst_key (avl_bst g) x = key) in Hkey.
      lia.
    + unfold avl_ptr_of, avl_right. rewrite Hright. exact Hvalid.
Qed.
Lemma avl_search_cursor_descend_right__cursor_branch_invariant :
  forall g cursor key,
    avl_gvalid g ->
    avl_vvalid g cursor ->
    avl_key_of g cursor < key ->
    avl_search_cursor_valid g cursor key ->
    avl_search_cursor_valid g (avl_ptr_of (avl_right g cursor)) key.
Proof. intros; eapply avl_search_cursor_descend_right__cursor_branch_invariant__tree_valid; eauto using avl_gvalid_tree_valid. Qed.
Lemma avl_search_cursor_descend_left__cursor_branch_invariant__tree_valid :
  forall g cursor key,
    avl_tree_valid g ->
    avl_vvalid g cursor ->
    key < avl_key_of g cursor ->
    avl_search_cursor_valid g cursor key ->
    avl_search_cursor_valid g (avl_ptr_of (avl_left g cursor)) key.
Proof.
  intros g cursor key Hg Hcursor_valid Hlt Hvalid x Hx Hkey.
  unfold avl_search_cursor_valid, avl_reachable in *.
  unfold GraphLib.examples.bst.bt_path in Hvalid.
  specialize (Hvalid x Hx Hkey).
  destruct Hg as [Hbst _].
  destruct Hbst as [Htree _ Hright_order].
  induction_1n Hvalid.
  - unfold avl_key_of in Hlt, Hkey. lia.
  - destruct H as [Hleft | Hright].
    + unfold avl_ptr_of, avl_left. rewrite Hleft. exact Hvalid.
    + assert (Horder : GraphLib.examples.bst.bst_key (avl_bst g) cursor <
          GraphLib.examples.bst.bst_key (avl_bst g) x).
      { apply Hright_order; [exact Hcursor_valid |].
        exists cursor0. split; assumption. }
      change (key < GraphLib.examples.bst.bst_key (avl_bst g) cursor) in Hlt.
      change (GraphLib.examples.bst.bst_key (avl_bst g) x = key) in Hkey.
      lia.
Qed.
Lemma avl_search_cursor_descend_left__cursor_branch_invariant :
  forall g cursor key,
    avl_gvalid g ->
    avl_vvalid g cursor ->
    key < avl_key_of g cursor ->
    avl_search_cursor_valid g cursor key ->
    avl_search_cursor_valid g (avl_ptr_of (avl_left g cursor)) key.
Proof. intros; eapply avl_search_cursor_descend_left__cursor_branch_invariant__tree_valid; eauto using avl_gvalid_tree_valid. Qed.
Lemma bt_path_from_invalid_excludes__mapping_refinement :
  forall (V : Type) (t : GraphLib.examples.bst.BinaryTreeType V),
    GraphLib.examples.bst.BinaryTreeProp V t ->
    forall x y,
      ~ GraphLib.examples.bst.bt_vvalid t x ->
      GraphLib.examples.bst.bt_vvalid t y ->
      ~ GraphLib.examples.bst.bt_path t x y.
Proof.
  intros V t Htree x y Hbad Hy Hpath.
  unfold GraphLib.examples.bst.bt_path in Hpath.
  induction_1n Hpath.
  - contradiction.
  - unfold GraphLib.examples.bst.bt_child in H.
    destruct H as [He|He].
    + pose proof (@GraphLib.examples.bst.invalid_child_is_none V t Htree x Hbad) as [Hl Hr].
      rewrite Hl in He. discriminate.
    + pose proof (@GraphLib.examples.bst.invalid_child_is_none V t Htree x Hbad) as [Hl Hr].
      rewrite Hr in He. discriminate.
Qed.
Lemma avl_null_cursor_excludes_matching_key__mapping_refinement__tree_valid :
  forall g key x,
    avl_tree_valid g -> avl_vvalid g x -> avl_key_of g x = key ->
    ~ avl_reachable g NULL x.
Proof.
  intros g key x Hg Hx Hkey Hpath.
  unfold avl_tree_valid in Hg.
  destruct Hg as [Hbst [Hheight Hnonnull]].
  assert (Hnull : ~ avl_vvalid g NULL).
  { intro Hvalid. apply (Hnonnull NULL Hvalid). reflexivity. }
  unfold avl_reachable, avl_vvalid in *.
  destruct Hbst as [Htree Hleft Hright].
  eapply bt_path_from_invalid_excludes__mapping_refinement; eauto.
Qed.
Lemma avl_null_cursor_excludes_matching_key__mapping_refinement :
  forall g key x,
    avl_gvalid g -> avl_vvalid g x -> avl_key_of g x = key ->
    ~ avl_reachable g NULL x.
Proof. intros; eapply avl_null_cursor_excludes_matching_key__mapping_refinement__tree_valid; eauto using avl_gvalid_tree_valid. Qed.
Lemma avl_mapping_result_of_search_result__mapping_refinement :
  forall m g key ret,
    avl_mapping_refines_graph m g ->
    avl_search_result g key ret ->
    avl_mapping_search_result m key ret.
Proof.
  intros m g key ret Hmap Hresult.
  unfold avl_mapping_search_result.
  destruct Hresult as [[Hret Habsent]|[Hret [Hvalid Hkey]]].
  - rewrite Hret.
    unfold avl_ptr_of.
    destruct (m key) as [x|] eqn:Hlookup; [|reflexivity].
    assert (Hentry : avl_vvalid g x /\ avl_key_of g x = key).
    { apply (proj1 (Hmap key x)). exact Hlookup. }
    destruct Hentry as [Hvalid Hkey].
    exfalso. eapply Habsent; eauto.
  - assert (Hlookup : m key = Some ret).
    { apply (proj2 (Hmap key ret)). auto. }
    rewrite Hlookup. unfold avl_ptr_of. reflexivity.
Qed.
Lemma valid_NoDup_list_all__mapping_refinement :
  forall A (P : A -> Prop) (xs : list A),
    NoDup xs -> (forall x, In x xs -> P x) ->
    GraphLib.graph_basic.valid_NoDup_list P xs = xs.
Proof.
  intros A P xs. induction xs as [|a xs IH]; intros Hnd Hall; simpl.
  - reflexivity.
  - inversion Hnd as [|a' xs' Hnotin Htail].
    rewrite (IH Htail (fun x Hx => Hall x (or_intror Hx))).
    destruct (excluded_middle_informative (P a /\ ~ In a xs)) as [Hyes|Hno].
    + reflexivity.
    + exfalso. apply Hno. split.
      * apply Hall. now left.
      * intro Hin. apply Hnotin. exact Hin.
Qed.
Lemma avl_root_cursor_valid__mapping_refinement__tree_valid :
  forall g root key,
    avl_tree_valid g -> root = avl_ptr_of (avl_root g) ->
    avl_search_cursor_valid g root key.
Proof.
  intros g root key Hg Hroot x Hx Hkey.
  unfold avl_search_cursor_valid, avl_reachable, avl_vvalid in *.
  unfold avl_tree_valid in Hg. destruct Hg as [Hbst [Hheight Hnonnull]].
  destruct Hbst as [Htree Hleft Hright].
  destruct (@GraphLib.examples.bst.path_exists addr
    (GraphLib.examples.bst.bst_tree (avl_bst g)) Htree x Hx)
    as [r [Hr Hpath]].
  unfold avl_root in Hroot. rewrite Hr in Hroot.
  simpl avl_ptr_of in Hroot. subst root. exact Hpath.
Qed.
Lemma avl_root_cursor_valid__mapping_refinement :
  forall g root key,
    avl_gvalid g -> root = avl_ptr_of (avl_root g) ->
    avl_search_cursor_valid g root key.
Proof. intros; eapply avl_root_cursor_valid__mapping_refinement__tree_valid; eauto using avl_gvalid_tree_valid. Qed.
Lemma avl_subtree_nodes_root_eq__mapping_refinement__tree_valid :
  forall g root,
    avl_tree_valid g -> root = avl_ptr_of (avl_root g) ->
    avl_subtree_nodes g root = avl_nodes g.
Proof.
  intros g root Hg Hroot.
  unfold avl_subtree_nodes, avl_nodes.
  apply valid_NoDup_list_all__mapping_refinement.
  - unfold avl_tree_valid in Hg. destruct Hg as [Hbst [Hheight Hnonnull]].
    destruct Hbst as [Htree Hleft Hright].
    exact (@GraphLib.examples.bst.listV_NoDup addr (GraphLib.examples.bst.bst_tree (avl_bst g)) Htree).
  - intros x Hin.
    assert (Hcursor : avl_search_cursor_valid g root (avl_key_of g x)).
    { eapply avl_root_cursor_valid__mapping_refinement__tree_valid; eauto. }
    unfold avl_tree_valid in Hg. destruct Hg as [Hbst [Hheight Hnonnull]].
    destruct Hbst as [Htree Hleft Hright].
    apply Hcursor.
    + unfold avl_vvalid. apply (@GraphLib.examples.bst.listV_sound addr
      (GraphLib.examples.bst.bst_tree (avl_bst g)) Htree x Hin).
    + reflexivity.
Qed.
Lemma avl_subtree_nodes_root_eq__mapping_refinement :
  forall g root,
    avl_gvalid g -> root = avl_ptr_of (avl_root g) ->
    avl_subtree_nodes g root = avl_nodes g.
Proof. intros; eapply avl_subtree_nodes_root_eq__mapping_refinement__tree_valid; eauto using avl_gvalid_tree_valid. Qed.

Lemma avl_graph_node_store_facts__graph_store_decomposition :
  forall g x,
    avl_graph_node_store g x |--
      “ avl_vvalid g x /\ x <> NULL /\
        INT_MIN <= avl_key_of g x <= INT_MAX /\
        0 <= avl_height_of g x <= UINT_MAX ”.
Proof.
  intros g x. unfold avl_graph_node_store. entailer!.
Qed.

Lemma avl_root_rep_to_subtree_store__mapping_refinement :
  forall g root,
    avl_gvalid g -> root = avl_ptr_of (avl_root g) ->
    avl_rep g |-- avl_subtree_store_at g root.
Proof.
  intros g root Hg Hroot.
  unfold avl_rep, avl_subtree_store_at.
  Intros_p Hvalid.
  rewrite (avl_subtree_nodes_root_eq__mapping_refinement g root Hg Hroot).
  entailer!.
  - intros Hnonnull.
    destruct (avl_root g) as [r|] eqn:Hr; simpl avl_ptr_of in Hroot.
    + subst root. unfold avl_vvalid, avl_root in *.
      destruct Hg as [[Htree _ _] _].
      exact (GraphLib.examples.bst.root_valid
        (GraphLib.examples.bst.bst_tree (avl_bst g)) Htree r Hr).
    + contradiction.
Qed.
Lemma avl_subtree_store_to_root_rep__mapping_refinement :
  forall g root,
    avl_gvalid g -> root = avl_ptr_of (avl_root g) ->
    avl_subtree_store_at g root |-- avl_rep g.
Proof.
  intros g root Hg Hroot.
  unfold avl_subtree_store_at, avl_rep.
  Intros_p Hvalid.
  rewrite (avl_subtree_nodes_root_eq__mapping_refinement g root Hg Hroot).
  entailer!.
Qed.

Lemma avl_root_tree_store_to_subtree_store :
  forall g root,
    avl_tree_valid g -> root = avl_ptr_of (avl_root g) ->
    avl_tree_store g |-- avl_subtree_store_at g root.
Proof.
  intros g root Hg Hroot. unfold avl_subtree_store_at.
  rewrite (avl_subtree_nodes_root_eq__mapping_refinement__tree_valid g root Hg Hroot).
  entailer!.
  intros Hnonnull.
  destruct (avl_root g) as [r|] eqn:Hr; simpl avl_ptr_of in Hroot.
  - subst root. unfold avl_vvalid, avl_root in *.
    destruct Hg as [[Htree _ _] _].
    exact (GraphLib.examples.bst.root_valid _ Htree r Hr).
  - contradiction.
Qed.
Lemma avl_subtree_store_to_root_tree_store :
  forall g root,
    avl_tree_valid g -> root = avl_ptr_of (avl_root g) ->
    avl_subtree_store_at g root |-- avl_tree_store g.
Proof.
  intros g root Hg Hroot. unfold avl_subtree_store_at.
  Intros_p Hvalid.
  rewrite (avl_subtree_nodes_root_eq__mapping_refinement__tree_valid g root Hg Hroot).
  entailer!.
Qed.

(** Empty public roots denote the empty abstract map and own no nodes. *)
Lemma avl_root_ptr_null_iff__mapping_refinement__tree_valid :
  forall g, avl_tree_valid g ->
    avl_ptr_of (avl_root g) = NULL <-> avl_root g = None.
Proof.
  intros g Hg. destruct (avl_root g) as [r|] eqn:Hr; simpl.
  - split; intro H; [|discriminate].
    assert (Hv : avl_vvalid g r).
    { destruct Hg as [[Ht _ _] _].
      exact (GraphLib.examples.bst.root_valid _ Ht r Hr). }
    exfalso. exact (proj2 (proj2 Hg) r Hv H).
  - split; reflexivity.
Qed.
Lemma avl_root_ptr_null_iff__mapping_refinement :
  forall g, avl_gvalid g ->
    avl_ptr_of (avl_root g) = NULL <-> avl_root g = None.
Proof. intros; eapply avl_root_ptr_null_iff__mapping_refinement__tree_valid; eauto using avl_gvalid_tree_valid. Qed.

Lemma avl_empty_root_nodes__mapping_refinement__tree_valid :
  forall g, avl_tree_valid g -> avl_root g = None -> avl_nodes g = nil.
Proof.
  intros g Hg Hr.
  unfold avl_nodes.
  destruct Hg as [[Ht _ _] _].
  pose proof (GraphLib.examples.bst.valid_empty_tree _ Ht Hr) as He.
  rewrite He. reflexivity.
Qed.
Lemma avl_empty_root_nodes__mapping_refinement :
  forall g, avl_gvalid g -> avl_root g = None -> avl_nodes g = nil.
Proof. intros; eapply avl_empty_root_nodes__mapping_refinement__tree_valid; eauto using avl_gvalid_tree_valid. Qed.

Lemma avl_empty_root_lookup__mapping_refinement__tree_valid :
  forall m g key, avl_tree_valid g -> avl_root g = None ->
    avl_mapping_refines_graph m g -> m key = None.
Proof.
  intros m g key Hg Hr Hmap.
  destruct (m key) as [x|] eqn:Hlookup; [|reflexivity].
  destruct (proj1 (Hmap key x) Hlookup) as [Hv Hkey].
  destruct Hg as [[Ht _ _] _].
  destruct (GraphLib.examples.bst.path_exists _ Ht x Hv) as [r [Hroot Hpath]].
  unfold avl_root in Hr. rewrite Hr in Hroot. discriminate.
Qed.
Lemma avl_empty_root_lookup__mapping_refinement :
  forall m g key, avl_gvalid g -> avl_root g = None ->
    avl_mapping_refines_graph m g -> m key = None.
Proof. intros; eapply avl_empty_root_lookup__mapping_refinement__tree_valid; eauto using avl_gvalid_tree_valid. Qed.

Lemma avl_mapping_null_root_result__mapping_refinement :
  forall m key,
    avl_mapping_root_rep m NULL |--
    “ avl_mapping_search_result m key NULL ” && emp.
Proof.
  intros m key. unfold avl_mapping_root_rep.
  Intros g. destruct H as [Hg [Hr Hmap]].
  assert (Hnone : avl_root g = None).
  { apply (proj1 (avl_root_ptr_null_iff__mapping_refinement__tree_valid g Hg)).
    symmetry. exact Hr. }
  pose proof (avl_empty_root_lookup__mapping_refinement__tree_valid m g key Hg Hnone Hmap) as Hlookup.
  unfold avl_rep, avl_tree_store.
  rewrite (avl_empty_root_nodes__mapping_refinement__tree_valid g Hg Hnone).
  rewrite avl_graph_nodes_store_nil__graph_store_decomposition.
  split_pure_spatial.
  - cancel.
  - dump_pre_spatial. unfold avl_mapping_search_result. rewrite Hlookup. reflexivity.
Qed.

Lemma avl_empty_mapping_root_rep__mapping_refinement :
  emp |-- avl_mapping_root_rep (fun _ => None) NULL.
Proof.
  set (g := {| avl_bst :=
    {| GraphLib.examples.bst.bst_tree := @GraphLib.examples.bst.empty_tree addr;
       GraphLib.examples.bst.bst_key := fun _ => 0 |};
    avl_height_of := fun _ => 0 |}).
  assert (Hnov : forall x, ~ avl_vvalid g x).
  { intros x Hx. exact Hx. }
  assert (Hg : avl_tree_valid g).
  { split.
    - apply GraphLib.examples.bst.empty_bst_valid. reflexivity.
    - split.
      + intros x Hx. contradiction (Hnov x Hx).
      + intros x Hx; contradiction (Hnov x Hx). }
  assert (Hmap : avl_mapping_refines_graph (fun _ => None) g).
  { intros key x. split; intro H.
    - discriminate.
    - destruct H as [Hx _]. contradiction (Hnov x Hx). }
  unfold avl_mapping_root_rep. Exists g.
  split_pure_spatial.
  - unfold avl_rep, avl_tree_store.
    change (emp |-- avl_graph_nodes_store g nil).
    rewrite avl_graph_nodes_store_nil__graph_store_decomposition.
    cancel.
  - dump_pre_spatial. split; [exact Hg|].
    split; [reflexivity | exact Hmap].
Qed.

Lemma avl_graph_nodes_store_extract__root_and_factor_setup :
  forall g x,
    avl_bst_valid g -> avl_root g = Some x ->
    avl_graph_nodes_store g (avl_nodes g) |--
      avl_graph_node_store g x **
      avl_graph_nodes_store g (avl_nodes_without g x).
Proof.
  intros g x Hbst Hroot.
  unfold avl_bst_valid in Hbst.
  destruct Hbst as [Htree Hleft Hright].
  unfold avl_nodes, avl_root in Hroot |- *.
  set (t := GraphLib.examples.bst.bst_tree (avl_bst g)) in *.
  assert (Hin : In x t.(GraphLib.examples.bst.listV)).
  { eapply GraphLib.examples.bst.finite_vertices.
    - exact Htree.
    - eapply GraphLib.examples.bst.root_valid; eauto. }
  assert (Hnd : NoDup t.(GraphLib.examples.bst.listV)).
  { eapply GraphLib.examples.bst.listV_NoDup; eauto. }
  assert (Hsubset0 : forall l y,
      In y (remove addr_dec x l) -> In y l).
  { induction l as [| a l IH]; intros y Hy; [contradiction|].
    simpl in Hy. destruct (addr_dec x a) as [Heq | Hneq].
    - subst a. simpl in Hy. destruct (addr_dec x x); [right; apply IH; exact Hy | contradiction].
    - destruct Hy as [Hy | Hy].
      + left; exact Hy.
      + right; apply IH; exact Hy. }
  assert (Hinsert0 : forall l y,
      y <> x -> In y l -> In y (remove addr_dec x l)).
  { induction l as [| a l IH]; intros y Hneq Hy; [contradiction|].
    simpl. destruct (addr_dec x a) as [Heq | Hnot].
    - subst a. simpl. destruct (addr_dec x x); [| contradiction].
      destruct Hy as [Hy | Hy].
      + subst y; contradiction.
      + apply IH; assumption.
    - simpl. destruct Hy as [Hy | Hy].
      + left; exact Hy.
      + right; apply IH; assumption. }
  assert (Hremove_nodup : forall l, NoDup l -> NoDup (remove addr_dec x l)).
  { intros l Hl. induction Hl as [| a l Hnot Htail IH].
    - simpl; constructor.
    - simpl. destruct (addr_dec x a) as [Heq | Hneq].
      + subst a. destruct (addr_dec x x); [exact IH | contradiction].
      + assert (Hneq' : a <> x) by congruence.
        constructor.
        * intro Ha. apply Hnot. eapply Hsubset0. exact Ha.
        * exact IH. }
  assert (Hrem : NoDup (remove addr_dec x t.(GraphLib.examples.bst.listV))).
  { apply Hremove_nodup. exact Hnd. }
  assert (Hperm : Permutation t.(GraphLib.examples.bst.listV)
      (x :: remove addr_dec x t.(GraphLib.examples.bst.listV))).
  { apply NoDup_Permutation.
    - exact Hnd.
    - constructor.
      + apply remove_In.
      + exact Hrem.
    - intro y. split.
      + intro Hy. destruct (addr_dec y x) as [Heq | Hneq].
        * subst y. left; reflexivity.
        * right. apply Hinsert0; assumption.
      + simpl. intros [Hy | Hy].
        * subst y. exact Hin.
        * eapply Hsubset0; exact Hy. }
  rewrite (avl_graph_nodes_store_permutation__graph_store_decomposition
    g _ _ Hperm).
  rewrite avl_graph_nodes_store_cons__graph_store_decomposition.
  reflexivity.
Qed.
Lemma avl_graph_child_valid__root_and_factor_setup :
  forall g parent child,
    avl_bst_valid g -> avl_vvalid g parent ->
    (avl_left g parent = Some child \/ avl_right g parent = Some child) ->
    avl_vvalid g child.
Proof.
  intros g parent child Hbst Hparent Hchild.
  unfold avl_bst_valid in Hbst. destruct Hbst as [Htree Hleft Hright].
  unfold avl_vvalid in *.
  eapply GraphLib.examples.bst.child_valid; eauto.
Qed.
Lemma avl_factor_positive_left_nonnull__rotation_argument_availability :
  forall g x factor,
    avl_balance_factor_input_valid g ->
    avl_balance_factor_or_null g x factor ->
    0 < factor ->
    avl_ptr_of (avl_left g x) <> 0.
Proof.
  intros g x factor Hvalid Hfactor Hpositive.
  destruct Hvalid as [_ [_ [Hvertices [Hchildren _]]]].
  unfold avl_balance_factor_or_null in Hfactor.
  destruct Hfactor as [[_ Hzero]|[_ [Hv [Heq _]]]].
  - subst factor. lia.
  - rewrite Heq in Hpositive.
    assert (Hgt : avl_model_balance_factor g x > 0) by lia.
    destruct (Hchildren x Hv) as [Hleft _].
    destruct (Hleft Hgt) as [child [Hchild Hvchild]].
    unfold avl_ptr_of. rewrite Hchild.
    apply Hvertices. exact Hvchild.
Qed.
Lemma avl_factor_negative_right_nonnull__rotation_argument_availability :
  forall g x factor,
    avl_balance_factor_input_valid g ->
    avl_balance_factor_or_null g x factor ->
    factor < 0 ->
    avl_ptr_of (avl_right g x) <> 0.
Proof.
  intros g x factor Hvalid Hfactor Hnegative.
  destruct Hvalid as [_ [_ [Hvertices [Hchildren _]]]].
  unfold avl_balance_factor_or_null in Hfactor.
  destruct Hfactor as [[_ Hzero]|[_ [Hv [Heq _]]]].
  - subst factor. lia.
  - rewrite Heq in Hnegative.
    assert (Hlt : avl_model_balance_factor g x < 0) by lia.
    destruct (Hchildren x Hv) as [_ Hright].
    destruct (Hright Hlt) as [child [Hchild Hvchild]].
    unfold avl_ptr_of. rewrite Hchild.
    apply Hvertices. exact Hvchild.
Qed.
Lemma avl_model_balance_factor_null__rotation_result_contracts :
  forall g, avl_bst_valid g -> avl_vertices_nonnull g ->
    avl_model_balance_factor g NULL = 0.
Proof.
  intros g Hbst Hnonnull.
  assert (Hbad : ~ avl_vvalid g NULL).
  { intro Hv. specialize (Hnonnull NULL Hv). contradiction. }
  unfold avl_model_balance_factor, avl_child_height, avl_left, avl_right.
  pose proof (@GraphLib.examples.bst.invalid_child_is_none addr
    (GraphLib.examples.bst.bst_tree (avl_bst g))
    (GraphLib.examples.bst.bst_binary_tree (avl_bst g) Hbst)
    NULL Hbad) as [Hleft Hright].
  rewrite Hleft, Hright. reflexivity.
Qed.
Lemma avl_nodes_root_remove_permutation__null_unmatched_balanced_results :
  forall (xs : list addr) x,
    NoDup xs -> In x xs ->
    Permutation (x :: remove addr_dec x xs) xs.
Proof.
  intros xs x Hnd. revert x.
  induction Hnd as [|a l Hnot Hnd IH]; intros x Hin.
  - inversion Hin.
  - simpl in Hin. destruct Hin as [Heq|Hin].
    + subst a. simpl. destruct (addr_dec x x); [|contradiction].
      assert (Hrm : forall ys, ~ In x ys -> remove addr_dec x ys = ys).
      { intros ys Hno. induction ys as [|b ys IHys].
        - reflexivity.
        - simpl. destruct (addr_dec x b) as [Hxb|Hxb].
          + subst b. exfalso. apply Hno. now left.
          + f_equal. apply IHys. intro Hx. apply Hno. now right. }
      rewrite Hrm; [apply Permutation_refl|exact Hnot].
    + simpl. destruct (addr_dec x a) as [Heq|Hneq].
      * subst a. contradiction.
      * eapply Permutation_trans.
        -- apply perm_swap.
        -- apply perm_skip. apply IH. exact Hin.
Qed.
Lemma avl_root_store_reassemble__null_unmatched_balanced_results :
  forall g x,
    avl_bst_valid g -> avl_root g = Some x ->
    avl_graph_node_store g x ** avl_graph_nodes_store g (avl_nodes_without g x)
    |-- avl_tree_store g.
Proof.
  intros g x Hbst Hroot.
  unfold avl_tree_store, avl_nodes_without, avl_nodes.
  assert (Htree := Hbst). unfold avl_bst_valid in Htree.
  destruct Htree as [Hbinary Hleft Hright].
  assert (Hnd : NoDup ((GraphLib.examples.bst.bst_tree (avl_bst g)).(GraphLib.examples.bst.listV))).
  { apply (@GraphLib.examples.bst.listV_NoDup addr); exact Hbinary. }
  assert (Hin : In x ((GraphLib.examples.bst.bst_tree (avl_bst g)).(GraphLib.examples.bst.listV))).
  { apply (GraphLib.examples.bst.finite_vertices _ Hbinary).
    apply (GraphLib.examples.bst.root_valid _ Hbinary). exact Hroot. }
  pose proof (avl_nodes_root_remove_permutation__null_unmatched_balanced_results
    ((GraphLib.examples.bst.bst_tree (avl_bst g)).(GraphLib.examples.bst.listV)) x Hnd Hin) as Hp.
  rewrite <- (avl_graph_nodes_store_cons__graph_store_decomposition g x
    (remove addr_dec x ((GraphLib.examples.bst.bst_tree (avl_bst g)).(GraphLib.examples.bst.listV)))).
  rewrite (avl_graph_nodes_store_permutation__graph_store_decomposition g _ _ Hp).
  reflexivity.
Qed.
Lemma avl_null_balance_factor__null_unmatched_balanced_results :
  forall g,
    avl_balance_factor_input_valid g -> avl_model_balance_factor g NULL = 0.
Proof.
  intros g Hinput.
  unfold avl_balance_factor_input_valid in Hinput.
  destruct Hinput as [Hbst [Hheight [Hnonnull Hrest]]].
  unfold avl_bst_valid in Hbst.
  destruct Hbst as [Htree Hleft Hright].
  assert (Hbad : ~ GraphLib.examples.bst.bst_vvalid (avl_bst g) NULL).
  { intro Hv. apply Hnonnull in Hv. contradiction. }
  pose proof (@GraphLib.examples.bst.invalid_child_is_none addr
    (GraphLib.examples.bst.bst_tree (avl_bst g)) Htree NULL Hbad) as [Hl Hr].
  unfold avl_model_balance_factor, avl_child_height, avl_left, avl_right.
  rewrite Hl, Hr. reflexivity.
Qed.

Lemma avl_height_result_child_height__height_graph_recursion :
  forall g child h,
    avl_gvalid g ->
    (forall x, child = Some x -> avl_vvalid g x) ->
    avl_height_result g (avl_ptr_of child) h ->
    h = avl_child_height g child.
Proof.
  intros g [x|] h Hg Hchild Hresult.
  - simpl in Hresult.
    destruct Hresult as [[Hnull Hzero]|[y [Hcursor [Hy Hheight]]]].
    + destruct Hg as [_ [_ [_ Hnonnull]]].
      specialize (Hchild x eq_refl). rewrite Hnull in Hchild.
      specialize (Hnonnull NULL Hchild). contradiction.
    + subst y. simpl. exact Hheight.
  - simpl in Hresult.
    destruct Hresult as [[_ ->]|[y [Hcursor [Hy _]]]].
    + reflexivity.
    + destruct Hg as [_ [_ [_ Hnonnull]]].
      subst y. specialize (Hnonnull NULL Hy). contradiction.
Qed.
Lemma avl_subtree_store_valid_nonnull__height_graph_recursion :
  forall g x, x <> NULL ->
    avl_subtree_store_at g x |-- “ avl_vvalid g x ”.
Proof.
  intros g x Hx. unfold avl_subtree_store_at. entailer!.
Qed.

Lemma avl_subtree_invalid_path_empty__height_accessor :
  forall (g : avl_model) (x y : addr),
    avl_height_input_valid g ->
    ~ avl_vvalid g x ->
    avl_vvalid g y ->
    ~ avl_reachable g x y.
Proof.
  intros g x y Hg Hnx Hvy Hpath.
  unfold avl_reachable, GraphLib.examples.bst.bt_path in Hpath.
  destruct Hpath as [n Hn].
  destruct n.
  - unfold Rels.id in Hn. inversion Hn; subst. contradiction.
  - simpl in Hn. destruct Hn as [z [Hedge Htail]].
    unfold Sets.test1 in Hedge; simpl in Hedge.
    change (GraphLib.examples.bst.bt_child
      (GraphLib.examples.bst.bst_tree (avl_bst g)) x z) in Hedge.
    pose proof (proj1 Hg) as Hbst.
    pose proof (GraphLib.examples.bst.bst_binary_tree (avl_bst g) Hbst) as Htree.
    destruct (GraphLib.examples.bst.invalid_child_is_none
      (GraphLib.examples.bst.bst_tree (avl_bst g)) Htree x Hnx)
      as [Hleft Hright].
    destruct Hedge as [He | He].
    + unfold GraphLib.examples.bst.bt_child in He.
      rewrite Hleft in He. discriminate.
    + unfold GraphLib.examples.bst.bt_child in He.
      rewrite Hright in He. discriminate.
Qed.
Lemma avl_subtree_nodes_partition__height_accessor :
  forall (g : avl_model) (x : addr),
    avl_height_input_valid g -> avl_vvalid g x ->
    Permutation (avl_subtree_nodes g x)
      (x :: avl_subtree_nodes g (avl_ptr_of (avl_left g x)) ++
           avl_subtree_nodes g (avl_ptr_of (avl_right g x))).
Proof.
 intros g x Hg Hv.
 unfold avl_subtree_nodes.
 apply NoDup_Permutation.
 - apply GraphLib.graph_basic.valid_NoDup_list_NoDup.
 - apply NoDup_cons.
   + intro Hin. apply in_app_iff in Hin. destruct Hin as [Hin|Hin].
     * apply GraphLib.graph_basic.valid_NoDup_list_spec in Hin as [_ Hpath].
       destruct (avl_left g x) as [l|] eqn:Hleft.
       -- pose proof (proj1 Hg) as Hbst.
          pose proof (GraphLib.examples.bst.bst_binary_tree (avl_bst g) Hbst) as Htree.
          assert (Hsub : GraphLib.examples.bst.bt_left_subtree
              (GraphLib.examples.bst.bst_tree (avl_bst g)) x x).
          { unfold GraphLib.examples.bst.bt_left_subtree. exists l. split.
            - exact Hleft.
            - exact Hpath. }
          exact (GraphLib.examples.bst.bt_left_subtree_not_self
            (GraphLib.examples.bst.bst_tree (avl_bst g)) x Htree Hv Hsub).
       -- simpl in Hpath.
          assert (Hnull : ~ avl_vvalid g NULL).
          { pose proof Hg as Hgcopy. unfold avl_height_input_valid, avl_tree_valid in Hgcopy.
            destruct Hgcopy as [_ [_ Hnonnull]].
            intro Hnull. specialize (Hnonnull NULL Hnull). contradiction. }
          unfold avl_reachable, GraphLib.examples.bst.bt_path in Hpath.
          destruct Hpath as [n Hn]. destruct n.
          ++ unfold Rels.id in Hn; inversion Hn; subst; contradiction.
          ++ simpl in Hn; destruct Hn as [z [Hedge Htail]].
             unfold Sets.test1 in Hedge; simpl in Hedge.
             change (GraphLib.examples.bst.bt_child
               (GraphLib.examples.bst.bst_tree (avl_bst g)) NULL z) in Hedge.
             pose proof (proj1 Hg) as Hbst.
             pose proof (GraphLib.examples.bst.bst_binary_tree (avl_bst g) Hbst) as Htree.
             destruct (GraphLib.examples.bst.invalid_child_is_none
               (GraphLib.examples.bst.bst_tree (avl_bst g)) Htree NULL Hnull)
               as [Hleftnull Hrightnull].
             destruct Hedge as [He|He].
             ** unfold GraphLib.examples.bst.bt_child in He. rewrite Hleftnull in He. discriminate.
             ** unfold GraphLib.examples.bst.bt_child in He. rewrite Hrightnull in He. discriminate.
     * apply GraphLib.graph_basic.valid_NoDup_list_spec in Hin as [_ Hpath].
       destruct (avl_right g x) as [r|] eqn:Hright.
       -- pose proof (proj1 Hg) as Hbst.
          pose proof (GraphLib.examples.bst.bst_binary_tree (avl_bst g) Hbst) as Htree.
          assert (Hsub : GraphLib.examples.bst.bt_right_subtree
              (GraphLib.examples.bst.bst_tree (avl_bst g)) x x).
          { unfold GraphLib.examples.bst.bt_right_subtree. exists r. split.
            - exact Hright.
            - exact Hpath. }
          exact (GraphLib.examples.bst.bt_right_subtree_not_self
            (GraphLib.examples.bst.bst_tree (avl_bst g)) x Htree Hv Hsub).
       -- simpl in Hpath.
          assert (Hnull : ~ avl_vvalid g NULL).
          { pose proof Hg as Hgcopy. unfold avl_height_input_valid, avl_tree_valid in Hgcopy.
            destruct Hgcopy as [_ [_ Hnonnull]].
            intro Hnull. specialize (Hnonnull NULL Hnull). contradiction. }
          unfold avl_reachable, GraphLib.examples.bst.bt_path in Hpath.
          destruct Hpath as [n Hn]. destruct n.
          ++ unfold Rels.id in Hn; inversion Hn; subst; contradiction.
          ++ simpl in Hn; destruct Hn as [z [Hedge Htail]].
             unfold Sets.test1 in Hedge; simpl in Hedge.
             change (GraphLib.examples.bst.bt_child
               (GraphLib.examples.bst.bst_tree (avl_bst g)) NULL z) in Hedge.
             pose proof (proj1 Hg) as Hbst.
             pose proof (GraphLib.examples.bst.bst_binary_tree (avl_bst g) Hbst) as Htree.
             destruct (GraphLib.examples.bst.invalid_child_is_none
               (GraphLib.examples.bst.bst_tree (avl_bst g)) Htree NULL Hnull)
               as [Hleftnull Hrightnull].
             destruct Hedge as [He|He].
             ** unfold GraphLib.examples.bst.bt_child in He. rewrite Hleftnull in He. discriminate.
             ** unfold GraphLib.examples.bst.bt_child in He. rewrite Hrightnull in He. discriminate.
   + apply NoDup_app.
     * apply GraphLib.graph_basic.valid_NoDup_list_NoDup.
     * apply GraphLib.graph_basic.valid_NoDup_list_NoDup.
     * intros a Hlin Hrin.
       apply GraphLib.graph_basic.valid_NoDup_list_spec in Hlin as [HnodesL HpathL].
       apply GraphLib.graph_basic.valid_NoDup_list_spec in Hrin as [HnodesR HpathR].
       pose proof (proj1 Hg) as Hbst.
       assert (Hav : avl_vvalid g a).
       { apply (proj1 (GraphLib.examples.bst.bst_listV_spec (avl_bst g) a Hbst)).
         exact HnodesL. }
       destruct (avl_left g x) as [l|] eqn:Hleft;
       destruct (avl_right g x) as [r|] eqn:Hright.
       -- assert (HsubL : GraphLib.examples.bst.bt_left_subtree
              (GraphLib.examples.bst.bst_tree (avl_bst g)) x a).
          { unfold GraphLib.examples.bst.bt_left_subtree. exists l. split; [exact Hleft|exact HpathL]. }
          assert (HsubR : GraphLib.examples.bst.bt_right_subtree
              (GraphLib.examples.bst.bst_tree (avl_bst g)) x a).
          { unfold GraphLib.examples.bst.bt_right_subtree. exists r. split; [exact Hright|exact HpathR]. }
          pose proof (GraphLib.examples.bst.bst_left_order (avl_bst g) Hbst x a Hv HsubL) as Hlt1.
          pose proof (GraphLib.examples.bst.bst_right_order (avl_bst g) Hbst x a Hv HsubR) as Hlt2.
          unfold avl_key_of in Hlt1, Hlt2. lia.
       -- assert (Hnull : ~ avl_vvalid g NULL).
          { pose proof Hg as Hgcopy. unfold avl_height_input_valid, avl_tree_valid in Hgcopy.
            destruct Hgcopy as [_ [_ Hnonnull]].
            intro Hnull. specialize (Hnonnull NULL Hnull). contradiction. }
          simpl in HpathR.
          exact (avl_subtree_invalid_path_empty__height_accessor g NULL a Hg Hnull Hav HpathR).
       -- assert (Hnull : ~ avl_vvalid g NULL).
          { pose proof Hg as Hgcopy. unfold avl_height_input_valid, avl_tree_valid in Hgcopy.
            destruct Hgcopy as [_ [_ Hnonnull]].
            intro Hnull. specialize (Hnonnull NULL Hnull). contradiction. }
          simpl in HpathL.
          exact (avl_subtree_invalid_path_empty__height_accessor g NULL a Hg Hnull Hav HpathL).
       -- assert (Hnull : ~ avl_vvalid g NULL).
          { pose proof Hg as Hgcopy. unfold avl_height_input_valid, avl_tree_valid in Hgcopy.
            destruct Hgcopy as [_ [_ Hnonnull]].
            intro Hnull. specialize (Hnonnull NULL Hnull). contradiction. }
          simpl in HpathL.
          exact (avl_subtree_invalid_path_empty__height_accessor g NULL a Hg Hnull Hav HpathL).
 - intros a. split; intro Hin.
   + apply GraphLib.graph_basic.valid_NoDup_list_spec in Hin as [Hnodes Hpath].
     pose proof (avl_subtree_path_classify__graph_store_decomposition g x a Hpath) as Hcase.
     destruct Hcase as [->|[Hleftpath|Hrightpath]].
     * simpl. left; reflexivity.
     * right. apply in_app_iff. left.
       apply GraphLib.graph_basic.valid_NoDup_list_spec. split; assumption.
     * right. apply in_app_iff. right.
       apply GraphLib.graph_basic.valid_NoDup_list_spec. split; assumption.
   + simpl in Hin. destruct Hin as [Heq|Hin].
     * subst a. apply GraphLib.graph_basic.valid_NoDup_list_spec. split.
       -- apply (proj2 (GraphLib.examples.bst.bst_listV_spec (avl_bst g) x (proj1 Hg))). exact Hv.
       -- unfold avl_reachable, GraphLib.examples.bst.bt_path. exists 0%nat. simpl. reflexivity.
     * apply in_app_iff in Hin. destruct Hin as [HinL|HinR].
       -- apply GraphLib.graph_basic.valid_NoDup_list_spec in HinL as [Hnodes Hpath].
          destruct (avl_left g x) as [l|] eqn:Hleft.
          ++ apply GraphLib.graph_basic.valid_NoDup_list_spec. split; [exact Hnodes|].
             eapply avl_subtree_path_prepend__graph_store_decomposition.
             ** left; exact Hleft.
             ** exact Hpath.
          ++ assert (Hnull : ~ avl_vvalid g NULL).
             { pose proof Hg as Hgcopy. unfold avl_height_input_valid, avl_tree_valid in Hgcopy.
               destruct Hgcopy as [_ [_ Hnonnull]].
               intro Hnull. specialize (Hnonnull NULL Hnull). contradiction. }
             simpl in Hpath.
             assert (Ha : avl_vvalid g a).
             { apply (proj1 (GraphLib.examples.bst.bst_listV_spec (avl_bst g) a (proj1 Hg))). exact Hnodes. }
             exfalso. eapply (avl_subtree_invalid_path_empty__height_accessor g NULL a Hg Hnull Ha Hpath).
       -- apply GraphLib.graph_basic.valid_NoDup_list_spec in HinR as [Hnodes Hpath].
          destruct (avl_right g x) as [r|] eqn:Hright.
          ++ apply GraphLib.graph_basic.valid_NoDup_list_spec. split; [exact Hnodes|].
             eapply avl_subtree_path_prepend__graph_store_decomposition.
             ** right; exact Hright.
             ** exact Hpath.
          ++ assert (Hnull : ~ avl_vvalid g NULL).
             { pose proof Hg as Hgcopy. unfold avl_height_input_valid, avl_tree_valid in Hgcopy.
               destruct Hgcopy as [_ [_ Hnonnull]].
               intro Hnull. specialize (Hnonnull NULL Hnull). contradiction. }
             simpl in Hpath.
             assert (Ha : avl_vvalid g a).
             { apply (proj1 (GraphLib.examples.bst.bst_listV_spec (avl_bst g) a (proj1 Hg))). exact Hnodes. }
             exfalso. eapply (avl_subtree_invalid_path_empty__height_accessor g NULL a Hg Hnull Ha Hpath).
Qed.
Lemma avl_subtree_graph_store_decompose__height_accessor :
  forall g x,
    avl_height_input_valid g -> avl_vvalid g x ->
    avl_graph_nodes_store g (avl_subtree_nodes g x)
    |-- avl_graph_node_store g x **
        avl_graph_nodes_store g
          (avl_subtree_nodes g (avl_ptr_of (avl_left g x)) ++
           avl_subtree_nodes g (avl_ptr_of (avl_right g x))).
Proof.
  intros g x Hg Hv.
  rewrite (avl_graph_nodes_store_permutation__graph_store_decomposition g _ _
    (avl_subtree_nodes_partition__height_accessor g x Hg Hv)).
  rewrite avl_graph_nodes_store_cons__graph_store_decomposition.
  entailer!.
Qed.
Lemma avl_subtree_graph_store_fold__height_accessor :
  forall g x,
    avl_height_input_valid g -> avl_vvalid g x ->
    avl_graph_node_store g x **
      (avl_graph_nodes_store g (avl_subtree_nodes g (avl_ptr_of (avl_left g x))) **
       avl_graph_nodes_store g (avl_subtree_nodes g (avl_ptr_of (avl_right g x))))
    |-- avl_graph_nodes_store g (avl_subtree_nodes g x).
Proof.
  intros g x Hg Hv.
  assert (Hsingle : avl_graph_node_store g x |-- avl_graph_nodes_store g (x :: nil)).
  { pose proof (avl_graph_nodes_store_singleton__graph_store_decomposition g x) as Hs.
    destruct Hs as [_ Hs]. exact Hs. }
  pose proof (avl_subtree_nodes_partition__height_accessor g x Hg Hv) as Hp.
  pose proof (avl_graph_nodes_store_permutation__graph_store_decomposition g _ _ Hp) as Hstore.
  destruct Hstore as [_ Hback].
  sep_apply_l_atomic Hsingle.
  sep_apply_l_atomic (avl_graph_nodes_store_app__graph_store_decomposition g
    (avl_subtree_nodes g (avl_ptr_of (avl_left g x)))
    (avl_subtree_nodes g (avl_ptr_of (avl_right g x)))).
  sep_apply_l_atomic (avl_graph_nodes_store_app__graph_store_decomposition g
    (x :: nil)
    (avl_subtree_nodes g (avl_ptr_of (avl_left g x)) ++
     avl_subtree_nodes g (avl_ptr_of (avl_right g x)))).
  exact Hback.
Qed.
Lemma avl_subtree_store_fold__height_accessor :
  forall g x,
    avl_height_input_valid g -> x <> NULL -> avl_vvalid g x ->
    avl_graph_node_store g x **
      (avl_subtree_store_at g (avl_ptr_of (avl_left g x)) **
       avl_subtree_store_at g (avl_ptr_of (avl_right g x)))
    |-- avl_subtree_store_at g x.
Proof.
  intros g x Hg Hx Hv. unfold avl_subtree_store_at.
  entailer!.
  eapply avl_subtree_graph_store_fold__height_accessor; eauto.
Qed.
Lemma avl_left_child_nonnull_valid__height_accessor :
  forall g x,
    avl_height_input_valid g -> avl_vvalid g x ->
    avl_ptr_of (avl_left g x) <> NULL ->
    avl_vvalid g (avl_ptr_of (avl_left g x)).
Proof.
  intros g x Hg Hv Hnonnull.
  unfold avl_ptr_of, avl_left in *.
  destruct ((GraphLib.examples.bst.bst_tree (avl_bst g)).(GraphLib.examples.bst.left_child) x) as [l|] eqn:Hl; simpl in *.
  - exact (GraphLib.examples.bst.child_valid
      (GraphLib.examples.bst.bst_tree (avl_bst g))
      (GraphLib.examples.bst.bst_binary_tree (avl_bst g) (proj1 Hg))
      x l Hv (or_introl Hl)).
  - contradiction.
Qed.
Lemma avl_right_child_nonnull_valid__height_accessor :
  forall g x,
    avl_height_input_valid g -> avl_vvalid g x ->
    avl_ptr_of (avl_right g x) <> NULL ->
    avl_vvalid g (avl_ptr_of (avl_right g x)).
Proof.
  intros g x Hg Hv Hnonnull.
  unfold avl_ptr_of, avl_right in *.
  destruct ((GraphLib.examples.bst.bst_tree (avl_bst g)).(GraphLib.examples.bst.right_child) x) as [r|] eqn:Hr; simpl in *.
  - exact (GraphLib.examples.bst.child_valid
      (GraphLib.examples.bst.bst_tree (avl_bst g))
      (GraphLib.examples.bst.bst_binary_tree (avl_bst g) (proj1 Hg))
      x r Hv (or_intror Hr)).
  - contradiction.
Qed.
Lemma avl_subtree_store_decompose__height_accessor :
  forall g x,
    avl_height_input_valid g -> x <> NULL -> avl_vvalid g x ->
    avl_subtree_store_at g x
    |-- avl_graph_node_store g x **
        (avl_subtree_store_at g (avl_ptr_of (avl_left g x)) **
         avl_subtree_store_at g (avl_ptr_of (avl_right g x))).
Proof.
  intros g x Hg Hx Hv. unfold avl_subtree_store_at.
  entailer!.
  sep_apply_l_atomic (avl_subtree_graph_store_decompose__height_accessor g x Hg Hv).
  sep_apply_l_atomic (avl_graph_nodes_store_split__graph_store_decomposition g
    (avl_subtree_nodes g (avl_ptr_of (avl_left g x)))
    (avl_subtree_nodes g (avl_ptr_of (avl_right g x)))).
  all: entailer!.
  all: try (eapply avl_left_child_nonnull_valid__height_accessor; eauto).
  all: try (eapply avl_right_child_nonnull_valid__height_accessor; eauto).
Qed.

Lemma avl_height_result_child_height__left_rotation_graph_heights :
  forall g child h,
    avl_height_input_valid g ->
    (forall x, child = Some x -> avl_vvalid g x) ->
    avl_height_result g (avl_ptr_of child) h ->
    h = avl_child_height g child.
Proof.
  intros g [x|] h [_ [_ Hnonnull]] Hchild Hresult.
  - simpl in Hresult.
    destruct Hresult as [[Hnull _]|[y [Hcursor [_ Hheight]]]].
    + exfalso. apply (Hnonnull x (Hchild x eq_refl)). exact Hnull.
    + subst y. simpl. exact Hheight.
  - simpl in Hresult.
    destruct Hresult as [[_ ->]|[y [Hcursor [Hy _]]]].
    + reflexivity.
    + subst y. exfalso. exact (Hnonnull NULL Hy eq_refl).
Qed.
Lemma avl_left_rotation_domain_keys__left_rotation_graph_heights :
  forall before after root promoted z,
    avl_left_rotation_model before after root promoted ->
    avl_key_of after z = avl_key_of before z /\
    avl_nodes after = avl_nodes before /\
    (avl_vvalid after z <-> avl_vvalid before z).
Proof.
  intros before after root promoted z [_ [_ [Htree _]]].
  unfold avl_key_of, avl_nodes, avl_vvalid in *.
  rewrite Htree. simpl. repeat split; auto.
Qed.
Lemma avl_left_rotation_pivot_children__left_rotation_graph_heights :
  forall (before after : avl_model) root promoted,
    avl_height_input_valid before ->
    avl_left_rotation_model before after root promoted ->
    avl_left after promoted = Some root /\
    avl_right after promoted = avl_right before promoted /\
    avl_left after root = avl_left before root /\
    avl_right after root = avl_left before promoted.
Proof.
  intros before after root promoted Hinput [Hroot [Hright [Htree _]]].
  assert (Hbst := proj1 Hinput).
  pose proof (GraphLib.examples.bst.bst_binary_tree (avl_bst before) Hbst) as Ht.
  assert (Hroot2 :
    (GraphLib.examples.bst.bst_tree (avl_bst before)).(GraphLib.examples.bst.vset) root).
  { exact Hroot. }
  assert (Hright2 :
    (GraphLib.examples.bst.bst_tree (avl_bst before)).(GraphLib.examples.bst.right_child) root = Some promoted).
  { exact Hright. }
  assert (Hneq : root <> promoted).
  { intro Heq. subst promoted. eapply GraphLib.examples.bst.bt_child_no_self; eauto.
    right; exact Hright2. }
  pose proof (GraphLib.examples.bst.left_rotate_node_domain_sound Z.eq_dec
    (GraphLib.examples.bst.bst_tree (avl_bst before)) root promoted
    ((GraphLib.examples.bst.bst_tree (avl_bst before)).(GraphLib.examples.bst.listV))
    (GraphLib.examples.bst.binarytree_node_domain_from_gvalid _ Ht)
    Hroot2 Hright2 Hneq) as Hrot.
  pose proof (GraphLib.directed.binarytree.lrc_pivot_children _ _ _ _
    (GraphLib.directed.binarytree.lrnd_core_valid _ _ _ _ _ Hrot)) as Hchildren.
  unfold avl_left, avl_right in *.
  rewrite Htree. simpl. exact Hchildren.
Qed.
Lemma avl_height_uint_max_gt__left_rotation_graph_heights :
  forall a b h : Z,
    0 <= a <= INT_MAX -> 0 <= b <= INT_MAX ->
    a > b -> h = Z.max a b + 1 -> h <= UINT_MAX ->
    unsigned_last_nbits (unsigned_last_nbits a 32 + 1) 32 = h.
Proof.
  intros a b h Ha Hb Hgt -> Hupper.
  rewrite (unsigned_last_nbits_eq a 32) by lia.
  rewrite Z.max_l by lia.
  rewrite (unsigned_last_nbits_eq (a + 1) 32) by lia.
  reflexivity.
Qed.
Lemma avl_height_uint_max_le__left_rotation_graph_heights :
  forall a b h : Z,
    0 <= a <= INT_MAX -> 0 <= b <= INT_MAX ->
    a <= b -> h = Z.max a b + 1 -> h <= UINT_MAX ->
    unsigned_last_nbits (unsigned_last_nbits b 32 + 1) 32 = h.
Proof.
  intros a b h Ha Hb Hle -> Hupper.
  rewrite (unsigned_last_nbits_eq b 32) by lia.
  rewrite Z.max_r by lia.
  rewrite (unsigned_last_nbits_eq (b + 1) 32) by lia.
  reflexivity.
Qed.
Lemma avl_child_height_int_bound__left_rotation_graph_heights :
  forall g child,
    avl_height_input_valid g ->
    (forall x, child = Some x -> avl_vvalid g x) ->
    avl_height_int_result_safe g (avl_ptr_of child) ->
    0 <= avl_child_height g child <= INT_MAX.
Proof.
  intros g [x|] [Hbst [Hheight Hnonnull]] Hchild Hsafe.
  - simpl. specialize (Hchild x eq_refl).
    specialize (Hheight x Hchild) as [[Hlow _] _].
    unfold avl_height_int_result_safe in Hsafe.
    specialize (Hsafe (Hnonnull x Hchild)).
    unfold avl_ptr_of in Hsafe. simpl in Hsafe. lia.
  - simpl. lia.
Qed.
Lemma avl_left_rotation_other_children__left_rotation_graph_heights :
  forall before after root promoted z,
    avl_height_input_valid before -> avl_root before = Some root ->
    avl_vvalid before z -> z <> root -> z <> promoted ->
    avl_left_rotation_model before after root promoted ->
    avl_left after z = avl_left before z /\
    avl_right after z = avl_right before z.
Proof.
  intros before after root promoted z Hvalid Hroot Hz Hneqroot Hneqprom Hrot.
  destruct Hrot as [_ [_ [Htree _]]].
  pose proof (GraphLib.examples.bst.bst_binary_tree (avl_bst before) (proj1 Hvalid)) as Ht.
  pose proof (GraphLib.examples.bst.root_no_parents _ Ht z root Hroot) as [HnoL HnoR].
  assert (Hin : In z (GraphLib.examples.bst.listV (GraphLib.examples.bst.bst_tree (avl_bst before)))).
  { apply GraphLib.examples.bst.finite_vertices; assumption. }
  split.
  - unfold avl_left. rewrite Htree. simpl.
    unfold GraphLib.examples.bst.left_rotate_left_child.
    rewrite GraphLib.examples.bst.iter_override_in by exact Hin.
    unfold GraphLib.examples.bst.left_rotate_left_value,
      GraphLib.examples.bst.replace_child.
    destruct (Z.eq_dec z promoted); [contradiction|].
    destruct (Z.eq_dec z root); [contradiction|].
    assert (Hrep : forall c : option Z,
      c <> Some root ->
      (match c with Some v => if Z.eq_dec v root then Some promoted else Some v
      | None => None end) = c).
    { intros [v|] Hneq; simpl; [|reflexivity].
      destruct (Z.eq_dec v root) as [->|Hne]; [contradiction|reflexivity]. }
    apply Hrep. exact HnoL.
  - unfold avl_right. rewrite Htree. simpl.
    unfold GraphLib.examples.bst.left_rotate_right_child.
    rewrite GraphLib.examples.bst.iter_override_in by exact Hin.
    unfold GraphLib.examples.bst.left_rotate_right_value,
      GraphLib.examples.bst.replace_child.
    destruct (Z.eq_dec z root); [contradiction|].
    destruct (Z.eq_dec z promoted); [contradiction|].
    assert (Hrep : forall c : option Z,
      c <> Some root ->
      (match c with Some v => if Z.eq_dec v root then Some promoted else Some v
      | None => None end) = c).
    { intros [v|] Hneq; simpl; [|reflexivity].
      destruct (Z.eq_dec v root) as [->|Hne]; [contradiction|reflexivity]. }
    apply Hrep. exact HnoR.
Qed.
Lemma avl_left_rotation_old_root__left_rotation_graph_heights :
  forall before after root promoted,
    avl_height_input_valid before ->
    avl_left_rotation_model before after root promoted ->
    avl_root after = Some promoted ->
    avl_root before = Some root.
Proof.
  intros before after root promoted Hvalid [Hroot [Hright [Htree _]]] Hafter.
  pose proof (GraphLib.examples.bst.bst_binary_tree (avl_bst before) (proj1 Hvalid)) as Ht.
  assert (Hroot2 :
    (GraphLib.examples.bst.bst_tree (avl_bst before)).(GraphLib.examples.bst.vset) root).
  { exact Hroot. }
  assert (Hright2 :
    (GraphLib.examples.bst.bst_tree (avl_bst before)).(GraphLib.examples.bst.right_child) root = Some promoted).
  { exact Hright. }
  assert (Hneq : root <> promoted).
  { intro Heq. subst promoted. eapply GraphLib.examples.bst.bt_child_no_self; eauto.
    right; exact Hright2. }
  pose proof (GraphLib.examples.bst.left_rotate_node_domain_sound Z.eq_dec
    (GraphLib.examples.bst.bst_tree (avl_bst before)) root promoted
    ((GraphLib.examples.bst.bst_tree (avl_bst before)).(GraphLib.examples.bst.listV))
    (GraphLib.examples.bst.binarytree_node_domain_from_gvalid _ Ht)
    Hroot2 Hright2 Hneq) as Hrot.
  pose proof (GraphLib.directed.binarytree.lrc_root _ _ _ _
    (GraphLib.directed.binarytree.lrnd_core_valid _ _ _ _ _ Hrot))
    as [Hrootx [Hrootframe Hrootnone]].
  destruct (GraphLib.examples.bst.path_exists _ Ht root Hroot2)
    as [oldroot [Holdroot _]].
  destruct (Z.eq_dec root oldroot) as [Heq|Hneqold].
  - subst. exact Holdroot.
  - assert (Hsame : avl_root after = Some oldroot).
    { unfold avl_root. rewrite Htree. simpl.
      exact (Hrootframe oldroot Holdroot (fun E => Hneqold (eq_sym E))). }
    rewrite Hafter in Hsame. inversion Hsame; subst oldroot.
    pose proof (GraphLib.examples.bst.root_no_parents _ Ht root promoted Holdroot) as [_ Hno].
    contradiction.
Qed.
Lemma avl_left_rotation_nonpivot_store__left_rotation_graph_heights :
  forall before after root promoted z,
    avl_height_input_valid before -> avl_root before = Some root ->
    avl_vvalid before z -> z <> root -> z <> promoted ->
    avl_left_rotation_model before after root promoted ->
    avl_graph_node_store before z |-- avl_graph_node_store after z.
Proof.
  intros before after root promoted z Hinput Hroot Hz Hnzroot Hnzprom Hrot.
  pose proof (avl_left_rotation_domain_keys__left_rotation_graph_heights
    before after root promoted z Hrot) as [Hkey [_ Hviff]].
  pose proof (avl_left_rotation_other_children__left_rotation_graph_heights
    before after root promoted z Hinput Hroot Hz Hnzroot Hnzprom Hrot)
    as [Hleft Hright].
  destruct Hrot as [_ [_ [_ [_ [_ Hnonlocal]]]]].
  specialize (Hnonlocal z Hnzroot Hnzprom).
  unfold avl_graph_node_store.
  rewrite Hkey, Hnonlocal, Hleft, Hright.
  entailer!.
  apply (proj2 Hviff). exact Hz.
Qed.
Lemma avl_left_rotation_nonpivot_stores__left_rotation_graph_heights :
  forall before after root promoted xs,
    avl_height_input_valid before -> avl_root before = Some root ->
    avl_left_rotation_model before after root promoted ->
    Forall (fun z => avl_vvalid before z /\ z <> root /\ z <> promoted) xs ->
    avl_graph_nodes_store before xs |-- avl_graph_nodes_store after xs.
Proof.
  intros before after root promoted xs Hinput Hroot Hrot Hforall.
  induction Hforall as [|z xs [Hz [Hnzroot Hnzprom]] Hxs IH].
  - unfold avl_graph_nodes_store. simpl. entailer!.
  - rewrite !avl_graph_nodes_store_cons__graph_store_decomposition.
    sep_apply_l_atomic (avl_left_rotation_nonpivot_store__left_rotation_graph_heights
      before after root promoted z Hinput Hroot Hz Hnzroot Hnzprom Hrot).
    sep_apply_l_atomic IH.
    entailer!.
Qed.
Lemma avl_path_equiv_on_closed_region__left_rotation_graph_heights :
  forall (V : Type) (R R' : V -> V -> Prop) s,
    (forall a b, clos_refl_trans R s a -> (R a b <-> R' a b)) ->
    forall a b, clos_refl_trans R s a ->
      (clos_refl_trans R a b <-> clos_refl_trans R' a b).
Proof.
  intros V R R' s Hstep a b Hsa. split; intro Hab.
  - revert Hsa. induction_1n Hab.
    + reflexivity.
    + transitivity_1n a0.
      * apply (proj1 (Hstep _ _ Hsa)). exact H.
      * apply IHrt; [exact Hstep|].
        etransitivity; [exact Hsa|].
        transitivity_1n a0; [exact H|reflexivity].
  - revert Hsa. induction_1n Hab.
    + reflexivity.
    + transitivity_1n a0.
      * apply (proj2 (Hstep _ _ Hsa)). exact H.
      * apply IHrt; [exact Hstep|].
        etransitivity; [exact Hsa|].
        transitivity_1n a0.
        -- apply (proj2 (Hstep _ _ Hsa)). exact H.
        -- reflexivity.
Qed.
Lemma avl_left_rotation_subtree_path_equiv__left_rotation_graph_heights :
  forall before after root promoted s a b,
    avl_height_input_valid before -> avl_root before = Some root ->
    avl_left_rotation_model before after root promoted ->
    (forall z, avl_reachable before s z ->
      avl_vvalid before z /\ z <> root /\ z <> promoted) ->
    avl_reachable before s a ->
    (avl_reachable before a b <-> avl_reachable after a b).
Proof.
  intros before after root promoted s a b Hinput Hroot Hrot Havoid Hsa.
  pose proof Hrot as [_ [_ [Htree _]]].
  unfold avl_reachable, GraphLib.examples.bst.bt_path in Hsa |- *.
  rewrite Htree. simpl.
  apply (avl_path_equiv_on_closed_region__left_rotation_graph_heights
    addr
    (GraphLib.examples.bst.bt_child (GraphLib.examples.bst.bst_tree (avl_bst before)))
    (GraphLib.examples.bst.bt_child
      (GraphLib.examples.bst.left_rotate Z.eq_dec
        (GraphLib.examples.bst.bst_tree (avl_bst before)) root promoted))
    s); [|exact Hsa].
  intros u v Hsu.
  specialize (Havoid u Hsu) as [Hu [Hune_root Hune_promoted]].
  pose proof (avl_left_rotation_other_children__left_rotation_graph_heights
    before after root promoted u Hinput Hroot Hu Hune_root Hune_promoted Hrot)
    as [Hleft Hright].
  unfold avl_left, avl_right in Hleft, Hright.
  rewrite Htree in Hleft, Hright. simpl in Hleft, Hright.
  unfold GraphLib.examples.bst.bt_child.
  simpl. rewrite Hleft, Hright. reflexivity.
Qed.
Lemma avl_valid_NoDup_list_ext__left_rotation_graph_heights :
  forall (A : Type) (P Q : A -> Prop) l,
    (forall x, P x <-> Q x) ->
    GraphLib.graph_basic.valid_NoDup_list P l =
    GraphLib.graph_basic.valid_NoDup_list Q l.
Proof.
  intros A P Q l Heq. induction l as [|x xs IH].
  - reflexivity.
  - simpl. rewrite IH.
    destruct (excluded_middle_informative (P x /\
      ~ In x (GraphLib.graph_basic.valid_NoDup_list Q xs))) as [Hp|Hnp];
    destruct (excluded_middle_informative (Q x /\
      ~ In x (GraphLib.graph_basic.valid_NoDup_list Q xs))) as [Hq|Hnq];
    try reflexivity; exfalso; firstorder.
Qed.
Lemma avl_left_rotation_subtree_nodes_eq__left_rotation_graph_heights :
  forall before after root promoted s,
    avl_height_input_valid before -> avl_root before = Some root ->
    avl_left_rotation_model before after root promoted ->
    (forall z, avl_reachable before s z ->
      avl_vvalid before z /\ z <> root /\ z <> promoted) ->
    avl_subtree_nodes after s = avl_subtree_nodes before s.
Proof.
  intros before after root promoted s Hinput Hroot Hrot Havoid.
  pose proof (avl_left_rotation_domain_keys__left_rotation_graph_heights
    before after root promoted s Hrot) as [_ [Hnodes _]].
  unfold avl_subtree_nodes.
  rewrite Hnodes.
  apply avl_valid_NoDup_list_ext__left_rotation_graph_heights.
  intro z.
  pose proof (avl_left_rotation_subtree_path_equiv__left_rotation_graph_heights
    before after root promoted s s z Hinput Hroot Hrot Havoid) as Hpath.
  assert (Hself : avl_reachable before s s) by
    (unfold avl_reachable, GraphLib.examples.bst.bt_path; reflexivity).
  specialize (Hpath Hself). tauto.
Qed.
Lemma avl_subtree_nodes_null__left_rotation_graph_heights :
  forall g, avl_height_input_valid g -> avl_subtree_nodes g NULL = nil.
Proof.
  intros g Hinput.
  destruct (avl_subtree_nodes g NULL) as [|z xs] eqn:Hnodes; [reflexivity|].
  exfalso.
  assert (Hin : In z (avl_subtree_nodes g NULL)).
  { rewrite Hnodes. simpl. auto. }
  unfold avl_subtree_nodes in Hin.
  apply GraphLib.graph_basic.valid_NoDup_list_spec in Hin as [Hlist Hpath].
  assert (Hz : avl_vvalid g z).
  { apply (proj1 (GraphLib.examples.bst.bst_listV_spec (avl_bst g) z (proj1 Hinput))).
    exact Hlist. }
  assert (Hnull : ~ avl_vvalid g NULL).
  { intro Hbad. destruct Hinput as [_ [_ Hnonnull]].
    exact (Hnonnull NULL Hbad eq_refl). }
  eapply avl_subtree_invalid_path_empty__height_accessor; eauto.
Qed.
Lemma avl_left_rotation_subtree_store_transfer__left_rotation_graph_heights :
  forall before after root promoted s,
    avl_height_input_valid before -> avl_root before = Some root ->
    avl_left_rotation_model before after root promoted ->
    (forall z, avl_reachable before s z ->
      avl_vvalid before z /\ z <> root /\ z <> promoted) ->
    avl_subtree_store_at before s |-- avl_subtree_store_at after s.
Proof.
  intros before after root promoted s Hinput Hroot Hrot Havoid.
  assert (Hself : avl_reachable before s s) by
    (unfold avl_reachable, GraphLib.examples.bst.bt_path; reflexivity).
  pose proof (Havoid s Hself) as [Hsvalid [_ _]].
  pose proof (avl_left_rotation_domain_keys__left_rotation_graph_heights
    before after root promoted s Hrot) as [_ [_ Hviff]].
  assert (Hfor : Forall
    (fun z => avl_vvalid before z /\ z <> root /\ z <> promoted)
    (avl_subtree_nodes before s)).
  { apply Forall_forall. intros z Hz.
    unfold avl_subtree_nodes in Hz.
    apply GraphLib.graph_basic.valid_NoDup_list_spec in Hz as [_ Hzpath].
    exact (Havoid z Hzpath). }
  unfold avl_subtree_store_at.
  rewrite (avl_left_rotation_subtree_nodes_eq__left_rotation_graph_heights
    before after root promoted s Hinput Hroot Hrot Havoid).
  Intros_p Hguard.
  sep_apply_l_atomic (avl_left_rotation_nonpivot_stores__left_rotation_graph_heights
    before after root promoted (avl_subtree_nodes before s)
    Hinput Hroot Hrot Hfor).
  entailer!.
  intros Hnonnull. apply (proj2 Hviff). exact Hsvalid.
Qed.
Lemma avl_subtree_store_null__left_rotation_graph_heights :
  forall g,
    avl_height_input_valid g ->
    avl_subtree_store_at g NULL --||-- emp.
Proof.
  intros g Hinput.
  unfold avl_subtree_store_at.
  rewrite (avl_subtree_nodes_null__left_rotation_graph_heights g Hinput).
  rewrite avl_graph_nodes_store_nil__graph_store_decomposition.
  split; entailer!.
Qed.
Lemma avl_descendant_avoids_ancestors__left_rotation_graph_heights :
  forall g ancestor parent child z,
    avl_height_input_valid g -> avl_vvalid g ancestor ->
    (avl_left g ancestor = Some parent \/ avl_right g ancestor = Some parent) ->
    (avl_left g parent = Some child \/ avl_right g parent = Some child) ->
    avl_reachable g child z ->
    avl_vvalid g z /\ z <> parent /\ z <> ancestor.
Proof.
  intros g ancestor parent child z Hinput Hancestor Hedge1 Hedge2 Hpath.
  pose proof (GraphLib.examples.bst.bst_binary_tree (avl_bst g) (proj1 Hinput)) as Ht.
  assert (Hparent : avl_vvalid g parent).
  { apply (GraphLib.examples.bst.child_valid _ Ht ancestor parent Hancestor).
    exact Hedge1. }
  assert (Hchild : avl_vvalid g child).
  { apply (GraphLib.examples.bst.child_valid _ Ht parent child Hparent).
    exact Hedge2. }
  split.
  - exact (GraphLib.examples.bst.bt_path_end_valid_early _ child z Ht Hchild Hpath).
  - split.
    + intro Heq. subst z.
      eapply (GraphLib.examples.bst.bt_child_no_back_path _ parent child Ht Hparent Hedge2).
      exact Hpath.
    + intro Heq. subst z.
      eapply (GraphLib.examples.bst.bt_child_no_back_path _ ancestor parent Ht Hancestor Hedge1).
      eapply GraphLib.examples.bst.bt_path_trans.
      * unfold GraphLib.examples.bst.bt_path.
        transitivity_1n child; [exact Hedge2|reflexivity].
      * exact Hpath.
Qed.
Lemma avl_left_child_avoids_right_pivot__left_rotation_graph_heights :
  forall g root promoted child z,
    avl_height_input_valid g -> avl_vvalid g root ->
    avl_left g root = Some child -> avl_right g root = Some promoted ->
    avl_reachable g child z ->
    avl_vvalid g z /\ z <> root /\ z <> promoted.
Proof.
  intros g root promoted child z Hinput Hroot Hleft Hright Hpath.
  pose proof (GraphLib.examples.bst.bst_binary_tree (avl_bst g) (proj1 Hinput)) as Ht.
  assert (Hchild : avl_vvalid g child).
  { apply (GraphLib.examples.bst.child_valid _ Ht root child Hroot).
    left; exact Hleft. }
  split.
  - exact (GraphLib.examples.bst.bt_path_end_valid_early _ child z Ht Hchild Hpath).
  - split.
    + intro Heq. subst z.
      eapply (GraphLib.examples.bst.bt_child_no_back_path _ root child Ht Hroot (or_introl Hleft)).
      exact Hpath.
    + intro Heq. subst z.
      assert (Hsubleft : GraphLib.examples.bst.bt_left_subtree
        (GraphLib.examples.bst.bst_tree (avl_bst g)) root promoted).
      { exists child. split; assumption. }
      assert (Hsubright : GraphLib.examples.bst.bt_right_subtree
        (GraphLib.examples.bst.bst_tree (avl_bst g)) root promoted).
      { exists promoted. split; [exact Hright|reflexivity]. }
      pose proof (GraphLib.examples.bst.bst_left_order (avl_bst g)
        (proj1 Hinput) root promoted Hroot Hsubleft) as Hlt.
      pose proof (GraphLib.examples.bst.bst_right_order (avl_bst g)
        (proj1 Hinput) root promoted Hroot Hsubright) as Hgt.
      lia.
Qed.
Lemma avl_left_rotation_child_store_transfer__left_rotation_graph_heights :
  forall before after root promoted child,
    avl_height_input_valid before -> avl_height_input_valid after ->
    avl_root before = Some root ->
    avl_left_rotation_model before after root promoted ->
    (forall x, child = Some x -> forall z, avl_reachable before x z ->
      avl_vvalid before z /\ z <> root /\ z <> promoted) ->
    avl_subtree_store_at before (avl_ptr_of child) |--
    avl_subtree_store_at after (avl_ptr_of child).
Proof.
  intros before after root promoted [x|] Hbefore Hafter Hroot Hrot Havoid.
  - simpl. eapply avl_left_rotation_subtree_store_transfer__left_rotation_graph_heights;
      eauto.
  - simpl.
    rewrite (avl_subtree_store_null__left_rotation_graph_heights before Hbefore).
    rewrite (avl_subtree_store_null__left_rotation_graph_heights after Hafter).
    entailer!.
Qed.
Lemma avl_left_rotation_root_node_store__left_rotation_graph_heights :
  forall before after root promoted cached,
    avl_height_input_valid before ->
    avl_left_rotation_model before after root promoted ->
    avl_vvalid before root -> root <> NULL ->
    INT_MIN <= avl_key_of before root <= INT_MAX ->
    0 <= avl_height_of after root <= UINT_MAX ->
    cached = avl_height_of after root ->
    (&(root # "AvlNode" ->ₛ "data") # Int |-> avl_key_of before root) **
    (&(root # "AvlNode" ->ₛ "height") # UInt |-> cached) **
    (&(root # "AvlNode" ->ₛ "left") # Ptr |-> avl_ptr_of (avl_left before root)) **
    (&(root # "AvlNode" ->ₛ "right") # Ptr |-> avl_ptr_of (avl_left before promoted))
    |-- avl_graph_node_store after root.
Proof.
  intros before after root promoted cached Hinput Hrot Hv Hnonnull Hkeybound Hhbound Hcached.
  pose proof (avl_left_rotation_domain_keys__left_rotation_graph_heights
    before after root promoted root Hrot) as [Hkey [_ Hviff]].
  pose proof (avl_left_rotation_pivot_children__left_rotation_graph_heights
    before after root promoted Hinput Hrot) as [_ [_ [Hleft Hright]]].
  unfold avl_graph_node_store.
  rewrite Hkey, Hleft, Hright.
  rewrite <- Hcached.
  entailer!.
  apply (proj2 Hviff). exact Hv.
Qed.
Lemma avl_left_rotate_demoted_store__left_rotation_graph_heights :
  forall before after root promoted cached,
    avl_height_input_valid before -> avl_height_input_valid after ->
    avl_root before = Some root ->
    avl_left_rotation_model before after root promoted ->
    root <> NULL -> INT_MIN <= avl_key_of before root <= INT_MAX ->
    0 <= avl_height_of after root <= UINT_MAX ->
    cached = avl_height_of after root ->
    avl_subtree_store_at before (avl_ptr_of (avl_left before promoted)) **
    avl_subtree_store_at before (avl_ptr_of (avl_left before root)) **
    (&(root # "AvlNode" ->ₛ "data") # Int |-> avl_key_of before root) **
    (&(root # "AvlNode" ->ₛ "height") # UInt |-> cached) **
    (&(root # "AvlNode" ->ₛ "left") # Ptr |-> avl_ptr_of (avl_left before root)) **
    (&(root # "AvlNode" ->ₛ "right") # Ptr |-> avl_ptr_of (avl_left before promoted))
    |-- avl_subtree_store_at after root.
Proof.
  intros before after root promoted cached Hbefore Hafter Hroot Hrot Hnonnull Hkeybound Hhbound Hcached.
  pose proof Hrot as [Hvroot [Hrightroot _]].
  pose proof (avl_left_rotation_domain_keys__left_rotation_graph_heights
    before after root promoted root Hrot) as [_ [_ Hviff]].
  assert (Hvafter : avl_vvalid after root) by (apply (proj2 Hviff); exact Hvroot).
  pose proof (avl_left_rotation_pivot_children__left_rotation_graph_heights
    before after root promoted Hbefore Hrot) as [_ [_ [Hleftroot Hrightroot_after]]].
  assert (HtransferA :
    avl_subtree_store_at before (avl_ptr_of (avl_left before root)) |--
    avl_subtree_store_at after (avl_ptr_of (avl_left before root))).
  { apply (avl_left_rotation_child_store_transfer__left_rotation_graph_heights
      before after root promoted (avl_left before root)
      Hbefore Hafter Hroot Hrot).
    intros x Hx z Hz.
    eapply avl_left_child_avoids_right_pivot__left_rotation_graph_heights;
      eauto. }
  assert (HtransferB :
    avl_subtree_store_at before (avl_ptr_of (avl_left before promoted)) |--
    avl_subtree_store_at after (avl_ptr_of (avl_left before promoted))).
  { apply (avl_left_rotation_child_store_transfer__left_rotation_graph_heights
      before after root promoted (avl_left before promoted)
      Hbefore Hafter Hroot Hrot).
    intros x Hx z Hz.
    destruct (avl_descendant_avoids_ancestors__left_rotation_graph_heights
      before root promoted x z Hbefore Hvroot
      (or_intror Hrightroot) (or_introl Hx) Hz) as [Hv [Hneprom Hneroot]].
    repeat split; assumption. }
  pose proof (avl_left_rotation_root_node_store__left_rotation_graph_heights
    before after root promoted cached Hbefore Hrot Hvroot Hnonnull
    Hkeybound Hhbound Hcached) as Hnode.
  pose proof (avl_subtree_store_fold__height_accessor
    after root Hafter Hnonnull Hvafter) as Hfold.
  rewrite Hleftroot, Hrightroot_after in Hfold.
  sep_apply_l_atomic HtransferB.
  sep_apply_l_atomic HtransferA.
  sep_apply_l_atomic Hnode.
  exact Hfold.
Qed.
Lemma avl_left_rotation_child_height_transfer__left_rotation_graph_heights :
  forall before after root promoted child,
    avl_left_rotation_model before after root promoted ->
    (forall x, child = Some x -> x <> root /\ x <> promoted) ->
    avl_child_height after child = avl_child_height before child.
Proof.
  intros before after root promoted [x|] Hrot Havoid.
  - unfold avl_child_height. simpl.
    destruct (Havoid x eq_refl) as [Hnr Hnp].
    destruct Hrot as [_ [_ [_ [_ [_ Hnonlocal]]]]].
    exact (Hnonlocal x Hnr Hnp).
  - reflexivity.
Qed.
Lemma avl_left_rotate_root_height_gt__left_rotation_graph_heights :
  forall before after root promoted a b,
  avl_height_input_valid before ->
  avl_left_rotation_model before after root promoted ->
  avl_height_result before (avl_ptr_of (avl_left before root)) a ->
  avl_height_result before (avl_ptr_of (avl_left before promoted)) b ->
  avl_height_int_result_safe before (avl_ptr_of (avl_left before root)) ->
  avl_height_int_result_safe before (avl_ptr_of (avl_left before promoted)) ->
  avl_height_of after root <= UINT_MAX ->
  unsigned_last_nbits a 32 > unsigned_last_nbits b 32 ->
  unsigned_last_nbits (unsigned_last_nbits a 32 + 1) 32 =
    avl_height_of after root.
Proof.
  intros before after root promoted a b Hinput Hrot HresA HresB HsafeA HsafeB Hupper Hcomp.
  pose proof Hrot as [Hvroot [Hrightroot [_ [Hrecompute _]]]].
  assert (Hvprom : avl_vvalid before promoted).
  { exact (avl_right_child_valid_from_bst__balance_input
      before root promoted (proj1 Hinput) Hvroot Hrightroot). }
  assert (HAvalid : forall x, avl_left before root = Some x -> avl_vvalid before x).
  { intros x Hx. exact (avl_left_child_valid_from_bst__balance_input
      before root x (proj1 Hinput) Hvroot Hx). }
  assert (HBvalid : forall x, avl_left before promoted = Some x -> avl_vvalid before x).
  { intros x Hx. exact (avl_left_child_valid_from_bst__balance_input
      before promoted x (proj1 Hinput) Hvprom Hx). }
  pose proof (avl_height_result_child_height__left_rotation_graph_heights
    before (avl_left before root) a Hinput HAvalid HresA) as Ha.
  pose proof (avl_height_result_child_height__left_rotation_graph_heights
    before (avl_left before promoted) b Hinput HBvalid HresB) as Hb.
  pose proof (avl_child_height_int_bound__left_rotation_graph_heights
    before (avl_left before root) Hinput HAvalid HsafeA) as HboundA.
  pose proof (avl_child_height_int_bound__left_rotation_graph_heights
    before (avl_left before promoted) Hinput HBvalid HsafeB) as HboundB.
  assert (HAavoid : forall x, avl_left before root = Some x -> x <> root /\ x <> promoted).
  { intros x Hx.
    pose proof (avl_left_child_avoids_right_pivot__left_rotation_graph_heights
      before root promoted x x Hinput Hvroot Hx Hrightroot) as Haway.
    assert (Hself : avl_reachable before x x) by
      (unfold avl_reachable, GraphLib.examples.bst.bt_path; reflexivity).
    exact (proj2 (Haway Hself)). }
  assert (HBavoid : forall x, avl_left before promoted = Some x -> x <> root /\ x <> promoted).
  { intros x Hx.
    pose proof (avl_descendant_avoids_ancestors__left_rotation_graph_heights
      before root promoted x x Hinput Hvroot
      (or_intror Hrightroot) (or_introl Hx)) as Haway.
    assert (Hself : avl_reachable before x x) by
      (unfold avl_reachable, GraphLib.examples.bst.bt_path; reflexivity).
    destruct (Haway Hself) as [_ [Hneprom Hneroot]].
    split; assumption. }
  pose proof (avl_left_rotation_child_height_transfer__left_rotation_graph_heights
    before after root promoted (avl_left before root) Hrot HAavoid) as HtransferA.
  pose proof (avl_left_rotation_child_height_transfer__left_rotation_graph_heights
    before after root promoted (avl_left before promoted) Hrot HBavoid) as HtransferB.
  pose proof (avl_left_rotation_pivot_children__left_rotation_graph_heights
    before after root promoted Hinput Hrot) as [_ [_ [Hleft Hright]]].
  unfold avl_recomputed_at in Hrecompute.
  rewrite Hleft, Hright, HtransferA, HtransferB in Hrecompute.
  rewrite <- Ha, <- Hb in Hrecompute.
  rewrite (unsigned_last_nbits_eq a 32) in Hcomp by lia.
  rewrite (unsigned_last_nbits_eq b 32) in Hcomp by lia.
  eapply avl_height_uint_max_gt__left_rotation_graph_heights; eauto; lia.
Qed.
Lemma avl_left_rotate_root_height_le__left_rotation_graph_heights :
  forall before after root promoted a b,
  avl_height_input_valid before ->
  avl_left_rotation_model before after root promoted ->
  avl_height_result before (avl_ptr_of (avl_left before root)) a ->
  avl_height_result before (avl_ptr_of (avl_left before promoted)) b ->
  avl_height_int_result_safe before (avl_ptr_of (avl_left before root)) ->
  avl_height_int_result_safe before (avl_ptr_of (avl_left before promoted)) ->
  avl_height_of after root <= UINT_MAX ->
  unsigned_last_nbits a 32 <= unsigned_last_nbits b 32 ->
  unsigned_last_nbits (unsigned_last_nbits b 32 + 1) 32 =
    avl_height_of after root.
Proof.
  intros before after root promoted a b Hinput Hrot HresA HresB HsafeA HsafeB Hupper Hcomp.
  pose proof Hrot as [Hvroot [Hrightroot [_ [Hrecompute _]]]].
  assert (Hvprom : avl_vvalid before promoted).
  { exact (avl_right_child_valid_from_bst__balance_input
      before root promoted (proj1 Hinput) Hvroot Hrightroot). }
  assert (HAvalid : forall x, avl_left before root = Some x -> avl_vvalid before x).
  { intros x Hx. exact (avl_left_child_valid_from_bst__balance_input
      before root x (proj1 Hinput) Hvroot Hx). }
  assert (HBvalid : forall x, avl_left before promoted = Some x -> avl_vvalid before x).
  { intros x Hx. exact (avl_left_child_valid_from_bst__balance_input
      before promoted x (proj1 Hinput) Hvprom Hx). }
  pose proof (avl_height_result_child_height__left_rotation_graph_heights
    before (avl_left before root) a Hinput HAvalid HresA) as Ha.
  pose proof (avl_height_result_child_height__left_rotation_graph_heights
    before (avl_left before promoted) b Hinput HBvalid HresB) as Hb.
  pose proof (avl_child_height_int_bound__left_rotation_graph_heights
    before (avl_left before root) Hinput HAvalid HsafeA) as HboundA.
  pose proof (avl_child_height_int_bound__left_rotation_graph_heights
    before (avl_left before promoted) Hinput HBvalid HsafeB) as HboundB.
  assert (HAavoid : forall x, avl_left before root = Some x -> x <> root /\ x <> promoted).
  { intros x Hx.
    pose proof (avl_left_child_avoids_right_pivot__left_rotation_graph_heights
      before root promoted x x Hinput Hvroot Hx Hrightroot) as Haway.
    assert (Hself : avl_reachable before x x) by
      (unfold avl_reachable, GraphLib.examples.bst.bt_path; reflexivity).
    exact (proj2 (Haway Hself)). }
  assert (HBavoid : forall x, avl_left before promoted = Some x -> x <> root /\ x <> promoted).
  { intros x Hx.
    pose proof (avl_descendant_avoids_ancestors__left_rotation_graph_heights
      before root promoted x x Hinput Hvroot
      (or_intror Hrightroot) (or_introl Hx)) as Haway.
    assert (Hself : avl_reachable before x x) by
      (unfold avl_reachable, GraphLib.examples.bst.bt_path; reflexivity).
    destruct (Haway Hself) as [_ [Hneprom Hneroot]].
    split; assumption. }
  pose proof (avl_left_rotation_child_height_transfer__left_rotation_graph_heights
    before after root promoted (avl_left before root) Hrot HAavoid) as HtransferA.
  pose proof (avl_left_rotation_child_height_transfer__left_rotation_graph_heights
    before after root promoted (avl_left before promoted) Hrot HBavoid) as HtransferB.
  pose proof (avl_left_rotation_pivot_children__left_rotation_graph_heights
    before after root promoted Hinput Hrot) as [_ [_ [Hleft Hright]]].
  unfold avl_recomputed_at in Hrecompute.
  rewrite Hleft, Hright, HtransferA, HtransferB in Hrecompute.
  rewrite <- Ha, <- Hb in Hrecompute.
  rewrite (unsigned_last_nbits_eq a 32) in Hcomp by lia.
  rewrite (unsigned_last_nbits_eq b 32) in Hcomp by lia.
  eapply avl_height_uint_max_le__left_rotation_graph_heights; eauto; lia.
Qed.
Lemma avl_root_subtree_nodes_eq__left_rotation_graph_heights :
  forall g root,
  avl_height_input_valid g -> avl_root g = Some root ->
  avl_subtree_nodes g root = avl_nodes g.
Proof.
  intros g root Hinput Hroot.
  unfold avl_subtree_nodes, avl_nodes.
  apply valid_NoDup_list_all__mapping_refinement.
  - apply GraphLib.examples.bst.listV_NoDup.
    exact (GraphLib.examples.bst.bst_binary_tree (avl_bst g) (proj1 Hinput)).
  - intros x Hin.
    pose proof (GraphLib.examples.bst.bst_binary_tree (avl_bst g) (proj1 Hinput)) as Ht.
    assert (Hx : avl_vvalid g x).
    { exact (GraphLib.examples.bst.listV_sound _ Ht x Hin). }
    destruct (GraphLib.examples.bst.path_exists _ Ht x Hx)
      as [r [Hr Hpath]].
    unfold avl_root in Hroot. rewrite Hroot in Hr. inversion Hr; subst r.
    exact Hpath.
Qed.
Lemma avl_left_rotation_promoted_node_store__left_rotation_graph_heights :
  forall before after root promoted cached,
  avl_height_input_valid before ->
  avl_left_rotation_model before after root promoted ->
  INT_MIN <= avl_key_of before promoted <= INT_MAX ->
  0 <= avl_height_of after promoted <= UINT_MAX ->
  cached = avl_height_of after promoted ->
  (&(promoted # "AvlNode" ->ₛ "data") # Int |-> avl_key_of before promoted) **
  (&(promoted # "AvlNode" ->ₛ "height") # UInt |-> cached) **
  (&(promoted # "AvlNode" ->ₛ "left") # Ptr |-> root) **
  (&(promoted # "AvlNode" ->ₛ "right") # Ptr |-> avl_ptr_of (avl_right before promoted))
  |-- avl_graph_node_store after promoted.
Proof.
  intros before after root promoted cached Hinput Hrot Hkeybound Hhbound Hcached.
  pose proof Hrot as [Hvroot [Hrightroot _]].
  assert (Hvprom : avl_vvalid before promoted).
  { exact (avl_right_child_valid_from_bst__balance_input
      before root promoted (proj1 Hinput) Hvroot Hrightroot). }
  assert (Hnonnull : promoted <> NULL).
  { exact (proj2 (proj2 Hinput) promoted Hvprom). }
  pose proof (avl_left_rotation_domain_keys__left_rotation_graph_heights
    before after root promoted promoted Hrot) as [Hkey [_ Hviff]].
  pose proof (avl_left_rotation_pivot_children__left_rotation_graph_heights
    before after root promoted Hinput Hrot) as [Hleft [Hright _]].
  unfold avl_graph_node_store.
  rewrite Hkey, Hleft, Hright.
  simpl avl_ptr_of.
  rewrite <- Hcached.
  entailer!.
  apply (proj2 Hviff). exact Hvprom.
Qed.
Lemma avl_left_rotate_promoted_tree__left_rotation_graph_heights :
  forall before after root promoted cached,
  avl_height_input_valid before -> avl_height_input_valid after ->
  avl_left_rotation_model before after root promoted ->
  avl_root after = Some promoted ->
  INT_MIN <= avl_key_of before promoted <= INT_MAX ->
  0 <= avl_height_of after promoted <= UINT_MAX ->
  cached = avl_height_of after promoted ->
  avl_subtree_store_at before (avl_ptr_of (avl_right before promoted)) **
  avl_subtree_store_at after root **
  (&(promoted # "AvlNode" ->ₛ "data") # Int |-> avl_key_of before promoted) **
  (&(promoted # "AvlNode" ->ₛ "height") # UInt |-> cached) **
  (&(promoted # "AvlNode" ->ₛ "left") # Ptr |-> root) **
  (&(promoted # "AvlNode" ->ₛ "right") # Ptr |-> avl_ptr_of (avl_right before promoted))
  |-- avl_tree_store after.
Proof.
  intros before after root promoted cached Hbefore Hafter Hrot Hrootafter Hkeybound Hhbound Hcached.
  pose proof Hrot as [Hvroot [Hrightroot _]].
  pose proof (avl_left_rotation_old_root__left_rotation_graph_heights
    before after root promoted Hbefore Hrot Hrootafter) as Hrootbefore.
  assert (Hvprom_before : avl_vvalid before promoted).
  { exact (avl_right_child_valid_from_bst__balance_input
      before root promoted (proj1 Hbefore) Hvroot Hrightroot). }
  assert (Hnonnull : promoted <> NULL).
  { exact (proj2 (proj2 Hbefore) promoted Hvprom_before). }
  pose proof (avl_left_rotation_domain_keys__left_rotation_graph_heights
    before after root promoted promoted Hrot) as [_ [_ Hviff]].
  assert (Hvprom_after : avl_vvalid after promoted).
  { apply (proj2 Hviff). exact Hvprom_before. }
  pose proof (avl_left_rotation_pivot_children__left_rotation_graph_heights
    before after root promoted Hbefore Hrot) as [Hleft [Hright _]].
  assert (HtransferC :
    avl_subtree_store_at before (avl_ptr_of (avl_right before promoted)) |--
    avl_subtree_store_at after (avl_ptr_of (avl_right before promoted))).
  { apply (avl_left_rotation_child_store_transfer__left_rotation_graph_heights
      before after root promoted (avl_right before promoted)
      Hbefore Hafter Hrootbefore Hrot).
    intros x Hx z Hz.
    destruct (avl_descendant_avoids_ancestors__left_rotation_graph_heights
      before root promoted x z Hbefore Hvroot
      (or_intror Hrightroot) (or_intror Hx) Hz) as [Hv [Hneprom Hneroot]].
    repeat split; assumption. }
  pose proof (avl_left_rotation_promoted_node_store__left_rotation_graph_heights
    before after root promoted cached Hbefore Hrot Hkeybound Hhbound Hcached) as Hnode.
  pose proof (avl_subtree_store_fold__height_accessor
    after promoted Hafter Hnonnull Hvprom_after) as Hfold.
  rewrite Hleft, Hright in Hfold. simpl avl_ptr_of in Hfold.
  assert (Htreefold : avl_subtree_store_at after promoted |-- avl_tree_store after).
  { unfold avl_subtree_store_at, avl_tree_store.
    rewrite (avl_root_subtree_nodes_eq__left_rotation_graph_heights
      after promoted Hafter Hrootafter).
    entailer!. }
  sep_apply_l_atomic HtransferC.
  sep_apply_l_atomic Hnode.
  assert (Hreorder :
    avl_graph_node_store after promoted **
      (avl_subtree_store_at after (avl_ptr_of (avl_right before promoted)) **
       avl_subtree_store_at after root)
    |-- avl_graph_node_store after promoted **
      (avl_subtree_store_at after root **
       avl_subtree_store_at after (avl_ptr_of (avl_right before promoted)))).
  { cancel. }
  intros m Hm.
  exact (Htreefold m (Hfold m (Hreorder m Hm))).
Qed.
Lemma avl_left_rotate_promoted_height_gt__left_rotation_graph_heights :
  forall before after root promoted a b,
  avl_height_input_valid before -> avl_height_input_valid after ->
  avl_left_rotation_model before after root promoted ->
  avl_height_result after root a ->
  avl_height_result before (avl_ptr_of (avl_right before promoted)) b ->
  avl_height_int_result_safe after root ->
  avl_height_int_result_safe before (avl_ptr_of (avl_right before promoted)) ->
  avl_height_of after promoted <= UINT_MAX ->
  unsigned_last_nbits a 32 > unsigned_last_nbits b 32 ->
  unsigned_last_nbits (unsigned_last_nbits a 32 + 1) 32 =
    avl_height_of after promoted.
Proof.
  intros before after root promoted a b Hbefore Hafter Hrot HresA HresB HsafeA HsafeB Hupper Hcomp.
  pose proof Hrot as [Hvroot [Hrightroot [_ [_ [Hrecompute _]]]]].
  assert (Hvprom : avl_vvalid before promoted).
  { exact (avl_right_child_valid_from_bst__balance_input
      before root promoted (proj1 Hbefore) Hvroot Hrightroot). }
  pose proof (avl_left_rotation_domain_keys__left_rotation_graph_heights
    before after root promoted root Hrot) as [_ [_ Hviff]].
  assert (Hvroot_after : avl_vvalid after root).
  { apply (proj2 Hviff). exact Hvroot. }
  assert (HAvalid : forall x, Some root = Some x -> avl_vvalid after x).
  { intros x Hx. inversion Hx; subst. exact Hvroot_after. }
  assert (HBvalid : forall x, avl_right before promoted = Some x -> avl_vvalid before x).
  { intros x Hx. exact (avl_right_child_valid_from_bst__balance_input
      before promoted x (proj1 Hbefore) Hvprom Hx). }
  assert (HresA' : avl_height_result after (avl_ptr_of (Some root)) a).
  { simpl. exact HresA. }
  pose proof (avl_height_result_child_height__left_rotation_graph_heights
    after (Some root) a Hafter HAvalid HresA') as Ha.
  pose proof (avl_height_result_child_height__left_rotation_graph_heights
    before (avl_right before promoted) b Hbefore HBvalid HresB) as Hb.
  assert (HsafeA' : avl_height_int_result_safe after (avl_ptr_of (Some root))).
  { simpl. exact HsafeA. }
  pose proof (avl_child_height_int_bound__left_rotation_graph_heights
    after (Some root) Hafter HAvalid HsafeA') as HboundA.
  pose proof (avl_child_height_int_bound__left_rotation_graph_heights
    before (avl_right before promoted) Hbefore HBvalid HsafeB) as HboundB.
  assert (HBavoid : forall x, avl_right before promoted = Some x -> x <> root /\ x <> promoted).
  { intros x Hx.
    pose proof (avl_descendant_avoids_ancestors__left_rotation_graph_heights
      before root promoted x x Hbefore Hvroot
      (or_intror Hrightroot) (or_intror Hx)) as Haway.
    assert (Hself : avl_reachable before x x) by
      (unfold avl_reachable, GraphLib.examples.bst.bt_path; reflexivity).
    destruct (Haway Hself) as [_ [Hneprom Hneroot]].
    split; assumption. }
  pose proof (avl_left_rotation_child_height_transfer__left_rotation_graph_heights
    before after root promoted (avl_right before promoted) Hrot HBavoid) as HtransferB.
  pose proof (avl_left_rotation_pivot_children__left_rotation_graph_heights
    before after root promoted Hbefore Hrot) as [Hleft [Hright _]].
  unfold avl_recomputed_at in Hrecompute.
  rewrite Hleft, Hright, HtransferB in Hrecompute.
  rewrite <- Ha, <- Hb in Hrecompute.
  rewrite (unsigned_last_nbits_eq a 32) in Hcomp by lia.
  rewrite (unsigned_last_nbits_eq b 32) in Hcomp by lia.
  eapply avl_height_uint_max_gt__left_rotation_graph_heights; eauto; lia.
Qed.
Lemma avl_left_rotate_promoted_height_le__left_rotation_graph_heights :
  forall before after root promoted a b,
  avl_height_input_valid before -> avl_height_input_valid after ->
  avl_left_rotation_model before after root promoted ->
  avl_height_result after root a ->
  avl_height_result before (avl_ptr_of (avl_right before promoted)) b ->
  avl_height_int_result_safe after root ->
  avl_height_int_result_safe before (avl_ptr_of (avl_right before promoted)) ->
  avl_height_of after promoted <= UINT_MAX ->
  unsigned_last_nbits a 32 <= unsigned_last_nbits b 32 ->
  unsigned_last_nbits (unsigned_last_nbits b 32 + 1) 32 =
    avl_height_of after promoted.
Proof.
  intros before after root promoted a b Hbefore Hafter Hrot HresA HresB HsafeA HsafeB Hupper Hcomp.
  pose proof Hrot as [Hvroot [Hrightroot [_ [_ [Hrecompute _]]]]].
  assert (Hvprom : avl_vvalid before promoted).
  { exact (avl_right_child_valid_from_bst__balance_input
      before root promoted (proj1 Hbefore) Hvroot Hrightroot). }
  pose proof (avl_left_rotation_domain_keys__left_rotation_graph_heights
    before after root promoted root Hrot) as [_ [_ Hviff]].
  assert (Hvroot_after : avl_vvalid after root).
  { apply (proj2 Hviff). exact Hvroot. }
  assert (HAvalid : forall x, Some root = Some x -> avl_vvalid after x).
  { intros x Hx. inversion Hx; subst. exact Hvroot_after. }
  assert (HBvalid : forall x, avl_right before promoted = Some x -> avl_vvalid before x).
  { intros x Hx. exact (avl_right_child_valid_from_bst__balance_input
      before promoted x (proj1 Hbefore) Hvprom Hx). }
  assert (HresA' : avl_height_result after (avl_ptr_of (Some root)) a).
  { simpl. exact HresA. }
  pose proof (avl_height_result_child_height__left_rotation_graph_heights
    after (Some root) a Hafter HAvalid HresA') as Ha.
  pose proof (avl_height_result_child_height__left_rotation_graph_heights
    before (avl_right before promoted) b Hbefore HBvalid HresB) as Hb.
  assert (HsafeA' : avl_height_int_result_safe after (avl_ptr_of (Some root))).
  { simpl. exact HsafeA. }
  pose proof (avl_child_height_int_bound__left_rotation_graph_heights
    after (Some root) Hafter HAvalid HsafeA') as HboundA.
  pose proof (avl_child_height_int_bound__left_rotation_graph_heights
    before (avl_right before promoted) Hbefore HBvalid HsafeB) as HboundB.
  assert (HBavoid : forall x, avl_right before promoted = Some x -> x <> root /\ x <> promoted).
  { intros x Hx.
    pose proof (avl_descendant_avoids_ancestors__left_rotation_graph_heights
      before root promoted x x Hbefore Hvroot
      (or_intror Hrightroot) (or_intror Hx)) as Haway.
    assert (Hself : avl_reachable before x x) by
      (unfold avl_reachable, GraphLib.examples.bst.bt_path; reflexivity).
    destruct (Haway Hself) as [_ [Hneprom Hneroot]].
    split; assumption. }
  pose proof (avl_left_rotation_child_height_transfer__left_rotation_graph_heights
    before after root promoted (avl_right before promoted) Hrot HBavoid) as HtransferB.
  pose proof (avl_left_rotation_pivot_children__left_rotation_graph_heights
    before after root promoted Hbefore Hrot) as [Hleft [Hright _]].
  unfold avl_recomputed_at in Hrecompute.
  rewrite Hleft, Hright, HtransferB in Hrecompute.
  rewrite <- Ha, <- Hb in Hrecompute.
  rewrite (unsigned_last_nbits_eq a 32) in Hcomp by lia.
  rewrite (unsigned_last_nbits_eq b 32) in Hcomp by lia.
  eapply avl_height_uint_max_le__left_rotation_graph_heights; eauto; lia.
Qed.

(** Caller-facing graph contract for one left rotation.  [g] is the owned
    subtree viewed as a standalone rooted graph; separation logic frames the
    enclosing nodes/resources.  The input mentions no candidate post graph.
    The input root height bounds every original descendant and the demoted
    root, which is read through the signed-int height helper. The promoted
    root may grow by one, still within the unsigned cache range. *)
Definition avl_left_rotation_input (g : avl_model) (root : addr) : Prop :=
  avl_height_input_valid g /\
  avl_root g = Some root /\
  avl_vvalid g root /\
  root <> NULL /\
  avl_ptr_of (avl_right g root) <> NULL /\
  avl_height_of g root <= INT_MAX.

(** Exact graph topology, node/key preservation and exact cached heights.
    A generic rotation does not promise that an arbitrary BST becomes AVL. *)
Definition avl_left_rotation_result
    (before after : avl_model) (root result : addr) : Prop :=
  result = avl_ptr_of (avl_right before root) /\
  result <> NULL /\
  avl_root after = Some result /\
  avl_left_rotation_model before after root result /\
  avl_height_input_valid after /\
  avl_nodes after = avl_nodes before /\
  (forall x, avl_key_of after x = avl_key_of before x).

(** The output graph is existential, so callers need only input facts. *)
Definition avl_left_rotation_post
    (before : avl_model) (root result : addr) : Assertion :=
  EX after,
    “ avl_left_rotation_result before after root result ” &&
    avl_tree_store after.

Lemma avl_child_nonnegative__left_rotation_graph_refinement :
  forall g z c, avl_height_input_valid g -> avl_vvalid g z ->
    (c = avl_left g z \/ c = avl_right g z) -> 0 <= avl_child_height g c.
Proof.
  intros g z [v|] [Hbst [Hheight Hnonnull]] Hz Hchild; simpl; [|lia].
  pose proof (GraphLib.examples.bst.bst_binary_tree _ Hbst) as Htree.
  assert (Hvalid : avl_vvalid g v).
  { eapply (GraphLib.examples.bst.child_valid _ Htree z v Hz).
    destruct Hchild; [left|right]; symmetry; assumption. }
  specialize (Hheight v Hvalid). lia.
Qed.
Lemma avl_root_rotation_child_bounds__left_rotation_graph_refinement :
  forall g x y, avl_left_rotation_input g x -> avl_right g x = Some y ->
    let a := avl_child_height g (avl_left g x) in
    let b := avl_child_height g (avl_left g y) in
    let c := avl_child_height g (avl_right g y) in
    0 <= a /\ 0 <= b /\ 0 <= c /\
    a <= INT_MAX /\ b <= INT_MAX /\ c <= INT_MAX /\
    1 <= Z.max a b + 1 <= avl_height_of g x /\
    1 <= Z.max (Z.max a b + 1) c + 1 <= UINT_MAX.
Proof.
  intros g x y [Hv [Hr [Hx [Hnx [Hny Hmax]]]]] Hxy; cbv zeta.
  pose proof (GraphLib.examples.bst.bst_binary_tree _ (proj1 Hv)) as Htree.
  assert (Hy : avl_vvalid g y).
  { eapply (GraphLib.examples.bst.child_valid _ Htree x y Hx). right; exact Hxy. }
  pose proof (avl_child_nonnegative__left_rotation_graph_refinement g x _ Hv Hx (or_introl eq_refl)) as Ha.
  pose proof (avl_child_nonnegative__left_rotation_graph_refinement g y _ Hv Hy (or_introl eq_refl)) as Hb.
  pose proof (avl_child_nonnegative__left_rotation_graph_refinement g y _ Hv Hy (or_intror eq_refl)) as Hc.
  pose proof (proj1 (proj2 Hv) x Hx) as [_ Hrootheight].
  pose proof (proj1 (proj2 Hv) y Hy) as [_ Hchildheight].
  rewrite Hxy in Hrootheight. simpl in Hrootheight.
  repeat split; lia.
Qed.
Lemma avl_path_to_root__left_rotation_graph_refinement :
  forall g x z, avl_height_input_valid g -> avl_root g = Some x ->
    avl_reachable g z x -> z = x.
Proof.
  intros g x z Hv Hr Hpath.
  pose proof (GraphLib.examples.bst.bst_binary_tree _ (proj1 Hv)) as Htree.
  unfold avl_reachable, GraphLib.examples.bst.bt_path in Hpath.
  induction_n1 Hpath.
  - reflexivity.
  - exfalso.
    match goal with Hedge : GraphLib.examples.bst.bt_child _ ?a x |- _ =>
      pose proof (GraphLib.examples.bst.root_no_parents _ Htree a x Hr) as [Hl Hright]
    end.
    destruct H; contradiction.
Qed.
Lemma avl_nonpivot_region__left_rotation_graph_refinement :
  forall g x y z q, avl_height_input_valid g -> avl_root g = Some x ->
    avl_vvalid g x -> avl_right g x = Some y ->
    avl_vvalid g z -> z <> x -> z <> y -> avl_reachable g z q ->
    avl_vvalid g q /\ q <> x /\ q <> y.
Proof.
  intros g x y z q Hv Hr Hx Hxy Hz Hzx Hzy Hpath.
  pose proof (GraphLib.examples.bst.bst_binary_tree _ (proj1 Hv)) as Htree.
  split.
  - eapply GraphLib.examples.bst.bt_path_end_valid_early; eauto.
  - split.
    + intro E; subst q. apply Hzx.
      eapply avl_path_to_root__left_rotation_graph_refinement; eauto.
    + intro E; subst q.
      unfold avl_reachable, GraphLib.examples.bst.bt_path in Hpath.
      induction_n1 Hpath.
      * contradiction.
      * match goal with Hedge : GraphLib.examples.bst.bt_child _ ?a y |- _ => rename a into last end.
        assert (Hlast : avl_vvalid g last).
        { eapply GraphLib.examples.bst.bt_path_end_valid_early; eauto. }
        assert (Elast : last = x).
        { eapply (GraphLib.examples.bst.father_unique _ Htree y last x); eauto. }
        subst last. apply Hzx.
        eapply avl_path_to_root__left_rotation_graph_refinement; eauto.
Qed.
Lemma avl_rotation_model_exists__left_rotation_graph_refinement :
  forall g x, avl_left_rotation_input g x ->
  exists after y, avl_right g x = Some y /\ avl_vvalid g y /\ y <> NULL /\
    avl_left_rotation_model g after x y /\ avl_root after = Some y /\
    avl_height_consistent after /\ avl_vertices_nonnull after /\
    avl_height_int_result_safe g (avl_ptr_of (avl_left g x)) /\
    avl_height_int_result_safe g (avl_ptr_of (avl_left g y)) /\
    avl_height_int_result_safe g (avl_ptr_of (avl_right g y)) /\
    avl_height_int_result_safe after x.
Proof.
  intros g x Hinput.
  destruct Hinput as [Hv [Hr [Hx [Hnx [Hny Hmax]]]]].
  destruct (avl_right g x) as [y|] eqn:Hxy; [|contradiction Hny; reflexivity].
  simpl in Hny.
  pose proof (GraphLib.examples.bst.bst_binary_tree _ (proj1 Hv)) as Htree.
  assert (Hy : avl_vvalid g y).
  { eapply (GraphLib.examples.bst.child_valid _ Htree x y Hx). right; exact Hxy. }
  assert (Hne : x <> y).
  { intro E; subst y. eapply GraphLib.examples.bst.bt_child_no_self; eauto.
    right; exact Hxy. }
  pose proof (avl_root_rotation_child_bounds__left_rotation_graph_refinement g x y
    (ltac:(unfold avl_left_rotation_input; rewrite Hxy; simpl; tauto)) Hxy) as Hbounds.
  cbv zeta in Hbounds.
  set (d := Z.max (avl_child_height g (avl_left g x)) (avl_child_height g (avl_left g y)) + 1).
  set (p := Z.max d (avl_child_height g (avl_right g y)) + 1).
  set (after := {| avl_bst := GraphLib.examples.bst.bst_with_tree (avl_bst g)
    (GraphLib.examples.bst.left_rotate Z.eq_dec (GraphLib.examples.bst.bst_tree (avl_bst g)) x y);
    avl_height_of := avl_height_update (avl_height_update (avl_height_of g) x d) y p |}).
  assert (Hax : avl_height_of after x = d).
  { unfold after, avl_height_update; simpl. destruct (Z.eq_dec x y); [contradiction|].
    destruct (Z.eq_dec x x); congruence. }
  assert (Hay : avl_height_of after y = p).
  { unfold after, avl_height_update; simpl. destruct (Z.eq_dec y y); congruence. }
  assert (Hother : avl_same_nonlocal_heights g after x y).
  { intros z Hzx Hzy. unfold after, avl_height_update; simpl.
    destruct (Z.eq_dec z y); [contradiction|]. destruct (Z.eq_dec z x); congruence. }
  pose proof (GraphLib.examples.bst.left_rotate_node_domain_sound Z.eq_dec
    (GraphLib.examples.bst.bst_tree (avl_bst g)) x y
    (GraphLib.examples.bst.listV (GraphLib.examples.bst.bst_tree (avl_bst g)))
    (GraphLib.examples.bst.binarytree_node_domain_from_gvalid _ Htree) Hx Hxy Hne) as Hrot.
  pose proof (GraphLib.directed.binarytree.lrc_pivot_children _ _ _ _
    (GraphLib.directed.binarytree.lrnd_core_valid _ _ _ _ _ Hrot)) as Hchildren.
  change (avl_left after y = Some x /\ avl_right after y = avl_right g y /\
    avl_left after x = avl_left g x /\ avl_right after x = avl_left g y) in Hchildren.
  destruct Hchildren as [Hly [Hry [Hlx Hrx]]].
  assert (Havoid : forall z c, avl_vvalid g z -> z <> x ->
    (avl_left g z = Some c \/ avl_right g z = Some c) -> c <> x /\ c <> y).
  { intros z c Hz Hzx Hzc. split.
    - intro E; subst c.
      pose proof (GraphLib.examples.bst.root_no_parents _ Htree z x Hr) as [Hl Hrr].
      destruct Hzc; contradiction.
    - intro E; subst c. apply Hzx.
      eapply (GraphLib.examples.bst.father_unique _ Htree y z x); eauto. }
  assert (Hclx : avl_child_height after (avl_left g x) = avl_child_height g (avl_left g x)).
  { destruct (avl_left g x) as [c|] eqn:Hc; simpl; [|reflexivity].
    apply Hother.
    - intro E; subst c. pose proof (GraphLib.examples.bst.root_no_parents _ Htree x x Hr); tauto.
    - intro E; subst c.
      exact (GraphLib.examples.bst.child_distinct _ Htree x y y Hx Hy Hy Hc Hxy eq_refl). }
  assert (Hchild : forall z c, avl_vvalid g z -> z <> x ->
    (c = avl_left g z \/ c = avl_right g z) -> avl_child_height after c = avl_child_height g c).
  { intros z [c|] Hz Hzx Hc; simpl; [|reflexivity].
    assert (Hedge : avl_left g z = Some c \/ avl_right g z = Some c).
    { destruct Hc; [left|right]; symmetry; assumption. }
    destruct (Havoid z c Hz Hzx Hedge) as [Hcx Hcy]. apply Hother; assumption. }
  assert (Hcly : avl_child_height after (avl_left g y) = avl_child_height g (avl_left g y)).
  { apply (Hchild y _ Hy); [congruence|left; reflexivity]. }
  assert (Hcry : avl_child_height after (avl_right g y) = avl_child_height g (avl_right g y)).
  { apply (Hchild y _ Hy); [congruence|right; reflexivity]. }
  assert (Hm : avl_left_rotation_model g after x y).
  { unfold avl_left_rotation_model. repeat split; try assumption; try reflexivity.
    - unfold avl_recomputed_at. rewrite Hax, Hlx, Hrx, Hclx, Hcly. reflexivity.
    - unfold avl_recomputed_at. rewrite Hay, Hly, Hry, Hcry.
      change (p = Z.max (avl_height_of after x) (avl_child_height g (avl_right g y)) + 1).
      rewrite Hax. reflexivity. }
  assert (Hroot : avl_root after = Some y).
  { exact (proj1 (GraphLib.directed.binarytree.lrc_root _ _ _ _
      (GraphLib.directed.binarytree.lrnd_core_valid _ _ _ _ _ Hrot)) Hr). }
  assert (Hheight : avl_height_consistent after).
  { intros z Hz. change (avl_vvalid g z) in Hz.
    destruct (Z.eq_dec z x) as [->|Hzx].
    - rewrite Hax. split; [unfold d; lia|]. rewrite Hlx, Hrx, Hclx, Hcly. reflexivity.
    - destruct (Z.eq_dec z y) as [->|Hzy].
      + rewrite Hay. split; [unfold p,d; lia|]. rewrite Hly, Hry, Hcry.
        change (p = Z.max (avl_height_of after x) (avl_child_height g (avl_right g y)) + 1).
        rewrite Hax. reflexivity.
      + pose proof (avl_left_rotation_other_children__left_rotation_graph_heights
          g after x y z Hv Hr Hz Hzx Hzy Hm) as [Hl Hrr].
        rewrite (Hother z Hzx Hzy), Hl, Hrr.
        rewrite (Hchild z _ Hz Hzx (or_introl eq_refl)), (Hchild z _ Hz Hzx (or_intror eq_refl)).
        exact (proj1 (proj2 Hv) z Hz). }
  exists after, y. split; [reflexivity|]. split; [exact Hy|].
  split; [exact Hny|]. split; [exact Hm|]. split; [exact Hroot|].
  split; [exact Hheight|]. split; [|split; [|split; [|split]]].
  - intros z Hz. apply (proj2 (proj2 Hv) z). exact Hz.
  - unfold avl_height_int_result_safe. destruct (avl_left g x) as [v|] eqn:Hc; simpl; intros Hnn; [|contradiction].
    pose proof Hbounds as [_ [_ [_ [Hbnd _]]]]. exact Hbnd.
  - unfold avl_height_int_result_safe. destruct (avl_left g y) as [v|] eqn:Hc; simpl; intros Hnn; [|contradiction].
    pose proof Hbounds as [_ [_ [_ [_ [Hbnd _]]]]]. exact Hbnd.
  - unfold avl_height_int_result_safe. destruct (avl_right g y) as [v|] eqn:Hc; simpl; intros Hnn; [|contradiction].
    pose proof Hbounds as [_ [_ [_ [_ [_ [Hbnd _]]]]]]. exact Hbnd.
  - unfold avl_height_int_result_safe. rewrite Hax. unfold d. intros. lia.
Qed.
Lemma avl_left_rotation_bst__left_rotation_graph_refinement :
  forall g after x y, avl_height_input_valid g -> avl_root g = Some x ->
    avl_left_rotation_model g after x y -> avl_bst_valid after.
Proof.
  intros g after x y Hv Hr Hm.
  pose proof Hm as [Hx [Hxy [Heq _]]].
  pose proof (GraphLib.examples.bst.bst_binary_tree _ (proj1 Hv)) as Htree.
  assert (Hy : avl_vvalid g y).
  { eapply (GraphLib.examples.bst.child_valid _ Htree x y Hx). right; exact Hxy. }
  pose proof (avl_left_rotation_pivot_children__left_rotation_graph_heights
    g after x y Hv Hm) as [Hly [Hry [Hlx Hrx]]].
  assert (Hkeys : forall z, avl_key_of after z = avl_key_of g z).
  { intros z; exact (proj1 (avl_left_rotation_domain_keys__left_rotation_graph_heights g after x y z Hm)). }
  assert (Horder : avl_key_of g x < avl_key_of g y).
  { apply (GraphLib.examples.bst.bst_right_order _ (proj1 Hv) x y Hx).
    exists y; split; [exact Hxy|reflexivity]. }
  assert (HL : forall c v, avl_left g x = Some c -> avl_reachable after c v ->
    GraphLib.examples.bst.bt_left_subtree (GraphLib.examples.bst.bst_tree (avl_bst g)) x v).
  { intros c v Hc Hp. exists c; split; [exact Hc|].
    unshelve eapply (proj2 (avl_left_rotation_subtree_path_equiv__left_rotation_graph_heights
      g after x y c c v Hv Hr Hm _ (ltac:(reflexivity)))).
    - intros z Hz. eapply avl_left_child_avoids_right_pivot__left_rotation_graph_heights; eauto.
    - exact Hp. }
  assert (HM : forall c v, avl_left g y = Some c -> avl_reachable after c v ->
    GraphLib.examples.bst.bt_left_subtree (GraphLib.examples.bst.bst_tree (avl_bst g)) y v).
  { intros c v Hc Hp. exists c; split; [exact Hc|].
    unshelve eapply (proj2 (avl_left_rotation_subtree_path_equiv__left_rotation_graph_heights
      g after x y c c v Hv Hr Hm _ (ltac:(reflexivity)))).
    - intros z Hz. pose proof (avl_descendant_avoids_ancestors__left_rotation_graph_heights
        g x y c z Hv Hx (or_intror Hxy) (or_introl Hc) Hz). tauto.
    - exact Hp. }
  assert (HR : forall c v, avl_right g y = Some c -> avl_reachable after c v ->
    GraphLib.examples.bst.bt_right_subtree (GraphLib.examples.bst.bst_tree (avl_bst g)) y v).
  { intros c v Hc Hp. exists c; split; [exact Hc|].
    unshelve eapply (proj2 (avl_left_rotation_subtree_path_equiv__left_rotation_graph_heights
      g after x y c c v Hv Hr Hm _ (ltac:(reflexivity)))).
    - intros z Hz. pose proof (avl_descendant_avoids_ancestors__left_rotation_graph_heights
        g x y c z Hv Hx (or_intror Hxy) (or_intror Hc) Hz). tauto.
    - exact Hp. }
  assert (Hpathx : forall v, avl_reachable after x v -> avl_key_of g v < avl_key_of g y).
  { intros v Hp. unfold avl_reachable, GraphLib.examples.bst.bt_path in Hp.
    destruct Hp as [n Hn]. destruct n.
    - change (x = v) in Hn. subst v. exact Horder.
    - simpl in Hn. destruct Hn as [c [Hedge Htail]].
      unfold Sets.test1 in Hedge; simpl in Hedge.
      unfold Sets.lift1 in Htail; simpl in Htail.
      change (GraphLib.examples.bst.bt_child (GraphLib.examples.bst.bst_tree (avl_bst after)) x c) in Hedge.
      assert (Hrest : clos_refl_trans (GraphLib.examples.bst.bt_child (GraphLib.examples.bst.bst_tree (avl_bst after))) c v)
        by (exists n; exact Htail).
      change (avl_left after x = Some c \/ avl_right after x = Some c) in Hedge.
      rewrite Hlx, Hrx in Hedge.
      destruct Hedge as [Hl|Hmid].
      + pose proof (GraphLib.examples.bst.bst_left_order _ (proj1 Hv) x v Hx (HL c v Hl Hrest)).
        unfold avl_key_of in *; lia.
      + pose proof (GraphLib.examples.bst.bst_left_order _ (proj1 Hv) y v Hy (HM c v Hmid Hrest)).
        unfold avl_key_of in *; lia. }
  assert (Hnon : forall z c v, avl_vvalid g z -> z <> x -> z <> y ->
    (avl_left g z = Some c \/ avl_right g z = Some c) ->
    avl_reachable after c v -> avl_reachable g c v).
  { intros z c v Hz Hzx Hzy Hc Hp.
    unshelve eapply (proj2 (avl_left_rotation_subtree_path_equiv__left_rotation_graph_heights
      g after x y z c v Hv Hr Hm _ _)).
    - intros q Hq. eapply avl_nonpivot_region__left_rotation_graph_refinement; eauto.
    - unfold avl_reachable, GraphLib.examples.bst.bt_path.
      transitivity_1n c; [exact Hc|reflexivity].
    - exact Hp. }
  unfold avl_bst_valid. constructor.
  - rewrite Heq; simpl. eapply GraphLib.examples.bst.left_rotate_preserves_gvalid; eauto.
  - intros z v Hz [c [Hc Hp]].
    change (avl_vvalid after z) in Hz.
    apply (proj2 (proj2 (avl_left_rotation_domain_keys__left_rotation_graph_heights g after x y z Hm))) in Hz.
    change (avl_left after z = Some c) in Hc.
    change (avl_key_of after v < avl_key_of after z). rewrite !Hkeys.
    destruct (Z.eq_dec z x) as [->|Hzx].
    + rewrite Hlx in Hc. apply (GraphLib.examples.bst.bst_left_order _ (proj1 Hv) x v Hx).
      exact (HL c v Hc Hp).
    + destruct (Z.eq_dec z y) as [->|Hzy].
      * rewrite Hly in Hc. inversion Hc; subst c. exact (Hpathx v Hp).
      * pose proof (avl_left_rotation_other_children__left_rotation_graph_heights g after x y z Hv Hr Hz Hzx Hzy Hm) as [Hl _].
        rewrite Hl in Hc. apply (GraphLib.examples.bst.bst_left_order _ (proj1 Hv) z v Hz).
        exists c; split; [exact Hc|]. exact (Hnon z c v Hz Hzx Hzy (or_introl Hc) Hp).
  - intros z v Hz [c [Hc Hp]].
    change (avl_vvalid after z) in Hz.
    apply (proj2 (proj2 (avl_left_rotation_domain_keys__left_rotation_graph_heights g after x y z Hm))) in Hz.
    change (avl_right after z = Some c) in Hc.
    change (avl_key_of after z < avl_key_of after v). rewrite !Hkeys.
    destruct (Z.eq_dec z x) as [->|Hzx].
    + rewrite Hrx in Hc. apply (GraphLib.examples.bst.bst_right_order _ (proj1 Hv) x v Hx).
      exists y; split; [exact Hxy|].
      destruct (HM c v Hc Hp) as [m [Hmc Hmp]].
      unfold GraphLib.examples.bst.bt_path. transitivity_1n m; [left; exact Hmc|exact Hmp].
    + destruct (Z.eq_dec z y) as [->|Hzy].
      * rewrite Hry in Hc. apply (GraphLib.examples.bst.bst_right_order _ (proj1 Hv) y v Hy).
        exact (HR c v Hc Hp).
      * pose proof (avl_left_rotation_other_children__left_rotation_graph_heights g after x y z Hv Hr Hz Hzx Hzy Hm) as [_ Hrr].
        rewrite Hrr in Hc. apply (GraphLib.examples.bst.bst_right_order _ (proj1 Hv) z v Hz).
        exists c; split; [exact Hc|]. exact (Hnon z c v Hz Hzx Hzy (or_intror Hc) Hp).
Qed.
Lemma avl_left_rotation_output_exists__left_rotation_graph_refinement :
  forall g x, avl_left_rotation_input g x -> exists after y,
    avl_right g x = Some y /\ avl_vvalid g y /\
    avl_left_rotation_result g after x y /\
    avl_height_int_result_safe g (avl_ptr_of (avl_left g x)) /\
    avl_height_int_result_safe g (avl_ptr_of (avl_left g y)) /\
    avl_height_int_result_safe g (avl_ptr_of (avl_right g y)) /\
    avl_height_int_result_safe after x.
Proof.
  intros g x Hi.
  destruct (avl_rotation_model_exists__left_rotation_graph_refinement g x Hi)
    as [after [y [Hxy [Hy [Hny [Hm [Hr [Hh [Hn [Ha [Hb [Hc Hd]]]]]]]]]]]].
  exists after, y. split; [exact Hxy|]. split; [exact Hy|]. split; [|tauto].
  unfold avl_left_rotation_result.
  split; [rewrite Hxy; reflexivity|]. split; [exact Hny|].
  split; [exact Hr|]. split; [exact Hm|]. split.
  - split.
    + exact (avl_left_rotation_bst__left_rotation_graph_refinement g after x y (proj1 Hi) (proj1 (proj2 Hi)) Hm).
    + tauto.
  - split.
    + exact (proj1 (proj2 (avl_left_rotation_domain_keys__left_rotation_graph_heights g after x y x Hm))).
    + intros z. exact (proj1 (avl_left_rotation_domain_keys__left_rotation_graph_heights g after x y z Hm)).
Qed.
Lemma avl_tree_store_rotation_expose__left_rotation_graph_refinement :
  forall g x y, avl_height_input_valid g -> avl_root g = Some x ->
    avl_vvalid g x -> x <> NULL -> avl_right g x = Some y ->
    avl_vvalid g y -> y <> NULL ->
    avl_tree_store g |--
    avl_graph_node_store g x ** avl_graph_node_store g y **
    avl_subtree_store_at g (avl_ptr_of (avl_left g x)) **
    avl_subtree_store_at g (avl_ptr_of (avl_left g y)) **
    avl_subtree_store_at g (avl_ptr_of (avl_right g y)).
Proof.
  intros g x y Hv Hr Hx Hnx Hxy Hy Hny.
  assert (Hroot : avl_tree_store g |-- avl_subtree_store_at g x).
  { unfold avl_tree_store, avl_subtree_store_at.
    rewrite (avl_root_subtree_nodes_eq__left_rotation_graph_heights g x Hv Hr).
    entailer!. }
  sep_apply_l_atomic Hroot.
  sep_apply_l_atomic (avl_subtree_store_decompose__height_accessor g x Hv Hnx Hx).
  rewrite Hxy. simpl avl_ptr_of.
  sep_apply_l_atomic (avl_subtree_store_decompose__height_accessor g y Hv Hny Hy).
  entailer!.
Qed.

(** Storage view with one independent cached height. The mathematical graph
    remains [g]; this view changes only the concrete value in [root.height].
    This supports composition after an inner rotation leaves the outer root
    cache stale. The outer rotation overwrites that cache without reading it. *)
Definition avl_with_root_cache
    (g : avl_model) (root : addr) (cached : Z) : avl_model :=
  {| avl_bst := avl_bst g;
     avl_height_of := avl_height_update (avl_height_of g) root cached |}.

(** Right rotation of x(y(A,B),C): only A, B, C and the newly computed
    demoted height d=max(height(B),height(C))+1 are read through signed int.
    Bounding d also bounds B and C. No bound is imposed on the virtual
    pre-rotation root height or on an already stale root cache, apart from
    the unsigned field range supplied by concrete ownership. *)
Definition avl_right_rotation_input (g : avl_model) (root : addr) : Prop :=
  avl_height_input_valid g /\
  avl_root g = Some root /\
  avl_vvalid g root /\
  root <> NULL /\
  avl_ptr_of (avl_left g root) <> NULL /\
  avl_child_height g
    (avl_left g (avl_ptr_of (avl_left g root))) <= INT_MAX /\
  Z.max
    (avl_child_height g (avl_right g (avl_ptr_of (avl_left g root))))
    (avl_child_height g (avl_right g root)) + 1 <= INT_MAX.

(** Exact graph topology, node/key preservation and exact cached heights.
    A generic rotation does not promise that an arbitrary BST becomes AVL. *)
Definition avl_right_rotation_result
    (before after : avl_model) (root result : addr) : Prop :=
  result = avl_ptr_of (avl_left before root) /\
  result <> NULL /\
  avl_root after = Some result /\
  avl_right_rotation_model before after root result /\
  avl_height_input_valid after /\
  avl_nodes after = avl_nodes before /\
  (forall x, avl_key_of after x = avl_key_of before x).

(** The output graph is existential, so callers need only input facts. *)
Definition avl_right_rotation_post
    (before : avl_model) (root result : addr) : Assertion :=
  EX after,
    “ avl_right_rotation_result before after root result ” &&
    avl_tree_store after.

Lemma avl_right_rotation_domain_keys__right_rotation_graph :
  forall before after root promoted z,
    avl_right_rotation_model before after root promoted ->
    avl_key_of after z = avl_key_of before z /\
    avl_nodes after = avl_nodes before /\
    (avl_vvalid after z <-> avl_vvalid before z).
Proof.
  intros before after root promoted z [_ [_ [Htree _]]].
  unfold avl_key_of, avl_nodes, avl_vvalid in *.
  rewrite Htree. simpl. repeat split; auto.
Qed.
Lemma avl_right_rotation_pivot_children__right_rotation_graph :
  forall (before after : avl_model) root promoted,
    avl_height_input_valid before ->
    avl_right_rotation_model before after root promoted ->
    avl_right after promoted = Some root /\
    avl_left after promoted = avl_left before promoted /\
    avl_right after root = avl_right before root /\
    avl_left after root = avl_right before promoted.
Proof.
  intros before after root promoted Hinput [Hroot [Hleft [Htree _]]].
  assert (Hbst := proj1 Hinput).
  pose proof (GraphLib.examples.bst.bst_binary_tree (avl_bst before) Hbst) as Ht.
  assert (Hroot2 :
    (GraphLib.examples.bst.bst_tree (avl_bst before)).(GraphLib.examples.bst.vset) root).
  { exact Hroot. }
  assert (Hleft2 :
    (GraphLib.examples.bst.bst_tree (avl_bst before)).(GraphLib.examples.bst.left_child) root = Some promoted).
  { exact Hleft. }
  assert (Hneq : root <> promoted).
  { intro Heq. subst promoted. eapply GraphLib.examples.bst.bt_child_no_self; eauto.
    left; exact Hleft2. }
  pose proof (GraphLib.examples.bst.right_rotate_node_domain_sound Z.eq_dec
    (GraphLib.examples.bst.bst_tree (avl_bst before)) root promoted
    ((GraphLib.examples.bst.bst_tree (avl_bst before)).(GraphLib.examples.bst.listV))
    (GraphLib.examples.bst.binarytree_node_domain_from_gvalid _ Ht)
    Hroot2 Hleft2 Hneq) as Hrot.
  pose proof (GraphLib.directed.binarytree.rrc_pivot_children _ _ _ _
    (GraphLib.directed.binarytree.rrnd_core_valid _ _ _ _ _ Hrot)) as Hchildren.
  unfold avl_right, avl_left in *.
  rewrite Htree. simpl. exact Hchildren.
Qed.
Lemma avl_right_rotation_other_children__right_rotation_graph :
  forall before after root promoted z,
    avl_height_input_valid before -> avl_root before = Some root ->
    avl_vvalid before z -> z <> root -> z <> promoted ->
    avl_right_rotation_model before after root promoted ->
    avl_right after z = avl_right before z /\
    avl_left after z = avl_left before z.
Proof.
  intros before after root promoted z Hvalid Hroot Hz Hneqroot Hneqprom Hrot.
  destruct Hrot as [_ [_ [Htree _]]].
  pose proof (GraphLib.examples.bst.bst_binary_tree (avl_bst before) (proj1 Hvalid)) as Ht.
  pose proof (GraphLib.examples.bst.root_no_parents _ Ht z root Hroot) as [HnoR HnoL].
  assert (Hin : In z (GraphLib.examples.bst.listV (GraphLib.examples.bst.bst_tree (avl_bst before)))).
  { apply GraphLib.examples.bst.finite_vertices; assumption. }
  split.
  - unfold avl_right. rewrite Htree. simpl.
    unfold GraphLib.examples.bst.right_rotate_right_child.
    rewrite GraphLib.examples.bst.iter_override_in by exact Hin.
    unfold GraphLib.examples.bst.right_rotate_right_child_value,
      GraphLib.examples.bst.replace_child.
    destruct (Z.eq_dec z promoted); [contradiction|].
    destruct (Z.eq_dec z root); [contradiction|].
    assert (Hrep : forall c : option Z,
      c <> Some root ->
      (match c with Some v => if Z.eq_dec v root then Some promoted else Some v
      | None => None end) = c).
    { intros [v|] Hneq; simpl; [|reflexivity].
      destruct (Z.eq_dec v root) as [->|Hne]; [contradiction|reflexivity]. }
    apply Hrep. exact HnoL.
  - unfold avl_left. rewrite Htree. simpl.
    unfold GraphLib.examples.bst.right_rotate_left_child.
    rewrite GraphLib.examples.bst.iter_override_in by exact Hin.
    unfold GraphLib.examples.bst.right_rotate_left_child_value,
      GraphLib.examples.bst.replace_child.
    destruct (Z.eq_dec z root); [contradiction|].
    destruct (Z.eq_dec z promoted); [contradiction|].
    assert (Hrep : forall c : option Z,
      c <> Some root ->
      (match c with Some v => if Z.eq_dec v root then Some promoted else Some v
      | None => None end) = c).
    { intros [v|] Hneq; simpl; [|reflexivity].
      destruct (Z.eq_dec v root) as [->|Hne]; [contradiction|reflexivity]. }
    apply Hrep. exact HnoR.
Qed.
Lemma avl_right_rotation_old_root__right_rotation_graph :
  forall before after root promoted,
    avl_height_input_valid before ->
    avl_right_rotation_model before after root promoted ->
    avl_root after = Some promoted ->
    avl_root before = Some root.
Proof.
  intros before after root promoted Hvalid [Hroot [Hleft [Htree _]]] Hafter.
  pose proof (GraphLib.examples.bst.bst_binary_tree (avl_bst before) (proj1 Hvalid)) as Ht.
  assert (Hroot2 :
    (GraphLib.examples.bst.bst_tree (avl_bst before)).(GraphLib.examples.bst.vset) root).
  { exact Hroot. }
  assert (Hleft2 :
    (GraphLib.examples.bst.bst_tree (avl_bst before)).(GraphLib.examples.bst.left_child) root = Some promoted).
  { exact Hleft. }
  assert (Hneq : root <> promoted).
  { intro Heq. subst promoted. eapply GraphLib.examples.bst.bt_child_no_self; eauto.
    left; exact Hleft2. }
  pose proof (GraphLib.examples.bst.right_rotate_node_domain_sound Z.eq_dec
    (GraphLib.examples.bst.bst_tree (avl_bst before)) root promoted
    ((GraphLib.examples.bst.bst_tree (avl_bst before)).(GraphLib.examples.bst.listV))
    (GraphLib.examples.bst.binarytree_node_domain_from_gvalid _ Ht)
    Hroot2 Hleft2 Hneq) as Hrot.
  pose proof (GraphLib.directed.binarytree.rrc_root _ _ _ _
    (GraphLib.directed.binarytree.rrnd_core_valid _ _ _ _ _ Hrot))
    as [Hrootx [Hrootframe Hrootnone]].
  destruct (GraphLib.examples.bst.path_exists _ Ht root Hroot2)
    as [oldroot [Holdroot _]].
  destruct (Z.eq_dec root oldroot) as [Heq|Hneqold].
  - subst. exact Holdroot.
  - assert (Hsame : avl_root after = Some oldroot).
    { unfold avl_root. rewrite Htree. simpl.
      exact (Hrootframe oldroot Holdroot (fun E => Hneqold (eq_sym E))). }
    rewrite Hafter in Hsame. inversion Hsame; subst oldroot.
    pose proof (GraphLib.examples.bst.root_no_parents _ Ht root promoted Holdroot) as [Hno _].
    contradiction.
Qed.
Lemma avl_right_rotation_nonpivot_store__right_rotation_graph :
  forall before after root promoted z,
    avl_height_input_valid before -> avl_root before = Some root ->
    avl_vvalid before z -> z <> root -> z <> promoted ->
    avl_right_rotation_model before after root promoted ->
    avl_graph_node_store before z |-- avl_graph_node_store after z.
Proof.
  intros before after root promoted z Hinput Hroot Hz Hnzroot Hnzprom Hrot.
  pose proof (avl_right_rotation_domain_keys__right_rotation_graph
    before after root promoted z Hrot) as [Hkey [_ Hviff]].
  pose proof (avl_right_rotation_other_children__right_rotation_graph
    before after root promoted z Hinput Hroot Hz Hnzroot Hnzprom Hrot)
    as [Hright Hleft].
  destruct Hrot as [_ [_ [_ [_ [_ Hnonlocal]]]]].
  specialize (Hnonlocal z Hnzroot Hnzprom).
  unfold avl_graph_node_store.
  rewrite Hkey, Hnonlocal, Hright, Hleft.
  entailer!.
  apply (proj2 Hviff). exact Hz.
Qed.
Lemma avl_right_rotation_nonpivot_stores__right_rotation_graph :
  forall before after root promoted xs,
    avl_height_input_valid before -> avl_root before = Some root ->
    avl_right_rotation_model before after root promoted ->
    Forall (fun z => avl_vvalid before z /\ z <> root /\ z <> promoted) xs ->
    avl_graph_nodes_store before xs |-- avl_graph_nodes_store after xs.
Proof.
  intros before after root promoted xs Hinput Hroot Hrot Hforall.
  induction Hforall as [|z xs [Hz [Hnzroot Hnzprom]] Hxs IH].
  - unfold avl_graph_nodes_store. simpl. entailer!.
  - rewrite !avl_graph_nodes_store_cons__graph_store_decomposition.
    sep_apply_l_atomic (avl_right_rotation_nonpivot_store__right_rotation_graph
      before after root promoted z Hinput Hroot Hz Hnzroot Hnzprom Hrot).
    sep_apply_l_atomic IH.
    entailer!.
Qed.
Lemma avl_right_rotation_subtree_path_equiv__right_rotation_graph :
  forall before after root promoted s a b,
    avl_height_input_valid before -> avl_root before = Some root ->
    avl_right_rotation_model before after root promoted ->
    (forall z, avl_reachable before s z ->
      avl_vvalid before z /\ z <> root /\ z <> promoted) ->
    avl_reachable before s a ->
    (avl_reachable before a b <-> avl_reachable after a b).
Proof.
  intros before after root promoted s a b Hinput Hroot Hrot Havoid Hsa.
  pose proof Hrot as [_ [_ [Htree _]]].
  unfold avl_reachable, GraphLib.examples.bst.bt_path in Hsa |- *.
  rewrite Htree. simpl.
  apply (avl_path_equiv_on_closed_region__left_rotation_graph_heights
    addr
    (GraphLib.examples.bst.bt_child (GraphLib.examples.bst.bst_tree (avl_bst before)))
    (GraphLib.examples.bst.bt_child
      (GraphLib.examples.bst.right_rotate Z.eq_dec
        (GraphLib.examples.bst.bst_tree (avl_bst before)) root promoted))
    s); [|exact Hsa].
  intros u v Hsu.
  specialize (Havoid u Hsu) as [Hu [Hune_root Hune_promoted]].
  pose proof (avl_right_rotation_other_children__right_rotation_graph
    before after root promoted u Hinput Hroot Hu Hune_root Hune_promoted Hrot)
    as [Hright Hleft].
  unfold avl_right, avl_left in Hright, Hleft.
  rewrite Htree in Hright, Hleft. simpl in Hright, Hleft.
  unfold GraphLib.examples.bst.bt_child.
  simpl. rewrite Hright, Hleft. reflexivity.
Qed.
Lemma avl_right_rotation_subtree_nodes_eq__right_rotation_graph :
  forall before after root promoted s,
    avl_height_input_valid before -> avl_root before = Some root ->
    avl_right_rotation_model before after root promoted ->
    (forall z, avl_reachable before s z ->
      avl_vvalid before z /\ z <> root /\ z <> promoted) ->
    avl_subtree_nodes after s = avl_subtree_nodes before s.
Proof.
  intros before after root promoted s Hinput Hroot Hrot Havoid.
  pose proof (avl_right_rotation_domain_keys__right_rotation_graph
    before after root promoted s Hrot) as [_ [Hnodes _]].
  unfold avl_subtree_nodes.
  rewrite Hnodes.
  apply avl_valid_NoDup_list_ext__left_rotation_graph_heights.
  intro z.
  pose proof (avl_right_rotation_subtree_path_equiv__right_rotation_graph
    before after root promoted s s z Hinput Hroot Hrot Havoid) as Hpath.
  assert (Hself : avl_reachable before s s) by
    (unfold avl_reachable, GraphLib.examples.bst.bt_path; reflexivity).
  specialize (Hpath Hself). tauto.
Qed.
Lemma avl_right_rotation_subtree_store_transfer__right_rotation_graph :
  forall before after root promoted s,
    avl_height_input_valid before -> avl_root before = Some root ->
    avl_right_rotation_model before after root promoted ->
    (forall z, avl_reachable before s z ->
      avl_vvalid before z /\ z <> root /\ z <> promoted) ->
    avl_subtree_store_at before s |-- avl_subtree_store_at after s.
Proof.
  intros before after root promoted s Hinput Hroot Hrot Havoid.
  assert (Hself : avl_reachable before s s) by
    (unfold avl_reachable, GraphLib.examples.bst.bt_path; reflexivity).
  pose proof (Havoid s Hself) as [Hsvalid [_ _]].
  pose proof (avl_right_rotation_domain_keys__right_rotation_graph
    before after root promoted s Hrot) as [_ [_ Hviff]].
  assert (Hfor : Forall
    (fun z => avl_vvalid before z /\ z <> root /\ z <> promoted)
    (avl_subtree_nodes before s)).
  { apply Forall_forall. intros z Hz.
    unfold avl_subtree_nodes in Hz.
    apply GraphLib.graph_basic.valid_NoDup_list_spec in Hz as [_ Hzpath].
    exact (Havoid z Hzpath). }
  unfold avl_subtree_store_at.
  rewrite (avl_right_rotation_subtree_nodes_eq__right_rotation_graph
    before after root promoted s Hinput Hroot Hrot Havoid).
  Intros_p Hguard.
  sep_apply_l_atomic (avl_right_rotation_nonpivot_stores__right_rotation_graph
    before after root promoted (avl_subtree_nodes before s)
    Hinput Hroot Hrot Hfor).
  entailer!.
  intros Hnonnull. apply (proj2 Hviff). exact Hsvalid.
Qed.
Lemma avl_right_child_avoids_left_pivot__right_rotation_graph :
  forall g root promoted child z,
    avl_height_input_valid g -> avl_vvalid g root ->
    avl_right g root = Some child -> avl_left g root = Some promoted ->
    avl_reachable g child z ->
    avl_vvalid g z /\ z <> root /\ z <> promoted.
Proof.
  intros g root promoted child z Hinput Hroot Hright Hleft Hpath.
  pose proof (GraphLib.examples.bst.bst_binary_tree (avl_bst g) (proj1 Hinput)) as Ht.
  assert (Hchild : avl_vvalid g child).
  { apply (GraphLib.examples.bst.child_valid _ Ht root child Hroot).
    right; exact Hright. }
  split.
  - exact (GraphLib.examples.bst.bt_path_end_valid_early _ child z Ht Hchild Hpath).
  - split.
    + intro Heq. subst z.
      eapply (GraphLib.examples.bst.bt_child_no_back_path _ root child Ht Hroot (or_intror Hright)).
      exact Hpath.
    + intro Heq. subst z.
      assert (Hsubright : GraphLib.examples.bst.bt_right_subtree
        (GraphLib.examples.bst.bst_tree (avl_bst g)) root promoted).
      { exists child. split; assumption. }
      assert (Hsubleft : GraphLib.examples.bst.bt_left_subtree
        (GraphLib.examples.bst.bst_tree (avl_bst g)) root promoted).
      { exists promoted. split; [exact Hleft|reflexivity]. }
      pose proof (GraphLib.examples.bst.bst_right_order (avl_bst g)
        (proj1 Hinput) root promoted Hroot Hsubright) as Hlt.
      pose proof (GraphLib.examples.bst.bst_left_order (avl_bst g)
        (proj1 Hinput) root promoted Hroot Hsubleft) as Hgt.
      lia.
Qed.
Lemma avl_right_rotation_child_store_transfer__right_rotation_graph :
  forall before after root promoted child,
    avl_height_input_valid before -> avl_height_input_valid after ->
    avl_root before = Some root ->
    avl_right_rotation_model before after root promoted ->
    (forall x, child = Some x -> forall z, avl_reachable before x z ->
      avl_vvalid before z /\ z <> root /\ z <> promoted) ->
    avl_subtree_store_at before (avl_ptr_of child) |--
    avl_subtree_store_at after (avl_ptr_of child).
Proof.
  intros before after root promoted [x|] Hbefore Hafter Hroot Hrot Havoid.
  - simpl. eapply avl_right_rotation_subtree_store_transfer__right_rotation_graph;
      eauto.
  - simpl.
    rewrite (avl_subtree_store_null__left_rotation_graph_heights before Hbefore).
    rewrite (avl_subtree_store_null__left_rotation_graph_heights after Hafter).
    entailer!.
Qed.
Lemma avl_right_rotation_root_node_store__right_rotation_graph :
  forall before after root promoted cached,
    avl_height_input_valid before ->
    avl_right_rotation_model before after root promoted ->
    avl_vvalid before root -> root <> NULL ->
    INT_MIN <= avl_key_of before root <= INT_MAX ->
    0 <= avl_height_of after root <= UINT_MAX ->
    cached = avl_height_of after root ->
    (&(root # "AvlNode" ->ₛ "data") # Int |-> avl_key_of before root) **
    (&(root # "AvlNode" ->ₛ "height") # UInt |-> cached) **
    (&(root # "AvlNode" ->ₛ "right") # Ptr |-> avl_ptr_of (avl_right before root)) **
    (&(root # "AvlNode" ->ₛ "left") # Ptr |-> avl_ptr_of (avl_right before promoted))
    |-- avl_graph_node_store after root.
Proof.
  intros before after root promoted cached Hinput Hrot Hv Hnonnull Hkeybound Hhbound Hcached.
  pose proof (avl_right_rotation_domain_keys__right_rotation_graph
    before after root promoted root Hrot) as [Hkey [_ Hviff]].
  pose proof (avl_right_rotation_pivot_children__right_rotation_graph
    before after root promoted Hinput Hrot) as [_ [_ [Hright Hleft]]].
  unfold avl_graph_node_store.
  rewrite Hkey, Hright, Hleft.
  rewrite <- Hcached.
  entailer!.
  apply (proj2 Hviff). exact Hv.
Qed.
Lemma avl_right_rotate_demoted_store__right_rotation_graph :
  forall before after root promoted cached,
    avl_height_input_valid before -> avl_height_input_valid after ->
    avl_root before = Some root ->
    avl_right_rotation_model before after root promoted ->
    root <> NULL -> INT_MIN <= avl_key_of before root <= INT_MAX ->
    0 <= avl_height_of after root <= UINT_MAX ->
    cached = avl_height_of after root ->
    avl_subtree_store_at before (avl_ptr_of (avl_right before promoted)) **
    avl_subtree_store_at before (avl_ptr_of (avl_right before root)) **
    (&(root # "AvlNode" ->ₛ "data") # Int |-> avl_key_of before root) **
    (&(root # "AvlNode" ->ₛ "height") # UInt |-> cached) **
    (&(root # "AvlNode" ->ₛ "right") # Ptr |-> avl_ptr_of (avl_right before root)) **
    (&(root # "AvlNode" ->ₛ "left") # Ptr |-> avl_ptr_of (avl_right before promoted))
    |-- avl_subtree_store_at after root.
Proof.
  intros before after root promoted cached Hbefore Hafter Hroot Hrot Hnonnull Hkeybound Hhbound Hcached.
  pose proof Hrot as [Hvroot [Hleftroot _]].
  pose proof (avl_right_rotation_domain_keys__right_rotation_graph
    before after root promoted root Hrot) as [_ [_ Hviff]].
  assert (Hvafter : avl_vvalid after root) by (apply (proj2 Hviff); exact Hvroot).
  pose proof (avl_right_rotation_pivot_children__right_rotation_graph
    before after root promoted Hbefore Hrot) as [_ [_ [Hrightroot Hleftroot_after]]].
  assert (HtransferA :
    avl_subtree_store_at before (avl_ptr_of (avl_right before root)) |--
    avl_subtree_store_at after (avl_ptr_of (avl_right before root))).
  { apply (avl_right_rotation_child_store_transfer__right_rotation_graph
      before after root promoted (avl_right before root)
      Hbefore Hafter Hroot Hrot).
    intros x Hx z Hz.
    eapply avl_right_child_avoids_left_pivot__right_rotation_graph;
      eauto. }
  assert (HtransferB :
    avl_subtree_store_at before (avl_ptr_of (avl_right before promoted)) |--
    avl_subtree_store_at after (avl_ptr_of (avl_right before promoted))).
  { apply (avl_right_rotation_child_store_transfer__right_rotation_graph
      before after root promoted (avl_right before promoted)
      Hbefore Hafter Hroot Hrot).
    intros x Hx z Hz.
    destruct (avl_descendant_avoids_ancestors__left_rotation_graph_heights
      before root promoted x z Hbefore Hvroot
      (or_introl Hleftroot) (or_intror Hx) Hz) as [Hv [Hneprom Hneroot]].
    repeat split; assumption. }
  pose proof (avl_right_rotation_root_node_store__right_rotation_graph
    before after root promoted cached Hbefore Hrot Hvroot Hnonnull
    Hkeybound Hhbound Hcached) as Hnode.
  pose proof (avl_subtree_store_fold__height_accessor
    after root Hafter Hnonnull Hvafter) as Hfold.
  rewrite Hrightroot, Hleftroot_after in Hfold.
  sep_apply_l_atomic HtransferB.
  sep_apply_l_atomic HtransferA.
  sep_apply_l_atomic Hnode.
  sep_apply_r_atomic Hfold. cancel.
Qed.
Lemma avl_right_rotation_child_height_transfer__right_rotation_graph :
  forall before after root promoted child,
    avl_right_rotation_model before after root promoted ->
    (forall x, child = Some x -> x <> root /\ x <> promoted) ->
    avl_child_height after child = avl_child_height before child.
Proof.
  intros before after root promoted [x|] Hrot Havoid.
  - unfold avl_child_height. simpl.
    destruct (Havoid x eq_refl) as [Hnr Hnp].
    destruct Hrot as [_ [_ [_ [_ [_ Hnonlocal]]]]].
    exact (Hnonlocal x Hnr Hnp).
  - reflexivity.
Qed.
Lemma avl_right_rotate_root_height_gt__right_rotation_graph :
  forall before after root promoted a b,
  avl_height_input_valid before ->
  avl_right_rotation_model before after root promoted ->
  avl_height_result before (avl_ptr_of (avl_right before root)) a ->
  avl_height_result before (avl_ptr_of (avl_right before promoted)) b ->
  avl_height_int_result_safe before (avl_ptr_of (avl_right before root)) ->
  avl_height_int_result_safe before (avl_ptr_of (avl_right before promoted)) ->
  avl_height_of after root <= UINT_MAX ->
  unsigned_last_nbits b 32 > unsigned_last_nbits a 32 ->
  unsigned_last_nbits (unsigned_last_nbits b 32 + 1) 32 =
    avl_height_of after root.
Proof.
  intros before after root promoted a b Hinput Hrot HresA HresB HsafeA HsafeB Hupper Hcomp.
  pose proof Hrot as [Hvroot [Hleftroot [_ [Hrecompute _]]]].
  assert (Hvprom : avl_vvalid before promoted).
  { exact (avl_left_child_valid_from_bst__balance_input
      before root promoted (proj1 Hinput) Hvroot Hleftroot). }
  assert (HAvalid : forall x, avl_right before root = Some x -> avl_vvalid before x).
  { intros x Hx. exact (avl_right_child_valid_from_bst__balance_input
      before root x (proj1 Hinput) Hvroot Hx). }
  assert (HBvalid : forall x, avl_right before promoted = Some x -> avl_vvalid before x).
  { intros x Hx. exact (avl_right_child_valid_from_bst__balance_input
      before promoted x (proj1 Hinput) Hvprom Hx). }
  pose proof (avl_height_result_child_height__left_rotation_graph_heights
    before (avl_right before root) a Hinput HAvalid HresA) as Ha.
  pose proof (avl_height_result_child_height__left_rotation_graph_heights
    before (avl_right before promoted) b Hinput HBvalid HresB) as Hb.
  pose proof (avl_child_height_int_bound__left_rotation_graph_heights
    before (avl_right before root) Hinput HAvalid HsafeA) as HboundA.
  pose proof (avl_child_height_int_bound__left_rotation_graph_heights
    before (avl_right before promoted) Hinput HBvalid HsafeB) as HboundB.
  assert (HAavoid : forall x, avl_right before root = Some x -> x <> root /\ x <> promoted).
  { intros x Hx.
    pose proof (avl_right_child_avoids_left_pivot__right_rotation_graph
      before root promoted x x Hinput Hvroot Hx Hleftroot) as Haway.
    assert (Hself : avl_reachable before x x) by
      (unfold avl_reachable, GraphLib.examples.bst.bt_path; reflexivity).
    exact (proj2 (Haway Hself)). }
  assert (HBavoid : forall x, avl_right before promoted = Some x -> x <> root /\ x <> promoted).
  { intros x Hx.
    pose proof (avl_descendant_avoids_ancestors__left_rotation_graph_heights
      before root promoted x x Hinput Hvroot
      (or_introl Hleftroot) (or_intror Hx)) as Haway.
    assert (Hself : avl_reachable before x x) by
      (unfold avl_reachable, GraphLib.examples.bst.bt_path; reflexivity).
    destruct (Haway Hself) as [_ [Hneprom Hneroot]].
    split; assumption. }
  pose proof (avl_right_rotation_child_height_transfer__right_rotation_graph
    before after root promoted (avl_right before root) Hrot HAavoid) as HtransferA.
  pose proof (avl_right_rotation_child_height_transfer__right_rotation_graph
    before after root promoted (avl_right before promoted) Hrot HBavoid) as HtransferB.
  pose proof (avl_right_rotation_pivot_children__right_rotation_graph
    before after root promoted Hinput Hrot) as [_ [_ [Hright Hleft]]].
  unfold avl_recomputed_at in Hrecompute.
  rewrite Hright, Hleft, HtransferA, HtransferB in Hrecompute.
  rewrite <- Ha, <- Hb in Hrecompute.
  rewrite (unsigned_last_nbits_eq a 32) in Hcomp by lia.
  rewrite (unsigned_last_nbits_eq b 32) in Hcomp by lia.
  eapply (avl_height_uint_max_gt__left_rotation_graph_heights b a); eauto; lia.
Qed.
Lemma avl_right_rotate_root_height_le__right_rotation_graph :
  forall before after root promoted a b,
  avl_height_input_valid before ->
  avl_right_rotation_model before after root promoted ->
  avl_height_result before (avl_ptr_of (avl_right before root)) a ->
  avl_height_result before (avl_ptr_of (avl_right before promoted)) b ->
  avl_height_int_result_safe before (avl_ptr_of (avl_right before root)) ->
  avl_height_int_result_safe before (avl_ptr_of (avl_right before promoted)) ->
  avl_height_of after root <= UINT_MAX ->
  unsigned_last_nbits b 32 <= unsigned_last_nbits a 32 ->
  unsigned_last_nbits (unsigned_last_nbits a 32 + 1) 32 =
    avl_height_of after root.
Proof.
  intros before after root promoted a b Hinput Hrot HresA HresB HsafeA HsafeB Hupper Hcomp.
  pose proof Hrot as [Hvroot [Hleftroot [_ [Hrecompute _]]]].
  assert (Hvprom : avl_vvalid before promoted).
  { exact (avl_left_child_valid_from_bst__balance_input
      before root promoted (proj1 Hinput) Hvroot Hleftroot). }
  assert (HAvalid : forall x, avl_right before root = Some x -> avl_vvalid before x).
  { intros x Hx. exact (avl_right_child_valid_from_bst__balance_input
      before root x (proj1 Hinput) Hvroot Hx). }
  assert (HBvalid : forall x, avl_right before promoted = Some x -> avl_vvalid before x).
  { intros x Hx. exact (avl_right_child_valid_from_bst__balance_input
      before promoted x (proj1 Hinput) Hvprom Hx). }
  pose proof (avl_height_result_child_height__left_rotation_graph_heights
    before (avl_right before root) a Hinput HAvalid HresA) as Ha.
  pose proof (avl_height_result_child_height__left_rotation_graph_heights
    before (avl_right before promoted) b Hinput HBvalid HresB) as Hb.
  pose proof (avl_child_height_int_bound__left_rotation_graph_heights
    before (avl_right before root) Hinput HAvalid HsafeA) as HboundA.
  pose proof (avl_child_height_int_bound__left_rotation_graph_heights
    before (avl_right before promoted) Hinput HBvalid HsafeB) as HboundB.
  assert (HAavoid : forall x, avl_right before root = Some x -> x <> root /\ x <> promoted).
  { intros x Hx.
    pose proof (avl_right_child_avoids_left_pivot__right_rotation_graph
      before root promoted x x Hinput Hvroot Hx Hleftroot) as Haway.
    assert (Hself : avl_reachable before x x) by
      (unfold avl_reachable, GraphLib.examples.bst.bt_path; reflexivity).
    exact (proj2 (Haway Hself)). }
  assert (HBavoid : forall x, avl_right before promoted = Some x -> x <> root /\ x <> promoted).
  { intros x Hx.
    pose proof (avl_descendant_avoids_ancestors__left_rotation_graph_heights
      before root promoted x x Hinput Hvroot
      (or_introl Hleftroot) (or_intror Hx)) as Haway.
    assert (Hself : avl_reachable before x x) by
      (unfold avl_reachable, GraphLib.examples.bst.bt_path; reflexivity).
    destruct (Haway Hself) as [_ [Hneprom Hneroot]].
    split; assumption. }
  pose proof (avl_right_rotation_child_height_transfer__right_rotation_graph
    before after root promoted (avl_right before root) Hrot HAavoid) as HtransferA.
  pose proof (avl_right_rotation_child_height_transfer__right_rotation_graph
    before after root promoted (avl_right before promoted) Hrot HBavoid) as HtransferB.
  pose proof (avl_right_rotation_pivot_children__right_rotation_graph
    before after root promoted Hinput Hrot) as [_ [_ [Hright Hleft]]].
  unfold avl_recomputed_at in Hrecompute.
  rewrite Hright, Hleft, HtransferA, HtransferB in Hrecompute.
  rewrite <- Ha, <- Hb in Hrecompute.
  rewrite (unsigned_last_nbits_eq a 32) in Hcomp by lia.
  rewrite (unsigned_last_nbits_eq b 32) in Hcomp by lia.
  eapply (avl_height_uint_max_le__left_rotation_graph_heights b a); eauto; lia.
Qed.
Lemma avl_right_rotation_promoted_node_store__right_rotation_graph :
  forall before after root promoted cached,
  avl_height_input_valid before ->
  avl_right_rotation_model before after root promoted ->
  INT_MIN <= avl_key_of before promoted <= INT_MAX ->
  0 <= avl_height_of after promoted <= UINT_MAX ->
  cached = avl_height_of after promoted ->
  (&(promoted # "AvlNode" ->ₛ "data") # Int |-> avl_key_of before promoted) **
  (&(promoted # "AvlNode" ->ₛ "height") # UInt |-> cached) **
  (&(promoted # "AvlNode" ->ₛ "right") # Ptr |-> root) **
  (&(promoted # "AvlNode" ->ₛ "left") # Ptr |-> avl_ptr_of (avl_left before promoted))
  |-- avl_graph_node_store after promoted.
Proof.
  intros before after root promoted cached Hinput Hrot Hkeybound Hhbound Hcached.
  pose proof Hrot as [Hvroot [Hleftroot _]].
  assert (Hvprom : avl_vvalid before promoted).
  { exact (avl_left_child_valid_from_bst__balance_input
      before root promoted (proj1 Hinput) Hvroot Hleftroot). }
  assert (Hnonnull : promoted <> NULL).
  { exact (proj2 (proj2 Hinput) promoted Hvprom). }
  pose proof (avl_right_rotation_domain_keys__right_rotation_graph
    before after root promoted promoted Hrot) as [Hkey [_ Hviff]].
  pose proof (avl_right_rotation_pivot_children__right_rotation_graph
    before after root promoted Hinput Hrot) as [Hright [Hleft _]].
  unfold avl_graph_node_store.
  rewrite Hkey, Hright, Hleft.
  simpl avl_ptr_of.
  rewrite <- Hcached.
  entailer!.
  apply (proj2 Hviff). exact Hvprom.
Qed.
Lemma avl_right_rotate_promoted_tree__right_rotation_graph :
  forall before after root promoted cached,
  avl_height_input_valid before -> avl_height_input_valid after ->
  avl_right_rotation_model before after root promoted ->
  avl_root after = Some promoted ->
  INT_MIN <= avl_key_of before promoted <= INT_MAX ->
  0 <= avl_height_of after promoted <= UINT_MAX ->
  cached = avl_height_of after promoted ->
  avl_subtree_store_at before (avl_ptr_of (avl_left before promoted)) **
  avl_subtree_store_at after root **
  (&(promoted # "AvlNode" ->ₛ "data") # Int |-> avl_key_of before promoted) **
  (&(promoted # "AvlNode" ->ₛ "height") # UInt |-> cached) **
  (&(promoted # "AvlNode" ->ₛ "right") # Ptr |-> root) **
  (&(promoted # "AvlNode" ->ₛ "left") # Ptr |-> avl_ptr_of (avl_left before promoted))
  |-- avl_tree_store after.
Proof.
  intros before after root promoted cached Hbefore Hafter Hrot Hrootafter Hkeybound Hhbound Hcached.
  pose proof Hrot as [Hvroot [Hleftroot _]].
  pose proof (avl_right_rotation_old_root__right_rotation_graph
    before after root promoted Hbefore Hrot Hrootafter) as Hrootbefore.
  assert (Hvprom_before : avl_vvalid before promoted).
  { exact (avl_left_child_valid_from_bst__balance_input
      before root promoted (proj1 Hbefore) Hvroot Hleftroot). }
  assert (Hnonnull : promoted <> NULL).
  { exact (proj2 (proj2 Hbefore) promoted Hvprom_before). }
  pose proof (avl_right_rotation_domain_keys__right_rotation_graph
    before after root promoted promoted Hrot) as [_ [_ Hviff]].
  assert (Hvprom_after : avl_vvalid after promoted).
  { apply (proj2 Hviff). exact Hvprom_before. }
  pose proof (avl_right_rotation_pivot_children__right_rotation_graph
    before after root promoted Hbefore Hrot) as [Hright [Hleft _]].
  assert (HtransferC :
    avl_subtree_store_at before (avl_ptr_of (avl_left before promoted)) |--
    avl_subtree_store_at after (avl_ptr_of (avl_left before promoted))).
  { apply (avl_right_rotation_child_store_transfer__right_rotation_graph
      before after root promoted (avl_left before promoted)
      Hbefore Hafter Hrootbefore Hrot).
    intros x Hx z Hz.
    destruct (avl_descendant_avoids_ancestors__left_rotation_graph_heights
      before root promoted x z Hbefore Hvroot
      (or_introl Hleftroot) (or_introl Hx) Hz) as [Hv [Hneprom Hneroot]].
    repeat split; assumption. }
  pose proof (avl_right_rotation_promoted_node_store__right_rotation_graph
    before after root promoted cached Hbefore Hrot Hkeybound Hhbound Hcached) as Hnode.
  pose proof (avl_subtree_store_fold__height_accessor
    after promoted Hafter Hnonnull Hvprom_after) as Hfold.
  rewrite Hright, Hleft in Hfold. simpl avl_ptr_of in Hfold.
  assert (Htreefold : avl_subtree_store_at after promoted |-- avl_tree_store after).
  { unfold avl_subtree_store_at, avl_tree_store.
    rewrite (avl_root_subtree_nodes_eq__left_rotation_graph_heights
      after promoted Hafter Hrootafter).
    entailer!. }
  sep_apply_l_atomic HtransferC.
  sep_apply_l_atomic Hnode.
  sep_apply_r_atomic Htreefold. sep_apply_r_atomic Hfold. cancel.
Qed.
Lemma avl_right_rotate_promoted_height_gt__right_rotation_graph :
  forall before after root promoted a b,
  avl_height_input_valid before -> avl_height_input_valid after ->
  avl_right_rotation_model before after root promoted ->
  avl_height_result after root a ->
  avl_height_result before (avl_ptr_of (avl_left before promoted)) b ->
  avl_height_int_result_safe after root ->
  avl_height_int_result_safe before (avl_ptr_of (avl_left before promoted)) ->
  avl_height_of after promoted <= UINT_MAX ->
  unsigned_last_nbits b 32 > unsigned_last_nbits a 32 ->
  unsigned_last_nbits (unsigned_last_nbits b 32 + 1) 32 =
    avl_height_of after promoted.
Proof.
  intros before after root promoted a b Hbefore Hafter Hrot HresA HresB HsafeA HsafeB Hupper Hcomp.
  pose proof Hrot as [Hvroot [Hleftroot [_ [_ [Hrecompute _]]]]].
  assert (Hvprom : avl_vvalid before promoted).
  { exact (avl_left_child_valid_from_bst__balance_input
      before root promoted (proj1 Hbefore) Hvroot Hleftroot). }
  pose proof (avl_right_rotation_domain_keys__right_rotation_graph
    before after root promoted root Hrot) as [_ [_ Hviff]].
  assert (Hvroot_after : avl_vvalid after root).
  { apply (proj2 Hviff). exact Hvroot. }
  assert (HAvalid : forall x, Some root = Some x -> avl_vvalid after x).
  { intros x Hx. inversion Hx; subst. exact Hvroot_after. }
  assert (HBvalid : forall x, avl_left before promoted = Some x -> avl_vvalid before x).
  { intros x Hx. exact (avl_left_child_valid_from_bst__balance_input
      before promoted x (proj1 Hbefore) Hvprom Hx). }
  assert (HresA' : avl_height_result after (avl_ptr_of (Some root)) a).
  { simpl. exact HresA. }
  pose proof (avl_height_result_child_height__left_rotation_graph_heights
    after (Some root) a Hafter HAvalid HresA') as Ha.
  pose proof (avl_height_result_child_height__left_rotation_graph_heights
    before (avl_left before promoted) b Hbefore HBvalid HresB) as Hb.
  assert (HsafeA' : avl_height_int_result_safe after (avl_ptr_of (Some root))).
  { simpl. exact HsafeA. }
  pose proof (avl_child_height_int_bound__left_rotation_graph_heights
    after (Some root) Hafter HAvalid HsafeA') as HboundA.
  pose proof (avl_child_height_int_bound__left_rotation_graph_heights
    before (avl_left before promoted) Hbefore HBvalid HsafeB) as HboundB.
  assert (HBavoid : forall x, avl_left before promoted = Some x -> x <> root /\ x <> promoted).
  { intros x Hx.
    pose proof (avl_descendant_avoids_ancestors__left_rotation_graph_heights
      before root promoted x x Hbefore Hvroot
      (or_introl Hleftroot) (or_introl Hx)) as Haway.
    assert (Hself : avl_reachable before x x) by
      (unfold avl_reachable, GraphLib.examples.bst.bt_path; reflexivity).
    destruct (Haway Hself) as [_ [Hneprom Hneroot]].
    split; assumption. }
  pose proof (avl_right_rotation_child_height_transfer__right_rotation_graph
    before after root promoted (avl_left before promoted) Hrot HBavoid) as HtransferB.
  pose proof (avl_right_rotation_pivot_children__right_rotation_graph
    before after root promoted Hbefore Hrot) as [Hright [Hleft _]].
  unfold avl_recomputed_at in Hrecompute.
  rewrite Hright, Hleft, HtransferB in Hrecompute.
  rewrite <- Ha, <- Hb in Hrecompute.
  rewrite (unsigned_last_nbits_eq a 32) in Hcomp by lia.
  rewrite (unsigned_last_nbits_eq b 32) in Hcomp by lia.
  eapply (avl_height_uint_max_gt__left_rotation_graph_heights b a); eauto; lia.
Qed.
Lemma avl_right_rotate_promoted_height_le__right_rotation_graph :
  forall before after root promoted a b,
  avl_height_input_valid before -> avl_height_input_valid after ->
  avl_right_rotation_model before after root promoted ->
  avl_height_result after root a ->
  avl_height_result before (avl_ptr_of (avl_left before promoted)) b ->
  avl_height_int_result_safe after root ->
  avl_height_int_result_safe before (avl_ptr_of (avl_left before promoted)) ->
  avl_height_of after promoted <= UINT_MAX ->
  unsigned_last_nbits b 32 <= unsigned_last_nbits a 32 ->
  unsigned_last_nbits (unsigned_last_nbits a 32 + 1) 32 =
    avl_height_of after promoted.
Proof.
  intros before after root promoted a b Hbefore Hafter Hrot HresA HresB HsafeA HsafeB Hupper Hcomp.
  pose proof Hrot as [Hvroot [Hleftroot [_ [_ [Hrecompute _]]]]].
  assert (Hvprom : avl_vvalid before promoted).
  { exact (avl_left_child_valid_from_bst__balance_input
      before root promoted (proj1 Hbefore) Hvroot Hleftroot). }
  pose proof (avl_right_rotation_domain_keys__right_rotation_graph
    before after root promoted root Hrot) as [_ [_ Hviff]].
  assert (Hvroot_after : avl_vvalid after root).
  { apply (proj2 Hviff). exact Hvroot. }
  assert (HAvalid : forall x, Some root = Some x -> avl_vvalid after x).
  { intros x Hx. inversion Hx; subst. exact Hvroot_after. }
  assert (HBvalid : forall x, avl_left before promoted = Some x -> avl_vvalid before x).
  { intros x Hx. exact (avl_left_child_valid_from_bst__balance_input
      before promoted x (proj1 Hbefore) Hvprom Hx). }
  assert (HresA' : avl_height_result after (avl_ptr_of (Some root)) a).
  { simpl. exact HresA. }
  pose proof (avl_height_result_child_height__left_rotation_graph_heights
    after (Some root) a Hafter HAvalid HresA') as Ha.
  pose proof (avl_height_result_child_height__left_rotation_graph_heights
    before (avl_left before promoted) b Hbefore HBvalid HresB) as Hb.
  assert (HsafeA' : avl_height_int_result_safe after (avl_ptr_of (Some root))).
  { simpl. exact HsafeA. }
  pose proof (avl_child_height_int_bound__left_rotation_graph_heights
    after (Some root) Hafter HAvalid HsafeA') as HboundA.
  pose proof (avl_child_height_int_bound__left_rotation_graph_heights
    before (avl_left before promoted) Hbefore HBvalid HsafeB) as HboundB.
  assert (HBavoid : forall x, avl_left before promoted = Some x -> x <> root /\ x <> promoted).
  { intros x Hx.
    pose proof (avl_descendant_avoids_ancestors__left_rotation_graph_heights
      before root promoted x x Hbefore Hvroot
      (or_introl Hleftroot) (or_introl Hx)) as Haway.
    assert (Hself : avl_reachable before x x) by
      (unfold avl_reachable, GraphLib.examples.bst.bt_path; reflexivity).
    destruct (Haway Hself) as [_ [Hneprom Hneroot]].
    split; assumption. }
  pose proof (avl_right_rotation_child_height_transfer__right_rotation_graph
    before after root promoted (avl_left before promoted) Hrot HBavoid) as HtransferB.
  pose proof (avl_right_rotation_pivot_children__right_rotation_graph
    before after root promoted Hbefore Hrot) as [Hright [Hleft _]].
  unfold avl_recomputed_at in Hrecompute.
  rewrite Hright, Hleft, HtransferB in Hrecompute.
  rewrite <- Ha, <- Hb in Hrecompute.
  rewrite (unsigned_last_nbits_eq a 32) in Hcomp by lia.
  rewrite (unsigned_last_nbits_eq b 32) in Hcomp by lia.
  eapply (avl_height_uint_max_le__left_rotation_graph_heights b a); eauto; lia.
Qed.
Lemma avl_nonpivot_region__right_rotation_graph :
  forall g x y z q, avl_height_input_valid g -> avl_root g = Some x ->
    avl_vvalid g x -> avl_left g x = Some y ->
    avl_vvalid g z -> z <> x -> z <> y -> avl_reachable g z q ->
    avl_vvalid g q /\ q <> x /\ q <> y.
Proof.
  intros g x y z q Hv Hr Hx Hxy Hz Hzx Hzy Hpath.
  pose proof (GraphLib.examples.bst.bst_binary_tree _ (proj1 Hv)) as Htree.
  split.
  - eapply GraphLib.examples.bst.bt_path_end_valid_early; eauto.
  - split.
    + intro E; subst q. apply Hzx.
      eapply avl_path_to_root__left_rotation_graph_refinement; eauto.
    + intro E; subst q.
      unfold avl_reachable, GraphLib.examples.bst.bt_path in Hpath.
      induction_n1 Hpath.
      * contradiction.
      * match goal with Hedge : GraphLib.examples.bst.bt_child _ ?a y |- _ => rename a into last end.
        assert (Hlast : avl_vvalid g last).
        { eapply GraphLib.examples.bst.bt_path_end_valid_early; eauto. }
        assert (Elast : last = x).
        { eapply (GraphLib.examples.bst.father_unique _ Htree y last x); eauto. }
        subst last. apply Hzx.
        eapply avl_path_to_root__left_rotation_graph_refinement; eauto.
Qed.
Lemma avl_rotation_model_exists__right_rotation_graph :
  forall g x, avl_right_rotation_input g x ->
  exists after y, avl_left g x = Some y /\ avl_vvalid g y /\ y <> NULL /\
    avl_right_rotation_model g after x y /\ avl_root after = Some y /\
    avl_height_consistent after /\ avl_vertices_nonnull after /\
    avl_height_int_result_safe g (avl_ptr_of (avl_right g x)) /\
    avl_height_int_result_safe g (avl_ptr_of (avl_right g y)) /\
    avl_height_int_result_safe g (avl_ptr_of (avl_left g y)) /\
    avl_height_int_result_safe after x.
Proof.
  intros g x Hinput.
  destruct Hinput as [Hv [Hr [Hx [Hnx [Hny [HAbound HDbound]]]]]].
  destruct (avl_left g x) as [y|] eqn:Hxy; [|contradiction Hny; reflexivity].
  simpl in Hny.
  pose proof (GraphLib.examples.bst.bst_binary_tree _ (proj1 Hv)) as Htree.
  assert (Hy : avl_vvalid g y).
  { eapply (GraphLib.examples.bst.child_valid _ Htree x y Hx). left; exact Hxy. }
  assert (Hne : x <> y).
  { intro E; subst y. eapply GraphLib.examples.bst.bt_child_no_self; eauto.
    left; exact Hxy. }
  pose proof (avl_child_nonnegative__left_rotation_graph_refinement g x _ Hv Hx (or_intror eq_refl)) as HC.
  pose proof (avl_child_nonnegative__left_rotation_graph_refinement g y _ Hv Hy (or_intror eq_refl)) as HB.
  pose proof (avl_child_nonnegative__left_rotation_graph_refinement g y _ Hv Hy (or_introl eq_refl)) as HA.
  simpl avl_ptr_of in HAbound, HDbound.
  assert (Hbounds : 0 <= avl_child_height g (avl_right g x) <= INT_MAX /\
    0 <= avl_child_height g (avl_right g y) <= INT_MAX /\
    0 <= avl_child_height g (avl_left g y) <= INT_MAX) by lia.
  set (d := Z.max (avl_child_height g (avl_right g x)) (avl_child_height g (avl_right g y)) + 1).
  set (p := Z.max d (avl_child_height g (avl_left g y)) + 1).
  set (after := {| avl_bst := GraphLib.examples.bst.bst_with_tree (avl_bst g)
    (GraphLib.examples.bst.right_rotate Z.eq_dec (GraphLib.examples.bst.bst_tree (avl_bst g)) x y);
    avl_height_of := avl_height_update (avl_height_update (avl_height_of g) x d) y p |}).
  assert (Hax : avl_height_of after x = d).
  { unfold after, avl_height_update; simpl. destruct (Z.eq_dec x y); [contradiction|].
    destruct (Z.eq_dec x x); congruence. }
  assert (Hay : avl_height_of after y = p).
  { unfold after, avl_height_update; simpl. destruct (Z.eq_dec y y); congruence. }
  assert (Hother : avl_same_nonlocal_heights g after x y).
  { intros z Hzx Hzy. unfold after, avl_height_update; simpl.
    destruct (Z.eq_dec z y); [contradiction|]. destruct (Z.eq_dec z x); congruence. }
  pose proof (GraphLib.examples.bst.right_rotate_node_domain_sound Z.eq_dec
    (GraphLib.examples.bst.bst_tree (avl_bst g)) x y
    (GraphLib.examples.bst.listV (GraphLib.examples.bst.bst_tree (avl_bst g)))
    (GraphLib.examples.bst.binarytree_node_domain_from_gvalid _ Htree) Hx Hxy Hne) as Hrot.
  pose proof (GraphLib.directed.binarytree.rrc_pivot_children _ _ _ _
    (GraphLib.directed.binarytree.rrnd_core_valid _ _ _ _ _ Hrot)) as Hchildren.
  change (avl_right after y = Some x /\ avl_left after y = avl_left g y /\
    avl_right after x = avl_right g x /\ avl_left after x = avl_right g y) in Hchildren.
  destruct Hchildren as [Hly [Hry [Hlx Hrx]]].
  assert (Havoid : forall z c, avl_vvalid g z -> z <> x ->
    (avl_right g z = Some c \/ avl_left g z = Some c) -> c <> x /\ c <> y).
  { intros z c Hz Hzx Hzc. split.
    - intro E; subst c.
      pose proof (GraphLib.examples.bst.root_no_parents _ Htree z x Hr) as [Hl Hrr].
      destruct Hzc; contradiction.
    - intro E; subst c. apply Hzx.
      eapply (GraphLib.examples.bst.father_unique _ Htree y z x); eauto; unfold GraphLib.examples.bst.bt_child; tauto. }
  assert (Hclx : avl_child_height after (avl_right g x) = avl_child_height g (avl_right g x)).
  { destruct (avl_right g x) as [c|] eqn:Hc; simpl; [|reflexivity].
    apply Hother.
    - intro E; subst c. pose proof (GraphLib.examples.bst.root_no_parents _ Htree x x Hr); tauto.
    - intro E; subst c.
      exact (GraphLib.examples.bst.child_distinct _ Htree x y y Hx Hy Hy Hxy Hc eq_refl). }
  assert (Hchild : forall z c, avl_vvalid g z -> z <> x ->
    (c = avl_right g z \/ c = avl_left g z) -> avl_child_height after c = avl_child_height g c).
  { intros z [c|] Hz Hzx Hc; simpl; [|reflexivity].
    assert (Hedge : avl_right g z = Some c \/ avl_left g z = Some c).
    { destruct Hc; [left|right]; symmetry; assumption. }
    destruct (Havoid z c Hz Hzx Hedge) as [Hcx Hcy]. apply Hother; assumption. }
  assert (Hcly : avl_child_height after (avl_right g y) = avl_child_height g (avl_right g y)).
  { apply (Hchild y _ Hy); [congruence|left; reflexivity]. }
  assert (Hcry : avl_child_height after (avl_left g y) = avl_child_height g (avl_left g y)).
  { apply (Hchild y _ Hy); [congruence|right; reflexivity]. }
  assert (Hm : avl_right_rotation_model g after x y).
  { unfold avl_right_rotation_model. repeat split; try assumption; try reflexivity.
    - unfold avl_recomputed_at. rewrite Hax, Hlx, Hrx, Hclx, Hcly. unfold d. rewrite Z.max_comm. reflexivity.
    - unfold avl_recomputed_at. rewrite Hay, Hly, Hry, Hcry.
      change (p = Z.max (avl_child_height g (avl_left g y)) (avl_height_of after x) + 1).
      rewrite Hax. unfold p. rewrite Z.max_comm. reflexivity. }
  assert (Hroot : avl_root after = Some y).
  { exact (proj1 (GraphLib.directed.binarytree.rrc_root _ _ _ _
      (GraphLib.directed.binarytree.rrnd_core_valid _ _ _ _ _ Hrot)) Hr). }
  assert (Hheight : avl_height_consistent after).
  { intros z Hz. change (avl_vvalid g z) in Hz.
    destruct (Z.eq_dec z x) as [->|Hzx].
    - rewrite Hax. split; [unfold d; lia|]. rewrite Hlx, Hrx, Hclx, Hcly. unfold d. rewrite Z.max_comm. reflexivity.
    - destruct (Z.eq_dec z y) as [->|Hzy].
      + rewrite Hay. split; [unfold p,d; lia|]. rewrite Hly, Hry, Hcry.
        change (p = Z.max (avl_child_height g (avl_left g y)) (avl_height_of after x) + 1).
        rewrite Hax. unfold p. rewrite Z.max_comm. reflexivity.
      + pose proof (avl_right_rotation_other_children__right_rotation_graph
          g after x y z Hv Hr Hz Hzx Hzy Hm) as [Hl Hrr].
        rewrite (Hother z Hzx Hzy), Hl, Hrr.
        rewrite (Hchild z _ Hz Hzx (or_intror eq_refl)), (Hchild z _ Hz Hzx (or_introl eq_refl)).
        exact (proj1 (proj2 Hv) z Hz). }
  exists after, y. split; [reflexivity|]. split; [exact Hy|].
  split; [exact Hny|]. split; [exact Hm|]. split; [exact Hroot|].
  split; [exact Hheight|]. split; [|split; [|split; [|split]]].
  - intros z Hz. apply (proj2 (proj2 Hv) z). exact Hz.
  - unfold avl_height_int_result_safe. destruct (avl_right g x) as [v|] eqn:Hc; simpl; intros Hnn; [|contradiction].
    pose proof Hbounds as [Hbnd _]. simpl in Hbnd. lia.
  - unfold avl_height_int_result_safe. destruct (avl_right g y) as [v|] eqn:Hc; simpl; intros Hnn; [|contradiction].
    pose proof Hbounds as [_ [Hbnd _]]. simpl in Hbnd. lia.
  - unfold avl_height_int_result_safe. destruct (avl_left g y) as [v|] eqn:Hc; simpl; intros Hnn; [|contradiction].
    pose proof Hbounds as [_ [_ Hbnd]]. simpl in Hbnd. lia.
  - unfold avl_height_int_result_safe. rewrite Hax. unfold d. intros. lia.
Qed.
Lemma avl_right_rotation_bst__right_rotation_graph :
  forall g after x y, avl_height_input_valid g -> avl_root g = Some x ->
    avl_right_rotation_model g after x y -> avl_bst_valid after.
Proof.
  intros g after x y Hv Hr Hm.
  pose proof Hm as [Hx [Hxy [Heq _]]].
  pose proof (GraphLib.examples.bst.bst_binary_tree _ (proj1 Hv)) as Htree.
  assert (Hy : avl_vvalid g y).
  { eapply (GraphLib.examples.bst.child_valid _ Htree x y Hx). left; exact Hxy. }
  pose proof (avl_right_rotation_pivot_children__right_rotation_graph
    g after x y Hv Hm) as [Hly [Hry [Hlx Hrx]]].
  assert (Hkeys : forall z, avl_key_of after z = avl_key_of g z).
  { intros z; exact (proj1 (avl_right_rotation_domain_keys__right_rotation_graph g after x y z Hm)). }
  assert (Horder : avl_key_of g y < avl_key_of g x).
  { apply (GraphLib.examples.bst.bst_left_order _ (proj1 Hv) x y Hx).
    exists y; split; [exact Hxy|reflexivity]. }
  assert (HL : forall c v, avl_right g x = Some c -> avl_reachable after c v ->
    GraphLib.examples.bst.bt_right_subtree (GraphLib.examples.bst.bst_tree (avl_bst g)) x v).
  { intros c v Hc Hp. exists c; split; [exact Hc|].
    unshelve eapply (proj2 (avl_right_rotation_subtree_path_equiv__right_rotation_graph
      g after x y c c v Hv Hr Hm _ (ltac:(reflexivity)))).
    - intros z Hz. eapply avl_right_child_avoids_left_pivot__right_rotation_graph; eauto.
    - exact Hp. }
  assert (HM : forall c v, avl_right g y = Some c -> avl_reachable after c v ->
    GraphLib.examples.bst.bt_right_subtree (GraphLib.examples.bst.bst_tree (avl_bst g)) y v).
  { intros c v Hc Hp. exists c; split; [exact Hc|].
    unshelve eapply (proj2 (avl_right_rotation_subtree_path_equiv__right_rotation_graph
      g after x y c c v Hv Hr Hm _ (ltac:(reflexivity)))).
    - intros z Hz. pose proof (avl_descendant_avoids_ancestors__left_rotation_graph_heights
        g x y c z Hv Hx (or_introl Hxy) (or_intror Hc) Hz). tauto.
    - exact Hp. }
  assert (HR : forall c v, avl_left g y = Some c -> avl_reachable after c v ->
    GraphLib.examples.bst.bt_left_subtree (GraphLib.examples.bst.bst_tree (avl_bst g)) y v).
  { intros c v Hc Hp. exists c; split; [exact Hc|].
    unshelve eapply (proj2 (avl_right_rotation_subtree_path_equiv__right_rotation_graph
      g after x y c c v Hv Hr Hm _ (ltac:(reflexivity)))).
    - intros z Hz. pose proof (avl_descendant_avoids_ancestors__left_rotation_graph_heights
        g x y c z Hv Hx (or_introl Hxy) (or_introl Hc) Hz). tauto.
    - exact Hp. }
  assert (Hpathx : forall v, avl_reachable after x v -> avl_key_of g y < avl_key_of g v).
  { intros v Hp. unfold avl_reachable, GraphLib.examples.bst.bt_path in Hp.
    destruct Hp as [n Hn]. destruct n.
    - change (x = v) in Hn. subst v. exact Horder.
    - simpl in Hn. destruct Hn as [c [Hedge Htail]].
      unfold Sets.test1 in Hedge; simpl in Hedge.
      unfold Sets.lift1 in Htail; simpl in Htail.
      change (GraphLib.examples.bst.bt_child (GraphLib.examples.bst.bst_tree (avl_bst after)) x c) in Hedge.
      assert (Hrest : clos_refl_trans (GraphLib.examples.bst.bt_child (GraphLib.examples.bst.bst_tree (avl_bst after))) c v)
        by (exists n; exact Htail).
      change (avl_left after x = Some c \/ avl_right after x = Some c) in Hedge.
      assert (Hedge' : avl_right after x = Some c \/ avl_left after x = Some c) by tauto.
      clear Hedge. rename Hedge' into Hedge.
      rewrite Hlx, Hrx in Hedge.
      destruct Hedge as [Hl|Hmid].
      + pose proof (GraphLib.examples.bst.bst_right_order _ (proj1 Hv) x v Hx (HL c v Hl Hrest)).
        unfold avl_key_of in *; lia.
      + pose proof (GraphLib.examples.bst.bst_right_order _ (proj1 Hv) y v Hy (HM c v Hmid Hrest)).
        unfold avl_key_of in *; lia. }
  assert (Hnon : forall z c v, avl_vvalid g z -> z <> x -> z <> y ->
    (avl_left g z = Some c \/ avl_right g z = Some c) ->
    avl_reachable after c v -> avl_reachable g c v).
  { intros z c v Hz Hzx Hzy Hc Hp.
    unshelve eapply (proj2 (avl_right_rotation_subtree_path_equiv__right_rotation_graph
      g after x y z c v Hv Hr Hm _ _)).
    - intros q Hq. eapply avl_nonpivot_region__right_rotation_graph; eauto.
    - unfold avl_reachable, GraphLib.examples.bst.bt_path.
      transitivity_1n c; [exact Hc|reflexivity].
    - exact Hp. }
  unfold avl_bst_valid. constructor.
  - rewrite Heq; simpl. eapply GraphLib.examples.bst.right_rotate_preserves_gvalid; eauto.
  - intros z v Hz [c [Hc Hp]].
    change (avl_vvalid after z) in Hz.
    apply (proj2 (proj2 (avl_right_rotation_domain_keys__right_rotation_graph g after x y z Hm))) in Hz.
    change (avl_left after z = Some c) in Hc.
    change (avl_key_of after v < avl_key_of after z). rewrite !Hkeys.
    destruct (Z.eq_dec z x) as [->|Hzx].
    + rewrite Hrx in Hc. apply (GraphLib.examples.bst.bst_left_order _ (proj1 Hv) x v Hx).
      exists y; split; [exact Hxy|].
      destruct (HM c v Hc Hp) as [m [Hmc Hmp]].
      unfold GraphLib.examples.bst.bt_path. transitivity_1n m; [right; exact Hmc|exact Hmp].
    + destruct (Z.eq_dec z y) as [->|Hzy].
      * rewrite Hry in Hc. apply (GraphLib.examples.bst.bst_left_order _ (proj1 Hv) y v Hy).
        exact (HR c v Hc Hp).
      * pose proof (avl_right_rotation_other_children__right_rotation_graph g after x y z Hv Hr Hz Hzx Hzy Hm) as [_ Hrr].
        rewrite Hrr in Hc. apply (GraphLib.examples.bst.bst_left_order _ (proj1 Hv) z v Hz).
        exists c; split; [exact Hc|]. exact (Hnon z c v Hz Hzx Hzy (or_introl Hc) Hp).
  - intros z v Hz [c [Hc Hp]].
    change (avl_vvalid after z) in Hz.
    apply (proj2 (proj2 (avl_right_rotation_domain_keys__right_rotation_graph g after x y z Hm))) in Hz.
    change (avl_right after z = Some c) in Hc.
    change (avl_key_of after z < avl_key_of after v). rewrite !Hkeys.
    destruct (Z.eq_dec z x) as [->|Hzx].
    + rewrite Hlx in Hc. apply (GraphLib.examples.bst.bst_right_order _ (proj1 Hv) x v Hx).
      exact (HL c v Hc Hp).
    + destruct (Z.eq_dec z y) as [->|Hzy].
      * rewrite Hly in Hc. inversion Hc; subst c. exact (Hpathx v Hp).
      * pose proof (avl_right_rotation_other_children__right_rotation_graph g after x y z Hv Hr Hz Hzx Hzy Hm) as [Hl _].
        rewrite Hl in Hc. apply (GraphLib.examples.bst.bst_right_order _ (proj1 Hv) z v Hz).
        exists c; split; [exact Hc|]. exact (Hnon z c v Hz Hzx Hzy (or_intror Hc) Hp).
Qed.
Lemma avl_right_rotation_output_exists__right_rotation_graph :
  forall g x, avl_right_rotation_input g x -> exists after y,
    avl_left g x = Some y /\ avl_vvalid g y /\
    avl_right_rotation_result g after x y /\
    avl_height_int_result_safe g (avl_ptr_of (avl_right g x)) /\
    avl_height_int_result_safe g (avl_ptr_of (avl_right g y)) /\
    avl_height_int_result_safe g (avl_ptr_of (avl_left g y)) /\
    avl_height_int_result_safe after x.
Proof.
  intros g x Hi.
  destruct (avl_rotation_model_exists__right_rotation_graph g x Hi)
    as [after [y [Hxy [Hy [Hny [Hm [Hr [Hh [Hn [Ha [Hb [Hc Hd]]]]]]]]]]]].
  exists after, y. split; [exact Hxy|]. split; [exact Hy|]. split; [|tauto].
  unfold avl_right_rotation_result.
  split; [rewrite Hxy; reflexivity|]. split; [exact Hny|].
  split; [exact Hr|]. split; [exact Hm|]. split.
  - split.
    + exact (avl_right_rotation_bst__right_rotation_graph g after x y (proj1 Hi) (proj1 (proj2 Hi)) Hm).
    + tauto.
  - split.
    + exact (proj1 (proj2 (avl_right_rotation_domain_keys__right_rotation_graph g after x y x Hm))).
    + intros z. exact (proj1 (avl_right_rotation_domain_keys__right_rotation_graph g after x y z Hm)).
Qed.
Lemma avl_cache_node_unchanged__right_rotation_graph :
  forall g x cached z, z <> x ->
    avl_graph_node_store (avl_with_root_cache g x cached) z = avl_graph_node_store g z.
Proof.
  intros g x cached z Hne.
  unfold avl_graph_node_store, avl_with_root_cache, avl_vvalid, avl_key_of,
    avl_left, avl_right, avl_height_update; simpl.
  destruct (Z.eq_dec z x); [contradiction|reflexivity].
Qed.
Lemma avl_cache_nodes_unchanged__right_rotation_graph :
  forall g x cached xs, Forall (fun z => z <> x) xs ->
    avl_graph_nodes_store (avl_with_root_cache g x cached) xs = avl_graph_nodes_store g xs.
Proof.
  intros g x cached xs Hxs. unfold avl_graph_nodes_store.
  f_equal. induction Hxs; simpl; [reflexivity|].
  rewrite avl_cache_node_unchanged__right_rotation_graph by assumption.
  rewrite IHHxs. reflexivity.
Qed.
Lemma avl_cache_subtree_restore__right_rotation_graph :
  forall g x cached s, avl_height_input_valid g -> avl_root g = Some x ->
  s <> x -> (s <> NULL -> avl_vvalid g s) ->
  avl_graph_nodes_store (avl_with_root_cache g x cached) (avl_subtree_nodes g s)
  |-- avl_subtree_store_at g s.
Proof.
  intros g x cached s Hv Hr Hsx Hs.
  assert (Ha : Forall (fun z => z <> x) (avl_subtree_nodes g s)).
  { apply Forall_forall. intros z Hz E. subst z.
    unfold avl_subtree_nodes in Hz.
    apply GraphLib.graph_basic.valid_NoDup_list_spec in Hz as [_ Hp].
    apply Hsx. eapply avl_path_to_root__left_rotation_graph_refinement; eauto. }
  rewrite (avl_cache_nodes_unchanged__right_rotation_graph g x cached _ Ha).
  unfold avl_subtree_store_at. entailer!.
Qed.
Lemma avl_tree_store_right_rotation_expose_cached_root__right_rotation_graph :
  forall g x y cached, avl_height_input_valid g -> avl_root g = Some x ->
    avl_vvalid g x -> x <> NULL -> avl_left g x = Some y ->
    avl_vvalid g y -> y <> NULL ->
    avl_tree_store (avl_with_root_cache g x cached) |--
    (&(x # "AvlNode" ->ₛ "data") # Int |-> avl_key_of g x) **
    (&(x # "AvlNode" ->ₛ "height") # UInt |-> cached) **
    (&(x # "AvlNode" ->ₛ "right") # Ptr |-> avl_ptr_of (avl_right g x)) **
    (&(x # "AvlNode" ->ₛ "left") # Ptr |-> y) **
    (&(y # "AvlNode" ->ₛ "data") # Int |-> avl_key_of g y) **
    (&(y # "AvlNode" ->ₛ "height") # UInt |-> avl_height_of g y) **
    (&(y # "AvlNode" ->ₛ "right") # Ptr |-> avl_ptr_of (avl_right g y)) **
    (&(y # "AvlNode" ->ₛ "left") # Ptr |-> avl_ptr_of (avl_left g y)) **
    avl_subtree_store_at g (avl_ptr_of (avl_right g x)) **
    avl_subtree_store_at g (avl_ptr_of (avl_right g y)) **
    avl_subtree_store_at g (avl_ptr_of (avl_left g y)).
Proof.
  intros g x y cached Hv Hr Hx Hnx Hxy Hy Hny.
  pose proof (GraphLib.examples.bst.bst_binary_tree _ (proj1 Hv)) as Ht.
  assert (Hyx : y <> x).
  { intro E; subst y. eapply GraphLib.examples.bst.bt_child_no_self; eauto. left; exact Hxy. }
  assert (Haway : forall z child, avl_vvalid g z ->
    (avl_left g z = child \/ avl_right g z = child) -> avl_ptr_of child <> x).
  { intros z [c|] Hz Hc; simpl; [|congruence].
    intro E; subst c. pose proof (GraphLib.examples.bst.root_no_parents _ Ht z x Hr); tauto. }
  unfold avl_tree_store.
  change (avl_nodes (avl_with_root_cache g x cached)) with (avl_nodes g).
  rewrite <- (avl_root_subtree_nodes_eq__left_rotation_graph_heights g x Hv Hr).
  rewrite (avl_graph_nodes_store_permutation__graph_store_decomposition
    (avl_with_root_cache g x cached) _ _ (avl_subtree_nodes_partition__height_accessor g x Hv Hx)).
  rewrite avl_graph_nodes_store_cons__graph_store_decomposition.
  sep_apply_l_atomic (avl_graph_nodes_store_split__graph_store_decomposition
    (avl_with_root_cache g x cached) (avl_subtree_nodes g (avl_ptr_of (avl_left g x)))
    (avl_subtree_nodes g (avl_ptr_of (avl_right g x)))).
  rewrite Hxy. simpl avl_ptr_of.
  rewrite (avl_graph_nodes_store_permutation__graph_store_decomposition
    (avl_with_root_cache g x cached) _ _ (avl_subtree_nodes_partition__height_accessor g y Hv Hy)).
  rewrite avl_graph_nodes_store_cons__graph_store_decomposition.
  sep_apply_l_atomic (avl_graph_nodes_store_split__graph_store_decomposition
    (avl_with_root_cache g x cached) (avl_subtree_nodes g (avl_ptr_of (avl_left g y)))
    (avl_subtree_nodes g (avl_ptr_of (avl_right g y)))).
  sep_apply_l_atomic (avl_cache_subtree_restore__right_rotation_graph
    g x cached (avl_ptr_of (avl_right g x)) Hv Hr
    (Haway x _ Hx (or_intror eq_refl))
    (avl_right_child_nonnull_valid__height_accessor g x Hv Hx)).
  sep_apply_l_atomic (avl_cache_subtree_restore__right_rotation_graph
    g x cached (avl_ptr_of (avl_right g y)) Hv Hr
    (Haway y _ Hy (or_intror eq_refl))
    (avl_right_child_nonnull_valid__height_accessor g y Hv Hy)).
  sep_apply_l_atomic (avl_cache_subtree_restore__right_rotation_graph
    g x cached (avl_ptr_of (avl_left g y)) Hv Hr
    (Haway y _ Hy (or_introl eq_refl))
    (avl_left_child_nonnull_valid__height_accessor g y Hv Hy)).
  rewrite (avl_cache_node_unchanged__right_rotation_graph g x cached y Hyx).
  unfold avl_graph_node_store.
  change (avl_vvalid (avl_with_root_cache g x cached) x) with (avl_vvalid g x).
  change (avl_key_of (avl_with_root_cache g x cached) x) with (avl_key_of g x).
  change (avl_left (avl_with_root_cache g x cached) x) with (avl_left g x).
  change (avl_right (avl_with_root_cache g x cached) x) with (avl_right g x).
  assert (Hcache : avl_height_of (avl_with_root_cache g x cached) x = cached).
  { unfold avl_with_root_cache, avl_height_update; simpl. destruct (Z.eq_dec x x); congruence. }
  rewrite Hcache, Hxy. simpl avl_ptr_of. entailer!.
Qed.

(** Additive caller interface for left rotation of x(A,y(B,C)) with an
    independent old-root cache. The abstract graph has exact heights. Only
    A, B, C and d=max(height(A),height(B))+1 are read through signed int;
    bounding d also bounds A and B. The virtual root height need not fit
    signed int, and the stale concrete root cache is never read. *)
Definition avl_left_rotation_cached_input (g : avl_model) (root : addr) : Prop :=
  avl_height_input_valid g /\
  avl_root g = Some root /\
  avl_vvalid g root /\
  root <> NULL /\
  avl_ptr_of (avl_right g root) <> NULL /\
  avl_child_height g
    (avl_right g (avl_ptr_of (avl_right g root))) <= INT_MAX /\
  Z.max
    (avl_child_height g (avl_left g root))
    (avl_child_height g (avl_left g (avl_ptr_of (avl_right g root)))) + 1 <= INT_MAX.

Lemma avl_left_cached_child_bounds__left_rotation_cached_graph :
  forall g x y, avl_left_rotation_cached_input g x -> avl_right g x = Some y ->
    let a := avl_child_height g (avl_left g x) in
    let b := avl_child_height g (avl_left g y) in
    let c := avl_child_height g (avl_right g y) in
    0 <= a /\ 0 <= b /\ 0 <= c /\
    a <= INT_MAX /\ b <= INT_MAX /\ c <= INT_MAX /\
    1 <= Z.max a b + 1 <= INT_MAX /\
    1 <= Z.max (Z.max a b + 1) c + 1 <= UINT_MAX.
Proof.
  intros g x y [Hv [Hr [Hx [Hnx [Hny [Hcmax Hmax]]]]]] Hxy; cbv zeta.
  pose proof (GraphLib.examples.bst.bst_binary_tree _ (proj1 Hv)) as Htree.
  assert (Hy : avl_vvalid g y).
  { eapply (GraphLib.examples.bst.child_valid _ Htree x y Hx). right; exact Hxy. }
  pose proof (avl_child_nonnegative__left_rotation_graph_refinement g x _ Hv Hx (or_introl eq_refl)) as Ha.
  pose proof (avl_child_nonnegative__left_rotation_graph_refinement g y _ Hv Hy (or_introl eq_refl)) as Hb.
  pose proof (avl_child_nonnegative__left_rotation_graph_refinement g y _ Hv Hy (or_intror eq_refl)) as Hc.
  rewrite Hxy in Hcmax, Hmax. simpl avl_ptr_of in Hcmax, Hmax.
  repeat split; lia.
Qed.
Lemma avl_left_cached_model_exists__left_rotation_cached_graph :
  forall g x, avl_left_rotation_cached_input g x ->
  exists after y, avl_right g x = Some y /\ avl_vvalid g y /\ y <> NULL /\
    avl_left_rotation_model g after x y /\ avl_root after = Some y /\
    avl_height_consistent after /\ avl_vertices_nonnull after /\
    avl_height_int_result_safe g (avl_ptr_of (avl_left g x)) /\
    avl_height_int_result_safe g (avl_ptr_of (avl_left g y)) /\
    avl_height_int_result_safe g (avl_ptr_of (avl_right g y)) /\
    avl_height_int_result_safe after x.
Proof.
  intros g x Hinput.
  destruct Hinput as [Hv [Hr [Hx [Hnx [Hny [Hcmax Hmax]]]]]].
  destruct (avl_right g x) as [y|] eqn:Hxy; [|contradiction Hny; reflexivity].
  simpl in Hny.
  pose proof (GraphLib.examples.bst.bst_binary_tree _ (proj1 Hv)) as Htree.
  assert (Hy : avl_vvalid g y).
  { eapply (GraphLib.examples.bst.child_valid _ Htree x y Hx). right; exact Hxy. }
  assert (Hne : x <> y).
  { intro E; subst y. eapply GraphLib.examples.bst.bt_child_no_self; eauto.
    right; exact Hxy. }
  pose proof (avl_left_cached_child_bounds__left_rotation_cached_graph g x y
    (ltac:(unfold avl_left_rotation_cached_input; rewrite Hxy; simpl; tauto)) Hxy) as Hbounds.
  cbv zeta in Hbounds.
  set (d := Z.max (avl_child_height g (avl_left g x)) (avl_child_height g (avl_left g y)) + 1).
  set (p := Z.max d (avl_child_height g (avl_right g y)) + 1).
  set (after := {| avl_bst := GraphLib.examples.bst.bst_with_tree (avl_bst g)
    (GraphLib.examples.bst.left_rotate Z.eq_dec (GraphLib.examples.bst.bst_tree (avl_bst g)) x y);
    avl_height_of := avl_height_update (avl_height_update (avl_height_of g) x d) y p |}).
  assert (Hax : avl_height_of after x = d).
  { unfold after, avl_height_update; simpl. destruct (Z.eq_dec x y); [contradiction|].
    destruct (Z.eq_dec x x); congruence. }
  assert (Hay : avl_height_of after y = p).
  { unfold after, avl_height_update; simpl. destruct (Z.eq_dec y y); congruence. }
  assert (Hother : avl_same_nonlocal_heights g after x y).
  { intros z Hzx Hzy. unfold after, avl_height_update; simpl.
    destruct (Z.eq_dec z y); [contradiction|]. destruct (Z.eq_dec z x); congruence. }
  pose proof (GraphLib.examples.bst.left_rotate_node_domain_sound Z.eq_dec
    (GraphLib.examples.bst.bst_tree (avl_bst g)) x y
    (GraphLib.examples.bst.listV (GraphLib.examples.bst.bst_tree (avl_bst g)))
    (GraphLib.examples.bst.binarytree_node_domain_from_gvalid _ Htree) Hx Hxy Hne) as Hrot.
  pose proof (GraphLib.directed.binarytree.lrc_pivot_children _ _ _ _
    (GraphLib.directed.binarytree.lrnd_core_valid _ _ _ _ _ Hrot)) as Hchildren.
  change (avl_left after y = Some x /\ avl_right after y = avl_right g y /\
    avl_left after x = avl_left g x /\ avl_right after x = avl_left g y) in Hchildren.
  destruct Hchildren as [Hly [Hry [Hlx Hrx]]].
  assert (Havoid : forall z c, avl_vvalid g z -> z <> x ->
    (avl_left g z = Some c \/ avl_right g z = Some c) -> c <> x /\ c <> y).
  { intros z c Hz Hzx Hzc. split.
    - intro E; subst c.
      pose proof (GraphLib.examples.bst.root_no_parents _ Htree z x Hr) as [Hl Hrr].
      destruct Hzc; contradiction.
    - intro E; subst c. apply Hzx.
      eapply (GraphLib.examples.bst.father_unique _ Htree y z x); eauto. }
  assert (Hclx : avl_child_height after (avl_left g x) = avl_child_height g (avl_left g x)).
  { destruct (avl_left g x) as [c|] eqn:Hc; simpl; [|reflexivity].
    apply Hother.
    - intro E; subst c. pose proof (GraphLib.examples.bst.root_no_parents _ Htree x x Hr); tauto.
    - intro E; subst c.
      exact (GraphLib.examples.bst.child_distinct _ Htree x y y Hx Hy Hy Hc Hxy eq_refl). }
  assert (Hchild : forall z c, avl_vvalid g z -> z <> x ->
    (c = avl_left g z \/ c = avl_right g z) -> avl_child_height after c = avl_child_height g c).
  { intros z [c|] Hz Hzx Hc; simpl; [|reflexivity].
    assert (Hedge : avl_left g z = Some c \/ avl_right g z = Some c).
    { destruct Hc; [left|right]; symmetry; assumption. }
    destruct (Havoid z c Hz Hzx Hedge) as [Hcx Hcy]. apply Hother; assumption. }
  assert (Hcly : avl_child_height after (avl_left g y) = avl_child_height g (avl_left g y)).
  { apply (Hchild y _ Hy); [congruence|left; reflexivity]. }
  assert (Hcry : avl_child_height after (avl_right g y) = avl_child_height g (avl_right g y)).
  { apply (Hchild y _ Hy); [congruence|right; reflexivity]. }
  assert (Hm : avl_left_rotation_model g after x y).
  { unfold avl_left_rotation_model. repeat split; try assumption; try reflexivity.
    - unfold avl_recomputed_at. rewrite Hax, Hlx, Hrx, Hclx, Hcly. reflexivity.
    - unfold avl_recomputed_at. rewrite Hay, Hly, Hry, Hcry.
      change (p = Z.max (avl_height_of after x) (avl_child_height g (avl_right g y)) + 1).
      rewrite Hax. reflexivity. }
  assert (Hroot : avl_root after = Some y).
  { exact (proj1 (GraphLib.directed.binarytree.lrc_root _ _ _ _
      (GraphLib.directed.binarytree.lrnd_core_valid _ _ _ _ _ Hrot)) Hr). }
  assert (Hheight : avl_height_consistent after).
  { intros z Hz. change (avl_vvalid g z) in Hz.
    destruct (Z.eq_dec z x) as [->|Hzx].
    - rewrite Hax. split; [unfold d; lia|]. rewrite Hlx, Hrx, Hclx, Hcly. reflexivity.
    - destruct (Z.eq_dec z y) as [->|Hzy].
      + rewrite Hay. split; [unfold p,d; lia|]. rewrite Hly, Hry, Hcry.
        change (p = Z.max (avl_height_of after x) (avl_child_height g (avl_right g y)) + 1).
        rewrite Hax. reflexivity.
      + pose proof (avl_left_rotation_other_children__left_rotation_graph_heights
          g after x y z Hv Hr Hz Hzx Hzy Hm) as [Hl Hrr].
        rewrite (Hother z Hzx Hzy), Hl, Hrr.
        rewrite (Hchild z _ Hz Hzx (or_introl eq_refl)), (Hchild z _ Hz Hzx (or_intror eq_refl)).
        exact (proj1 (proj2 Hv) z Hz). }
  exists after, y. split; [reflexivity|]. split; [exact Hy|].
  split; [exact Hny|]. split; [exact Hm|]. split; [exact Hroot|].
  split; [exact Hheight|]. split; [|split; [|split; [|split]]].
  - intros z Hz. apply (proj2 (proj2 Hv) z). exact Hz.
  - unfold avl_height_int_result_safe. destruct (avl_left g x) as [v|] eqn:Hc; simpl; intros Hnn; [|contradiction].
    pose proof Hbounds as [_ [_ [_ [Hbnd _]]]]. exact Hbnd.
  - unfold avl_height_int_result_safe. destruct (avl_left g y) as [v|] eqn:Hc; simpl; intros Hnn; [|contradiction].
    pose proof Hbounds as [_ [_ [_ [_ [Hbnd _]]]]]. exact Hbnd.
  - unfold avl_height_int_result_safe. destruct (avl_right g y) as [v|] eqn:Hc; simpl; intros Hnn; [|contradiction].
    pose proof Hbounds as [_ [_ [_ [_ [_ [Hbnd _]]]]]]. exact Hbnd.
  - unfold avl_height_int_result_safe. rewrite Hax. unfold d. intros. lia.
Qed.
Lemma avl_left_cached_output_exists__left_rotation_cached_graph :
  forall g x, avl_left_rotation_cached_input g x -> exists after y,
    avl_right g x = Some y /\ avl_vvalid g y /\
    avl_left_rotation_result g after x y /\
    avl_height_int_result_safe g (avl_ptr_of (avl_left g x)) /\
    avl_height_int_result_safe g (avl_ptr_of (avl_left g y)) /\
    avl_height_int_result_safe g (avl_ptr_of (avl_right g y)) /\
    avl_height_int_result_safe after x.
Proof.
  intros g x Hi.
  destruct (avl_left_cached_model_exists__left_rotation_cached_graph g x Hi)
    as [after [y [Hxy [Hy [Hny [Hm [Hr [Hh [Hn [Ha [Hb [Hc Hd]]]]]]]]]]]].
  exists after, y. split; [exact Hxy|]. split; [exact Hy|]. split; [|tauto].
  unfold avl_left_rotation_result.
  split; [rewrite Hxy; reflexivity|]. split; [exact Hny|].
  split; [exact Hr|]. split; [exact Hm|]. split.
  - split.
    + exact (avl_left_rotation_bst__left_rotation_graph_refinement g after x y (proj1 Hi) (proj1 (proj2 Hi)) Hm).
    + tauto.
  - split.
    + exact (proj1 (proj2 (avl_left_rotation_domain_keys__left_rotation_graph_heights g after x y x Hm))).
    + intros z. exact (proj1 (avl_left_rotation_domain_keys__left_rotation_graph_heights g after x y z Hm)).
Qed.
Lemma avl_tree_store_left_rotation_expose_cached_root__left_rotation_cached_graph :
  forall g x y cached, avl_height_input_valid g -> avl_root g = Some x ->
    avl_vvalid g x -> x <> NULL -> avl_right g x = Some y ->
    avl_vvalid g y -> y <> NULL ->
    avl_tree_store (avl_with_root_cache g x cached) |--
    (&(x # "AvlNode" ->ₛ "data") # Int |-> avl_key_of g x) **
    (&(x # "AvlNode" ->ₛ "height") # UInt |-> cached) **
    (&(x # "AvlNode" ->ₛ "left") # Ptr |-> avl_ptr_of (avl_left g x)) **
    (&(x # "AvlNode" ->ₛ "right") # Ptr |-> y) **
    (&(y # "AvlNode" ->ₛ "data") # Int |-> avl_key_of g y) **
    (&(y # "AvlNode" ->ₛ "height") # UInt |-> avl_height_of g y) **
    (&(y # "AvlNode" ->ₛ "left") # Ptr |-> avl_ptr_of (avl_left g y)) **
    (&(y # "AvlNode" ->ₛ "right") # Ptr |-> avl_ptr_of (avl_right g y)) **
    avl_subtree_store_at g (avl_ptr_of (avl_left g x)) **
    avl_subtree_store_at g (avl_ptr_of (avl_left g y)) **
    avl_subtree_store_at g (avl_ptr_of (avl_right g y)).
Proof.
  intros g x y cached Hv Hr Hx Hnx Hxy Hy Hny.
  pose proof (GraphLib.examples.bst.bst_binary_tree _ (proj1 Hv)) as Ht.
  assert (Hyx : y <> x).
  { intro E; subst y. eapply GraphLib.examples.bst.bt_child_no_self; eauto. right; exact Hxy. }
  assert (Haway : forall z child, avl_vvalid g z ->
    (avl_left g z = child \/ avl_right g z = child) -> avl_ptr_of child <> x).
  { intros z [c|] Hz Hc; simpl; [|congruence].
    intro E; subst c. pose proof (GraphLib.examples.bst.root_no_parents _ Ht z x Hr); tauto. }
  unfold avl_tree_store.
  change (avl_nodes (avl_with_root_cache g x cached)) with (avl_nodes g).
  rewrite <- (avl_root_subtree_nodes_eq__left_rotation_graph_heights g x Hv Hr).
  rewrite (avl_graph_nodes_store_permutation__graph_store_decomposition
    (avl_with_root_cache g x cached) _ _ (avl_subtree_nodes_partition__height_accessor g x Hv Hx)).
  rewrite avl_graph_nodes_store_cons__graph_store_decomposition.
  sep_apply_l_atomic (avl_graph_nodes_store_split__graph_store_decomposition
    (avl_with_root_cache g x cached) (avl_subtree_nodes g (avl_ptr_of (avl_left g x)))
    (avl_subtree_nodes g (avl_ptr_of (avl_right g x)))).
  rewrite Hxy. simpl avl_ptr_of.
  rewrite (avl_graph_nodes_store_permutation__graph_store_decomposition
    (avl_with_root_cache g x cached) _ _ (avl_subtree_nodes_partition__height_accessor g y Hv Hy)).
  rewrite avl_graph_nodes_store_cons__graph_store_decomposition.
  sep_apply_l_atomic (avl_graph_nodes_store_split__graph_store_decomposition
    (avl_with_root_cache g x cached) (avl_subtree_nodes g (avl_ptr_of (avl_left g y)))
    (avl_subtree_nodes g (avl_ptr_of (avl_right g y)))).
  sep_apply_l_atomic (avl_cache_subtree_restore__right_rotation_graph
    g x cached (avl_ptr_of (avl_left g x)) Hv Hr
    (Haway x _ Hx (or_introl eq_refl))
    (avl_left_child_nonnull_valid__height_accessor g x Hv Hx)).
  sep_apply_l_atomic (avl_cache_subtree_restore__right_rotation_graph
    g x cached (avl_ptr_of (avl_left g y)) Hv Hr
    (Haway y _ Hy (or_introl eq_refl))
    (avl_left_child_nonnull_valid__height_accessor g y Hv Hy)).
  sep_apply_l_atomic (avl_cache_subtree_restore__right_rotation_graph
    g x cached (avl_ptr_of (avl_right g y)) Hv Hr
    (Haway y _ Hy (or_intror eq_refl))
    (avl_right_child_nonnull_valid__height_accessor g y Hv Hy)).
  rewrite (avl_cache_node_unchanged__right_rotation_graph g x cached y Hyx).
  unfold avl_graph_node_store.
  change (avl_vvalid (avl_with_root_cache g x cached) x) with (avl_vvalid g x).
  change (avl_key_of (avl_with_root_cache g x cached) x) with (avl_key_of g x).
  change (avl_right (avl_with_root_cache g x cached) x) with (avl_right g x).
  change (avl_left (avl_with_root_cache g x cached) x) with (avl_left g x).
  assert (Hcache : avl_height_of (avl_with_root_cache g x cached) x = cached).
  { unfold avl_with_root_cache, avl_height_update; simpl. destruct (Z.eq_dec x x); congruence. }
  rewrite Hcache, Hxy. simpl avl_ptr_of. entailer!.
Qed.

(** Generic LR composition. A subtree is a standalone graph: vertices and
    enumeration are restricted to descendants, and edges of excluded vertices
    are cleared to meet BinaryTreeProp.invalid_child_is_none. Heights and keys
    are inherited. Validity and store equivalence are proof obligations. *)
Definition avl_subtree_model (g : avl_model) (cursor : addr) : avl_model :=
  {| avl_bst :=
       {| GraphLib.examples.bst.bst_tree :=
            {| GraphLib.examples.bst.vset :=
                 fun x => avl_vvalid g x /\ avl_reachable g cursor x;
               GraphLib.examples.bst.theroot := Some cursor;
               GraphLib.examples.bst.left_child := fun x =>
                 if excluded_middle_informative (avl_reachable g cursor x)
                 then avl_left g x else None;
               GraphLib.examples.bst.right_child := fun x =>
                 if excluded_middle_informative (avl_reachable g cursor x)
                 then avl_right g x else None;
               GraphLib.examples.bst.listV := avl_subtree_nodes g cursor |};
          GraphLib.examples.bst.bst_key := avl_key_of g |};
     avl_height_of := avl_height_of g |}.

(** Input facts only: exact mathematical BST heights, the three pivots, and
    the initial root-height bound. Stored root cache is independently owned. *)
Definition avl_lr_rotation_input (g : avl_model) (root : addr) : Prop :=
  avl_height_input_valid g /\
  avl_root g = Some root /\ avl_vvalid g root /\ root <> NULL /\
  avl_ptr_of (avl_left g root) <> NULL /\
  avl_ptr_of (avl_right g (avl_ptr_of (avl_left g root))) <> NULL /\
  avl_height_of g root <= INT_MAX.

(** The full-graph inner rotation preserves the old mathematical outer-root
    height. The exact middle graph refreshes that one abstract height. The
    concrete root cache is represented separately by avl_with_root_cache. *)
Definition avl_lr_middle (before middle : avl_model)
    (root left pivot : addr) : Prop :=
  exists raw,
    avl_left_rotation_model before raw left pivot /\
    middle = avl_with_root_cache raw root
      (Z.max (avl_child_height raw (avl_left raw root))
             (avl_child_height raw (avl_right raw root)) + 1).

Definition avl_lr_rotation_result (before after : avl_model)
    (root result : addr) : Prop :=
  result = avl_ptr_of (avl_right before (avl_ptr_of (avl_left before root))) /\
  result <> NULL /\ avl_root after = Some result /\
  avl_lr_rotation_model before after root
    (avl_ptr_of (avl_left before root)) result /\
  avl_height_input_valid after /\
  avl_nodes after = avl_nodes before /\
  (forall x, avl_key_of after x = avl_key_of before x).

Definition avl_lr_rotation_post (before : avl_model)
    (root result : addr) : Assertion :=
  EX after, “ avl_lr_rotation_result before after root result ” &&
    avl_tree_store after.

Require Import Coq.Logic.FunctionalExtensionality.
Lemma avl_lr_middle_left__lr_graph_composition :
  forall g m x l p, avl_lr_rotation_input g x ->
  avl_left g x = Some l -> avl_right g l = Some p ->
  avl_lr_middle g m x l p -> avl_left m x = Some p.
Proof.
  intros g m x l p [Hv [Hr [Hx [Hnx Hrest]]]] Hl Hp [raw [Hrot ->]].
  pose proof (GraphLib.examples.bst.bst_binary_tree _ (proj1 Hv)) as Ht.
  assert (Hlx : l <> x).
  { intro E; subst. eapply GraphLib.examples.bst.bt_child_no_self; eauto. left; exact Hl. }
  assert (Hlp : avl_vvalid g l).
  { eapply (GraphLib.examples.bst.child_valid _ Ht x l Hx). left; exact Hl. }
  assert (Hpx : p <> x).
  { intro E; subst. pose proof (GraphLib.examples.bst.root_no_parents _ Ht l x Hr); tauto. }
  destruct Hrot as [_ [_ [Htrot _]]].
  change (avl_left raw x = Some p).
  unfold avl_left. rewrite Htrot. simpl.
  unfold GraphLib.examples.bst.left_rotate_left_child.
  rewrite GraphLib.examples.bst.iter_override_in by (apply GraphLib.examples.bst.finite_vertices; assumption).
  unfold GraphLib.examples.bst.left_rotate_left_value.
  destruct (Z.eq_dec x p); [congruence|].
  destruct (Z.eq_dec x l); [congruence|].
  change (GraphLib.examples.bst.replace_child Z.eq_dec l p (avl_left g x) = Some p).
  rewrite Hl. unfold GraphLib.examples.bst.replace_child.
  destruct (Z.eq_dec l l) as [E|N]; [reflexivity|exfalso; apply N; reflexivity].
Qed.
Lemma avl_lr_right_cache_transport__lr_graph_composition :
  forall raw after x p cache,
  avl_right_rotation_model (avl_with_root_cache raw x cache) after x p ->
  avl_right_rotation_model raw after x p.
Proof.
  intros raw after x p cache [Hx [Hl [Hb [Hr [Hp Hh]]]]].
  unfold avl_right_rotation_model. split; [exact Hx|].
  split; [exact Hl|]. split; [exact Hb|]. split; [exact Hr|].
  split; [exact Hp|]. intros z Hz Hpz.
  specialize (Hh z Hz Hpz).
  unfold avl_with_root_cache, avl_height_update in Hh; simpl in Hh.
  destruct (Z.eq_dec z x); [contradiction|exact Hh].
Qed.
Lemma avl_lr_compose_result__lr_graph_composition :
  forall g m after x result,
  avl_lr_rotation_input g x ->
  avl_lr_middle g m x (avl_ptr_of (avl_left g x))
    (avl_ptr_of (avl_right g (avl_ptr_of (avl_left g x)))) ->
  avl_right_rotation_result m after x result ->
  avl_lr_rotation_result g after x result.
Proof.
  intros g m after x result Hin Hmid Hout.
  pose proof Hin as [Hv [Hr [Hx [Hnx [Hnl [Hnp Hbound]]]]]].
  destruct (avl_left g x) as [l|] eqn:Hl; [|contradiction].
  simpl avl_ptr_of in Hmid, Hnp.
  destruct (avl_right g l) as [p|] eqn:Hp; [|contradiction].
  simpl avl_ptr_of in Hmid.
  pose proof (avl_lr_middle_left__lr_graph_composition g m x l p Hin Hl Hp Hmid) as Hml.
  destruct Hout as [Hres [Hnr [Hroot [Hrot [Hvalid [Hnodes Hkeys]]]]]].
  rewrite Hml in Hres. simpl avl_ptr_of in Hres. subst result.
  destruct Hmid as [raw [Hinner Hm]]. subst m.
  assert (Hdomain : avl_nodes raw = avl_nodes g).
  { destruct Hinner as [_ [_ [Hb _]]]. unfold avl_nodes. rewrite Hb. reflexivity. }
  assert (Hkey : forall z, avl_key_of raw z = avl_key_of g z).
  { intro z. exact (proj1 (avl_left_rotation_domain_keys__left_rotation_graph_heights g raw l p z Hinner)). }
  unfold avl_lr_rotation_result. rewrite Hl. simpl avl_ptr_of. rewrite Hp. simpl avl_ptr_of.
  split; [reflexivity|]. split; [exact Hnr|]. split; [exact Hroot|].
  split.
  - exists raw. split; [exact Hinner|]. eapply avl_lr_right_cache_transport__lr_graph_composition; exact Hrot.
  - split; [exact Hvalid|]. split.
    + change (avl_nodes after = avl_nodes g). rewrite Hnodes. exact Hdomain.
    + intro z. rewrite Hkeys. apply Hkey.
Qed.
Lemma avl_projection_children__lr_graph_composition :
  forall g s z, avl_reachable g s z ->
    avl_left (avl_subtree_model g s) z = avl_left g z /\
    avl_right (avl_subtree_model g s) z = avl_right g z.
Proof.
  intros g s z Hp. unfold avl_left, avl_right, avl_subtree_model; simpl.
  destruct (excluded_middle_informative (avl_reachable g s z)); tauto.
Qed.
Lemma avl_projection_path__lr_graph_composition :
  forall g s a b, avl_reachable g s a ->
    (avl_reachable g a b <-> avl_reachable (avl_subtree_model g s) a b).
Proof.
  intros g s a b Ha.
  apply (avl_path_equiv_on_closed_region__left_rotation_graph_heights addr
    (GraphLib.examples.bst.bt_child (GraphLib.examples.bst.bst_tree (avl_bst g)))
    (GraphLib.examples.bst.bt_child (GraphLib.examples.bst.bst_tree (avl_bst (avl_subtree_model g s)))) s); [|exact Ha].
  intros z v Hz. pose proof (avl_projection_children__lr_graph_composition g s z Hz) as [Hl Hr].
  change ((avl_left g z = Some v \/ avl_right g z = Some v) <->
    (avl_left (avl_subtree_model g s) z = Some v \/ avl_right (avl_subtree_model g s) z = Some v)).
  rewrite Hl, Hr. reflexivity.
Qed.
Lemma avl_subtree_projection_valid__lr_graph_composition :
  forall g s, avl_height_input_valid g -> avl_vvalid g s ->
    avl_height_input_valid (avl_subtree_model g s).
Proof.
  intros g s Hv Hs.
  pose proof (GraphLib.examples.bst.bst_binary_tree _ (proj1 Hv)) as Ht.
  assert (Hstep : forall a b, avl_reachable g s a ->
    (avl_left g a = Some b \/ avl_right g a = Some b) -> avl_reachable g s b).
  { intros a b Ha Hab. unfold avl_reachable, GraphLib.examples.bst.bt_path in *.
    etransitivity; [exact Ha|]. transitivity_1n b; [exact Hab|reflexivity]. }
  assert (Hrootpath : avl_reachable g s s) by reflexivity.
  unfold avl_height_input_valid, avl_tree_valid. split.
  - unfold avl_bst_valid. constructor.
    + constructor; simpl.
      * intros r E. inversion E; subst. split; assumption.
      * intros z r E. inversion E; subst r.
        destruct (excluded_middle_informative (avl_reachable g s z)) as [Hp|Hp]; simpl; [|split; discriminate].
        assert (Hz : avl_vvalid g z).
        { eapply GraphLib.examples.bst.bt_path_end_valid_early; eauto. }
        split; intro Hc.
        -- exact (GraphLib.examples.bst.bt_child_no_back_path _ z s Ht Hz (or_introl Hc) Hp).
        -- exact (GraphLib.examples.bst.bt_child_no_back_path _ z s Ht Hz (or_intror Hc) Hp).
      * intros y x1 x2 [Hx1 Hp1] [Hx2 Hp2] Hc1 Hc2.
        destruct (excluded_middle_informative (avl_reachable g s x1)); [|contradiction].
        destruct (excluded_middle_informative (avl_reachable g s x2)); [|contradiction].
        eapply GraphLib.examples.bst.father_unique; eauto.
      * intros a b [Ha Hp] Hc.
        destruct (excluded_middle_informative (avl_reachable g s a)); [|contradiction].
        split; [eapply GraphLib.examples.bst.child_valid; eauto|eapply Hstep; eauto].
      * intros z Hbad.
        destruct (excluded_middle_informative (avl_reachable g s z)) as [Hp|Hp]; [|auto].
        exfalso. apply Hbad. split; [|exact Hp].
        eapply GraphLib.examples.bst.bt_path_end_valid_early; eauto.
      * intros a b c [Ha Hpa] [Hb Hpb] [Hc Hpc] Hl Hr.
        destruct (excluded_middle_informative (avl_reachable g s a)); [|contradiction].
        exact (GraphLib.examples.bst.child_distinct _ Ht a b c Ha Hb Hc Hl Hr).
      * intros z [Hz Hp]. exists s. split; [reflexivity|].
        apply (proj1 (avl_projection_path__lr_graph_composition g s s z Hrootpath)). exact Hp.
      * intros z [Hz Hp]. unfold avl_subtree_nodes.
        apply GraphLib.graph_basic.valid_NoDup_list_spec. split; [|exact Hp].
        eapply GraphLib.examples.bst.finite_vertices; eauto.
      * intros z Hz. unfold avl_subtree_nodes in Hz.
        apply GraphLib.graph_basic.valid_NoDup_list_spec in Hz as [Hz Hp]. split; [|exact Hp].
        eapply GraphLib.examples.bst.listV_sound; eauto.
      * apply GraphLib.graph_basic.valid_NoDup_list_NoDup.
    + intros a b [Ha Hpa] [c [Hl Hp]].
      change (avl_left (avl_subtree_model g s) a = Some c) in Hl.
      rewrite (proj1 (avl_projection_children__lr_graph_composition g s a Hpa)) in Hl.
      apply (GraphLib.examples.bst.bst_left_order _ (proj1 Hv) a b Ha).
      exists c. split; [exact Hl|].
      apply (proj2 (avl_projection_path__lr_graph_composition g s c b (Hstep a c Hpa (or_introl Hl)))). exact Hp.
    + intros a b [Ha Hpa] [c [Hr Hp]].
      change (avl_right (avl_subtree_model g s) a = Some c) in Hr.
      rewrite (proj2 (avl_projection_children__lr_graph_composition g s a Hpa)) in Hr.
      apply (GraphLib.examples.bst.bst_right_order _ (proj1 Hv) a b Ha).
      exists c. split; [exact Hr|].
      apply (proj2 (avl_projection_path__lr_graph_composition g s c b (Hstep a c Hpa (or_intror Hr)))). exact Hp.
  - split.
    + intros z [Hz Hp]. pose proof (proj1 (proj2 Hv) z Hz) as [Hb He].
      split; [exact Hb|]. unfold avl_recomputed_at in *.
      pose proof (avl_projection_children__lr_graph_composition g s z Hp) as [Hl Hr].
      rewrite Hl, Hr. exact He.
    + intros z [Hz Hp]. apply (proj2 (proj2 Hv) z Hz).
Qed.
Lemma avl_projection_nodes_store__lr_graph_composition :
  forall g s xs, Forall (avl_reachable g s) xs ->
  avl_graph_nodes_store g xs |-- avl_graph_nodes_store (avl_subtree_model g s) xs.
Proof.
  intros g s xs Hxs. induction Hxs as [|z xs Hp Hxs IH].
  - unfold avl_graph_nodes_store; simpl; reflexivity.
  - rewrite !avl_graph_nodes_store_cons__graph_store_decomposition.
    sep_apply_l_atomic IH. cancel (avl_graph_nodes_store (avl_subtree_model g s) xs).
    unfold avl_graph_node_store.
    pose proof (avl_projection_children__lr_graph_composition g s z Hp) as [Hl Hr].
    rewrite Hl, Hr.
    change (avl_key_of (avl_subtree_model g s) z) with (avl_key_of g z).
    change (avl_height_of (avl_subtree_model g s) z) with (avl_height_of g z).
    entailer!. split; assumption.
Qed.
Lemma avl_subtree_projection_store__lr_graph_composition :
  forall g s, avl_subtree_store_at g s |-- avl_tree_store (avl_subtree_model g s).
Proof.
  intros g s. unfold avl_tree_store.
  change (avl_nodes (avl_subtree_model g s)) with (avl_subtree_nodes g s).
  unfold avl_subtree_store_at. Intros_p Hs.
  apply avl_projection_nodes_store__lr_graph_composition.
  apply Forall_forall. intros z Hz. unfold avl_subtree_nodes in Hz.
  apply GraphLib.graph_basic.valid_NoDup_list_spec in Hz. tauto.
Qed.
Lemma avl_cache_self__lr_graph_composition :
  forall g s, avl_with_root_cache g s (avl_height_of g s) = g.
Proof.
  intros [b h] s. unfold avl_with_root_cache; simpl.
  f_equal. apply functional_extensionality. intro z.
  unfold avl_height_update. destruct (Z.eq_dec z s); congruence.
Qed.
Lemma avl_lr_prepare_inner__lr_graph_composition :
  forall g x, avl_lr_rotation_input g x ->
  avl_left_rotation_cached_input (avl_subtree_model g (avl_ptr_of (avl_left g x)))
    (avl_ptr_of (avl_left g x)).
Proof.
  intros g x [Hv [Hr [Hx [Hnx [Hnl [Hnp Hbound]]]]]].
  destruct (avl_left g x) as [l|] eqn:Hl; [|contradiction].
  simpl avl_ptr_of in *.
  destruct (avl_right g l) as [p|] eqn:Hp; [|contradiction].
  simpl avl_ptr_of in *.
  pose proof (GraphLib.examples.bst.bst_binary_tree _ (proj1 Hv)) as Ht.
  assert (HvL : avl_vvalid g l).
  { eapply (GraphLib.examples.bst.child_valid _ Ht x l Hx). left; exact Hl. }
  assert (HvP : avl_vvalid g p).
  { eapply (GraphLib.examples.bst.child_valid _ Ht l p HvL). right; exact Hp. }
  assert (Hlp : avl_reachable g l p).
  { unfold avl_reachable, GraphLib.examples.bst.bt_path. transitivity_1n p; [right; exact Hp|reflexivity]. }
  pose proof (avl_projection_children__lr_graph_composition g l l (ltac:(reflexivity))) as [Hll Hlr].
  pose proof (avl_projection_children__lr_graph_composition g l p Hlp) as [Hpl Hpr].
  unfold avl_left_rotation_cached_input.
  split; [apply avl_subtree_projection_valid__lr_graph_composition; assumption|].
  split; [reflexivity|]. split; [split; [exact HvL|reflexivity]|].
  split; [exact Hnl|]. rewrite Hlr, Hp. simpl avl_ptr_of.
  split; [exact Hnp|]. rewrite Hll, Hpl, Hpr.
  change (avl_child_height g (avl_right g p) <= INT_MAX /\
    Z.max (avl_child_height g (avl_left g l)) (avl_child_height g (avl_left g p)) + 1 <= INT_MAX).
  pose proof (proj1 (proj2 Hv) x Hx) as [_ Hex].
  pose proof (proj1 (proj2 Hv) l HvL) as [_ Hel].
  pose proof (proj1 (proj2 Hv) p HvP) as [_ Hep].
  rewrite Hl in Hex. rewrite Hp in Hel. simpl avl_child_height in Hex, Hel.
  pose proof (Z.le_max_l (avl_height_of g l) (avl_child_height g (avl_right g x))).
  pose proof (Z.le_max_l (avl_child_height g (avl_left g l)) (avl_height_of g p)).
  pose proof (Z.le_max_r (avl_child_height g (avl_left g l)) (avl_height_of g p)).
  pose proof (Z.le_max_l (avl_child_height g (avl_left g p)) (avl_child_height g (avl_right g p))).
  pose proof (Z.le_max_r (avl_child_height g (avl_left g p)) (avl_child_height g (avl_right g p))).
  split; [lia|]. assert (Z.max (avl_child_height g (avl_left g l)) (avl_child_height g (avl_left g p)) <= INT_MAX - 1) by (apply Z.max_lub; lia). lia.
Qed.
Lemma avl_lr_expose_inner__lr_graph_composition :
  forall g x cached, avl_lr_rotation_input g x ->
  avl_tree_store (avl_with_root_cache g x cached) |--
  (&(x # "AvlNode" ->ₛ "data") # Int |-> avl_key_of g x) **
  (&(x # "AvlNode" ->ₛ "height") # UInt |-> cached) **
  (&(x # "AvlNode" ->ₛ "left") # Ptr |-> avl_ptr_of (avl_left g x)) **
  (&(x # "AvlNode" ->ₛ "right") # Ptr |-> avl_ptr_of (avl_right g x)) **
  avl_tree_store (avl_with_root_cache (avl_subtree_model g (avl_ptr_of (avl_left g x)))
    (avl_ptr_of (avl_left g x)) (avl_height_of g (avl_ptr_of (avl_left g x)))) **
  avl_subtree_store_at g (avl_ptr_of (avl_right g x)).
Proof.
  intros g x cached Hin.
  pose proof Hin as [Hv [Hr [Hx [Hnx Hrest]]]].
  pose proof (GraphLib.examples.bst.bst_binary_tree _ (proj1 Hv)) as Ht.
  assert (Haway : forall child, (avl_left g x = child \/ avl_right g x = child) -> avl_ptr_of child <> x).
  { intros [c|] Hc; simpl; [|congruence]. intro E; subst c.
    pose proof (GraphLib.examples.bst.root_no_parents _ Ht x x Hr); tauto. }
  unfold avl_tree_store at 1.
  change (avl_nodes (avl_with_root_cache g x cached)) with (avl_nodes g).
  rewrite <- (avl_root_subtree_nodes_eq__left_rotation_graph_heights g x Hv Hr).
  rewrite (avl_graph_nodes_store_permutation__graph_store_decomposition
    (avl_with_root_cache g x cached) _ _ (avl_subtree_nodes_partition__height_accessor g x Hv Hx)).
  rewrite avl_graph_nodes_store_cons__graph_store_decomposition.
  sep_apply_l_atomic (avl_graph_nodes_store_split__graph_store_decomposition
    (avl_with_root_cache g x cached) (avl_subtree_nodes g (avl_ptr_of (avl_left g x)))
    (avl_subtree_nodes g (avl_ptr_of (avl_right g x)))).
  sep_apply_l_atomic (avl_cache_subtree_restore__right_rotation_graph
    g x cached (avl_ptr_of (avl_left g x)) Hv Hr
    (Haway _ (or_introl eq_refl)) (avl_left_child_nonnull_valid__height_accessor g x Hv Hx)).
  sep_apply_l_atomic (avl_cache_subtree_restore__right_rotation_graph
    g x cached (avl_ptr_of (avl_right g x)) Hv Hr
    (Haway _ (or_intror eq_refl)) (avl_right_child_nonnull_valid__height_accessor g x Hv Hx)).
  sep_apply_l_atomic (avl_subtree_projection_store__lr_graph_composition g (avl_ptr_of (avl_left g x))).
  change (avl_height_of g (avl_ptr_of (avl_left g x))) with
    (avl_height_of (avl_subtree_model g (avl_ptr_of (avl_left g x))) (avl_ptr_of (avl_left g x))).
  rewrite avl_cache_self__lr_graph_composition.
  unfold avl_graph_node_store, avl_with_root_cache, avl_height_update; simpl.
  destruct (Z.eq_dec x x); [|contradiction]. entailer!.
Qed.
Lemma avl_lr_lift_children__lr_graph_composition :
  forall g h raw l p z,
  avl_height_input_valid g -> avl_vvalid g l -> avl_right g l = Some p ->
  avl_vvalid g z -> avl_reachable g l z ->
  avl_bst raw = GraphLib.examples.bst.bst_with_tree (avl_bst g)
    (GraphLib.examples.bst.left_rotate Z.eq_dec (GraphLib.examples.bst.bst_tree (avl_bst g)) l p) ->
  avl_bst h = GraphLib.examples.bst.bst_with_tree (avl_bst (avl_subtree_model g l))
    (GraphLib.examples.bst.left_rotate Z.eq_dec (GraphLib.examples.bst.bst_tree (avl_bst (avl_subtree_model g l))) l p) ->
  avl_left raw z = avl_left h z /\ avl_right raw z = avl_right h z.
Proof.
  intros g h raw l p z Hv Hl Hp Hz Hpath Hb Hh.
  pose proof (GraphLib.examples.bst.bst_binary_tree _ (proj1 Hv)) as Ht.
  assert (Hlp : avl_reachable g l p).
  { unfold avl_reachable, GraphLib.examples.bst.bt_path. transitivity_1n p; [right; exact Hp|reflexivity]. }
  assert (Hin : In z (avl_nodes g)) by (eapply GraphLib.examples.bst.finite_vertices; eauto).
  assert (Hins : In z (avl_nodes (avl_subtree_model g l))).
  { change (In z (avl_subtree_nodes g l)). unfold avl_subtree_nodes.
    apply GraphLib.graph_basic.valid_NoDup_list_spec; auto. }
  pose proof (avl_projection_children__lr_graph_composition g l z Hpath) as [Hzl Hzr].
  pose proof (avl_projection_children__lr_graph_composition g l l (ltac:(reflexivity))) as [Hll Hlr].
  pose proof (avl_projection_children__lr_graph_composition g l p Hlp) as [Hpl Hpr].
  unfold avl_left, avl_right. rewrite Hb, Hh. simpl.
  unfold GraphLib.examples.bst.left_rotate_left_child, GraphLib.examples.bst.left_rotate_right_child.
  rewrite !GraphLib.examples.bst.iter_override_in by assumption.
  unfold GraphLib.examples.bst.left_rotate_left_value, GraphLib.examples.bst.left_rotate_right_value.
  fold (avl_left g z) (avl_right g z) (avl_left g l) (avl_left g p) (avl_right g p).
  change ((if Z.eq_dec z p then Some l else if Z.eq_dec z l then avl_left g l else GraphLib.examples.bst.replace_child Z.eq_dec l p (avl_left g z)) =
    (if Z.eq_dec z p then Some l else if Z.eq_dec z l then avl_left (avl_subtree_model g l) l else GraphLib.examples.bst.replace_child Z.eq_dec l p (avl_left (avl_subtree_model g l) z)) /\
    (if Z.eq_dec z l then avl_left g p else if Z.eq_dec z p then avl_right g p else GraphLib.examples.bst.replace_child Z.eq_dec l p (avl_right g z)) =
    (if Z.eq_dec z l then avl_left (avl_subtree_model g l) p else if Z.eq_dec z p then avl_right (avl_subtree_model g l) p else GraphLib.examples.bst.replace_child Z.eq_dec l p (avl_right (avl_subtree_model g l) z))).
  rewrite Hzl, Hzr, Hll, Hpl, Hpr. auto.
Qed.
Lemma avl_lr_outside_children__lr_graph_composition :
  forall g raw x l p z,
  avl_height_input_valid g -> avl_vvalid g x -> avl_left g x = Some l ->
  avl_vvalid g z -> z <> x -> z <> l -> z <> p ->
  avl_bst raw = GraphLib.examples.bst.bst_with_tree (avl_bst g)
    (GraphLib.examples.bst.left_rotate Z.eq_dec (GraphLib.examples.bst.bst_tree (avl_bst g)) l p) ->
  avl_left raw z = avl_left g z /\ avl_right raw z = avl_right g z.
Proof.
  intros g raw x l p z Hv Hx Hl Hz Hzx Hzl Hzp Hb.
  pose proof (GraphLib.examples.bst.bst_binary_tree _ (proj1 Hv)) as Ht.
  assert (Hno : avl_left g z <> Some l /\ avl_right g z <> Some l).
  { split; intro Hc; apply Hzx; eapply (GraphLib.examples.bst.father_unique _ Ht l z x Hz Hx); auto. }
  assert (Hrep : forall c : option addr, c <> Some l -> GraphLib.examples.bst.replace_child Z.eq_dec l p c = c).
  { intros [c|] Hc; unfold GraphLib.examples.bst.replace_child; [|reflexivity].
    destruct (Z.eq_dec c l); [subst; contradiction|reflexivity]. }
  assert (Hin : In z (avl_nodes g)) by (eapply GraphLib.examples.bst.finite_vertices; eauto).
  unfold avl_left, avl_right. rewrite Hb. simpl.
  unfold GraphLib.examples.bst.left_rotate_left_child, GraphLib.examples.bst.left_rotate_right_child.
  rewrite !GraphLib.examples.bst.iter_override_in by assumption.
  unfold GraphLib.examples.bst.left_rotate_left_value, GraphLib.examples.bst.left_rotate_right_value.
  destruct (Z.eq_dec z p); [contradiction|]. destruct (Z.eq_dec z l); [contradiction|].
  split; apply Hrep; tauto.
Qed.
Lemma avl_lr_outer_children__lr_graph_composition :
  forall g raw x l p,
  avl_height_input_valid g -> avl_root g = Some x -> avl_vvalid g x ->
  avl_left g x = Some l -> avl_right g l = Some p ->
  avl_bst raw = GraphLib.examples.bst.bst_with_tree (avl_bst g)
    (GraphLib.examples.bst.left_rotate Z.eq_dec (GraphLib.examples.bst.bst_tree (avl_bst g)) l p) ->
  avl_root raw = Some x /\ avl_left raw x = Some p /\ avl_right raw x = avl_right g x.
Proof.
  intros g raw x l p Hv Hr Hx Hl Hp Hb.
  pose proof (GraphLib.examples.bst.bst_binary_tree _ (proj1 Hv)) as Ht.
  assert (Hlx : l <> x).
  { intro E; subst l. eapply GraphLib.examples.bst.bt_child_no_self; eauto. left; exact Hl. }
  assert (Hpx : p <> x).
  { intro E; subst p. pose proof (GraphLib.examples.bst.root_no_parents _ Ht l x Hr); tauto. }
  assert (Hvl : avl_vvalid g l) by (eapply (GraphLib.examples.bst.child_valid _ Ht x l Hx); auto).
  assert (Hrl : avl_right g x <> Some l).
  { intro E. exact (GraphLib.examples.bst.child_distinct _ Ht x l l Hx Hvl Hvl Hl E eq_refl). }
  split.
  - unfold avl_root. rewrite Hb. simpl. unfold GraphLib.examples.bst.left_rotate_root.
    change (avl_root g) with (GraphLib.examples.bst.theroot (GraphLib.examples.bst.bst_tree (avl_bst g))) in Hr.
    change (@GraphLib.examples.bst.theroot Z (GraphLib.examples.bst.bst_tree (avl_bst g)) = Some x) in Hr. rewrite Hr. destruct (Z.eq_dec l x) as [E|N]; [contradiction|reflexivity].
  - assert (Hin : In x (avl_nodes g)) by (eapply GraphLib.examples.bst.finite_vertices; eauto).
    unfold avl_left, avl_right. rewrite Hb. simpl.
    unfold GraphLib.examples.bst.left_rotate_left_child, GraphLib.examples.bst.left_rotate_right_child.
    rewrite !GraphLib.examples.bst.iter_override_in by assumption.
    unfold GraphLib.examples.bst.left_rotate_left_value, GraphLib.examples.bst.left_rotate_right_value.
    destruct (Z.eq_dec x p); [congruence|]. destruct (Z.eq_dec x l); [congruence|].
    change (GraphLib.examples.bst.replace_child Z.eq_dec l p (avl_left g x) = Some p /\
      GraphLib.examples.bst.replace_child Z.eq_dec l p (avl_right g x) = avl_right g x).
    rewrite Hl. split.
    + unfold GraphLib.examples.bst.replace_child. destruct (Z.eq_dec l l); [reflexivity|contradiction].
    + destruct (avl_right g x) as [r|] eqn:Er; unfold GraphLib.examples.bst.replace_child; [|reflexivity].
      destruct (Z.eq_dec r l); [subst; contradiction|reflexivity].
Qed.
Lemma avl_lr_graft_bst__lr_graph_composition :
  forall g h raw x l p,
  avl_height_input_valid g -> avl_root g = Some x -> avl_vvalid g x -> avl_left g x = Some l ->
  avl_height_input_valid h -> avl_root h = Some p ->
  (forall z, avl_vvalid h z <-> avl_vvalid g z /\ avl_reachable g l z) ->
  (forall z, avl_key_of h z = avl_key_of g z) ->
  GraphLib.examples.bst.BinaryTreeProp addr (GraphLib.examples.bst.bst_tree (avl_bst raw)) ->
  (forall z, avl_vvalid raw z <-> avl_vvalid g z) ->
  (forall z, avl_key_of raw z = avl_key_of g z) ->
  avl_left raw x = Some p -> avl_right raw x = avl_right g x ->
  (forall z, avl_vvalid h z -> avl_left raw z = avl_left h z /\ avl_right raw z = avl_right h z) ->
  (forall z, avl_vvalid g z -> avl_reachable g (avl_ptr_of (avl_right g x)) z ->
    avl_left raw z = avl_left g z /\ avl_right raw z = avl_right g z) ->
  avl_bst_valid raw.
Proof.
  intros g h raw x l p Hv Hr Hx Hl Hhv Hhr Hdom Hhk Hrt Hrd Hrk Hxl Hxr Hloc Hframe.
  pose proof (GraphLib.examples.bst.bst_binary_tree _ (proj1 Hv)) as Ht.
  pose proof (GraphLib.examples.bst.bst_binary_tree _ (proj1 Hhv)) as Hht.
  assert (Hhp : avl_vvalid h p) by (eapply GraphLib.examples.bst.root_valid; eauto).
  assert (Hph : forall a b, avl_vvalid h a -> (avl_reachable h a b <-> avl_reachable raw a b)).
  { intros a b Ha. apply (avl_path_equiv_on_closed_region__left_rotation_graph_heights addr
      (GraphLib.examples.bst.bt_child (GraphLib.examples.bst.bst_tree (avl_bst h)))
      (GraphLib.examples.bst.bt_child (GraphLib.examples.bst.bst_tree (avl_bst raw))) a); [|reflexivity].
    intros u v Hu. assert (Hhu : avl_vvalid h u) by (eapply GraphLib.examples.bst.bt_path_end_valid_early; eauto).
    destruct (Hloc u Hhu) as [Hll Hrr].
    change ((avl_left h u = Some v \/ avl_right h u = Some v) <-> (avl_left raw u = Some v \/ avl_right raw u = Some v)).
    rewrite Hll,Hrr. reflexivity. }
  assert (Hpg : forall a b, avl_vvalid g a -> avl_reachable g (avl_ptr_of (avl_right g x)) a ->
    (avl_reachable g a b <-> avl_reachable raw a b)).
  { intros a b Ha Hra. apply (avl_path_equiv_on_closed_region__left_rotation_graph_heights addr
      (GraphLib.examples.bst.bt_child (GraphLib.examples.bst.bst_tree (avl_bst g)))
      (GraphLib.examples.bst.bt_child (GraphLib.examples.bst.bst_tree (avl_bst raw))) a); [|reflexivity].
    intros u v Hu. assert (Hgu : avl_vvalid g u) by (eapply GraphLib.examples.bst.bt_path_end_valid_early; eauto).
    assert (Hru : avl_reachable g (avl_ptr_of (avl_right g x)) u) by (etransitivity; eauto).
    destruct (Hframe u Hgu Hru) as [Hll Hrr].
    change ((avl_left g u = Some v \/ avl_right g u = Some v) <-> (avl_left raw u = Some v \/ avl_right raw u = Some v)).
    rewrite Hll,Hrr. reflexivity. }
  assert (Hpartition : forall z, avl_vvalid g z -> z = x \/ avl_reachable g l z \/ avl_reachable g (avl_ptr_of (avl_right g x)) z).
  { intros z Hz. destruct (GraphLib.examples.bst.path_exists _ Ht z Hz) as [r [Er Hp]].
    change (avl_root g = Some r) in Er. rewrite Hr in Er. inversion Er; subst r.
    pose proof (avl_subtree_path_classify__graph_store_decomposition g x z Hp) as Hc.
    rewrite Hl in Hc. exact Hc. }
  assert (Hstep : forall a b, avl_reachable g (avl_ptr_of (avl_right g x)) a ->
    (avl_left g a = Some b \/ avl_right g a = Some b) -> avl_reachable g (avl_ptr_of (avl_right g x)) b).
  { intros a b Ha Hab. etransitivity; [exact Ha|]. unfold avl_reachable,GraphLib.examples.bst.bt_path.
    transitivity_1n b; [exact Hab|reflexivity]. }
  unfold avl_bst_valid. constructor; [exact Hrt| |].
  - intros z v Hz [c [Hc Hpath]].
    change (avl_vvalid raw z) in Hz. apply (proj1 (Hrd z)) in Hz.
    change (avl_left raw z = Some c) in Hc.
    change (avl_key_of raw v < avl_key_of raw z). rewrite !Hrk.
    destruct (Hpartition z Hz) as [->|[HzL|HzR]].
    + rewrite Hxl in Hc. inversion Hc; subst c.
      apply (proj2 (Hph p v Hhp)) in Hpath.
      assert (Hvh : avl_vvalid h v) by (eapply GraphLib.examples.bst.bt_path_end_valid_early; eauto).
      destruct (proj1 (Hdom v) Hvh) as [_ Hlv].
      apply (GraphLib.examples.bst.bst_left_order _ (proj1 Hv) x v Hx). exists l; auto.
    + assert (Hhz : avl_vvalid h z) by (apply (proj2 (Hdom z)); auto).
      rewrite (proj1 (Hloc z Hhz)) in Hc.
      assert (Hhc : avl_vvalid h c) by (eapply (GraphLib.examples.bst.child_valid _ Hht z c Hhz); auto).
      apply (proj2 (Hph c v Hhc)) in Hpath.
      rewrite <- !Hhk. apply (GraphLib.examples.bst.bst_left_order _ (proj1 Hhv) z v Hhz). exists c; auto.
    + rewrite (proj1 (Hframe z Hz HzR)) in Hc.
      assert (Hgc : avl_vvalid g c) by (eapply (GraphLib.examples.bst.child_valid _ Ht z c Hz); auto).
      apply (proj2 (Hpg c v Hgc (Hstep z c HzR (or_introl Hc)))) in Hpath.
      apply (GraphLib.examples.bst.bst_left_order _ (proj1 Hv) z v Hz). exists c; auto.
  - intros z v Hz [c [Hc Hpath]].
    change (avl_vvalid raw z) in Hz. apply (proj1 (Hrd z)) in Hz.
    change (avl_right raw z = Some c) in Hc.
    change (avl_key_of raw z < avl_key_of raw v). rewrite !Hrk.
    destruct (Hpartition z Hz) as [->|[HzL|HzR]].
    + rewrite Hxr in Hc.
      assert (Hgc : avl_vvalid g c) by (eapply (GraphLib.examples.bst.child_valid _ Ht x c Hx); auto).
      assert (Hrc : avl_reachable g (avl_ptr_of (avl_right g x)) c) by (rewrite Hc; reflexivity).
      apply (proj2 (Hpg c v Hgc Hrc)) in Hpath.
      apply (GraphLib.examples.bst.bst_right_order _ (proj1 Hv) x v Hx). exists c; auto.
    + assert (Hhz : avl_vvalid h z) by (apply (proj2 (Hdom z)); auto).
      rewrite (proj2 (Hloc z Hhz)) in Hc.
      assert (Hhc : avl_vvalid h c) by (eapply (GraphLib.examples.bst.child_valid _ Hht z c Hhz); auto).
      apply (proj2 (Hph c v Hhc)) in Hpath.
      rewrite <- !Hhk. apply (GraphLib.examples.bst.bst_right_order _ (proj1 Hhv) z v Hhz). exists c; auto.
    + rewrite (proj2 (Hframe z Hz HzR)) in Hc.
      assert (Hgc : avl_vvalid g c) by (eapply (GraphLib.examples.bst.child_valid _ Ht z c Hz); auto).
      apply (proj2 (Hpg c v Hgc (Hstep z c HzR (or_intror Hc)))) in Hpath.
      apply (GraphLib.examples.bst.bst_right_order _ (proj1 Hv) z v Hz). exists c; auto.
Qed.
Lemma avl_nodes_store_map__lr_graph_composition :
  forall a b xs, (forall z, In z xs -> avl_graph_node_store a z |-- avl_graph_node_store b z) ->
  avl_graph_nodes_store a xs |-- avl_graph_nodes_store b xs.
Proof.
  intros a b xs. induction xs as [|z xs IH]; intro H.
  - unfold avl_graph_nodes_store; simpl; reflexivity.
  - rewrite !avl_graph_nodes_store_cons__graph_store_decomposition.
    sep_apply_l_atomic (H z (or_introl eq_refl)).
    sep_apply_l_atomic (IH (fun v Hv => H v (or_intror Hv))). cancel.
Qed.
Lemma avl_lr_lift__lr_graph_composition :
  forall g h x result cached,
  avl_lr_rotation_input g x ->
  avl_left_rotation_result (avl_subtree_model g (avl_ptr_of (avl_left g x))) h
    (avl_ptr_of (avl_left g x)) result ->
  0 <= cached <= UINT_MAX -> INT_MIN <= avl_key_of g x <= INT_MAX ->
  (&(x # "AvlNode" ->ₛ "data") # Int |-> avl_key_of g x) **
  (&(x # "AvlNode" ->ₛ "height") # UInt |-> cached) **
  (&(x # "AvlNode" ->ₛ "left") # Ptr |-> result) **
  (&(x # "AvlNode" ->ₛ "right") # Ptr |-> avl_ptr_of (avl_right g x)) **
  avl_tree_store h ** avl_subtree_store_at g (avl_ptr_of (avl_right g x)) |--
  EX m, “ avl_lr_middle g m x (avl_ptr_of (avl_left g x))
      (avl_ptr_of (avl_right g (avl_ptr_of (avl_left g x)))) ” &&
    “ avl_right_rotation_input m x ” && avl_tree_store (avl_with_root_cache m x cached).
Proof.
  intros g h x result cached Hin Hout Hcache Hkeyx.
  pose proof Hin as [Hv [Hr [Hx [Hnx [Hnl [Hnp Hbound]]]]]].
  pose proof (GraphLib.examples.bst.bst_binary_tree _ (proj1 Hv)) as Ht.
  destruct (avl_left g x) as [l|] eqn:Hl; [|contradiction]. simpl avl_ptr_of in *.
  destruct (avl_right g l) as [p|] eqn:Hp; [|contradiction]. simpl avl_ptr_of in Hnp.
  assert (HvL : avl_vvalid g l) by (eapply (GraphLib.examples.bst.child_valid _ Ht x l Hx); auto).
  assert (HvP : avl_vvalid g p) by (eapply (GraphLib.examples.bst.child_valid _ Ht l p HvL); auto).
  assert (Hlp : avl_reachable g l p).
  { unfold avl_reachable, GraphLib.examples.bst.bt_path. transitivity_1n p; [right; exact Hp|reflexivity]. }
  pose proof (avl_projection_children__lr_graph_composition g l l (ltac:(reflexivity))) as [Hsll Hslr].
  pose proof (avl_projection_children__lr_graph_composition g l p Hlp) as [Hspl Hspr].
  destruct Hout as [Hres [Hnr [Hhr [Hrot [Hhv [Hhn Hhk]]]]]].
  rewrite Hslr,Hp in Hres. simpl avl_ptr_of in Hres. subst result.
  pose proof Hrot as [_ [_ [Hhb [Hhl [Hhp Hnon]]]]].
  assert (Hhd : forall z, avl_vvalid h z <-> avl_vvalid g z /\ avl_reachable g l z).
  { intro z. exact (proj2 (proj2 (avl_left_rotation_domain_keys__left_rotation_graph_heights _ h l p z Hrot))). }
  assert (Hkeys : forall z, avl_key_of h z = avl_key_of g z) by exact Hhk.
  set (raw := {| avl_bst := GraphLib.examples.bst.bst_with_tree (avl_bst g)
    (GraphLib.examples.bst.left_rotate Z.eq_dec (GraphLib.examples.bst.bst_tree (avl_bst g)) l p);
    avl_height_of := avl_height_of h |}).
  assert (Hrb : avl_bst raw = GraphLib.examples.bst.bst_with_tree (avl_bst g)
    (GraphLib.examples.bst.left_rotate Z.eq_dec (GraphLib.examples.bst.bst_tree (avl_bst g)) l p)) by reflexivity.
  assert (Hrd : forall z, avl_vvalid raw z <-> avl_vvalid g z) by (intro z; reflexivity).
  assert (Hrk : forall z, avl_key_of raw z = avl_key_of g z) by (intro z; reflexivity).
  assert (Hrn : avl_nodes raw = avl_nodes g) by reflexivity.
  assert (Hlocal : forall z, avl_vvalid h z -> avl_left raw z = avl_left h z /\ avl_right raw z = avl_right h z).
  { intros z Hz. destruct (proj1 (Hhd z) Hz) as [Hgz Hlz].
    exact (avl_lr_lift_children__lr_graph_composition g h raw l p z Hv HvL Hp Hgz Hlz Hrb Hhb). }
  pose proof (avl_lr_outer_children__lr_graph_composition g raw x l p Hv Hr Hx Hl Hp Hrb) as [Hrr [Hrl Hrrc]].
  assert (Hleftkey : forall z, avl_reachable g l z -> avl_key_of g z < avl_key_of g x).
  { intros z Hz. apply (GraphLib.examples.bst.bst_left_order _ (proj1 Hv) x z Hx). exists l; auto. }
  assert (Hrightkey : forall z, avl_vvalid g z -> avl_reachable g (avl_ptr_of (avl_right g x)) z -> avl_key_of g x < avl_key_of g z).
  { intros z Hz Hpz. destruct (avl_right g x) as [r|] eqn:Er.
    - apply (GraphLib.examples.bst.bst_right_order _ (proj1 Hv) x z Hx). exists r; auto.
    - exfalso. eapply avl_subtree_invalid_path_empty__height_accessor; [exact Hv| |exact Hz|exact Hpz].
      intro Hnull. exact (proj2 (proj2 Hv) NULL Hnull eq_refl). }
  assert (Hlx : l <> x) by (pose proof (Hleftkey l (ltac:(reflexivity))); intro E; subst; lia).
  assert (Hpx : p <> x) by (pose proof (Hleftkey p Hlp); intro E; subst; lia).
  assert (HavoidR : forall z, avl_vvalid g z -> avl_reachable g (avl_ptr_of (avl_right g x)) z -> z <> x /\ z <> l /\ z <> p).
  { intros z Hz Hpz. pose proof (Hrightkey z Hz Hpz).
    pose proof (Hleftkey l (ltac:(reflexivity))). pose proof (Hleftkey p Hlp).
    repeat split; intro E; subst; lia. }
  assert (Hframe : forall z, avl_vvalid g z -> avl_reachable g (avl_ptr_of (avl_right g x)) z ->
    avl_left raw z = avl_left g z /\ avl_right raw z = avl_right g z).
  { intros z Hz Hpz. destruct (HavoidR z Hz Hpz) as [Hzx [Hzl Hzp]].
    exact (avl_lr_outside_children__lr_graph_composition g raw x l p z Hv Hx Hl Hz Hzx Hzl Hzp Hrb). }
  assert (Hrawbst : avl_bst_valid raw).
  { eapply (avl_lr_graft_bst__lr_graph_composition g h raw x l p Hv Hr Hx Hl Hhv Hhr Hhd Hkeys); eauto.
    unfold raw; simpl. eapply GraphLib.examples.bst.left_rotate_preserves_gvalid; eauto. }
  pose proof (GraphLib.examples.bst.bst_binary_tree _ (proj1 Hhv)) as Hht.
  assert (Hvlh : avl_vvalid h l) by (apply (proj2 (Hhd l)); split; [exact HvL|reflexivity]).
  assert (Hvph : avl_vvalid h p) by (apply (proj2 (Hhd p)); auto).
  assert (Hrawrot : avl_left_rotation_model g raw l p).
  { unfold avl_left_rotation_model. split; [exact HvL|]. split; [exact Hp|]. split; [exact Hrb|].
    split.
    - unfold avl_recomputed_at in *. destruct (Hlocal l Hvlh) as [E1 E2]. rewrite E1,E2. exact Hhl.
    - split.
      + unfold avl_recomputed_at in *. destruct (Hlocal p Hvph) as [E1 E2]. rewrite E1,E2. exact Hhp.
      + exact Hnon. }
  set (newheight := Z.max (avl_child_height raw (avl_left raw x)) (avl_child_height raw (avl_right raw x)) + 1).
  set (m := avl_with_root_cache raw x newheight).
  assert (Hmx : avl_height_of m x = newheight).
  { unfold m,avl_with_root_cache,avl_height_update; simpl. destruct (Z.eq_dec x x); [reflexivity|contradiction]. }
  assert (Hmnot : forall z, z <> x -> avl_height_of m z = avl_height_of h z).
  { intros z Hz. unfold m,avl_with_root_cache,avl_height_update; simpl. destruct (Z.eq_dec z x); [contradiction|reflexivity]. }
  assert (Hmlocal : forall z, avl_vvalid h z -> avl_height_of m z = avl_height_of h z).
  { intros z Hz. apply Hmnot. destruct (proj1 (Hhd z) Hz) as [_ Hpz]. pose proof (Hleftkey z Hpz). intro E; subst; lia. }
  assert (Hmframe : forall z, avl_vvalid g z -> avl_reachable g (avl_ptr_of (avl_right g x)) z -> avl_height_of m z = avl_height_of g z).
  { intros z Hz Hpz. destruct (HavoidR z Hz Hpz) as [Hzx [Hzl Hzp]]. rewrite Hmnot by exact Hzx. apply Hnon; assumption. }
  assert (HchildH : forall z child, avl_vvalid h z ->
    (avl_left h z = child \/ avl_right h z = child) -> avl_child_height m child = avl_child_height h child).
  { intros z [c|] Hz Hc; simpl; [|reflexivity]. apply Hmlocal.
    eapply (GraphLib.examples.bst.child_valid _ Hht z c Hz); exact Hc. }
  assert (HchildR : forall z child, avl_vvalid g z -> avl_reachable g (avl_ptr_of (avl_right g x)) z ->
    (avl_left g z = child \/ avl_right g z = child) -> avl_child_height m child = avl_child_height g child).
  { intros z [c|] Hz Hpz Hc; simpl; [|reflexivity]. apply Hmframe.
    - eapply (GraphLib.examples.bst.child_valid _ Ht z c Hz); exact Hc.
    - etransitivity; [exact Hpz|]. unfold avl_reachable,GraphLib.examples.bst.bt_path. transitivity_1n c; [exact Hc|reflexivity]. }
  assert (HchildX : avl_child_height m (avl_right g x) = avl_child_height g (avl_right g x)).
  { destruct (avl_right g x) as [c|] eqn:Ec; simpl; [|reflexivity]. apply Hmframe.
    - eapply (GraphLib.examples.bst.child_valid _ Ht x c Hx); auto.
    - reflexivity. }
  assert (HrawchildX : avl_child_height raw (avl_right g x) = avl_child_height g (avl_right g x)).
  { destruct (avl_right g x) as [c|] eqn:Ec; simpl; [|reflexivity].
    assert (Hvc : avl_vvalid g c) by (eapply (GraphLib.examples.bst.child_valid _ Ht x c Hx); auto).
    assert (Hpc : avl_reachable g (avl_ptr_of (avl_right g x)) c) by (rewrite Ec; reflexivity).
    destruct (HavoidR c Hvc (ltac:(reflexivity))) as [_ [Hcl Hcp]]. apply Hnon; assumption. }
  assert (Hnew : newheight = Z.max (avl_height_of h p) (avl_child_height g (avl_right g x)) + 1).
  { unfold newheight. rewrite Hrl,Hrrc,HrawchildX. reflexivity. }
  pose proof (avl_left_rotation_pivot_children__left_rotation_graph_heights _ h l p
    (avl_subtree_projection_valid__lr_graph_composition g l Hv HvL) Hrot) as [Hhpl [Hhpr [Hhll Hhlr]]].
  rewrite Hsll in Hhll. rewrite Hspl in Hhlr. rewrite Hspr in Hhpr.
  assert (Hsubchild : forall z child, avl_vvalid g z ->
    (avl_left g z = child \/ avl_right g z = child) ->
    child <> Some l -> child <> Some p -> avl_child_height h child = avl_child_height g child).
  { intros z [c|] Hz Hc Hcl Hcp; simpl; [|reflexivity]. apply Hnon; congruence. }
  assert (Hcll : avl_child_height h (avl_left g l) = avl_child_height g (avl_left g l)).
  { apply (Hsubchild l _ HvL (or_introl eq_refl)).
    - intro E; exact (GraphLib.examples.bst.bt_child_no_self _ _ Ht HvL (or_introl E)).
    - intro E; exact (GraphLib.examples.bst.child_distinct _ Ht l p p HvL HvP HvP E Hp eq_refl). }
  assert (Hclp : avl_child_height h (avl_left g p) = avl_child_height g (avl_left g p)).
  { apply (Hsubchild p _ HvP (or_introl eq_refl)).
    - intro E; eapply (GraphLib.examples.bst.bt_child_no_back_path _ l p Ht HvL (or_intror Hp)).
      unfold GraphLib.examples.bst.bt_path. transitivity_1n l; [left; exact E|reflexivity].
    - intro E; exact (GraphLib.examples.bst.bt_child_no_self _ _ Ht HvP (or_introl E)). }
  assert (Hcrp : avl_child_height h (avl_right g p) = avl_child_height g (avl_right g p)).
  { apply (Hsubchild p _ HvP (or_intror eq_refl)).
    - intro E; eapply (GraphLib.examples.bst.bt_child_no_back_path _ l p Ht HvL (or_intror Hp)).
      unfold GraphLib.examples.bst.bt_path. transitivity_1n l; [right; exact E|reflexivity].
    - intro E; exact (GraphLib.examples.bst.bt_child_no_self _ _ Ht HvP (or_intror E)). }
  assert (Hehl : avl_height_of h l = Z.max (avl_child_height g (avl_left g l)) (avl_child_height g (avl_left g p)) + 1).
  { unfold avl_recomputed_at in Hhl. rewrite Hhll,Hhlr,Hcll,Hclp in Hhl. exact Hhl. }
  assert (Hehp : avl_height_of h p = Z.max (avl_height_of h l) (avl_child_height g (avl_right g p)) + 1).
  { unfold avl_recomputed_at in Hhp. rewrite Hhpl,Hhpr,Hcrp in Hhp. exact Hhp. }
  pose proof (proj1 (proj2 Hv) x Hx) as [Hbx Hex].
  pose proof (proj1 (proj2 Hv) l HvL) as [Hbl Hel].
  pose proof (proj1 (proj2 Hv) p HvP) as [Hbp Hep].
  rewrite Hl in Hex. rewrite Hp in Hel. simpl avl_child_height in Hex,Hel.
  assert (Hbounds : 1 <= newheight <= UINT_MAX /\ avl_height_of h l <= INT_MAX /\
    Z.max (avl_child_height g (avl_right g p)) (avl_child_height g (avl_right g x)) + 1 <= INT_MAX).
  { pose proof (proj1 (proj1 (proj2 Hhv) p Hvph)) as Hbhp.
    pose proof (Z.le_max_l (avl_height_of g l) (avl_child_height g (avl_right g x))) as ExL.
    pose proof (Z.le_max_r (avl_height_of g l) (avl_child_height g (avl_right g x))) as ExR.
    pose proof (Z.le_max_l (avl_child_height g (avl_left g l)) (avl_height_of g p)) as ElL.
    pose proof (Z.le_max_r (avl_child_height g (avl_left g l)) (avl_height_of g p)) as ElR.
    pose proof (Z.le_max_l (avl_child_height g (avl_left g p)) (avl_child_height g (avl_right g p))) as EpL.
    pose proof (Z.le_max_r (avl_child_height g (avl_left g p)) (avl_child_height g (avl_right g p))) as EpR.
    assert (EnL : avl_height_of h l <= avl_height_of g l).
    { rewrite Hehl. assert (Z.max (avl_child_height g (avl_left g l)) (avl_child_height g (avl_left g p)) <= avl_height_of g l - 1) by (apply Z.max_lub; lia). lia. }
    assert (EnP : avl_height_of h p <= avl_height_of g l + 1).
    { rewrite Hehp. assert (Z.max (avl_height_of h l) (avl_child_height g (avl_right g p)) <= avl_height_of g l) by (apply Z.max_lub; lia). lia. }
    assert (EnX : Z.max (avl_height_of h p) (avl_child_height g (avl_right g x)) <= avl_height_of g x) by (apply Z.max_lub; lia).
    pose proof (Z.le_max_l (avl_height_of h p) (avl_child_height g (avl_right g x))) as EnXlo.
    assert (Ed : Z.max (avl_child_height g (avl_right g p)) (avl_child_height g (avl_right g x)) <= avl_height_of g x - 1) by (apply Z.max_lub; lia).
    rewrite Hnew. clear - Hbhp EnX EnXlo Ed EnL Hbound Hex ExL. lia. }
  assert (Hpartition : forall z, avl_vvalid g z -> z = x \/ avl_reachable g l z \/ avl_reachable g (avl_ptr_of (avl_right g x)) z).
  { intros z Hz. destruct (GraphLib.examples.bst.path_exists _ Ht z Hz) as [r [Er Ep]].
    change (avl_root g = Some r) in Er. rewrite Hr in Er. inversion Er; subst r.
    pose proof (avl_subtree_path_classify__graph_store_decomposition g x z Ep) as Hc. rewrite Hl in Hc. exact Hc. }
  assert (Hmvalid : avl_height_input_valid m).
  { split; [exact Hrawbst|]. split.
    - intros z Hz. change (avl_vvalid g z) in Hz.
      destruct (Hpartition z Hz) as [->|[HzL|HzR]].
      + rewrite Hmx. split; [tauto|]. change (newheight = Z.max (avl_child_height m (avl_left raw x)) (avl_child_height m (avl_right raw x)) + 1).
        rewrite Hrl,Hrrc,HchildX. change (newheight = Z.max (avl_height_of m p) (avl_child_height g (avl_right g x)) + 1). rewrite Hmlocal by exact Hvph. exact Hnew.
      + assert (Hhz : avl_vvalid h z) by (apply (proj2 (Hhd z)); auto).
        rewrite Hmlocal by exact Hhz. split; [exact (proj1 (proj1 (proj2 Hhv) z Hhz))|].
        change (avl_height_of h z = Z.max (avl_child_height m (avl_left raw z)) (avl_child_height m (avl_right raw z)) + 1).
        destruct (Hlocal z Hhz) as [E1 E2]. rewrite E1,E2.
        rewrite (HchildH z _ Hhz (or_introl eq_refl)),(HchildH z _ Hhz (or_intror eq_refl)).
        exact (proj2 (proj1 (proj2 Hhv) z Hhz)).
      + rewrite (Hmframe z Hz HzR). split; [exact (proj1 (proj1 (proj2 Hv) z Hz))|].
        change (avl_height_of g z = Z.max (avl_child_height m (avl_left raw z)) (avl_child_height m (avl_right raw z)) + 1).
        destruct (Hframe z Hz HzR) as [E1 E2]. rewrite E1,E2.
        rewrite (HchildR z _ Hz HzR (or_introl eq_refl)),(HchildR z _ Hz HzR (or_intror eq_refl)).
        exact (proj2 (proj1 (proj2 Hv) z Hz)).
    - intros z Hz. apply (proj2 (proj2 Hv) z). exact Hz. }
  assert (Hmiddle : avl_lr_middle g m x l p) by (exists raw; auto).
  assert (Hright : avl_right_rotation_input m x).
  { unfold avl_right_rotation_input. split; [exact Hmvalid|]. split; [exact Hrr|].
    split; [exact Hx|]. split; [exact Hnx|].
    change (avl_ptr_of (avl_left raw x) <> NULL /\
      avl_child_height m (avl_left raw (avl_ptr_of (avl_left raw x))) <= INT_MAX /\
      Z.max (avl_child_height m (avl_right raw (avl_ptr_of (avl_left raw x)))) (avl_child_height m (avl_right raw x)) + 1 <= INT_MAX).
    rewrite Hrl,Hrrc. simpl avl_ptr_of. split; [exact Hnp|].
    destruct (Hlocal p Hvph) as [E1 E2]. rewrite E1,E2,Hhpl,Hhpr,HchildX. change (avl_height_of m l <= INT_MAX /\ Z.max (avl_child_height m (avl_right g p)) (avl_child_height g (avl_right g x)) + 1 <= INT_MAX).
    rewrite Hmlocal by exact Hvlh.
    rewrite (HchildH p _ Hvph (or_intror Hhpr)),Hcrp. tauto. }
  Exists m. split_pure_spatial.
  - unfold avl_tree_store at 2. change (avl_nodes (avl_with_root_cache m x cached)) with (avl_nodes g).
    rewrite <- (avl_root_subtree_nodes_eq__left_rotation_graph_heights g x Hv Hr).
    rewrite (avl_graph_nodes_store_permutation__graph_store_decomposition (avl_with_root_cache m x cached) _ _ (avl_subtree_nodes_partition__height_accessor g x Hv Hx)).
    rewrite Hl. simpl avl_ptr_of.
    rewrite avl_graph_nodes_store_cons__graph_store_decomposition.
    sep_apply_r_atomic (avl_graph_nodes_store_app__graph_store_decomposition (avl_with_root_cache m x cached)
      (avl_subtree_nodes g l) (avl_subtree_nodes g (avl_ptr_of (avl_right g x)))).
    assert (HstoreL : avl_tree_store h |-- avl_graph_nodes_store (avl_with_root_cache m x cached) (avl_subtree_nodes g l)).
    { unfold avl_tree_store. rewrite Hhn. change (avl_nodes (avl_subtree_model g l)) with (avl_subtree_nodes g l).
      apply avl_nodes_store_map__lr_graph_composition. intros z Hz.
      apply GraphLib.graph_basic.valid_NoDup_list_spec in Hz as [Hz Hpz].
      assert (Hgz : avl_vvalid g z) by (eapply GraphLib.examples.bst.listV_sound; eauto).
      assert (Hhz : avl_vvalid h z) by (apply (proj2 (Hhd z)); auto).
      assert (Hzx : z <> x) by (pose proof (Hleftkey z Hpz); intro E; subst; lia).
      rewrite avl_cache_node_unchanged__right_rotation_graph by exact Hzx.
      unfold avl_graph_node_store. destruct (Hlocal z Hhz) as [E1 E2].
      change (avl_left m z) with (avl_left raw z). change (avl_right m z) with (avl_right raw z).
      rewrite E1,E2,(Hmlocal z Hhz),Hkeys.
      change (avl_key_of m z) with (avl_key_of g z). entailer!. }
    assert (HstoreR : avl_subtree_store_at g (avl_ptr_of (avl_right g x)) |--
      avl_graph_nodes_store (avl_with_root_cache m x cached) (avl_subtree_nodes g (avl_ptr_of (avl_right g x)))).
    { unfold avl_subtree_store_at. Intros_p Hguard.
      apply avl_nodes_store_map__lr_graph_composition. intros z Hz.
      apply GraphLib.graph_basic.valid_NoDup_list_spec in Hz as [Hz Hpz].
      assert (Hgz : avl_vvalid g z) by (eapply GraphLib.examples.bst.listV_sound; eauto).
      destruct (HavoidR z Hgz Hpz) as [Hzx Hrest].
      rewrite avl_cache_node_unchanged__right_rotation_graph by exact Hzx.
      unfold avl_graph_node_store. destruct (Hframe z Hgz Hpz) as [E1 E2].
      change (avl_left m z) with (avl_left raw z). change (avl_right m z) with (avl_right raw z).
      rewrite E1,E2,(Hmframe z Hgz Hpz).
      change (avl_key_of m z) with (avl_key_of g z). entailer!. }
    sep_apply_l_atomic HstoreL. sep_apply_l_atomic HstoreR.
    cancel (avl_graph_nodes_store (avl_with_root_cache m x cached) (avl_subtree_nodes g l)).
    cancel (avl_graph_nodes_store (avl_with_root_cache m x cached) (avl_subtree_nodes g (avl_ptr_of (avl_right g x)))).
    unfold avl_graph_node_store.
    change (avl_vvalid (avl_with_root_cache m x cached) x) with (avl_vvalid g x).
    change (avl_key_of (avl_with_root_cache m x cached) x) with (avl_key_of g x).
    change (avl_left (avl_with_root_cache m x cached) x) with (avl_left raw x).
    change (avl_right (avl_with_root_cache m x cached) x) with (avl_right raw x).
    rewrite Hrl,Hrrc. unfold avl_with_root_cache,avl_height_update; simpl.
    destruct (Z.eq_dec x x); [|contradiction]. entailer!.
  - split_pures; dump_pre_spatial; assumption.
Qed.

(** Generic RL composition, the symmetric graph contract. *)
(** Input facts only: exact mathematical BST heights, the three pivots, and
    the initial root-height bound. Stored root cache is independently owned. *)
Definition avl_rl_rotation_input (g : avl_model) (root : addr) : Prop :=
  avl_height_input_valid g /\
  avl_root g = Some root /\ avl_vvalid g root /\ root <> NULL /\
  avl_ptr_of (avl_right g root) <> NULL /\
  avl_ptr_of (avl_left g (avl_ptr_of (avl_right g root))) <> NULL /\
  avl_height_of g root <= INT_MAX.

(** The full-graph inner rotation preserves the old mathematical outer-root
    height. The exact middle graph refreshes that one abstract height. The
    concrete root cache is represented separately by avl_with_root_cache. *)
Definition avl_rl_middle (before middle : avl_model)
    (root right pivot : addr) : Prop :=
  exists raw,
    avl_right_rotation_model before raw right pivot /\
    middle = avl_with_root_cache raw root
      (Z.max (avl_child_height raw (avl_right raw root))
             (avl_child_height raw (avl_left raw root)) + 1).

Definition avl_rl_rotation_result (before after : avl_model)
    (root result : addr) : Prop :=
  result = avl_ptr_of (avl_left before (avl_ptr_of (avl_right before root))) /\
  result <> NULL /\ avl_root after = Some result /\
  avl_rl_rotation_model before after root
    (avl_ptr_of (avl_right before root)) result /\
  avl_height_input_valid after /\
  avl_nodes after = avl_nodes before /\
  (forall x, avl_key_of after x = avl_key_of before x).

Definition avl_rl_rotation_post (before : avl_model)
    (root result : addr) : Assertion :=
  EX after, “ avl_rl_rotation_result before after root result ” &&
    avl_tree_store after.

Lemma avl_rl_middle_right__rl_graph_composition :
  forall g m x l p, avl_rl_rotation_input g x ->
  avl_right g x = Some l -> avl_left g l = Some p ->
  avl_rl_middle g m x l p -> avl_right m x = Some p.
Proof.
  intros g m x l p [Hv [Hr [Hx [Hnx Hrest]]]] Hl Hp [raw [Hrot ->]].
  pose proof (GraphLib.examples.bst.bst_binary_tree _ (proj1 Hv)) as Ht.
  assert (Hlx : l <> x).
  { intro E; subst. eapply GraphLib.examples.bst.bt_child_no_self; eauto. right; exact Hl. }
  assert (Hlp : avl_vvalid g l).
  { eapply (GraphLib.examples.bst.child_valid _ Ht x l Hx). right; exact Hl. }
  assert (Hpx : p <> x).
  { intro E; subst. pose proof (GraphLib.examples.bst.root_no_parents _ Ht l x Hr); tauto. }
  destruct Hrot as [_ [_ [Htrot _]]].
  change (avl_right raw x = Some p).
  unfold avl_right. rewrite Htrot. simpl.
  unfold GraphLib.examples.bst.right_rotate_right_child.
  rewrite GraphLib.examples.bst.iter_override_in by (apply GraphLib.examples.bst.finite_vertices; assumption).
  unfold GraphLib.examples.bst.right_rotate_right_child_value.
  destruct (Z.eq_dec x p); [congruence|].
  destruct (Z.eq_dec x l); [congruence|].
  change (GraphLib.examples.bst.replace_child Z.eq_dec l p (avl_right g x) = Some p).
  rewrite Hl. unfold GraphLib.examples.bst.replace_child.
  destruct (Z.eq_dec l l) as [E|N]; [reflexivity|exfalso; apply N; reflexivity].
Qed.
Lemma avl_rl_left_cache_transport__rl_graph_composition :
  forall raw after x p cache,
  avl_left_rotation_model (avl_with_root_cache raw x cache) after x p ->
  avl_left_rotation_model raw after x p.
Proof.
  intros raw after x p cache [Hx [Hl [Hb [Hr [Hp Hh]]]]].
  unfold avl_left_rotation_model. split; [exact Hx|].
  split; [exact Hl|]. split; [exact Hb|]. split; [exact Hr|].
  split; [exact Hp|]. intros z Hz Hpz.
  specialize (Hh z Hz Hpz).
  unfold avl_with_root_cache, avl_height_update in Hh; simpl in Hh.
  destruct (Z.eq_dec z x); [contradiction|exact Hh].
Qed.
Lemma avl_rl_compose_result__rl_graph_composition :
  forall g m after x result,
  avl_rl_rotation_input g x ->
  avl_rl_middle g m x (avl_ptr_of (avl_right g x))
    (avl_ptr_of (avl_left g (avl_ptr_of (avl_right g x)))) ->
  avl_left_rotation_result m after x result ->
  avl_rl_rotation_result g after x result.
Proof.
  intros g m after x result Hin Hmid Hout.
  pose proof Hin as [Hv [Hr [Hx [Hnx [Hnl [Hnp Hbound]]]]]].
  destruct (avl_right g x) as [l|] eqn:Hl; [|contradiction].
  simpl avl_ptr_of in Hmid, Hnp.
  destruct (avl_left g l) as [p|] eqn:Hp; [|contradiction].
  simpl avl_ptr_of in Hmid.
  pose proof (avl_rl_middle_right__rl_graph_composition g m x l p Hin Hl Hp Hmid) as Hml.
  destruct Hout as [Hres [Hnr [Hroot [Hrot [Hvalid [Hnodes Hkeys]]]]]].
  rewrite Hml in Hres. simpl avl_ptr_of in Hres. subst result.
  destruct Hmid as [raw [Hinner Hm]]. subst m.
  assert (Hdomain : avl_nodes raw = avl_nodes g).
  { destruct Hinner as [_ [_ [Hb _]]]. unfold avl_nodes. rewrite Hb. reflexivity. }
  assert (Hkey : forall z, avl_key_of raw z = avl_key_of g z).
  { intro z. exact (proj1 (avl_right_rotation_domain_keys__right_rotation_graph g raw l p z Hinner)). }
  unfold avl_rl_rotation_result. rewrite Hl. simpl avl_ptr_of. rewrite Hp. simpl avl_ptr_of.
  split; [reflexivity|]. split; [exact Hnr|]. split; [exact Hroot|].
  split.
  - exists raw. split; [exact Hinner|]. eapply avl_rl_left_cache_transport__rl_graph_composition; exact Hrot.
  - split; [exact Hvalid|]. split.
    + change (avl_nodes after = avl_nodes g). rewrite Hnodes. exact Hdomain.
    + intro z. rewrite Hkeys. apply Hkey.
Qed.
Lemma avl_rl_prepare_inner__rl_graph_composition :
  forall g x, avl_rl_rotation_input g x ->
  avl_right_rotation_input (avl_subtree_model g (avl_ptr_of (avl_right g x)))
    (avl_ptr_of (avl_right g x)).
Proof.
  intros g x [Hv [Hr [Hx [Hnx [Hnl [Hnp Hbound]]]]]].
  destruct (avl_right g x) as [l|] eqn:Hl; [|contradiction].
  simpl avl_ptr_of in *.
  destruct (avl_left g l) as [p|] eqn:Hp; [|contradiction].
  simpl avl_ptr_of in *.
  pose proof (GraphLib.examples.bst.bst_binary_tree _ (proj1 Hv)) as Ht.
  assert (HvL : avl_vvalid g l).
  { eapply (GraphLib.examples.bst.child_valid _ Ht x l Hx). right; exact Hl. }
  assert (HvP : avl_vvalid g p).
  { eapply (GraphLib.examples.bst.child_valid _ Ht l p HvL). left; exact Hp. }
  assert (Hlp : avl_reachable g l p).
  { unfold avl_reachable, GraphLib.examples.bst.bt_path. transitivity_1n p; [left; exact Hp|reflexivity]. }
  pose proof (avl_projection_children__lr_graph_composition g l l (ltac:(reflexivity))) as [Hlr Hll].
  pose proof (avl_projection_children__lr_graph_composition g l p Hlp) as [Hpr Hpl].
  unfold avl_right_rotation_input.
  split; [apply avl_subtree_projection_valid__lr_graph_composition; assumption|].
  split; [reflexivity|]. split; [split; [exact HvL|reflexivity]|].
  split; [exact Hnl|]. rewrite Hlr, Hp. simpl avl_ptr_of.
  split; [exact Hnp|]. rewrite Hll, Hpl, Hpr. rewrite Z.max_comm.
  change (avl_child_height g (avl_left g p) <= INT_MAX /\
    Z.max (avl_child_height g (avl_right g l)) (avl_child_height g (avl_right g p)) + 1 <= INT_MAX).
  pose proof (proj1 (proj2 Hv) x Hx) as [_ Hex].
  pose proof (proj1 (proj2 Hv) l HvL) as [_ Hel].
  pose proof (proj1 (proj2 Hv) p HvP) as [_ Hep].
  rewrite Hl in Hex. rewrite Hp in Hel.
  rewrite Z.max_comm in Hex, Hel, Hep. simpl avl_child_height in Hex, Hel.
  pose proof (Z.le_max_l (avl_height_of g l) (avl_child_height g (avl_left g x))).
  pose proof (Z.le_max_l (avl_child_height g (avl_right g l)) (avl_height_of g p)).
  pose proof (Z.le_max_r (avl_child_height g (avl_right g l)) (avl_height_of g p)).
  pose proof (Z.le_max_l (avl_child_height g (avl_right g p)) (avl_child_height g (avl_left g p))).
  pose proof (Z.le_max_r (avl_child_height g (avl_right g p)) (avl_child_height g (avl_left g p))).
  split; [lia|]. assert (Z.max (avl_child_height g (avl_right g l)) (avl_child_height g (avl_right g p)) <= INT_MAX - 1) by (apply Z.max_lub; lia). lia.
Qed.
Lemma avl_rl_expose_inner__rl_graph_composition :
  forall g x cached, avl_rl_rotation_input g x ->
  avl_tree_store (avl_with_root_cache g x cached) |--
  (&(x # "AvlNode" ->ₛ "data") # Int |-> avl_key_of g x) **
  (&(x # "AvlNode" ->ₛ "height") # UInt |-> cached) **
  (&(x # "AvlNode" ->ₛ "right") # Ptr |-> avl_ptr_of (avl_right g x)) **
  (&(x # "AvlNode" ->ₛ "left") # Ptr |-> avl_ptr_of (avl_left g x)) **
  avl_tree_store (avl_with_root_cache (avl_subtree_model g (avl_ptr_of (avl_right g x)))
    (avl_ptr_of (avl_right g x)) (avl_height_of g (avl_ptr_of (avl_right g x)))) **
  avl_subtree_store_at g (avl_ptr_of (avl_left g x)).
Proof.
  intros g x cached Hin.
  pose proof Hin as [Hv [Hr [Hx [Hnx Hrest]]]].
  pose proof (GraphLib.examples.bst.bst_binary_tree _ (proj1 Hv)) as Ht.
  assert (Haway : forall child, (avl_right g x = child \/ avl_left g x = child) -> avl_ptr_of child <> x).
  { intros [c|] Hc; simpl; [|congruence]. intro E; subst c.
    pose proof (GraphLib.examples.bst.root_no_parents _ Ht x x Hr); tauto. }
  unfold avl_tree_store at 1.
  change (avl_nodes (avl_with_root_cache g x cached)) with (avl_nodes g).
  rewrite <- (avl_root_subtree_nodes_eq__left_rotation_graph_heights g x Hv Hr).
  rewrite (avl_graph_nodes_store_permutation__graph_store_decomposition
    (avl_with_root_cache g x cached) _ _ (avl_subtree_nodes_partition__height_accessor g x Hv Hx)).
  rewrite avl_graph_nodes_store_cons__graph_store_decomposition.
  sep_apply_l_atomic (avl_graph_nodes_store_split__graph_store_decomposition
    (avl_with_root_cache g x cached) (avl_subtree_nodes g (avl_ptr_of (avl_left g x)))
    (avl_subtree_nodes g (avl_ptr_of (avl_right g x)))).
  sep_apply_l_atomic (avl_cache_subtree_restore__right_rotation_graph
    g x cached (avl_ptr_of (avl_right g x)) Hv Hr
    (Haway _ (or_introl eq_refl)) (avl_right_child_nonnull_valid__height_accessor g x Hv Hx)).
  sep_apply_l_atomic (avl_cache_subtree_restore__right_rotation_graph
    g x cached (avl_ptr_of (avl_left g x)) Hv Hr
    (Haway _ (or_intror eq_refl)) (avl_left_child_nonnull_valid__height_accessor g x Hv Hx)).
  sep_apply_l_atomic (avl_subtree_projection_store__lr_graph_composition g (avl_ptr_of (avl_right g x))).
  change (avl_height_of g (avl_ptr_of (avl_right g x))) with
    (avl_height_of (avl_subtree_model g (avl_ptr_of (avl_right g x))) (avl_ptr_of (avl_right g x))).
  rewrite avl_cache_self__lr_graph_composition.
  unfold avl_graph_node_store, avl_with_root_cache, avl_height_update; simpl.
  destruct (Z.eq_dec x x); [|contradiction]. entailer!.
unfold avl_key_of, avl_left, avl_right; simpl; cancel.
Qed.
Lemma avl_rl_lift_children__rl_graph_composition :
  forall g h raw l p z,
  avl_height_input_valid g -> avl_vvalid g l -> avl_left g l = Some p ->
  avl_vvalid g z -> avl_reachable g l z ->
  avl_bst raw = GraphLib.examples.bst.bst_with_tree (avl_bst g)
    (GraphLib.examples.bst.right_rotate Z.eq_dec (GraphLib.examples.bst.bst_tree (avl_bst g)) l p) ->
  avl_bst h = GraphLib.examples.bst.bst_with_tree (avl_bst (avl_subtree_model g l))
    (GraphLib.examples.bst.right_rotate Z.eq_dec (GraphLib.examples.bst.bst_tree (avl_bst (avl_subtree_model g l))) l p) ->
  avl_right raw z = avl_right h z /\ avl_left raw z = avl_left h z.
Proof.
  intros g h raw l p z Hv Hl Hp Hz Hpath Hb Hh.
  pose proof (GraphLib.examples.bst.bst_binary_tree _ (proj1 Hv)) as Ht.
  assert (Hlp : avl_reachable g l p).
  { unfold avl_reachable, GraphLib.examples.bst.bt_path. transitivity_1n p; [left; exact Hp|reflexivity]. }
  assert (Hin : In z (avl_nodes g)) by (eapply GraphLib.examples.bst.finite_vertices; eauto).
  assert (Hins : In z (avl_nodes (avl_subtree_model g l))).
  { change (In z (avl_subtree_nodes g l)). unfold avl_subtree_nodes.
    apply GraphLib.graph_basic.valid_NoDup_list_spec; auto. }
  pose proof (avl_projection_children__lr_graph_composition g l z Hpath) as [Hzr Hzl].
  pose proof (avl_projection_children__lr_graph_composition g l l (ltac:(reflexivity))) as [Hlr Hll].
  pose proof (avl_projection_children__lr_graph_composition g l p Hlp) as [Hpr Hpl].
  unfold avl_right, avl_left. rewrite Hb, Hh. simpl.
  unfold GraphLib.examples.bst.right_rotate_right_child, GraphLib.examples.bst.right_rotate_left_child.
  rewrite !GraphLib.examples.bst.iter_override_in by assumption.
  unfold GraphLib.examples.bst.right_rotate_right_child_value, GraphLib.examples.bst.right_rotate_left_child_value.
  fold (avl_right g z) (avl_left g z) (avl_right g l) (avl_right g p) (avl_left g p).
  change ((if Z.eq_dec z p then Some l else if Z.eq_dec z l then avl_right g l else GraphLib.examples.bst.replace_child Z.eq_dec l p (avl_right g z)) =
    (if Z.eq_dec z p then Some l else if Z.eq_dec z l then avl_right (avl_subtree_model g l) l else GraphLib.examples.bst.replace_child Z.eq_dec l p (avl_right (avl_subtree_model g l) z)) /\
    (if Z.eq_dec z l then avl_right g p else if Z.eq_dec z p then avl_left g p else GraphLib.examples.bst.replace_child Z.eq_dec l p (avl_left g z)) =
    (if Z.eq_dec z l then avl_right (avl_subtree_model g l) p else if Z.eq_dec z p then avl_left (avl_subtree_model g l) p else GraphLib.examples.bst.replace_child Z.eq_dec l p (avl_left (avl_subtree_model g l) z))).
  rewrite Hzl, Hzr, Hll, Hpl, Hpr. auto.
Qed.
Lemma avl_rl_outside_children__rl_graph_composition :
  forall g raw x l p z,
  avl_height_input_valid g -> avl_vvalid g x -> avl_right g x = Some l ->
  avl_vvalid g z -> z <> x -> z <> l -> z <> p ->
  avl_bst raw = GraphLib.examples.bst.bst_with_tree (avl_bst g)
    (GraphLib.examples.bst.right_rotate Z.eq_dec (GraphLib.examples.bst.bst_tree (avl_bst g)) l p) ->
  avl_right raw z = avl_right g z /\ avl_left raw z = avl_left g z.
Proof.
  intros g raw x l p z Hv Hx Hl Hz Hzx Hzl Hzp Hb.
  pose proof (GraphLib.examples.bst.bst_binary_tree _ (proj1 Hv)) as Ht.
  assert (Hno : avl_right g z <> Some l /\ avl_left g z <> Some l).
  { split; intro Hc; apply Hzx; eapply (GraphLib.examples.bst.father_unique _ Ht l z x Hz Hx); auto. }
  assert (Hrep : forall c : option addr, c <> Some l -> GraphLib.examples.bst.replace_child Z.eq_dec l p c = c).
  { intros [c|] Hc; unfold GraphLib.examples.bst.replace_child; [|reflexivity].
    destruct (Z.eq_dec c l); [subst; contradiction|reflexivity]. }
  assert (Hin : In z (avl_nodes g)) by (eapply GraphLib.examples.bst.finite_vertices; eauto).
  unfold avl_right, avl_left. rewrite Hb. simpl.
  unfold GraphLib.examples.bst.right_rotate_right_child, GraphLib.examples.bst.right_rotate_left_child.
  rewrite !GraphLib.examples.bst.iter_override_in by assumption.
  unfold GraphLib.examples.bst.right_rotate_right_child_value, GraphLib.examples.bst.right_rotate_left_child_value.
  destruct (Z.eq_dec z p); [contradiction|]. destruct (Z.eq_dec z l); [contradiction|].
  split; apply Hrep; tauto.
Qed.
Lemma avl_rl_outer_children__rl_graph_composition :
  forall g raw x l p,
  avl_height_input_valid g -> avl_root g = Some x -> avl_vvalid g x ->
  avl_right g x = Some l -> avl_left g l = Some p ->
  avl_bst raw = GraphLib.examples.bst.bst_with_tree (avl_bst g)
    (GraphLib.examples.bst.right_rotate Z.eq_dec (GraphLib.examples.bst.bst_tree (avl_bst g)) l p) ->
  avl_root raw = Some x /\ avl_right raw x = Some p /\ avl_left raw x = avl_left g x.
Proof.
  intros g raw x l p Hv Hr Hx Hl Hp Hb.
  pose proof (GraphLib.examples.bst.bst_binary_tree _ (proj1 Hv)) as Ht.
  assert (Hlx : l <> x).
  { intro E; subst l. eapply GraphLib.examples.bst.bt_child_no_self; eauto. right; exact Hl. }
  assert (Hpx : p <> x).
  { intro E; subst p. pose proof (GraphLib.examples.bst.root_no_parents _ Ht l x Hr); tauto. }
  assert (Hvl : avl_vvalid g l) by (eapply (GraphLib.examples.bst.child_valid _ Ht x l Hx); auto).
  assert (Hrl : avl_left g x <> Some l).
  { intro E. exact (GraphLib.examples.bst.child_distinct _ Ht x l l Hx Hvl Hvl E Hl eq_refl). }
  split.
  - unfold avl_root. rewrite Hb. simpl. unfold GraphLib.examples.bst.right_rotate_root.
    change (avl_root g) with (GraphLib.examples.bst.theroot (GraphLib.examples.bst.bst_tree (avl_bst g))) in Hr.
    change (@GraphLib.examples.bst.theroot Z (GraphLib.examples.bst.bst_tree (avl_bst g)) = Some x) in Hr. rewrite Hr. destruct (Z.eq_dec l x) as [E|N]; [contradiction|reflexivity].
  - assert (Hin : In x (avl_nodes g)) by (eapply GraphLib.examples.bst.finite_vertices; eauto).
    unfold avl_right, avl_left. rewrite Hb. simpl.
    unfold GraphLib.examples.bst.right_rotate_right_child, GraphLib.examples.bst.right_rotate_left_child.
    rewrite !GraphLib.examples.bst.iter_override_in by assumption.
    unfold GraphLib.examples.bst.right_rotate_right_child_value, GraphLib.examples.bst.right_rotate_left_child_value.
    destruct (Z.eq_dec x p); [congruence|]. destruct (Z.eq_dec x l); [congruence|].
    change (GraphLib.examples.bst.replace_child Z.eq_dec l p (avl_right g x) = Some p /\
      GraphLib.examples.bst.replace_child Z.eq_dec l p (avl_left g x) = avl_left g x).
    rewrite Hl. split.
    + unfold GraphLib.examples.bst.replace_child. destruct (Z.eq_dec l l); [reflexivity|contradiction].
    + destruct (avl_left g x) as [r|] eqn:Er; unfold GraphLib.examples.bst.replace_child; [|reflexivity].
      destruct (Z.eq_dec r l); [subst; contradiction|reflexivity].
Qed.
Lemma avl_rl_graft_bst__rl_graph_composition :
  forall g h raw x l p,
  avl_height_input_valid g -> avl_root g = Some x -> avl_vvalid g x -> avl_right g x = Some l ->
  avl_height_input_valid h -> avl_root h = Some p ->
  (forall z, avl_vvalid h z <-> avl_vvalid g z /\ avl_reachable g l z) ->
  (forall z, avl_key_of h z = avl_key_of g z) ->
  GraphLib.examples.bst.BinaryTreeProp addr (GraphLib.examples.bst.bst_tree (avl_bst raw)) ->
  (forall z, avl_vvalid raw z <-> avl_vvalid g z) ->
  (forall z, avl_key_of raw z = avl_key_of g z) ->
  avl_right raw x = Some p -> avl_left raw x = avl_left g x ->
  (forall z, avl_vvalid h z -> avl_right raw z = avl_right h z /\ avl_left raw z = avl_left h z) ->
  (forall z, avl_vvalid g z -> avl_reachable g (avl_ptr_of (avl_left g x)) z ->
    avl_right raw z = avl_right g z /\ avl_left raw z = avl_left g z) ->
  avl_bst_valid raw.
Proof.
  intros g h raw x l p Hv Hr Hx Hl Hhv Hhr Hdom Hhk Hrt Hrd Hrk Hxl Hxr Hloc Hframe.
  pose proof (GraphLib.examples.bst.bst_binary_tree _ (proj1 Hv)) as Ht.
  pose proof (GraphLib.examples.bst.bst_binary_tree _ (proj1 Hhv)) as Hht.
  assert (Hhp : avl_vvalid h p) by (eapply GraphLib.examples.bst.root_valid; eauto).
  assert (Hph : forall a b, avl_vvalid h a -> (avl_reachable h a b <-> avl_reachable raw a b)).
  { intros a b Ha. apply (avl_path_equiv_on_closed_region__left_rotation_graph_heights addr
      (GraphLib.examples.bst.bt_child (GraphLib.examples.bst.bst_tree (avl_bst h)))
      (GraphLib.examples.bst.bt_child (GraphLib.examples.bst.bst_tree (avl_bst raw))) a); [|reflexivity].
    intros u v Hu. assert (Hhu : avl_vvalid h u) by (eapply GraphLib.examples.bst.bt_path_end_valid_early; eauto).
    destruct (Hloc u Hhu) as [Hll Hrr].
    change ((avl_left h u = Some v \/ avl_right h u = Some v) <-> (avl_left raw u = Some v \/ avl_right raw u = Some v)).
    rewrite Hll,Hrr. reflexivity. }
  assert (Hpg : forall a b, avl_vvalid g a -> avl_reachable g (avl_ptr_of (avl_left g x)) a ->
    (avl_reachable g a b <-> avl_reachable raw a b)).
  { intros a b Ha Hra. apply (avl_path_equiv_on_closed_region__left_rotation_graph_heights addr
      (GraphLib.examples.bst.bt_child (GraphLib.examples.bst.bst_tree (avl_bst g)))
      (GraphLib.examples.bst.bt_child (GraphLib.examples.bst.bst_tree (avl_bst raw))) a); [|reflexivity].
    intros u v Hu. assert (Hgu : avl_vvalid g u) by (eapply GraphLib.examples.bst.bt_path_end_valid_early; eauto).
    assert (Hru : avl_reachable g (avl_ptr_of (avl_left g x)) u) by (etransitivity; eauto).
    destruct (Hframe u Hgu Hru) as [Hll Hrr].
    change ((avl_left g u = Some v \/ avl_right g u = Some v) <-> (avl_left raw u = Some v \/ avl_right raw u = Some v)).
    rewrite Hll,Hrr. reflexivity. }
  assert (Hpartition : forall z, avl_vvalid g z -> z = x \/ avl_reachable g l z \/ avl_reachable g (avl_ptr_of (avl_left g x)) z).
  { intros z Hz. destruct (GraphLib.examples.bst.path_exists _ Ht z Hz) as [r [Er Hp]].
    change (avl_root g = Some r) in Er. rewrite Hr in Er. inversion Er; subst r.
    pose proof (avl_subtree_path_classify__graph_store_decomposition g x z Hp) as Hc.
    rewrite Hl in Hc. tauto. }
  assert (Hstep : forall a b, avl_reachable g (avl_ptr_of (avl_left g x)) a ->
    (avl_left g a = Some b \/ avl_right g a = Some b) -> avl_reachable g (avl_ptr_of (avl_left g x)) b).
  { intros a b Ha Hab. etransitivity; [exact Ha|]. unfold avl_reachable,GraphLib.examples.bst.bt_path.
    transitivity_1n b; [exact Hab|reflexivity]. }
  unfold avl_bst_valid. constructor; [exact Hrt| |]; cycle 1.
  - intros z v Hz [c [Hc Hpath]].
    change (avl_vvalid raw z) in Hz. apply (proj1 (Hrd z)) in Hz.
    change (avl_right raw z = Some c) in Hc.
    change (avl_key_of raw z < avl_key_of raw v). rewrite !Hrk.
    destruct (Hpartition z Hz) as [->|[HzL|HzR]].
    + rewrite Hxl in Hc. inversion Hc; subst c.
      apply (proj2 (Hph p v Hhp)) in Hpath.
      assert (Hvh : avl_vvalid h v) by (eapply GraphLib.examples.bst.bt_path_end_valid_early; eauto).
      destruct (proj1 (Hdom v) Hvh) as [_ Hlv].
      apply (GraphLib.examples.bst.bst_right_order _ (proj1 Hv) x v Hx). exists l; auto.
    + assert (Hhz : avl_vvalid h z) by (apply (proj2 (Hdom z)); auto).
      rewrite (proj1 (Hloc z Hhz)) in Hc.
      assert (Hhc : avl_vvalid h c) by (eapply (GraphLib.examples.bst.child_valid _ Hht z c Hhz); auto).
      apply (proj2 (Hph c v Hhc)) in Hpath.
      rewrite <- !Hhk. apply (GraphLib.examples.bst.bst_right_order _ (proj1 Hhv) z v Hhz). exists c; auto.
    + rewrite (proj1 (Hframe z Hz HzR)) in Hc.
      assert (Hgc : avl_vvalid g c) by (eapply (GraphLib.examples.bst.child_valid _ Ht z c Hz); auto).
      apply (proj2 (Hpg c v Hgc (Hstep z c HzR (or_intror Hc)))) in Hpath.
      apply (GraphLib.examples.bst.bst_right_order _ (proj1 Hv) z v Hz). exists c; auto.
  - intros z v Hz [c [Hc Hpath]].
    change (avl_vvalid raw z) in Hz. apply (proj1 (Hrd z)) in Hz.
    change (avl_left raw z = Some c) in Hc.
    change (avl_key_of raw v < avl_key_of raw z). rewrite !Hrk.
    destruct (Hpartition z Hz) as [->|[HzL|HzR]].
    + rewrite Hxr in Hc.
      assert (Hgc : avl_vvalid g c) by (eapply (GraphLib.examples.bst.child_valid _ Ht x c Hx); auto).
      assert (Hrc : avl_reachable g (avl_ptr_of (avl_left g x)) c) by (rewrite Hc; reflexivity).
      apply (proj2 (Hpg c v Hgc Hrc)) in Hpath.
      apply (GraphLib.examples.bst.bst_left_order _ (proj1 Hv) x v Hx). exists c; auto.
    + assert (Hhz : avl_vvalid h z) by (apply (proj2 (Hdom z)); auto).
      rewrite (proj2 (Hloc z Hhz)) in Hc.
      assert (Hhc : avl_vvalid h c) by (eapply (GraphLib.examples.bst.child_valid _ Hht z c Hhz); auto).
      apply (proj2 (Hph c v Hhc)) in Hpath.
      rewrite <- !Hhk. apply (GraphLib.examples.bst.bst_left_order _ (proj1 Hhv) z v Hhz). exists c; auto.
    + rewrite (proj2 (Hframe z Hz HzR)) in Hc.
      assert (Hgc : avl_vvalid g c) by (eapply (GraphLib.examples.bst.child_valid _ Ht z c Hz); auto).
      apply (proj2 (Hpg c v Hgc (Hstep z c HzR (or_introl Hc)))) in Hpath.
      apply (GraphLib.examples.bst.bst_left_order _ (proj1 Hv) z v Hz). exists c; auto.
Qed.
Lemma avl_rl_lift__rl_graph_composition :
  forall g h x result cached,
  avl_rl_rotation_input g x ->
  avl_right_rotation_result (avl_subtree_model g (avl_ptr_of (avl_right g x))) h
    (avl_ptr_of (avl_right g x)) result ->
  0 <= cached <= UINT_MAX -> INT_MIN <= avl_key_of g x <= INT_MAX ->
  (&(x # "AvlNode" ->ₛ "data") # Int |-> avl_key_of g x) **
  (&(x # "AvlNode" ->ₛ "height") # UInt |-> cached) **
  (&(x # "AvlNode" ->ₛ "right") # Ptr |-> result) **
  (&(x # "AvlNode" ->ₛ "left") # Ptr |-> avl_ptr_of (avl_left g x)) **
  avl_tree_store h ** avl_subtree_store_at g (avl_ptr_of (avl_left g x)) |--
  EX m, “ avl_rl_middle g m x (avl_ptr_of (avl_right g x))
      (avl_ptr_of (avl_left g (avl_ptr_of (avl_right g x)))) ” &&
    “ avl_left_rotation_cached_input m x ” && avl_tree_store (avl_with_root_cache m x cached).
Proof.
  intros g h x result cached Hin Hout Hcache Hkeyx.
  pose proof Hin as [Hv [Hr [Hx [Hnx [Hnl [Hnp Hbound]]]]]].
  pose proof (GraphLib.examples.bst.bst_binary_tree _ (proj1 Hv)) as Ht.
  destruct (avl_right g x) as [l|] eqn:Hl; [|contradiction]. simpl avl_ptr_of in *.
  destruct (avl_left g l) as [p|] eqn:Hp; [|contradiction]. simpl avl_ptr_of in Hnp.
  assert (HvL : avl_vvalid g l) by (eapply (GraphLib.examples.bst.child_valid _ Ht x l Hx); auto).
  assert (HvP : avl_vvalid g p) by (eapply (GraphLib.examples.bst.child_valid _ Ht l p HvL); auto).
  assert (Hlp : avl_reachable g l p).
  { unfold avl_reachable, GraphLib.examples.bst.bt_path. transitivity_1n p; [left; exact Hp|reflexivity]. }
  pose proof (avl_projection_children__lr_graph_composition g l l (ltac:(reflexivity))) as [Hslr Hsll].
  pose proof (avl_projection_children__lr_graph_composition g l p Hlp) as [Hspr Hspl].
  destruct Hout as [Hres [Hnr [Hhr [Hrot [Hhv [Hhn Hhk]]]]]].
  rewrite Hslr,Hp in Hres. simpl avl_ptr_of in Hres. subst result.
  pose proof Hrot as [_ [_ [Hhb [Hhl [Hhp Hnon]]]]].
  assert (Hhd : forall z, avl_vvalid h z <-> avl_vvalid g z /\ avl_reachable g l z).
  { intro z. exact (proj2 (proj2 (avl_right_rotation_domain_keys__right_rotation_graph _ h l p z Hrot))). }
  assert (Hkeys : forall z, avl_key_of h z = avl_key_of g z) by exact Hhk.
  set (raw := {| avl_bst := GraphLib.examples.bst.bst_with_tree (avl_bst g)
    (GraphLib.examples.bst.right_rotate Z.eq_dec (GraphLib.examples.bst.bst_tree (avl_bst g)) l p);
    avl_height_of := avl_height_of h |}).
  assert (Hrb : avl_bst raw = GraphLib.examples.bst.bst_with_tree (avl_bst g)
    (GraphLib.examples.bst.right_rotate Z.eq_dec (GraphLib.examples.bst.bst_tree (avl_bst g)) l p)) by reflexivity.
  assert (Hrd : forall z, avl_vvalid raw z <-> avl_vvalid g z) by (intro z; reflexivity).
  assert (Hrk : forall z, avl_key_of raw z = avl_key_of g z) by (intro z; reflexivity).
  assert (Hrn : avl_nodes raw = avl_nodes g) by reflexivity.
  assert (Hlocal : forall z, avl_vvalid h z -> avl_right raw z = avl_right h z /\ avl_left raw z = avl_left h z).
  { intros z Hz. destruct (proj1 (Hhd z) Hz) as [Hgz Hlz].
    exact (avl_rl_lift_children__rl_graph_composition g h raw l p z Hv HvL Hp Hgz Hlz Hrb Hhb). }
  pose proof (avl_rl_outer_children__rl_graph_composition g raw x l p Hv Hr Hx Hl Hp Hrb) as [Hrr [Hrl Hrrc]].
  assert (Hrightkey : forall z, avl_reachable g l z -> avl_key_of g x < avl_key_of g z).
  { intros z Hz. apply (GraphLib.examples.bst.bst_right_order _ (proj1 Hv) x z Hx). exists l; auto. }
  assert (Hleftkey : forall z, avl_vvalid g z -> avl_reachable g (avl_ptr_of (avl_left g x)) z -> avl_key_of g z < avl_key_of g x).
  { intros z Hz Hpz. destruct (avl_left g x) as [r|] eqn:Er.
    - apply (GraphLib.examples.bst.bst_left_order _ (proj1 Hv) x z Hx). exists r; auto.
    - exfalso. eapply avl_subtree_invalid_path_empty__height_accessor; [exact Hv| |exact Hz|exact Hpz].
      intro Hnull. exact (proj2 (proj2 Hv) NULL Hnull eq_refl). }
  assert (Hlx : l <> x) by (pose proof (Hrightkey l (ltac:(reflexivity))); intro E; subst; lia).
  assert (Hpx : p <> x) by (pose proof (Hrightkey p Hlp); intro E; subst; lia).
  assert (HavoidR : forall z, avl_vvalid g z -> avl_reachable g (avl_ptr_of (avl_left g x)) z -> z <> x /\ z <> l /\ z <> p).
  { intros z Hz Hpz. pose proof (Hleftkey z Hz Hpz).
    pose proof (Hrightkey l (ltac:(reflexivity))). pose proof (Hrightkey p Hlp).
    repeat split; intro E; subst; lia. }
  assert (Hframe : forall z, avl_vvalid g z -> avl_reachable g (avl_ptr_of (avl_left g x)) z ->
    avl_right raw z = avl_right g z /\ avl_left raw z = avl_left g z).
  { intros z Hz Hpz. destruct (HavoidR z Hz Hpz) as [Hzx [Hzl Hzp]].
    exact (avl_rl_outside_children__rl_graph_composition g raw x l p z Hv Hx Hl Hz Hzx Hzl Hzp Hrb). }
  assert (Hrawbst : avl_bst_valid raw).
  { eapply (avl_rl_graft_bst__rl_graph_composition g h raw x l p Hv Hr Hx Hl Hhv Hhr Hhd Hkeys); eauto.
    unfold raw; simpl. eapply GraphLib.examples.bst.right_rotate_preserves_gvalid; eauto. }
  pose proof (GraphLib.examples.bst.bst_binary_tree _ (proj1 Hhv)) as Hht.
  assert (Hvlh : avl_vvalid h l) by (apply (proj2 (Hhd l)); split; [exact HvL|reflexivity]).
  assert (Hvph : avl_vvalid h p) by (apply (proj2 (Hhd p)); auto).
  assert (Hrawrot : avl_right_rotation_model g raw l p).
  { unfold avl_right_rotation_model. split; [exact HvL|]. split; [exact Hp|]. split; [exact Hrb|].
    split.
    - unfold avl_recomputed_at in *. destruct (Hlocal l Hvlh) as [E1 E2]. rewrite E1,E2. exact Hhl.
    - split.
      + unfold avl_recomputed_at in *. destruct (Hlocal p Hvph) as [E1 E2]. rewrite E1,E2. exact Hhp.
      + exact Hnon. }
  set (newheight := Z.max (avl_child_height raw (avl_right raw x)) (avl_child_height raw (avl_left raw x)) + 1).
  set (m := avl_with_root_cache raw x newheight).
  assert (Hmx : avl_height_of m x = newheight).
  { unfold m,avl_with_root_cache,avl_height_update; simpl. destruct (Z.eq_dec x x); [reflexivity|contradiction]. }
  assert (Hmnot : forall z, z <> x -> avl_height_of m z = avl_height_of h z).
  { intros z Hz. unfold m,avl_with_root_cache,avl_height_update; simpl. destruct (Z.eq_dec z x); [contradiction|reflexivity]. }
  assert (Hmlocal : forall z, avl_vvalid h z -> avl_height_of m z = avl_height_of h z).
  { intros z Hz. apply Hmnot. destruct (proj1 (Hhd z) Hz) as [_ Hpz]. pose proof (Hrightkey z Hpz). intro E; subst; lia. }
  assert (Hmframe : forall z, avl_vvalid g z -> avl_reachable g (avl_ptr_of (avl_left g x)) z -> avl_height_of m z = avl_height_of g z).
  { intros z Hz Hpz. destruct (HavoidR z Hz Hpz) as [Hzx [Hzl Hzp]]. rewrite Hmnot by exact Hzx. apply Hnon; assumption. }
  assert (HchildH : forall z child, avl_vvalid h z ->
    (avl_left h z = child \/ avl_right h z = child) -> avl_child_height m child = avl_child_height h child).
  { intros z [c|] Hz Hc; simpl; [|reflexivity]. apply Hmlocal.
    eapply (GraphLib.examples.bst.child_valid _ Hht z c Hz); exact Hc. }
  assert (HchildR : forall z child, avl_vvalid g z -> avl_reachable g (avl_ptr_of (avl_left g x)) z ->
    (avl_left g z = child \/ avl_right g z = child) -> avl_child_height m child = avl_child_height g child).
  { intros z [c|] Hz Hpz Hc; simpl; [|reflexivity]. apply Hmframe.
    - eapply (GraphLib.examples.bst.child_valid _ Ht z c Hz); exact Hc.
    - etransitivity; [exact Hpz|]. unfold avl_reachable,GraphLib.examples.bst.bt_path. transitivity_1n c; [exact Hc|reflexivity]. }
  assert (HchildX : avl_child_height m (avl_left g x) = avl_child_height g (avl_left g x)).
  { destruct (avl_left g x) as [c|] eqn:Ec; simpl; [|reflexivity]. apply Hmframe.
    - eapply (GraphLib.examples.bst.child_valid _ Ht x c Hx); auto.
    - reflexivity. }
  assert (HrawchildX : avl_child_height raw (avl_left g x) = avl_child_height g (avl_left g x)).
  { destruct (avl_left g x) as [c|] eqn:Ec; simpl; [|reflexivity].
    assert (Hvc : avl_vvalid g c) by (eapply (GraphLib.examples.bst.child_valid _ Ht x c Hx); auto).
    assert (Hpc : avl_reachable g (avl_ptr_of (avl_left g x)) c) by (rewrite Ec; reflexivity).
    destruct (HavoidR c Hvc (ltac:(reflexivity))) as [_ [Hcl Hcp]]. apply Hnon; assumption. }
  assert (Hnew : newheight = Z.max (avl_height_of h p) (avl_child_height g (avl_left g x)) + 1).
  { unfold newheight. rewrite Hrl,Hrrc,HrawchildX. reflexivity. }
  pose proof (avl_right_rotation_pivot_children__right_rotation_graph _ h l p
    (avl_subtree_projection_valid__lr_graph_composition g l Hv HvL) Hrot) as [Hhpl [Hhpr [Hhll Hhlr]]].
  rewrite Hsll in Hhll. rewrite Hspl in Hhlr. rewrite Hspr in Hhpr.
  assert (Hsubchild : forall z child, avl_vvalid g z ->
    (avl_left g z = child \/ avl_right g z = child) ->
    child <> Some l -> child <> Some p -> avl_child_height h child = avl_child_height g child).
  { intros z [c|] Hz Hc Hcl Hcp; simpl; [|reflexivity]. apply Hnon; congruence. }
  assert (Hcll : avl_child_height h (avl_right g l) = avl_child_height g (avl_right g l)).
  { apply (Hsubchild l _ HvL (or_intror eq_refl)).
    - intro E; exact (GraphLib.examples.bst.bt_child_no_self _ _ Ht HvL (or_intror E)).
    - intro E; exact (GraphLib.examples.bst.child_distinct _ Ht l p p HvL HvP HvP Hp E eq_refl). }
  assert (Hclp : avl_child_height h (avl_right g p) = avl_child_height g (avl_right g p)).
  { apply (Hsubchild p _ HvP (or_intror eq_refl)).
    - intro E; eapply (GraphLib.examples.bst.bt_child_no_back_path _ l p Ht HvL (or_introl Hp)).
      unfold GraphLib.examples.bst.bt_path. transitivity_1n l; [right; exact E|reflexivity].
    - intro E; exact (GraphLib.examples.bst.bt_child_no_self _ _ Ht HvP (or_intror E)). }
  assert (Hcrp : avl_child_height h (avl_left g p) = avl_child_height g (avl_left g p)).
  { apply (Hsubchild p _ HvP (or_introl eq_refl)).
    - intro E; eapply (GraphLib.examples.bst.bt_child_no_back_path _ l p Ht HvL (or_introl Hp)).
      unfold GraphLib.examples.bst.bt_path. transitivity_1n l; [left; exact E|reflexivity].
    - intro E; exact (GraphLib.examples.bst.bt_child_no_self _ _ Ht HvP (or_introl E)). }
  assert (Hehl : avl_height_of h l = Z.max (avl_child_height g (avl_right g l)) (avl_child_height g (avl_right g p)) + 1).
  { unfold avl_recomputed_at in Hhl. rewrite Hhll,Hhlr,Hcll,Hclp in Hhl. rewrite Z.max_comm in Hhl. exact Hhl. }
  assert (Hehp : avl_height_of h p = Z.max (avl_height_of h l) (avl_child_height g (avl_left g p)) + 1).
  { unfold avl_recomputed_at in Hhp. rewrite Hhpl,Hhpr,Hcrp in Hhp. rewrite Z.max_comm in Hhp. exact Hhp. }
  pose proof (proj1 (proj2 Hv) x Hx) as [Hbx Hex].
  pose proof (proj1 (proj2 Hv) l HvL) as [Hbl Hel].
  pose proof (proj1 (proj2 Hv) p HvP) as [Hbp Hep].
  rewrite Hl in Hex. rewrite Hp in Hel.
  rewrite Z.max_comm in Hex, Hel, Hep. simpl avl_child_height in Hex,Hel.
  assert (Hbounds : 1 <= newheight <= UINT_MAX /\ avl_height_of h l <= INT_MAX /\
    Z.max (avl_child_height g (avl_left g p)) (avl_child_height g (avl_left g x)) + 1 <= INT_MAX).
  { pose proof (proj1 (proj1 (proj2 Hhv) p Hvph)) as Hbhp.
    pose proof (Z.le_max_l (avl_height_of g l) (avl_child_height g (avl_left g x))) as ExL.
    pose proof (Z.le_max_r (avl_height_of g l) (avl_child_height g (avl_left g x))) as ExR.
    pose proof (Z.le_max_l (avl_child_height g (avl_right g l)) (avl_height_of g p)) as ElL.
    pose proof (Z.le_max_r (avl_child_height g (avl_right g l)) (avl_height_of g p)) as ElR.
    pose proof (Z.le_max_l (avl_child_height g (avl_right g p)) (avl_child_height g (avl_left g p))) as EpL.
    pose proof (Z.le_max_r (avl_child_height g (avl_right g p)) (avl_child_height g (avl_left g p))) as EpR.
    assert (EnL : avl_height_of h l <= avl_height_of g l).
    { rewrite Hehl. assert (Z.max (avl_child_height g (avl_right g l)) (avl_child_height g (avl_right g p)) <= avl_height_of g l - 1) by (apply Z.max_lub; lia). lia. }
    assert (EnP : avl_height_of h p <= avl_height_of g l + 1).
    { rewrite Hehp. assert (Z.max (avl_height_of h l) (avl_child_height g (avl_left g p)) <= avl_height_of g l) by (apply Z.max_lub; lia). lia. }
    assert (EnX : Z.max (avl_height_of h p) (avl_child_height g (avl_left g x)) <= avl_height_of g x) by (apply Z.max_lub; lia).
    pose proof (Z.le_max_l (avl_height_of h p) (avl_child_height g (avl_left g x))) as EnXlo.
    assert (Ed : Z.max (avl_child_height g (avl_left g p)) (avl_child_height g (avl_left g x)) <= avl_height_of g x - 1) by (apply Z.max_lub; lia).
    rewrite Hnew. clear - Hbhp EnX EnXlo Ed EnL Hbound Hex ExL. lia. }
  assert (Hpartition : forall z, avl_vvalid g z -> z = x \/ avl_reachable g l z \/ avl_reachable g (avl_ptr_of (avl_left g x)) z).
  { intros z Hz. destruct (GraphLib.examples.bst.path_exists _ Ht z Hz) as [r [Er Ep]].
    change (avl_root g = Some r) in Er. rewrite Hr in Er. inversion Er; subst r.
    pose proof (avl_subtree_path_classify__graph_store_decomposition g x z Ep) as Hc. rewrite Hl in Hc. tauto. }
  assert (Hmvalid : avl_height_input_valid m).
  { split; [exact Hrawbst|]. split.
    - intros z Hz. change (avl_vvalid g z) in Hz.
      destruct (Hpartition z Hz) as [->|[HzL|HzR]].
      + rewrite Hmx. split; [tauto|]. unfold avl_recomputed_at. rewrite Z.max_comm. change (newheight = Z.max (avl_child_height m (avl_right raw x)) (avl_child_height m (avl_left raw x)) + 1).
        rewrite Hrl,Hrrc,HchildX. change (newheight = Z.max (avl_height_of m p) (avl_child_height g (avl_left g x)) + 1). rewrite Hmlocal by exact Hvph. exact Hnew.
      + assert (Hhz : avl_vvalid h z) by (apply (proj2 (Hhd z)); auto).
        rewrite Hmlocal by exact Hhz. split; [exact (proj1 (proj1 (proj2 Hhv) z Hhz))|].
        unfold avl_recomputed_at. rewrite Z.max_comm. change (avl_height_of h z = Z.max (avl_child_height m (avl_right raw z)) (avl_child_height m (avl_left raw z)) + 1).
        destruct (Hlocal z Hhz) as [E1 E2]. rewrite E1,E2.
        rewrite (HchildH z _ Hhz (or_intror eq_refl)),(HchildH z _ Hhz (or_introl eq_refl)).
        rewrite Z.max_comm. exact (proj2 (proj1 (proj2 Hhv) z Hhz)).
      + rewrite (Hmframe z Hz HzR). split; [exact (proj1 (proj1 (proj2 Hv) z Hz))|].
        unfold avl_recomputed_at. rewrite Z.max_comm. change (avl_height_of g z = Z.max (avl_child_height m (avl_right raw z)) (avl_child_height m (avl_left raw z)) + 1).
        destruct (Hframe z Hz HzR) as [E1 E2]. rewrite E1,E2.
        rewrite (HchildR z _ Hz HzR (or_intror eq_refl)),(HchildR z _ Hz HzR (or_introl eq_refl)).
        rewrite Z.max_comm. exact (proj2 (proj1 (proj2 Hv) z Hz)).
    - intros z Hz. apply (proj2 (proj2 Hv) z). exact Hz. }
  assert (Hmiddle : avl_rl_middle g m x l p) by (exists raw; auto).
  assert (Hleft : avl_left_rotation_cached_input m x).
  { unfold avl_left_rotation_cached_input. split; [exact Hmvalid|]. split; [exact Hrr|].
    split; [exact Hx|]. split; [exact Hnx|]. rewrite Z.max_comm.
    change (avl_ptr_of (avl_right raw x) <> NULL /\
      avl_child_height m (avl_right raw (avl_ptr_of (avl_right raw x))) <= INT_MAX /\
      Z.max (avl_child_height m (avl_left raw (avl_ptr_of (avl_right raw x)))) (avl_child_height m (avl_left raw x)) + 1 <= INT_MAX).
    rewrite Hrl,Hrrc. simpl avl_ptr_of. split; [exact Hnp|].
    destruct (Hlocal p Hvph) as [E1 E2]. rewrite E1,E2,Hhpl,Hhpr,HchildX. change (avl_height_of m l <= INT_MAX /\ Z.max (avl_child_height m (avl_left g p)) (avl_child_height g (avl_left g x)) + 1 <= INT_MAX).
    rewrite Hmlocal by exact Hvlh.
    rewrite (HchildH p _ Hvph (or_introl Hhpr)),Hcrp. tauto. }
  Exists m. split_pure_spatial.
  - unfold avl_tree_store at 2. change (avl_nodes (avl_with_root_cache m x cached)) with (avl_nodes g).
    rewrite <- (avl_root_subtree_nodes_eq__left_rotation_graph_heights g x Hv Hr).
    rewrite (avl_graph_nodes_store_permutation__graph_store_decomposition (avl_with_root_cache m x cached) _ _ (avl_subtree_nodes_partition__height_accessor g x Hv Hx)).
    rewrite Hl. simpl avl_ptr_of.
    rewrite avl_graph_nodes_store_cons__graph_store_decomposition.
    sep_apply_r_atomic (avl_graph_nodes_store_app__graph_store_decomposition (avl_with_root_cache m x cached)
      (avl_subtree_nodes g (avl_ptr_of (avl_left g x))) (avl_subtree_nodes g l)).
    assert (HstoreL : avl_tree_store h |-- avl_graph_nodes_store (avl_with_root_cache m x cached) (avl_subtree_nodes g l)).
    { unfold avl_tree_store. rewrite Hhn. change (avl_nodes (avl_subtree_model g l)) with (avl_subtree_nodes g l).
      apply avl_nodes_store_map__lr_graph_composition. intros z Hz.
      apply GraphLib.graph_basic.valid_NoDup_list_spec in Hz as [Hz Hpz].
      assert (Hgz : avl_vvalid g z) by (eapply GraphLib.examples.bst.listV_sound; eauto).
      assert (Hhz : avl_vvalid h z) by (apply (proj2 (Hhd z)); auto).
      assert (Hzx : z <> x) by (pose proof (Hrightkey z Hpz); intro E; subst; lia).
      rewrite avl_cache_node_unchanged__right_rotation_graph by exact Hzx.
      unfold avl_graph_node_store. destruct (Hlocal z Hhz) as [E1 E2].
      change (avl_right m z) with (avl_right raw z). change (avl_left m z) with (avl_left raw z).
      rewrite E1,E2,(Hmlocal z Hhz),Hkeys.
      change (avl_key_of m z) with (avl_key_of g z). entailer!. }
    assert (HstoreR : avl_subtree_store_at g (avl_ptr_of (avl_left g x)) |--
      avl_graph_nodes_store (avl_with_root_cache m x cached) (avl_subtree_nodes g (avl_ptr_of (avl_left g x)))).
    { unfold avl_subtree_store_at. Intros_p Hguard.
      apply avl_nodes_store_map__lr_graph_composition. intros z Hz.
      apply GraphLib.graph_basic.valid_NoDup_list_spec in Hz as [Hz Hpz].
      assert (Hgz : avl_vvalid g z) by (eapply GraphLib.examples.bst.listV_sound; eauto).
      destruct (HavoidR z Hgz Hpz) as [Hzx Hrest].
      rewrite avl_cache_node_unchanged__right_rotation_graph by exact Hzx.
      unfold avl_graph_node_store. destruct (Hframe z Hgz Hpz) as [E1 E2].
      change (avl_right m z) with (avl_right raw z). change (avl_left m z) with (avl_left raw z).
      rewrite E1,E2,(Hmframe z Hgz Hpz).
      change (avl_key_of m z) with (avl_key_of g z). entailer!. }
    sep_apply_l_atomic HstoreL. sep_apply_l_atomic HstoreR.
    cancel (avl_graph_nodes_store (avl_with_root_cache m x cached) (avl_subtree_nodes g l)).
    cancel (avl_graph_nodes_store (avl_with_root_cache m x cached) (avl_subtree_nodes g (avl_ptr_of (avl_left g x)))).
    unfold avl_graph_node_store.
    change (avl_vvalid (avl_with_root_cache m x cached) x) with (avl_vvalid g x).
    change (avl_key_of (avl_with_root_cache m x cached) x) with (avl_key_of g x).
    change (avl_right (avl_with_root_cache m x cached) x) with (avl_right raw x).
    change (avl_left (avl_with_root_cache m x cached) x) with (avl_left raw x).
    rewrite Hrl,Hrrc. unfold avl_with_root_cache,avl_height_update; simpl.
    destruct (Z.eq_dec x x); [|contradiction]. entailer!.
  - split_pures; dump_pre_spatial; assumption.
Qed.


(** Locally repairable AVL input: exact BST heights, AVL at every nonroot
    vertex, signed-safe caches, and root imbalance at most two.  The empty
    graph is admitted by the existing root/NULL agreement clauses. *)
Definition avl_balance_graph_input (g : avl_model) (root : addr) : Prop :=
  avl_balance_input_valid g root /\
  (root <> NULL -> Z.abs (avl_model_balance_factor g root) <= 2).

(** Rebalancing preserves the ordered vertex list and the complete key
    function, restores full AVL validity, and never increases tree height.
    Signed-safe caches and exact heights are explicit output requirements. *)
Definition avl_balance_graph_result
    (before after : avl_model) (result : addr) : Prop :=
  avl_gvalid after /\
  avl_nodes after = avl_nodes before /\
  (forall x, avl_key_of after x = avl_key_of before x) /\
  result = avl_ptr_of (avl_root after) /\
  (forall x, avl_vvalid after x -> avl_height_of after x <= INT_MAX) /\
  avl_child_height after (avl_root after) <=
    avl_child_height before (avl_root before).

Lemma avl_balance_facts__single_rotation_and_accessors :
  forall g x, avl_balance_graph_input g x ->
  avl_height_input_valid g /\ avl_balance_factor_input_valid g /\
  (x <> NULL -> avl_root g = Some x /\ avl_vvalid g x).
Proof.
  intros g x [[Hb [Hh [Hn [Hbal [Hs [Hnull Hr]]]]]] Hroot].
  assert (Hv : avl_height_input_valid g) by (split; [assumption|split; assumption]).
  split; [exact Hv|]. split.
  - unfold avl_balance_factor_input_valid.
    split; [exact Hb|]. split; [exact Hh|]. split; [exact Hn|].
    split; [apply avl_factor_child_availability_follows_from_shape__balance_input; assumption|exact Hs].
  - intro Hx. split; [apply Hr; exact Hx|].
    apply (GraphLib.examples.bst.root_valid _
      (GraphLib.examples.bst.bst_binary_tree _ Hb)).
    apply Hr; exact Hx.
Qed.
Lemma avl_balance_factor_value__single_rotation_and_accessors :
  forall g x f, x <> NULL -> avl_balance_factor_or_null g x f ->
    f = avl_model_balance_factor g x.
Proof.
  intros g x f Hx [[Hz _]|[_ [_ [Hf _]]]]; [contradiction|assumption].
Qed.
Lemma avl_balance_unchanged__single_rotation_and_accessors :
  forall g x, avl_balance_graph_input g x ->
    (x = NULL \/ Z.abs (avl_model_balance_factor g x) <= 1) ->
    avl_balance_graph_result g g x.
Proof.
  intros g x [[Hb [Hh [Hn [Hbal [Hs [Hnull Hr]]]]]] Hroot] Hcase.
  assert (Hfull : avl_balanced g).
  { intros z Hz. destruct (Z.eq_dec z x) as [->|Hne].
    - destruct Hcase as [->|Hcase]; [exfalso; apply (Hn NULL Hz); reflexivity|exact Hcase].
    - apply Hbal; assumption. }
  assert (Hp : x = avl_ptr_of (avl_root g)).
  { destruct (Z.eq_dec x NULL) as [->|Hne].
    - rewrite Hnull by reflexivity. reflexivity.
    - rewrite Hr by assumption. reflexivity. }
  unfold avl_balance_graph_result.
  split; [unfold avl_gvalid; split; [exact Hb|]; split; [exact Hh|]; split; assumption|].
  split; [reflexivity|]. split; [intro; reflexivity|].
  split; [exact Hp|]. split; [exact Hs|lia].
Qed.
Lemma avl_balance_left_input__single_rotation_and_accessors :
  forall g x, avl_balance_graph_input g x -> x <> NULL ->
    avl_model_balance_factor g x < -1 -> avl_left_rotation_cached_input g x.
Proof.
  intros g x Hin Hnz Hsign.
  destruct (avl_balance_facts__single_rotation_and_accessors g x Hin)
    as [Hv [Hfv Hroot]].
  destruct (Hroot Hnz) as [Hr Hx].
  destruct Hv as [Hb [Hh Hn]].
  pose proof (avl_factor_child_availability_follows_from_shape__balance_input g Hb Hh x Hx) as [_ Hright].
  destruct (Hright ltac:(lia)) as [y [Hxy Hy]].
  pose proof (Hh x Hx) as [_ Hhx].
  pose proof (Hh y Hy) as [_ Hhy].
  pose proof (proj1 (proj2 (proj2 (proj2 (proj2 (proj1 Hin))))) x Hx) as Hmax.
  rewrite Hxy in Hhx. simpl avl_child_height in Hhx.
  unfold avl_left_rotation_cached_input.
  split; [split; [exact Hb|split; assumption]|].
  split; [exact Hr|]. split; [exact Hx|]. split; [exact Hnz|].
  rewrite Hxy; simpl avl_ptr_of.
  split; [apply Hn; exact Hy|]. split; lia.
Qed.
Lemma avl_balance_right_input__single_rotation_and_accessors :
  forall g x, avl_balance_graph_input g x -> x <> NULL ->
    avl_model_balance_factor g x > 1 -> avl_right_rotation_input g x.
Proof.
  intros g x Hin Hnz Hsign.
  destruct (avl_balance_facts__single_rotation_and_accessors g x Hin)
    as [Hv [Hfv Hroot]].
  destruct (Hroot Hnz) as [Hr Hx].
  destruct Hv as [Hb [Hh Hn]].
  pose proof (avl_factor_child_availability_follows_from_shape__balance_input g Hb Hh x Hx) as [Hleft _].
  destruct (Hleft ltac:(lia)) as [y [Hxy Hy]].
  pose proof (Hh x Hx) as [_ Hhx].
  pose proof (Hh y Hy) as [_ Hhy].
  pose proof (proj1 (proj2 (proj2 (proj2 (proj2 (proj1 Hin))))) x Hx) as Hmax.
  rewrite Hxy in Hhx. simpl avl_child_height in Hhx.
  unfold avl_right_rotation_input.
  split; [split; [exact Hb|split; assumption]|].
  split; [exact Hr|]. split; [exact Hx|]. split; [exact Hnz|].
  rewrite Hxy; simpl avl_ptr_of.
  split; [apply Hn; exact Hy|]. split; lia.
Qed.
Lemma avl_balance_children_avoid__single_rotation_and_accessors :
  forall g x y z c,
    avl_height_input_valid g -> avl_root g = Some x ->
    avl_vvalid g x -> (avl_left g x = Some y \/ avl_right g x = Some y) ->
    avl_vvalid g z -> z <> x ->
    (c = avl_left g z \/ c = avl_right g z) ->
    forall q, c = Some q -> q <> x /\ q <> y.
Proof.
  intros g x y z c Hv Hr Hx Hxy Hz Hzx Hc q Hq.
  pose proof (GraphLib.examples.bst.bst_binary_tree _ (proj1 Hv)) as Htree.
  assert (Hedge : GraphLib.examples.bst.bt_child
    (GraphLib.examples.bst.bst_tree (avl_bst g)) z q).
  { destruct Hc as [Hcl | Hcr].
    - left. change (avl_left g z = Some q). congruence.
    - right. change (avl_right g z = Some q). congruence. }
  split.
  - intro E; subst q.
    pose proof (GraphLib.examples.bst.root_no_parents _ Htree z x Hr) as [Hl Hrr].
    destruct Hedge; contradiction.
  - intro E; subst q. apply Hzx.
    eapply (GraphLib.examples.bst.father_unique _ Htree y z x); eauto.
Qed.
Lemma avl_balance_left_result__single_rotation_and_accessors :
  forall g after x y cf,
    avl_balance_graph_input g x ->
    avl_model_balance_factor g x < -1 ->
    avl_balance_factor_or_null g (avl_ptr_of (avl_right g x)) cf ->
    cf <= 0 ->
    avl_left_rotation_result g after x y ->
    avl_balance_graph_result g after y.
Proof.
  intros g after x y cf Hin Hsign Hcf Hcfs Hres.
  destruct Hin as [[Hbst [Hheight [Hnonnull [Hbalance [Hsafe [Hnull Hroot]]]]]] Hbound].
  destruct Hres as [Hret [Hynz [Hafterroot [Hrot [Hafter [Hnodes Hkeys]]]]]].
  pose proof Hrot as [Hx [Hxy [Htop [Hnewx [Hnewy Hnonlocal]]]]].
  assert (Hv : avl_height_input_valid g) by (split; [assumption|split; assumption]).
  assert (Hxnz : x <> NULL) by (apply Hnonnull; exact Hx).
  specialize (Hroot Hxnz). specialize (Hbound Hxnz).
  assert (Hy : avl_vvalid g y).
  { eapply avl_right_child_valid_from_bst__balance_input; eauto. }
  pose proof (GraphLib.examples.bst.bst_binary_tree _ Hbst) as Htree.
  assert (Hxyneq : x <> y).
  { intro E. apply (GraphLib.examples.bst.bt_child_no_self _ x Htree Hx).
    right. change (avl_right g x = Some x). congruence. }
  rewrite Hxy in Hcf. simpl avl_ptr_of in Hcf.
  pose proof (avl_balance_factor_value__single_rotation_and_accessors g y cf Hynz Hcf) as Hcfval.
  pose proof (Hbalance y Hy ltac:(congruence)) as Hybal.
  pose proof (Hheight x Hx) as [_ Hhx].
  pose proof (Hheight y Hy) as [_ Hhy].
  pose proof (Hsafe x Hx) as Hsx.
  pose proof (avl_left_rotation_pivot_children__left_rotation_graph_heights
    g after x y Hv Hrot) as [Haly [Hary [Halx Harx]]].
  assert (Hta : avl_child_height after (avl_left g x) =
                avl_child_height g (avl_left g x)).
  { apply (avl_left_rotation_child_height_transfer__left_rotation_graph_heights
      g after x y _ Hrot).
    intros q Hq.
    pose proof (avl_left_child_avoids_right_pivot__left_rotation_graph_heights
      g x y q q Hv Hx Hq Hxy ltac:(reflexivity)) as [_ Havoid].
    exact Havoid. }
  assert (Htb : avl_child_height after (avl_left g y) =
                avl_child_height g (avl_left g y)).
  { apply (avl_left_rotation_child_height_transfer__left_rotation_graph_heights
      g after x y _ Hrot).
    exact (avl_balance_children_avoid__single_rotation_and_accessors
      g x y y _ Hv Hroot Hx (or_intror Hxy) Hy ltac:(congruence) (or_introl eq_refl)). }
  assert (Htc : avl_child_height after (avl_right g y) =
                avl_child_height g (avl_right g y)).
  { apply (avl_left_rotation_child_height_transfer__left_rotation_graph_heights
      g after x y _ Hrot).
    exact (avl_balance_children_avoid__single_rotation_and_accessors
      g x y y _ Hv Hroot Hx (or_intror Hxy) Hy ltac:(congruence) (or_intror eq_refl)). }
  unfold avl_recomputed_at in Hnewx, Hnewy.
  rewrite Halx, Harx, Hta, Htb in Hnewx.
  rewrite Haly, Hary, Htc in Hnewy. simpl avl_child_height in Hnewy.
  rewrite Hxy in Hhx. simpl avl_child_height in Hhx.
  unfold avl_model_balance_factor in Hbound, Hsign, Hcfval, Hybal.
  rewrite Hxy in Hbound, Hsign. simpl avl_child_height in Hbound, Hsign.
  assert (Hxb : Z.abs (avl_model_balance_factor after x) <= 1).
  { unfold avl_model_balance_factor. rewrite Halx, Harx, Hta, Htb. lia. }
  assert (Hyb : Z.abs (avl_model_balance_factor after y) <= 1).
  { unfold avl_model_balance_factor. rewrite Haly, Hary, Htc.
    simpl avl_child_height. lia. }
  assert (Hxmax : avl_height_of after x <= avl_height_of g x) by lia.
  assert (Hymax : avl_height_of after y <= avl_height_of g x) by lia.
  assert (Hbalafter : avl_balanced after).
  { intros z Hz.
    destruct (Z.eq_dec z x) as [->|Hzx]; [exact Hxb|].
    destruct (Z.eq_dec z y) as [->|Hzy]; [exact Hyb|].
    pose proof (avl_left_rotation_domain_keys__left_rotation_graph_heights
      g after x y z Hrot) as [_ [_ Hdom]].
    assert (Hzold : avl_vvalid g z) by (apply Hdom; exact Hz).
    pose proof (avl_left_rotation_other_children__left_rotation_graph_heights
      g after x y z Hv Hroot Hzold Hzx Hzy Hrot) as [Hl Hr].
    assert (Htransfer : forall c,
      (c = avl_left g z \/ c = avl_right g z) ->
      avl_child_height after c = avl_child_height g c).
    { intros c Hc.
      apply (avl_left_rotation_child_height_transfer__left_rotation_graph_heights
        g after x y c Hrot).
      exact (avl_balance_children_avoid__single_rotation_and_accessors
        g x y z c Hv Hroot Hx (or_intror Hxy) Hzold Hzx Hc). }
    unfold avl_model_balance_factor.
    rewrite Hl, Hr, (Htransfer _ (or_introl eq_refl)),
      (Htransfer _ (or_intror eq_refl)).
    apply Hbalance; assumption. }
  assert (Hsafeafter : forall z, avl_vvalid after z ->
    avl_height_of after z <= INT_MAX).
  { intros z Hz.
    destruct (Z.eq_dec z x) as [->|Hzx]; [lia|].
    destruct (Z.eq_dec z y) as [->|Hzy]; [lia|].
    rewrite Hnonlocal by assumption. apply Hsafe.
    pose proof (avl_left_rotation_domain_keys__left_rotation_graph_heights
      g after x y z Hrot) as [_ [_ Hdom]]. apply Hdom; exact Hz. }
  unfold avl_balance_graph_result.
  split.
  - destruct Hafter as [Hb [Hh Hn]]. unfold avl_gvalid.
    split; [exact Hb|]. split; [exact Hh|]. split; assumption.
  - split; [exact Hnodes|]. split; [exact Hkeys|].
    split; [rewrite Hafterroot; reflexivity|].
    split; [exact Hsafeafter|].
    rewrite Hafterroot, Hroot. simpl avl_child_height. exact Hymax.
Qed.
Lemma avl_balance_right_result__single_rotation_and_accessors :
  forall g after x y cf,
    avl_balance_graph_input g x ->
    avl_model_balance_factor g x > 1 ->
    avl_balance_factor_or_null g (avl_ptr_of (avl_left g x)) cf ->
    cf >= 0 ->
    avl_right_rotation_result g after x y ->
    avl_balance_graph_result g after y.
Proof.
  intros g after x y cf Hin Hsign Hcf Hcfs Hres.
  destruct Hin as [[Hbst [Hheight [Hnonnull [Hbalance [Hsafe [Hnull Hroot]]]]]] Hbound].
  destruct Hres as [Hret [Hynz [Hafterroot [Hrot [Hafter [Hnodes Hkeys]]]]]].
  pose proof Hrot as [Hx [Hxy [Htop [Hnewx [Hnewy Hnonlocal]]]]].
  assert (Hv : avl_height_input_valid g) by (split; [assumption|split; assumption]).
  assert (Hxnz : x <> NULL) by (apply Hnonnull; exact Hx).
  specialize (Hroot Hxnz). specialize (Hbound Hxnz).
  assert (Hy : avl_vvalid g y).
  { eapply avl_left_child_valid_from_bst__balance_input; eauto. }
  pose proof (GraphLib.examples.bst.bst_binary_tree _ Hbst) as Htree.
  assert (Hxyneq : x <> y).
  { intro E. apply (GraphLib.examples.bst.bt_child_no_self _ x Htree Hx).
    left. change (avl_left g x = Some x). congruence. }
  rewrite Hxy in Hcf. simpl avl_ptr_of in Hcf.
  pose proof (avl_balance_factor_value__single_rotation_and_accessors g y cf Hynz Hcf) as Hcfval.
  pose proof (Hbalance y Hy ltac:(congruence)) as Hybal.
  pose proof (Hheight x Hx) as [_ Hhx].
  pose proof (Hheight y Hy) as [_ Hhy].
  pose proof (Hsafe x Hx) as Hsx.
  pose proof (avl_right_rotation_pivot_children__right_rotation_graph
    g after x y Hv Hrot) as [Haly [Hary [Halx Harx]]].
  assert (Hta : avl_child_height after (avl_right g x) =
                avl_child_height g (avl_right g x)).
  { apply (avl_right_rotation_child_height_transfer__right_rotation_graph
      g after x y _ Hrot).
    intros q Hq.
    pose proof (avl_right_child_avoids_left_pivot__right_rotation_graph
      g x y q q Hv Hx Hq Hxy ltac:(reflexivity)) as [_ Havoid].
    exact Havoid. }
  assert (Htb : avl_child_height after (avl_right g y) =
                avl_child_height g (avl_right g y)).
  { apply (avl_right_rotation_child_height_transfer__right_rotation_graph
      g after x y _ Hrot).
    exact (avl_balance_children_avoid__single_rotation_and_accessors
      g x y y _ Hv Hroot Hx (or_introl Hxy) Hy ltac:(congruence) (or_intror eq_refl)). }
  assert (Htc : avl_child_height after (avl_left g y) =
                avl_child_height g (avl_left g y)).
  { apply (avl_right_rotation_child_height_transfer__right_rotation_graph
      g after x y _ Hrot).
    exact (avl_balance_children_avoid__single_rotation_and_accessors
      g x y y _ Hv Hroot Hx (or_introl Hxy) Hy ltac:(congruence) (or_introl eq_refl)). }
  unfold avl_recomputed_at in Hnewx, Hnewy.
  rewrite Halx, Harx, Hta, Htb in Hnewx.
  rewrite Haly, Hary, Htc in Hnewy. simpl avl_child_height in Hnewy.
  rewrite Hxy in Hhx. simpl avl_child_height in Hhx.
  unfold avl_model_balance_factor in Hbound, Hsign, Hcfval, Hybal.
  rewrite Hxy in Hbound, Hsign. simpl avl_child_height in Hbound, Hsign.
  assert (Hxb : Z.abs (avl_model_balance_factor after x) <= 1).
  { unfold avl_model_balance_factor. rewrite Halx, Harx, Hta, Htb. lia. }
  assert (Hyb : Z.abs (avl_model_balance_factor after y) <= 1).
  { unfold avl_model_balance_factor. rewrite Haly, Hary, Htc.
    simpl avl_child_height. lia. }
  assert (Hxmax : avl_height_of after x <= avl_height_of g x) by lia.
  assert (Hymax : avl_height_of after y <= avl_height_of g x) by lia.
  assert (Hbalafter : avl_balanced after).
  { intros z Hz.
    destruct (Z.eq_dec z x) as [->|Hzx]; [exact Hxb|].
    destruct (Z.eq_dec z y) as [->|Hzy]; [exact Hyb|].
    pose proof (avl_right_rotation_domain_keys__right_rotation_graph
      g after x y z Hrot) as [_ [_ Hdom]].
    assert (Hzold : avl_vvalid g z) by (apply Hdom; exact Hz).
    pose proof (avl_right_rotation_other_children__right_rotation_graph
      g after x y z Hv Hroot Hzold Hzx Hzy Hrot) as [Hl Hr].
    assert (Htransfer : forall c,
      (c = avl_left g z \/ c = avl_right g z) ->
      avl_child_height after c = avl_child_height g c).
    { intros c Hc.
      apply (avl_right_rotation_child_height_transfer__right_rotation_graph
        g after x y c Hrot).
      exact (avl_balance_children_avoid__single_rotation_and_accessors
        g x y z c Hv Hroot Hx (or_introl Hxy) Hzold Hzx Hc). }
    unfold avl_model_balance_factor.
    rewrite Hl, Hr, (Htransfer _ (or_introl eq_refl)),
      (Htransfer _ (or_intror eq_refl)).
    apply Hbalance; assumption. }
  assert (Hsafeafter : forall z, avl_vvalid after z ->
    avl_height_of after z <= INT_MAX).
  { intros z Hz.
    destruct (Z.eq_dec z x) as [->|Hzx]; [lia|].
    destruct (Z.eq_dec z y) as [->|Hzy]; [lia|].
    rewrite Hnonlocal by assumption. apply Hsafe.
    pose proof (avl_right_rotation_domain_keys__right_rotation_graph
      g after x y z Hrot) as [_ [_ Hdom]]. apply Hdom; exact Hz. }
  unfold avl_balance_graph_result.
  split.
  - destruct Hafter as [Hb [Hh Hn]]. unfold avl_gvalid.
    split; [exact Hb|]. split; [exact Hh|]. split; assumption.
  - split; [exact Hnodes|]. split; [exact Hkeys|].
    split; [rewrite Hafterroot; reflexivity|].
    split; [exact Hsafeafter|].
    rewrite Hafterroot, Hroot. simpl avl_child_height. exact Hymax.
Qed.
Lemma avl_balance_lr_input__double_rotation_restoration :
 forall g x f c, avl_balance_graph_input g x ->
 avl_balance_factor_input_valid g ->
 avl_balance_factor_or_null g x f -> f > 1 ->
 avl_balance_factor_or_null g (avl_ptr_of (avl_left g x)) c -> c < 0 ->
 avl_lr_rotation_input g x.
Proof.
 intros g x f c [Hi Ha] Hf Hfx Hpos Hc Hneg.
 pose proof (avl_factor_positive_left_nonnull__rotation_argument_availability g x f Hf Hfx (ltac:(lia))) as Hl.
 pose proof (avl_factor_negative_right_nonnull__rotation_argument_availability g _ c Hf Hc Hneg) as Hp.
 destruct Hfx as [[Hnull Hzero]|[Hnx [Hx [Heq Hbound]]]]; [lia|].
 destruct Hi as [Hb [Hh [Hn [Hbal [Hsafe [Hr0 Hr]]]]]].
 unfold avl_lr_rotation_input. split; [unfold avl_height_input_valid, avl_tree_valid; tauto|].
 repeat split; auto.
Qed.
Lemma avl_balance_rl_input__double_rotation_restoration :
 forall g x f c, avl_balance_graph_input g x ->
 avl_balance_factor_input_valid g ->
 avl_balance_factor_or_null g x f -> f < -1 ->
 avl_balance_factor_or_null g (avl_ptr_of (avl_right g x)) c -> c > 0 ->
 avl_rl_rotation_input g x.
Proof.
 intros g x f c [Hi Ha] Hf Hfx Hneg Hc Hpos.
 pose proof (avl_factor_negative_right_nonnull__rotation_argument_availability g x f Hf Hfx (ltac:(lia))) as Hl.
 pose proof (avl_factor_positive_left_nonnull__rotation_argument_availability g _ c Hf Hc (ltac:(lia))) as Hp.
 destruct Hfx as [[Hnull Hzero]|[Hnx [Hx [Heq Hbound]]]]; [lia|].
 destruct Hi as [Hb [Hh [Hn [Hbal [Hsafe [Hr0 Hr]]]]]].
 unfold avl_rl_rotation_input. split; [unfold avl_height_input_valid, avl_tree_valid; tauto|].
 repeat split; auto.
Qed.
Lemma avl_left_rotation_pivot_children__double_rotation_restoration :
  forall (before after : avl_model) root promoted,
    GraphLib.examples.bst.BinaryTreeProp addr (GraphLib.examples.bst.bst_tree (avl_bst before)) ->
    avl_left_rotation_model before after root promoted ->
    avl_left after promoted = Some root /\
    avl_right after promoted = avl_right before promoted /\
    avl_left after root = avl_left before root /\
    avl_right after root = avl_left before promoted.
Proof.
  intros before after root promoted Hinput [Hroot [Hright [Htree _]]].

  pose proof Hinput as Ht.
  assert (Hroot2 :
    (GraphLib.examples.bst.bst_tree (avl_bst before)).(GraphLib.examples.bst.vset) root).
  { exact Hroot. }
  assert (Hright2 :
    (GraphLib.examples.bst.bst_tree (avl_bst before)).(GraphLib.examples.bst.right_child) root = Some promoted).
  { exact Hright. }
  assert (Hneq : root <> promoted).
  { intro Heq. subst promoted. eapply GraphLib.examples.bst.bt_child_no_self; eauto.
    right; exact Hright2. }
  pose proof (GraphLib.examples.bst.left_rotate_node_domain_sound Z.eq_dec
    (GraphLib.examples.bst.bst_tree (avl_bst before)) root promoted
    ((GraphLib.examples.bst.bst_tree (avl_bst before)).(GraphLib.examples.bst.listV))
    (GraphLib.examples.bst.binarytree_node_domain_from_gvalid _ Ht)
    Hroot2 Hright2 Hneq) as Hrot.
  pose proof (GraphLib.directed.binarytree.lrc_pivot_children _ _ _ _
    (GraphLib.directed.binarytree.lrnd_core_valid _ _ _ _ _ Hrot)) as Hchildren.
  unfold avl_left, avl_right in *.
  rewrite Htree. simpl. exact Hchildren.
Qed.
Lemma avl_right_rotation_pivot_children__double_rotation_restoration :
  forall (before after : avl_model) root promoted,
    GraphLib.examples.bst.BinaryTreeProp addr (GraphLib.examples.bst.bst_tree (avl_bst before)) ->
    avl_right_rotation_model before after root promoted ->
    avl_right after promoted = Some root /\
    avl_left after promoted = avl_left before promoted /\
    avl_right after root = avl_right before root /\
    avl_left after root = avl_right before promoted.
Proof.
  intros before after root promoted Hinput [Hroot [Hleft [Htree _]]].

  pose proof Hinput as Ht.
  assert (Hroot2 :
    (GraphLib.examples.bst.bst_tree (avl_bst before)).(GraphLib.examples.bst.vset) root).
  { exact Hroot. }
  assert (Hleft2 :
    (GraphLib.examples.bst.bst_tree (avl_bst before)).(GraphLib.examples.bst.left_child) root = Some promoted).
  { exact Hleft. }
  assert (Hneq : root <> promoted).
  { intro Heq. subst promoted. eapply GraphLib.examples.bst.bt_child_no_self; eauto.
    left; exact Hleft2. }
  pose proof (GraphLib.examples.bst.right_rotate_node_domain_sound Z.eq_dec
    (GraphLib.examples.bst.bst_tree (avl_bst before)) root promoted
    ((GraphLib.examples.bst.bst_tree (avl_bst before)).(GraphLib.examples.bst.listV))
    (GraphLib.examples.bst.binarytree_node_domain_from_gvalid _ Ht)
    Hroot2 Hleft2 Hneq) as Hrot.
  pose proof (GraphLib.directed.binarytree.rrc_pivot_children _ _ _ _
    (GraphLib.directed.binarytree.rrnd_core_valid _ _ _ _ _ Hrot)) as Hchildren.
  unfold avl_right, avl_left in *.
  rewrite Htree. simpl. exact Hchildren.
Qed.
Lemma avl_right_rotation_other_children__double_rotation_restoration :
  forall before after root promoted z,
    GraphLib.examples.bst.BinaryTreeProp addr (GraphLib.examples.bst.bst_tree (avl_bst before)) -> avl_root before = Some root ->
    avl_vvalid before z -> z <> root -> z <> promoted ->
    avl_right_rotation_model before after root promoted ->
    avl_right after z = avl_right before z /\
    avl_left after z = avl_left before z.
Proof.
  intros before after root promoted z Hvalid Hroot Hz Hneqroot Hneqprom Hrot.
  destruct Hrot as [_ [_ [Htree _]]].
  pose proof Hvalid as Ht.
  pose proof (GraphLib.examples.bst.root_no_parents _ Ht z root Hroot) as [HnoR HnoL].
  assert (Hin : In z (GraphLib.examples.bst.listV (GraphLib.examples.bst.bst_tree (avl_bst before)))).
  { apply GraphLib.examples.bst.finite_vertices; assumption. }
  split.
  - unfold avl_right. rewrite Htree. simpl.
    unfold GraphLib.examples.bst.right_rotate_right_child.
    rewrite GraphLib.examples.bst.iter_override_in by exact Hin.
    unfold GraphLib.examples.bst.right_rotate_right_child_value,
      GraphLib.examples.bst.replace_child.
    destruct (Z.eq_dec z promoted); [contradiction|].
    destruct (Z.eq_dec z root); [contradiction|].
    assert (Hrep : forall c : option Z,
      c <> Some root ->
      (match c with Some v => if Z.eq_dec v root then Some promoted else Some v
      | None => None end) = c).
    { intros [v|] Hneq; simpl; [|reflexivity].
      destruct (Z.eq_dec v root) as [->|Hne]; [contradiction|reflexivity]. }
    apply Hrep. exact HnoL.
  - unfold avl_left. rewrite Htree. simpl.
    unfold GraphLib.examples.bst.right_rotate_left_child.
    rewrite GraphLib.examples.bst.iter_override_in by exact Hin.
    unfold GraphLib.examples.bst.right_rotate_left_child_value,
      GraphLib.examples.bst.replace_child.
    destruct (Z.eq_dec z root); [contradiction|].
    destruct (Z.eq_dec z promoted); [contradiction|].
    assert (Hrep : forall c : option Z,
      c <> Some root ->
      (match c with Some v => if Z.eq_dec v root then Some promoted else Some v
      | None => None end) = c).
    { intros [v|] Hneq; simpl; [|reflexivity].
      destruct (Z.eq_dec v root) as [->|Hne]; [contradiction|reflexivity]. }
    apply Hrep. exact HnoR.
Qed.
Lemma avl_left_rotation_other_children__double_rotation_restoration :
  forall before after root promoted z,
    GraphLib.examples.bst.BinaryTreeProp addr (GraphLib.examples.bst.bst_tree (avl_bst before)) -> avl_root before = Some root ->
    avl_vvalid before z -> z <> root -> z <> promoted ->
    avl_left_rotation_model before after root promoted ->
    avl_left after z = avl_left before z /\
    avl_right after z = avl_right before z.
Proof.
  intros before after root promoted z Hvalid Hroot Hz Hneqroot Hneqprom Hrot.
  destruct Hrot as [_ [_ [Htree _]]].
  pose proof Hvalid as Ht.
  pose proof (GraphLib.examples.bst.root_no_parents _ Ht z root Hroot) as [HnoL HnoR].
  assert (Hin : In z (GraphLib.examples.bst.listV (GraphLib.examples.bst.bst_tree (avl_bst before)))).
  { apply GraphLib.examples.bst.finite_vertices; assumption. }
  split.
  - unfold avl_left. rewrite Htree. simpl.
    unfold GraphLib.examples.bst.left_rotate_left_child.
    rewrite GraphLib.examples.bst.iter_override_in by exact Hin.
    unfold GraphLib.examples.bst.left_rotate_left_value,
      GraphLib.examples.bst.replace_child.
    destruct (Z.eq_dec z promoted); [contradiction|].
    destruct (Z.eq_dec z root); [contradiction|].
    assert (Hrep : forall c : option Z,
      c <> Some root ->
      (match c with Some v => if Z.eq_dec v root then Some promoted else Some v
      | None => None end) = c).
    { intros [v|] Hneq; simpl; [|reflexivity].
      destruct (Z.eq_dec v root) as [->|Hne]; [contradiction|reflexivity]. }
    apply Hrep. exact HnoL.
  - unfold avl_right. rewrite Htree. simpl.
    unfold GraphLib.examples.bst.left_rotate_right_child.
    rewrite GraphLib.examples.bst.iter_override_in by exact Hin.
    unfold GraphLib.examples.bst.left_rotate_right_value,
      GraphLib.examples.bst.replace_child.
    destruct (Z.eq_dec z root); [contradiction|].
    destruct (Z.eq_dec z promoted); [contradiction|].
    assert (Hrep : forall c : option Z,
      c <> Some root ->
      (match c with Some v => if Z.eq_dec v root then Some promoted else Some v
      | None => None end) = c).
    { intros [v|] Hneq; simpl; [|reflexivity].
      destruct (Z.eq_dec v root) as [->|Hne]; [contradiction|reflexivity]. }
    apply Hrep. exact HnoR.
Qed.
Lemma avl_lr_topology__double_rotation_restoration :
 forall g a x y p, avl_height_input_valid g -> avl_root g = Some x ->
 avl_vvalid g x -> avl_left g x = Some y -> avl_right g y = Some p ->
 avl_lr_rotation_model g a x y p ->
 (forall z, avl_vvalid a z <-> avl_vvalid g z) /\
 avl_left a y = avl_left g y /\ avl_right a y = avl_left g p /\
 avl_left a x = avl_right g p /\ avl_right a x = avl_right g x /\
 avl_left a p = Some y /\ avl_right a p = Some x /\
 (forall z, avl_vvalid g z -> z <> x -> z <> y -> z <> p ->
 avl_left a z = avl_left g z /\ avl_right a z = avl_right g z) /\
 (forall z, z <> x -> z <> y -> z <> p -> avl_height_of a z = avl_height_of g z).
Proof.
 intros g a x y p Hv Hr Hx Hxy Hyp [m [Hi Ho]].
 pose proof (GraphLib.examples.bst.bst_binary_tree _ (proj1 Hv)) as Ht.
 pose proof Hi as [Hy [_ [Hmb [_ [_ Hmh]]]]].
 pose proof Ho as [_ [_ [Hab [_ [_ Hah]]]]].
 assert (Htm : GraphLib.examples.bst.BinaryTreeProp addr (GraphLib.examples.bst.bst_tree (avl_bst m))).
 { rewrite Hmb. simpl. apply GraphLib.examples.bst.left_rotate_preserves_gvalid; assumption. }
 pose proof (avl_lr_outer_children__lr_graph_composition g m x y p Hv Hr Hx Hxy Hyp Hmb) as [Hmr [Hmxl Hmxr]].
 pose proof (avl_left_rotation_pivot_children__double_rotation_restoration g m y p Ht Hi) as [HmpL [HmpR [HmyL HmyR]]].
 pose proof (avl_right_rotation_pivot_children__double_rotation_restoration m a x p Htm Ho) as [HapR [HapL [HaxR HaxL]]].
 assert (Hyx : y <> x).
 { intro E; subst y. exact (GraphLib.examples.bst.bt_child_no_self _ x Ht Hx (or_introl Hxy)). }
 assert (HypN : y <> p).
 { intro E; subst p. exact (GraphLib.examples.bst.bt_child_no_self _ y Ht Hy (or_intror Hyp)). }
 assert (Hdomm : forall z, avl_vvalid m z <-> avl_vvalid g z).
 { intro z. exact (proj2 (proj2 (avl_left_rotation_domain_keys__left_rotation_graph_heights g m y p z Hi))). }
 assert (Hdoma : forall z, avl_vvalid a z <-> avl_vvalid m z).
 { intro z. exact (proj2 (proj2 (avl_right_rotation_domain_keys__right_rotation_graph m a x p z Ho))). }
 pose proof (avl_right_rotation_other_children__double_rotation_restoration m a x p y Htm Hmr (proj2 (Hdomm y) Hy) Hyx HypN Ho) as [HayR HayL].
 split; [intro z; rewrite Hdoma,Hdomm; tauto|].
 rewrite HayL, HayR, HmyL, HmyR, HaxL,HmpR,HaxR,Hmxr,HapL,HmpL,HapR.
 do 6 (split; [reflexivity|]). split.
 - intros z Hz Hzx Hzy Hzp.
   pose proof (avl_right_rotation_other_children__double_rotation_restoration m a x p z Htm Hmr (proj2 (Hdomm z) Hz) Hzx Hzp Ho) as [Har Hal].
   pose proof (avl_lr_outside_children__lr_graph_composition g m x y p z Hv Hx Hxy Hz Hzx Hzy Hzp Hmb) as [Hml Hmrz].
   rewrite Har,Hal,Hml,Hmrz. auto.
 - intros z Hzx Hzy Hzp. rewrite (Hah z Hzx Hzp), (Hmh z Hzy Hzp). reflexivity.
Qed.
Lemma avl_lr_restore__double_rotation_restoration :
 forall g a x y p, avl_balance_graph_input g x -> avl_height_input_valid a ->
 avl_root g = Some x -> avl_vvalid g x -> x <> NULL ->
 avl_left g x = Some y -> avl_right g y = Some p ->
 avl_model_balance_factor g x > 1 -> avl_model_balance_factor g y < 0 ->
 avl_lr_rotation_model g a x y p ->
 avl_balanced a /\ (forall z, avl_vvalid a z -> avl_height_of a z <= INT_MAX) /\
 avl_height_of a p <= avl_height_of g x.
Proof.
 intros g a x y p [[Hb [Hh [Hn [Hbal [Hsafe [Hr0 Hr1]]]]]] Hbound] Hva Hr Hx Hnx Hxy Hyp Hfx Hfy Hrot.
 assert (Hv : avl_height_input_valid g) by (unfold avl_height_input_valid, avl_tree_valid; tauto).
 pose proof (GraphLib.examples.bst.bst_binary_tree _ Hb) as Ht.
 assert (Hy : avl_vvalid g y) by (eapply (GraphLib.examples.bst.child_valid _ Ht x y Hx); auto).
 assert (Hp : avl_vvalid g p) by (eapply (GraphLib.examples.bst.child_valid _ Ht y p Hy); auto).
 assert (Hyx : y <> x).
 { intro E; subst y. exact (GraphLib.examples.bst.bt_child_no_self _ x Ht Hx (or_introl Hxy)). }
 assert (Hpx : p <> x).
 { intro E; subst p. pose proof (GraphLib.examples.bst.root_no_parents _ Ht y x Hr); tauto. }
 pose proof (Hbal y Hy Hyx) as Hby. pose proof (Hbal p Hp Hpx) as Hbp.
 specialize (Hbound Hnx).
 apply Z.abs_le in Hbound. apply Z.abs_le in Hby. apply Z.abs_le in Hbp.
 pose proof (proj2 (Hh x Hx)) as Hex. pose proof (proj2 (Hh y Hy)) as Hey. pose proof (proj2 (Hh p Hp)) as Hep.
 unfold avl_model_balance_factor in Hbound,Hby,Hbp,Hfx,Hfy.
 rewrite Hxy in Hex,Hbound,Hfx. rewrite Hyp in Hey,Hby,Hfy. simpl avl_child_height in *.
 set (u := avl_child_height g (avl_left g y)) in *.
 set (b := avl_child_height g (avl_left g p)) in *.
 set (c := avl_child_height g (avl_right g p)) in *.
 set (d := avl_child_height g (avl_right g x)) in *.
 assert (Hnum : avl_height_of g p = u+1 /\ avl_height_of g y = u+2 /\ avl_height_of g x = u+3 /\ d=u /\ b<=u /\ c<=u /\ u-1<=b /\ u-1<=c).
 { pose proof (Z.max_spec b c). pose proof (Z.max_spec u (avl_height_of g p)).
   pose proof (Z.max_spec (avl_height_of g y) d). lia. }
 destruct Hnum as [Hph [Hyh [Hxh [Hdu [Hbu [Hcu [Hub Huc]]]]]]].
 destruct (avl_lr_topology__double_rotation_restoration g a x y p Hv Hr Hx Hxy Hyp Hrot)
 as [Hdom [Hayl [Hayr [Haxl [Haxr [Hapl [Hapr [Houtside Hnon]]]]]]]].
 assert (Hch : forall q, avl_child_height g q <= u -> avl_child_height a q = avl_child_height g q).
 { intros [z|] Hq; simpl in *; [|reflexivity]. apply Hnon; intro E; subst z; lia. }
 assert (Huy : avl_child_height a (avl_left g y) = u) by (apply Hch; unfold u; lia).
 assert (Hbb : avl_child_height a (avl_left g p) = b) by (apply Hch; exact Hbu).
 assert (Hcc : avl_child_height a (avl_right g p) = c) by (apply Hch; exact Hcu).
 assert (Hdd : avl_child_height a (avl_right g x) = d) by (apply Hch; lia).
 pose proof (proj2 (proj1 (proj2 Hva) y (proj2 (Hdom y) Hy))) as Hya.
 pose proof (proj2 (proj1 (proj2 Hva) x (proj2 (Hdom x) Hx))) as Hxa.
 pose proof (proj2 (proj1 (proj2 Hva) p (proj2 (Hdom p) Hp))) as Hpa.
 rewrite Hayl,Hayr,Huy,Hbb in Hya. rewrite Haxl,Haxr,Hcc,Hdd in Hxa.
 rewrite Hapl,Hapr in Hpa. simpl avl_child_height in Hpa.
 assert (Hheights : avl_height_of a y = u+1 /\ avl_height_of a x = u+1 /\ avl_height_of a p = u+2).
 { rewrite Z.max_l in Hya by lia. rewrite Z.max_r in Hxa by lia.
   rewrite Hya,Hxa,Hdu,Z.max_id in Hpa. lia. }
 destruct Hheights as [HyaH [HxaH HpaH]].
 assert (Hother : forall z, avl_vvalid g z -> z<>x -> z<>y -> z<>p -> avl_model_balance_factor a z = avl_model_balance_factor g z).
 { intros z Hz Hzx Hzy Hzp. destruct (Houtside z Hz Hzx Hzy Hzp) as [Hzl Hzr].
   assert (Hchild : forall q, (avl_left g z = q \/ avl_right g z = q) -> avl_child_height a q = avl_child_height g q).
   { intros [v|] Hq; simpl; [|reflexivity]. apply Hnon.
     - intro E; subst v. pose proof (GraphLib.examples.bst.root_no_parents _ Ht z x Hr); tauto.
     - intro E; subst v. apply Hzx. eapply (GraphLib.examples.bst.father_unique _ Ht y z x Hz Hx); tauto.
     - intro E; subst v. apply Hzy. eapply (GraphLib.examples.bst.father_unique _ Ht p z y Hz Hy); tauto. }
   unfold avl_model_balance_factor. rewrite Hzl,Hzr, !Hchild by auto. reflexivity. }
 split.
 - intros z Hz. apply Z.abs_le. destruct (Z.eq_dec z x) as [->|Hzx].
   + unfold avl_model_balance_factor. rewrite Haxl,Haxr,Hcc,Hdd. lia.
   + destruct (Z.eq_dec z y) as [->|Hzy].
     * unfold avl_model_balance_factor. rewrite Hayl,Hayr,Huy,Hbb. lia.
     * destruct (Z.eq_dec z p) as [->|Hzp].
       -- unfold avl_model_balance_factor. rewrite Hapl,Hapr. simpl. rewrite HyaH,HxaH. lia.
       -- rewrite Hother by (try assumption; apply (proj1 (Hdom z)); assumption).
          apply Z.abs_le. apply Hbal; [apply (proj1 (Hdom z)); assumption|assumption].
 - split.
   + intros z Hz. pose proof (Hsafe x Hx) as Hsx.
     destruct (Z.eq_dec z x) as [->|Hzx]; [lia|].
     destruct (Z.eq_dec z y) as [->|Hzy]; [lia|].
     destruct (Z.eq_dec z p) as [->|Hzp]; [lia|].
     rewrite Hnon by assumption. apply Hsafe. apply (proj1 (Hdom z)); assumption.
   + lia.
Qed.
Lemma avl_rl_topology__double_rotation_restoration :
 forall g a x y p, avl_height_input_valid g -> avl_root g = Some x ->
 avl_vvalid g x -> avl_right g x = Some y -> avl_left g y = Some p ->
 avl_rl_rotation_model g a x y p ->
 (forall z, avl_vvalid a z <-> avl_vvalid g z) /\
 avl_right a y = avl_right g y /\ avl_left a y = avl_right g p /\
 avl_right a x = avl_left g p /\ avl_left a x = avl_left g x /\
 avl_right a p = Some y /\ avl_left a p = Some x /\
 (forall z, avl_vvalid g z -> z <> x -> z <> y -> z <> p ->
 avl_right a z = avl_right g z /\ avl_left a z = avl_left g z) /\
 (forall z, z <> x -> z <> y -> z <> p -> avl_height_of a z = avl_height_of g z).
Proof.
 intros g a x y p Hv Hr Hx Hxy Hyp [m [Hi Ho]].
 pose proof (GraphLib.examples.bst.bst_binary_tree _ (proj1 Hv)) as Ht.
 pose proof Hi as [Hy [_ [Hmb [_ [_ Hmh]]]]].
 pose proof Ho as [_ [_ [Hab [_ [_ Hah]]]]].
 assert (Htm : GraphLib.examples.bst.BinaryTreeProp addr (GraphLib.examples.bst.bst_tree (avl_bst m))).
 { rewrite Hmb. simpl. apply GraphLib.examples.bst.right_rotate_preserves_gvalid; assumption. }
 pose proof (avl_rl_outer_children__rl_graph_composition g m x y p Hv Hr Hx Hxy Hyp Hmb) as [Hmr [Hmxl Hmxr]].
 pose proof (avl_right_rotation_pivot_children__double_rotation_restoration g m y p Ht Hi) as [HmpL [HmpR [HmyL HmyR]]].
 pose proof (avl_left_rotation_pivot_children__double_rotation_restoration m a x p Htm Ho) as [HapR [HapL [HaxR HaxL]]].
 assert (Hyx : y <> x).
 { intro E; subst y. exact (GraphLib.examples.bst.bt_child_no_self _ x Ht Hx (or_intror Hxy)). }
 assert (HypN : y <> p).
 { intro E; subst p. exact (GraphLib.examples.bst.bt_child_no_self _ y Ht Hy (or_introl Hyp)). }
 assert (Hdomm : forall z, avl_vvalid m z <-> avl_vvalid g z).
 { intro z. exact (proj2 (proj2 (avl_right_rotation_domain_keys__right_rotation_graph g m y p z Hi))). }
 assert (Hdoma : forall z, avl_vvalid a z <-> avl_vvalid m z).
 { intro z. exact (proj2 (proj2 (avl_left_rotation_domain_keys__left_rotation_graph_heights m a x p z Ho))). }
 pose proof (avl_left_rotation_other_children__double_rotation_restoration m a x p y Htm Hmr (proj2 (Hdomm y) Hy) Hyx HypN Ho) as [HayR HayL].
 split; [intro z; rewrite Hdoma,Hdomm; tauto|].
 rewrite HayL, HayR, HmyL, HmyR, HaxL,HmpR,HaxR,Hmxr,HapL,HmpL,HapR.
 do 6 (split; [reflexivity|]). split.
 - intros z Hz Hzx Hzy Hzp.
   pose proof (avl_left_rotation_other_children__double_rotation_restoration m a x p z Htm Hmr (proj2 (Hdomm z) Hz) Hzx Hzp Ho) as [Har Hal].
   pose proof (avl_rl_outside_children__rl_graph_composition g m x y p z Hv Hx Hxy Hz Hzx Hzy Hzp Hmb) as [Hml Hmrz].
   rewrite Har,Hal,Hml,Hmrz. auto.
 - intros z Hzx Hzy Hzp. rewrite (Hah z Hzx Hzp), (Hmh z Hzy Hzp). reflexivity.
Qed.
Lemma avl_rl_restore__double_rotation_restoration :
 forall g a x y p, avl_balance_graph_input g x -> avl_height_input_valid a ->
 avl_root g = Some x -> avl_vvalid g x -> x <> NULL ->
 avl_right g x = Some y -> avl_left g y = Some p ->
 avl_model_balance_factor g x < -1 -> avl_model_balance_factor g y > 0 ->
 avl_rl_rotation_model g a x y p ->
 avl_balanced a /\ (forall z, avl_vvalid a z -> avl_height_of a z <= INT_MAX) /\
 avl_height_of a p <= avl_height_of g x.
Proof.
 intros g a x y p [[Hb [Hh [Hn [Hbal [Hsafe [Hr0 Hr1]]]]]] Hbound] Hva Hr Hx Hnx Hxy Hyp Hfx Hfy Hrot.
 assert (Hv : avl_height_input_valid g) by (unfold avl_height_input_valid, avl_tree_valid; tauto).
 pose proof (GraphLib.examples.bst.bst_binary_tree _ Hb) as Ht.
 assert (Hy : avl_vvalid g y) by (eapply (GraphLib.examples.bst.child_valid _ Ht x y Hx); auto).
 assert (Hp : avl_vvalid g p) by (eapply (GraphLib.examples.bst.child_valid _ Ht y p Hy); auto).
 assert (Hyx : y <> x).
 { intro E; subst y. exact (GraphLib.examples.bst.bt_child_no_self _ x Ht Hx (or_intror Hxy)). }
 assert (Hpx : p <> x).
 { intro E; subst p. pose proof (GraphLib.examples.bst.root_no_parents _ Ht y x Hr); tauto. }
 pose proof (Hbal y Hy Hyx) as Hby. pose proof (Hbal p Hp Hpx) as Hbp.
 specialize (Hbound Hnx).
 apply Z.abs_le in Hbound. apply Z.abs_le in Hby. apply Z.abs_le in Hbp.
 pose proof (proj2 (Hh x Hx)) as Hex. pose proof (proj2 (Hh y Hy)) as Hey. pose proof (proj2 (Hh p Hp)) as Hep.
 unfold avl_model_balance_factor in Hbound,Hby,Hbp,Hfx,Hfy.
 rewrite Hxy in Hex,Hbound,Hfx. rewrite Hyp in Hey,Hby,Hfy. simpl avl_child_height in *.
 set (u := avl_child_height g (avl_right g y)) in *.
 set (b := avl_child_height g (avl_right g p)) in *.
 set (c := avl_child_height g (avl_left g p)) in *.
 set (d := avl_child_height g (avl_left g x)) in *.
 assert (Hnum : avl_height_of g p = u+1 /\ avl_height_of g y = u+2 /\ avl_height_of g x = u+3 /\ d=u /\ b<=u /\ c<=u /\ u-1<=b /\ u-1<=c).
 { pose proof (Z.max_spec b c). pose proof (Z.max_spec u (avl_height_of g p)).
   pose proof (Z.max_spec (avl_height_of g y) d). lia. }
 destruct Hnum as [Hph [Hyh [Hxh [Hdu [Hbu [Hcu [Hub Huc]]]]]]].
 destruct (avl_rl_topology__double_rotation_restoration g a x y p Hv Hr Hx Hxy Hyp Hrot)
 as [Hdom [Hayl [Hayr [Haxl [Haxr [Hapl [Hapr [Houtside Hnon]]]]]]]].
 assert (Hch : forall q, avl_child_height g q <= u -> avl_child_height a q = avl_child_height g q).
 { intros [z|] Hq; simpl in *; [|reflexivity]. apply Hnon; intro E; subst z; lia. }
 assert (Huy : avl_child_height a (avl_right g y) = u) by (apply Hch; unfold u; lia).
 assert (Hbb : avl_child_height a (avl_right g p) = b) by (apply Hch; exact Hbu).
 assert (Hcc : avl_child_height a (avl_left g p) = c) by (apply Hch; exact Hcu).
 assert (Hdd : avl_child_height a (avl_left g x) = d) by (apply Hch; lia).
 pose proof (proj2 (proj1 (proj2 Hva) y (proj2 (Hdom y) Hy))) as Hya.
 pose proof (proj2 (proj1 (proj2 Hva) x (proj2 (Hdom x) Hx))) as Hxa.
 pose proof (proj2 (proj1 (proj2 Hva) p (proj2 (Hdom p) Hp))) as Hpa.
 rewrite Hayl,Hayr,Huy,Hbb in Hya. rewrite Haxl,Haxr,Hcc,Hdd in Hxa.
 rewrite Hapl,Hapr in Hpa. simpl avl_child_height in Hpa.
 assert (Hheights : avl_height_of a y = u+1 /\ avl_height_of a x = u+1 /\ avl_height_of a p = u+2).
 { rewrite Z.max_r in Hya by lia. rewrite Z.max_l in Hxa by lia.
   rewrite Hya,Hxa,Hdu,Z.max_id in Hpa. lia. }
 destruct Hheights as [HyaH [HxaH HpaH]].
 assert (Hother : forall z, avl_vvalid g z -> z<>x -> z<>y -> z<>p -> avl_model_balance_factor a z = avl_model_balance_factor g z).
 { intros z Hz Hzx Hzy Hzp. destruct (Houtside z Hz Hzx Hzy Hzp) as [Hzl Hzr].
   assert (Hchild : forall q, (avl_right g z = q \/ avl_left g z = q) -> avl_child_height a q = avl_child_height g q).
   { intros [v|] Hq; simpl; [|reflexivity]. apply Hnon.
     - intro E; subst v. pose proof (GraphLib.examples.bst.root_no_parents _ Ht z x Hr); tauto.
     - intro E; subst v. apply Hzx. eapply (GraphLib.examples.bst.father_unique _ Ht y z x Hz Hx); tauto.
     - intro E; subst v. apply Hzy. eapply (GraphLib.examples.bst.father_unique _ Ht p z y Hz Hy); tauto. }
   unfold avl_model_balance_factor. rewrite Hzl,Hzr, !Hchild by auto. reflexivity. }
 split.
 - intros z Hz. apply Z.abs_le. destruct (Z.eq_dec z x) as [->|Hzx].
   + unfold avl_model_balance_factor. rewrite Haxl,Haxr,Hcc,Hdd. lia.
   + destruct (Z.eq_dec z y) as [->|Hzy].
     * unfold avl_model_balance_factor. rewrite Hayl,Hayr,Huy,Hbb. lia.
     * destruct (Z.eq_dec z p) as [->|Hzp].
       -- unfold avl_model_balance_factor. rewrite Hapl,Hapr. simpl. rewrite HyaH,HxaH. lia.
       -- rewrite Hother by (try assumption; apply (proj1 (Hdom z)); assumption).
          apply Z.abs_le. apply Hbal; [apply (proj1 (Hdom z)); assumption|assumption].
 - split.
   + intros z Hz. pose proof (Hsafe x Hx) as Hsx.
     destruct (Z.eq_dec z x) as [->|Hzx]; [lia|].
     destruct (Z.eq_dec z y) as [->|Hzy]; [lia|].
     destruct (Z.eq_dec z p) as [->|Hzp]; [lia|].
     rewrite Hnon by assumption. apply Hsafe. apply (proj1 (Hdom z)); assumption.
   + lia.
Qed.
Lemma avl_balance_lr_result__double_rotation_restoration :
 forall g a x r f, avl_balance_graph_input g x ->
 avl_model_balance_factor g x > 1 ->
 avl_balance_factor_or_null g (avl_ptr_of (avl_left g x)) f -> f < 0 ->
 avl_lr_rotation_input g x -> avl_lr_rotation_result g a x r ->
 avl_balance_graph_result g a r.
Proof.
 intros g a x r f Hg Hfx Hf Hneg Hin Hres.
 destruct Hin as [Hv [Hr [Hx [Hnx [Hy0 [Hp0 Hsafe]]]]]].
 destruct (avl_left g x) as [y|] eqn:Hxy; [|contradiction]. simpl avl_ptr_of in *.
 destruct (avl_right g y) as [p|] eqn:Hyp; [|contradiction]. simpl avl_ptr_of in *.
 destruct Hres as [Er [Hnr [Har [Hrot [Hva [Hnodes Hkeys]]]]]].
 rewrite Hxy in Er,Hrot. simpl avl_ptr_of in Er,Hrot. rewrite Hyp in Er. simpl avl_ptr_of in Er. subst r.
 destruct Hf as [[Hnull Hz]|[Hny [Hy [Ef Hfb]]]]; [lia|].
 assert (Hfy : avl_model_balance_factor g y < 0) by lia.
 destruct (avl_lr_restore__double_rotation_restoration g a x y p Hg Hva Hr Hx Hnx Hxy Hyp Hfx Hfy Hrot) as [Hbal [Hs Hheight]].
 unfold avl_balance_graph_result.
 destruct Hva as [Hab [Hah Han]].
 split; [unfold avl_gvalid; tauto|]. split; [exact Hnodes|]. split; [exact Hkeys|]. split.
 - rewrite Har. reflexivity.
 - split; [exact Hs|]. rewrite Har,Hr. exact Hheight.
Qed.
Lemma avl_balance_rl_result__double_rotation_restoration :
 forall g a x r f, avl_balance_graph_input g x ->
 avl_model_balance_factor g x < -1 ->
 avl_balance_factor_or_null g (avl_ptr_of (avl_right g x)) f -> f > 0 ->
 avl_rl_rotation_input g x -> avl_rl_rotation_result g a x r ->
 avl_balance_graph_result g a r.
Proof.
 intros g a x r f Hg Hfx Hf Hneg Hin Hres.
 destruct Hin as [Hv [Hr [Hx [Hnx [Hy0 [Hp0 Hsafe]]]]]].
 destruct (avl_right g x) as [y|] eqn:Hxy; [|contradiction]. simpl avl_ptr_of in *.
 destruct (avl_left g y) as [p|] eqn:Hyp; [|contradiction]. simpl avl_ptr_of in *.
 destruct Hres as [Er [Hnr [Har [Hrot [Hva [Hnodes Hkeys]]]]]].
 rewrite Hxy in Er,Hrot. simpl avl_ptr_of in Er,Hrot. rewrite Hyp in Er. simpl avl_ptr_of in Er. subst r.
 destruct Hf as [[Hnull Hz]|[Hny [Hy [Ef Hfb]]]]; [lia|].
 assert (Hfy : avl_model_balance_factor g y > 0) by lia.
 destruct (avl_rl_restore__double_rotation_restoration g a x y p Hg Hva Hr Hx Hnx Hxy Hyp Hfx Hfy Hrot) as [Hbal [Hs Hheight]].
 unfold avl_balance_graph_result.
 destruct Hva as [Hab [Hah Han]].
 split; [unfold avl_gvalid; tauto|]. split; [exact Hnodes|]. split; [exact Hkeys|]. split.
 - rewrite Har. reflexivity.
 - split; [exact Hs|]. rewrite Har,Hr. exact Hheight.
Qed.
