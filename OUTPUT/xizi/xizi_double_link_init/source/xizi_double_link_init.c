#include "verification_stdlib.h"
#include "verification_list.h"
#include "xizi_double_link_def.h"

void xizi_double_link_init(DoubleLinklistType *linklist_head)
/*@ With old_next old_prev
    Require
      linklist_head != 0 &&
      linklist_head -> node_next == old_next &&
      linklist_head -> node_prev == old_prev
    Ensure
      linklist_head -> node_next == linklist_head &&
      linklist_head -> node_prev == linklist_head
*/
{
    linklist_head->node_next = linklist_head;
    linklist_head->node_prev = linklist_head;
}
