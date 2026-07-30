# ModeConvert_EIM final-checklist（路线 B 差分测试）

日期：2026-07-24　向量：1000 条（seed 0x9E3779B97F4A7C15）

- [x] `rocq/spec.v`、`rocq/tests.v` 用仓库根 `_CoqProject` 编译通过
- [x] 1000/1000 向量逐位一致（`vm_compute; reflexivity`）
- [x] 阴性自检：t_0001 期望 workMode 改错 +1，coqc 报错；恢复后重新通过
- [x] spec 纯定义、tests 全部 `Qed`，无 `Admitted` / 自定义 `Axiom`
- [x] 定向模式 8 类：随机、触发（下标 0）、恰等不触发（下标 13）、
      元素 NaN、阈值 NaN、+Inf 触发、顶下标触发、恰等不触发（下标 0）
- [x] 路径覆盖：触发 430、保持 570；下标 0..13 全覆盖
- [x] 一键复现 `bash FloatTest/tools/run_tests.sh ModeConvert_EIM 1000` 通过
- [x] WKMD_NWM 替身值 0x22 在 cflags 与 spec 中一致

边界声明：采样验证非全称证明；不覆盖内存安全；`m_WorkMode >= 14` 的
越界读属 UB，不在被测行为范围内（驱动保证界内）。
