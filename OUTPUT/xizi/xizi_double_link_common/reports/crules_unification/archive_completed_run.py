#!/usr/bin/env python3
"""Archive an already accepted run; never changes active formal files or acceptance."""
import argparse
from datetime import datetime, timezone
import hashlib
import json
from pathlib import Path
import re
import shlex
import shutil
import subprocess
import time
from write_timing_review import review as review_timing


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def write_json(path, value):
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(value, ensure_ascii=False, indent=2) + '\n')


def c_tokens(text):
    pattern = r'"(?:\\.|[^"\\])*"|\'(?:\\.|[^\'\\])*\'|/\*[\s\S]*?\*/|//[^\n]*|\w+|[^\s]'
    return [x for x in re.findall(pattern, text) if not x.startswith(('/*', '//'))]


def executable_comparison(before, after):
    """Permit only redundant, identical prototypes for functions defined here.

    QCP may attach spec variants to separate declarations. These declarations
    have no executable body. All other non-comment tokens must still match.
    Unsupported signature syntax is conservatively retained in the comparison.
    """
    def normalize(source):
        lexical = r'"(?:\\.|[^"\\])*"|\'(?:\\.|[^\'\\])*\'|/\*[\s\S]*?\*/|//[^\n]*'
        clean = re.sub(lexical, lambda m: re.sub(r'[^\n]', ' ', m.group())
                       if m.group().startswith(('/*', '//')) else m.group(), source)
        pattern = re.compile(r'(?m)^[ \t]*(?:[A-Za-z_]\w*[\s*]+)+[A-Za-z_]\w*\s*\([^;{}]*\)\s*(?=[{;])')
        matches = list(pattern.finditer(clean))
        definitions = {tuple(c_tokens(m.group())) for m in matches if clean[m.end()] == '{'}
        removed = []
        for match in reversed(matches):
            signature = tuple(c_tokens(match.group()))
            if clean[match.end()] == ';' and signature in definitions:
                removed.append(' '.join(signature))
                clean = clean[:match.start()] + ' ' * (match.end() + 1 - match.start()) + clean[match.end() + 1:]
        return c_tokens(clean), list(reversed(removed))
    old, old_declarations = normalize(before)
    new, new_declarations = normalize(after)
    return {'unchanged': old == new,
            'all_noncomment_tokens_unchanged': c_tokens(before) == c_tokens(after),
            'redundant_prototypes_before': old_declarations,
            'redundant_prototypes_after': new_declarations,
            'comparison_policy': 'All noncomment tokens match after removing only identical prototypes of functions defined in the same translation unit.'}


def source_comparison_for_entry(root, entry, current):
    result = executable_comparison((root / entry['before_source_snapshot']).read_text(), current)
    result['validation_passed'] = result['unchanged']
    restorations = {'xizi_double_link_head': ('double_link.c', 'DoubleLinkListGetHead'),
                    'xizi_single_link_tail': ('single_link.c', 'SingleLinkListGetTailNode')}
    if entry['case'] in restorations:
        filename, function = restorations[entry['case']]
        upstream = root / 'OUTPUT/xizi/xizi_double_link_common/reports/idmanager_dll_alignment/input_snapshots/upstream' / filename
        def function_tokens(text):
            text = re.sub(r'/\*.*?\*/|//[^\n]*', '', text, flags=re.S)
            match = re.search(r'\b' + function + r'\s*\([^;{}]*\)\s*\{', text)
            if match is None:
                return None
            start = text.rfind('\n', 0, match.start()) + 1
            end = text.index('{', match.start()) + 1; depth = 1
            while depth:
                depth += (text[end] == '{') - (text[end] == '}'); end += 1
            return c_tokens(text[start:end])
        result['authorized_restoration'] = {'function': function, 'upstream_snapshot': str(upstream.relative_to(root)),
                                            'signature_and_body_match': function_tokens(upstream.read_text()) == function_tokens(current)}
        result['validation_passed'] = result['authorized_restoration']['signature_and_body_match']
    return result


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('run_id')
    parser.add_argument('--cleanup', action='store_true', help='Remove this completed run\'s own worktrees and build caches after archival')
    args = parser.parse_args()
    root = Path.cwd().resolve()
    run = root / 'reports' / args.run_id
    state = [json.loads(line)['state'] for line in (run / 'run_logs.json').read_text().splitlines()
             if json.loads(line).get('record_kind') == 'state_snapshot'][-1]
    assert state['phase'] == 'done' and state['final_check']['status'] == 'passed'
    assert state['final_apply']['status'] == 'applied', state['final_apply'].keys()
    review_timing(root, args.run_id)
    case = state['case']
    output = root / 'OUTPUT' / 'xizi' / case
    reports = output / 'reports'
    target_c = Path(state['target_c_file'])
    target_relative = target_c.relative_to(root) if target_c.is_absolute() else target_c
    formal = root / 'SeparationLogic/examples' / target_relative.parent
    assert (formal / f'{case}_goal_check.v').exists(), formal
    reference = root / 'OUTPUT/xizi/xizi_double_link_common/reports/crules_unification'
    inventory_path = reference / 'migration_inventory.json'
    inventory = json.loads(inventory_path.read_text())
    entry = next(e for e in inventory['case_inventory'] + inventory.get('single_link_regression_cases', []) if e['case'] == case)
    source = root / state['target_c_file']
    baseline = root / entry['before_source_snapshot']
    source_comparison = source_comparison_for_entry(root, entry, source.read_text())
    assert source_comparison['validation_passed'], 'Executable C does not match the authorized source'
    # Preserve previous evidence explicitly as historical, so it cannot masquerade as this run.
    previous = reports / 'before_crules_unification'
    if not previous.exists():
        previous.mkdir(parents=True)
        for p in list(reports.iterdir()):
            if p != previous:
                shutil.move(str(p), previous / p.name)
        if (output / 'README.md').exists():
            shutil.copy2(output / 'README.md', previous / 'README.md')
    shutil.copytree(run, reports / 'controller', dirs_exist_ok=True)
    write_json(reports / 'controller/final_state.json', state)
    write_json(reports / 'executable_c_comparison.json', source_comparison)
    active_lib = root / (state.get('case_lib_file') or str(formal.relative_to(root) / f'{case}_lib.v'))
    copied = []
    for name in [f'{case}_goal.v', f'{case}_proof_auto.v', f'{case}_proof_manual.v',
                 f'{case}_goal_check.v', f'{case}_proof_diagnostics.v', 'diagnostics_snapshot.json']:
        p = formal / name
        if p.exists():
            dst = output / 'rocq' / name
            dst.parent.mkdir(parents=True, exist_ok=True)
            shutil.copy2(p, dst)
            copied.append((p, dst))
    if str(active_lib.relative_to(root)).startswith('QCIPLib/'):
        common = 'xizi_double_link_common' if 'double_link' in case else 'xizi_single_link_common'
        lib_dst = output.parent / common / 'rocq' / active_lib.name
        # The old case-local file is not imported by this run; retain its historical snapshot.
        legacy = output / 'rocq' / f'{case}_lib.v'
        if legacy.exists():
            (previous / 'rocq').mkdir(exist_ok=True)
            shutil.move(str(legacy), previous / 'rocq' / legacy.name)
    else:
        lib_dst = output / 'rocq' / active_lib.name
    lib_dst.parent.mkdir(parents=True, exist_ok=True)
    shutil.copy2(active_lib, lib_dst)
    copied.append((active_lib, lib_dst))
    for src, dst in copied:
        assert sha(src) == sha(dst)
        snap = reports / 'generated_snapshots' / dst.name
        snap.parent.mkdir(exist_ok=True)
        shutil.copy2(src, snap)
    (reports / 'input_snapshots').mkdir(exist_ok=True)
    shutil.copy2(baseline, reports / 'input_snapshots' / baseline.name)
    version = state['source_goal_version']['digest']
    witnesses = state['source_goal_version']['target_witnesses']
    evidence = state['final_check']['evidence']
    auto_admitted = len(re.findall(r'\bAdmitted\s*\.', (formal / f'{case}_proof_auto.v').read_text()))
    summary = dict(schema_version='qcp-case-checkpoint/v1', case=case, status='complete',
                   run_id=args.run_id, controller_phase='done',
                   source_version=state['source_version']['digest'], source_goal_version=version,
                   manual_witness_count=len(witnesses), canonical_symexec='passed',
                   parent_fixed_check='passed', final_check='passed',
                   suite_refresh_comparison='pending', suite_fixed_check='pending',
                   executable_c_unchanged=source_comparison['unchanged'], active_case_lib=str(active_lib.relative_to(root)),
                   generated_auto_admitted_count=auto_admitted,
                   controller_evidence='controller/run_logs.json')
    write_json(reports / 'checkpoint.json', summary)
    write_json(reports / 'vc_proving_round_checkpoint.json', dict(summary, schema_version='qcp-vc-proving-checkpoint/v1'))
    packet = dict(schema_version='qcp-case-reuse-packet/v1', case=case, status='reusable',
                  run_id=args.run_id, source_goal_version=version,
                  source_directory='source', rocq_directory='rocq',
                  active_case_lib=str(active_lib.relative_to(root)),
                  controller_report_root='reports/controller',
                  notes=['before_crules_unification is historical evidence only',
                         'diagnostics are planning hints, not target witnesses',
                         'this case is accepted; migration of the remaining suite is in progress'])
    write_json(reports / 'reuse_packet.json', packet)
    write_json(reports / 'partial_proof_packet.json', dict(packet, schema_version='qcp-partial-proof-packet/v1', solved_witnesses=witnesses))
    write_json(reports / 'reuse_index.json', dict(packet, schema_version='qcp-reuse-index/v1'))
    write_json(reports / 'archive_comparison.json', dict(schema_version='qcp-archive-comparison/v1', status='passed', files=[
        dict(source=str(a.relative_to(root)), archive=str(b.relative_to(root)), sha256=sha(a)) for a, b in copied]))
    for phase, filename in [('annotation', 'annotation_report.json'), ('vc-checking', 'vc_checking_report.json')]:
        shutil.copy2(Path(state['accepted_rounds'][phase]['report_directory']) / 'agent_report.json', reports / filename)
    shutil.copy2(Path(state['accepted_rounds']['vc-proving-preparing']['group_merged_result']), reports / 'vc_proving_report.json')
    (reports / 'witness_ledger.md').write_text('# Manual witnesses\n\n' + '\n'.join(f'- `{w}`：已证明，parent verification 与 final-check 通过。' for w in witnesses) + '\n')
    declaration_note = ('所有非注释 token 与迁移前一致。' if source_comparison['all_noncomment_tokens_unchanged']
                        else '仅存在同一翻译单元内、与函数定义完全同签名的重复声明差异；其他非注释 token 均未改变。详见 executable_c_comparison.json。')
    if source_comparison.get('authorized_restoration'):
        declaration_note = '保持此前已对齐的原函数体，并在 CRules 下重新生成目标和证明；与原源码的函数名、参数和函数体 token 比对通过。详见 executable_c_comparison.json。'
    migration_description = ('将当前函数规约与辅助证明统一至 CRules，共用布局参数化的参考 DLL 实现。' if 'double_link' in case else '验证用户指定的原始单链表函数，保留 NULL 终止结构、泛型载荷与顺序规约。')
    (reports / 'case_brief.md').write_text(f'# {case}\n\n{migration_description}{declaration_note}\n\n输出目录：`OUTPUT/xizi/{case}`。\n')
    (reports / 'final_checklist.md').write_text('# 最终检查\n\n' + '\n'.join(f'- {key}: {value.get("status", "recorded")}' for key, value in evidence.items() if isinstance(value, dict)) + '\n')
    shutil.copy2(run / 'timing_summary.json', reports / 'timing_summary.json')
    (reports / 'timing_summary.md').write_text('# 耗时\n\n精确 controller step / round / group 时间见 [timing_summary.json](timing_summary.json)。\n')
    (reports / 'strategy_report.md').write_text('# 复用与证明\n\n规格设计与检查见 annotation_report.json；分组见 controller/rounds/；最终合并与 helper 来源见 vc_proving_report.json。历史证明见 before_crules_unification，仅作复用参考。\n')
    symexec = evidence['symexec_refresh']['canonical_symexec_evidence']
    symargv = symexec['argv'][:]
    # Reproduce into a fresh user-selected report directory, never over the proved manual.
    symargv = [a.split('=')[0] + '=/tmp/' + case + '-storeA-refresh/' + Path(a.split('=', 1)[1]).name
               if a.startswith(('--goal-file=', '--proof-auto-file=', '--proof-manual-file=')) else a for a in symargv]
    coqargv = evidence['coqc_check']['argv'][:]
    coqargv[coqargv.index('--build-workspace') + 1] = '/tmp/' + case + '-storeA-coq-build'
    model_description = ('泛型 storeA : addr -> A -> Assertion 表示嵌入 link 对应的业务资源；结构指针字段由链表谓词持有。公共 DLL 谓词保留参考逻辑条件，实际 C 用例与 idmanager 共用 CRules 模型；XiziLocalDLL 是 XiziIdmanagerDLL 同一实例的别名。' if 'double_link' in case else '沿用泛型 storeA : addr -> A -> Assertion 的单链表载荷规约，保持 NULL 终止、原节点次序及全部业务资源。单链表没有改成循环双链表模型。')
    readme = f'''# {case} 验证交付

本次验证已通过 controller final-check，run 为 `{args.run_id}`。{declaration_note} 完整套件仍在迁移中，旧套件检查不作为本版本证据。

{model_description}

- `source/`：正式带标注 C 与头文件。
- `rocq/`：本版本生成目标与已完成证明。
- 唯一 active case_lib：`{active_lib.relative_to(root)}`；归档：`{lib_dst.relative_to(root)}`。
- `reports/controller/`：本 run 的 controller、round、group 与最终证据。
- `reports/before_crules_unification/`：迁移前历史报告，不作为当前验收证据。

source_goal_version：`{version}`；manual witness 数：{len(witnesses)}。symbolic execution freshness、固定 Coq 检查、manual 结构、case_lib 合同及 forbidden lemma 检查均通过。

验证边界：当前 QCP 自动生成的 `proof_auto.v` 有 {auto_admitted} 个 `Admitted` 占位。按仓库生成文件边界保留并单独记录；本轮完成证明的是 manual witnesses 和维护库中的引理，不能据此宣称整套证明完全没有假设。

在仓库根目录复现 symbolic execution（输出到临时目录，保留正式 manual）：

```sh
mkdir -p /tmp/{case}-storeA-refresh
{shlex.join(symargv)}
```

通过固定入口编译：

```sh
{shlex.join(coqargv)}
```

修改源码、规约或目标后应重新执行 controller 流程。快照与 OUTPUT 副本的字节比对见 `reports/archive_comparison.json`。
'''
    (output / 'README.md').write_text(readme)
    (reports / 'verification_summary.md').write_text(readme)
    entry.update(migration_status='passed', controller_phase=state['phase'], run_id=args.run_id, source_goal_version=version,
                 c_sha256_after=sha(source), executable_c_unchanged=source_comparison['unchanged'],
                 archive_report=str((reports / 'archive_comparison.json').relative_to(root)))
    if 'single_link' in case:
        entry['current_regression_status'] = 'passed_original_source_run'
    write_json(inventory_path, inventory)
    if args.cleanup:
        cleanup_started_at = datetime.now(timezone.utc)
        cleanup_clock = time.monotonic()
        run_root = Path(state['run_root']).resolve()
        assert run_root.parent == root / 'worktrees' and run_root.name == args.run_id
        listing = subprocess.check_output(['git', 'worktree', 'list', '--porcelain'], cwd=root, text=True)
        owned = [Path(line.removeprefix('worktree ')).resolve() for line in listing.splitlines()
                 if line.startswith('worktree ')]
        owned = [p for p in owned if p.is_relative_to(run_root)]
        for p in sorted(owned, key=lambda p: len(p.parts), reverse=True):
            subprocess.run(['git', 'worktree', 'remove', '--force', str(p)], cwd=root, check=True)
        if run_root.exists():
            shutil.rmtree(run_root)
        cleanup = dict(schema_version='qcp-run-cleanup/v1', status='passed', run_id=args.run_id,
                       started_at=cleanup_started_at.isoformat(),
                       finished_at=datetime.now(timezone.utc).isoformat(),
                       elapsed_seconds=round(time.monotonic() - cleanup_clock, 6),
                       removed_worktrees=[str(p) for p in owned], removed_run_root=str(run_root),
                       retained_report_root=str(run), formal_files_preserved=True)
        write_json(run / 'cleanup_summary.json', cleanup)
        write_json(reports / 'cleanup_summary.json', cleanup)
        write_json(reports / 'controller/cleanup_summary.json', cleanup)
        review_timing(root, args.run_id)
        for name in ('timing_review.json', 'timing_review.md'):
            shutil.copy2(run / name, reports / name)
            shutil.copy2(run / name, reports / 'controller' / name)
    print(json.dumps(dict(case=case, status='archived', files=len(copied), executable_c_unchanged=source_comparison['unchanged'])))


if __name__ == '__main__':
    main()
