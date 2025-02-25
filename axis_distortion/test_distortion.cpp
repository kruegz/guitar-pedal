#include <cassert>
#include <iostream>
#include <hls_stream.h>
#include <cmath>
#include "common.h"

int test_distortion() {
    hls::stream<axis_sample> in, out;
    axis_sample sample_in, sample_out;

    // Generate a sine wave input
    for (int i = 0; i < 100; i++) {
        sample_in.data = 5000000 * sin(2 * M_PI * i / 100); // 1 kHz sine wave
        sample_in.last = (i == 99);
        in.write(sample_in);
    }

    // Run distortion effect (hard clipping)
    for (int i = 0; i < 100; i++) {
        distortion(in, out, true, false); // Pass hard clipping parameter
        sample_out = out.read();
        std::cout << "Output: " << sample_out.data << std::endl;
        assert(std::abs(sample_out.data) <= HARD_CLIP_LEVEL);
    }

    return 0;
}
