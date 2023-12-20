`timescale 1ns / 1ps
`default_nettype none

module axis_audio_controller #(
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
    // assign limit = sw_sync[SWITCH_WIDTH-1:0];

    reg [DATA_WIDTH-1:0] cnt;
    reg signed [15:0] phase; // Fixed point XXX.XXXXXXXXXXXX Range: (-3.14,3.14)
    wire [31:0] cordic_out; // {COS, SIN}
    wire [15:0] sin; // Fixed point XX.XXXXXXXXXXXXXX Range: (-1,1)
    wire [15:0] cos; // Fixed point XX.XXXXXXXXXXXXXX Range: (-1,1)
    wire cordic_out_vld;

    localparam PI = 16'sb011_0010010000000; // 3.14
    localparam NEG_PI = 16'sb100_1101110000000; // -3.14
    localparam TWO_PI = 16'sb110_0100100000000; // 6.28

    localparam INCREMENT = 16'sb000_0000000000001; // 0.01
    // 0.000000000000010011
    // localparam STEPS = TWO_PI / INCREMENT; 
    
    cordic_0 cordic0_0(clk, 1, phase, cordic_out_vld, cordic_out);

    assign sin = cordic_out[15:0];
    assign cos = cordic_out[31:16];

    // clk = 22.591 MHz
    // C4 = 261.63 Hz
    // steps = clk / C4 = 22.591 MHz / 261.63 Hz = 86347
    // increment = 2 * PI / steps = 0.000000000000010011

    reg [15:0] phase_delay = 86;

    always@(posedge clk) begin
    
        if (rst_n) begin
            cnt <= cnt + 1;

            if (cnt >= freq) begin
                phase <= phase + 1;
                cnt <= 0;
            end

            if (phase >= PI) begin // 3.14
                phase <= NEG_PI; // -3.14
            end
                
            s_new_packet_r <= s_new_packet;
            s_new_packet_r_q <= s_new_packet_r;
            
        end else begin
            // Reset
            phase <= NEG_PI;
            cnt <= 0;
        end
    end

    assign data_out = sin << 8;
    
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
            // m_axis_data = (data[m_select][DATA_WIDTH-1:0] > limit) ? limit : data[m_select][DATA_WIDTH-1:0];
            // m_axis_data = data[m_select][DATA_WIDTH-1:0];

            // m_axis_data = data_out;
            m_axis_data = (data_out > limit) ? limit : data_out;
        else
            m_axis_data = 'b0;
            
    always@(posedge clk)
        if (s_new_packet == 1'b1)
            s_axis_ready <= 1'b0;
        else if (m_new_packet == 1'b1)
            s_axis_ready <= 1'b1;
endmodule
