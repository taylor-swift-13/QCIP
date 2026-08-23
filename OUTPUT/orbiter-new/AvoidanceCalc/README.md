# AvoidanceCalc FloatTest

本交付直接编译原始 `IP_AvoidanceCalc.c`。测试固定 `Sub7Flg=99`、关闭安全点几何处理，只验证三种高动态成像触发（悬停、100m、50m）、顺序覆盖、成像标志变化检测和序列启动；高度使用 25/75/125m 三个代表类。未执行的向量/四元数外部调用仍由计数桩守卫，期望调用数为零。

复现：`bash FloatTest/tools/run_tests.sh AvoidanceCalc 1000 0x9E3779B97F4A7C15`

本轮不覆盖接近段状态迁移和安全点几何解算。

有限采样结论不构成对该组件全部输入的全称证明。
