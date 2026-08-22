#ifndef IP_CDUTOSMUFRAMEPACK_H
#define IP_CDUTOSMUFRAMEPACK_H

#include <stdio.h> // 示例: 添加通用头文件

#include "common.h"

/* --- 类型定义 --- */
typedef struct TAG_SMU_LVDS_FRAME_CDU_SEND
{
    unint08 frmNum;             /* 帧计数, 0~255循环计数 */

    unint08 cntDataItem3;       /* 第3项数据有效标示维持节拍, 前方地形是否安全 */
    unint08 cntDataItem4;       /* 第4项数据有效标示维持节拍, 路径规划标识 */
    unint08 cntDataItem5;       /* 第5项数据有效标示维持节拍, 运动计次 */
    unint08 cntDataItem7;       /* 第7项数据有效标示维持节拍, 坐标系下的位置（X,Y,Z） */
    unint08 cntDataItem8;       /* 第8项数据有效标示维持节拍, 坡面角1 */
    unint08 cntDataItem9;       /* 第9项数据有效标示维持节拍, 坡面角2 */
    unint08 cntDataItem10;      /* 第10项数据有效标示维持节拍, 前进距离d和前进方向θ */
    unint08 cntDataItem14;      /* 第14项数据有效标示维持节拍, 障碍物信息 */

    /* 数据区 */
    unint08 data[SMU_LVDS_SEND_FRAME_LEN];  /* 数据帧长1024字节 */
} SFrameCduSend;

/* --- 全局变量定义 --- */

/* --- 函数原型 --- */
void CduToSmuFramePack(SFrameCduSend *frameCduSend);

#endif // IP_CDUTOSMUFRAMEPACK_H