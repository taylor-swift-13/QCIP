# CS_TrgtAtt_NWM_USU final-checklist（路线 B 差分测试）

日期：2026-08-09　向量：1000 随机 + 25 定向 = 1025 条（seed 0x9E3779B97F4A7C15）

- [x] `rocq/spec.v`、`rocq/tests.v` 用仓库根 `_CoqProject` 编译通过
- [x] 1025/1025 向量逐位一致（`vm_compute; reflexivity`）
- [x] 阴性自检：t_0500 期望 Cro_si[0] `4583261411349745190 → …191`
      （最低位翻转），coqc 报错（Unable to unify，tests.v line 3018）；
      恢复后全量重新通过
- [x] spec 纯定义、tests 全部 `Qed`，无 `Admitted` / 自定义 `Axiom`
- [x] 定向设计：①6 转序 × 3 组参数组合（psi/dpsi/工作模式搭配）；
      ②恒等 coi 与绕轴 180° coi（强制 C2Q 四个分支各自命中）；
      ③非法转序（default→321，本 case 内嵌包装器 CS_Angle2CX_temp1
      的真实分支）；④psi=dpsi=0 边界；⑤非单位阵全链路
- [x] 路径覆盖统计（1025 条）：转序 123:154、132:170、213:154、
      231:156、312:171、321:220（含非法转序 default 命中 32 条）；
      C2Q 四分支 tr>0:428、m0:193、m4:198、m8:206。统计方法：转序由
      wm/seq 直接查表，C2Q 分支由中间量 cri=Cro*coi 的纯比较决定，
      用 Python float 按 spec 同序公式从 vectors.txt 直接分类
- [x] 一键复现 `bash FloatTest/tools/run_tests.sh CS_TrgtAtt_NWM_USU 1000` 通过
- [x] sin/cos 使用 musl 移植（ported_trig.c shadow libm +
      `-fno-builtin-sin/-cos`），与 FloatTrig.v 同算法；移植自身自测
      `bash FloatTest/tools/trig_selftest/run.sh 3000` 通过（3176 向量）
- [x] sqrt：C 侧 musl 移植 ported_sqrt.c（正确舍入）↔ Coq 侧
      fp64_sqrt（Bsqrt mode_NE），逐比特一致；自测
      `bash FloatTest/tools/sqrt_selftest/run.sh 2000` 通过（2073 向量）。
      本题的 t_0861 曾暴露 MSVCRT sqrt 1-ulp 误舍入（x = tr+1.0 =
      bits 4611094754575247804，MSVCRT 给出 …034，正确舍入 …033），
      是引入 ported_sqrt.c 的直接动因
- [x] 组件库重建约定（Angle2C 主动右手/参量序=轴号、MatrixMulti 行主序
      0.0 起 k 升序、C2Q Shepperd q[3] 标量部）与打桩（C2Angle123→
      空操作、A_Ref_si 移出比较集）已在 README 专节声明；default→321
      为本 case 真实代码、结构体字段 m_WorkMode 真实使用同样已声明

边界声明：采样验证非全称证明；不覆盖内存安全；sin/cos/sqrt 真值是
musl 移植而非平台 libm；组件库为重建约定而非原件；C2Angle123 被打桩
（asin/atan2 未移植，对应转换不在测试范围内）；全部输入有限值，
未注入 NaN/Inf。
