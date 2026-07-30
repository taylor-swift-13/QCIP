# ModeConvert_SBM final-checklist（路线 B 差分测试）

日期：2026-07-24　向量：1000 条（seed 0x9E3779B97F4A7C15）

- [x] `rocq/spec.v`、`rocq/tests.v` 用仓库根 `_CoqProject` 编译通过
- [x] 1000/1000 向量逐位一致（`vm_compute; reflexivity`）
- [x] 阴性自检：t_0005 期望 workMode `17 → 18`，coqc 报错；
      恢复后重新通过
- [x] spec 纯定义、tests 全部 `Qed`，无 `Admitted` / 自定义 `Axiom`
- [x] 定向模式 8 类：随机、`diff == dt` 恰等触发、`diff=0 < dt` 不触发、
      starTime NaN、dt NaN、starTime +Inf、减法溢出为 +Inf、t0 NaN
- [x] 路径覆盖统计：触发 442、保持 568、定向各 125
- [x] 一键复现 `bash FloatTest/tools/run_tests.sh ModeConvert_SBM 1000` 通过
- [x] WKMD_EIM 替身值（0x11）在 cflags 与 spec 中一致，见 README 备注

边界声明：采样验证非全称证明；不覆盖内存安全。
