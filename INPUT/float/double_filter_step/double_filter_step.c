typedef struct DoubleFilterState {
    double y_prev;
    double x_prev;
    double alpha;
} DoubleFilterState;

double double_filter_step(DoubleFilterState *state, double x)
{
    double y = state->alpha * x + (1.0 - state->alpha) * state->y_prev;

    state->x_prev = x;
    state->y_prev = y;

    return y;
}
