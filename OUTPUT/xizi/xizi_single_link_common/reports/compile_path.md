# 编译路径记录

- repository: `/home/yangfp/QCIP`
- formal source:
  - `QCIPLib/xizi/xizi_single_link_common/xizi_single_link_lib.v`
- logical path:
  - `QCIPLib.xizi.xizi_single_link_common.xizi_single_link_lib`
- path rule: `_CoqProject` uses `-R QCIPLib QCIPLib`
- CAV / crtos role: definition reference only; no external compile path is used
- compile status: passed
- module organization: one public lib containing generic predicates, `SLLLib` functor,
  concrete XiZi layout and all existing `xizi_*` aliases/lemmas
- crtos layout: `SLL_LAYOUT` has only `struct_name` and `next_field`; no `node_data` extension is exported
- compatibility: all 9 existing single-link `*_goal_check.v` files passed without
  changing any generated or manual proof file
- fixed flags hash: `b6e5573415735fec9159c1cc3ce8cb8fe6f8818e85a322d61c1317cdf0617564`

```sh
python3 .agents/skills/vc-proving/scripts/coq_tooling.py check \
  --workspace-root /home/yangfp/QCIP \
  --build-workspace <isolated-build-workspace> \
  --target-file QCIPLib/xizi/xizi_single_link_common/xizi_single_link_lib.v \
  --target-kind case_lib \
  --source-goal-version <current-version>
```
