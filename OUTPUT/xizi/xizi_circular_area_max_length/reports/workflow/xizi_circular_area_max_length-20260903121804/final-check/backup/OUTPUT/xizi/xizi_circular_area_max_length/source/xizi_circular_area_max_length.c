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
/*@ Extern Coq
      (CircularAreaLogicalState : Z -> Z -> Z -> Z -> list Z -> list (option Z) -> Prop)
      (CircularAreaBackingResource : Z -> Z -> Z -> Z -> Z -> Z -> Z -> list Z -> list (option Z) -> Assertion)
      (CircularAreaGetMaxLengthResult : Z -> Z -> Z -> Prop)
*/

uint32 CircularAreaGetMaxLength(CircularAreaType circular_area)
/*@ With entry_circular_area data_buffer readidx writeidx area_length b_status operations logical physical
    Require
      (circular_area == entry_circular_area &&
       entry_circular_area == 0 && emp) ||
      (circular_area == entry_circular_area &&
       entry_circular_area != 0 &&
       CircularAreaBackingResource(entry_circular_area, data_buffer,
                                   readidx, writeidx, area_length, b_status,
                                   operations, logical, physical))
    Ensure
      (entry_circular_area != 0 &&
       CircularAreaGetMaxLengthResult(entry_circular_area, area_length, __return) &&
       CircularAreaBackingResource(entry_circular_area, data_buffer,
                                   readidx, writeidx, area_length, b_status,
                                   operations, logical, physical)) ||
      (entry_circular_area == 0 &&
       CircularAreaGetMaxLengthResult(entry_circular_area, area_length, __return) &&
       emp)
*/
{
    NULL_PARAM_CHECK(circular_area);

    /*@ Assert
          circular_area == entry_circular_area &&
          circular_area != 0 &&
          data_buffer != 0 &&
          CircularAreaLogicalState(readidx, writeidx, area_length, b_status,
                                   logical, physical) &&
          store(&(circular_area -> data_buffer), data_buffer) *
          store(&(circular_area -> readidx), readidx) *
          store(&(circular_area -> writeidx), writeidx) *
          store(&(circular_area -> p_head), data_buffer) *
          store(&(circular_area -> p_tail), data_buffer + area_length) *
          store(&(circular_area -> area_length), area_length) *
          store(&(circular_area -> b_status), b_status) *
          store(&(circular_area -> CircularAreaOperations), operations) *
          UCharArray::mixed_full(data_buffer, area_length, physical)
    */
    return circular_area->area_length;
}
