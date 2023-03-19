
`include "uvm_macros.svh"

class clk_rst_item extends uvm_sequence_item;
    //Control Information
    // typedef enum clk_rst_type_t { CLK, RST } clk_rst_type;

    //Utility and Field macros,
    `uvm_object_utils_begin(clk_rst_item)
    // `uvm_field_enum(clk_rst_type_t,clk_rst_type,UVM_ALL_ON)
    `uvm_object_utils_end

    //Constructor
    function new(string name = "clk_rst_item");
    super.new(name);
    endfunction

endclass

class clk_rst_driver extends uvm_driver #(clk_rst_item);

    string report_id = "clk_rst_driver";    
 
    // Virtual Interface
    virtual top_if top_vif;

    realtime clk_period = 1ns;
    realtime rst_delay = 5ns;
 
    `uvm_component_utils(clk_rst_driver)
         
    // Constructor
    function new (string name, uvm_component parent);
        super.new(name, parent);
    endfunction : new
 
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
         if(!uvm_config_db#(virtual top_if)::get(this, "", "top_vif", top_vif))
             `uvm_fatal("NO_VIF",{"virtual interface must be set for: ",get_full_name(),".top_vif"});
    endfunction: build_phase
 
    // run phase
    virtual task run_phase(uvm_phase phase);
        // forever begin
        // seq_item_port.get_next_item(req);
        // respond_to_transfer(req);
        // drive();
        // seq_item_port.item_done();
        // end
    endtask : run_phase
 
    // drive
    virtual task drive();
        `uvm_info(report_id, "begin drive", UVM_LOW)
        top_vif.clk <= 0;
        top_vif.reset <= 1;
        fork forever begin
            #(clk_period);
            top_vif.clk <= ~top_vif.clk;
        end begin
            #(rst_delay);
            top_vif.reset <= 0;
        end
        join_none
        `uvm_info(report_id, "end drive", UVM_LOW)
    endtask : drive
 
endclass : clk_rst_driver