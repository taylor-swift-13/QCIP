#include "../../../../FloatTest/ref/orbiter_support.h"

static uintptr_t write_addr[2];
static uint32_t write_value[2];
static uint32_t write_count;

static void ft_addr_write(uintptr_t address, uint32_t value)
{
    if (write_count < 2u) {
        write_addr[write_count] = address;
        write_value[write_count] = value;
    }
    ++write_count;
}

#define ADDR_WRITE(address, value) ft_addr_write((uintptr_t)(address), (uint32_t)(value))
#include "../../../../INPUT/orbiter-new/ClearIntFromDsp/IP_ClearIntFromDsp.c"

int main(int argc, char **argv)
{
    unsigned long count = ft_count_arg(argc, argv);
    uint64_t state = ft_seed_arg(argc, argv);
    for (unsigned long row = 0; row < count; ++row) {
        uint32_t tag = (uint32_t)ft_prng_next(&state);
        write_addr[0] = write_addr[1] = (uintptr_t)tag;
        write_value[0] = write_value[1] = tag;
        write_count = 0;
        ClearIntFromDsp();
        printf("%" PRIu32 " %" PRIu32 " %" PRIuPTR " %" PRIu32
               " %" PRIuPTR " %" PRIu32 "\n",
               tag, write_count, write_addr[0], write_value[0],
               write_addr[1], write_value[1]);
    }
    return 0;
}
