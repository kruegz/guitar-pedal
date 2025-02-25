#include <hls_stream.h>
#include <ap_int.h>
#include <ap_fixed.h>

#define N_TAPS 5  // FIR Filter Order

typedef ap_int<24> audio_sample_t;  // 24-bit fixed-point audio
typedef ap_fixed<16,4> coeff_t;     // Filter coefficients

// AXI Stream Data Structure
struct axis_sample {
    audio_sample_t data;
    bool last;
};

// FIR Filter Function
audio_sample_t fir_filter(audio_sample_t x, const coeff_t coeffs[N_TAPS], audio_sample_t delay_line[N_TAPS]) {
#pragma HLS PIPELINE
    audio_sample_t acc = 0;
    
    for (int i = N_TAPS - 1; i > 0; i--) {
        delay_line[i] = delay_line[i - 1];
    }
    delay_line[0] = x;

    for (int i = 0; i < N_TAPS; i++) {
        acc += delay_line[i] * coeffs[i];
    }
    return acc;
}

// **3-Band EQ Function**
void eq_3band(hls::stream<axis_sample> &in, hls::stream<axis_sample> &out,
              bool enable, float gain_low, float gain_mid, float gain_high) {
#pragma HLS INTERFACE axis port=in
#pragma HLS INTERFACE axis port=out
#pragma HLS PIPELINE II=1


    // **Filter Coefficients (Replace with actual designed coefficients)**
    const coeff_t lpf_coeffs[N_TAPS] = {0.1, 0.15, 0.5, 0.15, 0.1};  // Low-pass FIR
    const coeff_t bpf_coeffs[N_TAPS] = {-0.1, 0.3, 0.5, 0.3, -0.1};  // Band-pass FIR
    const coeff_t hpf_coeffs[N_TAPS] = {-0.1, -0.15, 0.5, -0.15, -0.1};  // High-pass FIR

    static audio_sample_t delay_low[N_TAPS] = {0};
    static audio_sample_t delay_mid[N_TAPS] = {0};
    static audio_sample_t delay_high[N_TAPS] = {0};

#pragma HLS ARRAY_PARTITION variable=delay_low complete
#pragma HLS ARRAY_PARTITION variable=delay_mid complete
#pragma HLS ARRAY_PARTITION variable=delay_high complete

    axis_sample input_sample = in.read();
    if (!enable) {
        out.write(input_sample);
        return;
    }
    axis_sample output_sample;

    // Apply FIR filters to split the frequency bands
    audio_sample_t low = fir_filter(input_sample.data, lpf_coeffs, delay_low);
    audio_sample_t mid = fir_filter(input_sample.data, bpf_coeffs, delay_mid);
    audio_sample_t high = fir_filter(input_sample.data, hpf_coeffs, delay_high);

    // Apply user-defined gain to each band
    audio_sample_t processed_sample = (low * gain_low) + (mid * gain_mid) + (high * gain_high);

    // Output the mixed result
    output_sample.data = processed_sample;
    output_sample.last = input_sample.last;
    out.write(output_sample);
}
