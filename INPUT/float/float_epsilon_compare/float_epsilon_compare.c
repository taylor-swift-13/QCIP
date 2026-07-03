static float qcip_absf(float x)
{
    return x < 0.0f ? -x : x;
}

static double qcip_absd(double x)
{
    return x < 0.0 ? -x : x;
}

int float_within_epsilon(float actual, float expected, float epsilon)
{
    float diff = actual - expected;
    return qcip_absf(diff) <= epsilon;
}

int double_within_epsilon(double actual, double expected, double epsilon)
{
    double diff = actual - expected;
    return qcip_absd(diff) <= epsilon;
}
