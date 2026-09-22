# DLL 公共入口（已验收）

本次已完成以下接口迁移；各函数的最终采用记录见 migration_inventory.json 和 controller 报告。

| 入口 | 字段结构名 | 用途 |
| --- | --- | --- |
| `DLL` | `SysDoubleLinklistNode` | 对齐 `origin/idnode`，供本地 8 个函数直接使用 |
| `MasterDLL` | `DoubleLinklistType` | 保留 master 原库的字段地址表达式 |
| `XiziLocalDLL`、`XiziIdmanagerDLL` | 与 `DLL` 相同 | 旧名称的透明别名 |

这些入口共用 `CRules`、`DLLNode` 记录和 `CanonicalDLL` 中同一份谓词及证明。`DL_Node`、构造器、投影、五个公共谓词、引理名及参数接口保持兼容；公共谓词不增加 guards 或假设。结构名参与字段地址表达式，因此 master 布局单独保留，并非直接替换字符串。

8 个函数的 C annotation 使用 `DLL::store_dll` 等名称；Rocq 辅助引理和证明使用 `DLL.store_dll` 等名称。逻辑数据、顺序和资源转移承诺不变，删除后仍提供以被删节点为哨兵的空环以及该节点的数据资源。

原 origin/idnode 兼容入口包含本地全限定 DLL；master 兼容入口导出 MasterDLL。sizeof 展开控制与原 nonzero 假设仍在库侧兼容 fixture 单列。原证明正文仅调整 imports，不改证明语句。实际编译与哈希比对是验收依据。

当前主库的原证明导入编译已通过：见 `compatibility_checks/local/manifest.json`。完整源文件与兼容入口保存在 `compatibility_source_archive/`，实际命令和完整 Coq 输出保存在 `compatibility_checks/local/`。8 个本地函数的逐项最终检查及 17 函数统一回归也已通过，218 项原兼容编译依赖与最终版本一致。
