#include "verification_stdlib.h"
#include "verification_list.h"
#include "xizi_double_link_def.h"

struct SysDoubleLinklistNode *xizi_double_link_next(
    const DoubleLinklistType *linklist,
    const struct SysDoubleLinklistNode *linklist_node)
/*@ With next
    Require
      linklist != 0 &&
      linklist_node != 0 &&
      linklist_node -> node_next == next
    Ensure
      (next == linklist => __return == 0) &&
      (next != linklist => __return == next) &&
      linklist_node -> node_next == next
*/
{
    return linklist_node->node_next == linklist ? (void *)0 : linklist_node->node_next;
}
