module control_unit(
    input [6:0] op,
    input [14:12] funct3,
    input [31:25] funct7,

    output reg_write_d,
    output [1:0] res_src_d,
    output mem_write_d, jump_d, branch_d,
    output [5:0] alu_control_d,
    output alu_src_b_d, alu_src_a_d, adder_src_d,
    output [2:0] imm_src_d
    );


// control bit format is
// regwrite_ressrc_memwrite_jump_branch_alusrca_alusrcb_addersrc_immsrc
// auipc uses alternate src for a
// jalr uses alternate source for next pc adder
reg [11:0] controls;
reg [5:0] alu_controls;

wire funct7b5 = funct7[30];

// main decoder
always @(*) begin
    case(op)
    // load instr
    7'b0000011: controls = 12'b1_01_0_0_0_0_1_0_000;
    // immediate arithmetic instr
    7'b0010011: controls = 12'b1_00_0_0_0_0_1_0_000;
    // auipc
    7'b0010111: controls = 12'b1_00_0_0_0_1_1_0_100;
    // store instr
    7'b0100011: controls = 12'b0_01_1_0_0_0_1_0_001;
    // register arithmetic instr
    7'b0110011: controls = 12'b1_00_0_0_0_0_0_0_xxx;
    // lui
    7'b0110111: controls = 12'b1_00_0_0_0_0_0_0_100;
    // branch
    7'b1100011: controls = 12'b0_00_0_0_1_0_0_0_010;
    // jalr
    7'b1100111: controls = 12'b1_10_0_1_0_0_0_1_000;
    // jal
    7'b1101111: controls = 12'b1_10_0_1_0_0_0_0_011;
    // p type, encode imm vals
    7'b1110111: controls = 12'b1_00_0_0_0_0_1_0_000;
    // default
    default: controls = 12'bx_00_0_0_0_0_0_0_000;
    endcase
end

// alu decoder
always @(*) begin
    casez(op)
    // load instr
    7'b0000011: alu_controls = 6'b000000;
    // auipc
    7'b0010111: alu_controls = 6'b000000;
    // store instr
    7'b0100011: alu_controls = 6'b000000;
    // immediate and register arithmetic instr
    7'b0?10011: begin
        case(funct3)
            // sub, add
            3'b000: alu_controls = (funct7b5 & op[5]) ? 6'b000001 : 6'b000000;
            // shift left logical
            3'b001: alu_controls = 6'b000010;
            // set less than
            3'b010: alu_controls = 6'b000011;
            // set less than unsigned
            3'b011: alu_controls = 6'b000100;
            // xor
            3'b100: alu_controls = 6'b000101;
            // shift right arithmetic, logical
            3'b101: alu_controls = (funct7b5) ? 6'b000111 : 6'b000110;
            // or
            3'b110: alu_controls = 6'b001000;
            // and
            3'b111: alu_controls = 6'b001001;
        endcase
    end
    // lui
    7'b0110111: alu_controls = 6'b001101;
    // branch
    7'b1100011: begin
        casez(funct3)
            // branch eq, neq
            3'b00?: alu_controls = 6'b001010;
            // branch less than , greater than
            3'b10?: alu_controls = 6'b001011;
            // branch less than, greater than unsigned
            3'b11?: alu_controls = 6'b001100;
        endcase
    end
    // jalr
    7'b1100111: alu_controls = 6'bxxxxxx;
    // jal
    7'b1101111: alu_controls = 6'bxxxxxx;
    // p_ops
    7'b1110111: begin
        casez({funct7[31:28],funct3})
        // add/sub16
        7'b010000?: alu_controls = 6'b010000 | funct3[0];
        // stas/stsa16
        7'b111101?: alu_controls = 6'b010010 | funct3[0];
        // add/sub8
        7'b010010?: alu_controls = 6'b010100 | funct3[0];
        // sra/srai16
        7'b01?1000: alu_controls = 6'b010110;
        // srl/srli16
        7'b01?1001: alu_controls = 6'b011000;
        // sll/slli16
        7'b01?1010: alu_controls = 6'b011010;
        // sra/srai8
        7'b01?1100: alu_controls = 6'b011100;
        // srl/srli8
        7'b01?1101: alu_controls = 6'b011110;
        // sll/slli8
        7'b01?1110: alu_controls = 6'b100000;

        // smul/umul16
        7'b101?000: alu_controls = 6'b100010 | funct7[29];
        // smul/umul8
        7'b101?100: alu_controls = 6'b100100 | funct7[29];
        endcase
    end
    // default
    default: alu_controls = 6'bxxxxxx;
    endcase
end

assign {reg_write_d,res_src_d,mem_write_d,jump_d,branch_d,alu_src_a_d,alu_src_b_d,adder_src_d,imm_src_d} = controls;
// reg_write_d res_src_d mem_write_d jump_d branch_d alu_src_a_d alu_src_b_d adder_src_d  imm_src_d
assign alu_control_d = alu_controls;
endmodule
