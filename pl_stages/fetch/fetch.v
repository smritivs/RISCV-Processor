`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 12/27/2024 11:59:53 AM
// Design Name:
// Module Name: fetch
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

module fetch #(
    parameter DATA_WIDTH=32,
    parameter ADDRESS_WIDTH=32
    )(
    input clk, stall_f,
    input [1:0] pc_src_e,
    input [ADDRESS_WIDTH-1:0] pc_target_e,
    output [ADDRESS_WIDTH-1:0] pc, pc_plus4,
    output [DATA_WIDTH-1:0] instr
);

wire [31:0] pcf, pc_plus4f, pc_mux_res;

ff pc_ff(.clk(clk),.rst(stall_f),.din(pc_mux_res),.dout(pcf));

adder pc_plus4_adder(.a(pc),.b(32'd4),.res(pc_plus4));

mux3 pc_mux(.in1(pc),.in2(pc_target),.in3(32'd0),.sel(pc_src_e),.out(pc_mux_res));

instr_mem i_mem(.instr_addr(pcf),.instr(instr));

endmodule
