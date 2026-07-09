# Final Check Report

## Reverification Commands

- gcc syntax check on formal C annotation source
- symexec freshness regeneration into `.tmp/final_audit/IP_STSTransDataSave`
- coqc dependency chain through `IP_STSTransDataSave_goal_check.v`
- lib/manual `Admitted` / `Abort` / `Axiom` / forbidden lemma scans
- OUTPUT archive byte-for-byte comparison against formal source/Rocq files

--- gcc syntax check ---
QCP_examples/LLM_bench/Engineering/STSTransDataSave/IP_STSTransDataSave.c: In function 'STSTransDataSave':
QCP_examples/LLM_bench/Engineering/STSTransDataSave/IP_STSTransDataSave.c:42:17: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
   42 |         Memcpyx((unint08*)pDst, &(sSTSTran.dataBuf[0]), 248) /*@ where bytes = data_head, old_dst = old_dst */;
      |                 ^
--- symexec freshness ---
Start to symbolic execution on program : QCP_examples/LLM_bench/Engineering/STSTransDataSave/IP_STSTransDataSave.c
Start to parse strategies file char_array
File Path: /home/coq/qcp/QCP_examples/QCP_demos_LLM/char_array.strategies
Finish parsing strategies file char_array
Start to parse function declaration of function Memcpyx
Symbolic Execution into function STSTransDataSave
End of symbolic execution of function STSTransDataSave
Successfully finished symbolic execution
symexec freshness cmp: goal and proof_auto match current formal generated files
--- coqc compile chain ---
coqc compile chain: passed
--- scans ---
lib/manual placeholder scan: clean
forbidden lemma scan: clean
--- phase report archive ---
OUTPUT/IP/STSTransDataSave/reports/phase_reports/annotation-r5/annotation_checking_report_passed.md
OUTPUT/IP/STSTransDataSave/reports/phase_reports/annotation-r5/subagent_return_report_r5.md
--- archive consistency and manifest ---
archive cmp: passed
710a8dcd4a4d1769c72f77985ad994b956189f24764ea1c302f0769c885b5748  OUTPUT/IP/STSTransDataSave/README.md
24e73603294cb8dc0b10bff251631c4e32bf2e341d38512c9c5f46d9d9ebc05d  OUTPUT/IP/STSTransDataSave/reports/archive_manifest.sha256
f40c5b5e0291c619dede7db5102167a54f8003a92978668732c34d4121485838  OUTPUT/IP/STSTransDataSave/reports/case_brief.md
2f5e59be2f0107e54bca068d86501c005c02a2f76111d72638a2401542591edb  OUTPUT/IP/STSTransDataSave/reports/final_check_report.md
c96c8e697661ba78d9b4f7f200426b571b6fe993ca245fb5705d946dc432c4c2  OUTPUT/IP/STSTransDataSave/reports/final_checklist.md
a280a507824da502e3c54b62aa0d91425389515c414ab2810e78cd5a6da1d072  OUTPUT/IP/STSTransDataSave/reports/generated_snapshots/IP_STSTransDataSave.active.c
6900e239ab7e2506b7c6beabe3a7af34f4dca9ec44c4d59223388790e23964d0  OUTPUT/IP/STSTransDataSave/reports/input_snapshots/IP_STSTransDataSave.input.c
1aa6c916d439e38ba0167d94802e6310a52395aef27bd9a0126e26f51936d5d2  OUTPUT/IP/STSTransDataSave/reports/phase_reports/annotation-r5/annotation_checking_report_passed.md
43b15eafb13f627ffb1672dd19a714175c97adf430836395df722b0c8f12c6d1  OUTPUT/IP/STSTransDataSave/reports/phase_reports/annotation-r5/subagent_return_report_r5.md
f5c5ee6ea27eec527741b4ca48c56385e51c522389c1581969d06407fd4bff10  OUTPUT/IP/STSTransDataSave/reports/timing_summary.md
a8bb7782ad3257eb44204b984c16e3a70e9e6f79ac76979342fafcd40d8d4087  OUTPUT/IP/STSTransDataSave/reports/witness_ledger.md
b3a30a25e4d8c3190613cc2686143daba493e886d871619858f3f1088543c4a5  OUTPUT/IP/STSTransDataSave/rocq/IP_STSTransDataSave_goal.v
4b13ebc0402df3a90fd6de75ab22fee0134afbbdfc4b8af2ca9ddbe5669283f9  OUTPUT/IP/STSTransDataSave/rocq/IP_STSTransDataSave_goal_check.v
599b97e58a0b108b05121ec35cb1b03bbfbf181e7e2301f0a5de75f9a0850898  OUTPUT/IP/STSTransDataSave/rocq/IP_STSTransDataSave_lib.v
5b803606797ae23ffc2445aaf8cc8bb8db427763b15515149ff1c6d35ad7a114  OUTPUT/IP/STSTransDataSave/rocq/IP_STSTransDataSave_proof_auto.v
ab88f63436bc42eda6cd6daa012d1adb3acdfeed48c58f528856c3452a4792da  OUTPUT/IP/STSTransDataSave/rocq/IP_STSTransDataSave_proof_manual.v
a280a507824da502e3c54b62aa0d91425389515c414ab2810e78cd5a6da1d072  OUTPUT/IP/STSTransDataSave/source/IP_STSTransDataSave.c
4bdd1afe941f8307d7d0da314fb79c280dc49865b836635d48ce90c2901ea795  OUTPUT/IP/STSTransDataSave/source/IP_STSTransDataSave.h
d318af6c911b0d29315719e974c592c2af3c3e8a9e2cb9af743974637ebd798b  OUTPUT/IP/STSTransDataSave/source/common.h
