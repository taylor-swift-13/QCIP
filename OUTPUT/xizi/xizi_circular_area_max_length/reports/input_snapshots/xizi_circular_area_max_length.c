/* Parser-compatible spellings of CRTOS's fixed-width aliases. */
typedef unsigned char uint8;
typedef unsigned int uint32;
typedef int x_bool;

#define NONE ((void *)0)
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

/*@ Import Coq From SimpleC.EE.OUTPUT.xizi.xizi_circular_area_max_length.source Require Import xizi_circular_area_max_length_lib */
/*@ Extern Coq (circular_area_state :: *) */
/*@ Extern Coq
      (ca_capacity : circular_area_state -> Z)
      (ca_contents : circular_area_state -> list Z)
      (store_circular_area : circular_area_state -> Z -> Assertion)
      (CircularAreaLogicalState :
         Z -> Z -> Z -> Z -> list Z -> list (option Z) -> Prop)
      (UCharArray::mixed_full : Z -> Z -> list (option Z) -> Assertion)
*/

uint32 CircularAreaGetMaxLength(CircularAreaType circular_area)
/*@ null_spec
    With LitMap
    Require circular_area == 0 && GlobalStrings(LitMap)
    Ensure circular_area == 0 && __return == 1 && GlobalStrings(LitMap)
*/
/*@ state_spec
    With state LitMap area_addr
    Require circular_area == area_addr &&
            circular_area != 0 &&
            GlobalStrings(LitMap) *
            store_circular_area(state, circular_area)
    Ensure __return == ca_capacity(state) &&
           GlobalStrings(LitMap) *
           store_circular_area(state, area_addr)
*/
{
    NULL_PARAM_CHECK(circular_area);

    /*@ Assert
          exists data_buffer operations readidx writeidx b_status physical,
          circular_area != 0 &&
          circular_area == area_addr &&
          data_buffer != 0 &&
          CircularAreaLogicalState(
            readidx, writeidx, ca_capacity(state), b_status,
            ca_contents(state), physical) &&
          GlobalStrings(LitMap) *
          store_ptr(&(circular_area->data_buffer), data_buffer) *
          store_uchar(&(circular_area->readidx), readidx) *
          store_uchar(&(circular_area->writeidx), writeidx) *
          store_ptr(&(circular_area->p_head), data_buffer) *
          store_ptr(&(circular_area->p_tail),
                    data_buffer + ca_capacity(state)) *
          store_uint(&(circular_area->area_length), ca_capacity(state)) *
          store_int(&(circular_area->b_status), b_status) *
          store_ptr(&(circular_area->CircularAreaOperations), operations) *
          UCharArray::mixed_full(
            data_buffer, ca_capacity(state), physical)
    */
    return circular_area->area_length;
}
