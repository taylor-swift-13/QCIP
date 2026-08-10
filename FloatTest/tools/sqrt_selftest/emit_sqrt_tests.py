#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""emit_sqrt_tests.py — 把 sqrt_selftest 的 vectors.txt 转成 tests.v。

每行向量生成一条 Coq 引理：
  Example t_XXXX : out_eq64 (fp64_sqrt (f64 (IN))) (f64 (OUT)) = true.
  Proof. vm_compute. reflexivity. Qed.

用法: python -X utf8 FloatTest/tools/sqrt_selftest/emit_sqrt_tests.py
"""
import os

HERE = os.path.dirname(os.path.abspath(__file__))
VEC = os.path.join(HERE, 'vectors.txt')
OUT = os.path.join(HERE, 'tests.v')

HEADER = '''(* 由 FloatTest/tools/sqrt_selftest/emit_sqrt_tests.py 自动生成，请勿手改。
 * fp64_sqrt（Coq, FloatTestCommon.v, Flocq Bsqrt 正确舍入）与 ported_sqrt.c
 * （musl 移植，链接时 shadow libm sqrt）的逐比特差分：每条向量一条 out_eq64
 * 比较（NaN 两侧均视为相等），coqc 通过即测试通过。 *)
Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
From SimpleC.SL Require Import FloatLib.
From Flocq.IEEE754 Require Import BinarySingleNaN Binary Bits.
Require Import FloatTest.lib.FloatTestCommon.

Local Open Scope Z_scope.
'''

def main():
    with open(VEC, encoding='utf-8') as f:
        rows = [ln.split() for ln in f if ln.strip()]
    out = [HEADER]
    for i, cols in enumerate(rows):
        assert len(cols) == 2, f'line {i}: {len(cols)} cols'
        a, s = cols
        out.append(f'''
Example t_{i:04d} :
  out_eq64 (fp64_sqrt (f64 ({a}))) (f64 ({s})) = true.
Proof. vm_compute. reflexivity. Qed.
''')
    with open(OUT, 'w', encoding='utf-8') as f:
        f.write(''.join(out))
    print(f'{len(rows)} vectors -> {OUT}')

if __name__ == '__main__':
    main()
