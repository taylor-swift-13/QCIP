Require Export QCIPLib.crtos.crtos_avl_crtos_common.crtos_avl_search_lib.
Require Import Coq.ZArith.ZArith Coq.Lists.List Coq.Logic.ClassicalDescription.
Require Import Coq.Sorting.Permutation.
Require Import GraphLib.graph_basic GraphLib.directed.binarytree.
Require GraphLib.examples.bst.
From SimpleC.SL Require Import Mem SeparationLogic.
Require Import Logic.LogicGenerator.demo932.Interface.
Import ListNotations naive_C_Rules.
Local Open Scope Z_scope.
Local Open Scope sac.

(** Case-local whole-graph updates. No write below changes an external parent
    edge implicitly. [avl_tree_store] remains the shared raw field store. *)
Definition crtos_fields (g : avl_model) (root : option addr)
    (left right : addr -> option addr) : avl_model :=
  {| avl_bst := {| GraphLib.examples.bst.bst_tree :=
       {| GraphLib.examples.bst.vset := avl_vvalid g;
          GraphLib.examples.bst.theroot := root;
          GraphLib.examples.bst.left_child := left;
          GraphLib.examples.bst.right_child := right;
          GraphLib.examples.bst.listV := avl_nodes g |};
       GraphLib.examples.bst.bst_key := avl_key_of g |};
     avl_height_of := avl_height_of g |}.

Definition crtos_set_left (g : avl_model) (p : addr) (c : option addr) :=
  crtos_fields g (avl_root g)
    (fun x => if Z.eq_dec x p then c else avl_left g x) (avl_right g).
Definition crtos_set_right (g : avl_model) (p : addr) (c : option addr) :=
  crtos_fields g (avl_root g) (avl_left g)
    (fun x => if Z.eq_dec x p then c else avl_right g x).
Definition crtos_set_root (g : avl_model) (r : option addr) :=
  crtos_fields g r (avl_left g) (avl_right g).
Definition crtos_height_value (g : avl_model) (p : addr) : Z :=
  Z.max (avl_child_height g (avl_left g p))
        (avl_child_height g (avl_right g p)) + 1.
Definition crtos_update_height (g : avl_model) (p : addr) :=
  avl_with_root_cache g p (crtos_height_value g p).
(** Raw storage enumerates every valid node. This is not a tree/forest or
    height-correctness assumption; it only links graph addresses to ownership. *)
Definition crtos_raw_domain (g : avl_model) : Prop :=
  forall x, avl_vvalid g x <-> In x (avl_nodes g).
Definition crtos_update_ready (g : avl_model) (p : addr) : Prop :=
  crtos_raw_domain g /\ avl_vvalid g p /\ p <> 0 /\
  (forall c, avl_left g p = Some c \/ avl_right g p = Some c ->
     avl_vvalid g c /\ c <> 0 /\ 0 <= avl_height_of g c <= UINT_MAX) /\
  1 <= crtos_height_value g p <= UINT_MAX.

Definition crtos_reroot_rotation (g : avl_model) (p q : addr) :=
  crtos_set_root g
    (if excluded_middle_informative (avl_root g = Some p)
     then Some q else avl_root g).
Definition crtos_rotate_left (g : avl_model) (p : addr) : avl_model :=
  let q := avl_ptr_of (avl_right g p) in
  let wired := crtos_set_left (crtos_set_right g p (avl_left g q)) q (Some p) in
  crtos_reroot_rotation
    (crtos_update_height (crtos_update_height wired p) q) p q.
Definition crtos_rotate_right (g : avl_model) (p : addr) : avl_model :=
  let q := avl_ptr_of (avl_left g p) in
  let wired := crtos_set_right (crtos_set_left g p (avl_right g q)) q (Some p) in
  crtos_reroot_rotation
    (crtos_update_height (crtos_update_height wired p) q) p q.
Definition crtos_rotate_lr (g : avl_model) (p : addr) : avl_model :=
  let l := avl_ptr_of (avl_left g p) in
  let q := avl_ptr_of (avl_right g l) in
  crtos_rotate_right (crtos_set_left (crtos_rotate_left g l) p (Some q)) p.
Definition crtos_rotate_rl (g : avl_model) (p : addr) : avl_model :=
  let r := avl_ptr_of (avl_right g p) in
  let q := avl_ptr_of (avl_left g r) in
  crtos_rotate_left (crtos_set_right (crtos_rotate_right g r) p (Some q)) p.

Definition crtos_balance_ptr (g : avl_model) (p : addr) : addr :=
  if Z_lt_dec 1 (avl_model_balance_factor g p) then
    let l := avl_ptr_of (avl_left g p) in
    if Z_le_dec 0 (avl_model_balance_factor g l) then l
    else avl_ptr_of (avl_right g l)
  else if Z_lt_dec (avl_model_balance_factor g p) (-1) then
    let r := avl_ptr_of (avl_right g p) in
    if Z_le_dec (avl_model_balance_factor g r) 0 then r
    else avl_ptr_of (avl_left g r)
  else p.
Definition crtos_balance_model (g : avl_model) (p : addr) : avl_model :=
  if Z_lt_dec 1 (avl_model_balance_factor g p) then
    let l := avl_ptr_of (avl_left g p) in
    if Z_le_dec 0 (avl_model_balance_factor g l)
    then crtos_rotate_right g p else crtos_rotate_lr g p
  else if Z_lt_dec (avl_model_balance_factor g p) (-1) then
    let r := avl_ptr_of (avl_right g p) in
    if Z_le_dec (avl_model_balance_factor g r) 0
    then crtos_rotate_left g p else crtos_rotate_rl g p
  else g.

(** This precondition concerns only the selected subtree. In particular it
    permits stale ancestor caches, arbitrary external parent edges, and a
    selected node which is not the root of the whole owned graph. *)
Definition crtos_balance_ready (g : avl_model) (p : addr) : Prop :=
  avl_vvalid g p /\ p <> 0 /\
  avl_tree_valid (avl_subtree_model g p) /\
  (forall x, avl_vvalid (avl_subtree_model g p) x -> x <> p ->
     Z.abs (avl_model_balance_factor g x) <= 1) /\
  Z.abs (avl_model_balance_factor g p) <= 2.
Definition crtos_balance_effect
    (before after : avl_model) (p ret : addr) : Prop :=
  after = crtos_balance_model before p /\
  ret = crtos_balance_ptr before p /\ ret <> 0 /\
  avl_nodes after = avl_nodes before /\
  (forall x, avl_vvalid after x <-> avl_vvalid before x) /\
  (forall x, avl_key_of after x = avl_key_of before x) /\
  avl_gvalid (avl_subtree_model after ret) /\
  (forall x, avl_vvalid (avl_subtree_model after ret) x <->
             avl_vvalid (avl_subtree_model before p) x) /\
  avl_height_of before p - 1 <= avl_height_of after ret <= avl_height_of before p /\
  (Z.abs (avl_model_balance_factor before p) <= 1 ->
     after = before /\ ret = p).

(** Models are compared by represented fields, not arbitrary values of their
    key/height functions outside the allocated vertex set or enumeration order.
    Pointer functions agree everywhere: GraphLib validity requires invalid
    vertices to have no children and quantifies root_no_parents globally. *)
Definition crtos_graph_equiv (a b : avl_model) : Prop :=
  avl_root a = avl_root b /\
  Permutation (avl_nodes a) (avl_nodes b) /\
  (forall x, avl_vvalid a x <-> avl_vvalid b x) /\
  (forall x, avl_left a x = avl_left b x /\ avl_right a x = avl_right b x) /\
  (forall x, avl_vvalid a x ->
     avl_key_of a x = avl_key_of b x /\
     avl_height_of a x = avl_height_of b x).

Definition crtos_join_cached (before : avl_model) (p : addr)
    (l r : avl_model) :=
  avl_with_root_cache (avl_join_model p (avl_key_of before p) l r)
    p (avl_height_of before p).
Definition crtos_singleton (p : addr) (key : Z) :=
  avl_join_model p key avl_empty_model avl_empty_model.
Definition crtos_finish (raw : avl_model) (p : addr) :=
  crtos_balance_model (crtos_update_height raw p) p.
Definition crtos_finish_ptr (raw : avl_model) (p : addr) :=
  crtos_balance_ptr (crtos_update_height raw p) p.

(** Exact whole-graph transformation relation, explicitly authorized for this
    case. A failing recursive call is joined before NULL propagates. The
    enumeration retains detached vertices; failure never frees an object. *)
Inductive crtos_insert_exact : avl_model -> Z -> avl_model -> addr -> Prop :=
| crtos_exact_empty_fail : forall g key after,
    avl_root g = None -> crtos_graph_equiv after g ->
    crtos_insert_exact g key after 0
| crtos_exact_empty_ok : forall g key n after,
    avl_root g = None -> n <> 0 -> ~ avl_vvalid g n ->
    crtos_graph_equiv after (crtos_finish (crtos_singleton n key) n) ->
    crtos_insert_exact g key after (crtos_finish_ptr (crtos_singleton n key) n)
| crtos_exact_duplicate : forall g key p after,
    avl_root g = Some p -> avl_key_of g p = key ->
    crtos_graph_equiv after g -> crtos_insert_exact g key after p
| crtos_exact_right : forall g key p child ret after,
    avl_root g = Some p -> avl_key_of g p < key ->
    crtos_insert_exact (avl_child_model g (avl_right g p)) key child ret ->
    let raw := crtos_join_cached g p (avl_child_model g (avl_left g p)) child in
    crtos_graph_equiv after
      (if Z.eq_dec ret 0 then crtos_set_root raw None else crtos_finish raw p) ->
    crtos_insert_exact g key after
      (if Z.eq_dec ret 0 then 0 else crtos_finish_ptr raw p)
| crtos_exact_left : forall g key p child ret after,
    avl_root g = Some p -> key < avl_key_of g p ->
    crtos_insert_exact (avl_child_model g (avl_left g p)) key child ret ->
    let raw := crtos_join_cached g p child (avl_child_model g (avl_right g p)) in
    crtos_graph_equiv after
      (if Z.eq_dec ret 0 then crtos_set_root raw None else crtos_finish raw p) ->
    crtos_insert_exact g key after
      (if Z.eq_dec ret 0 then 0 else crtos_finish_ptr raw p).

Definition crtos_key_present (g : avl_model) (key : Z) : Prop :=
  exists p, avl_vvalid g p /\ avl_key_of g p = key.
Definition crtos_new_node_effect (before after : avl_model) (key n : Z) : Prop :=
  n <> 0 /\ ~ avl_vvalid before n /\
  (forall x, avl_vvalid after x <-> x = n \/ avl_vvalid before x) /\
  avl_key_of after n = key /\
  (forall x, avl_vvalid before x -> avl_key_of after x = avl_key_of before x).
Definition crtos_success_effect (before after : avl_model) (key ret : Z) : Prop :=
  avl_gvalid after /\ ret <> 0 /\ ret = avl_ptr_of (avl_root after) /\
  (exists n, crtos_new_node_effect before after key n) /\
  avl_child_height before (avl_root before) <= avl_child_height after (avl_root after) <=
    avl_child_height before (avl_root before) + 1.

(** The search path is fixed by the original graph and comparisons. The
    failure equation clears exactly its selected edges, including an already
    null leaf edge, and preserves every other pointer, key and cached height. *)
Inductive crtos_search_path (g : avl_model) (key : Z) : addr -> Prop :=
| crtos_search_root : forall p, avl_root g = Some p -> crtos_search_path g key p
| crtos_search_left : forall p c, crtos_search_path g key p ->
    key < avl_key_of g p -> avl_left g p = Some c -> crtos_search_path g key c
| crtos_search_right : forall p c, crtos_search_path g key p ->
    avl_key_of g p < key -> avl_right g p = Some c -> crtos_search_path g key c.
Definition crtos_failure_model (g : avl_model) (key : Z) :=
  crtos_fields g None
    (fun p => if excluded_middle_informative
       (crtos_search_path g key p /\ key < avl_key_of g p)
     then None else avl_left g p)
    (fun p => if excluded_middle_informative
       (crtos_search_path g key p /\ avl_key_of g p < key)
     then None else avl_right g p).
Definition crtos_insert_outcome (before after : avl_model) (key ret : Z) : Prop :=
  crtos_insert_exact before key after ret /\
  ((crtos_key_present before key /\
      ret = avl_ptr_of (avl_root before) /\ crtos_graph_equiv after before) \/
   (~ crtos_key_present before key /\
      ((ret = 0 /\ crtos_graph_equiv after (crtos_failure_model before key)) \/
       crtos_success_effect before after key ret))).

Definition crtos_mapping_put (m : avl_mapping) (key n : Z) : avl_mapping :=
  fun k => if Z.eq_dec k key then Some n else m k.
Definition crtos_mapping_fresh (m : avl_mapping) (n : addr) : Prop :=
  n <> 0 /\ forall k, m k <> Some n.
Definition crtos_public_failure (m : avl_mapping) (root key : Z) : Assertion :=
  EX g, “ avl_gvalid g /\ root = avl_ptr_of (avl_root g) /\
            avl_mapping_refines_graph m g ” &&
        avl_tree_store (crtos_failure_model g key).

(** The common exit invariant is an exact prefix plus independently checkable
    local readiness. It does not assume the desired top-level result of
    Balance. Its constructors retain the child result needed for composition. *)
Definition crtos_insert_prefix (before raw : avl_model) (key p : Z) : Prop :=
  (exists n, avl_root before = None /\ n <> 0 /\ ~ avl_vvalid before n /\
     p = n /\ crtos_graph_equiv raw (crtos_singleton n key)) \/
  (exists child ret,
     avl_root before = Some p /\ avl_key_of before p < key /\ ret <> 0 /\
     crtos_insert_outcome (avl_child_model before (avl_right before p)) child key ret /\
     crtos_graph_equiv raw
       (crtos_join_cached before p (avl_child_model before (avl_left before p)) child)) \/
  (exists child ret,
     avl_root before = Some p /\ key < avl_key_of before p /\ ret <> 0 /\
     crtos_insert_outcome (avl_child_model before (avl_left before p)) child key ret /\
     crtos_graph_equiv raw
       (crtos_join_cached before p child (avl_child_model before (avl_right before p)))).

(** Deferred implementation obligations: x_malloc supplies fresh undefined
    storage or NULL. Height update must implement the exact height-only map.
    Balance and its accessors/rotations must implement the above exact graph
    transform and prove the local restoration and height-effect clauses.
    No callee implementation is verified by this caller-only case. *)

Require Import Coq.micromega.Lia.
Require Import Coq.Strings.String.
Require Import Coq.Classes.RelationClasses.
Require Import Coq.Arith.Wf_nat.
Require Import Coq.Logic.FunctionalExtensionality.
Lemma crtos_equiv_refl__crtos_insert_composition : forall g, crtos_graph_equiv g g.
Proof. intros; repeat split; auto. Qed.
Lemma crtos_equiv_sym__crtos_insert_composition : forall a b,
  crtos_graph_equiv a b -> crtos_graph_equiv b a.
Proof.
  intros a b [R [P [V [C K]]]]. repeat split.
  - symmetry; exact R.
  - symmetry; exact P.
  - apply V.
  - apply V.
  - symmetry; apply C.
  - symmetry; apply C.
  - intros. symmetry. apply K. apply V; assumption.
  - intros. symmetry. apply K. apply V; assumption.
Qed.
Lemma crtos_equiv_trans__crtos_insert_composition : forall a b c,
  crtos_graph_equiv a b -> crtos_graph_equiv b c -> crtos_graph_equiv a c.
Proof.
  intros a b c [R [P [V [C K]]]] [R' [P' [V' [C' K']]]].
  repeat split.
  - congruence.
  - eapply Permutation_trans; eauto.
  - intros. apply V'; apply V; assumption.
  - intros. apply V; apply V'; assumption.
  - intros. rewrite (proj1 (C x)); apply C'.
  - intros. rewrite (proj2 (C x)); apply C'.
  - intros. rewrite (proj1 (K x H)); apply K'; apply V; assumption.
  - intros. rewrite (proj2 (K x H)); apply K'; apply V; assumption.
Qed.
Lemma crtos_equiv_store__crtos_insert_composition : forall a b,
  crtos_graph_equiv a b -> avl_tree_store a |-- avl_tree_store b.
Proof.
  intros a b [R [P [V [C K]]]]. unfold avl_tree_store.
  rewrite <- (avl_graph_nodes_store_permutation__graph_store_decomposition b (avl_nodes a) (avl_nodes b) P).
  apply avl_nodes_store_map__lr_graph_composition. intros x Hin.
  unfold avl_graph_node_store. Intros_p Hx. Intros_p N. Intros_p Bk. Intros_p Bh.
  destruct (C x) as [L Q]. destruct (K x Hx) as [E F].
  rewrite L,Q,E,F. entailer!. apply V; exact Hx.
Qed.
Lemma crtos_child_gvalid__crtos_insert_composition : forall g p c,
  avl_gvalid g -> avl_vvalid g p ->
  (avl_left g p = c \/ avl_right g p = c) ->
  avl_gvalid (avl_child_model g c).
Proof.
  intros g p c G P C. apply avl_gvalid_tree_valid_iff. split.
  - apply avl_child_projection_valid__insert_projection_graft.
    + apply avl_gvalid_tree_valid; exact G.
    + intros x E. eapply avl_graph_child_valid__root_and_factor_setup; eauto.
      * exact (proj1 G).
      * destruct C; subst c; auto.
  - apply avl_child_projection_balanced__insert_projection_graft. exact (proj1 (proj2 (proj2 G))).
Qed.
Lemma crtos_empty_no_vertex__crtos_insert_composition : forall g,
  avl_gvalid g -> avl_root g = None -> forall x, ~ avl_vvalid g x.
Proof.
  intros g G E x V.
  pose proof (GraphLib.examples.bst.path_exists _
    (GraphLib.examples.bst.bst_binary_tree _ (proj1 G)) x V) as [r [R _]].
  change (avl_root g = Some r) in R. congruence.
Qed.
Lemma crtos_empty_outcome__crtos_insert_composition : forall g key,
  avl_gvalid g -> avl_root g = None -> crtos_insert_outcome g g key 0.
Proof.
  intros g key G E.
  assert (N : forall x, ~ avl_vvalid g x) by (eapply crtos_empty_no_vertex__crtos_insert_composition; eauto).
  assert (S : forall x, ~ crtos_search_path g key x).
  { intros x H. induction H; auto; congruence. }
  split.
  - constructor; auto. apply crtos_equiv_refl__crtos_insert_composition.
  - right. split.
    + intros [x [V _]]. exact (N x V).
    + left. split; [reflexivity|].
      unfold crtos_graph_equiv.
      split; [exact E|]. split; [apply Permutation_refl|].
      split; [intro x; reflexivity|]. split.
      * intro x. split.
        -- change (avl_left g x = if excluded_middle_informative (crtos_search_path g key x /\ key < avl_key_of g x) then None else avl_left g x).
           destruct (excluded_middle_informative (crtos_search_path g key x /\ key < avl_key_of g x)) as [[P _]|P]; [exfalso; exact (S x P)|reflexivity].
        -- change (avl_right g x = if excluded_middle_informative (crtos_search_path g key x /\ avl_key_of g x < key) then None else avl_right g x).
           destruct (excluded_middle_informative (crtos_search_path g key x /\ avl_key_of g x < key)) as [[P _]|P]; [exfalso; exact (S x P)|reflexivity].
      * intros x V. exfalso; exact (N x V).
Qed.
Lemma crtos_duplicate_outcome__crtos_insert_composition : forall g p key,
  avl_gvalid g -> p = avl_ptr_of (avl_root g) -> p <> 0 ->
  avl_key_of g p = key -> crtos_insert_outcome g g key p.
Proof.
  intros g p key G R N K.
  pose proof (avl_public_root_valid__insert_projection_graft g p (avl_gvalid_tree_valid g G) R N) as [E V].
  split.
  - exact (crtos_exact_duplicate g key p g E K (crtos_equiv_refl__crtos_insert_composition g)).
  - left. split; [exists p; auto|]. split; auto. apply crtos_equiv_refl__crtos_insert_composition.
Qed.
Lemma crtos_root_split__crtos_insert_composition : forall g p,
  avl_gvalid g -> p = avl_ptr_of (avl_root g) -> p<>0 ->
  avl_tree_store g |--
  avl_graph_node_store g p **
  avl_tree_store (avl_child_model g (avl_left g p)) **
  avl_tree_store (avl_child_model g (avl_right g p)).
Proof.
  intros g p G R N.
  pose proof (avl_gvalid_tree_valid g G) as T.
  pose proof (avl_public_root_valid__insert_projection_graft g p T R N) as [E V].
  sep_apply_l_atomic (avl_root_tree_store_to_subtree_store g p T R).
  sep_apply_l_atomic (avl_subtree_store_decompose__graph_store_decomposition g p G N V).
  sep_apply_l_atomic (avl_child_store_forward__insert_projection_graft g (avl_left g p) T).
  sep_apply_l_atomic (avl_child_store_forward__insert_projection_graft g (avl_right g p) T).
  entailer!.
Qed.
Lemma crtos_map_absent__crtos_insert_composition : forall m g key,
  avl_mapping_refines_graph m g ->
  (~ crtos_key_present g key <-> m key = None).
Proof.
  intros m g key M. split.
  - intros N. destruct (m key) as [x|] eqn:E; auto.
    exfalso. apply N. exists x. apply M; exact E.
  - intros E [x [V K]]. pose proof (proj2 (M key x) (conj V K)). congruence.
Qed.
Lemma crtos_map_new__crtos_insert_composition : forall m before after key n,
  avl_mapping_refines_graph m before ->
  ~ crtos_key_present before key ->
  crtos_new_node_effect before after key n ->
  crtos_mapping_fresh m n /\
  avl_mapping_refines_graph (crtos_mapping_put m key n) after.
Proof.
  intros m before after key n M Ab [N [Fresh [V [K Old]]]].
  split.
  - split; [exact N|]. intros k E. apply Fresh. apply (proj1 (M k n)); exact E.
  - intros k x. unfold crtos_mapping_put.
    destruct (Z.eq_dec k key) as [E|E].
    + subst k. split.
      * intros H. inversion H; subst x. split; [apply V; auto|exact K].
      * intros [Hx Hk]. apply V in Hx. destruct Hx as [Hx|Hx].
        -- subst x. reflexivity.
        -- exfalso. apply Ab. exists x. split; [exact Hx|]. rewrite <- (Old x Hx); exact Hk.
    + split.
      * intros H. apply M in H. destruct H as [Hx Hk]. split; [apply V; auto|].
        rewrite Old; auto.
      * intros [Hx Hk]. apply V in Hx. destruct Hx as [Hx|Hx].
        -- subst x. congruence.
        -- apply M. split; [exact Hx|]. rewrite <- (Old x Hx); exact Hk.
Qed.
Lemma crtos_valid_domain__crtos_insert_composition : forall g,
  avl_tree_valid g -> crtos_raw_domain g.
Proof.
  intros g T x. split.
  - apply (GraphLib.examples.bst.finite_vertices _ (GraphLib.examples.bst.bst_binary_tree _ (proj1 T))).
  - apply (GraphLib.examples.bst.listV_sound _ (GraphLib.examples.bst.bst_binary_tree _ (proj1 T))).
Qed.
Lemma crtos_valid_update_identity__crtos_insert_composition : forall g p,
  avl_tree_valid g -> avl_vvalid g p -> crtos_update_height g p = g.
Proof.
  intros g p T V. unfold crtos_update_height, crtos_height_value.
  rewrite <- (proj2 (proj1 (proj2 T) p V)). apply avl_cache_self__lr_graph_composition.
Qed.
Lemma crtos_valid_update_ready__crtos_insert_composition : forall g p,
  avl_tree_valid g -> avl_vvalid g p -> p<>0 -> crtos_update_ready g p.
Proof.
  intros g p T V N. unfold crtos_update_ready.
  split; [apply crtos_valid_domain__crtos_insert_composition; exact T|].
  split; [exact V|]. split; [exact N|]. split.
  - intros c E.
    pose proof (avl_graph_child_valid__root_and_factor_setup g p c (proj1 T) V E) as C.
    pose proof (proj1 (proj1 (proj2 T) c C)) as B.
    split; [exact C|]. split; [exact (proj2 (proj2 T) c C)|lia].
  - unfold crtos_height_value. rewrite <- (proj2 (proj1 (proj2 T) p V)).
    exact (proj1 (proj1 (proj2 T) p V)).
Qed.
Lemma crtos_valid_balance_ready__crtos_insert_composition : forall g p,
  avl_gvalid g -> avl_vvalid g p -> p<>0 -> crtos_balance_ready g p.
Proof.
  intros g p G V N. unfold crtos_balance_ready.
  split; [exact V|]. split; [exact N|]. split.
  - apply avl_subtree_projection_valid__lr_graph_composition; [exact (avl_gvalid_tree_valid g G)|exact V].
  - split.
    + intros x [X _] _. exact (proj1 (proj2 (proj2 G)) x X).
    + pose proof (proj1 (proj2 (proj2 G)) p V). lia.
Qed.
Lemma crtos_singleton_valid__crtos_insert_composition : forall p key,
  p<>0 -> avl_gvalid (crtos_singleton p key).
Proof.
  intros p key N. unfold crtos_singleton.
  pose proof (proj1 avl_empty_valid__insert_projection_graft) as V.
  pose proof (proj2 avl_empty_valid__insert_projection_graft) as B.
  pose proof (avl_join_ready__insert_projection_graft p key avl_empty_model avl_empty_model
    N V V B B ltac:(intro H; exact H) ltac:(intro H; exact H)
    ltac:(intros x H; contradiction) ltac:(intros x H; contradiction) ltac:(intros x H; contradiction)
    ltac:(change (1<=2147483647); lia) ltac:(change (0<=2); lia))
    as [T [_ [_ Balance]]].
  apply avl_gvalid_tree_valid_iff. split; [exact T|]. apply Balance. change (0<=1); lia.
Qed.
Lemma crtos_empty_store__crtos_insert_composition : forall g,
  avl_gvalid g -> avl_root g = None -> avl_tree_store g = emp.
Proof.
  intros g G E. unfold avl_tree_store. rewrite (avl_empty_root_nodes__mapping_refinement g G E).
  reflexivity.
Qed.
Lemma crtos_child_fields__crtos_insert_composition : forall g c x,
  avl_vvalid (avl_child_model g c) x ->
  avl_vvalid g x /\ avl_key_of (avl_child_model g c) x = avl_key_of g x /\
  avl_height_of (avl_child_model g c) x = avl_height_of g x /\
  avl_left (avl_child_model g c) x = avl_left g x /\
  avl_right (avl_child_model g c) x = avl_right g x.
Proof.
  intros g [c|] x V; [|contradiction].
  destruct V as [V P]. pose proof (avl_projection_children__lr_graph_composition g c x P) as [L R].
  repeat split; auto.
Qed.
Lemma crtos_root_partition__crtos_insert_composition : forall g p,
  avl_gvalid g -> p=avl_ptr_of (avl_root g) -> p<>0 ->
  let l:=avl_child_model g (avl_left g p) in
  let r:=avl_child_model g (avl_right g p) in
  avl_gvalid l /\ avl_gvalid r /\
  ~avl_vvalid l p /\ ~avl_vvalid r p /\
  (forall x, avl_vvalid l x -> ~avl_vvalid r x) /\
  (forall x, avl_vvalid g x <-> x=p \/ avl_vvalid l x \/ avl_vvalid r x) /\
  Permutation (avl_nodes g) (p::avl_nodes l++avl_nodes r).
Proof.
  intros g p G R N l r.
  pose proof (avl_gvalid_tree_valid g G) as T.
  pose proof (avl_public_root_valid__insert_projection_graft g p T R N) as [Root V].
  assert (L:avl_gvalid l) by (apply (crtos_child_gvalid__crtos_insert_composition g p _ G V); auto).
  assert (Q:avl_gvalid r) by (apply (crtos_child_gvalid__crtos_insert_composition g p _ G V); auto).
  pose proof (crtos_valid_domain__crtos_insert_composition l (avl_gvalid_tree_valid l L)) as Dl.
  pose proof (crtos_valid_domain__crtos_insert_composition r (avl_gvalid_tree_valid r Q)) as Dr.
  pose proof (crtos_valid_domain__crtos_insert_composition g T) as D.
  unfold crtos_raw_domain in D,Dl,Dr.
  pose proof (avl_parent_nodes__predecessor_graft g p T R N) as P. fold l r in P.
  pose proof (GraphLib.examples.bst.listV_NoDup _ (GraphLib.examples.bst.bst_binary_tree _ (proj1 G))) as Nd.
  pose proof (Permutation_NoDup P Nd) as Nnew.
  apply NoDup_cons_iff in Nnew as [Nhead Ntail].
  split; [exact L|]. split; [exact Q|].
  split.
  - intros H. apply Nhead. apply in_app_iff. left; apply Dl; exact H.
  - split.
    + intros H. apply Nhead. apply in_app_iff. right; apply Dr; exact H.
    + split.
      * intros x X Y. apply (avl_nodup_append_disjoint__predecessor_graft _ _ Ntail x).
        -- apply Dl; exact X.
        -- apply Dr; exact Y.
      * split; [|exact P]. intro x. rewrite D.
        assert (Pi:In x (avl_nodes g) <-> In x (p::avl_nodes l++avl_nodes r)).
        { split; intro H; eapply Permutation_in; [exact P|exact H|symmetry;exact P|exact H]. }
        rewrite Pi. simpl. rewrite in_app_iff, <- Dl, <- Dr. intuition congruence.
Qed.
Lemma crtos_search_valid__crtos_insert_composition : forall g key x,
  avl_gvalid g -> crtos_search_path g key x -> avl_vvalid g x.
Proof.
  intros g key x G P. induction P.
  - exact (GraphLib.examples.bst.root_valid _ (GraphLib.examples.bst.bst_binary_tree _ (proj1 G)) p H).
  - eapply avl_graph_child_valid__root_and_factor_setup; [exact (proj1 G)|exact IHP|auto].
  - eapply avl_graph_child_valid__root_and_factor_setup; [exact (proj1 G)|exact IHP|auto].
Qed.
Lemma crtos_search_split_left__crtos_insert_composition : forall g p key,
  avl_gvalid g -> avl_root g=Some p -> key < avl_key_of g p ->
  forall x, crtos_search_path g key x <->
    x=p \/ crtos_search_path (avl_child_model g (avl_left g p)) key x.
Proof.
  intros g p key G Root C.
  assert (V:avl_vvalid g p) by (exact (GraphLib.examples.bst.root_valid _ (GraphLib.examples.bst.bst_binary_tree _ (proj1 G)) p Root)).
  set (child:=avl_child_model g (avl_left g p)).
  assert (Gc:avl_gvalid child).
  { unfold child. apply (crtos_child_gvalid__crtos_insert_composition g p _ G V). auto. }
  assert (Rc:avl_root child=avl_left g p) by (apply avl_child_root__insert_projection_graft).
  assert (Forward:forall x, crtos_search_path g key x -> x=p \/ crtos_search_path child key x).
  { intros x P. induction P as [q E|q c P IH K E|q c P IH K E].
    - left; congruence.
    - destruct IH as [Eq|I].
      + subst q. right. apply crtos_search_root. rewrite Rc;exact E.
      + right. pose proof (crtos_search_valid__crtos_insert_composition child key q Gc I) as X.
        pose proof (crtos_child_fields__crtos_insert_composition g (avl_left g p) q X) as [_ [F [_ [L R]]]].
        eapply crtos_search_left; [exact I|unfold child; rewrite F; exact K|unfold child; rewrite L; exact E].
    - destruct IH as [Eq|I].
      + subst q. lia.
      + right. pose proof (crtos_search_valid__crtos_insert_composition child key q Gc I) as X.
        pose proof (crtos_child_fields__crtos_insert_composition g (avl_left g p) q X) as [_ [F [_ [L R]]]].
        eapply crtos_search_right; [exact I|unfold child; rewrite F; exact K|unfold child; rewrite R; exact E].
  }
  assert (Backward:forall x, crtos_search_path child key x -> crtos_search_path g key x).
  { intros x P. induction P as [q E|q c P IH K E|q c P IH K E].
    - eapply crtos_search_left with p; [apply crtos_search_root;exact Root|exact C|]. rewrite <- Rc; exact E.
    - pose proof (crtos_search_valid__crtos_insert_composition child key q Gc P) as X.
      pose proof (crtos_child_fields__crtos_insert_composition g (avl_left g p) q X) as [_ [F [_ [L R]]]].
      eapply crtos_search_left; [exact IH|rewrite <- F;exact K|rewrite <- L;exact E].
    - pose proof (crtos_search_valid__crtos_insert_composition child key q Gc P) as X.
      pose proof (crtos_child_fields__crtos_insert_composition g (avl_left g p) q X) as [_ [F [_ [L R]]]].
      eapply crtos_search_right; [exact IH|rewrite <- F;exact K|rewrite <- R;exact E].
  }
  intro x. split; [apply Forward|]. intros [E|P].
  - subst x; apply crtos_search_root; exact Root.
  - apply Backward; exact P.
Qed.
Lemma crtos_search_split_right__crtos_insert_composition : forall g p key,
  avl_gvalid g -> avl_root g=Some p -> avl_key_of g p < key ->
  forall x, crtos_search_path g key x <->
    x=p \/ crtos_search_path (avl_child_model g (avl_right g p)) key x.
Proof.
  intros g p key G Root C.
  assert (V:avl_vvalid g p) by (exact (GraphLib.examples.bst.root_valid _ (GraphLib.examples.bst.bst_binary_tree _ (proj1 G)) p Root)).
  set (child:=avl_child_model g (avl_right g p)).
  assert (Gc:avl_gvalid child).
  { unfold child. apply (crtos_child_gvalid__crtos_insert_composition g p _ G V). auto. }
  assert (Rc:avl_root child=avl_right g p) by (apply avl_child_root__insert_projection_graft).
  assert (Forward:forall x, crtos_search_path g key x -> x=p \/ crtos_search_path child key x).
  { intros x P. induction P as [q E|q c P IH K E|q c P IH K E].
    - left; congruence.
    - destruct IH as [Eq|I].
      + subst q. lia.
      + right. pose proof (crtos_search_valid__crtos_insert_composition child key q Gc I) as X.
        pose proof (crtos_child_fields__crtos_insert_composition g (avl_right g p) q X) as [_ [F [_ [L R]]]].
        eapply crtos_search_left; [exact I|unfold child; rewrite F; exact K|unfold child; rewrite L; exact E].
    - destruct IH as [Eq|I].
      + subst q. right. apply crtos_search_root. rewrite Rc;exact E.
      + right. pose proof (crtos_search_valid__crtos_insert_composition child key q Gc I) as X.
        pose proof (crtos_child_fields__crtos_insert_composition g (avl_right g p) q X) as [_ [F [_ [L R]]]].
        eapply crtos_search_right; [exact I|unfold child; rewrite F; exact K|unfold child; rewrite R; exact E].
  }
  assert (Backward:forall x, crtos_search_path child key x -> crtos_search_path g key x).
  { intros x P. induction P as [q E|q c P IH K E|q c P IH K E].
    - eapply crtos_search_right with p; [apply crtos_search_root;exact Root|exact C|]. rewrite <- Rc; exact E.
    - pose proof (crtos_search_valid__crtos_insert_composition child key q Gc P) as X.
      pose proof (crtos_child_fields__crtos_insert_composition g (avl_right g p) q X) as [_ [F [_ [L R]]]].
      eapply crtos_search_left; [exact IH|rewrite <- F;exact K|rewrite <- L;exact E].
    - pose proof (crtos_search_valid__crtos_insert_composition child key q Gc P) as X.
      pose proof (crtos_child_fields__crtos_insert_composition g (avl_right g p) q X) as [_ [F [_ [L R]]]].
      eapply crtos_search_right; [exact IH|rewrite <- F;exact K|rewrite <- R;exact E].
  }
  intro x. split; [apply Forward|]. intros [E|P].
  - subst x; apply crtos_search_root; exact Root.
  - apply Backward; exact P.
Qed.
Lemma crtos_raw_cached_store__crtos_insert_composition : forall p key l r cache,
  p<>0 -> crtos_raw_domain l -> crtos_raw_domain r ->
  ~avl_vvalid l p -> ~avl_vvalid r p ->
  (forall x, avl_vvalid l x -> ~avl_vvalid r x) ->
  (eval_addr_expr (RE_addr_of (LE_arrow_field (RE_const p (FET_alias "AvlNode"%string)) "data"%string))) # Int |-> key **
  (eval_addr_expr (RE_addr_of (LE_arrow_field (RE_const p (FET_alias "AvlNode"%string)) "height"%string))) # UInt |-> cache **
  (eval_addr_expr (RE_addr_of (LE_arrow_field (RE_const p (FET_alias "AvlNode"%string)) "left"%string))) # Ptr |-> avl_ptr_of (avl_root l) **
  (eval_addr_expr (RE_addr_of (LE_arrow_field (RE_const p (FET_alias "AvlNode"%string)) "right"%string))) # Ptr |-> avl_ptr_of (avl_root r) **
  avl_tree_store l ** avl_tree_store r |--
  avl_tree_store (avl_with_root_cache (avl_join_model p key l r) p cache).
Proof.
  intros p key l r cache Np Vl Vr Nl Nr Dj. set (g:=avl_join_model p key l r).
  assert (ML : avl_graph_nodes_store l (avl_nodes l) |--
    avl_graph_nodes_store (avl_with_root_cache g p cache) (avl_nodes l)).
  { apply avl_nodes_store_map__lr_graph_composition. intros x Hin.
    pose proof (proj2 (Vl x) Hin) as Hx.
    assert (Nx:x<>p) by (intro E; subst x; contradiction).
    rewrite (avl_cache_node_unchanged__right_rotation_graph g p cache x Nx).
    pose proof (avl_join_left_fields__insert_projection_graft p key l r x Nx Hx) as [L [R [K H]]].
    fold g in L,R,K,H. unfold avl_graph_node_store. rewrite L,R,K,H.
    change (avl_vvalid g x) with (x=p \/ avl_vvalid l x \/ avl_vvalid r x).
    entailer!. }
  assert (MR : avl_graph_nodes_store r (avl_nodes r) |--
    avl_graph_nodes_store (avl_with_root_cache g p cache) (avl_nodes r)).
  { apply avl_nodes_store_map__lr_graph_composition. intros x Hin.
    pose proof (proj2 (Vr x) Hin) as Hx.
    assert (Nx:x<>p) by (intro E; subst x; contradiction).
    assert (Nlx:~avl_vvalid l x) by (intro H; exact (Dj x H Hx)).
    rewrite (avl_cache_node_unchanged__right_rotation_graph g p cache x Nx).
    pose proof (avl_join_right_fields__insert_projection_graft p key l r x Nx Nlx) as [L [R [K H]]].
    fold g in L,R,K,H. unfold avl_graph_node_store. rewrite L,R,K,H.
    change (avl_vvalid g x) with (x=p \/ avl_vvalid l x \/ avl_vvalid r x).
    entailer!. }
  assert (Root :
    (eval_addr_expr (RE_addr_of (LE_arrow_field (RE_const p (FET_alias "AvlNode"%string)) "data"%string))) # Int |-> key **
    (eval_addr_expr (RE_addr_of (LE_arrow_field (RE_const p (FET_alias "AvlNode"%string)) "height"%string))) # UInt |-> cache **
    (eval_addr_expr (RE_addr_of (LE_arrow_field (RE_const p (FET_alias "AvlNode"%string)) "left"%string))) # Ptr |-> avl_ptr_of (avl_root l) **
    (eval_addr_expr (RE_addr_of (LE_arrow_field (RE_const p (FET_alias "AvlNode"%string)) "right"%string))) # Ptr |-> avl_ptr_of (avl_root r) |--
    avl_graph_node_store (avl_with_root_cache g p cache) p).
  { prop_apply_p (store_int_range ((eval_addr_expr (RE_addr_of (LE_arrow_field (RE_const p (FET_alias "AvlNode"%string)) "data"%string)))) key). Intros_p Hkey.
    prop_apply_p (store_uint_range ((eval_addr_expr (RE_addr_of (LE_arrow_field (RE_const p (FET_alias "AvlNode"%string)) "height"%string)))) cache). Intros_p Hcache.
    unfold avl_graph_node_store,avl_with_root_cache,g,avl_join_model,avl_height_update,avl_vvalid,avl_key_of,avl_left,avl_right; simpl.
    destruct (Z.eq_dec p p); [|contradiction]. entailer!. left; reflexivity. }
  unfold avl_tree_store. change (avl_nodes (avl_with_root_cache g p cache)) with (p::avl_nodes l ++ avl_nodes r).
  rewrite avl_graph_nodes_store_cons__graph_store_decomposition.
  sep_apply_l_atomic ML. sep_apply_l_atomic MR.
  sep_apply_l_atomic (avl_graph_nodes_store_app__graph_store_decomposition (avl_with_root_cache g p cache) (avl_nodes l) (avl_nodes r)).
  cancel (avl_graph_nodes_store (avl_with_root_cache g p cache) (avl_nodes l ++ avl_nodes r)).
  sep_apply_l_atomic Root. entailer!.
Qed.
Lemma crtos_set_root_store__crtos_insert_composition : forall g root,
  avl_tree_store (crtos_set_root g root) = avl_tree_store g.
Proof. reflexivity. Qed.
Lemma crtos_failure_domain__crtos_insert_composition : forall g key,
  crtos_raw_domain g -> crtos_raw_domain (crtos_failure_model g key).
Proof. intros g key D; exact D. Qed.
Lemma crtos_exact_transport__crtos_insert_composition : forall g key a ret,
  crtos_insert_exact g key a ret -> forall b,
  crtos_graph_equiv b a -> crtos_insert_exact g key b ret.
Proof.
  intros g key a ret X.
  destruct X as [g key a R E|g key n a R N F E|g key p a R K E|
    g key p child ret a R K X E|g key p child ret a R K X E]; intros b B.
  - apply crtos_exact_empty_fail; auto. eapply crtos_equiv_trans__crtos_insert_composition; eauto.
  - apply crtos_exact_empty_ok; auto. eapply crtos_equiv_trans__crtos_insert_composition; eauto.
  - apply (crtos_exact_duplicate g key p b R K). eapply crtos_equiv_trans__crtos_insert_composition; eauto.
  - apply (crtos_exact_right g key p child ret b R K X).
    eapply crtos_equiv_trans__crtos_insert_composition; eauto.
  - apply (crtos_exact_left g key p child ret b R K X).
    eapply crtos_equiv_trans__crtos_insert_composition; eauto.
Qed.
Lemma crtos_failed_child__crtos_insert_composition : forall g after key,
  avl_gvalid g -> crtos_insert_outcome g after key 0 ->
  ~crtos_key_present g key /\ crtos_graph_equiv after (crtos_failure_model g key).
Proof.
  intros g after key G [X [[Present [R E]]|[Absent [[Z E]|[Ga [N S]]]]]].
  - assert (Root:avl_root g=None).
    { apply (proj1 (avl_root_ptr_null_iff__mapping_refinement g G)). symmetry; exact R. }
    destruct Present as [x [V K]]. exfalso. exact (crtos_empty_no_vertex__crtos_insert_composition g G Root x V).
  - auto.
  - contradiction.
Qed.
Lemma crtos_absent_left__crtos_insert_composition : forall g p key,
  avl_gvalid g -> p=avl_ptr_of (avl_root g) -> p<>0 ->
  key < avl_key_of g p ->
  ~crtos_key_present (avl_child_model g (avl_left g p)) key ->
  ~crtos_key_present g key.
Proof.
  intros g p key G R N C Ab.
  pose proof (crtos_root_partition__crtos_insert_composition g p G R N) as [L [Q [Nl [Nr [Dj [V Part]]]]]].
  intros [x [X K]]. apply V in X. destruct X as [E|[X|X]].
  - subst x; lia.
  - apply Ab. exists x. split; [exact X|].
    rewrite (proj1 (proj2 (crtos_child_fields__crtos_insert_composition _ _ _ X))); exact K.
  - pose proof (avl_gvalid_tree_valid g G) as T.
    pose proof (avl_public_root_valid__insert_projection_graft g p T R N) as [_ P].
    pose proof (crtos_child_fields__crtos_insert_composition _ _ _ X) as [_ [F _]].
    pose proof (avl_key_of_member__insert_projection_graft _ _ (avl_gvalid_tree_valid _ Q) X) as InK.
    pose proof (avl_right_keys_order__insert_projection_graft g p T P _ InK). lia.
Qed.
Lemma crtos_absent_right__crtos_insert_composition : forall g p key,
  avl_gvalid g -> p=avl_ptr_of (avl_root g) -> p<>0 ->
  avl_key_of g p < key ->
  ~crtos_key_present (avl_child_model g (avl_right g p)) key ->
  ~crtos_key_present g key.
Proof.
  intros g p key G R N C Ab.
  pose proof (crtos_root_partition__crtos_insert_composition g p G R N) as [L [Q [Nl [Nr [Dj [V Part]]]]]].
  intros [x [X K]]. apply V in X. destruct X as [E|[X|X]].
  - subst x; lia.
  - pose proof (avl_gvalid_tree_valid g G) as T.
    pose proof (avl_public_root_valid__insert_projection_graft g p T R N) as [_ P].
    pose proof (crtos_child_fields__crtos_insert_composition _ _ _ X) as [_ [F _]].
    pose proof (avl_key_of_member__insert_projection_graft _ _ (avl_gvalid_tree_valid _ L) X) as InK.
    pose proof (avl_left_keys_order__insert_projection_graft g p T P _ InK). lia.
  - apply Ab. exists x. split; [exact X|].
    rewrite (proj1 (proj2 (crtos_child_fields__crtos_insert_composition _ _ _ X))); exact K.
Qed.
Lemma crtos_failure_offpath__crtos_insert_composition : forall g key x,
  ~crtos_search_path g key x ->
  avl_left (crtos_failure_model g key) x = avl_left g x /\
  avl_right (crtos_failure_model g key) x = avl_right g x.
Proof.
  intros g key x N. split.
  - change ((if excluded_middle_informative (crtos_search_path g key x /\ key<avl_key_of g x) then None else avl_left g x)=avl_left g x).
    destruct (excluded_middle_informative (crtos_search_path g key x /\ key<avl_key_of g x)); tauto.
  - change ((if excluded_middle_informative (crtos_search_path g key x /\ avl_key_of g x<key) then None else avl_right g x)=avl_right g x).
    destruct (excluded_middle_informative (crtos_search_path g key x /\ avl_key_of g x<key)); tauto.
Qed.
Lemma crtos_failure_fields__crtos_insert_composition : forall g h key x,
  (crtos_search_path g key x <-> crtos_search_path h key x) ->
  avl_key_of g x=avl_key_of h x ->
  avl_left g x=avl_left h x -> avl_right g x=avl_right h x ->
  avl_left (crtos_failure_model g key) x=avl_left (crtos_failure_model h key) x /\
  avl_right (crtos_failure_model g key) x=avl_right (crtos_failure_model h key) x.
Proof.
  intros g h key x P K L R. split.
  - change ((if excluded_middle_informative (crtos_search_path g key x /\ key<avl_key_of g x) then None else avl_left g x)=
    (if excluded_middle_informative (crtos_search_path h key x /\ key<avl_key_of h x) then None else avl_left h x)).
    rewrite K,L. destruct (excluded_middle_informative (crtos_search_path g key x /\ key<avl_key_of h x));
    destruct (excluded_middle_informative (crtos_search_path h key x /\ key<avl_key_of h x)); tauto.
  - change ((if excluded_middle_informative (crtos_search_path g key x /\ avl_key_of g x<key) then None else avl_right g x)=
    (if excluded_middle_informative (crtos_search_path h key x /\ avl_key_of h x<key) then None else avl_right h x)).
    rewrite K,R. destruct (excluded_middle_informative (crtos_search_path g key x /\ avl_key_of h x<key));
    destruct (excluded_middle_informative (crtos_search_path h key x /\ avl_key_of h x<key)); tauto.
Qed.
Lemma crtos_failure_graft_left__crtos_insert_composition : forall g p key,
  avl_gvalid g -> p=avl_ptr_of (avl_root g) -> p<>0 -> key<avl_key_of g p ->
  crtos_graph_equiv
    (crtos_set_root (crtos_join_cached g p
      (crtos_failure_model (avl_child_model g (avl_left g p)) key)
      (avl_child_model g (avl_right g p))) None)
    (crtos_failure_model g key).
Proof.
  intros g p key G R N C.
  set (l:=avl_child_model g (avl_left g p)).
  set (r:=avl_child_model g (avl_right g p)).
  pose proof (avl_gvalid_tree_valid g G) as T.
  pose proof (avl_public_root_valid__insert_projection_graft g p T R N) as [Root Vp].
  pose proof (crtos_root_partition__crtos_insert_composition g p G R N) as [Gl [Gr [Nl [Nr [Dj [Part Perm]]]]]].
  fold l r in Gl,Gr,Nl,Nr,Dj,Part,Perm.
  pose proof (crtos_search_split_left__crtos_insert_composition g p key G Root C) as S. fold l in S.
  assert (NP:forall x, x<>p -> ~avl_vvalid l x -> ~crtos_search_path g key x).
  { intros x Nx X P. apply S in P. destruct P as [E|P]; [contradiction|].
    apply X; eapply crtos_search_valid__crtos_insert_composition; eauto. }
  assert (F:forall x, avl_vvalid l x ->
    avl_left (crtos_failure_model l key) x=avl_left (crtos_failure_model g key) x /\
    avl_right (crtos_failure_model l key) x=avl_right (crtos_failure_model g key) x).
  { intros x X.
    pose proof (crtos_child_fields__crtos_insert_composition g (avl_left g p) x X) as [_ [K [_ [L Q]]]].
    apply crtos_failure_fields__crtos_insert_composition; auto.
    rewrite S. split; [auto|]. intros [E|P]; auto. subst x; contradiction. }
  unfold crtos_graph_equiv.
  split; [reflexivity|]. split; [symmetry;exact Perm|].
  split.
  - intro x. change (x=p \/ avl_vvalid l x \/ avl_vvalid r x <-> avl_vvalid g x).
    symmetry; apply Part.
  - split.
    + intro x. change (
        avl_left (avl_join_model p (avl_key_of g p) (crtos_failure_model l key) r) x=avl_left (crtos_failure_model g key) x /\
        avl_right (avl_join_model p (avl_key_of g p) (crtos_failure_model l key) r) x=avl_right (crtos_failure_model g key) x).
      destruct (Z.eq_dec x p) as [E|Nx].
      * subst x. pose proof (avl_join_root_fields__insert_projection_graft p (avl_key_of g p) (crtos_failure_model l key) r) as [L [Q _]].
        rewrite L,Q. change (None=avl_left (crtos_failure_model g key) p /\ avl_root r=avl_right (crtos_failure_model g key) p).
        unfold r. rewrite (proj1 (avl_child_root__insert_projection_graft g (avl_right g p))).
        change (None=(if excluded_middle_informative (crtos_search_path g key p /\ key<avl_key_of g p) then None else avl_left g p) /\
          avl_right g p=(if excluded_middle_informative (crtos_search_path g key p /\ avl_key_of g p<key) then None else avl_right g p)).
        assert (P:crtos_search_path g key p) by (apply crtos_search_root;exact Root).
        destruct (excluded_middle_informative (crtos_search_path g key p /\ key<avl_key_of g p));
        destruct (excluded_middle_informative (crtos_search_path g key p /\ avl_key_of g p<key)); intuition lia.
      * destruct (excluded_middle_informative (avl_vvalid l x)) as [X|X].
        -- pose proof (avl_join_left_fields__insert_projection_graft p (avl_key_of g p) (crtos_failure_model l key) r x Nx X) as [L [Q _]].
           rewrite L,Q. apply F;exact X.
        -- pose proof (avl_join_right_fields__insert_projection_graft p (avl_key_of g p) (crtos_failure_model l key) r x Nx X) as [L [Q _]].
           rewrite L,Q. pose proof (crtos_failure_offpath__crtos_insert_composition g key x (NP x Nx X)) as [FL FQ].
           rewrite FL,FQ.
           destruct (excluded_middle_informative (avl_vvalid r x)) as [Y|Y].
           ++ pose proof (crtos_child_fields__crtos_insert_composition g (avl_right g p) x Y) as [_ [_ [_ [Lr Rr]]]]. auto.
           ++ assert (Ng:~avl_vvalid g x) by (rewrite Part;tauto).
              pose proof (GraphLib.examples.bst.invalid_child_is_none _ (GraphLib.examples.bst.bst_binary_tree _ (proj1 G)) x Ng) as [Lg Rg].
              pose proof (GraphLib.examples.bst.invalid_child_is_none _ (GraphLib.examples.bst.bst_binary_tree _ (proj1 Gr)) x Y) as [Lr Rr].
              change (avl_left g x=None) in Lg. change (avl_right g x=None) in Rg.
              change (avl_left r x=None) in Lr. change (avl_right r x=None) in Rr. split; congruence.
    + intros x X.
      change (x=p \/ avl_vvalid l x \/ avl_vvalid r x) in X.
      change (avl_key_of (avl_join_model p (avl_key_of g p) (crtos_failure_model l key) r) x=avl_key_of g x /\
        avl_height_update (avl_height_of (avl_join_model p (avl_key_of g p) (crtos_failure_model l key) r)) p (avl_height_of g p) x=avl_height_of g x).
      unfold avl_height_update. destruct (Z.eq_dec x p) as [E|Nx].
      * subst x. pose proof (avl_join_root_fields__insert_projection_graft p (avl_key_of g p) (crtos_failure_model l key) r) as [_ [_ [K H]]]. auto.
      * destruct (excluded_middle_informative (avl_vvalid l x)) as [Lx|Lx].
        -- pose proof (avl_join_left_fields__insert_projection_graft p (avl_key_of g p) (crtos_failure_model l key) r x Nx Lx) as [_ [_ [K H]]].
           rewrite K,H. pose proof (crtos_child_fields__crtos_insert_composition g (avl_left g p) x Lx) as [_ [Kg [Hg _]]]. auto.
        -- assert (Rx:avl_vvalid r x) by tauto.
           pose proof (avl_join_right_fields__insert_projection_graft p (avl_key_of g p) (crtos_failure_model l key) r x Nx Lx) as [_ [_ [K H]]].
           rewrite K,H. pose proof (crtos_child_fields__crtos_insert_composition g (avl_right g p) x Rx) as [_ [Kg [Hg _]]]. auto.
Qed.
Lemma crtos_failure_graft_right__crtos_insert_composition : forall g p key,
  avl_gvalid g -> p=avl_ptr_of (avl_root g) -> p<>0 -> avl_key_of g p<key ->
  crtos_graph_equiv
    (crtos_set_root (crtos_join_cached g p
      (avl_child_model g (avl_left g p))
      (crtos_failure_model (avl_child_model g (avl_right g p)) key)) None)
    (crtos_failure_model g key).
Proof.
  intros g p key G R N C.
  set (l:=avl_child_model g (avl_left g p)).
  set (r:=avl_child_model g (avl_right g p)).
  pose proof (avl_gvalid_tree_valid g G) as T.
  pose proof (avl_public_root_valid__insert_projection_graft g p T R N) as [Root Vp].
  pose proof (crtos_root_partition__crtos_insert_composition g p G R N) as [Gl [Gr [Nl [Nr [Dj [Part Perm]]]]]].
  fold l r in Gl,Gr,Nl,Nr,Dj,Part,Perm.
  pose proof (crtos_search_split_right__crtos_insert_composition g p key G Root C) as S. fold r in S.
  assert (NP:forall x, x<>p -> ~avl_vvalid r x -> ~crtos_search_path g key x).
  { intros x Nx X P. apply S in P. destruct P as [E|P]; [contradiction|].
    apply X; eapply crtos_search_valid__crtos_insert_composition; eauto. }
  assert (F:forall x, avl_vvalid r x ->
    avl_left (crtos_failure_model r key) x=avl_left (crtos_failure_model g key) x /\
    avl_right (crtos_failure_model r key) x=avl_right (crtos_failure_model g key) x).
  { intros x X.
    pose proof (crtos_child_fields__crtos_insert_composition g (avl_right g p) x X) as [_ [K [_ [L Q]]]].
    apply crtos_failure_fields__crtos_insert_composition; auto.
    rewrite S. split; [auto|]. intros [E|P]; auto. subst x; contradiction. }
  unfold crtos_graph_equiv.
  split; [reflexivity|]. split; [symmetry;exact Perm|].
  split.
  - intro x. change (x=p \/ avl_vvalid l x \/ avl_vvalid r x <-> avl_vvalid g x).
    symmetry; apply Part.
  - split.
    + intro x. change (
        avl_left (avl_join_model p (avl_key_of g p) l (crtos_failure_model r key)) x=avl_left (crtos_failure_model g key) x /\
        avl_right (avl_join_model p (avl_key_of g p) l (crtos_failure_model r key)) x=avl_right (crtos_failure_model g key) x).
      destruct (Z.eq_dec x p) as [E|Nx].
      * subst x. pose proof (avl_join_root_fields__insert_projection_graft p (avl_key_of g p) l (crtos_failure_model r key)) as [L [Q _]].
        rewrite L,Q. change (avl_root l=avl_left (crtos_failure_model g key) p /\ None=avl_right (crtos_failure_model g key) p).
        unfold l. rewrite (proj1 (avl_child_root__insert_projection_graft g (avl_left g p))).
        change (avl_left g p=(if excluded_middle_informative (crtos_search_path g key p /\ key<avl_key_of g p) then None else avl_left g p) /\
          None=(if excluded_middle_informative (crtos_search_path g key p /\ avl_key_of g p<key) then None else avl_right g p)).
        assert (P:crtos_search_path g key p) by (apply crtos_search_root;exact Root).
        destruct (excluded_middle_informative (crtos_search_path g key p /\ key<avl_key_of g p));
        destruct (excluded_middle_informative (crtos_search_path g key p /\ avl_key_of g p<key)); intuition lia.
      * destruct (excluded_middle_informative (avl_vvalid l x)) as [X|X].
        -- pose proof (avl_join_left_fields__insert_projection_graft p (avl_key_of g p) l (crtos_failure_model r key) x Nx X) as [L [Q _]].
           rewrite L,Q.
           pose proof (crtos_failure_offpath__crtos_insert_composition g key x (NP x Nx (Dj x X))) as [FL FQ].
           rewrite FL,FQ.
           pose proof (crtos_child_fields__crtos_insert_composition g (avl_left g p) x X) as [_ [_ [_ [Ll Rl]]]]. auto.
        -- pose proof (avl_join_right_fields__insert_projection_graft p (avl_key_of g p) l (crtos_failure_model r key) x Nx X) as [L [Q _]].
           rewrite L,Q.
           destruct (excluded_middle_informative (avl_vvalid r x)) as [Y|Y].
           ++ apply F;exact Y.
           ++ pose proof (crtos_failure_offpath__crtos_insert_composition g key x (NP x Nx Y)) as [FL FQ].
              pose proof (crtos_failure_offpath__crtos_insert_composition r key x ltac:(intro P;apply Y;eapply crtos_search_valid__crtos_insert_composition;eauto)) as [RL RQ].
              rewrite FL,FQ,RL,RQ.
              assert (Ng:~avl_vvalid g x) by (rewrite Part;tauto).
              pose proof (GraphLib.examples.bst.invalid_child_is_none _ (GraphLib.examples.bst.bst_binary_tree _ (proj1 G)) x Ng) as [Lg Rg].
              pose proof (GraphLib.examples.bst.invalid_child_is_none _ (GraphLib.examples.bst.bst_binary_tree _ (proj1 Gr)) x Y) as [Lr Rr].
              change (avl_left g x=None) in Lg. change (avl_right g x=None) in Rg.
              change (avl_left r x=None) in Lr. change (avl_right r x=None) in Rr. split; congruence.
    + intros x X.
      change (x=p \/ avl_vvalid l x \/ avl_vvalid r x) in X.
      change (avl_key_of (avl_join_model p (avl_key_of g p) l (crtos_failure_model r key)) x=avl_key_of g x /\
        avl_height_update (avl_height_of (avl_join_model p (avl_key_of g p) l (crtos_failure_model r key))) p (avl_height_of g p) x=avl_height_of g x).
      unfold avl_height_update. destruct (Z.eq_dec x p) as [E|Nx].
      * subst x. pose proof (avl_join_root_fields__insert_projection_graft p (avl_key_of g p) l (crtos_failure_model r key)) as [_ [_ [K H]]]. auto.
      * destruct (excluded_middle_informative (avl_vvalid l x)) as [Lx|Lx].
        -- pose proof (avl_join_left_fields__insert_projection_graft p (avl_key_of g p) l (crtos_failure_model r key) x Nx Lx) as [_ [_ [K H]]].
           rewrite K,H. pose proof (crtos_child_fields__crtos_insert_composition g (avl_left g p) x Lx) as [_ [Kg [Hg _]]]. auto.
        -- assert (Rx:avl_vvalid r x) by tauto.
           pose proof (avl_join_right_fields__insert_projection_graft p (avl_key_of g p) l (crtos_failure_model r key) x Nx Lx) as [_ [_ [K H]]].
           rewrite K,H. pose proof (crtos_child_fields__crtos_insert_composition g (avl_right g p) x Rx) as [_ [Kg [Hg _]]]. auto.
Qed.
Lemma crtos_equiv_path__crtos_insert_composition : forall a b,
  crtos_graph_equiv a b -> forall x y, avl_reachable a x y <-> avl_reachable b x y.
Proof.
  intros a b [_ [_ [_ [C _]]]] x y.
  apply (avl_path_equiv_on_closed_region__left_rotation_graph_heights addr
    (GraphLib.examples.bst.bt_child (GraphLib.examples.bst.bst_tree (avl_bst a)))
    (GraphLib.examples.bst.bt_child (GraphLib.examples.bst.bst_tree (avl_bst b))) x).
  - intros u v _. change ((avl_left a u=Some v \/ avl_right a u=Some v) <->
      (avl_left b u=Some v \/ avl_right b u=Some v)).
    rewrite (proj1 (C u)), (proj2 (C u)); reflexivity.
  - exists O. reflexivity.
Qed.
Lemma crtos_equiv_childheight__crtos_insert_composition : forall a b c,
  crtos_graph_equiv a b -> (forall x, c=Some x -> avl_vvalid a x) ->
  avl_child_height a c=avl_child_height b c.
Proof.
  intros a b [x|] [_ [_ [_ [_ K]]]] V; [apply K;apply V;reflexivity|reflexivity].
Qed.
Lemma crtos_equiv_gvalid__crtos_insert_composition : forall a b,
  crtos_graph_equiv a b -> avl_gvalid a -> avl_gvalid b.
Proof.
  intros a b E Ga. pose proof E as Efull. destruct E as [R [P [V [C K]]]].
  rename Efull into E.
  pose proof (GraphLib.examples.bst.bst_binary_tree _ (proj1 Ga)) as Ta.
  assert (Path:forall x y, avl_reachable a x y <-> avl_reachable b x y)
    by (apply crtos_equiv_path__crtos_insert_composition;exact E).
  assert (Child:forall x c, avl_vvalid a x ->
    (avl_left a x=Some c \/ avl_right a x=Some c) -> avl_vvalid a c)
    by (intros; eapply avl_graph_child_valid__root_and_factor_setup; eauto;exact (proj1 Ga)).
  assert (HL:forall x, avl_vvalid a x ->
    avl_child_height b (avl_left b x)=avl_child_height a (avl_left a x)).
  { intros x X. rewrite <- (proj1 (C x)). symmetry.
    apply crtos_equiv_childheight__crtos_insert_composition; [exact E|].
    intros c H;apply (Child x c X);auto. }
  assert (HR:forall x, avl_vvalid a x ->
    avl_child_height b (avl_right b x)=avl_child_height a (avl_right a x)).
  { intros x X. rewrite <- (proj2 (C x)). symmetry.
    apply crtos_equiv_childheight__crtos_insert_composition; [exact E|].
    intros c H;apply (Child x c X);auto. }
  unfold avl_gvalid. split.
  - constructor.
    + constructor.
      * intros x Root. apply V. apply (GraphLib.examples.bst.root_valid _ Ta).
        change (avl_root a=Some x). rewrite R;exact Root.
      * intros x r Root. change (avl_root b=Some r) in Root.
        rewrite <- R in Root. pose proof (GraphLib.examples.bst.root_no_parents _ Ta x r Root) as [L Q].
        change (~avl_left b x=Some r /\ ~avl_right b x=Some r).
        rewrite <- (proj1 (C x)),<- (proj2 (C x));auto.
      * intros y x1 x2 X1 X2 C1 C2.
        apply (GraphLib.examples.bst.father_unique _ Ta y x1 x2).
        -- apply V;exact X1.
        -- apply V;exact X2.
        -- change (avl_left a x1=Some y \/ avl_right a x1=Some y).
           rewrite (proj1 (C x1)),(proj2 (C x1));exact C1.
        -- change (avl_left a x2=Some y \/ avl_right a x2=Some y).
           rewrite (proj1 (C x2)),(proj2 (C x2));exact C2.
      * intros x y X Edge. apply V. apply (Child x y).
        -- apply V;exact X.
        -- rewrite (proj1 (C x)),(proj2 (C x));exact Edge.
      * intros x X. assert (Xa:~avl_vvalid a x) by (intro H;apply X;apply V;exact H).
        pose proof (GraphLib.examples.bst.invalid_child_is_none _ Ta x Xa) as [L Q].
        change (avl_left b x=None /\ avl_right b x=None).
        rewrite <- (proj1 (C x)), <- (proj2 (C x));auto.
      * intros x y z X Y Z L Q. eapply (GraphLib.examples.bst.child_distinct _ Ta x y z).
        -- apply V;exact X.
        -- apply V;exact Y.
        -- apply V;exact Z.
        -- change (avl_left a x=Some y);rewrite (proj1 (C x));exact L.
        -- change (avl_right a x=Some z);rewrite (proj2 (C x));exact Q.
      * intros x X. apply V in X.
        pose proof (GraphLib.examples.bst.path_exists _ Ta x X) as [r [Root Reach]].
        exists r. split.
        -- change (avl_root b=Some r). rewrite <-R;exact Root.
        -- apply Path;exact Reach.
      * intros x X. eapply Permutation_in; [exact P|].
        apply (GraphLib.examples.bst.finite_vertices _ Ta). apply V;exact X.
      * intros x X. apply V. apply (GraphLib.examples.bst.listV_sound _ Ta).
        eapply Permutation_in; [symmetry;exact P|exact X].
      * eapply Permutation_NoDup; [exact P|exact (GraphLib.examples.bst.listV_NoDup _ Ta)].
    + intros x y X [c [L Reach]].
      assert (Xa:avl_vvalid a x) by (apply V;exact X).
      assert (La:avl_left a x=Some c) by (rewrite (proj1 (C x));exact L).
      assert (Pa:avl_reachable a c y) by (apply Path;exact Reach).
      assert (Ya:avl_vvalid a y).
      { eapply GraphLib.examples.bst.bt_path_end_valid_early; [exact Ta|apply (Child x c Xa);auto|exact Pa]. }
      change (avl_key_of b y<avl_key_of b x).
      rewrite <-(proj1 (K x Xa)),<-(proj1 (K y Ya)).
      apply (GraphLib.examples.bst.bst_left_order _ (proj1 Ga) x y Xa). exists c;auto.
    + intros x y X [c [L Reach]].
      assert (Xa:avl_vvalid a x) by (apply V;exact X).
      assert (La:avl_right a x=Some c) by (rewrite (proj2 (C x));exact L).
      assert (Pa:avl_reachable a c y) by (apply Path;exact Reach).
      assert (Ya:avl_vvalid a y).
      { eapply GraphLib.examples.bst.bt_path_end_valid_early; [exact Ta|apply (Child x c Xa);auto|exact Pa]. }
      change (avl_key_of b x<avl_key_of b y).
      rewrite <-(proj1 (K x Xa)),<-(proj1 (K y Ya)).
      apply (GraphLib.examples.bst.bst_right_order _ (proj1 Ga) x y Xa). exists c;auto.
  - split.
    + intros x X. apply V in X.
      rewrite <-(proj2 (K x X)),HL,HR by exact X.
      exact (proj1 (proj2 Ga) x X).
    + split.
      * intros x X. apply V in X.
        unfold avl_model_balance_factor. rewrite HL,HR by exact X.
        exact (proj1 (proj2 (proj2 Ga)) x X).
      * intros x X. apply (proj2 (proj2 (proj2 Ga))). apply V;exact X.
Qed.
Lemma crtos_interval_height_nat__crtos_insert_composition : forall n g,
  Z.to_nat (avl_child_height g (avl_root g))=n ->
  avl_tree_valid g -> forall lo hi,
  (forall x, avl_vvalid g x -> lo<=avl_key_of g x<=hi) ->
  avl_child_height g (avl_root g)<=Z.max 0 (hi-lo+1).
Proof.
  intro n. induction n using lt_wf_ind.
  intros g En T lo hi Bound.
  destruct (avl_root g) as [p|] eqn:R; [|simpl;apply Z.le_max_l].
  assert (V:avl_vvalid g p) by (exact (GraphLib.examples.bst.root_valid _ (GraphLib.examples.bst.bst_binary_tree _ (proj1 T)) p R)).
  pose proof (Bound p V) as Bp.
  set (l:=avl_child_model g (avl_left g p)).
  set (r:=avl_child_model g (avl_right g p)).
  assert (Tl:avl_tree_valid l).
  { apply avl_child_projection_valid__insert_projection_graft; [exact T|].
    intros x E;eapply avl_graph_child_valid__root_and_factor_setup; [exact (proj1 T)|exact V|auto]. }
  assert (Tr:avl_tree_valid r).
  { apply avl_child_projection_valid__insert_projection_graft; [exact T|].
    intros x E;eapply avl_graph_child_valid__root_and_factor_setup; [exact (proj1 T)|exact V|auto]. }
  pose proof (avl_root_height_nonnegative__insert_projection_graft l Tl) as Nl.
  pose proof (avl_root_height_nonnegative__insert_projection_graft r Tr) as Nr.
  pose proof (proj1 (proj2 T) p V) as [Hp Eq].
  pose proof (proj2 (avl_child_root__insert_projection_graft g (avl_left g p))) as El.
  pose proof (proj2 (avl_child_root__insert_projection_graft g (avl_right g p))) as Er.
  fold l in El. fold r in Er.
  rewrite <- El,<- Er in Eq.
  assert (Np:0<=avl_height_of g p) by lia.
  assert (LtL:(Z.to_nat (avl_child_height l (avl_root l))<n)%nat).
  { rewrite <-En. simpl.
    apply (proj1 (Z2Nat.inj_lt _ _ Nl Np)). pose proof (Z.le_max_l (avl_child_height l (avl_root l)) (avl_child_height r (avl_root r)));lia. }
  assert (LtR:(Z.to_nat (avl_child_height r (avl_root r))<n)%nat).
  { rewrite <-En. simpl.
    apply (proj1 (Z2Nat.inj_lt _ _ Nr Np)). pose proof (Z.le_max_r (avl_child_height l (avl_root l)) (avl_child_height r (avl_root r)));lia. }
  assert (Bl:forall x, avl_vvalid l x -> lo<=avl_key_of l x<=avl_key_of g p-1).
  { intros x X. pose proof (crtos_child_fields__crtos_insert_composition g (avl_left g p) x X) as [Xg [K _]].
    fold l in K. fold r in K.
    pose proof (Bound x Xg).
    pose proof (avl_key_of_member__insert_projection_graft l x Tl X) as I.
    pose proof (avl_left_keys_order__insert_projection_graft g p T V _ I). lia. }
  assert (Br:forall x, avl_vvalid r x -> avl_key_of g p+1<=avl_key_of r x<=hi).
  { intros x X. pose proof (crtos_child_fields__crtos_insert_composition g (avl_right g p) x X) as [Xg [K _]].
    fold l in K. fold r in K.
    pose proof (Bound x Xg).
    pose proof (avl_key_of_member__insert_projection_graft r x Tr X) as I.
    pose proof (avl_right_keys_order__insert_projection_graft g p T V _ I). lia. }
  pose proof (H _ LtL l eq_refl Tl lo (avl_key_of g p-1) Bl) as IL.
  pose proof (H _ LtR r eq_refl Tr (avl_key_of g p+1) hi Br) as IR.
  simpl avl_child_height.
  rewrite Z.max_r in IL by lia. rewrite Z.max_r in IR by lia.
  rewrite Z.max_r by lia. rewrite Eq. apply Z.add_le_mono_r. apply Z.max_lub;lia.
Qed.
Lemma crtos_interval_height__crtos_insert_composition : forall g lo hi,
  avl_tree_valid g ->
  (forall x, avl_vvalid g x -> lo<=avl_key_of g x<=hi) ->
  avl_child_height g (avl_root g)<=Z.max 0 (hi-lo+1).
Proof.
  intros g lo hi T B.
  eapply crtos_interval_height_nat__crtos_insert_composition; [reflexivity|exact T|exact B].
Qed.
Lemma crtos_join_valid__crtos_insert_composition : forall p key l r,
  p <> 0 -> avl_tree_valid l -> avl_tree_valid r -> avl_balanced l -> avl_balanced r ->
  ~ avl_vvalid l p -> ~ avl_vvalid r p ->
  (forall x, avl_vvalid l x -> ~ avl_vvalid r x) ->
  (forall x, avl_vvalid l x -> avl_key_of l x < key) ->
  (forall x, avl_vvalid r x -> key < avl_key_of r x) ->
  Z.max (avl_child_height l (avl_root l)) (avl_child_height r (avl_root r)) + 1 <= UINT_MAX ->
  avl_tree_valid (avl_join_model p key l r) /\
  (forall x, avl_vvalid (avl_join_model p key l r) x -> x<>p ->
    Z.abs (avl_model_balance_factor (avl_join_model p key l r) x) <= 1).
Proof.
  intros p key l r Np Vl Vr Bl Br Nl Nr Dj Kl Kr Bound.
  set (g := avl_join_model p key l r).
  pose proof (GraphLib.examples.bst.bst_binary_tree _ (proj1 Vl)) as Tl.
  pose proof (GraphLib.examples.bst.bst_binary_tree _ (proj1 Vr)) as Tr.
  pose proof (avl_join_root_fields__insert_projection_graft p key l r) as [Lp [Rp [Kp Hp]]].
  fold g in Lp, Rp, Kp, Hp.
  assert (RL : forall x, avl_root l = Some x -> avl_vvalid l x) by (intros; eapply GraphLib.examples.bst.root_valid; eauto).
  assert (RR : forall x, avl_root r = Some x -> avl_vvalid r x) by (intros; eapply GraphLib.examples.bst.root_valid; eauto).
  assert (CHL : forall c, (forall x, c=Some x -> avl_vvalid l x) -> avl_child_height g c = avl_child_height l c).
  { intros; apply avl_join_left_child_height__insert_projection_graft; auto. }
  assert (CHR : forall c, (forall x, c=Some x -> avl_vvalid r x) -> avl_child_height g c = avl_child_height r c).
  { intros; apply avl_join_right_child_height__insert_projection_graft; auto. }
  assert (LL : forall x, avl_vvalid l x -> avl_child_height g (avl_left l x) = avl_child_height l (avl_left l x)).
  { intros x Hx. apply CHL. intros y C. exact (avl_graph_child_valid__root_and_factor_setup l x y (proj1 Vl) Hx (or_introl C)). }
  assert (LR : forall x, avl_vvalid l x -> avl_child_height g (avl_right l x) = avl_child_height l (avl_right l x)).
  { intros x Hx. apply CHL. intros y C. exact (avl_graph_child_valid__root_and_factor_setup l x y (proj1 Vl) Hx (or_intror C)). }
  assert (RLc : forall x, avl_vvalid r x -> avl_child_height g (avl_left r x) = avl_child_height r (avl_left r x)).
  { intros x Hx. apply CHR. intros y C. exact (avl_graph_child_valid__root_and_factor_setup r x y (proj1 Vr) Hx (or_introl C)). }
  assert (RRc : forall x, avl_vvalid r x -> avl_child_height g (avl_right r x) = avl_child_height r (avl_right r x)).
  { intros x Hx. apply CHR. intros y C. exact (avl_graph_child_valid__root_and_factor_setup r x y (proj1 Vr) Hx (or_intror C)). }
  assert (FL : forall x, avl_vvalid l x ->
    avl_height_of g x = avl_height_of l x /\ avl_model_balance_factor g x = avl_model_balance_factor l x /\
    (avl_height_of g x = Z.max (avl_child_height g (avl_left g x)) (avl_child_height g (avl_right g x))+1)).
  { intros x Hx. assert (Nx : x<>p) by (intro E; subst x; contradiction).
    pose proof (avl_join_left_fields__insert_projection_graft p key l r x Nx Hx) as [L [R [K H]]].
    change (avl_left g x = avl_left l x) in L. change (avl_right g x = avl_right l x) in R.
    change (avl_height_of g x = avl_height_of l x) in H.
    split; [exact H|]. split.
    - unfold avl_model_balance_factor. rewrite L,R,LL,LR by exact Hx. reflexivity.
    - rewrite H,L,R,LL,LR by exact Hx. exact (proj2 (proj1 (proj2 Vl) x Hx)). }
  assert (FR : forall x, avl_vvalid r x ->
    avl_height_of g x = avl_height_of r x /\ avl_model_balance_factor g x = avl_model_balance_factor r x /\
    (avl_height_of g x = Z.max (avl_child_height g (avl_left g x)) (avl_child_height g (avl_right g x))+1)).
  { intros x Hx. assert (Nx : x<>p) by (intro E; subst x; contradiction).
    assert (Nlx : ~avl_vvalid l x) by (intro H; exact (Dj x H Hx)).
    pose proof (avl_join_right_fields__insert_projection_graft p key l r x Nx Nlx) as [L [R [K H]]].
    change (avl_left g x = avl_left r x) in L. change (avl_right g x = avl_right r x) in R.
    change (avl_height_of g x = avl_height_of r x) in H.
    split; [exact H|]. split.
    - unfold avl_model_balance_factor. rewrite L,R,RLc,RRc by exact Hx. reflexivity.
    - rewrite H,L,R,RLc,RRc by exact Hx. exact (proj2 (proj1 (proj2 Vr) x Hx)). }
  split.
  - split; [apply avl_join_bst__insert_projection_graft; assumption|]. split.
    + intros x Hx. change (x=p \/ avl_vvalid l x \/ avl_vvalid r x) in Hx.
      destruct Hx as [E|[Hx|Hx]].
      * subst x. change (avl_left g p = avl_root l) in Lp. change (avl_right g p = avl_root r) in Rp.
        change (avl_height_of g p = Z.max (avl_child_height l (avl_root l)) (avl_child_height r (avl_root r))+1) in Hp.
        rewrite Hp,Lp,Rp,CHL,CHR by auto. split; [|reflexivity].
        pose proof (avl_root_height_nonnegative__insert_projection_graft l Vl).
        pose proof (avl_root_height_nonnegative__insert_projection_graft r Vr).
        pose proof (Z.le_max_l (avl_child_height l (avl_root l)) (avl_child_height r (avl_root r))).
        lia.
      * pose proof (FL x Hx) as [H [B E]]. split; [rewrite H; exact (proj1 (proj1 (proj2 Vl) x Hx))|exact E].
      * pose proof (FR x Hx) as [H [B E]]. split; [rewrite H; exact (proj1 (proj1 (proj2 Vr) x Hx))|exact E].
    + intros x Hx. change (x=p \/ avl_vvalid l x \/ avl_vvalid r x) in Hx.
      destruct Hx as [E|[Hx|Hx]]; [subst x; exact Np|exact (proj2 (proj2 Vl) x Hx)|exact (proj2 (proj2 Vr) x Hx)].
  - intros x Hx Nx. change (x=p \/ avl_vvalid l x \/ avl_vvalid r x) in Hx.
    destruct Hx as [E|[Hx|Hx]]; [contradiction|rewrite (proj1 (proj2 (FL x Hx))); apply Bl; exact Hx|rewrite (proj1 (proj2 (FR x Hx))); apply Br; exact Hx].
Qed.
Lemma crtos_store_signed__crtos_insert_composition : forall g,
  crtos_raw_domain g -> avl_tree_store g |--
  “ forall x, avl_vvalid g x -> INT_MIN<=avl_key_of g x<=INT_MAX ”.
Proof.
  intros g D. change (forall m, avl_tree_store g m -> forall x,
    avl_vvalid g x -> INT_MIN<=avl_key_of g x<=INT_MAX).
  intros m Hm x V.
  assert (E:avl_tree_store g |-- “ INT_MIN<=avl_key_of g x<=INT_MAX ”).
  { unfold avl_tree_store.
    sep_apply_l_atomic (avl_nodes_store_member__insert_projection_graft g (avl_nodes g) x (proj1 (D x) V)).
    unfold avl_graph_node_store. Intros_p Vx. Intros_p Nx. Intros_p Kx. Intros_p Hx.
    entailer!. }
  exact (E m Hm).
Qed.
Lemma crtos_nonzero_outcome__crtos_insert_composition : forall g a key ret,
  avl_gvalid g -> crtos_insert_outcome g a key ret -> ret<>0 ->
  avl_gvalid a /\ ret=avl_ptr_of (avl_root a) /\
  avl_child_height g (avl_root g)<=avl_child_height a (avl_root a)<=avl_child_height g (avl_root g)+1 /\
  (forall x, avl_vvalid a x -> avl_key_of a x=key \/
     (avl_vvalid g x /\ avl_key_of a x=avl_key_of g x)).
Proof.
  intros g a key ret G [Exact [Dup|[Absent [Fail|Success]]]] N.
  - destruct Dup as [Pres [Ret E]].
    pose proof (crtos_equiv_sym__crtos_insert_composition a g E) as Es.
    pose proof (crtos_equiv_gvalid__crtos_insert_composition g a Es G) as Ga.
    pose proof E as E0. destruct E as [R [P [V [C K]]]].
    assert (Ht:avl_child_height a (avl_root a)=avl_child_height g (avl_root g)).
    { rewrite R. apply crtos_equiv_childheight__crtos_insert_composition; [exact E0|].
      intros x Rx. apply V. exact (GraphLib.examples.bst.root_valid _ (GraphLib.examples.bst.bst_binary_tree _ (proj1 G)) x Rx). }
    split; [exact Ga|]. split; [congruence|]. split; [lia|].
    intros x X. right. split; [apply V;exact X|apply K;exact X].
  - destruct Fail as [E _]. contradiction.
  - destruct Success as [Ga [Nret [R [[n [Nn [Fresh [V [K Preserve]]]]] Heights]]]].
    split; [exact Ga|]. split; [exact R|]. split; [exact Heights|].
    intros x X. destruct (proj1 (V x) X) as [E|Xg].
    + subst x. left;exact K.
    + right;split;auto.
Qed.
Lemma crtos_cached_ready__crtos_insert_composition : forall g p cache,
  avl_tree_valid g -> avl_root g=Some p -> p<>0 ->
  crtos_update_height (avl_with_root_cache g p cache) p=g /\
  crtos_update_ready (avl_with_root_cache g p cache) p.
Proof.
  intros g p cache T R N.
  pose proof (GraphLib.examples.bst.bst_binary_tree _ (proj1 T)) as Bt.
  pose proof (GraphLib.examples.bst.root_valid _ Bt p R) as V.
  pose proof (GraphLib.examples.bst.root_no_parents _ Bt p p R) as [Nl Nr].
  assert (CH:forall c, c<>Some p -> avl_child_height (avl_with_root_cache g p cache) c=avl_child_height g c).
  { intros [x|] C; [|reflexivity]. unfold avl_child_height,avl_with_root_cache,avl_height_update; simpl.
    destruct (Z.eq_dec x p);congruence. }
  assert (Hv:crtos_height_value (avl_with_root_cache g p cache) p=avl_height_of g p).
  { unfold crtos_height_value. change (avl_left (avl_with_root_cache g p cache) p) with (avl_left g p).
    change (avl_right (avl_with_root_cache g p cache) p) with (avl_right g p).
    rewrite !CH by assumption. symmetry;exact (proj2 (proj1 (proj2 T) p V)). }
  split.
  - unfold crtos_update_height. rewrite Hv.
    transitivity (avl_with_root_cache g p (avl_height_of g p)); [|apply avl_cache_self__lr_graph_composition].
    unfold avl_with_root_cache; simpl. f_equal.
    apply functional_extensionality;intro x. unfold avl_height_update.
    destruct (Z.eq_dec x p);reflexivity.
  - split; [exact (crtos_valid_domain__crtos_insert_composition g T)|].
    split; [exact V|]. split; [exact N|]. split.
    + intros c C. change (avl_left g p=Some c \/ avl_right g p=Some c) in C.
      pose proof (avl_graph_child_valid__root_and_factor_setup g p c (proj1 T) V C) as Vc.
      assert (Nc:c<>p) by (intro E;subst c;tauto).
      change (avl_vvalid g c /\ c<>0 /\ 0<=avl_height_update (avl_height_of g) p cache c<=UINT_MAX).
      unfold avl_height_update. destruct (Z.eq_dec c p); [contradiction|].
      split; [exact Vc|]. split; [exact (proj2 (proj2 T) c Vc)|].
      pose proof (proj1 (proj1 (proj2 T) c Vc));lia.
    + rewrite Hv. exact (proj1 (proj1 (proj2 T) p V)).
Qed.
Lemma crtos_tree_balance_ready__crtos_insert_composition : forall g p,
  avl_tree_valid g -> avl_vvalid g p -> p<>0 ->
  (forall x,avl_vvalid g x -> x<>p -> Z.abs (avl_model_balance_factor g x)<=1) ->
  Z.abs (avl_model_balance_factor g p)<=2 -> crtos_balance_ready g p.
Proof.
  intros g p T V N B F. split; [exact V|]. split; [exact N|].
  split; [apply avl_subtree_projection_valid__lr_graph_composition;assumption|].
  split; [intros x [X Reach] Nx;apply B;assumption|exact F].
Qed.
Lemma crtos_join_height_bound__crtos_insert_composition : forall l r key,
  avl_tree_valid l -> avl_tree_valid r -> INT_MIN<=key<=INT_MAX ->
  (forall x,avl_vvalid l x -> INT_MIN<=avl_key_of l x /\ avl_key_of l x<key) ->
  (forall x,avl_vvalid r x -> key<avl_key_of r x /\ avl_key_of r x<=INT_MAX) ->
  Z.abs (avl_child_height l (avl_root l)-avl_child_height r (avl_root r))<=2 ->
  Z.max (avl_child_height l (avl_root l)) (avl_child_height r (avl_root r))+1<=UINT_MAX.
Proof.
  intros l r key Tl Tr K Bl Br F.
  pose proof (crtos_interval_height__crtos_insert_composition l INT_MIN (key-1) Tl ltac:(intros; specialize (Bl _ H);lia)) as L.
  pose proof (crtos_interval_height__crtos_insert_composition r (key+1) INT_MAX Tr ltac:(intros; specialize (Br _ H);lia)) as R.
  rewrite Z.max_r in L by lia. rewrite Z.max_r in R by lia.
  apply Z.abs_le in F.
  destruct (Z.max_spec (avl_child_height l (avl_root l)) (avl_child_height r (avl_root r))) as [[A E]|[A E]];rewrite E;lia.
Qed.
Lemma crtos_join_ready__crtos_insert_composition : forall p key cache l r,
  p<>0 -> avl_gvalid l -> avl_gvalid r ->
  ~avl_vvalid l p -> ~avl_vvalid r p ->
  (forall x,avl_vvalid l x -> ~avl_vvalid r x) ->
  INT_MIN<=key<=INT_MAX ->
  (forall x,avl_vvalid l x -> INT_MIN<=avl_key_of l x /\ avl_key_of l x<key) ->
  (forall x,avl_vvalid r x -> key<avl_key_of r x /\ avl_key_of r x<=INT_MAX) ->
  Z.abs (avl_child_height l (avl_root l)-avl_child_height r (avl_root r))<=2 ->
  crtos_update_ready (avl_with_root_cache (avl_join_model p key l r) p cache) p /\
  crtos_balance_ready (crtos_update_height (avl_with_root_cache (avl_join_model p key l r) p cache) p) p.
Proof.
  intros p key cache l r N Gl Gr Nl Nr Dj K Bl Br F.
  pose proof (avl_gvalid_tree_valid l Gl) as Tl.
  pose proof (avl_gvalid_tree_valid r Gr) as Tr.
  pose proof (crtos_join_height_bound__crtos_insert_composition l r key Tl Tr K Bl Br F) as Bound.
  pose proof (crtos_join_valid__crtos_insert_composition p key l r N Tl Tr
    (proj1 (proj2 (proj2 Gl))) (proj1 (proj2 (proj2 Gr))) Nl Nr Dj
    ltac:(intros;apply Bl;assumption) ltac:(intros;apply Br;assumption) Bound) as [T Bal].
  pose proof (crtos_cached_ready__crtos_insert_composition (avl_join_model p key l r) p cache T eq_refl N) as [E U].
  split; [exact U|]. rewrite E. apply crtos_tree_balance_ready__crtos_insert_composition; auto.
  - left;reflexivity.
  - unfold avl_model_balance_factor.
    pose proof (avl_join_root_fields__insert_projection_graft p key l r) as [L [R _]].
    rewrite L,R.
    assert (RL:forall x,avl_root l=Some x -> avl_vvalid l x).
    { intros; eapply GraphLib.examples.bst.root_valid; [exact (GraphLib.examples.bst.bst_binary_tree _ (proj1 Tl))|eassumption]. }
    assert (RR:forall x,avl_root r=Some x -> avl_vvalid r x).
    { intros; eapply GraphLib.examples.bst.root_valid; [exact (GraphLib.examples.bst.bst_binary_tree _ (proj1 Tr))|eassumption]. }
    rewrite (avl_join_left_child_height__insert_projection_graft p key l r (avl_root l) Nl RL).
    rewrite (avl_join_right_child_height__insert_projection_graft p key l r (avl_root r) Nr Dj RR).
    exact F.
Qed.
Lemma crtos_store_nodup__crtos_insert_composition : forall g xs,
  avl_graph_nodes_store g xs |-- “ NoDup xs ”.
Proof.
  intros g xs. induction xs as [|x xs IH].
  - entailer!. constructor.
  - rewrite avl_graph_nodes_store_cons__graph_store_decomposition.
    prop_apply_p IH. Intros_p Nd.
    destruct (in_dec Z.eq_dec x xs) as [I|I].
    + sep_apply_l_atomic (avl_nodes_store_member__insert_projection_graft g xs x I).
      unfold avl_graph_node_store. Intros_p V1. Intros_p N1. Intros_p K1. Intros_p H1.
      Intros_p V2. Intros_p N2. Intros_p K2. Intros_p H2.
      sepcon_assoc_change.
      prop_apply_p (dup_store_int (eval_addr_expr (RE_addr_of (LE_arrow_field (RE_const x (FET_alias "AvlNode"%string)) "data"%string))) (avl_key_of g x) (avl_key_of g x)).
      entailer!.
    + entailer!. constructor;assumption.
Qed.
Lemma crtos_join_nodup__crtos_insert_composition : forall p l r,
  crtos_raw_domain l -> crtos_raw_domain r -> NoDup (p::avl_nodes l++avl_nodes r) ->
  ~avl_vvalid l p /\ ~avl_vvalid r p /\
  (forall x,avl_vvalid l x -> ~avl_vvalid r x).
Proof.
  intros p l r Dl Dr Nd. inversion Nd as [|a xs Np Nlr];subst.
  assert (Disj:forall x,In x (avl_nodes l) -> ~In x (avl_nodes r)).
  { clear Nd Np Dl Dr. induction (avl_nodes l) as [|z zs IH];simpl in *.
    - tauto.
    - inversion Nlr as [|a xs Nz Ns];subst. intros x [E|I] J.
      + subst x. apply Nz. apply in_or_app;right;exact J.
      + exact (IH Ns x I J). }
  split; [intro V;apply Np;apply in_or_app;left;apply Dl;exact V|].
  split; [intro V;apply Np;apply in_or_app;right;apply Dr;exact V|].
  intros x L R. eapply Disj; [apply Dl;exact L|apply Dr;exact R].
Qed.
Lemma crtos_equiv_cache__crtos_insert_composition : forall a b p h,
  crtos_graph_equiv a b -> crtos_graph_equiv (avl_with_root_cache a p h) (avl_with_root_cache b p h).
Proof.
  intros a b p h E. destruct E as [R [P [V [C K]]]].
  split; [exact R|]. split; [exact P|]. split; [exact V|]. split; [exact C|].
  intros x X. split; [apply K;exact X|]. unfold avl_with_root_cache,avl_height_update; simpl.
  destruct (Z.eq_dec x p); [reflexivity|apply K;exact X].
Qed.
Lemma crtos_equiv_fields__crtos_insert_composition : forall a b root la lb ra rb,
  crtos_graph_equiv a b -> (forall x,la x=lb x) -> (forall x,ra x=rb x) ->
  crtos_graph_equiv (crtos_fields a root la ra) (crtos_fields b root lb rb).
Proof.
  intros a b root la lb ra rb [R [P [V [C K]]]] L Q.
  split; [reflexivity|]. split; [exact P|]. split; [exact V|]. split; [intro x;split;auto|exact K].
Qed.
Lemma crtos_equiv_heightvalue__crtos_insert_composition : forall a b,
  crtos_graph_equiv a b ->
  (forall x c,avl_left a x=Some c \/ avl_right a x=Some c -> avl_vvalid a c) ->
  forall p, crtos_height_value a p=crtos_height_value b p /\
            avl_model_balance_factor a p=avl_model_balance_factor b p.
Proof.
  intros a b E Cl p. destruct E as [R [P [V [C K]]]].
  assert (L:avl_child_height a (avl_left a p)=avl_child_height b (avl_left b p)).
  { rewrite <- (proj1 (C p)). destruct (avl_left a p) as [x|] eqn:Ex; [|reflexivity].
    apply K. eapply Cl;left;eassumption. }
  assert (Q:avl_child_height a (avl_right a p)=avl_child_height b (avl_right b p)).
  { rewrite <- (proj2 (C p)). destruct (avl_right a p) as [x|] eqn:Ex; [|reflexivity].
    apply K. eapply Cl;right;eassumption. }
  unfold crtos_height_value,avl_model_balance_factor. rewrite L,Q. auto.
Qed.
Lemma crtos_equiv_update__crtos_insert_composition : forall a b p,
  crtos_graph_equiv a b ->
  (forall x c,avl_left a x=Some c \/ avl_right a x=Some c -> avl_vvalid a c) ->
  crtos_graph_equiv (crtos_update_height a p) (crtos_update_height b p).
Proof.
  intros a b p E Cl. unfold crtos_update_height.
  rewrite (proj1 (crtos_equiv_heightvalue__crtos_insert_composition a b E Cl p)).
  apply crtos_equiv_cache__crtos_insert_composition;exact E.
Qed.
Lemma crtos_tree_closed__crtos_insert_composition : forall g,
  avl_tree_valid g -> forall x c,avl_left g x=Some c \/ avl_right g x=Some c -> avl_vvalid g c.
Proof.
  intros g T x c C. destruct (classic (avl_vvalid g x)) as [X|X].
  - eapply avl_graph_child_valid__root_and_factor_setup;eauto. exact (proj1 T).
  - pose proof (GraphLib.examples.bst.invalid_child_is_none _ (GraphLib.examples.bst.bst_binary_tree _ (proj1 T)) x X) as [L R].
    change (avl_left g x=None) in L. change (avl_right g x=None) in R.
    destruct C;congruence.
Qed.
Lemma crtos_equiv_closed__crtos_insert_composition : forall a b,
  crtos_graph_equiv a b ->
  (forall x c,avl_left a x=Some c \/ avl_right a x=Some c -> avl_vvalid a c) ->
  forall x c,avl_left b x=Some c \/ avl_right b x=Some c -> avl_vvalid b c.
Proof.
  intros a b [R [P [V [C K]]]] Cl x c X. apply V. apply (Cl x c).
  rewrite (proj1 (C x)),(proj2 (C x));exact X.
Qed.
Lemma crtos_equiv_set_left__crtos_insert_composition : forall a b p c,
  crtos_graph_equiv a b -> crtos_graph_equiv (crtos_set_left a p c) (crtos_set_left b p c).
Proof.
  intros a b p c E. unfold crtos_set_left. rewrite (proj1 E).
  apply crtos_equiv_fields__crtos_insert_composition; [exact E| |].
  - intro x;destruct (Z.eq_dec x p); [reflexivity|exact (proj1 (proj1 (proj2 (proj2 (proj2 E))) x))].
  - intro x;exact (proj2 (proj1 (proj2 (proj2 (proj2 E))) x)).
Qed.
Lemma crtos_equiv_set_right__crtos_insert_composition : forall a b p c,
  crtos_graph_equiv a b -> crtos_graph_equiv (crtos_set_right a p c) (crtos_set_right b p c).
Proof.
  intros a b p c E. unfold crtos_set_right. rewrite (proj1 E).
  apply crtos_equiv_fields__crtos_insert_composition; [exact E| |].
  - intro x;exact (proj1 (proj1 (proj2 (proj2 (proj2 E))) x)).
  - intro x;destruct (Z.eq_dec x p); [reflexivity|exact (proj2 (proj1 (proj2 (proj2 (proj2 E))) x))].
Qed.
Lemma crtos_closed_set_left__crtos_insert_composition : forall g p c,
  (forall x y,avl_left g x=Some y \/ avl_right g x=Some y -> avl_vvalid g y) ->
  (forall y,c=Some y ->avl_vvalid g y) ->
  forall x y,avl_left (crtos_set_left g p c) x=Some y \/ avl_right (crtos_set_left g p c) x=Some y ->avl_vvalid (crtos_set_left g p c) y.
Proof.
  intros g p c Cl C x y E. change (avl_vvalid g y).
  change ((if Z.eq_dec x p then c else avl_left g x)=Some y \/ avl_right g x=Some y) in E.
  destruct E as [E|E]; [destruct (Z.eq_dec x p); [apply C;assumption|apply (Cl x y);auto]|apply (Cl x y);auto].
Qed.
Lemma crtos_closed_set_right__crtos_insert_composition : forall g p c,
  (forall x y,avl_left g x=Some y \/ avl_right g x=Some y -> avl_vvalid g y) ->
  (forall y,c=Some y ->avl_vvalid g y) ->
  forall x y,avl_left (crtos_set_right g p c) x=Some y \/ avl_right (crtos_set_right g p c) x=Some y ->avl_vvalid (crtos_set_right g p c) y.
Proof.
  intros g p c Cl C x y E. change (avl_vvalid g y).
  change (avl_left g x=Some y \/ (if Z.eq_dec x p then c else avl_right g x)=Some y) in E.
  destruct E as [E|E]; [apply (Cl x y);auto|destruct (Z.eq_dec x p); [apply C;assumption|apply (Cl x y);auto]].
Qed.
Lemma crtos_equiv_reroot__crtos_insert_composition : forall a b p q,
  crtos_graph_equiv a b -> crtos_graph_equiv (crtos_reroot_rotation a p q) (crtos_reroot_rotation b p q).
Proof.
  intros a b p q E. unfold crtos_reroot_rotation,crtos_set_root. rewrite (proj1 E).
  apply crtos_equiv_fields__crtos_insert_composition; [exact E| |]; intro x;
  [exact (proj1 (proj1 (proj2 (proj2 (proj2 E))) x))|exact (proj2 (proj1 (proj2 (proj2 (proj2 E))) x))].
Qed.
Lemma crtos_equiv_rotate_left__crtos_insert_composition : forall a b p,
  crtos_graph_equiv a b -> avl_vvalid a p ->
  (forall x y,avl_left a x=Some y \/ avl_right a x=Some y -> avl_vvalid a y) ->
  crtos_graph_equiv (crtos_rotate_left a p) (crtos_rotate_left b p) /\
  (forall x y,avl_left (crtos_rotate_left a p) x=Some y \/ avl_right (crtos_rotate_left a p) x=Some y -> avl_vvalid (crtos_rotate_left a p) y).
Proof.
  intros a b p E V Cl. pose proof (proj1 (proj2 (proj2 (proj2 E)))) as C.
  unfold crtos_rotate_left. rewrite <- (proj2 (C p)), <- (proj1 (C (avl_ptr_of (avl_right a p)))).
  set (q:=avl_ptr_of (avl_right a p)).
  assert (Ec:crtos_graph_equiv
    (crtos_set_left (crtos_set_right a p (avl_left a q)) q (Some p))
    (crtos_set_left (crtos_set_right b p (avl_left a q)) q (Some p))).
  { apply crtos_equiv_set_left__crtos_insert_composition. apply crtos_equiv_set_right__crtos_insert_composition;exact E. }
  assert (Cc:forall x y,avl_left (crtos_set_left (crtos_set_right a p (avl_left a q)) q (Some p)) x=Some y \/ avl_right (crtos_set_left (crtos_set_right a p (avl_left a q)) q (Some p)) x=Some y -> avl_vvalid a y).
  { apply crtos_closed_set_left__crtos_insert_composition.
    - apply crtos_closed_set_right__crtos_insert_composition; [exact Cl|]. intros y Y;apply (Cl q y);auto.
    - intros y Y;inversion Y;subst;exact V. }
  split; [|exact Cc]. apply crtos_equiv_reroot__crtos_insert_composition.
  apply crtos_equiv_update__crtos_insert_composition; [apply crtos_equiv_update__crtos_insert_composition;assumption|exact Cc].
Qed.
Lemma crtos_equiv_rotate_right__crtos_insert_composition : forall a b p,
  crtos_graph_equiv a b -> avl_vvalid a p ->
  (forall x y,avl_left a x=Some y \/ avl_right a x=Some y -> avl_vvalid a y) ->
  crtos_graph_equiv (crtos_rotate_right a p) (crtos_rotate_right b p) /\
  (forall x y,avl_left (crtos_rotate_right a p) x=Some y \/ avl_right (crtos_rotate_right a p) x=Some y -> avl_vvalid (crtos_rotate_right a p) y).
Proof.
  intros a b p E V Cl. pose proof (proj1 (proj2 (proj2 (proj2 E)))) as C.
  unfold crtos_rotate_right. rewrite <- (proj1 (C p)), <- (proj2 (C (avl_ptr_of (avl_left a p)))).
  set (q:=avl_ptr_of (avl_left a p)).
  assert (Ec:crtos_graph_equiv
    (crtos_set_right (crtos_set_left a p (avl_right a q)) q (Some p))
    (crtos_set_right (crtos_set_left b p (avl_right a q)) q (Some p))).
  { apply crtos_equiv_set_right__crtos_insert_composition. apply crtos_equiv_set_left__crtos_insert_composition;exact E. }
  assert (Cc:forall x y,avl_left (crtos_set_right (crtos_set_left a p (avl_right a q)) q (Some p)) x=Some y \/ avl_right (crtos_set_right (crtos_set_left a p (avl_right a q)) q (Some p)) x=Some y -> avl_vvalid a y).
  { apply crtos_closed_set_right__crtos_insert_composition.
    - apply crtos_closed_set_left__crtos_insert_composition; [exact Cl|]. intros y Y;apply (Cl q y);auto.
    - intros y Y;inversion Y;subst;exact V. }
  split; [|exact Cc]. apply crtos_equiv_reroot__crtos_insert_composition.
  apply crtos_equiv_update__crtos_insert_composition; [apply crtos_equiv_update__crtos_insert_composition;assumption|exact Cc].
Qed.
Lemma crtos_factor_children__crtos_insert_composition : forall g p,
  avl_tree_valid g -> avl_vvalid g p ->
  (0<avl_model_balance_factor g p -> avl_vvalid g (avl_ptr_of (avl_left g p))) /\
  (avl_model_balance_factor g p<0 -> avl_vvalid g (avl_ptr_of (avl_right g p))).
Proof.
  intros g p T V.
  pose proof (avl_child_nonnegative__left_rotation_graph_refinement g p (avl_left g p) T V (or_introl eq_refl)) as L.
  pose proof (avl_child_nonnegative__left_rotation_graph_refinement g p (avl_right g p) T V (or_intror eq_refl)) as R.
  unfold avl_model_balance_factor. split;intro F.
  - destruct (avl_left g p) as [q|] eqn:C; [simpl avl_ptr_of; eapply avl_graph_child_valid__root_and_factor_setup;[exact (proj1 T)|exact V|auto]|simpl avl_child_height in F;lia].
  - destruct (avl_right g p) as [q|] eqn:C; [simpl avl_ptr_of; eapply avl_graph_child_valid__root_and_factor_setup;[exact (proj1 T)|exact V|auto]|simpl avl_child_height in F;lia].
Qed.
Lemma crtos_equiv_rotate_lr__crtos_insert_composition : forall a b p,
  crtos_graph_equiv a b -> avl_vvalid a p ->
  avl_vvalid a (avl_ptr_of (avl_left a p)) ->
  avl_vvalid a (avl_ptr_of (avl_right a (avl_ptr_of (avl_left a p)))) ->
  (forall x y,avl_left a x=Some y \/ avl_right a x=Some y -> avl_vvalid a y) ->
  crtos_graph_equiv (crtos_rotate_lr a p) (crtos_rotate_lr b p).
Proof.
  intros a b p E V L Q Cl. pose proof (proj1 (proj2 (proj2 (proj2 E)))) as C.
  unfold crtos_rotate_lr. rewrite <- (proj1 (C p)), <- (proj2 (C (avl_ptr_of (avl_left a p)))).
  pose proof (crtos_equiv_rotate_left__crtos_insert_composition a b (avl_ptr_of (avl_left a p)) E L Cl) as [E1 C1].
  exact (proj1 (crtos_equiv_rotate_right__crtos_insert_composition _ _ p
    (crtos_equiv_set_left__crtos_insert_composition _ _ p (Some (avl_ptr_of (avl_right a (avl_ptr_of (avl_left a p))))) E1) V
    (crtos_closed_set_left__crtos_insert_composition _ p (Some (avl_ptr_of (avl_right a (avl_ptr_of (avl_left a p))))) C1 ltac:(intros y Y;inversion Y;subst;exact Q)))).
Qed.
Lemma crtos_equiv_rotate_rl__crtos_insert_composition : forall a b p,
  crtos_graph_equiv a b -> avl_vvalid a p ->
  avl_vvalid a (avl_ptr_of (avl_right a p)) ->
  avl_vvalid a (avl_ptr_of (avl_left a (avl_ptr_of (avl_right a p)))) ->
  (forall x y,avl_left a x=Some y \/ avl_right a x=Some y -> avl_vvalid a y) ->
  crtos_graph_equiv (crtos_rotate_rl a p) (crtos_rotate_rl b p).
Proof.
  intros a b p E V L Q Cl. pose proof (proj1 (proj2 (proj2 (proj2 E)))) as C.
  unfold crtos_rotate_rl. rewrite <- (proj2 (C p)), <- (proj1 (C (avl_ptr_of (avl_right a p)))).
  pose proof (crtos_equiv_rotate_right__crtos_insert_composition a b (avl_ptr_of (avl_right a p)) E L Cl) as [E1 C1].
  exact (proj1 (crtos_equiv_rotate_left__crtos_insert_composition _ _ p
    (crtos_equiv_set_right__crtos_insert_composition _ _ p (Some (avl_ptr_of (avl_left a (avl_ptr_of (avl_right a p))))) E1) V
    (crtos_closed_set_right__crtos_insert_composition _ p (Some (avl_ptr_of (avl_left a (avl_ptr_of (avl_right a p))))) C1 ltac:(intros y Y;inversion Y;subst;exact Q)))).
Qed.
Lemma crtos_equiv_balance__crtos_insert_composition : forall a b p,
  crtos_graph_equiv a b -> avl_tree_valid a -> avl_vvalid a p ->
  crtos_graph_equiv (crtos_balance_model a p) (crtos_balance_model b p) /\
  crtos_balance_ptr a p=crtos_balance_ptr b p.
Proof.
  intros a b p E T V. pose proof (crtos_tree_closed__crtos_insert_composition a T) as Cl.
  pose proof (proj1 (proj2 (proj2 (proj2 E)))) as C.
  assert (F:forall x,avl_model_balance_factor a x=avl_model_balance_factor b x).
  { intro x;exact (proj2 (crtos_equiv_heightvalue__crtos_insert_composition a b E Cl x)). }
  unfold crtos_balance_model,crtos_balance_ptr.
  rewrite <-F. destruct (Z_lt_dec 1 (avl_model_balance_factor a p)) as [Hi|Hi].
  - rewrite <- (proj1 (C p)), <-F.
    pose proof (proj1 (crtos_factor_children__crtos_insert_composition a p T V) ltac:(lia)) as L.
    destruct (Z_le_dec 0 (avl_model_balance_factor a (avl_ptr_of (avl_left a p)))) as [Pos|Neg].
    + split; [exact (proj1 (crtos_equiv_rotate_right__crtos_insert_composition a b p E V Cl))|reflexivity].
    + split.
      * apply crtos_equiv_rotate_lr__crtos_insert_composition;auto.
        apply (proj2 (crtos_factor_children__crtos_insert_composition a _ T L));lia.
      * rewrite (proj2 (C (avl_ptr_of (avl_left a p))));reflexivity.
  - destruct (Z_lt_dec (avl_model_balance_factor a p) (-1)) as [Lo|Lo].
    + rewrite <- (proj2 (C p)), <-F.
      pose proof (proj2 (crtos_factor_children__crtos_insert_composition a p T V) ltac:(lia)) as L.
      destruct (Z_le_dec (avl_model_balance_factor a (avl_ptr_of (avl_right a p))) 0) as [Neg|Pos].
      * split; [exact (proj1 (crtos_equiv_rotate_left__crtos_insert_composition a b p E V Cl))|reflexivity].
      * split.
        -- apply crtos_equiv_rotate_rl__crtos_insert_composition;auto.
           apply (proj1 (crtos_factor_children__crtos_insert_composition a _ T L));lia.
        -- rewrite (proj1 (C (avl_ptr_of (avl_right a p))));reflexivity.
    + auto.
Qed.
Lemma crtos_equiv_tree__crtos_insert_composition : forall a b,
  crtos_graph_equiv a b -> avl_tree_valid a -> avl_tree_valid b.
Proof.
  intros a b E Ga. pose proof E as Efull. destruct E as [R [P [V [C K]]]].
  rename Efull into E.
  pose proof (GraphLib.examples.bst.bst_binary_tree _ (proj1 Ga)) as Ta.
  assert (Path:forall x y, avl_reachable a x y <-> avl_reachable b x y)
    by (apply crtos_equiv_path__crtos_insert_composition;exact E).
  assert (Child:forall x c, avl_vvalid a x ->
    (avl_left a x=Some c \/ avl_right a x=Some c) -> avl_vvalid a c)
    by (intros; eapply avl_graph_child_valid__root_and_factor_setup; eauto;exact (proj1 Ga)).
  assert (HL:forall x, avl_vvalid a x ->
    avl_child_height b (avl_left b x)=avl_child_height a (avl_left a x)).
  { intros x X. rewrite <- (proj1 (C x)). symmetry.
    apply crtos_equiv_childheight__crtos_insert_composition; [exact E|].
    intros c H;apply (Child x c X);auto. }
  assert (HR:forall x, avl_vvalid a x ->
    avl_child_height b (avl_right b x)=avl_child_height a (avl_right a x)).
  { intros x X. rewrite <- (proj2 (C x)). symmetry.
    apply crtos_equiv_childheight__crtos_insert_composition; [exact E|].
    intros c H;apply (Child x c X);auto. }
  unfold avl_tree_valid. split.
  - constructor.
    + constructor.
      * intros x Root. apply V. apply (GraphLib.examples.bst.root_valid _ Ta).
        change (avl_root a=Some x). rewrite R;exact Root.
      * intros x r Root. change (avl_root b=Some r) in Root.
        rewrite <- R in Root. pose proof (GraphLib.examples.bst.root_no_parents _ Ta x r Root) as [L Q].
        change (~avl_left b x=Some r /\ ~avl_right b x=Some r).
        rewrite <- (proj1 (C x)),<- (proj2 (C x));auto.
      * intros y x1 x2 X1 X2 C1 C2.
        apply (GraphLib.examples.bst.father_unique _ Ta y x1 x2).
        -- apply V;exact X1.
        -- apply V;exact X2.
        -- change (avl_left a x1=Some y \/ avl_right a x1=Some y).
           rewrite (proj1 (C x1)),(proj2 (C x1));exact C1.
        -- change (avl_left a x2=Some y \/ avl_right a x2=Some y).
           rewrite (proj1 (C x2)),(proj2 (C x2));exact C2.
      * intros x y X Edge. apply V. apply (Child x y).
        -- apply V;exact X.
        -- rewrite (proj1 (C x)),(proj2 (C x));exact Edge.
      * intros x X. assert (Xa:~avl_vvalid a x) by (intro H;apply X;apply V;exact H).
        pose proof (GraphLib.examples.bst.invalid_child_is_none _ Ta x Xa) as [L Q].
        change (avl_left b x=None /\ avl_right b x=None).
        rewrite <- (proj1 (C x)), <- (proj2 (C x));auto.
      * intros x y z X Y Z L Q. eapply (GraphLib.examples.bst.child_distinct _ Ta x y z).
        -- apply V;exact X.
        -- apply V;exact Y.
        -- apply V;exact Z.
        -- change (avl_left a x=Some y);rewrite (proj1 (C x));exact L.
        -- change (avl_right a x=Some z);rewrite (proj2 (C x));exact Q.
      * intros x X. apply V in X.
        pose proof (GraphLib.examples.bst.path_exists _ Ta x X) as [r [Root Reach]].
        exists r. split.
        -- change (avl_root b=Some r). rewrite <-R;exact Root.
        -- apply Path;exact Reach.
      * intros x X. eapply Permutation_in; [exact P|].
        apply (GraphLib.examples.bst.finite_vertices _ Ta). apply V;exact X.
      * intros x X. apply V. apply (GraphLib.examples.bst.listV_sound _ Ta).
        eapply Permutation_in; [symmetry;exact P|exact X].
      * eapply Permutation_NoDup; [exact P|exact (GraphLib.examples.bst.listV_NoDup _ Ta)].
    + intros x y X [c [L Reach]].
      assert (Xa:avl_vvalid a x) by (apply V;exact X).
      assert (La:avl_left a x=Some c) by (rewrite (proj1 (C x));exact L).
      assert (Pa:avl_reachable a c y) by (apply Path;exact Reach).
      assert (Ya:avl_vvalid a y).
      { eapply GraphLib.examples.bst.bt_path_end_valid_early; [exact Ta|apply (Child x c Xa);auto|exact Pa]. }
      change (avl_key_of b y<avl_key_of b x).
      rewrite <-(proj1 (K x Xa)),<-(proj1 (K y Ya)).
      apply (GraphLib.examples.bst.bst_left_order _ (proj1 Ga) x y Xa). exists c;auto.
    + intros x y X [c [L Reach]].
      assert (Xa:avl_vvalid a x) by (apply V;exact X).
      assert (La:avl_right a x=Some c) by (rewrite (proj2 (C x));exact L).
      assert (Pa:avl_reachable a c y) by (apply Path;exact Reach).
      assert (Ya:avl_vvalid a y).
      { eapply GraphLib.examples.bst.bt_path_end_valid_early; [exact Ta|apply (Child x c Xa);auto|exact Pa]. }
      change (avl_key_of b x<avl_key_of b y).
      rewrite <-(proj1 (K x Xa)),<-(proj1 (K y Ya)).
      apply (GraphLib.examples.bst.bst_right_order _ (proj1 Ga) x y Xa). exists c;auto.
  - split.
    + intros x X. apply V in X.
      rewrite <-(proj2 (K x X)),HL,HR by exact X.
      exact (proj1 (proj2 Ga) x X).
    + intros x X. apply (proj2 (proj2 Ga)). apply V;exact X.
Qed.
Lemma crtos_bst_closed__crtos_insert_composition : forall g,
  avl_bst_valid g -> forall x c,avl_left g x=Some c \/ avl_right g x=Some c -> avl_vvalid g c.
Proof.
  intros g T x c C. destruct (classic (avl_vvalid g x)) as [X|X].
  - eapply avl_graph_child_valid__root_and_factor_setup;eauto.
  - pose proof (GraphLib.examples.bst.invalid_child_is_none _ (GraphLib.examples.bst.bst_binary_tree _ T) x X) as [L R].
    change (avl_left g x=None) in L. change (avl_right g x=None) in R.
    destruct C;congruence.
Qed.
Lemma crtos_restore_cache__crtos_insert_composition : forall g p cache,
  avl_bst_valid g -> avl_root g=Some p ->
  avl_height_of g p=crtos_height_value g p ->
  crtos_update_height (avl_with_root_cache g p cache) p=g /\
  crtos_height_value (avl_with_root_cache g p cache) p=avl_height_of g p.
Proof.
  intros g p cache T R Hp.
  pose proof (GraphLib.examples.bst.root_no_parents _ (GraphLib.examples.bst.bst_binary_tree _ T) p p R) as [Nl Nr].
  assert (CH:forall c,c<>Some p -> avl_child_height (avl_with_root_cache g p cache) c=avl_child_height g c).
  { intros [x|] C; [|reflexivity]. unfold avl_child_height,avl_with_root_cache,avl_height_update;simpl.
    destruct (Z.eq_dec x p);congruence. }
  assert (Hv:crtos_height_value (avl_with_root_cache g p cache) p=avl_height_of g p).
  { unfold crtos_height_value. change (avl_left (avl_with_root_cache g p cache) p) with (avl_left g p).
    change (avl_right (avl_with_root_cache g p cache) p) with (avl_right g p).
    rewrite !CH by assumption. symmetry;exact Hp. }
  split; [|exact Hv]. unfold crtos_update_height. rewrite Hv.
  transitivity (avl_with_root_cache g p (avl_height_of g p)); [|apply avl_cache_self__lr_graph_composition].
  unfold avl_with_root_cache;simpl;f_equal. apply functional_extensionality;intro x.
  unfold avl_height_update;destruct (Z.eq_dec x p);reflexivity.
Qed.
Lemma crtos_join_final_setup__crtos_insert_composition : forall before raw p l r,
  p<>0 -> avl_gvalid l -> avl_gvalid r ->
  ~avl_vvalid l p -> ~avl_vvalid r p ->
  (forall x,avl_vvalid l x -> ~avl_vvalid r x) ->
  (forall x,avl_vvalid l x ->avl_key_of l x<avl_key_of before p) ->
  (forall x,avl_vvalid r x ->avl_key_of before p<avl_key_of r x) ->
  crtos_graph_equiv raw (crtos_join_cached before p l r) -> crtos_update_ready raw p ->
  avl_tree_valid (avl_join_model p (avl_key_of before p) l r) /\
  crtos_update_height (crtos_join_cached before p l r) p=avl_join_model p (avl_key_of before p) l r /\
  crtos_graph_equiv (avl_join_model p (avl_key_of before p) l r) (crtos_update_height raw p).
Proof.
  intros before raw p l r N Gl Gr Nl Nr Dj Kl Kr E U.
  pose proof (avl_gvalid_tree_valid _ Gl) as Tl. pose proof (avl_gvalid_tree_valid _ Gr) as Tr.
  pose proof (avl_join_bst__insert_projection_graft p (avl_key_of before p) l r Tl Tr Nl Nr Dj Kl Kr) as Bst.
  set (j:=avl_join_model p (avl_key_of before p) l r).
  assert (Hj:avl_height_of j p=crtos_height_value j p).
  { unfold crtos_height_value. pose proof (avl_join_root_fields__insert_projection_graft p (avl_key_of before p) l r) as [L [R [K H]]].
    unfold j. rewrite L,R,H.
    rewrite (avl_join_left_child_height__insert_projection_graft p _ l r (avl_root l) Nl
      (GraphLib.examples.bst.root_valid _ (GraphLib.examples.bst.bst_binary_tree _ (proj1 Tl)))).
    rewrite (avl_join_right_child_height__insert_projection_graft p _ l r (avl_root r) Nr Dj
      (GraphLib.examples.bst.root_valid _ (GraphLib.examples.bst.bst_binary_tree _ (proj1 Tr)))). reflexivity. }
  pose proof (crtos_restore_cache__crtos_insert_composition j p (avl_height_of before p) Bst eq_refl Hj) as [Norm Hv].
  pose proof (crtos_equiv_sym__crtos_insert_composition _ _ E) as Er.
  pose proof (crtos_bst_closed__crtos_insert_composition j Bst) as Cl.
  assert (Hraw:crtos_height_value raw p=avl_height_of j p).
  { rewrite <- (proj1 (crtos_equiv_heightvalue__crtos_insert_composition _ _ Er Cl p)). exact Hv. }
  assert (Bound:Z.max (avl_child_height l (avl_root l)) (avl_child_height r (avl_root r))+1<=UINT_MAX).
  { pose proof (proj2 (proj2 (proj2 (proj2 U)))) as B. rewrite Hraw in B.
    pose proof (proj2 (proj2 (proj2 (avl_join_root_fields__insert_projection_graft p (avl_key_of before p) l r)))) as Hjroot.
    fold j in Hjroot. lia. }
  split.
  - apply (proj1 (crtos_join_valid__crtos_insert_composition p _ l r N Tl Tr
      (proj1 (proj2 (proj2 Gl))) (proj1 (proj2 (proj2 Gr))) Nl Nr Dj Kl Kr Bound)).
  - split; [exact Norm|]. pose proof (crtos_equiv_update__crtos_insert_composition _ _ p Er Cl) as Eu.
    unfold crtos_join_cached in Eu. fold j in Eu. rewrite Norm in Eu. exact Eu.
Qed.
Lemma crtos_rotate_left_frame__crtos_insert_composition : forall g p x,
  x<>p -> x<>avl_ptr_of (avl_right g p) ->
  avl_left (crtos_rotate_left g p) x=avl_left g x /\ avl_right (crtos_rotate_left g p) x=avl_right g x.
Proof.
  intros g p x X Q.
  change ((if Z.eq_dec x (avl_ptr_of (avl_right g p)) then Some p else avl_left g x)=avl_left g x /\
    (if Z.eq_dec x p then avl_left g (avl_ptr_of (avl_right g p)) else avl_right g x)=avl_right g x).
  destruct (Z.eq_dec x (avl_ptr_of (avl_right g p)));[contradiction|].
  destruct (Z.eq_dec x p);[contradiction|auto].
Qed.
Lemma crtos_rotate_right_frame__crtos_insert_composition : forall g p x,
  x<>p -> x<>avl_ptr_of (avl_left g p) ->
  avl_left (crtos_rotate_right g p) x=avl_left g x /\ avl_right (crtos_rotate_right g p) x=avl_right g x.
Proof.
  intros g p x X Q.
  change ((if Z.eq_dec x p then avl_right g (avl_ptr_of (avl_left g p)) else avl_left g x)=avl_left g x /\
    (if Z.eq_dec x (avl_ptr_of (avl_left g p)) then Some p else avl_right g x)=avl_right g x).
  destruct (Z.eq_dec x (avl_ptr_of (avl_left g p)));[contradiction|].
  destruct (Z.eq_dec x p);[contradiction|auto].
Qed.
Lemma crtos_rotate_lr_frame__crtos_insert_composition : forall g p x,
  x<>p -> x<>avl_ptr_of (avl_left g p) -> x<>avl_ptr_of (avl_right g (avl_ptr_of (avl_left g p))) ->
  avl_left (crtos_rotate_lr g p) x=avl_left g x /\ avl_right (crtos_rotate_lr g p) x=avl_right g x.
Proof.
  intros g p x X L Q. unfold crtos_rotate_lr.
  set (l:=avl_ptr_of (avl_left g p)). set (q:=avl_ptr_of (avl_right g l)).
  assert (C:avl_ptr_of (avl_left (crtos_set_left (crtos_rotate_left g l) p (Some q)) p)=q).
  { change (avl_ptr_of (if Z.eq_dec p p then Some q else avl_left (crtos_rotate_left g l) p)=q). destruct (Z.eq_dec p p);[reflexivity|contradiction]. }
  pose proof (crtos_rotate_right_frame__crtos_insert_composition (crtos_set_left (crtos_rotate_left g l) p (Some q)) p x X ltac:(rewrite C;exact Q)) as [A B].
  rewrite A,B. change ((if Z.eq_dec x p then Some q else avl_left (crtos_rotate_left g l) x)=avl_left g x /\ avl_right (crtos_rotate_left g l) x=avl_right g x).
  destruct (Z.eq_dec x p);[contradiction|]. apply crtos_rotate_left_frame__crtos_insert_composition;assumption.
Qed.
Lemma crtos_rotate_rl_frame__crtos_insert_composition : forall g p x,
  x<>p -> x<>avl_ptr_of (avl_right g p) -> x<>avl_ptr_of (avl_left g (avl_ptr_of (avl_right g p))) ->
  avl_left (crtos_rotate_rl g p) x=avl_left g x /\ avl_right (crtos_rotate_rl g p) x=avl_right g x.
Proof.
  intros g p x X L Q. unfold crtos_rotate_rl.
  set (l:=avl_ptr_of (avl_right g p)). set (q:=avl_ptr_of (avl_left g l)).
  assert (C:avl_ptr_of (avl_right (crtos_set_right (crtos_rotate_right g l) p (Some q)) p)=q).
  { change (avl_ptr_of (if Z.eq_dec p p then Some q else avl_right (crtos_rotate_right g l) p)=q). destruct (Z.eq_dec p p);[reflexivity|contradiction]. }
  pose proof (crtos_rotate_left_frame__crtos_insert_composition (crtos_set_right (crtos_rotate_right g l) p (Some q)) p x X ltac:(rewrite C;exact Q)) as [A B].
  rewrite A,B. change (avl_left (crtos_rotate_right g l) x=avl_left g x /\ (if Z.eq_dec x p then Some q else avl_right (crtos_rotate_right g l) x)=avl_right g x).
  destruct (Z.eq_dec x p);[contradiction|]. apply crtos_rotate_right_frame__crtos_insert_composition;assumption.
Qed.
Lemma crtos_balance_invalid__crtos_insert_composition : forall g p,
  avl_tree_valid g -> avl_vvalid g p -> forall x,~avl_vvalid g x ->
  avl_left (crtos_balance_model g p) x=None /\ avl_right (crtos_balance_model g p) x=None.
Proof.
  intros g p T V x X.
  assert (Np:x<>p) by (intro E;subst;contradiction).
  pose proof (GraphLib.examples.bst.invalid_child_is_none _ (GraphLib.examples.bst.bst_binary_tree _ (proj1 T)) x X) as [L R].
  change (avl_left g x=None) in L. change (avl_right g x=None) in R.
  unfold crtos_balance_model.
  destruct (Z_lt_dec 1 (avl_model_balance_factor g p)) as [Hi|Hi].
  - pose proof (proj1 (crtos_factor_children__crtos_insert_composition g p T V) ltac:(lia)) as Vl.
    assert (Nl:x<>avl_ptr_of (avl_left g p)) by (intro E;subst;contradiction).
    destruct (Z_le_dec 0 (avl_model_balance_factor g (avl_ptr_of (avl_left g p)))) as [Pos|Neg].
    + pose proof (crtos_rotate_right_frame__crtos_insert_composition g p x Np Nl);congruence.
    + pose proof (proj2 (crtos_factor_children__crtos_insert_composition g _ T Vl) ltac:(lia)) as Vq.
      assert (Nq:x<>avl_ptr_of (avl_right g (avl_ptr_of (avl_left g p)))) by (intro E;subst;contradiction).
      pose proof (crtos_rotate_lr_frame__crtos_insert_composition g p x Np Nl Nq);congruence.
  - destruct (Z_lt_dec (avl_model_balance_factor g p) (-1)) as [Lo|Lo];[|auto].
    pose proof (proj2 (crtos_factor_children__crtos_insert_composition g p T V) ltac:(lia)) as Vr.
    assert (Nr:x<>avl_ptr_of (avl_right g p)) by (intro E;subst;contradiction).
    destruct (Z_le_dec (avl_model_balance_factor g (avl_ptr_of (avl_right g p))) 0) as [Neg|Pos].
    + pose proof (crtos_rotate_left_frame__crtos_insert_composition g p x Np Nr);congruence.
    + pose proof (proj1 (crtos_factor_children__crtos_insert_composition g _ T Vr) ltac:(lia)) as Vq.
      assert (Nq:x<>avl_ptr_of (avl_left g (avl_ptr_of (avl_right g p)))) by (intro E;subst;contradiction).
      pose proof (crtos_rotate_rl_frame__crtos_insert_composition g p x Np Nr Nq);congruence.
Qed.
Lemma crtos_rotate_left_root__crtos_insert_composition : forall g p,
  avl_root (crtos_rotate_left g p)=
  (if excluded_middle_informative (avl_root g=Some p) then Some (avl_ptr_of (avl_right g p)) else avl_root g).
Proof. reflexivity. Qed.
Lemma crtos_rotate_right_root__crtos_insert_composition : forall g p,
  avl_root (crtos_rotate_right g p)=
  (if excluded_middle_informative (avl_root g=Some p) then Some (avl_ptr_of (avl_left g p)) else avl_root g).
Proof. reflexivity. Qed.
Lemma crtos_balance_root__crtos_insert_composition : forall g p,
  avl_tree_valid g -> avl_root g=Some p -> p<>0 ->
  avl_root (crtos_balance_model g p)=Some (crtos_balance_ptr g p).
Proof.
  intros g p T R N.
  pose proof (GraphLib.examples.bst.root_no_parents _ (GraphLib.examples.bst.bst_binary_tree _ (proj1 T)) p p R) as [Nl Nr].
  assert (L:avl_ptr_of (avl_left g p)<>p).
  { destruct (avl_left g p) as [x|] eqn:E;simpl;[intro Q;subst;contradiction|unfold NULL;lia]. }
  assert (Q:avl_ptr_of (avl_right g p)<>p).
  { destruct (avl_right g p) as [x|] eqn:E;simpl;[intro P;subst;contradiction|unfold NULL;lia]. }
  unfold crtos_balance_model,crtos_balance_ptr.
  destruct (Z_lt_dec 1 (avl_model_balance_factor g p)).
  - destruct (Z_le_dec 0 (avl_model_balance_factor g (avl_ptr_of (avl_left g p)))).
    + rewrite crtos_rotate_right_root__crtos_insert_composition,R. destruct (excluded_middle_informative (Some p=Some p));congruence.
    + unfold crtos_rotate_lr. rewrite crtos_rotate_right_root__crtos_insert_composition.
      change (avl_root (crtos_set_left (crtos_rotate_left g (avl_ptr_of (avl_left g p))) p (Some (avl_ptr_of (avl_right g (avl_ptr_of (avl_left g p))))))) with (avl_root (crtos_rotate_left g (avl_ptr_of (avl_left g p)))).
      rewrite crtos_rotate_left_root__crtos_insert_composition,R.
      destruct (excluded_middle_informative (Some p=Some (avl_ptr_of (avl_left g p))));[congruence|].
      destruct (excluded_middle_informative (Some p=Some p));[|congruence].
      change (Some (avl_ptr_of (if Z.eq_dec p p then Some (avl_ptr_of (avl_right g (avl_ptr_of (avl_left g p)))) else avl_left (crtos_rotate_left g (avl_ptr_of (avl_left g p))) p))=Some (avl_ptr_of (avl_right g (avl_ptr_of (avl_left g p))))).
      destruct (Z.eq_dec p p);[reflexivity|contradiction].
  - destruct (Z_lt_dec (avl_model_balance_factor g p) (-1));[|exact R].
    destruct (Z_le_dec (avl_model_balance_factor g (avl_ptr_of (avl_right g p))) 0).
    + rewrite crtos_rotate_left_root__crtos_insert_composition,R. destruct (excluded_middle_informative (Some p=Some p));congruence.
    + unfold crtos_rotate_rl. rewrite crtos_rotate_left_root__crtos_insert_composition.
      change (avl_root (crtos_set_right (crtos_rotate_right g (avl_ptr_of (avl_right g p))) p (Some (avl_ptr_of (avl_left g (avl_ptr_of (avl_right g p))))))) with (avl_root (crtos_rotate_right g (avl_ptr_of (avl_right g p)))).
      rewrite crtos_rotate_right_root__crtos_insert_composition,R.
      destruct (excluded_middle_informative (Some p=Some (avl_ptr_of (avl_right g p))));[congruence|].
      destruct (excluded_middle_informative (Some p=Some p));[|congruence].
      change (Some (avl_ptr_of (if Z.eq_dec p p then Some (avl_ptr_of (avl_left g (avl_ptr_of (avl_right g p)))) else avl_right (crtos_rotate_right g (avl_ptr_of (avl_right g p))) p))=Some (avl_ptr_of (avl_left g (avl_ptr_of (avl_right g p))))).
      destruct (Z.eq_dec p p);[reflexivity|contradiction].
Qed.
Lemma crtos_subtree_whole__crtos_insert_composition : forall g p,
  avl_root g=Some p -> crtos_raw_domain g -> NoDup (avl_nodes g) ->
  (forall x,avl_vvalid g x ->avl_reachable g p x) ->
  (forall x,~avl_vvalid g x ->avl_left g x=None /\ avl_right g x=None) ->
  crtos_graph_equiv (avl_subtree_model g p) g.
Proof.
  intros g p R D Nd Reach Invalid.
  split; [symmetry;exact R|].
  split.
  - change (Permutation (GraphLib.graph_basic.valid_NoDup_list (avl_reachable g p) (avl_nodes g)) (avl_nodes g)).
    rewrite valid_NoDup_list_all__mapping_refinement;auto. intros x X;apply Reach;apply D;exact X.
  - split.
    + intro x. change (avl_vvalid g x /\ avl_reachable g p x <->avl_vvalid g x). split; [tauto|intro X;split;auto].
    + split.
      * intro x. destruct (classic (avl_reachable g p x)) as [P|P].
        -- apply avl_projection_children__lr_graph_composition;exact P.
        -- assert (X:~avl_vvalid g x) by (intro V;apply P;apply Reach;exact V).
           pose proof (Invalid x X) as [L Q]. unfold avl_left,avl_right,avl_subtree_model;simpl.
           destruct (excluded_middle_informative (avl_reachable g p x));[contradiction|]. split;symmetry;assumption.
      * intros x X;split;reflexivity.
Qed.
Lemma crtos_balance_whole_effect__crtos_insert_composition : forall g a p ret,
  avl_tree_valid g -> avl_root g=Some p -> p<>0 ->
  crtos_balance_effect g a p ret -> avl_gvalid a /\ avl_root a=Some ret.
Proof.
  intros g a p ret T R N Eff.
  destruct Eff as [Model [Ret [Nr [Nodes [Dom [Keys [Ga [SubDom [Heights Identity]]]]]]]]].
  pose proof (GraphLib.examples.bst.bst_binary_tree _ (proj1 T)) as Bt.
  pose proof (GraphLib.examples.bst.root_valid _ Bt p R) as V.
  assert (Ra:avl_root a=Some ret).
  { rewrite Model,Ret. apply crtos_balance_root__crtos_insert_composition;assumption. }
  assert (Reach:forall x,avl_vvalid a x -> avl_reachable a ret x).
  { intros x X. apply Dom in X.
    assert (Pg:avl_reachable g p x).
    { destruct (GraphLib.examples.bst.path_exists _ Bt x X) as [q [Rq Pq]].
      change (avl_root g=Some q) in Rq. rewrite R in Rq;inversion Rq;subst;exact Pq. }
    assert (S:avl_vvalid (avl_subtree_model g p) x) by (split;assumption).
    apply SubDom in S. exact (proj2 S). }
  assert (Da:crtos_raw_domain a).
  { intro x. rewrite Dom,Nodes. apply crtos_valid_domain__crtos_insert_composition;exact T. }
  assert (Na:NoDup (avl_nodes a)) by (rewrite Nodes;exact (GraphLib.examples.bst.listV_NoDup _ Bt)).
  assert (Ia:forall x,~avl_vvalid a x ->avl_left a x=None /\ avl_right a x=None).
  { intros x X. rewrite Model. apply crtos_balance_invalid__crtos_insert_composition;auto.
    intro Y;apply X;apply Dom;exact Y. }
  split; [|exact Ra]. eapply crtos_equiv_gvalid__crtos_insert_composition; [|exact Ga].
  apply crtos_subtree_whole__crtos_insert_composition;assumption.
Qed.
Lemma crtos_cached_join_equiv__crtos_insert_composition : forall p key cache l1 l2 r1 r2,
  crtos_graph_equiv l1 l2 -> crtos_graph_equiv r1 r2 ->
  crtos_graph_equiv (avl_with_root_cache (avl_join_model p key l1 r1) p cache)
    (avl_with_root_cache (avl_join_model p key l2 r2) p cache).
Proof.
  intros p key cache l1 l2 r1 r2 [Rl [Pl [Vl [Cl Kl]]]] [Rr [Pr [Vr [Cr Kr]]]].
  split; [reflexivity|]. split.
  - change (Permutation (p::avl_nodes l1++avl_nodes r1) (p::avl_nodes l2++avl_nodes r2)).
    apply perm_skip. apply Permutation_app;assumption.
  - split.
    + intro x. change (x=p \/ avl_vvalid l1 x \/ avl_vvalid r1 x <-> x=p \/ avl_vvalid l2 x \/ avl_vvalid r2 x). rewrite Vl,Vr;reflexivity.
    + split.
      * intro x. change (avl_left (avl_join_model p key l1 r1) x=avl_left (avl_join_model p key l2 r2) x /\ avl_right (avl_join_model p key l1 r1) x=avl_right (avl_join_model p key l2 r2) x).
        destruct (Z.eq_dec x p) as [E|N].
        -- subst x. rewrite (proj1 (avl_join_root_fields__insert_projection_graft p key l1 r1)),(proj1 (avl_join_root_fields__insert_projection_graft p key l2 r2)),(proj1 (proj2 (avl_join_root_fields__insert_projection_graft p key l1 r1))),(proj1 (proj2 (avl_join_root_fields__insert_projection_graft p key l2 r2)));auto.
        -- destruct (classic (avl_vvalid l1 x)) as [X|X].
           ++ pose proof (avl_join_left_fields__insert_projection_graft p key l1 r1 x N X) as [L1 [Q1 _]].
              pose proof (avl_join_left_fields__insert_projection_graft p key l2 r2 x N (proj1 (Vl x) X)) as [L2 [Q2 _]]. rewrite L1,L2,Q1,Q2;apply Cl.
           ++ assert (X2:~avl_vvalid l2 x) by (rewrite <-Vl;exact X).
              pose proof (avl_join_right_fields__insert_projection_graft p key l1 r1 x N X) as [L1 [Q1 _]].
              pose proof (avl_join_right_fields__insert_projection_graft p key l2 r2 x N X2) as [L2 [Q2 _]]. rewrite L1,L2,Q1,Q2;apply Cr.
      * intros x X. change (x=p \/ avl_vvalid l1 x \/ avl_vvalid r1 x) in X.
        change (avl_key_of (avl_join_model p key l1 r1) x=avl_key_of (avl_join_model p key l2 r2) x /\ avl_height_update (avl_height_of (avl_join_model p key l1 r1)) p cache x=avl_height_update (avl_height_of (avl_join_model p key l2 r2)) p cache x).
        unfold avl_height_update. destruct (Z.eq_dec x p) as [E|N].
        -- subst x. pose proof (avl_join_root_fields__insert_projection_graft p key l1 r1) as [_ [_ [K1 _]]].
           pose proof (avl_join_root_fields__insert_projection_graft p key l2 r2) as [_ [_ [K2 _]]]. split;congruence.
        -- destruct (classic (avl_vvalid l1 x)) as [Y|Y].
           ++ pose proof (avl_join_left_fields__insert_projection_graft p key l1 r1 x N Y) as [_ [_ [K1 H1]]].
              pose proof (avl_join_left_fields__insert_projection_graft p key l2 r2 x N (proj1 (Vl x) Y)) as [_ [_ [K2 H2]]]. rewrite K1,K2,H1,H2;apply Kl;exact Y.
           ++ assert (Y2:~avl_vvalid l2 x) by (rewrite <-Vl;exact Y).
              pose proof (avl_join_right_fields__insert_projection_graft p key l1 r1 x N Y) as [_ [_ [K1 H1]]].
              pose proof (avl_join_right_fields__insert_projection_graft p key l2 r2 x N Y2) as [_ [_ [K2 H2]]]. rewrite K1,K2,H1,H2;apply Kr;tauto.
Qed.
Lemma crtos_cached_reconstruct__crtos_insert_composition : forall g p,
  avl_gvalid g -> avl_root g=Some p -> p<>0 ->
  crtos_graph_equiv (crtos_join_cached g p (avl_child_model g (avl_left g p)) (avl_child_model g (avl_right g p))) g.
Proof.
  intros g p G Root N.
  assert (R:p=avl_ptr_of (avl_root g)) by (rewrite Root;reflexivity).
  pose proof (crtos_root_partition__crtos_insert_composition g p G R N) as [Gl [Gr [Nl [Nr [Dj [Part Perm]]]]]].
  set (l:=avl_child_model g (avl_left g p)). set (r:=avl_child_model g (avl_right g p)).
  fold l r in Gl,Gr,Nl,Nr,Dj,Part,Perm. unfold crtos_graph_equiv.
  split; [symmetry;exact Root|]. split; [symmetry;exact Perm|].
  split; [intro x;symmetry;apply Part|]. split.
  - intro x. change (avl_left (avl_join_model p (avl_key_of g p) l r) x=avl_left g x /\ avl_right (avl_join_model p (avl_key_of g p) l r) x=avl_right g x).
    destruct (Z.eq_dec x p) as [E|Nx].
    + subst x. pose proof (avl_join_root_fields__insert_projection_graft p (avl_key_of g p) l r) as [L [Q _]]. rewrite L,Q.
      split;apply (proj1 (avl_child_root__insert_projection_graft g _)).
    + destruct (classic (avl_vvalid l x)) as [Lx|Lx].
      * pose proof (avl_join_left_fields__insert_projection_graft p (avl_key_of g p) l r x Nx Lx) as [L [Q _]]. rewrite L,Q.
        exact (proj2 (proj2 (proj2 (crtos_child_fields__crtos_insert_composition g (avl_left g p) x Lx)))).
      * pose proof (avl_join_right_fields__insert_projection_graft p (avl_key_of g p) l r x Nx Lx) as [L [Q _]]. rewrite L,Q.
        destruct (classic (avl_vvalid r x)) as [Rx|Rx].
        -- exact (proj2 (proj2 (proj2 (crtos_child_fields__crtos_insert_composition g (avl_right g p) x Rx)))).
        -- assert (Ng:~avl_vvalid g x) by (rewrite Part;tauto).
           pose proof (GraphLib.examples.bst.invalid_child_is_none _ (GraphLib.examples.bst.bst_binary_tree _ (proj1 G)) x Ng) as [Lg Qg].
           pose proof (GraphLib.examples.bst.invalid_child_is_none _ (GraphLib.examples.bst.bst_binary_tree _ (proj1 Gr)) x Rx) as [Lr Qr].
           change (avl_left g x=None) in Lg. change (avl_right g x=None) in Qg.
           change (avl_left r x=None) in Lr. change (avl_right r x=None) in Qr. split;congruence.
  - intros x X. change (x=p \/ avl_vvalid l x \/ avl_vvalid r x) in X.
    change (avl_key_of (avl_join_model p (avl_key_of g p) l r) x=avl_key_of g x /\ avl_height_update (avl_height_of (avl_join_model p (avl_key_of g p) l r)) p (avl_height_of g p) x=avl_height_of g x).
    unfold avl_height_update. destruct (Z.eq_dec x p) as [E|Nx].
    + subst x. pose proof (avl_join_root_fields__insert_projection_graft p (avl_key_of g p) l r) as [_ [_ [K H]]];auto.
    + destruct (classic (avl_vvalid l x)) as [Lx|Lx].
      * pose proof (avl_join_left_fields__insert_projection_graft p (avl_key_of g p) l r x Nx Lx) as [_ [_ [K H]]]. rewrite K,H.
        pose proof (crtos_child_fields__crtos_insert_composition g (avl_left g p) x Lx) as [_ [Kx [Hx _]]];auto.
      * assert (Rx:avl_vvalid r x) by tauto.
        pose proof (avl_join_right_fields__insert_projection_graft p (avl_key_of g p) l r x Nx Lx) as [_ [_ [K H]]]. rewrite K,H.
        pose proof (crtos_child_fields__crtos_insert_composition g (avl_right g p) x Rx) as [_ [Kx [Hx _]]];auto.
Qed.
Lemma crtos_join_new_right__crtos_insert_composition : forall g p a key n,
  avl_gvalid g -> avl_root g=Some p -> p<>0 ->
  crtos_new_node_effect (avl_child_model g (avl_right g p)) a key n ->
  ~avl_vvalid a p ->
  (forall x,avl_vvalid (avl_child_model g (avl_left g p)) x -> ~avl_vvalid a x) ->
  crtos_new_node_effect g (avl_join_model p (avl_key_of g p) (avl_child_model g (avl_left g p)) a) key n.
Proof.
  intros g p a key n G Root N [Nn [Fresh [Dom [Key Preserve]]]] Na Dj.
  assert (R:p=avl_ptr_of (avl_root g)) by (rewrite Root;reflexivity).
  pose proof (crtos_root_partition__crtos_insert_composition g p G R N) as [Gl [Gr [Nl [Nr [OldDj [Part Perm]]]]]].
  set (l:=avl_child_model g (avl_left g p)). set (r:=avl_child_model g (avl_right g p)).
  fold l r in Dom,Fresh,Preserve,Dj,Part,Nl,Nr,OldDj.
  assert (Vn:avl_vvalid a n) by (apply Dom;auto).
  assert (Np:n<>p) by (intro E;subst;contradiction).
  assert (Nln:~avl_vvalid l n) by (intro X;exact (Dj n X Vn)).
  split; [exact Nn|]. split; [rewrite Part;tauto|]. split.
  - intro x. change (x=p \/ avl_vvalid l x \/ avl_vvalid a x <-> x=n \/ avl_vvalid g x).
    rewrite Dom,Part;tauto.
  - split.
    + pose proof (avl_join_right_fields__insert_projection_graft p (avl_key_of g p) l a n Np Nln) as [_ [_ [K _]]]. rewrite K;exact Key.
    + intros x X. apply Part in X. destruct (Z.eq_dec x p) as [E|Nx].
      * subst x;apply (proj1 (proj2 (proj2 (avl_join_root_fields__insert_projection_graft p (avl_key_of g p) l a)))).
      * destruct (classic (avl_vvalid l x)) as [Lx|Lx].
        -- pose proof (avl_join_left_fields__insert_projection_graft p (avl_key_of g p) l a x Nx Lx) as [_ [_ [K _]]]. rewrite K.
           exact (proj1 (proj2 (crtos_child_fields__crtos_insert_composition g (avl_left g p) x Lx))).
        -- assert (Rx:avl_vvalid r x) by tauto.
           pose proof (avl_join_right_fields__insert_projection_graft p (avl_key_of g p) l a x Nx Lx) as [_ [_ [K _]]]. rewrite K,Preserve by exact Rx.
           exact (proj1 (proj2 (crtos_child_fields__crtos_insert_composition g (avl_right g p) x Rx))).
Qed.
Lemma crtos_join_new_left__crtos_insert_composition : forall g p a key n,
  avl_gvalid g -> avl_root g=Some p -> p<>0 ->
  crtos_new_node_effect (avl_child_model g (avl_left g p)) a key n ->
  ~avl_vvalid a p ->
  (forall x,avl_vvalid a x -> ~avl_vvalid (avl_child_model g (avl_right g p)) x) ->
  crtos_new_node_effect g (avl_join_model p (avl_key_of g p) a (avl_child_model g (avl_right g p))) key n.
Proof.
  intros g p a key n G Root N [Nn [Fresh [Dom [Key Preserve]]]] Na Dj.
  assert (R:p=avl_ptr_of (avl_root g)) by (rewrite Root;reflexivity).
  pose proof (crtos_root_partition__crtos_insert_composition g p G R N) as [Gl [Gr [Nl [Nr [OldDj [Part Perm]]]]]].
  set (l:=avl_child_model g (avl_left g p)). set (r:=avl_child_model g (avl_right g p)).
  fold l r in Dom,Fresh,Preserve,Dj,Part,Nl,Nr,OldDj.
  assert (Vn:avl_vvalid a n) by (apply Dom;auto).
  assert (Np:n<>p) by (intro E;subst;contradiction).
  assert (Nrn:~avl_vvalid r n) by (exact (Dj n Vn)).
  split; [exact Nn|]. split; [rewrite Part;tauto|]. split.
  - intro x. change (x=p \/ avl_vvalid a x \/ avl_vvalid r x <-> x=n \/ avl_vvalid g x).
    rewrite Dom,Part;tauto.
  - split.
    + pose proof (avl_join_left_fields__insert_projection_graft p (avl_key_of g p) a r n Np Vn) as [_ [_ [K _]]]. rewrite K;exact Key.
    + intros x X. apply Part in X. destruct (Z.eq_dec x p) as [E|Nx].
      * subst x;apply (proj1 (proj2 (proj2 (avl_join_root_fields__insert_projection_graft p (avl_key_of g p) a r)))).
      * destruct X as [E|[Lx|Rx]];[contradiction| |].
        -- assert (Ax:avl_vvalid a x) by (apply Dom;auto).
           pose proof (avl_join_left_fields__insert_projection_graft p (avl_key_of g p) a r x Nx Ax) as [_ [_ [K _]]]. rewrite K,Preserve by exact Lx.
           exact (proj1 (proj2 (crtos_child_fields__crtos_insert_composition g (avl_left g p) x Lx))).
        -- assert (Ax:~avl_vvalid a x) by (intro H;exact (Dj x H Rx)).
           pose proof (avl_join_right_fields__insert_projection_graft p (avl_key_of g p) a r x Nx Ax) as [_ [_ [K _]]]. rewrite K.
           exact (proj1 (proj2 (crtos_child_fields__crtos_insert_composition g (avl_right g p) x Rx))).
Qed.
Lemma crtos_join_height_progress__crtos_insert_composition : forall g p l r,
  avl_gvalid g -> avl_root g=Some p ->
  avl_tree_valid l -> avl_tree_valid r ->
  ~avl_vvalid l p -> ~avl_vvalid r p ->
  (forall x,avl_vvalid l x ->~avl_vvalid r x) ->
  ((avl_child_height l (avl_root l)=avl_child_height g (avl_left g p) /\
      avl_child_height g (avl_right g p)<=avl_child_height r (avl_root r)<=avl_child_height g (avl_right g p)+1) \/
   (avl_child_height r (avl_root r)=avl_child_height g (avl_right g p) /\
      avl_child_height g (avl_left g p)<=avl_child_height l (avl_root l)<=avl_child_height g (avl_left g p)+1)) ->
  let j:=avl_join_model p (avl_key_of g p) l r in
  (avl_child_height g (avl_root g)<=avl_height_of j p<=avl_child_height g (avl_root g)+1) /\
  (avl_height_of j p=avl_child_height g (avl_root g) -> Z.abs (avl_model_balance_factor j p)<=1).
Proof.
  intros g p l r G Root Tl Tr Nl Nr Dj Inc j.
  pose proof (GraphLib.examples.bst.root_valid _ (GraphLib.examples.bst.bst_binary_tree _ (proj1 G)) p Root) as V.
  pose proof (proj2 (proj1 (proj2 G) p V)) as Hg.
  pose proof (proj1 (proj2 (proj2 G)) p V) as Bg. unfold avl_model_balance_factor in Bg.
  assert (I:(avl_child_height l (avl_root l)=avl_child_height g (avl_left g p) /\
    (avl_child_height r (avl_root r)=avl_child_height g (avl_right g p) \/ avl_child_height r (avl_root r)=avl_child_height g (avl_right g p)+1)) \/
    (avl_child_height r (avl_root r)=avl_child_height g (avl_right g p) /\
    (avl_child_height l (avl_root l)=avl_child_height g (avl_left g p) \/ avl_child_height l (avl_root l)=avl_child_height g (avl_left g p)+1))) by lia.
  pose proof (avl_insert_height_arithmetic__insert_projection_graft _ _ _ _ Bg I) as [Range [Diff Same]].
  pose proof (avl_join_root_fields__insert_projection_graft p (avl_key_of g p) l r) as [L [R [K H]]]. fold j in L,R,H.
  rewrite Root. simpl avl_child_height. rewrite H. split;[lia|]. intro E.
  unfold avl_model_balance_factor. rewrite L,R.
  unfold j. rewrite (avl_join_left_child_height__insert_projection_graft p _ l r (avl_root l) Nl (GraphLib.examples.bst.root_valid _ (GraphLib.examples.bst.bst_binary_tree _ (proj1 Tl)))).
  rewrite (avl_join_right_child_height__insert_projection_graft p _ l r (avl_root r) Nr Dj (GraphLib.examples.bst.root_valid _ (GraphLib.examples.bst.bst_binary_tree _ (proj1 Tr)))). apply Same;lia.
Qed.
Lemma crtos_duplicate_normal__crtos_insert_composition : forall g cache j p,
  avl_tree_valid g -> avl_vvalid g p -> crtos_graph_equiv cache g ->
  crtos_update_height cache p=j -> crtos_graph_equiv j g.
Proof.
  intros g cache j p T V E Norm.
  pose proof (crtos_equiv_update__crtos_insert_composition g cache p (crtos_equiv_sym__crtos_insert_composition _ _ E) (crtos_tree_closed__crtos_insert_composition g T)) as Eu.
  rewrite Norm,(crtos_valid_update_identity__crtos_insert_composition g p T V) in Eu.
  apply crtos_equiv_sym__crtos_insert_composition;exact Eu.
Qed.
Lemma crtos_prefix_normal__crtos_insert_composition : forall g raw key p,
  avl_gvalid g -> crtos_insert_prefix g raw key p -> crtos_update_ready raw p -> NoDup (avl_nodes raw) ->
  exists j, avl_tree_valid j /\ avl_root j=Some p /\
    crtos_graph_equiv j (crtos_update_height raw p) /\
    crtos_insert_exact g key (crtos_balance_model j p) (crtos_balance_ptr j p) /\
    ((crtos_key_present g key /\ crtos_graph_equiv j g) \/
     (~crtos_key_present g key /\ exists n,crtos_new_node_effect g j key n /\
       (avl_child_height g (avl_root g)<=avl_height_of j p<=avl_child_height g (avl_root g)+1) /\
       (avl_height_of j p=avl_child_height g (avl_root g) -> Z.abs (avl_model_balance_factor j p)<=1))).
Proof.
  intros g raw key p G Prefix U Nd.
  pose proof (avl_gvalid_tree_valid g G) as T.
  pose proof (proj1 (proj2 (proj2 U))) as Np.
  destruct Prefix as [[n [Root [Nn [Fresh [Pn E]]]]]|[[a [ret [Root [Cmp [Nret [Out E]]]]]]|[a [ret [Root [Cmp [Nret [Out E]]]]]]]].
  - subst p. pose proof (crtos_singleton_valid__crtos_insert_composition n key Nn) as Gj.
    pose proof (avl_gvalid_tree_valid _ Gj) as Tj.
    assert (Vj:avl_vvalid (crtos_singleton n key) n) by (left;reflexivity).
    pose proof (crtos_valid_update_identity__crtos_insert_composition _ n Tj Vj) as Norm.
    pose proof (crtos_equiv_update__crtos_insert_composition _ _ n (crtos_equiv_sym__crtos_insert_composition _ _ E) (crtos_tree_closed__crtos_insert_composition _ Tj)) as Eu.
    rewrite Norm in Eu.
    exists (crtos_singleton n key). split;[exact Tj|]. split;[reflexivity|]. split;[exact Eu|]. split.
    + pose proof (crtos_exact_empty_ok g key n (crtos_finish (crtos_singleton n key) n) Root Nn Fresh (crtos_equiv_refl__crtos_insert_composition _)) as X.
      unfold crtos_finish,crtos_finish_ptr in X. rewrite Norm in X;exact X.
    + right. pose proof (crtos_empty_no_vertex__crtos_insert_composition g G Root) as Empty.
      split;[intros [x [X K]];exact (Empty x X)|]. exists n. split.
      * split;[exact Nn|]. split;[exact Fresh|]. split.
        -- intro x. change (x=n \/ False \/ False <->x=n \/ avl_vvalid g x). split;[tauto|intros [X|X];[auto|exfalso;exact (Empty x X)]].
        -- split;[exact (proj1 (proj2 (proj2 (avl_join_root_fields__insert_projection_graft n key avl_empty_model avl_empty_model))))|]. intros x X;exfalso;exact (Empty x X).
      * pose proof (proj2 (proj2 (proj2 (avl_join_root_fields__insert_projection_graft n key avl_empty_model avl_empty_model)))) as H.
        change (avl_height_of (crtos_singleton n key) n=1) in H.
        rewrite Root;simpl avl_child_height. rewrite H. split;[lia|intro Bad;lia].
  - assert (R:p=avl_ptr_of (avl_root g)) by (rewrite Root;reflexivity).
    pose proof (GraphLib.examples.bst.root_valid _ (GraphLib.examples.bst.bst_binary_tree _ (proj1 G)) p Root) as V.
    pose proof (crtos_root_partition__crtos_insert_composition g p G R Np) as [Gl [Gr [Nl0 [Nr0 [Dj0 [Part Perm]]]]]].
    pose proof (crtos_nonzero_outcome__crtos_insert_composition _ _ _ _ Gr Out Nret) as [Ga [Ra [Ha Ka]]].
    pose proof (avl_gvalid_tree_valid _ Gl) as Tl. pose proof (avl_gvalid_tree_valid _ Ga) as Ta.
    assert (Ndj:NoDup (p::avl_nodes (avl_child_model g (avl_left g p))++avl_nodes a)).
    { eapply Permutation_NoDup;[exact (proj1 (proj2 E))|exact Nd]. }
    pose proof (crtos_join_nodup__crtos_insert_composition p _ _ (crtos_valid_domain__crtos_insert_composition _ Tl) (crtos_valid_domain__crtos_insert_composition _ Ta) Ndj) as [Nl [Na Dj]].
    assert (Kl:forall x,avl_vvalid (avl_child_model g (avl_left g p)) x ->avl_key_of (avl_child_model g (avl_left g p)) x<avl_key_of g p).
    { intros x X. apply avl_left_keys_order__insert_projection_graft;auto. apply avl_key_of_member__insert_projection_graft;auto. }
    assert (Kr:forall x,avl_vvalid a x ->avl_key_of g p<avl_key_of a x).
    { intros x X. destruct (Ka x X) as [K|[Y K]];[lia|rewrite K].
      apply avl_right_keys_order__insert_projection_graft;auto. apply avl_key_of_member__insert_projection_graft;auto. apply avl_gvalid_tree_valid;exact Gr. }
    pose proof (crtos_join_final_setup__crtos_insert_composition g raw p _ a Np Gl Ga Nl Na Dj Kl Kr E U) as [Tj [Norm Eu]].
    set (j:=avl_join_model p (avl_key_of g p) (avl_child_model g (avl_left g p)) a).
    exists j. split;[exact Tj|]. split;[reflexivity|]. split;[exact Eu|]. split.
    + pose proof (crtos_exact_right g key p a ret (crtos_balance_model j p) Root Cmp (proj1 Out)) as X.
      unfold crtos_finish,crtos_finish_ptr in X. rewrite Norm in X.
      destruct (Z.eq_dec ret 0);[contradiction|]. apply X. apply crtos_equiv_refl__crtos_insert_composition.
    + destruct (proj2 Out) as [[Pres [Ret Ec]]|[Absent [[Zero Fail]|Success]]];[|contradiction|].
      * left. split.
        -- destruct Pres as [x [X K]]. exists x.
           pose proof (crtos_child_fields__crtos_insert_composition g (avl_right g p) x X) as [Xg [Kg _]]. split;[exact Xg|congruence].
        -- apply (crtos_duplicate_normal__crtos_insert_composition g (crtos_join_cached g p (avl_child_model g (avl_left g p)) a) j p T V);[|exact Norm].
           eapply crtos_equiv_trans__crtos_insert_composition;[|exact (crtos_cached_reconstruct__crtos_insert_composition g p G Root Np)].
           apply crtos_cached_join_equiv__crtos_insert_composition;[apply crtos_equiv_refl__crtos_insert_composition|exact Ec].
      * right. split;[eapply crtos_absent_right__crtos_insert_composition;eauto|].
        destruct Success as [_ [_ [_ [[n Eff] Hrange]]]]. exists n. split.
        -- apply crtos_join_new_right__crtos_insert_composition;assumption.
        -- apply crtos_join_height_progress__crtos_insert_composition;auto. left. split.
           ++ apply (proj2 (avl_child_root__insert_projection_graft g (avl_left g p))).
           ++ rewrite <- (proj2 (avl_child_root__insert_projection_graft g (avl_right g p)));exact Ha.
  - assert (R:p=avl_ptr_of (avl_root g)) by (rewrite Root;reflexivity).
    pose proof (GraphLib.examples.bst.root_valid _ (GraphLib.examples.bst.bst_binary_tree _ (proj1 G)) p Root) as V.
    pose proof (crtos_root_partition__crtos_insert_composition g p G R Np) as [Gl [Gr [Nl0 [Nr0 [Dj0 [Part Perm]]]]]].
    pose proof (crtos_nonzero_outcome__crtos_insert_composition _ _ _ _ Gl Out Nret) as [Ga [Ra [Ha Ka]]].
    pose proof (avl_gvalid_tree_valid _ Gr) as Tr. pose proof (avl_gvalid_tree_valid _ Ga) as Ta.
    assert (Ndj:NoDup (p::avl_nodes a++avl_nodes (avl_child_model g (avl_right g p)))).
    { eapply Permutation_NoDup;[exact (proj1 (proj2 E))|exact Nd]. }
    pose proof (crtos_join_nodup__crtos_insert_composition p _ _ (crtos_valid_domain__crtos_insert_composition _ Ta) (crtos_valid_domain__crtos_insert_composition _ Tr) Ndj) as [Na [Nr Dj]].
    assert (Kr:forall x,avl_vvalid (avl_child_model g (avl_right g p)) x ->avl_key_of g p<avl_key_of (avl_child_model g (avl_right g p)) x).
    { intros x X. apply avl_right_keys_order__insert_projection_graft;auto. apply avl_key_of_member__insert_projection_graft;auto. }
    assert (Kl:forall x,avl_vvalid a x ->avl_key_of a x<avl_key_of g p).
    { intros x X. destruct (Ka x X) as [K|[Y K]];[lia|rewrite K].
      apply avl_left_keys_order__insert_projection_graft;auto. apply avl_key_of_member__insert_projection_graft;auto. apply avl_gvalid_tree_valid;exact Gl. }
    pose proof (crtos_join_final_setup__crtos_insert_composition g raw p a _ Np Ga Gr Na Nr Dj Kl Kr E U) as [Tj [Norm Eu]].
    set (j:=avl_join_model p (avl_key_of g p) a (avl_child_model g (avl_right g p))).
    exists j. split;[exact Tj|]. split;[reflexivity|]. split;[exact Eu|]. split.
    + pose proof (crtos_exact_left g key p a ret (crtos_balance_model j p) Root Cmp (proj1 Out)) as X.
      unfold crtos_finish,crtos_finish_ptr in X. rewrite Norm in X.
      destruct (Z.eq_dec ret 0);[contradiction|]. apply X. apply crtos_equiv_refl__crtos_insert_composition.
    + destruct (proj2 Out) as [[Pres [Ret Ec]]|[Absent [[Zero Fail]|Success]]];[|contradiction|].
      * left. split.
        -- destruct Pres as [x [X K]]. exists x.
           pose proof (crtos_child_fields__crtos_insert_composition g (avl_left g p) x X) as [Xg [Kg _]]. split;[exact Xg|congruence].
        -- apply (crtos_duplicate_normal__crtos_insert_composition g (crtos_join_cached g p a (avl_child_model g (avl_right g p))) j p T V);[|exact Norm].
           eapply crtos_equiv_trans__crtos_insert_composition;[|exact (crtos_cached_reconstruct__crtos_insert_composition g p G Root Np)].
           apply crtos_cached_join_equiv__crtos_insert_composition;[exact Ec|apply crtos_equiv_refl__crtos_insert_composition].
      * right. split;[eapply crtos_absent_left__crtos_insert_composition;eauto|].
        destruct Success as [_ [_ [_ [[n Eff] Hrange]]]]. exists n. split.
        -- apply crtos_join_new_left__crtos_insert_composition;assumption.
        -- apply crtos_join_height_progress__crtos_insert_composition;auto. right. split.
           ++ apply (proj2 (avl_child_root__insert_projection_graft g (avl_right g p))).
           ++ rewrite <- (proj2 (avl_child_root__insert_projection_graft g (avl_left g p)));exact Ha.
Qed.
Lemma crtos_finish_outcome__crtos_insert_composition : forall g raw a key p ret,
  avl_gvalid g -> crtos_insert_prefix g raw key p -> crtos_update_ready raw p ->
  NoDup (avl_nodes raw) -> crtos_balance_effect (crtos_update_height raw p) a p ret ->
  crtos_insert_outcome g a key ret.
Proof.
  intros g raw a key p ret G Prefix U Nd Eff.
  destruct (crtos_prefix_normal__crtos_insert_composition g raw key p G Prefix U Nd) as [j [Tj [Root [E [Exact Obs]]]]].
  pose proof (proj1 (proj2 (proj2 U))) as Np.
  pose proof (crtos_equiv_tree__crtos_insert_composition _ _ E Tj) as Tu.
  assert (Ru:avl_root (crtos_update_height raw p)=Some p) by (rewrite <- (proj1 E);exact Root).
  pose proof (GraphLib.examples.bst.root_valid _ (GraphLib.examples.bst.bst_binary_tree _ (proj1 Tj)) p Root) as Vj.
  pose proof (crtos_balance_whole_effect__crtos_insert_composition _ _ p ret Tu Ru Np Eff) as [Ga Ra].
  pose proof (crtos_equiv_balance__crtos_insert_composition _ _ p E Tj Vj) as [Eb Ptr].
  destruct Eff as [Model [Ret [Nret [Nodes [Dom [Keys [Gs [SubDom [Ht Identity]]]]]]]]].
  assert (X:crtos_insert_exact g key a ret).
  { rewrite <-Ptr in Ret. rewrite Ret. eapply crtos_exact_transport__crtos_insert_composition;[exact Exact|].
    rewrite Model. apply crtos_equiv_sym__crtos_insert_composition;exact Eb. }
  assert (Vafter:forall x,avl_vvalid a x<->avl_vvalid j x).
  { intro x. rewrite Dom. symmetry;apply (proj1 (proj2 (proj2 E))). }
  assert (Kafter:forall x,avl_vvalid j x ->avl_key_of a x=avl_key_of j x).
  { intros x Xj. rewrite Keys. symmetry;apply (proj2 (proj2 (proj2 (proj2 E))));exact Xj. }
  assert (Hp:avl_height_of (crtos_update_height raw p) p=avl_height_of j p).
  { symmetry;apply (proj2 (proj2 (proj2 (proj2 E))));exact Vj. }
  assert (Fp:avl_model_balance_factor (crtos_update_height raw p) p=avl_model_balance_factor j p).
  { symmetry;apply (proj2 (crtos_equiv_heightvalue__crtos_insert_composition _ _ E (crtos_tree_closed__crtos_insert_composition j Tj) p)). }
  split;[exact X|]. destruct Obs as [[Pres Ejg]|[Absent [n [New [Range Same]]]]].
  - left. split;[exact Pres|].
    pose proof (crtos_equiv_gvalid__crtos_insert_composition g j (crtos_equiv_sym__crtos_insert_composition _ _ Ejg) G) as Gj.
    assert (Balanced:Z.abs (avl_model_balance_factor (crtos_update_height raw p) p)<=1).
    { rewrite Fp;exact (proj1 (proj2 (proj2 Gj)) p Vj). }
    destruct (Identity Balanced) as [A R]. split.
    + rewrite R. rewrite <- (proj1 Ejg),Root;reflexivity.
    + rewrite A. eapply crtos_equiv_trans__crtos_insert_composition;[apply crtos_equiv_sym__crtos_insert_composition;exact E|exact Ejg].
  - right. split;[exact Absent|]. right. split;[exact Ga|]. split;[exact Nret|]. split;[rewrite Ra;reflexivity|]. split.
    + exists n. destruct New as [Nn [Fresh [Vn [Kn Preserve]]]].
      split;[exact Nn|]. split;[exact Fresh|]. split.
      * intro x;rewrite Vafter;apply Vn.
      * split;[rewrite Kafter;[exact Kn|apply Vn;auto]|].
        intros x Xg. rewrite Kafter;[apply Preserve;exact Xg|apply Vn;auto].
    + rewrite Ra;simpl avl_child_height. rewrite Hp in Ht.
      destruct (Z.eq_dec (avl_height_of j p) (avl_child_height g (avl_root g))) as [SameH|Grow].
      * assert (Balanced:Z.abs (avl_model_balance_factor (crtos_update_height raw p) p)<=1) by (rewrite Fp;apply Same;exact SameH).
        destruct (Identity Balanced) as [A R]. rewrite A,R,Hp. exact Range.
      * lia.
Qed.


(** Fixed insertion contract. The legacy destructive definitions above remain
    available only for existing clients and proof reuse. For a nonzero result,
    the successful exact relation is unchanged: all recursive results on that
    derivation are nonzero. For zero, the fixed exact relation directly preserves
    the original root, vertex set, all links, and every allocated key/height.
    This definition contains no executable recursion or search-state machine. *)
Definition crtos_insert_fixed_exact
    (before : avl_model) (key : Z) (after : avl_model) (ret : addr) : Prop :=
  (ret = 0 /\ crtos_graph_equiv after before) \/
  (ret <> 0 /\ crtos_insert_exact before key after ret).

Definition crtos_insert_fixed_outcome
    (before after : avl_model) (key ret : Z) : Prop :=
  crtos_insert_fixed_exact before key after ret /\
  ((crtos_key_present before key /\
      ret = avl_ptr_of (avl_root before) /\ crtos_graph_equiv after before) \/
   (~ crtos_key_present before key /\
      ((ret = 0 /\ crtos_graph_equiv after before) \/
       crtos_success_effect before after key ret))).

(** Successful child composition uses the fixed child outcome. Failed children
    never reach this prefix because no parent field has yet been overwritten. *)
Definition crtos_insert_fixed_prefix (before raw : avl_model) (key p : Z) : Prop :=
  (exists n, avl_root before = None /\ n <> 0 /\ ~ avl_vvalid before n /\
     p = n /\ crtos_graph_equiv raw (crtos_singleton n key)) \/
  (exists child ret,
     avl_root before = Some p /\ avl_key_of before p < key /\ ret <> 0 /\
     crtos_insert_fixed_outcome (avl_child_model before (avl_right before p)) child key ret /\
     crtos_graph_equiv raw
       (crtos_join_cached before p (avl_child_model before (avl_left before p)) child)) \/
  (exists child ret,
     avl_root before = Some p /\ key < avl_key_of before p /\ ret <> 0 /\
     crtos_insert_fixed_outcome (avl_child_model before (avl_left before p)) child key ret /\
     crtos_graph_equiv raw
       (crtos_join_cached before p child (avl_child_model before (avl_right before p)))).


Lemma crtos_fixed_nonzero_legacy : forall g a key ret,
  crtos_insert_fixed_outcome g a key ret -> ret <> 0 ->
  crtos_insert_outcome g a key ret.
Proof.
  intros g a key ret [X Obs] N.
  destruct X as [[Z E]|[NZ X]]; [contradiction|].
  split; [exact X|].
  destruct Obs as [Dup|[Absent [[Z E]|Success]]].
  - left; exact Dup.
  - contradiction.
  - right; split; [exact Absent|right; exact Success].
Qed.

Lemma crtos_legacy_nonzero_fixed : forall g a key ret,
  crtos_insert_outcome g a key ret -> ret <> 0 ->
  crtos_insert_fixed_outcome g a key ret.
Proof.
  intros g a key ret [X Obs] N.
  split; [right; split; assumption|].
  destruct Obs as [Dup|[Absent [[Z E]|Success]]].
  - left; exact Dup.
  - contradiction.
  - right; split; [exact Absent|right; exact Success].
Qed.

Lemma crtos_fixed_failure_unchanged : forall g a key,
  crtos_insert_fixed_outcome g a key 0 -> crtos_graph_equiv a g.
Proof.
  intros g a key [[[Z E]|[N X]] Obs]; [exact E|contradiction].
Qed.

Lemma crtos_fixed_failure_storage : forall g a key,
  crtos_insert_fixed_outcome g a key 0 ->
  avl_tree_store a |-- avl_tree_store g.
Proof.
  intros g a key O. apply crtos_equiv_store__crtos_insert_composition.
  exact (crtos_fixed_failure_unchanged g a key O).
Qed.

Lemma crtos_fixed_fail_outcome : forall g a key,
  ~ crtos_key_present g key -> crtos_graph_equiv a g ->
  crtos_insert_fixed_outcome g a key 0.
Proof.
  intros g a key Ab E. split.
  - left; split; [reflexivity|exact E].
  - right; split; [exact Ab|left; split; [reflexivity|exact E]].
Qed.

Lemma crtos_fixed_empty_outcome : forall g key,
  avl_gvalid g -> avl_root g = None ->
  crtos_insert_fixed_outcome g g key 0.
Proof.
  intros g key G R. apply crtos_fixed_fail_outcome.
  - intros [x [V K]].
    exact (crtos_empty_no_vertex__crtos_insert_composition g G R x V).
  - apply crtos_equiv_refl__crtos_insert_composition.
Qed.

Lemma crtos_fixed_duplicate_outcome : forall g p key,
  avl_gvalid g -> p = avl_ptr_of (avl_root g) -> p <> 0 ->
  avl_key_of g p = key -> crtos_insert_fixed_outcome g g key p.
Proof.
  intros g p key G R N K. apply crtos_legacy_nonzero_fixed; [|exact N].
  apply crtos_duplicate_outcome__crtos_insert_composition; assumption.
Qed.

Lemma crtos_fixed_failed_child : forall g after key,
  avl_gvalid g -> crtos_insert_fixed_outcome g after key 0 ->
  ~ crtos_key_present g key /\ crtos_graph_equiv after g.
Proof.
  intros g after key G O. split.
  - destruct O as [X [[Present [R E]]|[Absent Rest]]]; [|exact Absent].
    assert (Root:avl_root g=None).
    { apply (proj1 (avl_root_ptr_null_iff__mapping_refinement g G)).
      symmetry; exact R. }
    destruct Present as [x [V K]]. exfalso.
    exact (crtos_empty_no_vertex__crtos_insert_composition g G Root x V).
  - exact (crtos_fixed_failure_unchanged g after key O).
Qed.

Lemma crtos_fixed_prefix_legacy : forall g raw key p,
  crtos_insert_fixed_prefix g raw key p -> crtos_insert_prefix g raw key p.
Proof.
  intros g raw key p [Empty|[Right|Left]].
  - left; exact Empty.
  - right; left. destruct Right as [a [ret [R [C [N [O E]]]]]].
    exists a, ret. split; [exact R|]. split; [exact C|].
    split; [exact N|]. split; [|exact E].
    apply crtos_fixed_nonzero_legacy; assumption.
  - right; right. destruct Left as [a [ret [R [C [N [O E]]]]]].
    exists a, ret. split; [exact R|]. split; [exact C|].
    split; [exact N|]. split; [|exact E].
    apply crtos_fixed_nonzero_legacy; assumption.
Qed.

Lemma crtos_fixed_finish_outcome : forall g raw a key p ret,
  avl_gvalid g -> crtos_insert_fixed_prefix g raw key p ->
  crtos_update_ready raw p -> NoDup (avl_nodes raw) ->
  crtos_balance_effect (crtos_update_height raw p) a p ret ->
  crtos_insert_fixed_outcome g a key ret.
Proof.
  intros g raw a key p ret G P U Nd E.
  apply crtos_legacy_nonzero_fixed.
  - apply (crtos_finish_outcome__crtos_insert_composition g raw a key p ret);
      try assumption.
    apply crtos_fixed_prefix_legacy; exact P.
  - exact (proj1 (proj2 (proj2 E))).
Qed.

(** Read-only accessor semantics over cached unsigned fields. *)
Definition crtos_cached_height (g : avl_model) (p : Z) : Z :=
  if Z.eq_dec p 0 then 0 else avl_height_of g p.
Definition crtos_getheight_ready (g : avl_model) (p : Z) : Prop :=
  p = 0 \/ (avl_vvalid g p /\ In p (avl_nodes g)).

Definition crtos_factor_ready (g : avl_model) (p : Z) : Prop :=
 p = 0 \/ (crtos_raw_domain g /\ avl_vvalid g p /\
   (forall c, avl_left g p = Some c \/ avl_right g p = Some c ->
     avl_vvalid g c /\ c <> 0) /\
   INT_MIN <= avl_model_balance_factor g p <= INT_MAX).
Definition crtos_cached_factor (g : avl_model) (p : Z) : Z :=
 if Z.eq_dec p 0 then 0 else avl_model_balance_factor g p.
Definition crtos_left_wired (g : avl_model) (p : Z) : avl_model :=
 let q := avl_ptr_of (avl_right g p) in
 crtos_set_left (crtos_set_right g p (avl_left g q)) q (Some p).
Definition crtos_right_wired (g : avl_model) (p : Z) : avl_model :=
 let q := avl_ptr_of (avl_left g p) in
 crtos_set_right (crtos_set_left g p (avl_right g q)) q (Some p).
Definition crtos_left_ready (g : avl_model) (p : Z) : Prop :=
 let q := avl_ptr_of (avl_right g p) in
 crtos_raw_domain g /\ avl_vvalid g p /\ p <> 0 /\
 avl_vvalid g q /\ q <> 0 /\ p <> q /\
 crtos_update_ready (crtos_left_wired g p) p /\
 crtos_update_ready (crtos_update_height (crtos_left_wired g p) p) q.
Definition crtos_right_ready (g : avl_model) (p : Z) : Prop :=
 let q := avl_ptr_of (avl_left g p) in
 crtos_raw_domain g /\ avl_vvalid g p /\ p <> 0 /\
 avl_vvalid g q /\ q <> 0 /\ p <> q /\
 crtos_update_ready (crtos_right_wired g p) p /\
 crtos_update_ready (crtos_update_height (crtos_right_wired g p) p) q.
Definition crtos_lr_middle_model (g : avl_model) (p : Z) : avl_model :=
 let l := avl_ptr_of (avl_left g p) in
 crtos_set_left (crtos_rotate_left g l) p (avl_right g l).
Definition crtos_rl_middle_model (g : avl_model) (p : Z) : avl_model :=
 let r := avl_ptr_of (avl_right g p) in
 crtos_set_right (crtos_rotate_right g r) p (avl_left g r).
Definition crtos_lr_ready (g : avl_model) (p : Z) : Prop :=
 crtos_raw_domain g /\ avl_vvalid g p /\ p <> 0 /\
 crtos_left_ready g (avl_ptr_of (avl_left g p)) /\
 crtos_right_ready (crtos_lr_middle_model g p) p.
Definition crtos_rl_ready (g : avl_model) (p : Z) : Prop :=
 crtos_raw_domain g /\ avl_vvalid g p /\ p <> 0 /\
 crtos_right_ready g (avl_ptr_of (avl_right g p)) /\
 crtos_left_ready (crtos_rl_middle_model g p) p.

Definition remove_Z (x : Z) (xs : list Z) := remove Z.eq_dec x xs.

(** Exact untouched outside footprint for the selected local repair. *)
Definition crtos_balance_external_store (g : avl_model) (p : Z) : Assertion :=
 avl_graph_nodes_store g
   (filter (fun x => if excluded_middle_informative (avl_reachable g p x)
                    then false else true) (avl_nodes g)).

(** Enumeration uniqueness retained when a complete owner is focused.
    Full graph ownership entails this fact; frozen public callers need no new premise. *)
Definition crtos_unique_nodes (g : avl_model) : Prop := NoDup (avl_nodes g).

Lemma crtos_refocus__height_update : forall g x y,
 NoDup (avl_nodes g) -> In x (avl_nodes g) ->
 avl_vvalid g x -> x <> 0 ->
 INT_MIN <= avl_key_of g x <= INT_MAX ->
 0 <= avl_height_of g x <= UINT_MAX -> In y (avl_nodes g) ->
 (&(x # "AvlNode" ->ₛ "data"))%string # Int |-> avl_key_of g x **
 (&(x # "AvlNode" ->ₛ "height"))%string # UInt |-> avl_height_of g x **
 (&(x # "AvlNode" ->ₛ "left"))%string # Ptr |-> avl_ptr_of (avl_left g x) **
 (&(x # "AvlNode" ->ₛ "right"))%string # Ptr |-> avl_ptr_of (avl_right g x) **
 avl_graph_nodes_store g (avl_nodes_without g x) |--
 (&(y # "AvlNode" ->ₛ "data"))%string # Int |-> avl_key_of g y **
 (&(y # "AvlNode" ->ₛ "height"))%string # UInt |-> avl_height_of g y **
 (&(y # "AvlNode" ->ₛ "left"))%string # Ptr |-> avl_ptr_of (avl_left g y) **
 (&(y # "AvlNode" ->ₛ "right"))%string # Ptr |-> avl_ptr_of (avl_right g y) **
 avl_graph_nodes_store g (avl_nodes_without g y).
Proof.
 intros g x y Nd Ix Vx Nx Kx Hx Iy.
 pose proof (avl_nodes_root_remove_permutation__null_unmatched_balanced_results
   (avl_nodes g) x Nd Ix) as Px.
 pose proof (avl_nodes_root_remove_permutation__null_unmatched_balanced_results
   (avl_nodes g) y Nd Iy) as Py.
 assert (F : (&(x # "AvlNode" ->ₛ "data"))%string # Int |-> avl_key_of g x **
 (&(x # "AvlNode" ->ₛ "height"))%string # UInt |-> avl_height_of g x **
 (&(x # "AvlNode" ->ₛ "left"))%string # Ptr |-> avl_ptr_of (avl_left g x) **
 (&(x # "AvlNode" ->ₛ "right"))%string # Ptr |-> avl_ptr_of (avl_right g x) **
 avl_graph_nodes_store g (avl_nodes_without g x) |-- avl_tree_store g).
 { unfold avl_tree_store. rewrite <- (avl_graph_nodes_store_permutation__graph_store_decomposition g _ _ Px).
   rewrite avl_graph_nodes_store_cons__graph_store_decomposition.
   unfold avl_nodes_without, avl_graph_node_store. entailer!. }
 sep_apply_l_atomic F.
 unfold avl_tree_store. rewrite <- (avl_graph_nodes_store_permutation__graph_store_decomposition g _ _ Py).
 rewrite avl_graph_nodes_store_cons__graph_store_decomposition.
 unfold avl_nodes_without, avl_graph_node_store. Intros_p V. Intros_p N. Intros_p K. Intros_p H.
 entailer!.
Qed.
Lemma crtos_store_extract__height_update : forall g xs x,
 NoDup xs -> In x xs ->
 avl_graph_nodes_store g xs --||--
 avl_graph_node_store g x ** avl_graph_nodes_store g (remove addr_dec x xs).
Proof.
 intros g xs x N I.
 pose proof (avl_nodes_root_remove_permutation__null_unmatched_balanced_results xs x N I) as P.
 rewrite <- (avl_graph_nodes_store_permutation__graph_store_decomposition g _ _ P).
 rewrite avl_graph_nodes_store_cons__graph_store_decomposition. reflexivity.
Qed.
Lemma crtos_store_focus__height_update : forall g x,
 crtos_raw_domain g -> NoDup (avl_nodes g) -> avl_vvalid g x ->
 avl_tree_store g |--
 (&(x # "AvlNode" ->ₛ "data"))%string # Int |-> avl_key_of g x **
 (&(x # "AvlNode" ->ₛ "height"))%string # UInt |-> avl_height_of g x **
 (&(x # "AvlNode" ->ₛ "left"))%string # Ptr |-> avl_ptr_of (avl_left g x) **
 (&(x # "AvlNode" ->ₛ "right"))%string # Ptr |-> avl_ptr_of (avl_right g x) **
 avl_graph_nodes_store g (avl_nodes_without g x).
Proof.
 intros g x D N V. unfold avl_tree_store, avl_nodes_without.
 rewrite (crtos_store_extract__height_update g _ x N (proj1 (D x) V)).
 unfold avl_graph_node_store. entailer!.
Qed.
Lemma crtos_children__height_update : forall g p,
 crtos_update_ready g p ->
 crtos_getheight_ready g p /\
 crtos_getheight_ready g (avl_ptr_of (avl_left g p)) /\
 crtos_getheight_ready g (avl_ptr_of (avl_right g p)) /\
 crtos_cached_height g (avl_ptr_of (avl_left g p)) = avl_child_height g (avl_left g p) /\
 crtos_cached_height g (avl_ptr_of (avl_right g p)) = avl_child_height g (avl_right g p).
Proof.
 intros g p [D [V [N [C B]]]].
 assert (G:forall c, (avl_left g p=c \/ avl_right g p=c) ->
 crtos_getheight_ready g (avl_ptr_of c) /\
 crtos_cached_height g (avl_ptr_of c)=avl_child_height g c).
 { intros [c|] E; simpl.
   - destruct (C c E) as [Vc [Nc Bc]]. unfold crtos_cached_height.
     destruct (Z.eq_dec c 0);[contradiction|]. split;[right;split;[exact Vc|apply D;exact Vc]|reflexivity].
   - split;[left;reflexivity|reflexivity]. }
 destruct (G (avl_left g p) (or_introl eq_refl)) as [L HL].
 destruct (G (avl_right g p) (or_intror eq_refl)) as [R HR].
 repeat split;auto. right;split;[exact V|apply D;exact V].
Qed.
Lemma crtos_cache_fold__height_update : forall g p h,
 NoDup (avl_nodes g) -> In p (avl_nodes g) -> avl_vvalid g p -> p<>0 ->
 INT_MIN<=avl_key_of g p<=INT_MAX -> 0<=h<=UINT_MAX ->
 (&(p # "AvlNode" ->ₛ "data"))%string # Int |-> avl_key_of g p **
 (&(p # "AvlNode" ->ₛ "height"))%string # UInt |-> h **
 (&(p # "AvlNode" ->ₛ "left"))%string # Ptr |-> avl_ptr_of (avl_left g p) **
 (&(p # "AvlNode" ->ₛ "right"))%string # Ptr |-> avl_ptr_of (avl_right g p) **
 avl_graph_nodes_store g (avl_nodes_without g p) |--
 avl_tree_store (avl_with_root_cache g p h).
Proof.
 intros g p h Nd I V N K H.
 unfold avl_tree_store. change (avl_nodes (avl_with_root_cache g p h)) with (avl_nodes g).
 rewrite (crtos_store_extract__height_update (avl_with_root_cache g p h) _ p Nd I).
 rewrite avl_cache_nodes_unchanged__right_rotation_graph.
 2:{ apply Forall_forall. intros x X. apply in_remove in X. tauto. }
 unfold avl_nodes_without, avl_graph_node_store.
 change (avl_vvalid (avl_with_root_cache g p h) p) with (avl_vvalid g p).
 change (avl_key_of (avl_with_root_cache g p h) p) with (avl_key_of g p).
 change (avl_left (avl_with_root_cache g p h) p) with (avl_left g p).
 change (avl_right (avl_with_root_cache g p h) p) with (avl_right g p).
 assert (E:avl_height_of (avl_with_root_cache g p h) p=h).
 { unfold avl_with_root_cache,avl_height_update;simpl;destruct (Z.eq_dec p p);congruence. }
 rewrite E. entailer!.
Qed.
Lemma crtos_refocus__balance_accessor : forall g x y,
 NoDup (avl_nodes g) -> In x (avl_nodes g) ->
 avl_vvalid g x -> x <> 0 ->
 INT_MIN <= avl_key_of g x <= INT_MAX ->
 0 <= avl_height_of g x <= UINT_MAX -> In y (avl_nodes g) ->
 (&(x # "AvlNode" ->ₛ "data"))%string # Int |-> avl_key_of g x **
 (&(x # "AvlNode" ->ₛ "height"))%string # UInt |-> avl_height_of g x **
 (&(x # "AvlNode" ->ₛ "left"))%string # Ptr |-> avl_ptr_of (avl_left g x) **
 (&(x # "AvlNode" ->ₛ "right"))%string # Ptr |-> avl_ptr_of (avl_right g x) **
 avl_graph_nodes_store g (avl_nodes_without g x) |--
 (&(y # "AvlNode" ->ₛ "data"))%string # Int |-> avl_key_of g y **
 (&(y # "AvlNode" ->ₛ "height"))%string # UInt |-> avl_height_of g y **
 (&(y # "AvlNode" ->ₛ "left"))%string # Ptr |-> avl_ptr_of (avl_left g y) **
 (&(y # "AvlNode" ->ₛ "right"))%string # Ptr |-> avl_ptr_of (avl_right g y) **
 avl_graph_nodes_store g (avl_nodes_without g y).
Proof.
 intros g x y Nd Ix Vx Nx Kx Hx Iy.
 pose proof (avl_nodes_root_remove_permutation__null_unmatched_balanced_results
   (avl_nodes g) x Nd Ix) as Px.
 pose proof (avl_nodes_root_remove_permutation__null_unmatched_balanced_results
   (avl_nodes g) y Nd Iy) as Py.
 assert (F : (&(x # "AvlNode" ->ₛ "data"))%string # Int |-> avl_key_of g x **
 (&(x # "AvlNode" ->ₛ "height"))%string # UInt |-> avl_height_of g x **
 (&(x # "AvlNode" ->ₛ "left"))%string # Ptr |-> avl_ptr_of (avl_left g x) **
 (&(x # "AvlNode" ->ₛ "right"))%string # Ptr |-> avl_ptr_of (avl_right g x) **
 avl_graph_nodes_store g (avl_nodes_without g x) |-- avl_tree_store g).
 { unfold avl_tree_store. rewrite <- (avl_graph_nodes_store_permutation__graph_store_decomposition g _ _ Px).
   rewrite avl_graph_nodes_store_cons__graph_store_decomposition.
   unfold avl_nodes_without, avl_graph_node_store. entailer!. }
 sep_apply_l_atomic F.
 unfold avl_tree_store. rewrite <- (avl_graph_nodes_store_permutation__graph_store_decomposition g _ _ Py).
 rewrite avl_graph_nodes_store_cons__graph_store_decomposition.
 unfold avl_nodes_without, avl_graph_node_store. Intros_p V. Intros_p N. Intros_p K. Intros_p H.
 entailer!.
Qed.
Lemma crtos_factor_children__balance_accessor : forall g p,
 crtos_factor_ready g p -> p<>0 ->
 avl_vvalid g p /\ crtos_getheight_ready g p /\
 crtos_getheight_ready g (avl_ptr_of (avl_left g p)) /\
 crtos_getheight_ready g (avl_ptr_of (avl_right g p)) /\
 crtos_cached_height g (avl_ptr_of (avl_left g p)) = avl_child_height g (avl_left g p) /\
 crtos_cached_height g (avl_ptr_of (avl_right g p)) = avl_child_height g (avl_right g p) /\
 INT_MIN <= avl_model_balance_factor g p <= INT_MAX.
Proof.
 intros g p [Zp|[D [V [C B]]]] N; [contradiction|].
 assert (G:forall c, (avl_left g p=c \/ avl_right g p=c) ->
 crtos_getheight_ready g (avl_ptr_of c) /\
 crtos_cached_height g (avl_ptr_of c)=avl_child_height g c).
 { intros [c|] E; simpl.
   - destruct (C c E) as [Vc Nc]. unfold crtos_cached_height.
     destruct (Z.eq_dec c 0);[contradiction|]. split;[right;split;[exact Vc|apply D;exact Vc]|reflexivity].
   - split;[left;reflexivity|reflexivity]. }
 destruct (G (avl_left g p) (or_introl eq_refl)) as [L HL].
 destruct (G (avl_right g p) (or_intror eq_refl)) as [R HR].
 split;[exact V|]. split;[right;split;[exact V|apply D;exact V]|].
 split;[exact L|]. split;[exact R|]. split;[exact HL|]. split;assumption.
Qed.
Lemma crtos_refocus__single_rotations : forall g x y,
 crtos_raw_domain g -> NoDup (avl_nodes g) ->
 avl_vvalid g x -> x <> 0 ->
 INT_MIN <= avl_key_of g x <= INT_MAX ->
 0 <= avl_height_of g x <= UINT_MAX -> avl_vvalid g y ->
 (&(x # "AvlNode" ->ₛ "data"))%string # Int |-> avl_key_of g x **
 (&(x # "AvlNode" ->ₛ "height"))%string # UInt |-> avl_height_of g x **
 (&(x # "AvlNode" ->ₛ "left"))%string # Ptr |-> avl_ptr_of (avl_left g x) **
 (&(x # "AvlNode" ->ₛ "right"))%string # Ptr |-> avl_ptr_of (avl_right g x) **
 avl_graph_nodes_store g (avl_nodes_without g x) |--
 (&(y # "AvlNode" ->ₛ "data"))%string # Int |-> avl_key_of g y **
 (&(y # "AvlNode" ->ₛ "height"))%string # UInt |-> avl_height_of g y **
 (&(y # "AvlNode" ->ₛ "left"))%string # Ptr |-> avl_ptr_of (avl_left g y) **
 (&(y # "AvlNode" ->ₛ "right"))%string # Ptr |-> avl_ptr_of (avl_right g y) **
 avl_graph_nodes_store g (avl_nodes_without g y).
Proof.
 intros g x y D Nd Vx Nx Kx Hx Vy.
 pose proof (avl_nodes_root_remove_permutation__null_unmatched_balanced_results
   (avl_nodes g) x Nd (proj1 (D x) Vx)) as Px.
 pose proof (avl_nodes_root_remove_permutation__null_unmatched_balanced_results
   (avl_nodes g) y Nd (proj1 (D y) Vy)) as Py.
 assert (F : (&(x # "AvlNode" ->ₛ "data"))%string # Int |-> avl_key_of g x **
 (&(x # "AvlNode" ->ₛ "height"))%string # UInt |-> avl_height_of g x **
 (&(x # "AvlNode" ->ₛ "left"))%string # Ptr |-> avl_ptr_of (avl_left g x) **
 (&(x # "AvlNode" ->ₛ "right"))%string # Ptr |-> avl_ptr_of (avl_right g x) **
 avl_graph_nodes_store g (avl_nodes_without g x) |-- avl_tree_store g).
 { unfold avl_tree_store. rewrite <- (avl_graph_nodes_store_permutation__graph_store_decomposition g _ _ Px).
   rewrite avl_graph_nodes_store_cons__graph_store_decomposition.
   unfold avl_nodes_without, avl_graph_node_store. entailer!. }
 sep_apply_l_atomic F.
 unfold avl_tree_store. rewrite <- (avl_graph_nodes_store_permutation__graph_store_decomposition g _ _ Py).
 rewrite avl_graph_nodes_store_cons__graph_store_decomposition.
 unfold avl_nodes_without, avl_graph_node_store. Intros_p V. Intros_p N. Intros_p K. Intros_p H.
 entailer!.
Qed.
Lemma crtos_store_extract__single_rotations : forall g xs x,
 NoDup xs -> In x xs ->
 avl_graph_nodes_store g xs --||--
 avl_graph_node_store g x ** avl_graph_nodes_store g (remove addr_dec x xs).
Proof.
 intros g xs x N I.
 pose proof (avl_nodes_root_remove_permutation__null_unmatched_balanced_results xs x N I) as P.
 rewrite <- (avl_graph_nodes_store_permutation__graph_store_decomposition g _ _ P).
 rewrite avl_graph_nodes_store_cons__graph_store_decomposition. reflexivity.
Qed.
Lemma crtos_store_focus__single_rotations : forall g x,
 crtos_raw_domain g -> NoDup (avl_nodes g) -> avl_vvalid g x ->
 avl_tree_store g |--
 (&(x # "AvlNode" ->ₛ "data"))%string # Int |-> avl_key_of g x **
 (&(x # "AvlNode" ->ₛ "height"))%string # UInt |-> avl_height_of g x **
 (&(x # "AvlNode" ->ₛ "left"))%string # Ptr |-> avl_ptr_of (avl_left g x) **
 (&(x # "AvlNode" ->ₛ "right"))%string # Ptr |-> avl_ptr_of (avl_right g x) **
 avl_graph_nodes_store g (avl_nodes_without g x).
Proof.
 intros g x D N V. unfold avl_tree_store, avl_nodes_without.
 rewrite (crtos_store_extract__single_rotations g _ x N (proj1 (D x) V)).
 unfold avl_graph_node_store. entailer!.
Qed.
Lemma crtos_reroot_store__single_rotations : forall g p q,
 avl_tree_store g |-- avl_tree_store (crtos_reroot_rotation g p q).
Proof.
 intros. unfold avl_tree_store.
 change (avl_graph_nodes_store g (avl_nodes g) |--
 avl_graph_nodes_store (crtos_reroot_rotation g p q) (avl_nodes g)).
 apply avl_nodes_store_map__lr_graph_composition.
 intros x I. unfold avl_graph_node_store.
 change (avl_graph_node_store g x |-- avl_graph_node_store g x). reflexivity.
Qed.
Lemma crtos_remove_nodup__single_rotations : forall xs x,
 NoDup xs -> NoDup (remove addr_dec x xs).
Proof.
 intros xs x N. induction N as [|a xs H N IH]; simpl.
 - constructor.
 - destruct (addr_dec x a); [exact IH|].
   constructor; [|exact IH]. intro I. apply H.
   apply in_remove in I. exact (proj1 I).
Qed.
Lemma crtos_remove_eq__single_rotations : forall xs x,
 remove Z.eq_dec x xs = remove addr_dec x xs.
Proof.
 induction xs as [|a xs IH]; intros x; simpl; [reflexivity|].
 destruct (Z.eq_dec x a), (addr_dec x a); try congruence.
 all: rewrite (IH x); reflexivity.
Qed.
Lemma crtos_two_extract__single_rotations : forall g p q,
 crtos_raw_domain g -> NoDup (avl_nodes g) ->
 avl_vvalid g p -> avl_vvalid g q -> p <> q ->
 avl_tree_store g --||--
 avl_graph_node_store g p ** avl_graph_node_store g q **
 avl_graph_nodes_store g (remove_Z q (avl_nodes_without g p)).
Proof.
 intros g p q D N P Q E. unfold avl_tree_store, avl_nodes_without, remove_Z. rewrite crtos_remove_eq__single_rotations.
 rewrite (crtos_store_extract__single_rotations g _ p N (proj1 (D p) P)).
 rewrite (crtos_store_extract__single_rotations g _ q (crtos_remove_nodup__single_rotations _ p N)).
 2: { apply in_in_remove; [congruence|apply D;exact Q]. }
 split; cancel; reflexivity.
Qed.
Lemma crtos_right_remainder__single_rotations : forall g p,
 avl_graph_nodes_store g (remove_Z (avl_ptr_of (avl_left g p)) (avl_nodes_without g p)) |--
 avl_graph_nodes_store (crtos_right_wired g p) (remove_Z (avl_ptr_of (avl_left g p)) (avl_nodes_without g p)).
Proof.
 intros g p. apply avl_nodes_store_map__lr_graph_composition.
 intros x I. unfold remove_Z, avl_nodes_without in I.
 assert (Np:x<>p).
 { apply in_remove in I. intro E; subst; exact (remove_In addr_dec (avl_nodes g) p (proj1 I)). }
 assert (Nq:x<>avl_ptr_of (avl_left g p)).
 { intro E; subst; exact (remove_In Z.eq_dec _ _ I). }
 change (avl_graph_node_store g x |-- “avl_vvalid g x” && “x <> NULL” &&
 “INT_MIN <= avl_key_of g x <= INT_MAX” && “0 <= avl_height_of g x <= UINT_MAX” &&
 (&(x # "AvlNode" ->ₛ "data"))%string # Int |-> avl_key_of g x **
 (&(x # "AvlNode" ->ₛ "height"))%string # UInt |-> avl_height_of g x **
 (&(x # "AvlNode" ->ₛ "left"))%string # Ptr |-> avl_ptr_of (if Z.eq_dec x p then avl_right g (avl_ptr_of (avl_left g p)) else avl_left g x) **
 (&(x # "AvlNode" ->ₛ "right"))%string # Ptr |-> avl_ptr_of (if Z.eq_dec x (avl_ptr_of (avl_left g p)) then Some p else avl_right g x)).
 destruct (Z.eq_dec x p); [contradiction|].
 destruct (Z.eq_dec x (avl_ptr_of (avl_left g p))); [contradiction|].
 reflexivity.
Qed.
Lemma crtos_left_remainder__single_rotations : forall g p,
 avl_graph_nodes_store g (remove_Z (avl_ptr_of (avl_right g p)) (avl_nodes_without g p)) |--
 avl_graph_nodes_store (crtos_left_wired g p) (remove_Z (avl_ptr_of (avl_right g p)) (avl_nodes_without g p)).
Proof.
 intros g p. apply avl_nodes_store_map__lr_graph_composition.
 intros x I. unfold remove_Z, avl_nodes_without in I.
 assert (Np:x<>p).
 { apply in_remove in I. intro E; subst; exact (remove_In addr_dec (avl_nodes g) p (proj1 I)). }
 assert (Nq:x<>avl_ptr_of (avl_right g p)).
 { intro E; subst; exact (remove_In Z.eq_dec _ _ I). }
 change (avl_graph_node_store g x |-- “avl_vvalid g x” && “x <> NULL” &&
 “INT_MIN <= avl_key_of g x <= INT_MAX” && “0 <= avl_height_of g x <= UINT_MAX” &&
 (&(x # "AvlNode" ->ₛ "data"))%string # Int |-> avl_key_of g x **
 (&(x # "AvlNode" ->ₛ "height"))%string # UInt |-> avl_height_of g x **
 (&(x # "AvlNode" ->ₛ "left"))%string # Ptr |-> avl_ptr_of (if Z.eq_dec x (avl_ptr_of (avl_right g p)) then Some p else avl_left g x) **
 (&(x # "AvlNode" ->ₛ "right"))%string # Ptr |-> avl_ptr_of (if Z.eq_dec x p then avl_left g (avl_ptr_of (avl_right g p)) else avl_right g x)).
 destruct (Z.eq_dec x p); [contradiction|].
 destruct (Z.eq_dec x (avl_ptr_of (avl_right g p))); [contradiction|].
 reflexivity.
Qed.
Lemma crtos_right_pivot_fields__single_rotations : forall g p,
 p <> (avl_ptr_of (avl_left g p)) ->
 avl_left (crtos_right_wired g p) p = avl_right g (avl_ptr_of (avl_left g p)) /\
 avl_right (crtos_right_wired g p) p = avl_right g p /\
 avl_left (crtos_right_wired g p) (avl_ptr_of (avl_left g p)) = avl_left g (avl_ptr_of (avl_left g p)) /\
 avl_right (crtos_right_wired g p) (avl_ptr_of (avl_left g p)) = Some p.
Proof.
 intros g p E.
 change (
 (if Z.eq_dec p p then avl_right g (avl_ptr_of (avl_left g p)) else avl_left g p) = avl_right g (avl_ptr_of (avl_left g p)) /\
 (if Z.eq_dec p (avl_ptr_of (avl_left g p)) then Some p else avl_right g p) = avl_right g p /\
 (if Z.eq_dec (avl_ptr_of (avl_left g p)) p then avl_right g (avl_ptr_of (avl_left g p)) else avl_left g (avl_ptr_of (avl_left g p))) = avl_left g (avl_ptr_of (avl_left g p)) /\
 (if Z.eq_dec (avl_ptr_of (avl_left g p)) (avl_ptr_of (avl_left g p)) then Some p else avl_right g (avl_ptr_of (avl_left g p))) = Some p).
 destruct (Z.eq_dec p p), (Z.eq_dec p (avl_ptr_of (avl_left g p))), (Z.eq_dec (avl_ptr_of (avl_left g p)) p), (Z.eq_dec (avl_ptr_of (avl_left g p)) (avl_ptr_of (avl_left g p))); intuition congruence.
Qed.
Lemma crtos_left_pivot_fields__single_rotations : forall g p,
 p <> (avl_ptr_of (avl_right g p)) ->
 avl_right (crtos_left_wired g p) p = avl_left g (avl_ptr_of (avl_right g p)) /\
 avl_left (crtos_left_wired g p) p = avl_left g p /\
 avl_right (crtos_left_wired g p) (avl_ptr_of (avl_right g p)) = avl_right g (avl_ptr_of (avl_right g p)) /\
 avl_left (crtos_left_wired g p) (avl_ptr_of (avl_right g p)) = Some p.
Proof.
 intros g p E.
 change (
 (if Z.eq_dec p p then avl_left g (avl_ptr_of (avl_right g p)) else avl_right g p) = avl_left g (avl_ptr_of (avl_right g p)) /\
 (if Z.eq_dec p (avl_ptr_of (avl_right g p)) then Some p else avl_left g p) = avl_left g p /\
 (if Z.eq_dec (avl_ptr_of (avl_right g p)) p then avl_left g (avl_ptr_of (avl_right g p)) else avl_right g (avl_ptr_of (avl_right g p))) = avl_right g (avl_ptr_of (avl_right g p)) /\
 (if Z.eq_dec (avl_ptr_of (avl_right g p)) (avl_ptr_of (avl_right g p)) then Some p else avl_left g (avl_ptr_of (avl_right g p))) = Some p).
 destruct (Z.eq_dec p p), (Z.eq_dec p (avl_ptr_of (avl_right g p))), (Z.eq_dec (avl_ptr_of (avl_right g p)) p), (Z.eq_dec (avl_ptr_of (avl_right g p)) (avl_ptr_of (avl_right g p))); intuition congruence.
Qed.
Lemma crtos_refocus__double_rotations : forall g x y,
 crtos_raw_domain g -> NoDup (avl_nodes g) ->
 avl_vvalid g x -> x <> 0 ->
 INT_MIN <= avl_key_of g x <= INT_MAX ->
 0 <= avl_height_of g x <= UINT_MAX -> avl_vvalid g y ->
 (&(x # "AvlNode" ->ₛ "data"))%string # Int |-> avl_key_of g x **
 (&(x # "AvlNode" ->ₛ "height"))%string # UInt |-> avl_height_of g x **
 (&(x # "AvlNode" ->ₛ "left"))%string # Ptr |-> avl_ptr_of (avl_left g x) **
 (&(x # "AvlNode" ->ₛ "right"))%string # Ptr |-> avl_ptr_of (avl_right g x) **
 avl_graph_nodes_store g (avl_nodes_without g x) |--
 (&(y # "AvlNode" ->ₛ "data"))%string # Int |-> avl_key_of g y **
 (&(y # "AvlNode" ->ₛ "height"))%string # UInt |-> avl_height_of g y **
 (&(y # "AvlNode" ->ₛ "left"))%string # Ptr |-> avl_ptr_of (avl_left g y) **
 (&(y # "AvlNode" ->ₛ "right"))%string # Ptr |-> avl_ptr_of (avl_right g y) **
 avl_graph_nodes_store g (avl_nodes_without g y).
Proof.
 intros g x y D Nd Vx Nx Kx Hx Vy.
 pose proof (avl_nodes_root_remove_permutation__null_unmatched_balanced_results
   (avl_nodes g) x Nd (proj1 (D x) Vx)) as Px.
 pose proof (avl_nodes_root_remove_permutation__null_unmatched_balanced_results
   (avl_nodes g) y Nd (proj1 (D y) Vy)) as Py.
 assert (F : (&(x # "AvlNode" ->ₛ "data"))%string # Int |-> avl_key_of g x **
 (&(x # "AvlNode" ->ₛ "height"))%string # UInt |-> avl_height_of g x **
 (&(x # "AvlNode" ->ₛ "left"))%string # Ptr |-> avl_ptr_of (avl_left g x) **
 (&(x # "AvlNode" ->ₛ "right"))%string # Ptr |-> avl_ptr_of (avl_right g x) **
 avl_graph_nodes_store g (avl_nodes_without g x) |-- avl_tree_store g).
 { unfold avl_tree_store. rewrite <- (avl_graph_nodes_store_permutation__graph_store_decomposition g _ _ Px).
   rewrite avl_graph_nodes_store_cons__graph_store_decomposition.
   unfold avl_nodes_without, avl_graph_node_store. entailer!. }
 sep_apply_l_atomic F.
 unfold avl_tree_store. rewrite <- (avl_graph_nodes_store_permutation__graph_store_decomposition g _ _ Py).
 rewrite avl_graph_nodes_store_cons__graph_store_decomposition.
 unfold avl_nodes_without, avl_graph_node_store. Intros_p V. Intros_p N. Intros_p K. Intros_p H.
 entailer!.
Qed.
Lemma crtos_set_left_remainder__double_rotations : forall g p c,
 avl_graph_nodes_store g (avl_nodes_without g p) |--
 avl_graph_nodes_store (crtos_set_left g p c) (avl_nodes_without g p).
Proof.
 intros. apply avl_nodes_store_map__lr_graph_composition.
 intros x I. assert (N:x<>p).
 { intro E;subst;exact (remove_In addr_dec (avl_nodes g) p I). }
 unfold avl_graph_node_store. change
 ( avl_graph_node_store g x |-- “avl_vvalid g x” && “x <> NULL” &&
 “INT_MIN <= avl_key_of g x <= INT_MAX” &&
 “0 <= avl_height_of g x <= UINT_MAX” &&
 (&(x # "AvlNode" ->ₛ "data"))%string # Int |-> avl_key_of g x **
 (&(x # "AvlNode" ->ₛ "height"))%string # UInt |-> avl_height_of g x **
 (&(x # "AvlNode" ->ₛ "left"))%string # Ptr |-> avl_ptr_of (if Z.eq_dec x p then c else avl_left g x) **
 (&(x # "AvlNode" ->ₛ "right"))%string # Ptr |-> avl_ptr_of (avl_right g x)).
 destruct (Z.eq_dec x p); [contradiction|reflexivity].
Qed.
Lemma crtos_set_right_remainder__double_rotations : forall g p c,
 avl_graph_nodes_store g (avl_nodes_without g p) |--
 avl_graph_nodes_store (crtos_set_right g p c) (avl_nodes_without g p).
Proof.
 intros. apply avl_nodes_store_map__lr_graph_composition.
 intros x I. assert (N:x<>p).
 { intro E;subst;exact (remove_In addr_dec (avl_nodes g) p I). }
 unfold avl_graph_node_store. change
 ( avl_graph_node_store g x |-- “avl_vvalid g x” && “x <> NULL” &&
 “INT_MIN <= avl_key_of g x <= INT_MAX” &&
 “0 <= avl_height_of g x <= UINT_MAX” &&
 (&(x # "AvlNode" ->ₛ "data"))%string # Int |-> avl_key_of g x **
 (&(x # "AvlNode" ->ₛ "height"))%string # UInt |-> avl_height_of g x **
 (&(x # "AvlNode" ->ₛ "left"))%string # Ptr |-> avl_ptr_of (avl_left g x) **
 (&(x # "AvlNode" ->ₛ "right"))%string # Ptr |-> avl_ptr_of (if Z.eq_dec x p then c else avl_right g x)).
 destruct (Z.eq_dec x p); [contradiction|reflexivity].
Qed.
Lemma crtos_lr_final__double_rotations : forall g p,
 crtos_right_ready (crtos_lr_middle_model g p) p ->
 crtos_rotate_right (crtos_lr_middle_model g p) p = crtos_rotate_lr g p.
Proof.
 intros g p H.
 assert (N:avl_ptr_of (avl_right g (avl_ptr_of (avl_left g p))) <> 0).
 { pose proof (proj1 (proj2 (proj2 (proj2 (proj2 H)))) ) as N.
   change (avl_ptr_of (if Z.eq_dec p p then avl_right g (avl_ptr_of (avl_left g p)) else avl_left (crtos_rotate_left g (avl_ptr_of (avl_left g p))) p) <> 0) in N.
   destruct (Z.eq_dec p p); [exact N|contradiction]. }
 unfold crtos_rotate_lr, crtos_lr_middle_model.
 destruct (avl_right g (avl_ptr_of (avl_left g p))); [reflexivity|contradiction].
Qed.
Lemma crtos_lr_return_ptr__double_rotations : forall g p,
 avl_ptr_of (avl_left (crtos_lr_middle_model g p) p) =
 avl_ptr_of (avl_right g (avl_ptr_of (avl_left g p))).
Proof. intros. change (avl_ptr_of (if Z.eq_dec p p then avl_right g (avl_ptr_of (avl_left g p)) else avl_left (crtos_rotate_left g (avl_ptr_of (avl_left g p))) p) = avl_ptr_of (avl_right g (avl_ptr_of (avl_left g p)))).
 destruct (Z.eq_dec p p); [reflexivity|contradiction]. Qed.
Lemma crtos_rl_final__double_rotations : forall g p,
 crtos_left_ready (crtos_rl_middle_model g p) p ->
 crtos_rotate_left (crtos_rl_middle_model g p) p = crtos_rotate_rl g p.
Proof.
 intros g p H.
 assert (N:avl_ptr_of (avl_left g (avl_ptr_of (avl_right g p))) <> 0).
 { pose proof (proj1 (proj2 (proj2 (proj2 (proj2 H)))) ) as N.
   change (avl_ptr_of (if Z.eq_dec p p then avl_left g (avl_ptr_of (avl_right g p)) else avl_right (crtos_rotate_right g (avl_ptr_of (avl_right g p))) p) <> 0) in N.
   destruct (Z.eq_dec p p); [exact N|contradiction]. }
 unfold crtos_rotate_rl, crtos_rl_middle_model.
 destruct (avl_left g (avl_ptr_of (avl_right g p))); [reflexivity|contradiction].
Qed.
Lemma crtos_rl_return_ptr__double_rotations : forall g p,
 avl_ptr_of (avl_right (crtos_rl_middle_model g p) p) =
 avl_ptr_of (avl_left g (avl_ptr_of (avl_right g p))).
Proof. intros. change (avl_ptr_of (if Z.eq_dec p p then avl_left g (avl_ptr_of (avl_right g p)) else avl_right (crtos_rotate_right g (avl_ptr_of (avl_right g p))) p) = avl_ptr_of (avl_left g (avl_ptr_of (avl_right g p)))).
 destruct (Z.eq_dec p p); [reflexivity|contradiction]. Qed.
Lemma crtos_left_at__double_rotations : forall g p c, avl_left (crtos_set_left g p c) p = c.
Proof. intros. change ((if Z.eq_dec p p then c else avl_left g p)=c). destruct (Z.eq_dec p p); [reflexivity|contradiction]. Qed.
Lemma crtos_right_at__double_rotations : forall g p c, avl_right (crtos_set_right g p c) p = c.
Proof. intros. change ((if Z.eq_dec p p then c else avl_right g p)=c). destruct (Z.eq_dec p p); [reflexivity|contradiction]. Qed.
Lemma crtos_subtree_partition__balance_readiness : forall g p,
 NoDup (avl_nodes g) ->
 Permutation (avl_nodes g)
 (avl_nodes (avl_subtree_model g p) ++
 filter (fun x => if excluded_middle_informative (avl_reachable g p x) then false else true) (avl_nodes g)).
Proof.
 intros g p N. apply NoDup_Permutation; [exact N| |].
 - apply NoDup_app.
   + apply GraphLib.graph_basic.valid_NoDup_list_NoDup.
   + apply NoDup_filter. exact N.
   + intros x X Y. change (In x (avl_subtree_nodes g p)) in X.
     unfold avl_subtree_nodes in X. apply GraphLib.graph_basic.valid_NoDup_list_spec in X.
     apply filter_In in Y. destruct (excluded_middle_informative (avl_reachable g p x)); simpl in *; intuition congruence.
 - intro x. rewrite in_app_iff, filter_In.
   change (avl_nodes (avl_subtree_model g p)) with (avl_subtree_nodes g p).
   unfold avl_subtree_nodes. rewrite GraphLib.graph_basic.valid_NoDup_list_spec.
   destruct (excluded_middle_informative (avl_reachable g p x)); simpl; tauto.
Qed.
Lemma crtos_subtree_focus__balance_readiness : forall g p,
 crtos_balance_ready g p -> avl_tree_store g |--
 avl_tree_store (avl_subtree_model g p) ** crtos_balance_external_store g p.
Proof.
 intros g p B. unfold avl_tree_store at 1.
 prop_apply_p (crtos_store_nodup__crtos_insert_composition g (avl_nodes g)). Intros_p N.
 rewrite (avl_graph_nodes_store_permutation__graph_store_decomposition g _ _ (crtos_subtree_partition__balance_readiness g p N)).
 sep_apply_l_atomic (avl_graph_nodes_store_split__graph_store_decomposition g (avl_nodes (avl_subtree_model g p)) (filter (fun x => if excluded_middle_informative (avl_reachable g p x) then false else true) (avl_nodes g))).
 unfold crtos_balance_external_store. cancel.
 unfold avl_tree_store. apply avl_projection_nodes_store__lr_graph_composition.
 apply Forall_forall. intros x X. change (In x (avl_subtree_nodes g p)) in X.
 unfold avl_subtree_nodes in X. apply GraphLib.graph_basic.valid_NoDup_list_spec in X. tauto.
Qed.
Lemma crtos_balance_subroot__balance_readiness : forall g p,
 crtos_balance_ready g p ->
 avl_tree_valid (avl_subtree_model g p) /\ p<>0 /\ avl_vvalid (avl_subtree_model g p) p /\ crtos_unique_nodes (avl_subtree_model g p).
Proof.
 intros g p [V [N [T B]]]. split; [exact T|]. split; [exact N|]. split.
 - change (avl_vvalid g p /\ avl_reachable g p p). split; [exact V|].
   unfold avl_reachable, GraphLib.examples.bst.bt_path. exists 0%nat. hnf. reflexivity.
 - unfold crtos_unique_nodes. apply GraphLib.examples.bst.bst_listV_NoDup. exact (proj1 T).
Qed.
Lemma crtos_tree_factor_ready__balance_readiness : forall g p,
 avl_tree_valid g -> avl_vvalid g p ->
 INT_MIN <= avl_model_balance_factor g p <= INT_MAX ->
 crtos_factor_ready g p.
Proof.
 intros g p T V F. right. split.
 - apply crtos_valid_domain__crtos_insert_composition. exact T.
 - split; [exact V|]. split; [|exact F]. intros c C.
   assert (Vc:avl_vvalid g c).
   { eapply avl_graph_child_valid__root_and_factor_setup; [exact (proj1 T)|exact V|exact C]. }
   split; [exact Vc|]. apply (proj2 (proj2 T)); exact Vc.
Qed.
Lemma crtos_subtree_factor__balance_readiness : forall g p x,
 avl_vvalid (avl_subtree_model g p) x ->
 avl_model_balance_factor (avl_subtree_model g p) x = avl_model_balance_factor g x.
Proof.
 intros g p x [_ R].
 destruct (avl_projection_children__lr_graph_composition g p x R) as [L Q].
 unfold avl_model_balance_factor. rewrite L,Q. reflexivity.
Qed.
Lemma crtos_balance_factor_ready__balance_readiness : forall g p x,
 crtos_balance_ready g p -> avl_vvalid (avl_subtree_model g p) x -> crtos_factor_ready (avl_subtree_model g p) x.
Proof.
 intros g p x B V.
 apply crtos_tree_factor_ready__balance_readiness; [exact (proj1 (proj2 (proj2 B)))|exact V|].
 rewrite (crtos_subtree_factor__balance_readiness g p x V).
 destruct B as [_ [_ [T [D R]]]].
 destruct (Z.eq_dec x p) as [E|E].
 - subst x. apply Z.abs_le in R. lia.
 - specialize (D x V E). apply Z.abs_le in D. lia.
Qed.
Lemma crtos_child_bound__balance_readiness : forall g x c,
 avl_tree_valid g -> avl_vvalid g x ->
 (avl_left g x=c \/ avl_right g x=c) ->
 0 <= avl_child_height g c < avl_height_of g x.
Proof.
 intros g x c T V C.
 pose proof (avl_child_nonnegative__left_rotation_graph_refinement g x c T V ltac:(destruct C;auto)) as H.
 pose proof (proj2 (proj1 (proj2 T) x V)) as E.
 destruct C; subst c; lia.
Qed.
Lemma crtos_right_ready_tree__balance_readiness : forall g p,
 avl_tree_valid g -> avl_vvalid g p -> p<>0 ->
 0 < avl_model_balance_factor g p -> crtos_right_ready g p.
Proof.
 intros g p T V N F.
 pose proof (proj1 (crtos_factor_children__crtos_insert_composition g p T V) F) as Q.
 destruct (avl_left g p) as [q|] eqn:L; [|unfold avl_model_balance_factor in F; rewrite L in F; simpl avl_child_height in F; pose proof (crtos_child_bound__balance_readiness g p (avl_right g p) T V (or_intror eq_refl));lia].
 change (avl_vvalid g q) in Q.
 pose proof (proj2 (proj2 T) q Q) as Nq.
 pose proof (proj1 (proj2 T) p V) as [Bp Ep].
 pose proof (proj1 (proj2 T) q Q) as [Bq Eq].
 pose proof (crtos_child_bound__balance_readiness g p (Some q) T V (or_introl L)) as Pq.
 simpl avl_child_height in Pq.
 assert (D:p<>q) by (intro E;subst;lia).
 pose proof (crtos_child_bound__balance_readiness g q (avl_left g q) T Q (or_introl eq_refl)) as Bl.
 pose proof (crtos_child_bound__balance_readiness g q (avl_right g q) T Q (or_intror eq_refl)) as Br.
 pose proof (crtos_child_bound__balance_readiness g p (avl_right g p) T V (or_intror eq_refl)) as Bpr.
 assert (Al:avl_left g q<>Some p) by (intro E;rewrite E in Bl;simpl avl_child_height in Bl;lia).
 unfold avl_model_balance_factor in F. rewrite L in F. simpl avl_child_height in F.
 set (h:=Z.max (avl_child_height g (avl_right g q)) (avl_child_height g (avl_right g p))+1).
 assert (Bh:1<=h<=avl_height_of g q) by (unfold h;lia).
 assert (Hv:crtos_height_value (crtos_right_wired g p) p=h).
 { unfold crtos_height_value. change ((Z.max
 (avl_child_height g (if Z.eq_dec p p then avl_right g (avl_ptr_of (avl_left g p)) else avl_left g p))
 (avl_child_height g (if Z.eq_dec p (avl_ptr_of (avl_left g p)) then Some p else avl_right g p))+1)=h).
 rewrite L. simpl avl_ptr_of. destruct (Z.eq_dec p p), (Z.eq_dec p q);try congruence. reflexivity. }
 assert (CH:forall c,c<>Some p -> avl_child_height (crtos_update_height (crtos_right_wired g p) p) c=avl_child_height g c).
 { intros [c|] E; [|reflexivity]. unfold avl_child_height,crtos_update_height. change (avl_height_update (avl_height_of g) p (crtos_height_value (crtos_right_wired g p) p) c=avl_height_of g c).
 unfold avl_height_update. destruct (Z.eq_dec c p);congruence. }
 unfold crtos_right_ready. rewrite L. simpl avl_ptr_of.
 split; [exact (crtos_valid_domain__crtos_insert_composition g T)|].
 split; [exact V|]. split; [exact N|]. split; [exact Q|]. split; [exact Nq|]. split; [exact D|]. split.
 - split; [exact (crtos_valid_domain__crtos_insert_composition g T)|].
   split; [exact V|]. split; [exact N|]. split.
   + intros c C. change ((if Z.eq_dec p p then avl_right g (avl_ptr_of (avl_left g p)) else avl_left g p)=Some c \/ (if Z.eq_dec p (avl_ptr_of (avl_left g p)) then Some p else avl_right g p)=Some c) in C.
     rewrite L in C. simpl avl_ptr_of in C. destruct (Z.eq_dec p p), (Z.eq_dec p q);try congruence.
     assert (Vc:avl_vvalid g c) by (destruct C; eapply avl_graph_child_valid__root_and_factor_setup;[exact (proj1 T)|exact Q|right;assumption|exact (proj1 T)|exact V|right;assumption]).
     split; [exact Vc|]. split; [exact (proj2 (proj2 T) c Vc)|]. change (0<=avl_height_of g c<=UINT_MAX). pose proof (proj1 (proj1 (proj2 T) c Vc));lia.
   + rewrite Hv. lia.
 - split; [exact (crtos_valid_domain__crtos_insert_composition g T)|].
   split; [exact Q|]. split; [exact Nq|]. split.
   + intros c C. change ((if Z.eq_dec q p then avl_right g (avl_ptr_of (avl_left g p)) else avl_left g q)=Some c \/ (if Z.eq_dec q (avl_ptr_of (avl_left g p)) then Some p else avl_right g q)=Some c) in C.
     rewrite L in C. simpl avl_ptr_of in C. destruct (Z.eq_dec q p), (Z.eq_dec q q);try congruence.
     destruct C as [C|C].
     * assert (Vc:avl_vvalid g c) by (eapply avl_graph_child_valid__root_and_factor_setup;[exact (proj1 T)|exact Q|left;exact C]).
       assert (Nc:c<>p) by (intro E;subst;contradiction).
       split; [exact Vc|]. split; [exact (proj2 (proj2 T) c Vc)|].
       change (0<=avl_height_update (avl_height_of g) p (crtos_height_value (crtos_right_wired g p) p) c<=UINT_MAX).
       unfold avl_height_update. destruct (Z.eq_dec c p);[contradiction|]. pose proof (proj1 (proj1 (proj2 T) c Vc));lia.
     * inversion C;subst c. split; [exact V|]. split; [exact N|].
       change (0<=avl_height_update (avl_height_of g) p (crtos_height_value (crtos_right_wired g p) p) p<=UINT_MAX).
       unfold avl_height_update. destruct (Z.eq_dec p p);[rewrite Hv;lia|contradiction].
   + unfold crtos_height_value. change (1 <= Z.max
 (avl_child_height (crtos_update_height (crtos_right_wired g p) p) (if Z.eq_dec q p then avl_right g (avl_ptr_of (avl_left g p)) else avl_left g q))
 (avl_child_height (crtos_update_height (crtos_right_wired g p) p) (if Z.eq_dec q (avl_ptr_of (avl_left g p)) then Some p else avl_right g q))+1<=UINT_MAX).
     rewrite L. simpl avl_ptr_of. destruct (Z.eq_dec q p), (Z.eq_dec q q);try congruence.
     rewrite CH by exact Al. simpl avl_child_height.
     change (1 <= Z.max (avl_child_height g (avl_left g q)) (avl_height_update (avl_height_of g) p (crtos_height_value (crtos_right_wired g p) p) p)+1<=UINT_MAX).
     unfold avl_height_update. destruct (Z.eq_dec p p);[rewrite Hv;lia|contradiction].
Qed.
Lemma crtos_left_ready_tree__balance_readiness : forall g p,
 avl_tree_valid g -> avl_vvalid g p -> p<>0 ->
 avl_model_balance_factor g p < 0 -> crtos_left_ready g p.
Proof.
 intros g p T V N F.
 pose proof (proj2 (crtos_factor_children__crtos_insert_composition g p T V) F) as Q.
 destruct (avl_right g p) as [q|] eqn:L; [|unfold avl_model_balance_factor in F; rewrite L in F; simpl avl_child_height in F; pose proof (crtos_child_bound__balance_readiness g p (avl_left g p) T V (or_introl eq_refl));lia].
 change (avl_vvalid g q) in Q.
 pose proof (proj2 (proj2 T) q Q) as Nq.
 pose proof (proj1 (proj2 T) p V) as [Bp Ep].
 pose proof (proj1 (proj2 T) q Q) as [Bq Eq].
 pose proof (crtos_child_bound__balance_readiness g p (Some q) T V (or_intror L)) as Pq.
 simpl avl_child_height in Pq.
 assert (D:p<>q) by (intro E;subst;lia).
 pose proof (crtos_child_bound__balance_readiness g q (avl_right g q) T Q (or_intror eq_refl)) as Bl.
 pose proof (crtos_child_bound__balance_readiness g q (avl_left g q) T Q (or_introl eq_refl)) as Br.
 pose proof (crtos_child_bound__balance_readiness g p (avl_left g p) T V (or_introl eq_refl)) as Bpr.
 assert (Al:avl_right g q<>Some p) by (intro E;rewrite E in Bl;simpl avl_child_height in Bl;lia).
 unfold avl_model_balance_factor in F. rewrite L in F. simpl avl_child_height in F.
 set (h:=Z.max (avl_child_height g (avl_left g q)) (avl_child_height g (avl_left g p))+1).
 assert (Bh:1<=h<=avl_height_of g q) by (unfold h;lia).
 assert (Hv:crtos_height_value (crtos_left_wired g p) p=h).
 { unfold crtos_height_value. rewrite Z.max_comm. change ((Z.max
 (avl_child_height g (if Z.eq_dec p p then avl_left g (avl_ptr_of (avl_right g p)) else avl_right g p))
 (avl_child_height g (if Z.eq_dec p (avl_ptr_of (avl_right g p)) then Some p else avl_left g p))+1)=h).
 rewrite L. simpl avl_ptr_of. destruct (Z.eq_dec p p), (Z.eq_dec p q);try congruence. reflexivity. }
 assert (CH:forall c,c<>Some p -> avl_child_height (crtos_update_height (crtos_left_wired g p) p) c=avl_child_height g c).
 { intros [c|] E; [|reflexivity]. unfold avl_child_height,crtos_update_height. change (avl_height_update (avl_height_of g) p (crtos_height_value (crtos_left_wired g p) p) c=avl_height_of g c).
 unfold avl_height_update. destruct (Z.eq_dec c p);congruence. }
 unfold crtos_left_ready. rewrite L. simpl avl_ptr_of.
 split; [exact (crtos_valid_domain__crtos_insert_composition g T)|].
 split; [exact V|]. split; [exact N|]. split; [exact Q|]. split; [exact Nq|]. split; [exact D|]. split.
 - split; [exact (crtos_valid_domain__crtos_insert_composition g T)|].
   split; [exact V|]. split; [exact N|]. split.
   + intros c C. apply or_comm in C. change ((if Z.eq_dec p p then avl_left g (avl_ptr_of (avl_right g p)) else avl_right g p)=Some c \/ (if Z.eq_dec p (avl_ptr_of (avl_right g p)) then Some p else avl_left g p)=Some c) in C.
     rewrite L in C. simpl avl_ptr_of in C. destruct (Z.eq_dec p p), (Z.eq_dec p q);try congruence.
     assert (Vc:avl_vvalid g c) by (destruct C; eapply avl_graph_child_valid__root_and_factor_setup;[exact (proj1 T)|exact Q|left;assumption|exact (proj1 T)|exact V|left;assumption]).
     split; [exact Vc|]. split; [exact (proj2 (proj2 T) c Vc)|]. change (0<=avl_height_of g c<=UINT_MAX). pose proof (proj1 (proj1 (proj2 T) c Vc));lia.
   + rewrite Hv. lia.
 - split; [exact (crtos_valid_domain__crtos_insert_composition g T)|].
   split; [exact Q|]. split; [exact Nq|]. split.
   + intros c C. apply or_comm in C. change ((if Z.eq_dec q p then avl_left g (avl_ptr_of (avl_right g p)) else avl_right g q)=Some c \/ (if Z.eq_dec q (avl_ptr_of (avl_right g p)) then Some p else avl_left g q)=Some c) in C.
     rewrite L in C. simpl avl_ptr_of in C. destruct (Z.eq_dec q p), (Z.eq_dec q q);try congruence.
     destruct C as [C|C].
     * assert (Vc:avl_vvalid g c) by (eapply avl_graph_child_valid__root_and_factor_setup;[exact (proj1 T)|exact Q|right;exact C]).
       assert (Nc:c<>p) by (intro E;subst;contradiction).
       split; [exact Vc|]. split; [exact (proj2 (proj2 T) c Vc)|].
       change (0<=avl_height_update (avl_height_of g) p (crtos_height_value (crtos_left_wired g p) p) c<=UINT_MAX).
       unfold avl_height_update. destruct (Z.eq_dec c p);[contradiction|]. pose proof (proj1 (proj1 (proj2 T) c Vc));lia.
     * inversion C;subst c. split; [exact V|]. split; [exact N|].
       change (0<=avl_height_update (avl_height_of g) p (crtos_height_value (crtos_left_wired g p) p) p<=UINT_MAX).
       unfold avl_height_update. destruct (Z.eq_dec p p);[rewrite Hv;lia|contradiction].
   + unfold crtos_height_value. rewrite Z.max_comm. change (1 <= Z.max
 (avl_child_height (crtos_update_height (crtos_left_wired g p) p) (if Z.eq_dec q p then avl_left g (avl_ptr_of (avl_right g p)) else avl_right g q))
 (avl_child_height (crtos_update_height (crtos_left_wired g p) p) (if Z.eq_dec q (avl_ptr_of (avl_right g p)) then Some p else avl_left g q))+1<=UINT_MAX).
     rewrite L. simpl avl_ptr_of. destruct (Z.eq_dec q p), (Z.eq_dec q q);try congruence.
     rewrite CH by exact Al. simpl avl_child_height.
     change (1 <= Z.max (avl_child_height g (avl_right g q)) (avl_height_update (avl_height_of g) p (crtos_height_value (crtos_left_wired g p) p) p)+1<=UINT_MAX).
     unfold avl_height_update. destruct (Z.eq_dec p p);[rewrite Hv;lia|contradiction].
Qed.
Lemma crtos_right_ready_local__balance_readiness : forall g p q,
 crtos_raw_domain g -> avl_left g p=Some q ->
 avl_vvalid g p -> p<>0 -> avl_vvalid g q -> q<>0 -> p<>q ->
 1<=avl_height_of g p<=UINT_MAX ->
 0<=avl_height_of g q<avl_height_of g p ->
 0<=avl_child_height g (avl_left g q)<avl_height_of g q ->
 0<=avl_child_height g (avl_right g q)<avl_height_of g q ->
 0<=avl_child_height g (avl_right g p)<avl_height_of g p ->
 (forall x c, x=p \/ x=q -> avl_left g x=Some c \/ avl_right g x=Some c ->
 avl_vvalid g c /\ c<>0 /\ 0<=avl_height_of g c<=UINT_MAX) ->
 avl_left g q<>Some p ->
 0<avl_model_balance_factor g p -> crtos_right_ready g p.
Proof.
 intros g p q D0 L V N Q Nq D Bp Pq Bl Br Bpr C0 Al F.
 unfold avl_model_balance_factor in F. rewrite L in F. simpl avl_child_height in F.
 set (h:=Z.max (avl_child_height g (avl_right g q)) (avl_child_height g (avl_right g p))+1).
 assert (Bh:1<=h<=avl_height_of g q) by (unfold h;lia).
 assert (Hv:crtos_height_value (crtos_right_wired g p) p=h).
 { unfold crtos_height_value. change ((Z.max
 (avl_child_height g (if Z.eq_dec p p then avl_right g (avl_ptr_of (avl_left g p)) else avl_left g p))
 (avl_child_height g (if Z.eq_dec p (avl_ptr_of (avl_left g p)) then Some p else avl_right g p))+1)=h).
 rewrite L. simpl avl_ptr_of. destruct (Z.eq_dec p p), (Z.eq_dec p q);try congruence. reflexivity. }
 assert (CH:forall c,c<>Some p -> avl_child_height (crtos_update_height (crtos_right_wired g p) p) c=avl_child_height g c).
 { intros [c|] E; [|reflexivity]. unfold avl_child_height,crtos_update_height. change (avl_height_update (avl_height_of g) p (crtos_height_value (crtos_right_wired g p) p) c=avl_height_of g c).
 unfold avl_height_update. destruct (Z.eq_dec c p);congruence. }
 unfold crtos_right_ready. rewrite L. simpl avl_ptr_of.
 split; [exact (D0)|].
 split; [exact V|]. split; [exact N|]. split; [exact Q|]. split; [exact Nq|]. split; [exact D|]. split.
 - split; [exact (D0)|].
   split; [exact V|]. split; [exact N|]. split.
   + intros c C. change ((if Z.eq_dec p p then avl_right g (avl_ptr_of (avl_left g p)) else avl_left g p)=Some c \/ (if Z.eq_dec p (avl_ptr_of (avl_left g p)) then Some p else avl_right g p)=Some c) in C.
     rewrite L in C. simpl avl_ptr_of in C. destruct (Z.eq_dec p p), (Z.eq_dec p q);try congruence.
     assert (BC:avl_vvalid g c /\ c<>0 /\ 0<=avl_height_of g c<=UINT_MAX) by (destruct C; eapply C0; [right;reflexivity|right;assumption|left;reflexivity|right;assumption]).
     destruct BC as [Vc [Nc Bc]].
     split; [exact Vc|]. split; [exact Nc|]. change (0<=avl_height_of g c<=UINT_MAX). lia.
   + rewrite Hv. lia.
 - split; [exact (D0)|].
   split; [exact Q|]. split; [exact Nq|]. split.
   + intros c C. change ((if Z.eq_dec q p then avl_right g (avl_ptr_of (avl_left g p)) else avl_left g q)=Some c \/ (if Z.eq_dec q (avl_ptr_of (avl_left g p)) then Some p else avl_right g q)=Some c) in C.
     rewrite L in C. simpl avl_ptr_of in C. destruct (Z.eq_dec q p), (Z.eq_dec q q);try congruence.
     destruct C as [C|C].
     * destruct (C0 q c (or_intror eq_refl) (or_introl C)) as [Vc [Ncc Bc]].
       assert (Nc:c<>p) by (intro E;subst;contradiction).
       split; [exact Vc|]. split; [exact Ncc|].
       change (0<=avl_height_update (avl_height_of g) p (crtos_height_value (crtos_right_wired g p) p) c<=UINT_MAX).
       unfold avl_height_update. destruct (Z.eq_dec c p);[contradiction|]. lia.
     * inversion C;subst c. split; [exact V|]. split; [exact N|].
       change (0<=avl_height_update (avl_height_of g) p (crtos_height_value (crtos_right_wired g p) p) p<=UINT_MAX).
       unfold avl_height_update. destruct (Z.eq_dec p p);[rewrite Hv;lia|contradiction].
   + unfold crtos_height_value. change (1 <= Z.max
 (avl_child_height (crtos_update_height (crtos_right_wired g p) p) (if Z.eq_dec q p then avl_right g (avl_ptr_of (avl_left g p)) else avl_left g q))
 (avl_child_height (crtos_update_height (crtos_right_wired g p) p) (if Z.eq_dec q (avl_ptr_of (avl_left g p)) then Some p else avl_right g q))+1<=UINT_MAX).
     rewrite L. simpl avl_ptr_of. destruct (Z.eq_dec q p), (Z.eq_dec q q);try congruence.
     rewrite CH by exact Al. simpl avl_child_height.
     change (1 <= Z.max (avl_child_height g (avl_left g q)) (avl_height_update (avl_height_of g) p (crtos_height_value (crtos_right_wired g p) p) p)+1<=UINT_MAX).
     unfold avl_height_update. destruct (Z.eq_dec p p);[rewrite Hv;lia|contradiction].
Qed.
Lemma crtos_lr_shape__balance_readiness : forall g p q r,
 avl_left g p=Some q -> avl_right g q=Some r ->
 p<>q -> p<>r -> q<>r -> avl_right g r<>Some q ->
 let h:=Z.max (avl_child_height g (avl_left g q)) (avl_child_height g (avl_left g r))+1 in
 let k:=Z.max h (avl_child_height g (avl_right g r))+1 in
 let m:=crtos_lr_middle_model g p in
 avl_left m p=Some r /\ avl_right m p=avl_right g p /\
 avl_left m r=Some q /\ avl_right m r=avl_right g r /\
 (forall x,avl_height_of m x=if Z.eq_dec x r then k else if Z.eq_dec x q then h else avl_height_of g x).
Proof.
 intros g p q r L R Pq Pr Qr C h k m.
 assert (E:avl_ptr_of (avl_left g p)=q) by (rewrite L;reflexivity).
 unfold m,crtos_lr_middle_model. rewrite E.
 unfold crtos_rotate_left. rewrite R.
 unfold crtos_reroot_rotation,crtos_set_root,crtos_set_left,crtos_set_right,crtos_update_height,crtos_height_value,crtos_fields.
 cbv beta iota zeta delta [avl_left avl_right avl_root avl_nodes avl_vvalid avl_key_of avl_ptr_of avl_child_height avl_height_of avl_bst avl_with_root_cache avl_height_update GraphLib.examples.bst.bst_tree GraphLib.examples.bst.left_child GraphLib.examples.bst.right_child GraphLib.examples.bst.bst_key GraphLib.examples.bst.theroot GraphLib.examples.bst.listV].
 repeat match goal with |- context[Z.eq_dec ?a ?b] => destruct (Z.eq_dec a b); try congruence end.

 repeat split; try reflexivity.
 intro x.
 change ((if Z.eq_dec x r then Z.max h
 (match avl_right g r with Some c => if Z.eq_dec c q then h else avl_height_of g c | None => 0 end)+1
 else if Z.eq_dec x q then h else avl_height_of g x)=
 (if Z.eq_dec x r then k else if Z.eq_dec x q then h else avl_height_of g x)).
 destruct (avl_right g r) as [c|] eqn:Rc; [|reflexivity].
 destruct (Z.eq_dec c q); [subst;contradiction|]. reflexivity.
Qed.
Lemma crtos_lr_ready_tree__balance_readiness : forall g p,
 avl_tree_valid g -> avl_vvalid g p -> p<>0 ->
 avl_model_balance_factor g p=2 ->
 avl_model_balance_factor g (avl_ptr_of (avl_left g p)) = -1 ->
 crtos_lr_ready g p.
Proof.
 intros g p T V N F G.
 pose proof (proj1 (crtos_factor_children__crtos_insert_composition g p T V) ltac:(lia)) as Q.
 destruct (avl_left g p) as [q|] eqn:L; [|change (avl_vvalid g 0) in Q;pose proof (proj2 (proj2 T) 0 Q);contradiction].
 change (avl_vvalid g q) in Q. simpl avl_ptr_of in G.
 pose proof (proj2 (proj2 T) q Q) as Nq.
 pose proof (proj2 (crtos_factor_children__crtos_insert_composition g q T Q) ltac:(lia)) as Rv.
 destruct (avl_right g q) as [r|] eqn:R; [|change (avl_vvalid g 0) in Rv;pose proof (proj2 (proj2 T) 0 Rv);contradiction].
 change (avl_vvalid g r) in Rv. pose proof (proj2 (proj2 T) r Rv) as Nr.
 pose proof (proj1 (proj2 T) p V) as [Bp Ep].
 pose proof (proj1 (proj2 T) q Q) as [Bq Eq].
 pose proof (proj1 (proj2 T) r Rv) as [Br Er].
 pose proof (crtos_child_bound__balance_readiness g p (Some q) T V (or_introl L)) as Pq.
 pose proof (crtos_child_bound__balance_readiness g q (Some r) T Q (or_intror R)) as Qr.
 pose proof (crtos_child_bound__balance_readiness g p (avl_right g p) T V (or_intror eq_refl)) as Bd.
 pose proof (crtos_child_bound__balance_readiness g q (avl_left g q) T Q (or_introl eq_refl)) as Ba.
 pose proof (crtos_child_bound__balance_readiness g r (avl_left g r) T Rv (or_introl eq_refl)) as Bb.
 pose proof (crtos_child_bound__balance_readiness g r (avl_right g r) T Rv (or_intror eq_refl)) as Bc.
 simpl avl_child_height in Pq,Qr.
 assert (Dpq:p<>q) by (intro E;subst;lia).
 assert (Dpr:p<>r) by (intro E;subst;lia).
 assert (Dqr:q<>r) by (intro E;subst;lia).
 assert (Rc:avl_right g r<>Some q) by (intro E;rewrite E in Bc;simpl avl_child_height in Bc;lia).
 unfold avl_model_balance_factor in F,G. rewrite L in F. rewrite R in G. simpl avl_child_height in F,G.
 rewrite L in Ep. rewrite R in Eq. simpl avl_child_height in Ep,Eq.
 assert (Hp:avl_height_of g p=avl_height_of g q+1) by lia.
 assert (Hq:avl_height_of g q=avl_height_of g r+1) by lia.
 set (m:=crtos_lr_middle_model g p).
 pose proof (crtos_lr_shape__balance_readiness g p q r L R Dpq Dpr Dqr Rc) as [Mp [Mrp [Mrl [Mrr Hm]]]]. fold m in Mp,Mrp,Mrl,Mrr,Hm.
 assert (Hh:Z.max (avl_child_height g (avl_left g q)) (avl_child_height g (avl_left g r))+1=avl_height_of g r) by lia.
 rewrite Hh in Hm.
 assert (Hk:Z.max (avl_height_of g r) (avl_child_height g (avl_right g r))+1=avl_height_of g q) by lia.
 rewrite Hk in Hm.
 assert (MHp:avl_height_of m p=avl_height_of g p) by (rewrite Hm;repeat match goal with |- context[Z.eq_dec ?a ?b] => destruct (Z.eq_dec a b) end;congruence).
 assert (MHq:avl_height_of m q=avl_height_of g r) by (rewrite Hm;repeat match goal with |- context[Z.eq_dec ?a ?b] => destruct (Z.eq_dec a b) end;congruence).
 assert (MHr:avl_height_of m r=avl_height_of g q) by (rewrite Hm;repeat match goal with |- context[Z.eq_dec ?a ?b] => destruct (Z.eq_dec a b) end;congruence).
 assert (HC:forall c, avl_right g p=Some c \/ avl_right g r=Some c ->
 avl_vvalid g c /\ c<>0 /\ 0<=avl_height_of g c<=UINT_MAX /\ avl_height_of m c=avl_height_of g c).
 { intros c C. assert (Vc:avl_vvalid g c) by (destruct C; eapply avl_graph_child_valid__root_and_factor_setup;[exact (proj1 T)|exact V|right;assumption|exact (proj1 T)|exact Rv|right;assumption]).
   pose proof (proj1 (proj1 (proj2 T) c Vc)) as Bcc.
   assert (Bccr:avl_height_of g c<avl_height_of g r) by (destruct C as [C|C];[rewrite C in Bd,F|rewrite C in Bc];simpl avl_child_height in *;lia).
   split; [exact Vc|]. split; [exact (proj2 (proj2 T) c Vc)|]. split; [lia|].
   rewrite Hm. repeat match goal with |- context[Z.eq_dec ?a ?b] => destruct (Z.eq_dec a b) end; subst;try lia;reflexivity. }
 assert (CHd:avl_child_height m (avl_right g p)=avl_child_height g (avl_right g p)).
 { destruct (avl_right g p) as [c|] eqn:C;[exact (proj2 (proj2 (proj2 (HC c (or_introl eq_refl)))))|reflexivity]. }
 assert (CHc:avl_child_height m (avl_right g r)=avl_child_height g (avl_right g r)).
 { destruct (avl_right g r) as [c|] eqn:C;[exact (proj2 (proj2 (proj2 (HC c (or_intror eq_refl)))))|reflexivity]. }
 unfold crtos_lr_ready. rewrite L. simpl avl_ptr_of. split;[exact (crtos_valid_domain__crtos_insert_composition g T)|]. split;[exact V|]. split;[exact N|]. split.
 - apply crtos_left_ready_tree__balance_readiness;auto. unfold avl_model_balance_factor. rewrite R. simpl avl_child_height. lia.
 - apply (crtos_right_ready_local__balance_readiness m p r).
   + exact (crtos_valid_domain__crtos_insert_composition g T).
   + exact Mp.
   + exact V.
   + exact N.
   + exact Rv.
   + exact Nr.
   + exact Dpr.
   + rewrite MHp;exact Bp.
   + rewrite MHr,MHp;lia.
   + rewrite Mrl. change (0<=avl_height_of m q<avl_height_of m r). rewrite MHq,MHr;lia.
   + rewrite Mrr,CHc,MHr;lia.
   + rewrite Mrp,CHd,MHp;lia.
   + intros x c [E|E] C;subst x.
     * rewrite Mp,Mrp in C. destruct C as [C|C].
       -- inversion C;subst c. split;[exact Rv|]. split;[exact Nr|]. rewrite MHr;lia.
       -- destruct (HC c (or_introl C)) as [Vc [Nc [Bc0 Hc]]]. split;[exact Vc|]. split;[exact Nc|]. rewrite Hc;exact Bc0.
     * rewrite Mrl,Mrr in C. destruct C as [C|C].
       -- inversion C;subst c. split;[exact Q|]. split;[exact Nq|]. rewrite MHq;lia.
       -- destruct (HC c (or_intror C)) as [Vc [Nc [Bc0 Hc]]]. split;[exact Vc|]. split;[exact Nc|]. rewrite Hc;exact Bc0.
   + rewrite Mrl. congruence.
   + unfold avl_model_balance_factor. rewrite Mp,Mrp. change (0<avl_height_of m r-avl_child_height m (avl_right g p)). rewrite MHr,CHd;lia.
Qed.
Lemma crtos_left_ready_local__balance_readiness : forall g p q,
 crtos_raw_domain g -> avl_right g p=Some q ->
 avl_vvalid g p -> p<>0 -> avl_vvalid g q -> q<>0 -> p<>q ->
 1<=avl_height_of g p<=UINT_MAX ->
 0<=avl_height_of g q<avl_height_of g p ->
 0<=avl_child_height g (avl_right g q)<avl_height_of g q ->
 0<=avl_child_height g (avl_left g q)<avl_height_of g q ->
 0<=avl_child_height g (avl_left g p)<avl_height_of g p ->
 (forall x c, x=p \/ x=q -> avl_right g x=Some c \/ avl_left g x=Some c ->
 avl_vvalid g c /\ c<>0 /\ 0<=avl_height_of g c<=UINT_MAX) ->
 avl_right g q<>Some p ->
 avl_model_balance_factor g p<0 -> crtos_left_ready g p.
Proof.
 intros g p q D0 L V N Q Nq D Bp Pq Bl Br Bpr C0 Al F.
 unfold avl_model_balance_factor in F. rewrite L in F. simpl avl_child_height in F.
 set (h:=Z.max (avl_child_height g (avl_left g q)) (avl_child_height g (avl_left g p))+1).
 assert (Bh:1<=h<=avl_height_of g q) by (unfold h;lia).
 assert (Hv:crtos_height_value (crtos_left_wired g p) p=h).
 { unfold crtos_height_value. rewrite Z.max_comm. change ((Z.max
 (avl_child_height g (if Z.eq_dec p p then avl_left g (avl_ptr_of (avl_right g p)) else avl_right g p))
 (avl_child_height g (if Z.eq_dec p (avl_ptr_of (avl_right g p)) then Some p else avl_left g p))+1)=h).
 rewrite L. simpl avl_ptr_of. destruct (Z.eq_dec p p), (Z.eq_dec p q);try congruence. reflexivity. }
 assert (CH:forall c,c<>Some p -> avl_child_height (crtos_update_height (crtos_left_wired g p) p) c=avl_child_height g c).
 { intros [c|] E; [|reflexivity]. unfold avl_child_height,crtos_update_height. change (avl_height_update (avl_height_of g) p (crtos_height_value (crtos_left_wired g p) p) c=avl_height_of g c).
 unfold avl_height_update. destruct (Z.eq_dec c p);congruence. }
 unfold crtos_left_ready. rewrite L. simpl avl_ptr_of.
 split; [exact (D0)|].
 split; [exact V|]. split; [exact N|]. split; [exact Q|]. split; [exact Nq|]. split; [exact D|]. split.
 - split; [exact (D0)|].
   split; [exact V|]. split; [exact N|]. split.
   + intros c C. apply or_comm in C. change ((if Z.eq_dec p p then avl_left g (avl_ptr_of (avl_right g p)) else avl_right g p)=Some c \/ (if Z.eq_dec p (avl_ptr_of (avl_right g p)) then Some p else avl_left g p)=Some c) in C.
     rewrite L in C. simpl avl_ptr_of in C. destruct (Z.eq_dec p p), (Z.eq_dec p q);try congruence.
     assert (BC:avl_vvalid g c /\ c<>0 /\ 0<=avl_height_of g c<=UINT_MAX) by (destruct C; eapply C0; [right;reflexivity|right;assumption|left;reflexivity|right;assumption]).
     destruct BC as [Vc [Nc Bc]].
     split; [exact Vc|]. split; [exact Nc|]. change (0<=avl_height_of g c<=UINT_MAX). lia.
   + rewrite Hv. lia.
 - split; [exact (D0)|].
   split; [exact Q|]. split; [exact Nq|]. split.
   + intros c C. apply or_comm in C. change ((if Z.eq_dec q p then avl_left g (avl_ptr_of (avl_right g p)) else avl_right g q)=Some c \/ (if Z.eq_dec q (avl_ptr_of (avl_right g p)) then Some p else avl_left g q)=Some c) in C.
     rewrite L in C. simpl avl_ptr_of in C. destruct (Z.eq_dec q p), (Z.eq_dec q q);try congruence.
     destruct C as [C|C].
     * destruct (C0 q c (or_intror eq_refl) (or_introl C)) as [Vc [Ncc Bc]].
       assert (Nc:c<>p) by (intro E;subst;contradiction).
       split; [exact Vc|]. split; [exact Ncc|].
       change (0<=avl_height_update (avl_height_of g) p (crtos_height_value (crtos_left_wired g p) p) c<=UINT_MAX).
       unfold avl_height_update. destruct (Z.eq_dec c p);[contradiction|]. lia.
     * inversion C;subst c. split; [exact V|]. split; [exact N|].
       change (0<=avl_height_update (avl_height_of g) p (crtos_height_value (crtos_left_wired g p) p) p<=UINT_MAX).
       unfold avl_height_update. destruct (Z.eq_dec p p);[rewrite Hv;lia|contradiction].
   + unfold crtos_height_value. rewrite Z.max_comm. change (1 <= Z.max
 (avl_child_height (crtos_update_height (crtos_left_wired g p) p) (if Z.eq_dec q p then avl_left g (avl_ptr_of (avl_right g p)) else avl_right g q))
 (avl_child_height (crtos_update_height (crtos_left_wired g p) p) (if Z.eq_dec q (avl_ptr_of (avl_right g p)) then Some p else avl_left g q))+1<=UINT_MAX).
     rewrite L. simpl avl_ptr_of. destruct (Z.eq_dec q p), (Z.eq_dec q q);try congruence.
     rewrite CH by exact Al. simpl avl_child_height.
     change (1 <= Z.max (avl_child_height g (avl_right g q)) (avl_height_update (avl_height_of g) p (crtos_height_value (crtos_left_wired g p) p) p)+1<=UINT_MAX).
     unfold avl_height_update. destruct (Z.eq_dec p p);[rewrite Hv;lia|contradiction].
Qed.
Lemma crtos_rl_shape__balance_readiness : forall g p q r,
 avl_right g p=Some q -> avl_left g q=Some r ->
 p<>q -> p<>r -> q<>r -> avl_left g r<>Some q ->
 let h:=Z.max (avl_child_height g (avl_right g r)) (avl_child_height g (avl_right g q))+1 in
 let k:=Z.max (avl_child_height g (avl_left g r)) h+1 in
 let m:=crtos_rl_middle_model g p in
 avl_right m p=Some r /\ avl_left m p=avl_left g p /\
 avl_right m r=Some q /\ avl_left m r=avl_left g r /\
 (forall x,avl_height_of m x=if Z.eq_dec x r then k else if Z.eq_dec x q then h else avl_height_of g x).
Proof.
 intros g p q r L R Pq Pr Qr C h k m.
 assert (E:avl_ptr_of (avl_right g p)=q) by (rewrite L;reflexivity).
 unfold m,crtos_rl_middle_model. rewrite E.
 unfold crtos_rotate_right. rewrite R.
 unfold crtos_reroot_rotation,crtos_set_root,crtos_set_right,crtos_set_left,crtos_update_height,crtos_height_value,crtos_fields.
 cbv beta iota zeta delta [avl_right avl_left avl_root avl_nodes avl_vvalid avl_key_of avl_ptr_of avl_child_height avl_height_of avl_bst avl_with_root_cache avl_height_update GraphLib.examples.bst.bst_tree GraphLib.examples.bst.right_child GraphLib.examples.bst.left_child GraphLib.examples.bst.bst_key GraphLib.examples.bst.theroot GraphLib.examples.bst.listV].
 repeat match goal with |- context[Z.eq_dec ?a ?b] => destruct (Z.eq_dec a b); try congruence end.

 repeat split; try reflexivity.
 intro x.
 change ((if Z.eq_dec x r then Z.max
 (match avl_left g r with Some c => if Z.eq_dec c q then h else avl_height_of g c | None => 0 end) h+1
 else if Z.eq_dec x q then h else avl_height_of g x)=
 (if Z.eq_dec x r then k else if Z.eq_dec x q then h else avl_height_of g x)).
 destruct (avl_left g r) as [c|] eqn:Rc; [|reflexivity].
 destruct (Z.eq_dec c q); [subst;contradiction|]. reflexivity.
Qed.
Lemma crtos_rl_ready_tree__balance_readiness : forall g p,
 avl_tree_valid g -> avl_vvalid g p -> p<>0 ->
 avl_model_balance_factor g p= -2 ->
 avl_model_balance_factor g (avl_ptr_of (avl_right g p)) = 1 ->
 crtos_rl_ready g p.
Proof.
 intros g p T V N F G.
 pose proof (proj2 (crtos_factor_children__crtos_insert_composition g p T V) ltac:(lia)) as Q.
 destruct (avl_right g p) as [q|] eqn:L; [|change (avl_vvalid g 0) in Q;pose proof (proj2 (proj2 T) 0 Q);contradiction].
 change (avl_vvalid g q) in Q. simpl avl_ptr_of in G.
 pose proof (proj2 (proj2 T) q Q) as Nq.
 pose proof (proj1 (crtos_factor_children__crtos_insert_composition g q T Q) ltac:(lia)) as Rv.
 destruct (avl_left g q) as [r|] eqn:R; [|change (avl_vvalid g 0) in Rv;pose proof (proj2 (proj2 T) 0 Rv);contradiction].
 change (avl_vvalid g r) in Rv. pose proof (proj2 (proj2 T) r Rv) as Nr.
 pose proof (proj1 (proj2 T) p V) as [Bp Ep].
 pose proof (proj1 (proj2 T) q Q) as [Bq Eq].
 pose proof (proj1 (proj2 T) r Rv) as [Br Er].
 pose proof (crtos_child_bound__balance_readiness g p (Some q) T V (or_intror L)) as Pq.
 pose proof (crtos_child_bound__balance_readiness g q (Some r) T Q (or_introl R)) as Qr.
 pose proof (crtos_child_bound__balance_readiness g p (avl_left g p) T V (or_introl eq_refl)) as Bd.
 pose proof (crtos_child_bound__balance_readiness g q (avl_right g q) T Q (or_intror eq_refl)) as Ba.
 pose proof (crtos_child_bound__balance_readiness g r (avl_right g r) T Rv (or_intror eq_refl)) as Bb.
 pose proof (crtos_child_bound__balance_readiness g r (avl_left g r) T Rv (or_introl eq_refl)) as Bc.
 simpl avl_child_height in Pq,Qr.
 assert (Dpq:p<>q) by (intro E;subst;lia).
 assert (Dpr:p<>r) by (intro E;subst;lia).
 assert (Dqr:q<>r) by (intro E;subst;lia).
 assert (Rc:avl_left g r<>Some q) by (intro E;rewrite E in Bc;simpl avl_child_height in Bc;lia).
 unfold avl_model_balance_factor in F,G. rewrite L in F. rewrite R in G. simpl avl_child_height in F,G.
 rewrite L in Ep. rewrite R in Eq. simpl avl_child_height in Ep,Eq.
 assert (Hp:avl_height_of g p=avl_height_of g q+1) by lia.
 assert (Hq:avl_height_of g q=avl_height_of g r+1) by lia.
 set (m:=crtos_rl_middle_model g p).
 pose proof (crtos_rl_shape__balance_readiness g p q r L R Dpq Dpr Dqr Rc) as [Mp [Mrp [Mrl [Mrr Hm]]]]. fold m in Mp,Mrp,Mrl,Mrr,Hm.
 assert (Hh:Z.max (avl_child_height g (avl_right g r)) (avl_child_height g (avl_right g q))+1=avl_height_of g r) by lia.
 rewrite Hh in Hm.
 assert (Hk:Z.max (avl_child_height g (avl_left g r)) (avl_height_of g r)+1=avl_height_of g q) by lia.
 rewrite Hk in Hm.
 assert (MHp:avl_height_of m p=avl_height_of g p) by (rewrite Hm;repeat match goal with |- context[Z.eq_dec ?a ?b] => destruct (Z.eq_dec a b) end;congruence).
 assert (MHq:avl_height_of m q=avl_height_of g r) by (rewrite Hm;repeat match goal with |- context[Z.eq_dec ?a ?b] => destruct (Z.eq_dec a b) end;congruence).
 assert (MHr:avl_height_of m r=avl_height_of g q) by (rewrite Hm;repeat match goal with |- context[Z.eq_dec ?a ?b] => destruct (Z.eq_dec a b) end;congruence).
 assert (HC:forall c, avl_left g p=Some c \/ avl_left g r=Some c ->
 avl_vvalid g c /\ c<>0 /\ 0<=avl_height_of g c<=UINT_MAX /\ avl_height_of m c=avl_height_of g c).
 { intros c C. assert (Vc:avl_vvalid g c) by (destruct C; eapply avl_graph_child_valid__root_and_factor_setup;[exact (proj1 T)|exact V|left;assumption|exact (proj1 T)|exact Rv|left;assumption]).
   pose proof (proj1 (proj1 (proj2 T) c Vc)) as Bcc.
   assert (Bccr:avl_height_of g c<avl_height_of g r) by (destruct C as [C|C];[rewrite C in Bd,F|rewrite C in Bc];simpl avl_child_height in *;lia).
   split; [exact Vc|]. split; [exact (proj2 (proj2 T) c Vc)|]. split; [lia|].
   rewrite Hm. repeat match goal with |- context[Z.eq_dec ?a ?b] => destruct (Z.eq_dec a b) end; subst;try lia;reflexivity. }
 assert (CHd:avl_child_height m (avl_left g p)=avl_child_height g (avl_left g p)).
 { destruct (avl_left g p) as [c|] eqn:C;[exact (proj2 (proj2 (proj2 (HC c (or_introl eq_refl)))))|reflexivity]. }
 assert (CHc:avl_child_height m (avl_left g r)=avl_child_height g (avl_left g r)).
 { destruct (avl_left g r) as [c|] eqn:C;[exact (proj2 (proj2 (proj2 (HC c (or_intror eq_refl)))))|reflexivity]. }
 unfold crtos_rl_ready. rewrite L. simpl avl_ptr_of. split;[exact (crtos_valid_domain__crtos_insert_composition g T)|]. split;[exact V|]. split;[exact N|]. split.
 - apply crtos_right_ready_tree__balance_readiness;auto. unfold avl_model_balance_factor. rewrite R. simpl avl_child_height. lia.
 - apply (crtos_left_ready_local__balance_readiness m p r).
   + exact (crtos_valid_domain__crtos_insert_composition g T).
   + exact Mp.
   + exact V.
   + exact N.
   + exact Rv.
   + exact Nr.
   + exact Dpr.
   + rewrite MHp;exact Bp.
   + rewrite MHr,MHp;lia.
   + rewrite Mrl. change (0<=avl_height_of m q<avl_height_of m r). rewrite MHq,MHr;lia.
   + rewrite Mrr,CHc,MHr;lia.
   + rewrite Mrp,CHd,MHp;lia.
   + intros x c [E|E] C;subst x.
     * rewrite Mp,Mrp in C. destruct C as [C|C].
       -- inversion C;subst c. split;[exact Rv|]. split;[exact Nr|]. rewrite MHr;lia.
       -- destruct (HC c (or_introl C)) as [Vc [Nc [Bc0 Hc]]]. split;[exact Vc|]. split;[exact Nc|]. rewrite Hc;exact Bc0.
     * rewrite Mrl,Mrr in C. destruct C as [C|C].
       -- inversion C;subst c. split;[exact Q|]. split;[exact Nq|]. rewrite MHq;lia.
       -- destruct (HC c (or_intror C)) as [Vc [Nc [Bc0 Hc]]]. split;[exact Vc|]. split;[exact Nc|]. rewrite Hc;exact Bc0.
   + rewrite Mrl. congruence.
   + unfold avl_model_balance_factor. rewrite Mp,Mrp. change (avl_child_height m (avl_left g p)-avl_height_of m r<0). rewrite MHr,CHd;lia.
Qed.
Lemma crtos_subtree_partition__balance_returns : forall g p,
 NoDup (avl_nodes g) ->
 Permutation (avl_nodes g)
 (avl_nodes (avl_subtree_model g p) ++
 filter (fun x => if excluded_middle_informative (avl_reachable g p x) then false else true) (avl_nodes g)).
Proof.
 intros g p N. apply NoDup_Permutation; [exact N| |].
 - apply NoDup_app.
   + apply GraphLib.graph_basic.valid_NoDup_list_NoDup.
   + apply NoDup_filter. exact N.
   + intros x X Y. change (In x (avl_subtree_nodes g p)) in X.
     unfold avl_subtree_nodes in X. apply GraphLib.graph_basic.valid_NoDup_list_spec in X.
     apply filter_In in Y. destruct (excluded_middle_informative (avl_reachable g p x)); simpl in *; intuition congruence.
 - intro x. rewrite in_app_iff, filter_In.
   change (avl_nodes (avl_subtree_model g p)) with (avl_subtree_nodes g p).
   unfold avl_subtree_nodes. rewrite GraphLib.graph_basic.valid_NoDup_list_spec.
   destruct (excluded_middle_informative (avl_reachable g p x)); simpl; tauto.
Qed.
Lemma crtos_balance_subroot__balance_returns : forall g p,
 crtos_balance_ready g p ->
 avl_tree_valid (avl_subtree_model g p) /\ p<>0 /\ avl_vvalid (avl_subtree_model g p) p /\ crtos_unique_nodes (avl_subtree_model g p).
Proof.
 intros g p [V [N [T B]]]. split; [exact T|]. split; [exact N|]. split.
 - change (avl_vvalid g p /\ avl_reachable g p p). split; [exact V|].
   unfold avl_reachable, GraphLib.examples.bst.bt_path. exists 0%nat. hnf. reflexivity.
 - unfold crtos_unique_nodes. apply GraphLib.examples.bst.bst_listV_NoDup. exact (proj1 T).
Qed.
Lemma crtos_subtree_factor__balance_returns : forall g p x,
 avl_vvalid (avl_subtree_model g p) x ->
 avl_model_balance_factor (avl_subtree_model g p) x = avl_model_balance_factor g x.
Proof.
 intros g p x [_ R].
 destruct (avl_projection_children__lr_graph_composition g p x R) as [L Q].
 unfold avl_model_balance_factor. rewrite L,Q. reflexivity.
Qed.
Lemma crtos_projection_store_back__balance_returns : forall g p xs,
 Forall (avl_reachable g p) xs ->
 avl_graph_nodes_store (avl_subtree_model g p) xs |-- avl_graph_nodes_store g xs.
Proof.
 intros g p xs R. apply avl_nodes_store_map__lr_graph_composition.
 intros x X. apply Forall_forall with (x:=x) in R; auto.
 destruct (avl_projection_children__lr_graph_composition g p x R) as [L Q].
 unfold avl_graph_node_store. rewrite L,Q. Intros_p V. entailer!. exact (proj1 V).
Qed.
Lemma crtos_subtree_unfocus__balance_returns : forall g p,
 NoDup (avl_nodes g) ->
 avl_tree_store (avl_subtree_model g p) ** crtos_balance_external_store g p |--
 avl_tree_store g.
Proof.
 intros g p N.
 unfold avl_tree_store, crtos_balance_external_store.
 rewrite (avl_graph_nodes_store_permutation__graph_store_decomposition g _ _
 (crtos_subtree_partition__balance_returns g p N)).
 sep_apply_r_atomic (avl_graph_nodes_store_app__graph_store_decomposition g
 (avl_nodes (avl_subtree_model g p))
 (filter (fun x => if excluded_middle_informative (avl_reachable g p x) then false else true) (avl_nodes g))).
 sep_apply_l_atomic (crtos_projection_store_back__balance_returns g p
 (avl_nodes (avl_subtree_model g p))).
 - dump_pre_spatial. apply Forall_forall. intros x X.
   change (In x (avl_subtree_nodes g p)) in X.
   unfold avl_subtree_nodes in X. apply GraphLib.graph_basic.valid_NoDup_list_spec in X. tauto.
 - entailer!.
Qed.
Lemma crtos_identity_effect__balance_returns : forall g p,
 crtos_balance_ready g p -> Z.abs (avl_model_balance_factor g p)<=1 ->
 crtos_balance_effect g g p p.
Proof.
 intros g p B F.
 destruct (crtos_balance_subroot__balance_returns g p B) as [T [N [V Nd]]].
 assert (G:avl_gvalid (avl_subtree_model g p)).
 { apply avl_gvalid_tree_valid_iff. split; [exact T|].
   intros x X. rewrite (crtos_subtree_factor__balance_returns g p x X).
   destruct (Z.eq_dec x p); [subst;exact F|].
   exact (proj1 (proj2 (proj2 (proj2 B))) x X n). }
 unfold crtos_balance_effect.
 assert (M:crtos_balance_model g p=g).
 { unfold crtos_balance_model. apply Z.abs_le in F.
   destruct (Z_lt_dec 1 (avl_model_balance_factor g p));[lia|].
   destruct (Z_lt_dec (avl_model_balance_factor g p) (-1));[lia|reflexivity]. }
 assert (P:crtos_balance_ptr g p=p).
 { unfold crtos_balance_ptr. apply Z.abs_le in F.
   destruct (Z_lt_dec 1 (avl_model_balance_factor g p));[lia|].
   destruct (Z_lt_dec (avl_model_balance_factor g p) (-1));[lia|reflexivity]. }
 split; [symmetry;exact M|]. split; [symmetry;exact P|].
 split; [exact N|]. split; [reflexivity|].
 split; [intro x;tauto|]. split; [intro x;reflexivity|].
 split; [exact G|]. split; [intro x;tauto|].
 split; [lia|auto].
Qed.
Lemma crtos_left_restore__balance_returns :
 forall g after x y cf,
 avl_tree_valid g -> avl_root g=Some x ->
 (forall z,avl_vvalid g z ->z<>x ->Z.abs (avl_model_balance_factor g z)<=1) ->
 Z.abs (avl_model_balance_factor g x)<=2 ->
 avl_model_balance_factor g x < -1 ->
 avl_balance_factor_or_null g (avl_ptr_of (avl_right g x)) cf -> cf <= 0 ->
 avl_left_rotation_result g after x y ->
 avl_balanced after /\ avl_height_of g x-1<=avl_height_of after y<=avl_height_of g x.
Proof.
  intros g after x y cf T R Hbalance F Hsign Hcf Hcfs Hres.
 destruct T as [Hbst [Hheight Hnonnull]].
 assert (Hroot:x<>NULL ->avl_root g=Some x) by auto.
 assert (Hbound:x<>NULL ->Z.abs (avl_model_balance_factor g x)<=2) by auto.
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
  pose proof (avl_left_rotation_pivot_children__left_rotation_graph_heights
    g after x y Hv Hrot) as [Haly [Hary [Halx Harx]]].
  assert (Hta : avl_child_height after (avl_left g x) =
                avl_child_height g (avl_left g x)).
  { apply (avl_left_rotation_child_height_transfer__left_rotation_graph_heights
      g after x y _ Hrot).
    intros q Hq.
    pose proof (avl_left_child_avoids_right_pivot__left_rotation_graph_heights
      g x y q q Hv Hx Hq Hxy ltac:(unfold avl_reachable,GraphLib.examples.bst.bt_path; exists 0%nat; hnf;reflexivity)) as [_ Havoid].
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
  split; [exact Hbalafter|]. split; lia.
Qed.
Lemma crtos_right_restore__balance_returns :
 forall g after x y cf,
 avl_tree_valid g -> avl_root g=Some x ->
 (forall z,avl_vvalid g z ->z<>x ->Z.abs (avl_model_balance_factor g z)<=1) ->
 Z.abs (avl_model_balance_factor g x)<=2 ->
 avl_model_balance_factor g x > 1 ->
 avl_balance_factor_or_null g (avl_ptr_of (avl_left g x)) cf -> cf >= 0 ->
 avl_right_rotation_result g after x y ->
 avl_balanced after /\ avl_height_of g x-1<=avl_height_of after y<=avl_height_of g x.
Proof.
  intros g after x y cf T R Hbalance F Hsign Hcf Hcfs Hres.
 destruct T as [Hbst [Hheight Hnonnull]].
 assert (Hroot:x<>NULL ->avl_root g=Some x) by auto.
 assert (Hbound:x<>NULL ->Z.abs (avl_model_balance_factor g x)<=2) by auto.
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
  pose proof (avl_right_rotation_pivot_children__right_rotation_graph
    g after x y Hv Hrot) as [Haly [Hary [Halx Harx]]].
  assert (Hta : avl_child_height after (avl_right g x) =
                avl_child_height g (avl_right g x)).
  { apply (avl_right_rotation_child_height_transfer__right_rotation_graph
      g after x y _ Hrot).
    intros q Hq.
    pose proof (avl_right_child_avoids_left_pivot__right_rotation_graph
      g x y q q Hv Hx Hq Hxy ltac:(unfold avl_reachable,GraphLib.examples.bst.bt_path; exists 0%nat; hnf;reflexivity)) as [_ Havoid].
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
  split; [exact Hbalafter|]. split; lia.
Qed.
Lemma crtos_lr_restore__balance_returns :
 forall g a x y p, avl_tree_valid g ->
 (forall z,avl_vvalid g z ->z<>x ->Z.abs (avl_model_balance_factor g z)<=1) ->
 Z.abs (avl_model_balance_factor g x)<=2 -> avl_height_input_valid a ->
 avl_root g = Some x -> avl_vvalid g x -> x <> NULL ->
 avl_left g x = Some y -> avl_right g y = Some p ->
 avl_model_balance_factor g x > 1 -> avl_model_balance_factor g y < 0 ->
 avl_lr_rotation_model g a x y p ->
 avl_balanced a /\ avl_height_of g x-1<=avl_height_of a p <= avl_height_of g x.
Proof.
 intros g a x y p [Hb [Hh Hn]] Hbal F Hva Hr Hx Hnx Hxy Hyp Hfx Hfy Hrot.
 assert (Hbound:x<>NULL ->Z.abs (avl_model_balance_factor g x)<=2) by auto.
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
 - split; lia.
Qed.
Lemma crtos_rl_restore__balance_returns :
 forall g a x y p, avl_tree_valid g ->
 (forall z,avl_vvalid g z ->z<>x ->Z.abs (avl_model_balance_factor g z)<=1) ->
 Z.abs (avl_model_balance_factor g x)<=2 -> avl_height_input_valid a ->
 avl_root g = Some x -> avl_vvalid g x -> x <> NULL ->
 avl_right g x = Some y -> avl_left g y = Some p ->
 avl_model_balance_factor g x < -1 -> avl_model_balance_factor g y > 0 ->
 avl_rl_rotation_model g a x y p ->
 avl_balanced a /\ avl_height_of g x-1<=avl_height_of a p <= avl_height_of g x.
Proof.
 intros g a x y p [Hb [Hh Hn]] Hbal F Hva Hr Hx Hnx Hxy Hyp Hfx Hfy Hrot.
 assert (Hbound:x<>NULL ->Z.abs (avl_model_balance_factor g x)<=2) by auto.
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
 - split; lia.
Qed.
Lemma crtos_left_fields__balance_returns : forall g p q,
 avl_right g p=Some q -> p<>q -> avl_right g q<>Some p ->
 let d:=Z.max (avl_child_height g (avl_left g p)) (avl_child_height g (avl_left g q))+1 in
 let k:=Z.max d (avl_child_height g (avl_right g q))+1 in
 (forall x,avl_left (crtos_rotate_left g p) x=(if Z.eq_dec x q then Some p else avl_left g x)) /\
 (forall x,avl_right (crtos_rotate_left g p) x=(if Z.eq_dec x p then avl_left g q else avl_right g x)) /\
 (forall x,avl_height_of (crtos_rotate_left g p) x=
 if Z.eq_dec x q then k else if Z.eq_dec x p then d else avl_height_of g x).
Proof.
 intros g p q E D C d k.
 unfold crtos_rotate_left. rewrite E. simpl avl_ptr_of.
 unfold crtos_reroot_rotation, crtos_set_root, crtos_set_left, crtos_set_right,
 crtos_update_height, crtos_height_value, crtos_fields.
 cbv beta iota zeta delta [avl_left avl_right avl_root avl_nodes avl_vvalid
 avl_key_of avl_ptr_of avl_child_height avl_height_of avl_bst avl_with_root_cache
 avl_height_update GraphLib.examples.bst.bst_tree GraphLib.examples.bst.left_child
 GraphLib.examples.bst.right_child GraphLib.examples.bst.bst_key
 GraphLib.examples.bst.theroot GraphLib.examples.bst.listV].
 destruct (Z.eq_dec p p), (Z.eq_dec p q), (Z.eq_dec q p), (Z.eq_dec q q); try congruence.
 split; [intro x;reflexivity|]. split;[intro x;reflexivity|]. intro x.
 destruct (Z.eq_dec p p);[|contradiction].
 change ((if Z.eq_dec x q then
 Z.max d (match avl_right g q with Some c => if Z.eq_dec c p then d else avl_height_of g c |None=>0 end)+1
 else if Z.eq_dec x p then d else avl_height_of g x)=
 if Z.eq_dec x q then k else if Z.eq_dec x p then d else avl_height_of g x).
 destruct (avl_right g q) as [c|] eqn:Ec; [|reflexivity].
 destruct (Z.eq_dec c p); [subst;contradiction|]. reflexivity.
Qed.
Lemma crtos_right_fields__balance_returns : forall g p q,
 avl_left g p=Some q -> p<>q -> avl_left g q<>Some p ->
 let d:=Z.max (avl_child_height g (avl_right g q)) (avl_child_height g (avl_right g p))+1 in
 let k:=Z.max (avl_child_height g (avl_left g q)) d+1 in
 (forall x,avl_left (crtos_rotate_right g p) x=(if Z.eq_dec x p then avl_right g q else avl_left g x)) /\
 (forall x,avl_right (crtos_rotate_right g p) x=(if Z.eq_dec x q then Some p else avl_right g x)) /\
 (forall x,avl_height_of (crtos_rotate_right g p) x=
 if Z.eq_dec x q then k else if Z.eq_dec x p then d else avl_height_of g x).
Proof.
 intros g p q E D C d k.
 unfold crtos_rotate_right. rewrite E. simpl avl_ptr_of.
 unfold crtos_reroot_rotation, crtos_set_root, crtos_set_left, crtos_set_right,
 crtos_update_height, crtos_height_value, crtos_fields.
 cbv beta iota zeta delta [avl_left avl_right avl_root avl_nodes avl_vvalid
 avl_key_of avl_ptr_of avl_child_height avl_height_of avl_bst avl_with_root_cache
 avl_height_update GraphLib.examples.bst.bst_tree GraphLib.examples.bst.left_child
 GraphLib.examples.bst.right_child GraphLib.examples.bst.bst_key
 GraphLib.examples.bst.theroot GraphLib.examples.bst.listV].
 destruct (Z.eq_dec p p), (Z.eq_dec p q), (Z.eq_dec q p), (Z.eq_dec q q); try congruence.
 split; [intro x;reflexivity|]. split;[intro x;reflexivity|]. intro x.
 destruct (Z.eq_dec p p);[|contradiction].
 change ((if Z.eq_dec x q then
 Z.max (match avl_left g q with Some c => if Z.eq_dec c p then d else avl_height_of g c |None=>0 end) d+1
 else if Z.eq_dec x p then d else avl_height_of g x)=
 if Z.eq_dec x q then k else if Z.eq_dec x p then d else avl_height_of g x).
 destruct (avl_left g q) as [c|] eqn:Ec; [|reflexivity].
 destruct (Z.eq_dec c p); [subst;contradiction|]. reflexivity.
Qed.
Lemma crtos_left_output_exists__balance_returns : forall g x,
 avl_tree_valid g -> avl_root g=Some x -> avl_vvalid g x -> x<>NULL ->
 avl_ptr_of (avl_right g x)<>NULL ->
 (let y:=avl_ptr_of (avl_right g x) in
  let d:=Z.max (avl_child_height g (avl_left g x)) (avl_child_height g (avl_left g y))+1 in let k:=Z.max d (avl_child_height g (avl_right g y))+1 in
  1<=d<=UINT_MAX /\ 1<=k<=UINT_MAX) ->
 exists after y, avl_right g x=Some y /\ avl_vvalid g y /\ avl_left_rotation_result g after x y.
Proof.
 intros g x Hv Hr Hx Hnx Hny Bounds.
  destruct (avl_right g x) as [y|] eqn:Hxy; [|contradiction Hny; reflexivity].
  simpl in Hny.
  pose proof (GraphLib.examples.bst.bst_binary_tree _ (proj1 Hv)) as Htree.
  assert (Hy : avl_vvalid g y).
  { eapply (GraphLib.examples.bst.child_valid _ Htree x y Hx). right; exact Hxy. }
  assert (Hne : x <> y).
  { intro E; subst y. eapply GraphLib.examples.bst.bt_child_no_self; eauto.
    right; exact Hxy. }
  simpl avl_ptr_of in Bounds. destruct Bounds as [Bd Bp].
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
    - rewrite Hax. split; [exact Bd|]. rewrite Hlx, Hrx, Hclx, Hcly. reflexivity.
    - destruct (Z.eq_dec z y) as [->|Hzy].
      + rewrite Hay. split; [exact Bp|]. rewrite Hly, Hry, Hcry.
        change (p = Z.max (avl_height_of after x) (avl_child_height g (avl_right g y)) + 1).
        rewrite Hax. reflexivity.
      + pose proof (avl_left_rotation_other_children__left_rotation_graph_heights
          g after x y z Hv Hr Hz Hzx Hzy Hm) as [Hl Hrr].
        rewrite (Hother z Hzx Hzy), Hl, Hrr.
        rewrite (Hchild z _ Hz Hzx (or_introl eq_refl)), (Hchild z _ Hz Hzx (or_intror eq_refl)).
        exact (proj1 (proj2 Hv) z Hz). }
  exists after, y. split;[reflexivity|]. split;[exact Hy|].
 unfold avl_left_rotation_result.
 split; [rewrite Hxy;reflexivity|]. split;[exact Hny|].
 split;[exact Hroot|]. split;[exact Hm|]. split.
 - split.
   + eapply avl_left_rotation_bst__left_rotation_graph_refinement;eauto.
   + split;[exact Hheight|]. intros z Hz. apply (proj2 (proj2 Hv) z). exact Hz.
 - split.
   + exact (proj1 (proj2 (avl_left_rotation_domain_keys__left_rotation_graph_heights g after x y x Hm))).
   + intro z. exact (proj1 (avl_left_rotation_domain_keys__left_rotation_graph_heights g after x y z Hm)).
Qed.
Lemma crtos_right_output_exists__balance_returns : forall g x,
 avl_tree_valid g -> avl_root g=Some x -> avl_vvalid g x -> x<>NULL ->
 avl_ptr_of (avl_left g x)<>NULL ->
 (let y:=avl_ptr_of (avl_left g x) in
  let d:=Z.max (avl_child_height g (avl_right g x)) (avl_child_height g (avl_right g y))+1 in let k:=Z.max d (avl_child_height g (avl_left g y))+1 in
  1<=d<=UINT_MAX /\ 1<=k<=UINT_MAX) ->
 exists after y, avl_left g x=Some y /\ avl_vvalid g y /\ avl_right_rotation_result g after x y.
Proof.
 intros g x Hv Hr Hx Hnx Hny Bounds.
  destruct (avl_left g x) as [y|] eqn:Hxy; [|contradiction Hny; reflexivity].
  simpl in Hny.
  pose proof (GraphLib.examples.bst.bst_binary_tree _ (proj1 Hv)) as Htree.
  assert (Hy : avl_vvalid g y).
  { eapply (GraphLib.examples.bst.child_valid _ Htree x y Hx). left; exact Hxy. }
  assert (Hne : x <> y).
  { intro E; subst y. eapply GraphLib.examples.bst.bt_child_no_self; eauto.
    left; exact Hxy. }
  simpl avl_ptr_of in Bounds. destruct Bounds as [Bd Bp].
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
    - rewrite Hax. split; [exact Bd|]. rewrite Hlx, Hrx, Hclx, Hcly. unfold d. rewrite Z.max_comm. reflexivity.
    - destruct (Z.eq_dec z y) as [->|Hzy].
      + rewrite Hay. split; [exact Bp|]. rewrite Hly, Hry, Hcry.
        change (p = Z.max (avl_child_height g (avl_left g y)) (avl_height_of after x) + 1).
        rewrite Hax. unfold p. rewrite Z.max_comm. reflexivity.
      + pose proof (avl_right_rotation_other_children__right_rotation_graph
          g after x y z Hv Hr Hz Hzx Hzy Hm) as [Hl Hrr].
        rewrite (Hother z Hzx Hzy), Hl, Hrr.
        rewrite (Hchild z _ Hz Hzx (or_intror eq_refl)), (Hchild z _ Hz Hzx (or_introl eq_refl)).
        exact (proj1 (proj2 Hv) z Hz). }
  exists after, y. split;[reflexivity|]. split;[exact Hy|].
 unfold avl_right_rotation_result.
 split; [rewrite Hxy;reflexivity|]. split;[exact Hny|].
 split;[exact Hroot|]. split;[exact Hm|]. split.
 - split.
   + eapply avl_right_rotation_bst__right_rotation_graph;eauto.
   + split;[exact Hheight|]. intros z Hz. apply (proj2 (proj2 Hv) z). exact Hz.
 - split.
   + exact (proj1 (proj2 (avl_right_rotation_domain_keys__right_rotation_graph g after x y x Hm))).
   + intro z. exact (proj1 (avl_right_rotation_domain_keys__right_rotation_graph g after x y z Hm)).
Qed.
Lemma crtos_owner_lift__balance_returns : forall g p a b,
 NoDup (avl_nodes g) ->
 avl_nodes a=avl_nodes (avl_subtree_model g p) ->
 avl_nodes b=avl_nodes g ->
 (forall x, In x (avl_nodes a) -> avl_graph_node_store a x |-- avl_graph_node_store b x) ->
 (forall x, In x (filter (fun x => if excluded_middle_informative (avl_reachable g p x) then false else true) (avl_nodes g)) ->
 avl_graph_node_store g x |-- avl_graph_node_store b x) ->
 avl_tree_store a ** crtos_balance_external_store g p |-- avl_tree_store b.
Proof.
 intros g p a b N A B L R.
 unfold avl_tree_store,crtos_balance_external_store. rewrite B.
 rewrite (avl_graph_nodes_store_permutation__graph_store_decomposition b _ _
 (crtos_subtree_partition__balance_returns g p N)).
 rewrite <- A.
 sep_apply_r_atomic (avl_graph_nodes_store_app__graph_store_decomposition b
 (avl_nodes a) (filter (fun x => if excluded_middle_informative (avl_reachable g p x) then false else true) (avl_nodes g))).
 sep_apply_l_atomic (avl_nodes_store_map__lr_graph_composition a b (avl_nodes a) L).
 sep_apply_l_atomic (avl_nodes_store_map__lr_graph_composition g b
 (filter (fun x => if excluded_middle_informative (avl_reachable g p x) then false else true) (avl_nodes g)) R).
 entailer!.
Qed.
Lemma crtos_left_canonical_equiv__balance_returns : forall g a x y,
 avl_tree_valid g -> avl_root g=Some x ->
 avl_left_rotation_result g a x y ->
 crtos_graph_equiv (crtos_rotate_left g x) a.
Proof.
 intros g a x y Hv Hroot Hres.
 destruct Hres as [Hret [Hynz [Hafterroot [Hrot [Hafter [Hnodes Hkeys]]]]]].
 pose proof Hrot as [Hx [Hxy [Htop [Hnewx [Hnewy Hnonlocal]]]]].
 pose proof (GraphLib.examples.bst.bst_binary_tree _ (proj1 Hv)) as Htree.
 assert (Hy:avl_vvalid g y) by (eapply avl_graph_child_valid__root_and_factor_setup;[exact (proj1 Hv)|exact Hx|right;exact Hxy]).
 assert (Hxyneq:x<>y).
 { intro E. apply (GraphLib.examples.bst.bt_child_no_self _ x Htree Hx). right;change (avl_right g x=Some x);try congruence;split;congruence. }
 pose proof (avl_left_rotation_pivot_children__left_rotation_graph_heights g a x y Hv Hrot) as [Haly [Hary [Halx Harx]]].
  assert (Hta : avl_child_height a (avl_left g x) =
                avl_child_height g (avl_left g x)).
  { apply (avl_left_rotation_child_height_transfer__left_rotation_graph_heights
      g a x y _ Hrot).
    intros q Hq.
    pose proof (avl_left_child_avoids_right_pivot__left_rotation_graph_heights
      g x y q q Hv Hx Hq Hxy ltac:(unfold avl_reachable,GraphLib.examples.bst.bt_path;exists 0%nat;hnf;reflexivity)) as [_ Havoid].
    exact Havoid. }
  assert (Htb : avl_child_height a (avl_left g y) =
                avl_child_height g (avl_left g y)).
  { apply (avl_left_rotation_child_height_transfer__left_rotation_graph_heights
      g a x y _ Hrot).
    exact (avl_balance_children_avoid__single_rotation_and_accessors
      g x y y _ Hv Hroot Hx (or_intror Hxy) Hy ltac:(congruence) (or_introl eq_refl)). }
  assert (Htc : avl_child_height a (avl_right g y) =
                avl_child_height g (avl_right g y)).
  { apply (avl_left_rotation_child_height_transfer__left_rotation_graph_heights
      g a x y _ Hrot).
    exact (avl_balance_children_avoid__single_rotation_and_accessors
      g x y y _ Hv Hroot Hx (or_intror Hxy) Hy ltac:(congruence) (or_intror eq_refl)). }
  unfold avl_recomputed_at in Hnewx, Hnewy.
  rewrite Halx, Harx, Hta, Htb in Hnewx.
  rewrite Haly, Hary, Htc in Hnewy. simpl avl_child_height in Hnewy.

 assert (C:avl_right g y<>Some x).
 { pose proof (GraphLib.examples.bst.root_no_parents _ Htree y x Hroot);tauto. }
 destruct (crtos_left_fields__balance_returns g x y Hxy Hxyneq C) as [Lc [Rc Hc]].
 assert (Dom:forall z,avl_vvalid a z <->avl_vvalid g z).
 { intro z. exact (proj2 (proj2 (avl_left_rotation_domain_keys__left_rotation_graph_heights g a x y z Hrot))). }
 unfold crtos_graph_equiv. split.
 - rewrite crtos_rotate_left_root__crtos_insert_composition,Hroot,Hxy,Hafterroot.
   destruct (excluded_middle_informative (Some x=Some x));[reflexivity|contradiction].
 - split;[change (Permutation (avl_nodes g) (avl_nodes a));rewrite Hnodes;reflexivity|].
   split;[intro z;change (avl_vvalid g z <-> avl_vvalid a z);symmetry;apply Dom|].
   split.
   + intro z. rewrite Lc,Rc.
     destruct (Z.eq_dec z x) as [E|Nx].
     * subst z. rewrite Halx,Harx. destruct (Z.eq_dec x x),(Z.eq_dec x y);try congruence;split;congruence.
     * destruct (Z.eq_dec z y) as [E|Ny].
       -- subst z. rewrite Haly,Hary. destruct (Z.eq_dec y x),(Z.eq_dec y y);try congruence;split;congruence.
       -- destruct (excluded_middle_informative (avl_vvalid g z)) as [Vz|Nz].
          ++ destruct (avl_left_rotation_other_children__left_rotation_graph_heights g a x y z Hv Hroot Vz Nx Ny Hrot) as [L R].
             rewrite L,R. destruct (Z.eq_dec z x),(Z.eq_dec z y);try congruence;split;congruence.
          ++ pose proof (GraphLib.examples.bst.invalid_child_is_none _ Htree z Nz) as [L R].
             assert (Na:~avl_vvalid a z) by (intro V;apply Nz;apply Dom;exact V).
             pose proof (GraphLib.examples.bst.invalid_child_is_none _
             (GraphLib.examples.bst.bst_binary_tree _ (proj1 Hafter)) z Na) as [La Ra].
             change (avl_left g z=None) in L. change (avl_right g z=None) in R.
             change (avl_left a z=None) in La. change (avl_right a z=None) in Ra.
             rewrite L,R,La,Ra. destruct (Z.eq_dec z x),(Z.eq_dec z y);try congruence;split;congruence.
   + intros z Vz. split.
     * change (avl_key_of g z=avl_key_of a z). symmetry;apply Hkeys.
     * rewrite Hc. destruct (Z.eq_dec z y) as [E|Ny].
       -- subst z. rewrite Hnewy,Hnewx. reflexivity.
       -- destruct (Z.eq_dec z x) as [E|Nx].
          ++ subst z. rewrite Hnewx. reflexivity.
          ++ symmetry;apply Hnonlocal;assumption.
Qed.
Lemma crtos_right_canonical_equiv__balance_returns : forall g a x y,
 avl_tree_valid g -> avl_root g=Some x ->
 avl_right_rotation_result g a x y ->
 crtos_graph_equiv (crtos_rotate_right g x) a.
Proof.
 intros g a x y Hv Hroot Hres.
 destruct Hres as [Hret [Hynz [Hafterroot [Hrot [Hafter [Hnodes Hkeys]]]]]].
 pose proof Hrot as [Hx [Hxy [Htop [Hnewx [Hnewy Hnonlocal]]]]].
 pose proof (GraphLib.examples.bst.bst_binary_tree _ (proj1 Hv)) as Htree.
 assert (Hy:avl_vvalid g y) by (eapply avl_graph_child_valid__root_and_factor_setup;[exact (proj1 Hv)|exact Hx|left;exact Hxy]).
 assert (Hxyneq:x<>y).
 { intro E. apply (GraphLib.examples.bst.bt_child_no_self _ x Htree Hx). left;change (avl_left g x=Some x);try congruence;split;congruence. }
 pose proof (avl_right_rotation_pivot_children__right_rotation_graph g a x y Hv Hrot) as [Haly [Hary [Halx Harx]]].
  assert (Hta : avl_child_height a (avl_right g x) =
                avl_child_height g (avl_right g x)).
  { apply (avl_right_rotation_child_height_transfer__right_rotation_graph
      g a x y _ Hrot).
    intros q Hq.
    pose proof (avl_right_child_avoids_left_pivot__right_rotation_graph
      g x y q q Hv Hx Hq Hxy ltac:(unfold avl_reachable,GraphLib.examples.bst.bt_path;exists 0%nat;hnf;reflexivity)) as [_ Havoid].
    exact Havoid. }
  assert (Htb : avl_child_height a (avl_right g y) =
                avl_child_height g (avl_right g y)).
  { apply (avl_right_rotation_child_height_transfer__right_rotation_graph
      g a x y _ Hrot).
    exact (avl_balance_children_avoid__single_rotation_and_accessors
      g x y y _ Hv Hroot Hx (or_introl Hxy) Hy ltac:(congruence) (or_intror eq_refl)). }
  assert (Htc : avl_child_height a (avl_left g y) =
                avl_child_height g (avl_left g y)).
  { apply (avl_right_rotation_child_height_transfer__right_rotation_graph
      g a x y _ Hrot).
    exact (avl_balance_children_avoid__single_rotation_and_accessors
      g x y y _ Hv Hroot Hx (or_introl Hxy) Hy ltac:(congruence) (or_introl eq_refl)). }
  unfold avl_recomputed_at in Hnewx, Hnewy.
  rewrite Halx, Harx, Hta, Htb in Hnewx.
  rewrite Haly, Hary, Htc in Hnewy. simpl avl_child_height in Hnewy.

 assert (C:avl_left g y<>Some x).
 { pose proof (GraphLib.examples.bst.root_no_parents _ Htree y x Hroot);tauto. }
 destruct (crtos_right_fields__balance_returns g x y Hxy Hxyneq C) as [Lc [Rc Hc]].
 assert (Dom:forall z,avl_vvalid a z <->avl_vvalid g z).
 { intro z. exact (proj2 (proj2 (avl_right_rotation_domain_keys__right_rotation_graph g a x y z Hrot))). }
 unfold crtos_graph_equiv. split.
 - rewrite crtos_rotate_right_root__crtos_insert_composition,Hroot,Hxy,Hafterroot.
   destruct (excluded_middle_informative (Some x=Some x));[reflexivity|contradiction].
 - split;[change (Permutation (avl_nodes g) (avl_nodes a));rewrite Hnodes;reflexivity|].
   split;[intro z;change (avl_vvalid g z <-> avl_vvalid a z);symmetry;apply Dom|].
   split.
   + intro z. rewrite Lc,Rc.
     destruct (Z.eq_dec z x) as [E|Nx].
     * subst z. rewrite Halx,Harx. destruct (Z.eq_dec x x),(Z.eq_dec x y);try congruence;split;congruence.
     * destruct (Z.eq_dec z y) as [E|Ny].
       -- subst z. rewrite Haly,Hary. destruct (Z.eq_dec y x),(Z.eq_dec y y);try congruence;split;congruence.
       -- destruct (excluded_middle_informative (avl_vvalid g z)) as [Vz|Nz].
          ++ destruct (avl_right_rotation_other_children__right_rotation_graph g a x y z Hv Hroot Vz Nx Ny Hrot) as [L R].
             rewrite L,R. destruct (Z.eq_dec z x),(Z.eq_dec z y);try congruence;split;congruence.
          ++ pose proof (GraphLib.examples.bst.invalid_child_is_none _ Htree z Nz) as [L R].
             assert (Na:~avl_vvalid a z) by (intro V;apply Nz;apply Dom;exact V).
             pose proof (GraphLib.examples.bst.invalid_child_is_none _
             (GraphLib.examples.bst.bst_binary_tree _ (proj1 Hafter)) z Na) as [La Ra].
             change (avl_left g z=None) in L. change (avl_right g z=None) in R.
             change (avl_left a z=None) in La. change (avl_right a z=None) in Ra.
             rewrite L,R,La,Ra. destruct (Z.eq_dec z x),(Z.eq_dec z y);try congruence;split;congruence.
   + intros z Vz. split.
     * change (avl_key_of g z=avl_key_of a z). symmetry;apply Hkeys.
     * rewrite Hc. destruct (Z.eq_dec z y) as [E|Ny].
       -- subst z. rewrite Hnewy,Hnewx. reflexivity.
       -- destruct (Z.eq_dec z x) as [E|Nx].
          ++ subst z. rewrite Hnewx. reflexivity.
          ++ symmetry;apply Hnonlocal;assumption.
Qed.
Lemma crtos_projection_lift__balance_returns : forall g p a b ret,
 avl_tree_valid a -> avl_root a=Some ret ->
 avl_nodes a=avl_nodes (avl_subtree_model g p) ->
 avl_nodes b=avl_nodes g ->
 (forall x,avl_vvalid a x <->avl_vvalid (avl_subtree_model g p) x) ->
 (forall x,avl_vvalid b x <->avl_vvalid g x) ->
 (forall x,avl_vvalid a x ->avl_left b x=avl_left a x /\ avl_right b x=avl_right a x) ->
 (forall x,avl_vvalid a x ->avl_key_of b x=avl_key_of a x /\ avl_height_of b x=avl_height_of a x) ->
 crtos_graph_equiv (avl_subtree_model b ret) a.
Proof.
 intros g p a b ret T Root Na Nb D V C H.
 pose proof (GraphLib.examples.bst.bst_binary_tree _ (proj1 T)) as Bt.
 pose proof (GraphLib.examples.bst.root_valid _ Bt ret Root) as Vr.
 assert (Self:avl_reachable a ret ret).
 { unfold avl_reachable,GraphLib.examples.bst.bt_path. exists 0%nat. hnf. reflexivity. }
 assert (Pa:forall x,avl_reachable a ret x ->avl_vvalid a x).
 { intros x R. exact (proj1 (avl_path_height_bound__insert_projection_graft a ret x T Vr R)). }
 assert (All:forall x,avl_vvalid a x ->avl_reachable a ret x).
 { intros x X. destruct (GraphLib.examples.bst.path_exists _ Bt x X) as [r [E R]].
   change (avl_root a=Some r) in E. rewrite Root in E. inversion E;subst r;exact R. }
 assert (Path:forall x,avl_reachable a ret x <->avl_reachable b ret x).
 { intro x. apply (avl_path_equiv_on_closed_region__left_rotation_graph_heights addr
   (GraphLib.examples.bst.bt_child (GraphLib.examples.bst.bst_tree (avl_bst a)))
   (GraphLib.examples.bst.bt_child (GraphLib.examples.bst.bst_tree (avl_bst b))) ret).
   - intros z c R. destruct (C z (Pa z R)) as [L Q].
     change ((avl_left a z=Some c \/ avl_right a z=Some c) <->
       (avl_left b z=Some c \/ avl_right b z=Some c)).
     rewrite L,Q. tauto.
   - exact Self. }
 assert (Reach:forall x,avl_reachable b ret x <->avl_vvalid a x).
 { intro x. rewrite <- Path. split;[apply Pa|apply All]. }
 assert (Db:forall x,avl_vvalid (avl_subtree_model b ret) x <->avl_vvalid a x).
 { intro x. change ((avl_vvalid b x /\ avl_reachable b ret x)<->avl_vvalid a x).
   rewrite Reach. split;[tauto|]. intro X. split;[|exact X]. apply V.
   exact (proj1 (proj1 (D x) X)). }
 unfold crtos_graph_equiv. split;[symmetry;exact Root|].
 split.
 - apply NoDup_Permutation.
   + apply GraphLib.graph_basic.valid_NoDup_list_NoDup.
   + exact (GraphLib.examples.bst.listV_NoDup _ Bt).
   + intro x. change (In x (avl_subtree_nodes b ret) <->In x (avl_nodes a)).
     unfold avl_subtree_nodes. rewrite GraphLib.graph_basic.valid_NoDup_list_spec, Nb, Reach.
     split.
     * intros [_ X]. apply (crtos_valid_domain__crtos_insert_composition a T);exact X.
     * intro X. split.
       -- rewrite Na in X. change (In x (avl_subtree_nodes g p)) in X.
          unfold avl_subtree_nodes in X. apply GraphLib.graph_basic.valid_NoDup_list_spec in X. tauto.
       -- apply (crtos_valid_domain__crtos_insert_composition a T);exact X.
 - split;[exact Db|]. split.
   + intro x. destruct (excluded_middle_informative (avl_vvalid a x)) as [X|X].
     * destruct (avl_projection_children__lr_graph_composition b ret x (proj2 (Reach x) X)) as [L Q].
       rewrite L,Q. apply C;exact X.
     * assert (R:~avl_reachable b ret x) by (rewrite Reach;exact X).
       pose proof (GraphLib.examples.bst.invalid_child_is_none _ Bt x X) as [L Q].
       change (avl_left a x=None) in L. change (avl_right a x=None) in Q.
       change ((if excluded_middle_informative (avl_reachable b ret x) then avl_left b x else None)=avl_left a x /\
       (if excluded_middle_informative (avl_reachable b ret x) then avl_right b x else None)=avl_right a x).
       destruct (excluded_middle_informative (avl_reachable b ret x));[contradiction|]. rewrite L,Q;auto.
   + intros x X. apply H. apply Db;exact X.
Qed.
Lemma crtos_left_projection_fields__balance_returns : forall g p q,
 crtos_balance_ready g p -> avl_right g p=Some q ->
 (forall x,avl_reachable g p x ->
 avl_left (crtos_rotate_left (avl_subtree_model g p) p) x=avl_left (crtos_rotate_left g p) x /\
 avl_right (crtos_rotate_left (avl_subtree_model g p) p) x=avl_right (crtos_rotate_left g p) x) /\
 (forall x,avl_height_of (crtos_rotate_left (avl_subtree_model g p) p) x=avl_height_of (crtos_rotate_left g p) x) /\
 q<>0 /\ p<>q /\ avl_reachable g p q.
Proof.
 intros g p q B E.
 destruct (crtos_balance_subroot__balance_returns g p B) as [T [N [Vp Nd]]].
 destruct (avl_projection_children__lr_graph_composition g p p (proj2 Vp)) as [Lp Rp].
 assert (Es:avl_right (avl_subtree_model g p) p=Some q) by (rewrite Rp;exact E).
 assert (Vq:avl_vvalid (avl_subtree_model g p) q).
 { eapply avl_graph_child_valid__root_and_factor_setup;[exact (proj1 T)|exact Vp|right;exact Es]. }
 destruct (avl_projection_children__lr_graph_composition g p q (proj2 Vq)) as [Lq Rq].
 pose proof (GraphLib.examples.bst.bst_binary_tree _ (proj1 T)) as Bt.
 assert (D:p<>q).
 { intro Eq. apply (GraphLib.examples.bst.bt_child_no_self _ p Bt Vp).
   right;change (avl_right (avl_subtree_model g p) p=Some p);congruence. }
 assert (C:avl_right g q<>Some p).
 { pose proof (GraphLib.examples.bst.root_no_parents _ Bt q p eq_refl) as [A C].
   change (avl_left (avl_subtree_model g p) q<>Some p) in A.
   change (avl_right (avl_subtree_model g p) q<>Some p) in C.
   rewrite Lq in A. rewrite Rq in C. assumption. }
 destruct (crtos_left_fields__balance_returns g p q E D C) as [L [R H]].
 destruct (crtos_left_fields__balance_returns (avl_subtree_model g p) p q Es D
 ltac:(rewrite Rq;exact C)) as [Ls [Rs Hs]].
 split.
 - intros x X. destruct (avl_projection_children__lr_graph_composition g p x X) as [Lx Rx].
   rewrite Ls,Rs,L,R,?Lx,?Rx,?Lp,?Rp,?Lq,?Rq. auto.
 - split.
   + intro x. rewrite Hs,H,?Lp,?Rp,?Lq,?Rq. reflexivity.
   + split;[exact (proj2 (proj2 T) q Vq)|]. split;[exact D|exact (proj2 Vq)].
Qed.
Lemma crtos_right_projection_fields__balance_returns : forall g p q,
 crtos_balance_ready g p -> avl_left g p=Some q ->
 (forall x,avl_reachable g p x ->
 avl_left (crtos_rotate_right (avl_subtree_model g p) p) x=avl_left (crtos_rotate_right g p) x /\
 avl_right (crtos_rotate_right (avl_subtree_model g p) p) x=avl_right (crtos_rotate_right g p) x) /\
 (forall x,avl_height_of (crtos_rotate_right (avl_subtree_model g p) p) x=avl_height_of (crtos_rotate_right g p) x) /\
 q<>0 /\ p<>q /\ avl_reachable g p q.
Proof.
 intros g p q B E.
 destruct (crtos_balance_subroot__balance_returns g p B) as [T [N [Vp Nd]]].
 destruct (avl_projection_children__lr_graph_composition g p p (proj2 Vp)) as [Lp Rp].
 assert (Es:avl_left (avl_subtree_model g p) p=Some q) by (rewrite Lp;exact E).
 assert (Vq:avl_vvalid (avl_subtree_model g p) q).
 { eapply avl_graph_child_valid__root_and_factor_setup;[exact (proj1 T)|exact Vp|left;exact Es]. }
 destruct (avl_projection_children__lr_graph_composition g p q (proj2 Vq)) as [Lq Rq].
 pose proof (GraphLib.examples.bst.bst_binary_tree _ (proj1 T)) as Bt.
 assert (D:p<>q).
 { intro Eq. apply (GraphLib.examples.bst.bt_child_no_self _ p Bt Vp).
   left;change (avl_left (avl_subtree_model g p) p=Some p);congruence. }
 assert (C:avl_left g q<>Some p).
 { pose proof (GraphLib.examples.bst.root_no_parents _ Bt q p eq_refl) as [A C].
   change (avl_left (avl_subtree_model g p) q<>Some p) in A.
   change (avl_right (avl_subtree_model g p) q<>Some p) in C.
   rewrite Lq in A. rewrite Rq in C. assumption. }
 destruct (crtos_right_fields__balance_returns g p q E D C) as [L [R H]].
 destruct (crtos_right_fields__balance_returns (avl_subtree_model g p) p q Es D
 ltac:(rewrite Lq;exact C)) as [Ls [Rs Hs]].
 split.
 - intros x X. destruct (avl_projection_children__lr_graph_composition g p x X) as [Lx Rx].
   rewrite Ls,Rs,L,R,?Lx,?Rx,?Lp,?Rp,?Lq,?Rq. auto.
 - split.
   + intro x. rewrite Hs,H,?Lp,?Rp,?Lq,?Rq. reflexivity.
   + split;[exact (proj2 (proj2 T) q Vq)|]. split;[exact D|exact (proj2 Vq)].
Qed.
Lemma crtos_left_local_balance__balance_returns : forall g p,
 crtos_balance_ready g p ->
 avl_model_balance_factor g p < -1 ->
 avl_model_balance_factor g (avl_ptr_of (avl_right g p)) <=0 ->
 let s:=avl_subtree_model g p in
 let q:=avl_ptr_of (avl_right g p) in
 avl_gvalid (crtos_rotate_left s p) /\
 avl_height_of g p-1 <= avl_height_of (crtos_rotate_left s p) q <=avl_height_of g p.
Proof.
 intros g p B F C s q.
 destruct (crtos_balance_subroot__balance_returns g p B) as [T [N [Vp Nd]]].
 fold s in T,Vp.
 destruct (avl_projection_children__lr_graph_composition g p p (proj2 Vp)) as [Lp Rp].
 assert (Fs:avl_model_balance_factor s p < -1).
 { unfold s. rewrite crtos_subtree_factor__balance_returns by exact Vp. exact F. }
 assert (Q:avl_vvalid s (avl_ptr_of (avl_right s p))).
 { apply (proj2 (crtos_factor_children__crtos_insert_composition s p T Vp));lia. }
 destruct (avl_right s p) as [r|] eqn:E.
 2:{ change (avl_vvalid s 0) in Q. pose proof (proj2 (proj2 T) 0 Q). contradiction. }
 change (avl_vvalid s r) in Q.
 assert (Er:avl_right g p=Some r) by (unfold s in E;rewrite Rp in E;exact E).
 assert (Rq:q=r) by (unfold q;rewrite Er;reflexivity).
 assert (Npr:p<>r).
 { intro Eq. apply (GraphLib.examples.bst.bt_child_no_self _ p
 (GraphLib.examples.bst.bst_binary_tree _ (proj1 T)) Vp). right;change (avl_right s p=Some p);congruence. }
 assert (Cr:avl_model_balance_factor s r <=0).
 { unfold s. rewrite crtos_subtree_factor__balance_returns by exact Q. rewrite <- Rq;exact C. }
 assert (Bal:Z.abs (avl_model_balance_factor s r)<=1).
 { unfold s. rewrite crtos_subtree_factor__balance_returns by exact Q.
   exact (proj1 (proj2 (proj2 (proj2 B))) r Q ltac:(congruence)). }
 assert (Bound:Z.abs (avl_model_balance_factor s p)<=2).
 { unfold s. rewrite crtos_subtree_factor__balance_returns by exact Vp. exact (proj2 (proj2 (proj2 (proj2 B)))). }
 pose proof (proj1 (proj2 T) p Vp) as [Bp Hp].
 pose proof (proj1 (proj2 T) r Q) as [Br Hr].
 pose proof (avl_child_nonnegative__left_rotation_graph_refinement s p (avl_left s p) T Vp (or_introl eq_refl)) as A.
 pose proof (avl_child_nonnegative__left_rotation_graph_refinement s r (avl_left s r) T Q (or_introl eq_refl)) as L.
 pose proof (avl_child_nonnegative__left_rotation_graph_refinement s r (avl_right s r) T Q (or_intror eq_refl)) as R.
 assert (Bounds:
 let r:=avl_ptr_of (avl_right s p) in
 let d:=Z.max (avl_child_height s (avl_left s p)) (avl_child_height s (avl_left s r))+1 in
 let k:=Z.max d (avl_child_height s (avl_right s r))+1 in
 1<=d<=UINT_MAX /\ 1<=k<=UINT_MAX).
 { rewrite E. simpl avl_ptr_of.
   unfold avl_model_balance_factor in Fs,Cr,Bal,Bound.
   rewrite E in Fs,Bound,Hp. simpl avl_child_height in Fs,Bound,Hp.
   apply Z.abs_le in Bal. apply Z.abs_le in Bound.
   change (avl_height_of g r = Z.max (avl_child_height s (avl_left s r)) (avl_child_height s (avl_right s r))+1) in Hr.
   cbv zeta. split;lia. }
 destruct (crtos_left_output_exists__balance_returns s p T eq_refl Vp N
 ltac:(rewrite E;exact (proj2 (proj2 T) r Q)) Bounds) as [a [r' [Er' [Qr' Res]]]].
 rewrite E in Er'. inversion Er';subst r'.
 assert (Fa:avl_balance_factor_or_null s (avl_ptr_of (avl_right s p)) (avl_model_balance_factor s r)).
 { right. rewrite E. simpl avl_ptr_of.
    split;[exact (proj2 (proj2 T) r Q)|]. split;[exact Q|].
    split;[reflexivity|]. apply Z.abs_le in Bal. split;lia. }
 assert (Others:forall z,avl_vvalid s z ->z<>p ->Z.abs (avl_model_balance_factor s z)<=1).
 { intros z Z D. unfold s. rewrite crtos_subtree_factor__balance_returns by exact Z.
 exact (proj1 (proj2 (proj2 (proj2 B))) z Z D). }
 destruct (crtos_left_restore__balance_returns s a p r (avl_model_balance_factor s r)
 T eq_refl Others Bound Fs Fa Cr Res) as [Ba Ha].
 assert (Ga:avl_gvalid a) by (apply avl_gvalid_tree_valid_iff;split;[exact (proj1 (proj2 (proj2 (proj2 (proj2 Res)))))|exact Ba]).
 pose proof (crtos_left_canonical_equiv__balance_returns s a p r T eq_refl Res) as Eq.
 split.
 - eapply crtos_equiv_gvalid__crtos_insert_composition;[apply crtos_equiv_sym__crtos_insert_composition;exact Eq|exact Ga].
 - rewrite Rq. pose proof (proj2 (proj2 (proj2 (proj2 Eq))) r Q) as [_ H].
   rewrite H. exact Ha.
Qed.
Lemma crtos_right_local_balance__balance_returns : forall g p,
 crtos_balance_ready g p ->
 avl_model_balance_factor g p >1 ->
 avl_model_balance_factor g (avl_ptr_of (avl_left g p)) >=0 ->
 let s:=avl_subtree_model g p in
 let q:=avl_ptr_of (avl_left g p) in
 avl_gvalid (crtos_rotate_right s p) /\
 avl_height_of g p-1 <= avl_height_of (crtos_rotate_right s p) q <=avl_height_of g p.
Proof.
 intros g p B F C s q.
 destruct (crtos_balance_subroot__balance_returns g p B) as [T [N [Vp Nd]]].
 fold s in T,Vp.
 destruct (avl_projection_children__lr_graph_composition g p p (proj2 Vp)) as [Lp Rp].
 assert (Fs:avl_model_balance_factor s p >1).
 { unfold s. rewrite crtos_subtree_factor__balance_returns by exact Vp. exact F. }
 assert (Q:avl_vvalid s (avl_ptr_of (avl_left s p))).
 { apply (proj1 (crtos_factor_children__crtos_insert_composition s p T Vp));lia. }
 destruct (avl_left s p) as [r|] eqn:E.
 2:{ change (avl_vvalid s 0) in Q. pose proof (proj2 (proj2 T) 0 Q). contradiction. }
 change (avl_vvalid s r) in Q.
 assert (Er:avl_left g p=Some r) by (unfold s in E;rewrite Lp in E;exact E).
 assert (Rq:q=r) by (unfold q;rewrite Er;reflexivity).
 assert (Npr:p<>r).
 { intro Eq. apply (GraphLib.examples.bst.bt_child_no_self _ p
 (GraphLib.examples.bst.bst_binary_tree _ (proj1 T)) Vp). left;change (avl_left s p=Some p);congruence. }
 assert (Cr:avl_model_balance_factor s r >=0).
 { unfold s. rewrite crtos_subtree_factor__balance_returns by exact Q. rewrite <- Rq;exact C. }
 assert (Bal:Z.abs (avl_model_balance_factor s r)<=1).
 { unfold s. rewrite crtos_subtree_factor__balance_returns by exact Q.
   exact (proj1 (proj2 (proj2 (proj2 B))) r Q ltac:(congruence)). }
 assert (Bound:Z.abs (avl_model_balance_factor s p)<=2).
 { unfold s. rewrite crtos_subtree_factor__balance_returns by exact Vp. exact (proj2 (proj2 (proj2 (proj2 B)))). }
 pose proof (proj1 (proj2 T) p Vp) as [Bp Hp].
 pose proof (proj1 (proj2 T) r Q) as [Br Hr].
 pose proof (avl_child_nonnegative__left_rotation_graph_refinement s p (avl_right s p) T Vp (or_intror eq_refl)) as A.
 pose proof (avl_child_nonnegative__left_rotation_graph_refinement s r (avl_left s r) T Q (or_introl eq_refl)) as L.
 pose proof (avl_child_nonnegative__left_rotation_graph_refinement s r (avl_right s r) T Q (or_intror eq_refl)) as R.
 assert (Bounds:
 let r:=avl_ptr_of (avl_left s p) in
 let d:=Z.max (avl_child_height s (avl_right s p)) (avl_child_height s (avl_right s r))+1 in
 let k:=Z.max d (avl_child_height s (avl_left s r))+1 in
 1<=d<=UINT_MAX /\ 1<=k<=UINT_MAX).
 { rewrite E. simpl avl_ptr_of.
   unfold avl_model_balance_factor in Fs,Cr,Bal,Bound.
   rewrite E in Fs,Bound,Hp. simpl avl_child_height in Fs,Bound,Hp.
   apply Z.abs_le in Bal. apply Z.abs_le in Bound.
   change (avl_height_of g r = Z.max (avl_child_height s (avl_left s r)) (avl_child_height s (avl_right s r))+1) in Hr.
   cbv zeta. split;lia. }
 destruct (crtos_right_output_exists__balance_returns s p T eq_refl Vp N
 ltac:(rewrite E;exact (proj2 (proj2 T) r Q)) Bounds) as [a [r' [Er' [Qr' Res]]]].
 rewrite E in Er'. inversion Er';subst r'.
 assert (Fa:avl_balance_factor_or_null s (avl_ptr_of (avl_left s p)) (avl_model_balance_factor s r)).
 { right. rewrite E. simpl avl_ptr_of.
    split;[exact (proj2 (proj2 T) r Q)|]. split;[exact Q|].
    split;[reflexivity|]. apply Z.abs_le in Bal. split;lia. }
 assert (Others:forall z,avl_vvalid s z ->z<>p ->Z.abs (avl_model_balance_factor s z)<=1).
 { intros z Z D. unfold s. rewrite crtos_subtree_factor__balance_returns by exact Z.
 exact (proj1 (proj2 (proj2 (proj2 B))) z Z D). }
 destruct (crtos_right_restore__balance_returns s a p r (avl_model_balance_factor s r)
 T eq_refl Others Bound Fs Fa Cr Res) as [Ba Ha].
 assert (Ga:avl_gvalid a) by (apply avl_gvalid_tree_valid_iff;split;[exact (proj1 (proj2 (proj2 (proj2 (proj2 Res)))))|exact Ba]).
 pose proof (crtos_right_canonical_equiv__balance_returns s a p r T eq_refl Res) as Eq.
 split.
 - eapply crtos_equiv_gvalid__crtos_insert_composition;[apply crtos_equiv_sym__crtos_insert_composition;exact Eq|exact Ga].
 - rewrite Rq. pose proof (proj2 (proj2 (proj2 (proj2 Eq))) r Q) as [_ H].
   rewrite H. exact Ha.
Qed.
Lemma crtos_left_owner_lift__balance_returns : forall g p q,
 crtos_balance_ready g p -> NoDup (avl_nodes g) -> avl_right g p=Some q ->
 avl_tree_store (crtos_rotate_left (avl_subtree_model g p) p) **
 crtos_balance_external_store g p |-- avl_tree_store (crtos_rotate_left g p).
Proof.
 intros g p q B Nd E.
 destruct (crtos_left_projection_fields__balance_returns g p q B E) as [C [H [Nq [D Rq]]]].
 destruct (crtos_balance_subroot__balance_returns g p B) as [T [Np [Vp Ns]]].
 apply crtos_owner_lift__balance_returns;[exact Nd|reflexivity|reflexivity| |].
 - intros x X. unfold avl_graph_node_store. Intros_p V. Intros_p N. Intros_p K. Intros_p Hb.
   change (avl_vvalid g x /\avl_reachable g p x) in V.
   destruct (C x (proj2 V)) as [L R]. rewrite H in Hb. rewrite L,R,H.
   entailer!;lia.
 - intros x X. apply filter_In in X. destruct X as [X Filter].
   destruct (excluded_middle_informative (avl_reachable g p x));[discriminate|].
   assert (Dx:x<>p) by (intro Eq;subst x;apply n;exact (proj2 Vp)).
   assert (Dq:x<>q) by (intro Eq;subst x;contradiction).
   assert (Cq:avl_right g q<>Some p).
   { destruct (avl_projection_children__lr_graph_composition g p q Rq) as [L R].
      pose proof (GraphLib.examples.bst.root_no_parents _
      (GraphLib.examples.bst.bst_binary_tree _ (proj1 T)) q p eq_refl) as [A Q].
      change (avl_left (avl_subtree_model g p) q<>Some p) in A.
      change (avl_right (avl_subtree_model g p) q<>Some p) in Q.
      rewrite L in A. rewrite R in Q. assumption. }
   destruct (crtos_left_fields__balance_returns g p q E D Cq) as [L [R Hh]].
   assert (Lx:avl_left (crtos_rotate_left g p) x=avl_left g x)
   by (rewrite L;destruct (Z.eq_dec x p),(Z.eq_dec x q);congruence).
   assert (Rx:avl_right (crtos_rotate_left g p) x=avl_right g x)
   by (rewrite R;destruct (Z.eq_dec x p),(Z.eq_dec x q);congruence).
   assert (Hx:avl_height_of (crtos_rotate_left g p) x=avl_height_of g x)
   by (rewrite Hh;destruct (Z.eq_dec x p),(Z.eq_dec x q);congruence).
   unfold avl_graph_node_store. rewrite Lx,Rx,Hx. entailer!.
Qed.
Lemma crtos_right_owner_lift__balance_returns : forall g p q,
 crtos_balance_ready g p -> NoDup (avl_nodes g) -> avl_left g p=Some q ->
 avl_tree_store (crtos_rotate_right (avl_subtree_model g p) p) **
 crtos_balance_external_store g p |-- avl_tree_store (crtos_rotate_right g p).
Proof.
 intros g p q B Nd E.
 destruct (crtos_right_projection_fields__balance_returns g p q B E) as [C [H [Nq [D Rq]]]].
 destruct (crtos_balance_subroot__balance_returns g p B) as [T [Np [Vp Ns]]].
 apply crtos_owner_lift__balance_returns;[exact Nd|reflexivity|reflexivity| |].
 - intros x X. unfold avl_graph_node_store. Intros_p V. Intros_p N. Intros_p K. Intros_p Hb.
   change (avl_vvalid g x /\avl_reachable g p x) in V.
   destruct (C x (proj2 V)) as [L R]. rewrite H in Hb. rewrite L,R,H.
   entailer!;lia.
 - intros x X. apply filter_In in X. destruct X as [X Filter].
   destruct (excluded_middle_informative (avl_reachable g p x));[discriminate|].
   assert (Dx:x<>p) by (intro Eq;subst x;apply n;exact (proj2 Vp)).
   assert (Dq:x<>q) by (intro Eq;subst x;contradiction).
   assert (Cq:avl_left g q<>Some p).
   { destruct (avl_projection_children__lr_graph_composition g p q Rq) as [L R].
      pose proof (GraphLib.examples.bst.root_no_parents _
      (GraphLib.examples.bst.bst_binary_tree _ (proj1 T)) q p eq_refl) as [A Q].
      change (avl_left (avl_subtree_model g p) q<>Some p) in A.
      change (avl_right (avl_subtree_model g p) q<>Some p) in Q.
      rewrite L in A. rewrite R in Q. assumption. }
   destruct (crtos_right_fields__balance_returns g p q E D Cq) as [L [R Hh]].
   assert (Lx:avl_left (crtos_rotate_right g p) x=avl_left g x)
   by (rewrite L;destruct (Z.eq_dec x p),(Z.eq_dec x q);congruence).
   assert (Rx:avl_right (crtos_rotate_right g p) x=avl_right g x)
   by (rewrite R;destruct (Z.eq_dec x p),(Z.eq_dec x q);congruence).
   assert (Hx:avl_height_of (crtos_rotate_right g p) x=avl_height_of g x)
   by (rewrite Hh;destruct (Z.eq_dec x p),(Z.eq_dec x q);congruence).
   unfold avl_graph_node_store. rewrite Lx,Rx,Hx. entailer!.
Qed.
Lemma crtos_effect_lift__balance_returns : forall g p a b ret,
 crtos_balance_ready g p ->
 avl_gvalid a -> avl_root a=Some ret ->
 avl_nodes a=avl_nodes (avl_subtree_model g p) ->
 avl_nodes b=avl_nodes g ->
 (forall x,avl_vvalid a x <->avl_vvalid (avl_subtree_model g p) x) ->
 (forall x,avl_vvalid b x <->avl_vvalid g x) ->
 (forall x,avl_key_of b x=avl_key_of g x) ->
 (forall x,avl_vvalid a x ->avl_left b x=avl_left a x /\avl_right b x=avl_right a x) ->
 (forall x,avl_vvalid a x ->avl_key_of b x=avl_key_of a x /\avl_height_of b x=avl_height_of a x) ->
 b=crtos_balance_model g p ->ret=crtos_balance_ptr g p ->
 avl_height_of g p-1<=avl_height_of b ret<=avl_height_of g p ->
 (Z.abs (avl_model_balance_factor g p)<=1 ->b=g /\ret=p) ->
 crtos_balance_effect g b p ret.
Proof.
 intros g p a b ret B Ga R Na Nb D V K C H M P Heights Id.
 pose proof (crtos_projection_lift__balance_returns g p a b ret
 (avl_gvalid_tree_valid a Ga) R Na Nb D V C H) as Eq.
 assert (Gr:avl_gvalid (avl_subtree_model b ret)).
 { eapply crtos_equiv_gvalid__crtos_insert_composition;[apply crtos_equiv_sym__crtos_insert_composition;exact Eq|exact Ga]. }
 assert (Nr:ret<>0).
 { apply (proj2 (proj2 (avl_gvalid_tree_valid a Ga))).
   exact (GraphLib.examples.bst.root_valid _
   (GraphLib.examples.bst.bst_binary_tree _ (proj1 Ga)) ret R). }
 unfold crtos_balance_effect.
 split;[exact M|]. split;[exact P|]. split;[exact Nr|].
 split;[exact Nb|]. split;[exact V|]. split;[exact K|].
 split;[exact Gr|]. split.
 - intro x. rewrite (proj1 (proj2 (proj2 Eq)) x),D. reflexivity.
 - split;assumption.
Qed.
Lemma crtos_left_effect__balance_returns : forall g p q,
 crtos_balance_ready g p ->avl_right g p=Some q ->
 avl_model_balance_factor g p < -1 ->
 avl_model_balance_factor g q <=0 ->
 crtos_balance_effect g (crtos_rotate_left g p) p q.
Proof.
 intros g p q B E F C.
 assert (Q:q=avl_ptr_of (avl_right g p)) by (rewrite E;reflexivity).
 destruct (crtos_left_local_balance__balance_returns g p B F ltac:(rewrite <-Q;exact C)) as [Ga Heights].
 destruct (crtos_left_projection_fields__balance_returns g p q B E) as [Fields [Hh [Nq [D Rq]]]].
 assert (Root:avl_root (crtos_rotate_left (avl_subtree_model g p) p)=Some q).
 { rewrite crtos_rotate_left_root__crtos_insert_composition.
   change (avl_root (avl_subtree_model g p)) with (Some p).
   destruct (excluded_middle_informative (Some p=Some p));[|contradiction].
   destruct (crtos_balance_subroot__balance_returns g p B) as [T [N [V Ns]]].
   destruct (avl_projection_children__lr_graph_composition g p p (proj2 V)) as [L R].
   rewrite R,E. reflexivity. }
 eapply crtos_effect_lift__balance_returns with (a:=crtos_rotate_left (avl_subtree_model g p) p).
 - exact B.
 - exact Ga.
 - exact Root.
 - reflexivity.
 - reflexivity.
 - intro x. reflexivity.
 - intro x. reflexivity.
 - intro x. reflexivity.
 - intros x X. destruct (Fields x (proj2 X)) as [L R]. split;symmetry;assumption.
 - intros x X. split;[reflexivity|]. symmetry;apply Hh.
 - unfold crtos_balance_model.
   destruct (Z_lt_dec 1 (avl_model_balance_factor g p)) as [H|H].
   + lia.
   + destruct (Z_lt_dec (avl_model_balance_factor g p) (-1)) as [J|J];[|lia].
     rewrite E. simpl avl_ptr_of. destruct (Z_le_dec (avl_model_balance_factor g q) 0);[reflexivity|lia].
 - unfold crtos_balance_ptr.
   destruct (Z_lt_dec 1 (avl_model_balance_factor g p)) as [H|H].
   + lia.
   + destruct (Z_lt_dec (avl_model_balance_factor g p) (-1)) as [J|J];[|lia].
     rewrite E. simpl avl_ptr_of. destruct (Z_le_dec (avl_model_balance_factor g q) 0);[reflexivity|lia].
 - rewrite Q. rewrite <- Hh. exact Heights.
 - intro A. apply Z.abs_le in A. lia.
Qed.
Lemma crtos_right_effect__balance_returns : forall g p q,
 crtos_balance_ready g p ->avl_left g p=Some q ->
 avl_model_balance_factor g p >1 ->
 avl_model_balance_factor g q >=0 ->
 crtos_balance_effect g (crtos_rotate_right g p) p q.
Proof.
 intros g p q B E F C.
 assert (Q:q=avl_ptr_of (avl_left g p)) by (rewrite E;reflexivity).
 destruct (crtos_right_local_balance__balance_returns g p B F ltac:(rewrite <-Q;exact C)) as [Ga Heights].
 destruct (crtos_right_projection_fields__balance_returns g p q B E) as [Fields [Hh [Nq [D Rq]]]].
 assert (Root:avl_root (crtos_rotate_right (avl_subtree_model g p) p)=Some q).
 { rewrite crtos_rotate_right_root__crtos_insert_composition.
   change (avl_root (avl_subtree_model g p)) with (Some p).
   destruct (excluded_middle_informative (Some p=Some p));[|contradiction].
   destruct (crtos_balance_subroot__balance_returns g p B) as [T [N [V Ns]]].
   destruct (avl_projection_children__lr_graph_composition g p p (proj2 V)) as [L R].
   rewrite L,E. reflexivity. }
 eapply crtos_effect_lift__balance_returns with (a:=crtos_rotate_right (avl_subtree_model g p) p).
 - exact B.
 - exact Ga.
 - exact Root.
 - reflexivity.
 - reflexivity.
 - intro x. reflexivity.
 - intro x. reflexivity.
 - intro x. reflexivity.
 - intros x X. destruct (Fields x (proj2 X)) as [L R]. split;symmetry;assumption.
 - intros x X. split;[reflexivity|]. symmetry;apply Hh.
 - unfold crtos_balance_model.
   destruct (Z_lt_dec 1 (avl_model_balance_factor g p)) as [H|H].
   + rewrite E. simpl avl_ptr_of. destruct (Z_le_dec 0 (avl_model_balance_factor g q));[reflexivity|lia].
   + lia.
 - unfold crtos_balance_ptr.
   destruct (Z_lt_dec 1 (avl_model_balance_factor g p)) as [H|H].
   + rewrite E. simpl avl_ptr_of. destruct (Z_le_dec 0 (avl_model_balance_factor g q));[reflexivity|lia].
   + lia.
 - rewrite Q. rewrite <- Hh. exact Heights.
 - intro A. apply Z.abs_le in A. lia.
Qed.
Lemma crtos_owner_fold__balance_returns : forall g p,
 NoDup (avl_nodes g) ->In p (avl_nodes g) ->
 avl_graph_node_store g p **avl_graph_nodes_store g (avl_nodes_without g p) |--avl_tree_store g.
Proof.
 intros g p N V. unfold avl_tree_store.
 pose proof (avl_nodes_root_remove_permutation__null_unmatched_balanced_results (avl_nodes g) p N V) as P.
 rewrite <- (avl_graph_nodes_store_permutation__graph_store_decomposition g _ _ P).
 rewrite avl_graph_nodes_store_cons__graph_store_decomposition.
 unfold avl_nodes_without. entailer!.
Qed.
Lemma crtos_balanced_interval__balance_returns : forall g lo hi,
 avl_tree_valid g ->avl_balanced g ->
 (forall x,avl_vvalid g x ->lo<=avl_key_of g x<=hi) ->
 2*avl_child_height g (avl_root g)<=Z.max 0 (hi-lo+1)+2.
Proof.
 intros g lo hi T Bal Bound.
  destruct (avl_root g) as [p|] eqn:R; [|simpl;pose proof (Z.le_max_l 0 (hi-lo+1));lia].
  assert (V:avl_vvalid g p) by (exact (GraphLib.examples.bst.root_valid _ (GraphLib.examples.bst.bst_binary_tree _ (proj1 T)) p R)).
  pose proof (Bound p V) as Bp.
  set (l:=avl_child_model g (avl_left g p)).
  set (r:=avl_child_model g (avl_right g p)).
  assert (Tl:avl_tree_valid l).
  { apply avl_child_projection_valid__insert_projection_graft; [exact T|].
    intros x E;eapply avl_graph_child_valid__root_and_factor_setup; [exact (proj1 T)|exact V|auto]. }
  assert (Tr:avl_tree_valid r).
  { apply avl_child_projection_valid__insert_projection_graft; [exact T|].
    intros x E;eapply avl_graph_child_valid__root_and_factor_setup; [exact (proj1 T)|exact V|auto]. }
  pose proof (avl_root_height_nonnegative__insert_projection_graft l Tl) as Nl.
  pose proof (avl_root_height_nonnegative__insert_projection_graft r Tr) as Nr.
  pose proof (proj1 (proj2 T) p V) as [Hp Eq].
  pose proof (proj2 (avl_child_root__insert_projection_graft g (avl_left g p))) as El.
  pose proof (proj2 (avl_child_root__insert_projection_graft g (avl_right g p))) as Er.
  fold l in El. fold r in Er.
  rewrite <- El,<- Er in Eq.
  assert (Np:0<=avl_height_of g p) by lia.
  assert (Bl:forall x, avl_vvalid l x -> lo<=avl_key_of l x<=avl_key_of g p-1).
  { intros x X. pose proof (crtos_child_fields__crtos_insert_composition g (avl_left g p) x X) as [Xg [K _]].
    fold l in K. fold r in K.
    pose proof (Bound x Xg).
    pose proof (avl_key_of_member__insert_projection_graft l x Tl X) as I.
    pose proof (avl_left_keys_order__insert_projection_graft g p T V _ I). lia. }
  assert (Br:forall x, avl_vvalid r x -> avl_key_of g p+1<=avl_key_of r x<=hi).
  { intros x X. pose proof (crtos_child_fields__crtos_insert_composition g (avl_right g p) x X) as [Xg [K _]].
    fold l in K. fold r in K.
    pose proof (Bound x Xg).
    pose proof (avl_key_of_member__insert_projection_graft r x Tr X) as I.
    pose proof (avl_right_keys_order__insert_projection_graft g p T V _ I). lia. }

 pose proof (crtos_interval_height__crtos_insert_composition l lo (avl_key_of g p-1) Tl Bl) as IL.
 pose proof (crtos_interval_height__crtos_insert_composition r (avl_key_of g p+1) hi Tr Br) as IR.
 specialize (Bal p V). unfold avl_model_balance_factor in Bal.
 rewrite <-El,<-Er in Bal. apply Z.abs_le in Bal.
 simpl avl_child_height.
 rewrite Z.max_r in IL by lia. rewrite Z.max_r in IR by lia.
 rewrite Z.max_r by lia. rewrite Eq. lia.
Qed.
Lemma crtos_ready_interval__balance_returns : forall g lo hi,
 avl_tree_valid g ->
 (forall x,avl_vvalid g x -> x<>avl_ptr_of (avl_root g) ->Z.abs (avl_model_balance_factor g x)<=1) ->
 Z.abs (avl_model_balance_factor g (avl_ptr_of (avl_root g)))<=2 ->
 (forall x,avl_vvalid g x ->lo<=avl_key_of g x<=hi) ->
 4*avl_child_height g (avl_root g)<=Z.max 0 (hi-lo+1)+11.
Proof.
 intros g lo hi T Bal BF Bound.
  destruct (avl_root g) as [p|] eqn:R; [|simpl;pose proof (Z.le_max_l 0 (hi-lo+1));lia].
  assert (V:avl_vvalid g p) by (exact (GraphLib.examples.bst.root_valid _ (GraphLib.examples.bst.bst_binary_tree _ (proj1 T)) p R)).
  pose proof (Bound p V) as Bp.
  set (l:=avl_child_model g (avl_left g p)).
  set (r:=avl_child_model g (avl_right g p)).
  assert (Tl:avl_tree_valid l).
  { apply avl_child_projection_valid__insert_projection_graft; [exact T|].
    intros x E;eapply avl_graph_child_valid__root_and_factor_setup; [exact (proj1 T)|exact V|auto]. }
  assert (Tr:avl_tree_valid r).
  { apply avl_child_projection_valid__insert_projection_graft; [exact T|].
    intros x E;eapply avl_graph_child_valid__root_and_factor_setup; [exact (proj1 T)|exact V|auto]. }
  pose proof (avl_root_height_nonnegative__insert_projection_graft l Tl) as Nl.
  pose proof (avl_root_height_nonnegative__insert_projection_graft r Tr) as Nr.
  pose proof (proj1 (proj2 T) p V) as [Hp Eq].
  pose proof (proj2 (avl_child_root__insert_projection_graft g (avl_left g p))) as El.
  pose proof (proj2 (avl_child_root__insert_projection_graft g (avl_right g p))) as Er.
  fold l in El. fold r in Er.
  rewrite <- El,<- Er in Eq.
  assert (Np:0<=avl_height_of g p) by lia.
  assert (Bl:forall x, avl_vvalid l x -> lo<=avl_key_of l x<=avl_key_of g p-1).
  { intros x X. pose proof (crtos_child_fields__crtos_insert_composition g (avl_left g p) x X) as [Xg [K _]].
    fold l in K. fold r in K.
    pose proof (Bound x Xg).
    pose proof (avl_key_of_member__insert_projection_graft l x Tl X) as I.
    pose proof (avl_left_keys_order__insert_projection_graft g p T V _ I). lia. }
  assert (Br:forall x, avl_vvalid r x -> avl_key_of g p+1<=avl_key_of r x<=hi).
  { intros x X. pose proof (crtos_child_fields__crtos_insert_composition g (avl_right g p) x X) as [Xg [K _]].
    fold l in K. fold r in K.
    pose proof (Bound x Xg).
    pose proof (avl_key_of_member__insert_projection_graft r x Tr X) as I.
    pose proof (avl_right_keys_order__insert_projection_graft g p T V _ I). lia. }

 assert (Children:forall c h,
 (c=avl_left g p \/c=avl_right g p) ->h=avl_child_model g c ->
 avl_tree_valid h ->avl_balanced h).
 { intros c h C H Th x X.
   destruct (crtos_child_fields__crtos_insert_composition g c x ltac:(rewrite <-H;exact X)) as [Vx [K [Hx [L Q]]]].
   rewrite <-H in Hx,L,Q.
   assert (D:x<>p).
   { intro E;subst x.
     pose proof (avl_all_heights_root_bound__insert_projection_graft h Th p X) as Px.
     pose proof (avl_child_height_lt__insert_projection_graft g p c T V C) as Hlt.
     pose proof (proj2 (avl_child_root__insert_projection_graft g c)) as Ch.
     rewrite <-H in Ch. rewrite Ch in Px. rewrite Hx in Px. lia. }
   unfold avl_model_balance_factor. rewrite L,Q,H.
   destruct c as [cc|] eqn:Ec.
   - change (Z.abs (avl_model_balance_factor g x)<=1).
     apply Bal;[exact Vx|]. change (x<>p);exact D.
   - rewrite H in X. contradiction. }
 pose proof (crtos_balanced_interval__balance_returns l lo (avl_key_of g p-1) Tl
 (Children (avl_left g p) l (or_introl eq_refl) eq_refl Tl) Bl) as IL.
 pose proof (crtos_balanced_interval__balance_returns r (avl_key_of g p+1) hi Tr
 (Children (avl_right g p) r (or_intror eq_refl) eq_refl Tr) Br) as IR.
 rewrite ?R in BF. simpl avl_ptr_of in BF.
 unfold avl_model_balance_factor in BF. rewrite <-El,<-Er in BF. apply Z.abs_le in BF.
 simpl avl_child_height.
 rewrite Z.max_r in IL by lia. rewrite Z.max_r in IR by lia.
 rewrite Z.max_r by lia. rewrite Eq. lia.
Qed.
Lemma crtos_balance_input_from_keys__balance_returns : forall g p,
 crtos_balance_ready g p ->
 (forall x,avl_vvalid (avl_subtree_model g p) x ->
 INT_MIN<=avl_key_of (avl_subtree_model g p) x<=INT_MAX) ->
 avl_balance_graph_input (avl_subtree_model g p) p.
Proof.
 intros g p B Keys.
 destruct (crtos_balance_subroot__balance_returns g p B) as [T [N [V Nd]]].
 set (s:=avl_subtree_model g p) in *.
 assert (Bal:forall x,avl_vvalid s x ->x<>p ->Z.abs (avl_model_balance_factor s x)<=1).
 { intros x X D. unfold s. rewrite crtos_subtree_factor__balance_returns by exact X.
 exact (proj1 (proj2 (proj2 (proj2 B))) x X D). }
 assert (F:Z.abs (avl_model_balance_factor s p)<=2).
 { unfold s. rewrite crtos_subtree_factor__balance_returns by exact V.
 exact (proj2 (proj2 (proj2 (proj2 B)))). }
 pose proof (crtos_ready_interval__balance_returns s INT_MIN INT_MAX T
 ltac:(change (forall x,avl_vvalid s x ->x<>p ->Z.abs (avl_model_balance_factor s x)<=1);exact Bal)
 ltac:(change (Z.abs (avl_model_balance_factor s p)<=2);exact F) Keys) as Hb.
 change (4*avl_height_of s p <=Z.max 0 (INT_MAX-INT_MIN+1)+11) in Hb.
 assert (Bound:avl_height_of s p<=INT_MAX) by lia.
 unfold avl_balance_graph_input,avl_balance_input_valid.
 split.
 - split;[exact (proj1 T)|]. split;[exact (proj1 (proj2 T))|].
   split;[exact (proj2 (proj2 T))|]. split;[exact Bal|].
   split.
   + intros x X. pose proof (avl_all_heights_root_bound__insert_projection_graft s T x X).
     change (avl_child_height s (avl_root s)) with (avl_height_of s p) in H. lia.
   + split;[intro E;contradiction|intro E;reflexivity].
 - intro E. exact F.
Qed.
Lemma crtos_reach_cons__balance_returns : forall g a b c,
 (avl_left g a=Some b \/avl_right g a=Some b) ->
 avl_reachable g b c ->avl_reachable g a c.
Proof.
 intros g a b c E R. unfold avl_reachable,GraphLib.examples.bst.bt_path in *.
 destruct R as [n R]. exists (S n). simpl. exists b. split;assumption.
Qed.
Lemma crtos_reach_trans__balance_returns : forall g a b c,
 avl_reachable g a b ->avl_reachable g b c ->avl_reachable g a c.
Proof.
 intros g a b c P Q.
 unfold avl_reachable,GraphLib.examples.bst.bt_path in P.
 destruct P as [n P]. induction n in a,P|-*.
 - change (a=b) in P. subst a;exact Q.
 - simpl in P. destruct P as [x [E P]].
   eapply crtos_reach_cons__balance_returns;[exact E|]. apply IHn;exact P.
Qed.
Lemma crtos_lr_middle_exists__balance_returns : forall g h x result,
 avl_lr_rotation_input g x ->
 avl_left_rotation_result (avl_subtree_model g (avl_ptr_of (avl_left g x))) h
 (avl_ptr_of (avl_left g x)) result ->
 exists m,avl_lr_middle g m x (avl_ptr_of (avl_left g x))
 (avl_ptr_of (avl_right g (avl_ptr_of (avl_left g x)))) /\
 avl_right_rotation_input m x.
Proof.
  intros g h x result Hin Hout.
  pose proof Hin as [Hv [Hr [Hx [Hnx [Hnl [Hnp Hbound]]]]]].
  pose proof (GraphLib.examples.bst.bst_binary_tree _ (proj1 Hv)) as Ht.
  destruct (avl_left g x) as [l|] eqn:Hl; [|contradiction]. simpl avl_ptr_of in *.
  destruct (avl_right g l) as [p|] eqn:Hp; [|contradiction]. simpl avl_ptr_of in Hnp.
  assert (HvL : avl_vvalid g l) by (eapply (GraphLib.examples.bst.child_valid _ Ht x l Hx); auto).
  assert (HvP : avl_vvalid g p) by (eapply (GraphLib.examples.bst.child_valid _ Ht l p HvL); auto).
  assert (Hlp : avl_reachable g l p).
  { unfold avl_reachable, GraphLib.examples.bst.bt_path. eapply crtos_reach_cons__balance_returns with (b:=p); [right; exact Hp|first [reflexivity|unfold avl_reachable,GraphLib.examples.bst.bt_path;exists 0%nat;hnf;reflexivity]]. }
  pose proof (avl_projection_children__lr_graph_composition g l l (ltac:(first [reflexivity|unfold avl_reachable,GraphLib.examples.bst.bt_path;exists 0%nat;hnf;reflexivity]))) as [Hsll Hslr].
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
    (GraphLib.examples.bst.left_rotate Z.eq_dec (GraphLib.examples.bst.bst_tree (avl_bst g)) l p)) by first [reflexivity|unfold avl_reachable,GraphLib.examples.bst.bt_path;exists 0%nat;hnf;reflexivity].
  assert (Hrd : forall z, avl_vvalid raw z <-> avl_vvalid g z) by (intro z; first [reflexivity|unfold avl_reachable,GraphLib.examples.bst.bt_path;exists 0%nat;hnf;reflexivity]).
  assert (Hrk : forall z, avl_key_of raw z = avl_key_of g z) by (intro z; first [reflexivity|unfold avl_reachable,GraphLib.examples.bst.bt_path;exists 0%nat;hnf;reflexivity]).
  assert (Hrn : avl_nodes raw = avl_nodes g) by first [reflexivity|unfold avl_reachable,GraphLib.examples.bst.bt_path;exists 0%nat;hnf;reflexivity].
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
  assert (Hlx : l <> x) by (pose proof (Hleftkey l (ltac:(first [reflexivity|unfold avl_reachable,GraphLib.examples.bst.bt_path;exists 0%nat;hnf;reflexivity]))); intro E; subst; lia).
  assert (Hpx : p <> x) by (pose proof (Hleftkey p Hlp); intro E; subst; lia).
  assert (HavoidR : forall z, avl_vvalid g z -> avl_reachable g (avl_ptr_of (avl_right g x)) z -> z <> x /\ z <> l /\ z <> p).
  { intros z Hz Hpz. pose proof (Hrightkey z Hz Hpz).
    pose proof (Hleftkey l (ltac:(first [reflexivity|unfold avl_reachable,GraphLib.examples.bst.bt_path;exists 0%nat;hnf;reflexivity]))). pose proof (Hleftkey p Hlp).
    repeat split; intro E; subst; lia. }
  assert (Hframe : forall z, avl_vvalid g z -> avl_reachable g (avl_ptr_of (avl_right g x)) z ->
    avl_left raw z = avl_left g z /\ avl_right raw z = avl_right g z).
  { intros z Hz Hpz. destruct (HavoidR z Hz Hpz) as [Hzx [Hzl Hzp]].
    exact (avl_lr_outside_children__lr_graph_composition g raw x l p z Hv Hx Hl Hz Hzx Hzl Hzp Hrb). }
  assert (Hrawbst : avl_bst_valid raw).
  { eapply (avl_lr_graft_bst__lr_graph_composition g h raw x l p Hv Hr Hx Hl Hhv Hhr Hhd Hkeys); eauto.
    unfold raw; simpl. eapply GraphLib.examples.bst.left_rotate_preserves_gvalid; eauto. }
  pose proof (GraphLib.examples.bst.bst_binary_tree _ (proj1 Hhv)) as Hht.
  assert (Hvlh : avl_vvalid h l) by (apply (proj2 (Hhd l)); split; [exact HvL|first [reflexivity|unfold avl_reachable,GraphLib.examples.bst.bt_path;exists 0%nat;hnf;reflexivity]]).
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
  { unfold m,avl_with_root_cache,avl_height_update; simpl. destruct (Z.eq_dec x x); [first [reflexivity|unfold avl_reachable,GraphLib.examples.bst.bt_path;exists 0%nat;hnf;reflexivity]|contradiction]. }
  assert (Hmnot : forall z, z <> x -> avl_height_of m z = avl_height_of h z).
  { intros z Hz. unfold m,avl_with_root_cache,avl_height_update; simpl. destruct (Z.eq_dec z x); [contradiction|first [reflexivity|unfold avl_reachable,GraphLib.examples.bst.bt_path;exists 0%nat;hnf;reflexivity]]. }
  assert (Hmlocal : forall z, avl_vvalid h z -> avl_height_of m z = avl_height_of h z).
  { intros z Hz. apply Hmnot. destruct (proj1 (Hhd z) Hz) as [_ Hpz]. pose proof (Hleftkey z Hpz). intro E; subst; lia. }
  assert (Hmframe : forall z, avl_vvalid g z -> avl_reachable g (avl_ptr_of (avl_right g x)) z -> avl_height_of m z = avl_height_of g z).
  { intros z Hz Hpz. destruct (HavoidR z Hz Hpz) as [Hzx [Hzl Hzp]]. rewrite Hmnot by exact Hzx. apply Hnon; assumption. }
  assert (HchildH : forall z child, avl_vvalid h z ->
    (avl_left h z = child \/ avl_right h z = child) -> avl_child_height m child = avl_child_height h child).
  { intros z [c|] Hz Hc; simpl; [|first [reflexivity|unfold avl_reachable,GraphLib.examples.bst.bt_path;exists 0%nat;hnf;reflexivity]]. apply Hmlocal.
    eapply (GraphLib.examples.bst.child_valid _ Hht z c Hz); exact Hc. }
  assert (HchildR : forall z child, avl_vvalid g z -> avl_reachable g (avl_ptr_of (avl_right g x)) z ->
    (avl_left g z = child \/ avl_right g z = child) -> avl_child_height m child = avl_child_height g child).
  { intros z [c|] Hz Hpz Hc; simpl; [|first [reflexivity|unfold avl_reachable,GraphLib.examples.bst.bt_path;exists 0%nat;hnf;reflexivity]]. apply Hmframe.
    - eapply (GraphLib.examples.bst.child_valid _ Ht z c Hz); exact Hc.
    - eapply crtos_reach_trans__balance_returns; [exact Hpz|]. unfold avl_reachable,GraphLib.examples.bst.bt_path. eapply crtos_reach_cons__balance_returns with (b:=c); [exact Hc|first [reflexivity|unfold avl_reachable,GraphLib.examples.bst.bt_path;exists 0%nat;hnf;reflexivity]]. }
  assert (HchildX : avl_child_height m (avl_right g x) = avl_child_height g (avl_right g x)).
  { destruct (avl_right g x) as [c|] eqn:Ec; simpl; [|first [reflexivity|unfold avl_reachable,GraphLib.examples.bst.bt_path;exists 0%nat;hnf;reflexivity]]. apply Hmframe.
    - eapply (GraphLib.examples.bst.child_valid _ Ht x c Hx); auto.
    - first [reflexivity|unfold avl_reachable,GraphLib.examples.bst.bt_path;exists 0%nat;hnf;reflexivity]. }
  assert (HrawchildX : avl_child_height raw (avl_right g x) = avl_child_height g (avl_right g x)).
  { destruct (avl_right g x) as [c|] eqn:Ec; simpl; [|first [reflexivity|unfold avl_reachable,GraphLib.examples.bst.bt_path;exists 0%nat;hnf;reflexivity]].
    assert (Hvc : avl_vvalid g c) by (eapply (GraphLib.examples.bst.child_valid _ Ht x c Hx); auto).
    assert (Hpc : avl_reachable g (avl_ptr_of (avl_right g x)) c) by (rewrite Ec; first [reflexivity|unfold avl_reachable,GraphLib.examples.bst.bt_path;exists 0%nat;hnf;reflexivity]).
    destruct (HavoidR c Hvc (ltac:(first [reflexivity|unfold avl_reachable,GraphLib.examples.bst.bt_path;exists 0%nat;hnf;reflexivity]))) as [_ [Hcl Hcp]]. apply Hnon; assumption. }
  assert (Hnew : newheight = Z.max (avl_height_of h p) (avl_child_height g (avl_right g x)) + 1).
  { unfold newheight. rewrite Hrl,Hrrc,HrawchildX. first [reflexivity|unfold avl_reachable,GraphLib.examples.bst.bt_path;exists 0%nat;hnf;reflexivity]. }
  pose proof (avl_left_rotation_pivot_children__left_rotation_graph_heights _ h l p
    (avl_subtree_projection_valid__lr_graph_composition g l Hv HvL) Hrot) as [Hhpl [Hhpr [Hhll Hhlr]]].
  rewrite Hsll in Hhll. rewrite Hspl in Hhlr. rewrite Hspr in Hhpr.
  assert (Hsubchild : forall z child, avl_vvalid g z ->
    (avl_left g z = child \/ avl_right g z = child) ->
    child <> Some l -> child <> Some p -> avl_child_height h child = avl_child_height g child).
  { intros z [c|] Hz Hc Hcl Hcp; simpl; [|first [reflexivity|unfold avl_reachable,GraphLib.examples.bst.bt_path;exists 0%nat;hnf;reflexivity]]. apply Hnon; congruence. }
  assert (Hcll : avl_child_height h (avl_left g l) = avl_child_height g (avl_left g l)).
  { apply (Hsubchild l _ HvL (or_introl eq_refl)).
    - intro E; exact (GraphLib.examples.bst.bt_child_no_self _ _ Ht HvL (or_introl E)).
    - intro E; exact (GraphLib.examples.bst.child_distinct _ Ht l p p HvL HvP HvP E Hp eq_refl). }
  assert (Hclp : avl_child_height h (avl_left g p) = avl_child_height g (avl_left g p)).
  { apply (Hsubchild p _ HvP (or_introl eq_refl)).
    - intro E; eapply (GraphLib.examples.bst.bt_child_no_back_path _ l p Ht HvL (or_intror Hp)).
      unfold GraphLib.examples.bst.bt_path. eapply crtos_reach_cons__balance_returns with (b:=l); [left; exact E|first [reflexivity|unfold avl_reachable,GraphLib.examples.bst.bt_path;exists 0%nat;hnf;reflexivity]].
    - intro E; exact (GraphLib.examples.bst.bt_child_no_self _ _ Ht HvP (or_introl E)). }
  assert (Hcrp : avl_child_height h (avl_right g p) = avl_child_height g (avl_right g p)).
  { apply (Hsubchild p _ HvP (or_intror eq_refl)).
    - intro E; eapply (GraphLib.examples.bst.bt_child_no_back_path _ l p Ht HvL (or_intror Hp)).
      unfold GraphLib.examples.bst.bt_path. eapply crtos_reach_cons__balance_returns with (b:=l); [right; exact E|first [reflexivity|unfold avl_reachable,GraphLib.examples.bst.bt_path;exists 0%nat;hnf;reflexivity]].
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
  exists m. split;assumption.
Qed.
Lemma crtos_lr_canonical_exists__balance_returns : forall g p,
 avl_lr_rotation_input g p ->exists a r,avl_lr_rotation_result g a p r.
Proof.
 intros g p Inp.
 pose proof (avl_lr_prepare_inner__lr_graph_composition g p Inp) as Inner.
 destruct (avl_left_cached_output_exists__left_rotation_cached_graph _ _ Inner) as [h [r [E [V [Res Rest]]]]].
 destruct (crtos_lr_middle_exists__balance_returns g h p r Inp Res) as [m [Mid Out]].
 destruct (avl_right_rotation_output_exists__right_rotation_graph m p Out) as [a [q [Eo [Vo [R Rest2]]]]].
 exists a,q. eapply avl_lr_compose_result__lr_graph_composition;eauto.
Qed.
Lemma crtos_rl_middle_exists__balance_returns : forall g h x result,
 avl_rl_rotation_input g x ->
 avl_right_rotation_result (avl_subtree_model g (avl_ptr_of (avl_right g x))) h
 (avl_ptr_of (avl_right g x)) result ->
 exists m,avl_rl_middle g m x (avl_ptr_of (avl_right g x))
 (avl_ptr_of (avl_left g (avl_ptr_of (avl_right g x)))) /\
 avl_left_rotation_cached_input m x.
Proof.
  intros g h x result Hin Hout.
  pose proof Hin as [Hv [Hr [Hx [Hnx [Hnl [Hnp Hbound]]]]]].
  pose proof (GraphLib.examples.bst.bst_binary_tree _ (proj1 Hv)) as Ht.
  destruct (avl_right g x) as [l|] eqn:Hl; [|contradiction]. simpl avl_ptr_of in *.
  destruct (avl_left g l) as [p|] eqn:Hp; [|contradiction]. simpl avl_ptr_of in Hnp.
  assert (HvL : avl_vvalid g l) by (eapply (GraphLib.examples.bst.child_valid _ Ht x l Hx); auto).
  assert (HvP : avl_vvalid g p) by (eapply (GraphLib.examples.bst.child_valid _ Ht l p HvL); auto).
  assert (Hlp : avl_reachable g l p).
  { unfold avl_reachable, GraphLib.examples.bst.bt_path. eapply crtos_reach_cons__balance_returns with (b:=p); [left; exact Hp|first [reflexivity|unfold avl_reachable,GraphLib.examples.bst.bt_path;exists 0%nat;hnf;reflexivity]]. }
  pose proof (avl_projection_children__lr_graph_composition g l l (ltac:(first [reflexivity|unfold avl_reachable,GraphLib.examples.bst.bt_path;exists 0%nat;hnf;reflexivity]))) as [Hslr Hsll].
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
    (GraphLib.examples.bst.right_rotate Z.eq_dec (GraphLib.examples.bst.bst_tree (avl_bst g)) l p)) by first [reflexivity|unfold avl_reachable,GraphLib.examples.bst.bt_path;exists 0%nat;hnf;reflexivity].
  assert (Hrd : forall z, avl_vvalid raw z <-> avl_vvalid g z) by (intro z; first [reflexivity|unfold avl_reachable,GraphLib.examples.bst.bt_path;exists 0%nat;hnf;reflexivity]).
  assert (Hrk : forall z, avl_key_of raw z = avl_key_of g z) by (intro z; first [reflexivity|unfold avl_reachable,GraphLib.examples.bst.bt_path;exists 0%nat;hnf;reflexivity]).
  assert (Hrn : avl_nodes raw = avl_nodes g) by first [reflexivity|unfold avl_reachable,GraphLib.examples.bst.bt_path;exists 0%nat;hnf;reflexivity].
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
  assert (Hlx : l <> x) by (pose proof (Hrightkey l (ltac:(first [reflexivity|unfold avl_reachable,GraphLib.examples.bst.bt_path;exists 0%nat;hnf;reflexivity]))); intro E; subst; lia).
  assert (Hpx : p <> x) by (pose proof (Hrightkey p Hlp); intro E; subst; lia).
  assert (HavoidR : forall z, avl_vvalid g z -> avl_reachable g (avl_ptr_of (avl_left g x)) z -> z <> x /\ z <> l /\ z <> p).
  { intros z Hz Hpz. pose proof (Hleftkey z Hz Hpz).
    pose proof (Hrightkey l (ltac:(first [reflexivity|unfold avl_reachable,GraphLib.examples.bst.bt_path;exists 0%nat;hnf;reflexivity]))). pose proof (Hrightkey p Hlp).
    repeat split; intro E; subst; lia. }
  assert (Hframe : forall z, avl_vvalid g z -> avl_reachable g (avl_ptr_of (avl_left g x)) z ->
    avl_right raw z = avl_right g z /\ avl_left raw z = avl_left g z).
  { intros z Hz Hpz. destruct (HavoidR z Hz Hpz) as [Hzx [Hzl Hzp]].
    exact (avl_rl_outside_children__rl_graph_composition g raw x l p z Hv Hx Hl Hz Hzx Hzl Hzp Hrb). }
  assert (Hrawbst : avl_bst_valid raw).
  { eapply (avl_rl_graft_bst__rl_graph_composition g h raw x l p Hv Hr Hx Hl Hhv Hhr Hhd Hkeys); eauto.
    unfold raw; simpl. eapply GraphLib.examples.bst.right_rotate_preserves_gvalid; eauto. }
  pose proof (GraphLib.examples.bst.bst_binary_tree _ (proj1 Hhv)) as Hht.
  assert (Hvlh : avl_vvalid h l) by (apply (proj2 (Hhd l)); split; [exact HvL|first [reflexivity|unfold avl_reachable,GraphLib.examples.bst.bt_path;exists 0%nat;hnf;reflexivity]]).
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
  { unfold m,avl_with_root_cache,avl_height_update; simpl. destruct (Z.eq_dec x x); [first [reflexivity|unfold avl_reachable,GraphLib.examples.bst.bt_path;exists 0%nat;hnf;reflexivity]|contradiction]. }
  assert (Hmnot : forall z, z <> x -> avl_height_of m z = avl_height_of h z).
  { intros z Hz. unfold m,avl_with_root_cache,avl_height_update; simpl. destruct (Z.eq_dec z x); [contradiction|first [reflexivity|unfold avl_reachable,GraphLib.examples.bst.bt_path;exists 0%nat;hnf;reflexivity]]. }
  assert (Hmlocal : forall z, avl_vvalid h z -> avl_height_of m z = avl_height_of h z).
  { intros z Hz. apply Hmnot. destruct (proj1 (Hhd z) Hz) as [_ Hpz]. pose proof (Hrightkey z Hpz). intro E; subst; lia. }
  assert (Hmframe : forall z, avl_vvalid g z -> avl_reachable g (avl_ptr_of (avl_left g x)) z -> avl_height_of m z = avl_height_of g z).
  { intros z Hz Hpz. destruct (HavoidR z Hz Hpz) as [Hzx [Hzl Hzp]]. rewrite Hmnot by exact Hzx. apply Hnon; assumption. }
  assert (HchildH : forall z child, avl_vvalid h z ->
    (avl_left h z = child \/ avl_right h z = child) -> avl_child_height m child = avl_child_height h child).
  { intros z [c|] Hz Hc; simpl; [|first [reflexivity|unfold avl_reachable,GraphLib.examples.bst.bt_path;exists 0%nat;hnf;reflexivity]]. apply Hmlocal.
    eapply (GraphLib.examples.bst.child_valid _ Hht z c Hz); exact Hc. }
  assert (HchildR : forall z child, avl_vvalid g z -> avl_reachable g (avl_ptr_of (avl_left g x)) z ->
    (avl_left g z = child \/ avl_right g z = child) -> avl_child_height m child = avl_child_height g child).
  { intros z [c|] Hz Hpz Hc; simpl; [|first [reflexivity|unfold avl_reachable,GraphLib.examples.bst.bt_path;exists 0%nat;hnf;reflexivity]]. apply Hmframe.
    - eapply (GraphLib.examples.bst.child_valid _ Ht z c Hz); exact Hc.
    - eapply crtos_reach_trans__balance_returns; [exact Hpz|]. unfold avl_reachable,GraphLib.examples.bst.bt_path. eapply crtos_reach_cons__balance_returns with (b:=c); [exact Hc|first [reflexivity|unfold avl_reachable,GraphLib.examples.bst.bt_path;exists 0%nat;hnf;reflexivity]]. }
  assert (HchildX : avl_child_height m (avl_left g x) = avl_child_height g (avl_left g x)).
  { destruct (avl_left g x) as [c|] eqn:Ec; simpl; [|first [reflexivity|unfold avl_reachable,GraphLib.examples.bst.bt_path;exists 0%nat;hnf;reflexivity]]. apply Hmframe.
    - eapply (GraphLib.examples.bst.child_valid _ Ht x c Hx); auto.
    - first [reflexivity|unfold avl_reachable,GraphLib.examples.bst.bt_path;exists 0%nat;hnf;reflexivity]. }
  assert (HrawchildX : avl_child_height raw (avl_left g x) = avl_child_height g (avl_left g x)).
  { destruct (avl_left g x) as [c|] eqn:Ec; simpl; [|first [reflexivity|unfold avl_reachable,GraphLib.examples.bst.bt_path;exists 0%nat;hnf;reflexivity]].
    assert (Hvc : avl_vvalid g c) by (eapply (GraphLib.examples.bst.child_valid _ Ht x c Hx); auto).
    assert (Hpc : avl_reachable g (avl_ptr_of (avl_left g x)) c) by (rewrite Ec; first [reflexivity|unfold avl_reachable,GraphLib.examples.bst.bt_path;exists 0%nat;hnf;reflexivity]).
    destruct (HavoidR c Hvc (ltac:(first [reflexivity|unfold avl_reachable,GraphLib.examples.bst.bt_path;exists 0%nat;hnf;reflexivity]))) as [_ [Hcl Hcp]]. apply Hnon; assumption. }
  assert (Hnew : newheight = Z.max (avl_height_of h p) (avl_child_height g (avl_left g x)) + 1).
  { unfold newheight. rewrite Hrl,Hrrc,HrawchildX. first [reflexivity|unfold avl_reachable,GraphLib.examples.bst.bt_path;exists 0%nat;hnf;reflexivity]. }
  pose proof (avl_right_rotation_pivot_children__right_rotation_graph _ h l p
    (avl_subtree_projection_valid__lr_graph_composition g l Hv HvL) Hrot) as [Hhpl [Hhpr [Hhll Hhlr]]].
  rewrite Hsll in Hhll. rewrite Hspl in Hhlr. rewrite Hspr in Hhpr.
  assert (Hsubchild : forall z child, avl_vvalid g z ->
    (avl_left g z = child \/ avl_right g z = child) ->
    child <> Some l -> child <> Some p -> avl_child_height h child = avl_child_height g child).
  { intros z [c|] Hz Hc Hcl Hcp; simpl; [|first [reflexivity|unfold avl_reachable,GraphLib.examples.bst.bt_path;exists 0%nat;hnf;reflexivity]]. apply Hnon; congruence. }
  assert (Hcll : avl_child_height h (avl_right g l) = avl_child_height g (avl_right g l)).
  { apply (Hsubchild l _ HvL (or_intror eq_refl)).
    - intro E; exact (GraphLib.examples.bst.bt_child_no_self _ _ Ht HvL (or_intror E)).
    - intro E; exact (GraphLib.examples.bst.child_distinct _ Ht l p p HvL HvP HvP Hp E eq_refl). }
  assert (Hclp : avl_child_height h (avl_right g p) = avl_child_height g (avl_right g p)).
  { apply (Hsubchild p _ HvP (or_intror eq_refl)).
    - intro E; eapply (GraphLib.examples.bst.bt_child_no_back_path _ l p Ht HvL (or_introl Hp)).
      unfold GraphLib.examples.bst.bt_path. eapply crtos_reach_cons__balance_returns with (b:=l); [right; exact E|first [reflexivity|unfold avl_reachable,GraphLib.examples.bst.bt_path;exists 0%nat;hnf;reflexivity]].
    - intro E; exact (GraphLib.examples.bst.bt_child_no_self _ _ Ht HvP (or_intror E)). }
  assert (Hcrp : avl_child_height h (avl_left g p) = avl_child_height g (avl_left g p)).
  { apply (Hsubchild p _ HvP (or_introl eq_refl)).
    - intro E; eapply (GraphLib.examples.bst.bt_child_no_back_path _ l p Ht HvL (or_introl Hp)).
      unfold GraphLib.examples.bst.bt_path. eapply crtos_reach_cons__balance_returns with (b:=l); [left; exact E|first [reflexivity|unfold avl_reachable,GraphLib.examples.bst.bt_path;exists 0%nat;hnf;reflexivity]].
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
  exists m. split;assumption.
Qed.
Lemma crtos_rl_canonical_exists__balance_returns : forall g p,
 avl_rl_rotation_input g p ->exists a r,avl_rl_rotation_result g a p r.
Proof.
 intros g p Inp.
 pose proof (avl_rl_prepare_inner__rl_graph_composition g p Inp) as Inner.
 destruct (avl_right_rotation_output_exists__right_rotation_graph _ _ Inner) as [h [r [E [V [Res Rest]]]]].
 destruct (crtos_rl_middle_exists__balance_returns g h p r Inp Res) as [m [Mid Out]].
 destruct (avl_left_cached_output_exists__left_rotation_cached_graph m p Out) as [a [q [Eo [Vo [R Rest2]]]]].
 exists a,q. eapply avl_rl_compose_result__rl_graph_composition;eauto.
Qed.
Lemma crtos_lr_shape__balance_returns : forall g p q r,
 avl_left g p=Some q -> avl_right g q=Some r ->
 p<>q -> p<>r -> q<>r -> avl_right g r<>Some q ->
 let h:=Z.max (avl_child_height g (avl_left g q)) (avl_child_height g (avl_left g r))+1 in
 let k:=Z.max h (avl_child_height g (avl_right g r))+1 in
 let m:=crtos_lr_middle_model g p in
 avl_left m p=Some r /\ avl_right m p=avl_right g p /\
 avl_left m r=Some q /\ avl_right m r=avl_right g r /\
 (forall x,avl_height_of m x=if Z.eq_dec x r then k else if Z.eq_dec x q then h else avl_height_of g x).
Proof.
 intros g p q r L R Pq Pr Qr C h k m.
 assert (E:avl_ptr_of (avl_left g p)=q) by (rewrite L;reflexivity).
 unfold m,crtos_lr_middle_model. rewrite E.
 unfold crtos_rotate_left. rewrite R.
 unfold crtos_reroot_rotation,crtos_set_root,crtos_set_left,crtos_set_right,crtos_update_height,crtos_height_value,crtos_fields.
 cbv beta iota zeta delta [avl_left avl_right avl_root avl_nodes avl_vvalid avl_key_of avl_ptr_of avl_child_height avl_height_of avl_bst avl_with_root_cache avl_height_update GraphLib.examples.bst.bst_tree GraphLib.examples.bst.left_child GraphLib.examples.bst.right_child GraphLib.examples.bst.bst_key GraphLib.examples.bst.theroot GraphLib.examples.bst.listV].
 repeat match goal with |- context[Z.eq_dec ?a ?b] => destruct (Z.eq_dec a b); try congruence end.

 repeat split; try reflexivity.
 intro x.
 change ((if Z.eq_dec x r then Z.max h
 (match avl_right g r with Some c => if Z.eq_dec c q then h else avl_height_of g c | None => 0 end)+1
 else if Z.eq_dec x q then h else avl_height_of g x)=
 (if Z.eq_dec x r then k else if Z.eq_dec x q then h else avl_height_of g x)).
 destruct (avl_right g r) as [c|] eqn:Rc; [|reflexivity].
 destruct (Z.eq_dec c q); [subst;contradiction|]. reflexivity.
Qed.
Lemma crtos_rl_shape__balance_returns : forall g p q r,
 avl_right g p=Some q -> avl_left g q=Some r ->
 p<>q -> p<>r -> q<>r -> avl_left g r<>Some q ->
 let h:=Z.max (avl_child_height g (avl_right g r)) (avl_child_height g (avl_right g q))+1 in
 let k:=Z.max (avl_child_height g (avl_left g r)) h+1 in
 let m:=crtos_rl_middle_model g p in
 avl_right m p=Some r /\ avl_left m p=avl_left g p /\
 avl_right m r=Some q /\ avl_left m r=avl_left g r /\
 (forall x,avl_height_of m x=if Z.eq_dec x r then k else if Z.eq_dec x q then h else avl_height_of g x).
Proof.
 intros g p q r L R Pq Pr Qr C h k m.
 assert (E:avl_ptr_of (avl_right g p)=q) by (rewrite L;reflexivity).
 unfold m,crtos_rl_middle_model. rewrite E.
 unfold crtos_rotate_right. rewrite R.
 unfold crtos_reroot_rotation,crtos_set_root,crtos_set_right,crtos_set_left,crtos_update_height,crtos_height_value,crtos_fields.
 cbv beta iota zeta delta [avl_right avl_left avl_root avl_nodes avl_vvalid avl_key_of avl_ptr_of avl_child_height avl_height_of avl_bst avl_with_root_cache avl_height_update GraphLib.examples.bst.bst_tree GraphLib.examples.bst.right_child GraphLib.examples.bst.left_child GraphLib.examples.bst.bst_key GraphLib.examples.bst.theroot GraphLib.examples.bst.listV].
 repeat match goal with |- context[Z.eq_dec ?a ?b] => destruct (Z.eq_dec a b); try congruence end.

 repeat split; try reflexivity.
 intro x.
 change ((if Z.eq_dec x r then Z.max
 (match avl_left g r with Some c => if Z.eq_dec c q then h else avl_height_of g c | None => 0 end) h+1
 else if Z.eq_dec x q then h else avl_height_of g x)=
 (if Z.eq_dec x r then k else if Z.eq_dec x q then h else avl_height_of g x)).
 destruct (avl_left g r) as [c|] eqn:Rc; [|reflexivity].
 destruct (Z.eq_dec c q); [subst;contradiction|]. reflexivity.
Qed.
Lemma crtos_lr_fields__balance_returns : forall g p l r,
 avl_left g p=Some l ->avl_right g l=Some r ->
 p<>l ->p<>r ->l<>r ->
 (forall c, c=avl_right g p \/c=avl_right g r ->
 c<>Some p /\c<>Some l /\c<>Some r) ->
 let h:=Z.max (avl_child_height g (avl_left g l)) (avl_child_height g (avl_left g r))+1 in let d:=Z.max (avl_child_height g (avl_right g r)) (avl_child_height g (avl_right g p))+1 in let e:=Z.max h d+1 in
 (forall x,avl_left (crtos_rotate_lr g p) x=(if Z.eq_dec x p then avl_right g r else if Z.eq_dec x r then Some l else avl_left g x)) /\
 (forall x,avl_right (crtos_rotate_lr g p) x=(if Z.eq_dec x r then Some p else if Z.eq_dec x l then avl_left g r else avl_right g x)) /\
 (forall x,avl_height_of (crtos_rotate_lr g p) x=
 if Z.eq_dec x r then e else if Z.eq_dec x p then d else if Z.eq_dec x l then h else avl_height_of g x).
Proof.
 intros g p l r E F Pl Pr Lr C h d e.
 set (m:=crtos_lr_middle_model g p).
 assert (Crl:avl_right g r<>Some l) by (apply (proj1 (proj2 (C _ (or_intror eq_refl))))).
 destruct (crtos_lr_shape__balance_returns g p l r E F Pl Pr Lr Crl) as [Mp [Mopp [Mr [Mro Hm]]]].
 fold m in Mp,Mopp,Mr,Mro,Hm.
 assert (A:crtos_rotate_lr g p=crtos_rotate_right m p).
 { unfold crtos_rotate_lr,m,crtos_lr_middle_model. rewrite E. simpl avl_ptr_of. rewrite F. reflexivity. }
 assert (ML:forall x,avl_left m x=if Z.eq_dec x p then avl_right g l else avl_left (crtos_rotate_left g l) x).
 { intro x. unfold m,crtos_lr_middle_model. rewrite E. reflexivity. }
 assert (MR:forall x,avl_right m x=avl_right (crtos_rotate_left g l) x).
 { intro x. unfold m,crtos_lr_middle_model. rewrite E. reflexivity. }
 assert (Transfer:forall c,c=avl_right g p \/c=avl_right g r ->
 avl_child_height m c=avl_child_height g c).
 { intros [c|] Ec;[|reflexivity]. change (avl_height_of m c=avl_height_of g c). rewrite Hm.
 destruct (C (Some c) Ec) as [Cp [Cl Cr]].
 destruct (Z.eq_dec c r),(Z.eq_dec c l);congruence. }
 assert (Cp:avl_left m r<>Some p) by (rewrite Mr;congruence).
 destruct (crtos_right_fields__balance_returns m p r Mp Pr Cp) as [L [R H]].
 split.
 - intro x. rewrite A,L,Mro,ML,F.
   destruct (crtos_left_fields__balance_returns g l r F Lr Crl) as [Li [Ri Hi]].
   rewrite Li. destruct (Z.eq_dec x p),(Z.eq_dec x r),(Z.eq_dec x l);subst;try congruence;reflexivity.
 - split.
   + intro x. rewrite A,R,MR.
     destruct (crtos_left_fields__balance_returns g l r F Lr Crl) as [Li [Ri Hi]].
     rewrite Ri. destruct (Z.eq_dec x p),(Z.eq_dec x r),(Z.eq_dec x l);subst;try congruence;reflexivity.
   + intro x. rewrite A,H,?Mro,?Mopp,?Mr.
     rewrite (Transfer (avl_right g p) (or_introl eq_refl)),(Transfer (avl_right g r) (or_intror eq_refl)).
     change ((if Z.eq_dec x r then Z.max (avl_height_of m l) d+1
     else if Z.eq_dec x p then d else avl_height_of m x)=
     if Z.eq_dec x r then e else if Z.eq_dec x p then d else if Z.eq_dec x l then h else avl_height_of g x).
     rewrite (Hm l),(Hm x).
     destruct (Z.eq_dec l r);[congruence|].
     destruct (Z.eq_dec l l);[|contradiction]. fold h d e.
     destruct (Z.eq_dec x r),(Z.eq_dec x p),(Z.eq_dec x l);subst;try congruence;reflexivity.
Qed.
Lemma crtos_rl_fields__balance_returns : forall g p l r,
 avl_right g p=Some l ->avl_left g l=Some r ->
 p<>l ->p<>r ->l<>r ->
 (forall c, c=avl_left g p \/c=avl_left g r ->
 c<>Some p /\c<>Some l /\c<>Some r) ->
 let h:=Z.max (avl_child_height g (avl_right g r)) (avl_child_height g (avl_right g l))+1 in let d:=Z.max (avl_child_height g (avl_left g p)) (avl_child_height g (avl_left g r))+1 in let e:=Z.max d h+1 in
 (forall x,avl_left (crtos_rotate_rl g p) x=(if Z.eq_dec x r then Some p else if Z.eq_dec x l then avl_right g r else avl_left g x)) /\
 (forall x,avl_right (crtos_rotate_rl g p) x=(if Z.eq_dec x p then avl_left g r else if Z.eq_dec x r then Some l else avl_right g x)) /\
 (forall x,avl_height_of (crtos_rotate_rl g p) x=
 if Z.eq_dec x r then e else if Z.eq_dec x p then d else if Z.eq_dec x l then h else avl_height_of g x).
Proof.
 intros g p l r E F Pl Pr Lr C h d e.
 set (m:=crtos_rl_middle_model g p).
 assert (Crl:avl_left g r<>Some l) by (apply (proj1 (proj2 (C _ (or_intror eq_refl))))).
 destruct (crtos_rl_shape__balance_returns g p l r E F Pl Pr Lr Crl) as [Mp [Mopp [Mr [Mro Hm]]]].
 fold m in Mp,Mopp,Mr,Mro,Hm.
 assert (A:crtos_rotate_rl g p=crtos_rotate_left m p).
 { unfold crtos_rotate_rl,m,crtos_rl_middle_model. rewrite E. simpl avl_ptr_of. rewrite F. reflexivity. }
 assert (ML:forall x,avl_left m x=avl_left (crtos_rotate_right g l) x).
 { intro x. unfold m,crtos_rl_middle_model. rewrite E. reflexivity. }
 assert (MR:forall x,avl_right m x=if Z.eq_dec x p then avl_left g l else avl_right (crtos_rotate_right g l) x).
 { intro x. unfold m,crtos_rl_middle_model. rewrite E. reflexivity. }
 assert (Transfer:forall c,c=avl_left g p \/c=avl_left g r ->
 avl_child_height m c=avl_child_height g c).
 { intros [c|] Ec;[|reflexivity]. change (avl_height_of m c=avl_height_of g c). rewrite Hm.
 destruct (C (Some c) Ec) as [Cp [Cl Cr]].
 destruct (Z.eq_dec c r),(Z.eq_dec c l);congruence. }
 assert (Cp:avl_right m r<>Some p) by (rewrite Mr;congruence).
 destruct (crtos_left_fields__balance_returns m p r Mp Pr Cp) as [L [R H]].
 split.
 - intro x. rewrite A,L,ML.
   destruct (crtos_right_fields__balance_returns g l r F Lr Crl) as [Li [Ri Hi]].
   rewrite Li. destruct (Z.eq_dec x p),(Z.eq_dec x r),(Z.eq_dec x l);subst;try congruence;reflexivity.
 - split.
   + intro x. rewrite A,R,Mro,MR,F.
     destruct (crtos_right_fields__balance_returns g l r F Lr Crl) as [Li [Ri Hi]].
     rewrite Ri. destruct (Z.eq_dec x p),(Z.eq_dec x r),(Z.eq_dec x l);subst;try congruence;reflexivity.
   + intro x. rewrite A,H,?Mro,?Mopp,?Mr.
     rewrite (Transfer (avl_left g p) (or_introl eq_refl)),(Transfer (avl_left g r) (or_intror eq_refl)).
     change ((if Z.eq_dec x r then Z.max d (avl_height_of m l)+1
     else if Z.eq_dec x p then d else avl_height_of m x)=
     if Z.eq_dec x r then e else if Z.eq_dec x p then d else if Z.eq_dec x l then h else avl_height_of g x).
     rewrite (Hm l),(Hm x).
     destruct (Z.eq_dec l r);[congruence|].
     destruct (Z.eq_dec l l);[|contradiction]. fold h d e.
     destruct (Z.eq_dec x r),(Z.eq_dec x p),(Z.eq_dec x l);subst;try congruence;reflexivity.
Qed.
Lemma crtos_lr_leaf_avoid__balance_returns : forall g p l r,
 avl_tree_valid g ->avl_root g=Some p ->
 avl_left g p=Some l ->avl_right g l=Some r ->
 p<>l ->p<>r ->l<>r ->
 forall x c,(x=l /\c=avl_left g l) \/
 (x=r /\(c=avl_left g r \/c=avl_right g r)) \/
 (x=p /\c=avl_right g p) ->
 c<>Some p /\c<>Some l /\c<>Some r.
Proof.
 intros g p l r T Root E F Pl Pr Lr x c Leaf.
 pose proof (GraphLib.examples.bst.bst_binary_tree _ (proj1 T)) as Bt.
 pose proof (GraphLib.examples.bst.root_valid _ Bt p Root) as Vp.
 assert (Vl:avl_vvalid g l) by (eapply avl_graph_child_valid__root_and_factor_setup;[exact (proj1 T)|exact Vp|left;exact E]).
 assert (Vr:avl_vvalid g r) by (eapply avl_graph_child_valid__root_and_factor_setup;[exact (proj1 T)|exact Vl|right;exact F]).
 assert (Choices:x=l \/x=r \/x=p) by (intuition congruence).
 assert (Vx:avl_vvalid g x) by (destruct Choices as [ -> | [ -> | -> ] ];assumption).
 assert (Edge:avl_left g x=c \/avl_right g x=c).
 { destruct Leaf as [ [ -> -> ] | [ [ -> [ -> | -> ] ] | [ -> -> ] ] ];auto. }
 split.
 - intro Eqc. pose proof (GraphLib.examples.bst.root_no_parents _ Bt x p Root) as [L R].
   rewrite Eqc in Edge. tauto.
 - split.
   + intro Eqc. destruct (Z.eq_dec x p) as [Xp|Xp].
     * subst x. assert (Q:c=avl_right g p) by (intuition congruence).
       assert (Eqc':avl_right g p=Some l) by congruence.
       apply (GraphLib.examples.bst.child_distinct _ Bt p l l Vp Vl Vl E Eqc' eq_refl).
     * apply Xp. eapply (GraphLib.examples.bst.father_unique _ Bt l x p Vx Vp).
       -- rewrite Eqc in Edge. exact Edge.
       -- left;exact E.
   + intro Eqc. destruct (Z.eq_dec x l) as [Xl|Xl].
     * subst x. assert (Q:c=avl_left g l) by (intuition congruence).
       assert (Eqc':avl_left g l=Some r) by congruence.
       apply (GraphLib.examples.bst.child_distinct _ Bt l r r Vl Vr Vr Eqc' F eq_refl).
     * apply Xl. eapply (GraphLib.examples.bst.father_unique _ Bt r x l Vx Vl).
       -- rewrite Eqc in Edge. exact Edge.
       -- right;exact F.
Qed.
Lemma crtos_rl_leaf_avoid__balance_returns : forall g p l r,
 avl_tree_valid g ->avl_root g=Some p ->
 avl_right g p=Some l ->avl_left g l=Some r ->
 p<>l ->p<>r ->l<>r ->
 forall x c,(x=l /\c=avl_right g l) \/
 (x=r /\(c=avl_right g r \/c=avl_left g r)) \/
 (x=p /\c=avl_left g p) ->
 c<>Some p /\c<>Some l /\c<>Some r.
Proof.
 intros g p l r T Root E F Pl Pr Lr x c Leaf.
 pose proof (GraphLib.examples.bst.bst_binary_tree _ (proj1 T)) as Bt.
 pose proof (GraphLib.examples.bst.root_valid _ Bt p Root) as Vp.
 assert (Vl:avl_vvalid g l) by (eapply avl_graph_child_valid__root_and_factor_setup;[exact (proj1 T)|exact Vp|right;exact E]).
 assert (Vr:avl_vvalid g r) by (eapply avl_graph_child_valid__root_and_factor_setup;[exact (proj1 T)|exact Vl|left;exact F]).
 assert (Choices:x=l \/x=r \/x=p) by (intuition congruence).
 assert (Vx:avl_vvalid g x) by (destruct Choices as [ -> | [ -> | -> ] ];assumption).
 assert (Edge:avl_left g x=c \/avl_right g x=c).
 { destruct Leaf as [ [ -> -> ] | [ [ -> [ -> | -> ] ] | [ -> -> ] ] ];auto. }
 split.
 - intro Eqc. pose proof (GraphLib.examples.bst.root_no_parents _ Bt x p Root) as [L R].
   rewrite Eqc in Edge. tauto.
 - split.
   + intro Eqc. destruct (Z.eq_dec x p) as [Xp|Xp].
     * subst x. assert (Q:c=avl_left g p) by (intuition congruence).
       assert (Eqc':avl_left g p=Some l) by congruence.
       apply (GraphLib.examples.bst.child_distinct _ Bt p l l Vp Vl Vl Eqc' E eq_refl).
     * apply Xp. eapply (GraphLib.examples.bst.father_unique _ Bt l x p Vx Vp).
       -- rewrite Eqc in Edge. exact Edge.
       -- right;exact E.
   + intro Eqc. destruct (Z.eq_dec x l) as [Xl|Xl].
     * subst x. assert (Q:c=avl_right g l) by (intuition congruence).
       assert (Eqc':avl_right g l=Some r) by congruence.
       apply (GraphLib.examples.bst.child_distinct _ Bt l r r Vl Vr Vr F Eqc' eq_refl).
     * apply Xl. eapply (GraphLib.examples.bst.father_unique _ Bt r x l Vx Vl).
       -- rewrite Eqc in Edge. exact Edge.
       -- left;exact F.
Qed.
Lemma crtos_lr_canonical_equiv__balance_returns : forall g a p l r,
 avl_tree_valid g ->avl_root g=Some p ->
 avl_left g p=Some l ->avl_right g l=Some r ->
 avl_lr_rotation_result g a p r ->
 crtos_graph_equiv (crtos_rotate_lr g p) a.
Proof.
 intros g a p l r T Root E F Res.
 destruct Res as [Ret [Nr [Ar [Model [Ta [Nodes Keys]]]]]].
 rewrite E in Model. simpl avl_ptr_of in Model.
 pose proof (GraphLib.examples.bst.bst_binary_tree _ (proj1 T)) as Bt.
 pose proof (GraphLib.examples.bst.root_valid _ Bt p Root) as Vp.
 assert (Vl:avl_vvalid g l) by (eapply avl_graph_child_valid__root_and_factor_setup;[exact (proj1 T)|exact Vp|left;exact E]).
 assert (Vr:avl_vvalid g r) by (eapply avl_graph_child_valid__root_and_factor_setup;[exact (proj1 T)|exact Vl|right;exact F]).
 assert (Pl:p<>l).
 { intro Q. apply (GraphLib.examples.bst.bt_child_no_self _ p Bt Vp ). left;change (avl_left g p=Some p);congruence. }
 assert (Pr:p<>r).
 { intro Q. pose proof (GraphLib.examples.bst.root_no_parents _ Bt l p Root) as [A B]. apply B. change (avl_right g l=Some p);congruence. }
 assert (Lr:l<>r).
 { intro Q. apply (GraphLib.examples.bst.bt_child_no_self _ l Bt Vl ). right;change (avl_right g l=Some l);congruence. }
 pose proof (crtos_lr_leaf_avoid__balance_returns g p l r T Root E F Pl Pr Lr) as Avoid.
 destruct (avl_lr_topology__double_rotation_restoration g a p l r T Root Vp E F Model)
 as [Dom [Ll [Lr' [Pl' [Pr' [Rl [Rr [Outside Non]]]]]]]].
 assert (Transfer:forall c,
 c=avl_left g l \/c=avl_left g r \/c=avl_right g r \/c=avl_right g p ->
 avl_child_height a c=avl_child_height g c).
 { intros [c|] Choice;[|reflexivity]. simpl avl_child_height.
   destruct Choice as [C|[C|[C|C]]].
   - destruct (Avoid l (Some c) (or_introl (conj eq_refl C))) as [Cp [Cl Cr]]. apply Non;congruence.
   - destruct (Avoid r (Some c) (or_intror (or_introl (conj eq_refl (or_introl C))))) as [Cp [Cl Cr]]. apply Non;congruence.
   - destruct (Avoid r (Some c) (or_intror (or_introl (conj eq_refl (or_intror C))))) as [Cp [Cl Cr]]. apply Non;congruence.
   - destruct (Avoid p (Some c) (or_intror (or_intror (conj eq_refl C)))) as [Cp [Cl Cr]]. apply Non;congruence. }
 assert (Va:forall x,avl_vvalid g x ->avl_vvalid a x) by (intros x X;apply Dom;exact X).
 pose proof (proj2 (proj1 (proj2 Ta) l (Va l Vl))) as Hla.
 pose proof (proj2 (proj1 (proj2 Ta) p (Va p Vp))) as Hpa.
 pose proof (proj2 (proj1 (proj2 Ta) r (Va r Vr))) as Hra.
 rewrite Ll,Lr',!Transfer in Hla by auto.
 rewrite Pl',Pr',!Transfer in Hpa by auto.
 rewrite Rl,Rr in Hra. simpl avl_child_height in Hra.
 assert (C:forall c,c=avl_right g p \/c=avl_right g r ->c<>Some p /\c<>Some l /\c<>Some r).
 { intros c [C|C].
   - apply (Avoid p c). right;right;auto.
   - apply (Avoid r c ). right;left;split;auto. }
 destruct (crtos_lr_fields__balance_returns g p l r E F Pl Pr Lr C) as [L [R H]].
 unfold crtos_graph_equiv. split.
 - rewrite Ar. unfold crtos_rotate_lr. rewrite E. simpl avl_ptr_of. rewrite F.
   rewrite crtos_rotate_right_root__crtos_insert_composition.
   change ((if excluded_middle_informative (avl_root (crtos_rotate_left g l)=Some p)
   then Some (avl_ptr_of (if Z.eq_dec p p then Some r else avl_left (crtos_rotate_left g l) p))
   else avl_root (crtos_rotate_left g l))=Some r).
   rewrite crtos_rotate_left_root__crtos_insert_composition,Root.
   destruct (excluded_middle_informative (Some p=Some l));[congruence|].
   destruct (excluded_middle_informative (Some p=Some p));[|contradiction].
   change (Some (avl_ptr_of (if Z.eq_dec p p then Some r else avl_left (crtos_rotate_left g l) p))=Some r).
   destruct (Z.eq_dec p p);[reflexivity|contradiction].
 - split;[change (Permutation (avl_nodes g) (avl_nodes a));rewrite Nodes;reflexivity|].
   split;[intro x;change (avl_vvalid g x <->avl_vvalid a x);symmetry;apply Dom|].
   split.
   + intro x. rewrite L,R.
     destruct (Z.eq_dec x p) as [Xp|Xp],(Z.eq_dec x l) as [Xl|Xl],(Z.eq_dec x r) as [Xr|Xr];try subst x;try congruence.
     all: try (rewrite ?Ll,?Lr',?Pl',?Pr',?Rl,?Rr;split;congruence).
     destruct (excluded_middle_informative (avl_vvalid g x)) as [Vx|Nx].
     * destruct (Outside x Vx Xp Xl Xr) as [A B]. rewrite A,B;auto.
     * pose proof (GraphLib.examples.bst.invalid_child_is_none _ Bt x Nx) as [A B].
       assert (Na:~avl_vvalid a x) by (intro X;apply Nx;apply Dom;exact X).
       pose proof (GraphLib.examples.bst.invalid_child_is_none _
       (GraphLib.examples.bst.bst_binary_tree _ (proj1 Ta)) x Na) as [Aa Ba].
       change (avl_left g x=None) in A. change (avl_right g x=None) in B.
       change (avl_left a x=None) in Aa. change (avl_right a x=None) in Ba.
       rewrite A,B,Aa,Ba;auto.
   + intros x Vx. split.
     * change (avl_key_of g x=avl_key_of a x). symmetry;apply Keys.
     * rewrite H. destruct (Z.eq_dec x r) as [Xr|Xr].
       -- subst x. rewrite Hra,Hla,Hpa. reflexivity.
       -- destruct (Z.eq_dec x p) as [Xp|Xp].
          ++ subst x. rewrite Hpa;reflexivity.
          ++ destruct (Z.eq_dec x l) as [Xl|Xl].
             ** subst x. rewrite Hla;reflexivity.
             ** symmetry;apply Non;assumption.
Qed.
Lemma crtos_rl_canonical_equiv__balance_returns : forall g a p l r,
 avl_tree_valid g ->avl_root g=Some p ->
 avl_right g p=Some l ->avl_left g l=Some r ->
 avl_rl_rotation_result g a p r ->
 crtos_graph_equiv (crtos_rotate_rl g p) a.
Proof.
 intros g a p l r T Root E F Res.
 destruct Res as [Ret [Nr [Ar [Model [Ta [Nodes Keys]]]]]].
 rewrite E in Model. simpl avl_ptr_of in Model.
 pose proof (GraphLib.examples.bst.bst_binary_tree _ (proj1 T)) as Bt.
 pose proof (GraphLib.examples.bst.root_valid _ Bt p Root) as Vp.
 assert (Vl:avl_vvalid g l) by (eapply avl_graph_child_valid__root_and_factor_setup;[exact (proj1 T)|exact Vp|right;exact E]).
 assert (Vr:avl_vvalid g r) by (eapply avl_graph_child_valid__root_and_factor_setup;[exact (proj1 T)|exact Vl|left;exact F]).
 assert (Pl:p<>l).
 { intro Q. apply (GraphLib.examples.bst.bt_child_no_self _ p Bt Vp ). right;change (avl_right g p=Some p);congruence. }
 assert (Pr:p<>r).
 { intro Q. pose proof (GraphLib.examples.bst.root_no_parents _ Bt l p Root) as [A B]. apply A. change (avl_left g l=Some p);congruence. }
 assert (Lr:l<>r).
 { intro Q. apply (GraphLib.examples.bst.bt_child_no_self _ l Bt Vl ). left;change (avl_left g l=Some l);congruence. }
 pose proof (crtos_rl_leaf_avoid__balance_returns g p l r T Root E F Pl Pr Lr) as Avoid.
 destruct (avl_rl_topology__double_rotation_restoration g a p l r T Root Vp E F Model)
 as [Dom [Ll [Lr' [Pl' [Pr' [Rl [Rr [Outside Non]]]]]]]].
 assert (Transfer:forall c,
 c=avl_right g l \/c=avl_right g r \/c=avl_left g r \/c=avl_left g p ->
 avl_child_height a c=avl_child_height g c).
 { intros [c|] Choice;[|reflexivity]. simpl avl_child_height.
   destruct Choice as [C|[C|[C|C]]].
   - destruct (Avoid l (Some c) (or_introl (conj eq_refl C))) as [Cp [Cl Cr]]. apply Non;congruence.
   - destruct (Avoid r (Some c) (or_intror (or_introl (conj eq_refl (or_introl C))))) as [Cp [Cl Cr]]. apply Non;congruence.
   - destruct (Avoid r (Some c) (or_intror (or_introl (conj eq_refl (or_intror C))))) as [Cp [Cl Cr]]. apply Non;congruence.
   - destruct (Avoid p (Some c) (or_intror (or_intror (conj eq_refl C)))) as [Cp [Cl Cr]]. apply Non;congruence. }
 assert (Va:forall x,avl_vvalid g x ->avl_vvalid a x) by (intros x X;apply Dom;exact X).
 pose proof (proj2 (proj1 (proj2 Ta) l (Va l Vl))) as Hla.
 pose proof (proj2 (proj1 (proj2 Ta) p (Va p Vp))) as Hpa.
 pose proof (proj2 (proj1 (proj2 Ta) r (Va r Vr))) as Hra.
 rewrite Ll,Lr',!Transfer in Hla by auto.
 rewrite Pl',Pr',!Transfer in Hpa by auto.
 rewrite Rl,Rr in Hra. simpl avl_child_height in Hra.
 assert (C:forall c,c=avl_left g p \/c=avl_left g r ->c<>Some p /\c<>Some l /\c<>Some r).
 { intros c [C|C].
   - apply (Avoid p c). right;right;auto.
   - apply (Avoid r c ). right;left;split;auto. }
 destruct (crtos_rl_fields__balance_returns g p l r E F Pl Pr Lr C) as [L [R H]].
 unfold crtos_graph_equiv. split.
 - rewrite Ar. unfold crtos_rotate_rl. rewrite E. simpl avl_ptr_of. rewrite F.
   rewrite crtos_rotate_left_root__crtos_insert_composition.
   change ((if excluded_middle_informative (avl_root (crtos_rotate_right g l)=Some p)
   then Some (avl_ptr_of (if Z.eq_dec p p then Some r else avl_right (crtos_rotate_right g l) p))
   else avl_root (crtos_rotate_right g l))=Some r).
   rewrite crtos_rotate_right_root__crtos_insert_composition,Root.
   destruct (excluded_middle_informative (Some p=Some l));[congruence|].
   destruct (excluded_middle_informative (Some p=Some p));[|contradiction].
   change (Some (avl_ptr_of (if Z.eq_dec p p then Some r else avl_right (crtos_rotate_right g l) p))=Some r).
   destruct (Z.eq_dec p p);[reflexivity|contradiction].
 - split;[change (Permutation (avl_nodes g) (avl_nodes a));rewrite Nodes;reflexivity|].
   split;[intro x;change (avl_vvalid g x <->avl_vvalid a x);symmetry;apply Dom|].
   split.
   + intro x. rewrite L,R.
     destruct (Z.eq_dec x p) as [Xp|Xp],(Z.eq_dec x l) as [Xl|Xl],(Z.eq_dec x r) as [Xr|Xr];try subst x;try congruence.
     all: try (rewrite ?Ll,?Lr',?Pl',?Pr',?Rl,?Rr;split;congruence).
     destruct (excluded_middle_informative (avl_vvalid g x)) as [Vx|Nx].
     * destruct (Outside x Vx Xp Xl Xr) as [A B]. rewrite A,B;auto.
     * pose proof (GraphLib.examples.bst.invalid_child_is_none _ Bt x Nx) as [A B].
       assert (Na:~avl_vvalid a x) by (intro X;apply Nx;apply Dom;exact X).
       pose proof (GraphLib.examples.bst.invalid_child_is_none _
       (GraphLib.examples.bst.bst_binary_tree _ (proj1 Ta)) x Na) as [Aa Ba].
       change (avl_left g x=None) in A. change (avl_right g x=None) in B.
       change (avl_left a x=None) in Aa. change (avl_right a x=None) in Ba.
       rewrite A,B,Aa,Ba;auto.
   + intros x Vx. split.
     * change (avl_key_of g x=avl_key_of a x). symmetry;apply Keys.
     * rewrite H. destruct (Z.eq_dec x r) as [Xr|Xr].
       -- subst x. rewrite Hra,Hla,Hpa. reflexivity.
       -- destruct (Z.eq_dec x p) as [Xp|Xp].
          ++ subst x. rewrite Hpa;reflexivity.
          ++ destruct (Z.eq_dec x l) as [Xl|Xl].
             ** subst x. rewrite Hla;reflexivity.
             ** symmetry;apply Non;assumption.
Qed.
Lemma crtos_lr_projection_fields__balance_returns : forall g p l r,
 crtos_balance_ready g p ->avl_left g p=Some l ->avl_right g l=Some r ->
 (forall x,avl_reachable g p x ->
 avl_left (crtos_rotate_lr (avl_subtree_model g p) p) x=avl_left (crtos_rotate_lr g p) x /\
 avl_right (crtos_rotate_lr (avl_subtree_model g p) p) x=avl_right (crtos_rotate_lr g p) x) /\
 (forall x,avl_height_of (crtos_rotate_lr (avl_subtree_model g p) p) x=avl_height_of (crtos_rotate_lr g p) x) /\
 p<>l /\p<>r /\l<>r /\avl_reachable g p l /\avl_reachable g p r /\
 (forall c,c=avl_right g p \/c=avl_right g r ->c<>Some p /\c<>Some l /\c<>Some r).
Proof.
 intros g p l r B E F.
 destruct (crtos_balance_subroot__balance_returns g p B) as [T [N [Vp Nd]]].
 destruct (avl_projection_children__lr_graph_composition g p p (proj2 Vp)) as [Lp Rp].
 assert (Es:avl_left (avl_subtree_model g p) p=Some l) by (rewrite Lp;exact E).
 assert (Vl:avl_vvalid (avl_subtree_model g p) l)
 by (eapply avl_graph_child_valid__root_and_factor_setup;[exact (proj1 T)|exact Vp|left;exact Es]).
 destruct (avl_projection_children__lr_graph_composition g p l (proj2 Vl)) as [Ll Rl].
 assert (Fs:avl_right (avl_subtree_model g p) l=Some r) by (rewrite Rl;exact F).
 assert (Vr:avl_vvalid (avl_subtree_model g p) r)
 by (eapply avl_graph_child_valid__root_and_factor_setup;[exact (proj1 T)|exact Vl|right;exact Fs]).
 destruct (avl_projection_children__lr_graph_composition g p r (proj2 Vr)) as [Lr Rr].
 pose proof (GraphLib.examples.bst.bst_binary_tree _ (proj1 T)) as Bt.
 assert (Pl:p<>l).
 { intro Q. apply (GraphLib.examples.bst.bt_child_no_self _ p Bt Vp ). left;change (avl_left (avl_subtree_model g p) p=Some p);congruence. }
 assert (Pr:p<>r).
 { intro Q. pose proof (GraphLib.examples.bst.root_no_parents _ Bt l p eq_refl) as [ParL ParR]. first [apply ParL;change (avl_left (avl_subtree_model g p) l=Some p);congruence|apply ParR;change (avl_right (avl_subtree_model g p) l=Some p);congruence]. }
 assert (Lr':l<>r).
 { intro Q. apply (GraphLib.examples.bst.bt_child_no_self _ l Bt Vl ). right;change (avl_right (avl_subtree_model g p) l=Some l);congruence. }
 pose proof (crtos_lr_leaf_avoid__balance_returns (avl_subtree_model g p) p l r T eq_refl Es Fs Pl Pr Lr') as Avoid.
 assert (Cs:forall c,c=avl_right (avl_subtree_model g p) p \/c=avl_right (avl_subtree_model g p) r ->c<>Some p /\c<>Some l /\c<>Some r).
 { intros c [C|C].
    - apply (Avoid p c ). right;right;auto.
    - apply (Avoid r c ). right;left;split;auto. }
 assert (C:forall c,c=avl_right g p \/c=avl_right g r ->c<>Some p /\c<>Some l /\c<>Some r).
 { intros c Choice. apply Cs. rewrite Rp,Rr;exact Choice. }
 destruct (crtos_lr_fields__balance_returns g p l r E F Pl Pr Lr' C) as [L [R H]].
 destruct (crtos_lr_fields__balance_returns (avl_subtree_model g p) p l r Es Fs Pl Pr Lr' Cs) as [Ls [Rs Hs]].
 split.
 - intros x X. destruct (avl_projection_children__lr_graph_composition g p x X) as [Lx Rx].
   rewrite Ls,Rs,L,R,?Lx,?Rx,?Lp,?Rp,?Ll,?Rl,?Lr,?Rr. auto.
 - split.
   + intro x. rewrite Hs,H,?Lp,?Rp,?Ll,?Rl,?Lr,?Rr. reflexivity.
   + split;[exact Pl|]. split;[exact Pr|]. split;[exact Lr'|].
     split;[exact (proj2 Vl)|]. split;[exact (proj2 Vr)|exact C].
Qed.
Lemma crtos_rl_projection_fields__balance_returns : forall g p l r,
 crtos_balance_ready g p ->avl_right g p=Some l ->avl_left g l=Some r ->
 (forall x,avl_reachable g p x ->
 avl_left (crtos_rotate_rl (avl_subtree_model g p) p) x=avl_left (crtos_rotate_rl g p) x /\
 avl_right (crtos_rotate_rl (avl_subtree_model g p) p) x=avl_right (crtos_rotate_rl g p) x) /\
 (forall x,avl_height_of (crtos_rotate_rl (avl_subtree_model g p) p) x=avl_height_of (crtos_rotate_rl g p) x) /\
 p<>l /\p<>r /\l<>r /\avl_reachable g p l /\avl_reachable g p r /\
 (forall c,c=avl_left g p \/c=avl_left g r ->c<>Some p /\c<>Some l /\c<>Some r).
Proof.
 intros g p l r B E F.
 destruct (crtos_balance_subroot__balance_returns g p B) as [T [N [Vp Nd]]].
 destruct (avl_projection_children__lr_graph_composition g p p (proj2 Vp)) as [Lp Rp].
 assert (Es:avl_right (avl_subtree_model g p) p=Some l) by (rewrite Rp;exact E).
 assert (Vl:avl_vvalid (avl_subtree_model g p) l)
 by (eapply avl_graph_child_valid__root_and_factor_setup;[exact (proj1 T)|exact Vp|right;exact Es]).
 destruct (avl_projection_children__lr_graph_composition g p l (proj2 Vl)) as [Ll Rl].
 assert (Fs:avl_left (avl_subtree_model g p) l=Some r) by (rewrite Ll;exact F).
 assert (Vr:avl_vvalid (avl_subtree_model g p) r)
 by (eapply avl_graph_child_valid__root_and_factor_setup;[exact (proj1 T)|exact Vl|left;exact Fs]).
 destruct (avl_projection_children__lr_graph_composition g p r (proj2 Vr)) as [Lr Rr].
 pose proof (GraphLib.examples.bst.bst_binary_tree _ (proj1 T)) as Bt.
 assert (Pl:p<>l).
 { intro Q. apply (GraphLib.examples.bst.bt_child_no_self _ p Bt Vp ). right;change (avl_right (avl_subtree_model g p) p=Some p);congruence. }
 assert (Pr:p<>r).
 { intro Q. pose proof (GraphLib.examples.bst.root_no_parents _ Bt l p eq_refl) as [ParL ParR]. first [apply ParL;change (avl_left (avl_subtree_model g p) l=Some p);congruence|apply ParR;change (avl_right (avl_subtree_model g p) l=Some p);congruence]. }
 assert (Lr':l<>r).
 { intro Q. apply (GraphLib.examples.bst.bt_child_no_self _ l Bt Vl ). left;change (avl_left (avl_subtree_model g p) l=Some l);congruence. }
 pose proof (crtos_rl_leaf_avoid__balance_returns (avl_subtree_model g p) p l r T eq_refl Es Fs Pl Pr Lr') as Avoid.
 assert (Cs:forall c,c=avl_left (avl_subtree_model g p) p \/c=avl_left (avl_subtree_model g p) r ->c<>Some p /\c<>Some l /\c<>Some r).
 { intros c [C|C].
    - apply (Avoid p c ). right;right;auto.
    - apply (Avoid r c ). right;left;split;auto. }
 assert (C:forall c,c=avl_left g p \/c=avl_left g r ->c<>Some p /\c<>Some l /\c<>Some r).
 { intros c Choice. apply Cs. rewrite Lp,Lr;exact Choice. }
 destruct (crtos_rl_fields__balance_returns g p l r E F Pl Pr Lr' C) as [L [R H]].
 destruct (crtos_rl_fields__balance_returns (avl_subtree_model g p) p l r Es Fs Pl Pr Lr' Cs) as [Ls [Rs Hs]].
 split.
 - intros x X. destruct (avl_projection_children__lr_graph_composition g p x X) as [Lx Rx].
   rewrite Ls,Rs,L,R,?Lx,?Rx,?Lp,?Rp,?Ll,?Rl,?Lr,?Rr. auto.
 - split.
   + intro x. rewrite Hs,H,?Lp,?Rp,?Ll,?Rl,?Lr,?Rr. reflexivity.
   + split;[exact Pl|]. split;[exact Pr|]. split;[exact Lr'|].
     split;[exact (proj2 Vl)|]. split;[exact (proj2 Vr)|exact C].
Qed.
Lemma crtos_lr_owner_lift__balance_returns : forall g p l r,
 crtos_balance_ready g p ->NoDup (avl_nodes g) ->
 avl_left g p=Some l ->avl_right g l=Some r ->
 avl_tree_store (crtos_rotate_lr (avl_subtree_model g p) p) **
 crtos_balance_external_store g p |--avl_tree_store (crtos_rotate_lr g p).
Proof.
 intros g p l r B Nd E F.
 destruct (crtos_lr_projection_fields__balance_returns g p l r B E F)
 as [Fields [Hh [Pl [Pr [Lr [Rl [Rr C]]]]]]].
 destruct (crtos_balance_subroot__balance_returns g p B) as [T [Np [Vp Ns]]].
 apply crtos_owner_lift__balance_returns;[exact Nd|reflexivity|reflexivity| |].
 - intros x X. unfold avl_graph_node_store. Intros_p V. Intros_p N. Intros_p K. Intros_p Hb.
   change (avl_vvalid g x /\avl_reachable g p x) in V.
   destruct (Fields x (proj2 V)) as [L R]. rewrite Hh in Hb. rewrite L,R,Hh.
   entailer!;lia.
 - intros x X. apply filter_In in X. destruct X as [X Filter].
   destruct (excluded_middle_informative (avl_reachable g p x));[discriminate|].
   assert (Dx:x<>p) by (intro Q;subst x;apply n;exact (proj2 Vp)).
   assert (Dl:x<>l) by (intro Q;subst x;contradiction).
   assert (Dr:x<>r) by (intro Q;subst x;contradiction).
   destruct (crtos_lr_fields__balance_returns g p l r E F Pl Pr Lr C) as [L [R H]].
   assert (Lx:avl_left (crtos_rotate_lr g p) x=avl_left g x)
   by (rewrite L;destruct (Z.eq_dec x p),(Z.eq_dec x l),(Z.eq_dec x r);congruence).
   assert (Rx:avl_right (crtos_rotate_lr g p) x=avl_right g x)
   by (rewrite R;destruct (Z.eq_dec x p),(Z.eq_dec x l),(Z.eq_dec x r);congruence).
   assert (Hx:avl_height_of (crtos_rotate_lr g p) x=avl_height_of g x)
   by (rewrite H;destruct (Z.eq_dec x p),(Z.eq_dec x l),(Z.eq_dec x r);congruence).
   unfold avl_graph_node_store. rewrite Lx,Rx,Hx. entailer!.
Qed.
Lemma crtos_rl_owner_lift__balance_returns : forall g p l r,
 crtos_balance_ready g p ->NoDup (avl_nodes g) ->
 avl_right g p=Some l ->avl_left g l=Some r ->
 avl_tree_store (crtos_rotate_rl (avl_subtree_model g p) p) **
 crtos_balance_external_store g p |--avl_tree_store (crtos_rotate_rl g p).
Proof.
 intros g p l r B Nd E F.
 destruct (crtos_rl_projection_fields__balance_returns g p l r B E F)
 as [Fields [Hh [Pl [Pr [Lr [Rl [Rr C]]]]]]].
 destruct (crtos_balance_subroot__balance_returns g p B) as [T [Np [Vp Ns]]].
 apply crtos_owner_lift__balance_returns;[exact Nd|reflexivity|reflexivity| |].
 - intros x X. unfold avl_graph_node_store. Intros_p V. Intros_p N. Intros_p K. Intros_p Hb.
   change (avl_vvalid g x /\avl_reachable g p x) in V.
   destruct (Fields x (proj2 V)) as [L R]. rewrite Hh in Hb. rewrite L,R,Hh.
   entailer!;lia.
 - intros x X. apply filter_In in X. destruct X as [X Filter].
   destruct (excluded_middle_informative (avl_reachable g p x));[discriminate|].
   assert (Dx:x<>p) by (intro Q;subst x;apply n;exact (proj2 Vp)).
   assert (Dl:x<>l) by (intro Q;subst x;contradiction).
   assert (Dr:x<>r) by (intro Q;subst x;contradiction).
   destruct (crtos_rl_fields__balance_returns g p l r E F Pl Pr Lr C) as [L [R H]].
   assert (Lx:avl_left (crtos_rotate_rl g p) x=avl_left g x)
   by (rewrite L;destruct (Z.eq_dec x p),(Z.eq_dec x l),(Z.eq_dec x r);congruence).
   assert (Rx:avl_right (crtos_rotate_rl g p) x=avl_right g x)
   by (rewrite R;destruct (Z.eq_dec x p),(Z.eq_dec x l),(Z.eq_dec x r);congruence).
   assert (Hx:avl_height_of (crtos_rotate_rl g p) x=avl_height_of g x)
   by (rewrite H;destruct (Z.eq_dec x p),(Z.eq_dec x l),(Z.eq_dec x r);congruence).
   unfold avl_graph_node_store. rewrite Lx,Rx,Hx. entailer!.
Qed.
Lemma crtos_fields_fold__balance_returns : forall g p,
 NoDup (avl_nodes g) ->In p (avl_nodes g) ->avl_vvalid g p ->p<>0 ->
 INT_MIN<=avl_key_of g p<=INT_MAX ->0<=avl_height_of g p<=UINT_MAX ->
 (&(p # "AvlNode" ->ₛ "data"))%string # Int |->avl_key_of g p **
 (&(p # "AvlNode" ->ₛ "height"))%string # UInt |->avl_height_of g p **
 (&(p # "AvlNode" ->ₛ "left"))%string # Ptr |->avl_ptr_of (avl_left g p) **
 (&(p # "AvlNode" ->ₛ "right"))%string # Ptr |->avl_ptr_of (avl_right g p) **
 avl_graph_nodes_store g (avl_nodes_without g p) |--avl_tree_store g.
Proof.
 intros g p Nd I V N K H.
 sep_apply_r_atomic (crtos_owner_fold__balance_returns g p Nd I).
 unfold avl_graph_node_store. entailer!;lia.
Qed.
Lemma crtos_lr_local_balance__balance_returns : forall g p l r,
 crtos_balance_ready g p ->
 (forall x,avl_vvalid (avl_subtree_model g p) x ->INT_MIN<=avl_key_of (avl_subtree_model g p) x<=INT_MAX) ->
 avl_left g p=Some l ->avl_right g l=Some r ->
 avl_model_balance_factor g p>1 ->avl_model_balance_factor g l<0 ->
 avl_gvalid (crtos_rotate_lr (avl_subtree_model g p) p) /\
 avl_root (crtos_rotate_lr (avl_subtree_model g p) p)=Some r /\
 avl_height_of g p-1<=avl_height_of (crtos_rotate_lr (avl_subtree_model g p) p) r<=avl_height_of g p.
Proof.
 intros g p l r B Keys E F Pos Neg.
 destruct (crtos_balance_subroot__balance_returns g p B) as [T [N [Vp Nd]]].
 destruct (avl_projection_children__lr_graph_composition g p p (proj2 Vp)) as [Lp Rp].
 assert (Es:avl_left (avl_subtree_model g p) p=Some l) by (rewrite Lp;exact E).
 assert (Vl:avl_vvalid (avl_subtree_model g p) l)
 by (eapply avl_graph_child_valid__root_and_factor_setup;[exact (proj1 T)|exact Vp|left;exact Es]).
 destruct (avl_projection_children__lr_graph_composition g p l (proj2 Vl)) as [Ll Rl].
 assert (Fs:avl_right (avl_subtree_model g p) l=Some r) by (rewrite Rl;exact F).
 assert (Vr:avl_vvalid (avl_subtree_model g p) r)
 by (eapply avl_graph_child_valid__root_and_factor_setup;[exact (proj1 T)|exact Vl|right;exact Fs]).
 pose proof (proj2 (proj2 T) l Vl) as Nl.
 pose proof (proj2 (proj2 T) r Vr) as Nr.
 pose proof (crtos_balance_input_from_keys__balance_returns g p B Keys) as Input.
 pose proof Input as [[_ [_ [_ [_ [Safe _]]]]] _].
 assert (RotIn:avl_lr_rotation_input (avl_subtree_model g p) p).
 { unfold avl_lr_rotation_input.
   split;[exact T|]. split;[reflexivity|]. split;[exact Vp|]. split;[exact N|].
   split;[rewrite Es;exact Nl|]. split;[rewrite Es;simpl avl_ptr_of;rewrite Fs;exact Nr|].
   exact (Safe p Vp). }
 destruct (crtos_lr_canonical_exists__balance_returns (avl_subtree_model g p) p RotIn) as [a [q Res]].
 pose proof (proj1 Res) as Qret. rewrite Es in Qret. simpl avl_ptr_of in Qret.
 rewrite Fs in Qret. simpl avl_ptr_of in Qret. subst q.
 pose proof (proj1 (proj2 (proj2 (proj2 Res)))) as Model.
 rewrite Es in Model. simpl avl_ptr_of in Model.
 assert (Others:forall x,avl_vvalid (avl_subtree_model g p) x ->x<>p ->
 Z.abs (avl_model_balance_factor (avl_subtree_model g p) x)<=1).
 { intros x X D. rewrite crtos_subtree_factor__balance_returns by exact X.
 exact (proj1 (proj2 (proj2 (proj2 B))) x X D). }
 assert (Bound:Z.abs (avl_model_balance_factor (avl_subtree_model g p) p)<=2).
 { rewrite crtos_subtree_factor__balance_returns by exact Vp.
 exact (proj2 (proj2 (proj2 (proj2 B)))). }
 assert (P:avl_model_balance_factor (avl_subtree_model g p) p>1)
 by (rewrite crtos_subtree_factor__balance_returns by exact Vp;exact Pos).
 assert (C:avl_model_balance_factor (avl_subtree_model g p) l<0)
 by (rewrite crtos_subtree_factor__balance_returns by exact Vl;exact Neg).
 pose proof (proj1 (proj2 (proj2 (proj2 (proj2 Res))))) as Ta.
 destruct (crtos_lr_restore__balance_returns (avl_subtree_model g p) a p l r T Others Bound
 Ta eq_refl Vp N Es Fs P C Model) as [Ba Ha].
 assert (Ga:avl_gvalid a) by (apply avl_gvalid_tree_valid_iff;split;assumption).
 pose proof (crtos_lr_canonical_equiv__balance_returns (avl_subtree_model g p) a p l r T eq_refl Es Fs Res) as Eq.
 split.
 - eapply crtos_equiv_gvalid__crtos_insert_composition;
 [apply crtos_equiv_sym__crtos_insert_composition;exact Eq|exact Ga].
 - split.
   + rewrite (proj1 Eq). exact (proj1 (proj2 (proj2 Res))).
   + destruct (proj2 (proj2 (proj2 (proj2 Eq))) r Vr) as [_ H].
     rewrite H. exact Ha.
Qed.
Lemma crtos_lr_effect__balance_returns : forall g p l r,
 crtos_balance_ready g p ->
 (forall x,avl_vvalid (avl_subtree_model g p) x ->INT_MIN<=avl_key_of (avl_subtree_model g p) x<=INT_MAX) ->
 avl_left g p=Some l ->avl_right g l=Some r ->
 avl_model_balance_factor g p>1 ->avl_model_balance_factor g l<0 ->
 crtos_balance_effect g (crtos_rotate_lr g p) p r.
Proof.
 intros g p l r B Keys E F Pos Neg.
 destruct (crtos_lr_local_balance__balance_returns g p l r B Keys E F Pos Neg) as [Ga [Root Height]].
 destruct (crtos_lr_projection_fields__balance_returns g p l r B E F)
 as [Fields [Hh [Pl [Pr [Lr [Rl [Rr C]]]]]]].
 eapply crtos_effect_lift__balance_returns with (a:=crtos_rotate_lr (avl_subtree_model g p) p).
 - exact B.
 - exact Ga.
 - exact Root.
 - reflexivity.
 - reflexivity.
 - intro x;reflexivity.
 - intro x;reflexivity.
 - intro x;reflexivity.
 - intros x X. destruct (Fields x (proj2 X)) as [L R]. split;symmetry;assumption.
 - intros x X. split;[reflexivity|]. symmetry;apply Hh.
 - unfold crtos_balance_model. destruct (Z_lt_dec 1 (avl_model_balance_factor g p));[|lia].
   rewrite E. simpl avl_ptr_of. destruct (Z_le_dec 0 (avl_model_balance_factor g l));[lia|reflexivity].
 - unfold crtos_balance_ptr. destruct (Z_lt_dec 1 (avl_model_balance_factor g p));[|lia].
   rewrite E. simpl avl_ptr_of. destruct (Z_le_dec 0 (avl_model_balance_factor g l));[lia|].
   rewrite F;reflexivity.
 - rewrite <-Hh. exact Height.
 - intro A. apply Z.abs_le in A;lia.
Qed.
Lemma crtos_rl_local_balance__balance_returns : forall g p l r,
 crtos_balance_ready g p ->
 (forall x,avl_vvalid (avl_subtree_model g p) x ->INT_MIN<=avl_key_of (avl_subtree_model g p) x<=INT_MAX) ->
 avl_right g p=Some l ->avl_left g l=Some r ->
 avl_model_balance_factor g p< -1 ->avl_model_balance_factor g l>0 ->
 avl_gvalid (crtos_rotate_rl (avl_subtree_model g p) p) /\
 avl_root (crtos_rotate_rl (avl_subtree_model g p) p)=Some r /\
 avl_height_of g p-1<=avl_height_of (crtos_rotate_rl (avl_subtree_model g p) p) r<=avl_height_of g p.
Proof.
 intros g p l r B Keys E F Pos Neg.
 destruct (crtos_balance_subroot__balance_returns g p B) as [T [N [Vp Nd]]].
 destruct (avl_projection_children__lr_graph_composition g p p (proj2 Vp)) as [Lp Rp].
 assert (Es:avl_right (avl_subtree_model g p) p=Some l) by (rewrite Rp;exact E).
 assert (Vl:avl_vvalid (avl_subtree_model g p) l)
 by (eapply avl_graph_child_valid__root_and_factor_setup;[exact (proj1 T)|exact Vp|right;exact Es]).
 destruct (avl_projection_children__lr_graph_composition g p l (proj2 Vl)) as [Ll Rl].
 assert (Fs:avl_left (avl_subtree_model g p) l=Some r) by (rewrite Ll;exact F).
 assert (Vr:avl_vvalid (avl_subtree_model g p) r)
 by (eapply avl_graph_child_valid__root_and_factor_setup;[exact (proj1 T)|exact Vl|left;exact Fs]).
 pose proof (proj2 (proj2 T) l Vl) as Nl.
 pose proof (proj2 (proj2 T) r Vr) as Nr.
 pose proof (crtos_balance_input_from_keys__balance_returns g p B Keys) as Input.
 pose proof Input as [[_ [_ [_ [_ [Safe _]]]]] _].
 assert (RotIn:avl_rl_rotation_input (avl_subtree_model g p) p).
 { unfold avl_rl_rotation_input.
   split;[exact T|]. split;[reflexivity|]. split;[exact Vp|]. split;[exact N|].
   split;[rewrite Es;exact Nl|]. split;[rewrite Es;simpl avl_ptr_of;rewrite Fs;exact Nr|].
   exact (Safe p Vp). }
 destruct (crtos_rl_canonical_exists__balance_returns (avl_subtree_model g p) p RotIn) as [a [q Res]].
 pose proof (proj1 Res) as Qret. rewrite Es in Qret. simpl avl_ptr_of in Qret.
 rewrite Fs in Qret. simpl avl_ptr_of in Qret. subst q.
 pose proof (proj1 (proj2 (proj2 (proj2 Res)))) as Model.
 rewrite Es in Model. simpl avl_ptr_of in Model.
 assert (Others:forall x,avl_vvalid (avl_subtree_model g p) x ->x<>p ->
 Z.abs (avl_model_balance_factor (avl_subtree_model g p) x)<=1).
 { intros x X D. rewrite crtos_subtree_factor__balance_returns by exact X.
 exact (proj1 (proj2 (proj2 (proj2 B))) x X D). }
 assert (Bound:Z.abs (avl_model_balance_factor (avl_subtree_model g p) p)<=2).
 { rewrite crtos_subtree_factor__balance_returns by exact Vp.
 exact (proj2 (proj2 (proj2 (proj2 B)))). }
 assert (P:avl_model_balance_factor (avl_subtree_model g p) p< -1)
 by (rewrite crtos_subtree_factor__balance_returns by exact Vp;exact Pos).
 assert (C:avl_model_balance_factor (avl_subtree_model g p) l>0)
 by (rewrite crtos_subtree_factor__balance_returns by exact Vl;exact Neg).
 pose proof (proj1 (proj2 (proj2 (proj2 (proj2 Res))))) as Ta.
 destruct (crtos_rl_restore__balance_returns (avl_subtree_model g p) a p l r T Others Bound
 Ta eq_refl Vp N Es Fs P C Model) as [Ba Ha].
 assert (Ga:avl_gvalid a) by (apply avl_gvalid_tree_valid_iff;split;assumption).
 pose proof (crtos_rl_canonical_equiv__balance_returns (avl_subtree_model g p) a p l r T eq_refl Es Fs Res) as Eq.
 split.
 - eapply crtos_equiv_gvalid__crtos_insert_composition;
 [apply crtos_equiv_sym__crtos_insert_composition;exact Eq|exact Ga].
 - split.
   + rewrite (proj1 Eq). exact (proj1 (proj2 (proj2 Res))).
   + destruct (proj2 (proj2 (proj2 (proj2 Eq))) r Vr) as [_ H].
     rewrite H. exact Ha.
Qed.
Lemma crtos_rl_effect__balance_returns : forall g p l r,
 crtos_balance_ready g p ->
 (forall x,avl_vvalid (avl_subtree_model g p) x ->INT_MIN<=avl_key_of (avl_subtree_model g p) x<=INT_MAX) ->
 avl_right g p=Some l ->avl_left g l=Some r ->
 avl_model_balance_factor g p< -1 ->avl_model_balance_factor g l>0 ->
 crtos_balance_effect g (crtos_rotate_rl g p) p r.
Proof.
 intros g p l r B Keys E F Neg Pos.
 destruct (crtos_rl_local_balance__balance_returns g p l r B Keys E F Neg Pos) as [Ga [Root Height]].
 destruct (crtos_rl_projection_fields__balance_returns g p l r B E F)
 as [Fields [Hh [Pl [Pr [Lr [Rl [Rr C]]]]]]].
 eapply crtos_effect_lift__balance_returns with (a:=crtos_rotate_rl (avl_subtree_model g p) p).
 - exact B.
 - exact Ga.
 - exact Root.
 - reflexivity.
 - reflexivity.
 - intro x;reflexivity.
 - intro x;reflexivity.
 - intro x;reflexivity.
 - intros x X. destruct (Fields x (proj2 X)) as [L R]. split;symmetry;assumption.
 - intros x X. split;[reflexivity|]. symmetry;apply Hh.
 - unfold crtos_balance_model. destruct (Z_lt_dec 1 (avl_model_balance_factor g p));[lia|].
   destruct (Z_lt_dec (avl_model_balance_factor g p) (-1));[|lia].
   rewrite E. simpl avl_ptr_of. destruct (Z_le_dec (avl_model_balance_factor g l) 0);[lia|reflexivity].
 - unfold crtos_balance_ptr. destruct (Z_lt_dec 1 (avl_model_balance_factor g p));[lia|].
   destruct (Z_lt_dec (avl_model_balance_factor g p) (-1));[|lia].
   rewrite E. simpl avl_ptr_of. destruct (Z_le_dec (avl_model_balance_factor g l) 0);[lia|].
   rewrite F;reflexivity.
 - rewrite <-Hh. exact Height.
 - intro A. apply Z.abs_le in A;lia.
Qed.
