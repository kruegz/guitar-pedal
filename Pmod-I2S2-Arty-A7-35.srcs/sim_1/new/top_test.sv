
import uvm_pkg::*;
`include "uvm_macros.svh"

class top_test extends uvm_test;
 
    `uvm_component_utils(top_test)

    string report_id = "top_test";

    virtual top_if top_if0;
 
    function new(string name = "top_test",uvm_component parent=null);
        super.new(name,parent);
    endfunction : new
 
    virtual function void build_phase(uvm_phase phase);
        `uvm_info(report_id, "build_phase begin", UVM_LOW)
        super.build_phase(phase);
        uvm_config_db#(virtual top_if)::get(this, "", "top_if", top_if0);
        `uvm_info(report_id, "build_phase begin", UVM_LOW)
    endfunction : build_phase

    task reset_phase(uvm_phase phase);
        phase.raise_objection(this);
        `uvm_info(report_id, "reset_phase begin", UVM_LOW)
        top_if0.reset = 1;
        top_if0.clk = 1;
        // Start clock
        fork
            forever begin
                #1;
                top_if0.clk = !top_if0.clk; 
            end
        join_none

        // Issue reset
        top_if0.reset = 1;
        repeat (5) @(posedge top_if0.clk);
        top_if0.reset = 0;
        repeat (1) @(posedge top_if0.clk);

        `uvm_info(report_id, "reset_phase end", UVM_LOW)
        phase.drop_objection(this);
    endtask : reset_phase 
 
    task main_phase(uvm_phase phase);
        phase.raise_objection(this);
        `uvm_info(report_id, "main_phase begin", UVM_LOW)
        top_if0.sw = 'h100;
        top_if0.rx_data = 0;
        top_if0.btnU <= 0;
        top_if0.btnL <= 0;
        top_if0.btnR <= 0;
        top_if0.btnD <= 0;
        top_if0.btnC <= 0;

        top_if0.btnU <= 1;
        repeat (1) @(posedge top_if0.clk);
        top_if0.btnU <= 0;
        repeat (1) @(posedge top_if0.clk);
        top_if0.btnU <= 1;
        repeat (1) @(posedge top_if0.clk);
        top_if0.btnU <= 0;
        top_if0.btnD <= 1;
        repeat (5) @(posedge top_if0.clk);
        top_if0.btnD <= 0;
        top_if0.btnC <= 1;
        repeat (5) @(posedge top_if0.clk);
        top_if0.btnC <= 0;
        `uvm_info(report_id, "main_phase end", UVM_LOW)
        phase.drop_objection(this);
    endtask : main_phase 
 
endclass : top_test