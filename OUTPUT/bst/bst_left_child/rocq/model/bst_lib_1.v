Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Strings.String.
Require Import Coq.Lists.List.
Require Import Coq.Sorting.Permutation.
Require Import Coq.Classes.RelationClasses.
Require Import Coq.Logic.FunctionalExtensionality.
Require Import Coq.Logic.PropExtensionality.
Require Import Coq.Logic.ClassicalDescription.
Require Import Coq.Logic.Classical_Prop.
Require Import Coq.micromega.Lia.
Require Import Relations.
From SimpleC.SL Require Import Mem SeparationLogic.
Require Import Logic.LogicGenerator.demo932.Interface.
Require Import SetsClass.SetsClass.
Require Import GraphLib.graph_basic.
Require Import GraphLib.directed.rootedtree.
Require Import GraphLib.directed.binarytree.
Require GraphLib.examples.bst.
Export GraphLib.examples.bst.

Local Open Scope Z_scope.
Local Open Scope sets_scope.
Local Open Scope string.
Local Open Scope list.
Import naive_C_Rules.
Local Open Scope sac.

Section TreeRep.

Definition tree_key := Z.
Definition G : Type := GraphLib.examples.bst.BinarySearchTreeType addr.
Let E := addr.

#[local] Existing Instance GraphLib.examples.bst.BST_graph.
#[local] Existing Instance GraphLib.examples.bst.BST_gvalid.
#[local] Existing Instance GraphLib.examples.bst.BST_stepvalid.
#[local] Existing Instance GraphLib.examples.bst.BST_stepunique_directed.
#[local] Existing Instance GraphLib.examples.bst.BST_forest.
#[local] Existing Instance GraphLib.examples.bst.BST_binarytree.
#[local] Existing Instance GraphLib.examples.bst.BST_binarytree_with_key.
#[local] Existing Instance GraphLib.examples.bst.RootedTree_finitegraph.
#[local] Existing Instance GraphLib.examples.bst.BST_finitegraph.
#[local] Existing Instance GraphLib.examples.bst.simple_graph.
#[local] Existing Instance GraphLib.examples.bst.BST_bst.
#[local] Existing Instance GraphLib.examples.bst.BST_insert_operations.

Inductive cur_source : Type :=
| source_root
| source_left_child (parent : addr)
| source_right_child (parent : addr).

Definition bst_root (g : G) : option addr := (bst_tree g).(theroot).
Definition bst_left (g : G) (x : addr) := (bst_tree g).(left_child) x.
Definition bst_right (g : G) (x : addr) := (bst_tree g).(right_child) x.
Definition bst_nodes (g : G) := (bst_tree g).(listV).
Definition bst_key_of (g : G) (x : addr) := bst_key g x.

Definition bst_key_update (g g' : G) (p : addr) (k : Z) : Prop :=
  keyed_key_update_valid g g' p k.

Definition bst_redirect
    (g g' : G) (src : cur_source) (target : option addr) : Prop :=
  match src with
  | source_root => keyed_redirect_root_valid g g' target
  | source_left_child parent => keyed_redirect_left_valid g g' parent target
  | source_right_child parent => keyed_redirect_right_valid g g' parent target
  end.

Definition bst_keyed_insert
    (g1 g2 g' : G) (src : cur_source) (target : addr) : Prop :=
  match src with
  | source_root => keyed_weak_insert_root_valid g1 g2 g' target
  | source_left_child parent => keyed_weak_insert_left_valid g1 g2 g' parent target
  | source_right_child parent => keyed_weak_insert_right_valid g1 g2 g' parent target
  end.

Definition cur_source_value (g : G) (src : cur_source) (root: option addr): option addr :=
  match src with
  | source_root => root
  | source_left_child parent => (bst_tree g).(left_child) parent
  | source_right_child parent => (bst_tree g).(right_child) parent
  end.

Definition update_root
    (old_root : option addr) (src : cur_source)
    (target : option addr) : option addr :=
  match src with
  | source_root => target
  | source_left_child _ | source_right_child _ => old_root
  end.

Definition cur_source_valid (g : G) (src : cur_source) (root: option addr): Prop :=
  match src with
  | source_root =>
    match root with
    | Some v => bst_vvalid g v
    | None => True
    end
  | source_left_child parent | source_right_child parent => bst_vvalid g parent
  end.

Definition cur_source_reachable
    (g : G) (ancestor descendant : cur_source) (root: option addr): Prop :=
  Relation_Operators.clos_refl_trans cur_source
    (fun src next =>
      exists x,
        cur_source_value g src root = Some x /\
        (next = source_left_child x \/
         next = source_right_child x))
    ancestor descendant.

Definition bst_child_reachable (g : G) (x y : addr) :=
  Relation_Operators.clos_refl_trans addr
    (fun p q => bst_left g p = Some q \/ bst_right g p = Some q) x y.

Definition left_reachable (g : G) (x y : addr) : Prop :=
  RelsDomain.clos_refl_trans (fun p q => bst_left g p = Some q) x y.

Definition bst_gvalid (g : G) : Prop := gvalid g.

Lemma bst_gvalid_implies_bst_node_domain_valid :
  forall g, bst_gvalid g -> bst_node_domain_valid g (bst_nodes g).
Proof.
  intros g Hg.
  constructor.
  - reflexivity.
  - intros v.
    apply bst_listV_spec; exact Hg.
  - intros parent child Hparent Hchild.
    unfold bst_vvalid, bst_left, bst_right in *.
    eapply GraphLib.examples.bst.child_valid.
    + exact (GraphLib.examples.bst.bst_binary_tree g Hg).
    + exact Hparent.
    + exact Hchild.
  - intros v Hinvalid.
    unfold bst_vvalid, bst_left, bst_right in *.
    eapply GraphLib.examples.bst.invalid_child_is_none.
    + exact (GraphLib.examples.bst.bst_binary_tree g Hg).
    + exact Hinvalid.
  - apply bst_listV_NoDup; exact Hg.
Qed.

Lemma bst_node_domain_valid_permutation :
  forall (g : G) (l l' : list addr),
    bst_node_domain_valid g l ->
    Permutation l l' ->
    bst_node_domain_valid g l'.
Proof.
  intros g l l' Hdomain Hperm.
  destruct Hdomain as [Hlist Hmembership Hclosed Hnone Hnodup].
  constructor.
  - eapply Permutation_trans.
    + exact (Permutation_sym Hperm).
    + exact Hlist.
  - intros v; split; intro Hin.
    + apply Hmembership.
      eapply Permutation_in; [exact (Permutation_sym Hperm) | exact Hin].
    + eapply Permutation_in; [exact Hperm |].
      apply Hmembership; exact Hin.
  - exact Hclosed.
  - exact Hnone.
  - exact (Permutation_NoDup Hperm Hnodup).
Qed.

Lemma nodup_remove_cons_permutation :
  forall (eq_dec : forall x y : addr, {x = y} + {x <> y})
    (l : list addr) (x : addr),
    NoDup l -> In x l -> Permutation l (x :: remove eq_dec x l).
Proof.
  intros eq_dec l; induction l as [| a l IH]; intros x Hnodup Hin.
  - inversion Hin.
  - inversion Hnodup as [| ? ? Hnotin Hnodup']; subst.
    simpl in Hin; destruct Hin as [Heq | Hin].
    + subst a; simpl.
      destruct (eq_dec x x) as [_ | Hneq]; [| contradiction].
      apply perm_skip.
      rewrite (notin_remove eq_dec l x Hnotin); reflexivity.
    + simpl; destruct (eq_dec x a) as [Heq | Hneq].
      * subst a; contradiction.
      * eapply Permutation_trans.
        -- apply perm_skip; exact (IH x Hnodup' Hin).
        -- apply perm_swap.
Qed.

Lemma bst_nodes_remove_valid :
  forall (V_eq_dec : forall x y : addr, {x = y} + {x <> y})
    (g : G) (p : addr),
    bst_gvalid g -> bst_vvalid g p ->
    Permutation (bst_nodes g) (p :: remove V_eq_dec p (bst_nodes g)).
Proof.
  intros V_eq_dec g p Hg Hp.
  apply nodup_remove_cons_permutation.
  - apply bst_listV_NoDup; exact Hg.
  - apply bst_listV_spec; assumption.
Qed.

Definition ptr_of (x : option addr) : addr :=
  match x with
  | None => NULL
  | Some p => p
  end.

Definition option_ptr (x : addr) : option addr :=
  if (x =? NULL)%Z then None else Some x.

Definition tree_node_store (g : G) (x : addr) : Assertion :=
  “ bst_vvalid g x ” &&
  “ x <> NULL ” &&
  “ INT_MIN <= bst_key_of g x <= INT_MAX ” &&
  &(x # "tree" ->ₛ "key") # Int |-> bst_key_of g x **
  &(x # "tree" ->ₛ "left") # Ptr |-> ptr_of (bst_left g x) **
  &(x # "tree" ->ₛ "right") # Ptr |-> ptr_of (bst_right g x).

Definition tree_nodes_store (g : G) (xs : list addr) : Assertion :=
  iter_sepcon (map (tree_node_store g) xs).

Definition tree_store (g : G): Assertion :=
  tree_nodes_store g (bst_nodes g).

Definition tree_node_update_key (g : G) (x : addr) (new_key : Z) : Assertion :=
  “ bst_vvalid g x ” &&
  “ x <> NULL ” &&
  “ INT_MIN <= new_key <= INT_MAX ” &&
  &(x # "tree" ->ₛ "key") # Int |-> new_key **
  &(x # "tree" ->ₛ "left") # Ptr |-> ptr_of (bst_left g x) **
  &(x # "tree" ->ₛ "right") # Ptr |-> ptr_of (bst_right g x).

Definition cur_source_addr (root_addr : addr) (src : cur_source) : addr :=
  match src with
  | source_root => root_addr
  | source_left_child parent => &(parent # "tree" ->ₛ "left")
  | source_right_child parent => &(parent # "tree" ->ₛ "right")
  end.

Definition has_cur_source (g : G) (root : option addr) (src : cur_source) (cur : option addr) : Prop :=
    cur_source_valid g src root /\
    cur = cur_source_value g src root.

Definition has_cur_source2 (root_addr : addr) (root : option addr) (g : G) (src : cur_source) (cur : addr) : Prop :=
  cur_source_valid g src root/\
  cur = cur_source_addr root_addr src.

Definition tree_nodes_without_pointer2 (root_addr : addr)(root : option addr)(g : G)(src : cur_source)(l: list addr) : Assertion :=
match src with
  | source_root => tree_nodes_store g l
  | source_left_child parent => 
    “bst_vvalid g parent” &&
    “parent <> NULL” &&
    “ INT_MIN <= bst_key_of g parent <= INT_MAX ” &&
    tree_nodes_store g (remove Z.eq_dec parent l) **
    &(parent # "tree" ->ₛ "right") # Ptr |-> ptr_of(bst_right g parent) **
    &(parent # "tree" ->ₛ "key") # Int |-> bst_key_of g parent **
    root_addr # Ptr |-> ptr_of(root)
  | source_right_child parent => 
    “bst_vvalid g parent” &&
    “parent <> NULL” &&
    “ INT_MIN <= bst_key_of g parent <= INT_MAX ” &&
    tree_nodes_store g (remove Z.eq_dec parent l) **
    &(parent # "tree" ->ₛ "left") # Ptr |-> ptr_of(bst_left g parent) **
    &(parent # "tree" ->ₛ "key") # Int |-> bst_key_of g parent **
    root_addr # Ptr |-> ptr_of(root)
  end.

Lemma has_cur_source_some_vvalid :
  forall g src x,
    bst_gvalid g ->
    has_cur_source g (bst_root g) src (Some x) ->
    bst_vvalid g x.
Proof.
  intros g src x Hgvalid Hcur.
  unfold has_cur_source in Hcur.
  destruct Hcur as [Hsrc Hcur].
  unfold bst_gvalid in Hgvalid.
  destruct src as [| parent | parent]; simpl in Hsrc, Hcur.
  - unfold bst_root in Hcur.
    symmetry in Hcur.
    unfold bst_vvalid.
    eapply GraphLib.examples.bst.root_valid.
    + exact (GraphLib.examples.bst.bst_binary_tree g Hgvalid).
    + exact Hcur.
  - unfold bst_left in Hcur.
    symmetry in Hcur.
    unfold bst_vvalid in *.
    eapply GraphLib.examples.bst.child_valid.
    + exact (GraphLib.examples.bst.bst_binary_tree g Hgvalid).
    + exact Hsrc.
    + left; exact Hcur.
  - unfold bst_right in Hcur.
    symmetry in Hcur.
    unfold bst_vvalid in *.
    eapply GraphLib.examples.bst.child_valid.
    + exact (GraphLib.examples.bst.bst_binary_tree g Hgvalid).
    + exact Hsrc.
    + right; exact Hcur.
Qed.

Lemma has_cur_source2_root :
  forall root_addr g,
    bst_gvalid g ->
    has_cur_source2 root_addr (bst_root g) g source_root root_addr.
Proof.
  intros root_addr g Hg.
  unfold has_cur_source2, cur_source_valid, cur_source_addr.
  simpl.
  split.
  - destruct (bst_root g) as [v |] eqn:Hroot.
    + unfold bst_root in Hroot.
      unfold bst_gvalid in Hg.
      unfold bst_vvalid.
      eapply GraphLib.examples.bst.root_valid.
      * exact (GraphLib.examples.bst.bst_binary_tree g Hg).
      * exact Hroot.
    + exact I.
  - reflexivity.
Qed.

Lemma has_cur_source2_left_child :
  forall root_addr g root x,
    bst_vvalid g x ->
    has_cur_source2 root_addr root g (source_left_child x) &(x # "tree" ->ₛ "left").
Proof.
  intros root_addr g root x Hx.
  unfold has_cur_source2, cur_source_valid, cur_source_addr.
  simpl; auto.
Qed.

Lemma has_cur_source2_right_child :
  forall root_addr g root x,
    bst_vvalid g x ->
    has_cur_source2 root_addr root g (source_right_child x) &(x # "tree" ->ₛ "right").
Proof.
  intros root_addr g root x Hx.
  unfold has_cur_source2, cur_source_valid, cur_source_addr.
  simpl; auto.
Qed.

Lemma single_node_bst_nodes :
  forall g root, single_node_bst g root -> bst_nodes g = root :: nil.
Proof.
  intros g root Hsingle; unfold bst_nodes.
  exact (single_node_bst_listV g root Hsingle).
Qed.

Lemma permutation_partition_single__bst_new_strategy :
  forall (xs ys zs : list Z) x,
    Permutation xs (ys ++ zs) ->
    Permutation zs (x :: nil) ->
    Permutation xs (x :: ys).
Proof.
  intros xs ys zs x Hpartition Hsingle.
  etransitivity; [exact Hpartition |].
  etransitivity; [apply Permutation_app_head; exact Hsingle |].
  apply Permutation_sym.
  change (Permutation ((x :: nil) ++ ys) (ys ++ (x :: nil))).
  apply Permutation_app_comm.
Qed.

Local Lemma tree_nodes_store_app :
  forall g xs ys,
    tree_nodes_store g xs ** tree_nodes_store g ys
    |-- tree_nodes_store g (xs ++ ys).
Proof.
  intros g xs ys.
  unfold tree_nodes_store.
  rewrite map_app.
  apply derivable1_sepcon_iter_sepcon1.
Qed.

Local Lemma tree_nodes_store_split :
  forall g xs ys,
    tree_nodes_store g (xs ++ ys)
    |-- tree_nodes_store g xs ** tree_nodes_store g ys.
Proof.
  intros g xs ys.
  unfold tree_nodes_store.
  rewrite map_app.
  apply derivable1_sepcon_iter_sepcon2.
Qed.

Local Lemma emp_sepcon_clean_equiv :
  forall P,
    emp ** P --||-- P.
Proof.
  intros P.
  unfold logic_equiv, derivable1, sepcon, emp.
  split.
  - intros m [m1 [m2 [Hjoin [Hunit HP]]]].
    pose proof (unit_spec m2 m m1 Hunit (join_comm _ _ _ Hjoin)) as Heq.
    subst m.
    exact HP.
  - intros m HP.
    destruct (unit_join m) as [u [Hunit Hjoin]].
    exists u, m.
    split; [apply join_comm; exact Hjoin |].
    split; auto.
Qed.

Local Lemma sepcon_permute4 :
  forall P R K L,
    P ** (R ** (K ** L))
    |-- K ** (L ** (R ** P)).
Proof.
  intros P R K L.
  eapply derivable1_trans.
  - apply derivable1_sepcon_comm.
  - eapply derivable1_trans.
    + apply (proj2 (logic_equiv_sepcon_assoc _ _ _)).
    + eapply derivable1_trans.
      * apply derivable1_sepcon_mono.
        -- apply derivable1_refl.
        -- apply (proj2 (logic_equiv_sepcon_assoc _ _ _)).
      * eapply derivable1_trans.
        -- apply derivable1_sepcon_comm.
        -- eapply derivable1_trans.
           ++ apply (proj2 (logic_equiv_sepcon_assoc _ _ _)).
           ++ apply derivable1_sepcon_mono.
              ** apply derivable1_refl.
              ** eapply derivable1_trans.
                 --- apply (proj2 (logic_equiv_sepcon_assoc _ _ _)).
                 --- apply derivable1_sepcon_mono.
                     +++ apply derivable1_refl.
                     +++ apply derivable1_sepcon_comm.
Qed.

Local Lemma sepcon_permute4_right :
  forall P L K R,
    P ** (L ** (K ** R))
    |-- K ** (L ** (R ** P)).
Proof.
  intros P L K R.
  eapply derivable1_trans.
  - apply sepcon_permute4.
  - apply derivable1_sepcon_mono.
    + apply derivable1_refl.
    + eapply derivable1_trans.
      * apply derivable1_sepcon_assoc1.
      * eapply derivable1_trans.
        -- apply derivable1_sepcon_mono.
           ++ apply derivable1_sepcon_comm.
           ++ apply derivable1_refl.
        -- apply (proj2 (logic_equiv_sepcon_assoc _ _ _)).
Qed.

Lemma tree_nodes_store_cons :
  forall g x xs,
    tree_nodes_store g (x :: xs)
    --||--
    tree_node_store g x ** tree_nodes_store g xs.
Proof.
  intros g x xs.
  split.
  - change (x :: xs) with ((x :: nil) ++ xs).
    sep_apply tree_nodes_store_split.
    rewrite (emp_sepcon_clean_equiv (tree_node_store g x)).
    cancel.
  - change (x :: xs) with ((x :: nil) ++ xs).
    rewrite <- (emp_sepcon_clean_equiv (tree_node_store g x)).
    change (emp ** tree_node_store g x) with (tree_nodes_store g (x :: nil)).
    sep_apply (tree_nodes_store_app g (x :: nil) xs).
    reflexivity.
Qed.

Lemma tree_nodes_store_nil__bst_new_strategy :
  forall g,
    tree_nodes_store g nil --||-- emp.
Proof.
  intros.
  unfold tree_nodes_store.
  simpl.
  apply logic_equiv_refl.
Qed.

Lemma tree_nodes_store_singleton__bst_new_strategy :
  forall g x,
    tree_nodes_store g (x :: nil) --||-- tree_node_store g x.
Proof.
  intros.
  rewrite tree_nodes_store_cons.
  rewrite tree_nodes_store_nil__bst_new_strategy.
  rewrite sepcon_emp_equiv.
  apply logic_equiv_refl.
Qed.

Lemma tree_nodes_store_permutation :
  forall g xs ys,
    Permutation xs ys ->
    tree_nodes_store g xs --||-- tree_nodes_store g ys.
Proof.
  intros g xs ys Hperm.
  induction Hperm.
  - split; entailer!.
  - rewrite !tree_nodes_store_cons.
    rewrite IHHperm.
    reflexivity.
  - rewrite !tree_nodes_store_cons.
    split; cancel.
  - rewrite IHHperm1.
    exact IHHperm2.
Qed.

Local Lemma tree_nodes_store_member_nonnull :
  forall g xs z,
    In z xs ->
    tree_nodes_store g xs |-- “ z <> NULL ”.
Proof.
  intros g xs.
  induction xs as [| x xs IH]; intros z Hin.
  - contradiction.
  - rewrite tree_nodes_store_cons.
    destruct Hin as [Heq | Hin].
    + subst z.
      unfold tree_node_store.
      entailer!.
    + prop_apply (IH z Hin).
      entailer!.
Qed.

Local Lemma tree_key_store_not_in_nodes :
  forall h nodes p v,
    &(p # "tree" ->ₛ "key") # Int |-> v **
    tree_nodes_store h nodes
    |-- “~ In p nodes”.
Proof.
  intros h nodes.
  induction nodes as [| q nodes IH]; intros p v.
  - unfold tree_nodes_store.
    simpl.
    entailer!.
  - rewrite tree_nodes_store_cons.
    unfold tree_node_store.
    Intros.
    destruct (Z.eq_dec p q) as [-> | Hneq].
    + sep_apply (dup_store_int
        (&(q # "tree" ->ₛ "key")) v (bst_key_of h q)).
      entailer!.
    + prop_apply (IH p v).
      Intros.
      entailer!.
      intros [Heq | Hin].
      * apply Hneq; symmetry; exact Heq.
      * match goal with Htail : ~ In p nodes |- _ => exact (Htail Hin) end.
Qed.

Local Lemma tree_nodes_store_disjoint :
  forall g h xs ys,
    tree_nodes_store g xs **
    tree_nodes_store h ys
    |-- “forall z, In z xs -> ~ In z ys”.
Proof.
  intros g h xs.
  induction xs as [| p xs IH]; intros ys.
  - unfold tree_nodes_store.
    simpl.
    entailer!.
  - rewrite tree_nodes_store_cons.
    unfold tree_node_store.
    Intros.
    prop_apply (tree_key_store_not_in_nodes h ys p (bst_key_of g p)).
    Intros.
    prop_apply (IH ys).
    Intros.
    entailer!.
    intros z [Heq | Hin] Hiny.
    + subst z.
      contradiction.
    + match goal with
      | Htail : forall z, In z xs -> ~ In z ys |- _ =>
          exact (Htail z Hin Hiny)
      end.
Qed.

Lemma vertex_in_tree_store :
  forall g y,
    gvalid g -> bst_vvalid g y ->
    tree_store g
    |-- EX rest : list addr,
        “ Permutation (bst_nodes g) (y :: rest) ” &&
        tree_node_store g y **
        tree_nodes_store g rest.
Proof.
  intros g y Hgvalid Hyvalid.
  unfold tree_store.
  assert (Hin : In y (bst_nodes g)).
  { apply bst_listV_spec; auto. }
  apply in_split in Hin.
  destruct Hin as [l1 [l2 Hl]].
  Exists (l1 ++ l2).
  rewrite Hl.
  assert (Hperm : Permutation (l1 ++ y :: l2) (y :: l1 ++ l2)).
  { apply Permutation_sym.
    apply Permutation_middle. }
  rewrite (tree_nodes_store_permutation g
    (l1 ++ y :: l2) (y :: l1 ++ l2) Hperm).
  rewrite tree_nodes_store_cons.
  entailer!.
Qed.

Lemma tree_store_cons :
  forall g x xs,
    Permutation (bst_nodes g) (x :: xs) ->
    tree_node_store g x ** tree_nodes_store g xs
    |-- tree_store g.
Proof.
  intros g x xs Hperm.
  rewrite <- tree_nodes_store_cons.
  rewrite (tree_nodes_store_permutation g
    (x :: xs) (bst_nodes g) (Permutation_sym Hperm)).
  unfold tree_store.
  entailer!.
Qed.

Definition cur_source_search_local_valid
    (g : G) (src : cur_source) (root : option addr) (x : Z) : Prop :=
  match src with
  | source_root =>
    match root with
    | None => True
    | Some r => bst_search_node_in_subtree g r x
    end
  | source_left_child parent =>
    match bst_left g parent with
    | None => bst_search_left_key_constraint g parent x
    | Some l => bst_search_node_in_subtree g l x
    end
  | source_right_child parent =>
    match bst_right g parent with
    | None => bst_search_right_key_constraint g parent x
    | Some r => bst_search_node_in_subtree g r x
    end
  end.

Local Lemma cur_source_search_local_valid_root_from_gvalid :
  forall g key,
    bst_gvalid g ->
    cur_source_search_local_valid g source_root (bst_root g) key.
Proof.
  intros g key Hg.
  unfold cur_source_search_local_valid.
  destruct (bst_root g) as [r |] eqn:Hroot; auto.
  unfold bst_search_node_in_subtree.
  change (GraphLib.directed.binarytree.bt_root g) with (bst_root g).
  rewrite Hroot.
  repeat split.
  - unfold offspring, reachable_basic.reachable.
    apply RelsDomain.rt2_refl_ins.
  - unfold bst_root in Hroot.
    unfold bst_vvalid.
    eapply GraphLib.examples.bst.root_valid.
    + exact (GraphLib.examples.bst.bst_binary_tree g Hg).
    + exact Hroot.
  - intros a Ha Hin.
    destruct Hin as [l [Hleft Hoffs]].
    exfalso.
    unfold bst_root in Hroot.
    unfold bst_vvalid in Ha.
    unfold bst_left in Hleft.
    pose proof (GraphLib.examples.bst.child_valid (GraphLib.examples.bst.bst_tree g) (GraphLib.examples.bst.bst_binary_tree g Hg) a l Ha (or_introl Hleft)) as Hlvalid.
    pose proof (GraphLib.examples.bst.path_exists (GraphLib.examples.bst.bst_tree g) (GraphLib.examples.bst.bst_binary_tree g Hg) l Hlvalid) as [root_l [Hroot_l Hpath_rl]].
    change ((bst_tree g).(theroot) = Some r) in Hroot.
    change ((bst_tree g).(theroot) = Some root_l) in Hroot_l.
    assert (root_l = r) by congruence.
    subst root_l.
    pose proof (GraphLib.examples.bst.bst_bt_path_to_offspring g r l Hg (GraphLib.examples.bst.root_valid (GraphLib.examples.bst.bst_tree g) (GraphLib.examples.bst.bst_binary_tree g Hg) r Hroot) Hpath_rl) as Hreach_rl.
    assert (Hl_eq_r : l = r).
    {
      eapply GraphLib.directed.rootedtree.offspring_partial_order.
      - exact Hoffs.
      - exact Hreach_rl.
    }
    subst l.
    pose proof (GraphLib.examples.bst.root_no_parents (GraphLib.examples.bst.bst_tree g) (GraphLib.examples.bst.bst_binary_tree g Hg) a r Hroot) as [Hnleft _].
    apply Hnleft.
    exact Hleft.
  - intros a Ha Hin.
    destruct Hin as [rchild [Hright Hoffs]].
    exfalso.
    unfold bst_root in Hroot.
    unfold bst_vvalid in Ha.
    unfold bst_right in Hright.
    pose proof (GraphLib.examples.bst.child_valid (GraphLib.examples.bst.bst_tree g) (GraphLib.examples.bst.bst_binary_tree g Hg) a rchild Ha (or_intror Hright)) as Hrvalid.
    pose proof (GraphLib.examples.bst.path_exists (GraphLib.examples.bst.bst_tree g) (GraphLib.examples.bst.bst_binary_tree g Hg) rchild Hrvalid) as [root_r [Hroot_r Hpath_rr]].
    change ((bst_tree g).(theroot) = Some r) in Hroot.
    change ((bst_tree g).(theroot) = Some root_r) in Hroot_r.
    assert (root_r = r) by congruence.
    subst root_r.
    pose proof (GraphLib.examples.bst.bst_bt_path_to_offspring g r rchild Hg (GraphLib.examples.bst.root_valid (GraphLib.examples.bst.bst_tree g) (GraphLib.examples.bst.bst_binary_tree g Hg) r Hroot) Hpath_rr) as Hreach_rr.
    assert (Hr_eq_r : rchild = r).
    {
      eapply GraphLib.directed.rootedtree.offspring_partial_order.
      - exact Hoffs.
      - exact Hreach_rr.
    }
    subst rchild.
    pose proof (GraphLib.examples.bst.root_no_parents (GraphLib.examples.bst.bst_tree g) (GraphLib.examples.bst.bst_binary_tree g Hg) a r Hroot) as [_ Hnright].
    apply Hnright.
    exact Hright.
Unshelve.
  all: try exact Hg.
Qed.

Lemma cur_source_value_some_vvalid :
  forall g src p root,
    bst_gvalid g ->
    cur_source_valid g src root ->
    cur_source_value g src root = Some p ->
    bst_vvalid g p.
Proof.
  intros g src p root Hg Hsrc Hcur.
  destruct src as [| parent | parent].
  - cbn [cur_source_valid] in Hsrc.
    cbn [cur_source_value] in Hcur.
    rewrite Hcur in Hsrc.
    exact Hsrc.
  - cbn [cur_source_valid] in Hsrc.
    cbn [cur_source_value] in Hcur.
    unfold bst_gvalid in Hg.
    unfold bst_vvalid in *.
    eapply GraphLib.examples.bst.child_valid.
    + exact (GraphLib.examples.bst.bst_binary_tree g Hg).
    + exact Hsrc.
    + left; exact Hcur.
  - cbn [cur_source_valid] in Hsrc.
    cbn [cur_source_value] in Hcur.
    unfold bst_gvalid in Hg.
    unfold bst_vvalid in *.
    eapply GraphLib.examples.bst.child_valid.
    + exact (GraphLib.examples.bst.bst_binary_tree g Hg).
    + exact Hsrc.
    + right; exact Hcur.
Qed.

Local Lemma bst_search_node_in_subtree_descend_left :
  forall g p key root_value,
    bst_gvalid g ->
    bst_vvalid g p ->
    bst_search_node_in_subtree g p key ->
    key < bst_key_of g p ->
    cur_source_search_local_valid g (source_left_child p) root_value key.
Proof.
  intros g p key root_value Hg Hp Hnode Hlt.
  unfold bst_key_of in *.
  unfold cur_source_search_local_valid.
  destruct (bst_left g p) as [l |] eqn:Hleft.
  - unfold bst_search_node_in_subtree in *.
    change (GraphLib.directed.binarytree.bt_root g) with (bst_root g) in Hnode.
    change (GraphLib.directed.binarytree.bt_root g) with (bst_root g).
    destruct (bst_root g) as [root |] eqn:Hroot; [| exact I].
    destruct Hnode as [Hroot_p [Hp' [Hkey_left Hkey_right]]].
    repeat split.
    + unfold bst_root in Hroot.
      unfold bst_left in Hleft.
      unfold GraphLib.directed.rootedtree.offspring in *.
      eapply GraphLib.reachable.reachable_basic.reachable_trans.
      * exact Hroot_p.
      * eapply GraphLib.reachable.reachable_basic.step_rt.
        unfold GraphLib.reachable.reachable_basic.step.
        exists l.
        refine {|
          GraphLib.examples.bst.bt_step_x_valid := _;
          GraphLib.examples.bst.bt_step_y_valid := _;
          GraphLib.examples.bst.bt_step_edge_equal := eq_refl;
          GraphLib.examples.bst.bt_step_child := or_introl Hleft
        |}.
        -- exact Hp.
        -- unfold bst_vvalid in *.
           eapply GraphLib.examples.bst.child_valid.
           ++ exact (GraphLib.examples.bst.bst_binary_tree g Hg).
           ++ exact Hp.
           ++ left; exact Hleft.
    + unfold bst_vvalid in *.
      unfold bst_left in Hleft.
      eapply GraphLib.examples.bst.child_valid.
      * exact (GraphLib.examples.bst.bst_binary_tree g Hg).
      * exact Hp.
      * left; exact Hleft.
    + intros a Ha Hsub.
      assert (Hedge : GraphLib.directed.binarytree.left_child g p = Some l \/
          GraphLib.directed.binarytree.right_child g p = Some l).
      { left; change (bst_left g p = Some l); exact Hleft. }
      destruct (GraphLib.directed.binarytree.in_left_subtree_parent_or_lift
        (g:=g) a p l Hg Ha Hp Hedge Hsub) as [Hap | Hlift].
      * subst a. exact Hlt.
      * exact (Hkey_left a Ha Hlift).
    + intros a Ha Hsub.
      assert (Hedge : GraphLib.directed.binarytree.left_child g p = Some l \/
          GraphLib.directed.binarytree.right_child g p = Some l).
      { left; change (bst_left g p = Some l); exact Hleft. }
      destruct (GraphLib.directed.binarytree.in_right_subtree_parent_or_lift
        (g:=g) a p l Hg Ha Hp Hedge Hsub) as [Hap | Hlift].
      * subst a.
        destruct Hsub as [r [Hright Hoff]].
        unfold bst_left in Hleft.
        unfold bst_right in Hright.
        exfalso.
        eapply (GraphLib.directed.binarytree.left_right_subtree_disjoint (g:=g) p l r l).
        -- exact Hp.
        -- exact Hleft.
        -- exact Hright.
        -- unfold GraphLib.directed.rootedtree.offspring.
           unfold GraphLib.reachable.reachable_basic.reachable.
           exists O. reflexivity.
        -- exact Hoff.
      * exact (Hkey_right a Ha Hlift).
  - unfold bst_search_left_key_constraint.
    unfold bst_search_node_in_subtree in Hnode.
    destruct (GraphLib.directed.binarytree.bt_root g)
      as [root |] eqn:Hroot.
    + destruct Hnode as [_ [_ Hkey]].
      split; [exact Hlt | exact Hkey].
    + split; [exact Hlt |].
      exfalso.
      change (vvalid g p) in Hp.
      change (gvalid g) in Hg.
      destruct
        (GraphLib.directed.binarytree.bt_root_reaches_all
          g p Hg Hp) as [r [Hr _]].
      rewrite Hroot in Hr.
      discriminate.
Unshelve.
  all: exact Hg.
Qed.

Local Lemma cur_source_search_local_valid_descend_left :
  forall g src p key root,
    bst_gvalid g ->
    cur_source_search_local_valid g src root key ->
    cur_source_value g src root = Some p ->
    bst_vvalid g p ->
    key < bst_key_of g p ->
    cur_source_search_local_valid g (source_left_child p) root key.
Proof.
  intros g src p key root Hg Hvalid Hcur Hp Hlt.
  unfold cur_source_search_local_valid in Hvalid.
  destruct src as [| parent | parent].
  - cbn [cur_source_value] in Hcur.
    rewrite Hcur in Hvalid.
    eapply bst_search_node_in_subtree_descend_left; eauto.
  - cbn [cur_source_value] in Hcur.
    change (bst_left g parent = Some p) in Hcur.
    rewrite Hcur in Hvalid.
    eapply bst_search_node_in_subtree_descend_left; eauto.
  - cbn [cur_source_value] in Hcur.
    change (bst_right g parent = Some p) in Hcur.
    rewrite Hcur in Hvalid.
    eapply bst_search_node_in_subtree_descend_left; eauto.
Qed.

Local Lemma bst_search_node_in_subtree_descend_right :
  forall g p key root_value,
    bst_gvalid g ->
    bst_vvalid g p ->
    bst_search_node_in_subtree g p key ->
    bst_key_of g p < key ->
    cur_source_search_local_valid g (source_right_child p) root_value key.
Proof.
  intros g p key root_value Hg Hp Hnode Hgt.
  unfold bst_key_of in *.
  unfold cur_source_search_local_valid.
  destruct (bst_right g p) as [r |] eqn:Hright.
  - unfold bst_search_node_in_subtree in *.
    change (GraphLib.directed.binarytree.bt_root g) with (bst_root g) in Hnode.
    change (GraphLib.directed.binarytree.bt_root g) with (bst_root g).
    destruct (bst_root g) as [root |] eqn:Hroot; [| exact I].
    destruct Hnode as [Hroot_p [Hp' [Hkey_left Hkey_right]]].
    repeat split.
    + unfold bst_root in Hroot.
      unfold bst_right in Hright.
      unfold GraphLib.directed.rootedtree.offspring in *.
      eapply GraphLib.reachable.reachable_basic.reachable_trans.
      * exact Hroot_p.
      * eapply GraphLib.reachable.reachable_basic.step_rt.
        unfold GraphLib.reachable.reachable_basic.step.
        exists r.
        refine {|
          GraphLib.examples.bst.bt_step_x_valid := _;
          GraphLib.examples.bst.bt_step_y_valid := _;
          GraphLib.examples.bst.bt_step_edge_equal := eq_refl;
          GraphLib.examples.bst.bt_step_child := or_intror Hright
        |}.
        -- exact Hp.
        -- unfold bst_vvalid in *.
           eapply GraphLib.examples.bst.child_valid.
           ++ exact (GraphLib.examples.bst.bst_binary_tree g Hg).
           ++ exact Hp.
           ++ right; exact Hright.
    + unfold bst_vvalid in *.
      unfold bst_right in Hright.
      eapply GraphLib.examples.bst.child_valid.
      * exact (GraphLib.examples.bst.bst_binary_tree g Hg).
      * exact Hp.
      * right; exact Hright.
    + intros a Ha Hsub.
      assert (Hedge : GraphLib.directed.binarytree.left_child g p = Some r \/
          GraphLib.directed.binarytree.right_child g p = Some r).
      { right; change (bst_right g p = Some r); exact Hright. }
      destruct (GraphLib.directed.binarytree.in_left_subtree_parent_or_lift
        (g:=g) a p r Hg Ha Hp Hedge Hsub) as [Hap | Hlift].
      * subst a.
        destruct Hsub as [l [Hleft Hoff]].
        unfold bst_left in Hleft.
        unfold bst_right in Hright.
        exfalso.
        eapply (GraphLib.directed.binarytree.left_right_subtree_disjoint (g:=g) p l r r).
        -- exact Hp.
        -- exact Hleft.
        -- exact Hright.
        -- exact Hoff.
        -- unfold GraphLib.directed.rootedtree.offspring.
           unfold GraphLib.reachable.reachable_basic.reachable.
           exists O. reflexivity.
      * exact (Hkey_left a Ha Hlift).
    + intros a Ha Hsub.
      assert (Hedge : GraphLib.directed.binarytree.left_child g p = Some r \/
          GraphLib.directed.binarytree.right_child g p = Some r).
      { right; change (bst_right g p = Some r); exact Hright. }
      destruct (GraphLib.directed.binarytree.in_right_subtree_parent_or_lift
        (g:=g) a p r Hg Ha Hp Hedge Hsub) as [Hap | Hlift].
      * subst a. apply Z.compare_gt_iff. exact Hgt.
      * exact (Hkey_right a Ha Hlift).
  - unfold bst_search_right_key_constraint.
    unfold bst_search_node_in_subtree in Hnode.
    destruct (GraphLib.directed.binarytree.bt_root g)
      as [root |] eqn:Hroot.
    + destruct Hnode as [_ [_ Hkey]].
      split; [apply Z.compare_gt_iff; exact Hgt | exact Hkey].
    + split; [apply Z.compare_gt_iff; exact Hgt |].
      exfalso.
      change (vvalid g p) in Hp.
      change (gvalid g) in Hg.
      destruct
        (GraphLib.directed.binarytree.bt_root_reaches_all
          g p Hg Hp) as [rr [Hrr _]].
      rewrite Hroot in Hrr.
      discriminate.
Unshelve.
  all: exact Hg.
Qed.

Local Lemma cur_source_search_local_valid_descend_right :
  forall g src p key root,
    bst_gvalid g ->
    cur_source_search_local_valid g src root key ->
    cur_source_value g src root = Some p ->
    bst_vvalid g p ->
    bst_key_of g p < key ->
    cur_source_search_local_valid g (source_right_child p) root key.
Proof.
  intros g src p key root Hg Hvalid Hcur Hp Hgt.
  unfold cur_source_search_local_valid in Hvalid.
  destruct src as [| parent | parent].
  - cbn [cur_source_value] in Hcur.
    rewrite Hcur in Hvalid.
    eapply bst_search_node_in_subtree_descend_right; eauto.
  - cbn [cur_source_value] in Hcur.
    change (bst_left g parent = Some p) in Hcur.
    rewrite Hcur in Hvalid.
    eapply bst_search_node_in_subtree_descend_right; eauto.
  - cbn [cur_source_value] in Hcur.
    change (bst_right g parent = Some p) in Hcur.
    rewrite Hcur in Hvalid.
    eapply bst_search_node_in_subtree_descend_right; eauto.
Qed.

Definition key_confined_to_cur_source
    (g : G) (src : cur_source) (root : option addr) (key : Z) : Prop :=
  forall z,
    bst_vvalid g z ->
    bst_key_of g z = key ->
    match cur_source_value g src root with
    | Some p => offspring g p z
    | None => False
    end.

Definition cur_source_search_valid
    (g : G) (src : cur_source) (root : option addr) (key : Z) : Prop :=
  cur_source_search_local_valid g src root key /\
  key_confined_to_cur_source g src root key.

Lemma cur_source_search_valid_root_from_gvalid :
  forall g key,
    bst_gvalid g ->
    cur_source_search_valid g source_root (bst_root g) key.
Proof.
  intros g key Hg.
  split.
  - apply cur_source_search_local_valid_root_from_gvalid; exact Hg.
  - unfold key_confined_to_cur_source.
    destruct (cur_source_value g source_root (bst_root g))
      as [root |] eqn:Hroot.
    + intros z Hz _.
      change (vvalid g z) in Hz.
      change (gvalid g) in Hg.
      destruct (GraphLib.directed.binarytree.bt_root_reaches_all g z Hg Hz)
        as [root' [Hroot' Hreach]].
      unfold cur_source_value in Hroot.
      simpl in Hroot.
      change
        ((GraphLib.examples.bst.bst_tree g).(GraphLib.examples.bst.theroot) =
          Some root) in Hroot.
      change
        ((GraphLib.examples.bst.bst_tree g).(GraphLib.examples.bst.theroot) =
          Some root') in Hroot'.
      rewrite Hroot in Hroot'.
      inversion Hroot'; subst root'.
      exact Hreach.
    + intros z Hz _.
      change (vvalid g z) in Hz.
      change (gvalid g) in Hg.
      destruct (GraphLib.directed.binarytree.bt_root_reaches_all g z Hg Hz)
        as [root [Hroot' _]].
      unfold cur_source_value in Hroot.
      simpl in Hroot.
      change
        ((GraphLib.examples.bst.bst_tree g).(GraphLib.examples.bst.theroot) =
          None) in Hroot.
      change
        ((GraphLib.examples.bst.bst_tree g).(GraphLib.examples.bst.theroot) =
          Some root) in Hroot'.
      rewrite Hroot in Hroot'.
      discriminate.
Qed.

Lemma cur_source_search_valid_descend_left :
  forall g src p key root,
    bst_gvalid g ->
    cur_source_search_valid g src root key ->
    cur_source_value g src root = Some p ->
    bst_vvalid g p ->
    key < bst_key_of g p ->
    cur_source_search_valid g (source_left_child p) root key.
Proof.
  intros g src p key root Hg [Hlocal Hconfined] Hcur Hp Hlt.
  split.
  - eapply cur_source_search_local_valid_descend_left; eauto.
  - unfold key_confined_to_cur_source in *.
    simpl.
    destruct (cur_source_value g (source_left_child p) root)
      as [left |] eqn:Hleft.
    + intros z Hz Hkey.
      specialize (Hconfined z Hz Hkey).
      rewrite Hcur in Hconfined.
      destruct (Z.eq_dec p z) as [Hpz | Hpz].
      { subst z. lia. }
      destruct (GraphLib.directed.rootedtree.real_offspring
        (g:=g) (gvalid:=Hg) p z Hconfined Hpz)
        as [first [Hstep Hoff]].
      destruct (GraphLib.directed.binarytree.child_complete g p first Hg Hstep)
        as [Hfirst_left | Hfirst_right].
      * change (bst_left g p = Some first) in Hfirst_left.
        unfold cur_source_value in Hleft.
        simpl in Hleft.
        change (bst_left g p = Some left) in Hleft.
        rewrite Hleft in Hfirst_left.
        inversion Hfirst_left; subst first.
        change ((bst_tree g).(left_child) p = Some left) in Hleft.
        rewrite Hleft.
        exact Hoff.
      * pose proof (GraphLib.directed.binarytree.bst_right_subtree_key_gt
          g p first z Hg Hp Hfirst_right Hoff) as Hgt.
        change (bst_key_of g z > bst_key_of g p) in Hgt.
        lia.
    + intros z Hz Hkey.
      specialize (Hconfined z Hz Hkey).
      rewrite Hcur in Hconfined.
      destruct (Z.eq_dec p z) as [Hpz | Hpz].
      { subst z. lia. }
      destruct (GraphLib.directed.rootedtree.real_offspring
        (g:=g) (gvalid:=Hg) p z Hconfined Hpz)
        as [first [Hstep Hoff]].
      destruct (GraphLib.directed.binarytree.child_complete g p first Hg Hstep)
        as [Hfirst_left | Hfirst_right].
      * change (bst_left g p = Some first) in Hfirst_left.
        unfold cur_source_value in Hleft.
        simpl in Hleft.
        change (bst_left g p = None) in Hleft.
        rewrite Hleft in Hfirst_left.
        discriminate.
      * pose proof (GraphLib.directed.binarytree.bst_right_subtree_key_gt
          g p first z Hg Hp Hfirst_right Hoff) as Hgt.
        change (bst_key_of g z > bst_key_of g p) in Hgt.
        lia.
Qed.

Lemma cur_source_search_valid_descend_right :
  forall g src p key root,
    bst_gvalid g ->
    cur_source_search_valid g src root key ->
    cur_source_value g src root = Some p ->
    bst_vvalid g p ->
    bst_key_of g p < key ->
    cur_source_search_valid g (source_right_child p) root key.
Proof.
  intros g src p key root Hg [Hlocal Hconfined] Hcur Hp Hgt.
  split.
  - eapply cur_source_search_local_valid_descend_right; eauto.
  - unfold key_confined_to_cur_source in *.
    simpl.
    destruct (cur_source_value g (source_right_child p) root)
      as [right |] eqn:Hright.
    + intros z Hz Hkey.
      specialize (Hconfined z Hz Hkey).
      rewrite Hcur in Hconfined.
      destruct (Z.eq_dec p z) as [Hpz | Hpz].
      { subst z. lia. }
      destruct (GraphLib.directed.rootedtree.real_offspring
        (g:=g) (gvalid:=Hg) p z Hconfined Hpz)
        as [first [Hstep Hoff]].
      destruct (GraphLib.directed.binarytree.child_complete g p first Hg Hstep)
        as [Hfirst_left | Hfirst_right].
      * pose proof (GraphLib.directed.binarytree.bst_left_subtree_key_lt
          g p first z Hg Hp Hfirst_left Hoff) as Hlt.
        change (bst_key_of g z < bst_key_of g p) in Hlt.
        lia.
      * change (bst_right g p = Some first) in Hfirst_right.
        unfold cur_source_value in Hright.
        simpl in Hright.
        change (bst_right g p = Some right) in Hright.
        rewrite Hright in Hfirst_right.
        inversion Hfirst_right; subst first.
        change ((bst_tree g).(right_child) p = Some right) in Hright.
        rewrite Hright.
        exact Hoff.
    + intros z Hz Hkey.
      specialize (Hconfined z Hz Hkey).
      rewrite Hcur in Hconfined.
      destruct (Z.eq_dec p z) as [Hpz | Hpz].
      { subst z. lia. }
      destruct (GraphLib.directed.rootedtree.real_offspring
        (g:=g) (gvalid:=Hg) p z Hconfined Hpz)
        as [first [Hstep Hoff]].
      destruct (GraphLib.directed.binarytree.child_complete g p first Hg Hstep)
        as [Hfirst_left | Hfirst_right].
      * pose proof (GraphLib.directed.binarytree.bst_left_subtree_key_lt
          g p first z Hg Hp Hfirst_left Hoff) as Hlt.
        change (bst_key_of g z < bst_key_of g p) in Hlt.
        lia.
      * change (bst_right g p = Some first) in Hfirst_right.
        unfold cur_source_value in Hright.
        simpl in Hright.
        change (bst_right g p = None) in Hright.
        rewrite Hright in Hfirst_right.
        discriminate.
Qed.

Lemma cur_source_search_valid_null_absent :
  forall g src root key,
    cur_source_search_valid g src root key ->
    cur_source_value g src root = None ->
    forall z,
      bst_vvalid g z ->
      bst_key_of g z = key ->
      False.
Proof.
  intros g src root key [_ Hconfined] Hnull z Hz Hkey.
  unfold key_confined_to_cur_source in Hconfined.
  specialize (Hconfined z Hz Hkey).
  rewrite Hnull in Hconfined.
  exact Hconfined.
Qed.

End TreeRep.
