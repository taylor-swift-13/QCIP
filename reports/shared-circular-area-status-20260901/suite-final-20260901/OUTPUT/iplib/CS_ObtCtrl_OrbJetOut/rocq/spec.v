(* ============================================================
 * CS_ObtCtrl_OrbJetOut 的 Coq spec（差分测试用）
 *
 * 对应 INPUT/iplib/CS_ObtCtrl_OrbJetOut/source/IP_CS_ObtCtrl_OrbJetOut.c
 * （活代码；文件下半部分是大段注释掉的旧版本，不参与测试）：
 *
 *   if (m_starTime >= csOrbitCtrlData_tpi_OC)          // fp64 ">="，NaN 为 false
 *       for (i = 0; i < NUM_THRGR_OC; i++)             // NUM_THRGR_OC = 4（见下）
 *           CS_Jet_ObtOut_t_OC[i] = CS_Jet_ObtOut_FS_OC[i] * m_DeltaT;
 *   else
 *       csOrbitCtrlData_dto_OC = 0.0;
 *
 * 即：到达轨控开机时刻则按选择标志与周期分配 4 路脉宽，否则本周期脉宽清零。
 * 另一分支不写 t_OC / dto，原值透传（spec 相应地把 dto / tIn 当输入返回）。
 *
 * 语义只有一处 fp64 ">=" 比较（c_ge64，NaN→false 与 C 一致）和
 * 4 次 fp64 乘法（fp64_mul = Bmult 53 1024 mode_NE，与 gcc -std=c11 一致）。
 * 透传路径是逐位拷贝：NaN/Inf 输入在透传分支下按原 bits 输出，
 * b64_of_bits/bits_of_b64 往返逐位一致。
 *
 * NUM_THRGR_OC：原项目宏在仓库源中无定义（结构体数组为定长 [4]），
 * 参考驱动以 -DNUM_THRGR_OC=4 注入（见 source/*_cflags.txt），
 * spec 循环展开为定长 4 的列表，与该值一致。
 *
 * 函数不读取的字段（dremain_OC、sumDtp、dGap_OC、m_WorkMode）不进 spec，
 * 参考侧置 0、不打印。
 *
 * spec 是纯函数：
 *   输入  starTime tpi dto deltaT（fp64标量） fs[4] tIn[4]（fp64列表）
 *   输出  (tOut[4] 的 bits, dto' 的 bits)
 * ============================================================ *)

Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
From SimpleC.SL Require Import FloatLib.
From Flocq.IEEE754 Require Import BinarySingleNaN Binary Bits.
Require Import FloatTest.lib.FloatTestCommon.

Import ListNotations.
Local Open Scope Z_scope.

Definition cs_ObtCtrl_OrbJetOut_fun
    (starTime tpi dto deltaT : fp64) (fs tIn : list fp64)
  : list Z * Z :=
  if c_ge64 starTime tpi then
    (map (fun a => bits_of_b64 (fp64_mul a deltaT)) fs, bits_of_b64 dto)
  else
    (map bits_of_b64 tIn, 0).
