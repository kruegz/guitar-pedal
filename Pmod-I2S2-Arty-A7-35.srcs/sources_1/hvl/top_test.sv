
import uvm_pkg::*;
`include "uvm_macros.svh"
`include "clk_rst_bfm.sv"
`include "axis_agent.sv"

class top_test extends uvm_test;
 
    `uvm_component_utils(top_test)

    string report_id = "top_test";

    virtual top_if top_vip;

    clk_rst_driver clk_rst_driver_h;
    axis_driver axis_driver_h;
 
    function new(string name = "top_test",uvm_component parent=null);
        super.new(name,parent);
        clk_rst_driver_h = new("clk_rst_driver_h", this);
        axis_driver_h = new("axis_driver_h", this);
    endfunction : new
 
    virtual function void build_phase(uvm_phase phase);
        `uvm_info(report_id, "build_phase begin", UVM_LOW)
        super.build_phase(phase);
        uvm_config_db#(virtual top_if)::get(this, "", "top_if", top_vip);
        uvm_config_db#(virtual top_if)::set(this, "clk_rst_driver_h", "top_vif", top_vip);
        uvm_config_db#(virtual top_if)::set(this, "axis_driver_h", "top_vif", top_vip);
        `uvm_info(report_id, "build_phase begin", UVM_LOW)
    endfunction : build_phase

    task reset_phase(uvm_phase phase);
        phase.raise_objection(this);
        `uvm_info(report_id, "reset_phase begin", UVM_LOW)


        clk_rst_driver_h.rst_delay = 10ns;
        clk_rst_driver_h.drive();

        `uvm_info(report_id, "reset_phase end", UVM_LOW)
        phase.drop_objection(this);
    endtask : reset_phase 
 
    task main_phase(uvm_phase phase);
        phase.raise_objection(this);
        `uvm_info(report_id, "main_phase begin", UVM_LOW)

        top_vip.sw = 'h100;
        top_vip.rx_data = 0;
        top_vip.btnU <= 0;
        top_vip.btnL <= 0;
        top_vip.btnR <= 0;
        top_vip.btnD <= 0;
        top_vip.btnC <= 0;

        top_vip.btnU <= 1;
        repeat (1) @(posedge top_vip.clk);
        top_vip.btnU <= 0;
        repeat (1) @(posedge top_vip.clk);
        top_vip.btnU <= 1;
        repeat (1) @(posedge top_vip.clk);
        top_vip.btnU <= 0;
        top_vip.btnD <= 1;
        repeat (5) @(posedge top_vip.clk);
        top_vip.btnD <= 0;
        top_vip.btnC <= 1;
        repeat (5) @(posedge top_vip.clk);
        top_vip.btnC <= 0;

        repeat (100) @(posedge top_vip.clk);

        `uvm_info(report_id, "main_phase end", UVM_LOW)
        phase.drop_objection(this);
    endtask : main_phase 
 
endclass : top_test