#include "xizi_double_link_def.h"





struct SysDoubleLinklistNode *xizi_double_link_head(
    const DoubleLinklistType *linklist)

{
    return linklist->node_next == linklist ? NONE : linklist->node_next;
}
