`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Company: Digilent
// Engineer: Arthur Brown
// 
// Create Date: 03/23/2018 01:23:15 PM
// Module Name: axis_volume_controller
// Description: AXI-Stream volume controller intended for use with AXI Stream Pmod I2S2 controller.
//              Whenever a 2-word packet is received on the slave interface, it is multiplied by 
//              the value of the switches, taken to represent the range 0.0:1.0, then sent over the
//              master interface. Reception of data on the slave interface is halted while processing and
//              transfer is taking place.
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module axis_volume_controller #(
    parameter SWITCH_WIDTH = 4, // WARNING: this module has not been tested with other values of SWITCH_WIDTH, it will likely need some changes
    parameter DATA_WIDTH = 24
) (
    input wire clk,
    input wire rst_n,
    input wire [SWITCH_WIDTH-1:0] sw,
    
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
    localparam MULTIPLIER_WIDTH = 24;
    reg [MULTIPLIER_WIDTH+DATA_WIDTH-1:0] data [1:0];
    reg [MULTIPLIER_WIDTH+DATA_WIDTH-1:0] limit_data [1:0];
        
    reg [SWITCH_WIDTH-1:0] sw_sync_r [2:0];
    wire [SWITCH_WIDTH-1:0] sw_sync = sw_sync_r[2];
//    wire [SWITCH_WIDTH:0] m = {1'b0, sw_sync} + 1;
    reg [MULTIPLIER_WIDTH:0] multiplier = 'b0; // range of 0x00:0x10 for width=4
    
    wire m_select = m_axis_last;
    wire m_new_word = (m_axis_valid == 1'b1 && m_axis_ready == 1'b1) ? 1'b1 : 1'b0;
    wire m_new_packet = (m_new_word == 1'b1 && m_axis_last == 1'b1) ? 1'b1 : 1'b0;
    
    wire s_select = s_axis_last;
    wire s_new_word = (s_axis_valid == 1'b1 && s_axis_ready == 1'b1) ? 1'b1 : 1'b0;
    wire s_new_packet = (s_new_word == 1'b1 && s_axis_last == 1'b1) ? 1'b1 : 1'b0;
    reg s_new_packet_r = 1'b0;
    reg s_new_packet_r_q = 1'b0;
    
    wire [DATA_WIDTH-1:0] limit;
    wire [DATA_WIDTH-1:0] data_out;
    reg [DATA_WIDTH-1:0] m_axis_data_d;
    wire [DATA_WIDTH-1:0] m_axis_data_w;
    reg m_axis_valid_d;
    assign limit = sw_sync[SWITCH_WIDTH-1:0];
    
//    limiter_if limiter_if0();
    
//    assign limiter_if0.clock = clk;
//    assign limiter_if0.rst_n = rst_n;
//    assign limiter_if0.limit = limit;
//    assign limiter_if0.data_in = m_axis_data;
//    assign limiter_if0.data_out = data_out;
    
    limiter #(DATA_WIDTH) limiter0(clk, rst_n, 1, limit, 1, data[0], data_out);
    
//    always @(posedge clk) begin
//        m_axis_data <= m_axis_data_w;
//    end
    
    
    always@(posedge clk) begin
        sw_sync_r[2] <= sw_sync_r[1];
        sw_sync_r[1] <= sw_sync_r[0];
        sw_sync_r[0] <= sw;
        
        
//        if (&sw_sync == 1'b1)
//            multiplier <= {1'b1, {MULTIPLIER_WIDTH{1'b0}}};
//        else
            // multiplier <= {1'b0, sw, {MULTIPLIER_WIDTH-SWITCH_WIDTH{1'b0}}} + 1;
//            multiplier <= {sw_sync,{MULTIPLIER_WIDTH{1'b0}}} / {SWITCH_WIDTH{1'b1}};
            multiplier <= {sw_sync,{MULTIPLIER_WIDTH{1'b0}}} / {SWITCH_WIDTH{1'b1}};
            
        s_new_packet_r <= s_new_packet;
        s_new_packet_r_q <= s_new_packet_r;
        
//        m_axis_valid <= m_axis_valid_d;
        
        limit_data[0] <= data_out;
    end
    
    always@(posedge clk)
        if (s_new_word == 1'b1) // sign extend and register AXIS slave data
            data[s_select] <= {{MULTIPLIER_WIDTH{s_axis_data[DATA_WIDTH-1]}}, s_axis_data};
        else if (s_new_packet_r == 1'b1) begin
//            data[0] <= $signed(data[0]) * multiplier << 5; // core volume control algorithm, infers a DSP48 slice
//            data[1] <= $signed(data[1]) * multiplier << 5;
            
//            data[0] <= $signed(data[0]); // core volume control algorithm, infers a DSP48 slice
//            data[1] <= $signed(data[1]);
        end
        
    always@(posedge clk)
        if (s_new_packet_r == 1'b1)
            m_axis_valid <= 1'b1;
        else if (m_new_packet == 1'b1)
            m_axis_valid <= 1'b0;
            
    always@(posedge clk)
        if (m_new_packet == 1'b1)
            m_axis_last <= 1'b0;
        else if (m_new_word == 1'b1)
            m_axis_last <= 1'b1;
            
    always@(m_axis_valid, data[0], data[1], m_select)
        if (m_axis_valid == 1'b1)
            m_axis_data = (data[m_select][DATA_WIDTH-1:0] > limit) ? limit : data[m_select][DATA_WIDTH-1:0];
        else
            m_axis_data = 'b0;
            
    always@(posedge clk)
        if (s_new_packet == 1'b1)
            s_axis_ready <= 1'b0;
        else if (m_new_packet == 1'b1)
            s_axis_ready <= 1'b1;
endmodule
