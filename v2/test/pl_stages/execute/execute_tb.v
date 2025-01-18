module execute_tb();
    parameter DATA_WIDTH = 32;
    parameter ADDRESS_WIDTH = 32;

    reg reg_write_d;
    reg [1:0] res_src_d;
    reg mem_write_d, jump_d, branch_d;
    reg [3:0] alu_control_d;
    reg [14:12] funct3_d;
    reg alu_src_b_d, alu_src_a_d, adder_src_d;
    reg [DATA_WIDTH-1:0] rd1_d, rd2_d;
    reg [ADDRESS_WIDTH-1:0] pc_d;
    reg [4:0] rs1_d, rs2_d, rd_d;
    reg [DATA_WIDTH-1:0] imm_val_d;
    reg [ADDRESS_WIDTH-1:0] pc_plus4_d;

    wire reg_write_e;
    wire [2:0] res_src_e;
    wire mem_write_e;
    wire [14:12] funct3_e;
    wire [DATA_WIDTH-1:0] alu_result_e;
    wire [DATA_WIDTH-1:0] write_data_e;
    wire [3:0] rd_e;
    wire [ADDRESS_WIDTH-1:0] pc_plus4_e;
    wire [ADDRESS_WIDTH-1:0] pc_target_e;
    wire pc_src_e;

    execute dut (
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
        .pc_plus4_d(pc_plus4_d),

        .reg_write_e(reg_write_e),
        .res_src_e(res_src_e),
        .mem_write_e(mem_write_e),
        .funct3_e(funct3_e),
        .alu_result_e(alu_result_e),
        .write_data_e(write_data_e),
        .rd_e(rd_e),
        .pc_plus4_e(pc_plus4_e),
        .pc_target_e(pc_target_e),
        .pc_src_e(pc_src_e)
    );

    reg clk;
    initial begin
        clk = 0;
    end

    always #5 clk = ~clk;

    initial begin
        $dumpfile("dumpfile.vcd");
        $dumpvars(0, execute_tb);

        reg_write_d = 0;
        res_src_d = 2'b00;
        mem_write_d = 0;
        jump_d = 0;
        branch_d = 0;
        alu_control_d = 4'b0000;
        funct3_d = 3'b000;
        alu_src_b_d = 0;
        alu_src_a_d = 0;
        adder_src_d = 0;
        rd1_d = 32'h00000010;
        rd2_d = 32'h00000020;
        pc_d = 32'h00000000;
        rs1_d = 5'd0;
        rs2_d = 5'd1;
        rd_d = 5'd2;
        imm_val_d = 32'h00000004;
        pc_plus4_d = 32'h00000004;

        #10;
        alu_control_d = 4'b0000;
        #10;
        $display("Test 1: ALU Result = %h, ALU Control = %b", alu_result_e, alu_control_d);

        #10;
        branch_d = 1;
        #10;
        $display("Test 2: Branch Control - pc_src_e=%b, pc_target_e=%h", pc_src_e, pc_target_e);

        #10;
        jump_d = 1;
        #10;
        $display("Test 3: Jump Control - pc_src_e=%b, pc_target_e=%h", pc_src_e, pc_target_e);

        #10;
        mem_write_d = 1;
        #10;
        $display("Test 4: Memory Write - mem_write_e=%b", mem_write_e);

        #10;
        alu_src_a_d = 1;
        alu_src_b_d = 1;
        #10;
        $display("Test 5: ALU Source A = %h, ALU Source B = %h", alu_result_e, write_data_e);

        #10;
        reg_write_d = 1;
        #10;
        $display("Test 6: Register Write - reg_write_e=%b", reg_write_e);

        #20;
        $finish;
    end
endmodule
