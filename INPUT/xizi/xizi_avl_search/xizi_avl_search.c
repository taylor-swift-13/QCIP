#include "xizi_avl_def.h"

/* Compilable single-function extraction of crtos AvlNodeSearchNode.
 * Kernel logging is omitted. */
struct AvlNode *xizi_avl_search(struct AvlNode *avl_node, int data)
{
    struct AvlNode *destination_node = (void *)0;

    if (avl_node != (void *)0) {
        if (data == avl_node->data) {
            destination_node = avl_node;
        } else if (avl_node->data < data) {
            destination_node = xizi_avl_search(avl_node->right, data);
        } else {
            destination_node = xizi_avl_search(avl_node->left, data);
        }
    } else {
        return (void *)0;
    }

    return destination_node;
}
