`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/17/2020 10:08:42 PM
// Design Name: 
// Module Name: top_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top_tb #(
	parameter SWITCH_WIDTH = 16,
	parameter RESET_POLARITY = 0,
	parameter CLK_HALF_PERIOD = 5,
    parameter TIMEOUT = 10000,
	parameter DATA_WIDTH = 24
	) ();

    reg clk; // 100 Mhz clock source on Basys 3 FPGA 
    reg [SWITCH_WIDTH-1:0] sw; // Switches
    reg btnC; // Center button
    reg btnU; // Up button
    reg btnL; // Left button
    reg btnR; // Right button
    reg btnD; // Down button
    reg reset; // R2
    
    wire tx_mclk;
    wire tx_lrck;
    wire tx_sclk;
    wire tx_data;
    wire rx_mclk;
    wire rx_lrck;
    wire rx_sclk;
    reg rx_data;
    
    wire [3:0] Anode_Activate; // anode signals of the 7-segment LED display
    wire [6:0] LED_out; // cathode patterns of the 7-segment LED display
    
    wire rst_n;
    assign rst_n = !reset;
    
    top top0(.*);
    
    always begin
        #CLK_HALF_PERIOD;
        // #1;
        clk = !clk; 
    end

    reg [7:0] cnt;
    always @(posedge clk) begin
        if (rst_n) begin
            cnt <= cnt + 1;
        end else begin
            cnt <= 0;
        end
    end

    initial begin
        $dumpfile("waves.vcd");
        $dumpvars(0,top_tb);
        #TIMEOUT;
        $finish;
    end
    
    initial begin
        reset = 1;
        sw = 'h100;
        clk = 0;
        rx_data = 0;
        btnU <= 0;
        btnL <= 0;
        btnR <= 0;
        btnD <= 0;
        btnC <= 0;
        repeat (5) @(posedge clk);
        reset = 0;
        repeat (5) @(posedge clk);

        btnU <= 1;
        repeat (1) @(posedge clk);
        btnU <= 0;
        repeat (1) @(posedge clk);
        btnU <= 1;
        repeat (1) @(posedge clk);
        btnU <= 0;
        btnD <= 1;
        repeat (5) @(posedge clk);
        btnD <= 0;
        btnC <= 1;
        repeat (5) @(posedge clk);
        btnC <= 0;
    end
    
endmodule
