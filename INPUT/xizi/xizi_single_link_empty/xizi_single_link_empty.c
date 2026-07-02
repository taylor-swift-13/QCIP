#include "xizi_single_link_def.h"

int xizi_single_link_empty(SysSingleLinklistType *linklist)

{
    return linklist->node_next == (void *)0;
}
