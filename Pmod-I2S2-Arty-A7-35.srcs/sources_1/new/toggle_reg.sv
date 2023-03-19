`timescale 1ns / 1ps

// toggle_reg
// Send a pulse when the input goes from 0 to 1

module toggle_reg(
    input clk,
    input rst_n,
    input in,
    output toggle
    );

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
