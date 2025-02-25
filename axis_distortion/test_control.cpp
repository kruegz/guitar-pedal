#include <iostream>
#include <hls_stream.h>
#include "common.h"

#define TEST_SAMPLES 100
#define SAMPLE_AMPLITUDE 5000000

int main() {
    hls::stream<axis_sample> input_stream, output_stream;
    axis_sample sample_in, sample_out;
    int input_values[TEST_SAMPLES];  // Store original input values

    // Enable/Disable Effects
    bool enable_distortion = true;
    bool enable_echo = true;
    bool enable_eq = true;

    std::cout << "Index | Input | Output\n";
    std::cout << "----------------------\n";

    // Generate Test Signal (Sine Wave) and Store Inputs
    for (int i = 0; i < TEST_SAMPLES; i++) {
        input_values[i] = SAMPLE_AMPLITUDE * sin(2 * M_PI * i / 20); // 1kHz tone
        sample_in.data = input_values[i];
        sample_in.last = (i == TEST_SAMPLES - 1);
        input_stream.write(sample_in);
    }

    // Print Output Samples
    for (int i = 0; i < TEST_SAMPLES; i++) {
        // Run Master Control Module
        master_audio_control(input_stream, output_stream, enable_distortion, enable_echo, enable_eq);

        sample_out = output_stream.read();
        std::cout << i << "    | " << input_values[i] << "  | " << sample_out.data << "\n";
    }

    return 0;
}
