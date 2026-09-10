#include "xizi_double_link_def.h"

/*@ Import Coq From SimpleC.EE.OUTPUT.xizi.xizi_double_link_head_rec.source
      Require Import xizi_double_link_head_rec_lib */
/*@ Extern Coq (XiziStoreADLL::DL_Node :: * => *) */
/*@ Extern Coq
      (xizi_store_dll : {A} -> (Z -> A -> Assertion) -> Z -> list (XiziStoreADLL::DL_Node A) -> Assertion)
      (XiziStoreADLL::dllseg : {A} -> (Z -> A -> Assertion) -> Z -> Z -> Z -> Z -> list (XiziStoreADLL::DL_Node A) -> Assertion)
      (xizi_dll_ptrs : {A} -> list (XiziStoreADLL::DL_Node A) -> list Z)
      (xizi_double_link_first_value : list Z -> Z)
 */

struct SysDoubleLinklistNode *DoubleLinkListGetHead(
    const DoubleLinklistType *linklist)
/*@ nil_case <= general
    With {A} (storeA : Z -> A -> Assertion)
    Require xizi_store_dll(storeA, linklist, nil)
    Ensure __return == 0 &&
           xizi_store_dll(storeA, linklist, nil)
*/;

struct SysDoubleLinklistNode *DoubleLinkListGetHead(
    const DoubleLinklistType *linklist)
/*@ general
    With {A} (storeA : Z -> A -> Assertion) (nodes: list (XiziStoreADLL::DL_Node A))
    Require xizi_store_dll(storeA, linklist, nodes)
    Ensure __return == xizi_double_link_first_value(xizi_dll_ptrs(nodes)) &&
           xizi_store_dll(storeA, linklist, nodes)
*/
{
    /*@ Assert exists first_link last_link,
          linklist == linklist@pre && linklist != 0 &&
          data_at(field_addr(linklist, SysDoubleLinklistNode, node_next), struct SysDoubleLinklistNode *, first_link) *
          data_at(field_addr(linklist, SysDoubleLinklistNode, node_prev), struct SysDoubleLinklistNode *, last_link) *
          XiziStoreADLL::dllseg(storeA, first_link, linklist, linklist, last_link, nodes)
    */
    return linklist->node_next == linklist ? (void *)0 : linklist->node_next;
}
