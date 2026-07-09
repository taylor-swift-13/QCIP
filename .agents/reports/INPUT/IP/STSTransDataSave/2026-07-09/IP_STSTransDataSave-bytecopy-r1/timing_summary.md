# Timing Summary - IP_STSTransDataSave byte-copy continuation

- r1 annotation: blocked at `Memcpyx` precondition derivation; scratch lib `coqc` passed.
- main diagnostics: isolated accepted `Memcpyx` pointer/cast forms and found `&(sSTSTran.dataBuf[0])` source form.
- r2 annotation: scratch symexec passed for full true/false named specs; scratch lib `coqc` passed.
- gate validation: failed because `qcp-mcp` and annotation-checking pass evidence are unavailable.
- timing_gap_seconds: present; exact wall-clock ledger for subagent internals was not available.
