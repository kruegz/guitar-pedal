#include <hls_stream.h>
#include <ap_int.h>
#include "common.h"

// **Master Control Module**
void master_audio_control(hls::stream<axis_sample> &in, hls::stream<axis_sample> &out, 
                          bool enable_distortion, bool enable_echo, bool enable_eq, int hard_clip_level,
                          int gain_low, int gain_mid, int gain_high) {
#pragma HLS INTERFACE axis port=in
#pragma HLS INTERFACE axis port=out
#pragma HLS PIPELINE II=1

    hls::stream<axis_sample> temp1, temp2, temp3;

#pragma HLS STREAM variable=temp1 depth=8
#pragma HLS STREAM variable=temp2 depth=8
#pragma HLS STREAM variable=temp3 depth=8

    // Step 1: Apply Distortion if Enabled
    distortion(in, temp1, enable_distortion, false, hard_clip_level);

    // Step 2: Apply Echo if Enabled
    echo(temp1, temp2, enable_echo);

    // Step 3: Apply EQ if Enabled
    eq_3band(temp2, out, enable_eq, gain_low, gain_mid, gain_high);
}
