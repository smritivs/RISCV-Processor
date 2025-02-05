`timescale 1ns / 1ps
module memory_tb();
parameter DATA_WIDTH = 32;
parameter ADDRESS_WIDTH = 32;

// input signals
reg clk, reg_write_e;
reg [1:0] result_src_e;
reg mem_write_e;
reg [14:12] funct3_e;
reg [DATA_WIDTH-1:0] alu_result_e, write_data_e;
reg [4:0] rd_e;
reg [ADDRESS_WIDTH-1:0] pc_plus4_e;

// output signals
wire reg_write_m;
wire [1:0] result_src_m;
wire [DATA_WIDTH-1:0] alu_result_m;
wire [DATA_WIDTH-1:0] read_data_m;
wire [4:0] rd_m;
wire [ADDRESS_WIDTH-1:0] pc_plus4_m;

// instantiate module
memory dut(
clk, reg_write_e,
result_src_e,
mem_write_e,
funct3_e,
alu_result_e, write_data_e,
rd_e,
pc_plus4_e,
reg_write_m,
result_src_m,
alu_result_m,
read_data_m,
rd_m,
pc_plus4_m
);

initial begin
    clk = 0;
end

always begin
    #5 clk = ~clk;
end

initial begin
    reg_write_e = 0;
    result_src_e = 0;

    mem_write_e = 0;
    funct3_e = 3'b000;
    alu_result_e = 32'b0;
    write_data_e = 32'b0;
    rd_e = 5'b0;
    pc_plus4_e = 32'b0;

    #5
    mem_write_e = 1;
    funct3_e = 3'b010;
    alu_result_e = 32'hFF00FF00;
    write_data_e = 32'hABCD1234;

    #5
    mem_write_e = 0;
    funct3_e = 3'b000;
    alu_result_e = 32'hFF00FF00;
    write_data_e = 32'hABCD1234;

    #5
    mem_write_e = 0;
    funct3_e = 3'b100;
    alu_result_e = 32'hFF00FF00;
    write_data_e = 32'hABCD1234;
    #100
    $finish;

end

initial begin
    $dumpfile("dumpfile.vcd");
    $dumpvars(0, memory_tb);
end

endmodule
