#!/usr/bin/env python3
import hashlib,json,re,shutil,subprocess,sys
from pathlib import Path
ROOT=Path('/home/yangfp/QCIP');REPORT=Path(__file__).resolve().parent
sys.path.insert(0,str(ROOT/'.agents/skills/verification-orchestrator/scripts'))
sys.path.insert(0,str(ROOT/'.agents/skills/vc-proving/scripts'))
import controller
from manual_goal_utils import parse_manual_file

def main(kind):
 state=json.loads((REPORT/'state.json').read_text());repo=Path(state[kind]['worktree']);r=REPORT/kind
 evidence_dir=r/('unified_ready' if kind=='double' else 'sll_ready')
 manifest=json.loads((r/'manifest.json').read_text());compile=json.loads((evidence_dir/'compile.json').read_text());coq=json.loads((evidence_dir/'coq_stdout.json').read_text())
 assert compile['status']==coq['status']=='passed'
 for f in compile['files']:
  assert hashlib.sha256((repo/f['exported_path']).read_bytes()).hexdigest()==f['exported_sha256'],f['exported_path']
 assert not any(p.startswith(('QCIPLib/','SeparationLogic/examples/OUTPUT/')) for p in coq['dependency_order']), 'Export resolved a QCIP case/library instead of branch files'
 assert subprocess.check_output(['git','-C',str(ROOT/'crtosverify'),'rev-parse','master'],text=True).strip()==state['protected_master_commit']
 manuals=[];auto_count=0;libs={repo/('lib/sll.v' if kind=='single' else 'lib/xizi_double_link_lib.v')}
 for c in manifest['cases']:
  case=c['case'];p=repo/f'VC/code_proof/xizi/{case}/{case}_proof_manual.v';blocks=parse_manual_file(p.read_text())[1]
  assert not controller._manual_structure_findings(p,[b['name'] for b in blocks]),case
  assert not controller._forbidden_findings(ROOT,[p]),case
  c['manual_witnesses']=len(blocks);manuals.append(p)
  auto_count+=len(re.findall(r'\bAdmitted\s*\.',(p.parent/(case+'_proof_auto.v')).read_text()))
  lib=repo/'lib'/(case+'_lib.v')
  if lib.exists():libs.add(lib)
 for p in libs:
  assert not controller._case_lib_findings(p,'CRTOS_Verify.VC.code'),p
  assert not controller._forbidden_findings(ROOT,[p]),p
 if kind=='double':
  assert not (repo/'lib/dll_master.v').exists()
  assert (repo/'lib/idnode.v').read_bytes()==subprocess.check_output(['git','-C',str(repo),'show','HEAD:lib/idnode.v'])
  assert 'Import DLL.' in (repo/'lib/idnode.v').read_text()
  assert 'Module DLL := xizi_double_link_lib.DLL.' in (repo/'lib/dll.v').read_text()
 manifest.update(kind=kind,status='verified',public_namespace='DLL' if kind=='double' else 'Existing xizi_sll_payload/generic_sll API',generated_auto_admitted=auto_count,maintained_manual_and_libraries_strict_check='passed',coq_validation={'status':'passed','scope':'Selected linked-list cases plus this branch idnode library','transport':'Require paths only are mirrored bijectively to QCIPCases.exported for QCIP fixed coq_tooling; this is not a raw native CRTOS_Verify invocation.','coq_version':coq['coq_version'],'fixed_flags_hash':coq['fixed_flags_hash'],'dependency_count':len(coq['dependency_order']),'no_local_qcip_case_or_link_library_dependency':True},manual_witnesses=sum(c['manual_witnesses'] for c in manifest['cases']))
 verify=repo/'verification';verify.mkdir(exist_ok=True)
 (verify/'link_specs.json').write_text(json.dumps(manifest,ensure_ascii=False,indent=2)+'\n')
 shutil.copy2(REPORT/'check_link_specs.py',verify/'check_link_specs.py')
 evidence=verify/'link_specs_evidence';evidence.mkdir(exist_ok=True)
 for file in ['compile.json','coq_stdout.json','coq_stderr.txt']:shutil.copy2(evidence_dir/file,evidence/file)
 for c in manifest['cases']:shutil.copy2(r/(c['case']+'_symexec.json'),evidence/(c['case']+'_symexec.json'))
 text=f'''# 本分支链表规约同步

本次只同步 `{state[kind]['branch']}`，不修改或推送 `master`。共 {len(manifest['cases'])} 个原 C 函数，{manifest['manual_witnesses']} 个手动证明义务。

规约库、C annotation 和手动证明来自 QCIP 已验收版本；导出只调整 Coq 导入路径及 C 头文件路径。目标目录下的 VC 由实际 symbolic execution 重新生成，并与已验收 VC 做导入路径归一化比对。C 算法、数据和资源保证保持不变。

'''
 if kind=='double':text+='调用方统一使用 `DLL`，采用 `SysDoubleLinklistNode` 实际布局。`lib/dll.v` 导出同一份 `lib/xizi_double_link_lib.v` 中的 `DLL`，节点类型相同。不新增 `dll_master.v`；本分支 `idnode.v` 原文不变并继续 `Import DLL`。Makefile 的活动验证范围是指定的 8 个函数；既有 `_rec` 用例保留为历史文件，不列入本次迁移结论。\n\n'
 else:text+='公共库 `lib/sll.v` 提供含 `storeA` 的通用单链表模型以及 `xizi_sll_payload` 接口，保留地址模型兼容定义。Makefile 包含指定的 9 个原函数。\n\n'
 text+=f'''验证通过：canonical symexec、VC 对比、手动证明/维护库结构与禁用项检查、固定 Coq 编译。固定工具只支持 QCIP 命名映射，因此编译时对本分支源码建立仅替换 Require 路径的临时镜像；没有借用 QCIP 原用例或链表库。完整命令、输出和源文件哈希见 `link_specs_evidence/`。

生成 auto 文件保留 {auto_count} 个原有 `Admitted`；维护库和手动证明没有新增 `Admitted` 或 `Axiom`。原仓库依赖的假设不在本次消除范围。

复现（将路径替换为具备相同工具链的 QCIP 工作区）：

```bash
python3 -B verification/check_link_specs.py --qcip-root /path/to/QCIP
```

该脚本在 QCIP 的 OUTPUT 下保存新日志，在临时目录中重生成 VC 和编译，结束时清理构建目录；不会覆盖本分支源码或证明。`link_specs.json` 记录来源和验收范围。生成器及继承证明的原有行尾空格保持不变，没有手改生成 VC 来消除格式提示。
'''
 (verify/'README.md').write_text(text)
 p=repo/'README.md';text=p.read_text();marker='## 最新链表规约\n'
 if marker not in text:text+='\n'+marker+'\n本分支已同步含 storeA 的链表规约及配套证明。范围、兼容性、验证边界和复现命令见 [verification/README.md](verification/README.md)。\n'
 p.write_text(text)
 (r/'delivery.json').write_text(json.dumps({'status':'ready_to_commit','branch':state[kind]['branch'],'cases':len(manifest['cases']),'manual_witnesses':manifest['manual_witnesses'],'master_unchanged':True},indent=2)+'\n')
 print(kind,'ready',manifest['manual_witnesses'])
if __name__=='__main__':main(sys.argv[1])
