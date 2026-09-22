# Case Brief

- Case: `xizi_circular_area_read`
- Function: `CircularAreaRead`（含文件内调用的 Full/Empty/DataLength/DivideRdData）
- Run: `xizi_circular_area_read-20260908100001`
- Status: complete / controller `done`
- Manual witnesses: 37/37 proved
- Source version: `003eaac4e1fd7e5fd8481f9678e829313d9ea6968cb72d301739d6da9fd2843d`
- Source goal version: `e176fbd0a89351b86f945c404f1dd64e7680cbfa304e37b0ac9d714be8265fc7`
- Public resource: one `circular_area_state` through `store_circular_area`; output remains caller-owned `mixed_full`
- Implementation preservation: executable tokens match the CRTOS input baseline
- Entry snapshots: `CircularAreaReadInput` + parameter `@pre`; no `ca0/out0/requested/d0` `With`
