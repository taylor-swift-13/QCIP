#include "xizi_double_link_def.h"

/*@ Import Coq From SimpleC.EE.OUTPUT.xizi.xizi_double_link_len.source Require Import xizi_double_link_len_lib */

unsigned int xizi_double_link_len(const DoubleLinklistType *linklist)
/*@ general
    With nodes
    Require
      xizi_dll(linklist, nodes)
    Ensure
      __return == Zlength(nodes) &&
      xizi_dll(linklist, nodes)
*/;

unsigned int xizi_double_link_len(const DoubleLinklistType *linklist)
/*@ nil_case <= general
    Require
      xizi_dll(linklist, nil)
    Ensure
      __return == 0 &&
      xizi_dll(linklist, nil)
*/;

unsigned int xizi_double_link_len(const DoubleLinklistType *linklist)
/*@ general
*/
{
    unsigned int linklist_length = 0;
    const DoubleLinklistType *tmp_node = linklist;
    /*@ Inv Assert
          exists done todo first last,
            nodes == app(done, todo) &&
            linklist == linklist@pre &&
            linklist != 0 &&
            linklist_length == Zlength(done) &&
            Zlength(nodes) == Zlength(done) + Zlength(todo) &&
            ((done == nil &&
              tmp_node == linklist &&
              store(&(linklist -> node_next), first) *
              store(&(linklist -> node_prev), last) *
              xizi_dllseg(first, linklist, linklist, last, todo)) ||
             (exists before next prev,
                done == app(before, cons(tmp_node, nil)) &&
                tmp_node != 0 &&
                tmp_node != linklist &&
                store(&(linklist -> node_next), first) *
                store(&(linklist -> node_prev), last) *
                xizi_dllseg(first, linklist, tmp_node, prev, before) *
                store(&(tmp_node -> node_next), next) *
                store(&(tmp_node -> node_prev), prev) *
                xizi_dllseg(next, tmp_node, linklist, last, todo)))
      */
    while (tmp_node->node_next != linklist) {
        tmp_node = tmp_node->node_next;
        linklist_length++;
    }

    return linklist_length;
}
