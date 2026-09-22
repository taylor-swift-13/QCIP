#include "verification_stdlib.h"
#include "verification_list.h"
#include "../../xizi_single_link_common/source/xizi_single_link_def.h"

SysSingleLinklistType *SingleLinkListGetFirstNode(SysSingleLinklistType *linklist)
/*@ With l
    Require
      xizi_sll_head(linklist, l)
    Ensure
      __return == xizi_sll_first_value(l) &&
      xizi_sll_head(linklist, l)
*/
{
    return linklist->node_next;
}
