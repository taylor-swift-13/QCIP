#include <stdint.h>

typedef uint8_t uint8;
typedef uint32_t uint32;
typedef int x_bool;
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
{
    circular_area->writeidx = 0;
    circular_area->readidx = 0;
    circular_area->b_status = RET_FALSE;
}
