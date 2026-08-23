# CcuUartDataProc FloatTest

本交付直接编译原始 `IP_CcuUartDataProc.c`，校验和按 8 位累加独立提供。92 字节帧由 `base + step*i` 生成，再控制帧头、通讯状态、校验和和三个星敏有效位；Rocq 检查错误码覆盖优先级、有效标志、12 个有符号大端四元数字段和三个 binary64 时间位模式。

复现：`bash FloatTest/tools/run_tests.sh CcuUartDataProc 1000 0x9E3779B97F4A7C15`

这是五类有效/错误场景上的确定性有限采样；浮点派生量未列入可观察输出。
