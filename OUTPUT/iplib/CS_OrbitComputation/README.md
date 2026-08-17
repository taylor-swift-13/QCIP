# CS_OrbitComputation 顶层浮点差分测试

本交付从原始 `IP_CS_OrbitComputation.c` 确定性抽取
`CS_OrbitComputationFun`，测试轨道时间有效性、未注入阈值、无轨道计数、
`w0i` 和地固系经度更新。`OrbitCalculate`、`SunEphemerisCalculate`、C2Q 和
Rz 作为组件边界用可观察桩隔离，四个调用次数纳入输出并由 Coq 比较。

固定种子结果为 **1007/1007**（7 条定向 + 1000 条随机）正例通过，另有
1 条阴性控制。有效/无效轨道为 329/678，未注入标志 0/1 为 465/542，
工作模式 8/9 共 153 条；四个下游调用在全部 1007 条中均恰好一次。

向量固定 `FP_OrbUpdate=0`、`FP_WoPrecession=0`，并把无轨道保护阈值设为
不会触发；因此不覆盖轨道参数复制、保护回退和岁差 z 分量。核心
OrbitCalculate/SunEphemerisCalculate 的内部数值算法也不属于本测试结论。

复现：

```sh
bash FloatTest/tools/run_tests.sh CS_OrbitComputation 1000 0xa4093822299f31d0
```

这是有限采样的位级差分测试，不是全称证明，也不覆盖内存安全。
