#include "verification_stdlib.h"

struct tree {
  int key;
  struct tree *left;
  struct tree *right;
};

/*@ Extern Coq (G :: *) */
/*@ Extern Coq (bst_gvalid : G -> Prop)
               (bst_vvalid : G -> Z -> Prop)
               (bst_root : G -> option Z)
               (bst_left : G -> Z -> option Z)
               (bst_key_of : G -> Z -> Z)
               (ptr_of : option Z -> Z)
               (left_reachable : G -> Z -> Z -> Prop) */
/*@ Extern Coq (tree_store : G -> Assertion) */

/*@ Import Coq Require Import SimpleC.EE.QCP_demos_LLM.bst_lib_1 */
