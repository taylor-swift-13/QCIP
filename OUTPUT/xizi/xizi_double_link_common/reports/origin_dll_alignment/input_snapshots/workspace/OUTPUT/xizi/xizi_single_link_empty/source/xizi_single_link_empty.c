#include "verification_stdlib.h"
#include "verification_list.h"
#include "../../xizi_single_link_common/source/xizi_single_link_def.h"

/*@ Extern Coq (sll_payload_node :: * => *) */
/*@ Extern Coq (xizi_sll_head_payload : {A} -> (Z -> A -> Assertion) -> Z -> list (sll_payload_node A) -> Assertion)
               (xizi_sll_payload : {A} -> (Z -> A -> Assertion) -> Z -> list (sll_payload_node A) -> Assertion)
               (xizi_sll_empty_result : {A} -> list A -> Z -> Prop)
*/
/*@ Import Coq Require Import xizi_single_link_empty_lib */

int IsSingleLinkListEmpty(SysSingleLinklistType *linklist)
/*@ With {A} (storeA : Z -> A -> Assertion) (l : list (sll_payload_node A))
    Require
      xizi_sll_head_payload(storeA, linklist, l)
    Ensure
      xizi_sll_empty_result(l, __return) &&
      xizi_sll_head_payload(storeA, linklist, l)
*/
{
    /*@ Assert exists first,
          linklist == linklist@pre && linklist != 0 &&
          store(&(linklist->node_next), first) *
          xizi_sll_payload(storeA, first, l)
    */
    return linklist->node_next == (void *)0;
}
