#include "verification_stdlib.h"
#include "verification_list.h"
#include "../../xizi_single_link_common/source/xizi_single_link_def.h"

/*@ Import Coq From SimpleC.EE.OUTPUT.xizi.xizi_single_link_remove_node.source Require Import xizi_single_link_remove_node_lib */
/*@ Extern Coq (sll_payload_node :: * => *) */
/*@ Extern Coq (Build_sll_payload_node : {A} -> A -> Z -> sll_payload_node A)
               (xizi_sll_head_payload : {A} -> (Z -> A -> Assertion) -> Z -> list (sll_payload_node A) -> Assertion)
               (xizi_sll_payload_addresses : {A} -> list (sll_payload_node A) -> list Z)
               (xizi_sll_remove_payloads : {A} -> (Z -> A -> Assertion) -> list (sll_payload_node A) -> Assertion)
               (xizi_sll_payload_remove : {A} -> Z -> A -> list (sll_payload_node A) -> list (sll_payload_node A) -> Prop)
               (xizi_sll_remove_first: Z -> list Z -> list Z) */

SysSingleLinklistType *SingleLinkListRmNode(SysSingleLinklistType *linklist, SysSingleLinklistType *linklist_node)
/*@ remove_member_spec <= strong_spec
    With {A} (storeA : Z -> A -> Assertion) (l : list (sll_payload_node A))
    Require
      In(linklist_node, xizi_sll_payload_addresses(l)) &&
      xizi_sll_head_payload(storeA, linklist, l)
    Ensure
      exists output a,
      xizi_sll_payload_remove(linklist_node, a, l, output) &&
      xizi_sll_head_payload(storeA, linklist, output) *
      xizi_sll_node(linklist_node) * storeA(linklist_node, a)
*/;

SysSingleLinklistType *SingleLinkListRmNode(SysSingleLinklistType *linklist, SysSingleLinklistType *linklist_node)
/*@ remove_front_spec <= strong_spec
    With {A} (storeA : Z -> A -> Assertion) (a : A) (suffix : list (sll_payload_node A))
    Require
      xizi_sll_head_payload(storeA, linklist,
        cons(Build_sll_payload_node(a, linklist_node), suffix))
    Ensure
      xizi_sll_head_payload(storeA, linklist, suffix) *
      xizi_sll_node(linklist_node) * storeA(linklist_node, a)
*/;

SysSingleLinklistType *SingleLinkListRmNode(SysSingleLinklistType *linklist, SysSingleLinklistType *linklist_node)
/*@ remove_tail_spec <= strong_spec
    With {A} (storeA : Z -> A -> Assertion) (a : A) (prefix : list (sll_payload_node A))
    Require
      xizi_sll_head_payload(storeA, linklist,
        app(prefix, cons(Build_sll_payload_node(a, linklist_node), nil)))
    Ensure
      xizi_sll_head_payload(storeA, linklist, prefix) *
      xizi_sll_node(linklist_node) * storeA(linklist_node, a)
*/;

SysSingleLinklistType *SingleLinkListRmNode(SysSingleLinklistType *linklist, SysSingleLinklistType *linklist_node)
/*@ strong_spec
    With {A} (storeA : Z -> A -> Assertion) (a : A)
         (l : list (sll_payload_node A)) (l1 : list (sll_payload_node A)) (l2 : list (sll_payload_node A))
    Require
      l == app(l1, cons(Build_sll_payload_node(a, linklist_node), l2)) &&
      xizi_sll_head_payload(storeA, linklist, l)
    Ensure
      __return == linklist &&
      xizi_sll_head_payload(storeA, linklist, app(l1, l2)) *
      (linklist_node -> node_next ==
        xizi_sll_first_value(xizi_sll_payload_addresses(l2))) *
      storeA(linklist_node, a)
*/
{
    /*@ Assert
      l == app(l1, cons(Build_sll_payload_node(a, linklist_node), l2)) &&
      linklist == linklist@pre &&
      linklist_node == linklist_node@pre &&
      linklist != 0 && linklist_node != 0 && linklist != linklist_node &&
      xizi_sll_to_target(linklist, linklist_node,
        cons(linklist, xizi_sll_payload_addresses(l1))) *
      (linklist_node -> node_next ==
        xizi_sll_first_value(xizi_sll_payload_addresses(l2))) *
      xizi_sll(xizi_sll_first_value(xizi_sll_payload_addresses(l2)),
        xizi_sll_payload_addresses(l2)) *
      xizi_sll_remove_payloads(storeA, l)
    */
    struct SingleLinklistNode *node = linklist;

    /*@ Inv Assert
          exists l1a l1b next,
            l == app(l1, cons(Build_sll_payload_node(a, linklist_node), l2)) &&
            linklist == linklist@pre &&
            linklist_node == linklist_node@pre &&
            linklist_node != 0 &&
            cons(linklist, xizi_sll_payload_addresses(l1)) ==
              app(l1a, cons(node, l1b)) &&
            node != 0 &&
            node -> node_next == next &&
            xizi_sllseg(linklist, node, l1a) *
            xizi_sll_to_target(next, linklist_node, l1b) *
            (linklist_node -> node_next ==
              xizi_sll_first_value(xizi_sll_payload_addresses(l2))) *
            xizi_sll(xizi_sll_first_value(xizi_sll_payload_addresses(l2)),
              xizi_sll_payload_addresses(l2)) *
            xizi_sll_remove_payloads(storeA, l)
    */
    while (node->node_next && node->node_next != linklist_node) {
        node = node->node_next;
    }
    if (node->node_next != (SysSingleLinklistType *)0) {
        node->node_next = node->node_next->node_next;
    }

    return linklist;
}
