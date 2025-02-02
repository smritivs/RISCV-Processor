module hazard #(
	parameter ADDRESS_WIDTH = 32,
	parameter DATA_WIDTH = 32
	)(
	input pc_src_e,

	output flush_d,

	output flush_e
);

assign flush_d = pc_src_e;
assign flush_e = pc_src_e;

endmodule
