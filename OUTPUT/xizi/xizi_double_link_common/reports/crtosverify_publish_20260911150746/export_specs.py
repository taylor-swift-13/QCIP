#!/usr/bin/env python3
"""Export accepted artifacts, regenerate VCs, and check a bijective import mirror."""
import hashlib, json, re, shutil, subprocess, sys, time
from pathlib import Path
ROOT=Path('/home/yangfp/QCIP')
REPORT=Path(__file__).resolve().parent
STATE=json.loads((REPORT/'state.json').read_text())
REFERENCE=ROOT/'OUTPUT/xizi/xizi_double_link_common/reports/origin_dll_alignment'
sys.path.insert(0,str(ROOT/'.agents/skills/vc-proving/scripts'))
sys.path.insert(0,str(ROOT/'.agents/skills/verification-orchestrator/scripts'))
import controller
from manual_goal_utils import parse_manual_file, normalize_rocq_text, lemma_statement_hash

def write(p,s):
 p.parent.mkdir(parents=True,exist_ok=True);p.write_text(s)
def dump(p,j):write(p,json.dumps(j,ensure_ascii=False,indent=2)+'\n')
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def imports(text):
 def convert(m):
  module=m['module'];names=m['names'];target=None
  if module.startswith('QCIPLib.xizi.'):
   target='CRTOS_Verify.VC.strategy' if '_strategy_' in names else 'CRTOS_Verify.lib'
  case=re.fullmatch(r'SimpleC\.EE\.OUTPUT\.xizi\.(xizi_\w+)\.source',module)
  if case:target='CRTOS_Verify.lib' if '_lib' in names else 'CRTOS_Verify.VC.code.xizi.'+case[1]
  return m[0].replace(module,target,1) if target else m[0]
 text=re.sub(r'From\s+(?P<module>[\w.]+)\s+Require\s+(?:Import|Export)\s+(?P<names>[\w\s]+)(?:\.|(?=\*/))',convert,text)
 text=re.sub(r'QCIPLib\.xizi\.xizi_(?:double|single)_link_common\.(xizi_\w+)',lambda m:('CRTOS_Verify.VC.strategy.' if '_strategy_' in m[1] else 'CRTOS_Verify.lib.')+m[1],text)
 text=re.sub(r'SimpleC\.EE\.OUTPUT\.xizi\.(xizi_\w+)\.source\.(xizi_\w+)',lambda m:('CRTOS_Verify.lib.' if m[2].endswith('_lib') else 'CRTOS_Verify.VC.code.xizi.'+m[1]+'.')+m[2],text)
 def bare(m):
  if re.search(r'From\s+[\w.]+\s*$',text[:m.start()]):return m[0]
  target='CRTOS_Verify.VC.strategy' if '_strategy_' in m[3] else 'CRTOS_Verify.lib'
  return m[1]+'From '+target+' Require '+m[2]+' '+m[3]
 text=re.sub(r'(?m)^(\s*(?:/\*@ Import Coq )?)Require (Import|Export) (xizi_(?:double|single)_link_\w+)',bare,text)
 return re.sub(r'\bxizi_single_link_lib\b','sll',text)
def fixture_imports(text):
 return ''.join(line.replace('CRTOS_Verify.','QCIPCases.exported.').replace('SL.ConAssertion','SimpleC.SL.ConAssertion').replace('SL.CriticalSTS','SimpleC.SL.CriticalSTS').replace('SL.NestedCriticalSTS','SimpleC.SL.NestedCriticalSTS') if re.match(r'\s*(From |Require )',line) else line for line in text.splitlines(keepends=True))
def nonimports(text):return ''.join(line for line in text.splitlines(keepends=True) if not re.match(r'\s*(From |Require )',line))
def selected(kind):
 j=json.loads((REFERENCE/'migration_inventory.json').read_text())
 return j['case_inventory'] if kind=='double' else j['single_link_regression_cases']

def prepare(kind):
 dest=Path(STATE[kind]['worktree']);report=REPORT/kind;report.mkdir(exist_ok=True)
 name='xizi_'+kind+'_link'; common=ROOT/'QCIPLib/xizi'/(name+'_common')
 records=[];cases=[]
 def copy(src,target):
  content=imports(src.read_text());write(dest/target,content)
  if src.suffix=='.c':
   content=re.sub(r'#include "[^"\n]*('+name+r'_def\.h)"',r'#include "\1"',content);write(dest/target,content)
  records.append({'source':str(src.relative_to(ROOT)),'target':target,'source_sha256':sha(src),'export_sha256':sha(dest/target),'transformation':'Require paths and C header include path only' if src.suffix=='.c' else 'Require paths only'})
 copy(common/(name+'_lib.v'),'lib/'+('sll.v' if kind=='single' else name+'_lib.v'))
 if kind=='single' and (dest/'lib/xizi_single_link_lib.v').exists():(dest/'lib/xizi_single_link_lib.v').unlink()
 for src in common.glob('*_strategy_*.v'):copy(src,'VC/strategy_proof/'+src.name)
 for suffix in ['_def.h','.strategies']:
  src=ROOT/'OUTPUT/xizi'/(name+'_common')/'source'/(name+suffix)
  target=('annotated_C/src/' if suffix=='_def.h' else 'annotated_C/strategy/')+src.name
  copy(src,target)
 for entry in selected(kind):
  case=entry['case']; local=ROOT/'SeparationLogic/examples/OUTPUT/xizi'/case/'source'
  source=ROOT/'OUTPUT/xizi'/case/'source'/(case+'.c'); target=f'annotated_C/src/xizi/{case}/{case}.c';copy(source,target)
  lib=local/(case+'_lib.v')
  if lib.exists():copy(lib,'lib/'+lib.name)
  out=dest/'VC/code_proof/xizi'/case;out.mkdir(parents=True,exist_ok=True)
  for suffix in ['goal','proof_auto','proof_manual','goal_check']:
   p=out/(case+'_'+suffix+'.v')
   if p.exists():p.unlink()
  argv=[str(ROOT/'linux-binary/symexec'),f'--goal-file={out}/{case}_goal.v',f'--proof-auto-file={out}/{case}_proof_auto.v',f'--proof-manual-file={out}/{case}_proof_manual.v','-IQCP_examples/QCP_demos_LLM/',f'-I{dest}/annotated_C/src/','-slp','QCP_examples/QCP_demos_LLM/','SimpleC.EE.QCP_demos_LLM','-slp',str(dest/'annotated_C/strategy')+'/','CRTOS_Verify.VC.strategy','--CRules','CRules' if kind=='double' else 'naive_C_Rules',f'--coq-logic-path=CRTOS_Verify.VC.code.xizi.{case}',f'--input-file={dest/target}','--no-exec-info']
  p=subprocess.run(argv,cwd=ROOT,capture_output=True,text=True)
  evidence={'driver':argv[0],'cwd':str(ROOT),'argv':argv,'returncode':p.returncode,'stdout':p.stdout,'stderr':p.stderr}
  dump(report/(case+'_symexec.json'),evidence)
  assert p.returncode==0,(case,p.stderr,p.stdout[-1500:])
  targets={'proof_manual_file':str(out/(case+'_proof_manual.v')),'proof_diagnostics_file':str(report/(case+'_proof_diagnostics.v')),'diagnostics_snapshot':str(report/(case+'_diagnostics_snapshot.json'))}
  controller._split_manual_diagnostics_for_workspace(dest,targets)
  for suffix in ['goal','proof_auto','goal_check']:
   expected=imports((local/(case+'_'+suffix+'.v')).read_text());actual=(out/(case+'_'+suffix+'.v')).read_text()
   assert normalize_rocq_text(actual)==normalize_rocq_text(expected),(case,suffix,'generated file differs beyond import paths')
  manual=out/(case+'_proof_manual.v');_,fresh=parse_manual_file(manual.read_text()); proof=imports((local/manual.name).read_text());_,old=parse_manual_file(proof)
  assert [(b['name'],lemma_statement_hash(b)) for b in fresh]==[(b['name'],lemma_statement_hash(b)) for b in old],case
  write(manual,proof)
  cases.append({'case':case,'accepted_run':entry['run_id'],'canonical_symexec':'passed','generated_files_match_accepted_modulo_imports':True,'manual_proofs_changed_only_imports':True})
 if kind=='double':
  old=subprocess.check_output(['git','-C',str(dest),'show','HEAD:lib/dll.v'],text=True)
  header=old.split('Module DLL.')[0]
  write(dest/'lib/dll.v',header+'Require Export CRTOS_Verify.lib.xizi_double_link_lib.\nModule DLL := xizi_double_link_lib.DLL.\n')
  compatibility=dest/'lib/dll_master.v'
  if compatibility.exists():compatibility.unlink()
  p=dest/'lib/idnode.v';old_idnode=subprocess.check_output(['git','-C',str(dest),'show','HEAD:lib/idnode.v'],text=True)
  write(p,old_idnode)
 mk=dest/'Makefile';text=subprocess.check_output(['git','-C',str(dest),'show','HEAD:Makefile'],text=True)
 libs=['glob.v','dll.v','bitmap.v','idnode.v']+['sll.v' if kind=='single' else name+'_lib.v']+[c['case']+'_lib.v' for c in cases if (dest/'lib'/(c['case']+'_lib.v')).exists()]
 text=re.sub(r'lib_FILES =.*?(?=VC_code_FILE_NAME =)', 'lib_FILES = \\\n\t'+' \\\n\t'.join(libs)+'\n',text,flags=re.S)
 text=re.sub(r'VC_code_FILE_NAME =.*?(?=VC_developing_code_FILE_NAME =)', 'VC_code_FILE_NAME = \\\n\t'+' \\\n\t'.join('xizi/'+c['case']+'/'+c['case'] for c in cases)+'\n',text,flags=re.S)
 text=text.replace('C_INCLUDE_FLAG = -I../QCP_examples/QCP_demos_LLM','QCP_DEMOS_DIR ?= ../QCP_examples/QCP_demos_LLM\nC_INCLUDE_FLAG = -Iannotated_C/src -I$(QCP_DEMOS_DIR)')
 text=text.replace('$(C_INCLUDE_FLAG) -slp annotated_C/gen/', '$(C_INCLUDE_FLAG) -slp $(QCP_DEMOS_DIR)/ SimpleC.EE.QCP_demos_LLM --CRules '+('CRules' if kind=='double' else 'naive_C_Rules')+' -slp annotated_C/gen/')
 # Existing make generation uses its own sibling QCP layout; the verified export command above is recorded separately.
 write(mk,text)
 manifest={'schema_version':'accepted-link-spec-export/v1','status':'prepared','branch':STATE[kind]['branch'],'baseline':STATE[kind]['baseline'],'cases':cases,'library_sources':records,'reference_acceptance':str(REFERENCE.relative_to(ROOT)/'final_summary.json'),'validation_scope':'Canonical VC regeneration and current fixed Coq check via bijective Require-path mirror; no raw CRTOS coqc flags used.'}
 dump(report/'manifest.json',manifest);print(kind,'prepared',len(cases))

def check(kind):
 tag=sys.argv[3] if len(sys.argv)>3 else ''
 dest=Path(STATE[kind]['worktree']);report=REPORT/kind/tag;report.mkdir(parents=True,exist_ok=True);source=Path(STATE['work_root'])/(kind+tag+'_check_sources');source.mkdir(exist_ok=True)
 for directory in ['SeparationLogic','FloatTest']:
  if not (source/directory).exists():(source/directory).symlink_to(ROOT/directory,target_is_directory=True)
 records=[]
 for folder,logical in [('lib','lib'),('VC/code_proof','VC/code'),('VC/strategy_proof','VC/strategy')]:
  for p in (dest/folder).rglob('*.v'):
   target=source/'QCIPCases/exported'/logical/p.relative_to(dest/folder);converted=fixture_imports(p.read_text());write(target,converted)
   assert nonimports(p.read_text())==nonimports(converted)
   records.append({'exported_path':str(p.relative_to(dest)),'exported_sha256':sha(p),'fixture_path':str(target.relative_to(source)),'fixture_sha256':sha(target),'only_imports_changed':True})
 suite=source/'QCIPCases/exported_suite.v'; lines=['Require Import QCIPCases.exported.lib.idnode.']
 if kind=='double':lines+=['Require Import QCIPCases.exported.lib.dll.']
 lines += ['Require Import QCIPCases.exported.VC.code.xizi.'+e['case']+'.'+e['case']+'_goal_check.' for e in selected(kind)]
 write(suite,'\n'.join(lines)+'\n')
 version=hashlib.sha256(json.dumps(records,sort_keys=True).encode()).hexdigest();build=Path(STATE['work_root'])/(kind+tag+'_coq_build')
 argv=['python3','-B',str(ROOT/'.agents/skills/vc-proving/scripts/coq_tooling.py'),'check','--workspace-root',str(source),'--build-workspace',str(build),'--target-file',str(suite.relative_to(source)),'--target-kind','check','--source-goal-version',version]
 start=time.monotonic();p=subprocess.run(argv,cwd=ROOT,capture_output=True,text=True);write(report/'coq_stdout.json',p.stdout);write(report/'coq_stderr.txt',p.stderr)
 dump(report/'compile.json',{'status':'passed' if p.returncode==0 else 'failed','argv':argv,'cwd':str(ROOT),'returncode':p.returncode,'elapsed_seconds':time.monotonic()-start,'source_goal_version':version,'files':records})
 print(kind,'compile',p.returncode);raise SystemExit(p.returncode)

if __name__=='__main__':
 {'prepare':prepare,'check':check}[sys.argv[1]](sys.argv[2])
