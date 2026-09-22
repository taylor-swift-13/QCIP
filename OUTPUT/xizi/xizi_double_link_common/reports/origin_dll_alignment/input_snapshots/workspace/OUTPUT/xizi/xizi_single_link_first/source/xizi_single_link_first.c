#include "verification_stdlib.h"
#include "verification_list.h"
#include "../../xizi_single_link_common/source/xizi_single_link_def.h"

/*@ Import Coq Require Import SimpleC.EE.OUTPUT.xizi.xizi_single_link_first.source.xizi_single_link_first_lib */
/*@ Extern Coq (sll_payload_node :: * => *) */
/*@ Extern Coq
      (xizi_sll_head_payload : {A} -> (Z -> A -> Assertion) -> Z -> list (sll_payload_node A) -> Assertion)
      (xizi_sll_payload : {A} -> (Z -> A -> Assertion) -> Z -> list (sll_payload_node A) -> Assertion)
      (xizi_sll_first_ptrs : {A} -> list (sll_payload_node A) -> list Z)
*/

SysSingleLinklistType *SingleLinkListGetFirstNode(SysSingleLinklistType *linklist)
/*@ With {A} (storeA : Z -> A -> Assertion) (l : list (sll_payload_node A))
    Require
      xizi_sll_head_payload(storeA, linklist, l)
    Ensure
      __return == xizi_sll_first_value(xizi_sll_first_ptrs(l)) &&
      xizi_sll_head_payload(storeA, linklist, l)
*/
{
    /*@ Assert exists first,
          linklist == linklist@pre && linklist != 0 &&
          data_at(&(linklist->node_next), SysSingleLinklistType *, first) *
          xizi_sll_payload(storeA, first, l)
    */
    return linklist->node_next;
}
