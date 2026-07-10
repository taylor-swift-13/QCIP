struct tree {
    int key;
    int value;
    unsigned char height;
    struct tree *lchild;
    struct tree *rchild;
};

/*@ Extern Coq (tree :: *) */
/*@ Extern Coq (store_tree : Z -> tree -> Assertion)
               (store_tree_shape : Z -> Assertion)
               (store_non_empty_tree : Z -> Assertion)
               (make_tree : tree -> tree -> tree)
               (empty : tree)
               (single_tree_node : Z -> Z -> Z -> Z -> Z -> Z -> Assertion)
               (tree_size : tree -> Z)
               (tree_depth : tree -> Z)
               (tree_mirror : tree -> tree)
*/
/*@ include strategies "binaryTree.strategies" */
/*@ Import Coq Require Import QCIPLib.binaryTree.common.binaryTree_lib */
