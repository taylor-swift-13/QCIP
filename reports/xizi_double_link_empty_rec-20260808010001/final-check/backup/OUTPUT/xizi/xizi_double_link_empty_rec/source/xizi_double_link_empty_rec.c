#include "xizi_double_link_def.h"

int xizi_double_link_empty_rec(const DoubleLinklistType *linklist)
/*@ With (nodes: list Z)
    Require xizi_dll(linklist, nodes)
    Ensure xizi_dll(linklist@pre, nodes) *
           ((__return == 1 && nodes == nil) ||
            (__return == 0 && nodes != nil))
*/
{
    return linklist->node_next == linklist;
}
