`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 01/10/2025 11:02:30 AM
// Design Name:
// Module Name: reg_file
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


module reg_file #(
    parameter DATA_WIDTH = 32
    )(
    input clk, write_enable,
    input [4:0] a1, a2, a3,
    input [DATA_WIDTH-1:0] wd3,
    output [DATA_WIDTH-1:0] rd1, rd2
    );

reg [DATA_WIDTH-1:0] reg_array [0:31];

integer i;
initial begin
    for(i=0;i<32;i=i+1) begin
        reg_array[i] = 0;
    end
end

// synchronous write logic
always @(posedge clk) begin
    if(write_enable) reg_array[a3] <= wd3;
end

// combinational read logic
assign rd1 = (rd1 == 0) ? 0 : reg_array[a1];
assign rd2 = (rd2 == 0) ? 0 : reg_array[a2];

endmodule
