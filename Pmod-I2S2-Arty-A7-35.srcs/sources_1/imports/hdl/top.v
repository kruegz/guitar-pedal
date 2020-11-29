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
	parameter SWITCH_WIDTH = 4,
    parameter DATA_WIDTH = 24,
	parameter RESET_POLARITY = 0
) (
    input wire       clk,
    input wire [SWITCH_WIDTH-1:0] sw,
    input wire       reset,
    
    output wire tx_mclk,
    output wire tx_lrck,
    output wire tx_sclk,
    output wire tx_data,
    output wire rx_mclk,
    output wire rx_lrck,
    output wire rx_sclk,
    input  wire rx_data,
    
    output wire [3:0] Anode_Activate, // anode signals of the 7-segment LED display
    output wire [6:0] LED_out// cathode patterns of the 7-segment LED display
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
    
    //logic clk; // 100 Mhz clock source on Basys 3 FPGA
    //logic reset; // reset
    reg [15:0] seconds = 0; // number to be displayed
    //reg [3:0] Anode_Activate; // anode signals of the 7-segment LED display
    //reg [6:0] LED_out;// cathode patterns of the 7-segment LED display
    reg [31:0] delay = 0;

	wire resetn = (reset == RESET_POLARITY) ? 1'b0 : 1'b1;
	
	always @(posedge clk, negedge resetn) begin
	   if (resetn) begin
	       if (delay == 32'd100000000) begin
               seconds <= seconds + 1;
               delay <= 0;
           end else begin
               delay <= delay + 1;
           end
	   end else begin
	       seconds <= 0;
	       delay <= 0;
	   end
	   
	   
	end
	
	reg [31:0] m_axis_data_d = 0;
	always @(posedge seconds) begin
	   //m_axis_data_d <= seconds;
	end
	
    clk_wiz_0 m_clk (
        .clk_in1(clk),
        .axis_clk(axis_clk)
    );
    
    Seven_segment_LED_Display_Controller s(clk, reset, seconds, Anode_Activate, LED_out);

    axis_i2s2 m_i2s2 (
        .axis_clk(axis_clk),
        .axis_resetn(resetn),
    
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
    
    axis_volume_controller #(
		.SWITCH_WIDTH(SWITCH_WIDTH),
		.DATA_WIDTH(24)
	) m_vc (
        .clk(axis_clk),
        .rst_n(~reset),
        .sw(sw),
        
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


