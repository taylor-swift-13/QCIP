## Case Brief

- case_name: IP_STSUseFlag
- c_path: QCP_examples/LLM_bench/Engineering/STSUseFlag/IP_STSUseFlag.c
- target_function: STSUseFlag
- proof_type: direct-proof
- output_path: SeparationLogic/examples/LLM_bench/Engineering/STSUseFlag
- reference_cases: QCP_examples/QCP_demos_LLM/sum.c; QCP_examples/QCP_demos_LLM/majorityElement.c
- style_reference_cases: positive: QCP_examples/QCP_demos_LLM/majorityElement.c; negative: .agents/skills/annotation-filling/docs/incorrect-examples/max_sub_array.c
- annotation_style: predicate-first
- anti_patterns: do not mirror the C branch tree as a Rocq algorithm; use a compact mathematical post-state relation for updated fields.
- lib_frozen_prefix_end_line: 45
- lib_frozen_prefix_snapshot: input_snapshots/IP_STSUseFlag_lib.frozen-prefix.v
- annotation_spec_definitions_status: integrated-and-refrozen
- proof_manual_scope: witness-proofs-after-lib-migration
- current_phase: done
- main_state_files: QCP_examples/LLM_bench/Engineering/STSUseFlag/IP_STSUseFlag.c; SeparationLogic/examples/LLM_bench/Engineering/STSUseFlag/IP_STSUseFlag_goal.v; SeparationLogic/examples/LLM_bench/Engineering/STSUseFlag/IP_STSUseFlag_proof_auto.v; SeparationLogic/examples/LLM_bench/Engineering/STSUseFlag/IP_STSUseFlag_proof_manual.v; SeparationLogic/examples/LLM_bench/Engineering/STSUseFlag/IP_STSUseFlag_goal_check.v; SeparationLogic/examples/LLM_bench/Engineering/STSUseFlag/IP_STSUseFlag_lib.v
- persistent_report_dir: .agents/reports/QCP_examples/LLM_bench/Engineering/STSUseFlag/2026-07-02/IP_STSUseFlag-20260702T033348
- report_layout: run-root-snapshots-plus-round-dirs
- latest_round_report_dir: .agents/reports/QCP_examples/LLM_bench/Engineering/STSUseFlag/2026-07-02/IP_STSUseFlag-20260702T033348/20260702T035300-vc-proving-r1
