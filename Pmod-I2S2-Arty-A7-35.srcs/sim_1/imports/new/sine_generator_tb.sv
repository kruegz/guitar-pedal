`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/17/2020 10:08:42 PM
// Design Name: 
// Module Name: sine_generator_tb
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


module sine_generator_tb #(
	parameter SWITCH_WIDTH = 16,
	parameter RESET_POLARITY = 0,
	parameter CLK_HALF_PERIOD = 5,
    parameter TIMEOUT = 100000,
	parameter WIDTH = 7
	) ();
    
    reg       clk;
    reg rst_n;

    wire [WIDTH-1:0] out;

    sine_generator #(WIDTH) sg0(.*);
    
    always begin
        #CLK_HALF_PERIOD;
        clk = !clk; 
    end

    initial begin
        $dumpfile("waves.vcd");
        $dumpvars(0,sine_generator_tb);
        #TIMEOUT;
        $finish;
    end
    
    initial begin
        rst_n = 0;
        clk = 0;
        #100ns;
        rst_n = 1;
    end
    
endmodule
