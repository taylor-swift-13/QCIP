# CS_TrgtAtt_EIM final-checklist（路线 B 差分测试）

日期：2026-08-05　向量：1000 随机 + 42 定向 = 1042 条（seed 0x9E3779B97F4A7C15）

- [x] `rocq/spec.v`、`rocq/tests.v` 用仓库根 `_CoqProject` 编译通过
- [x] 1042/1042 向量逐位一致（`vm_compute; reflexivity`）
- [x] 修正后阴性自检：临时翻转第一条期望输出最低位，coqc 报错
      `Unable to unify`；正式文件未改且全量重新通过
- [x] spec 纯定义、tests 全部 `Qed`，无 `Admitted` / 自定义 `Axiom`
- [x] 定向设计：①6 转序 × 6 组姿态角（含 0、±π/2、π/6/π/4/π/3 组合），
      cb=coi=I；②coi ∈ {I, Rx(π), Ry(π), Rz(π)} 逐条强制 C2Q 四分支；
      ③seq 全 0 / 全 999 两条非法转序走 default
- [x] 路径覆盖统计（1042 条）：转序 123:172、132:154、213:166、231:169、
      312:181、321:200（其中非法转序走 default 共 17 条）；C2Q 分支
      tr>0:442、m0:182、m4:203、m8:215。统计方法：cri 由中间量决定，
      用 Python float 按 spec 同序公式从 vectors.txt 重算分类
      （math.sin/cos 与 musl 移植的 ~1ulp 差不影响严格 > 分支判定）
- [x] 一键复现 `bash FloatTest/tools/run_tests.sh CS_TrgtAtt_EIM 1000` 通过
- [x] sin/cos 使用 musl 移植（ported_trig.c shadow libm +
      `-fno-builtin-sin/-cos`），与 FloatTrig.v 同算法；移植自身自测
      `bash FloatTest/tools/trig_selftest/run.sh 3000` 通过（3176 向量）
- [x] sqrt：C 侧 libm（IEEE 正确舍入）↔ Coq 侧 fp64_sqrt（Flocq Bsqrt
      mode_NE，正确舍入），逐比特一致
- [x] 组件库重建约定（Angle2C 主动右手/参量序=轴号、MatrixMulti 行主序
      0.0 起 k 升序、C2Q Shepperd q[3] 标量部）已在 README 专节声明；
      C 与 spec 逐式同序（含一元负号 `(-c2)*s3` ≡ `fp64_neg` 先取负，
      与 `-(c2*s3)` 比特等价）
- [x] 2026-08-10 修正四个 Angle2C 第一轴符号与两个 C2Q 对称项下标；
      固定 seed 重新生成 1042 条并全量通过；独立 oracle 通过
      6×10000 Angle2C 样本与 4 个 C2Q 精确锚点

边界声明：采样验证非全称证明；不覆盖内存安全；sin/cos 真值是 musl
移植而非平台 libm；组件库为重建约定而非原件（README"组件库重建声明"
节）；全部输入有限值，未注入 NaN/Inf。
