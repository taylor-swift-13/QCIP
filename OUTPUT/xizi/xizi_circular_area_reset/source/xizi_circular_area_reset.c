typedef unsigned char uint8;
typedef unsigned int uint32;
typedef int x_bool;

/*@ Extern Coq (circular_area_state :: *) */
/*@ Extern Coq
      (ca_capacity : circular_area_state -> Z)
      (Build_circular_area_state : Z -> list Z -> circular_area_state)
      (store_circular_area : circular_area_state -> Z -> Assertion)
*/
/*@ Import Coq Require Import
      SimpleC.EE.OUTPUT.xizi.xizi_circular_area_reset.source.xizi_circular_area_reset_lib
*/

struct CircularArea;
typedef struct CircularArea *CircularAreaType;

#define RET_FALSE 0

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

void CircularAreaReset(CircularAreaType circular_area)
/*@ With (state : circular_area_state)
    Require store_circular_area(state, circular_area)
    Ensure store_circular_area(
             Build_circular_area_state(ca_capacity(state), nil),
             circular_area)
*/
{
    /*@ Assert
          exists data_buffer0 operations0 readidx0 writeidx0 b_status0 physical,
            circular_area == circular_area@pre &&
            circular_area != 0 &&
            data_buffer0 != 0 &&
            0 < ca_capacity(state) && ca_capacity(state) <= 256 &&
            Zlength(physical) == ca_capacity(state) &&
            circular_area -> data_buffer == data_buffer0 &&
            circular_area -> readidx == readidx0 &&
            circular_area -> writeidx == writeidx0 &&
            circular_area -> p_head == data_buffer0 &&
            circular_area -> p_tail == data_buffer0 + ca_capacity(state) &&
            circular_area -> area_length == ca_capacity(state) &&
            circular_area -> b_status == b_status0 &&
            circular_area -> CircularAreaOperations == operations0 &&
            UCharArray::mixed_full(
              data_buffer0, ca_capacity(state), physical)
    */
    circular_area->writeidx = 0;
    circular_area->readidx = 0;
    circular_area->b_status = RET_FALSE;
}
