#include "../../../../FloatTest/ref/orbiter_support.h"
#include "../../../../INPUT/orbiter-new/CruPack/IP_CruPack.h"

uint32_t bFlyNotWalk;
static uint8_t payload[2];
static uint32_t first_after;
static uint32_t pack_calls, pack_ptr_ok, pack_table_length, pack_data_length;
static uint32_t checksum_calls, checksum_ptr_ok, checksum_length;

void AutuPackDataflow(uint8_t *dst, AUTOPACK *table, uint32_t *first,
                      uint32_t table_length, uint32_t data_length)
{
    ++pack_calls;
    pack_ptr_ok = dst == &sCrucialSave.saveBuff[1] &&
        table == (bFlyNotWalk == TRUE32 ? &CRUPK_FLY[0] : &CRUPK_WALK[0]) &&
        first == &sCrucialSave.firstTime;
    pack_table_length = table_length; pack_data_length = data_length;
    dst[0] = payload[0]; dst[1] = payload[1]; *first = first_after;
}
uint8_t CheckSumAdd08(const uint8_t *data, uint32_t length)
{
    ++checksum_calls; checksum_ptr_ok = data == &sCrucialSave.saveBuff[0];
    checksum_length = length;
    uint32_t sum = 0; for (uint32_t i = 0; i < length; ++i) sum += data[i];
    return (uint8_t)sum;
}

#include "../../../../INPUT/orbiter-new/CruPack/IP_CruPack.c"

int main(int argc, char **argv)
{
    static const uint32_t modes[7] = {3u,4u,5u,6u,7u,8u,99u};
    unsigned long count = ft_count_arg(argc, argv);
    uint64_t state = ft_seed_arg(argc, argv);
    for (unsigned long row = 0; row < count; ++row) {
        bFlyNotWalk = row % 3u;
        uint32_t mode = modes[row % 7u];
        uint64_t time_bits = ft_prng_next(&state), times[6];
        for (uint32_t i = 0; i < 6u; ++i) times[i] = ft_prng_next(&state);
        uint64_t tmp_before = ft_prng_next(&state);
        uint32_t first_before = (uint32_t)ft_prng_next(&state);
        first_after = (uint32_t)ft_prng_next(&state);
        payload[0] = (uint8_t)ft_prng_next(&state); payload[1] = (uint8_t)ft_prng_next(&state);
        uint8_t background = (uint8_t)ft_prng_next(&state);
        memset(sCrucialSave.saveBuff, background, sizeof sCrucialSave.saveBuff);
        sTime.sstime = ft_from_bits64(time_bits);
        sModeProcess.t30 = ft_from_bits64(times[0]); sModeProcess.t40 = ft_from_bits64(times[1]);
        sModeProcess.t50 = ft_from_bits64(times[2]); sModeProcess.t60 = ft_from_bits64(times[3]);
        sModeProcess.t70 = ft_from_bits64(times[4]); sModeProcess.t8 = ft_from_bits64(times[5]);
        sCrucialSave.tmpTime = ft_from_bits64(tmp_before);
        sCrucialSave.firstTime = first_before; sGncCtrlFlag.BZ1 = mode;
        pack_calls = pack_ptr_ok = pack_table_length = pack_data_length = 0;
        checksum_calls = checksum_ptr_ok = checksum_length = 0;

        printf("%" PRIu32 " %" PRIu32 " %" PRIu64, bFlyNotWalk, mode, time_bits);
        for (uint32_t i = 0; i < 6u; ++i) printf(" %" PRIu64, times[i]);
        printf(" %" PRIu64 " %" PRIu32 " %" PRIu32 " %u %u %u",
               tmp_before, first_before, first_after, payload[0], payload[1], background);
        CruPack();
        printf(" %" PRIu64 " %" PRIu64 " %" PRIu32 " %u %u %u %u %u %u",
               ft_bits64(sCrucialRest.tim), ft_bits64(sCrucialSave.tmpTime),
               sCrucialSave.firstTime, sCrucialSave.saveBuff[0], sCrucialSave.saveBuff[1],
               sCrucialSave.saveBuff[2], sCrucialSave.saveBuff[3],
               sCrucialSave.saveBuff[446], sCrucialSave.saveBuff[447]);
        printf(" %" PRIu32 " %" PRIu32 " %" PRIu32 " %" PRIu32
               " %" PRIu32 " %" PRIu32 " %" PRIu32 "\n",
               pack_calls, pack_ptr_ok, pack_table_length, pack_data_length,
               checksum_calls, checksum_ptr_ok, checksum_length);
    }
    return 0;
}
