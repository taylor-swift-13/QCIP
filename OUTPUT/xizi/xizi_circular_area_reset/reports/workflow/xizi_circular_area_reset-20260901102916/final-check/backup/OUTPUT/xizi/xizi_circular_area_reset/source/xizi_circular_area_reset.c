typedef unsigned char uint8;
typedef unsigned int uint32;
typedef int x_bool;

/*@ Extern Coq
      (CircularAreaResetPost :
         Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Prop)
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
/*@ With data_buffer0 readidx0 writeidx0 p_head0 p_tail0
          area_length0 b_status0 operations0 buffer_contents
    Require circular_area -> data_buffer == data_buffer0 &&
            circular_area -> readidx == readidx0 &&
            circular_area -> writeidx == writeidx0 &&
            circular_area -> p_head == p_head0 &&
            circular_area -> p_tail == p_tail0 &&
            circular_area -> area_length == area_length0 &&
            circular_area -> b_status == b_status0 &&
            circular_area -> CircularAreaOperations == operations0 &&
            UCharArray::full(data_buffer0, area_length0, buffer_contents)
    Ensure exists data_buffer1 readidx1 writeidx1 p_head1 p_tail1
                  area_length1 b_status1 operations1,
           CircularAreaResetPost(data_buffer0, p_head0, p_tail0,
                                 area_length0, operations0,
                                 data_buffer1, readidx1, writeidx1,
                                 p_head1, p_tail1, area_length1,
                                 b_status1, operations1) &&
           circular_area -> data_buffer == data_buffer1 &&
           circular_area -> readidx == readidx1 &&
           circular_area -> writeidx == writeidx1 &&
           circular_area -> p_head == p_head1 &&
           circular_area -> p_tail == p_tail1 &&
           circular_area -> area_length == area_length1 &&
           circular_area -> b_status == b_status1 &&
           circular_area -> CircularAreaOperations == operations1 &&
           UCharArray::full(data_buffer1, area_length1, buffer_contents)
*/
{
    circular_area->writeidx = 0;
    circular_area->readidx = 0;
    circular_area->b_status = RET_FALSE;
}
