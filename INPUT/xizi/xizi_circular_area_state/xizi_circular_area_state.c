int xizi_circular_area_state(int readidx, int writeidx, int status)

{
    if (readidx == writeidx && status != 0) {
        return 1;
    }

    if (readidx == writeidx && status == 0) {
        return -1;
    }

    return 0;
}
