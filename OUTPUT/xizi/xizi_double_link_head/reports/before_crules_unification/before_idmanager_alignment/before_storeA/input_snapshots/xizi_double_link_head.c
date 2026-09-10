#include "xizi_double_link_def.h"

/*@ Import Coq From SimpleC.EE.OUTPUT.xizi.xizi_double_link_head.source
      Require Import xizi_double_link_head_lib
 */
/*@ Extern Coq
      (xizi_double_link_first_value : list Z -> Z)
 */

struct SysDoubleLinklistNode *xizi_double_link_head(
    const DoubleLinklistType *linklist)
/*@ With (nodes: list Z)
    Require xizi_dll(linklist, nodes)
    Ensure __return == xizi_double_link_first_value(nodes) &&
           xizi_dll(linklist, nodes)
 */
{
    return linklist->node_next == linklist ? NONE : linklist->node_next;
}
