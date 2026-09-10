#!/usr/bin/env python3
"""Compile frozen upstream proofs using only fixed coq_tooling feedback.

The compatibility fixture adjusts Require paths only. It preserves upstream
proof bodies, statements, Abort diagnostics and preexisting assumptions.
No fixture source is adopted as a local case proof.
"""
import argparse
import hashlib
import json
import re
import subprocess
import time
from pathlib import Path

ROOT = Path(__file__).resolve().parents[5]
REF = Path(__file__).resolve().parent
TOOL = ROOT / '.agents/skills/vc-proving/scripts/coq_tooling.py'
CASES = ('AllocId', 'FreeId', 'GetObj', 'IdInsertObj', 'InsertObj', 'RemoveObj')
COMMON = 'QCIPLib/xizi/xizi_double_link_common/xizi_double_link_lib.v'


def digest(data):
    return hashlib.sha256(data).hexdigest()


def git_text(ref, path):
    return subprocess.check_output(['git', '-C', str(ROOT / 'crtosverify'), 'show', ref + ':' + path])


def adjust_imports(data):
    lines = data.decode().splitlines(keepends=True)
    for i, line in enumerate(lines):
        if re.match(r'\s*(From\s|Require\s)', line):
            lines[i] = line.replace('CRTOS_Verify.', 'QCIPCases.idmanager_compat.').replace('SL.ConAssertion', 'SimpleC.SL.ConAssertion').replace('SL.CriticalSTS', 'SimpleC.SL.CriticalSTS').replace('SL.NestedCriticalSTS', 'SimpleC.SL.NestedCriticalSTS')
    return ''.join(lines).encode()


def without_imports(data):
    return b''.join(line for line in data.splitlines(keepends=True) if not re.match(rb'\s*(From\s|Require\s)', line))


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--mode', choices=['baseline', 'baseline_compat', 'local'], required=True)
    ap.add_argument('--library-workspace', type=Path, default=ROOT)
    ap.add_argument('--work-root', type=Path, required=True)
    ap.add_argument('--prepare-only', action='store_true')
    args = ap.parse_args()
    commit = subprocess.check_output(['git', '-C', str(ROOT / 'crtosverify'), 'rev-parse', 'origin/idnode']).decode().strip()
    mode_root = args.work_root.resolve() / args.mode
    source = mode_root / 'sources'
    build = mode_root / 'build'
    reports = REF / 'compatibility_checks' / args.mode
    source.mkdir(parents=True, exist_ok=True)
    reports.mkdir(parents=True, exist_ok=True)
    # Only source .v files are mirrored by coq_tooling; upstream .vo are never used.
    for name in ('SeparationLogic', 'FloatTest'):
        if (ROOT / name).exists() and not (source / name).exists():
            (source / name).symlink_to(ROOT / name, target_is_directory=True)
    if not (source / 'QCIPLib').exists():
        (source / 'QCIPLib').symlink_to(args.library_workspace.resolve() / 'QCIPLib', target_is_directory=True)
    elif (source / 'QCIPLib').resolve() != args.library_workspace.resolve() / 'QCIPLib':
        raise SystemExit('Existing fixture points at a different library workspace; use a fresh work root.')
    fixture = source / 'QCIPCases/idmanager_compat'
    records = []
    assumptions = []
    dll_original = git_text(commit, 'lib/dll.v')
    axiom = re.search(rb'(?ms)^Axiom store_dll_head_prev_next_nonzero:.*?^      dllseg storeA h x x pt l\.', dll_original).group()
    paths = ['lib/glob.v', 'lib/bitmap.v', 'lib/dll.v', 'lib/idnode.v']
    paths += [f'VC/code_proof/id/{case}_{suffix}.v' for case in CASES for suffix in ('goal', 'proof_auto', 'proof_manual', 'goal_check')]
    for path in paths:
        original = git_text(commit, path)
        frozen = REF / 'reference_idnode' / path
        frozen.parent.mkdir(parents=True, exist_ok=True)
        if frozen.exists() and frozen.read_bytes() != original:
            raise SystemExit('Frozen upstream source changed: ' + path)
        frozen.write_bytes(original)
        mapped = path.replace('VC/code_proof/', 'VC/code/')
        output = fixture / mapped
        output.parent.mkdir(parents=True, exist_ok=True)
        candidate = adjust_imports(original)
        unchanged = without_imports(original) == without_imports(candidate)
        assert unchanged, path
        if args.mode == 'local' and path == 'lib/dll.v':
            header = candidate.split(b'Module DLL.')[0]
            candidate = header + (
                'Require Export QCIPLib.xizi.xizi_double_link_common.xizi_double_link_lib.\n'
                'Module DLL.\nInclude XiziIdmanagerDLL.\n'
                '(* Frozen origin/idnode assumption, unchanged. Not part of the clean local DLL library. *)\n'
            ).encode() + axiom + (
                '\nEnd DLL.\n'
                '(* Preserve original proof matching across the local sizeof implementation. *)\n'
                'Arguments sizeof_front_end_type _ : simpl never.\n').encode()
            unchanged = False
        elif args.mode == 'baseline_compat' and path == 'lib/dll.v':
            candidate += b'\nArguments sizeof_front_end_type _ : simpl never.\n'
            unchanged = False
        output.write_bytes(candidate)
        records.append({'upstream_path': path, 'fixture_path': output.relative_to(source).as_posix(),
                        'upstream_sha256': digest(original), 'fixture_sha256': digest(candidate),
                        'all_non_import_text_unchanged': unchanged, 'library_wrapper': path == 'lib/dll.v' and args.mode != 'baseline'})
        for m in re.finditer(rb'(?m)^\s*(Axiom|Parameter)\s+(\w+)|\b(Admitted|Abort)\.', original):
            assumptions.append({'file': path, 'line': original[:m.start()].count(b'\n') + 1,
                                'kind': (m.group(1) or m.group(3)).decode(), 'declaration': (m.group(2) or b'').decode()})
    target_rel = Path('QCIPCases/idmanager_compat/suite_goal_check.v')
    suite = ''.join(f'Require Import QCIPCases.idmanager_compat.VC.code.id.{c}_goal_check.\n' for c in CASES)
    if args.mode == 'local':
        for path in ('lib/glob.v', 'lib/bitmap.v', 'lib/dll.v', 'lib/idnode.v'):
            original = git_text('d215f73b69916cc5c7c01af752bca4b6f96b3530', path)
            candidate = adjust_imports(original).replace(b'QCIPCases.idmanager_compat.', b'QCIPCases.idmanager_master.')
            if path == 'lib/dll.v':
                candidate = candidate.split(b'Module DLL.')[0] + (
                    'Require Export QCIPLib.xizi.xizi_double_link_common.xizi_double_link_lib.\n'
                    'Module DLL := QCIPLib.xizi.xizi_double_link_common.xizi_double_link_lib.DLL.\n').encode()
            output = source / 'QCIPCases/idmanager_master' / path
            output.parent.mkdir(parents=True, exist_ok=True)
            output.write_bytes(candidate)
            records.append({'upstream_path': 'master:' + path, 'fixture_path': output.relative_to(source).as_posix(),
                            'upstream_sha256': digest(original), 'fixture_sha256': digest(candidate),
                            'all_non_import_text_unchanged': without_imports(original) == without_imports(candidate),
                            'library_wrapper': path == 'lib/dll.v'})
        suite += 'Require Import QCIPCases.idmanager_master.lib.idnode.\n'
        suite += ('Check (fun {A} (x : QCIPCases.idmanager_master.lib.dll.DLL.DL_Node A) => '
                  '(x : QCIPCases.idmanager_compat.lib.dll.DLL.DL_Node A)).\n')
    (source / target_rel).write_text(suite)
    common_path = source / COMMON
    manifest = {'schema_version': 'idmanager-import-compat/v1', 'mode': args.mode,
                'upstream_commit': commit, 'upstream_proof_branch': 'origin/idnode',
                'reference_definition_commit': 'd215f73b69916cc5c7c01af752bca4b6f96b3530',
                'source_workspace': str(source), 'build_workspace': str(build),
                'local_common_file': str(common_path.resolve()), 'local_common_sha256': digest(common_path.read_bytes()),
                'files': records, 'preexisting_assumptions_and_aborted_diagnostics': assumptions,
                'local_wrapper_preserves_upstream_nonzero_axiom': args.mode == 'local',
                'library_side_simpl_compatibility': 'Arguments sizeof_front_end_type _ : simpl never.' if args.mode != 'baseline' else None,
                'status': 'prepared'}
    manifest['source_goal_version'] = digest(json.dumps({'files': records, 'common': manifest['local_common_sha256']}, sort_keys=True).encode())
    (reports / 'manifest.json').write_text(json.dumps(manifest, indent=2) + '\n')
    if args.prepare_only:
        print(json.dumps({'status': 'prepared', 'manifest': str(reports / 'manifest.json')})); return
    if build.exists():
        raise SystemExit('Fresh compatibility check requires an unused build directory.')
    argv = ['python3', str(TOOL), 'check', '--workspace-root', str(source), '--build-workspace', str(build),
            '--target-file', target_rel.as_posix(), '--target-kind', 'check', '--source-goal-version', manifest['source_goal_version'],
            '--timeout-seconds', '1800']
    start = time.monotonic()
    proc = subprocess.run(argv, cwd=ROOT, capture_output=True, text=True)
    (reports / 'coqc_stdout.json').write_text(proc.stdout)
    (reports / 'coqc_stderr.log').write_text(proc.stderr)
    evidence = json.loads(proc.stdout) if proc.stdout.strip().startswith('{') else {}
    used_digests = evidence.get('source_digests', {})
    resolution = {'fresh_build_directory': True,
                  'fixture_hashes_match_compiled_sources': all(used_digests.get(r['fixture_path']) == r['fixture_sha256'] for r in records),
                  'local_common_in_dependency_order': COMMON in evidence.get('dependency_order', []),
                  'local_common_hash_matches_compiled_source': used_digests.get(COMMON) == manifest['local_common_sha256'],
                  'local_common_source_unchanged_during_check': digest(common_path.read_bytes()) == manifest['local_common_sha256']}
    valid = proc.returncode == 0 and resolution['fixture_hashes_match_compiled_sources']
    if args.mode == 'local':
        valid = valid and all(resolution.values())
    manifest.update(status='passed' if valid else 'failed', argv=argv, returncode=proc.returncode, elapsed_seconds=time.monotonic() - start,
                    dependency_resolution=resolution)
    (reports / 'manifest.json').write_text(json.dumps(manifest, indent=2) + '\n')
    print(json.dumps({'status': manifest['status'], 'manifest': str(reports / 'manifest.json'), 'returncode': proc.returncode}))
    raise SystemExit(0 if valid else 1)


if __name__ == '__main__':
    main()
