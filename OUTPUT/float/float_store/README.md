# `store_float` memory-write cases

本目录包含两个直接使用 Rocq 原生 `store_float` 谓词的最小案例。

## 1. 通过 `float *` 写入

```c
/*@ Extern Coq (store_float : Z -> fp32 -> Assertion) */

void write_float_direct(float *p, float x)
/*@ Require undef_data_at(p)
    Ensure  store_float(p, x)
*/
{
    *p = x;
}
```

前置条件拥有一块有效但未初始化的 `float` 内存；后置条件表示该内存保存
`fp32` 值 `x`。

## 2. 写入结构体的 `float` 字段

```c
typedef struct FloatRecord {
    float value;
} FloatRecord;

/*@ Extern Coq (store_float : Z -> fp32 -> Assertion) */

void write_struct_float(FloatRecord *record, float x)
/*@ Require undef_data_at(&(record->value))
    Ensure  store_float(&(record->value), x)
*/
{
    record->value = x;
}
```

QCP 将字段地址翻译为 Rocq 的结构体字段地址，并生成：

```coq
&((record) # "FloatRecord" ->ₛ "value") # Float |-> x
```

## 生成和证明结果

两个案例均成功完成 QCP symbolic execution。生成的 witness 分别要求证明：

```coq
p # Float |-> x |-- store_float p x
```

以及：

```coq
field_address # Float |-> x |-- store_float field_address x
```

它们是同一个内存谓词的两种表示，manual witness proofs 已完成，且不包含
`Admitted` 或 `Abort`。

文件布局：

- `source/store_float_direct.c`：直接指针写入。
- `source/store_float_struct.c`：结构体字段写入。
- `rocq/store_float_direct_*`：直接指针案例的 VC 和证明。
- `rocq/store_float_struct_*`：结构体案例的 VC 和证明。
- `failing_examples/store_fp32_z_error.c`：通用 `store(p,x)` 的故意失败案例。
- `reports/symexec.txt`：两个成功案例的 symbolic execution 记录。

当前 checkout 仍缺少仓库规则指定的 `coq_tooling.py`，因此尚未执行最终 Rocq
编译验收。
