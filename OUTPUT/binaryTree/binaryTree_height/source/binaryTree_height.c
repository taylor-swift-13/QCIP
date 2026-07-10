#include "binaryTree_def.h"

/* Compute the height of a binary tree (an empty tree has height 0).
 *
 * This is the fundamental measure behind "balanced binary trees":
 * a tree is height-balanced when, at every node, the heights of the
 * two subtrees differ by at most one.
 *
 * The precondition [tree_depth(tr) <= INT_MAX] guarantees the height
 * fits in a C [int], so the [+1] increments never overflow. */
int tree_height(struct tree *root)
/*@ With tr
    Require store_tree(root, tr) && tree_depth(tr) <= INT_MAX
    Ensure store_tree(root, tr) && __return == tree_depth(tr)
*/
{
    if (root == (void *)0) {
        return 0;
    }
    int lh = tree_height(root->lchild);
    int rh = tree_height(root->rchild);
    if (lh > rh) {
        return lh + 1;
    } else {
        return rh + 1;
    }
}
