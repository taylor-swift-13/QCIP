# CS_TrgtAtt_OCM final-checklist（路线 B 差分测试）

日期：2026-08-05　向量：1000 随机 + 42 定向 = 1042 条（seed 0x9E3779B97F4A7C15）

- [x] `rocq/spec.v`、`rocq/tests.v` 用仓库根 `_CoqProject` 编译通过
- [x] 1042/1042 向量逐位一致（`vm_compute; reflexivity`）
- [x] 阴性自检：t_0500 期望 qri[0] `4595013851097538831 → …832`
      （最低位翻转），coqc 报错（Unable to unify）；恢复后全量重新通过
- [x] spec 纯定义、tests 全部 `Qed`，无 `Admitted` / 自定义 `Axiom`
- [x] 定向设计：①6 转序 × 6 组姿态角（含 0、±π/2、π/6/π/4/π/3 组合），
      cb=coi=I；②coi ∈ {I, Rx(π), Ry(π), Rz(π)} 逐条强制 C2Q 四分支；
      ③seq 全 0 / 全 999 两条非法转序走 default
- [x] 路径覆盖统计（1042 条）：转序 123:172、132:154、213:166、231:169、
      312:181、321:200（其中非法转序走 default 共 17 条）；C2Q 分支
      tr>0:425、m0:186、m4:202、m8:229。统计方法：cri 由中间量决定，
      用 Python float 按 spec 同序公式从 vectors.txt 重算分类
- [x] 一键复现 `bash FloatTest/tools/run_tests.sh CS_TrgtAtt_OCM 1000` 通过
- [x] sin/cos 使用 musl 移植（ported_trig.c shadow libm +
      `-fno-builtin-sin/-cos`），与 FloatTrig.v 同算法；移植自身自测
      `bash FloatTest/tools/trig_selftest/run.sh 3000` 通过（3176 向量）
- [x] sqrt：C 侧 musl 移植 ported_sqrt.c（正确舍入）↔ Coq 侧
      fp64_sqrt（Bsqrt mode_NE），逐比特一致；自测 2073 向量通过
- [x] CS_Track_Atti() 空操作桩（track_calls=1042 确认逐次触发，
      stderr 记录），输出不依赖该调用，README 已声明
- [x] 组件库重建约定（同 EIM）与裸全局 m_WorkMode 注入已在 README
      专节声明

边界声明：采样验证非全称证明；不覆盖内存安全；sin/cos 真值是 musl
移植而非平台 libm；组件库为重建约定而非原件（README"组件库重建与
打桩声明"节）；全部输入有限值，未注入 NaN/Inf。
