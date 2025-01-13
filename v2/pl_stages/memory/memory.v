module data_memory #(
    parameter ADDRESS_WIDTH = 32,
    parameter DATA_WIDTH = 32
    )(
    input reg_write_e,
    input [1:0] result_src_e,
    input mem_write_e,

    input [DATA_WIDTH-1:0] alu_result_e, write_data_e,
    input [4:0] rd_e,
    input [ADDRESS_WIDTH-1:0] pc_plus4_e
);


endmodule
