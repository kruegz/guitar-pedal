/*******************************************
This is a basic UVM "Hello World" testbench.

Explanation of this testbench on YouTube:
https://www.youtube.com/watch?v=Qn6SvG-Kya0
*******************************************/

`include "uvm_macros.svh"
`include "my_testbench_pkg.svh"


// The top module that contains the DUT and interface.
// This module starts the test.
module top;
  import uvm_pkg::*;
  import my_testbench_pkg::*;
  
  // Instantiate the interface
  clip_filter_if clip_filter_if0();
  
  // Instantiate the DUT and connect it to the interface
  clip_filter clip_filter0(.clip_filter_if0(clip_filter_if0));
  
  // Clock generator
  initial begin
    clip_filter_if0.clock = 0;
    forever #5 clip_filter_if0.clock = ~clip_filter_if0.clock;
  end
  
  initial begin
    // Place the interface into the UVM configuration database
    uvm_config_db#(virtual clip_filter_if)::set(null, "*", "clip_filter_if", clip_filter_if0);
    // Start the test
    run_test("my_test");
  end
  
  // Dump waves
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, top);
  end
  
endmodule
