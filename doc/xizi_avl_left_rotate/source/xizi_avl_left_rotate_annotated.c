#include "xizi_avl_def.h"

/*@ Extern Coq (addr_avl_tree :: *) */
/*@ Extern Coq
      (avl_empty : addr_avl_tree)
      (avl_node_model : Z -> Z -> Z -> addr_avl_tree -> addr_avl_tree -> addr_avl_tree)
      (store_addr_avl : Z -> addr_avl_tree -> Assertion)
      (avl_left_rotation : addr_avl_tree -> addr_avl_tree -> Prop)
*/
/*@ Import Coq Require Import
      SimpleC.EE.Verification.xizi.xizi_avl_left_rotate.xizi_avl_left_rotate_lib
*/

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
/*@
  With left_addr right_addr middle_addr far_right_addr
       root_data root_height right_data right_height
       a b c before
  Require
    avl_node != 0 && right_addr != 0 &&
    before ==
      avl_node_model(avl_node, root_data, root_height, a,
        avl_node_model(right_addr, right_data, right_height, b, c)) &&
    store(&(avl_node -> data), root_data) *
    store(&(avl_node -> height), root_height) *
    store(&(avl_node -> left), left_addr) *
    store(&(avl_node -> right), right_addr) *
    store_addr_avl(left_addr, a) *
    store(&(right_addr -> data), right_data) *
    store(&(right_addr -> height), right_height) *
    store(&(right_addr -> left), middle_addr) *
    store(&(right_addr -> right), far_right_addr) *
    store_addr_avl(middle_addr, b) *
    store_addr_avl(far_right_addr, c)
  Ensure
    __return == right_addr &&
    avl_left_rotation(before,
      avl_node_model(right_addr, right_data, right_height,
        avl_node_model(avl_node, root_data, root_height, a, b), c)) &&
    store(&(avl_node -> data), root_data) *
    store(&(avl_node -> height), root_height) *
    store(&(avl_node -> left), left_addr) *
    store(&(avl_node -> right), middle_addr) *
    store_addr_avl(left_addr, a) *
    store(&(right_addr -> data), right_data) *
    store(&(right_addr -> height), right_height) *
    store(&(right_addr -> left), avl_node) *
    store(&(right_addr -> right), far_right_addr) *
    store_addr_avl(middle_addr, b) *
    store_addr_avl(far_right_addr, c)
*/
{
    struct AvlNode *new_node = avl_node->right;

    avl_node->right = new_node->left;
    new_node->left = avl_node;

    return new_node;
}
