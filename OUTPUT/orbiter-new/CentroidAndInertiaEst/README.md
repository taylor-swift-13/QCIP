# CentroidAndInertiaEst FloatTest

本交付直接编译原始 `IP_CentroidAndInertiaEst.c`。测试令陀螺/加计可用数不足，使在线横向质心修正分支关闭；在此受控子域中，Rocq 位级验证质量差平方、多项式求值、三个惯量对角元、三个惯量积对称布局、`pgoF` 和 y/z 状态保持。

复现：`bash FloatTest/tools/run_tests.sh CentroidAndInertiaEst 1000 0x9E3779B97F4A7C15`

本轮不覆盖需要真实 IMU/推力累计数据的在线 y/z 修正分支。

有限采样结论不构成对该组件全部输入的全称证明。
