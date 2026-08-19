struct AvlNode {
    int data;
    unsigned int height;
    struct AvlNode *left;
    struct AvlNode *right;
};

typedef struct AvlNode *AvlNodeType;

/*@ Extern Coq (tree :: *) */
/*@ Extern Coq (store_tree : Z -> tree -> Assertion)
               (store_tree_shape : Z -> Assertion)
               (store_non_empty_tree : Z -> Assertion)
               (make_tree : tree -> tree -> tree)
               (empty : tree)
               (single_tree_node : Z -> Z -> Z -> Z -> Z -> Assertion)
               (tree_depth : tree -> Z)
               (tree_size : tree -> Z)
*/
/*@ include strategies "xizi_avl.strategies" */
/*@ Import Coq Require Import QCIPLib.xizi.xizi_avl_common.xizi_avl_lib */
