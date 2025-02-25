-- (c) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- (c) Copyright 2022-2025 Advanced Micro Devices, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of AMD and is protected under U.S. and international copyright
-- and other intellectual property laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- AMD, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) AMD shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or AMD had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- AMD products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of AMD products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.
-- IP VLNV: xilinx.com:hls:master_audio_control:1.0
-- IP Revision: 2113963533

-- The following code must appear in the VHDL architecture header.

------------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
COMPONENT master_audio_control_4
  PORT (
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    ap_start : IN STD_LOGIC;
    in_r_TDATA : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    in_r_TREADY : OUT STD_LOGIC;
    in_r_TVALID : IN STD_LOGIC;
    out_r_TDATA : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    out_r_TREADY : IN STD_LOGIC;
    out_r_TVALID : OUT STD_LOGIC;
    enable_distortion : IN STD_LOGIC;
    enable_echo : IN STD_LOGIC;
    enable_eq : IN STD_LOGIC;
    hard_clip_level : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    gain_low : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    gain_mid : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    gain_high : IN STD_LOGIC_VECTOR(31 DOWNTO 0) 
  );
END COMPONENT;
-- COMP_TAG_END ------ End COMPONENT Declaration ------------

-- The following code must appear in the VHDL architecture
-- body. Substitute your own instance name and net names.

------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG
your_instance_name : master_audio_control_4
  PORT MAP (
    ap_clk => ap_clk,
    ap_rst_n => ap_rst_n,
    ap_done => ap_done,
    ap_idle => ap_idle,
    ap_ready => ap_ready,
    ap_start => ap_start,
    in_r_TDATA => in_r_TDATA,
    in_r_TREADY => in_r_TREADY,
    in_r_TVALID => in_r_TVALID,
    out_r_TDATA => out_r_TDATA,
    out_r_TREADY => out_r_TREADY,
    out_r_TVALID => out_r_TVALID,
    enable_distortion => enable_distortion,
    enable_echo => enable_echo,
    enable_eq => enable_eq,
    hard_clip_level => hard_clip_level,
    gain_low => gain_low,
    gain_mid => gain_mid,
    gain_high => gain_high
  );
-- INST_TAG_END ------ End INSTANTIATION Template ---------

-- You must compile the wrapper file master_audio_control_4.vhd when simulating
-- the core, master_audio_control_4. When compiling the wrapper file, be sure to
-- reference the VHDL simulation library.



