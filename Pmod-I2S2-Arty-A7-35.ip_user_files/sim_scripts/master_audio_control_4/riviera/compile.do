transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib riviera/xpm
vlib riviera/xbip_utils_v3_0_14
vlib riviera/axi_utils_v2_0_10
vlib riviera/xbip_pipe_v3_0_10
vlib riviera/xbip_dsp48_wrapper_v3_0_6
vlib riviera/mult_gen_v12_0_22
vlib riviera/floating_point_v7_1_19
vlib riviera/xil_defaultlib

vmap xpm riviera/xpm
vmap xbip_utils_v3_0_14 riviera/xbip_utils_v3_0_14
vmap axi_utils_v2_0_10 riviera/axi_utils_v2_0_10
vmap xbip_pipe_v3_0_10 riviera/xbip_pipe_v3_0_10
vmap xbip_dsp48_wrapper_v3_0_6 riviera/xbip_dsp48_wrapper_v3_0_6
vmap mult_gen_v12_0_22 riviera/mult_gen_v12_0_22
vmap floating_point_v7_1_19 riviera/floating_point_v7_1_19
vmap xil_defaultlib riviera/xil_defaultlib

vlog -work xpm  -incr "+incdir+../../../../../Pmod-I2S2-master/arty-a7-35/proj/Pmod-I2S2-Arty-A7-35.ip_user_files/ipstatic/hdl/verilog" -l xpm -l xbip_utils_v3_0_14 -l axi_utils_v2_0_10 -l xbip_pipe_v3_0_10 -l xbip_dsp48_wrapper_v3_0_6 -l mult_gen_v12_0_22 -l floating_point_v7_1_19 -l xil_defaultlib \
"C:/Xilinx/Vivado/2024.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -93  -incr \
"C:/Xilinx/Vivado/2024.2/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work xbip_utils_v3_0_14 -93  -incr \
"../../../../../Pmod-I2S2-master/arty-a7-35/proj/Pmod-I2S2-Arty-A7-35.ip_user_files/ipstatic/hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work axi_utils_v2_0_10 -93  -incr \
"../../../../../Pmod-I2S2-master/arty-a7-35/proj/Pmod-I2S2-Arty-A7-35.ip_user_files/ipstatic/hdl/axi_utils_v2_0_vh_rfs.vhd" \

vcom -work xbip_pipe_v3_0_10 -93  -incr \
"../../../../../Pmod-I2S2-master/arty-a7-35/proj/Pmod-I2S2-Arty-A7-35.ip_user_files/ipstatic/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_wrapper_v3_0_6 -93  -incr \
"../../../../../Pmod-I2S2-master/arty-a7-35/proj/Pmod-I2S2-Arty-A7-35.ip_user_files/ipstatic/hdl/xbip_dsp48_wrapper_v3_0_vh_rfs.vhd" \

vcom -work mult_gen_v12_0_22 -93  -incr \
"../../../../../Pmod-I2S2-master/arty-a7-35/proj/Pmod-I2S2-Arty-A7-35.ip_user_files/ipstatic/hdl/mult_gen_v12_0_vh_rfs.vhd" \

vcom -work floating_point_v7_1_19 -93  -incr \
"../../../../../Pmod-I2S2-master/arty-a7-35/proj/Pmod-I2S2-Arty-A7-35.ip_user_files/ipstatic/hdl/floating_point_v7_1_rfs.vhd" \

vlog -work floating_point_v7_1_19  -incr -v2k5 "+incdir+../../../../../Pmod-I2S2-master/arty-a7-35/proj/Pmod-I2S2-Arty-A7-35.ip_user_files/ipstatic/hdl/verilog" -l xpm -l xbip_utils_v3_0_14 -l axi_utils_v2_0_10 -l xbip_pipe_v3_0_10 -l xbip_dsp48_wrapper_v3_0_6 -l mult_gen_v12_0_22 -l floating_point_v7_1_19 -l xil_defaultlib \
"../../../../../Pmod-I2S2-master/arty-a7-35/proj/Pmod-I2S2-Arty-A7-35.ip_user_files/ipstatic/hdl/floating_point_v7_1_rfs.v" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../../../Pmod-I2S2-master/arty-a7-35/proj/Pmod-I2S2-Arty-A7-35.ip_user_files/ipstatic/hdl/verilog" -l xpm -l xbip_utils_v3_0_14 -l axi_utils_v2_0_10 -l xbip_pipe_v3_0_10 -l xbip_dsp48_wrapper_v3_0_6 -l mult_gen_v12_0_22 -l floating_point_v7_1_19 -l xil_defaultlib \
"../../../../../Pmod-I2S2-master/arty-a7-35/proj/Pmod-I2S2-Arty-A7-35.ip_user_files/ipstatic/hdl/ip/master_audio_control_dadd_64ns_64ns_64_7_no_dsp_1_ip.v" \
"../../../../../Pmod-I2S2-master/arty-a7-35/proj/Pmod-I2S2-Arty-A7-35.ip_user_files/ipstatic/hdl/ip/master_audio_control_dmul_64ns_64ns_64_7_max_dsp_1_ip.v" \
"../../../../../Pmod-I2S2-master/arty-a7-35/proj/Pmod-I2S2-Arty-A7-35.ip_user_files/ipstatic/hdl/ip/master_audio_control_fadd_32ns_32ns_32_7_full_dsp_1_ip.v" \
"../../../../../Pmod-I2S2-master/arty-a7-35/proj/Pmod-I2S2-Arty-A7-35.ip_user_files/ipstatic/hdl/ip/master_audio_control_fmul_32ns_32ns_32_4_max_dsp_1_ip.v" \
"../../../../../Pmod-I2S2-master/arty-a7-35/proj/Pmod-I2S2-Arty-A7-35.ip_user_files/ipstatic/hdl/ip/master_audio_control_sitodp_32s_64_6_no_dsp_1_ip.v" \
"../../../../../Pmod-I2S2-master/arty-a7-35/proj/Pmod-I2S2-Arty-A7-35.ip_user_files/ipstatic/hdl/ip/master_audio_control_sitofp_32ns_32_6_no_dsp_1_ip.v" \
"../../../../../Pmod-I2S2-master/arty-a7-35/proj/Pmod-I2S2-Arty-A7-35.ip_user_files/ipstatic/hdl/verilog/master_audio_control_dadd_64ns_64ns_64_7_no_dsp_1.v" \
"../../../../../Pmod-I2S2-master/arty-a7-35/proj/Pmod-I2S2-Arty-A7-35.ip_user_files/ipstatic/hdl/verilog/master_audio_control_dmul_64ns_64ns_64_7_max_dsp_1.v" \
"../../../../../Pmod-I2S2-master/arty-a7-35/proj/Pmod-I2S2-Arty-A7-35.ip_user_files/ipstatic/hdl/verilog/master_audio_control_echo_stream_axis_sample_0_stream_axis_sample_0_bool_delay_buffer_RAM_AUTO_1R1W.v" \
"../../../../../Pmod-I2S2-master/arty-a7-35/proj/Pmod-I2S2-Arty-A7-35.ip_user_files/ipstatic/hdl/verilog/master_audio_control_fadd_32ns_32ns_32_7_full_dsp_1.v" \
"../../../../../Pmod-I2S2-master/arty-a7-35/proj/Pmod-I2S2-Arty-A7-35.ip_user_files/ipstatic/hdl/verilog/master_audio_control_fifo_w25_d8_S.v" \
"../../../../../Pmod-I2S2-master/arty-a7-35/proj/Pmod-I2S2-Arty-A7-35.ip_user_files/ipstatic/hdl/verilog/master_audio_control_fmul_32ns_32ns_32_4_max_dsp_1.v" \
"../../../../../Pmod-I2S2-master/arty-a7-35/proj/Pmod-I2S2-Arty-A7-35.ip_user_files/ipstatic/hdl/verilog/master_audio_control_hls_deadlock_idx0_monitor.v" \
"../../../../../Pmod-I2S2-master/arty-a7-35/proj/Pmod-I2S2-Arty-A7-35.ip_user_files/ipstatic/hdl/verilog/master_audio_control_mul_24s_10ns_34_1_1.v" \
"../../../../../Pmod-I2S2-master/arty-a7-35/proj/Pmod-I2S2-Arty-A7-35.ip_user_files/ipstatic/hdl/verilog/master_audio_control_mul_24s_10s_34_1_1.v" \
"../../../../../Pmod-I2S2-master/arty-a7-35/proj/Pmod-I2S2-Arty-A7-35.ip_user_files/ipstatic/hdl/verilog/master_audio_control_mul_24s_11ns_35_1_1.v" \
"../../../../../Pmod-I2S2-master/arty-a7-35/proj/Pmod-I2S2-Arty-A7-35.ip_user_files/ipstatic/hdl/verilog/master_audio_control_mul_24s_11s_35_1_1.v" \
"../../../../../Pmod-I2S2-master/arty-a7-35/proj/Pmod-I2S2-Arty-A7-35.ip_user_files/ipstatic/hdl/verilog/master_audio_control_mul_24s_12ns_36_1_1.v" \
"../../../../../Pmod-I2S2-master/arty-a7-35/proj/Pmod-I2S2-Arty-A7-35.ip_user_files/ipstatic/hdl/verilog/master_audio_control_regslice_both.v" \
"../../../../../Pmod-I2S2-master/arty-a7-35/proj/Pmod-I2S2-Arty-A7-35.ip_user_files/ipstatic/hdl/verilog/master_audio_control_sitodp_32s_64_6_no_dsp_1.v" \
"../../../../../Pmod-I2S2-master/arty-a7-35/proj/Pmod-I2S2-Arty-A7-35.ip_user_files/ipstatic/hdl/verilog/master_audio_control_sitofp_32ns_32_6_no_dsp_1.v" \
"../../../../../Pmod-I2S2-master/arty-a7-35/proj/Pmod-I2S2-Arty-A7-35.ip_user_files/ipstatic/hdl/verilog/master_audio_control_sparsemux_9_3_24_1_1.v" \
"../../../../../Pmod-I2S2-master/arty-a7-35/proj/Pmod-I2S2-Arty-A7-35.ip_user_files/ipstatic/hdl/verilog/master_audio_control_sparsemux_33_4_24_1_1.v" \
"../../../../../Pmod-I2S2-master/arty-a7-35/proj/Pmod-I2S2-Arty-A7-35.ip_user_files/ipstatic/hdl/verilog/master_audio_control_srem_17ns_17ns_17_21_1.v" \
"../../../../../Pmod-I2S2-master/arty-a7-35/proj/Pmod-I2S2-Arty-A7-35.ip_user_files/ipstatic/hdl/verilog/master_audio_control.v" \
"../../../../Pmod-I2S2-Arty-A7-35.gen/sources_1/ip/master_audio_control_4/sim/master_audio_control_4.v" \

vlog -work xil_defaultlib \
"glbl.v"

