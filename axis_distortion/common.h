#include <hls_stream.h>
#include <ap_int.h>
#include <ap_fixed.h>

// 24-bit signed integer input (matching I2S audio format)
typedef ap_int<24> audio_sample_t;

// AXI Stream-compatible struct
struct axis_sample {
    audio_sample_t data;
    bool last;
};



void distortion(hls::stream<axis_sample> &in, hls::stream<axis_sample> &out, bool enable, bool soft_clipping, int hard_clip_level);
void echo(hls::stream<axis_sample> &in, hls::stream<axis_sample> &out, bool enable);
void eq_3band(hls::stream<axis_sample> &in, hls::stream<axis_sample> &out, bool enable, float gain_low, float gain_mid, float gain_high);
void master_audio_control(hls::stream<axis_sample> &in,
                          hls::stream<axis_sample> &out,
                          bool enable_distortion,
                          bool enable_echo,
                          bool enable_eq,
                          int hard_clip_level,
                          int gain_low,
                          int gain_mid,
                          int gain_high);
