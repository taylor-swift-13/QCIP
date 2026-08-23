# CduToSmuFrameDataPack FloatTest

本交付直接编译原始 `IP_CduToSmuFrameDataPack.c`。输入快照遗漏的 `sAlignToSmu`/`sSmuLvdsCtrl` 声明由 driver 按实际访问字段补齐。浮点遥测输入固定为零，以聚焦验证两个有效字节、WIFI 握手状态、7 个维持计数、标志字段，以及奇偶两帧的 1801 字节障碍数据切片与 0xAA 填充边界。

复现：`bash FloatTest/tools/run_tests.sh CduToSmuFrameDataPack 1000 0x9E3779B97F4A7C15`

这是整数控制域和零浮点子域上的确定性有限采样，不覆盖非零遥测量化误差。
