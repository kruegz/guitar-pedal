-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
-- Date        : Thu Feb 20 15:42:34 2025
-- Host        : DESKTOP-KNM12BH running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top master_audio_control_4 -prefix
--               master_audio_control_4_ master_audio_control_0_stub.vhdl
-- Design      : master_audio_control_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity master_audio_control_4 is
  Port ( 
    ap_clk : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC;
    ap_done : out STD_LOGIC;
    ap_idle : out STD_LOGIC;
    ap_ready : out STD_LOGIC;
    ap_start : in STD_LOGIC;
    in_r_TDATA : in STD_LOGIC_VECTOR ( 63 downto 0 );
    in_r_TREADY : out STD_LOGIC;
    in_r_TVALID : in STD_LOGIC;
    out_r_TDATA : out STD_LOGIC_VECTOR ( 63 downto 0 );
    out_r_TREADY : in STD_LOGIC;
    out_r_TVALID : out STD_LOGIC;
    enable_distortion : in STD_LOGIC;
    enable_echo : in STD_LOGIC;
    enable_eq : in STD_LOGIC;
    hard_clip_level : in STD_LOGIC_VECTOR ( 31 downto 0 );
    gain_low : in STD_LOGIC_VECTOR ( 31 downto 0 );
    gain_mid : in STD_LOGIC_VECTOR ( 31 downto 0 );
    gain_high : in STD_LOGIC_VECTOR ( 31 downto 0 )
  );

  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of master_audio_control_4 : entity is "master_audio_control_0,master_audio_control,{}";
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of master_audio_control_4 : entity is "master_audio_control_0,master_audio_control,{x_ipProduct=Vivado 2024.2,x_ipVendor=xilinx.com,x_ipLibrary=hls,x_ipName=master_audio_control,x_ipVersion=1.0,x_ipCoreRevision=2113963533,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of master_audio_control_4 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of master_audio_control_4 : entity is "HLS";
  attribute hls_module : string;
  attribute hls_module of master_audio_control_4 : entity is "yes";
end master_audio_control_4;

architecture stub of master_audio_control_4 is
  attribute syn_black_box : boolean;
  attribute black_box_pad_pin : string;
  attribute syn_black_box of stub : architecture is true;
  attribute black_box_pad_pin of stub : architecture is "ap_clk,ap_rst_n,ap_done,ap_idle,ap_ready,ap_start,in_r_TDATA[63:0],in_r_TREADY,in_r_TVALID,out_r_TDATA[63:0],out_r_TREADY,out_r_TVALID,enable_distortion,enable_echo,enable_eq,hard_clip_level[31:0],gain_low[31:0],gain_mid[31:0],gain_high[31:0]";
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of ap_clk : signal is "xilinx.com:signal:clock:1.0 ap_clk CLK";
  attribute X_INTERFACE_MODE : string;
  attribute X_INTERFACE_MODE of ap_clk : signal is "slave";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of ap_clk : signal is "XIL_INTERFACENAME ap_clk, ASSOCIATED_BUSIF in_r:out_r, ASSOCIATED_RESET ap_rst_n, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of ap_rst_n : signal is "xilinx.com:signal:reset:1.0 ap_rst_n RST";
  attribute X_INTERFACE_MODE of ap_rst_n : signal is "slave";
  attribute X_INTERFACE_PARAMETER of ap_rst_n : signal is "XIL_INTERFACENAME ap_rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of ap_done : signal is "xilinx.com:interface:acc_handshake:1.0 ap_ctrl done";
  attribute X_INTERFACE_MODE of ap_done : signal is "slave";
  attribute X_INTERFACE_INFO of ap_idle : signal is "xilinx.com:interface:acc_handshake:1.0 ap_ctrl idle";
  attribute X_INTERFACE_INFO of ap_ready : signal is "xilinx.com:interface:acc_handshake:1.0 ap_ctrl ready";
  attribute X_INTERFACE_INFO of ap_start : signal is "xilinx.com:interface:acc_handshake:1.0 ap_ctrl start";
  attribute X_INTERFACE_INFO of in_r_TDATA : signal is "xilinx.com:interface:axis:1.0 in_r TDATA";
  attribute X_INTERFACE_MODE of in_r_TDATA : signal is "slave";
  attribute X_INTERFACE_PARAMETER of in_r_TDATA : signal is "XIL_INTERFACENAME in_r, TUSER_WIDTH 0, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.0, LAYERED_METADATA undef, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of in_r_TREADY : signal is "xilinx.com:interface:axis:1.0 in_r TREADY";
  attribute X_INTERFACE_INFO of in_r_TVALID : signal is "xilinx.com:interface:axis:1.0 in_r TVALID";
  attribute X_INTERFACE_INFO of out_r_TDATA : signal is "xilinx.com:interface:axis:1.0 out_r TDATA";
  attribute X_INTERFACE_MODE of out_r_TDATA : signal is "master";
  attribute X_INTERFACE_PARAMETER of out_r_TDATA : signal is "XIL_INTERFACENAME out_r, TUSER_WIDTH 0, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.0, LAYERED_METADATA undef, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of out_r_TREADY : signal is "xilinx.com:interface:axis:1.0 out_r TREADY";
  attribute X_INTERFACE_INFO of out_r_TVALID : signal is "xilinx.com:interface:axis:1.0 out_r TVALID";
  attribute X_INTERFACE_INFO of enable_distortion : signal is "xilinx.com:signal:data:1.0 enable_distortion DATA";
  attribute X_INTERFACE_MODE of enable_distortion : signal is "slave";
  attribute X_INTERFACE_PARAMETER of enable_distortion : signal is "XIL_INTERFACENAME enable_distortion, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of enable_echo : signal is "xilinx.com:signal:data:1.0 enable_echo DATA";
  attribute X_INTERFACE_MODE of enable_echo : signal is "slave";
  attribute X_INTERFACE_PARAMETER of enable_echo : signal is "XIL_INTERFACENAME enable_echo, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of enable_eq : signal is "xilinx.com:signal:data:1.0 enable_eq DATA";
  attribute X_INTERFACE_MODE of enable_eq : signal is "slave";
  attribute X_INTERFACE_PARAMETER of enable_eq : signal is "XIL_INTERFACENAME enable_eq, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of hard_clip_level : signal is "xilinx.com:signal:data:1.0 hard_clip_level DATA";
  attribute X_INTERFACE_MODE of hard_clip_level : signal is "slave";
  attribute X_INTERFACE_PARAMETER of hard_clip_level : signal is "XIL_INTERFACENAME hard_clip_level, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of gain_low : signal is "xilinx.com:signal:data:1.0 gain_low DATA";
  attribute X_INTERFACE_MODE of gain_low : signal is "slave";
  attribute X_INTERFACE_PARAMETER of gain_low : signal is "XIL_INTERFACENAME gain_low, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of gain_mid : signal is "xilinx.com:signal:data:1.0 gain_mid DATA";
  attribute X_INTERFACE_MODE of gain_mid : signal is "slave";
  attribute X_INTERFACE_PARAMETER of gain_mid : signal is "XIL_INTERFACENAME gain_mid, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of gain_high : signal is "xilinx.com:signal:data:1.0 gain_high DATA";
  attribute X_INTERFACE_MODE of gain_high : signal is "slave";
  attribute X_INTERFACE_PARAMETER of gain_high : signal is "XIL_INTERFACENAME gain_high, LAYERED_METADATA undef";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of stub : architecture is "master_audio_control,Vivado 2024.2";
begin
end;
