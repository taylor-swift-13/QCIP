#include "xizi_avl_def.h"

int xizi_avl_balance_factor(struct AvlNode *avl_node);
struct AvlNode *xizi_avl_right_rotate(struct AvlNode *avl_node);
struct AvlNode *xizi_avl_left_rotate(struct AvlNode *avl_node);
struct AvlNode *xizi_avl_lr_rotate(struct AvlNode *avl_node);
struct AvlNode *xizi_avl_rl_rotate(struct AvlNode *avl_node);

/* Compilable single-function extraction of crtos AvlTreeBalance.
 * The original dispatch order and NULL result for unmatched imbalanced cases
 * are intentionally preserved. */
struct AvlNode *xizi_avl_balance(struct AvlNode *avl_node)
{
    if (avl_node != (void *)0) {
        struct AvlNode *new_node = (void *)0;
        int balance_factor = xizi_avl_balance_factor(avl_node);
        unsigned int absolute_balance_factor =
            (unsigned int)(balance_factor > 0 ? balance_factor : -balance_factor);

        if (absolute_balance_factor > 1U) {
            if (xizi_avl_balance_factor(avl_node->left) > 0) {
                new_node = xizi_avl_right_rotate(avl_node);
            } else if (xizi_avl_balance_factor(avl_node->left) < 0) {
                new_node = xizi_avl_lr_rotate(avl_node);
            } else if (xizi_avl_balance_factor(avl_node->right) < 0) {
                new_node = xizi_avl_left_rotate(avl_node);
            } else if (xizi_avl_balance_factor(avl_node->right) > 0) {
                new_node = xizi_avl_rl_rotate(avl_node);
            }
        } else {
            new_node = avl_node;
        }

        return new_node;
    }

    return (void *)0;
}
