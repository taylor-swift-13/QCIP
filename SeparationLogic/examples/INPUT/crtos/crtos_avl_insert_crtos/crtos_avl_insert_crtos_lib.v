Require Export QCIPLib.crtos.crtos_avl_common.crtos_avl_graph_lib.
Require Import Coq.Lists.List Coq.ZArith.ZArith Coq.Sorting.Permutation.
Import ListNotations.
Local Open Scope Z_scope.

(** Properties over the existing finite graph; no recursive insertion model. *)
Definition strict_key_present (g : avl_model) (key : Z) : Prop :=
  exists p, avl_vvalid g p /\ avl_key_of g p = key.

Definition strict_same_graph (a b : avl_model) : Prop :=
  avl_root a = avl_root b /\
  Permutation (avl_nodes a) (avl_nodes b) /\
  (forall x, avl_vvalid a x <-> avl_vvalid b x) /\
  (forall x, avl_vvalid a x ->
     avl_key_of a x = avl_key_of b x /\
     avl_height_of a x = avl_height_of b x /\
     avl_left a x = avl_left b x /\
     avl_right a x = avl_right b x).

(** A graph path selected by comparison, independently of allocation or any
    insertion execution. The property is used only to identify cleared edges. *)
Inductive strict_search_path (g : avl_model) (key : Z) : Z -> Prop :=
| strict_path_root : forall p, avl_root g = Some p ->
    strict_search_path g key p
| strict_path_left : forall p c,
    strict_search_path g key p -> key < avl_key_of g p ->
    avl_left g p = Some c -> strict_search_path g key c
| strict_path_right : forall p c,
    strict_search_path g key p -> avl_key_of g p < key ->
    avl_right g p = Some c -> strict_search_path g key c.

(** Failure retains ALL vertices, keys, caches and nonselected edges. The
    returned root is NULL even though the complete owned heap can be nonempty.
    Each selected search-path child edge is cleared before NULL propagates. *)
Definition strict_failure_effect (a b : avl_model) (key : Z) : Prop :=
  avl_root b = None /\
  Permutation (avl_nodes a) (avl_nodes b) /\
  (forall x, avl_vvalid b x <-> avl_vvalid a x) /\
  (forall x, avl_vvalid a x ->
    avl_key_of b x = avl_key_of a x /\
    avl_height_of b x = avl_height_of a x /\
    ((strict_search_path a key x /\ key < avl_key_of a x) ->
       avl_left b x = None) /\
    (~ (strict_search_path a key x /\ key < avl_key_of a x) ->
       avl_left b x = avl_left a x) /\
    ((strict_search_path a key x /\ avl_key_of a x < key) ->
       avl_right b x = None) /\
    (~ (strict_search_path a key x /\ avl_key_of a x < key) ->
       avl_right b x = avl_right a x)).

Definition strict_allocation_effect (a b : avl_model) (key : Z) : Prop :=
  (strict_key_present a key /\
   Permutation (avl_nodes b) (avl_nodes a) /\
   (forall x, avl_vvalid b x <-> avl_vvalid a x) /\
   (forall x, avl_vvalid a x -> avl_key_of b x = avl_key_of a x)) \/
  (~ strict_key_present a key /\
   exists n, n <> 0 /\ ~ avl_vvalid a n /\
     Permutation (avl_nodes b) (n :: avl_nodes a) /\
     (forall x, avl_vvalid b x <-> x = n \/ avl_vvalid a x) /\
     avl_key_of b n = key /\
     (forall x, avl_vvalid a x -> avl_key_of b x = avl_key_of a x)).

Definition strict_insert_outcome (before after : avl_model) (key ret : Z) : Prop :=
  (ret = 0 /\ ~ strict_key_present before key /\
   strict_failure_effect before after key) \/
  (avl_insert_success before after key ret /\
   strict_allocation_effect before after key /\
   (strict_key_present before key -> strict_same_graph before after)).

(** Coherent mathematical parent before cache refresh; physical old root cache
    is represented separately by [avl_with_root_cache]. *)
Definition strict_insert_pending (before raw : avl_model) (key p : Z) : Prop :=
  avl_insert_pending before raw key p /\
  strict_allocation_effect before raw key /\
  (strict_key_present before key -> strict_same_graph before raw).

(** Original Balance is identity when already balanced. This is an explicit
    callee proof obligation, not an axiom or a caller proof of its body. *)
Definition strict_balance_identity (before after : avl_model) : Prop :=
  avl_balanced before -> strict_same_graph before after.

Definition strict_insert_keyset (before after : avl_model) (key : Z) : Prop :=
  forall k, In k (avl_keys after) <-> k = key \/ In k (avl_keys before).


Lemma strict_insert_nonnull_keyset : forall before after key ret,
  strict_insert_outcome before after key ret -> ret <> 0 ->
  strict_insert_keyset before after key.
Proof.
  intros before after key ret H N.
  destruct H as [[E _] | [H _]].
  - contradiction.
  - exact (proj2 (proj2 (proj1 H))).
Qed.

Lemma strict_failure_retains_all_vertices : forall before after key,
  strict_failure_effect before after key ->
  forall x, avl_vvalid after x <-> avl_vvalid before x.
Proof.
  intros before after key H.
  exact (proj1 (proj2 (proj2 H))).
Qed.

Require Import Coq.micromega.Lia.
Require Import Coq.Logic.ClassicalDescription.
Lemma strict_same_graph_refl__strict_graph_lifecycle : forall g,
  strict_same_graph g g.
Proof.
 intros g. unfold strict_same_graph. repeat split; auto.
Qed.
Lemma strict_empty_domain__strict_graph_lifecycle : forall g key,
 avl_insert_input g 0 key ->
 avl_root g = None /\ avl_nodes g = nil /\ (forall x, ~ avl_vvalid g x).
Proof.
 intros g key [V [B [R Rest]]].
 assert (E:avl_root g=None).
 { apply (proj1 (avl_root_ptr_null_iff__mapping_refinement__tree_valid g V)). symmetry; exact R. }
 pose proof (avl_empty_root_nodes__mapping_refinement__tree_valid g V E) as N.
 split; [exact E|]. split; [exact N|]. intros x Hx.
 pose proof (GraphLib.examples.bst.finite_vertices _
  (GraphLib.examples.bst.bst_binary_tree _ (proj1 V)) x Hx) as H.
 change (In x (avl_nodes g)) in H. rewrite N in H. contradiction.
Qed.
Lemma strict_empty_failure__strict_graph_lifecycle : forall g key,
 avl_insert_input g 0 key -> strict_insert_outcome g g key 0.
Proof.
 intros g key Input.
 pose proof (strict_empty_domain__strict_graph_lifecycle g key Input) as [R [N Empty]].
 left. split; [reflexivity|]. split.
 - intros [x [Hx _]]. exact (Empty x Hx).
 - unfold strict_failure_effect. split; [exact R|]. split; [reflexivity|]. split.
   + intro x; reflexivity.
   + intros x Hx. exfalso; exact (Empty x Hx).
Qed.
Lemma strict_duplicate_identity__strict_graph_lifecycle : forall g p key,
 avl_insert_input g p key -> p<>0 -> avl_vvalid g p -> key=avl_key_of g p ->
 strict_insert_outcome g g key p.
Proof.
 intros g p key Input Np Vp E.
 pose proof (avl_insert_duplicate__insert_projection_graft g p key Input Np Vp E) as O.
 destruct O as [[Z _]|Success]; [contradiction|].
 right. split; [exact Success|]. split.
 - left. split; [exists p; auto|]. repeat split; auto.
 - intros _. apply strict_same_graph_refl__strict_graph_lifecycle.
Qed.
Lemma strict_singleton_pending__strict_graph_lifecycle : forall before key p,
 avl_insert_input before 0 key -> p<>0 ->
 strict_insert_pending before (avl_join_model p key avl_empty_model avl_empty_model) key p.
Proof.
 intros before key p Input Np.
 pose proof (strict_empty_domain__strict_graph_lifecycle before key Input) as [R [N Empty]].
 assert (Absent: ~strict_key_present before key).
 { intros [x [Hx _]]. exact (Empty x Hx). }
 split; [apply avl_singleton_pending__insert_projection_graft; auto|]. split; [|tauto].
 right. split; [exact Absent|]. exists p. split; [exact Np|]. split; [apply Empty|].
 split.
 - change (Permutation (p::nil++nil) (p::avl_nodes before)). rewrite N. reflexivity.
 - split.
   + intros x. change (x=p \/ False \/ False <-> x=p \/ avl_vvalid before x).
     split; intros H; [tauto|]. destruct H; [auto|exfalso; eapply Empty; eauto].
   + split.
     * exact (proj1 (proj2 (proj2 (avl_join_root_fields__insert_projection_graft p key avl_empty_model avl_empty_model)))).
     * intros x Hx. exfalso; exact (Empty x Hx).
Qed.
Lemma strict_valid_nodes__strict_graph_lifecycle : forall g,
 avl_tree_valid g -> forall x, avl_vvalid g x <-> In x (avl_nodes g).
Proof.
 intros g V x. split.
 - exact (GraphLib.examples.bst.finite_vertices _ (GraphLib.examples.bst.bst_binary_tree _ (proj1 V)) x).
 - exact (GraphLib.examples.bst.listV_sound _ (GraphLib.examples.bst.bst_binary_tree _ (proj1 V)) x).
Qed.
Lemma strict_same_graph_trans__strict_graph_lifecycle : forall a b c,
 strict_same_graph a b -> strict_same_graph b c -> strict_same_graph a c.
Proof.
 intros a b c [R1 [P1 [V1 F1]]] [R2 [P2 [V2 F2]]].
 split; [congruence|]. split; [etransitivity; eauto|]. split.
 - intro x. rewrite V1,V2. reflexivity.
 - intros x Hx. specialize (F1 x Hx). specialize (F2 x (proj1 (V1 x) Hx)).
   destruct F1 as [? [? [? ?]]]; destruct F2 as [? [? [? ?]]]. repeat split; congruence.
Qed.
Lemma strict_same_graph_balanced__strict_graph_lifecycle : forall a b,
 avl_tree_valid a -> avl_balanced a -> strict_same_graph a b -> avl_balanced b.
Proof.
 intros a b Va Ba [R [P [D F]]] x Hx.
 assert (Ha:avl_vvalid a x) by (apply D; exact Hx).
 pose proof (F x Ha) as [K [H [L Rr]]].
 assert (CH:forall child, (child=avl_left a x \/ child=avl_right a x) ->
 avl_child_height b child=avl_child_height a child).
 { intros [y|] C; [|reflexivity]. simpl.
   assert (Hy:avl_vvalid a y).
   { eapply avl_graph_child_valid__root_and_factor_setup; [exact (proj1 Va)|exact Ha|].
     destruct C; [left|right]; congruence. }
   symmetry. exact (proj1 (proj2 (F y Hy))). }
 unfold avl_model_balance_factor. rewrite <-L,<-Rr.
 rewrite (CH (avl_left a x) (or_introl eq_refl)),(CH (avl_right a x) (or_intror eq_refl)).
 exact (Ba x Ha).
Qed.
Lemma strict_allocation_transport__strict_graph_lifecycle : forall a b c key,
 avl_tree_valid b -> avl_tree_valid c -> avl_nodes c=avl_nodes b ->
 (forall x,avl_key_of c x=avl_key_of b x) ->
 strict_allocation_effect a b key -> strict_allocation_effect a c key.
Proof.
 intros a b c key Vb Vc Nodes Keys Allocation.
 assert (D:forall x,avl_vvalid c x <-> avl_vvalid b x).
 { intro x. rewrite (strict_valid_nodes__strict_graph_lifecycle c Vc x),
   (strict_valid_nodes__strict_graph_lifecycle b Vb x),Nodes. reflexivity. }
 unfold strict_allocation_effect in *.
 destruct Allocation as [[Present [P [Db Kb]]]|[Absent [n [Nn [Fresh [P [Db [Kn Kb]]]]]]]].
 - left. split; [exact Present|]. split; [rewrite Nodes; exact P|]. split.
   + intro x. rewrite D. apply Db.
   + intros x Hx. rewrite Keys. apply Kb; auto.
 - right. split; [exact Absent|]. exists n. split; [exact Nn|]. split; [exact Fresh|].
   split; [rewrite Nodes; exact P|]. split.
   + intro x. rewrite D. apply Db.
   + split; [rewrite Keys; exact Kn|]. intros x Hx. rewrite Keys. apply Kb; auto.
Qed.
Lemma strict_pending_balance_finish__strict_graph_lifecycle : forall before raw after key p ret,
 strict_insert_pending before raw key p -> avl_balance_graph_result raw after ret ->
 avl_balance_height_effect raw after -> strict_balance_identity raw after ->
 strict_insert_outcome before after key ret.
Proof.
 intros before raw after key p ret [Pending [Allocation Duplicate]] Result Height Identity.
 pose proof (avl_pending_balance_outcome__insert_projection_graft before raw after key p ret Pending Result Height) as Outcome.
 pose proof Pending as [Input [Np [Balance [Vr [Safe [Keys Rest]]]]]].
 pose proof Result as [Ga [Nodes [K [Root Bounds]]]].
 pose proof (avl_gvalid_tree_valid after Ga) as Va.
 assert (NK:In key (avl_keys after)).
 { unfold avl_keys. rewrite Nodes. assert (E:map (avl_key_of after) (avl_nodes raw)=avl_keys raw).
   { unfold avl_keys. apply map_ext. exact K. }
   rewrite E. apply Keys; auto. }
 assert (Nr:ret<>0).
 { intro E. assert (R:avl_root after=None).
   { apply (proj1 (avl_root_ptr_null_iff__mapping_refinement__tree_valid after Va)). change (avl_ptr_of (avl_root after)=0). lia. }
   unfold avl_keys in NK. rewrite (avl_empty_root_nodes__mapping_refinement__tree_valid after Va R) in NK. contradiction. }
 destruct Outcome as [[Z _]|Success]; [contradiction|].
 right. split; [exact Success|]. split.
 - exact (strict_allocation_transport__strict_graph_lifecycle before raw after key Vr Va Nodes K Allocation).
 - intros Present. pose proof (Duplicate Present) as Same.
   apply (strict_same_graph_trans__strict_graph_lifecycle before raw after Same).
   apply Identity. eapply strict_same_graph_balanced__strict_graph_lifecycle; [exact (proj1 Input)|exact (proj1 (proj2 Input))|exact Same].
Qed.
Lemma strict_child_fields__strict_graph_lifecycle : forall g c x,
 avl_vvalid (avl_child_model g c) x ->
 avl_vvalid g x /\
 avl_key_of (avl_child_model g c) x=avl_key_of g x /\
 avl_height_of (avl_child_model g c) x=avl_height_of g x /\
 avl_left (avl_child_model g c) x=avl_left g x /\
 avl_right (avl_child_model g c) x=avl_right g x.
Proof.
 intros g [s|] x Hx; [|contradiction].
 change (avl_vvalid g x /\ avl_reachable g s x) in Hx.
 pose proof (avl_projection_children__lr_graph_composition g s x (proj2 Hx)) as [L R].
 split; [exact (proj1 Hx)|]. split; [reflexivity|]. split; [reflexivity|]. auto.
Qed.
Lemma strict_parent_domain__strict_graph_lifecycle : forall g p key,
 avl_insert_input g p key -> p<>0 -> forall x,
 avl_vvalid g x <-> x=p \/
 avl_vvalid (avl_child_model g (avl_left g p)) x \/
 avl_vvalid (avl_child_model g (avl_right g p)) x.
Proof.
 intros g p key Input Np x.
 pose proof (avl_child_insert_input__insert_projection_graft g p key (avl_left g p) Input Np (or_introl eq_refl)) as IL.
 pose proof (avl_child_insert_input__insert_projection_graft g p key (avl_right g p) Input Np (or_intror eq_refl)) as IR.
 rewrite (strict_valid_nodes__strict_graph_lifecycle g (proj1 Input)).
 rewrite (strict_valid_nodes__strict_graph_lifecycle _ (proj1 IL)),(strict_valid_nodes__strict_graph_lifecycle _ (proj1 IR)).
 pose proof (avl_parent_nodes__predecessor_graft g p (proj1 Input) (proj1 (proj2 (proj2 Input))) Np) as P.
 assert (E:In x (avl_nodes g) <-> In x (p::avl_nodes (avl_child_model g (avl_left g p))++avl_nodes (avl_child_model g (avl_right g p)))).
 { split; intro H.
   - exact (Permutation_in x P H).
   - exact (Permutation_in x (Permutation_sym P) H). }
 rewrite E. simpl. rewrite in_app_iff. intuition congruence.
Qed.
Lemma strict_parent_regions__strict_graph_lifecycle : forall g p key,
 avl_insert_input g p key -> p<>0 ->
 ~avl_vvalid (avl_child_model g (avl_left g p)) p /\
 ~avl_vvalid (avl_child_model g (avl_right g p)) p /\
 (forall x,avl_vvalid (avl_child_model g (avl_left g p)) x ->
 ~avl_vvalid (avl_child_model g (avl_right g p)) x).
Proof.
 intros g p key Input Np.
 pose proof (avl_public_root_valid__insert_projection_graft g p (proj1 Input) (proj1 (proj2 (proj2 Input))) Np) as [R Vp].
 pose proof (avl_child_insert_input__insert_projection_graft g p key (avl_left g p) Input Np (or_introl eq_refl)) as IL.
 pose proof (avl_child_insert_input__insert_projection_graft g p key (avl_right g p) Input Np (or_intror eq_refl)) as IR.
 assert (KL:forall x,avl_vvalid (avl_child_model g (avl_left g p)) x -> avl_key_of g x<avl_key_of g p).
 { intros x Hx. pose proof (avl_key_of_member__insert_projection_graft _ x (proj1 IL) Hx) as M.
   pose proof (avl_left_keys_order__insert_projection_graft g p (proj1 Input) Vp _ M) as O.
   rewrite (proj1 (proj2 (strict_child_fields__strict_graph_lifecycle _ _ _ Hx))) in O. exact O. }
 assert (KR:forall x,avl_vvalid (avl_child_model g (avl_right g p)) x -> avl_key_of g p<avl_key_of g x).
 { intros x Hx. pose proof (avl_key_of_member__insert_projection_graft _ x (proj1 IR) Hx) as M.
   pose proof (avl_right_keys_order__insert_projection_graft g p (proj1 Input) Vp _ M) as O.
   rewrite (proj1 (proj2 (strict_child_fields__strict_graph_lifecycle _ _ _ Hx))) in O. exact O. }
 split; [intro H; specialize (KL p H); lia|]. split; [intro H; specialize (KR p H); lia|].
 intros x Hx Hy. specialize (KL x Hx). specialize (KR x Hy). lia.
Qed.
Lemma strict_key_present_iff__strict_graph_lifecycle : forall g key,
 avl_tree_valid g -> (strict_key_present g key <-> In key (avl_keys g)).
Proof.
 intros g key V. split.
 - intros [x [Hx E]]. rewrite <-E. apply avl_key_of_member__insert_projection_graft; auto.
 - unfold avl_keys. intros H. apply in_map_iff in H as [x [E M]].
   exists x. split; [apply (strict_valid_nodes__strict_graph_lifecycle g V); exact M|exact E].
Qed.
Lemma strict_same_root_height__strict_graph_lifecycle : forall a b,
 avl_tree_valid a -> strict_same_graph a b ->
 avl_child_height a (avl_root a)=avl_child_height b (avl_root b).
Proof.
 intros a b Va [R [P [D F]]]. rewrite <-R.
 destruct (avl_root a) as [p|] eqn:Root; [|reflexivity].
 simpl. pose proof (GraphLib.examples.bst.root_valid _ (GraphLib.examples.bst.bst_binary_tree _ (proj1 Va)) p Root) as Vp.
 exact (proj1 (proj2 (F p Vp))).
Qed.
Lemma strict_parent_identity__strict_graph_lifecycle : forall g p key l r,
 avl_insert_input g p key -> p<>0 ->
 strict_same_graph (avl_child_model g (avl_left g p)) l ->
 strict_same_graph (avl_child_model g (avl_right g p)) r ->
 strict_same_graph g (avl_join_model p (avl_key_of g p) l r).
Proof.
 intros g p key l r Input Np SL SR.
 pose proof SL as [RL [PL [DL FL]]].
 pose proof SR as [RR [PR [DR FR]]].
 pose proof (avl_public_root_valid__insert_projection_graft g p (proj1 Input) (proj1 (proj2 (proj2 Input))) Np) as [Root Vp].
 pose proof (strict_parent_regions__strict_graph_lifecycle g p key Input Np) as [NL [NR DJ]].
 pose proof (avl_child_insert_input__insert_projection_graft g p key (avl_left g p) Input Np (or_introl eq_refl)) as IL.
 pose proof (avl_child_insert_input__insert_projection_graft g p key (avl_right g p) Input Np (or_intror eq_refl)) as IR.
 assert (HL:avl_child_height l (avl_root l)=avl_child_height g (avl_left g p)).
 { rewrite <-(strict_same_root_height__strict_graph_lifecycle _ _ (proj1 IL) SL).
   exact (proj2 (avl_child_root__insert_projection_graft g (avl_left g p))). }
 assert (HR:avl_child_height r (avl_root r)=avl_child_height g (avl_right g p)).
 { rewrite <-(strict_same_root_height__strict_graph_lifecycle _ _ (proj1 IR) SR).
   exact (proj2 (avl_child_root__insert_projection_graft g (avl_right g p))). }
 split; [exact Root|]. split.
 - etransitivity.
   + exact (avl_parent_nodes__predecessor_graft g p (proj1 Input) (proj1 (proj2 (proj2 Input))) Np).
   + apply perm_skip. apply Permutation_app; assumption.
 - split.
   + intro x. rewrite (strict_parent_domain__strict_graph_lifecycle g p key Input Np x).
     change (x=p \/ avl_vvalid (avl_child_model g (avl_left g p)) x \/ avl_vvalid (avl_child_model g (avl_right g p)) x <->
       x=p \/ avl_vvalid l x \/ avl_vvalid r x).
     rewrite DL,DR. reflexivity.
   + intros x Hx.
     destruct (proj1 (strict_parent_domain__strict_graph_lifecycle g p key Input Np x) Hx) as [E|[VL|VR]].
     * subst x. pose proof (avl_join_root_fields__insert_projection_graft p (avl_key_of g p) l r) as [L [R [K H]]].
       split; [symmetry; exact K|]. split.
       -- rewrite H,HL,HR. exact (proj2 (proj1 (proj2 (proj1 Input)) p Vp)).
       -- split; [rewrite L,<-RL|rewrite R,<-RR]; symmetry; apply (proj1 (avl_child_root__insert_projection_graft _ _)).
     * assert (Nx:x<>p) by (intro E; subst x; contradiction).
       pose proof (avl_join_left_fields__insert_projection_graft p (avl_key_of g p) l r x Nx (proj1 (DL x) VL)) as [L [R [K H]]].
       pose proof (strict_child_fields__strict_graph_lifecycle _ _ _ VL) as [_ [CK [CH [CL CR]]]].
       pose proof (FL x VL) as [FK [FH [FLL FRR]]].
       repeat split; congruence.
     * assert (Nx:x<>p) by (intro E; subst x; contradiction).
       assert (Nlx:~avl_vvalid l x) by (intro V; apply (DJ x (proj2 (DL x) V)); exact VR).
       pose proof (avl_join_right_fields__insert_projection_graft p (avl_key_of g p) l r x Nx Nlx) as [L [R [K H]]].
       pose proof (strict_child_fields__strict_graph_lifecycle _ _ _ VR) as [_ [CK [CH [CL CR]]]].
       pose proof (FR x VR) as [FK [FH [FLL FRR]]].
       repeat split; congruence.
Qed.
Lemma strict_allocation_domain__strict_graph_lifecycle : forall a b key,
 avl_tree_valid a -> avl_tree_valid b ->
 (forall x,avl_vvalid a x -> avl_key_of b x=avl_key_of a x) ->
 ((strict_key_present a key /\ (forall x,avl_vvalid b x <-> avl_vvalid a x)) \/
 (~strict_key_present a key /\ exists n,n<>0 /\ ~avl_vvalid a n /\
   (forall x,avl_vvalid b x <-> x=n \/ avl_vvalid a x) /\ avl_key_of b n=key)) ->
 strict_allocation_effect a b key.
Proof.
 intros a b key Va Vb K [Old|New].
 - destruct Old as [Present D]. left. split; [exact Present|]. split.
   + apply NoDup_Permutation.
     * exact (GraphLib.examples.bst.listV_NoDup _ (GraphLib.examples.bst.bst_binary_tree _ (proj1 Vb))).
     * exact (GraphLib.examples.bst.listV_NoDup _ (GraphLib.examples.bst.bst_binary_tree _ (proj1 Va))).
     * intro x. rewrite <-(strict_valid_nodes__strict_graph_lifecycle b Vb),<-(strict_valid_nodes__strict_graph_lifecycle a Va). apply D.
   + auto.
 - destruct New as [Absent [n [Nn [Fresh [D Kn]]]]].
   right. split; [exact Absent|]. exists n. split; [exact Nn|]. split; [exact Fresh|]. split.
   + apply NoDup_Permutation.
     * exact (GraphLib.examples.bst.listV_NoDup _ (GraphLib.examples.bst.bst_binary_tree _ (proj1 Vb))).
     * constructor.
       -- rewrite <-(strict_valid_nodes__strict_graph_lifecycle a Va). exact Fresh.
       -- exact (GraphLib.examples.bst.listV_NoDup _ (GraphLib.examples.bst.bst_binary_tree _ (proj1 Va))).
     * intro x. rewrite <-(strict_valid_nodes__strict_graph_lifecycle b Vb).
       simpl. rewrite <-(strict_valid_nodes__strict_graph_lifecycle a Va),D. intuition congruence.
   + auto.
Qed.
Lemma strict_join_old_keys__strict_graph_lifecycle : forall g p key l r,
 avl_insert_input g p key -> p<>0 ->
 ~avl_vvalid l p -> ~avl_vvalid r p ->
 (forall x,avl_vvalid l x -> ~avl_vvalid r x) ->
 (forall x,avl_vvalid (avl_child_model g (avl_left g p)) x ->
   avl_vvalid l x /\ avl_key_of l x=avl_key_of g x) ->
 (forall x,avl_vvalid (avl_child_model g (avl_right g p)) x ->
   avl_vvalid r x /\ avl_key_of r x=avl_key_of g x) ->
 forall x,avl_vvalid g x ->
 avl_key_of (avl_join_model p (avl_key_of g p) l r) x=avl_key_of g x.
Proof.
 intros g p key l r Input Np NL NR DJ KL KR x Vx.
 destruct (proj1 (strict_parent_domain__strict_graph_lifecycle g p key Input Np x) Vx) as [E|[VL|VR]].
 - subst x. exact (proj1 (proj2 (proj2 (avl_join_root_fields__insert_projection_graft _ _ _ _)))).
 - destruct (KL x VL) as [V K].
   assert (N:x<>p) by (intro E; subst x; contradiction).
   rewrite (proj1 (proj2 (proj2 (avl_join_left_fields__insert_projection_graft _ _ _ _ x N V)))). exact K.
 - destruct (KR x VR) as [V K].
   assert (N:x<>p) by (intro E; subst x; contradiction).
   assert (NoL:~avl_vvalid l x) by (intro H; exact (DJ x H V)).
   rewrite (proj1 (proj2 (proj2 (avl_join_right_fields__insert_projection_graft _ _ _ _ x N NoL)))). exact K.
Qed.
Lemma strict_success_right_pending__strict_graph_lifecycle : forall g p key r ret,
 avl_insert_input g p key -> p<>0 -> avl_key_of g p<key ->
 strict_insert_outcome (avl_child_model g (avl_right g p)) r key ret -> ret<>0 ->
 ~avl_vvalid r p ->
 (forall x,avl_vvalid (avl_child_model g (avl_left g p)) x -> ~avl_vvalid r x) ->
 strict_insert_pending g (avl_join_model p (avl_key_of g p) (avl_child_model g (avl_left g p)) r) key p.
Proof.
 intros g p key r ret Input Np Compare Outcome Nret Nr DJ.
 destruct Outcome as [[Z _]|[Success [Allocation Duplicate]]]; [contradiction|].
 pose proof Success as [[_ [Gr KeysR]] [_ [RootR [BoundR GrowthR]]]].
 pose proof (avl_gvalid_tree_valid r Gr) as Vr.
 pose proof (avl_child_insert_input__insert_projection_graft g p key (avl_left g p) Input Np (or_introl eq_refl)) as IL.
 pose proof (avl_child_insert_input__insert_projection_graft g p key (avl_right g p) Input Np (or_intror eq_refl)) as IR.
 pose proof (avl_public_root_valid__insert_projection_graft g p (proj1 Input) (proj1 (proj2 (proj2 Input))) Np) as [Root Vp].
 pose proof (strict_parent_regions__strict_graph_lifecycle g p key Input Np) as [Nl [Nor OldDJ]].
 assert (KL:forall x,avl_vvalid (avl_child_model g (avl_left g p)) x ->
   avl_key_of (avl_child_model g (avl_left g p)) x<avl_key_of g p).
 { intros x Hx. apply (avl_left_keys_order__insert_projection_graft g p (proj1 Input) Vp).
   apply avl_key_of_member__insert_projection_graft; [exact (proj1 IL)|exact Hx]. }
 assert (KR:forall x,avl_vvalid r x -> avl_key_of g p<avl_key_of r x).
 { intros x Hx. pose proof (avl_key_of_member__insert_projection_graft r x Vr Hx) as M.
   apply KeysR in M as [E|M]; [lia|].
   exact (avl_right_keys_order__insert_projection_graft g p (proj1 Input) Vp _ M). }
 assert (Keys:forall value,(value=avl_key_of g p \/
   In value (avl_keys (avl_child_model g (avl_left g p))) \/ In value (avl_keys r)) <->
   value=key \/ In value (avl_keys g)).
 { intro value. rewrite KeysR.
   pose proof (avl_parent_keys__insert_projection_graft g p (proj1 Input) (proj1 (proj2 Input)) (proj1 (proj2 (proj2 Input))) Np value).
   tauto. }
 assert (Growth:
   avl_child_height (avl_child_model g (avl_left g p)) (avl_root (avl_child_model g (avl_left g p)))=avl_child_height g (avl_left g p) /\ (avl_child_height r (avl_root r)=avl_child_height g (avl_right g p) \/
    avl_child_height r (avl_root r)=avl_child_height g (avl_right g p)+1)).
 { split; [exact (proj2 (avl_child_root__insert_projection_graft _ _))|].
   rewrite (proj2 (avl_child_root__insert_projection_graft _ _)) in GrowthR. exact GrowthR. }
 pose proof (avl_join_pending__insert_projection_graft g p key _ r Input Np
   (proj1 IL) Vr (proj1 (proj2 IL)) (proj2 (proj1 (avl_gvalid_tree_valid_iff r) Gr))
   Nl Nr DJ KL KR Keys (or_introl Growth)) as Pending.
 assert (KeepR:forall x,avl_vvalid (avl_child_model g (avl_right g p)) x ->
   avl_vvalid r x /\ avl_key_of r x=avl_key_of g x).
 { intros x Hx. pose proof (proj1 (proj2 (strict_child_fields__strict_graph_lifecycle _ _ _ Hx))) as K.
   destruct Allocation as [[_ [_ [D F]]]|[_ [n [_ [_ [_ [D [_ F]]]]]]]]; split.
   - apply D; exact Hx.
   - rewrite F by exact Hx. exact K.
   - apply D. auto.
   - rewrite F by exact Hx. exact K. }
 assert (KeepL:forall x,avl_vvalid (avl_child_model g (avl_left g p)) x ->
   avl_vvalid (avl_child_model g (avl_left g p)) x /\ avl_key_of (avl_child_model g (avl_left g p)) x=avl_key_of g x).
 { intros x Hx. split; [exact Hx|exact (proj1 (proj2 (strict_child_fields__strict_graph_lifecycle _ _ _ Hx)))]. }
 assert (PK:strict_key_present g key <-> strict_key_present (avl_child_model g (avl_right g p)) key).
 { rewrite (strict_key_present_iff__strict_graph_lifecycle g key (proj1 Input)),
     (strict_key_present_iff__strict_graph_lifecycle _ key (proj1 IR)).
   rewrite (avl_parent_keys__insert_projection_graft g p (proj1 Input) (proj1 (proj2 Input)) (proj1 (proj2 (proj2 Input))) Np key).
   split; [|tauto]. intros [E|[M|M]]; [lia| |exact M].
   pose proof (avl_left_keys_order__insert_projection_graft g p (proj1 Input) Vp key M). lia. }
 split; [exact Pending|]. split.
 - apply strict_allocation_domain__strict_graph_lifecycle; [exact (proj1 Input)|exact (proj1 (proj2 (proj2 (proj2 Pending))))| |].
   + exact (strict_join_old_keys__strict_graph_lifecycle g p key _ r Input Np Nl Nr DJ KeepL KeepR).
   + destruct Allocation as [[Present [_ [D F]]]|[Absent [n [Nn [Fresh [_ [D [Kn F]]]]]]]].
     * left. split; [apply PK; exact Present|].
       intro x. change (x=p \/ avl_vvalid (avl_child_model g (avl_left g p)) x \/ avl_vvalid r x <-> avl_vvalid g x).
       rewrite D. symmetry; apply strict_parent_domain__strict_graph_lifecycle with (key:=key); auto.
     * assert (Vn:avl_vvalid r n) by (apply D; auto).
       assert (Nnp:n<>p) by (intro E; subst n; contradiction).
       assert (Nln:~avl_vvalid (avl_child_model g (avl_left g p)) n) by (intro H; exact (DJ n H Vn)).
       right. split; [intro H; apply Absent; apply PK; exact H|].
       exists n. split; [exact Nn|]. split.
       -- intro H. apply (strict_parent_domain__strict_graph_lifecycle g p key Input Np) in H. tauto.
       -- split.
          ++ intro x. change (x=p \/ avl_vvalid (avl_child_model g (avl_left g p)) x \/ avl_vvalid r x <-> x=n \/ avl_vvalid g x).
             rewrite D,(strict_parent_domain__strict_graph_lifecycle g p key Input Np). tauto.
          ++ rewrite (proj1 (proj2 (proj2 (avl_join_right_fields__insert_projection_graft p (avl_key_of g p) _ r n Nnp Nln)))). exact Kn.
 - intro Present. apply strict_parent_identity__strict_graph_lifecycle with (key:=key); auto.
   + apply strict_same_graph_refl__strict_graph_lifecycle.
   + apply Duplicate. apply PK; exact Present.
Qed.
Lemma strict_success_left_pending__strict_graph_lifecycle : forall g p key l ret,
 avl_insert_input g p key -> p<>0 -> key<avl_key_of g p ->
 strict_insert_outcome (avl_child_model g (avl_left g p)) l key ret -> ret<>0 ->
 ~avl_vvalid l p ->
 (forall x,avl_vvalid (avl_child_model g (avl_right g p)) x -> ~avl_vvalid l x) ->
 strict_insert_pending g (avl_join_model p (avl_key_of g p) l (avl_child_model g (avl_right g p))) key p.
Proof.
 intros g p key l ret Input Np Compare Outcome Nret Nr DJ.
 destruct Outcome as [[Z _]|[Success [Allocation Duplicate]]]; [contradiction|].
 pose proof Success as [[_ [Gr KeysR]] [_ [RootR [BoundR GrowthR]]]].
 pose proof (avl_gvalid_tree_valid l Gr) as Vr.
 pose proof (avl_child_insert_input__insert_projection_graft g p key (avl_right g p) Input Np (or_intror eq_refl)) as IL.
 pose proof (avl_child_insert_input__insert_projection_graft g p key (avl_left g p) Input Np (or_introl eq_refl)) as IR.
 pose proof (avl_public_root_valid__insert_projection_graft g p (proj1 Input) (proj1 (proj2 (proj2 Input))) Np) as [Root Vp].
 pose proof (strict_parent_regions__strict_graph_lifecycle g p key Input Np) as [Nor [Nl OldDJ]].
 assert (KL:forall x,avl_vvalid (avl_child_model g (avl_right g p)) x ->
   avl_key_of g p<avl_key_of (avl_child_model g (avl_right g p)) x).
 { intros x Hx. apply (avl_right_keys_order__insert_projection_graft g p (proj1 Input) Vp).
   apply avl_key_of_member__insert_projection_graft; [exact (proj1 IL)|exact Hx]. }
 assert (KR:forall x,avl_vvalid l x -> avl_key_of l x<avl_key_of g p).
 { intros x Hx. pose proof (avl_key_of_member__insert_projection_graft l x Vr Hx) as M.
   apply KeysR in M as [E|M]; [lia|].
   exact (avl_left_keys_order__insert_projection_graft g p (proj1 Input) Vp _ M). }
 assert (Keys:forall value,(value=avl_key_of g p \/
   In value (avl_keys l) \/ In value (avl_keys (avl_child_model g (avl_right g p)))) <->
   value=key \/ In value (avl_keys g)).
 { intro value. rewrite KeysR.
   pose proof (avl_parent_keys__insert_projection_graft g p (proj1 Input) (proj1 (proj2 Input)) (proj1 (proj2 (proj2 Input))) Np value).
   tauto. }
 assert (Growth:
   avl_child_height (avl_child_model g (avl_right g p)) (avl_root (avl_child_model g (avl_right g p)))=avl_child_height g (avl_right g p) /\ (avl_child_height l (avl_root l)=avl_child_height g (avl_left g p) \/
    avl_child_height l (avl_root l)=avl_child_height g (avl_left g p)+1)).
 { split; [exact (proj2 (avl_child_root__insert_projection_graft _ _))|].
   rewrite (proj2 (avl_child_root__insert_projection_graft _ _)) in GrowthR. exact GrowthR. }
 pose proof (avl_join_pending__insert_projection_graft g p key l _ Input Np
   Vr (proj1 IL) (proj2 (proj1 (avl_gvalid_tree_valid_iff l) Gr)) (proj1 (proj2 IL))
   Nr Nl (fun x H J=>DJ x J H) KR KL Keys (or_intror Growth)) as Pending.
 assert (KeepR:forall x,avl_vvalid (avl_child_model g (avl_left g p)) x ->
   avl_vvalid l x /\ avl_key_of l x=avl_key_of g x).
 { intros x Hx. pose proof (proj1 (proj2 (strict_child_fields__strict_graph_lifecycle _ _ _ Hx))) as K.
   destruct Allocation as [[_ [_ [D F]]]|[_ [n [_ [_ [_ [D [_ F]]]]]]]]; split.
   - apply D; exact Hx.
   - rewrite F by exact Hx. exact K.
   - apply D. auto.
   - rewrite F by exact Hx. exact K. }
 assert (KeepL:forall x,avl_vvalid (avl_child_model g (avl_right g p)) x ->
   avl_vvalid (avl_child_model g (avl_right g p)) x /\ avl_key_of (avl_child_model g (avl_right g p)) x=avl_key_of g x).
 { intros x Hx. split; [exact Hx|exact (proj1 (proj2 (strict_child_fields__strict_graph_lifecycle _ _ _ Hx)))]. }
 assert (PK:strict_key_present g key <-> strict_key_present (avl_child_model g (avl_left g p)) key).
 { rewrite (strict_key_present_iff__strict_graph_lifecycle g key (proj1 Input)),
     (strict_key_present_iff__strict_graph_lifecycle _ key (proj1 IR)).
   rewrite (avl_parent_keys__insert_projection_graft g p (proj1 Input) (proj1 (proj2 Input)) (proj1 (proj2 (proj2 Input))) Np key).
   split; [|tauto]. intros [E|[M|M]]; [lia|exact M|].
   pose proof (avl_right_keys_order__insert_projection_graft g p (proj1 Input) Vp key M). lia. }
 split; [exact Pending|]. split.
 - apply strict_allocation_domain__strict_graph_lifecycle; [exact (proj1 Input)|exact (proj1 (proj2 (proj2 (proj2 Pending))))| |].
   + exact (strict_join_old_keys__strict_graph_lifecycle g p key l _ Input Np Nr Nl (fun x H J=>DJ x J H) KeepR KeepL).
   + destruct Allocation as [[Present [_ [D F]]]|[Absent [n [Nn [Fresh [_ [D [Kn F]]]]]]]].
     * left. split; [apply PK; exact Present|].
       intro x. change (x=p \/ avl_vvalid l x \/ avl_vvalid (avl_child_model g (avl_right g p)) x <-> avl_vvalid g x).
       rewrite D,(strict_parent_domain__strict_graph_lifecycle g p key Input Np). tauto.
     * assert (Vn:avl_vvalid l n) by (apply D; auto).
       assert (Nnp:n<>p) by (intro E; subst n; contradiction).
       assert (Nln:~avl_vvalid (avl_child_model g (avl_right g p)) n) by (intro H; exact (DJ n H Vn)).
       right. split; [intro H; apply Absent; apply PK; exact H|].
       exists n. split; [exact Nn|]. split.
       -- intro H. apply (strict_parent_domain__strict_graph_lifecycle g p key Input Np) in H. tauto.
       -- split.
          ++ intro x. change (x=p \/ avl_vvalid l x \/ avl_vvalid (avl_child_model g (avl_right g p)) x <-> x=n \/ avl_vvalid g x).
             rewrite D,(strict_parent_domain__strict_graph_lifecycle g p key Input Np). tauto.
          ++ rewrite (proj1 (proj2 (proj2 (avl_join_left_fields__insert_projection_graft p (avl_key_of g p) l _ n Nnp Vn)))). exact Kn.
 - intro Present. apply strict_parent_identity__strict_graph_lifecycle with (key:=key); auto.
   + apply Duplicate. apply PK; exact Present.
   + apply strict_same_graph_refl__strict_graph_lifecycle.
Qed.
Lemma strict_path_valid__strict_graph_lifecycle : forall g key x,
 avl_tree_valid g -> strict_search_path g key x -> avl_vvalid g x.
Proof.
 intros g key x V Path. induction Path as [p Root|p c Path IH Compare Edge|p c Path IH Compare Edge].
 - exact (GraphLib.examples.bst.root_valid _ (GraphLib.examples.bst.bst_binary_tree _ (proj1 V)) p Root).
 - exact (avl_graph_child_valid__root_and_factor_setup g p c (proj1 V) IH (or_introl Edge)).
 - exact (avl_graph_child_valid__root_and_factor_setup g p c (proj1 V) IH (or_intror Edge)).
Qed.
Lemma strict_child_path_extend__strict_graph_lifecycle : forall g c key,
 avl_tree_valid (avl_child_model g c) ->
 (forall s,c=Some s -> strict_search_path g key s) ->
 forall x,strict_search_path (avl_child_model g c) key x -> strict_search_path g key x.
Proof.
 intros g c key V Seeds x Path.
 induction Path as [p Root|p z Path IH Compare Edge|p z Path IH Compare Edge].
 - apply Seeds. rewrite <-(proj1 (avl_child_root__insert_projection_graft g c)). exact Root.
 - pose proof (strict_child_fields__strict_graph_lifecycle g c p (strict_path_valid__strict_graph_lifecycle _ _ _ V Path)) as [_ [K [_ [L R]]]].
   apply (strict_path_left g key p z IH); congruence.
 - pose proof (strict_child_fields__strict_graph_lifecycle g c p (strict_path_valid__strict_graph_lifecycle _ _ _ V Path)) as [_ [K [_ [L R]]]].
   apply (strict_path_right g key p z IH); congruence.
Qed.
Lemma strict_right_path_restrict__strict_graph_lifecycle : forall g p key,
 avl_insert_input g p key -> p<>0 -> avl_key_of g p<key ->
 forall x,strict_search_path g key x ->
 x=p \/ strict_search_path (avl_child_model g (avl_right g p)) key x.
Proof.
 intros g p key Input Np Compare x Path.
 pose proof (avl_public_root_valid__insert_projection_graft g p (proj1 Input) (proj1 (proj2 (proj2 Input))) Np) as [Root Vp].
 pose proof (avl_child_insert_input__insert_projection_graft g p key (avl_right g p) Input Np (or_intror eq_refl)) as IR.
 induction Path as [q R|q z Path IH C Edge|q z Path IH C Edge].
 - left. congruence.
 - destruct IH as [E|P]; [subst q; lia|]. right.
   pose proof (strict_child_fields__strict_graph_lifecycle _ _ _ (strict_path_valid__strict_graph_lifecycle _ _ _ (proj1 IR) P)) as [_ [K [_ [L R]]]].
   apply (strict_path_left _ key q z P); congruence.
 - right. destruct IH as [E|P].
   + subst q. apply strict_path_root. rewrite (proj1 (avl_child_root__insert_projection_graft _ _)). exact Edge.
   + pose proof (strict_child_fields__strict_graph_lifecycle _ _ _ (strict_path_valid__strict_graph_lifecycle _ _ _ (proj1 IR) P)) as [_ [K [_ [L R]]]].
     apply (strict_path_right _ key q z P); congruence.
Qed.
Lemma strict_left_path_restrict__strict_graph_lifecycle : forall g p key,
 avl_insert_input g p key -> p<>0 -> key<avl_key_of g p ->
 forall x,strict_search_path g key x ->
 x=p \/ strict_search_path (avl_child_model g (avl_left g p)) key x.
Proof.
 intros g p key Input Np Compare x Path.
 pose proof (avl_public_root_valid__insert_projection_graft g p (proj1 Input) (proj1 (proj2 (proj2 Input))) Np) as [Root Vp].
 pose proof (avl_child_insert_input__insert_projection_graft g p key (avl_left g p) Input Np (or_introl eq_refl)) as IR.
 induction Path as [q R|q z Path IH C Edge|q z Path IH C Edge].
 - left. congruence.
 - right. destruct IH as [E|P].
   + subst q. apply strict_path_root. rewrite (proj1 (avl_child_root__insert_projection_graft _ _)). exact Edge.
   + pose proof (strict_child_fields__strict_graph_lifecycle _ _ _ (strict_path_valid__strict_graph_lifecycle _ _ _ (proj1 IR) P)) as [_ [K [_ [L R]]]].
     apply (strict_path_left _ key q z P); congruence.
 - destruct IH as [E|P]; [subst q; lia|]. right.
   pose proof (strict_child_fields__strict_graph_lifecycle _ _ _ (strict_path_valid__strict_graph_lifecycle _ _ _ (proj1 IR) P)) as [_ [K [_ [L R]]]].
   apply (strict_path_right _ key q z P); congruence.
Qed.
Lemma strict_failure_graft_model__strict_graph_lifecycle : forall g p key failed c d lp rp,
 avl_insert_input g p key -> p<>0 ->
 ((key<avl_key_of g p /\ c=avl_left g p /\ d=avl_right g p /\ lp=None /\ rp=avl_right g p) \/
  (avl_key_of g p<key /\ c=avl_right g p /\ d=avl_left g p /\ lp=avl_left g p /\ rp=None)) ->
 strict_insert_outcome (avl_child_model g c) failed key 0 ->
 exists final,
 strict_insert_outcome g final key 0
 /\ avl_nodes final=avl_nodes g
 /\ avl_left final p=lp /\ avl_right final p=rp
 /\ (forall x,x<>p -> avl_vvalid (avl_child_model g c) x ->
      avl_left final x=avl_left failed x /\ avl_right final x=avl_right failed x)
 /\ (forall x,x<>p -> ~avl_vvalid (avl_child_model g c) x ->
      avl_left final x=avl_left g x /\ avl_right final x=avl_right g x).
Proof.
 intros g p key failed c d lp rp Input Np Choice Outcome.
 destruct Outcome as [[_ [Absent Failure]]|[Success _]].
 2: { destruct Success as [_ [N _]]. contradiction. }
 pose proof Failure as [RF [PF [DF FF]]].
 assert (Side:c=avl_left g p \/ c=avl_right g p) by (destruct Choice as [[? [? ?]]|[? [? ?]]]; auto).
 pose proof (avl_child_insert_input__insert_projection_graft g p key c Input Np Side) as IC.
 pose proof (avl_public_root_valid__insert_projection_graft g p (proj1 Input) (proj1 (proj2 (proj2 Input))) Np) as [Root Vp].
 pose proof (strict_parent_regions__strict_graph_lifecycle g p key Input Np) as [NL [NR DJ]].
 assert (NC:~avl_vvalid (avl_child_model g c) p) by (destruct Side; subst c; auto).
 assert (Restrict:forall x,strict_search_path g key x -> x=p \/ strict_search_path (avl_child_model g c) key x).
 { destruct Choice as [[C [E _]]|[C [E _]]]; subst c; intros x H.
   - exact (strict_left_path_restrict__strict_graph_lifecycle g p key Input Np C x H).
   - exact (strict_right_path_restrict__strict_graph_lifecycle g p key Input Np C x H). }
 assert (Extend:forall x,strict_search_path (avl_child_model g c) key x -> strict_search_path g key x).
 { apply strict_child_path_extend__strict_graph_lifecycle; [exact (proj1 IC)|].
   intros z E. destruct Choice as [[C [Ec _]]|[C [Ec _]]]; subst c.
   - exact (strict_path_left g key p z (strict_path_root g key p Root) C E).
   - exact (strict_path_right g key p z (strict_path_root g key p Root) C E). }
 assert (NotPresent:~strict_key_present g key).
 { intro H. apply (proj1 (strict_key_present_iff__strict_graph_lifecycle g key (proj1 Input))) in H.
   apply (avl_parent_keys__insert_projection_graft g p (proj1 Input) (proj1 (proj2 Input)) (proj1 (proj2 (proj2 Input))) Np) in H.
   destruct Choice as [[C [Ec _]]|[C [Ec _]]]; subst c; destruct H as [E|[H|H]].
   - lia.
   - apply Absent. apply (proj2 (strict_key_present_iff__strict_graph_lifecycle _ key (proj1 IC))). exact H.
   - pose proof (avl_right_keys_order__insert_projection_graft g p (proj1 Input) Vp key H). lia.
   - lia.
   - pose proof (avl_left_keys_order__insert_projection_graft g p (proj1 Input) Vp key H). lia.
   - apply Absent. apply (proj2 (strict_key_present_iff__strict_graph_lifecycle _ key (proj1 IC))). exact H. }
 set (final:={| avl_bst:={| GraphLib.examples.bst.bst_tree:=
   {| GraphLib.examples.bst.vset:=avl_vvalid g;
      GraphLib.examples.bst.theroot:=None;
      GraphLib.examples.bst.left_child:=fun x=>if Z.eq_dec x p then lp else
        if excluded_middle_informative (avl_vvalid (avl_child_model g c) x) then avl_left failed x else avl_left g x;
      GraphLib.examples.bst.right_child:=fun x=>if Z.eq_dec x p then rp else
        if excluded_middle_informative (avl_vvalid (avl_child_model g c) x) then avl_right failed x else avl_right g x;
      GraphLib.examples.bst.listV:=avl_nodes g |};
      GraphLib.examples.bst.bst_key:=avl_key_of g |};
      avl_height_of:=avl_height_of g |}).
 assert (RootEdges:avl_left final p=lp /\ avl_right final p=rp).
 { unfold avl_left,avl_right,final; simpl. destruct (Z.eq_dec p p); auto; contradiction. }
 assert (ChildEdges:forall x,x<>p -> avl_vvalid (avl_child_model g c) x ->
   avl_left final x=avl_left failed x /\ avl_right final x=avl_right failed x).
 { intros x N V. unfold avl_left,avl_right,final; simpl.
   destruct (Z.eq_dec x p); [contradiction|].
   destruct (excluded_middle_informative (avl_vvalid (avl_child_model g c) x)); auto; contradiction. }
 assert (OtherEdges:forall x,x<>p -> ~avl_vvalid (avl_child_model g c) x ->
   avl_left final x=avl_left g x /\ avl_right final x=avl_right g x).
 { intros x N V. unfold avl_left,avl_right,final; simpl.
   destruct (Z.eq_dec x p); [contradiction|].
   destruct (excluded_middle_informative (avl_vvalid (avl_child_model g c) x)); auto; contradiction. }
 assert (Effect:strict_failure_effect g final key).
 { split; [reflexivity|]. split; [reflexivity|]. split; [intro x; reflexivity|].
   intros x Hx. split; [reflexivity|]. split; [reflexivity|].
   destruct (Z.eq_dec x p) as [E|N].
   - subst x. destruct RootEdges as [L R].
     assert (Path:strict_search_path g key p) by (apply strict_path_root; exact Root).
     destruct Choice as [Choice|Choice]; destruct Choice as [C [Ec [Ed [EL ER]]]]; subst lp rp; repeat split; intros; try lia; try tauto; assumption.
   - destruct (classic (avl_vvalid (avl_child_model g c) x)) as [VC|NCx].
     + pose proof (FF x VC) as [K [H [L [NLx [R NRx]]]]].
       pose proof (ChildEdges x N VC) as [LE RE].
       pose proof (strict_child_fields__strict_graph_lifecycle _ _ _ VC) as [_ [Key [_ [CL CR]]]].
       assert (Paths:strict_search_path g key x <-> strict_search_path (avl_child_model g c) key x).
       { split; [intro P; specialize (Restrict x P); tauto|apply Extend]. }
       rewrite Key in L,NLx,R,NRx. rewrite CL in NLx. rewrite CR in NRx. rewrite <-Paths in L,NLx,R,NRx.
       rewrite LE,RE. tauto.
     + pose proof (OtherEdges x N NCx) as [LE RE].
       assert (NoPath:~strict_search_path g key x).
       { intro P. destruct (Restrict x P) as [E|P2]; [contradiction|].
         apply NCx. eapply strict_path_valid__strict_graph_lifecycle; [exact (proj1 IC)|exact P2]. }
       rewrite LE,RE. repeat split; intros; tauto. }
 exists final. split; [left; auto|]. split; [reflexivity|].
 split; [exact (proj1 RootEdges)|]. split; [exact (proj2 RootEdges)|]. auto.
Qed.
