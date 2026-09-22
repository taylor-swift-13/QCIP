#include "verification_stdlib.h"
#include "verification_list.h"
#include "../../xizi_single_link_common/source/xizi_single_link_def.h"

void xizi_single_link_init(SysSingleLinklistType *linklist)
/*@ Require
      xizi_sll_node(linklist)
    Ensure
      xizi_sll_head(linklist, nil)
*/
{
    linklist->node_next = (void *)0;
}
