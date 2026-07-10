/*@ Import Coq Require Import MyTutorial.float_clamp_lib */
/*@ Extern Coq (clampFloatSafe : fp32 -> fp32 -> fp32 -> Prop) */
/*@ Extern Coq (clampFloatPost : fp32 -> fp32 -> fp32 -> fp32 -> Prop) */
/*@ Extern Coq (clampSafe : fp64 -> fp64 -> fp64 -> Prop) */
/*@ Extern Coq (clampPost : fp64 -> fp64 -> fp64 -> fp64 -> Prop) */

float float_clamp(float x, float lo, float hi)
/*@ Require clampFloatSafe(x, lo, hi)
    Ensure clampFloatPost(x, lo, hi, __return)
*/
{
    if (x < lo) {
        return lo;
    }
    if (x > hi) {
        return hi;
    }
    return x;
}

double double_clamp(double x, double lo, double hi)
/*@ Require clampSafe(x, lo, hi)
    Ensure clampPost(x, lo, hi, __return)
*/
{
    if (x < lo) {
        return lo;
    }
    if (x > hi) {
        return hi;
    }
    return x;
}
