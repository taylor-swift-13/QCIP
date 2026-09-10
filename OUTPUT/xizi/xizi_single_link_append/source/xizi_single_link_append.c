#include "verification_stdlib.h"
#include "verification_list.h"
#include "../../xizi_single_link_common/source/xizi_single_link_def.h"

/*@ Import Coq From SimpleC.EE.OUTPUT.xizi.xizi_single_link_append.source Require Import xizi_single_link_append_lib */

/*@ Extern Coq (sll_payload_node :: * => *) */
/*@ Extern Coq (Build_sll_payload_node : {A} -> A -> Z -> sll_payload_node A)
               (xizi_sll_head_payload : {A} -> (Z -> A -> Assertion) -> Z -> list (sll_payload_node A) -> Assertion)
               (xizi_sll_payload_addresses : {A} -> list (sll_payload_node A) -> list Z)
               (xizi_sll_remove_payloads : {A} -> (Z -> A -> Assertion) -> list (sll_payload_node A) -> Assertion) */

void AppendSingleLinkList(SysSingleLinklistType *linklist, SysSingleLinklistType *linklist_node)
/*@ With {A} (storeA : Z -> A -> Assertion) (l : list (sll_payload_node A)) (data : A)
    Require
      xizi_sll_head_payload(storeA, linklist, l) *
      xizi_sll_node(linklist_node) * storeA(linklist_node, data)
    Ensure
      xizi_sll_head_payload(storeA, linklist, app(l, cons(Build_sll_payload_node(data, linklist_node), nil)))
*/
{
    /*@ Assert
          linklist == linklist@pre &&
          linklist_node == linklist_node@pre &&
          xizi_sll_head(linklist, xizi_sll_payload_addresses(l)) *
          xizi_sll_node(linklist_node) *
          xizi_sll_remove_payloads(storeA, l) * storeA(linklist_node, data)
    */
    struct SingleLinklistNode *node;

    node = linklist;

    /*@ Inv Assert
          exists l1a l1b next,
            linklist == linklist@pre &&
            linklist_node == linklist_node@pre &&
            cons(linklist, xizi_sll_payload_addresses(l)) == app(l1a, cons(node, l1b)) &&
            node != 0 &&
            linklist_node != 0 &&
            node -> node_next == next &&
            xizi_sllseg(linklist, node, l1a) *
            xizi_sll(next, l1b) *
            xizi_sll_remove_payloads(storeA, l) * storeA(linklist_node, data) &&
            has_permission(&(linklist_node -> node_next))
    */
    while (node->node_next) {
        node = node->node_next;
    }

    node->node_next = linklist_node;
    linklist_node->node_next = (void *)0;
}
