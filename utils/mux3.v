`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 01/10/2025 08:19:06 AM
// Design Name:
// Module Name: mux3
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


module mux3 #(
    parameter DATA_WIDTH = 32)
    (
    input [DATA_WIDTH-1:0] in1,in2,in3,
    input [1:0] sel,
    output reg [DATA_WIDTH-1:0] out
);

always@(*) begin
    case(sel)
        2'b00: out = in1;
        2'b01: out = in2;
        2'b10: out = in3;
        default: out = 32'd0;
    endcase

end
endmodule
