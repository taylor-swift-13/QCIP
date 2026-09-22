# Verification Summary

- Case: `xizi_double_link_insert_before`
- Accepted run: `xizi_double_link_insert_before-20260817190000`
- Controller phase: `done`
- Source goal version: `5dfcd902197d89db68e123f0f89d2998aeb2be3792c2e0c207a64ad3cabec848`
- Target manual witnesses: 7/7 solved
- Parent full fixed check: passed
- Final fixed `goal_check.v`: passed, Coq 8.20.1, fixed flags hash `75b2bdd1edb990c20e7514694fa4303e8d948c120bc1e5ac3813d06caabc3dff`
- Manual structure, case-lib contract, forbidden-lemma scan and cleanup scan: passed

## Spec outcome

`member_case` keeps the normal-node membership premise. `sentinel_case` deliberately does not require `In(head, nodes)`, so a caller may use it when `linklist == head`, including the empty list immediately produced by `init`.

The implementation proof covers dispatch, member, sentinel, empty/nonempty and reassembly branches. The separate callpoint case `xizi_double_link_init_then_insert_before` proves that `where (sentinel_case)` is actually usable after `init`.

## Freshness note

The accepted annotation round ran canonical symbolic execution to EOF and forced generation of a fresh manual skeleton before calculating `source_goal_version`. Final-check's optional isolated refresh is recorded as `skipped` because that repository layout is not configured; freshness is instead established by the accepted canonical run plus exact generated-file and witness-statement hashes.

The authoritative evidence is under `controller_run/`.
