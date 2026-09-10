#!/usr/bin/env python3
"""Main-owned CLI convenience; delegates all acceptance to controller; never spawns agents."""
import json, os, subprocess, sys, time
from pathlib import Path
from datetime import datetime, timezone
ROOT=Path.cwd().resolve()
REF=ROOT/'OUTPUT/xizi/xizi_double_link_common/reports/crules_unification'
CONTROLLER=ROOT/'.agents/skills/verification-orchestrator/scripts/controller.py'
ENV=dict(os.environ, PYTHONDONTWRITEBYTECODE='1')

def read_state(run):
    rows=(ROOT/'reports'/run/'run_logs.json').read_text().splitlines()
    return [r['state'] for line in rows if (r:=json.loads(line)).get('record_kind')=='state_snapshot'][-1]

def invoke(command,run=None,**kwargs):
    argv=['python3',str(CONTROLLER),command]
    if run:argv+=['--run',run]
    for key,val in kwargs.items():
        if val is False or val is None:continue
        argv+=['--'+key.replace('_','-')]
        if val is not True:argv+=[str(val)]
    start=datetime.now(timezone.utc); t=time.monotonic()
    proc=subprocess.run(argv,cwd=ROOT,env=ENV,capture_output=True,text=True)
    record={'schema_version':'qcp-main-command/v1','argv':argv,'started_at':start.isoformat(),'elapsed_seconds':time.monotonic()-t,'returncode':proc.returncode,'stdout':proc.stdout,'stderr':proc.stderr}
    if run:
        log=ROOT/'reports'/run/('main_'+start.strftime('%H%M%S%f')+'_'+command+'.json')
        log.write_text(json.dumps(record,ensure_ascii=False,indent=2)+'\n')
    with (REF/'activity.jsonl').open('a') as f:f.write(json.dumps({k:v for k,v in record.items() if k not in ['stdout','stderr']})+'\n')
    if proc.returncode:
        print(json.dumps(record,ensure_ascii=False)[-12000:]); raise SystemExit(proc.returncode)
    try:return json.loads(proc.stdout)
    except json.JSONDecodeError:return {'stdout':proc.stdout}

def show(run):
    s=read_state(run)
    inventory_path=REF/'migration_inventory.json'
    inventory=json.loads(inventory_path.read_text())
    for entry in inventory['case_inventory']+inventory.get('single_link_regression_cases',[]):
        if entry.get('run_id')==run:
            entry['current_controller_phase']=s['phase']
            if entry.get('migration_status')!='passed':
                entry['migration_status']=s['phase'] if s['phase']!='done' else 'passed_pending_archive'
    inventory_path.write_text(json.dumps(inventory,ensure_ascii=False,indent=2)+'\n')
    print(json.dumps({'run':run,'phase':s['phase'],'next_actions':s.get('next_actions',[])},ensure_ascii=False,indent=2))

def main():
    cmd=sys.argv[1]; arg=sys.argv[2] if len(sys.argv)>2 else None
    if cmd=='init':
        case=arg; result=invoke('init-run',case=case,coq_rules='CRules',target_c_file=f'OUTPUT/xizi/{case}/source/{case}.c',problem_statement_file=REF/'contract.md',expected_behavior='Unify active assertions and helpers on CRules; XiziLocalDLL aliases the shared idmanager actual-layout instance. Preserve every spec variant, original C and payload/order/self-link guarantees.')
        run=result['run_id']; inv=json.loads((REF/'migration_inventory.json').read_text())
        for e in inv['case_inventory']:
            if e['case']==case:e.update(run_id=run,migration_status='annotation')
        (REF/'migration_inventory.json').write_text(json.dumps(inv,indent=2)+'\n')
        invoke('step',run); show(run)
    elif cmd=='complete':
        run=arg; identifier=sys.argv[3]
        s=read_state(run)
        attempts=list(s.get('attempts',{}).values())+list(s.get('group_attempts',{}).values())
        match=next((a for a in attempts if identifier in [a.get('attempt_id'),a.get('group_id'),a.get('round'),a.get('report')]),None)
        if match and match.get('report'):
            report=json.loads(Path(match['report']).read_text())
            if 'agent_result' in report:
                phase=match.get('phase','group-worker')
                result=report['agent_result'].get(phase,report['agent_result'].get(phase.replace('-','_'),{}))
                if not result:result=report['agent_result'].get('vc_proving',{}).get('group',{})
                assert result.get('status')=='completed',result
        invoke('mark-attempt-returned',run,attempt=identifier,result_status='completed')
        invoke('review-attempt',run,attempt=match['report'] if match else identifier,run_main_check_if_ready=True)
        invoke('step',run); show(run)
    elif cmd=='start':
        invoke('mark-attempt-started',arg,attempt=sys.argv[3])
    elif cmd=='spawn':
        run=arg; s=read_state(run)
        for action in s.get('next_actions',[]):
            if action.get('kind') in ['spawn-attempt','spawn-group-worker']:
                if action.get('kind') == 'spawn-attempt':
                    ip = Path(action['input'])
                    handoff = json.loads(ip.read_text())
                    handoff.setdefault('problem_context', {})['controller_integration_notes'] = [
                        'VC checking: report top-level phase/round/attempt identities are required. Put status and source_goal_version inside agent_result.vc_checking. Do not put agent_result.phase alongside nested vc_checking: it masks the nested plan in controller parsing. Controller materializes a correctly nested group_plan; no extra standalone output is needed.',
                        'Capture complete fixed coq_tooling check stdout from the first run into declared report evidence using subprocess capture_output. Tool output truncation is avoidable; print only a short summary.',
                        'Scope every git diff/check to explicit allowed file paths. Current operational contract reference: ' + str(REF/'contract.md')]
                    ip.write_text(json.dumps(handoff, ensure_ascii=False, indent=2) + '\n')
                print(json.dumps(invoke('spawn-instructions',run,next_action=action['id']),ensure_ascii=False,indent=2))
    elif cmd=='prepare':
        run=arg; s=read_state(run)
        action=next(a for a in s['next_actions'] if a.get('action')=='vc-proving-preparing')
        invoke('vc-proving-preparing',run,round=action['round']); invoke('step',run); show(run)
    elif cmd=='verify':
        run=arg; invoke('step',run); s=read_state(run)
        action=next(a for a in s['next_actions'] if a.get('action')=='vc-proving-verify')
        invoke('vc-proving-verify',run,round=action['round']); show(run)
    elif cmd=='finish':
        run=arg; invoke('final-apply',run); invoke('final-check',run); show(run)
    elif cmd=='status':
        inv=json.loads((REF/'migration_inventory.json').read_text())
        for c in inv['case_inventory']:
            print(c['case'],c.get('run_id','pending'),read_state(c['run_id'])['phase'] if c.get('run_id') else c['migration_status'])
    else:raise SystemExit('Unknown command')
if __name__=='__main__':main()
