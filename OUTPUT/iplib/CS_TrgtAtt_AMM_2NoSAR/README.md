# CS_TrgtAtt_AMM_2NoSAR 浮点差分验证

## 结果

`1005/1005` 条二进制浮点向量通过固定 `coq_tooling.py check`：

- 5 条定向向量：单位旋转、Rx(π)、Ry(π)、Rz(π) 精确锚点和一条非平凡组合；
- 1000 条固定种子随机向量；
- 四个锚点覆盖 `C2Q` 的 trace、x、y、z 四个分支；
- 每条向量比较姿态矩阵、角速度、四元数、参考角以及三个桩调用计数；
- 阴性对照翻转第一个输出位，已证明与真实结果不等。

权威检查记录在 `reports/coqc_check_evidence.json`，原始位模式和生成定理分别在
`reports/vectors.txt` 与 `rocq/tests.v`。

## 建模边界

四元数乘法、`Q2C`、三次矩阵组合、漂移四元数的确定性 musl `sin/cos`、
`C2Q`、`wri/wro` 传播均执行原始 IP 路径并在 Rocq 中按同一运算顺序建模。

三个仓库外依赖显式隔离为可观察桩，调用次数也进入比较输出：

- 无参应用钩子 `CS_TrgtAtt_AMM_Exp`；
- 下游跟踪钩子 `XX_Track_Atti`；
- 依赖尚未移植的 asin/atan2 的 `C2Angle123`，其输出改为向量输入
  `a_ref_in`，后续赋值仍走原始 C。

原始 `IP_CS_TrgtAtt_AMM_2NoSAR.h` 是 ISO-8859-1，且同一结构体成员
`csLoadAxisData_Csib_DARot` 重复声明，不能直接作为合法 C 头文件编译。
本目录以 `source/CS_TrgtAtt_AMM_2NoSAR_clean.h` 声明实际活跃字段，并由
`source/CS_TrgtAtt_AMM_2NoSAR_ip.c` 在屏蔽原头声明后包含原始函数体；没有
改写上游输入文件。

## 复现

在仓库根目录执行：

```sh
bash FloatTest/tools/run_tests.sh CS_TrgtAtt_AMM_2NoSAR 1000 0xbb67ae8584caa73b
```

该 case 的 `source/CS_TrgtAtt_AMM_2NoSAR_ip_source.txt` 会让驱动使用上述
干净包装。固定 Rocq 检查的参数、固定 `-Q/-R` 映射、源码摘要和耗时保存在
`reports/coqc_check_evidence.json`。
