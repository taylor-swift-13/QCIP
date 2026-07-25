# SAMSubModeDamp final-checklist（路线 B 差分测试）

日期：2026-07-24　向量：1000 条（seed 0x9E3779B97F4A7C15）

- [x] `rocq/spec.v`、`rocq/tests.v` 用仓库根 `_CoqProject` 编译通过
- [x] 1000/1000 向量逐位一致（`vm_compute; reflexivity`）
- [x] 阴性自检：t_0003 期望 workMode `63 → 64`，coqc 报错；
      恢复后重新通过
- [x] spec 纯定义、tests 全部 `Qed`，无 `Admitted` / 自定义 `Axiom`
- [x] 定向模式 13 类：随机、三轴均 0.1（自增）、`0.15f` 恰阈值（不自增）、
      负值取 abs 越线、cp 自增后越线即转、cp 恰等 time_D2P 不转、
      cm 自增后超时即转、cm 恰等 overtime 不转、单 NaN（被丢弃仍自增）、
      全 NaN（不自增）、cm 回绕、cp 回绕、cp 已越线与自增无关
- [x] 路径覆盖统计：转俯仰 483、透传 526、自增未转移 92、
      定向边界/回绕/NaN 各 77
- [x] 一键复现 `bash FloatTest/tools/run_tests.sh SAMSubModeDamp 1000` 通过

边界声明：采样验证非全称证明；不覆盖内存安全。
