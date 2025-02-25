#include <iostream>
#include <fstream>
#include <cmath>
#include <hls_stream.h>
#include "common.h" // Include the echo effect function

#define TEST_SAMPLES 100 // Number of test samples
#define SAMPLE_AMPLITUDE 5000000 // Amplitude for test sine wave

int test_echo() {
    hls::stream<axis_sample> input_stream, output_stream;
    axis_sample sample_in, sample_out;

    int input_values[TEST_SAMPLES]; // Array to store original input values

    // Open a file to store results
    std::ofstream result_file("echo_output.txt");

    // Print header
    std::cout << "Index | Input Sample | Output Sample\n";
    std::cout << "-----------------------------------\n";

    // Generate test signal (sine wave) and write to AXI Stream
    for (int i = 0; i < TEST_SAMPLES; i++) {
        int sample_value = SAMPLE_AMPLITUDE * sin(2 * M_PI * i / 20); // 1kHz tone

        sample_in.data = sample_value;
        sample_in.last = (i == TEST_SAMPLES - 1); // Mark last sample for AXI Stream

        input_stream.write(sample_in); // Write to AXI stream
        input_values[i] = sample_value; // Store input value for later
    }

    // Process the samples through the echo effect
    for (int i = 0; i < TEST_SAMPLES; i++) {
        echo(input_stream, output_stream, true); // Process through HLS function
        sample_out = output_stream.read(); // Read processed output

        // Print and save the results using stored input values
        std::cout << "  " << i << "    | " << input_values[i] << "  | " << sample_out.data << "\n";
        result_file << i << ", " << input_values[i] << ", " << sample_out.data << "\n";
    }

    result_file.close();
    std::cout << "Test complete. Results saved in echo_output.txt\n";

    return 0;
}
