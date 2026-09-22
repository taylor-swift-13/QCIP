#include "verification_stdlib.h"
#include "verification_list.h"
#include "../../xizi_single_link_common/source/xizi_single_link_def.h"

/*@ Import Coq Require Import SimpleC.EE.OUTPUT.xizi.xizi_single_link_next.source.xizi_single_link_next_lib */
/*@ Extern Coq (sll_payload_node :: * => *) */
/*@ Extern Coq
      (Build_sll_payload_node : {A} -> A -> Z -> sll_payload_node A)
      (xizi_sll_next_ptrs : {A} -> list (sll_payload_node A) -> list Z)
      (xizi_sll_payload : {A} -> (Z -> A -> Assertion) -> Z -> list (sll_payload_node A) -> Assertion)
      (xizi_sllseg_payload : {A} -> (Z -> A -> Assertion) -> Z -> Z -> list (sll_payload_node A) -> Assertion)
*/

SysSingleLinklistType *SingleLinkListGetNextNode(SysSingleLinklistType *linklist_node)
/*@ With {A} (storeA : Z -> A -> Assertion) (l : list (sll_payload_node A))
    Require
      In(linklist_node, xizi_sll_next_ptrs(l)) &&
      xizi_sll_payload(storeA, xizi_sll_first_value(xizi_sll_next_ptrs(l)), l)
    Ensure
      __return == xizi_sll_next_value(xizi_sll_next_ptrs(l), linklist_node) &&
      xizi_sll_payload(storeA, xizi_sll_first_value(xizi_sll_next_ptrs(l)), l)
*/
{
    /*@ Assert exists prefix suffix (a : A) next,
          linklist_node == linklist_node@pre && linklist_node != 0 &&
          l == app(prefix, cons(Build_sll_payload_node(a, linklist_node), suffix)) &&
          not(In(linklist_node, xizi_sll_next_ptrs(prefix))) &&
          xizi_sllseg_payload(storeA, xizi_sll_first_value(xizi_sll_next_ptrs(l)), linklist_node, prefix) *
          storeA(linklist_node, a) *
          data_at(&(linklist_node->node_next), SysSingleLinklistType *, next) *
          xizi_sll_payload(storeA, next, suffix)
    */
    return linklist_node->node_next;
}
