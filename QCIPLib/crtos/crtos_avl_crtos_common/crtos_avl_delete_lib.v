Require Export QCIPLib.crtos.crtos_avl_crtos_common.crtos_avl_insert_lib.

Require Import Coq.ZArith.ZArith.

Local Open Scope Z_scope.

(* The cursor dominates all left-subtree vertices outside its remaining
   subtree. At a right-null cursor this yields the predecessor maximum. *)
Definition crtos_delete_cursor (g : avl_model) (root cursor : Z) : Prop :=
  avl_vvalid g cursor /\ cursor <> 0 /\
  avl_reachable g (avl_ptr_of (avl_left g root)) cursor /\
  (forall x, avl_reachable g (avl_ptr_of (avl_left g root)) x ->
     ~ avl_reachable g cursor x -> avl_key_of g x <= avl_key_of g cursor).

(* This is exactly the strengthened low postcondition's absent-key clause.
   Keeping the pure disjunction inside Prop avoids existential branch picking
   by the symbolic executor; no behavior is abstracted in the high contract. *)
Definition crtos_delete_absent_identity (before after : avl_model) (key : Z) : Prop :=
  (exists x, avl_vvalid before x /\ avl_key_of before x = key) \/
  crtos_graph_equiv after before.

(* A logical AVL deletion prefix, with the physical root cache awaiting the
   already-verified height update. No algorithm or execution is defined. *)
Definition crtos_delete_repair (before raw : avl_model) (key p : Z) : Prop :=
  crtos_update_ready raw p /\
  crtos_balance_ready (crtos_update_height raw p) p /\
  avl_delete_pending before (crtos_update_height raw p) key p /\
  crtos_delete_absent_identity before raw key.

Require Import Coq.Lists.List.
Require Import Coq.micromega.Lia.
Require Import Coq.Logic.Classical_Prop.
Require Import Coq.Sorting.Permutation.
Require Import Coq.Logic.ClassicalChoice.
Lemma structural_delete_input__cursor_entry_refinement : forall g p k,
 avl_gvalid g -> p=avl_ptr_of (avl_root g) -> (-2147483648)<=k<=2147483647 ->
 (forall x,avl_vvalid g x -> (-2147483648)<=avl_key_of g x<=2147483647) ->
 avl_delete_input g p k.
Proof.
 intros g p k G R K Keys. pose proof (avl_gvalid_tree_valid g G) as T.
 assert (B:avl_child_height g (avl_root g)<=2147483647).
 { destruct (avl_root g) as [r|] eqn:E; [|simpl;lia].
   assert (V:avl_vvalid g r).
   { exact (GraphLib.examples.bst.root_valid _ (GraphLib.examples.bst.bst_binary_tree _ (proj1 T)) r E). }
   pose proof (crtos_ready_interval__balance_returns g (-2147483648) 2147483647 T
     ltac:(intros x X N;exact (proj1 (proj2 (proj2 G)) x X))
     ltac:(rewrite E;simpl;pose proof (proj1 (proj2 (proj2 G)) r V);lia) Keys) as H.
   rewrite E in H. change (4*avl_height_of g r<=4294967307) in H. change (avl_height_of g r<=2147483647). lia. }
 unfold avl_delete_input. split;[exact T|]. split;[exact (proj1 (proj2 (proj2 G)))|]. tauto.
Qed.
Lemma cursor_cover__cursor_entry_refinement : forall g p f,
 crtos_delete_cursor g p f ->
 avl_right_spine_cursor_valid g (avl_ptr_of (avl_left g p)) f.
Proof.
 intros g p f [_ [_ [R C]]]. split;[exact R|].
 intros x X. destruct (classic (avl_reachable g f x));[right|left];auto.
Qed.
Lemma cursor_start__cursor_entry_refinement : forall g p,
 avl_tree_valid g -> avl_vvalid g p -> avl_ptr_of (avl_left g p)<>0 ->
 crtos_delete_cursor g p (avl_ptr_of (avl_left g p)).
Proof.
 intros g p T V N. unfold crtos_delete_cursor. split.
 - destruct (avl_left g p) as [l|] eqn:E;[|contradiction]. simpl.
   eapply avl_graph_child_valid__root_and_factor_setup;eauto;exact (proj1 T).
 - split;[exact N|]. split.
   + unfold avl_reachable,GraphLib.examples.bst.bt_path;exists 0%nat;hnf;reflexivity.
   + intros x X F. contradiction.
Qed.
Lemma cursor_step__cursor_entry_refinement : forall g p f,
 avl_tree_valid g -> crtos_delete_cursor g p f ->
 avl_ptr_of (avl_right g f)<>0 ->
 crtos_delete_cursor g p (avl_ptr_of (avl_right g f)).
Proof.
 intros g p f T C N.
 pose proof (avl_right_spine_cursor_step__predecessor_right_spine g
   (avl_ptr_of (avl_left g p)) f T (proj1 C) N
   (cursor_cover__cursor_entry_refinement g p f C)) as [R Cover].
 unfold crtos_delete_cursor. split.
 - destruct (avl_right g f) as [r|] eqn:E;[|contradiction]. simpl.
   eapply avl_graph_child_valid__root_and_factor_setup;[exact (proj1 T)|exact (proj1 C)|right;exact E].
 - split;[exact N|]. split;[exact R|]. intros x X F.
   destruct (Cover x X);[assumption|contradiction].
Qed.
Lemma cursor_exit__cursor_entry_refinement : forall g p k f,
 avl_delete_input g p k -> p<>0 -> crtos_delete_cursor g p f ->
 avl_ptr_of (avl_left g p)<>0 -> avl_ptr_of (avl_right g f)=0 ->
 avl_predecessor_result g p f /\ f<>p.
Proof.
 intros g p k f I N C L Q.
 pose proof (avl_public_root_valid__insert_projection_graft g p (proj1 I)
   (proj1 (proj2 (proj2 I))) N) as [E V].
 assert (P:avl_predecessor_result g p f).
 { eapply avl_predecessor_from_terminal_cursor__predecessor_right_spine;eauto.
   - exact (proj1 I).
   - exact (proj1 C).
   - apply cursor_cover__cursor_entry_refinement;exact C. }
 split;[exact P|].
 destruct P as [_ [Bad|[l [El [R [Vf [Kf M]]]]]]].
 - destruct Bad as [Bad _]. rewrite Bad in L. contradiction.
 - intro F;subst f;lia.
Qed.
Lemma represented_root_nonzero__cursor_entry_refinement : forall g p f,
 avl_tree_valid g -> p=avl_ptr_of (avl_root g) -> avl_vvalid g f -> p<>0.
Proof.
 intros g p f T R V.
 destruct (GraphLib.examples.bst.path_exists _
   (GraphLib.examples.bst.bst_binary_tree _ (proj1 T)) f V) as [r [E Path]].
 change (avl_root g=Some r) in E. rewrite E in R. simpl in R. subst p.
 apply (proj2 (proj2 T) r).
 exact (GraphLib.examples.bst.root_valid _ (GraphLib.examples.bst.bst_binary_tree _ (proj1 T)) r E).
Qed.
Lemma remove_permutation__cursor_entry_refinement : forall x xs ys,
 Permutation xs ys -> Permutation (remove Z.eq_dec x xs) (remove Z.eq_dec x ys).
Proof.
 intros x xs ys P. induction P; simpl.
 - constructor.
 - destruct (Z.eq_dec x x0);auto.
 - destruct (Z.eq_dec x y), (Z.eq_dec x x0);simpl;
     repeat match goal with |- context[Z.eq_dec ?a ?b] => destruct (Z.eq_dec a b) end;
     try congruence;try apply Permutation_refl;apply perm_swap.
 - eapply Permutation_trans;eauto.
Qed.
Lemma child_remainder_partition__cursor_entry_refinement : forall p f xs l r,
 NoDup xs -> Permutation xs (p::l++r) -> In f l ->
 Permutation (remove Z.eq_dec f (remove Z.eq_dec p xs)) (remove Z.eq_dec f l++r).
Proof.
 intros p f xs l r Nd P F.
 assert (N:NoDup (p::l++r)) by (eapply Permutation_NoDup;eauto).
 inversion N as [|p0 lr Notp Nlr];subst.
 assert (Notf:~In f r) by (eapply avl_nodup_append_disjoint__predecessor_graft;eauto).
 pose proof (remove_permutation__cursor_entry_refinement p _ _ P) as Q.
 simpl in Q. destruct (Z.eq_dec p p);[|contradiction].
 rewrite (notin_remove Z.eq_dec (l++r) p Notp) in Q.
 pose proof (remove_permutation__cursor_entry_refinement f _ _ Q) as S.
 rewrite remove_app, (notin_remove Z.eq_dec r f Notf) in S. exact S.
Qed.
Lemma only_child_repair__deletion_reassembly : forall g p c,
 avl_delete_input g p (avl_key_of g p) -> p<>0 -> avl_ptr_of c<>0 ->
 ((avl_left g p=None /\ c=avl_right g p) \/
  (avl_right g p=None /\ c=avl_left g p)) ->
 crtos_delete_repair g (avl_child_model g c) (avl_key_of g p) (avl_ptr_of c).
Proof.
 intros g p c I N C S.
 destruct (avl_only_child_pending__root_and_single_child g p c I N S) as [P B].
 pose proof P as [_ [R [T _]]].
 pose proof (avl_public_root_valid__insert_projection_graft _ _ T R C) as [_ V].

 unfold crtos_delete_repair. split.
 - apply crtos_valid_update_ready__crtos_insert_composition;assumption.
 - rewrite (crtos_valid_update_identity__crtos_insert_composition _ _ T V).
   split.
   + apply crtos_valid_balance_ready__crtos_insert_composition;auto.
     apply avl_gvalid_tree_valid_iff;auto.
   + split.
     * exact P.
     * left. exists p. split;[|reflexivity].
       exact (proj2 (avl_public_root_valid__insert_projection_graft g p (proj1 I) (proj1 (proj2 (proj2 I))) N)).
Qed.
Lemma pending_balance_outcome__deletion_reassembly : forall b u a k p ret,
 avl_delete_pending b u k p -> p<>0 -> crtos_balance_effect u a p ret ->
 avl_delete_outcome b a k ret.
Proof.
 intros b u a k p ret P N E.
 pose proof P as [I [Rp [T [Ready [Safe [Ks [Nd [Ns [Range Drop]]]]]]]]].
 pose proof (avl_public_root_valid__insert_projection_graft u p T Rp N) as [R V].
 destruct (crtos_balance_whole_effect__crtos_insert_composition u a p ret T R N E) as [Ga Ra].
 pose proof E as [_ [_ [_ [Nodes [Dom [Keys [_ [_ [Ht Id]]]]]]]]].
 assert (HU:avl_child_height u (avl_root u)=avl_height_of u p) by (rewrite R;reflexivity).
 assert (HA:avl_child_height a (avl_root a)=avl_height_of a ret) by (rewrite Ra;reflexivity).
 assert (Result:avl_balance_graph_result u a ret).
 { split;[exact Ga|]. split;[exact Nodes|]. split;[exact Keys|].
   split;[rewrite Ra;reflexivity|]. split.
   - intros x X. pose proof (avl_all_heights_root_bound__insert_projection_graft a (avl_gvalid_tree_valid a Ga) x X).
     pose proof (proj1 (proj2 (proj2 (proj2 I)))). lia.
   - lia. }
 apply (avl_delete_pending_balance_outcome__delete_projection_graft b u a k p ret P Result).
 split;[lia|]. intro B.
 destruct (Id (B p V)) as [A Ret]. rewrite A;reflexivity.
Qed.
Lemma delete_subset__deletion_reassembly : forall b a k ret x,
 avl_delete_outcome b a k ret -> avl_vvalid a x -> avl_vvalid b x.
Proof.
 intros b a k ret x O X.
 pose proof O as [[Gb [Ga Keys]] [_ [_ [Nodes _]]]].
 pose proof (proj1 (crtos_valid_domain__crtos_insert_composition a (avl_gvalid_tree_valid a Ga) x) X) as Ia.
 assert (Ib:In x (avl_nodes b)).
 { destruct (classic (In k (avl_keys b))) as [P|P].
   - destruct (proj1 Nodes P) as [f [_ F]]. apply (proj1 (F x)) in Ia;tauto.
   - apply (proj2 Nodes P x);exact Ia. }
 apply (crtos_valid_domain__crtos_insert_composition b (avl_gvalid_tree_valid b Gb) x);exact Ib.
Qed.
Lemma cached_pending_repair__deletion_reassembly : forall b j k p cache,
 avl_delete_pending b j k p -> p<>0 -> avl_root j=Some p ->
 crtos_delete_absent_identity b (avl_with_root_cache j p cache) k ->
 crtos_delete_repair b (avl_with_root_cache j p cache) k p.
Proof.
 intros b j k p cache P N R A.
 pose proof P as [_ [_ [T [Ready _]]]].
 destruct (crtos_cached_ready__crtos_insert_composition j p cache T R N) as [E U].
 unfold crtos_delete_repair. split;[exact U|]. rewrite E.
 split;[|auto].
 destruct Ready as [[Bst [Ht [Nn [Off [Signed [Null Root]]]]]] Bound].
 apply crtos_tree_balance_ready__crtos_insert_composition;auto.
 - exact (GraphLib.examples.bst.root_valid _ (GraphLib.examples.bst.bst_binary_tree _ Bst) p R).
Qed.
Lemma graft_identity_right__deletion_reassembly : forall g p a k,
 avl_delete_input g p k -> p<>0 ->
 crtos_delete_absent_identity (avl_child_model g (avl_right g p)) a k ->
 crtos_delete_absent_identity g
  (crtos_join_cached g p (avl_child_model g (avl_left g p)) a) k.
Proof.
 intros g p a k I N A.
 assert (G:avl_gvalid g) by (apply avl_gvalid_tree_valid_iff;exact (conj (proj1 I) (proj1 (proj2 I)))).
 pose proof (avl_public_root_valid__insert_projection_graft g p (proj1 I) (proj1 (proj2 (proj2 I))) N) as [R V].
 destruct A as [[x [X K]]|E].
 - left. exists x. pose proof (crtos_child_fields__crtos_insert_composition g (avl_right g p) x X) as [W [Key _]]. split;[exact W|congruence].
 - right. eapply crtos_equiv_trans__crtos_insert_composition.
   + apply crtos_cached_join_equiv__crtos_insert_composition;[apply crtos_equiv_refl__crtos_insert_composition|exact E].
   + apply crtos_cached_reconstruct__crtos_insert_composition;assumption.
Qed.
Lemma graft_identity_left__deletion_reassembly : forall g p a k,
 avl_delete_input g p k -> p<>0 ->
 crtos_delete_absent_identity (avl_child_model g (avl_left g p)) a k ->
 crtos_delete_absent_identity g
  (crtos_join_cached g p a (avl_child_model g (avl_right g p))) k.
Proof.
 intros g p a k I N A.
 assert (G:avl_gvalid g) by (apply avl_gvalid_tree_valid_iff;exact (conj (proj1 I) (proj1 (proj2 I)))).
 pose proof (avl_public_root_valid__insert_projection_graft g p (proj1 I) (proj1 (proj2 (proj2 I))) N) as [R V].
 destruct A as [[x [X K]]|E].
 - left. exists x. pose proof (crtos_child_fields__crtos_insert_composition g (avl_left g p) x X) as [W [Key _]]. split;[exact W|congruence].
 - right. eapply crtos_equiv_trans__crtos_insert_composition.
   + apply crtos_cached_join_equiv__crtos_insert_composition;[exact E|apply crtos_equiv_refl__crtos_insert_composition].
   + apply crtos_cached_reconstruct__crtos_insert_composition;assumption.
Qed.
Lemma pending_balance_outcome__outcomes_public_refinement : forall b u a k p ret,
 avl_delete_pending b u k p -> p<>0 -> crtos_balance_effect u a p ret ->
 avl_delete_outcome b a k ret.
Proof.
 intros b u a k p ret P N E.
 pose proof P as [I [Rp [T [Ready [Safe [Ks [Nd [Ns [Range Drop]]]]]]]]].
 pose proof (avl_public_root_valid__insert_projection_graft u p T Rp N) as [R V].
 destruct (crtos_balance_whole_effect__crtos_insert_composition u a p ret T R N E) as [Ga Ra].
 pose proof E as [_ [_ [_ [Nodes [Dom [Keys [_ [_ [Ht Id]]]]]]]]].
 assert (HU:avl_child_height u (avl_root u)=avl_height_of u p) by (rewrite R;reflexivity).
 assert (HA:avl_child_height a (avl_root a)=avl_height_of a ret) by (rewrite Ra;reflexivity).
 assert (Result:avl_balance_graph_result u a ret).
 { split;[exact Ga|]. split;[exact Nodes|]. split;[exact Keys|].
   split;[rewrite Ra;reflexivity|]. split.
   - intros x X. pose proof (avl_all_heights_root_bound__insert_projection_graft a (avl_gvalid_tree_valid a Ga) x X).
     pose proof (proj1 (proj2 (proj2 (proj2 I)))). lia.
   - lia. }
 apply (avl_delete_pending_balance_outcome__delete_projection_graft b u a k p ret P Result).
 split;[lia|]. intro B.
 destruct (Id (B p V)) as [A Ret]. rewrite A;reflexivity.
Qed.
Lemma repair_outcome__outcomes_public_refinement : forall b raw a k p ret,
 avl_delete_input b p k -> crtos_delete_repair b raw k p ->
 crtos_balance_effect (crtos_update_height raw p) a p ret ->
 avl_delete_outcome b a k ret /\ crtos_delete_absent_identity b a k.
Proof.
 intros b raw a k p ret I [U [B [P A]]] E.
 split.
 - eapply pending_balance_outcome__outcomes_public_refinement;[exact P|exact (proj1 (proj2 (proj2 U)))|exact E].
 - destruct A as [Present|Eq];[left;exact Present|right].
   pose proof (proj1 I) as Tb.
   assert (Cl:forall x c,avl_left raw x=Some c \/ avl_right raw x=Some c -> avl_vvalid raw c).
   { eapply crtos_equiv_closed__crtos_insert_composition.
     - apply crtos_equiv_sym__crtos_insert_composition;exact Eq.
     - apply crtos_tree_closed__crtos_insert_composition;exact Tb. }
   pose proof (crtos_equiv_update__crtos_insert_composition raw b p Eq Cl) as Up.
   assert (Vb:avl_vvalid b p) by (apply (proj1 (proj2 (proj2 Eq)) p);exact (proj1 (proj2 U))).
   rewrite (crtos_valid_update_identity__crtos_insert_composition b p Tb Vb) in Up.
   pose proof (crtos_equiv_heightvalue__crtos_insert_composition (crtos_update_height raw p) b Up
     (crtos_tree_closed__crtos_insert_composition _ (proj1 (proj2 (proj2 P)))) p) as [_ F].
   assert (Small:Z.abs (avl_model_balance_factor (crtos_update_height raw p) p)<=1).
   { rewrite F. exact (proj1 (proj2 I) p Vb). }
   pose proof E as [_ [_ [_ [_ [_ [_ [_ [_ [_ NoRotate]]]]]]]]].
   destruct (NoRotate Small) as [-> _]. exact Up.
Qed.
Lemma pending_balanced_outcome__outcomes_public_refinement : forall b a k ret,
 avl_delete_pending b a k ret -> avl_balanced a -> avl_delete_outcome b a k ret.
Proof.
 intros b a k ret P B.
 destruct P as [I [R [T [Ready [Safe [Keys [Nd [Nodes [Range Drop]]]]]]]]].
 unfold avl_delete_outcome,avl_delete_result.
 split.
 - split;[apply avl_gvalid_tree_valid_iff;exact (conj (proj1 I) (proj1 (proj2 I)))|].
   split;[apply avl_gvalid_tree_valid_iff;auto|exact Keys].
 - split;[exact R|]. split;[exact Nd|]. split;[exact Nodes|]. split;[|exact Range].
   intros x X. pose proof (avl_all_heights_root_bound__insert_projection_graft a T x X).
   pose proof (proj1 (proj2 (proj2 (proj2 I)))). lia.
Qed.
Lemma leaf_outcome__outcomes_public_refinement : forall g p k,
 avl_delete_input g p k -> p<>0 -> avl_vvalid g p ->
 avl_ptr_of (avl_left g p)=0 -> avl_ptr_of (avl_right g p)=0 ->
 avl_key_of g p=k ->
 avl_delete_outcome g avl_empty_model k 0 /\ crtos_delete_absent_identity g avl_empty_model k.
Proof.
 intros g p k I N V L R K.
 assert (Ln:avl_left g p=None).
 { apply (proj1 (avl_child_ptr_zero_iff_none__predecessor_right_spine g p (avl_left g p) (proj1 I) V ltac:(auto)));exact L. }
 assert (Rn:avl_right g p=None).
 { apply (proj1 (avl_child_ptr_zero_iff_none__predecessor_right_spine g p (avl_right g p) (proj1 I) V ltac:(auto)));exact R. }
 rewrite <-K in I |- *.
 pose proof (avl_only_child_pending__root_and_single_child g p None I N ltac:(left;auto)) as [P B].
 change (avl_delete_pending g avl_empty_model (avl_key_of g p) 0) in P.
 split.
 - apply pending_balanced_outcome__outcomes_public_refinement;assumption.
 - left. exists p;auto.
Qed.
Lemma nodup_map_injective__outcomes_public_refinement : forall (l:list Z) (f:Z->Z) x y,
 NoDup (map f l) -> In x l -> In y l -> f x=f y -> x=y.
Proof.
 induction l as [|a l IH];intros f x y Nd X Y E;[contradiction|].
 inversion Nd as [|fa fl Notin Tail];subst. simpl in X,Y.
 destruct X as [<-|X];destruct Y as [<-|Y];auto.
 - exfalso. apply Notin. rewrite E. apply in_map;exact Y.
 - exfalso. apply Notin. rewrite <-E. apply in_map;exact X.
 - eapply IH;eauto.
Qed.
Lemma mapping_exists__outcomes_public_refinement : forall g,
 avl_tree_valid g -> exists m,avl_mapping_refines_graph m g.
Proof.
 intros g T. unfold avl_mapping_refines_graph. apply (@choice Z (option Z) (fun k o => forall x,o=Some x <-> avl_vvalid g x /\ avl_key_of g x=k)). intro k.
 destruct (classic (exists x,avl_vvalid g x /\ avl_key_of g x=k)) as [[a [Va Ka]]|Absent].
 - exists (Some a). intro x. split.
   + intro E. inversion E;subst;auto.
   + intros [Vx Kx]. assert (Eq:a=x).
     { eapply nodup_map_injective__outcomes_public_refinement.
       - exact (avl_valid_keys_nodup__predecessor_graft g T).
       - apply (crtos_valid_domain__crtos_insert_composition g T);exact Va.
       - apply (crtos_valid_domain__crtos_insert_composition g T);exact Vx.
       - congruence. }
     f_equal;exact Eq.
 - exists None. intro x. split;[discriminate|]. intro H. exfalso. apply Absent;exists x;exact H.
Qed.
Lemma mapping_keys__outcomes_public_refinement : forall m g k,
 avl_tree_valid g -> avl_mapping_refines_graph m g ->
 (In k (avl_keys g) <-> exists x,m k=Some x).
Proof.
 intros m g k T M. split.
 - unfold avl_keys. rewrite in_map_iff. intros [x [K X]]. exists x. apply M. split.
   + apply (crtos_valid_domain__crtos_insert_composition g T);exact X.
   + exact K.
 - intros [x E]. apply M in E. destruct E as [V K]. rewrite <-K.
   apply avl_key_of_member__insert_projection_graft;assumption.
Qed.
Lemma equivalent_mapping__outcomes_public_refinement : forall m b a,
 avl_mapping_refines_graph m b -> crtos_graph_equiv a b -> avl_mapping_refines_graph m a.
Proof.
 intros m b a M [_ [_ [V [_ K]]]] key x. rewrite (M key x).
 split.
 - intros [X E]. split;[apply V;exact X|]. rewrite (proj1 (K x (proj2 (V x) X)));exact E.
 - intros [X E]. split;[apply V;exact X|]. rewrite <-(proj1 (K x X));exact E.
Qed.
Lemma four_cases_same_ret__outcomes_public_refinement : forall m b a k p ret,
 avl_gvalid b -> p=avl_ptr_of (avl_root b) -> avl_mapping_refines_graph m b ->
 avl_delete_outcome b a k ret -> crtos_delete_absent_identity b a k ->
 (p=0 /\ ret=0 /\ (forall v,m v=None) /\ avl_mapping_refines_graph m a) \/
 (p<>0 /\ m k=None /\ ret=p /\ avl_mapping_refines_graph m a) \/
 (exists ma old,m k=Some old /\ ret=0 /\ (forall v,v=k \/ m v=None) /\
    (forall v,ma v=None) /\ avl_mapping_refines_graph ma a) \/
 (exists ma old,m k=Some old /\ ret<>0 /\ ma k=None /\
    (forall v,(v=k \/ (m v=None /\ ma v=None)) \/
      exists op np,m v=Some op /\ ma v=Some np) /\ avl_mapping_refines_graph ma a).
Proof.
 intros m b a k p ret Gb Root M O A.
 pose proof O as [[_ [Ga Keys]] [Ra _]].
 pose proof (avl_gvalid_tree_valid b Gb) as Tb.
 pose proof (avl_gvalid_tree_valid a Ga) as Ta.
 assert (EmptyInput:p=0 -> forall v,m v=None).
 { intro Zp. assert (Rb:avl_root b=None).
   { apply (proj1 (avl_root_ptr_null_iff__mapping_refinement__tree_valid b Tb));rewrite <-Root;exact Zp. }
   intro v. exact (avl_empty_root_lookup__mapping_refinement__tree_valid m b v Tb Rb M). }
 assert (Absent:m k=None -> ret=p /\ avl_mapping_refines_graph m a).
 { intro NoneK. destruct A as [[x [V K]]|Eq].
   - pose proof (proj2 (M k x) (conj V K));congruence.
   - split;[rewrite Ra,(proj1 Eq);symmetry;exact Root|].
     eapply equivalent_mapping__outcomes_public_refinement;eauto. }
 destruct (Z.eq_dec p 0) as [Zp|Np].
 - left. pose proof (EmptyInput Zp) as Em. destruct (Absent (Em k)) as [Ret Map]. exact (conj Zp (conj (eq_trans Ret Zp) (conj Em Map))).
 - destruct (m k) as [old|] eqn:Mk.
   2:{ right;left. destruct (Absent eq_refl) as [Ret Map]. auto. }
   destruct (mapping_exists__outcomes_public_refinement a Ta) as [ma Ma].
   assert (Domain:forall v,(exists x,ma v=Some x) <-> (exists x,m v=Some x) /\ v<>k).
   { intro v. rewrite <-(mapping_keys__outcomes_public_refinement ma a v Ta Ma),
       <-(mapping_keys__outcomes_public_refinement m b v Tb M). apply Keys. }
   assert (Target:ma k=None).
   { destruct (ma k) as [x|] eqn:E;auto. exfalso. pose proof (proj1 (Domain k) (ex_intro _ x E)) as H. tauto. }
   destruct (Z.eq_dec ret 0) as [Zr|Nr].
   + right;right;left. exists ma,old. split;[reflexivity|]. split;[exact Zr|].
     assert (EmptyAfter:forall v,ma v=None).
     { assert (Rempty:avl_root a=None).
       { apply (proj1 (avl_root_ptr_null_iff__mapping_refinement__tree_valid a Ta));rewrite <-Ra;exact Zr. }
       intro v. exact (avl_empty_root_lookup__mapping_refinement__tree_valid ma a v Ta Rempty Ma). }
     split.
     * intro v. destruct (Z.eq_dec v k) as [->|Ne];auto. right.
       destruct (m v) as [x|] eqn:E;auto. exfalso.
       destruct (proj2 (Domain v) (conj (ex_intro _ x E) Ne)) as [y F]. rewrite EmptyAfter in F;discriminate.
     * auto.
   + right;right;right. exists ma,old. split;[reflexivity|]. split;[exact Nr|]. split;[exact Target|]. split;[|exact Ma].
     intro v. destruct (Z.eq_dec v k) as [->|Ne];[left;auto|].
     destruct (m v) as [op|] eqn:E.
     * right. destruct (proj2 (Domain v) (conj (ex_intro _ op E) Ne)) as [np F]. exists op,np;auto.
     * left;right. split;[reflexivity|]. destruct (ma v) as [np|] eqn:F;auto.
       exfalso. destruct (proj1 (Domain v) (ex_intro _ np F)) as [[op H] _]. congruence.
Qed.
