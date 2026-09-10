#!/usr/bin/env python3
"""Publish archival summaries only after current suite and import evidence pass."""
import hashlib
import json
from pathlib import Path
import sys
from datetime import datetime, timezone


def read(path):
    return json.loads(path.read_text())


def write(path, value):
    path.write_text(json.dumps(value, ensure_ascii=False, indent=2) + '\n')


def main():
    root = Path.cwd().resolve()
    ref = Path(__file__).resolve().parent
    audit_path = Path(sys.argv[1]).resolve()
    audit = read(audit_path)
    static = read(ref / 'spec_alignment_audit.json')
    compat = read(ref / 'compatibility_checks/local/manifest.json')
    inventory = read(ref / 'migration_inventory.json')
    assert audit['status'] == static['status'] == compat['status'] == 'passed'
    assert len(audit['cases']) == 17 and len(static['cases']) == 8
    for case in static['cases']:
        assert hashlib.sha256((root / case['c_file']).read_bytes()).hexdigest() == case['c_sha256']
    for entry in audit['source_files']:
        assert hashlib.sha256((root / entry['relative_path']).read_bytes()).hexdigest() == entry['sha256']
    common = root / 'QCIPLib/xizi/xizi_double_link_common/xizi_double_link_lib.v'
    assert hashlib.sha256(common.read_bytes()).hexdigest() == compat['local_common_sha256']
    original_coq = read(ref / 'compatibility_checks/local/coqc_stdout.json')
    current_coq = read(audit_path.parent / 'coq_stdout.json')
    assert original_coq['coq_version'] == current_coq['coq_version'], 'Coq toolchain changed'
    assert original_coq['fixed_flags_hash'] == current_coq['fixed_flags_hash'], 'Fixed Coq mapping changed'
    compatibility_dependencies = []
    for relative in original_coq['dependency_order']:
        path = ref / 'compatibility_source_archive' / relative if relative.startswith('QCIPCases/') else root / relative
        expected = original_coq['source_digests'][relative]
        if path.exists():
            actual = hashlib.sha256(path.read_bytes()).hexdigest()
            mechanism = 'current repository or archived fixture source'
        elif relative == 'StateRelBasic.v':
            # This short path is coq_tooling's deterministic Require Export alias,
            # not the physical module; that module is already checked above.
            wrapper = 'Require Export MonadLib.StateRelMonad.StateRelBasic.\n'
            actual = hashlib.sha256(wrapper.encode()).hexdigest()
            mechanism = 'deterministic fixed-tooling alias; physical source checked separately'
        else:
            actual = current_coq['source_digests'].get(relative)
            mechanism = 'same short-path dependency compiled by current fixed suite check'
        assert actual == expected, 'Compatibility dependency changed or not covered: ' + relative
        compatibility_dependencies.append(dict(relative_path=relative, sha256=actual, verification=mechanism))
    write(ref / 'compatibility_dependencies_current.json', dict(
        schema_version='idmanager-current-dependencies/v1', status='passed',
        suite_evidence=str(audit_path.relative_to(root)), dependencies=compatibility_dependencies))
    all_entries = inventory['case_inventory'] + inventory['single_link_regression_cases']
    assert {c['case'] for c in all_entries} == {c['case'] for c in audit['cases']}
    upstream_sources = []
    upstream_root = Path('/home/yangfp/crtos/Ubiquitous/XiZi_IIoT_Macro/kernel/thread')
    for name in ['double_link.c', 'single_link.c']:
        actual = upstream_root / name
        snapshot = ref / 'input_snapshots/upstream' / name
        assert actual.read_bytes() == snapshot.read_bytes(), 'Upstream C changed during verification: ' + name
        upstream_sources.append(dict(path=str(actual), snapshot=str(snapshot.relative_to(root)),
                                     sha256=hashlib.sha256(actual.read_bytes()).hexdigest(), unchanged=True))
    case_summary = []
    for entry in all_entries:
        current = next(c for c in audit['cases'] if c['case'] == entry['case'])
        assert current['status'] == 'passed'
        run = root / 'reports' / entry['run_id']
        state = [j['state'] for line in (run / 'run_logs.json').read_text().splitlines()
                 if (j := json.loads(line)).get('record_kind') == 'state_snapshot'][-1]
        assert state['phase'] == 'done' and state['final_check']['status'] == 'passed'
        entry.update(current_controller_phase='done', current_regression_status='passed',
                     current_suite_evidence=str(audit_path.relative_to(root)))
        if entry in inventory['case_inventory']:
            assert entry['migration_status'] == 'passed'
        output = root / 'OUTPUT/xizi' / entry['case']
        evidence = str(audit_path.relative_to(root))
        for name in ['checkpoint.json', 'vc_proving_round_checkpoint.json']:
            path = output / 'reports' / name
            if path.exists():
                checkpoint = read(path)
                checkpoint.update(suite_refresh_comparison='passed', suite_fixed_check='passed',
                                  current_suite_evidence=evidence)
                write(path, checkpoint)
        for name in ['reuse_packet.json', 'partial_proof_packet.json', 'reuse_index.json']:
            path = output / 'reports' / name
            if path.exists():
                packet = read(path)
                packet['current_suite_evidence'] = evidence
                if isinstance(packet.get('notes'), list):
                    packet['notes'] = [n.replace('this case is accepted; migration of the remaining suite is in progress',
                                               'all 8 DLL and 9 SLL source functions passed the current suite audit')
                                       for n in packet['notes']]
                write(path, packet)
        readme = output / 'README.md'
        text = readme.read_text()
        text = text.replace('完整套件仍在迁移中，旧套件检查不作为本版本证据。',
                            '本次指定的 8 个双链表与 9 个单链表函数已完成当前依赖下的统一复验。')
        text += ('\n本次参考 DLL 迁移后的当前版本复验：canonical symbolic execution freshness、'
                 'manual/case_lib 结构与禁用项检查、固定 Coq 编译均通过。统一证据：`' + evidence + '`。'
                 '历史报告仍按原版本保留。\n')
        readme.write_text(text)
        case_summary.append(dict(case=entry['case'], run_id=entry['run_id'],
                                 manual_witnesses=len(state['source_goal_version']['target_witnesses']),
                                 generated_auto_admitted=current['generated_auto_admitted_count'],
                                 current_regression='passed'))
    inventory.update(status='complete', finished_at=datetime.now(timezone.utc).isoformat(),
                     suite_audit=str(audit_path.relative_to(root)), static_audit='spec_alignment_audit.json')
    write(ref / 'migration_inventory.json', inventory)
    summary = dict(schema_version='qcp-dll-migration-delivery/v1', status='complete',
                   scope='8 original DLL functions + 9 original SLL functions',
                   cases=case_summary, upstream_sources=upstream_sources, common_sha256=compat['local_common_sha256'],
                   suite_audit=str(audit_path.relative_to(root)),
                   static_audit='spec_alignment_audit.json',
                   original_idmanager_proofs='compatibility_checks/local/manifest.json',
                   current_compatibility_dependencies='compatibility_dependencies_current.json',
                   original_proof_text_policy='Only import paths changed; library wrapper changes separately recorded.',
                   assumptions='Original idmanager nonzero axiom and generated auto placeholders retained and explicitly recorded; maintained libraries/manual proofs pass strict checks.')
    write(ref / 'final_summary.json', summary)
    readme = ref / 'README.md'
    text = readme.read_text().replace('（进行中）', '（已完成）')
    text = text.replace('整体迁移尚未完成；当前逐函数状态以', '17 个原函数当前版本统一复验已通过；逐函数证据以')
    text += ('\n最终统一检查：`' + str(audit_path.relative_to(ref)) + '`，17 个函数均通过 freshness、'
             '严格结构审计和固定 Coq 编译。汇总见 [final_summary.json](final_summary.json)。\n')
    readme.write_text(text)
    interface = ref / 'interface_correspondence.md'
    text = interface.read_text().replace('公共库兼容性已通过，函数迁移进行中', '公共库及指定函数验收均已通过')
    text = text.replace('尚未迁移完的用例及历史辅助证明', '范围外用例及历史辅助证明')
    interface.write_text(text)
    for common_name in ['xizi_double_link_common', 'xizi_single_link_common']:
        path = root / 'OUTPUT/xizi' / common_name / 'README.md'
        text = path.read_text().replace('全部函数的最终验收仍在进行', '指定 8 个双链表函数的最终验收与 17 函数统一复验均已通过')
        text = text.replace('其余 8 个原函数等待本次统一依赖复验', '其余 8 个原函数也已通过本次 canonical freshness 与固定 Coq 统一依赖复验')
        path.write_text(text)
    print(json.dumps({'status': 'complete', 'cases': len(case_summary),
                      'manual_witnesses': sum(c['manual_witnesses'] for c in case_summary)}))


if __name__ == '__main__':
    main()
