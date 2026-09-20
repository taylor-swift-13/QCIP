Require Import Coq.ZArith.ZArith.
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

Definition avl_gvalid (g : avl_model) : Prop :=
  avl_bst_valid g /\
  avl_height_consistent g /\
  avl_balanced g.

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

Definition avl_rep (g : avl_model) : Assertion :=
  “ avl_gvalid g ” && avl_tree_store g.

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
