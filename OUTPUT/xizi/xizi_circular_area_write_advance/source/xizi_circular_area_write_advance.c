typedef unsigned char uint8_t;
typedef unsigned int uint32_t;

/*@ Import Coq Require Import
      SimpleC.EE.OUTPUT.xizi.xizi_circular_area_write_advance.source.xizi_circular_area_write_advance_lib
 */
/*@ Extern Coq (circular_area_state :: *) */
/*@ Extern Coq
      (ca_capacity : circular_area_state -> Z)
      (ca_contents : circular_area_state -> list Z)
      (store_circular_area : circular_area_state -> Z -> Assertion)
      (CircularAreaDivideWrDataResult : Z -> Z -> Z -> Z -> Prop)
      (CircularAreaLogicalState :
         Z -> Z -> Z -> Z -> list Z -> list (option Z) -> Prop)
 */

typedef uint8_t uint8;
typedef uint32_t uint32;
typedef int x_bool;
struct CircularArea;
typedef struct CircularArea *CircularAreaType;

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

static uint32 CircularAreaDivideWrData(CircularAreaType circular_area,
                                       uint32 data_length)
/*@ With (state : circular_area_state)
          (area_addr : Z)
          (entry_data_length : Z)
          (LitMap : String -> Z)
    Require
      circular_area == area_addr &&
      data_length == entry_data_length &&
      ((area_addr == 0 && GlobalStrings(LitMap)) ||
       (area_addr != 0 &&
        0 <= entry_data_length &&
        entry_data_length <= ca_capacity(state) &&
        store_circular_area(state, area_addr) * GlobalStrings(LitMap)))
    Ensure
      (area_addr == 0 && __return == 1 && GlobalStrings(LitMap)) ||
      (area_addr != 0 &&
       0 <= entry_data_length &&
       entry_data_length <= ca_capacity(state) &&
       exists data_buffer circular_area_operations readidx writeidx b_status
              (physical : list (option Z)),
         data_buffer != 0 &&
         CircularAreaLogicalState(
           readidx, writeidx, ca_capacity(state), b_status,
           ca_contents(state), physical) &&
         CircularAreaDivideWrDataResult(
           writeidx, entry_data_length, ca_capacity(state), __return) &&
         store(&(area_addr->data_buffer), data_buffer) *
         store(&(area_addr->readidx), readidx) *
         store(&(area_addr->writeidx), writeidx) *
         store(&(area_addr->p_head), data_buffer) *
         store(&(area_addr->p_tail), data_buffer + ca_capacity(state)) *
         store(&(area_addr->area_length), ca_capacity(state)) *
         store(&(area_addr->b_status), b_status) *
         store(&(area_addr->CircularAreaOperations),
               circular_area_operations) *
         UCharArray::mixed_full(
           data_buffer, ca_capacity(state), physical) *
         GlobalStrings(LitMap))
 */
{
    NULL_PARAM_CHECK(circular_area);

    /*@ Assert
      exists data_buffer circular_area_operations readidx writeidx b_status
             (physical : list (option Z)),
        circular_area == area_addr &&
        data_length == entry_data_length &&
        area_addr != 0 && data_buffer != 0 &&
        0 <= entry_data_length &&
        entry_data_length <= ca_capacity(state) &&
        CircularAreaLogicalState(
          readidx, writeidx, ca_capacity(state), b_status,
          ca_contents(state), physical) &&
        store(&(circular_area->data_buffer), data_buffer) *
        store(&(circular_area->readidx), readidx) *
        store(&(circular_area->writeidx), writeidx) *
        store(&(circular_area->p_head), data_buffer) *
        store(&(circular_area->p_tail), data_buffer + ca_capacity(state)) *
        store(&(circular_area->area_length), ca_capacity(state)) *
        store(&(circular_area->b_status), b_status) *
        store(&(circular_area->CircularAreaOperations),
              circular_area_operations) *
        UCharArray::mixed_full(data_buffer, ca_capacity(state), physical) *
        GlobalStrings(LitMap)
    */

    if (circular_area->writeidx + data_length <= circular_area->area_length) {
        return RET_FALSE;
    } else {
        return RET_TRUE;
    }
}
