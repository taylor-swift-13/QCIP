# Float memory-store examples

This directory contains two minimal QCP cases that write an IEEE-754
single-precision value to memory. Both expose Rocq's existing `store_float`
predicate to the annotation frontend:

```c
/*@ Extern Coq (store_float : Z -> fp32 -> Assertion) */
```

## Direct pointer

```c
void write_float_direct(float *p, float x)
/*@ Require undef_data_at(p)
    Ensure  store_float(p, x)
*/
{
    *p = x;
}
```

The precondition owns a valid, uninitialized `float` object. The postcondition
states that it contains the exact `fp32` value `x`.

## Float field in a struct

```c
typedef struct FloatRecord {
    float value;
} FloatRecord;

void write_struct_float(FloatRecord *record, float x)
/*@ Require undef_data_at(&(record->value))
    Ensure  store_float(&(record->value), x)
*/
{
    record->value = x;
}
```

Here the owned object is the `value` field rather than the entire structure.
QCP translates its address to the Rocq field-address expression and records a
`Float` store at that address.

## Verification

Run from the repository root:

```bash
./INPUT/float/float_store/compile.sh
```

The script checks both C files and runs QCP symbolic execution for both cases.
The generated manual witness proofs contain no `Admitted` or `Abort`. Final
Rocq compilation still requires the repository-mandated `coq_tooling.py`,
which is absent from this checkout.

`store_fp32_z_error.c` is an intentionally failing comparison: generic
annotation-level `store(p, x)` currently reports that `fp32` cannot be unified
with `Z`.
