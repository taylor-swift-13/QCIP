#!/usr/bin/env python3
"""Describe textual reuse after all current DLL runs have been accepted."""
import hashlib
import json
from pathlib import Path
import sys

ROOT = Path.cwd().resolve()
REF = Path(__file__).resolve().parent
sys.path.insert(0, str(ROOT / '.agents/skills/vc-proving/scripts'))
from manual_goal_utils import parse_manual_file, lemma_proof_script, normalize_rocq_text


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main():
    inventory = json.loads((REF / 'migration_inventory.json').read_text())
    cases = []
    for entry in inventory['case_inventory']:
        assert entry['migration_status'] == 'passed', entry['case']
        case = entry['case']
        manual = Path(f'SeparationLogic/examples/OUTPUT/xizi/{case}/source/{case}_proof_manual.v')
        old = REF / 'input_snapshots/workspace' / manual
        new = ROOT / manual
        _, before = parse_manual_file(old.read_text())
        _, after = parse_manual_file(new.read_text())
        before = {block['name']: block for block in before}
        comparison = []
        for block in after:
            previous = before.get(block['name'])
            comparison.append(dict(
                witness=block['name'],
                proof_script_same_normalized=(previous is not None and
                    normalize_rocq_text(lemma_proof_script(previous)) ==
                    normalize_rocq_text(lemma_proof_script(block)))))
        c = Path(f'OUTPUT/xizi/{case}/source/{case}.c')
        assert (ROOT / c).read_bytes() == (REF / 'input_snapshots/workspace' / c).read_bytes(), case
        cases.append(dict(case=case, c_and_annotation_byte_identical=True,
                          previous_manual_sha256=sha(old), current_manual_sha256=sha(new),
                          witnesses=comparison))
    result = dict(schema_version='qcp-crules-proof-reuse/v1', status='passed', cases=cases,
                  note='Comments and trailing whitespace are normalized using repository tooling. Textual reuse description only. Current proof validity comes from controller final-check and suite compilation.',
                  total_witnesses=sum(len(c['witnesses']) for c in cases),
                  reused_scripts=sum(w['proof_script_same_normalized'] for c in cases for w in c['witnesses']))
    (REF / 'proof_reuse_audit.json').write_text(json.dumps(result, ensure_ascii=False, indent=2) + '\n')
    print(json.dumps({k:v for k,v in result.items() if k != 'cases'}))


if __name__ == '__main__':
    main()
