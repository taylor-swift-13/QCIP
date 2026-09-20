#include "xizi_avl_def.h"

struct AvlNode *xizi_avl_delete_leaf_node(struct AvlNode *avl_node);
struct AvlNode *xizi_avl_balance(struct AvlNode *avl_node);

/* Compilable single-function extraction of crtos AvlTreeDeleteNode.
 * Kernel logging is omitted. */
struct AvlNode *xizi_avl_delete(struct AvlNode *avl_node, int data)
{
    if (avl_node != (void *)0) {
        if (data == avl_node->data) {
            avl_node = xizi_avl_delete_leaf_node(avl_node);
        } else if (avl_node->data < data) {
            avl_node->right = xizi_avl_delete(avl_node->right, data);
        } else {
            avl_node->left = xizi_avl_delete(avl_node->left, data);
        }

        return xizi_avl_balance(avl_node);
    }

    return (void *)0;
}
