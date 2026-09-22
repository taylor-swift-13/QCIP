#include "verification_stdlib.h"
#include "verification_list.h"
#include "../../xizi_single_link_common/source/xizi_single_link_def.h"

SysSingleLinklistType *SingleLinkListGetNextNode(SysSingleLinklistType *linklist_node)
/*@ With l
    Require
      In(linklist_node, l) &&
      xizi_sll(xizi_sll_first_value(l), l)
    Ensure
      __return == xizi_sll_next_value(l, linklist_node) &&
      xizi_sll(xizi_sll_first_value(l), l)
*/
{
    return linklist_node->node_next;
}
