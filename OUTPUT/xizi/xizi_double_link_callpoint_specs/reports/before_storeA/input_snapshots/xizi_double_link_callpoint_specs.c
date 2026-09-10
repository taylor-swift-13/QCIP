#include "xizi_double_link_def.h"

/*@ Import Coq From SimpleC.EE.OUTPUT.xizi.xizi_double_link_callpoint_specs.source
      Require Import xizi_double_link_callpoint_specs_lib */
/*@ Extern Coq
      (xizi_double_link_first_value : list Z -> Z)
      (xizi_double_link_call_empty_result : Z -> Prop)
      (xizi_double_link_call_null_result : Z -> Prop)
      (xizi_double_link_call_len_result : Z -> Prop)
      (xizi_double_link_singleton_nodes : Z -> list Z)
 */

void xizi_double_link_init(DoubleLinklistType *linklist_head)
/*@ Require
      xizi_dll_node(linklist_head)
    Ensure
      xizi_dll(linklist_head, nil)
*/;

int xizi_double_link_empty(const DoubleLinklistType *linklist)
/*@ nil_case
    Require
      xizi_dll(linklist, nil)
    Ensure
      __return == 1 &&
      xizi_dll(linklist, nil)
*/;

int xizi_double_link_empty_rec(const DoubleLinklistType *linklist)
/*@ nil_case
    Require
      xizi_dll(linklist, nil)
    Ensure
      __return == 1 &&
      xizi_dll(linklist, nil)
*/;

struct SysDoubleLinklistNode *xizi_double_link_head(
    const DoubleLinklistType *linklist)
/*@ nil_case
    Require xizi_dll(linklist, nil)
    Ensure __return == 0 &&
           xizi_dll(linklist, nil)
*/;

struct SysDoubleLinklistNode *xizi_double_link_head_rec(
    const DoubleLinklistType *linklist)
/*@ nil_case
    Require xizi_dll(linklist, nil)
    Ensure __return == 0 &&
           xizi_dll(linklist, nil)
*/;

unsigned int xizi_double_link_len(const DoubleLinklistType *linklist)
/*@ nil_case
    Require
      xizi_dll(linklist, nil)
    Ensure
      __return == 0 &&
      xizi_dll(linklist, nil)
*/;

struct SysDoubleLinklistNode *xizi_double_link_next(
    const DoubleLinklistType *linklist,
    const struct SysDoubleLinklistNode *linklist_node)
/*@ sentinel_case
    With (nodes: list Z)
    Require linklist_node == linklist &&
            xizi_dll(linklist, nodes)
    Ensure __return == xizi_double_link_first_value(nodes) &&
           xizi_dll(linklist@pre, nodes)
*/;

struct SysDoubleLinklistNode *xizi_double_link_next_rec_last(
    const DoubleLinklistType *linklist,
    const struct SysDoubleLinklistNode *linklist_node)
/*@ sentinel_case
    With (nodes: list Z)
    Require linklist_node == linklist &&
            xizi_dll(linklist, nodes)
    Ensure __return == xizi_double_link_first_value(nodes) &&
           xizi_dll(linklist@pre, nodes)
*/;

struct SysDoubleLinklistNode *xizi_double_link_next_rec_middle(
    const DoubleLinklistType *linklist,
    const struct SysDoubleLinklistNode *linklist_node)
/*@ sentinel_case
    With (nodes: list Z)
    Require linklist_node == linklist &&
            xizi_dll(linklist, nodes)
    Ensure __return == xizi_double_link_first_value(nodes) &&
           xizi_dll(linklist@pre, nodes)
*/;

void xizi_double_link_insert_after(DoubleLinklistType *linklist,
                                   DoubleLinklistType *linklist_node)
/*@ sentinel_case
    With (nodes: list Z)
    Require xizi_dll(linklist, nodes) *
            xizi_dll_node(linklist_node)
    Ensure xizi_dll(linklist,
                    cons(linklist_node@pre, nodes))
*/;

void xizi_double_link_remove_node(DoubleLinklistType *linklist_node)
/*@ remove_front_spec
    With (head : Z) (suffix : list Z)
    Require xizi_dll(head, cons(linklist_node, suffix))
    Ensure xizi_dll(head, suffix) *
           xizi_dll(linklist_node@pre, nil)
*/;

void xizi_double_link_remove_node(DoubleLinklistType *linklist_node)
/*@ remove_tail_spec
    With (head : Z) (prefix : list Z)
    Require xizi_dll(head, app(prefix, cons(linklist_node, nil)))
    Ensure xizi_dll(head, prefix) *
           xizi_dll(linklist_node@pre, nil)
*/;

int xizi_double_link_call_empty_after_init(DoubleLinklistType *head)
/*@ Require
      xizi_dll_node(head)
    Ensure
      xizi_double_link_call_empty_result(__return) &&
      xizi_dll(head, nil)
*/
{
    xizi_double_link_init(head);
    return xizi_double_link_empty(head) /*@ where (nil_case) */;
}

int xizi_double_link_call_empty_rec_after_init(DoubleLinklistType *head)
/*@ Require
      xizi_dll_node(head)
    Ensure
      xizi_double_link_call_empty_result(__return) &&
      xizi_dll(head, nil)
*/
{
    xizi_double_link_init(head);
    return xizi_double_link_empty_rec(head) /*@ where (nil_case) */;
}

struct SysDoubleLinklistNode *xizi_double_link_call_head_after_init(
    DoubleLinklistType *head)
/*@ Require
      xizi_dll_node(head)
    Ensure
      xizi_double_link_call_null_result(__return) &&
      xizi_dll(head, nil)
*/
{
    xizi_double_link_init(head);
    return xizi_double_link_head(head) /*@ where (nil_case) */;
}

struct SysDoubleLinklistNode *xizi_double_link_call_head_rec_after_init(
    DoubleLinklistType *head)
/*@ Require
      xizi_dll_node(head)
    Ensure
      xizi_double_link_call_null_result(__return) &&
      xizi_dll(head, nil)
*/
{
    xizi_double_link_init(head);
    return xizi_double_link_head_rec(head) /*@ where (nil_case) */;
}

unsigned int xizi_double_link_call_len_after_init(DoubleLinklistType *head)
/*@ Require
      xizi_dll_node(head)
    Ensure
      xizi_double_link_call_len_result(__return) &&
      xizi_dll(head, nil)
*/
{
    xizi_double_link_init(head);
    return xizi_double_link_len(head) /*@ where (nil_case) */;
}

struct SysDoubleLinklistNode *xizi_double_link_call_next_after_init(
    DoubleLinklistType *head)
/*@ Require
      xizi_dll_node(head)
    Ensure
      xizi_double_link_call_null_result(__return) &&
      xizi_dll(head, nil)
*/
{
    xizi_double_link_init(head);
    /*@ Assert
          exists nodes,
            nodes == nil &&
            head == head@pre &&
            xizi_dll(head, nodes)
    */
    return xizi_double_link_next(head, head) /*@ where (sentinel_case) */;
}

struct SysDoubleLinklistNode *xizi_double_link_call_next_rec_last_after_init(
    DoubleLinklistType *head)
/*@ Require
      xizi_dll_node(head)
    Ensure
      xizi_double_link_call_null_result(__return) &&
      xizi_dll(head, nil)
*/
{
    xizi_double_link_init(head);
    /*@ Assert
          exists nodes,
            nodes == nil &&
            head == head@pre &&
            xizi_dll(head, nodes)
    */
    return xizi_double_link_next_rec_last(head, head)
      /*@ where (sentinel_case) */;
}

struct SysDoubleLinklistNode *xizi_double_link_call_next_rec_middle_after_init(
    DoubleLinklistType *head)
/*@ Require
      xizi_dll_node(head)
    Ensure
      xizi_double_link_call_null_result(__return) &&
      xizi_dll(head, nil)
*/
{
    xizi_double_link_init(head);
    /*@ Assert
          exists nodes,
            nodes == nil &&
            head == head@pre &&
            xizi_dll(head, nodes)
    */
    return xizi_double_link_next_rec_middle(head, head)
      /*@ where (sentinel_case) */;
}

void xizi_double_link_call_insert_after_init(DoubleLinklistType *head,
                                             DoubleLinklistType *node)
/*@ Require
      xizi_dll_node(head) *
      xizi_dll_node(node)
    Ensure
      xizi_dll(head,
               xizi_double_link_singleton_nodes(node@pre))
*/
{
    xizi_double_link_init(head);
    /*@ Assert
          exists nodes,
            nodes == nil &&
            head == head@pre &&
            node == node@pre &&
            xizi_dll(head, nodes) *
            xizi_dll_node(node)
    */
    xizi_double_link_insert_after(head, node)
      /*@ where (sentinel_case) */;
}

void xizi_double_link_call_remove_front_singleton(DoubleLinklistType *head,
                                                  DoubleLinklistType *node)
/*@ Require
      xizi_dll_node(head) *
      xizi_dll_node(node)
    Ensure
      xizi_dll(head, nil) *
      xizi_dll(node@pre, nil)
*/
{
    xizi_double_link_init(head);
    /*@ Assert
          exists nodes,
            nodes == nil &&
            head == head@pre &&
            node == node@pre &&
            xizi_dll(head, nodes) *
            xizi_dll_node(node)
    */
    xizi_double_link_insert_after(head, node)
      /*@ where (sentinel_case) */;
    /*@ Assert
          exists suffix,
            suffix == nil &&
            head == head@pre &&
            node == node@pre &&
            xizi_dll(head, cons(node, suffix))
    */
    xizi_double_link_remove_node(node)
      /*@ where (remove_front_spec) */;
}

void xizi_double_link_call_remove_tail_singleton(DoubleLinklistType *head,
                                                 DoubleLinklistType *node)
/*@ Require
      xizi_dll_node(head) *
      xizi_dll_node(node)
    Ensure
      xizi_dll(head, nil) *
      xizi_dll(node@pre, nil)
*/
{
    xizi_double_link_init(head);
    /*@ Assert
          exists nodes,
            nodes == nil &&
            head == head@pre &&
            node == node@pre &&
            xizi_dll(head, nodes) *
            xizi_dll_node(node)
    */
    xizi_double_link_insert_after(head, node)
      /*@ where (sentinel_case) */;
    /*@ Assert
          exists prefix,
            prefix == nil &&
            head == head@pre &&
            node == node@pre &&
            xizi_dll(head, app(prefix, cons(node, nil)))
    */
    xizi_double_link_remove_node(node)
      /*@ where (remove_tail_spec) */;
}
