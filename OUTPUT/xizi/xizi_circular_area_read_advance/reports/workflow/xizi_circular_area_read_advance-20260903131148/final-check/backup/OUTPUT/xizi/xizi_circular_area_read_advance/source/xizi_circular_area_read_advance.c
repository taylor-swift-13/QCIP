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
/*@ Extern Coq
      (CircularAreaLogicalState :
         Z -> Z -> Z -> Z -> list Z -> list (option Z) -> Prop)
      (CircularAreaBackingResource :
         Z -> Z -> Z -> Z -> Z -> Z -> Z ->
         list Z -> list (option Z) -> Assertion)
      (CircularAreaDivideRdDataInput :
         Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z ->
         list Z -> list (option Z) -> Assertion)
      (CircularAreaDivideRdDataResult : Z -> Z -> Z -> Z -> Prop)
*/

static uint32 CircularAreaDivideRdData(CircularAreaType circular_area,
                                       uint32 data_length)
/*@ With entry_circular_area entry_data_length
         data_buffer readidx writeidx area_length b_status operations
         logical physical
    Require
      circular_area == entry_circular_area &&
      data_length == entry_data_length &&
      CircularAreaDivideRdDataInput(
        entry_circular_area, data_buffer, readidx, writeidx,
        area_length, b_status, operations, entry_data_length,
        logical, physical)
    Ensure
      circular_area == entry_circular_area &&
      data_length == entry_data_length &&
      ((entry_circular_area == 0 && __return == 1 && emp) ||
       (entry_circular_area != 0 &&
        0 <= entry_data_length && entry_data_length <= area_length &&
        CircularAreaLogicalState(readidx, writeidx, area_length, b_status,
                                 logical, physical) &&
        CircularAreaDivideRdDataResult(
          readidx, entry_data_length, area_length, __return) &&
        CircularAreaBackingResource(
          entry_circular_area, data_buffer, readidx, writeidx,
          area_length, b_status, operations, logical, physical)))
*/
{
    /*@ Assert
          circular_area == circular_area@pre &&
          data_length == data_length@pre &&
          circular_area@pre == entry_circular_area &&
          data_length@pre == entry_data_length &&
          ((entry_circular_area == 0 && emp) ||
           (entry_circular_area != 0 &&
            data_buffer != 0 &&
            0 <= entry_data_length && entry_data_length <= area_length &&
            readidx + entry_data_length <= 4294967295 &&
            CircularAreaLogicalState(readidx, writeidx, area_length, b_status,
                                     logical, physical) &&
            UCharArray::mixed_full(data_buffer, area_length, physical) *
            store_ptr(&(entry_circular_area->data_buffer), data_buffer) *
            store_uchar(&(entry_circular_area->readidx), readidx) *
            store_uchar(&(entry_circular_area->writeidx), writeidx) *
            store_ptr(&(entry_circular_area->p_head), data_buffer) *
            store_ptr(&(entry_circular_area->p_tail),
                      data_buffer + area_length) *
            store_uint(&(entry_circular_area->area_length), area_length) *
            store_int(&(entry_circular_area->b_status), b_status) *
            store_ptr(&(entry_circular_area->CircularAreaOperations),
                      operations)))
    */

    NULL_PARAM_CHECK(circular_area);

    if (circular_area->readidx + data_length <= circular_area->area_length) {
        return RET_FALSE;
    } else {
        return RET_TRUE;
    }
}
