class my_driver extends uvm_driver #(my_transaction);

  `uvm_component_utils(my_driver)
  
  import param_pkg::*;
  
  parameter RESET_CLKS = 5;
  parameter DISABLE_CLKS = 5;

  virtual effect_controller_if effect_controller_vif;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    // Get interface reference from config database
    if(!uvm_config_db#(virtual effect_controller_if)::get(this, "", "effect_controller_if", effect_controller_vif)) begin
      `uvm_error("", "uvm_config_db::get failed")
    end
  endfunction 

  task run_phase(uvm_phase phase);
    // First toggle reset
    effect_controller_vif.reset_n = 0;
    repeat(RESET_CLKS) @(posedge effect_controller_vif.clock);
    #1;
    effect_controller_vif.reset_n = 1;
    
    // Now drive normal traffic
    forever begin
      seq_item_port.get_next_item(req);

      // Wiggle pins of DUT
      
      //effect_controller_vif.limit = req.limit;
      //effect_controller_vif.polarity = req.polarity;
      effect_controller_vif.enable = 0;
      
      repeat(DISABLE_CLKS) @(posedge effect_controller_vif.clock);
      
      effect_controller_vif.enable = 1;
      effect_controller_vif.instruction = req.instruction;
      
      for (int i=0; i < req.in.size(); i++) @(posedge effect_controller_vif.clock) begin
        effect_controller_vif.in = req.in[i];
      end

      seq_item_port.item_done();
    end
  endtask

endclass: my_driver
