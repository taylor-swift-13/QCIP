#include "verification_stdlib.h"
#include "verification_list.h"
#include "../../xizi_single_link_common/source/xizi_single_link_def.h"

void SingleLinkListNodeInsert(
    SysSingleLinklistType *linklist,
    SysSingleLinklistType *linklist_node)
/*@ With l
    Require
      xizi_sll_head(linklist, l) *
      xizi_sll_node(linklist_node)
    Ensure
      xizi_sll_head(linklist, cons(linklist_node, l))
*/
{
    linklist_node->node_next = linklist->node_next;
    linklist->node_next = linklist_node;
}
