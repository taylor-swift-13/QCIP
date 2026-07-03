float float_scalar_mix(float x, float y, float z)
{
    float sum = x + y;
    float diff = x - z;
    float prod = sum * diff;
    return prod / 2.0f;
}

double double_scalar_mix(double x, double y, double z)
{
    double sum = x + y;
    double diff = x - z;
    double prod = sum * diff;
    return prod / 2.0;
}
