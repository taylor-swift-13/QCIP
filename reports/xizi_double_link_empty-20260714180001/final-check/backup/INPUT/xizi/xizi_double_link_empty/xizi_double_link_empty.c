#include "xizi_double_link_def.h"

int xizi_double_link_empty(const DoubleLinklistType *linklist)
{
    return linklist->node_next == linklist;
}
