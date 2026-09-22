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
/*@ Extern Coq (circular_area_state :: *) */
/*@ Extern Coq
      (ca_capacity : circular_area_state -> Z)
      (ca_contents : circular_area_state -> list Z)
      (CircularAreaErrorResult : Z -> Prop)
      (store_circular_area : circular_area_state -> Z -> Assertion)
      (CircularAreaLogicalState :
         Z -> Z -> Z -> Z -> list Z -> list (option Z) -> Prop)
      (CircularAreaFullResult : circular_area_state -> Z -> Prop)
      (CircularAreaDataLengthResult : circular_area_state -> Z -> Prop)
*/

x_bool CircularAreaIsFull(CircularAreaType circular_area)
/*@ null_spec
    With LitMap
    Require circular_area == 0 && GlobalStrings(LitMap)
    Ensure circular_area == 0 && CircularAreaErrorResult(__return) &&
           GlobalStrings(LitMap)
*/
/*@ state_spec
    With state LitMap area_addr
    Require circular_area == area_addr &&
            circular_area != 0 &&
            GlobalStrings(LitMap) *
            store_circular_area(state, circular_area)
    Ensure CircularAreaFullResult(state, __return) &&
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
    With state LitMap area_addr
    Require circular_area == area_addr &&
            circular_area != 0 &&
            GlobalStrings(LitMap) *
            store_circular_area(state, circular_area)
    Ensure CircularAreaDataLengthResult(state, __return) &&
           GlobalStrings(LitMap) *
           store_circular_area(state, area_addr)
*/;

uint32 CircularAreaGetDataLength(CircularAreaType circular_area)
/*@ null_spec */
/*@ state_spec */
{
    NULL_PARAM_CHECK(circular_area);

    if(CircularAreaIsFull(circular_area)
       /*@ where (state_spec) */) {
        /*@ Assert
              exists data_buffer operations readidx writeidx b_status physical,
                circular_area != 0 &&
                circular_area == area_addr &&
                data_buffer != 0 &&
                Zlength(ca_contents(state)) == ca_capacity(state) &&
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
                store_uint(&(circular_area->area_length),
                           ca_capacity(state)) *
                store_int(&(circular_area->b_status), b_status) *
                store_ptr(&(circular_area->CircularAreaOperations),
                          operations) *
                UCharArray::mixed_full(
                  data_buffer, ca_capacity(state), physical)
        */
        return circular_area->area_length;
    } else {
        /*@ Assert
              exists data_buffer operations readidx writeidx b_status physical,
                circular_area != 0 &&
                circular_area == area_addr &&
                data_buffer != 0 &&
                Zlength(ca_contents(state)) < ca_capacity(state) &&
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
                store_uint(&(circular_area->area_length),
                           ca_capacity(state)) *
                store_int(&(circular_area->b_status), b_status) *
                store_ptr(&(circular_area->CircularAreaOperations),
                          operations) *
                UCharArray::mixed_full(
                  data_buffer, ca_capacity(state), physical)
        */
        return (circular_area->writeidx - circular_area->readidx +
                circular_area->area_length) % circular_area->area_length;
    }
}
