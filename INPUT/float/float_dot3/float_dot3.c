float float_dot3(const float a[3], const float b[3])
{
    float acc = 0.0f;

    for (int i = 0; i < 3; ++i) {
        acc += a[i] * b[i];
    }

    return acc;
}

double double_dot3(const double a[3], const double b[3])
{
    double acc = 0.0;

    for (int i = 0; i < 3; ++i) {
        acc += a[i] * b[i];
    }

    return acc;
}
