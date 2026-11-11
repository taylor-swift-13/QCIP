Require Import Coq.ZArith.ZArith Coq.Lists.List.
From SimpleC.SL Require Import Mem SeparationLogic.
Require Import Logic.LogicGenerator.demo932.Interface.
Require Export QCIPLib.crtos.crtos_avl_common.crtos_avl_graph_lib.

Import naive_C_Rules.
Local Open Scope Z_scope.
Local Open Scope sac.

Definition avl_key_set := Z -> Prop.

Definition avl_set_refines_graph (keys : avl_key_set) (g : avl_model) : Prop :=
  forall key, keys key <-> In key (avl_keys g).

Definition avl_set_member (keys : avl_key_set) (key : Z) : Prop := keys key.

Definition avl_set_insert (keys : avl_key_set) (key : Z) : avl_key_set :=
  fun x => x = key \/ keys x.

Definition avl_set_remove (keys : avl_key_set) (key : Z) : avl_key_set :=
  fun x => keys x /\ x <> key.

Definition avl_balanced_set_root_rep (keys : avl_key_set) (root : addr) : Assertion :=
  EX g, “ avl_gvalid g /\ root = avl_ptr_of (avl_root g) /\
          avl_set_refines_graph keys g ” && avl_tree_store g.

(* The hit describes a single returned pointer in the same owned tree. *)
Definition avl_balanced_set_hit_rep
    (keys : avl_key_set) (root key result : Z) : Assertion :=
  EX g, “ avl_gvalid g /\ root = avl_ptr_of (avl_root g) /\
          avl_set_refines_graph keys g /\
          avl_vvalid g result /\ avl_key_of g result = key ” &&
        avl_tree_store g.

Lemma avl_set_member_vertex : forall keys g key,
  avl_tree_valid g -> avl_set_refines_graph keys g ->
  (keys key <-> exists x, avl_vvalid g x /\ avl_key_of g x = key).
Proof.
  intros keys g key Valid Hset. transitivity (In key (avl_keys g)); [apply Hset|]. split.
  - unfold avl_keys. rewrite in_map_iff.
    intros [x [Key Node]]. exists x. split; [|exact Key].
    apply (GraphLib.examples.bst.listV_sound _
      (GraphLib.examples.bst.bst_binary_tree _ (proj1 Valid))); exact Node.
  - intros [x [Node Key]]. rewrite <- Key.
    eapply avl_key_of_member__insert_projection_graft; eauto.
Qed.

Lemma avl_set_hit_rep_forget : forall keys root key result,
  avl_balanced_set_hit_rep keys root key result |--
  avl_balanced_set_root_rep keys root.
Proof.
  intros keys root key result.
  unfold avl_balanced_set_hit_rep, avl_balanced_set_root_rep.
  Intros g. Exists g. entailer!.
Qed.
