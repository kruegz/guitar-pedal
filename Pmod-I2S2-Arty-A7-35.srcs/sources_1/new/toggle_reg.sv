`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2022 06:35:54 PM
// Design Name: 
// Module Name: toggle_reg
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


module toggle_reg(
    input clk,
    input rst_n,
    input in,
    output toggle
    );

    logic toggle;
    logic toggle_reg;

    assign toggle = in && !toggle_reg;

    always @(posedge clk) begin
        if (rst_n) begin
            if (in && !toggle_reg) begin
                toggle_reg <= 1;
            end
            if (!in) begin
                toggle_reg <= 0;
            end
        end else begin
            toggle_reg <= 0;
        end
    end
endmodule
