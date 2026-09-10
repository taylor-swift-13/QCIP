# Verify original SingleLinkListGetTailNode

Latest user scope is exactly 8 original double_link.c functions plus 9 original single_link.c functions, using original names. This run handles only SingleLinkListGetTailNode.

Authoritative C: /home/yangfp/crtos/Ubiquitous/XiZi_IIoT_Macro/kernel/thread/single_link.c, also frozen beside this file in input_snapshots/upstream/single_link.c. The old local tail case uses a different algorithm (current initialized from head->next plus an empty-list branch). Replace that body with the actual source algorithm, adding annotations only:

while (linklist->node_next) linklist = linklist->node_next;
return linklist;

Keep original function signature, data/sequence meaning and general A/storeA payload preservation. Existing xizi_single_link_common and case-local spec may be reused; this is singly-linked NULL-terminated model, not canonical circular DLL. The DLL reference-alignment task does NOT require replacing singly-linked predicates by DLL predicates. Keep xizi_sll_head_payload resource and tail result for empty/nonempty lists, preserving initial head and all payloads.

Only assigned C and case-local case_lib are writable; common SLL library is read-only. Reuse old proofs/helpers as patterns but no historical compilation counts as this new body's evidence. Complete annotation design, canonical QCP interactive/symexec and annotation-checking in this attempt. If helpers are needed, prove them in the allowed case_lib. Preserve original C executable statements/control flow and original function name; do not introduce a new empty-case branch or replacement algorithm. No Admitted/Axiom/forbidden lemma. Root AGENTS.md/controller phase ownership applies; coq_tooling.py is the only Coq entry. Record actual canonical driver,cwd,-I,-slp and current source version.
