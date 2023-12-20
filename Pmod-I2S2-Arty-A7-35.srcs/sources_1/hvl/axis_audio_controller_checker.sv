`timescale 1ns / 1ps
`default_nettype none

module axis_audio_controller_checker #(
    parameter SWITCH_WIDTH = 15,
    parameter DATA_WIDTH = 24
) (
    input wire clk, // Axis clock (?MHz)
    input wire rst_n,
    input wire [SWITCH_WIDTH-1:0] sw, // Switch value
    input wire [DATA_WIDTH-1:0] in_value, // User input value

    input wire [DATA_WIDTH-1:0] freq,
    input wire [DATA_WIDTH-1:0] limit,
    
    //AXIS SLAVE INTERFACE
    input  wire [DATA_WIDTH-1:0] s_axis_data,
    input  wire s_axis_valid,
    output reg  s_axis_ready = 1'b1,
    input  wire s_axis_last,
    
    // AXIS MASTER INTERFACE
    output reg [DATA_WIDTH-1:0] m_axis_data = 1'b0,
    output reg m_axis_valid = 1'b0,
    input  wire m_axis_ready,
    output reg m_axis_last = 1'b0
);

    property p_limit;
        // m_axis_data is never greater than limit
        @(posedge clk) disable iff (!rst_n)
            (m_axis_valid && m_axis_ready) |-> (m_axis_data <= limit);
    endproperty
    a_limit: assert property (p_limit)
        else $error("m_axis_data is greater than limit");

endmodule
