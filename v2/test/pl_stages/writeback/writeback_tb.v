module writeback_tb();

parameter ADDRESS_WIDTH = 32;
parameter DATA_WIDTH = 32;

reg reg_write_m;
reg [1:0] result_src_m;
reg [DATA_WIDTH-1:0] alu_result_m;
reg [DATA_WIDTH-1:0] read_data_m;
reg [4:0] rd_m;
reg [ADDRESS_WIDTH-1:0] pc_plus4_m;

wire [DATA_WIDTH-1:0] result_w;
wire reg_write_w;
wire [4:0] rd_w;

writeback dut(
	reg_write_m,
	result_src_m,
	alu_result_m,
	read_data_m,
	rd_m,
	pc_plus4_m,

	result_w,
	reg_write_w,
	rd_w
);

reg clk;

initial begin
	clk =  0;
end

always begin
	#5 clk = ~clk;
end

initial begin
	reg_write_m = 1;
	result_src_m = 2'b00;
	alu_result_m = 32'd77;
	read_data_m = 32'b0;
	rd_m = 5'd6;
	pc_plus4_m = 32'd60;

	#5
	reg_write_m = 0;
	result_src_m = 2'b01;
	alu_result_m = 32'd89;
	read_data_m = 32'd1;
	rd_m = 5'd9;
	pc_plus4_m = 32'd64;

	#5
	reg_write_m = 0;
	result_src_m = 2'b00;
	alu_result_m = 32'b0;
	read_data_m = 32'b0;
	rd_m = 5'd6;
	pc_plus4_m = 32'd55;

	#5
	reg_write_m = 0;
	result_src_m = 2'b00;
	alu_result_m = 32'b0;
	read_data_m = 32'b0;
	rd_m = 5'd6;
	pc_plus4_m = 32'd55;

	#100 $finish();

end

initial begin
    $dumpfile("dumpfile.vcd");
    $dumpvars(0, writeback_tb);
end

endmodule
