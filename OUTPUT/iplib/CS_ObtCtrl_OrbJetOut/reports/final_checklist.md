# CS_ObtCtrl_OrbJetOut final-checklist（路线 B 差分测试）

日期：2026-07-24　向量：1000 条（seed 0x9E3779B97F4A7C15）

- [x] `rocq/spec.v`、`rocq/tests.v` 用仓库根 `_CoqProject` 编译通过
- [x] 1000/1000 向量逐位一致（`vm_compute; reflexivity`）
- [x] 阴性自检：t_0007 期望 dto' `4615775254727931384 → …385`，coqc 报错；
      恢复后重新通过
- [x] spec 纯定义、tests 全部 `Qed`，无 `Admitted` / 自定义 `Axiom`
- [x] 定向模式 8 类：随机、`starTime == tpi` 恰等触发（dto NaN 透传）、
      else 分支（tIn NaN/±Inf 透传）、starTime NaN、tpi NaN、
      `+0/-0/±Inf × 2.0`、`有限 × ±0 = ±0`、负 deltaT × 标志值
- [x] 路径覆盖统计：if（分配脉宽）568、else（脉宽清零）432、定向各 125
- [x] 一键复现 `bash FloatTest/tools/run_tests.sh CS_ObtCtrl_OrbJetOut 1000` 通过
- [x] NUM_THRGR_OC 替身值（4）在 cflags 与 spec 中一致，见 README 备注

边界声明：采样验证非全称证明；不覆盖内存安全；NaN 定向只走比较/透传
路径（乘法路径 NaN payload 传播与 Flocq 规范 NaN 不同，README 备注已声明）。
