#include "verification_stdlib.h"
#include "verification_list.h"
#include "../../xizi_single_link_common/source/xizi_single_link_def.h"

/*@ Import Coq From SimpleC.EE.OUTPUT.xizi.xizi_single_link_tail.source Require Import xizi_single_link_tail_lib */

/*@ Extern Coq (sll_payload_node :: * => *) */
/*@ Extern Coq (xizi_sll_head_payload : {A} -> (Z -> A -> Assertion) -> Z -> list (sll_payload_node A) -> Assertion)
               (xizi_sll_payload_addresses : {A} -> list (sll_payload_node A) -> list Z)
               (xizi_sll_remove_payloads : {A} -> (Z -> A -> Assertion) -> list (sll_payload_node A) -> Assertion) */

SysSingleLinklistType *SingleLinkListGetTailNode(SysSingleLinklistType *linklist)
/*@ With {A} (storeA : Z -> A -> Assertion) (l : list (sll_payload_node A))
    Require
      xizi_sll_head_payload(storeA, linklist, l)
    Ensure
      __return ==
        xizi_sll_tail_value(xizi_sll_payload_addresses(l), linklist) &&
      xizi_sll_head_payload(storeA, linklist, l)
*/
{
    /*@ Assert
          linklist == linklist@pre &&
          xizi_sll_head(linklist, xizi_sll_payload_addresses(l)) *
          xizi_sll_remove_payloads(storeA, l)
    */
    SysSingleLinklistType *current = linklist->node_next;

    if (current == (void *)0) {
        return linklist;
    }

    /*@ Inv Assert
          exists first l1 l2 next,
            xizi_sll_payload_addresses(l) == app(l1, cons(current, l2)) &&
            linklist == linklist@pre &&
            current != 0 &&
            linklist != 0 &&
            (linklist -> node_next == first) *
            xizi_sllseg(first, current, l1) *
            (current -> node_next == next) *
            xizi_sll(next, l2) *
            xizi_sll_remove_payloads(storeA, l)
    */
    while (current->node_next) {
        current = current->node_next;
    }

    return current;
}
