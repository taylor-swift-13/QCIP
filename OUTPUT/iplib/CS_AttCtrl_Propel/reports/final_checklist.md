# CS_AttCtrl_Propel final checklist

- [x] `CS_ThrParamCfgX` 的五种返回模式均覆盖。
- [x] `CS_AttCtrl_JetCrossCtrl/Sub` 的三种轴对、无操作和阈值分支均覆盖。
- [x] `CS_FindMinMaxPos` 的长度边界、全零、重复最大值和非零极值均覆盖。
- [x] 正例和阴性控制通过固定 `coq_tooling.py check`。
- [x] Rocq 文件不含 `Admitted.` 或额外 `Axiom`。

边界：相平面、脉冲计算和 12 喷管分配不在本批测试结论内。
