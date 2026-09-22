# Final Check Checklist

- [x] Controller accepted annotation round r1.
- [x] Canonical symbolic execution reached the C file end with required `-I` and `-slp` arguments.
- [x] Controller accepted vc-checking round r2 and exact 5-witness group coverage.
- [x] Final proving group solved all 5 assigned witnesses.
- [x] Parent full fixed Coq check passed.
- [x] Final candidate was applied only from the controller-accepted candidate.
- [x] Final fixed `coq_tooling.py check --target-kind check` passed.
- [x] Isolated final symexec replay matched goal/auto bytes and manual statement hashes.
- [x] Formal manual contains only expected witness proofs.
- [x] Case-lib frozen prefix is unchanged; no proving suffix/helper/import was added.
- [x] Manual and case-lib contain no `Admitted.` or extra `Axiom`.
- [x] Complete 23-name forbidden lemma scan has zero hits.
- [x] Formal directory cleanup scan passed.
- [x] OUTPUT source/Rocq/report snapshots were synchronized and compared.
- [x] Current-run worktrees and build/cache artifacts were cleaned after report preservation.

First final-check attempt: blocked on forbidden lemmas and rolled back.

Final final-check attempt: passed with no blockers.
