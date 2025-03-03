vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xpm
vlib modelsim_lib/msim/xbip_utils_v3_0_14
vlib modelsim_lib/msim/c_reg_fd_v12_0_10
vlib modelsim_lib/msim/xbip_dsp48_wrapper_v3_0_6
vlib modelsim_lib/msim/xbip_pipe_v3_0_10
vlib modelsim_lib/msim/c_addsub_v12_0_19
vlib modelsim_lib/msim/mult_gen_v12_0_22
vlib modelsim_lib/msim/axi_utils_v2_0_10
vlib modelsim_lib/msim/cordic_v6_0_23
vlib modelsim_lib/msim/xil_defaultlib

vmap xpm modelsim_lib/msim/xpm
vmap xbip_utils_v3_0_14 modelsim_lib/msim/xbip_utils_v3_0_14
vmap c_reg_fd_v12_0_10 modelsim_lib/msim/c_reg_fd_v12_0_10
vmap xbip_dsp48_wrapper_v3_0_6 modelsim_lib/msim/xbip_dsp48_wrapper_v3_0_6
vmap xbip_pipe_v3_0_10 modelsim_lib/msim/xbip_pipe_v3_0_10
vmap c_addsub_v12_0_19 modelsim_lib/msim/c_addsub_v12_0_19
vmap mult_gen_v12_0_22 modelsim_lib/msim/mult_gen_v12_0_22
vmap axi_utils_v2_0_10 modelsim_lib/msim/axi_utils_v2_0_10
vmap cordic_v6_0_23 modelsim_lib/msim/cordic_v6_0_23
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -work xpm  -incr -mfcu  -sv \
"C:/Xilinx/Vivado/2024.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm  -93  \
"C:/Xilinx/Vivado/2024.2/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work xbip_utils_v3_0_14  -93  \
"../../../../../Pmod-I2S2-master/arty-a7-35/proj/Pmod-I2S2-Arty-A7-35.ip_user_files/ipstatic/hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work c_reg_fd_v12_0_10  -93  \
"../../../../../Pmod-I2S2-master/arty-a7-35/proj/Pmod-I2S2-Arty-A7-35.ip_user_files/ipstatic/hdl/c_reg_fd_v12_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_wrapper_v3_0_6  -93  \
"../../../../../Pmod-I2S2-master/arty-a7-35/proj/Pmod-I2S2-Arty-A7-35.ip_user_files/ipstatic/hdl/xbip_dsp48_wrapper_v3_0_vh_rfs.vhd" \

vcom -work xbip_pipe_v3_0_10  -93  \
"../../../../../Pmod-I2S2-master/arty-a7-35/proj/Pmod-I2S2-Arty-A7-35.ip_user_files/ipstatic/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \

vcom -work c_addsub_v12_0_19  -93  \
"../../../../../Pmod-I2S2-master/arty-a7-35/proj/Pmod-I2S2-Arty-A7-35.ip_user_files/ipstatic/hdl/c_addsub_v12_0_vh_rfs.vhd" \

vcom -work mult_gen_v12_0_22  -93  \
"../../../../../Pmod-I2S2-master/arty-a7-35/proj/Pmod-I2S2-Arty-A7-35.ip_user_files/ipstatic/hdl/mult_gen_v12_0_vh_rfs.vhd" \

vcom -work axi_utils_v2_0_10  -93  \
"../../../../../Pmod-I2S2-master/arty-a7-35/proj/Pmod-I2S2-Arty-A7-35.ip_user_files/ipstatic/hdl/axi_utils_v2_0_vh_rfs.vhd" \

vcom -work cordic_v6_0_23  -93  \
"../../../../../Pmod-I2S2-master/arty-a7-35/proj/Pmod-I2S2-Arty-A7-35.ip_user_files/ipstatic/hdl/cordic_v6_0_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93  \
"../../../../Pmod-I2S2-Arty-A7-35.gen/sources_1/ip/cordic_0/sim/cordic_0.vhd" \


vlog -work xil_defaultlib \
"glbl.v"

