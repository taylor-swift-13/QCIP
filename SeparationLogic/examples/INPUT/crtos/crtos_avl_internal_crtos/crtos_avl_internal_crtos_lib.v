Require Export SimpleC.EE.INPUT.crtos.crtos_avl_insert_crtos.crtos_avl_insert_crtos_lib.

Require Import Coq.ZArith.ZArith.
Require Import Coq.micromega.Psatz.
Require Import Coq.ZArith.ZArith Coq.Lists.List Coq.micromega.Lia Coq.Classes.RelationClasses Coq.Classes.Morphisms.
Require Import Coq.ZArith.ZArith Coq.micromega.Lia.
Lemma original_uint_max_refresh__accessors_and_cache :
  forall a b h : Z,
    (0 <= a <= 2147483647 -> 0 <= b <= 2147483647 ->
     h = Z.max a b + 1 ->
     (a > b -> SimpleC.SL.IntLib.unsigned_last_nbits (a + 1) 32 = h) /\
     (a <= b -> SimpleC.SL.IntLib.unsigned_last_nbits (b + 1) 32 = h))%Z.
Proof.
  intros a b h Ha Hb Eh. subst h. split; intro H.
  - rewrite Z.max_l by lia.
    rewrite SimpleC.SL.IntLib.unsigned_last_nbits_eq; [reflexivity|].
    cbn. lia.
  - rewrite Z.max_r by lia.
    rewrite SimpleC.SL.IntLib.unsigned_last_nbits_eq; [reflexivity|].
    cbn. lia.
Qed.
Lemma original_factor_conversion__accessors_and_cache :
  forall a b : Z,
    (0 <= a <= 2147483647 -> 0 <= b <= 2147483647 ->
     SimpleC.SL.IntLib.signed_last_nbits (a - b) 32 = a - b /\
     (-2147483648) < SimpleC.SL.IntLib.signed_last_nbits (a - b) 32 <= 2147483647)%Z.
Proof.
  intros a b Ha Hb.
  assert (E : SimpleC.SL.IntLib.signed_last_nbits (a - b) 32 = (a - b)%Z).
  { apply SimpleC.SL.IntLib.signed_last_nbits_eq; [lia|].
    cbn. lia. }
  rewrite E. split; lia.
Qed.
Lemma cached_root_fields_fold__single_rotations :
  forall g x cached, avl_tree_valid g -> avl_root g = Some x ->
  avl_vvalid g x -> x <> 0%Z ->
  SimpleC.SL.SeparationLogic.naive_C_Rules.derivable1
    (SimpleC.SL.SeparationLogic.naive_C_Rules.sepcon
      (SimpleC.SL.SeparationLogic.naive_C_Rules.sepcon
        (avl_graph_node_store (avl_with_root_cache g x cached) x)
        (avl_subtree_store_at g (avl_ptr_of (avl_left g x))))
      (avl_subtree_store_at g (avl_ptr_of (avl_right g x))))
    (avl_tree_store (avl_with_root_cache g x cached)).
Proof.
  Import SimpleC.SL.SeparationLogic.naive_C_Rules.
  intros g x cached Hv Hr Hx Hnx.
  pose proof (GraphLib.examples.bst.bst_binary_tree _ (proj1 Hv)) as Htree.
  assert (Haway : forall child, (avl_left g x = child \/ avl_right g x = child) ->
    Forall (fun z => z <> x) (avl_subtree_nodes g (avl_ptr_of child))).
  { intros child Hc. apply Forall_forall. intros z Hz E. subst z.
    apply GraphLib.graph_basic.valid_NoDup_list_spec in Hz as [_ Hp].
    assert (Es : avl_ptr_of child = x).
    { eapply avl_path_to_root__left_rotation_graph_refinement; eauto. }
    destruct child as [c|]; simpl in Es; [subst c|change (0%Z = x) in Es; congruence].
    eapply GraphLib.examples.bst.bt_child_no_self; eauto. }
  unfold avl_tree_store.
  change (avl_nodes (avl_with_root_cache g x cached)) with (avl_nodes g).
  rewrite <- (avl_root_subtree_nodes_eq__left_rotation_graph_heights g x Hv Hr).
  rewrite (avl_graph_nodes_store_permutation__graph_store_decomposition
    (avl_with_root_cache g x cached) _ _
    (avl_subtree_nodes_partition__height_accessor g x Hv Hx)).
  rewrite avl_graph_nodes_store_cons__graph_store_decomposition.
  sep_apply_r_atomic (avl_graph_nodes_store_app__graph_store_decomposition
    (avl_with_root_cache g x cached)
    (avl_subtree_nodes g (avl_ptr_of (avl_left g x)))
    (avl_subtree_nodes g (avl_ptr_of (avl_right g x)))).
  rewrite (avl_cache_nodes_unchanged__right_rotation_graph g x cached _
    (Haway _ (or_introl eq_refl))).
  rewrite (avl_cache_nodes_unchanged__right_rotation_graph g x cached _
    (Haway _ (or_intror eq_refl))).
  unfold avl_subtree_store_at.
  entailer!.
Qed.
Lemma projection_store_back__single_rotations :
  forall g x, avl_tree_valid g -> avl_vvalid g x ->
  SimpleC.SL.SeparationLogic.naive_C_Rules.derivable1
    (avl_tree_store (avl_subtree_model g x)) (avl_subtree_store_at g x).
Proof.
  intros g x Hv Hx.
  apply (avl_child_store_backward__insert_projection_graft g (Some x) Hv).
  intros s E. inversion E; subst. exact Hx.
Qed.
Lemma child_height_bound_safe__single_rotations :
 forall g c, (avl_child_height g c <= 2147483647)%Z ->
 avl_height_int_result_safe g (avl_ptr_of c).
Proof.
 intros g [z|] H; unfold avl_height_int_result_safe; simpl in *;
 intros Hn; [exact H|contradiction].
Qed.
Lemma right_rotation_update_children_safe__single_rotations :
 forall b a x y, avl_right_rotation_input b x ->
 avl_right_rotation_result b a x y ->
 avl_update_height_children_safe (avl_subtree_model a x) x /\
 avl_update_height_children_safe a y.
Proof.
 intros b a x y Hin Hres.
 pose proof Hin as [Hv [Hr [Hx [Hnx [Hny [HA HD]]]]]].
 pose proof Hres as [Hret [Hyn [Hroot [Hrot [Hva Hmore]]]]].
 pose proof Hrot as [_ [Hxy [_ [Hnewx Hrest]]]].
 assert (Hy : avl_vvalid b y).
 { eapply avl_left_child_valid_from_bst__balance_input; eauto. exact (proj1 Hv). }
 assert (Hyx : y <> x).
 { intro E. rewrite E in Hxy. eapply GraphLib.examples.bst.bt_child_no_self;
   [exact (GraphLib.examples.bst.bst_binary_tree _ (proj1 Hv))|exact Hx|left;exact Hxy]. }
 pose proof (avl_right_rotation_pivot_children__right_rotation_graph b a x y Hv Hrot)
  as [Ryl [Ryr [Rxr Rxl]]].
 assert (Tleft : avl_child_height a (avl_left b y) = avl_child_height b (avl_left b y)).
 { apply (avl_right_rotation_child_height_transfer__right_rotation_graph b a x y _ Hrot).
   exact (avl_balance_children_avoid__single_rotation_and_accessors
     b x y y _ Hv Hr Hx (or_introl Hxy) Hy Hyx (or_introl eq_refl)). }
 assert (Tmid : avl_child_height a (avl_right b y) = avl_child_height b (avl_right b y)).
 { apply (avl_right_rotation_child_height_transfer__right_rotation_graph b a x y _ Hrot).
   exact (avl_balance_children_avoid__single_rotation_and_accessors
     b x y y _ Hv Hr Hx (or_introl Hxy) Hy Hyx (or_intror eq_refl)). }
 assert (Tright : avl_child_height a (avl_right b x) = avl_child_height b (avl_right b x)).
 { apply (avl_right_rotation_child_height_transfer__right_rotation_graph b a x y _ Hrot).
   intros z Hz. pose proof (avl_right_child_avoids_left_pivot__right_rotation_graph
    b x y z z Hv Hx Hz Hxy ltac:(unfold avl_reachable, GraphLib.examples.bst.bt_path, SetsClass.RelsDomain.clos_refl_trans; exists 0%nat; reflexivity)) as [_ Hne]. exact Hne. }
 rewrite Hxy in HA, HD. simpl avl_ptr_of in HA, HD.
 unfold avl_recomputed_at in Hnewx. rewrite Rxl, Rxr, Tmid, Tright in Hnewx.
 assert (BoundX : (avl_height_of a x <= 2147483647)%Z) by lia.
 assert (BoundB : (avl_child_height b (avl_right b y) <= 2147483647)%Z).
 { pose proof (Z.le_max_l (avl_child_height b (avl_right b y)) (avl_child_height b (avl_right b x))); lia. }
 assert (BoundC : (avl_child_height b (avl_right b x) <= 2147483647)%Z).
 { pose proof (Z.le_max_r (avl_child_height b (avl_right b y)) (avl_child_height b (avl_right b x))); lia. }
 split.
 - unfold avl_update_height_children_safe. intro Hn.
   pose proof (avl_projection_children__lr_graph_composition a x x ltac:(unfold avl_reachable, GraphLib.examples.bst.bt_path, SetsClass.RelsDomain.clos_refl_trans; exists 0%nat; reflexivity)) as [PL PR].
   rewrite PL, PR, Rxl, Rxr.
   change (avl_height_int_result_safe a (avl_ptr_of (avl_right b y)) /\
           avl_height_int_result_safe a (avl_ptr_of (avl_right b x))).
   split; apply child_height_bound_safe__single_rotations; [rewrite Tmid|rewrite Tright]; assumption.
 - unfold avl_update_height_children_safe. intro Hn.
   rewrite Ryl, Ryr. simpl avl_ptr_of.
   split.
   + apply child_height_bound_safe__single_rotations. rewrite Tleft. exact HA.
   + unfold avl_height_int_result_safe. intro H; exact BoundX.
Qed.
Lemma left_rotation_update_children_safe__single_rotations :
 forall b a x y, avl_left_rotation_cached_input b x ->
 avl_left_rotation_result b a x y ->
 avl_update_height_children_safe (avl_subtree_model a x) x /\
 avl_update_height_children_safe a y.
Proof.
 intros b a x y Hin Hres.
 pose proof Hin as [Hv [Hr [Hx [Hnx [Hny [HA HD]]]]]].
 pose proof Hres as [Hret [Hyn [Hroot [Hrot [Hva Hmore]]]]].
 pose proof Hrot as [_ [Hxy [_ [Hnewx Hrest]]]].
 assert (Hy : avl_vvalid b y).
 { eapply avl_right_child_valid_from_bst__balance_input; eauto. exact (proj1 Hv). }
 assert (Hyx : y <> x).
 { intro E. rewrite E in Hxy. eapply GraphLib.examples.bst.bt_child_no_self;
   [exact (GraphLib.examples.bst.bst_binary_tree _ (proj1 Hv))|exact Hx|right;exact Hxy]. }
 pose proof (avl_left_rotation_pivot_children__left_rotation_graph_heights b a x y Hv Hrot)
  as [Ryl [Ryr [Rxr Rxl]]].
 assert (Tleft : avl_child_height a (avl_right b y) = avl_child_height b (avl_right b y)).
 { apply (avl_left_rotation_child_height_transfer__left_rotation_graph_heights b a x y _ Hrot).
   exact (avl_balance_children_avoid__single_rotation_and_accessors
     b x y y _ Hv Hr Hx (or_intror Hxy) Hy Hyx (or_intror eq_refl)). }
 assert (Tmid : avl_child_height a (avl_left b y) = avl_child_height b (avl_left b y)).
 { apply (avl_left_rotation_child_height_transfer__left_rotation_graph_heights b a x y _ Hrot).
   exact (avl_balance_children_avoid__single_rotation_and_accessors
     b x y y _ Hv Hr Hx (or_intror Hxy) Hy Hyx (or_introl eq_refl)). }
 assert (Tright : avl_child_height a (avl_left b x) = avl_child_height b (avl_left b x)).
 { apply (avl_left_rotation_child_height_transfer__left_rotation_graph_heights b a x y _ Hrot).
   intros z Hz. pose proof (avl_left_child_avoids_right_pivot__left_rotation_graph_heights
    b x y z z Hv Hx Hz Hxy ltac:(unfold avl_reachable, GraphLib.examples.bst.bt_path, SetsClass.RelsDomain.clos_refl_trans; exists 0%nat; reflexivity)) as [_ Hne]. exact Hne. }
 rewrite Hxy in HA, HD. simpl avl_ptr_of in HA, HD.
 unfold avl_recomputed_at in Hnewx. rewrite Rxl, Rxr, Tmid, Tright in Hnewx.
 assert (BoundX : (avl_height_of a x <= 2147483647)%Z) by lia.
 assert (BoundB : (avl_child_height b (avl_left b y) <= 2147483647)%Z).
 { pose proof (Z.le_max_r (avl_child_height b (avl_left b x)) (avl_child_height b (avl_left b y))); lia. }
 assert (BoundC : (avl_child_height b (avl_left b x) <= 2147483647)%Z).
 { pose proof (Z.le_max_l (avl_child_height b (avl_left b x)) (avl_child_height b (avl_left b y))); lia. }
 split.
 - unfold avl_update_height_children_safe. intro Hn.
   pose proof (avl_projection_children__lr_graph_composition a x x ltac:(unfold avl_reachable, GraphLib.examples.bst.bt_path, SetsClass.RelsDomain.clos_refl_trans; exists 0%nat; reflexivity)) as [PL PR].
   rewrite PL, PR, Rxl, Rxr.
   change (avl_height_int_result_safe a (avl_ptr_of (avl_left b x)) /\
           avl_height_int_result_safe a (avl_ptr_of (avl_left b y))).
   split; apply child_height_bound_safe__single_rotations; [rewrite Tright|rewrite Tmid]; assumption.
 - unfold avl_update_height_children_safe. intro Hn.
   rewrite Ryl, Ryr. simpl avl_ptr_of.
   split.
   + unfold avl_height_int_result_safe. intro H; exact BoundX.
   + apply child_height_bound_safe__single_rotations. rewrite Tleft. exact HA.
Qed.
Lemma cached_subtree_node_fold__single_rotations :
 forall g x cached, avl_tree_valid g -> avl_vvalid g x -> x <> 0%Z ->
 SimpleC.SL.SeparationLogic.naive_C_Rules.derivable1
  (SimpleC.SL.SeparationLogic.naive_C_Rules.sepcon
   (SimpleC.SL.SeparationLogic.naive_C_Rules.sepcon
    (avl_graph_node_store (avl_with_root_cache (avl_subtree_model g x) x cached) x)
    (avl_subtree_store_at g (avl_ptr_of (avl_left g x))))
   (avl_subtree_store_at g (avl_ptr_of (avl_right g x))))
  (avl_tree_store (avl_with_root_cache (avl_subtree_model g x) x cached)).
Proof.
 Import SimpleC.SL.SeparationLogic.naive_C_Rules.
 intros g x cached Hv Hx Hnx.
 pose proof (GraphLib.examples.bst.bst_binary_tree _ (proj1 Hv)) as Htree.
 assert (Hmap : forall c, (c = avl_left g x \/ c = avl_right g x) ->
  (avl_subtree_store_at g (avl_ptr_of c) |--
  avl_graph_nodes_store (avl_with_root_cache (avl_subtree_model g x) x cached)
    (avl_subtree_nodes g (avl_ptr_of c)))%sac).
 { intros c Hc.
   assert (Facts : Forall (fun z => z <> x /\ avl_reachable g x z)
      (avl_subtree_nodes g (avl_ptr_of c))).
   { apply Forall_forall. intros z Hz.
     apply GraphLib.graph_basic.valid_NoDup_list_spec in Hz as [Hz Hp].
     destruct c as [q|].
     - assert (Hedge : avl_left g x = Some q \/ avl_right g x = Some q) by (destruct Hc;auto).
       split.
       + intro E. rewrite E in Hp.
         eapply (GraphLib.examples.bst.bt_child_no_back_path _ x q Htree Hx Hedge). exact Hp.
       + eapply avl_subtree_path_prepend__graph_store_decomposition; eauto.
     - exfalso.
       assert (Hvz : avl_vvalid g z).
       { apply (proj1 (GraphLib.examples.bst.bst_listV_spec (avl_bst g) z (proj1 Hv))). exact Hz. }
       eapply avl_subtree_invalid_path_empty__height_accessor; [exact Hv| |exact Hvz|exact Hp].
       intro Hnull. exact ((proj2 (proj2 Hv)) _ Hnull eq_refl). }
   assert (Away : Forall (fun z => z <> x) (avl_subtree_nodes g (avl_ptr_of c))).
   { eapply Forall_impl; [|exact Facts]. intros z H; exact (proj1 H). }
   rewrite (avl_cache_nodes_unchanged__right_rotation_graph (avl_subtree_model g x) x cached _ Away).
   unfold avl_subtree_store_at. Intros_p Hcvalid.
   apply avl_projection_nodes_store__lr_graph_composition.
   eapply Forall_impl; [|exact Facts]. intros z H; exact (proj2 H). }
 unfold avl_tree_store.
 change (avl_nodes (avl_with_root_cache (avl_subtree_model g x) x cached))
   with (avl_subtree_nodes g x).
 rewrite (avl_graph_nodes_store_permutation__graph_store_decomposition
  (avl_with_root_cache (avl_subtree_model g x) x cached) _ _
  (avl_subtree_nodes_partition__height_accessor g x Hv Hx)).
 rewrite avl_graph_nodes_store_cons__graph_store_decomposition.
 sep_apply_r_atomic (avl_graph_nodes_store_app__graph_store_decomposition
  (avl_with_root_cache (avl_subtree_model g x) x cached)
  (avl_subtree_nodes g (avl_ptr_of (avl_left g x)))
  (avl_subtree_nodes g (avl_ptr_of (avl_right g x)))).
 sep_apply_l_atomic (Hmap _ (or_introl eq_refl)).
 sep_apply_l_atomic (Hmap _ (or_intror eq_refl)).
 entailer!.
Qed.
Lemma right_fringe_store_transfer__single_rotations :
 forall b a x y c, avl_right_rotation_input b x ->
 avl_right_rotation_result b a x y ->
 (c = avl_right b x \/ c = avl_left b y \/ c = avl_right b y) ->
 SimpleC.SL.SeparationLogic.naive_C_Rules.derivable1
  (avl_subtree_store_at b (avl_ptr_of c))
  (avl_subtree_store_at a (avl_ptr_of c)).
Proof.
 intros b a x y c Hin Hres Hc.
 pose proof Hin as [Hv [Hr [Hx Hmore]]].
 pose proof Hres as [Hret [Hyn [Hroot [Hrot [Hva Hafter]]]]].
 pose proof Hrot as [_ [Hxy _]].
 apply (avl_right_rotation_child_store_transfer__right_rotation_graph b a x y c Hv Hva Hr Hrot).
 intros q Hq z Hp.
 destruct Hc as [E|[E|E]]; subst c.
 - eapply avl_right_child_avoids_left_pivot__right_rotation_graph; eauto.
 - destruct (avl_descendant_avoids_ancestors__left_rotation_graph_heights
    b x y q z Hv Hx (or_introl Hxy) (or_introl Hq) Hp) as [Hz [Hzy Hzx]].
   repeat split; assumption.
 - destruct (avl_descendant_avoids_ancestors__left_rotation_graph_heights
    b x y q z Hv Hx (or_introl Hxy) (or_intror Hq) Hp) as [Hz [Hzy Hzx]].
   repeat split; assumption.
Qed.
Lemma left_fringe_store_transfer__single_rotations :
 forall b a x y c, avl_left_rotation_cached_input b x ->
 avl_left_rotation_result b a x y ->
 (c = avl_left b x \/ c = avl_left b y \/ c = avl_right b y) ->
 SimpleC.SL.SeparationLogic.naive_C_Rules.derivable1
  (avl_subtree_store_at b (avl_ptr_of c))
  (avl_subtree_store_at a (avl_ptr_of c)).
Proof.
 intros b a x y c Hin Hres Hc.
 pose proof Hin as [Hv [Hr [Hx Hmore]]].
 pose proof Hres as [Hret [Hyn [Hroot [Hrot [Hva Hafter]]]]].
 pose proof Hrot as [_ [Hxy _]].
 apply (avl_left_rotation_child_store_transfer__left_rotation_graph_heights b a x y c Hv Hva Hr Hrot).
 intros q Hq z Hp.
 destruct Hc as [E|[E|E]]; subst c.
 - eapply avl_left_child_avoids_right_pivot__left_rotation_graph_heights; eauto.
 - destruct (avl_descendant_avoids_ancestors__left_rotation_graph_heights
    b x y q z Hv Hx (or_intror Hxy) (or_introl Hq) Hp) as [Hz [Hzy Hzx]].
   repeat split; assumption.
 - destruct (avl_descendant_avoids_ancestors__left_rotation_graph_heights
    b x y q z Hv Hx (or_intror Hxy) (or_intror Hq) Hp) as [Hz [Hzy Hzx]].
   repeat split; assumption.
Qed.
Lemma model_factor_or_null__balance_results :
  forall (g : avl_model) (x : Z), avl_balance_factor_input_valid g ->
    (x <> 0%Z -> avl_vvalid g x) ->
    avl_balance_factor_or_null g x (avl_model_balance_factor g x).
Proof.
  intros g x Hfactor Hvalid.
  destruct (Z.eq_dec x 0) as [->|Hnon].
  - left. split; [reflexivity|].
    apply avl_null_balance_factor__null_unmatched_balanced_results. exact Hfactor.
  - assert (Hx : avl_vvalid g x) by (apply Hvalid; exact Hnon).
    destruct (avl_factor_legacy_local_pre__balance_factor_accessor
      g x Hfactor (or_intror Hx)) as [Htree Hsafe].
    destruct (avl_children_int_safe__balance_factor_accessor
      g x Htree Hx Hnon Hsafe) as [Hls Hrs].
    pose proof (avl_child_valid__balance_factor_accessor g x (avl_left g x)
      Htree Hx (or_introl eq_refl)) as Hl.
    pose proof (avl_child_valid__balance_factor_accessor g x (avl_right g x)
      Htree Hx (or_intror eq_refl)) as Hr.
    pose proof (avl_child_height_int_bound__left_rotation_graph_heights
      g (avl_left g x) Htree Hl Hls) as Hlb.
    pose proof (avl_child_height_int_bound__left_rotation_graph_heights
      g (avl_right g x) Htree Hr Hrs) as Hrb.
    right. repeat split; try assumption; try reflexivity;
      unfold avl_model_balance_factor in *; lia.
Qed.
