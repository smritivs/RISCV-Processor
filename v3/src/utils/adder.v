
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 01/10/2025 08:14:56 AM
// Design Name:
// Module Name: adder
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


module adder #(
    parameter OPERAND_WIDTH = 32
    )(
    input [OPERAND_WIDTH-1:0] a,b,
    output [OPERAND_WIDTH-1:0] res
);

assign res = a+b;

endmodule
