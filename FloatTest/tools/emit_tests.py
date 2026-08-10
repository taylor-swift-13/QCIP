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
    'CS_ObtCtrl_OrbJetOut': 'cs_ObtCtrl_OrbJetOut_fun',
    'CS_GyroData_Disposal': 'cs_GyroData_Disposal_fun',
    'CS_TrgtAtt_AMM_Exp': 'cs_TrgtAtt_AMM_Exp_fun',
    'CS_TrgtAtt_EIM': 'cs_TrgtAtt_EIM_fun',
    'CS_TrgtAtt_AHM_USU': 'cs_TrgtAtt_AHM_USU_fun',
    'CS_TrgtP2P_Tar_Init': 'cs_TrgtP2P_Tar_Init_fun',
    'CS_TrgtAtt_OCM': 'cs_TrgtAtt_OCM_fun',
    'CS_Track_Atti': 'cs_Track_Atti_fun',
}
FUN = FUN_NAMES.get(CASE, CASE[0].lower() + CASE[1:] + '_fun')
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
REPO = os.path.dirname(ROOT)
CASE_DIR = None
SPEC_REQ = None
for base in ('iplib', 'SAMCodeSynthesis'):
    cand = os.path.join(REPO, 'OUTPUT', base, CASE)
    if os.path.isdir(cand):
        # 新布局：case 产物在 OUTPUT/{iplib,SAMCodeSynthesis}/<case>/{rocq,reports}
        CASE_DIR = cand
        SPEC_REQ = f'OUTPUT.{base}.{CASE}.rocq.spec'
        break
if CASE_DIR is not None:
    VEC = os.path.join(CASE_DIR, 'reports', 'vectors.txt')
    OUT = os.path.join(CASE_DIR, 'rocq', 'tests.v')
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

# ---- ModeConvert_SBM：5 列 = 3 输入 bits64 + workMode 输入 + workMode' ----

def emit_modeconvert_sbm(idx, cols):
    assert len(cols) == 5, f'line {idx}: {len(cols)} cols'
    args = ' '.join(f'(f64 ({b}))' for b in cols[0:3]) + f' {cols[3]}'
    return lemma(idx, f'{FUN} {args}\n  = {cols[4]}')

# ---- ModeConvert_EIM/AHM：17 列 = 14 元素 bits64 + 阈值 bits64 + wm → wm' ----

def emit_modeconvert_eim(idx, cols):
    assert len(cols) == 17, f'line {idx}: {len(cols)} cols'
    arr = '[' + '; '.join(f'(f64 ({b}))' for b in cols[0:14]) + ']'
    args = f'{arr} (f64 ({cols[14]})) {cols[15]}'
    return lemma(idx, f'{FUN} {args}\n  = {cols[16]}')

# ---- ModeConvert_AMM：8 列 = 5 输入 bits64 + F + wm → wm' ----

def emit_modeconvert_amm(idx, cols):
    assert len(cols) == 8, f'line {idx}: {len(cols)} cols'
    args = (' '.join(f'(f64 ({b}))' for b in cols[0:5])
            + f' {cols[5]} {cols[6]}')
    return lemma(idx, f'{FUN} {args}\n  = {cols[7]}')

# ---- ModeConvert_NWM：7 列 = 4 输入 bits64 + F + wm → wm' ----

def emit_modeconvert_nwm(idx, cols):
    assert len(cols) == 7, f'line {idx}: {len(cols)} cols'
    args = (' '.join(f'(f64 ({b}))' for b in cols[0:4])
            + f' {cols[4]} {cols[5]}')
    return lemma(idx, f'{FUN} {args}\n  = {cols[6]}')

# ---- CS_ObtCtrl_OrbJetOut：17 列 = 12 输入 bits64 + 5 输出 bits64 ----

def emit_cs_obtctrl_orbjetout(idx, cols):
    assert len(cols) == 17, f'line {idx}: {len(cols)} cols'
    scalars = ' '.join(f'(f64 ({b}))' for b in cols[0:4])
    fs = '[' + '; '.join(f'(f64 ({b}))' for b in cols[4:8]) + ']'
    tin = '[' + '; '.join(f'(f64 ({b}))' for b in cols[8:12]) + ']'
    tout = '[' + '; '.join(cols[12:16]) + ']'
    args = f'{scalars} {fs} {tin}'
    return lemma(idx, f'{FUN} {args}\n  = ({tout}, {cols[16]})')

# ---- CS_GyroData_Disposal：80 列 = 70 输入 + 10 输出 ----

def emit_cs_gyrodata_disposal(idx, cols):
    assert len(cols) == 80, f'line {idx}: {len(cols)} cols'
    zl = lambda xs: '[' + '; '.join(xs) + ']'
    fl = lambda xs: '[' + '; '.join(f'(f64 ({b}))' for b in xs) + ']'
    args = (f'{cols[0]} {cols[1]} {cols[2]} {zl(cols[3:17])} {zl(cols[17:26])} '
            f'{fl(cols[26:35])} {fl(cols[35:62])} {fl(cols[62:65])} {fl(cols[65:68])} '
            f'(f64 ({cols[68]})) (f64 ({cols[69]}))')
    expected = (f'({cols[70]}, {zl(cols[71:74])}, '
                f'{zl(cols[74:77])}, {zl(cols[77:80])})')
    return lemma(idx, f'{FUN} {args}\n  = {expected}')

# ---- CS_TrgtAtt_AMM_Exp：25 列 = 1 整数 + 13 输入 bits64 + 11 输出 bits64 ----

def emit_cs_trgtatt_amm_exp(idx, cols):
    assert len(cols) == 25, f'line {idx}: {len(cols)} cols'
    zl = lambda xs: '[' + '; '.join(xs) + ']'
    args = (f'{cols[0]} ' + ' '.join(f'(f64 ({b}))' for b in cols[1:14]))
    expected = (f'({zl(cols[14:18])}, {zl(cols[18:21])}, '
                f'{cols[21]}, {cols[22]}, {cols[23]}, {cols[24]})')
    return lemma(idx, f'{FUN} {args}\n  = {expected}')

# ---- CS_TrgtAtt_EIM：58 列 = wm(1) + seq(14) + 24 输入 bits64 + 19 输出 bits64 ----

def emit_cs_trgtatt_eim(idx, cols):
    assert len(cols) == 58, f'line {idx}: {len(cols)} cols'
    zl = lambda xs: '[' + '; '.join(xs) + ']'
    fl = lambda xs: '[' + '; '.join(f'(f64 ({b}))' for b in xs) + ']'
    args = (f'{cols[0]} {zl(cols[1:15])} {fl(cols[15:18])} {fl(cols[18:27])} '
            f'{fl(cols[27:36])} {fl(cols[36:39])}')
    expected = (f'({zl(cols[39:48])}, {zl(cols[48:51])}, '
                f'{zl(cols[51:55])}, {zl(cols[55:58])})')
    return lemma(idx, f'{FUN} {args}\n  = {expected}')

# ---- CS_TrgtAtt_AHM_USU：148 列 = wm + seq(14) + fmn fs（17 整数列）
#      + 87 输入 bits64 + 44 输出 bits64（输出为扁平 list Z） ----

def emit_cs_trgtatt_ahm_usu(idx, cols):
    assert len(cols) == 148, f'line {idx}: {len(cols)} cols'
    zl = lambda xs: '[' + '; '.join(xs) + ']'
    fl = lambda xs: '[' + '; '.join(f'(f64 ({b}))' for b in xs) + ']'
    args = (f'{cols[0]} {zl(cols[1:15])} {cols[15]} {cols[16]} '
            f'(f64 ({cols[17]})) (f64 ({cols[18]})) '
            f'{fl(cols[19:22])} {fl(cols[22:31])} {fl(cols[31:40])} '
            f'{fl(cols[40:49])} {fl(cols[49:58])} {fl(cols[58:61])} '
            f'{fl(cols[61:64])} {fl(cols[64:67])} {fl(cols[67:70])} '
            f'{fl(cols[70:73])} (f64 ({cols[73]})) {fl(cols[74:77])} '
            f'(f64 ({cols[77]})) {fl(cols[78:90])} {fl(cols[90:93])} '
            f'{fl(cols[93:102])} (f64 ({cols[102]})) (f64 ({cols[103]}))')
    return lemma(idx, f'{FUN} {args}\n  = {zl(cols[104:148])}')

# ---- CS_TrgtP2P_Tar_Init：48 列 = mode+wm+seq14 + 21 输入 bits64
#      + Cro[9] bits64 + sub/null 调用次数 ----

def emit_cs_trgtp2p_tar_init(idx, cols):
    assert len(cols) == 48, f'line {idx}: {len(cols)} cols'
    zl = lambda xs: '[' + '; '.join(xs) + ']'
    fl = lambda xs: '[' + '; '.join(f'(f64 ({b}))' for b in xs) + ']'
    args = (f'{cols[0]} {cols[1]} {zl(cols[2:16])} {fl(cols[16:19])} '
            f'{fl(cols[19:28])} {fl(cols[28:37])}')
    expected = f'({zl(cols[37:46])}, {cols[46]}, {cols[47]})'
    return lemma(idx, f'{FUN} {args}\n  = {expected}')

# ---- CS_TrgtAtt_OCM：59 列 = EIM 的 58 列 + Track_Atti 调用次数 ----

def emit_cs_trgtatt_ocm(idx, cols):
    assert len(cols) == 59, f'line {idx}: {len(cols)} cols'
    zl = lambda xs: '[' + '; '.join(xs) + ']'
    fl = lambda xs: '[' + '; '.join(f'(f64 ({b}))' for b in xs) + ']'
    args = (f'{cols[0]} {zl(cols[1:15])} {fl(cols[15:18])} {fl(cols[18:27])} '
            f'{fl(cols[27:36])} {fl(cols[36:39])}')
    expected = (f'({zl(cols[39:48])}, {zl(cols[48:51])}, '
                f'{zl(cols[51:55])}, {zl(cols[55:58])}, {cols[58]})')
    return lemma(idx, f'{FUN} {args}\n  = {expected}')

# ---- CS_Track_Atti：64 列 = wm+seq14 + 30 输入 bits64
#      + 六组 3 元 bits64 输出 + C2Angle dispatch tag ----

def emit_cs_track_atti(idx, cols):
    assert len(cols) == 64, f'line {idx}: {len(cols)} cols'
    zl = lambda xs: '[' + '; '.join(xs) + ']'
    fl = lambda xs: '[' + '; '.join(f'(f64 ({b}))' for b in xs) + ']'
    args = (f'{cols[0]} {zl(cols[1:15])} {fl(cols[15:18])} '
            f'{fl(cols[18:21])} {fl(cols[21:24])} {fl(cols[24:27])} '
            f'{fl(cols[27:30])} {fl(cols[30:33])} (f64 ({cols[33]})) '
            f'{fl(cols[34:43])} (f64 ({cols[43]})) (f64 ({cols[44]}))')
    expected = (f'({zl(cols[45:48])}, {zl(cols[48:51])}, '
                f'{zl(cols[51:54])}, {zl(cols[54:57])}, '
                f'{zl(cols[57:60])}, {zl(cols[60:63])}, {cols[63]})')
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
    'ModeConvert_SBM': emit_modeconvert_sbm,
    # ModeConvert_OCM 与 SBM 列布局相同（5 列），复用同一发射器
    'ModeConvert_OCM': emit_modeconvert_sbm,
    # ModeConvert_EIM/AHM 列布局相同（17 列），共用同一发射器
    'ModeConvert_EIM': emit_modeconvert_eim,
    'ModeConvert_AHM': emit_modeconvert_eim,
    'ModeConvert_AMM': emit_modeconvert_amm,
    'ModeConvert_NWM': emit_modeconvert_nwm,
    'CS_ObtCtrl_OrbJetOut': emit_cs_obtctrl_orbjetout,
    'CS_GyroData_Disposal': emit_cs_gyrodata_disposal,
    'CS_TrgtAtt_AMM_Exp': emit_cs_trgtatt_amm_exp,
    'CS_TrgtAtt_EIM': emit_cs_trgtatt_eim,
    'CS_TrgtAtt_AHM_USU': emit_cs_trgtatt_ahm_usu,
    'CS_TrgtP2P_Tar_Init': emit_cs_trgtp2p_tar_init,
    'CS_TrgtAtt_OCM': emit_cs_trgtatt_ocm,
    'CS_Track_Atti': emit_cs_track_atti,
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
