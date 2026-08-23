# Avv FloatTest

本交付直接编译原始 `INPUT/orbiter-new/Avv/IP_Avv.c`。缺失的三维叉乘/归一化由共享的逐语句重建实现补齐，sqrt 使用确定性 musl 移植；Rocq 独立复刻叉乘、范数、除法和 3×3 输出的 binary64 求值顺序。生成器排除近共线输入（叉积范数必须大于 0.05），并包含单位基向量定向样例。

复现：`bash FloatTest/tools/run_tests.sh Avv 1000 0x9E3779B97F4A7C15`

这是非退化有限输入域上的采样，不覆盖零/近零叉积或异常浮点值。

有限采样结论不构成对该组件全部输入的全称证明。
