# CS_PrecessionNutationCal final-checklist（路线 B 差分测试）

日期：2026-08-11　向量：1000 随机 + 16 定向 = 1016 条（seed 0x9E3779B97F4A7C15）

- [x] `rocq/spec.v`、`rocq/tests.v` 用仓库根 `_CoqProject` 编译通过
- [x] 1016/1016 向量逐位一致（`vm_compute; reflexivity`）
- [x] 阴性自检：t_0500 期望 CPN[0] `4607182381275350864 → …865`
      （最低位翻转），coqc 报错（Unable to unify，tests.v line 3018）；
      恢复后全量重新通过
- [x] spec 纯定义、tests 全部 `Qed`，无 `Admitted` / 自定义 `Axiom`
- [x] 定向设计：①FS=1 × Tc 网格 7 点（0/0.26/0.5/1.0/-0.2/2.0/-1.5
      世纪）；②FS=1 非零四分量叠加 2 条；③FS=0 qd 全零（qd3=1）；
      ④FS=0 小矢量 Q2C 分支；⑤阈值 0.049999/0.05 两侧恰等；
      ⑥FS=0 明显超阈值（单位阵+err+qd3 透传）；⑦阈值由第二/第三
      分量触发各 1 条
- [x] 分支覆盖统计（1016 条）：FS=1（CPNCalc）549、FS=0 四元数分支
      146、FS=0 异常分支 321。统计方法：FS 由第 1 列、F_qJDerr 由第
      10 列直接读取分类
- [x] 一键复现 `bash FloatTest/tools/run_tests.sh CS_PrecessionNutationCal 1000` 通过
- [x] sin/cos 使用 musl 移植（ported_trig.c shadow libm +
      `-fno-builtin-sin/-cos`），与 FloatTrig.v 同算法；移植自身自测
      `bash FloatTest/tools/trig_selftest/run.sh 3000` 通过（3176 向量）
- [x] sqrt：C 侧 musl 移植 ported_sqrt.c（正确舍入）↔ Coq 侧
      fp64_sqrt（Bsqrt mode_NE），逐比特一致；自测 2073 向量通过
- [x] 组件库重建约定（CPN_POLY 朴素逐项+ARC2RAD 角秒→弧度、
      Rx/Ry/Rz Vallado/IAU 被动元旋转、Q2C q[3] 标量部标准展开、
      MatrixMulti333 行主序、TripleFabsMax 两两取大）已在 README
      专节声明；其中 CPN_POLY 的角秒→弧度转换是本题最重要的假设

边界声明：采样验证非全称证明；不覆盖内存安全；sin/cos/sqrt 真值是
musl 移植而非平台 libm；组件库为重建约定而非原件（CPN_POLY/Rx/Ry/Rz/
Q2C/矩阵函数全库无定义）；全部输入有限值，未注入 NaN/Inf。
