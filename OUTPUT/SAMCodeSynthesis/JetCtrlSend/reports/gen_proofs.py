#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
为 JetCtrlSend 生成 proof_auto.v / proof_manual.v。

输入：QCIPCases/SAMCodeSynthesis/JetCtrlSend/ 下 symexec 生成的
  goal.v（witness 定义）与 proof_auto / proof_manual 骨架（引理名与顺序）。

做法：按 witness 名称与 goal 文本形状分类，套用已在 .tmp/bitop_test/proof_test.v
中编译验证过的证明模板。无法分类的引理保留 Admitted 并打印警告。
"""
import re, sys

CASE_DIR = 'QCIPCases/SAMCodeSynthesis/JetCtrlSend'
GOAL = CASE_DIR + '/IP_JetCtrlSend_goal.v'
AUTO_SKEL = CASE_DIR + '/IP_JetCtrlSend_proof_auto.v'
MANUAL_SKEL = CASE_DIR + '/IP_JetCtrlSend_proof_manual.v'

text = open(GOAL, encoding='utf-8').read()

defs = {}
for m in re.finditer(r'\nDefinition (\w+) := \n?(.*?)(?=\nDefinition |\Z)', text, re.S):
    defs[m.group(1)] = m.group(2)

warnings = []

ZLENGTH_SB_PREH = re.compile(r'\(PreH(\d+) : \(\(Zlength \(sb_list\)\) = 3\)\)')
UARTREC_PREH = re.compile(r'\(PreH(\d+) : \(UartSendRecord')

def preh_jetstep_eqs(body):
    """PreHn : (R = ((jet_step ((Znth a ...)) ((Znth b ...)) (W) (m))))
    返回 dict: R -> (PreHname, W, mask)"""
    out = {}
    pat = re.compile(
        r'\(PreH(\d+) : \((\w+) = \(jet_step \(\(Znth \d+ pulse_list 0\)\) '
        r'\(\(Znth \d+ pulse_list 0\)\) \((\w+)\) \((\d+)\)\)\)\)'
    )
    for m in pat.finditer(body):
        out[m.group(2)] = ('PreH' + m.group(1), m.group(3), m.group(4))
    return out

def byte_bound_chain(body, target):
    """assert (HB : 0 <= target < 256) 的证明块（沿 PreH 链展开）。"""
    eqs = preh_jetstep_eqs(body)
    steps = []
    cur = target
    while cur in eqs:
        preh, inner, _mask = eqs[cur]
        steps.append((preh, inner))
        cur = inner
    if not steps:
        return None
    lines = []
    for i, (preh, _inner) in enumerate(steps):
        lines.append('    rewrite %s.' % preh)
        if i < len(steps) - 1:
            lines.append('    apply jet_step_byte_bound; [ | lia].')
        else:
            lines.append('    apply jet_step_byte_bound; lia.')
    return '\n'.join(lines)

def pure_props(rhs):
    return [p.strip() for p in re.findall(r'“ \((.*?)\) ”', rhs, re.S)]

def retval_bound_target(props):
    tgt = None
    for p in props:
        m = re.fullmatch(r'0 <= (retval\w*)', p)
        if m:
            tgt = m.group(1)
    return tgt

# ---------- templates ----------

def p_safety(name, body):
    return ('  unfold %s. intros.\n'
            '  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.' % name)

def p_pulse_split(name, body):
    m = re.search(r'pulse_addr \+ \((\d+) \* sizeof\(UINT\)\)', body)
    k = int(m.group(1))
    return (f'  unfold {name}. intros.\n'
            f'  sep_apply_l_atomic (UIntArray.full_split_to_missing_i pulse_addr {k} 12 pulse_list 0);\n'
            f'  [dump_pre_spatial; lia | entailer!].')

SENDBUF_LISTS = {
    0: 'sb_list',
    1: '(replace_Znth (0) (235) (sb_list))',
    2: '(replace_Znth (1) (147) ((replace_Znth (0) (235) (sb_list))))',
}

def p_sendbuf_split(name, body):
    m = re.search(r'sb_addr \+ \((\d+) \* sizeof\(UCHAR\)\)', body)
    k = int(m.group(1))
    lst = SENDBUF_LISTS[k]
    if k > 0 and lst not in body:
        warnings.append(f'sendBuf list 与预期不符: {name}')
        return None
    return (f'  unfold {name}. intros.\n'
            f'  sep_apply_l_atomic (UCharArray.full_split_to_missing_i sb_addr {k} 3 ({lst}) 0);\n'
            f'  [dump_pre_spatial; lia | idtac].\n'
            f'  sep_apply store_uchar_undef_store_uchar. entailer!.')

def p_base_implication(name, body):
    """wit_N := wit_N_pure -> wit_N_aux：忽略前提，直接证 aux。"""
    aux = name + '_aux'
    if aux not in defs:
        warnings.append(f'缺 aux 定义: {name}')
        return None
    auxbody = defs[aux]
    props = pure_props(auxbody)
    head = f'  unfold {name}. intros _.\n  unfold {aux}. intros.\n'
    tgt = retval_bound_target(props)
    if tgt:
        chain = byte_bound_chain(auxbody, tgt)
        if chain is None:
            warnings.append(f'aux 链解析失败: {name}')
            return None
        head += f'  assert (HB : 0 <= {tgt} < 256).\n  {{\n{chain}\n  }}\n'
    head += ('  repeat apply _derivable1_andp_intros;\n'
             '  first [ apply derivable1s_coq_prop_r; lia\n'
             '        | apply derivable1s_coq_prop_r; repeat rewrite Zlength_replace_Znth; assumption\n'
             '        | apply derivable1s_coq_prop_r; assumption\n'
             '        | entailer! ].')
    return head

def p_pure(name, body):
    """_pure 析取式：选包含 retval 界或 Zlength 目标的第一个分支。"""
    branches = re.split(r'\n\) \\\/\n\(', body)
    for i, br in enumerate(branches):
        props = pure_props(br)
        side = 'left' if i == 0 else 'right'
        tgt = retval_bound_target(props)
        if tgt:
            chain = byte_bound_chain(br, tgt)
            if chain is None:
                continue
            return (f'  unfold {name}. {side}. intros.\n'
                    f'  assert (HB : 0 <= {tgt} < 256).\n  {{\n{chain}\n  }}\n'
                    f'  repeat apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.')
        if any('replace_Znth' in p for p in props):
            mh = ZLENGTH_SB_PREH.search(br)
            if not mh:
                continue
            return (f'  unfold {name}. {side}. intros.\n'
                    f'  apply derivable1s_coq_prop_r.\n'
                    f'  repeat rewrite Zlength_replace_Znth. exact PreH{mh.group(1)}.')
    warnings.append(f'pure 分支未匹配: {name}')
    return None

def p_pure_split(name, body):
    props = pure_props(body)
    tgt = retval_bound_target(props)
    if tgt is None:
        for p in props:
            m = re.fullmatch(r'(retval\w*) < 256', p)
            if m:
                tgt = m.group(1)
    if tgt:
        chain = byte_bound_chain(body, tgt)
        if chain:
            return (f'  unfold {name}. intros.\n'
                    f'  apply derivable1s_coq_prop_r.\n'
                    f'  assert (HB : 0 <= {tgt} < 256).\n  {{\n{chain}\n  }}\n'
                    f'  lia.')
    if any('replace_Znth' in p for p in props):
        mh = ZLENGTH_SB_PREH.search(body)
        if mh:
            return (f'  unfold {name}. intros.\n'
                    f'  apply derivable1s_coq_prop_r.\n'
                    f'  repeat rewrite Zlength_replace_Znth. exact PreH{mh.group(1)}.')
    warnings.append(f'pure_split 未匹配: {name}')
    return None

def pairstep_rewrites(src):
    rw = []
    m = re.search(r'\(PreH(\d+) : \(p0_pre = 1\)\)', src)
    if m: rw.append(f'(proj2 (Z.eqb_eq p0_pre 1) PreH{m.group(1)})')
    m = re.search(r'\(PreH(\d+) : \(p0_pre <> 1\)\)', src)
    if m: rw.append(f'(proj2 (Z.eqb_neq p0_pre 1) PreH{m.group(1)})')
    m = re.search(r'\(PreH(\d+) : \(p1_pre = 1\)\)', src)
    if m: rw.append(f'(proj2 (Z.eqb_eq p1_pre 1) PreH{m.group(1)})')
    m = re.search(r'\(PreH(\d+) : \(p1_pre <> 1\)\)', src)
    if m: rw.append(f'(proj2 (Z.eqb_neq p1_pre 1) PreH{m.group(1)})')
    return ', '.join(rw)

def p_pairstep_return(name, body):
    split_name = name + '_split_goal_1'
    is_split = name.endswith('split_goal_1')
    src = body if is_split else defs.get(split_name, body)
    rw = pairstep_rewrites(src)
    core = f'unfold jet_step.\n    rewrite {rw}. simpl. reflexivity.'
    if is_split:
        return f'  unfold {name}. intros.\n    {core}'
    return (f'  unfold {name}. left. intros.\n'
            f'  apply _derivable1_andp_intros.\n'
            f'  - apply derivable1s_coq_prop_r.\n    {core}\n'
            f'  - entailer!.')

def p_main_return(name, body):
    is_split = name.endswith('split_goal_1')
    eqs = preh_jetstep_eqs(body)
    m = re.search(r'replace_Znth \(2\) \((retval\w*)\)', body)
    final = m.group(1)
    order = []
    cur = final
    while cur in eqs:
        order.append(eqs[cur][0])
        cur = eqs[cur][1]
    rw = ', '.join(order)
    mh = ZLENGTH_SB_PREH.search(body)
    core = (f'unfold JetCtrlSendPost.\n'
            f'      rewrite (replace3 sb_list 235 147 {final} PreH{mh.group(1)}).\n'
            f'      rewrite {rw}.\n'
            f'      unfold pack_wPulse. reflexivity.')
    if is_split:
        return f'  unfold {name}. intros.\n      {core}'
    rec = UARTREC_PREH.search(body)
    return (f'  unfold {name}. left. intros.\n'
            f'  Exists (replace_Znth 2 {final} (replace_Znth 1 147 (replace_Znth 0 235 sb_list))).\n'
            f'  apply _derivable1_andp_intros.\n'
            f'  - apply _derivable1_andp_intros.\n'
            f'    + apply derivable1s_coq_prop_r. exact PreH{rec.group(1)}.\n'
            f'    + apply derivable1s_coq_prop_r.\n'
            f'      {core}\n'
            f'  - entailer!.')

def p_const4(name, body):
    return (f'  unfold {name}. intros.\n'
            f'  repeat apply _derivable1_andp_intros;\n'
            f'  first [apply derivable1s_coq_prop_r; lia | entailer!].')

# ---------- classify ----------

def gen_proof(wit):
    body = defs[wit]
    if 'safety_wit' in wit:
        return p_safety(wit, body)
    if wit.startswith('JetCtrlSendPairStep_return_wit'):
        return p_pairstep_return(wit, body)
    if wit.startswith('JetCtrlSendFun_return_wit'):
        return p_main_return(wit, body)
    if wit == 'JetCtrlSendFun_partial_solve_wit_3_pure':
        return p_const4(wit, body)
    if '_pure_split_goal' in wit:
        return p_pure_split(wit, body)
    if wit.endswith('_pure'):
        return p_pure(wit, body)
    if re.fullmatch(r'JetCtrlSendFun_partial_solve_wit_\d+', wit):
        if '_pure ->' in body:
            return p_base_implication(wit, body)
        if 'pulse_addr +' in body and 'missing_i' in body:
            return p_pulse_split(wit, body)
        if 'sb_addr +' in body and 'missing_i' in body:
            return p_sendbuf_split(wit, body)
    warnings.append(f'未分类: {wit}')
    return None

def fill(skel_path):
    src = open(skel_path, encoding='utf-8').read()
    header_end = src.index('Lemma ')
    header = src[:header_end]
    lemmas = re.findall(r'Lemma (proof_of_\w+) : (\w+)\.', src[header_end:])
    out = [header]
    unproved = 0
    for lname, wname in lemmas:
        assert lname == 'proof_of_' + wname, (lname, wname)
        proof = gen_proof(wname)
        if proof is None:
            unproved += 1
            out.append(f'Lemma {lname} : {wname}.\nProof. Admitted.\n')
        else:
            out.append(f'Lemma {lname} : {wname}.\nProof.\n{proof}\nQed.\n')
    open(skel_path, 'w', encoding='utf-8', newline='\n').write('\n'.join(out))
    print(f'{skel_path}: {len(lemmas)} lemmas, {unproved} unproved')

fill(AUTO_SKEL)
fill(MANUAL_SKEL)
seen = set()
for w in warnings:
    if w not in seen:
        seen.add(w)
        print('WARN:', w)
