module alu #(
    parameter DATA_WIDTH = 32
    )(
    input [DATA_WIDTH-1:0] a,b,
    input [5:0] alu_controls,
    input funct3b0,
    output reg [DATA_WIDTH-1:0] res
);

always @(*) begin
    case(alu_controls)
        6'b000000: res = a+b;
        6'b000001: res = a-b;
        6'b000010: res = a << (b[4:0]);
        6'b000011: res = ($signed(a) < $signed(b)) ? 32'd1 : 32'd0;
        6'b000100: res = ($unsigned(a) < $unsigned(b)) ? 32'd1 : 32'd0;
        6'b000101: res = a^b;
        6'b000110: res = a >> (b[4:0]);
        6'b000111: res = $signed(a) >>> (b[4:0]);
        6'b001000: res = a | b;
        6'b001001: res = a & b;
        6'b001010: res = ((a == b) ^ funct3b0) ? 32'd1 : 32'd0;
        6'b001011: res = ((a < b) ^ funct3b0) ? 32'd1 : 32'd0;
        6'b001100: res = (($signed(a) < $signed(b)) ^ funct3b0) ? 32'd1 : 32'd0;
        6'b001101: res = b;
        // p type

        default: res = 32'd0;
    endcase
end
endmodule
