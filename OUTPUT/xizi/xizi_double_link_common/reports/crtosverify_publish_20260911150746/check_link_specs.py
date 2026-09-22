#!/usr/bin/env python3
"""Reproduce exported specs using QCIP's fixed tooling, without editing sources."""
import argparse, hashlib, json, re, shutil, subprocess, sys
from datetime import datetime, timezone
from pathlib import Path

def main():
 ap=argparse.ArgumentParser(description=__doc__)
 ap.add_argument('--qcip-root',type=Path,required=True)
 ap.add_argument('--report-root',type=Path)
 args=ap.parse_args();qcip=args.qcip_root.resolve();repo=Path(__file__).resolve().parents[1]
 manifest=json.loads((repo/'verification/link_specs.json').read_text());kind=manifest['kind']
 stamp=datetime.now(timezone.utc).strftime('%Y%m%d%H%M%S')
 report=args.report_root or qcip/f'OUTPUT/xizi/xizi_{kind}_link_common/reports/crtosverify_replay_{stamp}'
 report=report.resolve();report.mkdir(parents=True,exist_ok=False)
 work=qcip/'worktrees'/f'crtosverify_{kind}_link_replay_{stamp}';source=work/'sources';source.mkdir(parents=True)
 sys.path.insert(0,str(qcip/'.agents/skills/vc-proving/scripts'))
 sys.path.insert(0,str(qcip/'.agents/skills/verification-orchestrator/scripts'))
 import controller
 from manual_goal_utils import parse_manual_file,lemma_statement_hash,normalize_rocq_text
 def dump(path,obj):path.write_text(json.dumps(obj,ensure_ascii=False,indent=2)+'\n')
 try:
  for case in manifest['cases']:
   name=case['case'];fresh=report/name;fresh.mkdir()
   argv=[str(qcip/'linux-binary/symexec'),f'--goal-file={fresh}/{name}_goal.v',f'--proof-auto-file={fresh}/{name}_proof_auto.v',f'--proof-manual-file={fresh}/{name}_proof_manual.v','-IQCP_examples/QCP_demos_LLM/',f'-I{repo}/annotated_C/src/','-slp','QCP_examples/QCP_demos_LLM/','SimpleC.EE.QCP_demos_LLM','-slp',str(repo/'annotated_C/strategy')+'/','CRTOS_Verify.VC.strategy','--CRules','CRules' if kind=='double' else 'naive_C_Rules',f'--coq-logic-path=CRTOS_Verify.VC.code.xizi.{name}',f'--input-file={repo}/annotated_C/src/xizi/{name}/{name}.c','--no-exec-info']
   p=subprocess.run(argv,cwd=qcip,capture_output=True,text=True);dump(fresh/'symexec.json',dict(driver=argv[0],cwd=str(qcip),argv=argv,returncode=p.returncode,stdout=p.stdout,stderr=p.stderr));assert p.returncode==0,name
   target=repo/'VC/code_proof/xizi'/name
   for suffix in ['goal','proof_auto','goal_check']:
    filename=name+'_'+suffix+'.v';assert normalize_rocq_text((fresh/filename).read_text())==normalize_rocq_text((target/filename).read_text()),filename
   controller._split_manual_diagnostics_for_workspace(fresh,dict(proof_manual_file=name+'_proof_manual.v',proof_diagnostics_file=name+'_proof_diagnostics.v',diagnostics_snapshot='diagnostics_snapshot.json'))
   def statements(path):return [(b['name'],lemma_statement_hash(b)) for b in parse_manual_file(path.read_text())[1]]
   assert statements(fresh/(name+'_proof_manual.v'))==statements(target/(name+'_proof_manual.v')),name
  for directory in ['SeparationLogic','FloatTest']:(source/directory).symlink_to(qcip/directory,target_is_directory=True)
  records=[]
  for physical,logical in [('lib','lib'),('VC/code_proof','VC/code'),('VC/strategy_proof','VC/strategy')]:
   for path in (repo/physical).rglob('*.v'):
    text=path.read_text();converted=''.join(line.replace('CRTOS_Verify.','QCIPCases.exported.').replace('SL.ConAssertion','SimpleC.SL.ConAssertion').replace('SL.CriticalSTS','SimpleC.SL.CriticalSTS').replace('SL.NestedCriticalSTS','SimpleC.SL.NestedCriticalSTS') if re.match(r'\s*(From |Require )',line) else line for line in text.splitlines(keepends=True))
    target=source/'QCIPCases/exported'/logical/path.relative_to(repo/physical);target.parent.mkdir(parents=True,exist_ok=True);target.write_text(converted)
    records.append(dict(path=str(path.relative_to(repo)),sha256=hashlib.sha256(path.read_bytes()).hexdigest(),fixture_sha256=hashlib.sha256(target.read_bytes()).hexdigest()))
  suite=source/'QCIPCases/exported_suite.v';suite.write_text('Require Import QCIPCases.exported.lib.idnode.\n'+('Require Import QCIPCases.exported.lib.dll.\n' if kind=='double' else '')+''.join('Require Import QCIPCases.exported.VC.code.xizi.'+c['case']+'.'+c['case']+'_goal_check.\n' for c in manifest['cases']))
  version=hashlib.sha256(json.dumps(records,sort_keys=True).encode()).hexdigest()
  argv=['python3','-B',str(qcip/'.agents/skills/vc-proving/scripts/coq_tooling.py'),'check','--workspace-root',str(source),'--build-workspace',str(work/'build'),'--target-file',str(suite.relative_to(source)),'--target-kind','check','--source-goal-version',version]
  p=subprocess.run(argv,cwd=qcip,capture_output=True,text=True);(report/'coq_stdout.json').write_text(p.stdout);(report/'coq_stderr.txt').write_text(p.stderr)
  unchanged=all(hashlib.sha256((repo/r['path']).read_bytes()).hexdigest()==r['sha256'] for r in records)
  passed=p.returncode==0 and unchanged;dump(report/'result.json',dict(schema_version='crtosverify-link-replay/v1',status='passed' if passed else 'failed',canonical_freshness='passed',coq_argv=argv,coq_returncode=p.returncode,export_sources_unchanged=unchanged,files=records,namespace_policy='Only Require paths are mirrored to QCIPCases.exported for the fixed Coq mapping.'))
  print(json.dumps(dict(status='passed' if passed else 'failed',report=str(report))));return 0 if passed else 1
 finally:
  shutil.rmtree(work)
if __name__=='__main__':raise SystemExit(main())
