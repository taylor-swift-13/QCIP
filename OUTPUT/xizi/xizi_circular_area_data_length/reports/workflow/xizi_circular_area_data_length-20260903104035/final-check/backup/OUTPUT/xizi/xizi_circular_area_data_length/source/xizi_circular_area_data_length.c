typedef unsigned char uint8;
typedef unsigned int uint32;
typedef int x_bool;

#define NONE ((void *)0)
#define RET_TRUE 1
#define RET_FALSE 0
#define ERROR 1
#define NULL_PARAM_CHECK(p) do { if ((p) == NONE) return ERROR; } while (0)

void KPrintf(const char *fmt)
/*@ With LM s
    Require fmt == LM(s) && GlobalStrings(LM)
    Ensure GlobalStrings(LM)
*/;

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

/*@ Import Coq From SimpleC.EE.OUTPUT.xizi.xizi_circular_area_data_length.source Require Import xizi_circular_area_data_length_lib */
/*@ Extern Coq
      (CircularAreaErrorResult : Z -> Prop)
      (CircularAreaBackingResource :
         Z -> Z -> Z -> Z -> Z -> Z -> Z -> list Z ->
         list (option Z) -> Assertion)
      (CircularAreaLogicalState :
         Z -> Z -> Z -> Z -> list Z -> list (option Z) -> Prop)
      (CircularAreaFullResult : Z -> list Z -> Z -> Prop)
      (CircularAreaDataLengthResult : list Z -> Z -> Prop)
*/

x_bool CircularAreaIsFull(CircularAreaType circular_area)
/*@ state_spec
    With area_addr data_buffer readidx writeidx area_length b_status operations
         logical physical LitMap
    Require circular_area == area_addr &&
            GlobalStrings(LitMap) *
            CircularAreaBackingResource(
              area_addr, data_buffer, readidx, writeidx, area_length,
              b_status, operations, logical, physical)
    Ensure CircularAreaFullResult(area_length, logical, __return) &&
           GlobalStrings(LitMap) *
           CircularAreaBackingResource(
             area_addr, data_buffer, readidx, writeidx, area_length,
             b_status, operations, logical, physical)
*/
{
    NULL_PARAM_CHECK(circular_area);

    /*@ Assert
          circular_area == circular_area@pre &&
          circular_area == area_addr &&
          area_addr != 0 &&
          data_buffer != 0 &&
          CircularAreaLogicalState(readidx, writeidx, area_length, b_status,
                                   logical, physical) &&
          GlobalStrings(LitMap) *
          store_ptr(&(circular_area->data_buffer), data_buffer) *
          store_uchar(&(circular_area->readidx), readidx) *
          store_uchar(&(circular_area->writeidx), writeidx) *
          store_ptr(&(circular_area->p_head), data_buffer) *
          store_ptr(&(circular_area->p_tail), data_buffer + area_length) *
          store_uint(&(circular_area->area_length), area_length) *
          store_int(&(circular_area->b_status), b_status) *
          store_ptr(&(circular_area->CircularAreaOperations), operations) *
          UCharArray::mixed_full(data_buffer, area_length, physical)
    */
    if((circular_area->readidx == circular_area->writeidx) && (circular_area->b_status)) {
        KPrintf("the circular area is full\n")
          /*@ where LM = LitMap, s = "the circular area is full\n" */;
        return RET_TRUE;
    } else {
        return RET_FALSE;
    }
}

uint32 CircularAreaGetDataLength(CircularAreaType circular_area)
/*@ null_spec
    With LitMap
    Require circular_area == 0 && GlobalStrings(LitMap)
    Ensure circular_area == 0 && CircularAreaErrorResult(__return) &&
           GlobalStrings(LitMap)
*/
/*@ state_spec
    With area_addr data_buffer readidx writeidx area_length b_status operations
         logical physical LitMap
    Require circular_area == area_addr &&
            GlobalStrings(LitMap) *
            CircularAreaBackingResource(
              area_addr, data_buffer, readidx, writeidx, area_length,
              b_status, operations, logical, physical)
    Ensure CircularAreaDataLengthResult(logical, __return) &&
           GlobalStrings(LitMap) *
           CircularAreaBackingResource(
             area_addr, data_buffer, readidx, writeidx, area_length,
             b_status, operations, logical, physical)
*/;

uint32 CircularAreaGetDataLength(CircularAreaType circular_area)
/*@ null_spec */
/*@ state_spec */
{
    NULL_PARAM_CHECK(circular_area);

    if(CircularAreaIsFull(circular_area)
       /*@ where (state_spec) */) {
        /*@ Assert
              circular_area == area_addr &&
              area_addr != 0 &&
              data_buffer != 0 &&
              Zlength(logical) == area_length &&
              CircularAreaLogicalState(readidx, writeidx, area_length,
                                       b_status, logical, physical) &&
              GlobalStrings(LitMap) *
              store_ptr(&(circular_area->data_buffer), data_buffer) *
              store_uchar(&(circular_area->readidx), readidx) *
              store_uchar(&(circular_area->writeidx), writeidx) *
              store_ptr(&(circular_area->p_head), data_buffer) *
              store_ptr(&(circular_area->p_tail),
                        data_buffer + area_length) *
              store_uint(&(circular_area->area_length), area_length) *
              store_int(&(circular_area->b_status), b_status) *
              store_ptr(&(circular_area->CircularAreaOperations), operations) *
              UCharArray::mixed_full(data_buffer, area_length, physical)
        */
        return circular_area->area_length;
    } else {
        /*@ Assert
              circular_area == area_addr &&
              area_addr != 0 &&
              data_buffer != 0 &&
              Zlength(logical) < area_length &&
              CircularAreaLogicalState(readidx, writeidx, area_length,
                                       b_status, logical, physical) &&
              GlobalStrings(LitMap) *
              store_ptr(&(circular_area->data_buffer), data_buffer) *
              store_uchar(&(circular_area->readidx), readidx) *
              store_uchar(&(circular_area->writeidx), writeidx) *
              store_ptr(&(circular_area->p_head), data_buffer) *
              store_ptr(&(circular_area->p_tail),
                        data_buffer + area_length) *
              store_uint(&(circular_area->area_length), area_length) *
              store_int(&(circular_area->b_status), b_status) *
              store_ptr(&(circular_area->CircularAreaOperations), operations) *
              UCharArray::mixed_full(data_buffer, area_length, physical)
        */
        return (circular_area->writeidx - circular_area->readidx +
                circular_area->area_length) % circular_area->area_length;
    }
}
