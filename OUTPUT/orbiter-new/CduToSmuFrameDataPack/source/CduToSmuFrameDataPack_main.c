#include "../../../../FloatTest/ref/orbiter_support.h"
#include "../../../../INPUT/orbiter-new/CduToSmuFrameDataPack/IP_CduToSmuFrameDataPack.h"

#define RAD2DEG (180.0 / 3.14159265358979323846264338327950288)

struct {
    uint32_t SMUWIFIreleaseFlag, SMUFWSafeIF, SMUPathPlanFlag, SMUMoveNum;
    double SMUSlopeAgl1, SMUSlopeAgl2, SMUd, SMUTurnAgl;
} sAlignToSmu;
struct { uint32_t bRecvWifiShakeSig; } sSmuLvdsCtrl;

#include "../../../../INPUT/orbiter-new/CduToSmuFrameDataPack/IP_CduToSmuFrameDataPack.c"

int main(int argc, char **argv)
{
    unsigned long count = ft_count_arg(argc, argv);
    uint64_t state = ft_seed_arg(argc, argv);
    for (unsigned long row = 0; row < count; ++row) {
        uint32_t x[20];
        x[0] = (uint32_t)ft_prng_next(&state);               /* tilt */
        x[1] = row % 5u == 0u ? 0xaau : (uint8_t)ft_prng_next(&state);
        x[2] = (uint32_t)(ft_prng_next(&state) & 3u);        /* wifi release */
        x[3] = (uint32_t)(ft_prng_next(&state) & 1u);        /* recv shake */
        x[4] = (uint32_t)ft_prng_next(&state);               /* safe */
        x[5] = (uint32_t)ft_prng_next(&state);               /* path */
        x[6] = (uint32_t)ft_prng_next(&state);               /* move */
        x[7] = (uint32_t)ft_prng_next(&state);               /* task */
        x[8] = (uint32_t)ft_prng_next(&state);               /* fault */
        x[9] = (uint32_t)ft_prng_next(&state);               /* stop */
        x[10] = (uint32_t)ft_prng_next(&state);              /* haznum */
        x[11] = (uint8_t)ft_prng_next(&state); x[12] = (uint8_t)ft_prng_next(&state);
        for (uint32_t i = 13; i < 20; ++i) x[i] = (uint32_t)(ft_prng_next(&state) % 3u);

        sWalkSendData.tiltAlarm = x[0]; sWalkRecData.WIFIHshakeSig = (uint8_t)x[1];
        sAlignToSmu.SMUWIFIreleaseFlag = x[2]; sSmuLvdsCtrl.bRecvWifiShakeSig = x[3];
        sAlignToSmu.SMUFWSafeIF = x[4]; sAlignToSmu.SMUPathPlanFlag = x[5];
        sAlignToSmu.SMUMoveNum = x[6]; sWalkModeData.TaskNumber = x[7];
        sWalkSendData.MFaultFlag = x[8]; sWalkSendData.MstopFlag = x[9];
        sWalkSendData.Haznum = x[10];
        for (uint32_t i = 0; i < 1800u; ++i)
            sWalkSendData.HazIfin[i] = (uint8_t)(x[11] + i * x[12]);
        sFrameCduSend.cntDataItem3 = (uint8_t)x[13];
        sFrameCduSend.cntDataItem4 = (uint8_t)x[14];
        sFrameCduSend.cntDataItem5 = (uint8_t)x[15];
        sFrameCduSend.cntDataItem8 = (uint8_t)x[16];
        sFrameCduSend.cntDataItem9 = (uint8_t)x[17];
        sFrameCduSend.cntDataItem10 = (uint8_t)x[18];
        sFrameCduSend.cntDataItem14 = (uint8_t)x[19];
        sWalkSendData.r_fyq = sWalkSendData.p_fyq = sWalkSendData.y_fyq = 0.0;
        sWalkSendData.xn = sWalkSendData.yn = sWalkSendData.zn = 0.0;
        sAlignToSmu.SMUSlopeAgl1 = sAlignToSmu.SMUSlopeAgl2 = 0.0;
        sAlignToSmu.SMUd = sAlignToSmu.SMUTurnAgl = 0.0;
        uint8_t data[1013], valid1 = 0xa5u, valid2 = 0x5au;
        memset(data, 0xcc, sizeof data);

        for (uint32_t i = 0; i < 20u; ++i) printf(i ? " %" PRIu32 : "%" PRIu32, x[i]);
        CduToSmuFrameDataPack(data, &valid1, &valid2);
        printf(" %u %u %" PRIu32, valid1, valid2, sSmuLvdsCtrl.bRecvWifiShakeSig);
        printf(" %u %u %u %u %u %u %u", sFrameCduSend.cntDataItem3,
               sFrameCduSend.cntDataItem4, sFrameCduSend.cntDataItem5,
               sFrameCduSend.cntDataItem8, sFrameCduSend.cntDataItem9,
               sFrameCduSend.cntDataItem10, sFrameCduSend.cntDataItem14);
        static const uint32_t pos[19] =
            {0,1,2,3,8,9,14,15,22,23,24,25,32,33,34,35,855,856,1012};
        for (uint32_t i = 0; i < 19u; ++i) printf(" %u", data[pos[i]]);
        putchar('\n');
    }
    return 0;
}
