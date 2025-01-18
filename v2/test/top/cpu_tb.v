

module cpu_tb ();
    parameter ADDRESS_WIDTH = 32;
    parameter DATA_WIDTH = 32;

    reg rst, clk;

    wire [DATA_WIDTH-1:0] result;

    cpu dut (
        .clk(clk),
        .rst(rst),

        .result(result)
    );

    initial begin
        clk = 0;
    end

    always #5 clk = ~clk;

    initial begin
        $dumpfile("dumpfile.vcd");
        $dumpvars(0, decode_tb);

        rst = 1;
        #5 rst = 0;

        #100 $finish();

    end
endmodule
