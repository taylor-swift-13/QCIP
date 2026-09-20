#include "xizi_avl_def.h"

void *x_malloc(unsigned long size);
void x_free(void *pointer);
struct AvlNode *xizi_avl_balance(struct AvlNode *avl_node);

/* Compilable single-function extraction of crtos AvlTreeInsertNode.
 * Kernel logging is omitted; allocation, recursion and error propagation are
 * otherwise kept in the same order as the source. */
struct AvlNode *xizi_avl_insert(struct AvlNode *avl_node, int data)
{
    struct AvlNode *new_node = (void *)0;

    if (avl_node == (void *)0) {
        new_node = x_malloc(sizeof(struct AvlNode));
        if (new_node == (void *)0) {
            x_free(new_node);
            return (void *)0;
        }
        new_node->data = data;
        new_node->left = (void *)0;
        new_node->right = (void *)0;
        new_node->height = 1U;
        avl_node = new_node;
    } else if (data == avl_node->data) {
        return avl_node;
    } else if (avl_node->data < data) {
        avl_node->right = xizi_avl_insert(avl_node->right, data);
        if (avl_node->right == (void *)0) {
            return (void *)0;
        }
    } else {
        avl_node->left = xizi_avl_insert(avl_node->left, data);
        if (avl_node->left == (void *)0) {
            return (void *)0;
        }
    }

    return xizi_avl_balance(avl_node);
}
