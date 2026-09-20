#include "verification_stdlib.h"
#include "verification_list.h"

struct tree {
  int key;
  struct tree *left;
  struct tree *right;
};

/*@ Extern Coq (G :: *) */
/*@ Extern Coq (cur_source :: *) */
/*@ Extern Coq (source_root : cur_source)
               (source_left_child : Z -> cur_source)
               (source_right_child : Z -> cur_source) */
/*@ Extern Coq (bst_gvalid : G -> Prop)
               (bst_vvalid : G -> Z -> Prop)
               (bst_root : G -> option Z)
               (bst_left : G -> Z -> option Z)
               (bst_right : G -> Z -> option Z)
               (bst_nodes : G -> list Z)
               (bst_key_of : G -> Z -> Z)
               (ptr_of : option Z -> Z)
               (option_ptr : Z -> option Z)
               (Permutation : {A} -> list A -> list A -> Prop) */
/*@ Extern Coq (tree_node_store : G -> Z -> Assertion)
               (tree_node_update_key : G -> Z -> Z -> Assertion)
               (tree_nodes_store : G -> list Z -> Assertion)
               (tree_store : G -> Assertion)
               (tree_nodes_without_pointer2 : Z -> option Z -> G -> cur_source -> list Z -> Assertion)
               (has_cur_source : G -> option Z -> cur_source -> option Z -> Prop)
               (has_cur_source2 : Z -> option Z -> G -> cur_source -> Z -> Prop)
               (bst_node_domain_valid : G -> list Z -> Prop)
               (cur_source_value : G -> cur_source -> option Z -> option Z)
               (update_root : option Z -> cur_source -> option Z -> option Z)
               (cur_source_reachable : G -> cur_source -> cur_source -> option Z -> Prop)
               (cur_source_search_valid : G -> cur_source -> option Z -> Z -> Prop)
               (cur_source_successor_valid : G -> Z -> Z -> Prop) */
/*@ Extern Coq (bst_insert : G -> G -> Z -> Z -> Prop)
               (bst_insert_valid : G -> G -> Z -> Z -> Prop)
               (bst_delete : G -> G -> Z -> Z -> Prop)
               (bst_key_update : G -> G -> Z -> Z -> Prop)
               (bst_redirect : G -> G -> cur_source -> option Z -> Prop)
               (bst_keyed_insert : G -> G -> G -> cur_source -> Z -> Prop) */

/*@ Import Coq Require Import Coq.Sorting.Permutation */
/*@ Import Coq Require Import SimpleC.EE.QCP_demos_LLM.bst_insert_new_lib */
/*@ Import Coq Require Import SimpleC.EE.QCP_demos_LLM.bst_delete_new_lib */
/*@ include strategies "bst_new.strategies" */
