#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
emit_tests.py — 把 vectors/<Case>.txt 转成 cases/<Case>/tests.v。

每条向量生成一条 Coq 引理：
  Example t_XXXX : <case>_fun ... = <expected>.
  Proof. vm_compute. reflexivity. Qed.

新增 case：在 EMITTERS 里登记一个发射函数（参数为行号与切分好的列），
并保证参考程序打印的列序与 spec 参数序一致。

用法: python -X utf8 FloatTest/tools/emit_tests.py <Case>
"""
import sys, os

CASE = sys.argv[1] if len(sys.argv) > 1 else 'PseudoRate'
# spec 函数名：SAM 前缀的 case 不能靠首字母小写推导，显式登记
FUN_NAMES = {
    'PseudoRate': 'pseudoRate_fun',
    'ThreeAxisController': 'threeAxisController_fun',
    'SAMSubModeRoll': 'samSubModeRoll_fun',
}
FUN = FUN_NAMES.get(CASE, CASE[0].lower() + CASE[1:] + '_fun')
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
REPO = os.path.dirname(ROOT)
CASE_DIR = os.path.join(REPO, 'OUTPUT', 'SAMCodeSynthesis', CASE)
if os.path.isdir(CASE_DIR):
    # 新布局：case 产物在 OUTPUT/SAMCodeSynthesis/<case>/{rocq,reports}
    VEC = os.path.join(CASE_DIR, 'reports', 'vectors.txt')
    OUT = os.path.join(CASE_DIR, 'rocq', 'tests.v')
    SPEC_REQ = f'OUTPUT.SAMCodeSynthesis.{CASE}.rocq.spec'
else:
    # 旧布局（PseudoRate 试点）：FloatTest/{vectors,cases}/
    VEC = os.path.join(ROOT, 'vectors', CASE + '.txt')
    OUT = os.path.join(ROOT, 'cases', CASE, 'tests.v')
    SPEC_REQ = f'FloatTest.cases.{CASE}.spec'

HEADER = f'''(* 由 FloatTest/tools/emit_tests.py 自动生成，请勿手改。
 * 每条约 1000 条向量一条 vm_compute 定理；coqc 编译通过即差分测试通过。 *)
Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Lists.List.
From SimpleC.SL Require Import FloatLib.
From Flocq.IEEE754 Require Import BinarySingleNaN Binary Bits.
Require Import FloatTest.lib.FloatTestCommon.
Require Import {SPEC_REQ}.

Import ListNotations.
Local Open Scope Z_scope.
'''

def f(bits):
    return f'(f32 ({bits}))'

def lemma(idx, body):
    return f'''
Example t_{idx:04d} :
  {body}.
Proof. vm_compute. reflexivity. Qed.
'''

# ---- PseudoRate：18 列 = 9 输入 + 3 Yp + 3 Yn + 3 r' ----

def emit_pseudorate(idx, cols):
    assert len(cols) == 18, f'line {idx}: {len(cols)} cols'
    pu, r, h1 = cols[0:3], cols[3:6], cols[6:9]
    yp, yn, rb = cols[9:12], cols[12:15], cols[15:18]
    args = ' '.join(f(b) for b in (pu + r + h1))
    expected = f'([{"; ".join(yp)}], [{"; ".join(yn)}], [{"; ".join(rb)}])'
    return lemma(idx, f'{FUN} {args}\n  = {expected}')

# ---- ThreeAxisController：24 列 = 12 输入 + 12 输出 bits ----

def emit_threeaxiscontroller(idx, cols):
    assert len(cols) == 24, f'line {idx}: {len(cols)} cols'
    args = ' '.join(f(b) for b in cols[0:12])
    expected = f'[{"; ".join(cols[12:24])}]'
    return lemma(idx, f'{FUN} {args}\n  = {expected}')

# ---- SAMSubModeRoll：14 列 = 8 输入 + 3 整数输出 + 3 输出 bits ----

def emit_samsubmoderoll(idx, cols):
    assert len(cols) == 14, f'line {idx}: {len(cols)} cols'
    royaw = cols[0]
    curMode, flgSP, countMode, countPublic = cols[1:5]
    ups = cols[5:8]
    wm, cm, cp = cols[8:11]
    outs = cols[11:14]
    args = (f'{f(royaw)} {curMode} {flgSP} {countMode} {countPublic} '
            + ' '.join(f(b) for b in ups))
    expected = f'({wm}, {cm}, {cp}, [{"; ".join(outs)}])'
    return lemma(idx, f'{FUN} {args}\n  = {expected}')

EMITTERS = {
    'PseudoRate': emit_pseudorate,
    'ThreeAxisController': emit_threeaxiscontroller,
    'SAMSubModeRoll': emit_samsubmoderoll,
}

def main():
    lines = [l.strip() for l in open(VEC, encoding='utf-8') if l.strip()]
    emit = EMITTERS[CASE]
    out = [HEADER]
    for idx, line in enumerate(lines):
        out.append(emit(idx, line.split()))
    open(OUT, 'w', encoding='utf-8', newline='\n').write('\n'.join(out))
    print(f'{OUT}: {len(lines)} tests')

if __name__ == '__main__':
    main()
