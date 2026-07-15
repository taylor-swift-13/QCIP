#include "xizi_avl_def.h"

/* Height of an AVL tree node (an empty tree has height 0), returning
 * max(height(left), height(right)) + 1.
 *
 * Faithful compilable closure of
 *   crtos/Ubiquitous/XiZi_IIoT_Macro/kernel/thread/avl_tree.c
 *   :: AvlTreeGetNodeHeight
 * with the AVL_MAX(a, b) ternary macro hoisted into an explicit if/else and
 * each recursive call bound to a local so every child is visited exactly once
 * (the macro would otherwise re-evaluate its arguments).  The uint32 return of
 * the kernel routine is modelled as a C int; heights are small non-negative
 * counts, and the precondition tree_depth(tr) <= INT_MAX keeps the +1
 * increments inside the int range so they never overflow. */
int xizi_avl_height(struct AvlNode *avl_node)

{
    if (avl_node == (void *)0) {
        return 0;
    }
    int lh = xizi_avl_height(avl_node->left);
    int rh = xizi_avl_height(avl_node->right);
    if (lh > rh) {
        return lh + 1;
    } else {
        return rh + 1;
    }
}
