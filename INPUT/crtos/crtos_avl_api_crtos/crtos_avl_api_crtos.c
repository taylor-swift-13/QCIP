/* Original four CRTOS APIs; canonical8 actual bodies included once.
 * Parser-only public logging arity normalization: see PROVENANCE.json.
 * No source repairs, callers, tests, or malloc-success assumptions. */
#include "../crtos_avl_internal_crtos/crtos_avl_internal_crtos.c"
/*@ Import Coq Require Import SimpleC.EE.INPUT.crtos.crtos_avl_api_crtos.crtos_avl_api_crtos_lib */
/*@ Extern Coq
 (avl_gvalid : avl_model -> Prop)
 (avl_insert_input : avl_model -> Z -> Z -> Prop)
 (strict_insert_outcome : avl_model -> avl_model -> Z -> Z -> Prop)
 (strict_insert_pending : avl_model -> avl_model -> Z -> Z -> Prop)
 (avl_set_member : (Z -> Prop) -> Z -> Prop)
 (avl_set_insert : (Z -> Prop) -> Z -> (Z -> Prop))
 (avl_set_remove : (Z -> Prop) -> Z -> (Z -> Prop))
 (avl_set_refines_graph : (Z -> Prop) -> avl_model -> Prop)
 (avl_balanced_set_root_rep : (Z -> Prop) -> Z -> Assertion)
 (avl_api_runtime_strings : Assertion)
 (avl_api_insert_failure_rep : (Z -> Prop) -> Z -> Z -> Assertion)
 (avl_api_modify_failure_rep : (Z -> Prop) -> Z -> Z -> Z -> Assertion)
 (avl_delete_input : avl_model -> Z -> Z -> Prop)
 (avl_delete_outcome : avl_model -> avl_model -> Z -> Z -> Prop)
 (avl_api_delete_identity : avl_model -> avl_model -> Z -> Prop)
 (avl_api_delete_repair : avl_model -> avl_model -> Z -> Z -> Prop)
 (crtos_delete_cursor : avl_model -> Z -> Z -> Prop)
 (avl_predecessor_result : avl_model -> Z -> Z -> Prop)
 (avl_graph_nodes_store : avl_model -> list Z -> Assertion)
 (avl_nodes_without : avl_model -> Z -> list Z)
 (remove_Z : Z -> list Z -> list Z)
 (avl_search_cursor_valid : avl_model -> Z -> Z -> Prop)
 (avl_search_result : avl_model -> Z -> Z -> Prop)
*/
void *x_malloc(unsigned long size)
  /*@ Require size == sizeof(struct AvlNode) && emp
      Ensure (__return == 0 && emp) ||
             (__return != 0 &&
              undef_data_at(&(((struct AvlNode *)__return)->data)) *
              undef_data_at(&(((struct AvlNode *)__return)->height)) *
              undef_data_at(&(((struct AvlNode *)__return)->left)) *
              undef_data_at(&(((struct AvlNode *)__return)->right)))
   */;

void crtos_avl_kprintf0(const char *format)
  /*@ With text LitMap
      Require format == LitMap(text) && store_stringLit(LitMap(text), text)
      Ensure store_stringLit(LitMap(text), text)
   */;

void crtos_avl_kprintf1(const char *format, int value)
 /*@ With text LitMap
 Require format == LitMap(text) && store_stringLit(LitMap(text), text)
 Ensure store_stringLit(LitMap(text), text)
 */;
void x_free(void *ptr)
 /*@ With key cache left right
 Require ptr != 0 &&
 store(&(((struct AvlNode *)ptr)->data), key) *
 store(&(((struct AvlNode *)ptr)->height), cache) *
 store(&(((struct AvlNode *)ptr)->left), left) *
 store(&(((struct AvlNode *)ptr)->right), right)
 Ensure emp
 */;
AvlNodeType AvlTreeInsertNode(AvlNodeType avl_node, int data)
 /*@ high_level_spec <= low_level_spec
 With keys
 Require INT_MIN <= data && data <= INT_MAX &&
   avl_balanced_set_root_rep(keys, avl_node) * avl_api_runtime_strings
 Ensure
  ((avl_set_member(keys, data) && __return == avl_node &&
    avl_balanced_set_root_rep(keys, __return)) ||
   (!avl_set_member(keys, data) && __return != 0 &&
    avl_balanced_set_root_rep(avl_set_insert(keys, data), __return)) ||
   (__return == 0 && avl_api_insert_failure_rep(keys, avl_node, data))) *
  avl_api_runtime_strings
 */;
AvlNodeType AvlTreeInsertNode(AvlNodeType avl_node, int data)
  /*@ low_level_spec
      With before LitMap
      Require avl_insert_input(before, avl_node, data) &&
              avl_subtree_store_at(before, avl_node) * GlobalStrings(LitMap)
      Ensure exists after,
               strict_insert_outcome(before, after, data, __return) &&
               avl_tree_store(after) * GlobalStrings(LitMap)
   */
{
    AvlNodeType new_node = NONE;

    /*@ Assert
        avl_insert_input(before, avl_node@pre, data@pre) &&
        avl_node == avl_node@pre && data == data@pre && new_node == 0 &&
        ((avl_node == 0 && avl_tree_store(before)) ||
         (avl_node != 0 && avl_vvalid(before, avl_node) &&
          store(&(avl_node->data), avl_key_of(before, avl_node)) *
          store(&(avl_node->height), avl_height_of(before, avl_node)) *
          store(&(avl_node->left), avl_ptr_of(avl_left(before, avl_node))) *
          store(&(avl_node->right), avl_ptr_of(avl_right(before, avl_node))) *
          avl_tree_store(avl_child_model(before, avl_left(before, avl_node))) *
          avl_tree_store(avl_child_model(before, avl_right(before, avl_node))))) *
        GlobalStrings(LitMap)
    */

    if(NONE == avl_node) {
        new_node = x_malloc(sizeof(struct AvlNode));
        if(NONE == new_node) {
            crtos_avl_kprintf0("AvlTreeInsertNode malloc AvlNode failed\n")
                /*@ where text = "AvlTreeInsertNode malloc AvlNode failed\n", LitMap = LitMap */;
            return NONE;
        }
        new_node->data = data;
        new_node->left = NONE;
        new_node->right = NONE;
        new_node->height = 1;
        avl_node = new_node;
    } else if(data == avl_node->data) {
        /*input data is already existed*/
        crtos_avl_kprintf0("the input data is already existed. just return\n")
                /*@ where text = "the input data is already existed. just return\n", LitMap = LitMap */;
        return avl_node;
    } else {
        if(avl_node->data < data) {
            /*@ Assert
                avl_insert_input(before, avl_node@pre, data@pre) &&
                avl_node == avl_node@pre && data == data@pre && new_node == 0 &&
                avl_node != 0 && avl_key_of(before, avl_node) < data &&
                avl_insert_input(avl_child_model(before, avl_right(before, avl_node)),
                  avl_ptr_of(avl_right(before, avl_node)), data) &&
                store(&(avl_node->data), avl_key_of(before, avl_node)) *
                store(&(avl_node->height), avl_height_of(before, avl_node)) *
                store(&(avl_node->left), avl_ptr_of(avl_left(before, avl_node))) *
                store(&(avl_node->right), avl_ptr_of(avl_right(before, avl_node))) *
                avl_tree_store(avl_child_model(before, avl_left(before, avl_node))) *
                avl_subtree_store_at(avl_child_model(before, avl_right(before, avl_node)),
                  avl_ptr_of(avl_right(before, avl_node))) *
                GlobalStrings(LitMap)
            */
            avl_node->right = AvlTreeInsertNode(avl_node->right, data)
                /*@ where(low_level_spec) before =
                    avl_child_model(before, avl_right(before, avl_node@pre)),
                    LitMap = LitMap */;
            if(NONE == avl_node->right) {
                crtos_avl_kprintf0("AvlTreeInsertNode find right avl_node data failed\n")
                /*@ where text = "AvlTreeInsertNode find right avl_node data failed\n", LitMap = LitMap */;
                return NONE;
            }
        } else {
            /*@ Assert
                avl_insert_input(before, avl_node@pre, data@pre) &&
                avl_node == avl_node@pre && data == data@pre && new_node == 0 &&
                avl_node != 0 && data < avl_key_of(before, avl_node) &&
                avl_insert_input(avl_child_model(before, avl_left(before, avl_node)),
                  avl_ptr_of(avl_left(before, avl_node)), data) &&
                store(&(avl_node->data), avl_key_of(before, avl_node)) *
                store(&(avl_node->height), avl_height_of(before, avl_node)) *
                store(&(avl_node->right), avl_ptr_of(avl_right(before, avl_node))) *
                store(&(avl_node->left), avl_ptr_of(avl_left(before, avl_node))) *
                avl_tree_store(avl_child_model(before, avl_right(before, avl_node))) *
                avl_subtree_store_at(avl_child_model(before, avl_left(before, avl_node)),
                  avl_ptr_of(avl_left(before, avl_node))) *
                GlobalStrings(LitMap)
            */
            avl_node->left = AvlTreeInsertNode(avl_node->left, data)
                /*@ where(low_level_spec) before =
                    avl_child_model(before, avl_left(before, avl_node@pre)),
                    LitMap = LitMap */;
            if(NONE == avl_node->left) {
                crtos_avl_kprintf0("AvlTreeInsertNode find left avl_node data failed\n")
                /*@ where text = "AvlTreeInsertNode find left avl_node data failed\n", LitMap = LitMap */;
                return NONE;
            }
        }
    }

    /*@ Assert
        exists raw old_cache new_ptr,
          strict_insert_pending(before, raw, data@pre, avl_node) &&
          avl_node == avl_ptr_of(avl_root(raw)) && data == data@pre &&
          avl_tree_valid(raw) &&
          avl_update_height_children_safe(raw, avl_node) &&
          avl_balance_graph_input(raw, avl_node) &&
          store(&new_node, new_ptr) *
          avl_tree_store(avl_with_root_cache(raw, avl_node, old_cache)) *
          GlobalStrings(LitMap)
    */
    /*@ Given raw old_cache */
    crtos_avl_update_height_crtos(avl_node)
        /*@ where(low_level_spec) g = raw, old_cache = old_cache */;
    return crtos_avl_balance_crtos(avl_node)
        /*@ where(high_level_spec) before = raw */;
}

AvlNodeType AvlTreeDeleteNode(AvlNodeType avl_node, int data)
  /*@ high_level_spec <= low_level_spec
      With keys
      Require avl_balanced_set_root_rep(keys, avl_node) * avl_api_runtime_strings
      Ensure (
        (!avl_set_member(keys, data) && __return == avl_node &&
         avl_balanced_set_root_rep(keys, __return)) ||
        (avl_set_member(keys, data) &&
         avl_balanced_set_root_rep(avl_set_remove(keys, data), __return)) ) * avl_api_runtime_strings
  */
;

/* The recursive predecessor argument is read from a node inside the
   recursive heap. This derived view exposes that node while still owning
   the entire input graph; its refinement is an explicit generated VC. */
AvlNodeType AvlTreeDeleteNode(AvlNodeType avl_node, int data)
  /*@ cursor_level_spec <= low_level_spec
      With before focus LitMap
      Require avl_delete_input(before, avl_node, data) &&
        focus != 0 && avl_vvalid(before, focus) &&
        store(&(((struct AvlNode *)focus)->data), avl_key_of(before, focus)) *
        store(&(((struct AvlNode *)focus)->height), avl_height_of(before, focus)) *
        store(&(((struct AvlNode *)focus)->left), avl_ptr_of(avl_left(before, focus))) *
        store(&(((struct AvlNode *)focus)->right), avl_ptr_of(avl_right(before, focus))) *
        avl_graph_nodes_store(before, avl_nodes_without(before, focus)) * GlobalStrings(LitMap)
      Ensure exists after,
        avl_delete_outcome(before, after, data, __return) &&
        avl_api_delete_identity(before, after, data) && avl_tree_store(after) * GlobalStrings(LitMap)
 */;

AvlNodeType AvlTreeDeleteNode(AvlNodeType avl_node, int data)
  /*@ low_level_spec
      With before LitMap
      Require avl_gvalid(before) && avl_node == avl_ptr_of(avl_root(before)) &&
              avl_tree_store(before) * GlobalStrings(LitMap)
      Ensure exists after,
        avl_delete_outcome(before, after, data, __return) &&
        avl_api_delete_identity(before, after, data) &&
        avl_tree_store(after) * GlobalStrings(LitMap)
 */
{
    AvlNodeType temp = NONE;
    AvlNodeType pred = NONE;


    /*@ INT_MIN <= data && data <= INT_MAX by local */
    /*@ Assert avl_node == avl_node@pre && data == data@pre &&
      avl_delete_input(before, avl_node, data) &&
      store(&temp, 0) * store(&pred, 0) *
      ((avl_node == 0 && avl_tree_store(before)) ||
       (avl_node != 0 && avl_vvalid(before, avl_node) &&
        store(&(avl_node->data), avl_key_of(before, avl_node)) *
        store(&(avl_node->height), avl_height_of(before, avl_node)) *
        store(&(avl_node->left), avl_ptr_of(avl_left(before, avl_node))) *
        store(&(avl_node->right), avl_ptr_of(avl_right(before, avl_node))) *
        avl_tree_store(avl_child_model(before, avl_left(before, avl_node))) *
        avl_tree_store(avl_child_model(before, avl_right(before, avl_node))))) * GlobalStrings(LitMap)
 */

    if(avl_node) {
        if(avl_node->data < data) {
            avl_node->right = AvlTreeDeleteNode(avl_node->right, data)
                /*@ where(low_level_spec) before = avl_child_model(before, avl_right(before, avl_node@pre)), LitMap = LitMap */;
        } else if(avl_node->data > data) {
            avl_node->left = AvlTreeDeleteNode(avl_node->left, data)
                /*@ where(low_level_spec) before = avl_child_model(before, avl_left(before, avl_node@pre)), LitMap = LitMap */;
        } else {
            if((NONE == avl_node->left) && (NONE == avl_node->right)) {
                x_free(avl_node);
                return NONE;
            } else if(NONE == avl_node->left) {
                temp = avl_node->right;
                x_free(avl_node);
                /*@ Assert avl_node == avl_node@pre && data == data@pre &&
                  avl_delete_input(before, avl_node@pre, data@pre) &&
                  avl_key_of(before, avl_node@pre) == data &&
                  temp == avl_ptr_of(avl_right(before, avl_node@pre)) &&
                  avl_api_delete_repair(before, avl_child_model(before, avl_right(before, avl_node@pre)), data, temp) &&
                  avl_tree_valid(avl_child_model(before, avl_right(before, avl_node@pre))) &&
                  temp == avl_ptr_of(avl_root(avl_child_model(before, avl_right(before, avl_node@pre)))) &&
                  avl_update_height_children_safe(avl_child_model(before, avl_right(before, avl_node@pre)), temp) &&
                  avl_balance_graph_input(avl_child_model(before, avl_right(before, avl_node@pre)), temp) &&
                  store(&pred, 0) * avl_tree_store(avl_with_root_cache(avl_child_model(before, avl_right(before, avl_node@pre)), temp, avl_height_of(avl_child_model(before, avl_right(before, avl_node@pre)), temp))) * GlobalStrings(LitMap)
 */
                crtos_avl_update_height_crtos(temp)
                  /*@ where(low_level_spec) g = avl_child_model(before, avl_right(before, avl_node@pre)), old_cache = avl_height_of(avl_child_model(before, avl_right(before, avl_node@pre)), temp) */;
                return crtos_avl_balance_crtos(temp)
                  /*@ where(high_level_spec) before = avl_child_model(before, avl_right(before, avl_node@pre)) */;
            } else if(NONE == avl_node->right) {
                temp = avl_node->left;
                x_free(avl_node);
                /*@ Assert avl_node == avl_node@pre && data == data@pre &&
                  avl_delete_input(before, avl_node@pre, data@pre) &&
                  avl_key_of(before, avl_node@pre) == data &&
                  temp == avl_ptr_of(avl_left(before, avl_node@pre)) &&
                  avl_api_delete_repair(before, avl_child_model(before, avl_left(before, avl_node@pre)), data, temp) &&
                  avl_tree_valid(avl_child_model(before, avl_left(before, avl_node@pre))) &&
                  temp == avl_ptr_of(avl_root(avl_child_model(before, avl_left(before, avl_node@pre)))) &&
                  avl_update_height_children_safe(avl_child_model(before, avl_left(before, avl_node@pre)), temp) &&
                  avl_balance_graph_input(avl_child_model(before, avl_left(before, avl_node@pre)), temp) &&
                  store(&pred, 0) * avl_tree_store(avl_with_root_cache(avl_child_model(before, avl_left(before, avl_node@pre)), temp, avl_height_of(avl_child_model(before, avl_left(before, avl_node@pre)), temp))) * GlobalStrings(LitMap)
 */
                crtos_avl_update_height_crtos(temp)
                  /*@ where(low_level_spec) g = avl_child_model(before, avl_left(before, avl_node@pre)), old_cache = avl_height_of(avl_child_model(before, avl_left(before, avl_node@pre)), temp) */;
                return crtos_avl_balance_crtos(temp)
                  /*@ where(high_level_spec) before = avl_child_model(before, avl_left(before, avl_node@pre)) */;
            } else {
                pred = avl_node->left;
                /*@ Inv Assert
                  avl_node == avl_node@pre && data == data@pre &&
                  avl_delete_input(before, avl_node@pre, data@pre) &&
                  avl_key_of(before, avl_node) == data &&
                  avl_ptr_of(avl_left(before, avl_node)) != 0 &&
                  avl_ptr_of(avl_right(before, avl_node)) != 0 &&
                  crtos_delete_cursor(before, avl_node, pred) &&
                  store(&temp, 0) * store(&(((struct AvlNode *)pred)->data), avl_key_of(before, pred)) *
                  store(&(((struct AvlNode *)pred)->height), avl_height_of(before, pred)) *
                  store(&(((struct AvlNode *)pred)->left), avl_ptr_of(avl_left(before, pred))) *
                  store(&(((struct AvlNode *)pred)->right), avl_ptr_of(avl_right(before, pred))) *
                  avl_graph_nodes_store(before, avl_nodes_without(before, pred)) * GlobalStrings(LitMap)
 */
                while(pred->right) {
                    pred = pred->right;
                }
                /*@ Assert avl_node == avl_node@pre && data == data@pre &&
                  avl_delete_input(before, avl_node@pre, data@pre) &&
                  avl_key_of(before, avl_node) == data &&
                  avl_predecessor_result(before, avl_node, pred) &&
                  pred != 0 && avl_vvalid(before, pred) &&
                  store(&temp, 0) * store(&(((struct AvlNode *)avl_node)->data), avl_key_of(before, avl_node)) *
                  store(&(((struct AvlNode *)avl_node)->height), avl_height_of(before, avl_node)) *
                  store(&(((struct AvlNode *)avl_node)->left), avl_ptr_of(avl_left(before, avl_node))) *
                  store(&(((struct AvlNode *)avl_node)->right), avl_ptr_of(avl_right(before, avl_node))) * store(&(((struct AvlNode *)pred)->data), avl_key_of(before, pred)) *
                  store(&(((struct AvlNode *)pred)->height), avl_height_of(before, pred)) *
                  store(&(((struct AvlNode *)pred)->left), avl_ptr_of(avl_left(before, pred))) *
                  store(&(((struct AvlNode *)pred)->right), avl_ptr_of(avl_right(before, pred))) *
                  avl_graph_nodes_store(before,
                    remove_Z(pred, avl_nodes_without(before, avl_node))) * GlobalStrings(LitMap)
 */
                avl_node->data = pred->data;
                /*@ Assert avl_node == avl_node@pre && data == data@pre &&
                  avl_delete_input(before, avl_node@pre, data@pre) &&
                  data == avl_key_of(before, avl_node@pre) &&
                  avl_predecessor_result(before, avl_node, pred) &&
                  pred != 0 && avl_vvalid(avl_child_model(before, avl_left(before, avl_node@pre)), pred) &&
                  avl_delete_input(avl_child_model(before, avl_left(before, avl_node@pre)), avl_ptr_of(avl_left(before, avl_node)), avl_key_of(before, pred)) &&
                  avl_key_of(avl_child_model(before, avl_left(before, avl_node@pre)), pred) == avl_key_of(before, pred) &&
                  store(&temp, 0) *
                  store(&(avl_node->data), avl_key_of(before, pred)) *
                  store(&(avl_node->height), avl_height_of(before, avl_node)) *
                  store(&(avl_node->left), avl_ptr_of(avl_left(before, avl_node))) *
                  store(&(avl_node->right), avl_ptr_of(avl_right(before, avl_node))) *
                  store(&(((struct AvlNode *)pred)->data), avl_key_of(avl_child_model(before, avl_left(before, avl_node@pre)), pred)) *
        store(&(((struct AvlNode *)pred)->height), avl_height_of(avl_child_model(before, avl_left(before, avl_node@pre)), pred)) *
        store(&(((struct AvlNode *)pred)->left), avl_ptr_of(avl_left(avl_child_model(before, avl_left(before, avl_node@pre)), pred))) *
        store(&(((struct AvlNode *)pred)->right), avl_ptr_of(avl_right(avl_child_model(before, avl_left(before, avl_node@pre)), pred))) *
                  avl_graph_nodes_store(avl_child_model(before, avl_left(before, avl_node@pre)), avl_nodes_without(avl_child_model(before, avl_left(before, avl_node@pre)), pred)) *
                  avl_tree_store(avl_child_model(before, avl_right(before, avl_node))) * GlobalStrings(LitMap)
 */
                avl_node->left = AvlTreeDeleteNode(avl_node->left, pred->data)
                  /*@ where(cursor_level_spec) before = avl_child_model(before, avl_left(before, avl_node@pre)), focus = pred, LitMap = LitMap */;
            }
        }

        /*@ Assert exists raw old_cache saved_temp saved_pred,
          avl_node == avl_node@pre && data == data@pre &&
          avl_delete_input(before, avl_node@pre, data@pre) &&
          avl_api_delete_repair(before, raw, data, avl_node) &&
          avl_tree_valid(raw) && avl_update_height_children_safe(raw, avl_node) && avl_balance_graph_input(raw, avl_node) &&
          store(&temp, saved_temp) * store(&pred, saved_pred) * avl_tree_store(avl_with_root_cache(raw, avl_node, old_cache)) * GlobalStrings(LitMap)
 */
        /*@ Given raw old_cache saved_temp saved_pred */
        crtos_avl_update_height_crtos(avl_node)
          /*@ where(low_level_spec) g = raw, old_cache = old_cache */;
        return crtos_avl_balance_crtos(avl_node)
          /*@ where(high_level_spec) before = raw */;
    } else {
        crtos_avl_kprintf0("AvlTreeDeleteNode cannot find the delete data\n")
        /*@ where text = "AvlTreeDeleteNode cannot find the delete data\n", LitMap = LitMap */;
        return NONE;
    }
}

AvlNodeType AvlNodeModifyNode(AvlNodeType avl_node, int src_data, int dst_data)
 /*@ high_level_spec <= low_level_spec
 With keys
 Require avl_balanced_set_root_rep(keys, avl_node) * avl_api_runtime_strings
 Ensure
  ((avl_node == 0 && __return == 0 && avl_balanced_set_root_rep(keys, avl_node)) ||
   (avl_node != 0 && __return != 0 &&
    avl_balanced_set_root_rep(avl_set_insert(avl_set_remove(keys, src_data), dst_data), __return)) ||
   (__return == 0 && avl_api_modify_failure_rep(keys, avl_node, src_data, dst_data))) *
  avl_api_runtime_strings
 */;

AvlNodeType AvlNodeModifyNode(AvlNodeType avl_node, int src_data, int dst_data)
 /*@ low_level_spec
 With before LitMap
 Require avl_gvalid(before) && avl_node == avl_ptr_of(avl_root(before)) &&
   avl_tree_store(before) * GlobalStrings(LitMap)
 Ensure
  ((avl_node == 0 && __return == 0 && avl_tree_store(before)) ||
   (exists middle after,
     avl_node != 0 &&
     avl_delete_outcome(before, middle, src_data, avl_ptr_of(avl_root(middle))) &&
     strict_insert_outcome(middle, after, dst_data, __return) && avl_tree_store(after))) *
  GlobalStrings(LitMap)
 */
{
    AvlNodeType dst_node = NONE;
    if(avl_node) {
        /*@ INT_MIN <= dst_data && dst_data <= INT_MAX by local */
        /*Step1 : delete the src data node*/
        avl_node = AvlTreeDeleteNode(avl_node, src_data)
          /*@ where(low_level_spec) before = before, LitMap = LitMap */;
        /*@ Assert exists middle,
          avl_node@pre != 0 && src_data == src_data@pre && dst_data == dst_data@pre &&
          avl_delete_outcome(before, middle, src_data, avl_node) &&
          avl_insert_input(middle, avl_node, dst_data) &&
          store(&dst_node, 0) * avl_subtree_store_at(middle, avl_node) * GlobalStrings(LitMap)
        */
        /*@ Given middle */
        /*Step2 : insert the dst data node*/
        dst_node = AvlTreeInsertNode(avl_node, dst_data)
          /*@ where(low_level_spec) before = middle, LitMap = LitMap */;
    } else {
        crtos_avl_kprintf0("AvlNodeModifyNode cannot find the src data node\n")
          /*@ where text = "AvlNodeModifyNode cannot find the src data node\n", LitMap = LitMap */;
        return NONE;
    }
    return dst_node;
}

AvlNodeType AvlNodeSearchNode(AvlNodeType avl_node, int data)
  /*@ high_level_spec <= low_level_spec
      With keys
      Require avl_balanced_set_root_rep(keys, avl_node) * avl_api_runtime_strings
      Ensure (
        ((!avl_set_member(keys, data) && __return == 0) &&
         avl_balanced_set_root_rep(keys, avl_node)) ||
        (exists g,
          avl_set_member(keys, data) && __return != 0 &&
          avl_gvalid(g) && avl_tree_valid(g) && avl_balanced(g) &&
          avl_node == avl_ptr_of(avl_root(g)) &&
          avl_set_refines_graph(keys, g) &&
          avl_vvalid(g, __return) &&
          avl_key_of(g, __return) == data &&
          store(&(__return->data), data) *
          store(&(__return->height), avl_height_of(g, __return)) *
          store(&(__return->left), avl_ptr_of(avl_left(g, __return))) *
          store(&(__return->right), avl_ptr_of(avl_right(g, __return))) *
          avl_graph_nodes_store(g, avl_nodes_without(g, __return))) ) * avl_api_runtime_strings
   */
;

AvlNodeType AvlNodeSearchNode(AvlNodeType avl_node, int data)
  /*@ low_level_spec
      With g LitMap
      Require
        avl_tree_valid(g) &&
        avl_search_cursor_valid(g, avl_node, data) &&
        avl_subtree_store_at(g, avl_node) * GlobalStrings(LitMap)
      Ensure
        avl_search_result(g, data, __return) &&
        avl_subtree_store_at(g, avl_node) * GlobalStrings(LitMap)
 */
{
    AvlNodeType dst_node = NONE;

    /*@ INT_MIN <= data && data <= INT_MAX by local */
    if(avl_node) {
        /*@ Assert
            avl_node == avl_node@pre && data == data@pre &&
            INT_MIN <= data && data <= INT_MAX &&
            avl_tree_valid(g) &&
            avl_vvalid(g, avl_node) && avl_node != 0 &&
            INT_MIN <= avl_key_of(g, avl_node) && avl_key_of(g, avl_node) <= INT_MAX &&
            0 <= avl_height_of(g, avl_node) && avl_height_of(g, avl_node) <= UINT_MAX &&
            avl_search_cursor_valid(g, avl_node, data) &&
            store(&dst_node, 0) *
            store(&(avl_node->data), avl_key_of(g, avl_node)) *
            store(&(avl_node->height), avl_height_of(g, avl_node)) *
            store(&(avl_node->left), avl_ptr_of(avl_left(g, avl_node))) *
            store(&(avl_node->right), avl_ptr_of(avl_right(g, avl_node))) *
            avl_subtree_store_at(g, avl_ptr_of(avl_left(g, avl_node))) *
            avl_subtree_store_at(g, avl_ptr_of(avl_right(g, avl_node))) * GlobalStrings(LitMap)
 */
        if(data == avl_node->data) {
            dst_node = avl_node;
            crtos_avl_kprintf1("AvlNodeSearchNode %d is existed return the node\n", avl_node->data)
            /*@ where text = "AvlNodeSearchNode %d is existed return the node\n", LitMap = LitMap */;
        } else if(avl_node->data < data) {
            /*@ Assert
                avl_node == avl_node@pre && data == data@pre &&
                INT_MIN <= data && data <= INT_MAX &&
                avl_tree_valid(g) &&
                avl_vvalid(g, avl_node) && avl_node != 0 &&
                INT_MIN <= avl_key_of(g, avl_node) && avl_key_of(g, avl_node) <= INT_MAX &&
                0 <= avl_height_of(g, avl_node) && avl_height_of(g, avl_node) <= UINT_MAX &&
                avl_key_of(g, avl_node) < data &&
                avl_search_cursor_valid(g, avl_ptr_of(avl_right(g, avl_node)), data) &&
                store(&dst_node, 0) *
                store(&(avl_node->data), avl_key_of(g, avl_node)) *
                store(&(avl_node->height), avl_height_of(g, avl_node)) *
                store(&(avl_node->left), avl_ptr_of(avl_left(g, avl_node))) *
                store(&(avl_node->right), avl_ptr_of(avl_right(g, avl_node))) *
                avl_subtree_store_at(g, avl_ptr_of(avl_left(g, avl_node))) *
                avl_subtree_store_at(g, avl_ptr_of(avl_right(g, avl_node))) * GlobalStrings(LitMap)
 */
            dst_node = AvlNodeSearchNode(avl_node->right, data);
        } else {
            /*@ Assert
                avl_node == avl_node@pre && data == data@pre &&
                INT_MIN <= data && data <= INT_MAX &&
                avl_tree_valid(g) &&
                avl_vvalid(g, avl_node) && avl_node != 0 &&
                INT_MIN <= avl_key_of(g, avl_node) && avl_key_of(g, avl_node) <= INT_MAX &&
                0 <= avl_height_of(g, avl_node) && avl_height_of(g, avl_node) <= UINT_MAX &&
                data < avl_key_of(g, avl_node) &&
                avl_search_cursor_valid(g, avl_ptr_of(avl_left(g, avl_node)), data) &&
                store(&dst_node, 0) *
                store(&(avl_node->data), avl_key_of(g, avl_node)) *
                store(&(avl_node->height), avl_height_of(g, avl_node)) *
                store(&(avl_node->left), avl_ptr_of(avl_left(g, avl_node))) *
                store(&(avl_node->right), avl_ptr_of(avl_right(g, avl_node))) *
                avl_subtree_store_at(g, avl_ptr_of(avl_left(g, avl_node))) *
                avl_subtree_store_at(g, avl_ptr_of(avl_right(g, avl_node))) * GlobalStrings(LitMap)
 */
            dst_node = AvlNodeSearchNode(avl_node->left, data);
        }
    } else {
        crtos_avl_kprintf0("AvlNodeSearchNode avl_node is NONE.\n")
        /*@ where text = "AvlNodeSearchNode avl_node is NONE.\n", LitMap = LitMap */;
        return NONE;
    }

    /*@ avl_node == avl_node@pre by local */
    return dst_node;
}
