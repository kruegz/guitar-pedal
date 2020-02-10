`include "param_pkg.svh"

import param_pkg::*;

interface clip_filter_if;
  logic                    clock;  // Clock
  logic                  reset_n;  // Reset (active low)
  logic [DATA_WIDTH-1:0]   limit;  // Limit value
  logic 			    polarity;  // Polarity control (min or max limit)
  logic [DATA_WIDTH-1:0]      in;  // Input data
  logic [DATA_WIDTH-1:0]     out;  // Output data
endinterface

`include "uvm_macros.svh"

module clip_filter(clip_filter_if clip_filter_if0);
  
  import uvm_pkg::*;
  
  logic                    clock;  // Clock
  logic                  reset_n;  // Reset (active low)
  logic [DATA_WIDTH-1:0]   limit;  // Limit value
  logic 			    polarity;  // Polarity control (min or max limit)
  logic [DATA_WIDTH-1:0]      in;  // Input data
  logic [DATA_WIDTH-1:0]     out;  // Output data
  
  assign polarity = clip_filter_if0.polarity;
  assign limit = clip_filter_if0.limit;
  assign in = clip_filter_if0.in;
  assign clip_filter_if0.out = out;
    
  always @(posedge clip_filter_if0.clock)
  
    if (clip_filter_if0.reset_n != 0) begin
      
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
      
      `uvm_info("DUT", $sformatf("limit=0x%0h polarity=0x%0h in=0x%0h, out=0x%0h", limit, polarity, in, out), UVM_MEDIUM)
    end
endmodule
