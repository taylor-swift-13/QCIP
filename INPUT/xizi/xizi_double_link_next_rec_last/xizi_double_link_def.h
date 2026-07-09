#ifndef XIZI_DOUBLE_LINK_DEF_H
#define XIZI_DOUBLE_LINK_DEF_H

typedef struct SysDoubleLinklistNode
{
    struct SysDoubleLinklistNode *node_next;
    struct SysDoubleLinklistNode *node_prev;
} DoubleLinklistType;

#endif
