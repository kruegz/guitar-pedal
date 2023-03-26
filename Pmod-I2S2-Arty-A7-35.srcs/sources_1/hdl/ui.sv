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
    parameter DATA_WIDTH = 24,
    parameter N_USER_REGS = 8
) (
    input wire clk,
    input wire rst_n,
    input wire [SWITCH_WIDTH-1:0] sw,
    input wire btnU,
    input wire btnL,
    input wire btnR,
    input wire btnD,
    input wire btnC,
    output wire btnU_toggle,
    output wire btnL_toggle,
    output wire btnR_toggle,
    output wire btnD_toggle,
    output wire btnC_toggle,
    output reg [DATA_WIDTH-1:0] user_regs[N_USER_REGS],
    output reg [7:0] user_regs_ind,
    output wire [SWITCH_WIDTH-1:0] sw_out
    );

    // logic [DATA_WIDTH-1:0] user_regs[N_USER_REGS];
    // logic [7:0] user_regs_ind;
    logic [DATA_WIDTH-1:0] user_value_q;
    logic [SWITCH_WIDTH-1:0] sw_sync[3];

    toggle_reg btnU_toggle_reg(clk, rst_n, btnU, btnU_toggle);
    toggle_reg btnL_toggle_reg(clk, rst_n, btnL, btnL_toggle);
    toggle_reg btnR_toggle_reg(clk, rst_n, btnR, btnR_toggle);
    toggle_reg btnD_toggle_reg(clk, rst_n, btnD, btnD_toggle);
    toggle_reg btnC_toggle_reg(clk, rst_n, btnC, btnC_toggle);

    // assign user_value = user_value_q;
    assign sw_out = sw_sync[2];

    always @(posedge clk) begin
        if (rst_n) begin
            
            // Sync switches
            sw_sync[0] <= sw;
            sw_sync[1] <= sw_sync[0];
            sw_sync[2] <= sw_sync[1];

            // Change user reg index
            if (btnR_toggle) begin
                user_regs_ind <= user_regs_ind - 1;
            end
            if (btnL_toggle) begin
                user_regs_ind <= user_regs_ind + 1;
            end

            // Increment/decrement user reg
            if (btnU_toggle) begin
                user_regs[user_regs_ind] <= user_regs[user_regs_ind] + sw_out;
            end
            if (btnD_toggle) begin
                user_regs[user_regs_ind] <= user_regs[user_regs_ind] - sw_out;
            end

            // Reset user reg
            if (btnC_toggle) begin
                user_regs[user_regs_ind] <= 0;
            end
        end else begin
            foreach(user_regs[i]) begin
                user_regs[i] <= 0;
            end
            user_regs_ind <= 0;
            user_value_q <= 0;
            sw_sync[0] <= 0;
            sw_sync[1] <= 0;
            sw_sync[2] <= 0;
        end
    end

endmodule
