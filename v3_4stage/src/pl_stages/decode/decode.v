
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 12/27/2024 11:59:53 AM
// Design Name:
// Module Name: decode
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


module decode #(
    parameter ADDRESS_WIDTH = 32,
    parameter DATA_WIDTH = 32
) (
    input clk,
    reg_write_w,
    input [DATA_WIDTH-1:0] result_w,
    input [4:0] rd_w,

    input [ADDRESS_WIDTH-1:0] pc_f,
    pc_plus4_f,
    input [DATA_WIDTH-1:0] instr_f,

    output reg_write_d,
    output [1:0] res_src_d,
    output mem_write_d,
    jump_d,
    branch_d,
    output [5:0] alu_control_d,
    output [2:0] funct3_d,
    output alu_src_b_d,
    alu_src_a_d,
    adder_src_d,

    output [DATA_WIDTH-1:0] rd1_d,
    rd2_d,
    output [ADDRESS_WIDTH-1:0] pc_d,
    output [4:0] rs1_d,
    rs2_d,
    rd_d,
    output [DATA_WIDTH-1:0] imm_val_d,
    output [ADDRESS_WIDTH-1:0] pc_plus4_d
);

    wire [2:0] imm_src_d;
    wire [DATA_WIDTH-1:0] imm_val_p;
    wire [DATA_WIDTH-1:0] imm_val;
    wire is8, is16;

    control_unit cu (
        .op(instr_f[6:0]),
        .funct3(instr_f[14:12]),
        .funct7(instr_f[31:25]),
        .reg_write_d(reg_write_d),
        .res_src_d(res_src_d),
        .mem_write_d(mem_write_d),
        .jump_d(jump_d),
        .branch_d(branch_d),
        .alu_control_d(alu_control_d),
        .alu_src_a_d(alu_src_a_d),
        .alu_src_b_d(alu_src_b_d),
        .adder_src_d(adder_src_d),
        .imm_src_d(imm_src_d)
    );

    reg_file rf (
        .clk(clk),
        .write_enable(reg_write_w),
        .a1(instr_f[19:15]),
        .a2(instr_f[24:20]),
        .a3(rd_w),
        .wd3(result_w),
        .rd1(rd1_d),
        .rd2(rd2_d)
    );

    imm_ext imex (
        .instr(instr_f[31:7]),
        .imm_type(imm_src_d),
        .imm_val(imm_val)
    );

    mux2 im_mux(
        .in1(imm_val),
        .in2(imm_val_p),
        .sel(is8 | is16),
        .out(imm_val_d)
    );

    assign is8 = (instr_f[31:25] == 7'b1110111) ? (instr_f[14]) : (0);
    assign is16 = (instr_f[31:25] == 7'b1110111) ? (~instr_f[14]) : (0);
    assign imm_val_p = (is16) ? (instr_f[24:20]) : ((is8) ? (instr_f[23:20]) : (0));

    assign funct3_d = instr_f[14:12];

    assign pc_d = pc_f;
    assign pc_plus4_d = pc_plus4_f;

    assign rs1_d = instr_f[19:15];
    assign rs2_d = instr_f[24:20];
    assign rd_d = instr_f[11:7];

endmodule
