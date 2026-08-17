---
name: floattest-iplib-testing
description: Build, extend, reproduce, or audit deterministic FloatTest differential tests for C cases under INPUT/iplib, with executable Rocq bit-pattern specifications and evidence archived under OUTPUT/iplib. Use when asked to find untested iplib programs, add FloatTest coverage, rerun an iplib floating-point case, validate existing FloatTest artifacts, or summarize remaining INPUT/OUTPUT coverage.
---

# FloatTest iplib Testing

Create reproducible, scope-honest differential tests without modifying the input snapshot. Treat `OUTPUT/iplib/<case>` as the authoritative indication that a case has a test delivery; do not infer completion from legacy `FloatTest/cases` content.

This workflow is separate from C annotation and symbolic-execution verification. Do not invoke `verification-entry` or its phase skills unless the user separately requests QCP/Rocq program verification.

## 1. Inspect the repository

Run the inventory helper from the repository root:

```sh
python3 .agents/skills/floattest-iplib-testing/scripts/audit_iplib.py
```

Then read:

- `FloatTest/README.md`
- `FloatTest/tools/run_tests.sh`
- `FloatTest/tools/emit_tests.py`
- the target `INPUT/iplib/<case>/source/`
- one structurally similar completed `OUTPUT/iplib/<case>/`

Preserve unrelated dirty-worktree changes. Never use `QCP_demos_human` as a reference.

## 2. Freeze an honest test boundary

Identify the exact original functions and outputs to test before writing the model. Prefer directly compiling the original C translation unit. If broken headers or unavailable components prevent this, use one of these explicit boundaries:

1. Inject missing declarations with a case-local `*_decls.h` and `*_cflags.txt`.
2. Link deterministic shared implementations already under `FloatTest/ref/` through `*_extra_srcs.txt`.
3. Mechanically extract the original target function into a case-local source file and retain source provenance.
4. Use observable stubs for unavailable callees; include call counts, dispatch tags, pointer identity, or forwarded arguments in the compared output.
5. Use a minimal clean wrapper only when the upstream header cannot compile.

Do not edit `INPUT/iplib`. Document every stub, reconstructed helper, restricted input domain, excluded branch, and source defect in the case README. Never describe finite sampled coverage as a proof of the entire component.

## 3. Create the case layout

Create only the files needed under:

```text
OUTPUT/iplib/<case>/
├── README.md
├── source/
│   ├── <case>_main.c
│   ├── <case>_cflags.txt       # optional
│   ├── <case>_extra_srcs.txt   # optional
│   ├── <case>_ip_source.txt    # optional
│   └── <case>_coq_deps.txt     # optional
├── rocq/
│   ├── spec.v
│   └── tests.v                 # generated
└── reports/
    ├── vectors.txt             # generated
    ├── coqc_check_evidence.json
    ├── vector_freshness.json
    ├── timing_summary.json
    └── final_checklist.md
```

Add a case emitter and explicit function name to `FloatTest/tools/emit_tests.py`. Keep vector columns fixed-width and assert the exact column count in the emitter.

## 4. Design vectors and the executable spec

Print floating-point values as unsigned IEEE-754 bit patterns using `memcpy`; never compare formatted decimal strings. Mirror the C evaluation order, intermediate precision, casts, and strict/non-strict comparisons in `rocq/spec.v`.

Use a fixed nonzero seed. Generate both:

- directed vectors for branch boundaries, exact thresholds, zero signs, ties, dispatch cases, and known regressions;
- normally at least 1000 deterministic random vectors within the documented defined domain.

Avoid host `libm` as an unstated oracle for bit-exact transcendental results. Reuse the repository's deterministic ported trig/sqrt helpers and Rocq models when applicable. Model binary64/binary32 conversions explicitly.

Every generated `tests.v` must contain one `vm_compute; reflexivity` theorem per vector plus a negative-control theorem with one deliberately changed expected output and `discriminate`.

## 5. Run the canonical test

From the repository root run:

```sh
bash FloatTest/tools/run_tests.sh <case> 1000 <fixed-seed>
```

Accept the batch only when the command finishes successfully and `reports/coqc_check_evidence.json` records:

- `status: passed`
- `returncode: 0`
- the current `source_goal_version`
- the fixed `coq_tooling.py check` argv

Use `coq_tooling.py` only through `run_tests.sh`; do not handwrite Coq flags, call Dune, or use Rocq MCP.

## 6. Prove vector freshness

Compile the same driver and original/wrapper sources into a fresh temporary executable outside the archived case. Run it with the recorded count and seed, write to a fresh temporary vector file, and compare it byte-for-byte with `reports/vectors.txt` using `cmp`.

Record count, width, seed, SHA-256, and the fresh comparison in `vector_freshness.json`. Remove only the temporary files created by this run.

## 7. Final audit

Run:

```sh
python3 .agents/skills/floattest-iplib-testing/scripts/audit_iplib.py --case <case> --require-evidence
git diff --check -- OUTPUT/iplib/<case> FloatTest
```

Confirm:

- vector count and width match freshness metadata;
- generated positive theorem count matches vector count;
- a negative control exists;
- `spec.v` and `tests.v` contain no `Admitted` or `Axiom`;
- the checklist has no unchecked item;
- the README reports results, reproduction command, boundaries, and the finite-sampling limitation;
- no `.vo`, `.vos`, `.vok`, `.glob`, `.aux`, executable, or temporary build artifact remains in the delivery.

Update `FloatTest/README.md` with the new result and recompute the `INPUT/iplib` versus `OUTPUT/iplib` difference. Report directory coverage separately from function-level exclusions.
