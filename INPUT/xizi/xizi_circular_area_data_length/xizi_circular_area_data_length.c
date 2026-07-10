int xizi_circular_area_data_length(int readidx, int writeidx, int status, int area_length)

{
    if (readidx == writeidx && status != 0) {
        return area_length;
    }

    if (writeidx >= readidx) {
        return writeidx - readidx;
    }

    return area_length - (readidx - writeidx);
}
