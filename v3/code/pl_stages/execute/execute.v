
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
    parameter DATA_WIDTH = 32,
    parameter ADDRESS_WIDTH = 32
    )(
    input reg_write_d,
    input [1:0] res_src_d,
    input mem_write_d, jump_d, branch_d,
    input [3:0] alu_control_d,
    input [14:12] funct3_d,
    input alu_src_b_d, alu_src_a_d, adder_src_d,
    input [DATA_WIDTH-1:0] rd1_d, rd2_d,
    input [ADDRESS_WIDTH-1:0] pc_d,
    input [4:0] rs1_d, rs2_d, rd_d,
    input [DATA_WIDTH-1:0] imm_val_d,
    input [ADDRESS_WIDTH-1:0] pc_plus4_d,

    input [DATA_WIDTH-1:0] alu_result_m,alu_result_w,
    input [1:0] forward_a_e, forward_b_e,

    output reg_write_e,
    output [1:0] res_src_e,
    output mem_write_e,
    output [14:12] funct3_e,

    output [DATA_WIDTH-1:0] alu_result_e,
    output [DATA_WIDTH-1:0] write_data_e,
    output [4:0] rd_e,
    output [ADDRESS_WIDTH-1:0] pc_plus4_e,

    output [ADDRESS_WIDTH-1:0] pc_target_e,
    output pc_src_e
);

wire [DATA_WIDTH-1:0] a_forward, b_forward, a_alu, b_alu;
wire [ADDRESS_WIDTH-1:0] pc_adder_a;

wire [DATA_WIDTH-1:0] a_mux_res, b_mux_res;

mux3 a_forward_mux(
    .in1(rd1_d),
    .in2(alu_result_m),
    .in3(alu_result_w),
    .sel(forward_a_e),
    .out(a_forward)
);
mux3 b_forward_mux(
    .in1(rd2_d),
    .in2(alu_result_m),
    .in3(alu_result_w),
    .sel(forward_b_e),
    .out(b_forward)
);

mux2 a_src_mux(
    .in1(a_forward),
    .in2(pc_d),
    .sel(alu_src_a_d),
    .out(a_alu)
);

mux2 b_src_mux(
    .in1(b_forward),
    .in2(imm_val_d),
    .sel(alu_src_b_d),
    .out(b_alu)
);
mux2 pc_target_mux(
    .in1(pc_d),
    .in2(rd1_d),
    .sel(adder_src_d),
    .out(pc_adder_a)
);

adder pc_target_adder(
    .a(pc_adder_a),
    .b(imm_val_d),
    .res(pc_target_e)
);

alu main_alu(
    .a(a_alu),
    .b(b_alu),
    .alu_controls(alu_control_d),
    .funct3b0(funct3_d[12]),
    .res(alu_result_e)
);

assign pc_src_e = jump_d | (branch_d & alu_result_e[0]);

assign reg_write_e = reg_write_d;

assign reg_write_e = reg_write_d;
assign res_src_e = res_src_d;
assign mem_write_e = mem_write_d;

assign pc_plus4_e = pc_plus4_d;

assign funct3_e = funct3_d;

endmodule
