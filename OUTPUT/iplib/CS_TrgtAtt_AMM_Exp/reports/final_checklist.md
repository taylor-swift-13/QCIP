# CS_TrgtAtt_AMM_Exp final-checklist（路线 B 差分测试）

日期：2026-08-05　向量：1000 随机 + 49 定向 = 1049 条（seed 0x9E3779B97F4A7C15）

- [x] `rocq/spec.v`、`rocq/tests.v` 用仓库根 `_CoqProject` 编译通过
- [x] 1049/1049 向量逐位一致（`vm_compute; reflexivity`）
- [x] 阴性自检：t_0500 期望 qrb0[0] `4604433984081043160 → …161`
      （最低位翻转），coqc 报错；恢复后重新通过
- [x] spec 纯定义、tests 全部 `Qed`，无 `Admitted` / 自定义 `Axiom`
- [x] 定向设计：chi 取 ±(0..8)·π/4 网格（tmpF=chi/2 命中 kernel 边界、
      small-rem 的 1×/2×/3×/4× 分支、π/2/3π/2/2π 的 goto-medium 相消点），
      每个网格点附 chi ±2ulp 邻域（chi=0 除外：raw bits 加减会落入 NaN
      模式，已跳过）；F_Init 0/1 交替；e_xyz 覆盖三个坐标轴方向
- [x] 路径覆盖统计：F_Init=0 530、F_Init=1 519；tmpF kernel(<π/4) 143、
      small-rem(π/4..2π) 906、>2π 0（全部在移植输入域内）
- [x] 一键复现 `bash FloatTest/tools/run_tests.sh CS_TrgtAtt_AMM_Exp 1000` 通过
- [x] sin/cos 使用 musl 移植（ported_trig.c shadow libm +
      `-fno-builtin-sin/-cos`），与 FloatTrig.v 同算法；移植自身自测
      `bash FloatTest/tools/trig_selftest/run.sh 3000` 通过（3176 向量）
- [x] Track_Plan_hook 空操作桩（hook_calls 计数确认触发），Chi_Ref/
      dChi_Ref 作为直接输入，README 备注 1 已声明

边界声明：采样验证非全称证明；不覆盖内存安全；sin/cos 真值是 musl
移植而非平台 libm（README 备注 2）；全部输入有限值，未注入 NaN/Inf。
