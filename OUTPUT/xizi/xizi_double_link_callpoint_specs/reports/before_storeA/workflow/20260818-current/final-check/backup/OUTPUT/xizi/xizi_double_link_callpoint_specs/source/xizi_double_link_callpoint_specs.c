#include "xizi_double_link_def.h"

void xizi_double_link_init(DoubleLinklistType *linklist_head);

int xizi_double_link_empty(const DoubleLinklistType *linklist);
int xizi_double_link_empty_rec(const DoubleLinklistType *linklist);

struct SysDoubleLinklistNode *xizi_double_link_head(
    const DoubleLinklistType *linklist);
struct SysDoubleLinklistNode *xizi_double_link_head_rec(
    const DoubleLinklistType *linklist);

unsigned int xizi_double_link_len(const DoubleLinklistType *linklist);

struct SysDoubleLinklistNode *xizi_double_link_next(
    const DoubleLinklistType *linklist,
    const struct SysDoubleLinklistNode *linklist_node);
struct SysDoubleLinklistNode *xizi_double_link_next_rec_last(
    const DoubleLinklistType *linklist,
    const struct SysDoubleLinklistNode *linklist_node);
struct SysDoubleLinklistNode *xizi_double_link_next_rec_middle(
    const DoubleLinklistType *linklist,
    const struct SysDoubleLinklistNode *linklist_node);

void xizi_double_link_insert_after(DoubleLinklistType *linklist,
                                   DoubleLinklistType *linklist_node);
void xizi_double_link_remove_node(DoubleLinklistType *linklist_node);

int xizi_double_link_call_empty_after_init(DoubleLinklistType *head)
{
    xizi_double_link_init(head);
    return xizi_double_link_empty(head);
}

int xizi_double_link_call_empty_rec_after_init(DoubleLinklistType *head)
{
    xizi_double_link_init(head);
    return xizi_double_link_empty_rec(head);
}

struct SysDoubleLinklistNode *xizi_double_link_call_head_after_init(
    DoubleLinklistType *head)
{
    xizi_double_link_init(head);
    return xizi_double_link_head(head);
}

struct SysDoubleLinklistNode *xizi_double_link_call_head_rec_after_init(
    DoubleLinklistType *head)
{
    xizi_double_link_init(head);
    return xizi_double_link_head_rec(head);
}

unsigned int xizi_double_link_call_len_after_init(DoubleLinklistType *head)
{
    xizi_double_link_init(head);
    return xizi_double_link_len(head);
}

struct SysDoubleLinklistNode *xizi_double_link_call_next_after_init(
    DoubleLinklistType *head)
{
    xizi_double_link_init(head);
    return xizi_double_link_next(head, head);
}

struct SysDoubleLinklistNode *xizi_double_link_call_next_rec_last_after_init(
    DoubleLinklistType *head)
{
    xizi_double_link_init(head);
    return xizi_double_link_next_rec_last(head, head);
}

struct SysDoubleLinklistNode *xizi_double_link_call_next_rec_middle_after_init(
    DoubleLinklistType *head)
{
    xizi_double_link_init(head);
    return xizi_double_link_next_rec_middle(head, head);
}

void xizi_double_link_call_insert_after_init(DoubleLinklistType *head,
                                             DoubleLinklistType *node)
{
    xizi_double_link_init(head);
    xizi_double_link_insert_after(head, node);
}

void xizi_double_link_call_remove_front_singleton(DoubleLinklistType *head,
                                                  DoubleLinklistType *node)
{
    xizi_double_link_init(head);
    xizi_double_link_insert_after(head, node);
    xizi_double_link_remove_node(node);
}

void xizi_double_link_call_remove_tail_singleton(DoubleLinklistType *head,
                                                 DoubleLinklistType *node)
{
    xizi_double_link_init(head);
    xizi_double_link_insert_after(head, node);
    xizi_double_link_remove_node(node);
}
