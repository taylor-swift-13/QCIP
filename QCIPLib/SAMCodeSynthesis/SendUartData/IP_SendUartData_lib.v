(* ============================================================
 * SendUartData 的 Rocq spec
 *
 * C 函数 SendUartDataFun 调用 UartSend 完成串口数据发送。
 * 本文件定义 annotation 中用到的数学谓词：
 *   - SendUartDataPost : 函数执行后的纯数学后置条件
 * ============================================================ *)

Require Import Coq.ZArith.ZArith.

(* 后置条件：当前仅要求调用成功返回，不约束具体硬件状态。 *)
Definition SendUartDataPost (uartno: Z) (buf: Z) (sendsize: Z) : Prop :=
  True.
