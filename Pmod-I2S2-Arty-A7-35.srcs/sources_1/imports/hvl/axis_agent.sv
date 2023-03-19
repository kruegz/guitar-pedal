
`include "uvm_macros.svh"

class axis_item extends uvm_sequence_item;
    //Control Information
    // typedef enum axis_type_t { CLK, RST } axis_type;

    //Utility and Field macros,
    `uvm_object_utils_begin(axis_item)
    // `uvm_field_enum(axis_type_t,axis_type,UVM_ALL_ON)
    `uvm_object_utils_end

    //Constructor
    function new(string name = "axis_item");
    super.new(name);
    endfunction

endclass

class axis_driver extends uvm_driver #(axis_item);

    string report_id = "axis_driver";    
 
    // Virtual Interface
    virtual top_if top_vif;
 
    `uvm_component_utils(axis_driver)
         
    // Constructor
    function new (string name, uvm_component parent);
        super.new(name, parent);
    endfunction : new
 
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        if(!uvm_config_db#(virtual top_if)::get(this, "", "top_vif", top_vif))
            `uvm_fatal("NO_VIF", {"virtual interface must be set for: ", get_full_name(), ".top_vif"});
    endfunction: build_phase
 
    // run phase
    virtual task run_phase(uvm_phase phase);
        bit rand_bit;
        // forever begin
        // seq_item_port.get_next_item(req);
        // respond_to_transfer(req);
        // drive();
        // seq_item_port.item_done();
        // end
        fork
            forever begin 
                @(posedge top_vif.clk);
                rand_bit = $urandom_range(0, 1); 
                `uvm_info(report_id, $sformatf("driving %0d", rand_bit), UVM_LOW)
                top_vif.rx_data <= rand_bit;
            end
            forever begin 
                @(top_vif.clk);
                // top_vif.rx_mclk <= top_vif.clk;
                // top_vif.rx_lclk <= top_vif.clk;
                // top_vif.rx_lclk <= top_vif.clk;
            end
        join
    endtask : run_phase
 
endclass : axis_driver