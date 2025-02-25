// (c) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// (c) Copyright 2022-2025 Advanced Micro Devices, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of AMD and is protected under U.S. and international copyright
// and other intellectual property laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// AMD, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) AMD shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or AMD had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// AMD products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of AMD products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.

// IP VLNV: xilinx.com:hls:master_audio_control:1.0
// IP Revision: 2113963533

// The following must be inserted into your Verilog file for this
// core to be instantiated. Change the instance name and port connections
// (in parentheses) to your own signal names.

//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
master_audio_control_4 your_instance_name (
  .ap_clk(ap_clk),                        // input wire ap_clk
  .ap_rst_n(ap_rst_n),                    // input wire ap_rst_n
  .ap_done(ap_done),                      // output wire ap_done
  .ap_idle(ap_idle),                      // output wire ap_idle
  .ap_ready(ap_ready),                    // output wire ap_ready
  .ap_start(ap_start),                    // input wire ap_start
  .in_r_TDATA(in_r_TDATA),                // input wire [63 : 0] in_r_TDATA
  .in_r_TREADY(in_r_TREADY),              // output wire in_r_TREADY
  .in_r_TVALID(in_r_TVALID),              // input wire in_r_TVALID
  .out_r_TDATA(out_r_TDATA),              // output wire [63 : 0] out_r_TDATA
  .out_r_TREADY(out_r_TREADY),            // input wire out_r_TREADY
  .out_r_TVALID(out_r_TVALID),            // output wire out_r_TVALID
  .enable_distortion(enable_distortion),  // input wire enable_distortion
  .enable_echo(enable_echo),              // input wire enable_echo
  .enable_eq(enable_eq),                  // input wire enable_eq
  .hard_clip_level(hard_clip_level),      // input wire [31 : 0] hard_clip_level
  .gain_low(gain_low),                    // input wire [31 : 0] gain_low
  .gain_mid(gain_mid),                    // input wire [31 : 0] gain_mid
  .gain_high(gain_high)                  // input wire [31 : 0] gain_high
);
// INST_TAG_END ------ End INSTANTIATION Template ---------

// You must compile the wrapper file master_audio_control_4.v when simulating
// the core, master_audio_control_4. When compiling the wrapper file, be sure to
// reference the Verilog simulation library.

