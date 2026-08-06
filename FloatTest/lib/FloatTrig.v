(* ============================================================
 * FloatTrig — musl libc sin/cos 的 fp64 逐比特复刻（FloatTest 差分测试用）
 *
 * 与 FloatTest/ref/ported_trig.c 同算法、同运算顺序、同常数 bit pattern：
 * 两侧的每一项 fp64 运算都对应 C 里的同一个 double 表达式
 * （fp64_add/sub/mul = Bplus/Bminus/Bmult 53 1024 mode_NE，
 *   与 gcc -std=c11 -O0（x86-64、无 FMA 收缩）逐比特一致）。
 *
 * 输入域纪律（与 ported_trig.c 头部注释一致，测试向量必须遵守）：
 *   - 只覆盖 |x| < 2^20*(pi/2) ≈ 1.645e6 的有限输入（small + medium 约减，
 *     无 Payne-Hanek）；越域有限输入两侧都返回 canonical NaN
 *     0x7FF8000000000000（防御分支，正常不触发）；
 *   - 不注入 Inf/NaN：C 侧 x-x 在硬件上产生 0xFFF8... 的负 NaN，而
 *     Flocq 的 fp64_sub 产生 canonical NaN，payload 不一致。
 *   - medium 路径的 (int32_t)fn 转换用 trunc_to_Z 建模：调用域内 fn 为
 *     整数值且 |fn| <= 2^20+1，向零取整精确。
 *
 * 常数用十六进制 bit pattern（与 musl 源码注释中的 word pair 一一对应）。
 * ============================================================ *)

Require Import Coq.ZArith.ZArith.
From SimpleC.SL Require Import FloatLib.
From Flocq.IEEE754 Require Import BinarySingleNaN Binary Bits.
Require Import FloatTest.lib.FloatTestCommon.

Local Open Scope Z_scope.

(* ---- kernel 多项式系数（__sin.c / __cos.c） ---- *)

Definition S1 : fp64 := f64 0xBFC5555555555549.
Definition S2 : fp64 := f64 0x3F8111111110F8A6.
Definition S3 : fp64 := f64 0xBF2A01A019C161D5.
Definition S4 : fp64 := f64 0x3EC71DE357B1FE7D.
Definition S5 : fp64 := f64 0xBE5AE5E68A2B9CEB.
Definition S6 : fp64 := f64 0x3DE5D93A5ACFD57C.

Definition C1 : fp64 := f64 0x3FA555555555554C.
Definition C2 : fp64 := f64 0xBF56C16C16C15177.
Definition C3 : fp64 := f64 0x3EFA01A019CB1590.
Definition C4 : fp64 := f64 0xBE927E4F809C52AD.
Definition C5 : fp64 := f64 0x3E21EE9EBDB4B1C4.
Definition C6 : fp64 := f64 0xBDA8FAE9BE8838D4.

(* ---- __rem_pio2.c 常数 ---- *)

Definition TOINT   : fp64 := f64 0x4338000000000000. (* 1.5/DBL_EPSILON = 1.5*2^52 *)
Definition PIO4    : fp64 := f64 0x3FE921FB54442D18. (* pi/4 *)
Definition NEG_PIO4: fp64 := f64 0xBFE921FB54442D18.
Definition INVPIO2 : fp64 := f64 0x3FE45F306DC9C883. (* 2/pi，53 位 *)
Definition PIO2_1  : fp64 := f64 0x3FF921FB54400000. (* pi/2 头 33 位 *)
Definition PIO2_1T : fp64 := f64 0x3DD0B4611A626331.
Definition PIO2_2  : fp64 := f64 0x3DD0B4611A600000.
Definition PIO2_2T : fp64 := f64 0x3BA3198A2E037073.
Definition PIO2_3  : fp64 := f64 0x3BA3198A2E000000.
Definition PIO2_3T : fp64 := f64 0x397B839A252049C1.

(* ---- 常用标量 ---- *)

Definition ZERO64     : fp64 := f64 0x0000000000000000.
Definition ONE64      : fp64 := f64 0x3FF0000000000000.
Definition HALF64     : fp64 := f64 0x3FE0000000000000.
Definition TWO64      : fp64 := f64 0x4000000000000000.
Definition NAN_CANON  : fp64 := f64 0x7FF8000000000000.

(* ---- bit 辅助 ---- *)

(* musl GET_HIGH_WORD(ix, x) 后 ix &= 0x7fffffff *)
Definition abs_ix (x : fp64) : Z :=
  Z.land (Z.shiftr (bits_of_b64 x) 32) 0x7fffffff.

Definition sign_bit (x : fp64) : Z := Z.shiftr (bits_of_b64 x) 63.

(* u.i>>52 & 0x7ff *)
Definition exp_field (x : fp64) : Z :=
  Z.land (Z.shiftr (bits_of_b64 x) 52) 0x7ff.

(* C 的 (int32_t)double：向零取整。
 * 本模块调用域内 f 为整数值且 |f| <= 2^20+1（medium 路径的 fn），
 * 次正规/零/<1 的情况截断为 0，与 C 一致。 *)
Definition trunc_to_Z (f : fp64) : Z :=
  let b := bits_of_b64 f in
  let s := Z.shiftr b 63 in
  let e := Z.land (Z.shiftr b 52) 0x7ff in
  let m := Z.lor (Z.land b 0xfffffffffffff) 0x10000000000000 in
  let mag :=
    if e <? 1023 then 0
    else
      let sh := e - 1023 - 52 in
      if sh >=? 0 then Z.shiftl m sh else Z.shiftr m (- sh)
  in
  if s =? 0 then mag else - mag.

(* ---- __sin.c：[-pi/4, pi/4] kernel（iy=false 表示 y==0） ---- *)

Definition kernel_sin (x y : fp64) (iy : bool) : fp64 :=
  let z := fp64_mul x x in
  let w := fp64_mul z z in
  let r := fp64_add
             (fp64_add S2 (fp64_mul z (fp64_add S3 (fp64_mul z S4))))
             (fp64_mul (fp64_mul z w) (fp64_add S5 (fp64_mul z S6))) in
  let v := fp64_mul z x in
  if iy then
    fp64_sub x
      (fp64_sub
         (fp64_sub (fp64_mul z (fp64_sub (fp64_mul HALF64 y) (fp64_mul v r))) y)
         (fp64_mul v S1))
  else
    fp64_add x (fp64_mul v (fp64_add S1 (fp64_mul z r))).

(* ---- __cos.c：[-pi/4, pi/4] kernel ---- *)

Definition kernel_cos (x y : fp64) : fp64 :=
  let z := fp64_mul x x in
  let w0 := fp64_mul z z in
  let r := fp64_add
             (fp64_mul z (fp64_add C1 (fp64_mul z (fp64_add C2 (fp64_mul z C3)))))
             (fp64_mul (fp64_mul w0 w0)
                       (fp64_add C4 (fp64_mul z (fp64_add C5 (fp64_mul z C6))))) in
  let hz := fp64_mul HALF64 z in
  let w := fp64_sub ONE64 hz in
  fp64_add w
    (fp64_add (fp64_sub (fp64_sub ONE64 w) hz)
              (fp64_sub (fp64_mul z r) (fp64_mul x y))).

(* ---- __rem_pio2.c medium 路径：|x| < 2^20*(pi/2) ---- *)

Definition rem_pio2_medium (x : fp64) (ix : Z) : Z * fp64 * fp64 :=
  (* fn = rint(x*invpio2)，toint 技巧（最近舍入，与 C 一致） *)
  let fn0 := fp64_sub (fp64_add (fp64_mul x INVPIO2) TOINT) TOINT in
  let n0 := trunc_to_Z fn0 in
  (* 越界修正：r - w < -pio4 → n--,fn--；r - w > pio4 → n++,fn++ *)
  let r00 := fp64_sub x (fp64_mul fn0 PIO2_1) in
  let w00 := fp64_mul fn0 PIO2_1T in
  let rw := fp64_sub r00 w00 in
  let '(n, fn) :=
    if c_lt64 rw NEG_PIO4 then (n0 - 1, fp64_sub fn0 ONE64)
    else if c_gt64 rw PIO4 then (n0 + 1, fp64_add fn0 ONE64)
    else (n0, fn0) in
  let r1 := fp64_sub x (fp64_mul fn PIO2_1) in
  let w1 := fp64_mul fn PIO2_1T in
  let y0 := fp64_sub r1 w1 in
  let ex := Z.shiftr ix 20 in
  let ey := exp_field y0 in
  let '(r, w, y0f) :=
    if ex - ey >? 16 then                 (* 第二轮，精确到 118 位 *)
      let t := r1 in
      let wa := fp64_mul fn PIO2_2 in
      let r2 := fp64_sub t wa in
      let w2 := fp64_sub (fp64_mul fn PIO2_2T) (fp64_sub (fp64_sub t r2) wa) in
      let y02 := fp64_sub r2 w2 in
      let ey2 := exp_field y02 in
      if ex - ey2 >? 49 then              (* 第三轮，精确到 151 位 *)
        let t2 := r2 in
        let wb := fp64_mul fn PIO2_3 in
        let r3 := fp64_sub t2 wb in
        let w3 := fp64_sub (fp64_mul fn PIO2_3T) (fp64_sub (fp64_sub t2 r3) wb) in
        (r3, w3, fp64_sub r3 w3)
      else (r2, w2, y02)
    else (r1, w1, y0) in
  let y1 := fp64_sub (fp64_sub r y0f) w in
  (n, y0f, y1).

(* ---- __rem_pio2.c：small + medium（large 已删，越域返回 canonical NaN） ---- *)

Definition rem_pio2_ported (x : fp64) : Z * fp64 * fp64 :=
  let sign := sign_bit x in
  let ix := abs_ix x in
  if ix <=? 0x400f6a7a then                          (* |x| ~<= 5pi/4 *)
    if Z.land ix 0xfffff =? 0x921fb then             (* |x| ~= pi/2, 2pi/2 *)
      rem_pio2_medium x ix
    else if ix <=? 0x4002d97c then                   (* |x| ~<= 3pi/4 *)
      if sign =? 0 then
        let z := fp64_sub x PIO2_1 in
        let y0 := fp64_sub z PIO2_1T in
        (1, y0, fp64_sub (fp64_sub z y0) PIO2_1T)
      else
        let z := fp64_add x PIO2_1 in
        let y0 := fp64_add z PIO2_1T in
        (-1, y0, fp64_add (fp64_sub z y0) PIO2_1T)
    else
      if sign =? 0 then
        let z := fp64_sub x (fp64_mul TWO64 PIO2_1) in
        let y0 := fp64_sub z (fp64_mul TWO64 PIO2_1T) in
        (2, y0, fp64_sub (fp64_sub z y0) (fp64_mul TWO64 PIO2_1T))
      else
        let z := fp64_add x (fp64_mul TWO64 PIO2_1) in
        let y0 := fp64_add z (fp64_mul TWO64 PIO2_1T) in
        (-2, y0, fp64_add (fp64_sub z y0) (fp64_mul TWO64 PIO2_1T))
  else if ix <=? 0x401c463b then                     (* |x| ~<= 9pi/4 *)
    if ix <=? 0x4015fdbc then                        (* |x| ~<= 7pi/4 *)
      if ix =? 0x4012d97c then                       (* |x| ~= 3pi/2 *)
        rem_pio2_medium x ix
      else if sign =? 0 then
        let z := fp64_sub x (fp64_mul (f64 0x4008000000000000) PIO2_1) in
        let y0 := fp64_sub z (fp64_mul (f64 0x4008000000000000) PIO2_1T) in
        (3, y0, fp64_sub (fp64_sub z y0) (fp64_mul (f64 0x4008000000000000) PIO2_1T))
      else
        let z := fp64_add x (fp64_mul (f64 0x4008000000000000) PIO2_1) in
        let y0 := fp64_add z (fp64_mul (f64 0x4008000000000000) PIO2_1T) in
        (-3, y0, fp64_add (fp64_sub z y0) (fp64_mul (f64 0x4008000000000000) PIO2_1T))
    else
      if ix =? 0x401921fb then                       (* |x| ~= 4pi/2 *)
        rem_pio2_medium x ix
      else if sign =? 0 then
        let z := fp64_sub x (fp64_mul (f64 0x4010000000000000) PIO2_1) in
        let y0 := fp64_sub z (fp64_mul (f64 0x4010000000000000) PIO2_1T) in
        (4, y0, fp64_sub (fp64_sub z y0) (fp64_mul (f64 0x4010000000000000) PIO2_1T))
      else
        let z := fp64_add x (fp64_mul (f64 0x4010000000000000) PIO2_1) in
        let y0 := fp64_add z (fp64_mul (f64 0x4010000000000000) PIO2_1T) in
        (-4, y0, fp64_add (fp64_sub z y0) (fp64_mul (f64 0x4010000000000000) PIO2_1T))
  else if ix <? 0x413921fb then                      (* |x| ~< 2^20*(pi/2) *)
    rem_pio2_medium x ix
  else
    (0, NAN_CANON, NAN_CANON).                       (* 防御：越域有限输入 *)

(* ---- sin.c / cos.c ---- *)

Definition ported_sin (x : fp64) : fp64 :=
  let ix := abs_ix x in
  if ix <=? 0x3fe921fb then                          (* |x| ~< pi/4 *)
    if ix <? 0x3e500000 then x                       (* |x| < 2**-26 *)
    else kernel_sin x ZERO64 false
  else if ix >=? 0x7ff00000 then fp64_sub x x        (* Inf/NaN：不入向量 *)
  else
    let '(n, y0, y1) := rem_pio2_ported x in
    match Z.land n 3 with
    | 0 => kernel_sin y0 y1 true
    | 1 => kernel_cos y0 y1
    | 2 => fp64_neg (kernel_sin y0 y1 true)
    | _ => fp64_neg (kernel_cos y0 y1)
    end.

Definition ported_cos (x : fp64) : fp64 :=
  let ix := abs_ix x in
  if ix <=? 0x3fe921fb then                          (* |x| ~< pi/4 *)
    if ix <? 0x3e46a09e then ONE64                   (* |x| < 2**-27*sqrt(2) *)
    else kernel_cos x ZERO64
  else if ix >=? 0x7ff00000 then fp64_sub x x        (* Inf/NaN：不入向量 *)
  else
    let '(n, y0, y1) := rem_pio2_ported x in
    match Z.land n 3 with
    | 0 => kernel_cos y0 y1
    | 1 => fp64_neg (kernel_sin y0 y1 true)
    | 2 => fp64_neg (kernel_cos y0 y1)
    | _ => kernel_sin y0 y1 true
    end.
