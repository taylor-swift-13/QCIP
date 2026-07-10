int xizi_circular_area_read_advance(int readidx, int data_length, int area_length)

{
    if (readidx + data_length <= area_length) {
        return (readidx + data_length) % area_length;
    } else {
        return data_length - (area_length - readidx);
    }
}
