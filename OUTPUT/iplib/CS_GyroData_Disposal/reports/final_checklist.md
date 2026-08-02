# CS_GyroData_Disposal final-checklist（路线 B 差分测试）

日期：2026-07-24　向量：1000 条（seed 0x9E3779B97F4A7C15）

- [x] `rocq/spec.v`、`rocq/tests.v` 用仓库根 `_CoqProject` 编译通过
- [x] 1000/1000 向量逐位一致（`vm_compute; reflexivity`）
- [x] 阴性自检：t_0000（n=4 主路径）期望 deltag0
      `4571266427544271318 → …319`，coqc 报错；恢复后重新通过
- [x] spec 纯定义、tests 全部 `Qed`，无 `Admitted` / 自定义 `Axiom`
- [x] 定向模式 8 类：n=4 随机、n=3 随机、停控历史（NaN/±Inf 透传）、
      n=5 历史（fu==2 不计数）、强限幅（deltaT=1e-9 + mlfw=0.01）、
      n=3 奇异回退（det=0）、±0 增量/负 deltaT、fsAttD=2 不停控
- [x] 路径覆盖统计：历史分支 250（停控 125 + n=5 125）、n=3 主路径 250、
      n=4 主路径 500
- [x] 一键复现 `bash FloatTest/tools/run_tests.sh CS_GyroData_Disposal 1000` 通过
- [x] helper 重建声明：MatrixTran/MatrixMulti/MatrixInv33/LimitDouble
      按 SAM fp32 同名函数算法重建为 fp64（驱动与 spec 双侧），
      原始实现不可得、不在测试范围内，README 备注 1 已声明

边界声明：采样验证非全称证明；不覆盖内存安全；NaN/±Inf 只走历史值
透传分支；`m_WorkMode` 越界为 UB（spec 取 stop=0）。
