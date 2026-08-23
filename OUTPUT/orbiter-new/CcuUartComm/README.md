# CcuUartComm FloatTest

本交付直接编译原始 `IP_CcuUartComm.c`。快照遗漏的设备管理/解析结果声明按实际访问字段补入；FIFO、收发、解析、异常保存和串口重初始化均为可观察桩。Rocq 独立建模通讯禁用、完整/部分/空 FIFO、连续空读、接收/解析失败及成功应答的计数和状态迁移。

复现：`bash FloatTest/tools/run_tests.sh CcuUartComm 1000 0x9E3779B97F4A7C15`

不访问真实 UART；`CcuUartDataProc` 的帧内容解析由独立 case 覆盖。

有限采样结论不构成对该组件全部输入的全称证明。
