transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib activehdl/xpm
vlib activehdl/xbip_utils_v3_0_14
vlib activehdl/c_reg_fd_v12_0_10
vlib activehdl/xbip_dsp48_wrapper_v3_0_6
vlib activehdl/xbip_pipe_v3_0_10
vlib activehdl/c_addsub_v12_0_19
vlib activehdl/mult_gen_v12_0_22
vlib activehdl/axi_utils_v2_0_10
vlib activehdl/cordic_v6_0_23
vlib activehdl/xil_defaultlib

vmap xpm activehdl/xpm
vmap xbip_utils_v3_0_14 activehdl/xbip_utils_v3_0_14
vmap c_reg_fd_v12_0_10 activehdl/c_reg_fd_v12_0_10
vmap xbip_dsp48_wrapper_v3_0_6 activehdl/xbip_dsp48_wrapper_v3_0_6
vmap xbip_pipe_v3_0_10 activehdl/xbip_pipe_v3_0_10
vmap c_addsub_v12_0_19 activehdl/c_addsub_v12_0_19
vmap mult_gen_v12_0_22 activehdl/mult_gen_v12_0_22
vmap axi_utils_v2_0_10 activehdl/axi_utils_v2_0_10
vmap cordic_v6_0_23 activehdl/cordic_v6_0_23
vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work xpm  -sv2k12 -l xpm -l xbip_utils_v3_0_14 -l c_reg_fd_v12_0_10 -l xbip_dsp48_wrapper_v3_0_6 -l xbip_pipe_v3_0_10 -l c_addsub_v12_0_19 -l mult_gen_v12_0_22 -l axi_utils_v2_0_10 -l cordic_v6_0_23 -l xil_defaultlib \
"C:/Xilinx/Vivado/2024.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -93  \
"C:/Xilinx/Vivado/2024.2/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work xbip_utils_v3_0_14 -93  \
"../../../../../Pmod-I2S2-master/arty-a7-35/proj/Pmod-I2S2-Arty-A7-35.ip_user_files/ipstatic/hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work c_reg_fd_v12_0_10 -93  \
"../../../../../Pmod-I2S2-master/arty-a7-35/proj/Pmod-I2S2-Arty-A7-35.ip_user_files/ipstatic/hdl/c_reg_fd_v12_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_wrapper_v3_0_6 -93  \
"../../../../../Pmod-I2S2-master/arty-a7-35/proj/Pmod-I2S2-Arty-A7-35.ip_user_files/ipstatic/hdl/xbip_dsp48_wrapper_v3_0_vh_rfs.vhd" \

vcom -work xbip_pipe_v3_0_10 -93  \
"../../../../../Pmod-I2S2-master/arty-a7-35/proj/Pmod-I2S2-Arty-A7-35.ip_user_files/ipstatic/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \

vcom -work c_addsub_v12_0_19 -93  \
"../../../../../Pmod-I2S2-master/arty-a7-35/proj/Pmod-I2S2-Arty-A7-35.ip_user_files/ipstatic/hdl/c_addsub_v12_0_vh_rfs.vhd" \

vcom -work mult_gen_v12_0_22 -93  \
"../../../../../Pmod-I2S2-master/arty-a7-35/proj/Pmod-I2S2-Arty-A7-35.ip_user_files/ipstatic/hdl/mult_gen_v12_0_vh_rfs.vhd" \

vcom -work axi_utils_v2_0_10 -93  \
"../../../../../Pmod-I2S2-master/arty-a7-35/proj/Pmod-I2S2-Arty-A7-35.ip_user_files/ipstatic/hdl/axi_utils_v2_0_vh_rfs.vhd" \

vcom -work cordic_v6_0_23 -93  \
"../../../../../Pmod-I2S2-master/arty-a7-35/proj/Pmod-I2S2-Arty-A7-35.ip_user_files/ipstatic/hdl/cordic_v6_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  \
"../../../../Pmod-I2S2-Arty-A7-35.gen/sources_1/ip/cordic_0/sim/cordic_0.vhd" \


vlog -work xil_defaultlib \
"glbl.v"

