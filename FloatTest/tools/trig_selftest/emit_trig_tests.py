#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""emit_trig_tests.py — 把 trig_selftest 的 vectors.txt 转成 tests.v。

每行向量生成一条 Coq 引理：
  Example t_XXXX : out_eq64 (ported_sin (f64 (IN))) (f64 (S)) &&
                   out_eq64 (ported_cos (f64 (IN))) (f64 (C)) = true.
  Proof. vm_compute. reflexivity. Qed.

用法: python -X utf8 FloatTest/tools/trig_selftest/emit_trig_tests.py
"""
import os

HERE = os.path.dirname(os.path.abspath(__file__))
VEC = os.path.join(HERE, 'vectors.txt')
OUT = os.path.join(HERE, 'tests.v')

HEADER = '''(* 由 FloatTest/tools/trig_selftest/emit_trig_tests.py 自动生成，请勿手改。
 * ported_sin/ported_cos（Coq, FloatTrig.v）与 ported_trig.c（musl 移植，链接时
 * shadow libm）的逐比特差分：每条向量一对 out_eq64 比较，coqc 通过即测试通过。 *)
Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
From SimpleC.SL Require Import FloatLib.
From Flocq.IEEE754 Require Import BinarySingleNaN Binary Bits.
Require Import FloatTest.lib.FloatTestCommon.
Require Import FloatTest.lib.FloatTrig.

Local Open Scope Z_scope.
'''

def main():
    with open(VEC, encoding='utf-8') as f:
        rows = [ln.split() for ln in f if ln.strip()]
    out = [HEADER]
    for i, cols in enumerate(rows):
        assert len(cols) == 3, f'line {i}: {len(cols)} cols'
        a, s, c = cols
        out.append(f'''
Example t_{i:04d} :
  out_eq64 (ported_sin (f64 ({a}))) (f64 ({s})) &&
  out_eq64 (ported_cos (f64 ({a}))) (f64 ({c})) = true.
Proof. vm_compute. reflexivity. Qed.
''')
    with open(OUT, 'w', encoding='utf-8') as f:
        f.write(''.join(out))
    print(f'{len(rows)} vectors -> {OUT}')

if __name__ == '__main__':
    main()
