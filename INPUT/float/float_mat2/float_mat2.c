typedef struct FloatVec2 {
    float x;
    float y;
} FloatVec2;

typedef struct FloatMat2 {
    float m00;
    float m01;
    float m10;
    float m11;
} FloatMat2;

FloatVec2 float_mat2_apply(FloatMat2 m, FloatVec2 v)
{
    FloatVec2 out;

    out.x = m.m00 * v.x + m.m01 * v.y;
    out.y = m.m10 * v.x + m.m11 * v.y;

    return out;
}
