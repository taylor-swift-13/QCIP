typedef unsigned char uint8_t;
typedef unsigned int uint32_t;

/*@ Import Coq Require Import
      SimpleC.EE.OUTPUT.xizi.xizi_circular_area_write_advance.source.xizi_circular_area_write_advance_lib
 */
/*@ Extern Coq
      (CircularAreaDivideWrDataResult : Z -> Z -> Z -> Z -> Prop)
      (CircularAreaLogicalState :
         Z -> Z -> Z -> Z -> list Z -> list (option Z) -> Prop)
      (CircularAreaBackingResource :
         Z -> Z -> Z -> Z -> Z -> Z -> Z ->
         list Z -> list (option Z) -> Assertion)
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
/*@ With (data_buffer : Z)
          (entry_circular_area : Z)
          (entry_data_length : Z)
          (readidx : Z)
          (writeidx : Z)
          (area_length : Z)
          (b_status : Z)
          (circular_area_operations : Z)
          (logical : list Z)
          (physical : list (option Z))
          (LitMap : String -> Z)
    Require
      (circular_area == entry_circular_area &&
       data_length == entry_data_length &&
       entry_circular_area == 0 && GlobalStrings(LitMap)) ||
      (circular_area == entry_circular_area &&
       data_length == entry_data_length &&
       entry_circular_area != 0 &&
       0 <= entry_data_length && entry_data_length <= area_length &&
       CircularAreaBackingResource(
         entry_circular_area, data_buffer, readidx, writeidx, area_length,
         b_status, circular_area_operations, logical, physical) *
       GlobalStrings(LitMap))
    Ensure
      (entry_circular_area != 0 &&
       0 <= entry_data_length && entry_data_length <= area_length &&
       CircularAreaDivideWrDataResult(writeidx, entry_data_length,
                                      area_length, __return) &&
       CircularAreaBackingResource(
         entry_circular_area, data_buffer, readidx, writeidx, area_length,
         b_status, circular_area_operations, logical, physical) *
       GlobalStrings(LitMap)) ||
      (entry_circular_area == 0 && __return == 1 && GlobalStrings(LitMap))
 */
{
    NULL_PARAM_CHECK(circular_area);

    /*@ Assert
      circular_area == entry_circular_area &&
      data_length == entry_data_length &&
      entry_circular_area != 0 && data_buffer != 0 &&
      0 <= entry_data_length && entry_data_length <= area_length &&
      CircularAreaLogicalState(readidx, writeidx, area_length, b_status,
                               logical, physical) &&
      store(&(circular_area->data_buffer), data_buffer) *
      store(&(circular_area->readidx), readidx) *
      store(&(circular_area->writeidx), writeidx) *
      store(&(circular_area->p_head), data_buffer) *
      store(&(circular_area->p_tail), data_buffer + area_length) *
      store(&(circular_area->area_length), area_length) *
      store(&(circular_area->b_status), b_status) *
      store(&(circular_area->CircularAreaOperations),
            circular_area_operations) *
      UCharArray::mixed_full(data_buffer, area_length, physical) *
      GlobalStrings(LitMap)
    */

    if (circular_area->writeidx + data_length <= circular_area->area_length) {
        return RET_FALSE;
    } else {
        return RET_TRUE;
    }
}
