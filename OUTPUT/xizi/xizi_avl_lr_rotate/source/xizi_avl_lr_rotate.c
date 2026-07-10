#include "xizi_avl_def.h"

/* Left child of the top node is rotated left, verified separately in
 * xizi_avl_left_rotate.  Declared here as a prototype + shape contract. */
struct AvlNode *xizi_avl_left_rotate(struct AvlNode *avl_node)
/*@ With d h l r
    Require avl_node != 0 &&
            single_tree_node(avl_node, d, h, l, r) *
            store_tree_shape(l) *
            store_non_empty_tree(r)
    Ensure  __return == r &&
            store_non_empty_tree(r)
*/
;

/* Top node is rotated right, verified separately in xizi_avl_right_rotate. */
struct AvlNode *xizi_avl_right_rotate(struct AvlNode *avl_node)
/*@ With d h l r
    Require avl_node != 0 &&
            single_tree_node(avl_node, d, h, l, r) *
            store_non_empty_tree(l) *
            store_tree_shape(r)
    Ensure  __return == l &&
            store_non_empty_tree(l)
*/
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
/*@ With d h l r d1 h1 l1 r1
    Require avl_node != 0 &&
            l != 0 &&
            single_tree_node(avl_node, d, h, l, r) *
            single_tree_node(l, d1, h1, l1, r1) *
            store_tree_shape(r) *
            store_tree_shape(l1) *
            store_non_empty_tree(r1)
    Ensure  __return == r1 &&
            store_non_empty_tree(r1)
*/
{
    struct AvlNode *left_node = avl_node->left;

    avl_node->left = xizi_avl_left_rotate(left_node)/*@ where d=d1, h=h1, l=l1, r=r1 */;

    struct AvlNode *new_node = xizi_avl_right_rotate(avl_node)/*@ where l=r1 */;

    return new_node;
}
