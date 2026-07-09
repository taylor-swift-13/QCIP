# Final Check Checklist

- [x] Annotation candidate r5 passed annotation-checking quality gate.
- [x] Formal C and common case lib integrated from r5 single segmented spec.
- [x] Symexec reached end of `STSTransDataSave` and temp regeneration matches current `goal` / `proof_auto`.
- [x] `IP_STSTransDataSave_lib.v`, `_goal.v`, `_proof_auto.v`, `_proof_manual.v`, `_goal_check.v` compile in dependency order.
- [x] `IP_STSTransDataSave_proof_manual.v` contains only witness proofs.
- [x] `IP_STSTransDataSave_lib.v` / `_proof_manual.v` contain no `Admitted`, `Abort`, or extra `Axiom`.
- [x] Forbidden lemma scan passed for lib/manual.
- [x] OUTPUT archive updated with source, Rocq files, reports, and snapshots.
- [x] Current-case `.tmp` scratch and Coq cache files cleaned after archive consistency check.
- [x] Current continuation re-ran gcc syntax check, symexec freshness, full coqc chain, scans, and archive manifest generation.
- [x] r5 annotation phase reports copied into OUTPUT reports/phase_reports/annotation-r5.
