Require Import Coq.ZArith.ZArith.
From SimpleC.SL Require Import Mem SeparationLogic.
Require Import Logic.LogicGenerator.demo932.Interface.
Require Export QCIPLib.crtos.crtos_avl_common.crtos_avl_graph_lib.

Local Open Scope Z_scope.
Import naive_C_Rules.
Local Open Scope sac.

(** Public balanced root view: reuse the existing graph, map refinement and
    storage. The graph is existentially hidden, including for an empty tree. *)
Definition avl_balanced_mapping_root_rep
    (m : avl_mapping) (root : addr) : Assertion :=
  EX g,
    “ avl_gvalid g /\ root = avl_ptr_of (avl_root g) /\
      avl_mapping_refines_graph m g ” && avl_tree_store g.
