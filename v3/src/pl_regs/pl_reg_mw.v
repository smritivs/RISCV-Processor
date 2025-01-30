module pl_reg_mw #(
    parameter ADDRESS_WIDTH = 32,
    parameter DATA_WIDTH = 32
) (
    input clk,
    en,
    clr,
    input reg_write_m_i,
    input [1:0] result_src_m_i,
    input [DATA_WIDTH-1:0] alu_result_m_i,
    input [DATA_WIDTH-1:0] read_data_m_i,
    input [4:0] rd_m_i,
    input [ADDRESS_WIDTH-1:0] pc_plus4_m_i,

    output reg reg_write_m_o,
    output reg [1:0] result_src_m_o,
    output reg [DATA_WIDTH-1:0] alu_result_m_o,
    output reg [DATA_WIDTH-1:0] read_data_m_o,
    output reg [4:0] rd_m_o,
    output reg [ADDRESS_WIDTH-1:0] pc_plus4_m_o
);

    always @(posedge clk) begin
        if (clr) begin
            reg_write_m_o <= 1'b0;
            result_src_m_o <= 2'b00;
            alu_result_m_o <= 32'd0;
            read_data_m_o <= 32'd0;
            rd_m_o <= 5'd0;
            pc_plus4_m_o <= 32'd0;
        end else if (!en) begin
            reg_write_m_o <= reg_write_m_i;
            result_src_m_o <= result_src_m_i;
            alu_result_m_o <= alu_result_m_i;
            read_data_m_o <= read_data_m_i;
            rd_m_o <= rd_m_i;
            pc_plus4_m_o <= pc_plus4_m_i;
        end
    end
endmodule
