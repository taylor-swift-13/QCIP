#include "verification_stdlib.h"
#include "verification_list.h"
#include "xizi_double_link_def.h"

unsigned int xizi_double_link_len(const DoubleLinklistType *linklist)
/*@ With last
    Require
      linklist != 0 &&
      linklist -> node_next == linklist &&
      linklist -> node_prev == last
    Ensure
      __return == 0 &&
      linklist -> node_next == linklist &&
      linklist -> node_prev == last
*/
{
    unsigned int linklist_length = 0;
    const DoubleLinklistType *tmp_node = linklist;
    while (tmp_node->node_next != linklist) {
        tmp_node = tmp_node->node_next;
        linklist_length++;
    }

    return linklist_length;
}
