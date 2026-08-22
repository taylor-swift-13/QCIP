#include "IP_CduToSmuFramePack.h"

// =======================================================
// 函数实现
// =======================================================

void CduToSmuFramePack(SFrameCduSend *frameCduSend)
{
    /* 飞跃器CDU对SMU发送数据格式:
       ┌──────────┬───────────┬───────────┬───────────┬────────────────────────────────────────────────────┬──────────┐
       │          │           │           │           │                         数据域                     │          │
       │          │           │           │           ├───────────┬────────────────────────────────────────┤          │
       │  数据头  │  目标地址 │   源地址  │  数据长度 │           │                数据内容                │   校验和 │
       │          │           │           │           │  数据类型 ├───────────────┬─────────┬──────────────┤          │
       │          │           │           │           │           │  数据有效标志 │  帧计数 │  有效数据域  │          │
       ├──────────┼───────────┼───────────┼───────────┼───────────┼───────────────┼─────────┼──────────────┼──────────┤
       │   2Bytes │  1Byte    │    1Byte  │   2Bytes  │    1Byte  │     2Byte     │   1Byte │   1013Bytes  │  1Byte   │
       └──────────┴───────────┴───────────┴───────────┴───────────┴───────────────┴─────────┴──────────────┴──────────┘
    */

    /* 1~2, 数据头：固定位0xEB95 */
    frameCduSend->data[0] = 0xEB;
    frameCduSend->data[1] = 0x95;

    /* 3~3, 目标地址：目标地址用于标识数据接收方，SMU为0xCC，CDU为0x38； */
    frameCduSend->data[2] = SMU_LVDS_ADDR_SMU;

    /* 4~4, 源地址：源地址用于标识数据发送方，SMU为0xCC，CDU为0x38； */
    frameCduSend->data[3] = SMU_LVDS_ADDR_CDU;

    /* 5~6, 数据长度：数据域内容长度（字节数），GNC向数管传输帧的数据长度固定为1017字节（0x03F9）； */
    frameCduSend->data[4] = 0x03;
    frameCduSend->data[5] = 0xF9;

    /* 7~7, 数据类型：用于表示传输数据类型，GNC向数管传输数据为规划、姿态数据，固定为0x44； */
    frameCduSend->data[6] = 0x44;

    /* 10~10, 帧计数：0~255循环计数 */
    frameCduSend->data[9] = frameCduSend->frmNum;
    frameCduSend->frmNum = (frameCduSend->frmNum + 1u) & 0xFFu;     /* 帧计数更新 */

    /* 8~8, 数据有效标志01 */
    /* 9~9, 数据有效标志02 */
    /* 11~1023, 有效数据域 */
    CduToSmuFrameDataPack(&frameCduSend->data[10], &frameCduSend->data[7], &frameCduSend->data[8]);

    /* 1024, 校验和(校验范围为数据域内容) */
    frameCduSend->data[SMU_LVDS_SEND_FRAME_LEN-1] = CheckSumAdd08(&frameCduSend->data[6], (SMU_LVDS_SEND_FRAME_LEN-7));

    return;
}