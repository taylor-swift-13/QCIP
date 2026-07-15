struct AvlNode {
    int data;
    unsigned int height;
    struct AvlNode *left;
    struct AvlNode *right;
};

typedef struct AvlNode *AvlNodeType;

/*@ Extern Coq (addr_avl_tree :: *) */
/*@ Extern Coq (avl_empty : addr_avl_tree)
               (avl_node_model : Z -> Z -> Z -> addr_avl_tree -> addr_avl_tree -> addr_avl_tree)
               (avl_root_addr : addr_avl_tree -> Z)
               (avl_size : addr_avl_tree -> Z)
               (avl_depth : addr_avl_tree -> Z)
               (avl_balance_factor : addr_avl_tree -> Z)
               (avl_cached_height : addr_avl_tree -> Z)
               (store_addr_avl : Z -> addr_avl_tree -> Assertion)
               (store_addr_avl_shape : Z -> Assertion)
               (store_nonempty_addr_avl : Z -> Assertion)
               (avl_node_fields : Z -> Z -> Z -> Z -> Z -> Assertion)
               (avl_left_rotation : addr_avl_tree -> addr_avl_tree -> Prop)
               (avl_right_rotation : addr_avl_tree -> addr_avl_tree -> Prop)
               (avl_lr_rotation : addr_avl_tree -> addr_avl_tree -> Prop)
               (avl_rl_rotation : addr_avl_tree -> addr_avl_tree -> Prop)
*/
/*@ include strategies "xizi_avl.strategies" */
/*@ Import Coq Require Import QCIPLib.xizi.xizi_avl_common.xizi_avl_lib */
