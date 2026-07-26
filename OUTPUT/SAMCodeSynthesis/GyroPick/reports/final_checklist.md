# GyroPick final-checklist（路线 B 差分测试）

日期：2026-07-24　向量：1000 条（seed 0x9E3779B97F4A7C15）

- [x] `rocq/spec.v`、`rocq/tests.v` 用仓库根 `_CoqProject` 编译通过
- [x] 1000/1000 向量逐位一致（`vm_compute; reflexivity`）
- [x] 阴性自检：t_0001 期望 wa_out[0] bits `3216384825 → 3216384826`，
      coqc 报错；恢复后重新通过
- [x] spec 纯定义、tests 全部 `Qed`，无 `Admitted` / 自定义 `Axiom`
- [x] 定向模式 10 类：随机、d=0、未连续野值（沿用旧值）、连续野值（采纳）、
      `|d|==thr` 恰边界、单路 NaN、thr NaN、+Inf、countPick=255 回绕、
      pickThr=0
- [x] 元素级覆盖（9000 个判定）：沿用旧值 1332、采纳新值 6768
- [x] 一键复现 `bash FloatTest/tools/run_tests.sh GyroPick 1000` 通过

边界声明：采样验证非全称证明；不覆盖内存安全。

附：本题驱动曾因 printf 格式串比实参多 2 个 `%u` 被发射器列数断言当场
拦住（UB 垃圾列），修正后通过——格式串列数 = 实参数 = 发射器断言数
三者一致是本链路的自检点。
