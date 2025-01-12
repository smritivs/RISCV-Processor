`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 12/27/2024 12:02:59 PM
// Design Name:
// Module Name: ff
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


module ff #(
    parameter DATA_WIDTH=32)
    (
    input clk,rst,
    input [DATA_WIDTH-1:0] din,
    output reg [DATA_WIDTH-1:0] dout
);

always @(posedge clk) begin
    if(rst) begin
        dout <= 0;
    end

    else begin
        dout <= din;
    end
end

endmodule
