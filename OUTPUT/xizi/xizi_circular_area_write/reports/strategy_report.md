# Proof strategy

状态查询与 DivideWrData 只观察并保持统一资源；dispatch witnesses 从可写长度和 wrap 判定建立一段或两段 memcpy；memory witnesses精确拆分/合并 mixed physical array；return witnesses把具体写入折回 `ca_contents before ++ input prefix`。仅状态查询组新增一个 suffixed arithmetic helper。
