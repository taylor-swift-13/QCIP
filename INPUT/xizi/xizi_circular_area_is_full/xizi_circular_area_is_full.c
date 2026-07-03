#include <stdint.h>

typedef uint8_t uint8;
typedef uint32_t uint32;
typedef int x_bool;
typedef struct CircularArea *CircularAreaType;

#define NONE ((void *)0)
#define RET_TRUE 1
#define RET_FALSE 0
#define ERROR (-1)
#define NULL_PARAM_CHECK(p) do { if ((p) == NONE) return ERROR; } while (0)
// #define KPrintf(...) ((void)0)

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

x_bool CircularAreaIsFull(CircularAreaType circular_area)
{
    NULL_PARAM_CHECK(circular_area);

    if ((circular_area->readidx == circular_area->writeidx) &&
        circular_area->b_status) {
        // KPrintf("the circular area is full\n");
        return RET_TRUE;
    } else {
        return RET_FALSE;
    }
}
