module cpu #(
    parameter DATA_WIDTH = 32,
    parameter ADDRESS_WIDTH = 32
)(
    input clk,
    input rst,

    output [DATA_WIDTH-1:0] result
);

// f to d
wire [ADDRESS_WIDTH-1:0] pc_f_i, pc_plus4_f_i;
wire [DATA_WIDTH-1:0] instr_f_i;

wire [ADDRESS_WIDTH-1:0] pc_f_o, pc_plus4_f_o;
wire [DATA_WIDTH-1:0] instr_f_o;

// d to e
wire [DATA_WIDTH-1:0] instr_d_i, rd1_d_i, rd2_d_i, imm_val_d_i;
wire [ADDRESS_WIDTH-1:0] pc_d_i, pc_plus4_d_i;
wire [4:0] rs1_d_i, rs2_d_i, rd_d_i;
wire [3:0] alu_control_d_i;
wire [1:0] res_src_d_i;
wire mem_write_d_i, reg_write_d_i, jump_d_i, branch_d_i, alu_src_a_d_i, alu_src_b_d_i, adder_src_d_i;

wire [DATA_WIDTH-1:0] instr_d_o, rd1_d_o, rd2_d_o, imm_val_d_o;
wire [ADDRESS_WIDTH-1:0] pc_d_o, pc_plus4_d_o;
wire [4:0] rs1_d_o, rs2_d_o, rd_d_o;
wire [3:0] alu_control_d_o;
wire [1:0] res_src_d_o;
wire mem_write_d_o, reg_write_d_o, jump_d_o, branch_d_o, alu_src_a_d_o, alu_src_b_d_o, adder_src_d_o;

// e to m
wire [DATA_WIDTH-1:0] alu_result_e_i, write_data_e_i;
wire [ADDRESS_WIDTH-1:0] pc_target_e_i, pc_plus4_e_i;
wire pc_src_e_i, mem_write_e_i, reg_write_e_i;
wire [1:0] res_src_e_i;

wire [DATA_WIDTH-1:0] alu_result_e_o, write_data_e_o;
wire [ADDRESS_WIDTH-1:0] pc_target_e_o, pc_plus4_e_o;
wire pc_src_e_o, mem_write_e_o, reg_write_e_o;
wire [1:0] res_src_e_o;

// m to w
wire reg_write_m_i;
wire [1:0] result_src_m_i;
wire [DATA_WIDTH-1:0] alu_result_m_i;
wire [DATA_WIDTH-1:0] read_data_m_i;
wire [4:0] rd_m_i;
wire [ADDRESS_WIDTH-1:0] pc_plus4_m_i;

wire reg_write_m_o;
wire [1:0] result_src_m_o;
wire [DATA_WIDTH-1:0] alu_result_m_o;
wire [DATA_WIDTH-1:0] read_data_m_o;
wire [4:0] rd_m_o;
wire [ADDRESS_WIDTH-1:0] pc_plus4_m_o;

// w to f
wire [DATA_WIDTH-1:0] mem_data_w_i, alu_result_w_i;
wire [ADDRESS_WIDTH-1:0] pc_plus4_w_i;
wire [1:0] res_src_w_i;
wire reg_write_w_i;

wire [DATA_WIDTH-1:0] mem_data_w_o, alu_result_w_o;
wire [ADDRESS_WIDTH-1:0] pc_plus4_w_o;
wire [1:0] res_src_w_o;
wire reg_write_w_o;

// hazards
wire stall_f, stall_d, flush_d, flush_e, forward_a_e, forward_b_e;

// Fetch
fetch fetch_stage (
    .clk(clk),
    .en(stall_f),
    .rst(reset),
    .pc_src_e(pc_src_e),
    .pc_target_e(pc_target_e),
    .pc_f(pc_f),
    .pc_plus4_f(pc_plus4_f),
    .instr(instr_f)
);

// f to d pl_reg

pl_reg_fd fd(
	.clk(clk),
	.en(stall_f),
	.clr(rst),
    .pc_f_i(pc_f_i)
);

// Decode
decode decode_stage (
    .clk(clk),
    .instr(instr_d),
    .pc(pc_d),
    .pc_plus4(pc_plus4_d),
    .alu_control(alu_control_d),
    .rd1(rd1_d),
    .rd2(rd2_d),
    .imm_val(imm_val_d),
    .rs1(rs1_d),
    .rs2(rs2_d),
    .rd(rd_d),
    .res_src(res_src_d),
    .mem_write(mem_write_d),
    .reg_write(reg_write_d),
    .jump(jump_d),
    .branch(branch_d),
    .alu_src_a(alu_src_a_d),
    .alu_src_b(alu_src_b_d),
    .adder_src(adder_src_d)
);

// d to e pl_reg
always @(posedge clk or posedge reset) begin
    if (reset) begin
        alu_control_d <= 0;
        rd1_d <= 0;
        rd2_d <= 0;
        imm_val_d <= 0;
        pc_d <= 0;
        pc_plus4_d <= 0;
        res_src_d <= 0;
        mem_write_d <= 0;
        reg_write_d <= 0;
        jump_d <= 0;
        branch_d <= 0;
        alu_src_a_d <= 0;
        alu_src_b_d <= 0;
        adder_src_d <= 0;
    end else begin
        alu_control_d <= alu_control_d;
        rd1_d <= rd1_d;
        rd2_d <= rd2_d;
        imm_val_d <= imm_val_d;
        pc_d <= pc_d;
        pc_plus4_d <= pc_plus4_d;
        res_src_d <= res_src_d;
        mem_write_d <= mem_write_d;
        reg_write_d <= reg_write_d;
        jump_d <= jump_d;
        branch_d <= branch_d;
        alu_src_a_d <= alu_src_a_d;
        alu_src_b_d <= alu_src_b_d;
        adder_src_d <= adder_src_d;
    end
end

// Execute
execute execute_stage (
    .reg_write_d(reg_write_d),
    .res_src_d(res_src_d),
    .mem_write_d(mem_write_d),
    .jump_d(jump_d),
    .branch_d(branch_d),
    .alu_control_d(alu_control_d),
    .funct3_d(0), // Example input
    .alu_src_b_d(alu_src_b_d),
    .alu_src_a_d(alu_src_a_d),
    .adder_src_d(adder_src_d),
    .rd1_d(rd1_d),
    .rd2_d(rd2_d),
    .pc_d(pc_d),
    .rs1_d(rs1_d),
    .rs2_d(rs2_d),
    .rd_d(rd_d),
    .imm_val_d(imm_val_d),
    .pc_plus4_d(pc_plus4_d),
    .reg_write_e(reg_write_e),
    .res_src_e(res_src_e),
    .mem_write_e(mem_write_e),
    .alu_result_e(alu_result_e),
    .write_data_e(write_data_e),
    .pc_plus4_e(pc_plus4_e),
    .pc_target_e(pc_target_e),
    .pc_src_e(pc_src_e)
);

// e to m pl_reg
always @(posedge clk or posedge reset) begin
    if (reset) begin
        alu_result_e <= 0;
        write_data_e <= 0;
        pc_plus4_e <= 0;
        res_src_e <= 0;
        mem_write_e <= 0;
        reg_write_e <= 0;
    end else begin
        alu_result_e <= alu_result_e;
        write_data_e <= write_data_e;
        pc_plus4_e <= pc_plus4_e;
        res_src_e <= res_src_e;
        mem_write_e <= mem_write_e;
        reg_write_e <= reg_write_e;
    end
end

// Memory
memory memory_stage (
    .clk(clk),
    .mem_write(mem_write_e),
    .address(alu_result_e),
    .write_data(write_data_e),
    .read_data(mem_data_w)
);

// m to w pl_reg
always @(posedge clk or posedge reset) begin
    if (reset) begin
        mem_data_w <= 0;
        alu_result_w <= 0;
        pc_plus4_w <= 0;
        res_src_w <= 0;
        reg_write_w <= 0;
    end else begin
        mem_data_w <= mem_data_w;
        alu_result_w <= alu_result_e;
        pc_plus4_w <= pc_plus4_e;
        res_src_w <= res_src_e;
        reg_write_w <= reg_write_e;
    end
end

// Writeback
writeback writeback_stage (
    .mem_data(mem_data_w),
    .alu_result(alu_result_w),
    .pc_plus4(pc_plus4_w),
    .res_src(res_src_w),
    .write_data()
);

endmodule
