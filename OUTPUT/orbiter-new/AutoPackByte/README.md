# AutoPackByte FloatTest

本交付直接编译原始 `IP_AutoPackByte.c`，覆盖六个不依赖浮点转整数实现的原码分支：空位、1/2/3/4/8 字节。测试同时覆盖首次打包和复用已缓存 `byteID`，逐字节比较 16 字节目标区以及偏移状态。

复现：`bash FloatTest/tools/run_tests.sh AutoPackByte 1000 0x9E3779B97F4A7C15`

测试固定显式的小端源字节数组，Rocq 规格独立产生协议大端输出。本轮不覆盖依赖 C 浮点到整数转换、内存复制的其他 switch 分支。

有限采样结论不构成对该组件全部输入的全称证明。
