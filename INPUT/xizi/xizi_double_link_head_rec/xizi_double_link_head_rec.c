#include "xizi_double_link_def.h"

struct SysDoubleLinklistNode *xizi_double_link_head_rec(
    const DoubleLinklistType *linklist)
{
    return linklist->node_next == linklist ? (void *)0 : linklist->node_next;
}
