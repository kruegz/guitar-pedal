#include <hls_stream.h>
#include <iostream>
#include <ap_int.h>
#include <ap_fixed.h>
#include "common.h"

// **Distortion Parameters**
#define SOFT_CLIP_CURVE  0.0000005 // Soft clipping curve factor

// **Distortion Effect Function**
void distortion(hls::stream<axis_sample> &in, hls::stream<axis_sample> &out, bool enable, bool soft_clipping, int hard_clip_level) {
#pragma HLS INTERFACE axis port=in
#pragma HLS INTERFACE axis port=out
#pragma HLS PIPELINE

    axis_sample sample_in = in.read();
    if (!enable) {
        out.write(sample_in);
        return;
    }
    axis_sample sample_out;
    
    audio_sample_t x = sample_in.data;

    std::cout << "Input: " << x << " ";
    
    // **HARD CLIPPING**
    if (!soft_clipping) {
        if (x > hard_clip_level) x = hard_clip_level;
        if (x < -hard_clip_level) x = -hard_clip_level;
    } 
    // **SOFT CLIPPING (Analog-Style)**
    else {
        float xf = x * SOFT_CLIP_CURVE; // Normalize input
        xf = xf / (1 + std::abs(xf)); // Soft clipping equation
        x = xf * hard_clip_level; // Scale back
    }

    // Send processed sample out
    sample_out.data = x;
    sample_out.last = sample_in.last; // Maintain AXI Stream control signal
    out.write(sample_out);
}
