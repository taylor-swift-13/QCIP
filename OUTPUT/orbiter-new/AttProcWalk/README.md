# AttProcWalk FloatTest

本交付直接编译原始 `IP_AttProcWalk.c`。快照缺少姿态矩阵转欧拉角和角度包装实现，因此它们由确定性可观察桩提供；三角链在此 driver 中采用恒等桩，以验证目标函数的字段映射、AIT 清零、两次 yaw 变换和倾斜量计算顺序。所有调用次数和关键指针均进入结果。

复现：`bash FloatTest/tools/run_tests.sh AttProcWalk 1000 0x9E3779B97F4A7C15`

这是调用链/数据流测试，不验证缺失的真实欧拉角与反三角实现。

有限采样结论不构成对该组件全部输入的全称证明。
