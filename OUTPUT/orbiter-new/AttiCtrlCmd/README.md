# AttiCtrlCmd FloatTest

本交付直接编译原始 `IP_AttiCtrlCmd.c`。输入向量固定为同向单位位置/推力，使目标保护不改写推力；缺失的 Avv/C2Q/Qdiv/Q2C 由可观察桩隔离。测试覆盖垂直上升直接复制、平移/上升调姿、滑行条件、动力段 hover 条件和默认安装轴分支，并比较目标四元数、零角速度和调用派发。

复现：`bash FloatTest/tools/run_tests.sh AttiCtrlCmd 1000 0x9E3779B97F4A7C15`

本轮验证控制流与数据流，不验证缺失的真实姿态构造/限速公式。

有限采样结论不构成对该组件全部输入的全称证明。
