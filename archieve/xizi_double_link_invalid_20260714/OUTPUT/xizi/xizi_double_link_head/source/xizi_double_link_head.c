#include "verification_stdlib.h"
#include "verification_list.h"
#include "xizi_double_link_def.h"

struct SysDoubleLinklistNode *xizi_double_link_head(
    const DoubleLinklistType *linklist)
/*@ With first last
    Require
      linklist != 0 &&
      linklist -> node_next == first &&
      linklist -> node_prev == last
    Ensure
      (first == linklist => __return == 0) &&
      (first != linklist => __return == first) &&
      linklist -> node_next == first &&
      linklist -> node_prev == last
*/
{
    return linklist->node_next == linklist ? (void *)0 : linklist->node_next;
}
