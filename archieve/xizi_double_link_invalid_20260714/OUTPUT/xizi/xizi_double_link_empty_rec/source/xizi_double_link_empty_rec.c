#include "verification_stdlib.h"
#include "verification_list.h"
#include "xizi_double_link_def.h"

int xizi_double_link_empty_rec(const DoubleLinklistType *linklist)
/*@ Require
      linklist != 0 &&
      xizi_dll(linklist, nil)
    Ensure
      __return == 1 &&
      xizi_dll(linklist, nil)
*/
{
    return linklist->node_next == linklist;
}
