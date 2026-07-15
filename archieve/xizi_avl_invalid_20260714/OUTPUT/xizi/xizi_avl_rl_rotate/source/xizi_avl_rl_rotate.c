#include "xizi_avl_def.h"

/* Right child of the top node is rotated right, verified separately in
 * xizi_avl_right_rotate.  Declared here as a prototype + shape contract. */
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

/* Top node is rotated left, verified separately in xizi_avl_left_rotate. */
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

/* Right-Left double rotation of an AVL subtree (the RL-imbalance fix): rotate
 * the right child right, then rotate the root left.
 *
 * Shape-level closure of
 *   crtos/Ubiquitous/XiZi_IIoT_Macro/kernel/thread/avl_tree.c
 *   :: AvlTreeSetRLRotate
 * following the QCP AVL benchmark convention (see QCP avl_insert.c::rotateRL).
 * The top node and its (non-empty) right child are supplied exposed, so both
 * inner rotations meet their contracts and the double rotation yields a
 * well-formed non-empty tree rooted at the right child's left grandchild. */
struct AvlNode *xizi_avl_rl_rotate(struct AvlNode *avl_node)
/*@ With d h l r d1 h1 l1 r1
    Require avl_node != 0 &&
            r != 0 &&
            single_tree_node(avl_node, d, h, l, r) *
            single_tree_node(r, d1, h1, l1, r1) *
            store_tree_shape(l) *
            store_non_empty_tree(l1) *
            store_tree_shape(r1)
    Ensure  __return == l1 &&
            store_non_empty_tree(l1)
*/
{
    struct AvlNode *right_node = avl_node->right;

    avl_node->right = xizi_avl_right_rotate(right_node)/*@ where d=d1, h=h1, l=l1, r=r1 */;

    struct AvlNode *new_node = xizi_avl_left_rotate(avl_node)/*@ where r=l1 */;

    return new_node;
}
