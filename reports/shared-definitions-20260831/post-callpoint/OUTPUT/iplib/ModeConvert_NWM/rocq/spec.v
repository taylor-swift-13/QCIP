(* ============================================================
 * ModeConvert_NWM 的 Coq spec（差分测试用）
 *
 * 对应 INPUT/iplib/ModeConvert_NWM/source/IP_ModeConvert_NWM.c 的活跃部分
 * （文件后 ~190 行是被注释的旧版本，不在被测范围）。两个**顺序执行**的 if：
 *
 *   // a.轨控不调姿
 *   if ((m_starTime > csOrbitCtrlData_tpi_OC) &&
 *       (m_starTime < csOrbitCtrlData_tpi_OC + csOrbitCtrlPara_LmtT_Ahead_OCM))
 *       m_WorkMode = WKMD_OCM;
 *
 *   // c.姿态机动
 *   if ((m_starTime > csMnvData_tm_xin) && (csMnvData_F_MnvNextMode == 2))
 *       m_WorkMode = WKMD_AMM;
 *
 * 后者覆盖前者：两条件同时成立时最终为 WKMD_AMM。
 * 注意第一个是开区间 (tpi, tpi+ahead)：两端恰等都不触发；
 * ahead <= 0 时窗口为空，永不触发。
 *
 * 浮点均为 float64：fp64_add 为 IEEE 双精度最近舍入，">" / "<" 遇 NaN
 * 为 false（c_gt64/c_lt64 与 C 一致）。
 *
 * WKMD_OCM / WKMD_AMM：原项目全局模式常量，仓库源中无定义，驱动
 * -DWKMD_OCM=0x33 -DWKMD_AMM=0x44 注入，spec 取同一替身值 51 / 68。
 *
 * spec 是纯函数：
 *   starTime tpi ahead tmXin(fp64)  fNext workMode(Z) → workMode'(Z)
 * ============================================================ *)

Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
From SimpleC.SL Require Import FloatLib.
From Flocq.IEEE754 Require Import BinarySingleNaN Binary Bits.
Require Import FloatTest.lib.FloatTestCommon.

Import ListNotations.
Local Open Scope Z_scope.

Definition WKMD_OCM_Z : Z := 51.   (* 0x33 替身值 *)
Definition WKMD_AMM_Z : Z := 68.   (* 0x44 替身值 *)

Definition modeConvert_NWM_fun
    (starTime tpi ahead tmXin : fp64) (fNext workMode : Z) : Z :=
  let wm1 :=
    if c_gt64 starTime tpi && c_lt64 starTime (fp64_add tpi ahead)
    then WKMD_OCM_Z else workMode in
  if c_gt64 starTime tmXin && (fNext =? 2) then WKMD_AMM_Z else wm1.
