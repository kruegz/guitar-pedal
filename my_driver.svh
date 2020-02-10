class my_driver extends uvm_driver #(my_transaction);

  `uvm_component_utils(my_driver)

  virtual clip_filter_if clip_filter_vif;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    // Get interface reference from config database
    if(!uvm_config_db#(virtual clip_filter_if)::get(this, "", "clip_filter_if", clip_filter_vif)) begin
      `uvm_error("", "uvm_config_db::get failed")
    end
  endfunction 

  task run_phase(uvm_phase phase);
    // First toggle reset
    clip_filter_vif.reset_n = 0;
    @(posedge clip_filter_vif.clock);
    #1;
    clip_filter_vif.reset_n = 1;
    
    // Now drive normal traffic
    forever begin
      seq_item_port.get_next_item(req);

      // Wiggle pins of DUT
      
      clip_filter_vif.limit = req.limit;
      clip_filter_vif.polarity = req.polarity;
      
      for (int i=0; i < req.in.size(); i++) @(posedge clip_filter_vif.clock) begin
        clip_filter_vif.in = req.in[i];
      end

      seq_item_port.item_done();
    end
  endtask

endclass: my_driver
