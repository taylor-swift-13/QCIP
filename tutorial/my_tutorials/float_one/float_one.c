/* float_one: 测试 QCP 是否能处理返回 double 常数的函数。 */

/*@ Import Coq Require Import MyTutorial.float_one_lib */
/*@ Extern Coq (returnOnePost : fp64 -> Prop) */

double return_one(void)
/*@ Require emp
    Ensure returnOnePost(__return)
*/
{
    return 1.0;
}
