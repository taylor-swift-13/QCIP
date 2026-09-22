/* Parser-compatible spellings of CRTOS's fixed-width aliases. */
typedef unsigned char uint8;
typedef unsigned int uint32;
typedef int x_bool;

#define NONE ((void *)0)
#define RET_TRUE 1
#define RET_FALSE 0
#define ERROR 1
#define NULL_PARAM_CHECK(p) do { if ((p) == NONE) return ERROR; } while (0)

struct CircularAreaOps;

struct CircularArea {
    uint8 *data_buffer;
    uint8 readidx;
    uint8 writeidx;
    uint8 *p_head;
    uint8 *p_tail;
    uint32 area_length;
    x_bool b_status;
    struct CircularAreaOps *CircularAreaOperations;
};

typedef struct CircularArea *CircularAreaType;

/*@ Import Coq From SimpleC.EE.OUTPUT.xizi.xizi_circular_area_read_advance.source Require Import xizi_circular_area_read_advance_lib */
/*@ Extern Coq (circular_area_state :: *) */
/*@ Extern Coq
      (ca_capacity : circular_area_state -> Z)
      (ca_contents : circular_area_state -> list Z)
      (store_circular_area : circular_area_state -> Z -> Assertion)
      (CircularAreaDivideRdDataInput :
         circular_area_state -> (String -> Z) -> Z -> Z -> Z -> Assertion)
      (CircularAreaLogicalState :
         Z -> Z -> Z -> Z -> list Z -> list (option Z) -> Prop)
      (CircularAreaStateDivideRdDataResult :
         circular_area_state -> Z -> Z -> Prop)
      (CircularAreaDivideRdDataResult : Z -> Z -> Z -> Z -> Prop)
*/

static uint32 CircularAreaDivideRdData(CircularAreaType circular_area,
                                       uint32 data_length)
/*@ With (state : circular_area_state) LitMap area_addr
    Require
      CircularAreaDivideRdDataInput(
        state, LitMap, circular_area, data_length, area_addr)
    Ensure
      GlobalStrings(LitMap) *
      ((circular_area == 0 && __return == 1 && emp) ||
       (exists data_buffer operations readidx writeidx b_status physical,
        area_addr != 0 && data_buffer != 0 &&
        CircularAreaStateDivideRdDataResult(
          state, data_length@pre, __return) &&
        CircularAreaDivideRdDataResult(
          readidx, data_length@pre, ca_capacity(state), __return) &&
        CircularAreaLogicalState(
          readidx, writeidx, ca_capacity(state), b_status,
          ca_contents(state), physical) &&
        UCharArray::mixed_full(data_buffer, ca_capacity(state), physical) *
        store_ptr(&(area_addr->data_buffer), data_buffer) *
        store_uchar(&(area_addr->readidx), readidx) *
        store_uchar(&(area_addr->writeidx), writeidx) *
        store_ptr(&(area_addr->p_head), data_buffer) *
        store_ptr(&(area_addr->p_tail),
                  data_buffer + ca_capacity(state)) *
        store_uint(&(area_addr->area_length), ca_capacity(state)) *
        store_int(&(area_addr->b_status), b_status) *
        store_ptr(&(area_addr->CircularAreaOperations), operations)))
*/
{
    NULL_PARAM_CHECK(circular_area);

    /*@ Assert
      exists data_buffer operations readidx writeidx b_status physical,
        circular_area == circular_area@pre &&
        data_length == data_length@pre &&
        circular_area == area_addr &&
        circular_area != 0 && data_buffer != 0 &&
        0 <= data_length@pre &&
        data_length@pre <= Zlength(ca_contents(state)) &&
        readidx + data_length@pre <= 4294967295 &&
        CircularAreaLogicalState(readidx, writeidx, ca_capacity(state), b_status,
                                 ca_contents(state), physical) &&
        GlobalStrings(LitMap) *
        UCharArray::mixed_full(data_buffer, ca_capacity(state), physical) *
        store_ptr(&(circular_area->data_buffer), data_buffer) *
        store_uchar(&(circular_area->readidx), readidx) *
        store_uchar(&(circular_area->writeidx), writeidx) *
        store_ptr(&(circular_area->p_head), data_buffer) *
        store_ptr(&(circular_area->p_tail), data_buffer + ca_capacity(state)) *
        store_uint(&(circular_area->area_length), ca_capacity(state)) *
        store_int(&(circular_area->b_status), b_status) *
        store_ptr(&(circular_area->CircularAreaOperations), operations)
    */

    if (circular_area->readidx + data_length <= circular_area->area_length) {
        return RET_FALSE;
    } else {
        return RET_TRUE;
    }
}
