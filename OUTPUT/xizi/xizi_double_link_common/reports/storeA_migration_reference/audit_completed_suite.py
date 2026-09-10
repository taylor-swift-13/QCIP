#!/usr/bin/env python3
"""Recheck the current accepted suite; preserve original controller evidence."""
import argparse
import copy
from datetime import datetime, timezone
import hashlib
import json
from pathlib import Path
import re
import shutil
import subprocess
import sys
from archive_completed_run import executable_comparison


def dump(path, value):
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(value, ensure_ascii=False, indent=2) + '\n')


def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--cleanup', action='store_true')
    args = parser.parse_args()
    root = Path.cwd().resolve()
    reference = Path(__file__).resolve().parent
    inventory = json.loads((reference / 'migration_inventory.json').read_text())
    cases = inventory['case_inventory']
    assert all(c['migration_status'] == 'passed' for c in cases), 'Complete every case first'
    sys.path.insert(0, str(root / '.agents/skills/verification-orchestrator/scripts'))
    import controller
    stamp = datetime.now(timezone.utc).strftime('%Y%m%d%H%M%S')
    evidence_root = reference / 'suite_audits' / stamp
    evidence_root.mkdir(parents=True, exist_ok=False)
    build_root = root / 'worktrees' / ('xizi_storeA_suite-' + stamp)
    build = build_root / '_coq_builds' / 'src'
    audit = {'schema_version': 'qcp-storeA-suite-audit/v1', 'status': 'running',
             'started_at': datetime.now(timezone.utc).isoformat(), 'cases': [],
             'reference_commit': inventory['reference_commit'],
             'note': 'Current dependency regression evidence; does not replace original controller acceptance.'}
    source_files = set()
    imports = []
    for entry in cases:
        run_report = root / 'reports' / entry['run_id']
        states = [j['state'] for line in (run_report / 'run_logs.json').read_text().splitlines()
                  if (j := json.loads(line)).get('record_kind') == 'state_snapshot']
        state = states[-1]
        assert state['phase'] == 'done' and state['final_check']['status'] == 'passed'
        assert state['final_apply']['status'] == 'applied'
        targets = controller._target_files_for_state(state)
        replay_state = copy.deepcopy(state)
        replay_state['report_root'] = str(evidence_root / entry['case'])
        freshness = controller._final_symexec_refresh_evidence(replay_state, root, build_root, targets)
        manual = root / targets['proof_manual_file']
        lib = root / targets['case_lib']
        findings = {
            'manual': controller._manual_structure_findings(manual, state['source_goal_version']['target_witnesses']),
            'case_lib': controller._case_lib_findings(lib, targets['active_case_theory']),
            'forbidden': controller._forbidden_findings(root, [manual, lib]),
        }
        current = dict(case=entry['case'], original_run=entry['run_id'],
                       original_source_goal_version=state['source_goal_version']['digest'],
                       freshness=freshness, findings=findings,
                       generated_auto_admitted_count=len(re.findall(r'\bAdmitted\s*\.',
                           (root / targets['proof_auto_file']).read_text())))
        current['executable_c_comparison'] = executable_comparison(
            (root / entry['before_source_snapshot']).read_text(),
            Path(state['target_c_file']).read_text())
        current['status'] = 'passed' if (freshness['status'] == 'passed'
            and not any(findings.values()) and current['executable_c_comparison']['unchanged']) else 'failed'
        audit['cases'].append(current)
        dump(evidence_root / 'audit.json', audit)
        assert current['status'] == 'passed', entry['case']
        for key in ('goal_file', 'proof_auto_file', 'proof_manual_file', 'goal_check_file', 'case_lib'):
            source_files.add(root / targets[key])
        source_files.add(Path(state['target_c_file']))
        imports.append('From ' + targets['active_case_theory'] + ' Require Import ' + Path(targets['goal_check_file']).stem + '.')
    audit['shared_library_findings'] = []
    audit['existing_strategy_dependencies'] = []
    baseline_commit = subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=root, text=True).strip()
    for p in (root / 'QCIPLib/xizi').glob('xizi_*_link_common/*.v'):
        source_files.add(p)
        if '_strategy_' in p.name:
            # Strategy signatures and their implementations are existing dependencies,
            # not active case_lib declarations. Require exact tracked baseline bytes;
            # retain their scan results instead of presenting them as migrated libraries.
            rel = str(p.relative_to(root))
            baseline = subprocess.check_output(['git', 'show', baseline_commit + ':' + rel], cwd=root)
            unchanged = baseline == p.read_bytes()
            audit['existing_strategy_dependencies'].append(dict(
                file=rel, baseline_commit=baseline_commit, unchanged_from_baseline=unchanged,
                baseline_sha256=hashlib.sha256(baseline).hexdigest(),
                declaration_scan=controller._case_lib_findings(p, 'SimpleC.EE.OUTPUT.xizi'),
                forbidden_scan=controller._forbidden_findings(root, [p]),
                note='Unmodified strategy dependency; Module Type axioms are interface obligations. Existing strategy proofs are compiled by the aggregate check. Active case_lib/manual checks remain strict.'))
            assert unchanged, 'Unexpected strategy dependency change: ' + rel
            continue
        findings = controller._case_lib_findings(p, 'SimpleC.EE.OUTPUT.xizi')
        findings += controller._forbidden_findings(root, [p])
        audit['shared_library_findings'].append({'file': str(p.relative_to(root)), 'findings': findings})
        assert not findings, str(p)
    records = [dict(relative_path=str(p.relative_to(root)), sha256=digest(p), state='present')
               for p in sorted(source_files)]
    version = hashlib.sha256(json.dumps(records, sort_keys=True, separators=(',', ':')).encode()).hexdigest()
    suite = evidence_root / 'xizi_storeA_suite_check.v'
    suite.write_text('(* Aggregate check of all currently accepted storeA cases. *)\n' + '\n'.join(imports) + '\n')
    command = ['python3', str(root / '.agents/skills/vc-proving/scripts/coq_tooling.py'), 'check',
               '--workspace-root', str(root), '--build-workspace', str(build),
               '--target-file', str(suite.relative_to(root)), '--target-kind', 'check',
               '--source-goal-version', version]
    result = subprocess.run(command, cwd=root, capture_output=True, text=True)
    (evidence_root / 'coq_stdout.json').write_text(result.stdout)
    (evidence_root / 'coq_stderr.txt').write_text(result.stderr)
    unchanged = all(digest(root / r['relative_path']) == r['sha256'] for r in records)
    audit.update(suite_source_version=version, source_files=records,
                 generated_auto_admitted_count=sum(c['generated_auto_admitted_count'] for c in audit['cases']),
                 proof_scope='Completed manual witnesses and maintained libraries; generated auto placeholders are an explicit trust boundary.',
                 coq_check=dict(argv=command, cwd=str(root), returncode=result.returncode,
                                evidence='coq_stdout.json'), formal_files_unchanged=unchanged,
                 status='passed' if result.returncode == 0 and unchanged else 'failed',
                 finished_at=datetime.now(timezone.utc).isoformat())
    dump(evidence_root / 'audit.json', audit)
    if args.cleanup:
        assert build_root.parent == root / 'worktrees' and build_root.name.startswith('xizi_storeA_suite-')
        if build_root.exists():
            shutil.rmtree(build_root)
        audit['build_cleanup'] = 'passed'
        dump(evidence_root / 'audit.json', audit)
    print(json.dumps({'status': audit['status'], 'evidence': str(evidence_root / 'audit.json')}))
    return 0 if audit['status'] == 'passed' else 1


if __name__ == '__main__':
    raise SystemExit(main())
