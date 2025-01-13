
// controller.v - controller for RISC-V CPU

module controller (
    input [6:0]  op,
    input [2:0]  funct3,
    input        funct7b5,
    input        Zero,
    input        GE,
    output       [1:0] ResultSrc,
    output       MemWrite,
    output [1:0] PCSrc, 
    output       ALUSrc,
    output       RegWrite, Jump,
    output [2:0] ImmSrc,
    output [3:0] ALUControl
);

wire [1:0] ALUOp;
wire       Branch;

main_decoder    md (Zero, GE, funct3, op, ResultSrc, MemWrite, Branch,
                    ALUSrc, RegWrite, Jump, ImmSrc, ALUOp);

alu_decoder     ad (op[5], funct3, funct7b5, ALUOp, ALUControl);

// for jump and branch
// assign PCSrc = Branch | Jump;
assign PCSrc = Branch+Jump;

endmodule

