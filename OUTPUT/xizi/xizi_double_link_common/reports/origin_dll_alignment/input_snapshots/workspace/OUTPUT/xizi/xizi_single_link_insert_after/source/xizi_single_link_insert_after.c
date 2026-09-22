#include "verification_stdlib.h"
#include "verification_list.h"
#include "../../xizi_single_link_common/source/xizi_single_link_def.h"

/*@ Import Coq Require Import SimpleC.EE.OUTPUT.xizi.xizi_single_link_insert_after.source.xizi_single_link_insert_after_lib */
/*@ Extern Coq (sll_payload_node :: * => *) */
/*@ Extern Coq
      (Build_sll_payload_node : {A} -> A -> Z -> sll_payload_node A)
      (xizi_sll_head_payload : {A} -> (Z -> A -> Assertion) -> Z -> list (sll_payload_node A) -> Assertion)
      (xizi_sll_payload : {A} -> (Z -> A -> Assertion) -> Z -> list (sll_payload_node A) -> Assertion)
*/

void SingleLinkListNodeInsert(
    SysSingleLinklistType *linklist,
    SysSingleLinklistType *linklist_node)
/*@ With {A} (storeA : Z -> A -> Assertion) (a : A) (l : list (sll_payload_node A))
    Require
      xizi_sll_head_payload(storeA, linklist, l) *
      storeA(linklist_node, a) *
      xizi_sll_node(linklist_node)
    Ensure
      xizi_sll_head_payload(storeA, linklist, cons(Build_sll_payload_node(a, linklist_node), l))
*/
{
    /*@ Assert exists first,
          linklist == linklist@pre && linklist_node == linklist_node@pre &&
          linklist != 0 && linklist_node != 0 &&
          data_at(&(linklist->node_next), SysSingleLinklistType *, first) *
          undef_data_at(&(linklist_node->node_next), SysSingleLinklistType *) *
          storeA(linklist_node, a) * xizi_sll_payload(storeA, first, l)
    */
    linklist_node->node_next = linklist->node_next;
    linklist->node_next = linklist_node;
}
