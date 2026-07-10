int xizi_circular_area_write_advance(int writeidx, int data_length, int area_length)

{
    if (writeidx + data_length <= area_length) {
        return (writeidx + data_length) % area_length;
    } else {
        return data_length - (area_length - writeidx);
    }
}
