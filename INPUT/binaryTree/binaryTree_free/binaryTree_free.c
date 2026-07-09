#include "binaryTree_def.h"

/* Deallocate a single tree node (leaf-level primitive). */
void free_tree_node(struct tree *p)
/*@ With k v h l r
    Require single_tree_node(p, k, v, h, l, r)
    Ensure emp
*/
;

/* Recursively free every node of a binary tree.  The specification
 * [store_tree(root, tr) => emp] certifies that the whole tree is
 * released with no memory leak and no double free. */
void free_tree(struct tree *root)
/*@ With tr
    Require store_tree(root, tr)
    Ensure emp
*/
{
    if (root == (void *)0) {
        return;
    }
    free_tree(root->lchild);
    free_tree(root->rchild);
    free_tree_node(root);
}
