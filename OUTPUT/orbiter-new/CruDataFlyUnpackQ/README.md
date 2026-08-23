# CruDataFlyUnpackQ FloatTest

输入快照的本题头文件缺少 `sAttiData/sNaviParam` 声明；驱动复用同批次 `AttDeterWalkMode` 头中的原始结构和全局定义，再直接包含原始 `IP_CruDataFlyUnpackQ.c`。`Sqrtx` 使用仓库确定性 musl sqrt 移植，Rocq 使用正确舍入的 `fp64_sqrt`。四组三元分量覆盖全零、平方和等于/超过 0.99999 及有限随机值，输出以 binary64 位型比较。

复现：`bash FloatTest/tools/run_tests.sh CruDataFlyUnpackQ 1000 0x9E3779B97F4A7C15`

测试只观察四个重建的标量分量，不覆盖结构体其他状态；有限采样不是全域证明。
