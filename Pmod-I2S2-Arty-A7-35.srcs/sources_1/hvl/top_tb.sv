`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/17/2020 10:08:42 PM
// Design Name: 
// Module Name: top_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
import uvm_pkg::*;
`include "uvm_macros.svh"
`include "top_test.sv"

interface top_if #(
	parameter SWITCH_WIDTH = 15,
	parameter DATA_WIDTH = 24
	);
    logic clk; // 100 Mhz clock source on Basys 3 FPGA 
    logic [SWITCH_WIDTH-1:0] sw; // Switches
    logic btnC; // Center button
    logic btnU; // Up button
    logic btnL; // Left button
    logic btnR; // Right button
    logic btnD; // Down button
    logic reset; // R2
    logic tx_mclk;
    logic tx_lrck;
    logic tx_sclk;
    logic tx_data;
    logic rx_mclk;
    logic rx_lrck;
    logic rx_sclk;
    logic rx_data;
    logic [3:0] Anode_Activate; // anode signals of the 7-segment LED display
    logic [6:0] LED_out; // cathode patterns of the 7-segment LED display
endinterface

module top_tb #(
    parameter SWITCH_WIDTH = 15,
	parameter DATA_WIDTH = 24
    ) ();

    top_if #(
        .SWITCH_WIDTH(SWITCH_WIDTH),
        .DATA_WIDTH(DATA_WIDTH)
    ) top_if0(.*); 

    top #(
        .SWITCH_WIDTH(SWITCH_WIDTH),
        .DATA_WIDTH(DATA_WIDTH)
    ) top0 (
        .clk               (top_if0.clk),
        .sw                (top_if0.sw),
        .btnC              (top_if0.btnC),
        .btnU              (top_if0.btnU),
        .btnL              (top_if0.btnL),
        .btnR              (top_if0.btnR),
        .btnD              (top_if0.btnD),
        .reset             (top_if0.reset),
        .tx_mclk           (top_if0.tx_mclk),
        .tx_lrck           (top_if0.tx_lrck),
        .tx_sclk           (top_if0.tx_sclk),
        .tx_data           (top_if0.tx_data),
        .rx_mclk           (top_if0.rx_mclk),
        .rx_lrck           (top_if0.rx_lrck),
        .rx_sclk           (top_if0.rx_sclk),
        .rx_data           (top_if0.rx_data),
        .Anode_Activate    (top_if0.Anode_Activate),
        .LED_out           (top_if0.LED_out)
    );
    
    initial begin
        $dumpfile("waves.vcd");
        $dumpvars(0,top_tb);
        uvm_config_db#(virtual top_if)::set(uvm_root::get(),"*","top_if",top_if0);
        run_test("top_test");
    end
    
endmodule
