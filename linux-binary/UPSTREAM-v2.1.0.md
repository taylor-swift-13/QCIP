# QCP v2.1.0 toolchain

`upstream-v2.1.0/symexec` is the official QCP v2.1.0 Linux driver. The
top-level `symexec` and `mcp` launchers apply the narrowly scoped `NONE`
null-macro compatibility rewrite from `qcp_macro_compat.py` to a temporary
copy; the repository C source is never changed.

`upstream-v2.1.0/mcp.official` preserves the official release executable.
`upstream-v2.1.0/mcp` is rebuilt from QCP commit
`087112fb1bd744fe3bf2b9278f6fd2f738244da7` with
`patches/qcp-v2.1.0-mcp-compat.patch` applied. The patch has two MCP-only
fixes:

1. import the already parsed function parameters into an interactive
   function scope instead of redeclaring the function with zero parameters;
2. compute Fourier-Motzkin/equality-elimination linear combinations in
   `__int128` before checking the solver's 32-bit coefficient range. QCP
   v2.1.0's division-based check is invalid for negative multipliers and can
   report `mul overflow` for the concrete safe product `-2 * 0`.

SHA-256 checksums:

- official `symexec`: `07cb3ccc257f6293a3a9e7b9da933823d1cf59b7880005d82c9684ad08e1c6e4`
- official `mcp`: `a497f66076adb73514407929d3b73300258991d9da22f75339363b7899202e11`
- patched `mcp`: `3697b8c9380a3b0390a80f8aeb40aec83dd4d34f6614f751efe4cca33dc6c38c`

Regression coverage includes the LLM `simple_arith/add.c` case, circular-area
Init with the `NONE` macro, and the Read wrap-path command
`<symbolic>505</symbolic>` that previously terminated at the false overflow.
