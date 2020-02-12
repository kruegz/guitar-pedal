package my_testbench_pkg;
  import uvm_pkg::*;
  import param_pkg::*; 
  // The UVM sequence, transaction item, and driver are in these files:
  `include "my_sequence.svh"
  `include "my_driver.svh"
  
  // The agent contains sequencer, driver, and monitor (not included)
  class my_agent extends uvm_agent;
    `uvm_component_utils(my_agent)
    
    my_driver driver;
    uvm_sequencer#(my_transaction) sequencer;
    
    function new(string name, uvm_component parent);
      super.new(name, parent);
    endfunction
    
    function void build_phase(uvm_phase phase);
      driver = my_driver ::type_id::create("driver", this);
      sequencer =
        uvm_sequencer#(my_transaction)::type_id::create("sequencer", this);
    endfunction    
    
    // In UVM connect phase, we connect the sequencer to the driver.
    function void connect_phase(uvm_phase phase);
      driver.seq_item_port.connect(sequencer.seq_item_export);
    endfunction
    
    task run_phase(uvm_phase phase);
      // We raise objection to keep the test from completing
      phase.raise_objection(this);
      begin
        my_sequence seq;
        seq = my_sequence::type_id::create("seq");
        seq.start(sequencer);
      end
      // We drop objection to allow the test to complete
      phase.drop_objection(this);
    endtask

  endclass
  
  class my_env extends uvm_env;
    `uvm_component_utils(my_env)
    
    my_agent agent;

    function new(string name, uvm_component parent);
      super.new(name, parent);
    endfunction
    
    function void build_phase(uvm_phase phase);
      agent = my_agent::type_id::create("agent", this);
    endfunction

  endclass
  
  class my_test extends uvm_test;
    `uvm_component_utils(my_test)
    
    string report_id = "MY_TEST";
    
    my_env env;

    function new(string name, uvm_component parent);
      super.new(name, parent);
    endfunction
    
    function void build_phase(uvm_phase phase);
      `uvm_info(report_id, "build_phase begin", UVM_LOW)
      env = my_env::type_id::create("env", this);
      `uvm_info(report_id, "build_phase end", UVM_LOW)
    endfunction
    
    task run_phase(uvm_phase phase);
      `uvm_info(report_id, "run_phase begin", UVM_LOW)
      // We raise objection to keep the test from completing
      phase.raise_objection(this);
      #10;
      // We drop objection to allow the test to complete
      phase.drop_objection(this);
      `uvm_info(report_id, "run_phase end", UVM_LOW)
    endtask

  endclass
  
endpackage