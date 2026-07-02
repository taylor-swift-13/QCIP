#include "verification_stdlib.h"
#include "verification_list.h"
#include "xizi_double_link_def.h"

void xizi_double_link_insert_before(DoubleLinklistType *linklist,
                                    DoubleLinklistType *linklist_node)
/*@ With old_prev old_prev_next node_old_next node_old_prev
    Require
      linklist != 0 &&
      linklist_node != 0 &&
      old_prev != 0 &&
      linklist -> node_prev == old_prev &&
      old_prev -> node_next == old_prev_next &&
      linklist_node -> node_next == node_old_next &&
      linklist_node -> node_prev == node_old_prev
    Ensure
      linklist -> node_prev == linklist_node &&
      old_prev -> node_next == linklist_node &&
      linklist_node -> node_prev == old_prev &&
      linklist_node -> node_next == linklist
*/
{
    linklist->node_prev->node_next = linklist_node;
    linklist_node->node_prev = linklist->node_prev;

    linklist->node_prev = linklist_node;
    linklist_node->node_next = linklist;
}
