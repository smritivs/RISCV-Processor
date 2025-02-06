module pl_reg_de #(
	parameter ADDRESS_WIDTH = 32,
	parameter DATA_WIDTH = 32
	)(
	input clk,en,clr,

	input reg_write_d_i,
	input [1:0] res_src_d_i,
	input mem_write_d_i, jump_d_i, branch_d_i,
	input [4:0] alu_control_d_i,
	input [14:12] funct3_d_i,
	input alu_src_b_d_i, alu_src_a_d_i, adder_src_d_i,
	input [DATA_WIDTH-1:0] rd1_d_i, rd2_d_i,
	input [ADDRESS_WIDTH-1:0] pc_d_i,
	input [4:0] rs1_d_i, rs2_d_i, rd_d_i,
	input [DATA_WIDTH-1:0] imm_val_d_i,
	input [ADDRESS_WIDTH-1:0] pc_plus4_d_i,

	output reg reg_write_d_o,
    output reg [1:0] res_src_d_o,
    output reg mem_write_d_o, jump_d_o, branch_d_o,
    output reg [4:0] alu_control_d_o,
    output reg [14:12] funct3_d_o,
    output reg alu_src_b_d_o, alu_src_a_d_o, adder_src_d_o,
    output reg [DATA_WIDTH-1:0] rd1_d_o, rd2_d_o,
    output reg [ADDRESS_WIDTH-1:0] pc_d_o,
    output reg [4:0] rs1_d_o, rs2_d_o, rd_d_o,
    output reg [DATA_WIDTH-1:0] imm_val_d_o,
    output reg [ADDRESS_WIDTH-1:0] pc_plus4_d_o
);

always@(posedge clk) begin
	if(clr) begin
	reg_write_d_o <= 0;
    res_src_d_o <= 0;
    mem_write_d_o <= 0; jump_d_o <= 0; branch_d_o <= 0;
    alu_control_d_o <= 0;
    funct3_d_o <= 0;
    alu_src_b_d_o <= 0; alu_src_a_d_o <= 0; adder_src_d_o <= 0;
    rd1_d_o <= 0; rd2_d_o <= 0;
    pc_d_o <= 0;
    rs1_d_o <= 0; rs2_d_o <= 0; rd_d_o <= 0;
    imm_val_d_o <= 0;
    pc_plus4_d_o <= 0;
	end

	else if(!en) begin
	reg_write_d_o <= reg_write_d_i;
    res_src_d_o <= res_src_d_i;
    mem_write_d_o <= mem_write_d_i; jump_d_o <= jump_d_i; branch_d_o <= jump_d_i;
    alu_control_d_o <= alu_control_d_i;
    funct3_d_o <= funct3_d_i;
    alu_src_b_d_o <= alu_src_b_d_i; alu_src_a_d_o <= alu_src_a_d_i; adder_src_d_o <= adder_src_d_i;
    rd1_d_o <= rd1_d_i; rd2_d_o <= rd2_d_i;
    pc_d_o <= pc_d_i;
    rs1_d_o <= rs1_d_i; rs2_d_o <= rs2_d_i; rd_d_o <= rd_d_i;
    imm_val_d_o <= imm_val_d_i;
    pc_plus4_d_o <= pc_plus4_d_i;

	end
end

endmodule
