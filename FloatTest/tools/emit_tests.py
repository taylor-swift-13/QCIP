#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
emit_tests.py — 把 vectors/<Case>.txt 转成 cases/<Case>/tests.v。

每条向量生成一条 Coq 引理：
  Example t_XXXX : pseudoRate_fun (f32 pu0) ... = ([...], [...], [...]).
  Proof. vm_compute. reflexivity. Qed.

用法: python -X utf8 FloatTest/tools/emit_tests.py PseudoRate
"""
import sys, os

CASE = sys.argv[1] if len(sys.argv) > 1 else 'PseudoRate'
FUN = CASE[0].lower() + CASE[1:] + '_fun'
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
VEC = os.path.join(ROOT, 'vectors', CASE + '.txt')
OUT = os.path.join(ROOT, 'cases', CASE, 'tests.v')

HEADER = f'''(* 由 FloatTest/tools/emit_tests.py 自动生成，请勿手改。
 * 每条约 1000 条向量一条 vm_compute 定理；coqc 编译通过即差分测试通过。 *)
Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
From SimpleC.SL Require Import FloatLib.
From Flocq.IEEE754 Require Import BinarySingleNaN Binary Bits.
Require Import FloatTest.lib.FloatTestCommon.
Require Import FloatTest.cases.{CASE}.spec.

Import ListNotations.
Local Open Scope Z_scope.
'''

def f(bits):
    return f'(f32 ({bits}))'

def main():
    lines = [l.strip() for l in open(VEC, encoding='utf-8') if l.strip()]
    out = [HEADER]
    for idx, line in enumerate(lines):
        cols = line.split()
        assert len(cols) == 18, f'line {idx}: {len(cols)} cols'
        pu, r, h1 = cols[0:3], cols[3:6], cols[6:9]
        yp, yn, rb = cols[9:12], cols[12:15], cols[15:18]
        args = ' '.join(f(b) for b in (pu + r + h1))
        expected = f'([{"; ".join(yp)}], [{"; ".join(yn)}], [{"; ".join(rb)}])'
        out.append(f'''
Example t_{idx:04d} :
  {FUN} {args}
  = {expected}.
Proof. vm_compute. reflexivity. Qed.
''')
    open(OUT, 'w', encoding='utf-8', newline='\n').write('\n'.join(out))
    print(f'{OUT}: {len(lines)} tests')

if __name__ == '__main__':
    main()
