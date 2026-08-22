/**
 * @file common.h
 * @brief 自动提取的项目全局宏和枚举定义
 * @note 此文件由 create_common_h.py 脚本自动生成于 2026-05-27 06:26:27
 */

#ifndef AUTO_GENERATED_COMMON_H
#define AUTO_GENERATED_COMMON_H

/* --- 自动提取的宏定义 (MACROS) --- */

#define     PK1FAST            60                  /* 包1快帧 */


#define     PK1MIDDLE1         130                 /* 包1中帧1 */


#define     PK1MIDDLE2         130                 /* 包1中帧2 */


#define     PK1MIDDLE3         200                 /* 包1中帧3 */


#define     PK1MIDDLE4         62                  /* 包1中帧4 */


#define     PK1SLOW1           35                  /* 包1慢帧1 */


#define     PK1SLOW2           45                  /* 包1慢帧2 */


#define     PK1SLOW3           35                  /* 包1慢帧3 */


#define     PK1SLOW4           10                  /* 包1慢帧4 */


#define     PK1SLOW5           64                  /* 包1慢帧5 */


#define     PK1SLOW6           4                   /* 包1慢帧6 */


#define     PK1SLOW7           40                  /* 包1慢帧7 */


#define     PK2FAST            145                 /* 包2快帧 */


#define     PK2MIDDLE1         32                  /* 包2中帧1 */


#define     PK2MIDDLE2         65                  /* 包2中帧2 */


#define     PK2MIDDLE3         165                 /* 包2中帧3 */


#define     PK2MIDDLE4         16                  /* 包2中帧4 */


#define     PK3MIDDLE1         6                   /* 包3中帧1 */


#define     PK3MIDDLE2         6                   /* 包3中帧2 */


#define     PK3MIDDLE3         8                   /* 包3中帧3 */


#define     PK3MIDDLE4         14                  /* 包3中帧4 */


#define     PK3SLOW1           12                  /* 包3慢帧1 */


#define     PK3SLOW2           20                  /* 包3慢帧2 */


#define     PK3SLOW3           8                   /* 包3慢帧3 */


#define     PK3SLOW4           8                   /* 包3慢帧4 */


#define     PK3SLOW5           8                   /* 包3慢帧5 */


#define     PK3SLOW6           8                   /* 包3慢帧6 */


#define     PK3SLOW7           25                  /* 包3慢帧7 */


#define     PK3SLOW8           28                  /* 包3慢帧8 */


#define     PK4FAST            40                  /* 包4快帧 */


#define     PK4SLOW1           90                  /* 包4慢帧1 */


#define     PK4SLOW2           6                   /* 包4慢帧2 */


#define     PK4SLOW3           30                  /* 包4慢帧3 */


#define     PK4SLOW4           80                  /* 包4慢帧4 */


#define     PK4SLOW5           25                  /* 包4慢帧5 */


#define     PK4SLOW6           60                  /* 包4慢帧6 */


#define  FTDI_CMD_ID_GROUND_CHK          0x04     /* 地检指令 */


#define  FTDI_CMD_ID_IMG_TRANS           0x07     /* 传图指令 */


#define  FTDI_CMD_ID_PARAM_SET           0x02     /* 参数设置指令 */


#define  FTDI_CMD_ID_PLTM_TRANS          0x08     /* 平台信息传输指令 */


#define  FTDI_CMD_ID_RESET               0x05     /* 复位指令 */


#define  FTDI_CMD_ID_ROM_BURN            0x03     /* ROM表烧写指令 */


#define  FTDI_CMD_ID_SAFE_POINT          0x09     /* 安全点获取指令 */


#define  FTDI_CMD_ID_SAMPLE              0x06     /* 状态获取指令 */


#define  FTDI_CMD_ID_SAVE_READ           0x0B     /* 存储器读指令 */


#define  FTDI_CMD_ID_SAVE_WRITE          0x0A     /* 存储器写指令 */


#define  FTDI_CMD_ID_TAKE_IMAGE          0x01     /* 单次成像指令 */


#define  FTDI_CMD_LEN_GROUND_TEST        11


#define  FTDI_PK_LEN_PLTM_TRANS          197     /* 发送平台信息数据包数据长度 */


#define  FTDI_PK_LEN_SAFE_POINT          23      /* 安全点获取包数据长度 */


#define  FTDI_PK_LEN_STATUS              43      /* 状态获取包数据长度 */


#define  FTDI_PLATFORM_MOTION_CYCLE      32      /* 平台运动信息数据缓存节拍数据 */


#define  FTDI_SAMPLE_DELYA_NUM           0x5


#define  FTDI_SYNC_SET_DISABLE           0x02     /* 设置同步禁止 */


#define  FTDI_SYNC_SET_ENABLE            0x01     /* 设置同步使能 */


#define  FTDI_SYNC_SET_NULL              0x00     /* 无动作 */


#define  FTDI_TCCMD_LEN_MAX              0x100   /* 无传图 */


#define  LTPS_CMD_ID_GLOBAL_LASER   0x01    /* 全局感知激光成像指令 */


#define  LTPS_CMD_ID_GLOBAL_TOF     0x11    /* 全局感知TOF成像指令 */


#define  LTPS_CMD_ID_GROUND_CHK     0x13    /* 地检指令 */


#define  LTPS_CMD_ID_PARAM_CAL_TOF  0x17    /* TOF模块标定参数设置指令 */


#define  LTPS_CMD_ID_PARAM_INN_TOF  0x16    /* TOF模块内部参数设置指令 */


#define  LTPS_CMD_ID_PARAM_SET      0x02    /* 激光参数设置指令 */


#define  LTPS_CMD_ID_RESET          0x14    /* 复位指令 */


#define  LTPS_CMD_ID_ROM_BURN       0x03    /* 激光ROM表烧写指令 */


#define  LTPS_CMD_ID_SAMPLE         0x15    /* 状态获取指令 */


#define  LTPS_CMD_ID_TAKEIMG_NULL   0x00    /* 无拍图指令时, 发送状态获取指令 */


#define  LTPS_CMD_ID_TCM_FLEX       0x40    /* 地面的参数设置序列（需要根据地面给的内容自定义发送的id） */


#define  LTPS_CMD_ID_VISO_TOF       0x20    /* 局部感知双字节强度指令（TOF测程成像指令） */


#define  LTPS_CMD_LEN_GROUND_TEST   11


#define  LTPS_CMD_PARAM_NUM         8


#define  LTPS_COM_STORE_NUM         30


#define  LTPS_PK_LEN_STATUS         44      /* 状态获取包数据长度 */


#define  LTPS_WORK_MODE_GLOBAL      0x02    /* 02H：全局 */


#define  LTPS_WORK_MODE_LOCAL       0x03    /* 03H：局部 */


#define  LTPS_WORK_MODE_MILEAGE     0x04    /* 04H：里程计算 */


#define  LTPS_WORK_MODE_NULL        0xFF    /* 无效状态 */


#define  LTPS_WORK_MODE_STANDBY     0x01    /* 01H：待机 */


#define  MRVS_CMD_CALIBRATE         0x3A        /* 标定数据设置指令 */


#define  MRVS_CMD_POWEROFF          0x33        /* 断二次电指令 */


#define  MRVS_CMD_POWERON           0x32        /* 供二次电指令 */


#define  MRVS_CMD_RESERVER2         0x39        /* 预留指令2 */


#define  MRVS_CMD_RESET             0x38        /* 复位指令 */


#define  MRVS_CMD_SAMPLE            0x36        /* 取数指令 */


#define  MRVS_CMD_STANDBY           0x31        /* 待机指令 */


#define  MRVS_CMD_SYNC              0x34        /* 同步指令 */


#define  MRVS_CMD_WORK              0x35        /* 工作指令 */


#define  MRVS_CMD_WORKATT           0x37        /* 工作指令（衰减） */


#define  MRVS_SAMPLE_DATA_LEN       (21)        /* 取数指令返回数据长度为21字节 */


#define  OTS_BINOCULAR_ALL          0xFF    /* 双目 */


#define  OTS_BINOCULAR_LEFT         0x0F    /* 左目 */


#define  OTS_BINOCULAR_RIGHT        0xF0    /* 右目 */


#define  OTS_CMD_ID_DISPARITY       0x23    /* 双目视差指令 */


#define  OTS_CMD_ID_FLASH           0x2C    /* FLASH 管理指令 */


#define  OTS_CMD_ID_GROUND_CHK      0x29    /* 地检控制指令 */


#define  OTS_CMD_ID_IMG_TRANS       0x2B    /* 取图指令 */


#define  OTS_CMD_ID_PARAM_CAL       0x2D    /* 标定参数设置指令 */


#define  OTS_CMD_ID_PARAM_INN       0x22    /* 内部参数设置指令 */


#define  OTS_CMD_ID_RESET           0x21    /* 复位指令 */


#define  OTS_CMD_ID_SAMPLE          0x2A    /* 遥测取数指令 */


#define  OTS_CMD_ID_TAKEIMG_NULL    0x00    /* 无拍图指令时, 发送状态获取指令 */


#define  OTS_CMD_ID_TAKE_IMAGE      0x25    /* 拍图指令 */


#define  OTS_CMD_LEN_GROUND_TEST    11


#define  OTS_CMD_PARAM_NUM          10


#define  OTS_PK_LEN_TMRY            40      /* 遥测取数包数据长度 */


#define  OTS_WORK_MODE_NULL         0xFF    /* 无效状态 */


#define  OTS_WORK_MODE_STANDBY      0x01    /* 01H,待机 */


#define  OTS_WORK_MODE_TERRAIN      0x04    /* 05H,地形工作 */


#define  SMU_LVDS_ADDR_CDU              0x38    /* CDU的通讯地址 */


#define  SMU_LVDS_ADDR_SMU              0xCC    /* SMU的通讯地址 */


#define  SMU_LVDS_B_PDU_BITFLOW_LEN     876u    /* B-PDU位流数据区长度, 876字节 */


#define  SMU_LVDS_OBSTACLE_FIRST_PK     979u    /* CDU向SMU发送的第14项数据第一帧长度 */


#define  SMU_LVDS_OBSTACLE_TOTAL_LEN    1801u   /* CDU向SMU发送的第14项数据总长度 */


#define  SMU_LVDS_RECV_FRAME_LEN        256u    /* CDU从SMU接收数据帧总长度 */


#define  SMU_LVDS_SEC_ARC_30            (30.0/3600.0)   /* 30角秒 */


#define  SMU_LVDS_SEND_FRAME_LEN        1024u   /* CDU向SMU发送数据帧总长度 */


#define  ZLQ_CCU_RECV_DATA_LEN      92      /* 接收数据长度, 字节 */


#define ABNORMAL_DATA_FTDI              9                   /* FTDI通讯故障 */


#define ABNORMAL_DATA_IMUA              5                   /* IMUa通讯故障 */


#define ABNORMAL_DATA_IMUB              6                   /* IMUb通讯故障 */


#define ABNORMAL_DATA_LTPS              7                   /* LTPS通讯故障 */


#define ABNORMAL_DATA_MRVS1             10                  /* MRVS1通讯故障 */


#define ABNORMAL_DATA_MRVS2             11                  /* MRVS2通讯故障 */


#define ABNORMAL_DATA_MRVS3             12                  /* MRVS3通讯故障 */


#define ABNORMAL_DATA_MRVS4             13                  /* MRVS4通讯故障 */


#define ABNORMAL_DATA_OTS               8                   /* OTS通讯故障 */


#define ABNORMAL_DATA_SMU_LVDSA         1                   /* SMU主LVDS通讯故障 */


#define ABNORMAL_DATA_SMU_LVDSB         2                   /* SMU备LVDS通讯故障 */


#define ABNORMAL_DATA_STSA              3                   /* STSa通讯故障 */


#define ABNORMAL_DATA_STSB              4                   /* STSb通讯故障 */


#define ABNORMAL_DATA_ZLCCCU            14                  /* 着陆器CCU通讯故障 */


#define ATT_HISTORY_BUFF_NUM                10      /* 历史姿态数据缓存拍数 */


#define BIT_NULL              (0u)              /* 无位操作 */


#define BIT_TO_BOOL(bit)                    (((bit) == 1) ? TRUE32 : FALSE32)


#define BOOL_TO_BIT(boolFlg)                (((boolFlg) == TRUE32) ? 1u : 0u)


#define CDU_DUTY_OFF                    0x01        /* 不当班 */


#define CDU_DUTY_ON                     0x00        /* 当班 */


#define CDU_FORCE_DUTY_OFF              0x00        /* 非强制当班 */


#define CDU_FORCE_DUTY_ON               0x01        /* 强制当班 */


#define CDU_MODULE_A                    0x000       /* 000b-A机 */


#define CDU_MODULE_B                    0x001       /* 001b-B机 */


#define CDU_MODULE_C                    0x002       /* 010b-C机 */


#define CDU_POWER_OFF                   0x00        /* 未加电 */


#define CDU_POWER_ON                    0x01        /* 加电 */


#define COM_ENA_TF            (0x0802u)         /* 通讯使能状态 */


#define CONVERTE_FLOAT_20BIT  (0x8014u)         /* float转为20bit整数 */


#define CONVERTE_FLOAT_23BIT  (0x8017u)         /* float转为23bit整数 */


#define CRC_16_CCITT                0x1021


#define CRC_INIT_CODE               0xFFFF


#define CRU_FLYTOWALK_MAPTABLE_LENGTH   13                               /* 飞跃转行走重要数据装订表长度 */


#define CRU_FLYTOWALK_START             CRU_TOTAL_LENGTH_CRUDATA         /* 三机转两机起始位置因为已经有填充，就无需隔离区了，起始打包位置 */


#define CRU_FLY_MAPTABLE_LENGTH         208                              /* 飞跃重要数据装订表长度 */


#define CRU_RESTORE_RESULT_FAIL         0xFF        /* 恢复失败 */


#define CRU_RESTORE_RESULT_NULL         0x00        /* 未恢复 */


#define CRU_RESTORE_RESULT_SUCC         0x55        /* 常规重要数据恢复成功 */


#define CRU_RESTORE_RESULT_SUCC_3TO2    0xAA        /* 三机转两机重要数据恢复成功 */


#define CRU_RESTORE_STAGE_ALGOR         0x55        /* 重要数据恢复算法 */


#define CRU_RESTORE_STAGE_NULL          0x00        /* 未进行恢复或恢复完成 */


#define CRU_RESTORE_STAGE_SERV_REQ      0x11        /* 重要数据恢复服务请求状态 */


#define CRU_RESTORE_STAGE_SMU           0x22        /* 从SMU恢复重要数据及星时 */


#define CRU_RESTORE_STAGE_TIME          0x44        /* 重要数据恢复星时 */


#define CRU_RESTORE_STAGE_TR32          0x33        /* 从三取二区恢复重要数据及星时 */


#define CRU_SAVE_CYCLES                 ((unint32)(1.0/T_128MS) + 1)    /* 重要数据保存周期1.0s对应控制周期数 */


#define CRU_TOTAL_LENGTH                512                              /* 存储的重要数据总长度 */


#define CRU_TOTAL_LENGTH_CRUDATA        448                              /* 重要数据长度（常规重要数据长度，排除三机转两机数据的总长度） */


#define CRU_TOTAL_LENGTH_FLYTOWALK      64                               /* 三机转两级的重要数据总长度（最后一块64字节） */


#define CRU_WALK_MAPTABLE_LENGTH        41                               /* 行走重要数据装订表长度 */


#define DBL_TO_FLT_ID         (0x3Au)           /* 将64位双精度浮点数转换为32位单精度浮点数 */


#define DBL_TO_HAF_ID         (0x3Bu)           /* 将64位双精度浮点数转换为16位半精度浮点 */


#define DBL_TO_SI08(x)                          ((siint08)((llong64)(x)))       /* 将64位双精度浮点数转换为8位有符号整型数 */


#define DBL_TO_SI08_ID        (0x36u)           /* 将64位双精度浮点数转换为08位有符号整型数 */


#define DBL_TO_SI16_ID        (0x35u)           /* 将64位双精度浮点数转换为16位有符号整型数 */


#define DBL_TO_SI24_ID        (0x37u)           /* 将64位双精度浮点数转换为3字节整型数补码 */


#define DBL_TO_SI32_ID        (0x34u)           /* 将64位双精度浮点数转换为32位有符号整型数 */


#define DBL_TO_SI64_ID        (0x33u)           /* 将64位双精度浮点数转换为64位有符号整型数 */


#define DBL_TO_UN08_ID        (0x26u)           /* 将64位双精度浮点数转换为08位无符号整型数 */


#define DBL_TO_UN16_ID        (0x25u)           /* 将64位双精度浮点数转换为16位无符号整型数 */


#define DBL_TO_UN24_ID        (0x27u)           /* 将64位双精度浮点数转换为3字节无符号整型数 */


#define DBL_TO_UN32_ID        (0x24u)           /* 将64位双精度浮点数转换为32位无符号整型数 */


#define DBL_TO_UN64_ID        (0x23u)           /* 将64位双精度浮点数转换为64位无符号整型数 */


#define DEBUG_DEV_POWER         0       /* 部件加电状态 */


#define DEBUG_DSP_HPI_RECV      0       /* 与DSP通讯HPI口 */


#define DEBUG_FPGA_SDRAM_FILL   0       /* FPGA的SRAM、SOC的SDRAM内存填充 */


#define DEBUG_IMU_UART_QUAD     0       /* IMU四子样采集 */


#define DEBUG_PARTS_UART        0       /* 部件串口通讯 */


#define DEBUG_SIMULATE_FLY      0       /* 总体模飞状态使能 */


#define DEBUG_SMU_LVDS          0       /* 数管LVDS通讯功能 */


#define DEBUG_SYSTEM_SW         1


#define DEBUG_TASK1             0       /* 任务1调试功能 */


#define DEBUG_TIME_BEGIN(id)    DebugTimeStart((id))


#define DEBUG_TIME_END(id)      DebugTimeElapse((id), TRUE32)   /* 时间监测结束 */


#define DEBUG_TIME_QUERY(id)    DebugTimeElapse((id), FALSE32)  /* 时间监测未结束, 仅查询与任务起始的时间偏移 */


#define DEBUG_TIME_TEST         1       /* 时间测试功能 */


#define DEV_CLR_COMM(status)        (UI32_HILO8_SET((status), DEV_STATUS_BAD))  /* 清除设备通讯状态 */


#define DEV_CLR_HEALTH(status)      (UI32_LOHI8_SET((status), DEV_STATUS_BAD))  /* 清除设备健康状态 */


#define DEV_CLR_ONDUTY(status)      (UI32_LOLO8_SET((status), DEV_STATUS_BAD))  /* 清除设备当班状态 */


#define DEV_CLR_POWER(status)       (UI32_HIHI8_SET((status), DEV_STATUS_BAD))  /* 清除设备加电状态 */


#define DEV_FAULT_DELAY             ((unint32)(64.0/T_128MS) + 1)               /* 设备加电10s-64s进行断电再上电诊断 */


#define DEV_GET_COMM(status)        (UI32_HILO8((status)))                      /* 获取设备通讯状态 */


#define DEV_GET_HEALTH(status)      (UI32_LOHI8((status)))                      /* 获取设备健康状态 */


#define DEV_GET_ONDUTY(status)      (UI32_LOLO8((status)))                      /* 获取设备当班状态 */


#define DEV_GET_POWER(status)       (UI32_HIHI8((status)))                      /* 获取设备加电状态 */


#define DEV_ID_ATTCTRL_A            21      /* 推进姿控电磁阀主分支 */


#define DEV_ID_ATTCTRL_B            22      /* 推进姿控电磁阀备分支 */


#define DEV_ID_FTDI                 7       /* FTDI */


#define DEV_ID_IMU_A                3       /* IMUa */


#define DEV_ID_IMU_B                4       /* IMUb */


#define DEV_ID_LTPS                 5       /* LTPS */


#define DEV_ID_LVF_1                12      /* 高压自锁阀LVF1 */


#define DEV_ID_LVF_2                13      /* 自锁阀LVF2 */


#define DEV_ID_LVF_3                14      /* 自锁阀LVF3 */


#define DEV_ID_LVF_4                15      /* 自锁阀LVF4 */


#define DEV_ID_LVF_5                16      /* 自锁阀LVF5 */


#define DEV_ID_MRVS_1               8       /* MRVS1 */


#define DEV_ID_MRVS_2               9       /* MRVS2 */


#define DEV_ID_MRVS_3               10      /* MRVS3 */


#define DEV_ID_MRVS_4               11      /* MRVS4 */


#define DEV_ID_NULL                 0       /* 无效设备 */


#define DEV_ID_OTS                  6       /* OTS */


#define DEV_ID_RESERVED1            17      /* 预留1 */


#define DEV_ID_RESERVED2            18      /* 预留2 */


#define DEV_ID_RESERVED3            19      /* 预留3 */


#define DEV_ID_RESERVED4            20      /* 预留4 */


#define DEV_ID_STS_A                1       /* STSa */


#define DEV_ID_STS_B                2       /* STSb */


#define DEV_ID_THRUGROUP_1          25      /* 轨控推力器1组 */


#define DEV_ID_THRUGROUP_2          26      /* 轨控推力器2组 */


#define DEV_ID_THRUGROUP_3          27      /* 轨控推力器3组 */


#define DEV_ID_THRULOCK_A           23      /* 推进自锁阀主分支 */


#define DEV_ID_THRULOCK_B           24      /* 推进自锁阀备分支 */


#define DEV_ID_WALKLVDS_A           32      /* 行走LVDS主份接口 */


#define DEV_ID_WALKLVDS_B           33      /* 行走LVDS备份接口 */


#define DEV_ID_ZLQCCU               31      /* 着陆器CCU串口 */


#define DEV_INIT_ERROR_MHK_RATES_A  4u          /* D4, 星敏A的TC_SET_MHK_RATES指令初始设置错误偏移位 */


#define DEV_INIT_ERROR_MHK_RATES_B  5u          /* D5, 星敏B的TC_SET_MHK_RATES指令初始设置错误偏移位 */


#define DEV_INIT_ERROR_MRVS_01      0u          /* D0, MRVS1同步工作序列初始设置错误偏移位 */


#define DEV_INIT_ERROR_MRVS_02      1u          /* D1, MRVS2同步工作序列初始设置错误偏移位 */


#define DEV_INIT_ERROR_MRVS_03      2u          /* D2, MRVS3同步工作序列初始设置错误偏移位 */


#define DEV_INIT_ERROR_MRVS_04      3u          /* D3, MRVS4同步工作序列初始设置错误偏移位 */


#define DEV_NUM_IMU                 2       /* IMU设备总数 */


#define DEV_NUM_MAX                 (DEV_ID_WALKLVDS_B + 1)   /* 设备总数 */


#define DEV_NUM_MRVS                4       /* MRVS设备总数 */


#define DEV_NUM_STS                 2       /* STS设备总数(仅飞跃器星敏) */


#define DEV_NUM_STS_ALL             (DEV_NUM_STS + 3)   /* STS设备总数(包括着陆器3个星敏) */


#define DEV_POWER_DELAY             ((unint32)(10.0/T_128MS) + 1)               /* 设备加电10s对应控制周期数 */


#define DEV_SET_COMM(status)        (UI32_HILO8_SET((status), DEV_STATUS_GOOD)) /* 设置设备通讯状态 */


#define DEV_SET_HEALTH(status)      (UI32_LOHI8_SET((status), DEV_STATUS_GOOD)) /* 设置设备健康状态 */


#define DEV_SET_ONDUTY(status)      (UI32_LOLO8_SET((status), DEV_STATUS_GOOD)) /* 设置设备当班状态 */


#define DEV_SET_POWER(status)       (UI32_HIHI8_SET((status), DEV_STATUS_GOOD)) /* 设置设备加电状态 */


#define DEV_STATUS_BAD              0x00u                                       /* 断电/禁止/不健康/不当班 */


#define DEV_STATUS_GOOD             MASK_LO08                                   /* 加电/使能/健康/当班 */


#define DSP_CMD_CHECKUP_ERROR                   (0xFFFF)


#define DSP_CMD_RESP_DATAID                     (0x8)


#define DSP_RAM_INDATA_ADDR_BASE                (0x80000000)        /* 起始地址 */


#define DSP_RAM_INDATA_ADDR_LEN                 (0x00010000)        /* 长度, 64KB */


#define DSP_RAM_INPROG_ADDR_BASE                (0x00000000)        /* 起始地址 */


#define DSP_RAM_INPROG_ADDR_LEN                 (0x00010000)        /* 长度, 64KB */


#define DSP_SDRAM_ADDR_BASE                     (0x00400000)        /* SDRAM起始地址 */


#define DSP_SDRAM_ADDR_LEN                      (0x01000000)        /* SDRAM长度, 16MB */


#define DSP_SRAM_ADDR_BASE                      (0x04000000)        /* SRAM起始地址 */


#define DSP_SRAM_ADDR_LEN                       (0x00400000)        /* SRAM长度, 4MB */


#define FLT_TO_SI08_ID        (0x32u)           /* 将32位单精度浮点数转换为08位有符号整型数 */


#define FLT_TO_SI16_ID        (0x31u)           /* 将32位单精度浮点数转换为16位有符号整型数 */


#define FLT_TO_SI32_ID        (0x30u)           /* 将32位单精度浮点数转换为32位有符号整型数 */


#define FPGA_BASE                       (0x22000000)


#define FPGA_CAMERA_TYPE_FTDI           0x02                /* 高动态三维避障敏感器 */


#define FPGA_CAMERA_TYPE_LTPS           0x00                /* 激光雷达 */


#define FPGA_CAMERA_TYPE_OTS            0x01                /* 光学地形敏感器 */


#define FPGA_FTDI_SIZE_REG              (FPGA_BASE+0x128)   /* FTDI接收一帧数据量, R */


#define FPGA_IMAGE_SIZE_REG             (FPGA_BASE+0x018)   /* 图像数据大小寄存器, 数据字节数, WR */


#define FPGA_IMG_ID_FTDI_3D                     (0x30)      /* FTDI三维图 */


#define FPGA_IMG_ID_LASER_GLOBAL                (0x00)      /* 激光雷达全局激光数据 */


#define FPGA_IMG_ID_OTS_DISPARITY               (0x20)      /* 光学视差和极线校正图 */


#define FPGA_IMG_ID_OTS_LEFT_EXT                (0x23)      /* 光学左目原图抽点图 */


#define FPGA_IMG_ID_OTS_LEFT_RAW                (0x21)      /* 光学左目原图 */


#define FPGA_IMG_ID_OTS_RIGHT_EXT               (0x24)      /* 光学右目原图抽点图 */


#define FPGA_IMG_ID_OTS_RIGHT_RAW               (0x22)      /* 光学右目原图 */


#define FPGA_IMG_ID_TOF_GLOBAL                  (0x01)      /* 激光雷达全局TOF数据 */


#define FPGA_IMG_ID_TOF_RAW                     (0x03)      /* 激光雷达TOF原图 -- 星上自主不使用 */


#define FPGA_IMG_ID_TOF_VISO                    (0x02)      /* 激光雷达局部双字节强度数据 */


#define FPGA_IMG_PAGE_NUM_MAX           (2560)              /* 每个图像存储块对应2560个页 */


#define FPGA_IMG_SAVE_NUM_MAX           (1638)              /* 接口版应用软件只使nand0，可存储1638个图像存储块 */


#define FPGA_LEN                        (0x02000000)        /* FPGA地址范围, 32MB */


#define FPGA_LTPS_SIZE_REG              (FPGA_BASE+0x120)   /* LTPS接收一帧数据量, R */


#define FPGA_LVDS_DWLD_ENABLE_REG       (FPGA_BASE+0x1A4)   /* SRAM下传使能, W */       /* 写7有效 */


#define FPGA_LVDS_DWLD_FIFO_RESET_REG   (FPGA_BASE+0x1B8)   /* LVDS下传FIFO复位，W */   /* SRAM下传和nand下传共用，写7复位（清fifo） */


#define FPGA_LVDS_DWLD_FINISH_REG       (FPGA_BASE+0x110)   /* SRAM下传完标志, WR */    /* 完成置1，[0]写7清0 */


#define FPGA_LVDS_DWLD_MODE_REG         (FPGA_BASE+0x00C)   /* 模式选择寄存器, WR */    /* SRAM下传和nand页写时需要配置，sram下传需配置为1，nand页写需配置为0 */


#define FPGA_LVDS_RECV_FIFO_RESET_REG   (FPGA_BASE+0x1A8)   /* LVDS接收FIFO复位，W */   /* 写7复位（lvds接收功能复位，包括状态机和fifo） */


#define FPGA_LVDS_RECV_OVER_REG         (FPGA_BASE+0x0E0)   /* LVDS接收完成标志, WR */      /* 接收完成置1，[0]写7清0 */


#define FPGA_OPER_TARGET_DSP            0xBB                /* DSP操作FPGA的SRAM */


#define FPGA_OPER_TARGET_NULL           0x00                /* 不操作或无操作 */


#define FPGA_OPER_TARGET_SOC            0x55                /* SOC操作FPGA的SRAM */


#define FPGA_OTS_SIZE_REG               (FPGA_BASE+0x124)   /* OTS接收一帧数据量, R */


#define FPGA_RESET_DSP_REG              (FPGA_BASE+0x18C)   /* 启动DSP复位, W */        /* 写入7启动 */


#define FPGA_RESET_DSP_TIME_REG         (FPGA_BASE+0x030)   /* DSP复位时间, WR */


#define FPGA_SELECT_CAM_REG             (FPGA_BASE+0x014)   /* 相机选择寄存器, WR */    /* 写D2-D0：000接收LTPS；001接收OTS；010接收FTDI。其他数值无效，均不接受. 详见FPGA_CAMERA_TYPE_LTPS */


#define FPGA_SELECT_SRAM_REG            (FPGA_BASE+0x010)   /* SRAM选择寄存器, WR */    /* 写D1-D0：00选择SRAM0；01选择SRAM1其他选择SRAM0+SRAM1。复位后默认向SRAM0写 */


#define FPGA_SMU_RECV0_BYTES_REG        (FPGA_BASE+0x150)   /* 数管接收0 FIFO数据个数, R */


#define FPGA_SMU_RECV0_CLR_REG          (FPGA_BASE+0x1BC)   /* 数管接收0 FIFO复位, W */                     /* 写7复位, 清数管接收FIFO0 */


#define FPGA_SMU_RECV0_REG              (FPGA_BASE+0x190)   /* 数管接收0 CPU读SMU数据, R */


#define FPGA_SMU_RECV1_BYTES_REG        (FPGA_BASE+0x154)   /* 数管接收1 FIFO数据个数, R */


#define FPGA_SMU_RECV1_CLR_REG          (FPGA_BASE+0x1C0)   /* 数管接收1 FIFO复位, W */                     /* 写7复位, 清数管接收FIFO1 */


#define FPGA_SMU_RECV1_REG              (FPGA_BASE+0x194)   /* 数管接收1 CPU读SMU数据, R */


#define FPGA_SMU_RECV_FIFO_STATUS_REG   (FPGA_BASE+0x14C)   /* 数管接收  FIFO状态, R */     /* 1有效，[0]对应fifo0 empty，[1]对应fifo0 full，[2]对应fifo1 empty，[3]对应fifo1 full */


#define FPGA_SMU_RECV_RESET_REG         (FPGA_BASE+0x1D0)   /* 数管接收模块及fifo复位，两通道同时复位 W */    /* 写7复位, 清两个通道的fifo同时复位接收模块 */


#define FPGA_SMU_SEND_BYTES_REG         (FPGA_BASE+0x158)   /* 数管发送  FIFO数据个数, R */


#define FPGA_SMU_SEND_FIFO_REG          (FPGA_BASE+0x198)   /* 数管发送  FIFO地址, W */


#define FPGA_SMU_SEND_FIFO_STATUS_REG   (FPGA_BASE+0x148)   /* 数管发送  FIFO状态, R */     /* 1有效，[0]对应empty，[1]对应full */


#define FPGA_SMU_SEND_OVER_REG          (FPGA_BASE+0x114)   /* 数管发送  完成标志, WR */    /* 完成置1，[0]写7清0 */


#define FPGA_SMU_SEND_RESET_REG         (FPGA_BASE+0x1D4)   /* 数管发送模块及fifo复位  W */                  /* 写7复位, 清数管发送FIFO、状态机复位 */


#define FPGA_SMU_SEND_START_REG         (FPGA_BASE+0x19C)   /* 数管发送  启动, W */         /* 写7启动 */


#define FPGA_SRAM1_1ST_1M_ADDR          (0x22200000)        /* 图像存储器SRAM1第一个1M区域 */


#define FPGA_SRAM1_2ND_1M_ADDR          (0x22600000)        /* 图像存储器SRAM1第二个1M区域 */


#define FPGA_SRAM1_3RD_1M_ADDR          (0x22A00000)        /* 图像存储器SRAM1第三个1M区域 */


#define FPGA_SRAM1_4TH_1M_ADDR          (0x22E00000)        /* 图像存储器SRAM1第四个1M区域 */


#define FPGA_SRAM2_1ST_1M_ADDR          (0x23200000)        /* 图像存储器SRAM2第一个1M区域 */


#define FPGA_SRAM2_2ND_1M_ADDR          (0x23600000)        /* 图像存储器SRAM2第二个1M区域 */


#define FPGA_SRAM2_3RD_1M_ADDR          (0x23A00000)        /* 图像存储器SRAM2第三个1M区域 */


#define FPGA_SRAM2_4TH_1M_ADDR          (0x23E00000)        /* 图像存储器SRAM2第四个1M区域 */


#define FPGA_SRAM_1M_LEN                (0x00100000)        /* 1MB长度 */


#define FPGA_SRAM_USE_CPU_DSP_REG       (FPGA_BASE+0x3C)    /* CPU/DSP占用SRAM标志, R */ /* D0=1 CPU占用SRAM0  \
                                                                                           D1=1 CPU占用SRAM1  \
                                                                                           D2=1 DSP占用SRAM0  \
                                                                                           D3=1 DSP占用SRAM1 */


#define FPGA_SRAM_USE_SELF_REG          (FPGA_BASE+0x138)   /* FPGA占用SRAM状态, R */    /* D0=1，LVDS接收占用SRAM0 \
                                                                                           D1=1，LVDS接收占用SRAM1 \
                                                                                           D2=1，NAND页写占用SRAM0 \
                                                                                           D3=1，NAND页写占用SRAM1 \
                                                                                           D4=1，LVDS下传占用SRAM0 \
                                                                                           D5=1，LVDS下传占用SRAM1 \
                                                                                           DSP可读，偏移地址相同 */


#define FPGA_THRU_DRV_CTRL_REG          (FPGA_BASE+0x88)    /* 推力器使能控制寄存器, WR, '0' 无效/‘1’有效/复位为‘0’ */


#define FPGA_THRU_ONOFF_MODUL_REG       (FPGA_BASE+0x84)    /* 推力器模式控制寄存器, WR, 开关调制:'0' 开调制/‘1’ 关调制/复位为‘0’ */


#define FPGA_THRU_TIMER_0_3_REG         (FPGA_BASE+0x6C)    /* 推力器定时器寄存器, WR, TIMER0 ~TIMER3, 分别对应CF1/CF2/CF3/CF4 */


#define FPGA_THRU_TIMER_12_15_REG       (FPGA_BASE+0x78)    /* 推力器定时器寄存器, WR, TIMER12~TIMER15, 分别对应FF1/FF2/FF3/FF4 */


#define FPGA_THRU_TIMER_16_19_REG       (FPGA_BASE+0x7C)    /* 推力器定时器寄存器, WR, TIMER16~TIMER19, 分别对应AF1/AF2/AF3/BF1 */


#define FPGA_THRU_TIMER_20_21_DT4_REG   (FPGA_BASE+0x80)    /* 推力器定时器寄存器, WR, TIMER20~TIMER21,D_timer4, 分别对应BF2/BF3/DTIMER4 */


#define FPGA_THRU_TIMER_4_7_REG         (FPGA_BASE+0x70)    /* 推力器定时器寄存器, WR, TIMER4 ~TIMER7, 分别对应DF1/DF2/DF3/DF4  */


#define FPGA_THRU_TIMER_8_11_REG        (FPGA_BASE+0x74)    /* 推力器定时器寄存器, WR, TIMER8 ~TIMER11, 分别对应EF1/EF2/EF3/EF4 */


#define FPGA_THRU_TIMER_DELAY1_REG      (FPGA_BASE+0x94)    /* 推力器定时器延时输出寄存器, WR, Dtimer0~Dtimer3 */


#define FPGA_TIMEOUT_COUNT_REG          (FPGA_BASE+0x004)   /* 超时计数时间寄存器, WR */ /* 写入值为X*25ns内没有收到图像记为LVDS接收超时，复位写1，共32bit */


#define FPGA_TIMEOUT_FTDI_REG           (FPGA_BASE+0x100)   /* FTDI超时标志寄存器, WR */  /* 超时置1，写7清0 */


#define FPGA_TIMEOUT_LTPS_REG           (FPGA_BASE+0x0F8)   /* LTPS超时标志寄存器, WR */  /* 超时置1，写7清0 */


#define FPGA_TIMEOUT_OTS_REG            (FPGA_BASE+0x0FC)   /* OTS超时标志寄存器, WR */   /* 超时置1，写7清0 */


#define FPGA_TIMEOUT_START_REG          (FPGA_BASE+0x178)   /* 启动超时计数寄存器, W */   /* 写7启动 */


#define FPGA_TOUCH_MOON_BITIN_REG       (FPGA_BASE+0x144)   /* 触地位口状态寄存器, WR */        /* D[5：0]触地信号位口滤波后的原始值'0'表示触地，'1'表示未触地（复位值），直接由端口滤波后得到，一直更新 */


#define FPGA_TOUCH_MOON_ENABLE_REG      (FPGA_BASE+0x90)    /* 触地信号使能配置寄存器 */        /* D[5：0]：6个触地信号采集使能'1'表示 触地信号采集使能，'0'表示触地信号采集禁止 \
                                                                                                 D[11：6]：配置m，对应6个触地信号[5:0]1表示选中相应信号，复位值为“111111” \
                                                                                                 D[14：12]：配置n，0≤n≤m≤6，触发中断条件为n≥m,复位值为6 \
                                                                                                 其余位无效，默认为0 */


#define FPGA_TOUCH_MOON_SIGNAL_NUM      6                   /* 触地信号总数 */


#define FPGA_TOUCH_MOON_STATUS_REG      (FPGA_BASE+0x1A0)   /* 触地状态和中断状态寄存器, WR */  /* D[5：0]：触地状态，对应6个触地信号，当位口状态为0并且触地信号使能时有效（置1），触发一次后锁存，除非软件清零；\
                                                                                                 D[6]对应触地中断状态'1'表示触地中断有效，'0'表示触地中断无效， \
                                                                                                 软件清除中断状态和触地状态后，若使能位有效，满足条件后会重复触发中断，写7清除所有状态 */


#define FPGA_TOUCH_MOON_TIMESET_REG     (FPGA_BASE+0x8C)    /* 触地滤波时间和中断延迟时间配置寄存器 */  /* D[15:0]：触地信号滤波时间, 滤波宽度=时间当量*（滤波次数+1），时间当量为100μs，最大6553.6ms \
                                                                                                        D[31:16]：触地关机中断触发延时时间 \
                                                                                                        中断延时=时间当量*（延时计数+1），时间当量为100μs，最大6553.6ms */


#define GET_TIME_CTRLCYCLE()    Drv_Get_Star_Time(1)    /* 1：控制周期锁存星时 */


#define GET_TIME_CURRENT()      Drv_Get_Star_Time(0)    /* 0：软件锁存星时 */


#define GPIO_INT_CLEAR_ADDR             (0xA00D004C)


#define GPT_UNIT                1.0e-6    /* 1us */


#define HISTORY_SUM_NUM            80


#define HPIA_1st                        (0x20000008)      /* HPI地址寄存器 */


#define HPIA_2nd                        (0x2000000C)      /* HPI地址寄存器 */


#define HPIC_1st                        (0x20000000)      /* HPI控制寄存器 */


#define HPIC_2nd                        (0x20000004)      /* HPI控制寄存器 */


#define HPIC_CLR_INT                    (0x0004)          /* 清除DSP中断请求操作码 */


#define HPIC_SET_INT                    (0x0002)          /* SoC2018触发DSP中断操作码 */


#define HPIC_SET_MODE                   (0x0000)          /* 读写先后顺序操作码 */


#define HPIDINCRE_1st                   (0x20000010)      /* HPI数据自增寄存器 */


#define HPIDINCRE_2nd                   (0x20000014)      /* HPI数据自增寄存器 */


#define HPID_1st                        (0x20000018)      /* HPI数据寄存器 */


#define HPID_2nd                        (0x2000001C)      /* HPI数据寄存器 */


#define HPI_INT_STATUS_6017_GPIO40      (0x50000000 + (0x13<<2u))   /* A6017的GPIO[40], 低电平触发 */


#define HPI_INT_STATUS_GPIO5            (0xA00D0000)                /* SOC2018的GPIO[5], 低电平触发 */


#define HPI_REQUEST_CLR()               { ADDR_WRITE(HPIC_1st, HPIC_CLR_INT);    ADDR_WRITE(HPIC_2nd, HPIC_CLR_INT); }    /* 清除:第一步，向HPIC_1st地址写0x0004; 第二步，向HPIC_2nd地址写0x0004 */


#define HPI_REQUEST_SET()               { ADDR_WRITE(HPIC_1st, HPIC_SET_INT);    ADDR_WRITE(HPIC_2nd, HPIC_SET_INT); }    /* 触发:第一步，向HPIC_1st地址写0x0002; 第二步，向HPIC_2nd地址写0x0002 */


#define IMG_DOWNLOAD_DATA_LEN      400


#define IMU_ACCE_ZERO_ESTI_EXE          0x01  /* 表示进行加计零位估计 */


#define IMU_ACCE_ZERO_INITIAL           0x03  /* 表示加计零位为初始装订值 */


#define IMU_ACCE_ZERO_INJECT            0x02  /* 表示地面注入加计零位 */


#define IMU_ACCE_ZERO_NO_PROC           0x00  /* 表示对加计零位不处理 */


#define IMU_CMD_TYPE_MODE_SET           3     /* 工作模式设置 */


#define IMU_CMD_TYPE_QUAD_SAMPLE        0     /* 四子样数据指令 */


#define IMU_CMD_TYPE_RESET              2     /* 复位指令 */


#define IMU_CMD_TYPE_SOLO_SAMPLE        1     /* 单子样数据指令 */


#define IMU_FAULT_MIN_MARK                  16      /* IMU连续故障检测计数器缓存空间, 应大于NIMUFault */


#define IMU_HEAD_NUM                    6


#define IMU_HIS_CACHE_NUM               10     /* 缓存的历史数据拍数 */


#define IMU_MODE_MEASURE01              0     /* 测量模式1（温补，初始工作模式） */


#define IMU_MODE_MEASURE02              1     /* 测量模式2（非温补） */


#define IMU_MODE_SOFT_CHK               3     /* 软地检模式 */


#define IMU_MODE_SOFT_HARD_CHK          2     /* 软硬地检模式 */


#define IMU_OCTO_NUM                    8


#define IMU_PK_LEN_QUAD                 90    /* 四子样采集数据长度 */


#define IMU_PK_LEN_SOLO                 45    /* 单子样采集数据长度 */


#define IMU_SELECT_1_3_5                    0x15    /* 陀螺/加计选择1/3/5掩码 */


#define IMU_SELECT_2_4_6                    0x2A    /* 陀螺/加计选择2/4/6掩码 */


#define IMU_TCCMD_LEN_MAX               4     /* 指令统一为4字节 */


#define INT_NUM_POWER_OFF               (41u)             /* 中断号:41, 触地关机中断 */


#define IN_RANGE_SET10(uiv, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10)  \
    (((uiv) == (v1)) || ((uiv) == (v2)) || ((uiv) == (v3)) || ((uiv) == (v4)) || ((uiv) == (v5)) || ((uiv) == (v6)) || ((uiv) == (v7)) || ((uiv) == (v8)) || ((uiv) == (v9)) || ((uiv) == (v10)))


#define IN_RANGE_SET11(uiv, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11)  \
    (((uiv) == (v1)) || ((uiv) == (v2)) || ((uiv) == (v3)) || ((uiv) == (v4)) || ((uiv) == (v5)) || ((uiv) == (v6)) || ((uiv) == (v7)) || ((uiv) == (v8)) || ((uiv) == (v9)) || ((uiv) == (v10)) || ((uiv) == (v11)))


#define IN_RANGE_SET2(uiv, v1, v2)          (((uiv) == (v1)) || ((uiv) == (v2)))


#define IN_RANGE_SET3(uiv, v1, v2, v3)      (((uiv) == (v1)) || ((uiv) == (v2)) || ((uiv) == (v3)))


#define IN_RANGE_SET4(uiv, v1, v2, v3, v4)  \
    (((uiv) == (v1)) || ((uiv) == (v2)) || ((uiv) == (v3)) || ((uiv) == (v4)))


#define IN_RANGE_SET5(uiv, v1, v2, v3, v4, v5)  \
    (((uiv) == (v1)) || ((uiv) == (v2)) || ((uiv) == (v3)) || ((uiv) == (v4)) || ((uiv) == (v5)))


#define IN_RANGE_SET6(uiv, v1, v2, v3, v4, v5, v6)  \
    (((uiv) == (v1)) || ((uiv) == (v2)) || ((uiv) == (v3)) || ((uiv) == (v4)) || ((uiv) == (v5)) || ((uiv) == (v6)))


#define IN_RANGE_SET7(uiv, v1, v2, v3, v4, v5, v6, v7)  \
    (((uiv) == (v1)) || ((uiv) == (v2)) || ((uiv) == (v3)) || ((uiv) == (v4)) || ((uiv) == (v5)) || ((uiv) == (v6)) || ((uiv) == (v7)))


#define IN_RANGE_SET8(uiv, v1, v2, v3, v4, v5, v6, v7, v8)  \
    (((uiv) == (v1)) || ((uiv) == (v2)) || ((uiv) == (v3)) || ((uiv) == (v4)) || ((uiv) == (v5)) || ((uiv) == (v6)) || ((uiv) == (v7)) || ((uiv) == (v8)))


#define IN_RANGE_SET9(uiv, v1, v2, v3, v4, v5, v6, v7, v8, v9)  \
    (((uiv) == (v1)) || ((uiv) == (v2)) || ((uiv) == (v3)) || ((uiv) == (v4)) || ((uiv) == (v5)) || ((uiv) == (v6)) || ((uiv) == (v7)) || ((uiv) == (v8)) || ((uiv) == (v9)))


#define IO_BIT_IN_NO_JUDGE_FLAG1        16                  /* 16: 三机标志1 */


#define IO_BIT_IN_NO_JUDGE_FLAG2        17                  /* 17: 三机标志2 */


#define IO_BIT_IN_NO_JUDGE_FLAG3        18                  /* 18: 三机标志3 */


#define IO_BIT_IN_NO_ONDUTY_A           8                   /* 8: A机当班标志 */


#define IO_BIT_IN_NO_ONDUTY_A_FORCE     3                   /* 3: 强制A机当班标志 */


#define IO_BIT_IN_NO_ONDUTY_B           9                   /* 9: B机当班标志 */


#define IO_BIT_IN_NO_ONDUTY_B_FORCE     4                   /* 4: 强制B机当班标志 */


#define IO_BIT_IN_NO_ONDUTY_C           10                  /* 10: C机当班标志 */


#define IO_BIT_IN_NO_ONDUTY_C_FORCE     5                   /* 5: 强制C机当班标志 */


#define IO_BIT_IN_NO_ONDUTY_SELF1       6                   /* 6: 自主当班标志1 */


#define IO_BIT_IN_NO_ONDUTY_SELF2       7                   /* 7: 自主当班标志2 */


#define IO_BIT_IN_NO_POWERON_A          11                  /* 11: A机加电标志 */


#define IO_BIT_IN_NO_POWERON_B          12                  /* 12: B机加电标志 */


#define IO_BIT_IN_NO_POWERON_C          13                  /* 13: C机加电标志 */


#define IO_BIT_IN_NO_POWER_FTA          14                  /* 14: FTA机加电标志 */


#define IO_BIT_IN_NO_POWER_FTB          15                  /* 15: FTB机加电标志 */


#define IO_BIT_OUT_NO_FTDI_SYNC         8                   /* 8: FTDI同步信号使能 */


#define IO_BIT_OUT_NO_HIP_CTRL          1                   /* 1: DSP的HPI口访问控制信号 */


#define IO_BIT_OUT_NO_STSA_RTS          2                   /* 2: 星敏1取数信号 */


#define IO_BIT_OUT_NO_STSB_RTS          3                   /* 3: 星敏2取数信号 */


#define IO_BIT_OUT_NO_TPRILE_CMP        0                   /* 0: 三机比对一致标志输出 */


#define IO_BIT_OUT_NO_ZLU_CCU           11                  /* 11: 着陆器CCU串口使能 */


#define IO_SYNC_SIGNAL_TYPE_MRVS        1                   /* 1: MRVS同步信号 */


#define IO_SYNC_SIGNAL_TYPE_STS         3                   /* 3: STS同步信号 */


#define LOG_UI08_TF           (0x0800u)         /* 08位标志量TRUE/FALSE的判断 */


#define LOG_UI32_TF           (0x3200u)         /* 32位标志量TRUE/FALSE的判断, 重要数据解包时必须保证条件TRUE对应比特1 */


#define LVDS_IMG_STAGE_FIRST            0x01                /* 启动图像采集状态, 触发单机图像LVDS传图 */


#define LVDS_IMG_STAGE_FOURTH           0x04                /* 图像存储过程 */


#define LVDS_IMG_STAGE_NULL             0x00                /* 初始状态 */                                  /* ??? 待删除 */


#define LVDS_IMG_STAGE_SECOND           0x02                /* 图像采集完成状态 */


#define LVDS_IMG_STAGE_THIRD            0x03                /* DSP搬图完成状态 */


#define LVDS_TRAN_DIRECT_SARM           0x55                /* 应用软件用FPGA的SRAM下传，不存储直接下传SMU */


#define LVDS_TRAN_OPERATE_NULL          0x00                /* 无操作或操作完成 */


#define MEMRY_COPY            (0x59u)           /* 整段传递源码 */


#define ORIGIN_1BIT           (0x8001u)         /* 原码传递1bit */


#define ORIGIN_1BIT_NULL      (0x8008u)         /* 1bit空位(设置为0) */


#define ORIGIN_2BIT           (0x8002u)         /* 原码传递2bit */


#define ORIGIN_3BIT           (0x8003u)         /* 原码传递3bit */


#define ORIGIN_3BYTE          (0x03u)           /* 原码传递3字节 */


#define ORIGIN_4BIT           (0x8004u)         /* 原码传递4bit */


#define ORIGIN_5BIT           (0x8005u)         /* 原码传递5bit */


#define ORIGIN_6BIT           (0x8006u)         /* 原码传递6bit */


#define ORIGIN_7BIT           (0x8007u)         /* 原码传递7bit */


#define ORIGIN_8BYTE          (0x07u)           /* 原码传递8字节 */


#define ORIGIN_BYTE           (0x01u)           /* 原码传递1字节 */


#define ORIGIN_CODE           (0x00u)           /* 原码传递n字节 */


#define ORIGIN_DWORD          (0x04u)           /* 原码传递4字节 */


#define ORIGIN_NULL           (0x06u)           /* 赋值空位，全部赋值为0 */


#define ORIGIN_VALUE          (0x05u)           /* 立即数赋值 */


#define ORIGIN_WORD           (0x02u)           /* 原码传递2字节 */


#define OTS_DOWNLOAD_LEFT               0x11                /* 下传左目原图 */


#define OTS_DOWNLOAD_NONE               0x00                /* 尚未下传图像 */


#define OTS_DOWNLOAD_RIGHT              0x22                /* 下传右目原图 */


#define POWER_TF              (0x0801u)         /* 加电状态 */


#define RAM_CYCLE_OP_1K_LEN             (0x00000400)      /* 1KB长度, 每周期操作 */


#define RAM_CYCLE_OP_4K_LEN             (0x00001000)      /* 4KB长度, 每周期操作 */


#define RELAY_SAT_ORBIT_NUM        12


#define RT_ADDRESS                          0x01


#define RT_INSTANCE_01                      0


#define SA_BROD_18_TIME_LEN                 3       /* SA18, 接收SMU时间码 */


#define SA_CRU_LEN                          32      /* 重要数据相关子地址长度 */


#define SA_RECV_19_DATACMD_LEN              3       /* SA19, 接收SMU发送的控制与驱动单元数据指令 */


#define SA_RECV_20_THRUTEST_LEN             1       /* SA20, 接收发动机试喷指令 */


#define SA_RECV_21_SMUTIME_LEN              4       /* SA21, 接收SMU器上时间及通知控制与驱动单元回传相对时间 */


#define SA_RECV_22_TCCMD_LEN                125     /* SA22, 接收飞跃器控制与驱动单元遥控数据包 */


#define SA_RECV_23_DATACMD_LEN              1       /* SA23, 接收SMU通知CDU 285N推力器超温数据指令 */


#define SA_RECV_24_DATACMD_LEN              1       /* SA24, 接收SMU通知CDU 285N发动机（完成缓冲移动腿切相）数据指令 */


#define SA_RECV_28_RESET_LEN                1       /* SA28, 复位发送SA21 (内存下传) */


#define SA_RECV_29_RESET_LEN                1       /* SA29, 复位发送SA20 (遥测数据包) */


#define SA_RECV_30_RESET_LEN                1       /* SA30, 复位接收SA22 (遥控数据包) */


#define SA_TRAN_20_TMRY_LEN                 384     /* SA20, 发送飞跃器控制与驱动单元遥测源包 */


#define SA_TRAN_21_MEMDLD_LEN               102     /* SA21, 发送飞跃器控制与驱动单元内存数据 */


#define SA_TRAN_22_VECINFO_LEN              6       /* SA22, 发送中继星矢量和太阳矢量信息 */


#define SA_TRAN_25_RELTIME_LEN              4       /* SA25, 发送控制与驱动单元与SMU相对时间码 */


#define SA_TRAN_29_POLL_LEN                 1       /* SA29, 总线状态检查 */


#define SA_TRAN_31_VECTOR_LEN               1       /* SA31, 方式代码: 发送矢量字 */


#define SHARE_ADDR_BASE                         (0x043FC000)                /* SRAM共享区起始地址 */


#define SHARE_ADDR_TODSP_ATT_POS                (SHARE_ADDR_BASE+0x20)      /* 姿态与位置, 56字节 */


#define SHARE_ADDR_TODSP_ATT_POS_PER            (SHARE_ADDR_BASE+0x60)      /* 感知时刻姿态与位置, 48字节 */


#define SHARE_ADDR_TODSP_HEIGHT_COMP            (SHARE_ADDR_BASE+0x10C)     /* 高程补偿, 8字节 */


#define SHARE_ADDR_TODSP_INJECT_BUFFER          (SHARE_ADDR_BASE+0xA00)     /* DSP相关操作遥控数据包接收数据缓冲区, 256字节 */


#define SHARE_ADDR_TODSP_LPLAN_SENSOR           (SHARE_ADDR_BASE+0x124)     /* 局部感知选用的敏感器, 4字节 */


#define SHARE_ADDR_TODSP_PLAN_MODE              (SHARE_ADDR_BASE+0x11C)     /* 采用的规划模式, 4字节 */


#define SHARE_ADDR_TODSP_PLAN_POS               (SHARE_ADDR_BASE+0xA0)      /* 输出规划位置, 24字节 */


#define SHARE_ADDR_TODSP_PLAN_TARGET_GL         (SHARE_ADDR_BASE+0xC0)      /* 当前全局规划目标点, 32字节 */


#define SHARE_ADDR_TODSP_PLAN_TARGET_LC         (SHARE_ADDR_BASE+0xE0)      /* 当前局部规划目标点, 16字节 */


#define SHARE_ADDR_TODSP_SEND_CMD               (SHARE_ADDR_BASE+0x8)       /* SOC发送指令区, 4字节 */


#define SHARE_ADDR_TODSP_SHELTER_TYPE           (SHARE_ADDR_BASE+0x114)     /* 当前时刻步态的遮挡类型, 4字节 */


#define SHARE_ADDR_TODSP_VP_FIRST_IF            (SHARE_ADDR_BASE+0x120)     /* 是否首帧判断, 4字节 */


#define SHARE_ADDR_TODSP_WALK_MODE              (SHARE_ADDR_BASE+0x118)     /* 行走方式, 4字节 */


#define SHARE_ADDR_TOSOC_AUTO_PLAN              (SHARE_ADDR_BASE+0x144)     /* 自主全局规划标志, 4字节 */


#define SHARE_ADDR_TOSOC_AVOID_OBS              (SHARE_ADDR_BASE+0x250)     /* 自主局部规划标志, 4字节 */


#define SHARE_ADDR_TOSOC_CAM_READY              (SHARE_ADDR_BASE+0x134)     /* 光学地形敏感器的采集状态, 4字节 */


#define SHARE_ADDR_TOSOC_FW_SAFE_IF             (SHARE_ADDR_BASE+0x258)     /* 前方地形安全标志, 4字节 */


#define SHARE_ADDR_TOSOC_GL_PATH_COOR           (SHARE_ADDR_BASE+0x150)     /* 路径点坐标, 144字节 */


#define SHARE_ADDR_TOSOC_GL_PATH_NUM            (SHARE_ADDR_BASE+0x14C)     /* 路径点个数, 4字节 */


#define SHARE_ADDR_TOSOC_GL_PATH_RESULT         (SHARE_ADDR_BASE+0x148)     /* 是否有安全路径（全局规划）, 4字节 */


#define SHARE_ADDR_TOSOC_GL_PERCEP_OVER         (SHARE_ADDR_BASE+0x140)     /* 全局感知指令执行完成, 4字节 */


#define SHARE_ADDR_TOSOC_HAZ_IFIN               (SHARE_ADDR_BASE+0x2C4)     /* 障碍包络信息(根据当量做了解析处理), 1800字节 */


#define SHARE_ADDR_TOSOC_HAZ_NUM                (SHARE_ADDR_BASE+0x2C0)     /* 障碍数量, 4字节 */


#define SHARE_ADDR_TOSOC_LC_PATH_RESULT         (SHARE_ADDR_BASE+0x254)     /* 是否有安全路径（局部规划）, 4字节 */


#define SHARE_ADDR_TOSOC_LC_PERCEP_OVER         (SHARE_ADDR_BASE+0x24C)     /* 局部感知指令执行完成, 4字节 */


#define SHARE_ADDR_TOSOC_LC_TARGET_ATT_POS      (SHARE_ADDR_BASE+0x280)     /* 当前步的局部目标点姿态与位置, 24字节 */


#define SHARE_ADDR_TOSOC_LREADY_1               (SHARE_ADDR_BASE+0x128)     /* Laser模块1数据状态, 4字节 */


#define SHARE_ADDR_TOSOC_MOVE_IMGID             (SHARE_ADDR_BASE+0x14)      /* DSP搬图标识, 4字节 */


#define SHARE_ADDR_TOSOC_PATH_PLAN_FLAG         (SHARE_ADDR_BASE+0x13C)     /* 路径规划标识, 4字节 */


#define SHARE_ADDR_TOSOC_PATH_PLAN_OUTPUT       (SHARE_ADDR_BASE+0x260)     /* 路径规划输出数据（部分）, 32字节 */


#define SHARE_ADDR_TOSOC_RESPONSE_BUFFER        (SHARE_ADDR_BASE+0xB00)     /* DSP相关操作遥控数据包反馈数据缓冲区, 256字节 */


#define SHARE_ADDR_TOSOC_RESP_CMD               (SHARE_ADDR_BASE+0xC)       /* DSP回传指令回复区, 4字节 */


#define SHARE_ADDR_TOSOC_RESP_DATAID            (SHARE_ADDR_BASE+0x0)       /* DSP回传数据项编码区, 8字节, 最多支持8个数据项 */


#define SHARE_ADDR_TOSOC_SOFT_VERSION           (SHARE_ADDR_BASE+0x10)      /* DSP软件版本标示 , 4字节 */


#define SHARE_ADDR_TOSOC_TMRY_ALLDATA           (SHARE_ADDR_BASE+0xC50)     /* DSP算法全数据返回, 4+11*8+22*8 = 268字节 */


#define SHARE_ADDR_TOSOC_TMRY_BUFFER            (SHARE_ADDR_BASE+0xC00)     /* DSP遥测数据区, 64字节 */


#define SHARE_ADDR_TOSOC_TMRY_MGPIF             (SHARE_ADDR_BASE+0xC40)     /* 校核全局规划结果, 4字节 */


#define SHARE_ADDR_TOSOC_TOFREADY_1             (SHARE_ADDR_BASE+0x12C)     /* 全局TOF相机数据状态, 4字节 */


#define SHARE_ADDR_TOSOC_TOFREADY_2             (SHARE_ADDR_BASE+0x130)     /* TOF的采集状态, 4字节 */


#define SHARE_ADDR_TOSOC_WIFI_REL_FLAG          (SHARE_ADDR_BASE+0x138)     /* WIFI相机释放标识, 4字节 */


#define SHARE_ID_TODSP_ATT_POS                  (0x0006)


#define SHARE_ID_TODSP_ATT_POS_PER              (0x0007)


#define SHARE_ID_TODSP_HEIGHT_COMP              (0x000B)


#define SHARE_ID_TODSP_INJECT_BUFFER            (0x0024)


#define SHARE_ID_TODSP_LPLAN_SENSOR             (0x0010)


#define SHARE_ID_TODSP_PLAN_MODE                (0x000E)


#define SHARE_ID_TODSP_PLAN_POS                 (0x0008)


#define SHARE_ID_TODSP_PLAN_TARGET_GL           (0x0009)


#define SHARE_ID_TODSP_PLAN_TARGET_LC           (0x000A)


#define SHARE_ID_TODSP_SEND_CMD                 (0x0002)


#define SHARE_ID_TODSP_SHELTER_TYPE             (0x000C)


#define SHARE_ID_TODSP_VP_FIRST_IF              (0x000F)


#define SHARE_ID_TODSP_WALK_MODE                (0x000D)


#define SHARE_ID_TOSOC_AUTO_PLAN                (0x0018)


#define SHARE_ID_TOSOC_AVOID_OBS                (0x001D)


#define SHARE_ID_TOSOC_CAM_READY                (0x0014)


#define SHARE_ID_TOSOC_FW_SAFE_IF               (0x001F)


#define SHARE_ID_TOSOC_GL_PATH_COOR             (0x001B)


#define SHARE_ID_TOSOC_GL_PATH_NUM              (0x001A)


#define SHARE_ID_TOSOC_GL_PATH_RESULT           (0x0019)


#define SHARE_ID_TOSOC_GL_PERCEP_OVER           (0x0017)


#define SHARE_ID_TOSOC_HAZ_IFIN                 (0x0023)


#define SHARE_ID_TOSOC_HAZ_NUM                  (0x0022)


#define SHARE_ID_TOSOC_LC_PATH_RESULT           (0x001E)


#define SHARE_ID_TOSOC_LC_PERCEP_OVER           (0x001C)


#define SHARE_ID_TOSOC_LC_TARGET_ATT_POS        (0x0021)


#define SHARE_ID_TOSOC_LREADY_1                 (0x0011)


#define SHARE_ID_TOSOC_MOVE_IMGID               (0x0005)


#define SHARE_ID_TOSOC_PATH_PLAN_FLAG           (0x0016)


#define SHARE_ID_TOSOC_PATH_PLAN_OUTPUT         (0x0020)


#define SHARE_ID_TOSOC_RESPONSE_BUFFER          (0x0025)


#define SHARE_ID_TOSOC_RESP_CMD                 (0x0003)


#define SHARE_ID_TOSOC_RESP_DATAID              (0x0001)


#define SHARE_ID_TOSOC_SOFT_VERSION             (0x0004)


#define SHARE_ID_TOSOC_TMRY_ALLDATA             (0x0028)


#define SHARE_ID_TOSOC_TMRY_BUFFER              (0x0026)


#define SHARE_ID_TOSOC_TMRY_MGPIF               (0x0027)


#define SHARE_ID_TOSOC_TOFREADY_1               (0x0012)


#define SHARE_ID_TOSOC_TOFREADY_2               (0x0013)


#define SHARE_ID_TOSOC_WIFI_REL_FLAG            (0x0015)


#define SMU_SERV_REQ_TYPE_CLOSETHRU         0xB7    /* 飞跃器CDU判断飞跃器着陆后关闭285N发动机并告知SMU, 1011 0111b */


#define SMU_SERV_REQ_TYPE_CRURESTORE        0x0A    /* 接收飞跃器控制与驱动单元重要数据及器上时间, 0000 1010b */


#define SMU_SERV_REQ_TYPE_CRUSAVE           0x6A    /* 发送飞跃器控制与驱动单元重要数据, 0110 1010b */


#define SMU_SERV_REQ_TYPE_DIST6M            0x85    /* 飞跃器CDU通知飞跃器SMU距离月面6m, 1000 0101b */


#define SMU_SERV_REQ_TYPE_MEMDWLD           0x75    /* 发送飞跃器控制与驱动单元内存数据, 0111 0101b */


#define SMU_SERV_REQ_TYPE_NULL              0x00    /* 无服务请求 */


#define SMU_SERV_REQ_TYPE_TRANGLIDE         0x91    /* 飞跃器CDU通知飞跃器SMU进入平移段或滑行段, 1001 0001b */


#define SMU_SERV_REQ_TYPE_WIFI_FIRST        0xA5    /* 飞跃器CDU完成全局路径规划并判断具备释放WIFI相机的条件，告知飞跃器SMU, 1010 0101b */


#define SMU_SERV_REQ_TYPE_WIFI_SECOND       0xB5    /* 完成WIFI第一次释放分离并行走1m后，飞跃器CDU告知SMU进行第二次WIFI相机释放分离，告知飞跃器SMU, 1010 0101b */


#define SMU_SERV_REQ_WAIT_7S                ((unint32)(7.0/T_128MS) + 1)      /* 服务请求信号维持7.0s对应控制周期数 */


#define SOC2018_INT_CLEAR_ADDR          (0x3FFF1000+0x284)


#define SOC_1553B_MEM_BASE              (0x29000000)      /* 1553B1, 发送存储区的基地址 */


#define SOC_1553B_REG_BASE              (0xA0040000)      /* 1553B1, 寄存器区的基地址 */


#define SOC_IO_ADDR_BASE                (0x20000000)      /* IO区起始地址 */


#define SOC_IO_ADDR_LEN                 (0x02000000)      /* IO区长度, 32MB */


#define SOC_NORFLASH_ADDR_BASE          (0x08000000)      /* NorFlash起始地址 */


#define SOC_NORFLASH_ADDR_LEN           (0x02000000)      /* NorFlash长度, 32MB */


#define SOC_NORFLASH_OPTYPE_CHKSUM      3                   /* 计算程序区累加和 */


#define SOC_NORFLASH_OPTYPE_NULL        0x55                /* 无操作 */


#define SOC_NORFLASH_OPTYPE_QUERY       2                   /* 查询操作状态 */


#define SOC_NORFLASH_OPTYPE_READ        0                   /* 读操作 */


#define SOC_NORFLASH_OPTYPE_WRITE       1                   /* 写操作 */


#define SOC_NORFLASH_OP_STEP1           0x0                 /* 第1步 查询当前状态 */


#define SOC_NORFLASH_OP_STEP2           0x55                /* 第2步 执行读写操作 */


#define SOC_NORFLASH_OP_STEP3           0xAA                /* 第3步 返回执行结果 */


#define SOC_NORFLASH_RESULT_ERROR       0xAA                /* 执行失败 */


#define SOC_NORFLASH_RESULT_NULL        0x33                /* 尚未执行 */


#define SOC_NORFLASH_RESULT_SUCCESS     0x55                /* 执行成功 */


#define SOC_NORFLASH_RESULT_WORKING     0x77                /* 执行过程中 */


#define SOC_NORFLASH_RETVAL_0           0x00                /* 0x00：正在进行读操作； */


#define SOC_NORFLASH_RETVAL_1           0x01                /* 0x01：正在进行写操作； */


#define SOC_NORFLASH_RETVAL_3           0x03                /* 0x03：正在进行程序区累加和计算操作； */


#define SOC_NORFLASH_RETVAL_4           0x04                /* 0x04：正在进行刷新操作； */


#define SOC_NORFLASH_RETVAL_5           0x05                /* 0x05：正在进行维护/修复操作； */


#define SOC_NORFLASH_RETVAL_7           0x07                /* 0x07：上一操作成功，可以进行新的操作； */


#define SOC_NORFLASH_RETVAL_8           0x08                /* 0x08：在读或者累加和计算过程中出现双错； */


#define SOC_NORFLASH_RETVAL_9           0x09                /* 0x09：本次操作失败，NorFlash或SRAM地址不对齐； */


#define SOC_NORFLASH_RETVAL_A           0x0A                /* 0x0A：本次操作失败，不在NorFlash有效地址空间； */


#define SOC_NORFLASH_RETVAL_B           0x0B                /* 0x0B：本次操作失败，不在SRAM有效地址空间； */


#define SOC_NORFLASH_RETVAL_C           0x0C                /* 0x0C：本次操作失败，mode参数错误； */


#define SOC_NORFLASH_RETVAL_D           0x0D                /* 0x0D：当前操作指令不被执行，正响应其他操作指令。 */


#define SOC_NORFLASH_SAVETCMD_ADDR      (0x08A80400)      /* 存储数据包第1~30包存储区起始地址 */


#define SOC_NORFLASH_SAVETCMD_ERASER    (0x08A80000)      /* 存储数据包第1~30包存储区扇区基址, 512KB对齐 */


#define SOC_NORFLASH_SAVETCMD_LEN       (TCMD_SAVE_PK_LEN*30)   /* 存储数据包第1~30包存储区长度, 30*256字节(每个存储数据包分配256个字节) */


#define SOC_NORFLASH_SAVETIME_ADDR      (0x08A00400)      /* 存储数据包第0包存储区起始地址 */


#define SOC_NORFLASH_SAVETIME_ERASER    (0x08A00000)      /* 存储数据包第0包存储区扇区基址, 512KB对齐 */


#define SOC_NORFLASH_SAVETIME_LEN       (TCMD_SAVE_PK_LEN)/* 存储数据包第0包存储区长度, 256字节 */


#define SOC_NORFLASH_SECTION_SIZE       (0x00080000)      /* NorFlash逻辑扇区大小, 128KB*4 */


#define SOC_SDRAM_ADDR_BASE             (0xC0000000)      /* SDRAM起始地址 */


#define SOC_SDRAM_ADDR_LEN              (0x08000000)      /* SDRAM长度, 128MB */


#define SOC_SDRAM_ANOMALY_TM_ADDR_BASE  (0xC0100000)      /* SDRAM开辟异常状态遥测数据存储缓冲区起始地址 */


#define SOC_SDRAM_ANOMALY_TM_ADDR_LEN   (0x00400000)      /* SDRAM开辟异常状态遥测数据存储缓冲区长度, 4MB */


#define SOC_SDRAM_FTDI_CMD_BUFF_BASE    (0xC0000000)      /* SDRAM开辟用于缓存“单次成像指令”+“平台运动信息指令” */


#define SOC_SDRAM_FTDI_CMD_BUFF_LEN     (0x00001000)      /* SDRAM开辟用于缓存“单次成像指令”+“平台运动信息指令”数据长度, 4KB */


#define SOC_SDRAM_IMUALL_ADDR_BASE      (0xC4500000)      /* SDRAM开辟IMU全数据存储地址 */


#define SOC_SDRAM_IMUALL_ADDR_LEN       (0x00700000)      /* SDRAM开辟IMU全数据存储地址长度, 7MB */


#define SOC_SDRAM_IMUSAVE_ADDR_BASE     (0xC3800000)      /* SDRAM开辟IMU数据存储缓冲区起始地址 */


#define SOC_SDRAM_IMUSAVE_ADDR_LEN      (0x00100000)      /* SDRAM开辟IMU数据存储缓冲区长度, 1MB */


#define SOC_SDRAM_MOVEDATA_ADDR_BASE    (0xC2800000)      /* SDRAM开辟图像数据搬家缓冲区起始地址 */


#define SOC_SDRAM_MOVEDATA_ADDR_LEN     (0x00800000)      /* SDRAM开辟图像数据搬家缓冲区长度, 8MB */


#define SOC_SDRAM_TMPBUFF_ADDR_BASE     (0xC2000000)      /* SDRAM开辟临时缓冲区起始地址 */


#define SOC_SDRAM_TMPBUFF_ADDR_LEN      (0x00800000)      /* SDRAM开辟临时缓冲区长度, 8MB */


#define SOC_SDRAM_TMRYSAVE_ADDR_BASE    (0xC3900000)      /* SDRAM开辟遥测数据存储缓冲区起始地址 */


#define SOC_SDRAM_TMRYSAVE_ADDR_LEN     (0x00C00000)      /* SDRAM开辟遥测数据存储缓冲区长度, 12MB */


#define SOC_SEND_DSP_GLOBAL_COLLECTION          (0x2002)            /* 全局数据处理指令 */


#define SOC_SEND_DSP_GLOBAL_PERCEPTION          (0x2001)            /* 全局感知指令 */


#define SOC_SEND_DSP_GLOBAL_PROCESSION          (0x2003)            /* 全局规划开始指令 */


#define SOC_SEND_DSP_LOCAL_PATHOUT              (0x2007)            /* 局部路径规划输出指令 */


#define SOC_SEND_DSP_LOCAL_PERCEPTION           (0x2005)            /* 局部感知指令 */


#define SOC_SEND_DSP_LOCAL_PROCESSION           (0x2006)            /* 局部路径规划开始指令 */


#define SOC_SEND_DSP_MEM_DOWNLOAD               (0x3003)            /* DSP内存下卸指令 */


#define SOC_SEND_DSP_MEM_MODIFY_1               (0x3001)            /* DSP连续数据内存修改指令 */


#define SOC_SEND_DSP_MEM_MODIFY_2               (0x3002)            /* DSP离散数据内存修改指令 */


#define SOC_SEND_DSP_MOVEIMG_PREIFX             (0x1000u)           /* 指令编号前缀 */


#define SOC_SEND_DSP_NEARTERR_ANALYSIS          (0x2008)            /* 近处地形分析指令 */


#define SOC_SEND_DSP_PARAM_MODIFY               (0x4001)            /* DSP参数修改指令 */


#define SOC_SEND_DSP_SAVEDWLD_CTRL              (0x3004)            /* DSP存储与下传指令 */


#define SOC_SEND_DSP_SDRAM_REFRESH              (0x3005)            /* DSP的SDRAM刷新指令 */


#define SOC_SEND_DSP_TMRY_GET                   (0x5001)            /* DSP遥测获取指令 */


#define SOC_SEND_DSP_WIFI_PROCESSION            (0x2004)            /* WIFI投放分析 */


#define SOC_SRAM_ABNORMAL_BUFF_BASE     (SOC_SRAM_NORFLASH_BUFF_BASE+SOC_SRAM_NORFLASH_BUFF_LEN)/* 异常数据存储缓冲区基址定义 */


#define SOC_SRAM_ABNORMAL_BUFF_LEN      (0x1800)                                                /* 异常数据存储缓冲区大小, 6KB */


#define SOC_SRAM_ABNORMAL_UNIT_LEN      (280)                                                   /* 异常数据单个存储大小, 280字节 */


#define SOC_SRAM_ADDR_BASE              (0x40000000)      /* SRAM起始地址 */


#define SOC_SRAM_ADDR_LEN               (0x00200000)      /* SRAM长度, 2MB */


#define SOC_SRAM_APP_USE_BASE           (SOC_SRAM_ADDR_BASE + 0x0017AC00)


#define SOC_SRAM_NORFLASH_BUFF_0        (SOC_SRAM_ADDR_BASE + 0x0017AB00)                       /* 可用于应用软件NorFLASH数据缓存, 0.25KB, 主要用于NorFlash中程序镜像读写验证使用 */


#define SOC_SRAM_NORFLASH_BUFF_BASE     (SOC_SRAM_STS02_RTS_BASE + SOC_SRAM_STS02_RTS_LEN)      /* NorFlash读写映射的SRAM缓冲区基址定义 */


#define SOC_SRAM_NORFLASH_BUFF_LEN      (0x2000)                                                /* NorFlash读写映射的SRAM缓冲区大小, 8KB */


#define SOC_SRAM_PROG_ADDR_BASE         (SOC_SRAM_APP_USE_BASE)                                 /* SRAM程序注入区起始地址, 仅SRAM区在轨维护使用 */


#define SOC_SRAM_PROG_ADDR_LEN          (0x00020000)                                            /* SRAM程序注入区长度, 128KB */


#define SOC_SRAM_STS01_RTS_BASE         (SOC_SRAM_PROG_ADDR_BASE + SOC_SRAM_PROG_ADDR_LEN)      /* 星敏A RTS取数数据缓冲区基址定义 */


#define SOC_SRAM_STS01_RTS_LEN          (0x2000)                                                /* 星敏A RTS取数数据缓冲区大小, 8KB */


#define SOC_SRAM_STS02_RTS_BASE         (SOC_SRAM_STS01_RTS_BASE + SOC_SRAM_STS01_RTS_LEN)      /* 星敏B RTS取数数据缓冲区基址定义 */


#define SOC_SRAM_STS02_RTS_LEN          (SOC_SRAM_STS01_RTS_LEN)                                /* 星敏B RTS取数数据缓冲区大小, 8KB */


#define SOC_SRAM_TMR_DATACMD19_OFFSET   (SOC_SRAM_TMR_TCCMD_OFFSET + 260)                       /* 三机数据交换:接收区SA19数据指令存放偏移地址 */


#define SOC_SRAM_TMR_DATACMD23_OFFSET   (SOC_SRAM_TMR_TCCMD_OFFSET + 280)                       /* 三机数据交换:接收区SA23数据指令存放偏移地址 */


#define SOC_SRAM_TMR_DATACMD24_OFFSET   (SOC_SRAM_TMR_TCCMD_OFFSET + 300)                       /* 三机数据交换:接收区SA24数据指令存放偏移地址 */


#define SOC_SRAM_TMR_OTHER2_ADDR        (SOC_SRAM_ADDR_BASE + 0x001FD000)                       /* 另另机三机数据交换与比对区 */


#define SOC_SRAM_TMR_OTHER_ADDR         (SOC_SRAM_ADDR_BASE + 0x001FBE00)                       /* 另机三机数据交换与比对区 */


#define SOC_SRAM_TMR_RESULT_ADDR        (SOC_SRAM_ADDR_BASE + 0x001FE200)                       /* 三机数据交换与比对数据结果区 */


#define SOC_SRAM_TMR_SELF_ADDR          (SOC_SRAM_ADDR_BASE + 0x001FAC00)                       /* 本机三机数据交换与比对区 */


#define SOC_SRAM_TMR_TCCMD_OFFSET       (200 * 4)                                               /* 三机数据交换:遥控数据包存放偏移地址 */


#define SOC_SRAM_TR32_ADDR_FST          (SOC_SRAM_TR32_FIRST  + 0x400)


#define SOC_SRAM_TR32_ADDR_FST_VAR(num) ((volatile unint32 *)(SOC_SRAM_TR32_ADDR_FST + ((num) << 2)))


#define SOC_SRAM_TR32_ADDR_SND          (SOC_SRAM_TR32_SECOND + 0x400)


#define SOC_SRAM_TR32_ADDR_SND_VAR(num) ((volatile unint32 *)(SOC_SRAM_TR32_ADDR_SND + ((num) << 2)))


#define SOC_SRAM_TR32_ADDR_TRD          (SOC_SRAM_TR32_THIRD  + 0x400)


#define SOC_SRAM_TR32_ADDR_TRD_VAR(num) ((volatile unint32 *)(SOC_SRAM_TR32_ADDR_TRD + ((num) << 2)))


#define SOC_SRAM_TR32_CRUDATA_FIRST     (SOC_SRAM_TR32_FIRST )


#define SOC_SRAM_TR32_CRUDATA_SECOND    (SOC_SRAM_TR32_SECOND)


#define SOC_SRAM_TR32_CRUDATA_THIRD     (SOC_SRAM_TR32_THIRD )


#define SOC_SRAM_TR32_FIRST             (SOC_SRAM_ADDR_BASE + 0x00118200)                       /*  三取二数据区一区(应用软件) */


#define SOC_SRAM_TR32_NUM_ALL           22u     /* 三取二变量总个数 */


#define SOC_SRAM_TR32_NUM_BASCENDFLG    18u     /* 启动飞跃标志AscendFlg */


#define SOC_SRAM_TR32_NUM_BCOVFLG       19u     /* 滑行制导收敛标志CovFlg */


#define SOC_SRAM_TR32_NUM_BHOVERFLG     20u     /* 坑外盘旋飞跃标志HoverFlg */


#define SOC_SRAM_TR32_NUM_BINERATT      15u     /* 重新确定惯性基准标志IAFlg */


#define SOC_SRAM_TR32_NUM_BZ1           0u      /* 模式字 */


#define SOC_SRAM_TR32_NUM_BZ2           1u      /* 陀螺使用标志 */


#define SOC_SRAM_TR32_NUM_BZ3           2u      /* 加计使用标志 */


#define SOC_SRAM_TR32_NUM_BZ4           3u      /* 星敏使用标志 */


#define SOC_SRAM_TR32_NUM_BZ7           4u      /* 微波测距测速使用标志 */


#define SOC_SRAM_TR32_NUM_FLGCALIBRATE  21u     /* 星敏感器基准标定标志 */


#define SOC_SRAM_TR32_NUM_FLGFAILURE    17u     /* 故障标志FailureFlg */


#define SOC_SRAM_TR32_NUM_FLGWALKMODE   16u     /* (行走模式切换)地面注入的指令, WALK_MODE_SWITCH_CMD_NULL */


#define SOC_SRAM_TR32_NUM_ZT1           5u      /* 指定工作模式标志 */


#define SOC_SRAM_TR32_NUM_ZT10          14u     /* 功能使能标志 */


#define SOC_SRAM_TR32_NUM_ZT2           6u      /* 指定陀螺工作标志 */


#define SOC_SRAM_TR32_NUM_ZT3           7u      /* 指定加计工作标志 */


#define SOC_SRAM_TR32_NUM_ZT4           8u      /* 指定星敏工作标志 */


#define SOC_SRAM_TR32_NUM_ZT5           9u      /* 指定285N发动机工作标志 */


#define SOC_SRAM_TR32_NUM_ZT6           10u     /* 指定动态三维工作标志 */


#define SOC_SRAM_TR32_NUM_ZT7           11u     /* 指定微波测距测速工作标志 */


#define SOC_SRAM_TR32_NUM_ZT8           12u     /* 故障处理标志 */


#define SOC_SRAM_TR32_NUM_ZT9           13u     /* 功能使能标志 */


#define SOC_SRAM_TR32_READ(num)         (Tr32Uint(SOC_SRAM_TR32_ADDR_FST_VAR((num)), \
                                                 SOC_SRAM_TR32_ADDR_SND_VAR((num)), \
                                                 SOC_SRAM_TR32_ADDR_TRD_VAR((num))))


#define SOC_SRAM_TR32_SECOND            (SOC_SRAM_ADDR_BASE + 0x0011B800)                       /*  三取二数据区二区(应用软件) */


#define SOC_SRAM_TR32_THIRD             (SOC_SRAM_ADDR_BASE + 0x0011EE00)                       /*  三取二数据区三区(应用软件) */


#define SOC_SRAM_TR32_WRITE(num, value) (Tr32UintValue(SOC_SRAM_TR32_ADDR_FST_VAR((num)), \
                                                      SOC_SRAM_TR32_ADDR_SND_VAR((num)), \
                                                      SOC_SRAM_TR32_ADDR_TRD_VAR((num)), \
                                                      (value)))


#define STS_TCCMD_PK_PREFIX             0xA42BB1F2


#define STS_TC_SET_MHK_RATES_LEN    (12 + 40)   /* 设置MHK数据传输速率指令: 12字节包头+40字节数据内容 */


#define STS_TC_SYNC_LEN             (12 + 4 )   /* 星敏感器同步校时指令: 12字节包头+4字节数据内容 */


#define STS_TMRY_PK_PREFIX              0xA42BB1F3


#define STS_TM_ADB                  (0x02)      /* 姿态包 */


#define STS_TM_ADB_LEN              (12 + 37)   /* 姿态包: 12字节包头+37字节数据内容 */


#define STS_TM_HK1                  (0x07)      /* 星敏感器监测数据1包 */


#define STS_TM_HK1_LEN              (12 + 44)   /* 星敏感器监测数据1包: 12字节包头+44字节数据内容 */


#define SYS_TMR_AUTO_WorkMode_APP           0xeb900000  //三机自主当班


#define SYS_TMR_SINGLE_WorkMode_APP         0xeb900001  //三机强制当班


#define SYS_TWO_WorkMode_APP                0xeb900002  //双机冷


#define TCMD_DATA_SAVE_TYPE_NULL        0x00    /* 无操作 */


#define TCMD_DATA_SAVE_TYPE_PTRRESET    0x0A    /* 内存区清零, 存储区指针复位 */


#define TCMD_DATA_SAVE_TYPE_SAVE        0x05    /* 从TAM时刻开始存储数据, 存满或至TBM为止 */


#define TCMD_DEV_ONOFF_CMD_OFF          0x00    /* 断电命令 */


#define TCMD_DEV_ONOFF_CMD_OFF_THRU     0xBB    /* 断电命令(推进各分支) */


#define TCMD_DEV_ONOFF_CMD_ON           0xFF    /* 加电命令 */


#define TCMD_DEV_ONOFF_CMD_ON_THRU      0xAA    /* 加电命令(推进各分支) */


#define TCMD_DEV_ONOFF_ID_END           DEV_ID_THRUGROUP_3  /* 结束编号 */


#define TCMD_DEV_ONOFF_ID_START         DEV_ID_STS_A        /* 起始编号 */


#define TCMD_FTDIMRYMEM_LEN             37


#define TCMD_LTPSMRYMEM_LEN             41


#define TCMD_LTPSMRYMEM_SHORTLEN        22


#define TCMD_LTU_CHNL_END               0xB     /* 结束通道, 着陆器串口 */


#define TCMD_LTU_CHNL_NUM               (TCMD_LTU_CHNL_END+1)


#define TCMD_LTU_CHNL_START             0x0     /* 起始通道, STSa */


#define TCMD_LTU_STAGE_DELAY            0x55    /* 收到LTU命令包当拍不执行, 等到下一个控制周期开始执行 */


#define TCMD_LTU_STAGE_NULL             0x00    /* 无LTU命令待执行 */


#define TCMD_LTU_STAGE_RECV             0xCC    /* LTU命令待收数 */


#define TCMD_LTU_STAGE_SEND             0xAA    /* LTU命令待发送 */


#define TCMD_MEM_DWLD_ADDR_MAX          29


#define TCMD_MEM_DWLD_LEN_MAX           49


#define TCMD_MEM_DWLD_TYPE_DSP          0xAA    /* DSP内存 */


#define TCMD_MEM_DWLD_TYPE_NORFLASH     0xFF    /* NorFlash内存 */


#define TCMD_MEM_DWLD_TYPE_NULL         0x00    /* 无操作或操作完成 */


#define TCMD_MEM_DWLD_TYPE_SOC          0x55    /* SOC内存 */


#define TCMD_MEM_MODIFY_1_LEN_MAX       57


#define TCMD_MEM_MODIFY_2_LEN_MAX       29


#define TCMD_MRVSMRYMEM_LEN             11


#define TCMD_OTSMRYMEM_LEN              37


#define TCMD_OTSMRYMEM_SHORTLEN         15


#define TCMD_PK_TYPE_DEBUG              30      /* 应用软件调试指令包 */


#define TCMD_PK_TYPE_ERASE_FLASH        21      /* NorFlash扇区擦除包 */


#define TCMD_PK_TYPE_IMU_PARAM          6       /* IMU当量和安装系数包 */


#define TCMD_PK_TYPE_IMU_SAVE           19      /* IMU数据存储控制包 */


#define TCMD_PK_TYPE_IMU_ZEROBIAS       7       /* IMU零偏系数包 */


#define TCMD_PK_TYPE_LTU                2       /* LTU命令包 */


#define TCMD_PK_TYPE_MEMDL_DSP          16      /* DSP内存下卸包 */


#define TCMD_PK_TYPE_MEMDL_FLASH        17      /* NorFlash内存下卸包 */


#define TCMD_PK_TYPE_MEMDL_SOC          15      /* SOC内存下卸包 */


#define TCMD_PK_TYPE_MEMMD_DSP_C        9       /* DSP连续数据内存修改包 */


#define TCMD_PK_TYPE_MEMMD_DSP_D        12      /* DSP离散数据内存修改包 */


#define TCMD_PK_TYPE_MEMMD_FLASH_C      10      /* NorFlash连续数据内存修改包 */


#define TCMD_PK_TYPE_MEMMD_FLASH_D      13      /* NorFlash离散数据内存修改包 */


#define TCMD_PK_TYPE_MEMMD_SOC_C        8       /* SOC连续数据内存修改包 */


#define TCMD_PK_TYPE_MEMMD_SOC_D        11      /* SOC离散数据内存修改包 */


#define TCMD_PK_TYPE_MOVE_SOC_DSP       20      /* SOC/DSP搬家及存储控制包 */


#define TCMD_PK_TYPE_MRVS_SYNC          4       /* 微波敏感器同步设置包 */


#define TCMD_PK_TYPE_NAVI_INIT          23      /* 导航初始数据包 */


#define TCMD_PK_TYPE_NULL               0       /* 无效类型 */


#define TCMD_PK_TYPE_PARAM_MODIFY       25      /* 参数修改数据包 */


#define TCMD_PK_TYPE_PARAM_MODIFY_DSP   26      /* DSP参数修改数据包 */


#define TCMD_PK_TYPE_POWER_ONFF         1       /* 部件加断电命令包 */


#define TCMD_PK_TYPE_POWER_STATUS       3       /* 加电状态字设置包 */


#define TCMD_PK_TYPE_PROGRAM            14      /* 程序包 */


#define TCMD_PK_TYPE_RELAYSAT_ORBIT     24      /* 中继星轨道数据包 */


#define TCMD_PK_TYPE_STS_RTS            5       /* 星敏感器RTS命令包 */


#define TCMD_PK_TYPE_TAKEOFF_READY      22      /* 起飞准备数据包 */


#define TCMD_PK_TYPE_THRU_CTRL          18      /* 推力器控制包 */


#define TCMD_POWER_ONOFF_BUFF_LEN       120


#define TCMD_SAVE_EXE_MAX               30      /* 最大包数量 */


#define TCMD_SAVE_EXE_STAGE_FIRST       0x11    /* 启动读取存储数据包0 */


#define TCMD_SAVE_EXE_STAGE_FOURTH      0x44    /* 执行存储数据包 */


#define TCMD_SAVE_EXE_STAGE_NULL        0x00    /* 不执行 */


#define TCMD_SAVE_EXE_STAGE_SECOND      0x22    /* 读取存储数据包0结束判定 + 解析第0包 */


#define TCMD_SAVE_EXE_STAGE_THIRD       0x33    /* 根据延时顺序挨个读取指定存储数据包 */


#define TCMD_SAVE_PK_LEN                0x100   /* 每个存储数据包分配包长 */


#define TCMD_TOTMRYMEM_LEN              96      /* ??? 此几个宏需要重新复核 */


#define THRU_285N_GROUP_NUM         6       /* 285N推力器总数 */


#define THRU_40N_GROUP_NUM          16      /* 40N推力器总数 */


#define THRU_LVF_AUTO_SEQ_LAND      0xAA    /* 推进自锁阀着陆自主序列 */


#define THRU_LVF_AUTO_SEQ_LAUNCH    0x55    /* 推进自锁阀起飞自主序列 */


#define THRU_LVF_AUTO_SEQ_NULL      0       /* 无自主序列 */


#define THRU_TEST_EXE_DELAY         0xFF    /* 星时Ttjact开始执行 */


#define THRU_TEST_EXE_INSTANT       0x00    /* 立即执行 */


#define THRU_TEST_EXE_STOP          0x55    /* 立即停止测试，相关参数恢复初值，并恢复星上自主运行 */


#define THRU_TEST_TYPE_DIVISION     0x55    /* 分时测试 */


#define THRU_TEST_TYPE_MEANWHILE    0xBB    /* 同时测试 */


#define THRU_TEST_TYPE_NULL         0x00    /* 空状态 */


#define THRU_THRU_GROUP_NUM         22      /* 所有推力器总数 */


#define TID_MAX         (TID_SEG10+1) /* 时间记录个数 */


#define TID_SEG1        15 /* 任意代码片段 */


#define TID_SEG10       24 /* 任意代码片段 */


#define TID_SEG2        16 /* 任意代码片段 */


#define TID_SEG3        17 /* 任意代码片段 */


#define TID_SEG4        18 /* 任意代码片段 */


#define TID_SEG5        19 /* 任意代码片段 */


#define TID_SEG6        20 /* 任意代码片段 */


#define TID_SEG7        21 /* 任意代码片段 */


#define TID_SEG8        22 /* 任意代码片段 */


#define TID_SEG9        23 /* 任意代码片段 */


#define TID_TASK1       0  /* 任务1 */


#define TID_TASK2       1  /* 任务2 */


#define TID_TASK3       2  /* 任务3 */


#define TID_TWO_TASK1   3  /* 双机冷任务1 */


#define TID_TWO_TASK2   4  /* 双机冷任务2 */


#define TID_TWO_TASK3   5  /* 双机冷任务3 */


#define TID_TWO_TASK4   6  /* 双机冷任务4 */


#define TID_TWO_TASK5   7  /* 双机冷任务5 */


#define TID_TWO_TASK6   8  /* 双机冷任务6 */


#define TID_TWO_TASK7   9  /* 双机冷任务7 */


#define TID_TWO_TASK8   10 /* 双机冷任务8 */


#define TID_TWO_TASK9   11 /* 双机冷任务9 */


#define TIME_LLONG64(time)      (((llong64)((ulong64)(time) << 16u)) >> 16u)


#define TMRY_MEDIUM_NUM             (4)


#define TMRY_PK01_DATA_LEN          (294)   /* 遥测包1数据长度 */


#define TMRY_PK01_MEDIUM_LEN        (150)   /* 中帧长度150字节 */


#define TMRY_PK01_QUICK_LEN         (44)    /* 快帧长度44字节 */


#define TMRY_PK01_SLOW_LEN          (100)   /* 慢帧长度100字节 */


#define TMRY_PK02_DATA_LEN          (294)   /* 遥测包2数据长度 */


#define TMRY_PK02_MEDIUM_LEN        (144)   /* 中帧长度144字节 */


#define TMRY_PK02_QUICK_LEN         (150)   /* 快帧长度150字节 */


#define TMRY_PK03_DATA_LEN          (14)    /* 遥测包3数据长度 */


#define TMRY_PK03_MEDIUM_LEN        (3)     /* 中帧长度3字节 */


#define TMRY_PK03_QUICK_LEN         (1)     /* 快帧长度1字节 */


#define TMRY_PK03_SLOW_LEN          (10)    /* 慢帧长度10字节 */


#define TMRY_PK04_DATA_LEN          (140)   /* 遥测包4数据长度 */


#define TMRY_PK04_QUICK_LEN         (14)    /* 包4快帧长度14字节 */


#define TMRY_PK04_SLOW_LEN          (126)   /* 包4慢帧长度126字节 */


#define TMRY_PK_NUM                 (4)


#define TMRY_SLOW_NUM               (8)


#define TMR_BZ1_QUIT_INVALID            0x0007      /* 变量1比对不一致 */


#define TMR_BZ1_QUIT_VALID              0xAABB      /* 若变量1中2个或3个对应的BZ1一致，则认为变量5～29比对一致 */


#define TMR_VAR_TABLE_LENGTH            100         /* 三机比对变量表长度 */


#define TMR_VAR_TYPE_BZ1                0x11        /* BZ1的特殊处理 */


#define TMR_VAR_TYPE_END                0xFF        /* 表格最后一行 */


#define TMR_VAR_TYPE_FLOAT64            0xAA        /* 双精度浮点数 */


#define TMR_VAR_TYPE_HH8                0x00        /* 32位整型中取字节: HH8 */


#define TMR_VAR_TYPE_HL8                0x01        /* 32位整型中取字节: HL8 */


#define TMR_VAR_TYPE_LH8                0x02        /* 32位整型中取字节: LH8 */


#define TMR_VAR_TYPE_LL8                0x03        /* 32位整型中取字节: LL8 */


#define TMR_VAR_TYPE_Q1                 0x22        /* Q1的特殊处理 */


#define TMR_VAR_TYPE_Q2                 0x33        /* Q2的特殊处理 */


#define TMR_VAR_TYPE_Q3                 0x44        /* Q3的特殊处理 */


#define TMR_VAR_TYPE_TIME               0xCC        /* 星时的特殊处理 */


#define TMR_VAR_TYPE_UNINT32            0xBB        /* 32位无符号整型 */


#define TRUE_TO_COMPLE_16(ui16, truelen)    ((siint16)((unint16)(ui16) << (16u - (truelen))) >> (16u - (truelen)))


#define TRUE_TO_COMPLE_32(ui32, truelen)    ((siint32)((unint32)(ui32) << (32u - (truelen))) >> (32u - (truelen)))


#define T_128MS                 0.128     /* 128ms */


#define T_16MS                  0.016     /* 16ms */


#define T_32MS                  0.032     /* 32ms */


#define T_64MS                  0.064     /* 64ms */


#define UART_BAUD_115200        115200          /* 波特率115.2Kbps */


#define UART_BAUD_250000        250000          /* 波特率250Kbps */


#define UART_BYTE_TIME_115200   98              /* 波特率115.2Kbps时, 95.49us */


#define UART_BYTE_TIME_250000   46              /* 波特率250Kbps时, 44us */


#define UART_CLOSE_LOOP_ENABLE  1


#define UART_COM_ERR_CHKSUM     0x06            /* 累加和错误 */


#define UART_COM_ERR_FRAME      0x04            /* 格式错误（frame error） */


#define UART_COM_ERR_HANDSHAKE  0x02            /* 握手错误（handshake error） */


#define UART_COM_ERR_HEADER     0x07            /* 数据帧头错误 */


#define UART_COM_ERR_OVERRUN    0x05            /* 溢出错误（overrun error） */


#define UART_COM_ERR_OVERTIME   0x01            /* 超时错误（overtime error） */


#define UART_COM_ERR_PARITY     0x03            /* 校验错误（parity error） */


#define UART_EVEN               0               /* 偶校验 */


#define UART_NO_BACKUP_1        0               /* 异步串口0 , 备用1串口 */


#define UART_NO_BACKUP_2        2               /* 异步串口1 , 备用2串口 */


#define UART_NO_CLS_LOOP_0      1               /* 异步串口0 , 闭环测试0, 地检串口 */


#define UART_NO_CLS_LOOP_1      3               /* 异步串口1 , 闭环测试1 */


#define UART_NO_FTDI            14              /* 异步串口12, FTDI串口 */


#define UART_NO_IMU_A           6               /* 异步串口4 , IMUa串口 */


#define UART_NO_IMU_B           7               /* 异步串口5 , IMUb串口 */


#define UART_NO_LTPS            12              /* 异步串口10, LTPS串口 */


#define UART_NO_MRVS_1          8               /* 异步串口6 , MRVS1串口 */


#define UART_NO_MRVS_2          9               /* 异步串口7 , MRVS2串口 */


#define UART_NO_MRVS_3          10              /* 异步串口8 , MRVS3串口 */


#define UART_NO_MRVS_4          11              /* 异步串口9 , MRVS4串口 */


#define UART_NO_OTS             13              /* 异步串口11, OTS串口 */


#define UART_NO_STS_A           4               /* 异步串口2 , STSa串口 */


#define UART_NO_STS_B           5               /* 异步串口3 , STSb串口 */


#define UART_NO_ZLQ_CCU         15              /* 异步串口13, 着陆器CCU串口 */


#define UART_OFFSET_FTDI        0x1700          /* 异步串口12, FTDI串口 */


#define UART_OFFSET_GRD_CHECK   0x0900          /* 异步串口1 , 地检串口 */


#define UART_OFFSET_IMU_A       0x0c00          /* 异步串口4 , IMUa串口 */


#define UART_OFFSET_IMU_B       0x0d00          /* 异步串口5 , IMUb串口 */


#define UART_OFFSET_LTPS        0x1500          /* 异步串口10, LTPS串口 */


#define UART_OFFSET_MRVS_1      0x0e00          /* 异步串口6 , MRVS1串口 */


#define UART_OFFSET_MRVS_2      0x0f00          /* 异步串口7 , MRVS2串口 */


#define UART_OFFSET_MRVS_3      0x1300          /* 异步串口8 , MRVS3串口 */


#define UART_OFFSET_MRVS_4      0x1400          /* 异步串口9 , MRVS4串口 */


#define UART_OFFSET_OTS         0x1600          /* 异步串口11, OTS串口 */


#define UART_OFFSET_STS_A       0x0a00          /* 异步串口2 , STSa串口 */


#define UART_OFFSET_STS_B       0x0b00          /* 异步串口3 , STSb串口 */


#define UART_OFFSET_ZLQ_CCU     0x1800          /* 异步串口13, 着陆器CCU串口 */


#define UART_STOP_1             0               /* 1位停止位 */


#define UI32_BIT_SET12(uv, bp, bv)              ((uv) = ((uv) & ((0xFFFu << (bp)) ^ (MASK_ALL8F))) | ((bv) << (bp)))


#define UI32_BIT_SET20(uv, bp, bv)              ((uv) = ((uv) & ((0xFFFFFu << (bp)) ^ (MASK_ALL8F))) | ((bv) << (bp)))


#define UI32_BIT_SET23(uv, bp, bv)              ((uv) = ((uv) & ((0x7FFFFFu << (bp)) ^ (MASK_ALL8F))) | ((bv) << (bp)))


#define UN08_TO_UN32_ID       (0x58u)           /* 将8位整数转换为32位整型数 */


#define UN32_TO_SI08_ID       (0x50u)           /* 将32位整数转换为8位有符号整型数 */


#define UN32_TO_SI16_ID       (0x51u)           /* 将32位整数转换为16位有符号整型数 */


#define UN32_TO_UN08_ID       (0x56u)           /* 将32位整数转换为8位无符号整型数 */


#define WALK_MODE_SWITCH_CMD_GLOBALPLAN     0x22    /* 全局+局部规划自主行走 */


#define WALK_MODE_SWITCH_CMD_MOVEPLAN       0x33    /* 仅局部规划自主行走 */


#define WALK_MODE_SWITCH_CMD_NULL           0x00    /* 无指令 */


#define WALK_MODE_SWITCH_CMD_PLANWALK       0x11    /* 地面规划行走 */


#define WALK_MODE_SWITCH_CMD_STOP           0x44    /* 停止指令 */


#define WORK_MODE_APPROACH      7       /* 接近模式 */


#define WORK_MODE_GLIDE         5       /* 滑行模式 */


#define WORK_MODE_GLOBALPLAN    12      /* 全局规划模式 */


#define WORK_MODE_LAUNCHRDY     1       /* 起飞准备 */


#define WORK_MODE_MOVEPLAN      13      /* 移动规划模式 */


#define WORK_MODE_NOCTRL        9       /* 无控模式 */


#define WORK_MODE_PLANWALK      11      /* 地面规划行走模式 */


#define WORK_MODE_RISEATTI      4       /* 上升调姿 */


#define WORK_MODE_SLOWDOWN      8       /* 缓速下降 */


#define WORK_MODE_SPEEDDECEL    6       /* 动力减速 */


#define WORK_MODE_STATIC        10      /* 静态模式 */


#define WORK_MODE_TRANSLATION   3       /* 平移模式 */


#define WORK_MODE_VERTRISE      2       /* 垂直上升 */


#define WORK_MODE_WAIT          0       /* 等待模式 */


#define __APP_DATA__                20260414    /* 日期: 年月日 */


#define __APP_VERSION__             206         /* (100表示1.00版本) */


#endif // AUTO_GENERATED_COMMON_H
