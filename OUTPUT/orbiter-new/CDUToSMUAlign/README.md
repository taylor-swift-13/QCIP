# CDUToSMUAlign FloatTest

本交付直接编译原始 `INPUT/orbiter-new/CDUToSMUAlign/IP_CDUToSMUAlign.c`，驱动只补齐快照缺失的基础 typedef。输入覆盖 6 个更新标志的全部 64 种组合及后续确定性随机组合；浮点字段仅逐位复制，以 binary64 bit pattern 比较。规格独立建模条件更新、标志清零和维持计数置 8。

复现：`bash FloatTest/tools/run_tests.sh CDUToSMUAlign 1000 0x9E3779B97F4A7C15`

测试只观察该函数读写的对齐状态和 6 个计数器，不声称覆盖完整 1024 字节发送帧。

有限采样结论不构成对该组件全部输入的全称证明。
