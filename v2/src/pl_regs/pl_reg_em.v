module pl_reg_em #(
    parameter ADDRESS_WIDTH = 32,
    parameter DATA_WIDTH = 32
) (
    input clk,
    en,
    clr,

    input reg_write_e_i,
    input mem_write_e_i,
    input [1:0] result_src_e_i,
    input [14:12] funct3_e_i,
    input [DATA_WIDTH-1:0] alu_result_e_i,
    write_data_e_i,
    input [4:0] rd_e_i,
    input [ADDRESS_WIDTH-1:0] pc_plus4_e_i,

    output reg reg_write_e_o,
    output reg mem_write_e_o,
    output reg [1:0] result_src_e_o,
    output reg [14:12] funct3_e_o,
    output reg [DATA_WIDTH-1:0] alu_result_e_o,
    write_data_e_o,
    output reg [4:0] rd_e_o,
    output reg [ADDRESS_WIDTH-1:0] pc_plus4_e_o
);

    always @(posedge clk) begin
        if (clr) begin
            reg_write_e_o <= 1'b0;
            mem_write_e_o <= 1'b0;
            result_src_e_o <= 2'b00;
            funct3_e_o <= 3'b0;
            alu_result_e_o <= 32'd0;
            write_data_e_o <= 32'd0;
            rd_e_o <= 5'd0;
            pc_plus4_e_o <= 32'd0;
        end else if (!en) begin
            reg_write_e_o <= reg_write_e_i;
            mem_write_e_o <= mem_write_e_i;
            result_src_e_o <= result_src_e_i;
            funct3_e_o <= funct3_e_i;
            alu_result_e_o <= alu_result_e_i;
            write_data_e_o <= write_data_e_i;
            rd_e_o <= rd_e_i;
            pc_plus4_e_o <= pc_plus4_e_i;
        end
    end
endmodule
