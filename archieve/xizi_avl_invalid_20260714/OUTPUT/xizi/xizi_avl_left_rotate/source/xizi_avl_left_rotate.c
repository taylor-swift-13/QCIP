#include "xizi_avl_def.h"

/* Left rotation of an AVL subtree (the RR-imbalance fix); mirror of the right
 * rotation.
 *
 * Shape-level closure of
 *   crtos/Ubiquitous/XiZi_IIoT_Macro/kernel/thread/avl_tree.c
 *   :: AvlTreeSetLeftRotate
 * following the QCP AVL benchmark convention (see QCP avl_insert.c::rotateL):
 * the top node is supplied as single_tree_node plus the child shapes, with the
 * right child marked non-empty so temp = root->right ; temp->left is certified
 * memory-safe.
 *
 *      avl_node                     new_node
 *      /      \                     /      \
 *     l    new_node   ==>       avl_node    .
 *           /    \               /    \
 *          .      .             l      .
 *
 * The contract certifies memory-safety and a well-formed non-empty result tree
 * rooted at the promoted right child.  The kernel's cached [height] refresh is
 * elided (the shape predicates abstract heights). */
struct AvlNode *xizi_avl_left_rotate(struct AvlNode *avl_node)
/*@ With d h l r
    Require avl_node != 0 &&
            single_tree_node(avl_node, d, h, l, r) *
            store_tree_shape(l) *
            store_non_empty_tree(r)
    Ensure  __return == r &&
            store_non_empty_tree(r)
*/
{
    struct AvlNode *new_node = avl_node->right;

    avl_node->right = new_node->left;
    new_node->left = avl_node;

    return new_node;
}
