
// main_decoder.v - logic for main decoder

module main_decoder (
    input        Zero, GE,
    input  [2:0] funct3,
    input  [6:0] op,
    output [1:0] ResultSrc,
    output       MemWrite, Branch, ALUSrc,
    output       RegWrite, Jump,
    output [2:0] ImmSrc,
    output [1:0] ALUOp
);

reg [11:0] controls;

always @(*) begin
    casez (op)
        // RegWrite_ImmSrc_ALUSrc_MemWrite_ResultSrc_Branch_ALUOp_Jump
        7'b0000011: controls = 12'b1_000_1_0_01_0_00_0; // lw, load instructions
        7'b0010111: controls = 12'b1_100_x_0_11_0_xx_0; // auipc
        7'b0110111: controls = 12'b1_100_1_0_00_0_11_0; // lui
        7'b0100011: controls = 12'b0_001_1_1_00_0_00_0; // sw, store instructions
        7'b0110011: controls = 12'b1_xxx_0_0_00_0_10_0; // R–type
        7'b1100011:
        begin
            casez(funct3[2])
                1'b0: // beq, bne
                begin
                    if(Zero != funct3[0])
                        controls = 12'b0_010_0_0_00_1_01_0;
                    else
                        controls = 12'b0_010_0_0_00_0_01_0; 
                end

                1'b1: // blt, bltu, bge, bge
                begin
                    if(GE == funct3[0])
                        controls = 12'b0_010_0_0_00_1_01_0; 
                    else
                        controls = 12'b0_010_0_0_00_0_01_0; 
                end

            endcase
        end 
        7'b0010011: controls = 12'b1_000_1_0_00_0_10_0; // I–type ALU
        7'b1100111: controls = 12'b1_000_1_0_10_1_00_1; // jalr, branch and jump are both 1
        7'b1101111: controls = 12'b1_011_0_0_10_0_00_1; // jal
        default:    controls = 12'bx_xxx_x_x_xx_x_xx_x; // ???
    endcase
end

assign {RegWrite, ImmSrc, ALUSrc, MemWrite, ResultSrc, Branch, ALUOp, Jump} = controls;

endmodule

