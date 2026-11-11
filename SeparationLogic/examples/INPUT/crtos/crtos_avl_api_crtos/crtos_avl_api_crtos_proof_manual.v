Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Strings.String.
Require Import Coq.Strings.Ascii.
Require Import Coq.Lists.List.
Require Import Coq.Classes.RelationClasses.
Require Import Coq.Classes.Morphisms.
Require Import Coq.micromega.Psatz.
Require Import Coq.Sorting.Permutation.
From AUXLib Require Import int_auto Axioms Feq Idents ListLib VMap.
Require Import SetsClass.SetsClass. Import SetsNotation.
From SimpleC.SL Require Import Mem SeparationLogic.
From SimpleC.EE.INPUT.crtos.crtos_avl_api_crtos Require Import crtos_avl_api_crtos_goal.
From SimpleC.EE.INPUT.crtos.crtos_avl_api_crtos Require Import crtos_avl_api_crtos_proof_auto.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import naive_C_Rules.
Require Import SimpleC.EE.INPUT.crtos.crtos_avl_internal_crtos.crtos_avl_internal_crtos_lib.
Require Import SimpleC.EE.INPUT.crtos.crtos_avl_api_crtos.crtos_avl_api_crtos_lib.
Local Open Scope sac.

Lemma proof_of_crtos_avl_height_crtos_entail_wit_1 : crtos_avl_height_crtos_entail_wit_1.
Proof.
pre_process.
destruct (Z.eq_dec avl_node_pre 0) as [Hnull|Hnon].
- Right. entailer!.
- Left.
  prop_apply_p (avl_subtree_store_valid_guard__graph_store_decomposition g_low_level_spec avl_node_pre).
  Intros_p Hguard.
  sep_apply_l_atomic (avl_subtree_store_decompose__height_accessor g_low_level_spec avl_node_pre PreH1 Hnon (Hguard Hnon)).
  unfold avl_graph_node_store.
  entailer!.
Qed. 

Lemma proof_of_crtos_avl_height_crtos_return_wit_1 : crtos_avl_height_crtos_return_wit_1.
Proof.
pre_process.
prop_apply_p (store_int_range &(avl_node_pre # "AvlNode" ->ₛ "data") (avl_key_of g_low_level_spec avl_node_pre)).
Intros_p Hkey.
prop_apply_p (store_uint_range &(avl_node_pre # "AvlNode" ->ₛ "height") (avl_height_of g_low_level_spec avl_node_pre)).
Intros_p Hheight.
split_pure_spatial.
- sep_apply_r_atomic (avl_subtree_store_fold__height_accessor g_low_level_spec avl_node_pre PreH2 PreH1 PreH4).
  unfold avl_graph_node_store. entailer!.
- dump_pre_spatial. unfold avl_height_result. right. exists avl_node_pre. tauto.
Qed. 

Lemma proof_of_crtos_avl_height_crtos_return_wit_2 : crtos_avl_height_crtos_return_wit_2.
Proof.
pre_process.
split_pure_spatial.
- entailer!.
- dump_pre_spatial. unfold avl_height_result. left. tauto.
Qed. 

Lemma proof_of_crtos_avl_update_height_crtos_entail_wit_1 : crtos_avl_update_height_crtos_entail_wit_1.
Proof.
pre_process.
assert (Hr : avl_root g_low_level_spec = Some avl_node_pre).
{ destruct (avl_root g_low_level_spec) as [r|] eqn:E.
  - cbn [avl_ptr_of] in PreH2. subst avl_node_pre. reflexivity.
  - cbn [avl_ptr_of] in PreH2. exfalso. apply PreH4. exact PreH2.
}
assert (Hv : avl_vvalid g_low_level_spec avl_node_pre).
{ destruct PreH1 as [[Ht _ _] _]. exact (GraphLib.examples.bst.root_valid _ Ht avl_node_pre Hr). }
sep_apply_l_atomic (avl_update_height_expose_cached_root__root_cache_restoration g_low_level_spec avl_node_pre old_cache_low_level_spec PreH1 Hr Hv PreH4).
Intros_p Hkey. Intros_p Hheight.
entailer!.
Qed. 

Lemma proof_of_crtos_avl_update_height_crtos_return_wit_1 : crtos_avl_update_height_crtos_return_wit_1.
Proof.
pre_process.
rename avl_node_pre into n.
rename g_low_level_spec into g.
assert (Hl : forall x, avl_left g n = Some x -> avl_vvalid g x).
{ intros x E. eapply avl_left_child_valid_from_bst__balance_input; eauto. exact (proj1 PreH5). }
assert (Hr : forall x, avl_right g n = Some x -> avl_vvalid g x).
{ intros x E. eapply avl_right_child_valid_from_bst__balance_input; eauto. exact (proj1 PreH5). }
pose proof (avl_height_result_child_height__left_rotation_graph_heights g (avl_left g n) retval PreH5 Hl PreH4) as Ea.
pose proof (avl_height_result_child_height__left_rotation_graph_heights g (avl_right g n) retval_2 PreH5 Hr PreH3) as Eb.
pose proof (avl_height_result_child_height__left_rotation_graph_heights g (avl_left g n) retval_3 PreH5 Hl PreH1) as Ec.
destruct (PreH9 PreH8) as [Sl Sr].
pose proof (avl_child_height_int_bound__left_rotation_graph_heights g (avl_left g n) PreH5 Hl Sl) as Ba.
pose proof (avl_child_height_int_bound__left_rotation_graph_heights g (avl_right g n) PreH5 Hr Sr) as Bb.
pose proof (proj1 (proj2 PreH5) n PreH7) as [Bh Eh].
assert (Ewrite : unsigned_last_nbits (retval_3 + 1) 32 = avl_height_of g n).
{ rewrite Ec.
  apply (proj1 (original_uint_max_refresh__accessors_and_cache _ _ _ Ba Bb Eh)).
  lia. }
rewrite Ewrite.
prop_apply_p (store_int_range &(n # "AvlNode" ->ₛ "data") (avl_key_of g n)).
Intros_p Bkey.
sep_apply_r_atomic (avl_subtree_store_to_root_tree_store g n PreH5 (ltac:(rewrite PreH6; reflexivity))).
sep_apply_r_atomic (avl_subtree_store_fold__height_accessor g n PreH5 PreH8 PreH7).
unfold avl_graph_node_store. entailer!.
Qed. 

Lemma proof_of_crtos_avl_update_height_crtos_return_wit_2 : crtos_avl_update_height_crtos_return_wit_2.
Proof.
pre_process.
rename avl_node_pre into n.
rename g_low_level_spec into g.
assert (Hl : forall x, avl_left g n = Some x -> avl_vvalid g x).
{ intros x E. eapply avl_left_child_valid_from_bst__balance_input; eauto. exact (proj1 PreH5). }
assert (Hr : forall x, avl_right g n = Some x -> avl_vvalid g x).
{ intros x E. eapply avl_right_child_valid_from_bst__balance_input; eauto. exact (proj1 PreH5). }
pose proof (avl_height_result_child_height__left_rotation_graph_heights g (avl_left g n) retval PreH5 Hl PreH4) as Ea.
pose proof (avl_height_result_child_height__left_rotation_graph_heights g (avl_right g n) retval_2 PreH5 Hr PreH3) as Eb.
pose proof (avl_height_result_child_height__left_rotation_graph_heights g (avl_right g n) retval_3 PreH5 Hr PreH1) as Ec.
destruct (PreH9 PreH8) as [Sl Sr].
pose proof (avl_child_height_int_bound__left_rotation_graph_heights g (avl_left g n) PreH5 Hl Sl) as Ba.
pose proof (avl_child_height_int_bound__left_rotation_graph_heights g (avl_right g n) PreH5 Hr Sr) as Bb.
pose proof (proj1 (proj2 PreH5) n PreH7) as [Bh Eh].
assert (Ewrite : unsigned_last_nbits (retval_3 + 1) 32 = avl_height_of g n).
{ rewrite Ec.
  apply (proj2 (original_uint_max_refresh__accessors_and_cache _ _ _ Ba Bb Eh)).
  lia. }
rewrite Ewrite.
prop_apply_p (store_int_range &(n # "AvlNode" ->ₛ "data") (avl_key_of g n)).
Intros_p Bkey.
sep_apply_r_atomic (avl_subtree_store_to_root_tree_store g n PreH5 (ltac:(rewrite PreH6; reflexivity))).
sep_apply_r_atomic (avl_subtree_store_fold__height_accessor g n PreH5 PreH8 PreH7).
unfold avl_graph_node_store. entailer!.
Qed. 

Lemma proof_of_crtos_avl_update_height_crtos_return_wit_3 : crtos_avl_update_height_crtos_return_wit_3.
Proof.
pre_process.
rewrite PreH4.
unfold avl_tree_store.
change (avl_nodes (avl_with_root_cache g_low_level_spec 0 old_cache_low_level_spec)) with (avl_nodes g_low_level_spec).
rewrite (avl_cache_nodes_unchanged__right_rotation_graph g_low_level_spec 0 old_cache_low_level_spec (avl_nodes g_low_level_spec)).
- entailer!.
- apply Forall_forall. intros z Hin.
  apply (proj2 (proj2 PreH1) z).
  apply (proj1 (GraphLib.examples.bst.bst_listV_spec (avl_bst g_low_level_spec) z (proj1 PreH1))).
  exact Hin.
Qed. 

Lemma proof_of_crtos_avl_balance_factor_crtos_entail_wit_1 : crtos_avl_balance_factor_crtos_entail_wit_1.
Proof.
pre_process.
assert (Ht : avl_tree_valid g_low_level_spec).
{ destruct PreH1 as [Hb [Hh [Hn _]]]. split; [exact Hb|]. split; assumption. }
prop_apply_p (avl_subtree_store_valid_guard__graph_store_decomposition g_low_level_spec avl_node_pre).
Intros_p Hguard.
sep_apply_l_atomic (avl_subtree_store_decompose__height_accessor g_low_level_spec avl_node_pre Ht PreH2 (Hguard PreH2)).
unfold avl_graph_node_store. entailer!.
Qed. 

Lemma proof_of_crtos_avl_balance_factor_crtos_return_wit_2 : crtos_avl_balance_factor_crtos_return_wit_2.
Proof.
pre_process.
rename avl_node_pre into n.
rename g_low_level_spec into g.
assert (Hl : forall x, avl_left g n = Some x -> avl_vvalid g x).
{ intros x E. eapply avl_left_child_valid_from_bst__balance_input; eauto. exact (proj1 PreH4). }
assert (Hr : forall x, avl_right g n = Some x -> avl_vvalid g x).
{ intros x E. eapply avl_right_child_valid_from_bst__balance_input; eauto. exact (proj1 PreH4). }
pose proof (avl_height_result_child_height__left_rotation_graph_heights g (avl_left g n) retval PreH4 Hl PreH2) as Ea.
pose proof (avl_height_result_child_height__left_rotation_graph_heights g (avl_right g n) retval_2 PreH4 Hr PreH1) as Eb.
assert (Sl : avl_height_int_result_safe g (avl_ptr_of (avl_left g n))).
{ intro Hnz. apply (proj2 (proj2 (proj2 (proj2 PreH3)))).
  apply (avl_left_child_nonnull_valid__height_accessor g n PreH4 PreH6 Hnz). }
assert (Sr : avl_height_int_result_safe g (avl_ptr_of (avl_right g n))).
{ intro Hnz. apply (proj2 (proj2 (proj2 (proj2 PreH3)))).
  apply (avl_right_child_nonnull_valid__height_accessor g n PreH4 PreH6 Hnz). }
pose proof (avl_child_height_int_bound__left_rotation_graph_heights g (avl_left g n) PreH4 Hl Sl) as Ba.
pose proof (avl_child_height_int_bound__left_rotation_graph_heights g (avl_right g n) PreH4 Hr Sr) as Bb.
assert (Ra : 0 <= retval <= INT_MAX) by lia.
assert (Rb : 0 <= retval_2 <= INT_MAX) by lia.
destruct (original_factor_conversion__accessors_and_cache retval retval_2 Ra Rb) as [Efactor Bfactor].
prop_apply_p (store_int_range &(n # "AvlNode" ->ₛ "data") (avl_key_of g n)).
Intros_p Bkey.
pose proof (proj1 (proj1 (proj2 PreH4) n PreH6)) as Bh.
split_pure_spatial.
- sep_apply_r_atomic (avl_subtree_store_fold__height_accessor g n PreH4 PreH5 PreH6).
  unfold avl_graph_node_store. entailer!.
- split_pures; dump_pre_spatial; try assumption.
  + unfold avl_model_balance_factor. lia.
  + lia.
  + lia.
Qed. 

Lemma proof_of_crtos_avl_right_rotate_crtos_entail_wit_1 : crtos_avl_right_rotate_crtos_entail_wit_1.
Proof.
pre_process. entailer!. unfold avl_right_rotation_input in PreH1. tauto.
Qed. 

Lemma proof_of_crtos_avl_right_rotate_crtos_entail_wit_3 : crtos_avl_right_rotate_crtos_entail_wit_3.
Proof.
pre_process.
pose proof PreH1 as [Hv [Hr [Hx [Hnx Hrest]]]].
destruct (avl_right_rotation_output_exists__right_rotation_graph before_low_level_spec avl_node_pre PreH1) as [a [y [Hxy [Hy [Hres Hsafe]]]]].
pose proof Hres as [Hret [Hyn [Har [Hm [Hva Hmore]]]]].
Exists a y.
sep_apply_l_atomic (avl_tree_store_right_rotation_expose_cached_root__right_rotation_graph before_low_level_spec avl_node_pre y root_cached_height_low_level_spec Hv Hr Hx Hnx Hxy Hy Hyn).
rewrite Hxy. simpl avl_ptr_of. entailer!.
Qed. 

Lemma proof_of_crtos_avl_right_rotate_crtos_entail_wit_4 : crtos_avl_right_rotate_crtos_entail_wit_4.
Proof.
pre_process.
rename avl_node_pre into x.
rename before_low_level_spec into b.
rename after into a.
rename promoted into y.
pose proof PreH2 as [Hret [Hyn [Har [Hrot [Hva [Hnodes Hkeys]]]]]].
pose proof PreH1 as [Hv [Hr [Hx [Hnx Hmore]]]].
pose proof (avl_right_rotation_domain_keys__right_rotation_graph b a x y x Hrot) as [_ [_ Hxiff]].
assert (Hxa : avl_vvalid a x) by (apply Hxiff;exact Hx).
pose proof (avl_subtree_projection_valid__lr_graph_composition a x Hva Hxa) as Hvp.
pose proof (right_rotation_update_children_safe__single_rotations b a x y PreH1 PreH2) as [Hsp Hsy].
pose proof (avl_right_rotation_pivot_children__right_rotation_graph b a x y Hv Hrot) as [Ryl [Ryr [Rxr Rxl]]].
pose proof (avl_projection_children__lr_graph_composition a x x ltac:(reflexivity)) as [PL PR].
split_pure_spatial.
- rewrite <- Hret.
  sep_apply_l_atomic (right_fringe_store_transfer__single_rotations b a x y (avl_right b x) PreH1 PreH2 (or_introl eq_refl)).
  sep_apply_l_atomic (right_fringe_store_transfer__single_rotations b a x y (avl_right b y) PreH1 PreH2 (or_intror (or_intror eq_refl))).
  sep_apply_r_atomic (cached_subtree_node_fold__single_rotations a x root_cached_height_low_level_spec PreH3 Hxa PreH5).
  rewrite Rxl, Rxr.
  prop_apply_p (store_int_range (&(x # "AvlNode" ->ₛ "data")) (avl_key_of b x)).
  Intros_p Hkey.
  prop_apply_p (store_uint_range (&(x # "AvlNode" ->ₛ "height")) root_cached_height_low_level_spec).
  Intros_p Hcache.
  unfold avl_graph_node_store.
  change (avl_vvalid (avl_with_root_cache (avl_subtree_model a x) x root_cached_height_low_level_spec) x)
    with (avl_vvalid a x /\ avl_reachable a x x).
  change (avl_key_of (avl_with_root_cache (avl_subtree_model a x) x root_cached_height_low_level_spec) x)
    with (avl_key_of a x).
  change (avl_left (avl_with_root_cache (avl_subtree_model a x) x root_cached_height_low_level_spec) x)
    with (avl_left (avl_subtree_model a x) x).
  change (avl_right (avl_with_root_cache (avl_subtree_model a x) x root_cached_height_low_level_spec) x)
    with (avl_right (avl_subtree_model a x) x).
  assert (Ec : avl_height_of (avl_with_root_cache (avl_subtree_model a x) x root_cached_height_low_level_spec) x =
    root_cached_height_low_level_spec).
  { unfold avl_with_root_cache, avl_height_update; simpl. destruct (Z.eq_dec x x); congruence. }
  rewrite Ec, Hkeys, PL, PR, Rxl, Rxr. entailer!.
- entailer!.
Qed. 

Lemma proof_of_crtos_avl_right_rotate_crtos_entail_wit_5 : crtos_avl_right_rotate_crtos_entail_wit_5.
Proof.
pre_process.
rename avl_node_pre into x.
rename before_low_level_spec into b.
rename after into a.
rename promoted into y.
pose proof PreH2 as [Hret [Hyn [Har [Hrot [Hva [Hnodes Hkeys]]]]]].
pose proof PreH1 as [Hv [Hr [Hx [Hnx Hmore]]]].
pose proof (avl_right_rotation_domain_keys__right_rotation_graph b a x y x Hrot) as [_ [_ Hxiff]].
assert (Hxa : avl_vvalid a x) by (apply Hxiff;exact Hx).
assert (Hya : avl_vvalid a y).
{ exact (proj2 (avl_public_root_valid__insert_projection_graft a y PreH3 ltac:(rewrite Har;reflexivity) Hyn)). }
pose proof (right_rotation_update_children_safe__single_rotations b a x y PreH1 PreH2) as [Hsp Hsy].
pose proof (avl_right_rotation_pivot_children__right_rotation_graph b a x y Hv Hrot) as [Ryl [Ryr [Rxr Rxl]]].
split_pure_spatial.
- sep_apply_l_atomic (projection_store_back__single_rotations a x PreH3 Hxa).
  sep_apply_l_atomic (right_fringe_store_transfer__single_rotations b a x y (avl_left b y) PreH1 PreH2 (or_intror (or_introl eq_refl))).
  sep_apply_r_atomic (cached_root_fields_fold__single_rotations a y (avl_height_of b y) PreH3 Har Hya Hyn).
  rewrite Ryl, Ryr. simpl avl_ptr_of.
  prop_apply_p (store_int_range (&(y # "AvlNode" ->ₛ "data")) (avl_key_of b y)).
  Intros_p Hkey.
  prop_apply_p (store_uint_range (&(y # "AvlNode" ->ₛ "height")) (avl_height_of b y)).
  Intros_p Hcache.
  unfold avl_graph_node_store.
  change (avl_vvalid (avl_with_root_cache a y (avl_height_of b y)) y) with (avl_vvalid a y).
  change (avl_key_of (avl_with_root_cache a y (avl_height_of b y)) y) with (avl_key_of a y).
  change (avl_left (avl_with_root_cache a y (avl_height_of b y)) y) with (avl_left a y).
  change (avl_right (avl_with_root_cache a y (avl_height_of b y)) y) with (avl_right a y).
  assert (Ec : avl_height_of (avl_with_root_cache a y (avl_height_of b y)) y = avl_height_of b y).
  { unfold avl_with_root_cache, avl_height_update; simpl. destruct (Z.eq_dec y y); congruence. }
  rewrite Ec, Hkeys, Ryl, Ryr. simpl avl_ptr_of. entailer!.
- rewrite Har. simpl avl_ptr_of. entailer!.
Qed. 

Lemma proof_of_crtos_avl_right_rotate_crtos_return_wit_1 : crtos_avl_right_rotate_crtos_return_wit_1.
Proof.
pre_process. unfold avl_right_rotation_post. Exists after. entailer!.
Qed. 

Lemma proof_of_crtos_avl_left_rotate_crtos_entail_wit_1 : crtos_avl_left_rotate_crtos_entail_wit_1.
Proof.
pre_process. entailer!. unfold avl_left_rotation_cached_input in PreH1. tauto.
Qed. 

Lemma proof_of_crtos_avl_left_rotate_crtos_entail_wit_3 : crtos_avl_left_rotate_crtos_entail_wit_3.
Proof.
pre_process.
pose proof PreH1 as [Hv [Hr [Hx [Hnx Hrest]]]].
destruct (avl_left_cached_output_exists__left_rotation_cached_graph before_low_level_spec avl_node_pre PreH1) as [a [y [Hxy [Hy [Hres Hsafe]]]]].
pose proof Hres as [Hret [Hyn [Har [Hm [Hva Hmore]]]]].
Exists a y.
sep_apply_l_atomic (avl_tree_store_left_rotation_expose_cached_root__left_rotation_cached_graph before_low_level_spec avl_node_pre y root_cached_height_low_level_spec Hv Hr Hx Hnx Hxy Hy Hyn).
rewrite Hxy. simpl avl_ptr_of. entailer!.
Qed. 

Lemma proof_of_crtos_avl_left_rotate_crtos_entail_wit_4 : crtos_avl_left_rotate_crtos_entail_wit_4.
Proof.
pre_process.
rename avl_node_pre into x.
rename before_low_level_spec into b.
rename after into a.
rename promoted into y.
pose proof PreH2 as [Hret [Hyn [Har [Hrot [Hva [Hnodes Hkeys]]]]]].
pose proof PreH1 as [Hv [Hr [Hx [Hnx Hmore]]]].
pose proof (avl_left_rotation_domain_keys__left_rotation_graph_heights b a x y x Hrot) as [_ [_ Hxiff]].
assert (Hxa : avl_vvalid a x) by (apply Hxiff;exact Hx).
pose proof (avl_subtree_projection_valid__lr_graph_composition a x Hva Hxa) as Hvp.
pose proof (left_rotation_update_children_safe__single_rotations b a x y PreH1 PreH2) as [Hsp Hsy].
pose proof (avl_left_rotation_pivot_children__left_rotation_graph_heights b a x y Hv Hrot) as [Ryl [Ryr [Rxr Rxl]]].
pose proof (avl_projection_children__lr_graph_composition a x x ltac:(reflexivity)) as [PL PR].
split_pure_spatial.
- rewrite <- Hret.
  sep_apply_l_atomic (left_fringe_store_transfer__single_rotations b a x y (avl_left b x) PreH1 PreH2 (or_introl eq_refl)).
  sep_apply_l_atomic (left_fringe_store_transfer__single_rotations b a x y (avl_left b y) PreH1 PreH2 (or_intror (or_introl eq_refl))).
  sep_apply_r_atomic (cached_subtree_node_fold__single_rotations a x root_cached_height_low_level_spec PreH3 Hxa PreH5).
  rewrite Rxl, Rxr.
  prop_apply_p (store_int_range (&(x # "AvlNode" ->ₛ "data")) (avl_key_of b x)).
  Intros_p Hkey.
  prop_apply_p (store_uint_range (&(x # "AvlNode" ->ₛ "height")) root_cached_height_low_level_spec).
  Intros_p Hcache.
  unfold avl_graph_node_store.
  change (avl_vvalid (avl_with_root_cache (avl_subtree_model a x) x root_cached_height_low_level_spec) x)
    with (avl_vvalid a x /\ avl_reachable a x x).
  change (avl_key_of (avl_with_root_cache (avl_subtree_model a x) x root_cached_height_low_level_spec) x)
    with (avl_key_of a x).
  change (avl_left (avl_with_root_cache (avl_subtree_model a x) x root_cached_height_low_level_spec) x)
    with (avl_left (avl_subtree_model a x) x).
  change (avl_right (avl_with_root_cache (avl_subtree_model a x) x root_cached_height_low_level_spec) x)
    with (avl_right (avl_subtree_model a x) x).
  assert (Ec : avl_height_of (avl_with_root_cache (avl_subtree_model a x) x root_cached_height_low_level_spec) x =
    root_cached_height_low_level_spec).
  { unfold avl_with_root_cache, avl_height_update; simpl. destruct (Z.eq_dec x x); congruence. }
  rewrite Ec, Hkeys, PL, PR, Rxl, Rxr. entailer!.
- entailer!.
Qed. 

Lemma proof_of_crtos_avl_left_rotate_crtos_entail_wit_5 : crtos_avl_left_rotate_crtos_entail_wit_5.
Proof.
pre_process.
rename avl_node_pre into x.
rename before_low_level_spec into b.
rename after into a.
rename promoted into y.
pose proof PreH2 as [Hret [Hyn [Har [Hrot [Hva [Hnodes Hkeys]]]]]].
pose proof PreH1 as [Hv [Hr [Hx [Hnx Hmore]]]].
pose proof (avl_left_rotation_domain_keys__left_rotation_graph_heights b a x y x Hrot) as [_ [_ Hxiff]].
assert (Hxa : avl_vvalid a x) by (apply Hxiff;exact Hx).
assert (Hya : avl_vvalid a y).
{ exact (proj2 (avl_public_root_valid__insert_projection_graft a y PreH3 ltac:(rewrite Har;reflexivity) Hyn)). }
pose proof (left_rotation_update_children_safe__single_rotations b a x y PreH1 PreH2) as [Hsp Hsy].
pose proof (avl_left_rotation_pivot_children__left_rotation_graph_heights b a x y Hv Hrot) as [Ryl [Ryr [Rxr Rxl]]].
split_pure_spatial.
- sep_apply_l_atomic (projection_store_back__single_rotations a x PreH3 Hxa).
  sep_apply_l_atomic (left_fringe_store_transfer__single_rotations b a x y (avl_right b y) PreH1 PreH2 (or_intror (or_intror eq_refl))).
  sep_apply_r_atomic (cached_root_fields_fold__single_rotations a y (avl_height_of b y) PreH3 Har Hya Hyn).
  rewrite Ryl, Ryr. simpl avl_ptr_of.
  prop_apply_p (store_int_range (&(y # "AvlNode" ->ₛ "data")) (avl_key_of b y)).
  Intros_p Hkey.
  prop_apply_p (store_uint_range (&(y # "AvlNode" ->ₛ "height")) (avl_height_of b y)).
  Intros_p Hcache.
  unfold avl_graph_node_store.
  change (avl_vvalid (avl_with_root_cache a y (avl_height_of b y)) y) with (avl_vvalid a y).
  change (avl_key_of (avl_with_root_cache a y (avl_height_of b y)) y) with (avl_key_of a y).
  change (avl_left (avl_with_root_cache a y (avl_height_of b y)) y) with (avl_left a y).
  change (avl_right (avl_with_root_cache a y (avl_height_of b y)) y) with (avl_right a y).
  assert (Ec : avl_height_of (avl_with_root_cache a y (avl_height_of b y)) y = avl_height_of b y).
  { unfold avl_with_root_cache, avl_height_update; simpl. destruct (Z.eq_dec y y); congruence. }
  rewrite Ec, Hkeys, Ryl, Ryr. simpl avl_ptr_of. entailer!.
- rewrite Har. simpl avl_ptr_of. entailer!.
Qed. 

Lemma proof_of_crtos_avl_left_rotate_crtos_return_wit_1 : crtos_avl_left_rotate_crtos_return_wit_1.
Proof.
pre_process. unfold avl_left_rotation_post. Exists after. entailer!.
Qed. 

Lemma proof_of_crtos_avl_lr_rotate_crtos_entail_wit_1 : crtos_avl_lr_rotate_crtos_entail_wit_1.
Proof.
  pre_process.
  assert (avl_node_pre <> 0) by (unfold avl_lr_rotation_input, NULL in PreH1; tauto).
  entailer!.
Qed. 

Lemma proof_of_crtos_avl_lr_rotate_crtos_entail_wit_3 : crtos_avl_lr_rotate_crtos_entail_wit_3.
Proof.
  pre_process.
  pose proof (avl_lr_prepare_inner__lr_graph_composition before_low_level_spec avl_node_pre PreH1) as Hin.
  split_pure_spatial.
  - sep_apply_l_atomic (avl_lr_expose_inner__lr_graph_composition before_low_level_spec avl_node_pre root_cached_height_low_level_spec PreH1).
    entailer!.
  - split_pures; dump_pre_spatial; assumption.
Qed. 

Lemma proof_of_crtos_avl_lr_rotate_crtos_entail_wit_4 : crtos_avl_lr_rotate_crtos_entail_wit_4.
Proof.
  pre_process.
  unfold avl_left_rotation_post.
  Intros after.
  prop_apply (store_int_range (&(avl_node_pre # "AvlNode" ->ₛ "data")) (avl_key_of before_low_level_spec avl_node_pre)).
  Intros.
  prop_apply (store_uint_range (&(avl_node_pre # "AvlNode" ->ₛ "height")) root_cached_height_low_level_spec).
  Intros.
  sep_apply_l_atomic (avl_lr_lift__lr_graph_composition before_low_level_spec after avl_node_pre retval root_cached_height_low_level_spec PreH1 H H1 H0).
  Intros middle.
  Exists middle.
  entailer!.
Qed. 

Lemma proof_of_crtos_avl_lr_rotate_crtos_return_wit_1 : crtos_avl_lr_rotate_crtos_return_wit_1.
Proof.
  pre_process.
  unfold avl_right_rotation_post, avl_lr_rotation_post.
  Intros after.
  Exists after.
  entailer!.
  eapply avl_lr_compose_result__lr_graph_composition; eauto.
Qed. 

Lemma proof_of_crtos_avl_rl_rotate_crtos_entail_wit_1 : crtos_avl_rl_rotate_crtos_entail_wit_1.
Proof.
  pre_process.
  assert (avl_node_pre <> 0) by (unfold avl_rl_rotation_input, NULL in PreH1; tauto).
  entailer!.
Qed. 

Lemma proof_of_crtos_avl_rl_rotate_crtos_entail_wit_3 : crtos_avl_rl_rotate_crtos_entail_wit_3.
Proof.
  pre_process.
  pose proof (avl_rl_prepare_inner__rl_graph_composition before_low_level_spec avl_node_pre PreH1) as Hin.
  split_pure_spatial.
  - sep_apply_l_atomic (avl_rl_expose_inner__rl_graph_composition before_low_level_spec avl_node_pre root_cached_height_low_level_spec PreH1).
    entailer!.
  - split_pures; dump_pre_spatial; assumption.
Qed. 

Lemma proof_of_crtos_avl_rl_rotate_crtos_entail_wit_4 : crtos_avl_rl_rotate_crtos_entail_wit_4.
Proof.
  pre_process.
  unfold avl_right_rotation_post.
  Intros after.
  prop_apply (store_int_range (&(avl_node_pre # "AvlNode" ->ₛ "data")) (avl_key_of before_low_level_spec avl_node_pre)).
  Intros.
  prop_apply (store_uint_range (&(avl_node_pre # "AvlNode" ->ₛ "height")) root_cached_height_low_level_spec).
  Intros.
  sep_apply_l_atomic (avl_rl_lift__rl_graph_composition before_low_level_spec after avl_node_pre retval root_cached_height_low_level_spec PreH1 H H1 H0).
  Intros middle.
  Exists middle.
  entailer!.
Qed. 

Lemma proof_of_crtos_avl_rl_rotate_crtos_return_wit_1 : crtos_avl_rl_rotate_crtos_return_wit_1.
Proof.
  pre_process.
  unfold avl_left_rotation_post, avl_rl_rotation_post.
  Intros after.
  Exists after.
  entailer!.
  eapply avl_rl_compose_result__rl_graph_composition; eauto.
Qed. 

Lemma proof_of_crtos_avl_balance_crtos_entail_wit_1 : crtos_avl_balance_crtos_entail_wit_1.
Proof.
pre_process.
pose proof (avl_balance_facts__single_rotation_and_accessors before_high_level_spec avl_node_pre PreH2) as [HV [FV Roots]].
pose proof (Roots PreH1) as [Root Vp].
split_pure_spatial.
- apply avl_root_tree_store_to_subtree_store; [exact HV|rewrite Root; reflexivity].
- entailer!.
Qed. 

Lemma proof_of_crtos_avl_balance_crtos_entail_wit_2 : crtos_avl_balance_crtos_entail_wit_2.
Proof.
pre_process.
pose proof (avl_balance_facts__single_rotation_and_accessors before_high_level_spec avl_node_pre PreH8) as [HV [FV Roots]].
split_pure_spatial.
- sep_apply_l_atomic (avl_subtree_store_decompose__height_accessor before_high_level_spec avl_node_pre HV PreH1 PreH2).
  unfold avl_graph_node_store. entailer!.
- entailer!.
Qed. 

Lemma proof_of_crtos_avl_balance_crtos_entail_wit_3_1 : crtos_avl_balance_crtos_entail_wit_3_1.
Proof.
pre_process.
pose proof (avl_balance_facts__single_rotation_and_accessors before_high_level_spec avl_node_pre PreH10) as [HV [FV Roots]].
pose proof (Roots PreH12) as [Root Vp].
assert (Rot:avl_right_rotation_input before_high_level_spec avl_node_pre).
{ apply avl_balance_right_input__single_rotation_and_accessors; auto; lia. }
pose proof (proj1 (proj2 HV) avl_node_pre Vp) as [HB HE].
prop_apply_p (store_int_range (&(avl_node_pre # "AvlNode" ->ₛ "data")) (avl_key_of before_high_level_spec avl_node_pre)).
Intros_p KB.
split_pure_spatial.
- rewrite avl_cache_self__lr_graph_composition.
  sep_apply_r_atomic (avl_subtree_store_to_root_tree_store before_high_level_spec avl_node_pre HV (eq_trans (eq_refl avl_node_pre) (eq_sym (f_equal avl_ptr_of Root)))).
  sep_apply_r_atomic (avl_subtree_store_fold__height_accessor before_high_level_spec avl_node_pre HV PreH12 Vp).
  unfold avl_graph_node_store. entailer!; lia.
- entailer!.
Qed. 

Lemma proof_of_crtos_avl_balance_crtos_entail_wit_3_2 : crtos_avl_balance_crtos_entail_wit_3_2.
Proof.
pre_process.
pose proof (avl_balance_facts__single_rotation_and_accessors before_high_level_spec avl_node_pre PreH7) as [HV [FV Roots]].
pose proof (Roots PreH9) as [Root Vp].
destruct FV as [BV [HC [NN [Availability Bound]]]].
assert (Positive:avl_model_balance_factor before_high_level_spec avl_node_pre > 0) by lia.
destruct (proj1 (Availability avl_node_pre Vp) Positive) as [l [Edge Vl]].
pose proof (NN l Vl) as Nl.
rewrite Edge in PreH2. simpl in PreH2. contradiction.
Qed. 

Lemma proof_of_crtos_avl_balance_crtos_entail_wit_4 : crtos_avl_balance_crtos_entail_wit_4.
Proof.
pre_process.
pose proof (avl_balance_facts__single_rotation_and_accessors before_high_level_spec avl_node_pre PreH10) as [HV [FV Roots]].
pose proof (Roots PreH12) as [Root Vp].
pose proof (proj2 PreH10 PreH12) as FactorBound.
apply Z.abs_le in FactorBound.
assert (Rot:avl_lr_rotation_input before_high_level_spec avl_node_pre).
{ eapply (avl_balance_lr_input__double_rotation_restoration before_high_level_spec avl_node_pre bf retval); eauto.
  - unfold avl_balance_factor_or_null. right. repeat split; auto; lia.
  - unfold avl_balance_factor_or_null. right. repeat split; auto.
}
pose proof (proj1 (proj2 HV) avl_node_pre Vp) as [HB HE].
prop_apply_p (store_int_range (&(avl_node_pre # "AvlNode" ->ₛ "data")) (avl_key_of before_high_level_spec avl_node_pre)).
Intros_p KB.
split_pure_spatial.
- rewrite avl_cache_self__lr_graph_composition.
  sep_apply_r_atomic (avl_subtree_store_to_root_tree_store before_high_level_spec avl_node_pre HV (eq_trans (eq_refl avl_node_pre) (eq_sym (f_equal avl_ptr_of Root)))).
  sep_apply_r_atomic (avl_subtree_store_fold__height_accessor before_high_level_spec avl_node_pre HV PreH12 Vp).
  unfold avl_graph_node_store. entailer!; lia.
- entailer!.
Qed. 

Lemma proof_of_crtos_avl_balance_crtos_entail_wit_5_1 : crtos_avl_balance_crtos_entail_wit_5_1.
Proof.
pre_process.
pose proof (avl_balance_facts__single_rotation_and_accessors before_high_level_spec avl_node_pre PreH11) as [HV [FV Roots]].
pose proof (Roots PreH13) as [Root Vp].
assert (Rot:avl_left_rotation_cached_input before_high_level_spec avl_node_pre).
{ apply avl_balance_left_input__single_rotation_and_accessors; auto; lia. }
pose proof (proj1 (proj2 HV) avl_node_pre Vp) as [HB HE].
prop_apply_p (store_int_range (&(avl_node_pre # "AvlNode" ->ₛ "data")) (avl_key_of before_high_level_spec avl_node_pre)).
Intros_p KB.
split_pure_spatial.
- rewrite avl_cache_self__lr_graph_composition.
  sep_apply_r_atomic (avl_subtree_store_to_root_tree_store before_high_level_spec avl_node_pre HV (eq_trans (eq_refl avl_node_pre) (eq_sym (f_equal avl_ptr_of Root)))).
  sep_apply_r_atomic (avl_subtree_store_fold__height_accessor before_high_level_spec avl_node_pre HV PreH13 Vp).
  unfold avl_graph_node_store. entailer!; lia.
- entailer!.
Qed. 

Lemma proof_of_crtos_avl_balance_crtos_entail_wit_5_2 : crtos_avl_balance_crtos_entail_wit_5_2.
Proof.
pre_process.
pose proof (avl_balance_facts__single_rotation_and_accessors before_high_level_spec avl_node_pre PreH8) as [HV [FV Roots]].
pose proof (Roots PreH10) as [Root Vp].
destruct FV as [BV [HC [NN [Availability Bound]]]].
assert (Negative:avl_model_balance_factor before_high_level_spec avl_node_pre < 0) by lia.
destruct (proj2 (Availability avl_node_pre Vp) Negative) as [l [Edge Vl]].
pose proof (NN l Vl) as Nl.
rewrite Edge in PreH2. simpl in PreH2. contradiction.
Qed. 

Lemma proof_of_crtos_avl_balance_crtos_entail_wit_6 : crtos_avl_balance_crtos_entail_wit_6.
Proof.
pre_process.
pose proof (avl_balance_facts__single_rotation_and_accessors before_high_level_spec avl_node_pre PreH11) as [HV [FV Roots]].
pose proof (Roots PreH13) as [Root Vp].
pose proof (proj2 PreH11 PreH13) as FactorBound.
apply Z.abs_le in FactorBound.
assert (Rot:avl_rl_rotation_input before_high_level_spec avl_node_pre).
{ eapply (avl_balance_rl_input__double_rotation_restoration before_high_level_spec avl_node_pre bf retval); eauto.
  - unfold avl_balance_factor_or_null. right. repeat split; auto; lia.
  - unfold avl_balance_factor_or_null. right. repeat split; auto.
}
pose proof (proj1 (proj2 HV) avl_node_pre Vp) as [HB HE].
prop_apply_p (store_int_range (&(avl_node_pre # "AvlNode" ->ₛ "data")) (avl_key_of before_high_level_spec avl_node_pre)).
Intros_p KB.
split_pure_spatial.
- rewrite avl_cache_self__lr_graph_composition.
  sep_apply_r_atomic (avl_subtree_store_to_root_tree_store before_high_level_spec avl_node_pre HV (eq_trans (eq_refl avl_node_pre) (eq_sym (f_equal avl_ptr_of Root)))).
  sep_apply_r_atomic (avl_subtree_store_fold__height_accessor before_high_level_spec avl_node_pre HV PreH13 Vp).
  unfold avl_graph_node_store. entailer!; lia.
- entailer!.
Qed. 

Lemma proof_of_crtos_avl_balance_crtos_return_wit_1 : crtos_avl_balance_crtos_return_wit_1.
Proof.
  aggressive_pre_process.
  destruct (avl_balance_facts__single_rotation_and_accessors
    before_high_level_spec avl_node_pre PreH9) as [Hheight [Hfactor Hroot]].
  destruct (Hroot PreH11) as [Hroot_eq Hvalid].
  assert (Hptr : avl_node_pre = avl_ptr_of (avl_root before_high_level_spec)).
  { rewrite Hroot_eq. reflexivity. }
  Exists before_high_level_spec.
  split_pure_spatial.
  - sep_apply_r_atomic (avl_subtree_store_to_root_tree_store
      before_high_level_spec avl_node_pre Hheight Hptr).
    sep_apply_r_atomic (avl_subtree_store_fold__height_accessor
      before_high_level_spec avl_node_pre Hheight PreH11 Hvalid).
    unfold avl_graph_node_store. entailer!.
  - split_pures; dump_pre_spatial.
    + apply avl_balance_unchanged__single_rotation_and_accessors; [exact PreH9|].
      right. apply Z.abs_le. lia.
    + unfold avl_balance_height_effect. split; [lia|reflexivity].
    + unfold strict_balance_identity. intros _.
      apply strict_same_graph_refl__strict_graph_lifecycle.
Qed. 

Lemma proof_of_crtos_avl_balance_crtos_return_wit_2 : crtos_avl_balance_crtos_return_wit_2.
Proof.
  pre_process.
  unfold avl_rl_rotation_post. Intros after.
  destruct (avl_balance_facts__single_rotation_and_accessors
    before_high_level_spec avl_node_pre PreH1) as [Hheight [Hfactor Hroot]].
  assert (Hnon : avl_node_pre <> 0).
  { intro E. rewrite E in PreH2.
    pose proof (avl_null_balance_factor__null_unmatched_balanced_results
      before_high_level_spec Hfactor). unfold NULL in *; lia. }
  destruct (Hroot Hnon) as [Hroot_eq Hvalid].
  assert (Hchild : avl_balance_factor_or_null before_high_level_spec
    (avl_ptr_of (avl_right before_high_level_spec avl_node_pre)) child_bf).
  { rewrite PreH3. apply model_factor_or_null__balance_results; [exact Hfactor|].
    intro Hc. eapply avl_right_child_nonnull_valid__height_accessor; eauto. }
  Exists after.
  split_pure_spatial.
  - entailer!.
  - split_pures; dump_pre_spatial.
    + eapply avl_balance_rl_result__double_rotation_restoration
        with (f := child_bf); eauto; lia.
    + eapply avl_balance_rl_height_effect__height_effect_returns
        with (f := child_bf); eauto; lia.
    + unfold strict_balance_identity. intro Hbalanced.
      specialize (Hbalanced avl_node_pre Hvalid).
      apply Z.abs_le in Hbalanced. exfalso. lia.
Qed. 

Lemma proof_of_crtos_avl_balance_crtos_return_wit_3 : crtos_avl_balance_crtos_return_wit_3.
Proof.
  pre_process.
  unfold avl_left_rotation_post. Intros after.
  destruct (avl_balance_facts__single_rotation_and_accessors
    before_high_level_spec avl_node_pre PreH1) as [Hheight [Hfactor Hroot]].
  assert (Hnon : avl_node_pre <> 0).
  { intro E. rewrite E in PreH2.
    pose proof (avl_null_balance_factor__null_unmatched_balanced_results
      before_high_level_spec Hfactor). unfold NULL in *; lia. }
  destruct (Hroot Hnon) as [Hroot_eq Hvalid].
  assert (Hchild : avl_balance_factor_or_null before_high_level_spec
    (avl_ptr_of (avl_right before_high_level_spec avl_node_pre)) child_bf).
  { rewrite PreH3. apply model_factor_or_null__balance_results; [exact Hfactor|].
    intro Hc. eapply avl_right_child_nonnull_valid__height_accessor; eauto. }
  Exists after.
  split_pure_spatial.
  - entailer!.
  - split_pures; dump_pre_spatial.
    + eapply avl_balance_left_result__single_rotation_and_accessors
        with (cf := child_bf); eauto; lia.
    + eapply avl_balance_left_height_effect__height_effect_returns
        with (cf := child_bf); eauto; lia.
    + unfold strict_balance_identity. intro Hbalanced.
      specialize (Hbalanced avl_node_pre Hvalid).
      apply Z.abs_le in Hbalanced. exfalso. lia.
Qed. 

Lemma proof_of_crtos_avl_balance_crtos_return_wit_4 : crtos_avl_balance_crtos_return_wit_4.
Proof.
  pre_process.
  unfold avl_lr_rotation_post. Intros after.
  destruct (avl_balance_facts__single_rotation_and_accessors
    before_high_level_spec avl_node_pre PreH1) as [Hheight [Hfactor Hroot]].
  assert (Hnon : avl_node_pre <> 0).
  { intro E. rewrite E in PreH2.
    pose proof (avl_null_balance_factor__null_unmatched_balanced_results
      before_high_level_spec Hfactor). unfold NULL in *; lia. }
  destruct (Hroot Hnon) as [Hroot_eq Hvalid].
  assert (Hchild : avl_balance_factor_or_null before_high_level_spec
    (avl_ptr_of (avl_left before_high_level_spec avl_node_pre)) child_bf).
  { rewrite PreH3. apply model_factor_or_null__balance_results; [exact Hfactor|].
    intro Hc. eapply avl_left_child_nonnull_valid__height_accessor; eauto. }
  Exists after.
  split_pure_spatial.
  - entailer!.
  - split_pures; dump_pre_spatial.
    + eapply avl_balance_lr_result__double_rotation_restoration
        with (f := child_bf); eauto; lia.
    + eapply avl_balance_lr_height_effect__height_effect_returns
        with (f := child_bf); eauto; lia.
    + unfold strict_balance_identity. intro Hbalanced.
      specialize (Hbalanced avl_node_pre Hvalid).
      apply Z.abs_le in Hbalanced. exfalso. lia.
Qed. 

Lemma proof_of_crtos_avl_balance_crtos_return_wit_5 : crtos_avl_balance_crtos_return_wit_5.
Proof.
  pre_process.
  unfold avl_right_rotation_post. Intros after.
  destruct (avl_balance_facts__single_rotation_and_accessors
    before_high_level_spec avl_node_pre PreH1) as [Hheight [Hfactor Hroot]].
  assert (Hnon : avl_node_pre <> 0).
  { intro E. rewrite E in PreH2.
    pose proof (avl_null_balance_factor__null_unmatched_balanced_results
      before_high_level_spec Hfactor). unfold NULL in *; lia. }
  destruct (Hroot Hnon) as [Hroot_eq Hvalid].
  assert (Hchild : avl_balance_factor_or_null before_high_level_spec
    (avl_ptr_of (avl_left before_high_level_spec avl_node_pre)) child_bf).
  { rewrite PreH3. apply model_factor_or_null__balance_results; [exact Hfactor|].
    intro Hc. eapply avl_left_child_nonnull_valid__height_accessor; eauto. }
  Exists after.
  split_pure_spatial.
  - entailer!.
  - split_pures; dump_pre_spatial.
    + eapply avl_balance_right_result__single_rotation_and_accessors
        with (cf := child_bf); eauto; lia.
    + eapply avl_balance_right_height_effect__height_effect_returns
        with (cf := child_bf); eauto; lia.
    + unfold strict_balance_identity. intro Hbalanced.
      specialize (Hbalanced avl_node_pre Hvalid).
      apply Z.abs_le in Hbalanced. exfalso. lia.
Qed. 

Lemma proof_of_crtos_avl_balance_crtos_return_wit_6 : crtos_avl_balance_crtos_return_wit_6.
Proof.
  pre_process. subst avl_node_pre.
  Exists before_high_level_spec.
  split_pure_spatial.
  - entailer!.
  - split_pures; dump_pre_spatial.
    + apply avl_balance_unchanged__single_rotation_and_accessors; [exact PreH2|].
      left; reflexivity.
    + unfold avl_balance_height_effect. split; [lia|reflexivity].
    + unfold strict_balance_identity. intros _.
      apply strict_same_graph_refl__strict_graph_lifecycle.
Qed. 

Lemma proof_of_AvlTreeInsertNode_entail_wit_1 : AvlTreeInsertNode_entail_wit_1.
Proof.
pre_process.
destruct (Z.eq_dec avl_node_pre 0) as [E|N].
- Left.
  sep_apply_l_atomic (avl_subtree_store_to_root_tree_store before_low_level_spec avl_node_pre (proj1 PreH1) (proj1 (proj2 (proj2 PreH1)))).
  entailer!.
- Right.
  pose proof (avl_public_root_valid__insert_projection_graft before_low_level_spec avl_node_pre (proj1 PreH1) (proj1 (proj2 (proj2 PreH1))) N) as [Root Vp].
  assert (G:avl_gvalid before_low_level_spec) by (apply avl_gvalid_tree_valid_iff; split; [exact (proj1 PreH1)|exact (proj1 (proj2 PreH1))]).
  sep_apply_l_atomic (avl_subtree_store_decompose__graph_store_decomposition before_low_level_spec avl_node_pre G N Vp).
  sep_apply_l_atomic (avl_child_store_forward__insert_projection_graft before_low_level_spec (avl_left before_low_level_spec avl_node_pre) (proj1 PreH1)).
  sep_apply_l_atomic (avl_child_store_forward__insert_projection_graft before_low_level_spec (avl_right before_low_level_spec avl_node_pre) (proj1 PreH1)).
  unfold avl_graph_node_store. entailer!.
Qed. 

Lemma proof_of_AvlTreeInsertNode_entail_wit_2 : AvlTreeInsertNode_entail_wit_2.
Proof.
pre_process.
pose proof (avl_child_insert_input__insert_projection_graft before_low_level_spec avl_node_pre data_pre (avl_right before_low_level_spec avl_node_pre) PreH4 PreH6 (or_intror eq_refl)) as ChildInput.
sep_apply_l_atomic (avl_root_tree_store_to_subtree_store (avl_child_model before_low_level_spec (avl_right before_low_level_spec avl_node_pre)) (avl_ptr_of (avl_right before_low_level_spec avl_node_pre)) (proj1 ChildInput) (proj1 (proj2 (proj2 ChildInput)))).
entailer!.
Qed. 

Lemma proof_of_AvlTreeInsertNode_entail_wit_3 : AvlTreeInsertNode_entail_wit_3.
Proof.
pre_process.
pose proof (avl_child_insert_input__insert_projection_graft before_low_level_spec avl_node_pre data_pre (avl_left before_low_level_spec avl_node_pre) PreH4 PreH6 (or_introl eq_refl)) as ChildInput.
sep_apply_l_atomic (avl_root_tree_store_to_subtree_store (avl_child_model before_low_level_spec (avl_left before_low_level_spec avl_node_pre)) (avl_ptr_of (avl_left before_low_level_spec avl_node_pre)) (proj1 ChildInput) (proj1 (proj2 (proj2 ChildInput)))).
entailer!.
Qed. 

Lemma proof_of_AvlTreeInsertNode_entail_wit_4_1 : AvlTreeInsertNode_entail_wit_4_1.
Proof.
pre_process.
subst avl_node_pre.
pose proof (strict_singleton_pending__strict_graph_lifecycle before_low_level_spec data_pre retval PreH4 PreH2) as Pend.
pose proof (proj1 Pend) as [_ [_ [Balance [Valid [Safe _]]]]].
pose proof (strict_empty_domain__strict_graph_lifecycle before_low_level_spec data_pre PreH4) as [ER [EN Empty]].
Exists 1 (avl_join_model retval data_pre avl_empty_model avl_empty_model).
unfold avl_tree_store at 1. rewrite EN.
assert (Emp:avl_tree_store avl_empty_model=emp) by reflexivity.
pose proof (avl_join_cached_store__insert_projection_graft retval data_pre avl_empty_model avl_empty_model 1 PreH2 (proj1 avl_empty_valid__insert_projection_graft) (proj1 avl_empty_valid__insert_projection_graft) (fun H=>H) (fun H=>H) (fun x H=>False_rect _ H)) as Fold.
rewrite Emp in Fold.
replace (avl_ptr_of (avl_root avl_empty_model)) with 0 in Fold by reflexivity.
change (avl_graph_nodes_store before_low_level_spec nil) with emp.
entailer!.
sep_apply_r_atomic Fold.
entailer!.
Qed. 

Lemma proof_of_AvlTreeInsertNode_entail_wit_4_2 : AvlTreeInsertNode_entail_wit_4_2.
Proof.
pre_process.
assert (Nret:retval<>0) by lia.
pose proof PreH2 as O.
destruct O as [[Z _]|[Success _]]; [contradiction|].
pose proof Success as [[_ [Gr _]] [_ [RetRoot _]]].
pose proof (avl_gvalid_tree_valid after Gr) as Vr.
pose proof (avl_child_insert_input__insert_projection_graft before_low_level_spec avl_node_pre data_pre (avl_left before_low_level_spec avl_node_pre) PreH3 PreH5 (or_introl eq_refl)) as IL.
pose proof (strict_parent_regions__strict_graph_lifecycle before_low_level_spec avl_node_pre data_pre PreH3 PreH5) as [NL [_ _]].
prop_apply_p (avl_owned_root_excluded__insert_projection_graft after avl_node_pre (avl_key_of before_low_level_spec avl_node_pre) Vr).
Intros_p NR.
prop_apply_p (avl_owned_graphs_disjoint__insert_projection_graft (avl_child_model before_low_level_spec (avl_left before_low_level_spec avl_node_pre)) after (proj1 IL) Vr).
Intros_p DJ.
pose proof (strict_success_right_pending__strict_graph_lifecycle before_low_level_spec avl_node_pre data_pre after retval PreH3 PreH5 PreH6 PreH2 Nret NR DJ) as Pend.
pose proof (proj1 Pend) as [_ [_ [Balance [Valid [Safe _]]]]].
Exists (avl_height_of before_low_level_spec avl_node_pre) (avl_join_model avl_node_pre (avl_key_of before_low_level_spec avl_node_pre) (avl_child_model before_low_level_spec (avl_left before_low_level_spec avl_node_pre)) after).
pose proof (avl_join_cached_store__insert_projection_graft avl_node_pre (avl_key_of before_low_level_spec avl_node_pre) (avl_child_model before_low_level_spec (avl_left before_low_level_spec avl_node_pre)) after (avl_height_of before_low_level_spec avl_node_pre) PreH5 (proj1 IL) Vr NL NR DJ) as Fold.
rewrite (proj1 (avl_child_root__insert_projection_graft _ _)),<-RetRoot in Fold.
entailer!.
sep_apply_r_atomic Fold.
entailer!.
Qed. 

Lemma proof_of_AvlTreeInsertNode_entail_wit_4_3 : AvlTreeInsertNode_entail_wit_4_3.
Proof.
pre_process.
assert (Nret:retval<>0) by lia.
pose proof PreH2 as O.
destruct O as [[Z _]|[Success _]]; [contradiction|].
pose proof Success as [[_ [Gr _]] [_ [RetRoot _]]].
pose proof (avl_gvalid_tree_valid after Gr) as Vr.
pose proof (avl_child_insert_input__insert_projection_graft before_low_level_spec avl_node_pre data_pre (avl_right before_low_level_spec avl_node_pre) PreH3 PreH5 (or_intror eq_refl)) as IL.
pose proof (strict_parent_regions__strict_graph_lifecycle before_low_level_spec avl_node_pre data_pre PreH3 PreH5) as [_ [NL _]].
prop_apply_p (avl_owned_root_excluded__insert_projection_graft after avl_node_pre (avl_key_of before_low_level_spec avl_node_pre) Vr).
Intros_p NR.
prop_apply_p (avl_owned_graphs_disjoint__insert_projection_graft (avl_child_model before_low_level_spec (avl_right before_low_level_spec avl_node_pre)) after (proj1 IL) Vr).
Intros_p DJ.
pose proof (strict_success_left_pending__strict_graph_lifecycle before_low_level_spec avl_node_pre data_pre after retval PreH3 PreH5 PreH6 PreH2 Nret NR DJ) as Pend.
pose proof (proj1 Pend) as [_ [_ [Balance [Valid [Safe _]]]]].
Exists (avl_height_of before_low_level_spec avl_node_pre) (avl_join_model avl_node_pre (avl_key_of before_low_level_spec avl_node_pre) after (avl_child_model before_low_level_spec (avl_right before_low_level_spec avl_node_pre))).
pose proof (avl_join_cached_store__insert_projection_graft avl_node_pre (avl_key_of before_low_level_spec avl_node_pre) after (avl_child_model before_low_level_spec (avl_right before_low_level_spec avl_node_pre)) (avl_height_of before_low_level_spec avl_node_pre) PreH5 Vr (proj1 IL) NR NL (fun x H J=>DJ x J H)) as Fold.
rewrite (proj1 (avl_child_root__insert_projection_graft _ _)),<-RetRoot in Fold.
entailer!.
sep_apply_r_atomic Fold.
entailer!.
Qed. 

Lemma proof_of_AvlTreeInsertNode_return_wit_1 : AvlTreeInsertNode_return_wit_1.
Proof.
pre_process.
Exists after_2.
entailer!.
exact (strict_pending_balance_finish__strict_graph_lifecycle before_low_level_spec raw after_2 data_pre avl_node retval PreH4 PreH1 PreH2 PreH3).
Qed. 

Lemma proof_of_AvlTreeInsertNode_return_wit_2 : AvlTreeInsertNode_return_wit_2.
Proof.
aggressive_pre_process.
subst retval.
destruct (strict_failure_graft_model__strict_graph_lifecycle before_low_level_spec avl_node_pre data_pre after_2
 (avl_left before_low_level_spec avl_node_pre) (avl_right before_low_level_spec avl_node_pre)
 None (avl_right before_low_level_spec avl_node_pre) PreH7 PreH9 ltac:(left; repeat split; auto) PreH6)
 as [final [Outcome [Nodes [L [R [CE OE]]]]]].

assert (Store:
 avl_graph_node_store final avl_node_pre ** avl_tree_store after_2 **
 avl_tree_store (avl_child_model before_low_level_spec (avl_right before_low_level_spec avl_node_pre))
 |-- avl_tree_store final).
{
 set (g:=before_low_level_spec).
 set (p:=avl_node_pre).
 set (key:=data_pre).
 set (failed:=after_2).
 set (c:=avl_left g p).
 set (d:=avl_right g p).
 pose proof PreH7 as Input.
 pose proof PreH9 as Np.
 assert (Choice:(c=avl_left g p /\ d=avl_right g p) \/ (c=avl_right g p /\ d=avl_left g p)).
 { left; split; reflexivity. }
 pose proof PreH6 as ChildOutcome.
 pose proof Outcome as FinalOutcome.
 pose proof L as RootL.
 pose proof R as RootR.
 pose proof CE as ChildEdges.
 pose proof OE as OtherEdges.
 clear L R CE OE.
 fold g p key failed c d in Input,Np,ChildOutcome,FinalOutcome,Nodes,RootL,RootR,ChildEdges,OtherEdges.
 fold g p key failed c d.

 destruct ChildOutcome as [[_ [_ Failure]]|[Success _]].
 2: { destruct Success as [_ [N _]]. contradiction. }
 destruct FinalOutcome as [[_ [_ Effect]]|[Success _]].
 2: { destruct Success as [_ [N _]]. contradiction. }
 pose proof Failure as [_ [PF [DF FF]]].
 pose proof Effect as [_ [_ [DG FG]]].
 assert (SideC:c=avl_left g p \/ c=avl_right g p) by tauto.
 assert (SideD:d=avl_left g p \/ d=avl_right g p) by tauto.
 pose proof (avl_child_insert_input__insert_projection_graft g p key c Input Np SideC) as IC.
 pose proof (avl_child_insert_input__insert_projection_graft g p key d Input Np SideD) as ID.
 pose proof (avl_public_root_valid__insert_projection_graft g p (proj1 Input) (proj1 (proj2 (proj2 Input))) Np) as [Root Vp].
 pose proof (strict_parent_regions__strict_graph_lifecycle g p key Input Np) as [NL [NR DJ]].
 assert (NC:~avl_vvalid (avl_child_model g c) p) by (destruct SideC; subst c; auto).
 assert (ND:~avl_vvalid (avl_child_model g d) p) by (destruct SideD; subst d; auto).
 assert (DC:forall x,avl_vvalid (avl_child_model g d) x -> ~avl_vvalid (avl_child_model g c) x).
 { intros x H J. exact (DJ x J H). }
 assert (MF: SimpleC.SL.SeparationLogic.naive_C_Rules.derivable1 (avl_tree_store failed) (avl_graph_nodes_store final (avl_nodes failed))).
 { unfold avl_tree_store. apply avl_nodes_store_map__lr_graph_composition. intros x Hin.
   assert (VC:avl_vvalid (avl_child_model g c) x).
   { apply (strict_valid_nodes__strict_graph_lifecycle _ (proj1 IC)). exact (Permutation_in x (Permutation_sym PF) Hin). }
   assert (Nx:x<>p) by (intro E; subst x; contradiction).
   pose proof (strict_child_fields__strict_graph_lifecycle _ _ _ VC) as [VG [KC [HC _]]].
   pose proof (FF x VC) as [KF [HF _]].
   pose proof (FG x VG) as [KG [HG _]].
   pose proof (ChildEdges x Nx VC) as [LE RE].
   assert (K:avl_key_of final x=avl_key_of failed x) by congruence.
   assert (H:avl_height_of final x=avl_height_of failed x) by congruence.
   assert (VF:avl_vvalid final x) by (apply DG; exact VG).
   unfold avl_graph_node_store. rewrite K,H,LE,RE.
   unfold SimpleC.SL.SeparationLogic.naive_C_Rules.derivable1,SimpleC.SL.SeparationLogic.naive_C_Rules.andp,SimpleC.SL.SeparationLogic.naive_C_Rules.coq_prop. tauto. }
 assert (MD: SimpleC.SL.SeparationLogic.naive_C_Rules.derivable1 (avl_tree_store (avl_child_model g d))
   (avl_graph_nodes_store final (avl_nodes (avl_child_model g d)))).
 { unfold avl_tree_store. apply avl_nodes_store_map__lr_graph_composition. intros x Hin.
   assert (VD:avl_vvalid (avl_child_model g d) x) by (apply (strict_valid_nodes__strict_graph_lifecycle _ (proj1 ID)); exact Hin).
   assert (Nx:x<>p) by (intro E; subst x; contradiction).
   pose proof (strict_child_fields__strict_graph_lifecycle _ _ _ VD) as [VG [KD [HD [LD RD]]]].
   pose proof (FG x VG) as [KG [HG _]].
   pose proof (OtherEdges x Nx (DC x VD)) as [LE RE].
   assert (K:avl_key_of final x=avl_key_of (avl_child_model g d) x) by congruence.
   assert (H:avl_height_of final x=avl_height_of (avl_child_model g d) x) by congruence.
   assert (L:avl_left final x=avl_left (avl_child_model g d) x) by congruence.
   assert (R:avl_right final x=avl_right (avl_child_model g d) x) by congruence.
   assert (VF:avl_vvalid final x) by (apply DG; exact VG).
   unfold avl_graph_node_store. rewrite K,H,L,R.
   unfold SimpleC.SL.SeparationLogic.naive_C_Rules.derivable1,SimpleC.SL.SeparationLogic.naive_C_Rules.andp,SimpleC.SL.SeparationLogic.naive_C_Rules.coq_prop. tauto. }
 assert (Part:Permutation (avl_nodes g) (p::avl_nodes (avl_child_model g c)++avl_nodes (avl_child_model g d))).
 { pose proof (avl_parent_nodes__predecessor_graft g p (proj1 Input) (proj1 (proj2 (proj2 Input))) Np) as P.
   exact P. }
 assert (PartFinal:Permutation (avl_nodes final) (p::avl_nodes failed++avl_nodes (avl_child_model g d))).
 { rewrite Nodes. etransitivity; [exact Part|]. apply perm_skip. apply Permutation_app; [exact PF|reflexivity]. }




 unfold avl_tree_store at 3.
 rewrite (avl_graph_nodes_store_permutation__graph_store_decomposition final _ _ PartFinal).
 rewrite avl_graph_nodes_store_cons__graph_store_decomposition.
 sep_apply_l_atomic MF.
 sep_apply_l_atomic MD.
 sep_apply_l_atomic (avl_graph_nodes_store_app__graph_store_decomposition final (avl_nodes failed) (avl_nodes (avl_child_model g d))).
 entailer!.
}
pose proof Outcome as O.
destruct O as [[_ [_ Effect]]|[Success _]].
2: { destruct Success as [_ [N _]]. contradiction. }
pose proof Effect as [_ [_ [D F]]].
pose proof (avl_public_root_valid__insert_projection_graft before_low_level_spec avl_node_pre (proj1 PreH7) (proj1 (proj2 (proj2 PreH7))) PreH9) as [Root VP].
pose proof (F avl_node_pre VP) as [K [H _]].
assert (VF:avl_vvalid final avl_node_pre) by (apply D; exact VP).
Exists final.
entailer!.
sep_apply_r_atomic Store.
unfold avl_graph_node_store.
rewrite K,H,L,R.
change (avl_ptr_of None) with 0.
entailer!.
Qed. 

Lemma proof_of_AvlTreeInsertNode_return_wit_3 : AvlTreeInsertNode_return_wit_3.
Proof.
aggressive_pre_process.
subst retval.
destruct (strict_failure_graft_model__strict_graph_lifecycle before_low_level_spec avl_node_pre data_pre after_2
 (avl_right before_low_level_spec avl_node_pre) (avl_left before_low_level_spec avl_node_pre)
 (avl_left before_low_level_spec avl_node_pre) None PreH7 PreH9 ltac:(right; repeat split; auto) PreH6)
 as [final [Outcome [Nodes [L [R [CE OE]]]]]].

assert (Store:
 avl_graph_node_store final avl_node_pre ** avl_tree_store after_2 **
 avl_tree_store (avl_child_model before_low_level_spec (avl_left before_low_level_spec avl_node_pre))
 |-- avl_tree_store final).
{
 set (g:=before_low_level_spec).
 set (p:=avl_node_pre).
 set (key:=data_pre).
 set (failed:=after_2).
 set (c:=avl_right g p).
 set (d:=avl_left g p).
 pose proof PreH7 as Input.
 pose proof PreH9 as Np.
 assert (Choice:(c=avl_left g p /\ d=avl_right g p) \/ (c=avl_right g p /\ d=avl_left g p)).
 { right; split; reflexivity. }
 pose proof PreH6 as ChildOutcome.
 pose proof Outcome as FinalOutcome.
 pose proof L as RootL.
 pose proof R as RootR.
 pose proof CE as ChildEdges.
 pose proof OE as OtherEdges.
 clear L R CE OE.
 fold g p key failed c d in Input,Np,ChildOutcome,FinalOutcome,Nodes,RootL,RootR,ChildEdges,OtherEdges.
 fold g p key failed c d.

 destruct ChildOutcome as [[_ [_ Failure]]|[Success _]].
 2: { destruct Success as [_ [N _]]. contradiction. }
 destruct FinalOutcome as [[_ [_ Effect]]|[Success _]].
 2: { destruct Success as [_ [N _]]. contradiction. }
 pose proof Failure as [_ [PF [DF FF]]].
 pose proof Effect as [_ [_ [DG FG]]].
 assert (SideC:c=avl_left g p \/ c=avl_right g p) by tauto.
 assert (SideD:d=avl_left g p \/ d=avl_right g p) by tauto.
 pose proof (avl_child_insert_input__insert_projection_graft g p key c Input Np SideC) as IC.
 pose proof (avl_child_insert_input__insert_projection_graft g p key d Input Np SideD) as ID.
 pose proof (avl_public_root_valid__insert_projection_graft g p (proj1 Input) (proj1 (proj2 (proj2 Input))) Np) as [Root Vp].
 pose proof (strict_parent_regions__strict_graph_lifecycle g p key Input Np) as [NL [NR DJ]].
 assert (NC:~avl_vvalid (avl_child_model g c) p) by (destruct SideC; subst c; auto).
 assert (ND:~avl_vvalid (avl_child_model g d) p) by (destruct SideD; subst d; auto).
 assert (DC:forall x,avl_vvalid (avl_child_model g d) x -> ~avl_vvalid (avl_child_model g c) x).
 { intros x H J. exact (DJ x H J). }
 assert (MF: SimpleC.SL.SeparationLogic.naive_C_Rules.derivable1 (avl_tree_store failed) (avl_graph_nodes_store final (avl_nodes failed))).
 { unfold avl_tree_store. apply avl_nodes_store_map__lr_graph_composition. intros x Hin.
   assert (VC:avl_vvalid (avl_child_model g c) x).
   { apply (strict_valid_nodes__strict_graph_lifecycle _ (proj1 IC)). exact (Permutation_in x (Permutation_sym PF) Hin). }
   assert (Nx:x<>p) by (intro E; subst x; contradiction).
   pose proof (strict_child_fields__strict_graph_lifecycle _ _ _ VC) as [VG [KC [HC _]]].
   pose proof (FF x VC) as [KF [HF _]].
   pose proof (FG x VG) as [KG [HG _]].
   pose proof (ChildEdges x Nx VC) as [LE RE].
   assert (K:avl_key_of final x=avl_key_of failed x) by congruence.
   assert (H:avl_height_of final x=avl_height_of failed x) by congruence.
   assert (VF:avl_vvalid final x) by (apply DG; exact VG).
   unfold avl_graph_node_store. rewrite K,H,LE,RE.
   unfold SimpleC.SL.SeparationLogic.naive_C_Rules.derivable1,SimpleC.SL.SeparationLogic.naive_C_Rules.andp,SimpleC.SL.SeparationLogic.naive_C_Rules.coq_prop. tauto. }
 assert (MD: SimpleC.SL.SeparationLogic.naive_C_Rules.derivable1 (avl_tree_store (avl_child_model g d))
   (avl_graph_nodes_store final (avl_nodes (avl_child_model g d)))).
 { unfold avl_tree_store. apply avl_nodes_store_map__lr_graph_composition. intros x Hin.
   assert (VD:avl_vvalid (avl_child_model g d) x) by (apply (strict_valid_nodes__strict_graph_lifecycle _ (proj1 ID)); exact Hin).
   assert (Nx:x<>p) by (intro E; subst x; contradiction).
   pose proof (strict_child_fields__strict_graph_lifecycle _ _ _ VD) as [VG [KD [HD [LD RD]]]].
   pose proof (FG x VG) as [KG [HG _]].
   pose proof (OtherEdges x Nx (DC x VD)) as [LE RE].
   assert (K:avl_key_of final x=avl_key_of (avl_child_model g d) x) by congruence.
   assert (H:avl_height_of final x=avl_height_of (avl_child_model g d) x) by congruence.
   assert (L:avl_left final x=avl_left (avl_child_model g d) x) by congruence.
   assert (R:avl_right final x=avl_right (avl_child_model g d) x) by congruence.
   assert (VF:avl_vvalid final x) by (apply DG; exact VG).
   unfold avl_graph_node_store. rewrite K,H,L,R.
   unfold SimpleC.SL.SeparationLogic.naive_C_Rules.derivable1,SimpleC.SL.SeparationLogic.naive_C_Rules.andp,SimpleC.SL.SeparationLogic.naive_C_Rules.coq_prop. tauto. }
 assert (Part:Permutation (avl_nodes g) (p::avl_nodes (avl_child_model g c)++avl_nodes (avl_child_model g d))).
 { pose proof (avl_parent_nodes__predecessor_graft g p (proj1 Input) (proj1 (proj2 (proj2 Input))) Np) as P.
   etransitivity; [exact P|]. apply perm_skip. apply Permutation_app_comm. }
 assert (PartFinal:Permutation (avl_nodes final) (p::avl_nodes failed++avl_nodes (avl_child_model g d))).
 { rewrite Nodes. etransitivity; [exact Part|]. apply perm_skip. apply Permutation_app; [exact PF|reflexivity]. }




 unfold avl_tree_store at 3.
 rewrite (avl_graph_nodes_store_permutation__graph_store_decomposition final _ _ PartFinal).
 rewrite avl_graph_nodes_store_cons__graph_store_decomposition.
 sep_apply_l_atomic MF.
 sep_apply_l_atomic MD.
 sep_apply_l_atomic (avl_graph_nodes_store_app__graph_store_decomposition final (avl_nodes failed) (avl_nodes (avl_child_model g d))).
 entailer!.
}
pose proof Outcome as O.
destruct O as [[_ [_ Effect]]|[Success _]].
2: { destruct Success as [_ [N _]]. contradiction. }
pose proof Effect as [_ [_ [D F]]].
pose proof (avl_public_root_valid__insert_projection_graft before_low_level_spec avl_node_pre (proj1 PreH7) (proj1 (proj2 (proj2 PreH7))) PreH9) as [Root VP].
pose proof (F avl_node_pre VP) as [K [H _]].
assert (VF:avl_vvalid final avl_node_pre) by (apply D; exact VP).
Exists final.
entailer!.
sep_apply_r_atomic Store.
unfold avl_graph_node_store.
rewrite K,H,L,R.
change (avl_ptr_of None) with 0.
entailer!.
Qed. 

Lemma proof_of_AvlTreeInsertNode_return_wit_4 : AvlTreeInsertNode_return_wit_4.
Proof.
aggressive_pre_process.
Exists before_low_level_spec.
sep_apply_l_atomic (avl_parent_store_fold__insert_projection_graft before_low_level_spec avl_node_pre (proj1 PreH7) (proj1 (proj2 PreH7)) (proj1 (proj2 (proj2 PreH7))) PreH9).
entailer!.
eapply strict_duplicate_identity__strict_graph_lifecycle; eauto.
Qed. 

Lemma proof_of_AvlTreeInsertNode_return_wit_5 : AvlTreeInsertNode_return_wit_5.
Proof.
aggressive_pre_process.
entailer!.
subst avl_node_pre.
eapply strict_empty_failure__strict_graph_lifecycle; eauto.
Qed. 

Lemma proof_of_AvlTreeInsertNode_partial_solve_wit_2_pure : AvlTreeInsertNode_partial_solve_wit_2_pure.
Proof.
  unfold AvlTreeInsertNode_partial_solve_wit_2_pure.
  left.
  intros.
  dump_pre_spatial.
  rewrite Z.mul_0_l, Z.add_0_r.
  reflexivity.
Qed. 

Lemma proof_of_AvlTreeInsertNode_partial_solve_wit_3_pure : AvlTreeInsertNode_partial_solve_wit_3_pure.
Proof.
  unfold AvlTreeInsertNode_partial_solve_wit_3_pure.
  left.
  intros.
  dump_pre_spatial.
  rewrite Z.mul_0_l, Z.add_0_r.
  reflexivity.
Qed. 

Lemma proof_of_AvlTreeInsertNode_partial_solve_wit_5_pure : AvlTreeInsertNode_partial_solve_wit_5_pure.
Proof.
  unfold AvlTreeInsertNode_partial_solve_wit_5_pure.
  left.
  intros.
  dump_pre_spatial.
  rewrite Z.mul_0_l, Z.add_0_r.
  reflexivity.
Qed. 

Lemma proof_of_AvlTreeInsertNode_partial_solve_wit_7_pure : AvlTreeInsertNode_partial_solve_wit_7_pure.
Proof.
  unfold AvlTreeInsertNode_partial_solve_wit_7_pure.
  left.
  intros.
  dump_pre_spatial.
  rewrite Z.mul_0_l, Z.add_0_r.
  reflexivity.
Qed. 

Lemma proof_of_AvlTreeDeleteNode_entail_wit_2 : AvlTreeDeleteNode_entail_wit_2.
Proof.
 pre_process.
 prop_apply_p (crtos_store_signed__crtos_insert_composition before_low_level_spec
   (crtos_valid_domain__crtos_insert_composition before_low_level_spec
     (avl_gvalid_tree_valid _ PreH3))). Intros_p Keys.
 pose proof (structural_delete_input__cursor_entry_refinement before_low_level_spec avl_node_pre data_pre
   PreH3 PreH4 (conj PreH1 PreH2) Keys) as I.
 destruct (Z.eq_dec avl_node_pre 0) as [N|N].
 - Right. entailer!.
 - Left. sep_apply_l_atomic (crtos_root_split__crtos_insert_composition before_low_level_spec avl_node_pre PreH3 PreH4 N).
   unfold avl_graph_node_store. Intros_p V. Intros_p NN. Intros_p K. Intros_p H. entailer!.
Qed. 

Lemma proof_of_AvlTreeDeleteNode_entail_wit_5 : AvlTreeDeleteNode_entail_wit_5.
Proof.
 pre_process.
 assert (K:avl_key_of before_low_level_spec avl_node_pre=data_pre) by lia.
 assert (E:avl_left before_low_level_spec avl_node_pre=None).
 { apply (proj1 (avl_child_ptr_zero_iff_none__predecessor_right_spine _ _ _ (proj1 PreH6) PreH8 (or_introl eq_refl))); lia. }
 pose proof (only_child__delete_reassembly_sets before_low_level_spec avl_node_pre
   (avl_right before_low_level_spec avl_node_pre) data_pre PreH6 PreH7 PreH8 K ltac:(auto)) as Repair.
 pose proof (proj1 Repair) as [_ [Root [Valid [Balance [Safe _]]]]].
 rewrite E. change (avl_tree_store (avl_child_model before_low_level_spec None)) with emp.
 rewrite avl_cache_self__lr_graph_composition.
 entailer!.
Qed.

Lemma proof_of_AvlTreeDeleteNode_entail_wit_6 : AvlTreeDeleteNode_entail_wit_6.
Proof.
 pre_process.
 assert (K:avl_key_of before_low_level_spec avl_node_pre=data_pre) by lia.
 assert (E:avl_right before_low_level_spec avl_node_pre=None).
 { apply (proj1 (avl_child_ptr_zero_iff_none__predecessor_right_spine _ _ _ (proj1 PreH6) PreH8 (or_intror eq_refl))); lia. }
 pose proof (only_child__delete_reassembly_sets before_low_level_spec avl_node_pre
   (avl_left before_low_level_spec avl_node_pre) data_pre PreH6 PreH7 PreH8 K ltac:(auto)) as Repair.
 pose proof (proj1 Repair) as [_ [Root [Valid [Balance [Safe _]]]]].
 rewrite E. change (avl_tree_store (avl_child_model before_low_level_spec None)) with emp.
 rewrite avl_cache_self__lr_graph_composition.
 entailer!.
Qed.

Lemma proof_of_AvlTreeDeleteNode_entail_wit_7 : AvlTreeDeleteNode_entail_wit_7.
Proof.
 pre_process.
 pose proof (proj1 PreH6) as T.
 pose proof (proj2 (avl_gvalid_tree_valid_iff before_low_level_spec)
   (conj T (proj1 (proj2 PreH6)))) as G.
 pose proof (proj1 (proj2 (proj2 PreH6))) as Root.
 assert (L:avl_ptr_of (avl_left before_low_level_spec avl_node_pre)<>0) by lia.
 pose proof (cursor_start__cursor_entry_refinement _ _ T PreH8 L) as C.
 sep_apply_l_atomic (avl_child_store_backward__insert_projection_graft before_low_level_spec
   (avl_left before_low_level_spec avl_node_pre) T
   ltac:(intros x X;eapply avl_graph_child_valid__root_and_factor_setup;eauto;exact (proj1 T))).
 sep_apply_l_atomic (avl_child_store_backward__insert_projection_graft before_low_level_spec
   (avl_right before_low_level_spec avl_node_pre) T
   ltac:(intros x X;eapply avl_graph_child_valid__root_and_factor_setup;eauto;exact (proj1 T))).
 sep_apply_l_atomic (avl_fields_subtree__predecessor_graft before_low_level_spec avl_node_pre T PreH7 PreH8).
 sep_apply_l_atomic (avl_subtree_store_to_root_tree_store before_low_level_spec avl_node_pre T Root).
 sep_apply_l_atomic (crtos_store_focus__height_update before_low_level_spec
   (avl_ptr_of (avl_left before_low_level_spec avl_node_pre))
   (crtos_valid_domain__crtos_insert_composition _ T)
   (GraphLib.examples.bst.bst_listV_NoDup _ (proj1 T)) (proj1 C)).
 entailer!;lia.
Qed. 

Lemma proof_of_AvlTreeDeleteNode_entail_wit_8 : AvlTreeDeleteNode_entail_wit_8.
Proof.
 pre_process.
 pose proof (proj1 PreH1) as T.
 pose proof (cursor_step__cursor_entry_refinement _ _ _ T PreH5 PreH6) as C.
 prop_apply_p (store_int_range (&(pred # "AvlNode" ->ₛ "data")) (avl_key_of before_low_level_spec pred)). Intros_p K.
 prop_apply_p (store_uint_range (&(pred # "AvlNode" ->ₛ "height")) (avl_height_of before_low_level_spec pred)). Intros_p B.
 sep_apply_l_atomic (crtos_refocus__height_update before_low_level_spec pred
   (avl_ptr_of (avl_right before_low_level_spec pred))
   (GraphLib.examples.bst.bst_listV_NoDup _ (proj1 T))
   (proj1 (crtos_valid_domain__crtos_insert_composition _ T pred) (proj1 PreH5))
   (proj1 PreH5) (proj1 (proj2 PreH5)) K B
   (proj1 (crtos_valid_domain__crtos_insert_composition _ T _) (proj1 C))).
 entailer!.
Qed. 

Lemma proof_of_AvlTreeDeleteNode_entail_wit_9 : AvlTreeDeleteNode_entail_wit_9.
Proof.
 pre_process.
 pose proof (proj1 PreH1) as T.
 pose proof (proj1 (proj2 (proj2 PreH1))) as Root.
 pose proof (represented_root_nonzero__cursor_entry_refinement _ _ _ T Root (proj1 PreH5)) as N.
 pose proof (avl_public_root_valid__insert_projection_graft _ _ T Root N) as [E V].
 pose proof (cursor_exit__cursor_entry_refinement _ _ _ _ PreH1 N PreH5 PreH3 PreH6) as [P D].
 unfold avl_nodes_without,remove_Z.
 rewrite (crtos_store_extract__height_update before_low_level_spec
   (remove addr_dec pred (avl_nodes before_low_level_spec)) avl_node_pre
   (crtos_remove_nodup__single_rotations _ _ (GraphLib.examples.bst.bst_listV_NoDup _ (proj1 T)))
   ltac:(apply in_in_remove;[congruence|];apply (proj1 (crtos_valid_domain__crtos_insert_composition _ T _));exact V)).
 rewrite (remove_remove_comm addr_dec (avl_nodes before_low_level_spec) avl_node_pre pred).
 unfold avl_graph_node_store. Intros_p Vp. Intros_p Np. Intros_p Kp. Intros_p Hp.
 entailer!. exact (proj1 PreH5). exact (proj1 (proj2 PreH5)).
Qed. 

Lemma proof_of_AvlTreeDeleteNode_entail_wit_10 : AvlTreeDeleteNode_entail_wit_10.
Proof.
 pre_process.
 pose proof (proj1 PreH1) as T.
 pose proof (proj1 (proj2 (proj2 PreH1))) as Root.
 pose proof PreH3 as P.
 destruct P as [Vp [[Empty Alias]|[l [El [Reach [Vf [Less Max]]]]]]].
 - subst pred.
   prop_apply_p (dup_store_int (&(avl_node_pre # "AvlNode" ->ₛ "data"))
     (avl_key_of before_low_level_spec avl_node_pre) (avl_key_of before_low_level_spec avl_node_pre)). Intros_p Bad.
   contradiction.
 - prop_apply_p (store_int_range (&(pred # "AvlNode" ->ₛ "data")) (avl_key_of before_low_level_spec pred)). Intros_p K.
   pose proof (represented_root_nonzero__cursor_entry_refinement _ _ _ T Root Vf) as N.
   pose proof (avl_child_delete_input__predecessor_graft before_low_level_spec avl_node_pre data_pre
     (avl_key_of before_low_level_spec pred) (avl_left before_low_level_spec avl_node_pre)
     PreH1 N (or_introl eq_refl) K) as ChildInput.
   assert (InF:In pred (avl_nodes (avl_child_model before_low_level_spec (avl_left before_low_level_spec avl_node_pre)))).
   { rewrite El. change (In pred (avl_subtree_nodes before_low_level_spec l)).
     unfold avl_subtree_nodes. apply GraphLib.graph_basic.valid_NoDup_list_spec. split.
     - apply (proj1 (crtos_valid_domain__crtos_insert_composition _ T pred));exact Vf.
     - exact Reach. }
   pose proof (child_remainder_partition__cursor_entry_refinement avl_node_pre pred
     (avl_nodes before_low_level_spec)
     (avl_nodes (avl_child_model before_low_level_spec (avl_left before_low_level_spec avl_node_pre)))
     (avl_nodes (avl_child_model before_low_level_spec (avl_right before_low_level_spec avl_node_pre)))
     (GraphLib.examples.bst.bst_listV_NoDup _ (proj1 T))
     (avl_parent_nodes__predecessor_graft _ _ T Root N) InF) as Part.
   assert (Rstore:avl_graph_nodes_store before_low_level_spec
     (avl_nodes (avl_child_model before_low_level_spec (avl_right before_low_level_spec avl_node_pre)))
     |-- avl_tree_store (avl_child_model before_low_level_spec (avl_right before_low_level_spec avl_node_pre))).
   { destruct (avl_right before_low_level_spec avl_node_pre) as [r|] eqn:Er.
     - change (avl_graph_nodes_store before_low_level_spec (avl_subtree_nodes before_low_level_spec r)
         |-- avl_graph_nodes_store (avl_subtree_model before_low_level_spec r) (avl_subtree_nodes before_low_level_spec r)).
       apply avl_projection_nodes_store__lr_graph_composition. apply Forall_forall. intros x X.
       unfold avl_subtree_nodes in X. apply GraphLib.graph_basic.valid_NoDup_list_spec in X. tauto.
     - change (emp |-- emp). reflexivity. }
   unfold remove_Z,avl_nodes_without.
   rewrite (avl_graph_nodes_store_permutation__graph_store_decomposition _ _ _ Part).
   sep_apply_l_atomic (avl_graph_nodes_store_split__graph_store_decomposition before_low_level_spec
     (remove Z.eq_dec pred (avl_nodes (avl_child_model before_low_level_spec (avl_left before_low_level_spec avl_node_pre))))
     (avl_nodes (avl_child_model before_low_level_spec (avl_right before_low_level_spec avl_node_pre)))).
   sep_apply_l_atomic Rstore.
   rewrite El in *.
   sep_apply_l_atomic (avl_projection_nodes_store__lr_graph_composition before_low_level_spec l
     (remove Z.eq_dec pred (avl_nodes (avl_child_model before_low_level_spec (Some l))))
     ltac:(apply Forall_forall;intros x X;apply in_remove in X;destruct X as [X _];
       change (In x (avl_subtree_nodes before_low_level_spec l)) in X;
       unfold avl_subtree_nodes in X;apply GraphLib.graph_basic.valid_NoDup_list_spec in X;tauto)).
   change (avl_child_model before_low_level_spec (Some l)) with (avl_subtree_model before_low_level_spec l) in *.
   destruct (avl_projection_children__lr_graph_composition before_low_level_spec l pred Reach) as [LC RC].
   rewrite LC,RC.
   change (avl_key_of (avl_subtree_model before_low_level_spec l) pred) with (avl_key_of before_low_level_spec pred).
   change (avl_height_of (avl_subtree_model before_low_level_spec l) pred) with (avl_height_of before_low_level_spec pred).
   unfold addr_dec.
   entailer!.
   exact (conj Vf Reach).
Qed. 

Lemma proof_of_AvlTreeDeleteNode_entail_wit_11_1 : AvlTreeDeleteNode_entail_wit_11_1.
Proof.
 pre_process.
 assert (G:avl_gvalid before_low_level_spec).
 { apply avl_gvalid_tree_valid_iff. exact (conj (proj1 PreH4) (proj1 (proj2 PreH4))). }
 pose proof (crtos_root_partition__crtos_insert_composition before_low_level_spec avl_node_pre G
   (proj1 (proj2 (proj2 PreH4))) PreH5) as [Gl [Gr [Nl [Nr [Dj _]]]]].
 assert (Sub:forall x,avl_vvalid after x -> avl_vvalid (avl_child_model before_low_level_spec (avl_right before_low_level_spec avl_node_pre)) x).
 { intros x X. eapply delete_subset__deletion_reassembly; [exact PreH1|exact X]. }
 assert (Na:~avl_vvalid after avl_node_pre) by (intro X; apply Nr; apply Sub; exact X).
 assert (Da:forall x,avl_vvalid after x -> ~avl_vvalid (avl_child_model before_low_level_spec (avl_left before_low_level_spec avl_node_pre)) x).
 { intros x X Y. exact (Dj x Y (Sub x X)). }
 pose proof (avl_delete_right_pending__delete_projection_graft before_low_level_spec avl_node_pre
   data_pre after retval PreH4 PreH5 ltac:(lia) PreH1 Na Nl Da) as Pending.
 set (raw:=avl_join_model avl_node_pre (avl_key_of before_low_level_spec avl_node_pre) (avl_child_model before_low_level_spec (avl_left before_low_level_spec avl_node_pre)) after).
 fold raw in Pending.
 assert (Identity:avl_api_delete_identity before_low_level_spec raw data_pre).
 { destruct PreH2 as [[x [X K]]|Same].
   - left. exists x.
     pose proof (crtos_child_fields__crtos_insert_composition _ _ _ X) as [V [Key _]].
     split; [exact V|congruence].
   - right. unfold raw.
     apply parent_identity__delete_reassembly_sets with (key:=data_pre); try assumption.
     apply same_graph_refl__delete_reassembly_sets. }
 assert (Repair:avl_api_delete_repair before_low_level_spec raw data_pre avl_node_pre) by (split; assumption).
 pose proof Pending as [_ [_ [Valid [Balance [Safe _]]]]].
 pose proof (proj1 (proj2 (proj1 PreH1))) as Ga.
 Exists (avl_height_of before_low_level_spec avl_node_pre) raw.
 assert (Rs:avl_ptr_of (avl_root (avl_child_model before_low_level_spec (avl_left before_low_level_spec avl_node_pre)))=avl_ptr_of (avl_left before_low_level_spec avl_node_pre)).
 { rewrite (proj1 (avl_child_root__insert_projection_graft _ _)). reflexivity. }
 rewrite (proj1 (proj2 PreH1)), <- Rs.
 sep_apply_l_atomic (crtos_raw_cached_store__crtos_insert_composition avl_node_pre
   (avl_key_of before_low_level_spec avl_node_pre) (avl_child_model before_low_level_spec (avl_left before_low_level_spec avl_node_pre)) after (avl_height_of before_low_level_spec avl_node_pre) PreH5
   (crtos_valid_domain__crtos_insert_composition _ (avl_gvalid_tree_valid _ Gl))
   (crtos_valid_domain__crtos_insert_composition _ (avl_gvalid_tree_valid _ Ga))
   Nl Na ltac:(intros x X Y; exact (Da x Y X))).
 fold raw. entailer!.
Qed.

Lemma proof_of_AvlTreeDeleteNode_entail_wit_11_2 : AvlTreeDeleteNode_entail_wit_11_2.
Proof.
 pre_process.
 assert (G:avl_gvalid before_low_level_spec).
 { apply avl_gvalid_tree_valid_iff. exact (conj (proj1 PreH5) (proj1 (proj2 PreH5))). }
 pose proof (crtos_root_partition__crtos_insert_composition before_low_level_spec avl_node_pre G
   (proj1 (proj2 (proj2 PreH5))) PreH6) as [Gl [Gr [Nl [Nr [Dj _]]]]].
 assert (Sub:forall x,avl_vvalid after x -> avl_vvalid (avl_child_model before_low_level_spec (avl_left before_low_level_spec avl_node_pre)) x).
 { intros x X. eapply delete_subset__deletion_reassembly; [exact PreH1|exact X]. }
 assert (Na:~avl_vvalid after avl_node_pre) by (intro X; apply Nl; apply Sub; exact X).
 assert (Da:forall x,avl_vvalid after x -> ~avl_vvalid (avl_child_model before_low_level_spec (avl_right before_low_level_spec avl_node_pre)) x).
 { intros x X Y. exact (Dj x (Sub x X) Y). }
 pose proof (avl_delete_left_pending__delete_projection_graft before_low_level_spec avl_node_pre
   data_pre after retval PreH5 PreH6 ltac:(lia) PreH1 Na Nr Da) as Pending.
 set (raw:=avl_join_model avl_node_pre (avl_key_of before_low_level_spec avl_node_pre) after (avl_child_model before_low_level_spec (avl_right before_low_level_spec avl_node_pre))).
 fold raw in Pending.
 assert (Identity:avl_api_delete_identity before_low_level_spec raw data_pre).
 { destruct PreH2 as [[x [X K]]|Same].
   - left. exists x.
     pose proof (crtos_child_fields__crtos_insert_composition _ _ _ X) as [V [Key _]].
     split; [exact V|congruence].
   - right. unfold raw.
     apply parent_identity__delete_reassembly_sets with (key:=data_pre); try assumption.
     apply same_graph_refl__delete_reassembly_sets. }
 assert (Repair:avl_api_delete_repair before_low_level_spec raw data_pre avl_node_pre) by (split; assumption).
 pose proof Pending as [_ [_ [Valid [Balance [Safe _]]]]].
 pose proof (proj1 (proj2 (proj1 PreH1))) as Ga.
 Exists (avl_height_of before_low_level_spec avl_node_pre) raw.
 assert (Rs:avl_ptr_of (avl_root (avl_child_model before_low_level_spec (avl_right before_low_level_spec avl_node_pre)))=avl_ptr_of (avl_right before_low_level_spec avl_node_pre)).
 { rewrite (proj1 (avl_child_root__insert_projection_graft _ _)). reflexivity. }
 rewrite (proj1 (proj2 PreH1)), <- Rs.
 sep_apply_l_atomic (crtos_raw_cached_store__crtos_insert_composition avl_node_pre
   (avl_key_of before_low_level_spec avl_node_pre) after (avl_child_model before_low_level_spec (avl_right before_low_level_spec avl_node_pre)) (avl_height_of before_low_level_spec avl_node_pre) PreH6
   (crtos_valid_domain__crtos_insert_composition _ (avl_gvalid_tree_valid _ Ga))
   (crtos_valid_domain__crtos_insert_composition _ (avl_gvalid_tree_valid _ Gr))
   Na Nr Da).
 fold raw. entailer!.
Qed.

Lemma proof_of_AvlTreeDeleteNode_entail_wit_11_3 : AvlTreeDeleteNode_entail_wit_11_3.
Proof.
 pre_process.
 pose proof (proj1 PreH3) as T.
 pose proof (proj1 PreH5) as Vp.
 assert (N:avl_node_pre<>0) by (exact (proj2 (proj2 T) avl_node_pre Vp)).
 assert (G:avl_gvalid before_low_level_spec).
 { apply avl_gvalid_tree_valid_iff. exact (conj T (proj1 (proj2 PreH3))). }
 pose proof (crtos_root_partition__crtos_insert_composition before_low_level_spec avl_node_pre G
   (proj1 (proj2 (proj2 PreH3))) N) as [Gl [Gr [Nl [Nr [Dj _]]]]].
 assert (L:avl_ptr_of (avl_left before_low_level_spec avl_node_pre)<>0).
 { intro Zero.
   assert (NoneLeft:avl_left before_low_level_spec avl_node_pre=None).
   { exact (proj1 (avl_child_ptr_zero_iff_none__predecessor_right_spine _ _ _ T Vp (or_introl eq_refl)) Zero). }
   rewrite NoneLeft in PreH7. contradiction. }
 rewrite PreH9 in PreH1.
 assert (Sub:forall x,avl_vvalid after x ->
   avl_vvalid (avl_child_model before_low_level_spec (avl_left before_low_level_spec avl_node_pre)) x).
 { intros x X. eapply delete_subset__deletion_reassembly; [exact PreH1|exact X]. }
 assert (Na:~avl_vvalid after avl_node_pre) by (intro X; apply Nl; apply Sub; exact X).
 assert (Da:forall x,avl_vvalid after x ->
   ~avl_vvalid (avl_child_model before_low_level_spec (avl_right before_low_level_spec avl_node_pre)) x).
 { intros x X Y. exact (Dj x (Sub x X) Y). }
 pose proof (avl_predecessor_graft_pending__predecessor_graft before_low_level_spec avl_node_pre pred after retval
   ltac:(rewrite <-PreH4; exact PreH3) N L PreH5 PreH1 Na Nr Da) as Pending.
 rewrite <-PreH4 in Pending.
 set (raw:=avl_join_model avl_node_pre (avl_key_of before_low_level_spec pred) after
   (avl_child_model before_low_level_spec (avl_right before_low_level_spec avl_node_pre))).
 fold raw in Pending.
 assert (Repair:avl_api_delete_repair before_low_level_spec raw data_pre avl_node_pre).
 { split; [exact Pending|left].
   eapply root_present__delete_reassembly_sets; [exact Vp|symmetry; exact PreH4]. }
 pose proof Pending as [_ [_ [Valid [Balance [Safe _]]]]].
 pose proof (proj1 (proj2 (proj1 PreH1))) as Ga.
 Exists (avl_height_of before_low_level_spec avl_node_pre) raw.
 assert (Rs:avl_ptr_of (avl_root (avl_child_model before_low_level_spec (avl_right before_low_level_spec avl_node_pre)))=
   avl_ptr_of (avl_right before_low_level_spec avl_node_pre)).
 { rewrite (proj1 (avl_child_root__insert_projection_graft _ _)). reflexivity. }
 rewrite (proj1 (proj2 PreH1)), <-Rs.
 sep_apply_l_atomic (crtos_raw_cached_store__crtos_insert_composition avl_node_pre
   (avl_key_of before_low_level_spec pred) after
   (avl_child_model before_low_level_spec (avl_right before_low_level_spec avl_node_pre))
   (avl_height_of before_low_level_spec avl_node_pre) N
   (crtos_valid_domain__crtos_insert_composition _ (avl_gvalid_tree_valid _ Ga))
   (crtos_valid_domain__crtos_insert_composition _ (avl_gvalid_tree_valid _ Gr)) Na Nr Da).
 fold raw. entailer!.
Qed.

Lemma proof_of_AvlTreeDeleteNode_return_wit_1 : AvlTreeDeleteNode_return_wit_1.
Proof.
 aggressive_pre_process. entailer!.
 - right. unfold strict_same_graph. repeat split; auto; reflexivity.
 - subst avl_node_pre. apply avl_delete_empty_outcome__delete_projection_graft. exact PreH1.
Qed.

Lemma proof_of_AvlTreeDeleteNode_return_wit_2 : AvlTreeDeleteNode_return_wit_2.
Proof.
 pre_process.
 pose proof (finish__delete_reassembly_sets _ _ _ _ _ _ PreH5 PreH1 PreH2 PreH3) as [Outcome Identity].
 Exists after_2. entailer!.
Qed.

Lemma proof_of_AvlTreeDeleteNode_return_wit_3 : AvlTreeDeleteNode_return_wit_3.
Proof.
 pre_process.
 pose proof (finish__delete_reassembly_sets _ _ _ _ _ _ PreH7 PreH1 PreH2 PreH3) as [Outcome Identity].
 Exists after_2. entailer!.
Qed.

Lemma proof_of_AvlTreeDeleteNode_return_wit_4 : AvlTreeDeleteNode_return_wit_4.
Proof.
 pre_process.
 pose proof (finish__delete_reassembly_sets _ _ _ _ _ _ PreH7 PreH1 PreH2 PreH3) as [Outcome Identity].
 Exists after_2. entailer!.
Qed.

Lemma proof_of_AvlTreeDeleteNode_return_wit_5 : AvlTreeDeleteNode_return_wit_5.
Proof.
 pre_process.
 pose proof (leaf_outcome__outcomes_public_refinement before_low_level_spec avl_node_pre data_pre
   PreH5 PreH6 PreH7 ltac:(lia) ltac:(lia) ltac:(lia)) as [Outcome _].
 assert (Identity:avl_api_delete_identity before_low_level_spec avl_empty_model data_pre).
 { left. eapply root_present__delete_reassembly_sets; [exact PreH7|lia]. }
 assert (L:avl_left before_low_level_spec avl_node_pre=None).
 { apply (proj1 (avl_child_ptr_zero_iff_none__predecessor_right_spine _ _ _ (proj1 PreH5) PreH7 (or_introl eq_refl))); lia. }
 assert (R:avl_right before_low_level_spec avl_node_pre=None).
 { apply (proj1 (avl_child_ptr_zero_iff_none__predecessor_right_spine _ _ _ (proj1 PreH5) PreH7 (or_intror eq_refl))); lia. }
 Exists avl_empty_model. rewrite L,R.
 change (avl_tree_store (avl_child_model before_low_level_spec None)) with emp.
 change (avl_tree_store avl_empty_model) with emp.
 entailer!.
Qed.

Lemma proof_of_AvlTreeDeleteNode_partial_solve_wit_1_pure : AvlTreeDeleteNode_partial_solve_wit_1_pure.
Proof.
 pre_process.
 pose proof (proj2 (avl_gvalid_tree_valid_iff before_low_level_spec) (conj (proj1 PreH2) (proj1 (proj2 PreH2)))) as G.
 pose proof (crtos_child_gvalid__crtos_insert_composition before_low_level_spec avl_node_pre
   (avl_right before_low_level_spec avl_node_pre) G PreH4 (or_intror eq_refl)) as C.
 pose proof (proj1 (avl_child_root__insert_projection_graft before_low_level_spec (avl_right before_low_level_spec avl_node_pre))) as R.
 entailer!. rewrite R. reflexivity.
Qed. 

Lemma proof_of_AvlTreeDeleteNode_partial_solve_wit_2_pure : AvlTreeDeleteNode_partial_solve_wit_2_pure.
Proof.
 pre_process.
 pose proof (proj2 (avl_gvalid_tree_valid_iff before_low_level_spec) (conj (proj1 PreH3) (proj1 (proj2 PreH3)))) as G.
 pose proof (crtos_child_gvalid__crtos_insert_composition before_low_level_spec avl_node_pre
   (avl_left before_low_level_spec avl_node_pre) G PreH5 (or_introl eq_refl)) as C.
 pose proof (proj1 (avl_child_root__insert_projection_graft before_low_level_spec (avl_left before_low_level_spec avl_node_pre))) as R.
 entailer!. rewrite R. reflexivity.
Qed. 

Lemma proof_of_AvlTreeDeleteNode_partial_solve_wit_11_pure : AvlTreeDeleteNode_partial_solve_wit_11_pure.
Proof.
 pre_process.
 pose proof (proj1 (proj2 (proj1 PreH2))) as Root.
 entailer!.
Qed.

Lemma proof_of_AvlTreeDeleteNode_partial_solve_wit_13_pure : AvlTreeDeleteNode_partial_solve_wit_13_pure.
Proof.
 pre_process.
Qed. 

Lemma proof_of_AvlNodeModifyNode_entail_wit_2 : AvlNodeModifyNode_entail_wit_2.
Proof.
pre_process.
Exists after.
pose proof PreH1 as [[_ [G _]] [Root _]].
sep_apply_l_atomic (owned_insert_ready__insert_finish_modify_sets after retval dst_data_pre G Root ltac:(lia)).
entailer!.
Qed. 

Lemma proof_of_AvlNodeModifyNode_return_wit_1 : AvlNodeModifyNode_return_wit_1.
Proof.
pre_process.
Exists after_2 middle_2.
pose proof PreH4 as [_ [_ [Root _]]].
rewrite Root in PreH3.
entailer!.
Qed. 

Lemma proof_of_AvlNodeModifyNode_partial_solve_wit_3_pure : AvlNodeModifyNode_partial_solve_wit_3_pure.
Proof.
pre_process.
Qed. 

Lemma proof_of_AvlNodeSearchNode_entail_wit_2 : AvlNodeSearchNode_entail_wit_2.
Proof.
pre_process.
  prop_apply_p (avl_subtree_store_valid_guard__graph_store_decomposition g_low_level_spec avl_node_pre).
  Intros_p Hguard.
  assert (Hvalid : avl_vvalid g_low_level_spec avl_node_pre) by (apply Hguard; exact PreH5).
  sep_apply_l_atomic (avl_subtree_store_decompose__height_accessor g_low_level_spec avl_node_pre PreH3 PreH5 Hvalid).
  all: prop_apply_p (avl_graph_node_store_facts__graph_store_decomposition g_low_level_spec avl_node_pre).
  all: Intros_p Hfacts.
  all: unfold avl_graph_node_store; entailer!.
Qed. 

Lemma proof_of_AvlNodeSearchNode_entail_wit_3 : AvlNodeSearchNode_entail_wit_3.
Proof.
pre_process.
  pose proof (avl_search_cursor_descend_right__cursor_branch_invariant__tree_valid g_low_level_spec avl_node_pre data_pre PreH5 PreH6 PreH1 PreH12) as Hdesc.
  entailer!.
Qed. 

Lemma proof_of_AvlNodeSearchNode_entail_wit_4 : AvlNodeSearchNode_entail_wit_4.
Proof.
pre_process.
  pose proof (avl_search_cursor_descend_left__cursor_branch_invariant__tree_valid g_low_level_spec avl_node_pre data_pre PreH5 PreH6 ltac:(lia) PreH12) as Hdesc.
  entailer!.
Qed. 

Lemma proof_of_AvlNodeSearchNode_entail_wit_5_1 : AvlNodeSearchNode_entail_wit_5_1.
Proof.
  pre_process.
  match goal with
  | |- context [store_stringLit (LitMap_low_level_spec ?literal) ?literal] =>
      sep_apply (GlobalStrings_merge LitMap_low_level_spec literal)
  end.
  entailer!; lia.
Qed. 

Lemma proof_of_AvlNodeSearchNode_return_wit_1 : AvlNodeSearchNode_return_wit_1.
Proof.
pre_process. split_pure_spatial. - sep_apply_r_atomic (avl_subtree_store_fold__height_accessor g_low_level_spec avl_node_pre PreH7 PreH9 PreH8). unfold avl_graph_node_store in *. entailer!. - unfold avl_search_result. right. repeat split; try assumption; lia.
Qed. 

Lemma proof_of_AvlNodeSearchNode_return_wit_2 : AvlNodeSearchNode_return_wit_2.
Proof.
pre_process. split_pure_spatial. - sep_apply_r_atomic (avl_subtree_store_fold__height_accessor g_low_level_spec avl_node_pre PreH7 PreH9 PreH8). unfold avl_graph_node_store in *. entailer!. - entailer!.
Qed. 

Lemma proof_of_AvlNodeSearchNode_return_wit_3 : AvlNodeSearchNode_return_wit_3.
Proof.
pre_process. split_pure_spatial. - sep_apply_r_atomic (avl_subtree_store_fold__height_accessor g_low_level_spec avl_node_pre PreH7 PreH9 PreH8). unfold avl_graph_node_store in *. entailer!. - entailer!.
Qed. 

Lemma proof_of_AvlNodeSearchNode_return_wit_4 : AvlNodeSearchNode_return_wit_4.
Proof.
  pre_process.
  match goal with
  | |- context [store_stringLit (LitMap_low_level_spec ?literal) ?literal] =>
      sep_apply (GlobalStrings_merge LitMap_low_level_spec literal)
  end.
  split_pure_spatial.
  - entailer!.
  - unfold avl_search_result. left. split; [reflexivity|].
    intros x Hv Hkey.
    subst avl_node_pre.
    eapply (avl_null_cursor_excludes_matching_key__mapping_refinement__tree_valid g_low_level_spec data_pre x PreH3 Hv Hkey).
    apply PreH4; assumption.
Qed. 

Lemma proof_of_AvlNodeSearchNode_partial_solve_wit_1_pure : AvlNodeSearchNode_partial_solve_wit_1_pure.
Proof.
  pre_process.
Qed. 

Lemma proof_of_AvlNodeSearchNode_partial_solve_wit_4_pure : AvlNodeSearchNode_partial_solve_wit_4_pure.
Proof.
  pre_process.
Qed. 

Lemma proof_of_AvlNodeSearchNode_derive_high_level_spec_by_low_level_spec : AvlNodeSearchNode_derive_high_level_spec_by_low_level_spec.
Proof.
  pre_process.
  unfold avl_balanced_set_root_rep, avl_api_runtime_strings.
  Intros g LitMap.
  destruct H as [Hgfull [Hroot Hset]].
  destruct (proj1 (avl_gvalid_tree_valid_iff g) Hgfull) as [Hg Hbalanced].
  pose proof (avl_set_member_vertex keys_high_level_spec g data_pre Hg Hset) as Member.
  pose proof (avl_root_cursor_valid__mapping_refinement__tree_valid g avl_node_pre data_pre Hg Hroot) as Cursor.
  Exists g LitMap.
  split_pure_spatial.
  - sep_apply_l_atomic (avl_root_tree_store_to_subtree_store g avl_node_pre Hg Hroot).
    cancel (avl_subtree_store_at g avl_node_pre).
    cancel (GlobalStrings LitMap).
    apply_sepcon_adjoint.
    Intros retval.
    destruct H as [[Hret Habsent]|[Hret [Hvalid Hkey]]].
    + assert (Absent : ~ avl_set_member keys_high_level_spec data_pre).
      { intro Found. apply Member in Found. destruct Found as [x [V K]].
        exact (Habsent x V K). }
      sep_apply_l_atomic (avl_subtree_store_to_root_tree_store g avl_node_pre Hg Hroot).
      Right. Exists retval g LitMap. entailer!.
    + assert (Found : avl_set_member keys_high_level_spec data_pre).
      { apply Member. exists retval. auto. }
      sep_apply_l_atomic (avl_subtree_store_to_root_tree_store g avl_node_pre Hg Hroot).
      pose proof (GraphLib.examples.bst.bst_listV_NoDup _ (proj1 Hg)) as Unique.
      sep_apply_l_atomic (crtos_store_focus__height_update g retval
        (crtos_valid_domain__crtos_insert_composition g Hg) Unique Hvalid).
      rewrite Hkey.
      Left. Exists g retval LitMap. entailer!.
  - entailer!.
Qed. 

Lemma proof_of_AvlNodeModifyNode_derive_high_level_spec_by_low_level_spec : AvlNodeModifyNode_derive_high_level_spec_by_low_level_spec.
Proof.
 pre_process.
 unfold avl_balanced_set_root_rep, avl_api_runtime_strings.
 Intros before LitMap.
 destruct H as [G [Root Ref]].
 Exists before LitMap.
 split_pure_spatial.
 - cancel (avl_tree_store before).
   cancel (GlobalStrings LitMap).
   apply_sepcon_adjoint.
   Split.
   + Intros after middle retval.
     destruct (Z.eq_dec retval 0) as [Zero|Nonzero].
     * subst retval.
       destruct H1 as [[_ [Absent Effect]]|[Success _]].
       2: { destruct Success as [_ [N _]]. contradiction. }
       Left. Left. Exists 0.
       unfold avl_api_modify_failure_rep.
       Exists before middle after LitMap.
       entailer!.
     * pose proof (delete_set__insert_finish_modify_sets keys_high_level_spec before middle src_data_pre (avl_ptr_of (avl_root middle)) Ref H0) as [Gm [Rm RefM]].
       pose proof (insert_success_set__insert_finish_modify_sets (avl_set_remove keys_high_level_spec src_data_pre) middle after dst_data_pre retval RefM H1 Nonzero) as [Ga [Ra RefA]].
       Left. Right. Exists retval after LitMap.
       entailer!.
   + Intros retval.
     Right. Exists 0 before LitMap.
     entailer!.
 - entailer!.
Qed.
 

Lemma proof_of_AvlTreeDeleteNode_derive_cursor_level_spec_by_low_level_spec : AvlTreeDeleteNode_derive_cursor_level_spec_by_low_level_spec.
Proof.
 pre_process.
 pose proof (proj1 H) as T.
 pose proof (proj2 (avl_gvalid_tree_valid_iff before_cursor_level_spec)
   (conj T (proj1 (proj2 H)))) as G.
 prop_apply_p (store_int_range (&(focus_cursor_level_spec # "AvlNode" ->ₛ "data")) (avl_key_of before_cursor_level_spec focus_cursor_level_spec)). Intros_p K.
 prop_apply_p (store_uint_range (&(focus_cursor_level_spec # "AvlNode" ->ₛ "height")) (avl_height_of before_cursor_level_spec focus_cursor_level_spec)). Intros_p B.
 Exists before_cursor_level_spec LitMap_cursor_level_spec.
 unfold avl_tree_store at 1.
 rewrite (crtos_store_extract__height_update before_cursor_level_spec _ focus_cursor_level_spec
     (GraphLib.examples.bst.bst_listV_NoDup _ (proj1 T))
     (proj1 (crtos_valid_domain__crtos_insert_composition _ T focus_cursor_level_spec) H1)).
 unfold avl_graph_node_store.
 fold (avl_nodes_without before_cursor_level_spec focus_cursor_level_spec).
 entailer!.
 - unfold avl_nodes_without,avl_nodes. cancel (avl_graph_nodes_store before_cursor_level_spec
     (remove addr_dec focus_cursor_level_spec (bst.listV (bst.bst_tree (avl_bst before_cursor_level_spec))))).
   apply (proj1 (derivable1s_wand_sepcon_adjoint _ _ _)). entailer!.
 - exact (proj1 (proj2 (proj2 H))).
Qed. 

Lemma proof_of_AvlTreeDeleteNode_derive_high_level_spec_by_low_level_spec : AvlTreeDeleteNode_derive_high_level_spec_by_low_level_spec.
Proof.
 pre_process.
 unfold avl_balanced_set_root_rep, avl_api_runtime_strings.
 Intros before LitMap.
 destruct H as [G [Root Ref]].
 Exists before LitMap.
 split_pure_spatial.
 - cancel (avl_tree_store before).
   cancel (GlobalStrings LitMap).
   apply_sepcon_adjoint.
   Intros after ret.
   pose proof (delete_set__delete_reassembly_sets _ _ _ _ _ Ref H) as [Ga [Ra Removed]].
   destruct (Coq.Logic.Classical_Prop.classic (avl_set_member keys_high_level_spec data_pre)) as [Found|Missing].
   + Left. Exists ret. unfold avl_balanced_set_root_rep. Exists after LitMap.
     entailer!.
   + assert (Ret:ret=avl_node_pre).
     { destruct H0 as [Present|Same].
       - exfalso. apply Missing.
         apply (avl_set_member_vertex keys_high_level_spec before data_pre (avl_gvalid_tree_valid before G) Ref).
         exact Present.
       - rewrite Ra, <- (proj1 Same). symmetry. exact Root. }
     assert (SameSet:avl_set_refines_graph keys_high_level_spec after).
     { intro k. rewrite <- (Removed k). unfold avl_set_remove.
       split; [|tauto]. intro Member. split; [exact Member|].
       intro Equal. subst k. exact (Missing Member). }
     Right. Exists ret. unfold avl_balanced_set_root_rep. Exists after LitMap.
     entailer!.
 - entailer!.
Qed.

Lemma proof_of_AvlTreeInsertNode_derive_high_level_spec_by_low_level_spec : AvlTreeInsertNode_derive_high_level_spec_by_low_level_spec.
Proof.
 pre_process.
 unfold avl_balanced_set_root_rep, avl_api_runtime_strings.
 Intros before LitMap.
 destruct H1 as [G [Root Ref]].
 sep_apply_l_atomic (owned_insert_ready__insert_finish_modify_sets before avl_node_pre data_pre G Root ltac:(lia)).
 Intros_p Input.
 Exists before LitMap.
 split_pure_spatial.
 - cancel (avl_subtree_store_at before avl_node_pre).
   cancel (GlobalStrings LitMap).
   apply_sepcon_adjoint.
   Intros after retval.
   destruct (Z.eq_dec retval 0) as [Zero|Nonzero].
   + subst retval.
     destruct H1 as [[_ [Absent Effect]]|[Success _]].
     2: { destruct Success as [_ [N _]]. contradiction. }
     Left. Left. Exists 0.
     unfold avl_api_insert_failure_rep.
     Exists before after LitMap.
     entailer!.
   + pose proof (insert_success_set__insert_finish_modify_sets keys_high_level_spec before after data_pre retval Ref H1 Nonzero) as [Ga [Result RefAdd]].
     destruct (in_dec Z.eq_dec data_pre (avl_keys before)) as [Found|Absent].
     * assert (Member:avl_set_member keys_high_level_spec data_pre).
       { apply (proj2 (Ref data_pre)). exact Found. }
       assert (Present:strict_key_present before data_pre).
       { apply (proj1 (present_set__insert_finish_modify_sets keys_high_level_spec before data_pre G Ref)). exact Member. }
       pose proof (duplicate_result_root__insert_finish_modify_sets before after data_pre retval H1 Present Nonzero) as SameRoot.
       assert (RefSame:avl_set_refines_graph keys_high_level_spec after).
       { intros x. specialize (RefAdd x). unfold avl_set_insert in RefAdd.
         split; intro Hx.
         - apply RefAdd. right. exact Hx.
         - apply RefAdd in Hx. destruct Hx as [E|Hx].
           + subst x. exact Member.
           + exact Hx. }
       Right. Exists retval after LitMap.
       entailer!.
     * assert (NotMember:~avl_set_member keys_high_level_spec data_pre).
       { intro M. apply Absent. apply (proj1 (Ref data_pre)). exact M. }
       Left. Right. Exists retval after LitMap.
       entailer!.
 - entailer!.
Qed.
 

