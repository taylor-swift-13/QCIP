#include "xizi_single_link_def.h"

SysSingleLinklistType *xizi_single_link_remove_node(SysSingleLinklistType *linklist, SysSingleLinklistType *linklist_node)

{
    struct SingleLinklistNode *node = linklist;

    
    while (node->node_next && node->node_next != linklist_node) {
        node = node->node_next;
    }

    
    if (node->node_next != (SysSingleLinklistType *)0) {
        node->node_next = node->node_next->node_next;
    }

    return linklist;
}
