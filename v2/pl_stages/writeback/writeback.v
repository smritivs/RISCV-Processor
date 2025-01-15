`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 12/27/2024 11:59:53 AM
// Design Name:
// Module Name: commit
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


module writeback #(
    parameter ADDRESS_WIDTH = 32,
    parameter DATA_WIDTH = 32
    )(
    input reg_write_m,
    input [1:0] result_src_m,
    input [DATA_WIDTH-1:0] alu_result_m,
    input [DATA_WIDTH-1:0] read_data_m,
    input [4:0] rd_m,
    input [ADDRESS_WIDTH-1:0] pc_plus4_m,

    output [DATA_WIDTH-1:0] result_w,
    output reg_write_w,
    output [4:0] rd_w
    );

mux3 result_mux(
    .in1(alu_result_m),
    .in2(read_data_m),
    .in3(pc_plus4_m),
    .sel(result_src_m),
    .out(result_w)
);

endmodule
