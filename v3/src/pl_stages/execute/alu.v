module alu #(
    parameter DATA_WIDTH = 32
    )(
    input [DATA_WIDTH-1:0] a,b,
    input [4:0] alu_controls,
    input funct3b0,
    output reg [DATA_WIDTH-1:0] res
);

always @(*) begin
    case(alu_controls)
        5'b00000: res = a+b;
        5'b00001: res = a-b;
        5'b00010: res = a << (b[4:0]);
        5'b00011: res = ($signed(a) < $signed(b)) ? 32'd1 : 32'd0;
        5'b00100: res = ($unsigned(a) < $unsigned(b)) ? 32'd1 : 32'd0;
        5'b00101: res = a^b;
        5'b00110: res = a >> (b[4:0]);
        5'b00111: res = $signed(a) >>> (b[4:0]);
        5'b01000: res = a | b;
        5'b01001: res = a & b;
        5'b01010: res = ((a == b) ^ funct3b0) ? 32'd1 : 32'd0;
        5'b01011: res = ((a < b) ^ funct3b0) ? 32'd1 : 32'd0;
        5'b01100: res = (($signed(a) < $signed(b)) ^ funct3b0) ? 32'd1 : 32'd0;
        5'b01101: res = b;
        default: res = 32'd0;
    endcase
end
endmodule
