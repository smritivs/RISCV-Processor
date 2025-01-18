module fetch_tb();
parameter DATA_WIDTH=32;
parameter ADDRESS_WIDTH=32;

reg clk, stall_f;
reg pc_src_e;
reg [ADDRESS_WIDTH-1:0] pc_target_e;
wire [ADDRESS_WIDTH-1:0] pc, pc_plus4;
wire [DATA_WIDTH-1:0] instr;

fetch dut(
clk, stall_f,
pc_src_e,
pc_target_e,
pc, pc_plus4,
instr
);


initial begin
	clk = 0;
end

always begin
	#5 clk = ~clk;
end

initial begin
	stall_f = 1;
	pc_src_e = 0;
	pc_target_e = 32'h000000FF;

	#5 stall_f = 0;

	#20
	pc_src_e = 1;
	pc_target_e = 32'h000000FF;

	#100
	$finish();
end

initial begin
    $dumpfile("dumpfile.vcd");
    $dumpvars(0, fetch_tb);
end

endmodule
