(* ============================================================
 * UartInit 的 Rocq spec
 *
 * C 函数 UartInitFun 调用 Drv_Uart_Init 完成串口初始化。
 * 本文件定义 annotation 中用到的数学谓词：
 *   - UartInitPost : 函数执行后的纯数学后置条件
 * ============================================================ *)

Require Import Coq.ZArith.ZArith.

(* 后置条件：当前仅要求调用成功返回，不约束具体硬件状态。 *)
Definition UartInitPost (uartno: Z) (baud: Z) (even: Z) (stop: Z) : Prop :=
  True.
