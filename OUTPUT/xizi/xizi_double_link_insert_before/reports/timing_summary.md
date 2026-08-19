# Timing Summary

Controller-recorded run wall time: 15,528.830 seconds (about 4 h 18 min 49 s), from 2026-08-17 11:01:45Z through final-check at 15:20:33Z. Raw timing evidence is `controller/timing_summary.json`.

Repeated phase totals were: intake 11.266 s; annotation 1,263.819 s; VC checking 1,334.570 s; VC proving 12,517.226 s; final-check 401.949 s. These totals include retries and therefore are not intended to sum to wall time.

Long rounds over 600 seconds:

- annotation r1: 710.625 s
- proving r1: 1,263.410 s
- proving r2: 9,817.063 s
- proving r3: 643.708 s

The first lineage exposed an incomplete/stale target-witness set. A later final-check also rejected two forbidden `derivable1_refl` uses; r3 replaced them with structural entailment and passed. Human activity and idle wait time are not separately instrumented, so those categories remain unknown rather than being estimated.
