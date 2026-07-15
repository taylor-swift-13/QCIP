#include "xizi_avl_def.h"

/* Height of an AVL tree node; verified separately in xizi_avl_height.
 * Declared here (prototype + spec, no body) so the balance-factor routine
 * below can call it against its certified contract. */
int xizi_avl_height(struct AvlNode *avl_node)

;

/* Balance factor of an AVL tree node: height(left) - height(right)
 * (an empty tree is balanced, factor 0).
 *
 * Faithful compilable closure of
 *   crtos/Ubiquitous/XiZi_IIoT_Macro/kernel/thread/avl_tree.c
 *   :: AvlTreeGetNodeBalanceFactor
 * with the int32 return modelled as a C int.  The precondition
 * tree_depth(tr) <= INT_MAX bounds each subtree height into [0, INT_MAX], so
 * the difference stays within [INT_MIN, INT_MAX] and never overflows. */
int xizi_avl_balance_factor(struct AvlNode *avl_node)

{
    if (avl_node == (void *)0) {
        return 0;
    }
    int lh = xizi_avl_height(avl_node->left);
    int rh = xizi_avl_height(avl_node->right);
    return lh - rh;
}
