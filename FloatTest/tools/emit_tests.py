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
    'SAMSubModePitch': 'samSubModePitch_fun',
    'SAMSubModeDamp': 'samSubModeDamp_fun',
    'DSSDataGet': 'dssDataGet_fun',
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

# ---- SAMSubModeDamp：11 列 = 3 输入 bits + 5 整数输入 + 3 整数输出 ----

def emit_samsubmodedamp(idx, cols):
    assert len(cols) == 11, f'line {idx}: {len(cols)} cols'
    args = (' '.join(f(b) for b in cols[0:3]) + ' '
            + ' '.join(cols[3:8]))
    expected = f'({cols[8]}, {cols[9]}, {cols[10]})'
    return lemma(idx, f'{FUN} {args}\n  = {expected}')

# ---- GyroPick：56 列 = 29 输入 + 27 输出 ----

def emit_gyropick(idx, cols):
    assert len(cols) == 56, f'line {idx}: {len(cols)} cols'
    def lst(xs, wrap=lambda x: x):
        return '[' + '; '.join(wrap(x) for x in xs) + ']'
    args = (f'{lst(cols[0:9], f)} {lst(cols[9:18], f)} {f(cols[18])} '
            f'{cols[19]} {lst(cols[20:29])}')
    expected = (f'({lst(cols[29:38])}, {lst(cols[38:47])}, '
                f'{lst(cols[47:56])})')
    return lemma(idx, f'{FUN} {args}\n  = {expected}')

# ---- DSSDataGet：18 列 = 13 输入 + 5 输出 ----

def emit_dssdataget(idx, cols):
    assert len(cols) == 18, f'line {idx}: {len(cols)} cols'
    bs = '[' + '; '.join(cols[1:12]) + ']'
    args = f'{cols[0]} {bs} {cols[12]}'
    expected = (f'({cols[13]}, {cols[14]}, {cols[15]}, '
                f'{cols[16]}, {cols[17]})')
    return lemma(idx, f'{FUN} {args}\n  = {expected}')

# ---- GyroStateGet：89 列 = 69 输入 + 20 输出 ----

def emit_gyrostateget(idx, cols):
    assert len(cols) == 89, f'line {idx}: {len(cols)} cols'
    def lst(xs):
        return '[' + '; '.join(xs) + ']'
    args = (f'{cols[0]} {lst(cols[1:49])} {cols[49]} '
            f'{lst(cols[50:59])} {lst(cols[59:68])} {cols[68]}')
    expected = (f'({lst(cols[69:78])}, {lst(cols[78:87])}, '
                f'{cols[87]}, {cols[88]})')
    return lemma(idx, f'{FUN} {args}\n  = {expected}')

EMITTERS = {
    'PseudoRate': emit_pseudorate,
    'ThreeAxisController': emit_threeaxiscontroller,
    'SAMSubModeRoll': emit_samsubmoderoll,
    # SAMSubModePitch 与 Roll 列布局相同（14 列），复用同一发射器
    'SAMSubModePitch': emit_samsubmoderoll,
    'SAMSubModeDamp': emit_samsubmodedamp,
    'GyroPick': emit_gyropick,
    'DSSDataGet': emit_dssdataget,
    'GyroStateGet': emit_gyrostateget,
}

def main():
    lines = [l.strip() for l in open(VEC, encoding='utf-8') if l.strip()]
    emit = EMITTERS[CASE]
    out = [HEADER]
    for idx, line in enumerate(lines):
        out.append(emit(idx, line.split()))
    if CASE == 'PseudoRate':
        first = lines[0].split()
        pu, r, h1 = first[0:3], first[3:6], first[6:9]
        yp, yn, rb = first[9:12], first[12:15], first[15:18]
        args = ' '.join(f(b) for b in (pu + r + h1))
        wrong_rb = rb.copy()
        wrong_rb[0] = str(int(wrong_rb[0]) ^ 1)
        wrong = f'([{"; ".join(yp)}], [{"; ".join(yn)}], [{"; ".join(wrong_rb)}])'
        out.append(f'''
Example negative_control_wrong_expected :
  {FUN} {args}
  <> {wrong}.
Proof. vm_compute. discriminate. Qed.
''')
    open(OUT, 'w', encoding='utf-8', newline='\n').write('\n'.join(out))
    print(f'{OUT}: {len(lines)} tests')

if __name__ == '__main__':
    main()
