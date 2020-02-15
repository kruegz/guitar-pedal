`include "param_pkg.svh"

import param_pkg::*;

interface limiter_if;
    logic                    clock;  // Clock
    logic                  reset_n;  // Reset (active low)
    logic                   enable;  // Enable
    logic [DATA_WIDTH-1:0]   limit;  // Limit value
    logic                 polarity;  // Polarity control (min or max limit)
    logic [DATA_WIDTH-1:0]      in;  // Input data
    logic [DATA_WIDTH-1:0]     out;  // Output data
endinterface

`include "uvm_macros.svh"

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
module limiter(limiter_if limiter_if0);
    
    import uvm_pkg::*;
    
    wire                    clock;  // Clock
    wire                  reset_n;  // Reset (active low)
    wire                   enable;  // Enable
    wire [DATA_WIDTH-1:0]   limit;  // Limit value
    wire                 polarity;  // Polarity control (min or max limit)
    wire [DATA_WIDTH-1:0]      in;  // Input data
    logic [DATA_WIDTH-1:0]     out;  // Output data
    
    // Combinational logic  
    
    assign clock    = limiter_if0.clock;
    assign reset_n  = limiter_if0.reset_n;
    assign enable   = limiter_if0.enable;
    assign limit    = limiter_if0.limit;
    assign polarity = limiter_if0.polarity;
    assign in       = limiter_if0.in;

    assign limiter_if0.out = out;
        
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
            
            `uvm_info("DUT", $sformatf("limit=0x%0h polarity=0x%0h in=0x%0h, out=0x%0h", limit, polarity, in, out), UVM_MEDIUM)
        end
    
endmodule

interface scaler_if;
    logic                        clock;  // Clock
    logic                      reset_n;  // Reset (active low)
    logic                       enable;  // Enable
    logic [DATA_WIDTH-1:0] coefficient;  // Scaling factor
    logic                     polarity;  // Polarity control (min or max limit)
    logic [DATA_WIDTH-1:0]          in;  // Input data
    logic [DATA_WIDTH-1:0]         out;  // Output data
endinterface

// Module: scaler
// Constant factor scaling filter
//
// Parameters:
//      clock - clock
//    reset_n - active low reset
//    coefficient - scaling factor
//    polarity - 0 -> positive, 1 -> negative
//    in - input data
//    out - output data
module scaler(scaler_if scaler_if0);
    
    import uvm_pkg::*;
    
    wire                        clock;  // clock
    wire                      reset_n;  // reset (active low)
    wire                       enable;  // enable
    wire [DATA_WIDTH-1:0] coefficient;  // Scaling factor
    wire                     polarity;  // Polarity control (min or max limit)
    wire [DATA_WIDTH-1:0]          in;  // Input data
    logic [DATA_WIDTH-1:0]         out;  // Output data
    
    // Combinational logic  
    
    assign clock       = scaler_if0.clock;
    assign reset_n     = scaler_if0.reset_n;
    assign enable      = scaler_if0.enable;
    assign coefficient = scaler_if0.coefficient;
    assign polarity    = scaler_if0.polarity;
    assign in          = scaler_if0.in;

    assign scaler_if0.out = out;
        
    always @(posedge clock)
    
        if (reset_n != 0) begin
            
            if (enable == 1) begin
                
                if (polarity == 0) begin

                    // Positive polarity
                    out <= in * coefficient;

                end else begin

                    // Negative polarity
                    out <= in * -coefficient;

                end
                
            end
            
            `uvm_info("DUT", $sformatf("coefficient=0x%0h polarity=0x%0h in=0x%0h, out=0x%0h", coefficient, polarity, in, out), UVM_MEDIUM)
        end
    
endmodule


interface effect_controller_if;
    logic                         clock;  // Clock
    logic                       reset_n;  // Reset (active low)
    logic                        enable;  // Enable
    logic [INSTR_WIDTH-1:0] instruction;  // Controller instruction
    logic [DATA_WIDTH-1:0]           in;  // Input data
    logic [DATA_WIDTH-1:0]          out;  // Output data
endinterface

module effect_controller(effect_controller_if effect_controller_if0);

    wire                         clock;  // clock
    wire                       reset_n;  // reset (active low)
    wire                        enable;  // enable
    wire [INSTR_WIDTH-1:0] instruction;  // Controller instruction
    wire [DATA_WIDTH-1:0]           in;  // Input data
    logic [DATA_WIDTH-1:0]          out;  // Output data

    wire [DATA_WIDTH-1:0]      opcode;  // Controller opcode
    wire [DATA_WIDTH-1:0] coefficient;  // Scaling factor
    wire                     polarity;  // Polarity control (min or max limit)
    wire [DATA_WIDTH-1:0]       limit;  // Limit value
    
    // Combinational
    assign clock = effect_controller_if0.clock;
    assign reset_n = effect_controller_if0.reset_n;
    assign enable = effect_controller_if0.enable;
    assign instruction = effect_controller_if0.instruction;
    assign in = effect_controller_if0.in;

    assign opcode = instruction[0 +: DATA_WIDTH];
    assign coefficient = instruction[DATA_WIDTH +: DATA_WIDTH];
    assign polarity = instruction[2*DATA_WIDTH +: 1];
    assign limit = instruction[DATA_WIDTH +: DATA_WIDTH];

    assign effect_controller_if0.out = out;
  
  	assign limiter_if0.clock = clock;
    assign limiter_if0.reset_n = reset_n;
  	assign limiter_if0.enable = enable;
  	assign limiter_if0.limit = limit;
  	assign limiter_if0.polarity = polarity;
    assign limiter_if0.in = in;
  
    limiter_if limiter_if0(.*);
    limiter limiter0(.*);
    
  	assign scaler_if0.clock = clock;
    assign scaler_if0.reset_n = reset_n;
  	assign scaler_if0.enable = enable;
  	assign scaler_if0.coefficient = coefficient;
  	assign scaler_if0.polarity = polarity;
    assign scaler_if0.in = in;
  
    scaler_if scaler_if0(.*);
    scaler scaler0(.*);
  
    // Sequential
    always @(posedge clock) begin
        if (opcode == LIMITER) begin
            out <= limiter_if0.out;
        end else if (opcode == SCALER) begin
            out <= scaler_if0.out;
        end else begin
            out <= '0;
        end
    end
    
endmodule