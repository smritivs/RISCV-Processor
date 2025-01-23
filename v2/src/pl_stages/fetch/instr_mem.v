
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 01/10/2025 10:39:12 AM
// Design Name:
// Module Name: instr_mem
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


module instr_mem #(
    parameter ADDRESS_WIDTH = 32,
    parameter DATA_WIDTH = 32,
    parameter MEM_SIZE = 512,
    parameter INSTR_COUNT = 512
    )(
    input [ADDRESS_WIDTH-1:0] instr_addr,
    output [DATA_WIDTH-1:0] instr
    );

// array of 32-bit words or instructions
reg [DATA_WIDTH-1:0] instr_mem [0:MEM_SIZE-1];
initial begin
        $readmemh("./src/pl_stages/fetch/code.hex", instr_mem);
    end

// word-aligned memory access
// combinational read logic
assign instr = instr_mem[instr_addr[31:2]];

endmodule
