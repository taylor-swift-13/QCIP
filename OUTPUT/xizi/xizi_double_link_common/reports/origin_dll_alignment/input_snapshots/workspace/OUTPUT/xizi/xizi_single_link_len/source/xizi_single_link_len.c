#include "verification_stdlib.h"
#include "verification_list.h"
#include "../../xizi_single_link_common/source/xizi_single_link_def.h"

/*@ Extern Coq (sll_payload_node :: * => *) */
/*@ Extern Coq (xizi_sll_head_payload : {A} -> (Z -> A -> Assertion) -> Z -> list (sll_payload_node A) -> Assertion)
               (xizi_sll_payload_addresses : {A} -> list (sll_payload_node A) -> list Z)
               (xizi_sll_remove_payloads : {A} -> (Z -> A -> Assertion) -> list (sll_payload_node A) -> Assertion) */

unsigned int SingleLinkListGetLen(const SysSingleLinklistType *linklist)
/*@ With {A} (storeA : Z -> A -> Assertion) (l : list (sll_payload_node A))
    Require
      xizi_sll_head_payload(storeA, linklist, l)
    Ensure
      __return == Zlength(l) &&
      xizi_sll_head_payload(storeA, linklist, l)
*/
{
    /*@ Assert
          linklist == linklist@pre &&
          xizi_sll_head(linklist, xizi_sll_payload_addresses(l)) *
          xizi_sll_remove_payloads(storeA, l)
    */
    unsigned int length = 0;
    const SysSingleLinklistType *tmp_list = linklist->node_next;

    /*@ Inv Assert
          exists first l1 l2,
            xizi_sll_payload_addresses(l) == app(l1, l2) &&
            length == Zlength(l1) &&
            linklist == linklist@pre &&
            linklist != 0 &&
            linklist -> node_next == first &&
            xizi_sllseg(first, tmp_list, l1) *
            xizi_sll(tmp_list, l2) *
            xizi_sll_remove_payloads(storeA, l)
    */
    while (tmp_list != (void *)0)
    {
        tmp_list = tmp_list->node_next;
        length ++;
    }

    return length;
}
