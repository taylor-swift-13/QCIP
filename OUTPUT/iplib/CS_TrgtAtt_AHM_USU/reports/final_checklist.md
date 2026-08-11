# CS_TrgtAtt_AHM_USU final-checklist（路线 B 差分测试）

日期：2026-08-05　向量：1000 随机 + 23 定向 = 1023 条（seed 0x9E3779B97F4A7C15）

- [x] `rocq/spec.v`、`rocq/tests.v` 用仓库根 `_CoqProject` 编译通过
- [x] 1023/1023 向量逐位一致（`vm_compute; reflexivity`）
- [x] 修正后阴性自检：针对扁平列表输出临时翻转第一条期望输出最低位，
      coqc 报错 `Unable to unify`；正式文件未改且全量重新通过
- [x] spec 纯定义、tests 全部 `Qed`，无 `Admitted` / 自定义 `Axiom`
- [x] 定向设计：①6 转序各 1 条；②非法转序 1 条（w2dEuler 原样透传
      dA_Ref_init=0.11/-0.22/0.33 可观察）；③HybridTrace 9 段各 1 条
      （tmA_eff 取各段中点）；④t_sinacc=0.0005 ≤ 1e-3 的 w_ping 分支；
      ⑤F=2 / FS=1 / wm==WKMD_AMM&&F=0 / wm≠WKMD_AMM 四种组合；
      ⑥mlf=1e-9 限幅清零；⑦非单位 DCM 全链路
- [x] 路径覆盖统计（1023 条）：转序 123:184、132:150、213:160、231:166、
      312:154、321:178、default:31；外层 ratefore:306 / else:717；
      FS 0/1 = 243/63；HybridTrace 9 段（tm<0:18、acc_acc(cos):39、
      acc_const:26、acc_dec(sin):20、vel_const:28、vel_dec(cos):26、
      acc_const2:23、acc_acc2(sin):27、tm≥tm3p:36，仅统计
      ratefore&&FS==0 的 243 条）；t_sinacc≤1e-3 共 17；TorqRef 清零
      96（含随机 mlf=1e-6 与定向）。统计方法：分段/分支均由纯比较决定，
      用 Python float 按 spec 同序公式从 vectors.txt 直接分类
- [x] 一键复现 `bash FloatTest/tools/run_tests.sh CS_TrgtAtt_AHM_USU 1000` 通过
- [x] sin/cos 使用 musl 移植（ported_trig.c shadow libm +
      `-fno-builtin-sin/-cos`），与 FloatTrig.v 同算法；移植自身自测
      `bash FloatTest/tools/trig_selftest/run.sh 3000` 通过（3176 向量）
- [x] sqrt：C 侧 musl 移植 ported_sqrt.c（正确舍入）↔ Coq 侧
      fp64_sqrt（Bsqrt mode_NE），逐比特一致；自测 2073 向量通过
- [x] 组件库重建约定（Angle2C/CS_Angle2C 主动右手+default→321、Q2C
      同号标准展开、C2Q Shepperd、MatrixMulti/VectorNorm3 行主序）与
      打桩（CS_C2Angle→注入 a_ref_in、C2Angle123→空操作移出比较集）
      已在 README 专节声明；WKMD_AMM=3 替身值与裸全局注入同样已声明
- [x] 2026-08-10 修正四个 Angle2C 第一轴符号和两个 C2Q 对称项下标；
      固定 seed 全量回归 1023/1023，通过共享独立姿态 oracle

边界声明：采样验证非全称证明；不覆盖内存安全；sin/cos 真值是 musl
移植而非平台 libm；组件库为重建约定而非原件；CS_C2Angle/C2Angle123
被打桩（asin/atan2 未移植，对应转换不在测试范围内）；全部输入
有限值，未注入 NaN/Inf。
