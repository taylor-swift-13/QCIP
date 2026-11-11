/* Original CRTOS internal AVL functions. Verification intake; see PROVENANCE.json. */
/* Parser interface only: exact used node, typedef and original macros.
 * Unused allocator/logger and forward declarations omitted; no calls removed. */
struct AvlNode { int data; unsigned int height; struct AvlNode *left; struct AvlNode *right; };
typedef struct AvlNode *AvlNodeType;
#define NONE ((void *)0)
#define AVL_MAX(a,b) ((a) > (b) ? (a) : (b))
/* Exact enabled debug macro expansion is written at each call below so its
 * unreachable spin and one-iteration wrapper can carry full invariants.
 * __FUNCTION__ expanded to the enclosing normalized C function-name literal,
 * because canonical QCP reports it as undeclared (recorded in round report).
 * __LINE__ likewise expanded to its physical source line number.
 * Original xs_kdbg.h:96-104; the supplied shared header had omitted logging. */
void KPrintf(const char *format, const char *function, int line, const char *param)
 /*@ Require 0 == 1 && emp Ensure 0 == 1 && emp */;


/*@ Import Coq Require Import SimpleC.EE.INPUT.crtos.crtos_avl_internal_crtos.crtos_avl_internal_crtos_lib */
/*@ Extern Coq (avl_model :: *) */
/*@ Extern Coq
    (avl_root : avl_model -> option Z)
    (avl_left : avl_model -> Z -> option Z)
    (avl_right : avl_model -> Z -> option Z)
    (avl_ptr_of : option Z -> Z)
    (avl_height_of : avl_model -> Z -> Z)
    (avl_key_of : avl_model -> Z -> Z)
    (avl_vvalid : avl_model -> Z -> Prop)
    (avl_tree_valid : avl_model -> Prop)
    (avl_height_input_valid : avl_model -> Prop)
    (avl_balanced : avl_model -> Prop)
    (avl_height_int_result_safe : avl_model -> Z -> Prop)
    (avl_height_result : avl_model -> Z -> Z -> Prop)
    (avl_update_height_children_safe : avl_model -> Z -> Prop)
    (avl_tree_store : avl_model -> Assertion)
    (avl_subtree_store_at : avl_model -> Z -> Assertion)
    (avl_subtree_model : avl_model -> Z -> avl_model)
    (avl_child_model : avl_model -> option Z -> avl_model)
    (avl_with_root_cache : avl_model -> Z -> Z -> avl_model)
    (avl_balance_factor_input_valid : avl_model -> Prop)
    (avl_model_balance_factor : avl_model -> Z -> Z)
    (avl_balance_graph_input : avl_model -> Z -> Prop)
    (avl_balance_graph_result : avl_model -> avl_model -> Z -> Prop)
    (avl_balance_height_effect : avl_model -> avl_model -> Prop)
    (strict_balance_identity : avl_model -> avl_model -> Prop)
    (avl_right_rotation_input : avl_model -> Z -> Prop)
    (avl_right_rotation_result : avl_model -> avl_model -> Z -> Z -> Prop)
    (avl_right_rotation_post : avl_model -> Z -> Z -> Assertion)
    (avl_left_rotation_cached_input : avl_model -> Z -> Prop)
    (avl_left_rotation_result : avl_model -> avl_model -> Z -> Z -> Prop)
    (avl_left_rotation_post : avl_model -> Z -> Z -> Assertion)
    (avl_lr_rotation_input : avl_model -> Z -> Prop)
    (avl_lr_rotation_result : avl_model -> avl_model -> Z -> Z -> Prop)
    (avl_lr_rotation_post : avl_model -> Z -> Z -> Assertion)
    (avl_lr_middle : avl_model -> avl_model -> Z -> Z -> Z -> Prop)
    (avl_rl_rotation_input : avl_model -> Z -> Prop)
    (avl_rl_rotation_result : avl_model -> avl_model -> Z -> Z -> Prop)
    (avl_rl_rotation_post : avl_model -> Z -> Z -> Assertion)
    (avl_rl_middle : avl_model -> avl_model -> Z -> Z -> Z -> Prop)
*/


unsigned int crtos_avl_height_crtos(AvlNodeType avl_node)
/*@ low_level_spec
 With g
 Require avl_tree_valid(g) && avl_subtree_store_at(g, avl_node)
 Ensure avl_height_result(g, avl_node, __return) && avl_subtree_store_at(g, avl_node)
*/
{
/*@ Assert avl_node == avl_node@pre && avl_tree_valid(g) &&
 ((avl_node == 0 && avl_subtree_store_at(g, avl_node)) ||
  (avl_node != 0 && avl_vvalid(g, avl_node) &&
  store(&(avl_node->data), avl_key_of(g, avl_node)) *
store(&(avl_node->height), avl_height_of(g, avl_node)) *
store(&(avl_node->left), avl_ptr_of(avl_left(g, avl_node))) *
store(&(avl_node->right), avl_ptr_of(avl_right(g, avl_node))) *
  avl_subtree_store_at(g, avl_ptr_of(avl_left(g, avl_node))) *
  avl_subtree_store_at(g, avl_ptr_of(avl_right(g, avl_node)))))
*/
    return avl_node ? avl_node->height : 0;
}

void crtos_avl_update_height_crtos(AvlNodeType avl_node)
/*@ low_level_spec
 With g old_cache
 Require avl_tree_valid(g) && avl_node == avl_ptr_of(avl_root(g)) &&
         avl_update_height_children_safe(g, avl_node) &&
         avl_tree_store(avl_with_root_cache(g, avl_node, old_cache))
 Ensure avl_tree_store(g)
*/
{
    if(avl_node) {
/*@ Assert avl_node == avl_node@pre && avl_tree_valid(g) &&
 avl_root(g) == Some(avl_node) && avl_vvalid(g, avl_node) && avl_node != 0 &&
 avl_update_height_children_safe(g, avl_node) &&
 store(&(avl_node->data), avl_key_of(g, avl_node)) *
store(&(avl_node->height), old_cache) *
store(&(avl_node->left), avl_ptr_of(avl_left(g, avl_node))) *
store(&(avl_node->right), avl_ptr_of(avl_right(g, avl_node))) *
 avl_subtree_store_at(g, avl_ptr_of(avl_left(g, avl_node))) *
 avl_subtree_store_at(g, avl_ptr_of(avl_right(g, avl_node)))
*/
        avl_node->height = AVL_MAX(crtos_avl_height_crtos(avl_node->left) /*@ where(low_level_spec) g = g */,
                                   crtos_avl_height_crtos(avl_node->right) /*@ where(low_level_spec) g = g */) + 1;
    }
}

int crtos_avl_balance_factor_crtos(AvlNodeType avl_node)
/*@ low_level_spec
 With g
 Require avl_balance_factor_input_valid(g) && avl_subtree_store_at(g, avl_node)
 Ensure ((avl_node == 0 && __return == 0) ||
 (avl_node != 0 && avl_vvalid(g, avl_node) &&
  __return == avl_model_balance_factor(g, avl_node) &&
  INT_MIN < __return && __return <= INT_MAX)) && avl_subtree_store_at(g, avl_node)
*/
{
    if(avl_node) {
/*@ Assert avl_node == avl_node@pre && avl_balance_factor_input_valid(g) && avl_tree_valid(g) && avl_node != 0 && avl_vvalid(g, avl_node) &&
store(&(avl_node->data), avl_key_of(g, avl_node)) *
store(&(avl_node->height), avl_height_of(g, avl_node)) *
store(&(avl_node->left), avl_ptr_of(avl_left(g, avl_node))) *
store(&(avl_node->right), avl_ptr_of(avl_right(g, avl_node))) *
avl_subtree_store_at(g, avl_ptr_of(avl_left(g, avl_node))) * avl_subtree_store_at(g, avl_ptr_of(avl_right(g, avl_node)))
*/
        return crtos_avl_height_crtos(avl_node->left) /*@ where(low_level_spec) g = g */ - crtos_avl_height_crtos(avl_node->right) /*@ where(low_level_spec) g = g */;
    } else {
        return 0;
    }
}

AvlNodeType crtos_avl_right_rotate_crtos(AvlNodeType avl_node)
/*@ low_level_spec
 With before root_cached_height
 Require avl_right_rotation_input(before, avl_node) &&
 avl_tree_store(avl_with_root_cache(before, avl_node, root_cached_height))
 Ensure avl_right_rotation_post(before, avl_node, __return)
*/
{
    /*@ Assert avl_node == avl_node@pre && avl_right_rotation_input(before, avl_node) && avl_tree_store(avl_with_root_cache(before, avl_node, root_cached_height)) && avl_node != 0 */
    do {
      if (avl_node == NONE) {
        /*@ Assert 0 == 1 && emp */
        KPrintf("PARAM CHECK FAILED ...%s %d %s is NULL.\n", "crtos_avl_right_rotate_crtos", 143, "avl_node");
        /*@ Inv Assert 0 == 1 && emp */
        while (1) ;
      }
    } /*@ Inv Assert avl_node == avl_node@pre && avl_right_rotation_input(before, avl_node) && avl_tree_store(avl_with_root_cache(before, avl_node, root_cached_height)) && avl_node != 0 */ while (0);
/*@ Assert exists after promoted,
 avl_right_rotation_input(before, avl_node@pre) && avl_node == avl_node@pre &&
 avl_right_rotation_result(before, after, avl_node, promoted) &&
 avl_tree_valid(after) && avl_tree_valid(before) &&
 avl_node != 0 && promoted != 0 &&
 promoted == avl_ptr_of(avl_left(before, avl_node)) &&
 store(&(avl_node->data), avl_key_of(before, avl_node)) *
store(&(avl_node->height), root_cached_height) *
store(&(avl_node->left), avl_ptr_of(avl_left(before, avl_node))) *
store(&(avl_node->right), avl_ptr_of(avl_right(before, avl_node))) *
store(&(promoted->data), avl_key_of(before, promoted)) *
store(&(promoted->height), avl_height_of(before, promoted)) *
store(&(promoted->left), avl_ptr_of(avl_left(before, promoted))) *
store(&(promoted->right), avl_ptr_of(avl_right(before, promoted))) *
 avl_subtree_store_at(before, avl_ptr_of(avl_right(before, avl_node))) *
 avl_subtree_store_at(before, avl_ptr_of(avl_left(before, promoted))) *
 avl_subtree_store_at(before, avl_ptr_of(avl_right(before, promoted)))
*/
/*@ Given after promoted */


    AvlNodeType new_node = avl_node->left;

    avl_node->left = new_node->right;
    new_node->right = avl_node;

/*@ Assert avl_right_rotation_input(before, avl_node@pre) &&
 avl_node == avl_node@pre && new_node == promoted &&
 avl_right_rotation_result(before, after, avl_node@pre, promoted) &&
 avl_tree_valid(after) &&
 avl_tree_valid(avl_subtree_model(after, avl_node@pre)) &&
 avl_node == avl_ptr_of(avl_root(avl_subtree_model(after, avl_node@pre))) &&
 avl_update_height_children_safe(avl_subtree_model(after, avl_node@pre), avl_node) &&
 avl_tree_store(avl_with_root_cache(avl_subtree_model(after, avl_node@pre), avl_node, root_cached_height)) *
 store(&(promoted->data), avl_key_of(before, promoted)) *
store(&(promoted->height), avl_height_of(before, promoted)) *
store(&(promoted->left), avl_ptr_of(avl_left(before, promoted))) *
store(&(promoted->right), avl_node@pre) *
 avl_subtree_store_at(before, avl_ptr_of(avl_left(before, promoted)))
*/
    crtos_avl_update_height_crtos(avl_node)
      /*@ where(low_level_spec) g = avl_subtree_model(after, avl_node@pre), old_cache = root_cached_height */;
/*@ Assert avl_right_rotation_input(before, avl_node@pre) &&
 avl_node == avl_node@pre && new_node == promoted &&
 avl_right_rotation_result(before, after, avl_node@pre, promoted) &&
 avl_tree_valid(after) && promoted == avl_ptr_of(avl_root(after)) &&
 avl_update_height_children_safe(after, promoted) &&
 avl_tree_store(avl_with_root_cache(after, promoted, avl_height_of(before, promoted)))
*/
    crtos_avl_update_height_crtos(new_node)
      /*@ where(low_level_spec) g = after, old_cache = avl_height_of(before, promoted) */;

    return new_node;
}

AvlNodeType crtos_avl_left_rotate_crtos(AvlNodeType avl_node)
/*@ low_level_spec
 With before root_cached_height
 Require avl_left_rotation_cached_input(before, avl_node) &&
 avl_tree_store(avl_with_root_cache(before, avl_node, root_cached_height))
 Ensure avl_left_rotation_post(before, avl_node, __return)
*/
{
    /*@ Assert avl_node == avl_node@pre && avl_left_rotation_cached_input(before, avl_node) && avl_tree_store(avl_with_root_cache(before, avl_node, root_cached_height)) && avl_node != 0 */
    do {
      if (avl_node == NONE) {
        /*@ Assert 0 == 1 && emp */
        KPrintf("PARAM CHECK FAILED ...%s %d %s is NULL.\n", "crtos_avl_left_rotate_crtos", 215, "avl_node");
        /*@ Inv Assert 0 == 1 && emp */
        while (1) ;
      }
    } /*@ Inv Assert avl_node == avl_node@pre && avl_left_rotation_cached_input(before, avl_node) && avl_tree_store(avl_with_root_cache(before, avl_node, root_cached_height)) && avl_node != 0 */ while (0);
/*@ Assert exists after promoted,
 avl_left_rotation_cached_input(before, avl_node@pre) && avl_node == avl_node@pre &&
 avl_left_rotation_result(before, after, avl_node, promoted) &&
 avl_tree_valid(after) && avl_tree_valid(before) &&
 avl_node != 0 && promoted != 0 &&
 promoted == avl_ptr_of(avl_right(before, avl_node)) &&
 store(&(avl_node->data), avl_key_of(before, avl_node)) *
store(&(avl_node->height), root_cached_height) *
store(&(avl_node->left), avl_ptr_of(avl_left(before, avl_node))) *
store(&(avl_node->right), avl_ptr_of(avl_right(before, avl_node))) *
store(&(promoted->data), avl_key_of(before, promoted)) *
store(&(promoted->height), avl_height_of(before, promoted)) *
store(&(promoted->left), avl_ptr_of(avl_left(before, promoted))) *
store(&(promoted->right), avl_ptr_of(avl_right(before, promoted))) *
 avl_subtree_store_at(before, avl_ptr_of(avl_left(before, avl_node))) *
 avl_subtree_store_at(before, avl_ptr_of(avl_left(before, promoted))) *
 avl_subtree_store_at(before, avl_ptr_of(avl_right(before, promoted)))
*/
/*@ Given after promoted */


    AvlNodeType new_node = avl_node->right;

    avl_node->right = new_node->left;
    new_node->left = avl_node;

/*@ Assert avl_left_rotation_cached_input(before, avl_node@pre) &&
 avl_node == avl_node@pre && new_node == promoted &&
 avl_left_rotation_result(before, after, avl_node@pre, promoted) &&
 avl_tree_valid(after) &&
 avl_tree_valid(avl_subtree_model(after, avl_node@pre)) &&
 avl_node == avl_ptr_of(avl_root(avl_subtree_model(after, avl_node@pre))) &&
 avl_update_height_children_safe(avl_subtree_model(after, avl_node@pre), avl_node) &&
 avl_tree_store(avl_with_root_cache(avl_subtree_model(after, avl_node@pre), avl_node, root_cached_height)) *
 store(&(promoted->data), avl_key_of(before, promoted)) *
store(&(promoted->height), avl_height_of(before, promoted)) *
store(&(promoted->left), avl_node@pre) *
store(&(promoted->right), avl_ptr_of(avl_right(before, promoted))) *
 avl_subtree_store_at(before, avl_ptr_of(avl_right(before, promoted)))
*/
    crtos_avl_update_height_crtos(avl_node)
      /*@ where(low_level_spec) g = avl_subtree_model(after, avl_node@pre), old_cache = root_cached_height */;
/*@ Assert avl_left_rotation_cached_input(before, avl_node@pre) &&
 avl_node == avl_node@pre && new_node == promoted &&
 avl_left_rotation_result(before, after, avl_node@pre, promoted) &&
 avl_tree_valid(after) && promoted == avl_ptr_of(avl_root(after)) &&
 avl_update_height_children_safe(after, promoted) &&
 avl_tree_store(avl_with_root_cache(after, promoted, avl_height_of(before, promoted)))
*/
    crtos_avl_update_height_crtos(new_node)
      /*@ where(low_level_spec) g = after, old_cache = avl_height_of(before, promoted) */;

    return new_node;
}

AvlNodeType crtos_avl_lr_rotate_crtos(AvlNodeType avl_node)
/*@ low_level_spec
 With before root_cached_height
 Require avl_lr_rotation_input(before, avl_node) &&
 avl_tree_store(avl_with_root_cache(before, avl_node, root_cached_height))
 Ensure avl_lr_rotation_post(before, avl_node, __return)
*/
{
    /*@ Assert avl_node == avl_node@pre && avl_lr_rotation_input(before, avl_node) && avl_tree_store(avl_with_root_cache(before, avl_node, root_cached_height)) && avl_node != 0 */
    do {
      if (avl_node == NONE) {
        /*@ Assert 0 == 1 && emp */
        KPrintf("PARAM CHECK FAILED ...%s %d %s is NULL.\n", "crtos_avl_lr_rotate_crtos", 287, "avl_node");
        /*@ Inv Assert 0 == 1 && emp */
        while (1) ;
      }
    } /*@ Inv Assert avl_node == avl_node@pre && avl_lr_rotation_input(before, avl_node) && avl_tree_store(avl_with_root_cache(before, avl_node, root_cached_height)) && avl_node != 0 */ while (0);

    AvlNodeType new_node = NONE;
/*@ Assert
        avl_lr_rotation_input(before, avl_node@pre) &&
        avl_left_rotation_cached_input(
          avl_subtree_model(before, avl_ptr_of(avl_left(before, avl_node@pre))),
          avl_ptr_of(avl_left(before, avl_node@pre))) &&
        store(&(avl_node@pre->data), avl_key_of(before, avl_node@pre)) *
        store(&(avl_node@pre->height), root_cached_height) *
        store(&(avl_node@pre->left), avl_ptr_of(avl_left(before, avl_node@pre))) *
        store(&(avl_node@pre->right), avl_ptr_of(avl_right(before, avl_node@pre))) *
        avl_tree_store(avl_with_root_cache(
          avl_subtree_model(before, avl_ptr_of(avl_left(before, avl_node@pre))),
          avl_ptr_of(avl_left(before, avl_node@pre)),
          avl_height_of(before, avl_ptr_of(avl_left(before, avl_node@pre))))) *
        avl_subtree_store_at(before, avl_ptr_of(avl_right(before, avl_node@pre))) *
        store(&new_node, 0) * store(&avl_node, avl_node@pre)
    */
    AvlNodeType left_node = avl_node->left;

    /*step1 : Left rotate*/
    avl_node->left = crtos_avl_left_rotate_crtos(left_node)
 /*@ where(low_level_spec) before = avl_subtree_model(before, avl_ptr_of(avl_left(before, avl_node@pre))), root_cached_height = avl_height_of(before, avl_ptr_of(avl_left(before, avl_node@pre))) */;

/*@ Assert
        exists middle,
        avl_lr_rotation_input(before, avl_node@pre) &&
        avl_lr_middle(before, middle, avl_node@pre,
          avl_ptr_of(avl_left(before, avl_node@pre)),
          avl_ptr_of(avl_right(before, avl_ptr_of(avl_left(before, avl_node@pre))))) &&
        avl_right_rotation_input(middle, avl_node@pre) &&
        avl_tree_store(avl_with_root_cache(middle, avl_node@pre, root_cached_height)) *
        store(&new_node, 0) * store(&avl_node, avl_node@pre) *
        store(&left_node, avl_ptr_of(avl_left(before, avl_node@pre)))
    */
/*@ Given middle */
    /*step2 : Right rotate*/
    new_node = crtos_avl_right_rotate_crtos(avl_node)
 /*@ where(low_level_spec) before = middle, root_cached_height = root_cached_height */;

    return new_node;
}

AvlNodeType crtos_avl_rl_rotate_crtos(AvlNodeType avl_node)
/*@ low_level_spec
 With before root_cached_height
 Require avl_rl_rotation_input(before, avl_node) &&
 avl_tree_store(avl_with_root_cache(before, avl_node, root_cached_height))
 Ensure avl_rl_rotation_post(before, avl_node, __return)
*/
{
    /*@ Assert avl_node == avl_node@pre && avl_rl_rotation_input(before, avl_node) && avl_tree_store(avl_with_root_cache(before, avl_node, root_cached_height)) && avl_node != 0 */
    do {
      if (avl_node == NONE) {
        /*@ Assert 0 == 1 && emp */
        KPrintf("PARAM CHECK FAILED ...%s %d %s is NULL.\n", "crtos_avl_rl_rotate_crtos", 347, "avl_node");
        /*@ Inv Assert 0 == 1 && emp */
        while (1) ;
      }
    } /*@ Inv Assert avl_node == avl_node@pre && avl_rl_rotation_input(before, avl_node) && avl_tree_store(avl_with_root_cache(before, avl_node, root_cached_height)) && avl_node != 0 */ while (0);

    AvlNodeType new_node = NONE;
/*@ Assert
        avl_rl_rotation_input(before, avl_node@pre) &&
        avl_right_rotation_input(
          avl_subtree_model(before, avl_ptr_of(avl_right(before, avl_node@pre))),
          avl_ptr_of(avl_right(before, avl_node@pre))) &&
        store(&(avl_node@pre->data), avl_key_of(before, avl_node@pre)) *
        store(&(avl_node@pre->height), root_cached_height) *
        store(&(avl_node@pre->right), avl_ptr_of(avl_right(before, avl_node@pre))) *
        store(&(avl_node@pre->left), avl_ptr_of(avl_left(before, avl_node@pre))) *
        avl_tree_store(avl_with_root_cache(
          avl_subtree_model(before, avl_ptr_of(avl_right(before, avl_node@pre))),
          avl_ptr_of(avl_right(before, avl_node@pre)),
          avl_height_of(before, avl_ptr_of(avl_right(before, avl_node@pre))))) *
        avl_subtree_store_at(before, avl_ptr_of(avl_left(before, avl_node@pre))) *
        store(&new_node, 0) * store(&avl_node, avl_node@pre)
    */
    AvlNodeType right_node = avl_node->right;

    /*step1 : Right rotate*/
    avl_node->right = crtos_avl_right_rotate_crtos(right_node)
 /*@ where(low_level_spec) before = avl_subtree_model(before, avl_ptr_of(avl_right(before, avl_node@pre))), root_cached_height = avl_height_of(before, avl_ptr_of(avl_right(before, avl_node@pre))) */;

/*@ Assert
        exists middle,
        avl_rl_rotation_input(before, avl_node@pre) &&
        avl_rl_middle(before, middle, avl_node@pre,
          avl_ptr_of(avl_right(before, avl_node@pre)),
          avl_ptr_of(avl_left(before, avl_ptr_of(avl_right(before, avl_node@pre))))) &&
        avl_left_rotation_cached_input(middle, avl_node@pre) &&
        avl_tree_store(avl_with_root_cache(middle, avl_node@pre, root_cached_height)) *
        store(&new_node, 0) * store(&avl_node, avl_node@pre) *
        store(&right_node, avl_ptr_of(avl_right(before, avl_node@pre)))
    */
/*@ Given middle */
    /*step2 : Left rotate*/
    new_node = crtos_avl_left_rotate_crtos(avl_node)
 /*@ where(low_level_spec) before = middle, root_cached_height = root_cached_height */;

    return new_node;
}

AvlNodeType crtos_avl_balance_crtos(AvlNodeType avl_node)
/*@ high_level_spec
 With before
 Require avl_balance_graph_input(before, avl_node) && avl_tree_store(before)
 Ensure exists after, avl_balance_graph_result(before, after, __return) &&
 avl_balance_height_effect(before, after) && strict_balance_identity(before, after) &&
 avl_tree_store(after)
*/
{
    int bf = 0;
    int child_bf = 0;

    if (avl_node == NONE)
        return NONE;

/*@ Assert avl_node == avl_node@pre && bf == 0 && child_bf == 0 &&
 avl_balance_graph_input(before, avl_node) && avl_balance_factor_input_valid(before) && avl_node != 0 &&
 avl_subtree_store_at(before, avl_node)
*/
    bf = crtos_avl_balance_factor_crtos(avl_node)
 /*@ where(low_level_spec) g = before */;
/*@ Assert avl_node == avl_node@pre && bf == avl_model_balance_factor(before, avl_node) &&
 child_bf == 0 && avl_balance_graph_input(before, avl_node) &&
 avl_balance_factor_input_valid(before) && avl_node != 0 &&
 store(&(avl_node->data), avl_key_of(before, avl_node)) *
store(&(avl_node->height), avl_height_of(before, avl_node)) *
store(&(avl_node->left), avl_ptr_of(avl_left(before, avl_node))) *
store(&(avl_node->right), avl_ptr_of(avl_right(before, avl_node))) *
 avl_subtree_store_at(before, avl_ptr_of(avl_left(before, avl_node))) *
 avl_subtree_store_at(before, avl_ptr_of(avl_right(before, avl_node)))
*/

    if (bf > 1) {
        /* Left-heavy: LL (incl. left BF == 0 after delete) or LR */
        child_bf = crtos_avl_balance_factor_crtos(avl_node->left)
 /*@ where(low_level_spec) g = before */;
        if (child_bf >= 0)
            {
/*@ Assert avl_node == avl_node@pre && avl_balance_graph_input(before, avl_node) &&
 bf == avl_model_balance_factor(before, avl_node) &&
 child_bf == avl_model_balance_factor(before, avl_ptr_of(avl_left(before, avl_node))) &&
 bf > 1 && child_bf >= 0 && avl_right_rotation_input(before, avl_node) &&
 avl_tree_store(avl_with_root_cache(before, avl_node, avl_height_of(before, avl_node)))
*/
return crtos_avl_right_rotate_crtos(avl_node)
 /*@ where(low_level_spec) before = before, root_cached_height = avl_height_of(before, avl_node@pre) */;
}
        else
            {
/*@ Assert avl_node == avl_node@pre && avl_balance_graph_input(before, avl_node) &&
 bf == avl_model_balance_factor(before, avl_node) &&
 child_bf == avl_model_balance_factor(before, avl_ptr_of(avl_left(before, avl_node))) &&
 bf > 1 && child_bf < 0 && avl_lr_rotation_input(before, avl_node) &&
 avl_tree_store(avl_with_root_cache(before, avl_node, avl_height_of(before, avl_node)))
*/
return crtos_avl_lr_rotate_crtos(avl_node)
 /*@ where(low_level_spec) before = before, root_cached_height = avl_height_of(before, avl_node@pre) */;
}
    }

    if (bf < -1) {
        /* Right-heavy: RR (incl. right BF == 0 after delete) or RL */
        child_bf = crtos_avl_balance_factor_crtos(avl_node->right)
 /*@ where(low_level_spec) g = before */;
        if (child_bf <= 0)
            {
/*@ Assert avl_node == avl_node@pre && avl_balance_graph_input(before, avl_node) &&
 bf == avl_model_balance_factor(before, avl_node) &&
 child_bf == avl_model_balance_factor(before, avl_ptr_of(avl_right(before, avl_node))) &&
 bf < -1 && child_bf <= 0 && avl_left_rotation_cached_input(before, avl_node) &&
 avl_tree_store(avl_with_root_cache(before, avl_node, avl_height_of(before, avl_node)))
*/
return crtos_avl_left_rotate_crtos(avl_node)
 /*@ where(low_level_spec) before = before, root_cached_height = avl_height_of(before, avl_node@pre) */;
}
        else
            {
/*@ Assert avl_node == avl_node@pre && avl_balance_graph_input(before, avl_node) &&
 bf == avl_model_balance_factor(before, avl_node) &&
 child_bf == avl_model_balance_factor(before, avl_ptr_of(avl_right(before, avl_node))) &&
 bf < -1 && child_bf > 0 && avl_rl_rotation_input(before, avl_node) &&
 avl_tree_store(avl_with_root_cache(before, avl_node, avl_height_of(before, avl_node)))
*/
return crtos_avl_rl_rotate_crtos(avl_node)
 /*@ where(low_level_spec) before = before, root_cached_height = avl_height_of(before, avl_node@pre) */;
}
    }

    return avl_node;
}
