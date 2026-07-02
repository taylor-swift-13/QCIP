#include "xizi_double_link_def.h"

struct SysDoubleLinklistNode *xizi_double_link_next(
    const DoubleLinklistType *linklist,
    const struct SysDoubleLinklistNode *linklist_node)
{
    return linklist_node->node_next == linklist ? NONE : linklist_node->node_next;
}
