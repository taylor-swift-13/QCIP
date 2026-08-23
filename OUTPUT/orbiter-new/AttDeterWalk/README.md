# AttDeterWalk FloatTest

本交付直接编译原始 `IP_AttDeterWalk.c`。四个输入矩阵固定为单位阵，使最终 `CFBN = CNMᵀ`；快照缺失的正/反三角调用由确定性可观察桩（sin/asin 恒等、cos 加一、atan2 求和）替代。Rocq 独立复刻全部 binary64 运算顺序、9 个 CNM 元素和矩阵链结果。

复现：`bash FloatTest/tools/run_tests.sh AttDeterWalk 1000 0x9E3779B97F4A7C15`

这是矩阵与数据流测试，不验证缺失的真实三角函数数值语义。

有限采样结论不构成对该组件全部输入的全称证明。
