#include "xizi_double_link_def.h"





struct SysDoubleLinklistNode *xizi_double_link_next_rec_last(
    const DoubleLinklistType *linklist,
    const struct SysDoubleLinklistNode *linklist_node)

{
    
    return linklist_node->node_next == linklist ?
        (void *)0 : linklist_node->node_next;
}
