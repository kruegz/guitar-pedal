`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/17/2020 10:08:42 PM
// Design Name: 
// Module Name: testbench
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


module testbench #(
	parameter NUMBER_OF_SWITCHES = 4,
	parameter RESET_POLARITY = 0,
	parameter CLK_HALF_PERIOD = 5,
    parameter TIMEOUT = 10000,
	parameter DATA_WIDTH = 24
	) ();
    
    reg       clk;
    reg [NUMBER_OF_SWITCHES-1:0] sw;
    reg       reset;
    wire rst_n;
    assign rst_n = !reset;
    
    reg tx_mclk;
    reg tx_lrck;
    reg tx_sclk;
    reg tx_data;
    reg rx_mclk;
    reg rx_lrck;
    reg rx_sclk;
    reg rx_data;
    
    reg [3:0] Anode_Activate; // anode signals of the 7-segment LED display
    reg [6:0] LED_out;// cathode patterns of the 7-segment LED display
    
    //AXIS SLAVE INTERFACE
    reg [DATA_WIDTH-1:0] s_axis_data = 0;
    reg s_axis_valid;
    wire s_axis_ready;
    reg s_axis_last = 0;
    
    // AXIS MASTER INTERFACE
    reg [DATA_WIDTH-1:0] m_axis_data;
    reg m_axis_valid;
    wire m_axis_ready;
    reg m_axis_last;
    
    reg packet_done = 0;   
    reg [1:0] cnt = 0;        
           
                                        
    always @(posedge clk) begin
        if (s_axis_ready) begin
            s_axis_data <= s_axis_data + 1; 
            s_axis_valid <= 1;
            if (cnt == 2'b0) begin
                s_axis_last <= 1;
            end else begin
                s_axis_last <= 0;
            end
            cnt <= cnt + 1;
//            packet_done <= (cnt == 2'b0);
            //packet_done <= 0;
        end else begin
            s_axis_valid <= 1;
            cnt <= 0;
        end        
    end                                 
    
    assign m_axis_ready = 1;
    
    
//    top top0(.*);
    axis_volume_controller avc0(.*);
    
    always begin
        #CLK_HALF_PERIOD;
        // #1;
        clk = !clk; 
    end
    always @(posedge clk) begin
        rx_data = !rx_data;
    end

    initial begin
        #TIMEOUT;
        $finish;
    end
    
    initial begin
        $monitor("%h %h %h", clk, reset, sw);
        reset = 1;
        sw = 4'b0011;
        clk = 0;
        rx_data = 0;
        #100ns;
        reset = 0;
        #1000ns;
        sw = 4'b1111;
    end
    
endmodule
