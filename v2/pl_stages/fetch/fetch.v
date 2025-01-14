
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
    input pc_src_e,

    input [ADDRESS_WIDTH-1:0] pc_target_e,

    output [ADDRESS_WIDTH-1:0] pc_f, pc_plus4_f,
    output [DATA_WIDTH-1:0] instr
);

wire [31:0] pc, pc_plus4, pc_mux_res;

ff pc_ff(.clk(clk),.rst(stall_f),.din(pc_mux_res),.dout(pc));

adder pc_plus4_adder(.a(pc),.b(32'd4),.res(pc_plus4));

mux2 pc_mux(.in1(pc_plus4),.in2(pc_target_e),.sel(pc_src_e),.out(pc_mux_res));

instr_mem i_mem(.instr_addr(pc),.instr(instr));

assign pc_plus4_f = pc_plus4;

assign pc_f = pc;

endmodule
