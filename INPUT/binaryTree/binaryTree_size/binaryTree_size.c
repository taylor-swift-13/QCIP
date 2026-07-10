#include "binaryTree_def.h"

/* Count the number of nodes in a binary tree.
 *
 * The precondition [tree_size(tr) <= INT_MAX] guarantees the node count
 * is representable as a C [int], so none of the internal additions
 * overflow. */
int count_nodes(struct tree *root)
/*@ With tr
    Require store_tree(root, tr) && tree_size(tr) <= INT_MAX
    Ensure store_tree(root, tr) && __return == tree_size(tr)
*/
{
    if (root == (void *)0) {
        return 0;
    }
    int ls = count_nodes(root->lchild);
    int rs = count_nodes(root->rchild);
    return ls + rs + 1;
}
