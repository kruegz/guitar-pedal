`timescale 1ns / 1ps

// fpga4student.com: FPGA projects, Verilog projects, VHDL projects
// FPGA tutorial: seven-segment LED display controller on Basys  3 FPGA
module Seven_segment_LED_Display_Controller(
    input wire clk, // 100 Mhz clock source on Basys 3 FPGA
    input wire reset, // reset
    input wire [15:0] n, // number to be displayed
    output reg [3:0] Anode_Activate, // anode signals of the 7-segment LED display
    output reg [6:0] LED_out// cathode patterns of the 7-segment LED display
    );

    reg [19:0] refresh_counter; // 20-bit for creating 10.5ms refresh period or 380Hz refresh rate
    
    // the first 2 MSB bits for creating 4 LED-activating signals with 2.6ms digit period
    wire [1:0] LED_activating_counter; 
    
    always @(posedge clk or posedge reset)
    begin 
        if(reset==1)
            refresh_counter <= 0;
        else
            refresh_counter <= refresh_counter + 1;
    end 

    assign LED_activating_counter = refresh_counter[19:18];

    // anode activating signals for 4 LEDs, digit period of 2.6ms
    // decoder to generate anode signals 
    always @(*)
    begin
        case(LED_activating_counter)
        2'b00: begin
            Anode_Activate = 4'b1110; 
        end
        2'b01: begin
            Anode_Activate = 4'b1101; 
        end
        2'b10: begin
            Anode_Activate = 4'b1011; 
        end
        2'b11: begin
            Anode_Activate = 4'b0111; 
        end
        endcase
    end

    // Cathode patterns of the 7-segment LED display 
    always @(*)
    begin
        case(n[LED_activating_counter*4 +: 4])
        4'h0: LED_out = 7'b0000001; // "0"     
        4'h1: LED_out = 7'b1001111; // "1" 
        4'h2: LED_out = 7'b0010010; // "2" 
        4'h3: LED_out = 7'b0000110; // "3" 
        4'h4: LED_out = 7'b1001100; // "4" 
        4'h5: LED_out = 7'b0100100; // "5" 
        4'h6: LED_out = 7'b0100000; // "6" 
        4'h7: LED_out = 7'b0001111; // "7" 
        4'h8: LED_out = 7'b0000000; // "8"     
        4'h9: LED_out = 7'b0000100; // "9" 
        4'hA: LED_out = 7'b0001000; // "A"
        4'hB: LED_out = 7'b1100000; // "B"
        4'hC: LED_out = 7'b0110001; // "C"
        4'hD: LED_out = 7'b1000010; // "D"
        4'hE: LED_out = 7'b0110000; // "E"
        4'hF: LED_out = 7'b0111000; // "F"
        default: LED_out = 7'b0000000; // "0"
        endcase
    end

 endmodule