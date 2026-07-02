#include "xizi_single_link_def.h"

SysSingleLinklistType *xizi_single_link_first(SysSingleLinklistType *linklist)

{
    return linklist->node_next;
}
