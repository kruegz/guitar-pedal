`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2022 06:17:58 PM
// Design Name: 
// Module Name: ui
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


module ui #(
	parameter SWITCH_WIDTH = 15,
    parameter DATA_WIDTH = 24
) (
    input clk,
    input rst_n,
    input [SWITCH_WIDTH-1:0] sw,
    input btnU,
    input btnL,
    input btnR,
    input btnD,
    input btnC,
    output btnU_toggle,
    output btnL_toggle,
    output btnR_toggle,
    output btnD_toggle,
    output btnC_toggle,
    input user_value_rst,
    output [DATA_WIDTH-1:0] user_value
    );

    // logic btnU_toggle;
    // logic btnL_toggle;
    // logic btnR_toggle;
    // logic btnD_toggle;
    // logic btnC_toggle;
    logic [DATA_WIDTH-1:0] user_value_q;

    toggle_reg btnU_toggle_reg(clk, rst_n, btnU, btnU_toggle);
    toggle_reg btnL_toggle_reg(clk, rst_n, btnL, btnL_toggle);
    toggle_reg btnR_toggle_reg(clk, rst_n, btnR, btnR_toggle);
    toggle_reg btnD_toggle_reg(clk, rst_n, btnD, btnD_toggle);
    toggle_reg btnC_toggle_reg(clk, rst_n, btnC, btnC_toggle);

    assign user_value = user_value_q;

    always @(posedge clk) begin
        if (rst_n) begin
            if (btnU_toggle) begin
                user_value_q <= user_value_q + 1;
            end
            if (btnD_toggle) begin
                user_value_q <= user_value_q - 1;
            end
            if (btnC_toggle) begin
                user_value_q <= 0;
            end
        end else begin
            user_value_q <= 0;
        end
    end

endmodule
