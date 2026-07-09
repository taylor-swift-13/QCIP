/* ============================================================
 * float_try：QCP 浮点支持的探索性示例
 * 函数：lerp_positive(a, b, t)
 *   计算 r = a + t * (b - a)，返回 r > 0.0 的判断结果（int）。
 * 关键观察：返回值不能是 double，但函数体内可以使用 double。
 * ============================================================ */

/*@ Extern Coq (lerpPositivePost : fp64 -> fp64 -> fp64 -> Z -> Prop) */

int lerp_positive(double a, double b, double t)
/*@ Require emp
    Ensure lerpPositivePost(a, b, t, __return)
*/
{
    double r = a + t * (b - a);
    return r > 0.0;
}
