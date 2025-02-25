set SynModuleInfo {
  {SRCNAME master_audio_control MODELNAME master_audio_control RTLNAME master_audio_control IS_TOP 1
    SUBMODULES {
      {MODELNAME master_audio_control_fadd_32ns_32ns_32_7_full_dsp_1 RTLNAME master_audio_control_fadd_32ns_32ns_32_7_full_dsp_1 BINDTYPE op TYPE fadd IMPL fulldsp LATENCY 6 ALLOW_PRAGMA 1}
      {MODELNAME master_audio_control_fmul_32ns_32ns_32_4_max_dsp_1 RTLNAME master_audio_control_fmul_32ns_32ns_32_4_max_dsp_1 BINDTYPE op TYPE fmul IMPL maxdsp LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME master_audio_control_sitofp_32ns_32_6_no_dsp_1 RTLNAME master_audio_control_sitofp_32ns_32_6_no_dsp_1 BINDTYPE op TYPE sitofp IMPL auto LATENCY 5 ALLOW_PRAGMA 1}
      {MODELNAME master_audio_control_dadd_64ns_64ns_64_7_no_dsp_1 RTLNAME master_audio_control_dadd_64ns_64ns_64_7_no_dsp_1 BINDTYPE op TYPE dadd IMPL fabric LATENCY 6 ALLOW_PRAGMA 1}
      {MODELNAME master_audio_control_dmul_64ns_64ns_64_7_max_dsp_1 RTLNAME master_audio_control_dmul_64ns_64ns_64_7_max_dsp_1 BINDTYPE op TYPE dmul IMPL maxdsp LATENCY 6 ALLOW_PRAGMA 1}
      {MODELNAME master_audio_control_sitodp_32s_64_6_no_dsp_1 RTLNAME master_audio_control_sitodp_32s_64_6_no_dsp_1 BINDTYPE op TYPE sitodp IMPL auto LATENCY 5 ALLOW_PRAGMA 1}
      {MODELNAME master_audio_control_srem_17ns_17ns_17_21_1 RTLNAME master_audio_control_srem_17ns_17ns_17_21_1 BINDTYPE op TYPE srem IMPL auto LATENCY 20 ALLOW_PRAGMA 1}
      {MODELNAME master_audio_control_sparsemux_33_4_24_1_1 RTLNAME master_audio_control_sparsemux_33_4_24_1_1 BINDTYPE op TYPE sparsemux IMPL compactencoding_dontcare}
      {MODELNAME master_audio_control_mul_24s_10s_34_1_1 RTLNAME master_audio_control_mul_24s_10s_34_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME master_audio_control_mul_24s_11s_35_1_1 RTLNAME master_audio_control_mul_24s_11s_35_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME master_audio_control_sparsemux_9_3_24_1_1 RTLNAME master_audio_control_sparsemux_9_3_24_1_1 BINDTYPE op TYPE sparsemux IMPL onehotencoding_realdef}
      {MODELNAME master_audio_control_mul_24s_11ns_35_1_1 RTLNAME master_audio_control_mul_24s_11ns_35_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME master_audio_control_mul_24s_10ns_34_1_1 RTLNAME master_audio_control_mul_24s_10ns_34_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME master_audio_control_mul_24s_12ns_36_1_1 RTLNAME master_audio_control_mul_24s_12ns_36_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME master_audio_control_echo_stream_axis_sample_0_stream_axis_sample_0_bool_delay_buffer_RAM_AUTO_1R1W RTLNAME master_audio_control_echo_stream_axis_sample_0_stream_axis_sample_0_bool_delay_buffer_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME master_audio_control_fifo_w25_d8_S RTLNAME master_audio_control_fifo_w25_d8_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME temp1_U}
      {MODELNAME master_audio_control_fifo_w25_d8_S RTLNAME master_audio_control_fifo_w25_d8_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME temp2_U}
      {MODELNAME master_audio_control_regslice_both RTLNAME master_audio_control_regslice_both BINDTYPE interface TYPE adapter IMPL reg_slice}
    }
  }
}
