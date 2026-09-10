#!/usr/bin/env python3
"""Preserve measured timing coverage and explicit gaps, without estimating time."""
import json
import sys
from datetime import datetime, timezone
from pathlib import Path


def instant(value):
    return datetime.fromisoformat(value.replace('Z', '+00:00'))


def review(root, run_id):
    report = root / 'reports' / run_id
    timing = json.loads((report / 'timing_summary.json').read_text())
    nodes = timing['nodes']
    start = min(instant(n['timestamp']) for n in nodes)
    cleanup = report / 'cleanup_summary.json'
    finish = instant(json.loads(cleanup.read_text())['finished_at']) if cleanup.exists() else datetime.now(timezone.utc)
    elapsed = (finish - start).total_seconds()
    by_sequence = {n['sequence']: n for n in nodes}
    intervals = []
    details = []
    workers = []
    for node in nodes:
        if node.get('node_type') != 'end' or node.get('paired_start_sequence') not in by_sequence:
            continue
        category = node.get('category')
        if category not in ('controller_command', 'attempt', 'group_worker'):
            continue
        first = by_sequence[node['paired_start_sequence']]
        a, b = instant(first['timestamp']), instant(node['timestamp'])
        intervals.append((max(a, start), min(b, finish)))
        detail = {'category': category, 'name': node.get('name'), 'phase': node.get('phase'),
                  'started_at': a.isoformat(), 'ended_at': b.isoformat(), 'elapsed_seconds': (b-a).total_seconds(),
                  'round': node.get('round'), 'group': node.get('group')}
        details.append(detail)
        if category != 'controller_command':
            workers.append(detail)
    merged = []
    for a, b in sorted(intervals):
        if a >= b:
            continue
        if merged and a <= merged[-1][1]:
            merged[-1] = (merged[-1][0], max(b, merged[-1][1]))
        else:
            merged.append((a, b))
    coverage = sum((b-a).total_seconds() for a, b in merged)
    long_rounds = []
    for worker in workers:
        round_dir = report / 'rounds' / (worker.get('round') or '')
        paths = list(round_dir.glob('agent_report.json'))
        if worker.get('group'):
            paths = list(round_dir.glob('groups/*__'+worker['group']+'/group_worker_report.json'))
        owner = {}
        for path in paths:
            document = json.loads(path.read_text())
            result_node = document.get('agent_result', {})
            if worker.get('group'):
                owner = result_node.get('vc_proving', {}).get('group', {})
            else:
                owner = result_node.get(worker.get('phase', '').replace('-', '_'), result_node.get(worker.get('phase'), result_node))
        is_blocked = owner.get('status') == 'blocked'
        if worker['elapsed_seconds'] > 600 or is_blocked:
            long_rounds.append(dict(worker,
                subagent_name=worker['name'],
                blocked_reason=owner.get('blockers', []) if is_blocked else None,
                long_duration_reason=('See owner reports and Coq logs for dependency compilation and local repairs; no exact partition of worker analysis/wait/commands was recorded.' if worker['elapsed_seconds'] > 600 else None),
                timing_report_defect='Owner report has no complete wall-clock partition; unmeasured components remain unknown.',
                evidence=[str(path.relative_to(report)) for path in paths]+['timing_summary.json'],
                affected_witnesses=owner.get('solved_witnesses', owner.get('group_plan', {}).get('target_witnesses', [])),
                affected_files=owner.get('changed_files', []),
                recommended_next_phase_or_action='Preserve reports before cleanup; continue controller-directed phase. Do not reinterpret worker active time as main-agent wait time.'))
    result = {'schema_version': 'qcp-final-timing-review/v1', 'run_id': run_id,
              'coverage_status': 'measured intervals with explicit attribution gaps',
              'started_at': start.isoformat(), 'finished_at': finish.isoformat(),
              'includes_cleanup': cleanup.exists(), 'total_elapsed_seconds': elapsed,
              'total_command_seconds': 'unknown', 'total_failed_rerun_seconds': 'unknown',
              'total_human_activity_seconds': 'unknown', 'total_subagent_wait_seconds': 'unknown',
              'recorded_controller_command_seconds': sum(d['elapsed_seconds'] for d in details if d['category']=='controller_command'),
              'recorded_interval_union_seconds': coverage, 'timing_gap_seconds': elapsed-coverage,
              'conservation': 'recorded_interval_union_seconds + timing_gap_seconds = total_elapsed_seconds; nested intervals are not added twice.',
              'timing_gaps': ['From intake, main-agent activity and actual wait intervals were not completely timed.',
                              'Worker tool timings and failed dependency-build timing are partial, so total command and rerun time cannot be reconstructed exactly.',
                              'Worker active intervals can overlap main-agent work; they are not estimates of wait time.'],
              'phase_time': timing.get('phase_time', {}), 'recorded_command_and_worker_details': details,
              'blocked_or_long_rounds': long_rounds,
              'slowest_recorded_command': max((d for d in details if d['category']=='controller_command'), key=lambda d:d['elapsed_seconds'], default=None)}
    (report / 'timing_review.json').write_text(json.dumps(result, ensure_ascii=False, indent=2)+'\n')
    (report / 'timing_review.md').write_text(
        '# 用时与记录缺口\n\n'
        f'从 intake 到当前记录终点：{elapsed:.3f} 秒；包含 cleanup：{cleanup.exists()}。\n\n'
        f'已记录区间的并集：{coverage:.3f} 秒；未归类间隔：{elapsed-coverage:.3f} 秒。两项相加等于真实 wall-clock，不重复累加嵌套或并行区间。\n\n'
        '主 agent 活动、实际等待、所有 worker 命令与失败重跑没有完整分项计时，相关总量明确为 unknown。详情见 timing_review.json；controller 原始计时保留在 timing_summary.json。\n\n'
        f'超过 600 秒的 worker 区间：{len(long_rounds)} 个；原因证据与缺项已逐项保留，不把 worker 活跃时间冒充主 agent 等待时间。\n')
    return result


if __name__ == '__main__':
    result = review(Path.cwd().resolve(), sys.argv[1])
    print(json.dumps({k: result[k] for k in ('run_id','total_elapsed_seconds','timing_gap_seconds','includes_cleanup')}))
