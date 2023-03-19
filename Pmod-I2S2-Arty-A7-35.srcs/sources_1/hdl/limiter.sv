`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2020 08:04:12 PM
// Design Name: 
// Module Name: limiter
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


// Module: limiter
// Limit filter
//
// Parameters:
//      clock - clock
//    reset_n - active low reset
//    limit - limit value
//    polarity - 0 -> max clip, 1 -> min clip
//    in - input data
//    out - output data

//parameter DATA_WIDTH = 24;

//interface limiter_if;
//    logic                    clock;  // Clock
//    logic                  reset_n;  // Reset (active low)
//    logic                   enable;  // Enable
//    logic [DATA_WIDTH-1:0]   limit;  // Limit value
//    logic                 polarity;  // Polarity control (min or max limit)
//    logic [DATA_WIDTH-1:0]      in;  // Input data
//    logic [DATA_WIDTH-1:0]     out;  // Output data
//endinterface

//module limiter(limiter_if limiter_if0);

    
    //import uvm_pkg::*;
    
//    wire                    clock;  // Clock
//    wire                  reset_n;  // Reset (active low)
//    wire                   enable;  // Enable
//    wire [DATA_WIDTH-1:0]   limit;  // Limit value
//    wire                 polarity;  // Polarity control (min or max limit)
//    wire [DATA_WIDTH-1:0]      in;  // Input data
//    logic [DATA_WIDTH-1:0]     out;  // Output data
 
module limiter #(
    parameter DATA_WIDTH = 24
)(  

    input wire                    clock,  // Clock
    input wire                  reset_n,  // Reset (active low)
    input wire                   enable,  // Enable
    input wire [DATA_WIDTH-1:0]   limit,  // Limit value
    input wire                 polarity,  // Polarity control (min or max limit)
    input wire [DATA_WIDTH-1:0]      in,  // Input data
    output reg [DATA_WIDTH-1:0]     out  // Output data
    
    );
    // Combinational logic  
    
//    assign clock    = limiter_if0.clock;
//    assign reset_n  = limiter_if0.reset_n;
//    assign enable   = limiter_if0.enable;
//    assign limit    = limiter_if0.limit;
//    assign polarity = limiter_if0.polarity;
//    assign in       = limiter_if0.in;

//    assign limiter_if0.out = out;
        
    always @(posedge clock)
    
        if (reset_n != 0) begin
            
            if (enable == 1) begin
                if (polarity == 0) begin

                    // Minimum limit
                    if (in > limit) begin
                        // Pass
                        out <= in;

                    end else begin
                        // Limit
                        out <= limit;

                    end

                end else begin

                    // Maximum limit
                    if (in < limit) begin

                        out <= in;
                    end else begin
                        // Limit
                        out <= limit;
                    end

                end
            end
            
            //`uvm_info("LIMITER", $sformatf("limit=0x%0h polarity=0x%0h in=0x%0h, out=0x%0h", limit, polarity, in, out), UVM_MEDIUM)
        end
    
endmodule
