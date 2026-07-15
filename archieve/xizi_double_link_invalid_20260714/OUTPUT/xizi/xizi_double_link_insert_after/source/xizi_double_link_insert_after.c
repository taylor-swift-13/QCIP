#include "verification_stdlib.h"
#include "verification_list.h"
#include "xizi_double_link_def.h"

void xizi_double_link_insert_after(DoubleLinklistType *linklist,
                                   DoubleLinklistType *linklist_node)
/*@ With old_next old_next_prev node_old_next node_old_prev
    Require
      linklist != 0 &&
      linklist_node != 0 &&
      old_next != 0 &&
      linklist -> node_next == old_next &&
      old_next -> node_prev == old_next_prev &&
      linklist_node -> node_next == node_old_next &&
      linklist_node -> node_prev == node_old_prev
    Ensure
      linklist -> node_next == linklist_node &&
      old_next -> node_prev == linklist_node &&
      linklist_node -> node_next == old_next &&
      linklist_node -> node_prev == linklist
*/
{
    linklist->node_next->node_prev = linklist_node;
    linklist_node->node_next = linklist->node_next;

    linklist->node_next = linklist_node;
    linklist_node->node_prev = linklist;
}
