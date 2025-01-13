
// datapath.v
module datapath (
    input         clk, reset,
    input [1:0]   ResultSrc,
    input [1:0]   PCSrc, 
    input         ALUSrc,
    input         RegWrite,
    input [2:0]   ImmSrc,
    input [3:0]   ALUControl,
    output        Zero,
    output        GE,
    output [31:0] PC,
    input  [31:0] Instr,
    output [31:0] Mem_WrAddr, Mem_WrData,
    input  [31:0] ReadData,
    output [31:0] Result
);

wire [31:0] PCNext, PCPlus4, PCTarget;
wire [31:0] ImmExt, SrcA, SrcB, WriteData, ALUResult;
wire [31:0] UAdderResult, UResult;

// next PC logic
reset_ff #(32) pcreg(clk, reset, PCNext, PC);
adder          pcadd4(PC, 32'd4, PCPlus4);

// mux2 #(32)     pcaddmux({Instr[31:12],12'b0}, ImmExt, Instr[5], )
adder          pcaddbranch(PC, ImmExt, PCTarget);
mux3 #(32)     pcmux(PCPlus4, PCTarget, ALUResult, PCSrc, PCNext);

// register file logic
reg_file       rf (clk, RegWrite, Instr[19:15], Instr[24:20], Instr[11:7], Result, SrcA, WriteData);
imm_extend     ext (Instr[31:7], ImmSrc, ImmExt);

// ALU logic
mux2 #(32)     srcbmux(WriteData, ImmExt, ALUSrc, SrcB);
alu            alu (SrcA, SrcB, ALUControl, ALUResult, Zero, GE);

mux4 #(32)     resultmux(ALUResult, ReadData, PCPlus4, PCTarget, ResultSrc, Result);

assign Mem_WrData = WriteData;
assign Mem_WrAddr = ALUResult;

endmodule

