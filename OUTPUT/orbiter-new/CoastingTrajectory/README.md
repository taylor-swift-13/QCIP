# CoastingTrajectory FloatTest

本交付在同一 translation unit 中直接包含原始 `CoastingDynamic.c` 与 `CoastingTrajectory.c`。缺失的 `LG` 使用常加速度可观测桩：三轴加速度是每条向量的显式输入，并记录调用次数和最后一次收到的位置。测试 `n=1..4`、`t=0` 及有限随机状态；Rocq 逐步复刻四阶 RK 的每次 binary64 运算与 C 的左结合求值顺序。

复现：`bash FloatTest/tools/run_tests.sh CoastingTrajectory 1000 0x9E3779B97F4A7C15`

测试验证 RK4 驱动与 `LG` 接口，不验证快照中缺失的真实引力场，也不覆盖 `n=0`。

有限采样结论不构成对该组件全部输入的全称证明。
