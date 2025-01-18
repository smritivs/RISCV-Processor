`timescale 1ns / 1ps
module data_memory_tb();

// input signals
reg clk, mem_write_e;
reg [14:12] funct3;
reg [32-1:0] data_mem_addr;
reg [32-1:0] write_data_e;

// output signals
wire [32-1:0] read_data_m;

// instantiate module
data_memory dut(
    .clk(clk),
    .mem_write_e(mem_write_e),
    .funct3(funct3),
    .data_mem_addr(data_mem_addr),
    .write_data_e(write_data_e),
    .read_data_m(read_data_m)
);

initial begin
    clk = 0;
    mem_write_e = 1'b0;
    funct3 = 3'b000;
    data_mem_addr = 32'h00000000;
    write_data_e = 32'h00000000;
end

always begin
    #5 clk = ~clk;
end

initial begin
    #5
    mem_write_e = 1'b1;
    funct3 = 3'b000;
    data_mem_addr = 32'h00000000;
    write_data_e = 32'hFFFFAAAA;

    #5
    mem_write_e = 1'b0;
    funct3 = 3'b000;
    data_mem_addr = 32'h00000000;
    write_data_e = 32'h00000000;

    #5
    mem_write_e = 1'b0;
    funct3 = 3'b000;
    data_mem_addr = 32'h0000FFFF;
    write_data_e = 32'h00000000;
    #100
    $finish;

end

initial begin
    $dumpfile("dumpfile.vcd");
    $dumpvars(0, dut);
end

endmodule
