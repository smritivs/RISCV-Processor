module decode_tb();
parameter ADDRESS_WIDTH = 32;
parameter DATA_WIDTH = 32;

    reg clk, reg_write_w;
    reg [DATA_WIDTH-1:0] result_w;
    reg [4:0] rd_w;
    reg [ADDRESS_WIDTH-1:0] pc_f, pc_plus4_f;
    reg [DATA_WIDTH-1:0] instr_f;

    wire reg_write_d;
    wire [1:0] res_src_d;
    wire mem_write_d, jump_d, branch_d;
    wire [3:0] alu_control_d;
    wire [14:12] funct3_d;
    wire alu_src_b_d, alu_src_a_d, adder_src_d;
    wire [DATA_WIDTH-1:0] rd1_d, rd2_d;
    wire [ADDRESS_WIDTH-1:0] pc_d;
    wire [4:0] rs1_d, rs2_d, rd_d;
    wire [DATA_WIDTH-1:0] imm_val_d;
    wire [ADDRESS_WIDTH-1:0] pc_plus4_d;

    decode dut (
        .clk(clk),
        .reg_write_w(reg_write_w),
        .result_w(result_w),
        .rd_w(rd_w),
        .pc_f(pc_f),
        .pc_plus4_f(pc_plus4_f),
        .instr_f(instr_f),
        .reg_write_d(reg_write_d),
        .res_src_d(res_src_d),
        .mem_write_d(mem_write_d),
        .jump_d(jump_d),
        .branch_d(branch_d),
        .alu_control_d(alu_control_d),
        .funct3_d(funct3_d),
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
        .pc_plus4_d(pc_plus4_d)
    );


    initial begin
        clk = 0;
    end

    always #5 clk = ~clk;

    initial begin
        $dumpfile("dumpfile.vcd");
        $dumpvars(0, decode_tb);

        reg_write_w = 0;
        result_w = 32'b0;
        rd_w = 5'b0;
        pc_f = 32'h00000000;
        pc_plus4_f = 32'h00000004;
        instr_f = 32'h00100093;

        #10;
        reg_write_w = 1;
        result_w = 32'h12345678;
        rd_w = 5'd2;

        #10;
        $display("Test 1: Register Write - reg_write_d=%b, rd1_d=%h, rd2_d=%h",
                 reg_write_d, rd1_d, rd2_d);

        #10;
        instr_f = 32'b000000000010_00011_000_00100_0010011;
        #10;
        $display("Test 2: ALU Source - alu_src_a_d=%b, alu_src_b_d=%b, alu_control_d=%b",
                 alu_src_a_d, alu_src_b_d, alu_control_d);

        #10;
        instr_f = 32'b0000000_00101_00110_100_00000_1100011;
        #10;
        $display("Test 3: Branch Control - branch_d=%b, alu_control_d=%b", branch_d, alu_control_d);

        #10;
        instr_f = 32'b000000000010_00011_010_00100_0000011;
        #10;
        $display("Test 4: Memory Write Control - mem_write_d=%b", mem_write_d);

        #10;
        instr_f = 32'b0000000_00101_00110_101_00000_1101111;
        #10;
        $display("Test 5: Jump Control - jump_d=%b, pc_d=%h", jump_d, pc_d);

        #20;
        $finish;
    end
endmodule
