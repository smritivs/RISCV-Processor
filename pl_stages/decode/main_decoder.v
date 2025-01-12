module main_decoder(
    input [6:0] op,
    input [14:12] funct3,
    input funct7b5,
    output reg_write_d,
    output [1:0] res_src_d,
    output mem_write_d, jump_d, branch_d,
    output [2:0] alu_control_d,
    output [1:0] alu_src_d,
    output [2:0] imm_src_d
    );

// control bit format is
// regwrite_ressrc_memwrite_jump_branch_alucontrol_alusrc_immsrc
reg [12:0] controls;

always @(*) begin
    case(op)
    // load instr
    7'b0000011: controls = 13'b1_01_0_0_0_xxx_xx_010;
    // immediate arithmetic instr
    7'b0010011: controls = 13'b1_00_0_0_0_xxx_xx_010;
    // auipc
    7'b0010111:
    // store instr
    7'b0100011:
    // register arithmetic instr
    7'b0110011:
    // lui
    7'b0110111:
    // branch
    7'b1100011:
    // jalr
    7'b1100111:
    // jal
    7'b1101111:

    end
endmodule
