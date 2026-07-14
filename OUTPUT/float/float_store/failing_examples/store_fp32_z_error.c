/*
 * Intentionally invalid QCP annotation.
 * The generic annotation-level store currently expects a Z-valued payload,
 * while x has type fp32.
 */
void write_float_bad(float *p, float x)
/*@ Require undef_data_at(p)
    Ensure  store(p, x)
*/
{
    *p = x;
}
