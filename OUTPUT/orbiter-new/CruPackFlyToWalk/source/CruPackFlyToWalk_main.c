#include "../../../../FloatTest/ref/orbiter_support.h"
#include "../../../../INPUT/orbiter-new/CruPackFlyToWalk/IP_CruPackFlyToWalk.h"

static uint8_t payload[3];
static uint32_t first_after;
static uint32_t pack_calls;
static uint32_t pack_ptr_ok;
static uint32_t pack_table_length;
static uint32_t pack_data_length;
static uint32_t checksum_calls;
static uint32_t checksum_ptr_ok;
static uint32_t checksum_length;

void AutuPackDataflow(uint8_t *dst, AUTOPACK *table, uint32_t *first,
                      uint32_t table_length, uint32_t data_length)
{
    ++pack_calls;
    pack_ptr_ok = dst == &sCrucialSave.saveBuff[CRU_FLYTOWALK_START + 1] &&
                  table == &CRUPK_FLYTOWALK[0] && first == &sCrucialSave.firstTime3To2;
    pack_table_length = table_length;
    pack_data_length = data_length;
    dst[0] = payload[0]; dst[1] = payload[1]; dst[2] = payload[2];
    *first = first_after;
}

uint8_t CheckSumAdd08(const uint8_t *data, uint32_t length)
{
    ++checksum_calls;
    checksum_ptr_ok = data == &sCrucialSave.saveBuff[CRU_FLYTOWALK_START];
    checksum_length = length;
    uint32_t sum = 0;
    for (uint32_t i = 0; i < length; ++i) sum += data[i];
    return (uint8_t)sum;
}

#include "../../../../INPUT/orbiter-new/CruPackFlyToWalk/IP_CruPackFlyToWalk.c"

int main(int argc, char **argv)
{
    unsigned long count = ft_count_arg(argc, argv);
    uint64_t state = ft_seed_arg(argc, argv);
    for (unsigned long row = 0; row < count; ++row) {
        uint64_t time_bits = row == 0u ? 0u : ft_prng_next(&state);
        uint32_t first_before = (uint32_t)ft_prng_next(&state);
        first_after = (uint32_t)ft_prng_next(&state);
        for (uint32_t i = 0; i < 3u; ++i) payload[i] = (uint8_t)ft_prng_next(&state);
        uint8_t background = (uint8_t)ft_prng_next(&state);
        memset(sCrucialSave.saveBuff, background, sizeof sCrucialSave.saveBuff);
        sCrucialSave.firstTime3To2 = first_before;
        sTime.sstime = ft_from_bits64(time_bits);
        pack_calls = pack_ptr_ok = pack_table_length = pack_data_length = 0;
        checksum_calls = checksum_ptr_ok = checksum_length = 0;

        CruPackFlyToWalk();

        printf("%" PRIu64 " %" PRIu32 " %" PRIu32 " %u %u %u %u",
               time_bits, first_before, first_after, payload[0], payload[1], payload[2], background);
        printf(" %" PRIu64 " %" PRIu32 " %u %u %u %u %u %u %u",
               ft_bits64(sCrucialRest.tim), sCrucialSave.firstTime3To2,
               sCrucialSave.saveBuff[448], sCrucialSave.saveBuff[449],
               sCrucialSave.saveBuff[450], sCrucialSave.saveBuff[451],
               sCrucialSave.saveBuff[452], sCrucialSave.saveBuff[510],
               sCrucialSave.saveBuff[511]);
        printf(" %" PRIu32 " %" PRIu32 " %" PRIu32 " %" PRIu32
               " %" PRIu32 " %" PRIu32 " %" PRIu32 "\n",
               pack_calls, pack_ptr_ok, pack_table_length, pack_data_length,
               checksum_calls, checksum_ptr_ok, checksum_length);
    }
    return 0;
}
