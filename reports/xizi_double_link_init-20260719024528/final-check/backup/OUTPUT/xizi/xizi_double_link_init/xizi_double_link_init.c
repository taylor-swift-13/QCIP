#include "xizi_double_link_def.h"

void xizi_double_link_init(DoubleLinklistType *linklist_head)
/*@ Require linklist_head != 0 &&
            undef_data_at(&(linklist_head -> node_next), DoubleLinklistType *) *
            undef_data_at(&(linklist_head -> node_prev), DoubleLinklistType *)
    Ensure xizi_dll(linklist_head@pre, nil)
*/
{
    linklist_head->node_next = linklist_head;
    linklist_head->node_prev = linklist_head;
}
