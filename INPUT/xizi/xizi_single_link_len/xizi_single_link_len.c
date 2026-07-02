#include "xizi_single_link_def.h"

unsigned int xizi_single_link_len(const SysSingleLinklistType *linklist)

{
    unsigned int length = 0;
    const SysSingleLinklistType *tmp_list = linklist->node_next;

    
    while (tmp_list != (void *)0)
    {
        tmp_list = tmp_list->node_next;
        length ++;
    }

    return length;
}
