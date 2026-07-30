# ModeConvert_AMM final-checklist（路线 B 差分测试）

日期：2026-07-24　向量：1000 条（seed 0x9E3779B97F4A7C15）

- [x] `rocq/spec.v`、`rocq/tests.v` 用仓库根 `_CoqProject` 编译通过
- [x] 1000/1000 向量逐位一致（`vm_compute; reflexivity`）
- [x] 阴性自检：t_0001 期望 workMode 改错 +1，coqc 报错；恢复后重新通过
- [x] spec 纯定义、tests 全部 `Qed`，无 `Admitted` / 自定义 `Axiom`
- [x] 定向模式 8 类：随机、恰等触发（第一个 if）、F=2 得 5、F=1 得 2、
      顺序覆盖（先 1 后 5）、时间未到不触发、NaN 不触发、F=3 仅第一个 if
- [x] 路径覆盖：结果 1 有 312、2 有 140、5 有 267、保持 305
- [x] 一键复现 `bash FloatTest/tools/run_tests.sh ModeConvert_AMM 1000` 通过

边界声明：采样验证非全称证明；不覆盖内存安全。
