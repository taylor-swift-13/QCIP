# ThreeAxisController final-checklist（路线 B 差分测试）

日期：2026-07-24　向量：1000 条（seed 0x9E3779B97F4A7C15）

- [x] `rocq/spec.v`、`rocq/tests.v` 用仓库根 `_CoqProject` 编译通过
- [x] 1000/1000 向量逐位一致（`vm_compute; reflexivity`）
- [x] 阴性自检：t_0000 期望 bits `1090519040 → 1090519041`，
      coqc 报 `Unable to unify`；恢复后重新通过
- [x] spec 纯定义、tests 全部 `Qed`，无 `Admitted` / 自定义 `Axiom`
- [x] 定向模式 8 类：随机 ×2、Up 限幅边界（±8.0f）、Ud 限幅边界（±1.2f）、
      Z 轴 Ud 边界、全零、小信号不饱和、强制 u 饱和
- [x] 一键复现 `bash FloatTest/tools/run_tests.sh ThreeAxisController 1000` 通过

边界声明：采样验证非全称证明；不覆盖内存安全；向量未注入 NaN/Inf 输入
（`LimitFloat` 的 NaN 行为已在 spec 层与 C 语义对齐，见 README 备注）。
