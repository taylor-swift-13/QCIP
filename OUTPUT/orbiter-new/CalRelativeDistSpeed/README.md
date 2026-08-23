# CalRelativeDistSpeed FloatTest

本交付直接编译原始 `INPUT/orbiter-new/CalRelativeDistSpeed/IP_CalRelativeDistSpeed.c`。输入为 6 条腿的三轴位置、速度（源码的 axis-major 18 元布局）及 6 个 0/1 触地标志；覆盖全未触地、全触地和全零向量。共享 helper 按源码意图重建清零与三维欧氏范数，sqrt 使用确定性 musl 移植；Rocq 独立计算 15 个有序腿对的距离、速度和双触地标志。

复现：`bash FloatTest/tools/run_tests.sh CalRelativeDistSpeed 1000 0x9E3779B97F4A7C15`

输入限制为小范围有限 binary64 和布尔触地值；有限采样不是对任意异常值的证明。
