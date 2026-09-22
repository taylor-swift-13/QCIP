typedef unsigned char uint8;
typedef unsigned int uint32;
typedef int x_bool;

/*@ Extern Coq
      (CircularAreaLogicalState :
         Z -> Z -> Z -> Z -> list Z -> list (option Z) -> Prop)
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
/*@ With data_buffer0 readidx0 writeidx0 area_length0 b_status0
          operations0 logical physical LitMap
    Require circular_area != 0 &&
            data_buffer0 != 0 &&
            CircularAreaLogicalState(readidx0, writeidx0, area_length0,
                                     b_status0, logical, physical) &&
            circular_area -> data_buffer == data_buffer0 &&
            circular_area -> readidx == readidx0 &&
            circular_area -> writeidx == writeidx0 &&
            circular_area -> p_head == data_buffer0 &&
            circular_area -> p_tail == data_buffer0 + area_length0 &&
            circular_area -> area_length == area_length0 &&
            circular_area -> b_status == b_status0 &&
            circular_area -> CircularAreaOperations == operations0 &&
            UCharArray::mixed_full(data_buffer0, area_length0, physical) *
            GlobalStrings(LitMap)
    Ensure CircularAreaLogicalState(0, 0, area_length0, 0, nil, physical) &&
           circular_area -> data_buffer == data_buffer0 &&
           circular_area -> readidx == 0 &&
           circular_area -> writeidx == 0 &&
           circular_area -> p_head == data_buffer0 &&
           circular_area -> p_tail == data_buffer0 + area_length0 &&
           circular_area -> area_length == area_length0 &&
           circular_area -> b_status == 0 &&
           circular_area -> CircularAreaOperations == operations0 &&
           UCharArray::mixed_full(data_buffer0, area_length0, physical) *
           GlobalStrings(LitMap)
*/
{
    circular_area->writeidx = 0;
    circular_area->readidx = 0;
    circular_area->b_status = RET_FALSE;
}
