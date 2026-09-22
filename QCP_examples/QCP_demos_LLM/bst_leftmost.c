#include "bst_traverse_def.h"

struct tree *bst_leftmost(struct tree *root)
{
  struct tree *cur = root;
  while (cur->left != (void *)0) {
    cur = cur->left;
  }
  return cur;
}
