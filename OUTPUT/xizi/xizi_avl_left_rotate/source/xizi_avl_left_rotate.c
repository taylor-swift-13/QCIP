#include "../../../QCIPLib/xizi/xizi_avl_common/xizi_avl_def.h"

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
  With right_addr root_data root_height right_data right_height a b c before
  Require
    avl_node != 0 && right_addr != 0 &&
    before ==
      avl_node_model(avl_node, root_data, root_height, a,
        avl_node_model(right_addr, right_data, right_height, b, c)) &&
    store_addr_avl(avl_node, before)
  Ensure
    exists after,
      __return == right_addr &&
      after ==
        avl_node_model(right_addr, right_data, right_height,
          avl_node_model(avl_node, root_data, root_height, a, b), c) &&
      avl_left_rotation(before, after) &&
      store_addr_avl(__return, after)
*/
{
    struct AvlNode *new_node = avl_node->right;

    /*@ Assert
          avl_node == avl_node@pre &&
          new_node == right_addr &&
          avl_node != 0 && right_addr != 0 &&
          before ==
            avl_node_model(avl_node, root_data, root_height, a,
              avl_node_model(right_addr, right_data, right_height, b, c)) &&
          avl_node_fields(avl_node, root_data, root_height,
            avl_root_addr(a), right_addr) *
          store_addr_avl(avl_root_addr(a), a) *
          store_addr_avl(right_addr,
            avl_node_model(right_addr, right_data, right_height, b, c))
    */
    avl_node->right = new_node->left;
    new_node->left = avl_node;

    return new_node;
}
