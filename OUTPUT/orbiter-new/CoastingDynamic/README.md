# CoastingDynamic FloatTest

本交付直接包含原始 `INPUT/orbiter-new/CoastingDynamic/IP_CoastingDynamic.c`。输入快照缺少引力函数 `LG`，故使用可观测桩：每条向量显式给出三轴返回加速度，并比较调用次数、收到的位置三元组和本地输出缓冲不与公共输出混叠。共享 `VectorEval3` 按三元素复制重建。

复现：`bash FloatTest/tools/run_tests.sh CoastingDynamic 1000 0x9E3779B97F4A7C15`

测试验证状态导数的拼接与 `LG` 调用协议，不声称验证未知的真实引力模型。

有限采样结论不构成对该组件全部输入的全称证明。
