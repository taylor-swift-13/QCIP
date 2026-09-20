#include "bst_traverse_def.h"

/*@ Extern Coq (bst_left_child_result : Z -> Z -> Prop) */
/*@ Import Coq Require Import SimpleC.EE.QCP_demos_LLM.bst_left_child_lib */

struct tree *bst_left_child(struct tree *root)
/*@ With g
    Require bst_gvalid(g) &&
            bst_vvalid(g, root) &&
            root != 0 &&
            store(&(root->left), ptr_of(bst_left(g, root)))
    Ensure bst_left_child_result(__return, ptr_of(bst_left(g, root))) &&
           store(&(root->left), ptr_of(bst_left(g, root)))
*/
{
    return root->left;
}
