# AttiErrCalc FloatTest

本交付直接编译原始 `IP_AttiErrCalc.c`。Qdiv 固定给出可控滚转误差与两个非零横向分量，Q2C 固定单位阵，Acos 固定零，使角度轨迹规划保持关闭；测试由此位级验证 ZT9 最后子样选择、滚转阈值标志、三轴角误差/角速度误差及控制标志清零。

复现：`bash FloatTest/tools/run_tests.sh AttiErrCalc 1000 0x9E3779B97F4A7C15`

本轮不覆盖大角度轨迹规划和真实四元数误差公式。

有限采样结论不构成对该组件全部输入的全称证明。
