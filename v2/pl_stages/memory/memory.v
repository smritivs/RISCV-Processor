module data_memory #(
    parameter ADDRESS_WIDTH = 32,
    parameter DATA_WIDTH = 32
    )(
    input clk, reg_write_e,
    input [1:0] result_src_e,
    input mem_write_e,

    input [DATA_WIDTH-1:0] alu_result_e, write_data_e,
    input [4:0] rd_e,
    input [ADDRESS_WIDTH-1:0] pc_plus4_e,

    output reg_write_m,
    output [1:0] result_src_m,
    output [DATA_WIDTH-1:0] alu_result_m,
    output [DATA_WIDTH-1:0] read_data_m,
    output [4:0] rd_m,
    output [ADDRESS_WIDTH-1:0] pc_plus4_m
);

data_memory dm(
    .clk(clk),
    .mem_write_e(mem_write_e),
    .funct3(funct3),
    .data_mem_addr(alu_result_e),
    .write_data_e(write_data_e),
    .read_data_m(read_data_m)
);

endmodule
