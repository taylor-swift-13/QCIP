Require Export SimpleC.EE.INPUT.crtos.crtos_avl_internal_crtos.crtos_avl_internal_crtos_lib.
Require Export QCIPLib.crtos.crtos_avl_crtos_common.crtos_avl_set_lib.
Require Export QCIPLib.crtos.crtos_avl_crtos_common.crtos_avl_delete_lib.
Require Import Coq.Lists.List Coq.ZArith.ZArith Coq.micromega.Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
Require Import Logic.LogicGenerator.demo932.Interface.
Import naive_C_Rules.
Local Open Scope Z_scope.
Local Open Scope sac.

(* A single shared runtime resource, separate from every tree. *)
Definition avl_api_runtime_strings : Assertion := EX LitMap, GlobalStrings LitMap.

(* Original failed insertion returns NULL while retaining every allocated node.
   The model can be a forest with stale caches, so no valid-tree claim is made. *)
Definition avl_api_insert_failure_rep (keys : Z -> Prop) (root key : Z) : Assertion :=
 EX before after,
  “ avl_gvalid before /\ root = avl_ptr_of (avl_root before) /\
     avl_set_refines_graph keys before /\ ~strict_key_present before key /\
     strict_failure_effect before after key ” && avl_tree_store after.

(* Original Modify first deletes, then performs the original fallible insert.
   The failure heap is relative to the exact post-deletion graph. *)
Definition avl_api_modify_failure_rep (keys : Z -> Prop) (root src dst : Z) : Assertion :=
 EX before middle after,
  “ root <> 0 /\ avl_gvalid before /\ root = avl_ptr_of (avl_root before) /\
     avl_set_refines_graph keys before /\
     avl_delete_outcome before middle src (avl_ptr_of (avl_root middle)) /\
     ~strict_key_present middle dst /\ strict_failure_effect middle after dst ” &&
   avl_tree_store after.

(* Canonical cache/balance-compatible deletion repair property. *)
Definition avl_api_delete_identity (before after : avl_model) (key : Z) : Prop :=
 strict_key_present before key \/ strict_same_graph before after.

Definition avl_api_delete_repair (before raw : avl_model) (key p : Z) : Prop :=
 avl_delete_pending before raw key p /\ avl_api_delete_identity before raw key.

Lemma signed_insert_input__insert_finish_modify_sets : forall g root key,
 avl_gvalid g -> root=avl_ptr_of (avl_root g) ->
 INT_MIN<=key<=INT_MAX ->
 (forall x,avl_vvalid g x -> INT_MIN<=avl_key_of g x<=INT_MAX) ->
 avl_insert_input g root key.
Proof.
 intros g root key G R K S.
 pose proof (avl_gvalid_tree_valid g G) as V.
 pose proof (proj1 (avl_gvalid_tree_valid_iff g) G) as [_ B].
 assert (Height:avl_child_height g (avl_root g)<INT_MAX).
 {
  destruct (avl_root g) as [p|] eqn:E.
  - assert (Vp:avl_vvalid g p).
    { exact (GraphLib.examples.bst.root_valid _ (GraphLib.examples.bst.bst_binary_tree _ (proj1 V)) p E). }
    assert (Off:forall x,avl_vvalid g x -> x<>avl_ptr_of (avl_root g) -> Z.abs (avl_model_balance_factor g x)<=1).
    { intros x Hx _. apply B; exact Hx. }
    assert (Root:Z.abs (avl_model_balance_factor g (avl_ptr_of (avl_root g)))<=2).
    { rewrite E. simpl. specialize (B p Vp). lia. }
    pose proof (crtos_ready_interval__balance_returns g INT_MIN INT_MAX V Off Root S) as H.
    rewrite E in H. change (4*avl_height_of g p <= 4294967307) in H.
    change (avl_height_of g p < 2147483647). lia.
  - cbn. lia.
 }
 unfold avl_insert_input. tauto.
Qed.
Lemma owned_insert_ready__insert_finish_modify_sets : forall g root key,
 avl_gvalid g -> root=avl_ptr_of (avl_root g) -> INT_MIN<=key<=INT_MAX ->
 avl_tree_store g |-- “ avl_insert_input g root key ” && avl_subtree_store_at g root.
Proof.
 intros g root key G R K.
 pose proof (avl_gvalid_tree_valid g G) as V.
 assert (Domain:crtos_raw_domain g).
 { exact (strict_valid_nodes__strict_graph_lifecycle g V). }
 prop_apply_p (crtos_store_signed__crtos_insert_composition g Domain).
 Intros_p S.
 sep_apply_l_atomic (avl_root_tree_store_to_subtree_store g root V R).
 entailer!.
 exact (signed_insert_input__insert_finish_modify_sets g root key G R K S).
Qed.
Lemma insert_success_set__insert_finish_modify_sets : forall keys b a key ret,
 avl_set_refines_graph keys b -> strict_insert_outcome b a key ret -> ret<>0 ->
 avl_gvalid a /\ ret=avl_ptr_of (avl_root a) /\ avl_set_refines_graph (avl_set_insert keys key) a.
Proof.
 intros keys b a key ret S O N.
 destruct O as [[E _]|[[[Gb [Ga Keys]] [Nr [R _]]] _]]; [contradiction|].
 split; [exact Ga|]. split; [exact R|].
 intros x. unfold avl_set_insert. rewrite (Keys x), <- (S x). reflexivity.
Qed.
Lemma delete_set__insert_finish_modify_sets : forall keys b a key ret,
 avl_set_refines_graph keys b -> avl_delete_outcome b a key ret ->
 avl_gvalid a /\ ret=avl_ptr_of (avl_root a) /\ avl_set_refines_graph (avl_set_remove keys key) a.
Proof.
 intros keys b a key ret S [[Gb [Ga Keys]] [R _]].
 split; [exact Ga|]. split; [exact R|].
 intros x. unfold avl_set_remove. rewrite (Keys x), <- (S x). reflexivity.
Qed.
Lemma present_set__insert_finish_modify_sets : forall keys g key,
 avl_gvalid g -> avl_set_refines_graph keys g ->
 (avl_set_member keys key <-> strict_key_present g key).
Proof.
 intros keys g key G S.
 exact (avl_set_member_vertex keys g key (avl_gvalid_tree_valid g G) S).
Qed.
Lemma duplicate_result_root__insert_finish_modify_sets : forall b a key ret,
 strict_insert_outcome b a key ret -> strict_key_present b key -> ret<>0 ->
 ret=avl_ptr_of (avl_root b).
Proof.
 intros b a key ret O P N.
 destruct O as [[E _]|[Success [_ Identity]]]; [contradiction|].
 destruct (Identity P) as [R _].
 destruct Success as [_ [_ [Result _]]].
 rewrite <- R in Result. exact Result.
Qed.
Lemma finish__delete_reassembly_sets : forall before raw after key p ret,
 avl_api_delete_repair before raw key p ->
 avl_balance_graph_result raw after ret ->
 avl_balance_height_effect raw after ->
 strict_balance_identity raw after ->
 avl_delete_outcome before after key ret /\ avl_api_delete_identity before after key.
Proof.
 intros before raw after key p ret [Pending Identity] Result Height Stable.
 split.
 - eapply avl_delete_pending_balance_outcome__delete_projection_graft; eauto.
 - destruct Identity as [Present|Same]; [left; exact Present|right].
   pose proof (proj1 Pending) as Input.
   eapply strict_same_graph_trans__strict_graph_lifecycle; [exact Same|].
   apply Stable.
   eapply strict_same_graph_balanced__strict_graph_lifecycle;
     [exact (proj1 Input)|exact (proj1 (proj2 Input))|exact Same].
Qed.
Lemma root_present__delete_reassembly_sets : forall g p key,
 avl_vvalid g p -> avl_key_of g p=key -> strict_key_present g key.
Proof. intros. exists p. auto. Qed.
Lemma only_child__delete_reassembly_sets : forall g p c key,
 avl_delete_input g p key -> p<>0 -> avl_vvalid g p -> avl_key_of g p=key ->
 ((avl_left g p=None /\ c=avl_right g p) \/
  (avl_right g p=None /\ c=avl_left g p)) ->
 avl_api_delete_repair g (avl_child_model g c) key (avl_ptr_of c).
Proof.
 intros g p c key I N V K S.
 destruct (avl_only_child_pending__root_and_single_child g p c ltac:(rewrite K; exact I) N S) as [P _].
 rewrite K in P. split; [exact P|left].
 eapply root_present__delete_reassembly_sets; eauto.
Qed.
Lemma delete_set__delete_reassembly_sets : forall keys b a key ret,
 avl_set_refines_graph keys b -> avl_delete_outcome b a key ret ->
 avl_gvalid a /\ ret=avl_ptr_of (avl_root a) /\ avl_set_refines_graph (avl_set_remove keys key) a.
Proof.
 intros keys b a key ret S [[Gb [Ga Keys]] [R _]].
 split; [exact Ga|]. split; [exact R|].
 intros x. unfold avl_set_remove. rewrite (Keys x), <- (S x). reflexivity.
Qed.
Lemma parent_identity__delete_reassembly_sets : forall g p key l r,
 avl_delete_input g p key -> p<>0 ->
 strict_same_graph (avl_child_model g (avl_left g p)) l ->
 strict_same_graph (avl_child_model g (avl_right g p)) r ->
 strict_same_graph g (avl_join_model p (avl_key_of g p) l r).
Proof.
 intros g p key l r Input Np SL SR.
 pose proof SL as [RL [PL [DL FL]]].
 pose proof SR as [RR [PR [DR FR]]].
 pose proof (proj1 Input) as V.
 pose proof (proj1 (proj2 (proj2 Input))) as Rp.
 pose proof (avl_public_root_valid__insert_projection_graft g p V Rp Np) as [Root Vp].
 assert (G:avl_gvalid g).
 { apply avl_gvalid_tree_valid_iff. exact (conj V (proj1 (proj2 Input))). }
 pose proof (crtos_root_partition__crtos_insert_composition g p G Rp Np)
   as [Gl [Gr [NL [NR [DJ [Domain Nodes]]]]]].
 assert (HL:avl_child_height l (avl_root l)=avl_child_height g (avl_left g p)).
 { rewrite <-(strict_same_root_height__strict_graph_lifecycle _ _ (avl_gvalid_tree_valid _ Gl) SL).
   exact (proj2 (avl_child_root__insert_projection_graft g (avl_left g p))). }
 assert (HR:avl_child_height r (avl_root r)=avl_child_height g (avl_right g p)).
 { rewrite <-(strict_same_root_height__strict_graph_lifecycle _ _ (avl_gvalid_tree_valid _ Gr) SR).
   exact (proj2 (avl_child_root__insert_projection_graft g (avl_right g p))). }
 split; [exact Root|]. split.
 - etransitivity; [exact Nodes|].
   apply Permutation.perm_skip. apply Permutation.Permutation_app; assumption.
 - split.
   + intro x. rewrite (Domain x).
     change (x=p \/ avl_vvalid (avl_child_model g (avl_left g p)) x \/ avl_vvalid (avl_child_model g (avl_right g p)) x <->
       x=p \/ avl_vvalid l x \/ avl_vvalid r x).
     rewrite DL,DR. reflexivity.
   + intros x Hx.
     destruct (proj1 (Domain x) Hx) as [E|[VL|VR]].
     * subst x. pose proof (avl_join_root_fields__insert_projection_graft p (avl_key_of g p) l r) as [L [R [K H]]].
       split; [symmetry; exact K|]. split.
       -- rewrite H,HL,HR. exact (proj2 (proj1 (proj2 V) p Vp)).
       -- split; [rewrite L,<-RL|rewrite R,<-RR]; symmetry; apply (proj1 (avl_child_root__insert_projection_graft _ _)).
     * assert (Nx:x<>p) by (intro E; subst x; contradiction).
       pose proof (avl_join_left_fields__insert_projection_graft p (avl_key_of g p) l r x Nx (proj1 (DL x) VL)) as [L [R [K H]]].
       pose proof (crtos_child_fields__crtos_insert_composition _ _ _ VL) as [_ [CK [CH [CL CR]]]].
       pose proof (FL x VL) as [FK [FH [FLL FRR]]].
       repeat split; congruence.
     * assert (Nx:x<>p) by (intro E; subst x; contradiction).
       assert (Nlx:~avl_vvalid l x) by (intro Vx; apply (DJ x (proj2 (DL x) Vx)); exact VR).
       pose proof (avl_join_right_fields__insert_projection_graft p (avl_key_of g p) l r x Nx Nlx) as [L [R [K H]]].
       pose proof (crtos_child_fields__crtos_insert_composition _ _ _ VR) as [_ [CK [CH [CL CR]]]].
       pose proof (FR x VR) as [FK [FH [FLL FRR]]].
       repeat split; congruence.
Qed.
Lemma same_graph_refl__delete_reassembly_sets : forall g, strict_same_graph g g.
Proof. intro g. unfold strict_same_graph. repeat split; auto; reflexivity. Qed.
