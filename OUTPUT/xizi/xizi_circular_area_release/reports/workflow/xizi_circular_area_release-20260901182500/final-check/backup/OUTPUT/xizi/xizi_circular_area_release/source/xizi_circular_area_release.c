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
/*@ Extern Coq
      (UCharArray::mixed_full : Z -> Z -> list (option Z) -> Assertion)
      (CircularAreaBackingResource :
         Z -> Z -> Z -> Z -> Z -> Z -> Z -> list Z ->
         list (option Z) -> Assertion)
      (CircularAreaLogicalState :
         Z -> Z -> Z -> Z -> list Z -> list (option Z) -> Prop)
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
/*@ With data_buffer readidx writeidx area_length b_status operations
          (logical: list Z) (physical: list (option Z))
    Require CircularAreaBackingResource(
              circular_area, data_buffer, readidx, writeidx, area_length,
              b_status, operations, logical, physical)
    Ensure emp
*/
{
    /*@ Assert
          circular_area != 0 && data_buffer != 0 &&
          CircularAreaLogicalState(readidx, writeidx, area_length, b_status,
                                   logical, physical) &&
          circular_area -> data_buffer == data_buffer &&
          circular_area -> readidx == readidx &&
          circular_area -> writeidx == writeidx &&
          circular_area -> p_head == data_buffer &&
          circular_area -> p_tail == data_buffer + area_length &&
          circular_area -> area_length == area_length &&
          circular_area -> b_status == b_status &&
          circular_area -> CircularAreaOperations == operations &&
          UCharArray::mixed_full(data_buffer, area_length, physical)
    */
    circular_area->readidx = 0;
    circular_area->writeidx = 0;
    circular_area->p_head = NONE;
    circular_area->p_tail = NONE;
    circular_area->b_status = RET_FALSE;
    circular_area->area_length = 0;

    x_free(circular_area->data_buffer)
        /*@ where (data_buffer_spec) data_buffer = data_buffer,
                                          data_length = area_length,
                                          physical = physical */;
    x_free(circular_area)
        /*@ where (circular_area_spec) circular_area = circular_area,
                                          data_buffer = data_buffer,
                                          operations = operations */;
}
