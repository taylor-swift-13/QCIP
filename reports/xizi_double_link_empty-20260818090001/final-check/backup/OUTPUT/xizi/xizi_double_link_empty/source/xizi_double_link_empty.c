#include "xizi_double_link_def.h"

int xizi_double_link_empty(const DoubleLinklistType *linklist)
/*@ With nodes
    Require
      xizi_dll(linklist, nodes)
    Ensure
      ((nodes == nil && __return == 1) ||
       (nodes != nil && __return == 0)) &&
      xizi_dll(linklist, nodes)
*/
{
    
    return linklist->node_next == linklist;
}
