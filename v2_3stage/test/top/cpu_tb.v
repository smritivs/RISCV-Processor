`timescale 1ns/1ps

module cpu_tb ();
    parameter ADDRESS_WIDTH = 32;
    parameter DATA_WIDTH = 32;

    reg rst, clk;

    wire [DATA_WIDTH-1:0] result;
    wire [ADDRESS_WIDTH-1:0] pcw;

    cpu dut (
        .clk(clk),
        .rst(rst),

        .result(result),
        .pcw(pcw)
    );

    initial begin
        clk = 0;
    end

    always #5 clk = ~clk;

    initial begin
        $dumpfile("dumpfile.vcd");
        $dumpvars(0, cpu_tb);

        rst = 1;
        #5 rst = 0;

        #1000 $finish();

    end
endmodule
