typedef unsigned char uint8;
typedef unsigned int uint32;
typedef int x_bool;
struct CircularArea;
typedef struct CircularArea *CircularAreaType;

#define NONE ((void *)0)
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

/*@ Import Coq Require Import SimpleC.EE.OUTPUT.xizi.xizi_circular_area_release.source.xizi_circular_area_release_lib */
/*@ Extern Coq (circular_area_state :: *) */
/*@ Extern Coq
      (ca_capacity : circular_area_state -> Z)
      (ca_contents : circular_area_state -> list Z)
      (store_circular_area : circular_area_state -> Z -> Assertion)
      (CircularAreaLogicalState :
         Z -> Z -> Z -> Z -> list Z -> list (option Z) -> Prop)
      (UCharArray::mixed_full : Z -> Z -> list (option Z) -> Assertion)
*/

void x_free(void *p)
/*@ data_buffer_spec
    With data_buffer data_length (physical: list (option Z))
    Require p == data_buffer && data_buffer != 0 &&
            UCharArray::mixed_full(data_buffer, data_length, physical)
    Ensure emp
*/;

void x_free(void *p)
/*@ circular_area_spec
    With circular_area data_buffer operations
    Require p == circular_area && circular_area != 0 &&
            ((CircularAreaType)circular_area) -> data_buffer == data_buffer &&
            ((CircularAreaType)circular_area) -> readidx == 0 &&
            ((CircularAreaType)circular_area) -> writeidx == 0 &&
            ((CircularAreaType)circular_area) -> p_head == 0 &&
            ((CircularAreaType)circular_area) -> p_tail == 0 &&
            ((CircularAreaType)circular_area) -> area_length == 0 &&
            ((CircularAreaType)circular_area) -> b_status == 0 &&
            ((CircularAreaType)circular_area) -> CircularAreaOperations == operations
    Ensure emp
*/;

void CircularAreaRelease(CircularAreaType circular_area)
/*@ With (state: circular_area_state) LitMap
    Require GlobalStrings(LitMap) *
            store_circular_area(state, circular_area)
    Ensure GlobalStrings(LitMap)
*/
{
    /*@ Assert
          exists data_buffer operations readidx writeidx b_status physical,
            circular_area == circular_area@pre &&
            circular_area != 0 && data_buffer != 0 &&
            CircularAreaLogicalState(
              readidx, writeidx, ca_capacity(state), b_status,
              ca_contents(state), physical) &&
            GlobalStrings(LitMap) *
            store(&(circular_area->data_buffer), data_buffer) *
            store(&(circular_area->readidx), readidx) *
            store(&(circular_area->writeidx), writeidx) *
            store(&(circular_area->p_head), data_buffer) *
            store(&(circular_area->p_tail),
                  data_buffer + ca_capacity(state)) *
            store(&(circular_area->area_length), ca_capacity(state)) *
            store(&(circular_area->b_status), b_status) *
            store(&(circular_area->CircularAreaOperations), operations) *
            UCharArray::mixed_full(
              data_buffer, ca_capacity(state), physical)
    */
    circular_area->readidx = 0;
    circular_area->writeidx = 0;
    circular_area->p_head = NONE;
    circular_area->p_tail = NONE;
    circular_area->b_status = RET_FALSE;
    circular_area->area_length = 0;

    x_free(circular_area->data_buffer) /*@ where (data_buffer_spec) */;
    x_free(circular_area) /*@ where (circular_area_spec) */;
}
