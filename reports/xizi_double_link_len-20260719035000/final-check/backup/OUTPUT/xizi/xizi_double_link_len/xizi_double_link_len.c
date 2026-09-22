#include "xizi_double_link_def.h"

unsigned int xizi_double_link_len(const DoubleLinklistType *linklist)
{
    unsigned int linklist_length = 0;
    const DoubleLinklistType *tmp_node = linklist;
    while (tmp_node->node_next != linklist) {
        tmp_node = tmp_node->node_next;
        linklist_length++;
    }

    return linklist_length;
}
