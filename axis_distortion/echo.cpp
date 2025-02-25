#include <hls_stream.h>
#include <ap_int.h>
#include "common.h"

#define DELAY_LENGTH 48000  // 1-second delay at 48 kHz sample rate
#define FEEDBACK 0.5        // Echo intensity (0.0 - 1.0)

// Delay/Echo Effect Implementation
void echo(hls::stream<axis_sample> &in, hls::stream<axis_sample> &out, bool enable) {
#pragma HLS INTERFACE axis port=in
#pragma HLS INTERFACE axis port=out
#pragma HLS PIPELINE II=1

    static audio_sample_t delay_buffer[DELAY_LENGTH] = {0};
#pragma HLS ARRAY_PARTITION variable=delay_buffer cyclic factor=16

    static int delay_index = 0; // Circular buffer index

    // Read input sample
    axis_sample input_sample = in.read();
    if(!enable) {
        out.write(input_sample);
        return;
    }
    axis_sample output_sample;

    // Retrieve delayed sample from buffer
    audio_sample_t delayed_sample = delay_buffer[delay_index];

    // Compute output: mix input with delayed signal
    audio_sample_t output_value = input_sample.data + (delayed_sample * FEEDBACK);

    // Store the new sample in the delay buffer
    delay_buffer[delay_index] = output_value;

    // Increment circular buffer index
    delay_index = (delay_index + 1) % DELAY_LENGTH;

    // Write output sample
    output_sample.data = output_value;
    output_sample.last = input_sample.last;
    out.write(output_sample);
}
