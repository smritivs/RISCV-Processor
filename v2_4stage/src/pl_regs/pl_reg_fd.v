module pl_reg_fd #(
	parameter ADDRESS_WIDTH = 32,
	parameter DATA_WIDTH = 32
	)(
	input clk, en, clr,

	input [ADDRESS_WIDTH-1:0] pc_f_i, pc_plus4_f_i,
    input [DATA_WIDTH-1:0] instr_f_i,

    output reg [ADDRESS_WIDTH-1:0] pc_f_o, pc_plus4_f_o,
    output reg [DATA_WIDTH-1:0] instr_f_o
);

always @(posedge clk) begin
	if(clr) begin
		pc_f_o <= 32'd0 ;
		pc_plus4_f_o <= 32'd0;
		instr_f_o <= 32'd0;
	end

	else if(!en) begin
		pc_f_o <= pc_f_i;
		pc_plus4_f_o <= pc_plus4_f_i;
		instr_f_o <= instr_f_i;
	end

end
endmodule
