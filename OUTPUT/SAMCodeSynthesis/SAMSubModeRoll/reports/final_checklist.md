# SAMSubModeRoll final-checklist（路线 B 差分测试）

日期：2026-07-24　向量：1000 条（seed 0x9E3779B97F4A7C15）

- [x] `rocq/spec.v`、`rocq/tests.v` 用仓库根 `_CoqProject` 编译通过
- [x] 1000/1000 向量逐位一致（`vm_compute; reflexivity`）
- [x] 阴性自检：t_0001 期望 workMode `21 → 22`，coqc 报错；
      恢复后重新通过
- [x] spec 纯定义、tests 全部 `Qed`，无 `Admitted` / 自定义 `Axiom`
- [x] 定向模式 12 类：随机、阈值 `royaw == 1.0f`、cp 11→12（清 outUp）、
      cp 12→13（转巡航）、超时触发（cm=6250）、超时不触发（cm=6249）、
      非 TRUE 标志（flgSP=2）、巡航/超时竞争、NaN、+Inf、
      countMode 回绕、countPublic 回绕
- [x] 路径覆盖统计：转巡航 187、超时转俯仰 235、透传 605、清 outUp 271、
      回绕/NaN/Inf 定向各 83
- [x] 一键复现 `bash FloatTest/tools/run_tests.sh SAMSubModeRoll 1000` 通过

边界声明：采样验证非全称证明；不覆盖内存安全。
