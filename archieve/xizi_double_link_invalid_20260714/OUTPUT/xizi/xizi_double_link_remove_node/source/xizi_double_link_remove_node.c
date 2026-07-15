#include "verification_stdlib.h"
#include "verification_list.h"
#include "xizi_double_link_def.h"

void xizi_double_link_remove_node(DoubleLinklistType *linklist_node)
/*@ With next prev next_old_prev prev_old_next
    Require
      linklist_node != 0 &&
      next != 0 &&
      prev != 0 &&
      next != linklist_node &&
      prev != linklist_node &&
      linklist_node -> node_next == next &&
      linklist_node -> node_prev == prev &&
      next -> node_prev == next_old_prev &&
      prev -> node_next == prev_old_next
    Ensure
      next -> node_prev == prev &&
      prev -> node_next == next &&
      linklist_node -> node_next == linklist_node &&
      linklist_node -> node_prev == linklist_node
*/
{
    linklist_node->node_next->node_prev = linklist_node->node_prev;
    linklist_node->node_prev->node_next = linklist_node->node_next;

    linklist_node->node_next = linklist_node;
    linklist_node->node_prev = linklist_node;
}
