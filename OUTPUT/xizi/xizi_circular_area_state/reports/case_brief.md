## Case Brief

- case_name: xizi_circular_area_state
- c_path: OUTPUT/xizi/xizi_circular_area_state/source/xizi_circular_area_state.c
- target_function: xizi_circular_area_state
- proof_type: direct-proof
- output_path: QCIPCases/xizi/xizi_circular_area_state
- reference_cases: /home/yangfp/CAV/OS/CAV-bench/experiences/end-end/xizi_circular_area_state
- style_reference_cases: QCP_examples/QCP_demos_LLM array strategies; existing QCIP xizi cases
- annotation_style: predicate-first
- anti_patterns: 不在 Rocq 中重写 circular_area.c 算法本体；INPUT 不写规格；OUTPUT 才写 annotation。
- lib_frozen_prefix_end_line: 27
- lib_frozen_prefix_snapshot: QCIPLib/xizi/xizi_circular_area_common/xizi_circular_area_lib.v at 2026-07-02T22:56:58+08:00
- annotation_spec_definitions_status: integrated-and-refrozen
- proof_manual_scope: witness-proofs-after-lib-migration
- current_phase: final-check
- main_state_files: OUTPUT/xizi/xizi_circular_area_state/source/xizi_circular_area_state.c; QCIPCases/xizi/xizi_circular_area_state/xizi_circular_area_state_*.v; QCIPLib/xizi/xizi_circular_area_common/xizi_circular_area_lib.v
- persistent_report_dir: OUTPUT/xizi/xizi_circular_area_state/reports
- report_layout: run-root-snapshots-plus-round-dirs
- latest_round_report_dir: OUTPUT/xizi/xizi_circular_area_state/reports
