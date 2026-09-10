#include "xizi_double_link_def.h"

/*@ Import Coq From SimpleC.EE.OUTPUT.xizi.xizi_double_link_head_rec.source
      Require Import xizi_double_link_head_rec_lib */
/*@ Extern Coq (xizi_double_link_first_value : list Z -> Z) */

struct SysDoubleLinklistNode *DoubleLinkListGetHead(
    const DoubleLinklistType *linklist)
/*@ nil_case <= general
    Require xizi_dll(linklist, nil)
    Ensure __return == 0 &&
           xizi_dll(linklist, nil)
*/;

struct SysDoubleLinklistNode *DoubleLinkListGetHead(
    const DoubleLinklistType *linklist)
/*@ general
    With (nodes: list Z)
    Require xizi_dll(linklist, nodes)
    Ensure __return == xizi_double_link_first_value(nodes) &&
           xizi_dll(linklist, nodes)
*/
{
    return linklist->node_next == linklist ? (void *)0 : linklist->node_next;
}
