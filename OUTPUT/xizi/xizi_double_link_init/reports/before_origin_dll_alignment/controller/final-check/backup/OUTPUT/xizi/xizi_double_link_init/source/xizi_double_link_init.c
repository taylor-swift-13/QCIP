#include "xizi_double_link_def.h"

/*@ Extern Coq (DLL::DL_Node :: * => *) */
/*@ Extern Coq (XiziLocalDLL::store_dll : {A} -> (Z -> A -> Assertion) -> Z -> list (DLL::DL_Node A) -> Assertion)
*/

/*@ Extern Coq (XiziLocalDLL::occupy_dll_node : Z -> Assertion) */

void InitDoubleLinkList(DoubleLinklistType *linklist_head)
/*@ With {A} (storeA : Z -> A -> Assertion)
    Require
      XiziLocalDLL::occupy_dll_node(linklist_head)
    Ensure
      XiziLocalDLL::store_dll(storeA, linklist_head, nil)
*/
{
    /*@ Assert exists prev next,
          linklist_head == linklist_head@pre &&
          store(&(linklist_head->node_prev), prev) *
          store(&(linklist_head->node_next), next)
    */
    linklist_head->node_next = linklist_head;
    linklist_head->node_prev = linklist_head;
}
