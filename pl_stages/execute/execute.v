`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 12/27/2024 11:59:53 AM
// Design Name:
// Module Name: execute
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


module execute #(
    parameter DATA_WIDTH = 32
    )(
    input reg_write_e,
    input [1:0] res_src_e,
    input mem_write_e, jump_e, branch_e,
    input [3:0] alu_control_e,
    input alu_src_b_e, alu_src_a_e,
    input [DATA_WIDTH-1:0] rd1_e, rd2_e,
    input [ADDRESS_WIDTH-1:0] pc_e,
    input [4:0] rs1_e, rs2_e, rd_e,
    input [DATA_WIDTH-1:0] imm_val_e,
    input [ADDRESS_WIDTH-1:0] pc_plus4_e
);

wire [DATA_WIDTH-1:0] a_mux_res, b_mux_res;
mux3 a_forward_mux(
    .in1(),
    .in2(),
    .in3(),
    .sel(),
    .out(),
);
mux3 b_forward_mux(
    .in1(),
    .in2(),
    .in3(),
    .sel(),
    .out(),
);

mux2 a_src_mux(
    .in1(),
    .in2(),
    .sel(),
    .out(),
);

mux2 b_src_mux(
    .in1(),
    .in2(),
    .sel(),
    .out()
);
mux2 pc_target_mux(
    .in1(),
    .in2(),
    .sel(),
    .out()
);

adder pc_target_adder(
);

alu main_alu(
);

endmodule
