## Annotation Filling Analysis

- status: completed
- subagent_name: annotation-subagent
- target_scope: `QCP_examples/LLM_bench/Engineering/STSUseFlag/IP_STSUseFlag.c`, function `STSUseFlag`
- scratch_c_path: `.tmp/QCP_examples/LLM_bench/Engineering/STSUseFlag/IP_STSUseFlag__annotation_subagent_tmp.c` (removed during cleanup)
- annotation_scratch_lib_path: `.tmp/SeparationLogic/examples/LLM_bench/Engineering/STSUseFlag/IP_STSUseFlag__annotation_subagent_tmp_lib.v` (removed during cleanup)
- proof_type: direct-proof

### Summary

The candidate annotation is function-level only. `STSUseFlag` has no loops, so no `Inv Assert` was needed. The C spec captures the four relevant old field values and ensures the four post-state field values satisfy `STSUseFlagPost`.

The candidate `annotation_scratch_lib` adds a compact mathematical field relation:

- `STSUseFlagMappedStatus old_status new_status`
- `STSUseFlagPost old_data_src old_update old_status old_use_old new_data_src new_update new_status new_use_old`

The relation describes field values, not a recursive Rocq state machine. It uses finite disjunctions over the externally visible cases:

- `old_data_src <> 1`: `update` becomes `0`, status/useOld unchanged.
- `old_data_src = 1` and `old_update = 3952088175`: status maps `1 -> 6`, `2 -> 7`, `4 -> 8`, otherwise unchanged; `useOld` becomes final status.
- `old_data_src = 1`, `old_update <> 3952088175`, `old_status <> 3`: status becomes old `useOld`, `useOld` unchanged.
- `old_data_src = 1`, `old_update <> 3952088175`, `old_status = 3`: status/useOld unchanged.

### qcp-mcp Evidence

Tooling used the `linux-binary/mcp` backend directly with interactive commands through `script`, which is the same qcp-mcp backend chain. Final command shape:

```sh
printf '<symbolic>%s</symbolic>\n<end></end>\n' "$last" |
  script -qf -E never -c './linux-binary/mcp --input-file=/home/yangfp/QCIP/.tmp/QCP_examples/LLM_bench/Engineering/STSUseFlag/IP_STSUseFlag__annotation_subagent_tmp.c --no-coq-gen -IQCP_examples/LLM_bench/Engineering/STSUseFlag/ -IQCP_examples/QCP_demos_LLM/' /dev/null
```

Final qcp-mcp result:

- result: success
- file tail reached: yes
- safety_checker_wit: total 10, auto_solved 10, manual 0
- return_checker_wit: total 7, auto_solved 0, manual 7
- entailment_checker_wit / partial_solve_wit / which_implies_wit: total 0

The seven manual return witnesses correspond exactly to the postcondition branches listed above.

### Parser Adaptation

The formal seed starts with `#include "IP_STSUseFlag.h"`. qcp-mcp diagnostics showed:

- without the case header include path: `No such file IP_STSUseFlag.h in search path`
- with the case header include path: `Unrecognized character: '#'` from header guard / macro directives
- after QCP-preprocessed scratch with typedefs, structs, globals and macro-expanded constants: parser reached the function and then required a spec

I also tested replacing macro expansion with `enum { FALSE32 = 0, TRUE32 = 3952088175 };`; QCP rejected enum syntax with `bison: syntax error, unexpected PT_SEMI`.

Therefore the ready C patch includes a QCP-front-end preprocessing adaptation: inline the small header content and expand `TRUE32/FALSE32` to their numeric values. This does not change the function body semantics, but main should treat it as a source-shape adaptation required by this QCP parser.

### Candidate C Patch Snippet

```diff
-#include "IP_STSUseFlag.h"
+typedef unsigned int unint32;
+
+typedef struct TAG_BUS_STSOBJ {
+  unint32 update;
+} BUS_STSOBJ;
+
+typedef struct TAG_STS_ATT {
+  unint32 stsFlg;
+  unint32 dataSrc;
+  unint32 useOld;
+} STS_ATT;
+
+BUS_STSOBJ sBusSTSObj;
+STS_ATT sSTSAtt;
+
+/*@ Import Coq Require Import SimpleC.EE.LLM_bench.Engineering.STSUseFlag.IP_STSUseFlag_lib */
+/*@ Extern Coq (STSUseFlagPost: Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Prop) */
 
 void STSUseFlag(void)
+/*@ With (data_src update status use_old : Z)
+    Require store(&(sSTSAtt.dataSrc), data_src) *
+            store(&(sBusSTSObj.update), update) *
+            store(&(sSTSAtt.stsFlg), status) *
+            store(&(sSTSAtt.useOld), use_old)
+    Ensure exists data_src1 update1 status1 use_old1,
+      STSUseFlagPost(data_src, update, status, use_old,
+                     data_src1, update1, status1, use_old1) &&
+      store(&(sSTSAtt.dataSrc), data_src1) *
+      store(&(sBusSTSObj.update), update1) *
+      store(&(sSTSAtt.stsFlg), status1) *
+      store(&(sSTSAtt.useOld), use_old1)
+*/
 {
     if (sSTSAtt.dataSrc == 1)
     {
-        if (sBusSTSObj.update == TRUE32)
+        if (sBusSTSObj.update == 3952088175)
@@
-        sBusSTSObj.update = FALSE32;
+        sBusSTSObj.update = 0;
```

### Candidate annotation_scratch_lib Patch Snippet

```diff
+Definition STSUseFlag_TRUE32 : Z := 3952088175.
+
+Definition STSUseFlag_FALSE32 : Z := 0.
+
+Definition STSUseFlagMappedStatus (old_status new_status : Z) : Prop :=
+  (old_status = 1 /\ new_status = 6) \/
+  (old_status = 2 /\ new_status = 7) \/
+  (old_status = 4 /\ new_status = 8) \/
+  (old_status <> 1 /\
+   old_status <> 2 /\
+   old_status <> 4 /\
+   new_status = old_status).
+
+Definition STSUseFlagPost
+    (old_data_src old_update old_status old_use_old : Z)
+    (new_data_src new_update new_status new_use_old : Z) : Prop :=
+  new_data_src = old_data_src /\
+  ((old_data_src <> 1 /\
+    new_update = STSUseFlag_FALSE32 /\
+    new_status = old_status /\
+    new_use_old = old_use_old) \/
+   (old_data_src = 1 /\
+    old_update = STSUseFlag_TRUE32 /\
+    new_update = old_update /\
+    STSUseFlagMappedStatus old_status new_status /\
+    new_use_old = new_status) \/
+   (old_data_src = 1 /\
+    old_update <> STSUseFlag_TRUE32 /\
+    old_status <> 3 /\
+    new_update = old_update /\
+    new_status = old_use_old /\
+    new_use_old = old_use_old) \/
+   (old_data_src = 1 /\
+    old_update <> STSUseFlag_TRUE32 /\
+    old_status = 3 /\
+    new_update = old_update /\
+    new_status = old_status /\
+    new_use_old = old_use_old)).
```

### Risks For Later Phases

- The seven return witnesses are pure branch-postcondition goals. They should be handled in `vc-checking` / `vc-proving` after main refreshes generated files.
- If main keeps the original `#include` plus guarded/macro header shape for formal symexec, QCP is expected to fail before annotation checking. Main should either integrate the QCP-preprocessed source-shape adaptation shown here or otherwise provide a QCP-compatible header path/content.
- No loop invariant or internal assertion risk exists for this function.
