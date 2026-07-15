#include "xizi_avl_def.h"

/* Right rotation of an AVL subtree (the LL-imbalance fix).
 *
 * Shape-level closure of
 *   crtos/Ubiquitous/XiZi_IIoT_Macro/kernel/thread/avl_tree.c
 *   :: AvlTreeSetRightRotate
 * following the QCP AVL benchmark convention (see QCP avl_insert.c::rotateR):
 * the caller supplies the top node already exposed as single_tree_node plus the
 * shapes of the two children, with the left child marked non-empty
 * (store_non_empty_tree) so the two-level dereference temp = root->left ;
 * temp->right is certified memory-safe.
 *
 *        avl_node                 new_node
 *        /      \                 /      \
 *    new_node    r     ==>       .      avl_node
 *     /    \                             /    \
 *    .      .                           .      r
 *
 * The contract certifies memory-safety and that the result is a well-formed
 * non-empty tree (store_non_empty_tree) rooted at the promoted left child.
 *
 * The kernel routine additionally refreshes the cached [height] fields via
 * AvlTreeGetNodeHeight; those writes only touch the per-node height metadata,
 * which the shape predicates abstract away, so they are elided here. */
struct AvlNode *xizi_avl_right_rotate(struct AvlNode *avl_node)

{
    struct AvlNode *new_node = avl_node->left;

    avl_node->left = new_node->right;
    new_node->right = avl_node;

    return new_node;
}
