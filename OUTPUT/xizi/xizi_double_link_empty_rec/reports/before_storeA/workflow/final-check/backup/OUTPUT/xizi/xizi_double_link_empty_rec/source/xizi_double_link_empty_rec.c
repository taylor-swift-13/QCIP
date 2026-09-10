#include "xizi_double_link_def.h"

/*@ Extern Coq
      (xizi_double_link_empty_rec_result : list Z -> Z -> Prop)
 */
/*@ Import Coq From SimpleC.EE.OUTPUT.xizi.xizi_double_link_empty_rec.source
      Require Import xizi_double_link_empty_rec_lib
 */

int xizi_double_link_empty_rec(const DoubleLinklistType *linklist)
/*@ With nodes
    Require
      linklist != 0 &&
      xizi_dll(linklist, nodes)
    Ensure
      xizi_double_link_empty_rec_result(nodes, __return) &&
      xizi_dll(linklist, nodes)
*/
{
    return linklist->node_next == linklist;
}
