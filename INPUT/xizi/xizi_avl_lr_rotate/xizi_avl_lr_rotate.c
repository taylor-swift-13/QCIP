#include "xizi_avl_def.h"

/* Left child of the top node is rotated left, verified separately in
 * xizi_avl_left_rotate.  Declared here as a prototype + shape contract. */
struct AvlNode *xizi_avl_left_rotate(struct AvlNode *avl_node)

;

/* Top node is rotated right, verified separately in xizi_avl_right_rotate. */
struct AvlNode *xizi_avl_right_rotate(struct AvlNode *avl_node)

;

/* Left-Right double rotation of an AVL subtree (the LR-imbalance fix): rotate
 * the left child left, then rotate the root right.
 *
 * Shape-level closure of
 *   crtos/Ubiquitous/XiZi_IIoT_Macro/kernel/thread/avl_tree.c
 *   :: AvlTreeSetLRRotate
 * following the QCP AVL benchmark convention (see QCP avl_insert.c::rotateLR).
 * The top node and its (non-empty) left child are supplied exposed, so both
 * inner rotations meet their contracts and the double rotation yields a
 * well-formed non-empty tree rooted at the left child's right grandchild. */
struct AvlNode *xizi_avl_lr_rotate(struct AvlNode *avl_node)

{
    struct AvlNode *left_node = avl_node->left;

    avl_node->left = xizi_avl_left_rotate(left_node);

    struct AvlNode *new_node = xizi_avl_right_rotate(avl_node);

    return new_node;
}
