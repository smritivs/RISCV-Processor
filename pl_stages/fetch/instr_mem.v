`timescale 1ns / 1ps
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
    parameter DATA_WIDTH = 32
    )(
    input [ADDRESS_WIDTH-1:0] instr_addr,
    output reg [DATA_WIDTH-1:0] instr
    );


endmodule
