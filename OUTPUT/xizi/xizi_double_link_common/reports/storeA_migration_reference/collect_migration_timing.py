#!/usr/bin/env python3
"""Summarize recorded migration timing without inventing unmeasured intervals."""
from datetime import datetime, timezone
import json
from pathlib import Path


def main():
    root = Path.cwd().resolve()
    reference = Path(__file__).resolve().parent
    inventory = json.loads((reference / 'migration_inventory.json').read_text())
    result = {
        'schema_version': 'qcp-storeA-migration-timing/v1',
        'generated_at': datetime.now(timezone.utc).isoformat(),
        'scope': '本次 storeA 迁移；报告为派生统计，不写 controller acceptance。',
        'total_elapsed_seconds': None,
        'total_command_seconds': None,
        'total_failed_rerun_seconds': None,
        'total_human_activity_seconds': None,
        'total_subagent_wait_seconds': None,
        'timing_gap_seconds': None,
        'unknown_reasons': {
            'total_command_seconds': 'controller command 有记录，但早期工具、worker 调试及归档命令未全部独立计时。',
            'total_failed_rerun_seconds': '已保留失败/重试报告；同一 attempt 内失败 tactic 与重新编译未完整独立计时。',
            'total_human_activity_seconds': '没有人工/模型活动的独立计时器。',
            'total_subagent_wait_seconds': 'attempt 区间包含工作、编译和主侧接收延迟；与并行主侧工作重叠，不能视为纯等待。',
            'timing_gap_seconds': '缺失活动边界且各类区间重叠，不能用相减推造互斥时间分区。',
        },
        'recorded_controller_command_seconds': 0.0,
        'recorded_fixed_phase_attempt_seconds': 0.0,
        'recorded_cleanup_seconds': 0.0,
        'cleanup_unmeasured_cases': [],
        'long_intervals': [],
        'blocked_reports': [],
        'preserved_final_check_failures': [],
        'suite_audits': [],
        'runs': [],
        'aggregation_note': 'recorded_* 为各计时区间之和，可因并行超过任务墙钟时间；不是互斥时间分区。null 表示 unknown。',
    }
    stamps = []
    for entry in inventory['case_inventory']:
        if 'run_id' not in entry:
            continue
        report = root / 'reports' / entry['run_id']
        timing = json.loads((report / 'timing_summary.json').read_text())
        nodes = timing['nodes']
        stamps.extend(datetime.fromisoformat(n['timestamp'].replace('Z', '+00:00')) for n in nodes)
        summary = {'run_id': entry['run_id'], 'evidence': str((report / 'timing_summary.json').relative_to(root)),
                   'migration_status': entry['migration_status']}
        for n in nodes:
            duration = n.get('duration_seconds')
            if duration is None:
                continue
            if n['category'] == 'controller_command':
                result['recorded_controller_command_seconds'] += duration
            if n['category'] == 'attempt':
                result['recorded_fixed_phase_attempt_seconds'] += duration
            if duration > 600 and n['category'] in ('attempt', 'phase'):
                result['long_intervals'].append({
                    'run_id': entry['run_id'], 'category': n['category'], 'name': n['name'],
                    'duration_seconds': duration, 'evidence': summary['evidence'],
                    'reason_status': 'unknown',
                    'reason': '该区间没有完整的子活动计时，不能仅据时长确定原因。实际失败/修复上下文保留在本 run round/group report 与 experience/xizi_link_storeA_migration.md；不据此推造耗时占比。',
                    'report_gap': '不能仅由总区间确定每项耗时原因及占比。',
                })
        for p in report.glob('rounds/*/agent_report.json'):
            data = json.loads(p.read_text())
            for phase, value in data.get('agent_result', {}).items():
                if isinstance(value, dict) and value.get('blockers'):
                    result['blocked_reports'].append({'run_id': entry['run_id'], 'phase': phase,
                        'evidence': str(p.relative_to(root)), 'owner_status': value.get('status'),
                        'controller_status': data.get('status'), 'blockers': value['blockers']})
        for p in report.glob('final_check_forbidden_r*.json'):
            result['preserved_final_check_failures'].append({
                'run_id': entry['run_id'], 'evidence': str(p.relative_to(root)),
                'reason': '固定 Coq 检查通过，但 final-check 检出禁用引理并回滚 main；经新一轮 VC checking/group proof 修复后重新验收。',
                'failed_rerun_seconds': None,
            })
        cleanup = root / 'OUTPUT/xizi' / entry['case'] / 'reports/cleanup_summary.json'
        if cleanup.exists():
            data = json.loads(cleanup.read_text())
            seconds = data.get('elapsed_seconds')
            if seconds is not None:
                result['recorded_cleanup_seconds'] += seconds
            else:
                result['cleanup_unmeasured_cases'].append(entry['case'])
        else:
            result['cleanup_unmeasured_cases'].append(entry['case'])
        result['runs'].append(summary)
    if stamps:
        result['first_recorded_at'] = min(stamps).isoformat()
        result['last_controller_recorded_at'] = max(stamps).isoformat()
        result['total_elapsed_seconds'] = (datetime.now(timezone.utc) - min(stamps)).total_seconds()
        result['elapsed_scope'] = '首个 controller 计时到本统计生成时，含归档/最终回归；不包括首个 run 前的阅读与设计。'
    result['all_cases_completed'] = all(c['migration_status'] == 'passed' for c in inventory['case_inventory'])
    for p in sorted((reference / 'suite_audits').glob('*/audit.json')):
        audit = json.loads(p.read_text())
        result['suite_audits'].append({
            'evidence': str(p.relative_to(root)), 'status': audit['status'],
            'started_at': audit.get('started_at'), 'finished_at': audit.get('finished_at'),
            'failure_kind': audit.get('failure_kind'),
            'duration_seconds': ((datetime.fromisoformat(audit['finished_at']) -
                                  datetime.fromisoformat(audit['started_at'])).total_seconds()
                                 if audit.get('finished_at') else None),
        })
    output = reference / 'migration_timing_summary.json'
    output.write_text(json.dumps(result, ensure_ascii=False, indent=2) + '\n')
    print(json.dumps({'evidence': str(output), 'all_cases_completed': result['all_cases_completed']}))


if __name__ == '__main__':
    main()
