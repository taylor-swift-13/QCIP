# IP_STSTransDataSave Case Brief - Byte Copy Continuation

- target_input: `INPUT/IP/STSTransDataSave/IP_STSTransDataSave.c`
- active_c: `QCP_examples/LLM_bench/Engineering/STSTransDataSave/IP_STSTransDataSave.c`
- common_case_formal_lib: `SeparationLogic/examples/LLM_bench/Engineering/STSTransDataSave/IP_STSTransDataSave_lib.v`
- output_dir: `OUTPUT/IP/STSTransDataSave/`
- proof_mode: direct proof
- current_state: prior baseline proves only `sSTSTran.ptr` conditional update; byte-level SRAM copy semantics are incomplete.
- reentry_reason: strengthen annotation/spec from ptr-only postcondition to model `Memcpyx` copy from `sSTSTran.dataBuf[0..247]` into SRAM packet window at `SRAM_BASE + STS_PK_UP + old_ptr`.
- lib_frozen_prefix_status: stale for this continuation; must be refreshed after annotation checking passes.
