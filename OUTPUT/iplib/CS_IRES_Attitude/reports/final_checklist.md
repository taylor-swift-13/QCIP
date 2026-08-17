# CS_IRES_Attitude final checklist

- [x] 顶层无传感器清标志路径覆盖。
- [x] DataProcess 的 0/1/2 个有效传感器均覆盖。
- [x] 融合、误差向量、历史推进、滤波和限幅输出逐位一致。
- [x] 正例和阴性控制通过固定 `coq_tooling.py check`。
- [x] Rocq 文件不含 `Admitted.` 或额外 `Axiom`。

边界：StaticIresConvert/Modify 未覆盖；Modify 的未初始化索引风险已声明。
