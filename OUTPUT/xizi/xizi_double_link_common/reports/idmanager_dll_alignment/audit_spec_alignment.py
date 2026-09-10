#!/usr/bin/env python3
"""Read-only checks for exact canonical definitions and migration coverage."""
import argparse,json,re,hashlib,subprocess
from pathlib import Path
from datetime import datetime,timezone
parser=argparse.ArgumentParser(); parser.add_argument('--workspace-root',type=Path,default=Path.cwd()); parser.add_argument('--definitions-only',action='store_true'); args=parser.parse_args()
root=args.workspace_root.resolve(); reference=Path(__file__).resolve().parent
lib=root/'QCIPLib/xizi/xizi_double_link_common/xizi_double_link_lib.v'
source=lib.read_text(); ref=(reference/'dll.v').read_text()
checks=[]
if 'Module DLL.' not in source:
    raise SystemExit('Canonical DLL is not yet adopted')
canonical=source.split('Module DLL.',1)[1].split('End DLL.',1)[0]
def extract(text,kind,name):
    match=re.search(r'(?m)^'+kind+' '+name+r'\b',text)
    if not match:return ''
    end=re.search(r'(?m)^(?:Definition|Fixpoint|Record|Arguments|Notation|Theorem|Lemma|End)\b',text[match.end():])
    return text[match.start():match.end()+end.start()] if end else text[match.start():]
def norm(text):
    return re.sub(r'\s+','',re.sub(r'\(\*[\s\S]*?\*\)','',text))
for kind,name in [('Record','DL_Node')]+[('Definition',name) for name in ['dllseg','dllseg_shift','dllseg_shift_rev','store_dll','occupy_dll_node']]:
    left=extract(ref,kind,name); right=extract(canonical,kind,name)
    checks.append({'definition':name,'reference_match':bool(left and right) and norm(left)==norm(right)})
for kind,name in re.findall(r'(?m)^(Lemma|Theorem) (\w+)\b', ref):
    left=extract(ref,kind,name).split('Proof.')[0]; right=extract(canonical,kind,name).split('Proof.')[0]
    checks.append({'lemma_interface':name,'reference_match':bool(left and right) and norm(left)==norm(right)})
for kind in ['Arguments','Notation']:
    declarations=re.findall(r'(?m)^'+kind+r'[^\n]*',ref)
    for declaration in declarations:
        checks.append({'interface_declaration':declaration,'reference_match':norm(declaration) in norm(canonical)})
local=source.split('Module XiziLocalDLL.',1)[1].split('End XiziLocalDLL.',1)[0] if 'Module XiziLocalDLL.' in source else ''
checks.append({'shared_record_static_check':'local instance has no independent Record DL_Node','reference_match':bool(local) and not re.search(r'\bRecord\s+DL_Node\b',local)})
for name in ['dllseg','dllseg_shift','dllseg_shift_rev','store_dll','occupy_dll_node']:
    left=extract(ref,'Definition',name); right=extract(local,'Definition',name)
    checks.append({'local_layout_definition':name,'reference_match':bool(left and right) and norm(left)==norm(right.replace('SysDoubleLinklistNode','DoubleLinklistType'))})
idmanager=source.split('Module XiziIdmanagerDLL.',1)[1].split('End XiziIdmanagerDLL.',1)[0] if 'Module XiziIdmanagerDLL.' in source else ''
for module_name,body,rule_module in [('DLL',canonical,'CRules'),('XiziLocalDLL',local,'naive_C_Rules'),('XiziIdmanagerDLL',idmanager,'CRules')]:
    checks.append({'assertion_model_import':module_name,'expected':rule_module,'reference_match':bool(re.search(r'\bImport\s+'+rule_module+r'\s*\.',body))})
for name in ['dllseg','dllseg_shift','dllseg_shift_rev','store_dll','occupy_dll_node']:
    left=extract(ref,'Definition',name); right=extract(idmanager,'Definition',name)
    checks.append({'idmanager_layout_definition':name,'reference_match':bool(left and right) and norm(left)==norm(right.replace('SysDoubleLinklistNode','DoubleLinklistType'))})
for kind,name in re.findall(r'(?m)^(Lemma|Theorem) (\w+)\b', ref):
    left=extract(ref,kind,name).split('Proof.')[0];right=extract(idmanager,kind,name).split('Proof.')[0]
    checks.append({'idmanager_lemma_interface':name,'reference_match':bool(left and right) and norm(left)==norm(right.replace('SysDoubleLinklistNode','DoubleLinklistType'))})
for kind,name in re.findall(r'(?m)^(Lemma|Theorem) (\w+)\b', ref):
    left=extract(ref,kind,name).split('Proof.')[0];right=extract(local,kind,name).split('Proof.')[0]
    checks.append({'local_lemma_interface':name,'reference_match':bool(left and right) and norm(left)==norm(right.replace('SysDoubleLinklistNode','DoubleLinklistType'))})
inv=json.loads((reference/'migration_inventory.json').read_text()); cases=[]
for item in ([] if args.definitions_only else inv['case_inventory']):
    p=root/item['c_file']; c=p.read_text(); contracts=[]
    for m in re.finditer(r'/\*@([\s\S]*?)\*/',c):
        text=m[1]
        if not(re.search(r'\bRequire\s',text) and re.search(r'\bEnsure\s',text)):continue
        old=sorted(set(re.findall(r'\b(?:XiziStoreADLL|xizi_store_dll|xizi_dll|xizi_dllseg|xizi_dll_node)\b',text)))
        contracts.append({'line':c[:m.start()].count('\n')+1,'legacy_guarded_public_predicates':old,'uses_reference_store_dll':'XiziLocalDLL::store_dll' in text,'derived_head_call_fields':item['case']=='xizi_double_link_head' and bool(re.search(r'expanded\s*<=\s*general',text)) and 'XiziLocalDLL::dllseg' in text,'generic_storeA':bool(re.search(r'With\s+\{A\}\s*\(storeA\s*:\s*Z\s*->\s*A\s*->\s*Assertion\)',text))})
    cases.append({'case':item['case'],'c_file':item['c_file'],'c_sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'contracts':contracts,'status':'passed' if contracts and all(not x['legacy_guarded_public_predicates'] and (x['uses_reference_store_dll'] or x['derived_head_call_fields']) and x['generic_storeA'] for x in contracts) else 'pending-or-failed'})
call_compatibility=[]
if not args.definitions_only:
    def empty_general(case):
        c=(root/f'OUTPUT/xizi/{case}/source/{case}.c').read_text()
        match=re.search(r'int\s+IsDoubleLinkListEmpty\s*\([^;{}]*\)\s*/\*@\s*general\b([\s\S]*?)\*/',c)
        return norm(match[1]) if match else None
    callee=empty_general('xizi_double_link_empty'); caller=empty_general('xizi_double_link_head')
    manual=(root/'SeparationLogic/examples/OUTPUT/xizi/xizi_double_link_head/source/xizi_double_link_head_proof_manual.v').read_text()
    call_compatibility.append({'call':'DoubleLinkListGetHead -> IsDoubleLinkListEmpty',
        'canonical_general_matches_verified_callee':bool(callee and caller and callee==caller),
        'expanded_derivation_witness_present':'IsDoubleLinkListEmpty_derive_expanded_by_general' in manual})
result={'schema_version':'qcp-dll-exact-spec-audit/v1','checked_at':datetime.now(timezone.utc).isoformat(),'status':'passed' if all(x['reference_match'] for x in checks) and all(c['status']=='passed' for c in cases) and all(c['canonical_general_matches_verified_callee'] and c['expanded_derivation_witness_present'] for c in call_compatibility) else 'pending-or-failed','reference_commit':subprocess.check_output(['git','-C',str(reference.parents[4]/'crtosverify'),'rev-parse','master'],text=True).strip(),'case_lib_sha256':hashlib.sha256(lib.read_bytes()).hexdigest(),'layouts':'DLL: CRules/DoubleLinklistType; XiziIdmanagerDLL: CRules/SysDoubleLinklistNode; XiziLocalDLL: naive_C_Rules/SysDoubleLinklistNode; one shared DLL.DL_Node','definitions_only':args.definitions_only,'definition_checks':checks,'cases':cases,'call_compatibility':call_compatibility,'note':'Static coverage and definition comparison only; proof acceptance remains controller-owned.'}
(reference/('spec_definition_candidate_audit.json' if args.definitions_only else 'spec_alignment_audit.json')).write_text(json.dumps(result,ensure_ascii=False,indent=2)+'\n')
print(json.dumps({'status':result['status'],'definition_checks':checks,'cases_passed':sum(c['status']=='passed' for c in cases),'case_count':len(cases)},ensure_ascii=False))
raise SystemExit(0 if result['status']=='passed' else 1)
