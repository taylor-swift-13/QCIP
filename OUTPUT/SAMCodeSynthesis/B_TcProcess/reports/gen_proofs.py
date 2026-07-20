#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
为 B_TcProcess 生成 proof_auto.v / proof_manual.v。

输入：QCIPCases/SAMCodeSynthesis/B_TcProcess/ 下 symexec 生成的
  goal.v（witness 定义）与 proof_auto / proof_manual 骨架（引理名与顺序）。

模板与 JetCtrlSend 相同来源（.tmp 实验 + 已编译验证的代表证明），
本 case 新增：return_wit 的 per-path Post 证明、safety_wit_28 的
uchar 界提取（prop_apply valid_store_uchar，借自 CheckCal08）。
无法分类的引理保留 Admitted 并打印警告。
"""
import re, sys

CASE_DIR = 'QCIPCases/SAMCodeSynthesis/B_TcProcess'
GOAL = CASE_DIR + '/IP_B_TcProcess_goal.v'
AUTO_SKEL = CASE_DIR + '/IP_B_TcProcess_proof_auto.v'
MANUAL_SKEL = CASE_DIR + '/IP_B_TcProcess_proof_manual.v'

text = open(GOAL, encoding='utf-8').read()

defs = {}
for m in re.finditer(r'\nDefinition (\w+) := \n?(.*?)(?=\nDefinition |\Z)', text, re.S):
    defs[m.group(1)] = m.group(2)

warnings = []

SENT = '(replace_Znth (1) (148) ((replace_Znth (0) (235) (sb_list))))'

def pure_props(rhs):
    return [p.strip() for p in re.findall(r'“ \((.*?)\) ”', rhs, re.S)]

def zlength_sb_preh(body):
    m = re.search(r'\(PreH(\d+) : \(\(Zlength \(sb_list\)\) = 2\)\)', body)
    return 'PreH' + m.group(1) if m else None

# ---------- safety ----------

def p_safety(name, body):
    rhs = body.split('|--')[-1]
    if '“ False ”' in rhs:
        return ('  unfold %s. intros.\n'
                '  apply derivable1s_coq_prop_r. lia.' % name)
    return ('  unfold %s. intros.\n'
            '  apply _derivable1_andp_intros; apply derivable1s_coq_prop_r; lia.' % name)

def p_safety28_split(name, body):
    return ('  unfold %s. intros.\n'
            '  pre_process_default.\n'
            '  sep_apply_l_atomic (UCharArray.full_split_to_missing_i rb_addr 2 4 l 0).\n'
            '  - dump_pre_spatial. lia.\n'
            '  - prop_apply (valid_store_uchar (rb_addr + 2 * sizeof ( UCHAR )) (Znth 2 l 0)).\n'
            '    Intros.\n'
            '    apply derivable1s_coq_prop_r.\n'
            '    unfold Byte.max_unsigned, Byte.modulus, Byte.wordsize in *.\n'
            '    simpl in *. lia.' % name)

def p_safety28_main(name, body):
    split1 = defs[name + '_split_goal_1']
    split2 = defs[name + '_split_goal_2']
    def binders(b):
        vs = re.findall(r'\((\w+): (?:Z|\(@list Z\))\)', b)
        hs = ['PreH' + n for n in re.findall(r'\(PreH(\d+) :', b)]
        return ' '.join(vs + hs)
    return ('  unfold %s.\n'
            '  left. intros.\n'
            '  apply _derivable1_andp_intros.\n'
            '  - pose proof (proof_of_%s_split_goal_1 %s) as H.\n'
            '    exact H.\n'
            '  - pose proof (proof_of_%s_split_goal_2 %s) as H.\n'
            '    exact H.' % (name, name, binders(split1), name, binders(split2)))

# ---------- array splits ----------

def p_sendbuf_split(name, body):
    m = re.search(r'sb_addr \+ \((\d+) \* sizeof\(UCHAR\)\)', body)
    k = int(m.group(1))
    lst = 'sb_list' if k == 0 else '(replace_Znth (0) (235) (sb_list))'
    return (f'  unfold {name}. intros.\n'
            f'  sep_apply_l_atomic (UCharArray.full_split_to_missing_i sb_addr {k} 2 ({lst}) 0);\n'
            f'  [dump_pre_spatial; lia | idtac].\n'
            f'  sep_apply store_uchar_undef_store_uchar. entailer!.')

def p_recv_split(name, body):
    m = re.search(r'rb_addr \+ \((\d+) \* sizeof\(UCHAR\)\)', body)
    k = int(m.group(1))
    return (f'  unfold {name}. intros.\n'
            f'  sep_apply_l_atomic (UCharArray.full_split_to_missing_i rb_addr {k} 4 l 0);\n'
            f'  [dump_pre_spatial; lia | entailer!].')

# ---------- call-related partials ----------

def p_zlength2_pure(name, body):
    preh = zlength_sb_preh(body)
    head = ''
    if ') \\/' in body or ') \/' in body:
        head = '  left. intros.\n'
    else:
        head = '  intros.\n'
    return (f'  unfold {name}.\n' + head +
            f'  apply derivable1s_coq_prop_r.\n'
            f'  repeat rewrite Zlength_replace_Znth. exact {preh}.')

def p_base_implication(name, body):
    aux = name + '_aux'
    if aux not in defs:
        warnings.append(f'缺 aux 定义: {name}')
        return None
    return (f'  unfold {name}. intros _.\n  unfold {aux}. intros.\n'
            f'  repeat apply _derivable1_andp_intros;\n'
            f'  first [ apply derivable1s_coq_prop_r; repeat rewrite Zlength_replace_Znth; assumption\n'
            f'        | apply derivable1s_coq_prop_r; assumption\n'
            f'        | entailer! ].')

def p_uartsend_restore(name, body):
    return (f'  unfold {name}. intros.\n'
            f'  repeat apply _derivable1_andp_intros;\n'
            f'  first [ apply derivable1s_coq_prop_r; exact I\n'
            f'        | apply derivable1s_coq_prop_r; assumption\n'
            f'        | entailer! ].')

def p_rb_zlength_pure(name, body):
    return (f'  unfold {name}. intros.\n'
            f'  apply derivable1s_coq_prop_r. assumption.')

# ---------- return wits ----------

def extract_frame_vals(body):
    """从 wit 的 LHS frame 中提取 wm_addr 与 bSucc 的存储值。"""
    lhs = body.split('|--')[0]
    wm = re.search(r'\(\(wm_addr\) # UInt  \|-> (\w+)\)', lhs)
    bs = re.search(r'"bSucc"\)\) # UInt  \|-> (\w+)\)', lhs)
    return (wm.group(1) if wm else 'old_wm', bs.group(1) if bs else 'retval')

def eqb_rewrites(body):
    """按路径假设生成 Z.eqb 重写序列。"""
    rw = []
    facts = []
    # (var, val, PreHn, is_eq)；同一 (idx, val) 只保留第一个 PreH，
    # 否则重复 rewrite 同一 eqb 子项会失败。
    seen = set()
    for m in re.finditer(r'\(PreH(\d+) : \(\(Znth (\d+) l 0\) (=|<>) (\d+)\)\)', body):
        idx, rel, val = m.group(2), m.group(3), m.group(4)
        key = (idx, val)
        if key in seen:
            continue
        seen.add(key)
        preh = 'PreH' + m.group(1)
        lem = 'Z.eqb_eq' if rel == '=' else 'Z.eqb_neq'
        facts.append((idx, val, preh, lem))
    # checksum 等式：Znth 3 l 0 (=|<>) ulnb 链
    m = re.search(r'\(PreH(\d+) : \(\(Znth 3 l 0\) (=|<>) \(unsigned_last_nbits', body)
    if m:
        facts.append(('cksum', m.group(2), 'PreH' + m.group(1),
                      'Z.eqb_eq' if m.group(2) == '=' else 'Z.eqb_neq'))
    return facts

def p_return(name, body):
    wmval, bsval = extract_frame_vals(body)
    facts = eqb_rewrites(body)
    zlpreh = zlength_sb_preh(body)
    if zlpreh is None:
        warnings.append(f'缺 Zlength sb PreH: {name}')
        return None
    recv_preh = re.search(r'\(PreH(\d+) : \(\(Zlength \(l\)\) = 4\)\)', body)
    lines = []
    lines.append(f'  unfold {name}. left. intros.')
    lines.append(f'  Exists retval. Exists {wmval}. Exists {bsval}. Exists l.')
    lines.append(f'  Exists {SENT}.')
    # 纯命题组合是左结合 &&；_derivable1_andp_intros 还会把 B_TcProcessPost
    # 的定义也拆开，所以共 8 个目标：
    #   1 Zlength sent, 2/3 Znth sent, 4 Record, 5 Zlength l,
    #   6 Post-1 (new_wm), 7 Post-2 (new_bs), 8 frame。
    lines.append(f'  repeat apply _derivable1_andp_intros;')
    r2 = f'apply derivable1s_coq_prop_r; rewrite (replace2 sb_list 235 148 {zlpreh}); reflexivity'
    lines.append(f'  [ {r2}')
    lines.append(f'  | {r2}')
    lines.append(f'  | {r2}')
    lines.append(f'  | apply derivable1s_coq_prop_r; exact I')
    if recv_preh:
        lines.append(f'  | apply derivable1s_coq_prop_r; exact PreH{recv_preh.group(1)}')
    else:
        lines.append(f'  | apply derivable1s_coq_prop_r; assumption')
    # Post-1：new_wm = final_workMode old_wm l
    cksum_preh = None
    rw = []
    cksum_rw = ''
    for (idx, val, preh, lem) in facts:
        if idx == 'cksum':
            cksum_preh = (preh, lem)
        else:
            rw.append(f'(proj2 ({lem} (Znth {idx} l 0) {val}) {preh})')
    if cksum_preh:
        preh, lem = cksum_preh
        cksum_rw = f' rewrite ulnb_sum3 in {preh};'
        rw.append(f'(proj2 ({lem} (Znth 3 l 0) ((Znth 0 l 0 + Znth 1 l 0 + Znth 2 l 0) mod 256)) {preh})')
    d0lem = None
    for (idx, val, preh, lem) in facts:
        if idx == '0' and val == '225':
            d0lem = (lem, preh)
    rwstr = f' rewrite {", ".join(rw)};' if rw else ''
    lines.append(f'  | apply derivable1s_coq_prop_r;'
                 f' unfold final_workMode, valid_frame, header_ok, checksum_ok, decode_mode;'
                 f'{cksum_rw}{rwstr} reflexivity')
    # Post-2：new_bs = final_bSucc ret l
    post2 = (f'apply derivable1s_coq_prop_r; unfold final_bSucc;')
    if d0lem:
        lem, preh = d0lem
        post2 += f' rewrite (proj2 ({lem} (Znth 0 l 0) 225) {preh});'
    if name == 'B_TcProcessFun_return_wit_5':
        m2 = re.search(r'\(PreH(\d+) : \(retval = 1\)\)', body)
        post2 += f' rewrite PreH{m2.group(1)}; reflexivity'
    else:
        post2 += ' reflexivity'
    lines.append(f'  | {post2}')
    lines.append(f'  | entailer! ].')
    return '\n'.join(lines)

# ---------- classify ----------

def gen_proof(wit):
    body = defs[wit]
    if wit == 'B_TcProcessFun_safety_wit_28':
        return p_safety28_main(wit, body)
    if wit.startswith('B_TcProcessFun_safety_wit_28_split_goal'):
        return p_safety28_split(wit, body)
    if 'safety_wit' in wit:
        return p_safety(wit, body)
    if wit.startswith('B_TcProcessFun_return_wit'):
        return p_return(wit, body)
    if wit == 'B_TcProcessFun_partial_solve_wit_3_pure':
        return p_zlength2_pure(wit, body)
    if wit == 'B_TcProcessFun_partial_solve_wit_3_pure_split_goal_1':
        return p_zlength2_pure(wit, body)
    if wit == 'B_TcProcessFun_partial_solve_wit_5_pure':
        return p_rb_zlength_pure(wit, body)
    if wit == 'B_TcProcessFun_partial_solve_wit_4':
        return p_uartsend_restore(wit, body)
    if re.fullmatch(r'B_TcProcessFun_partial_solve_wit_(3|5)', wit):
        return p_base_implication(wit, body)
    if re.fullmatch(r'B_TcProcessFun_partial_solve_wit_(1|2)', wit):
        return p_sendbuf_split(wit, body)
    if re.fullmatch(r'B_TcProcessFun_partial_solve_wit_\d+', wit):
        if 'rb_addr +' in body and 'missing_i' in body:
            return p_recv_split(wit, body)
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
