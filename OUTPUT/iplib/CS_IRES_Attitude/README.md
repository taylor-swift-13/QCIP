# CS_IRES_Attitude 浮点差分测试

本交付覆盖两部分原始代码：顶层 `CS_IRES_AttitudeFun` 的无传感器清标志
路径，以及直接执行 `IRES_DataProcess` 的 0/1/2 个有效传感器融合、误差
向量、两级历史值推进、速率滤波和限幅。sin/cos 使用 FloatTest 已自测的
确定性 musl 移植。

未覆盖 `StaticIresConvert` 的 sqrt/atan2/asin 转换和 `CS_IRES_Modify`。
尤其 iplib 版 Modify 的 `for(k...)` 循环体使用了未初始化的 `i` 作为
`devangle[i]` 下标，触发该路径存在未定义行为风险；本测试没有掩盖或修复
输入源码中的问题。

固定种子结果为 **1006/1006**（6 条定向 + 1000 条随机）正例通过，另有
1 条阴性控制。顶层/DataProcess 为 119/887 条；DataProcess 中传感器有效
组合 00/01/10/11 分别为 223/216/215/233 条。全新临时 gcc 构建生成的
向量与归档文件逐字节一致。

复现：

```sh
bash FloatTest/tools/run_tests.sh CS_IRES_Attitude 1000 0x082efa98ec4e6c89
```

这是有限采样位级差分测试，不是全称证明，也不覆盖内存安全。
