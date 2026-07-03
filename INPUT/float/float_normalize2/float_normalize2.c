typedef struct FloatVec2 {
    float x;
    float y;
} FloatVec2;

static float qcip_absf(float x)
{
    return x < 0.0f ? -x : x;
}

FloatVec2 float_normalize2_approx(FloatVec2 v, float inv_len, float epsilon)
{
    FloatVec2 out;
    float len2 = v.x * v.x + v.y * v.y;

    if (qcip_absf(len2) <= epsilon) {
        out.x = 0.0f;
        out.y = 0.0f;
        return out;
    }

    out.x = v.x * inv_len;
    out.y = v.y * inv_len;
    return out;
}
