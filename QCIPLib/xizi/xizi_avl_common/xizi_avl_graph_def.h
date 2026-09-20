#ifndef QCIP_XIZI_AVL_GRAPH_DEF_H
#define QCIP_XIZI_AVL_GRAPH_DEF_H

struct AvlNode {
    int data;
    unsigned int height;
    struct AvlNode *left;
    struct AvlNode *right;
};

typedef struct AvlNode *AvlNodeType;

/*@ Extern Coq (avl_model :: *) */
/*@ Extern Coq (avl_root : avl_model -> option Z)
               (avl_left : avl_model -> Z -> option Z)
               (avl_right : avl_model -> Z -> option Z)
               (avl_nodes : avl_model -> list Z)
               (avl_key_of : avl_model -> Z -> Z)
               (avl_keys : avl_model -> list Z)
               (avl_height_of : avl_model -> Z -> Z)
               (avl_vvalid : avl_model -> Z -> Prop)
               (avl_ptr_of : option Z -> Z)
               (avl_child_height : avl_model -> option Z -> Z)
               (avl_model_balance_factor : avl_model -> Z -> Z)
               (avl_height_consistent : avl_model -> Prop)
               (avl_balanced : avl_model -> Prop)
               (avl_bst_valid : avl_model -> Prop)
               (avl_gvalid : avl_model -> Prop)
               (avl_graph_node_store : avl_model -> Z -> Assertion)
               (avl_tree_store : avl_model -> Assertion)
               (avl_rep : avl_model -> Assertion)
               (avl_left_rotation_model : avl_model -> avl_model -> Z -> Z -> Prop)
               (avl_right_rotation_model : avl_model -> avl_model -> Z -> Z -> Prop)
               (avl_lr_rotation_model : avl_model -> avl_model -> Z -> Z -> Z -> Prop)
               (avl_rl_rotation_model : avl_model -> avl_model -> Z -> Z -> Z -> Prop)
               (avl_insert_result : avl_model -> avl_model -> Z -> Prop)
               (avl_delete_result : avl_model -> avl_model -> Z -> Prop)
               (avl_modify_result : avl_model -> avl_model -> Z -> Z -> Prop)
               (avl_search_result : avl_model -> Z -> Z -> Prop)
*/
/*@ Import Coq Require Import QCIPLib.xizi.xizi_avl_common.xizi_avl_graph_lib */

#endif
