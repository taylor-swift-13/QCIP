#include "xizi_avl_def.h"

/* Left rotation of an AVL subtree (the RR-imbalance fix); mirror of the right
 * rotation.
 *
 * Shape-level closure of
 *   crtos/Ubiquitous/XiZi_IIoT_Macro/kernel/thread/avl_tree.c
 *   :: AvlTreeSetLeftRotate
 * The caller supplies a non-null top node whose right child is also non-null.
 *
 *      avl_node                     new_node
 *      /      \                     /      \
 *     l    new_node   ==>       avl_node    .
 *           /    \               /    \
 *          .      .             l      .
 *
 * This primitive only rewires child pointers.  It preserves the data and
 * cached height fields verbatim; callers that maintain cached AVL heights must
 * refresh those fields separately. */
struct AvlNode *xizi_avl_left_rotate(struct AvlNode *avl_node)
{
    struct AvlNode *new_node = avl_node->right;

    avl_node->right = new_node->left;
    new_node->left = avl_node;

    return new_node;
}
