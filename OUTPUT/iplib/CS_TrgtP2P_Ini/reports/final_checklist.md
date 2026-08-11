# CS_TrgtP2P_Ini final-checklist（路线 B 差分测试）

日期：2026-08-11　向量：1000 随机 + 13 定向 = 1013 条（seed 0x9E3779B97F4A7C15）

- [x] `rocq/spec.v`、`rocq/tests.v` 用仓库根 `_CoqProject` 编译通过
- [x] 1013/1013 向量逐位一致（`vm_compute; reflexivity`）
- [x] 阴性自检：t_0500 期望 qro[0] `4576925227527630180 → …181`
      （最低位翻转），coqc 报错（Unable to unify，tests.v line 3018）；
      恢复后全量重新通过
- [x] spec 纯定义、tests 全部 `Qed`，无 `Admitted` / 自定义 `Axiom`
- [x] 定向设计：①F_P2PType 0..5 各 1 条；②wm 三分支（WKMD_OAM/
      WKMD_AMM/0x33/0x7FFF）；③Cro 注入 Rx(π)/Ry(π)/Rz(π) 强制
      C2Q 的 m0/m4/m8 分支（tr>0 由 Cro=I 的定向 1/2 覆盖）
- [x] 分支覆盖统计（1013 条）：wm 三分支 WKMD_OAM 187 / WKMD_AMM
      391 / 其他 435（与驱动 stderr 打桩计数 orbc=187 tar=391
      nul=435 完全一致）；F_P2PType 0..5 = 195/156/176/157/172/157；
      C2Q 四分支 tr>0:422、m0:229、m4:153、m8:209。统计方法：wm/
      ftype 由第 1/2 列直接读取，C2Q 分支由 Cro 的纯比较决定，
      用 Python float 从 vectors.txt 直接分类
- [x] 一键复现 `bash FloatTest/tools/run_tests.sh CS_TrgtP2P_Ini 1000` 通过
- [x] sqrt：C 侧 musl 移植 ported_sqrt.c（正确舍入）↔ Coq 侧
      fp64_sqrt（Bsqrt mode_NE），逐比特一致；自测 2073 向量通过
- [x] 组件库重建约定（C2Q Shepperd q[3] 标量部、Memcpyx=memcpy）与
      打桩（CS_TrgtP2P_OrbCtl_Ini/CS_TrgtP2P_Tar_Init/f_Fun_Null
      空操作、wm 不影响输出由 spec 如实建模）已在 README 专节声明；
      WKMD_OAM=0x55/WKMD_AMM=0x44 替身值与裸全局 m_WorkMode 注入
      同样已声明

边界声明：采样验证非全称证明；不覆盖内存安全；sqrt 真值是 musl
移植而非平台 libm；组件库为重建约定而非原件；三个 mode callee
被打桩（OrbCtl_Ini 全库无实现、Tar_Init 为兄弟 case 单独测试）；
全部输入有限值，未注入 NaN/Inf；F_P2PType 越界为 UB 未注入。
