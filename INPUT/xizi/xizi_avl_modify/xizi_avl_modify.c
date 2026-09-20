#include "xizi_avl_def.h"

struct AvlNode *xizi_avl_delete(struct AvlNode *avl_node, int data);
struct AvlNode *xizi_avl_insert(struct AvlNode *avl_node, int data);

/* Compilable single-function extraction of crtos AvlNodeModifyNode.
 * Kernel logging is omitted. */
struct AvlNode *xizi_avl_modify(
    struct AvlNode *avl_node,
    int source_data,
    int destination_data)
{
    struct AvlNode *destination_node = (void *)0;

    if (avl_node != (void *)0) {
        avl_node = xizi_avl_delete(avl_node, source_data);
        destination_node = xizi_avl_insert(avl_node, destination_data);
    } else {
        return (void *)0;
    }

    return destination_node;
}
