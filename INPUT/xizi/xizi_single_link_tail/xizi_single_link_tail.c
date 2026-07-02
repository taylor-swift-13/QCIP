#include "xizi_single_link_def.h"

SysSingleLinklistType *xizi_single_link_tail(SysSingleLinklistType *linklist)

{
    
    while (linklist->node_next) {
        linklist = linklist->node_next;
    }

    return linklist;
}
