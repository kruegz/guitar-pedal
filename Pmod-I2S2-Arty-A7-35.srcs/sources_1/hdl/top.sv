`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Digilent Inc
// Engineer: Arthur Brown
// 
// Create Date: 03/23/2018 11:53:54 AM
// Design Name: Arty-A7-100-Pmod-I2S2
// Module Name: top
// Project Name: 
// Target Devices: Arty A7 100
// Tool Versions: Vivado 2017.4
// Description: Implements a volume control stream from Line In to Line Out of a Pmod I2S2 on port JA
// 
// Revision:
// Revision 0.01 - File Created
// 
//////////////////////////////////////////////////////////////////////////////////

module top #(
	parameter SWITCH_WIDTH = 15,
    parameter DATA_WIDTH = 24,
	parameter RESET_POLARITY = 0,
    parameter N_USER_REGS = 8
) (
    input wire clk, // 100 Mhz clock source on Basys 3 FPGA 
    input wire reset, // R2

    input wire [SWITCH_WIDTH-1:0] sw, // Switches
    input wire btnC, // Center button
    input wire btnU, // Up button
    input wire btnL, // Left button
    input wire btnR, // Right button
    input wire btnD, // Down button

    output wire tx_mclk, // I2S2 TX MCLK
    output wire tx_lrck, // I2S2 TX LRCK
    output wire tx_sclk, // I2S2 TX SCLK
    output wire tx_data, // I2S2 TX Data

    output wire rx_mclk, // I2S2 RX MCLK
    output wire rx_lrck, // I2S2 RX LRCK
    output wire rx_sclk, // I2S2 RX SCLK
    input  wire rx_data, // I2S2 RX Data

    output wire [SWITCH_WIDTH-1:0] led, // LEDs
    
    output wire [3:0] Anode_Activate, // anode signals of the 7-segment LED display
    output wire [6:0] LED_out // cathode patterns of the 7-segment LED display

);
    wire axis_clk;
    
    wire [31:0] axis_tx_data;
    wire axis_tx_valid;
    wire axis_tx_ready;
    wire axis_tx_last;
    
    wire [31:0] axis_rx_data;
    wire axis_rx_valid;
    wire axis_rx_ready;
    wire axis_rx_last;
    
    logic [SWITCH_WIDTH-1:0] sw_q;

    clk_wiz_0 m_clk (
        .clk_in1(clk), // 100 MHz
        .axis_clk(axis_clk) // 22.591 MHz
    );

	wire reset_n;
    assign reset_n = ~reset;

    // ila_0 ila_0_0(clk, freq, limit, axis_tx_data[DATA_WIDTH-1:0], axis_tx_valid, axis_tx_ready, axis_tx_last);
    
    assign led = 1 << user_regs_ind;

    wire btnU_toggle;
    wire btnL_toggle;
    wire btnR_toggle;
    wire btnD_toggle;
    wire btnC_toggle;
    wire [N_USER_REGS-1:0][DATA_WIDTH-1:0] user_regs;
    wire [DATA_WIDTH-1:0] user_regs_ind;
    wire [DATA_WIDTH-1:0] user_value;
    wire [DATA_WIDTH-1:0] freq;
    wire [DATA_WIDTH-1:0] limit;

    assign user_value = user_regs[user_regs_ind];
    assign freq = user_regs[0];
    assign limit = user_regs[1];

    ui #(
        .SWITCH_WIDTH      (SWITCH_WIDTH),
        .DATA_WIDTH        (DATA_WIDTH),
        .N_USER_REGS(N_USER_REGS)
    ) u_ui (
        .clk               (clk),
        .rst_n             (reset_n),
        .sw                (sw),
        .btnU              (btnU),
        .btnL              (btnL),
        .btnR              (btnR),
        .btnD              (btnD),
        .btnC              (btnC),
        .btnU_toggle       (btnU_toggle),
        .btnL_toggle       (btnL_toggle),
        .btnR_toggle       (btnR_toggle),
        .btnD_toggle       (btnD_toggle),
        .btnC_toggle       (btnC_toggle),
        .user_regs         (user_regs),
        .user_regs_ind     (user_regs_ind),
        .sw_out              (sw_q)
    );
    
    Seven_segment_LED_Display_Controller s(clk, reset, user_value, Anode_Activate, LED_out);

    axis_i2s2 m_i2s2 (
        .axis_clk(axis_clk),
        .axis_resetn(reset_n),
    
        .tx_axis_s_data(axis_tx_data),
        .tx_axis_s_valid(axis_tx_valid),
        .tx_axis_s_ready(axis_tx_ready),
        .tx_axis_s_last(axis_tx_last),
    
        .rx_axis_m_data(axis_rx_data),
        .rx_axis_m_valid(axis_rx_valid),
        .rx_axis_m_ready(axis_rx_ready),
        .rx_axis_m_last(axis_rx_last),
        
        .tx_mclk(tx_mclk),
        .tx_lrck(tx_lrck),
        .tx_sclk(tx_sclk),
        .tx_sdout(tx_data),
        .rx_mclk(rx_mclk),
        .rx_lrck(rx_lrck),
        .rx_sclk(rx_sclk),
        .rx_sdin(rx_data)
    );
    
    axis_audio_controller #(
		.SWITCH_WIDTH(SWITCH_WIDTH),
		.DATA_WIDTH(DATA_WIDTH)
	) m_vc (
        .clk(axis_clk),
        .rst_n(reset_n),
        .sw(sw_q),
        .in_value(user_value),
        .freq(freq),
        .limit(limit),
        
        .s_axis_data(axis_rx_data[DATA_WIDTH-1:0]),
        .s_axis_valid(axis_rx_valid),
        .s_axis_ready(axis_rx_ready),
        .s_axis_last(axis_rx_last),
        
        .m_axis_data(axis_tx_data[DATA_WIDTH-1:0]),
        .m_axis_valid(axis_tx_valid),
        .m_axis_ready(axis_tx_ready),
        .m_axis_last(axis_tx_last)
    );
    
    
    
    
    
endmodule
