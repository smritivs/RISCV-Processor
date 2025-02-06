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
        // p type
        5'b10000: res = {(a[31:16]+b[31:16]) << 16,a[15:0]+b[15:0]};
        5'b10001: res = {(a[31:16]-b[31:16]) << 16,a[15:0]-b[15:0]};
        5'b10010: res = {(a[31:16]+b[31:16]) << 16,a[15:0]-b[15:0]};
        5'b10011: res = {(a[31:16]-b[31:16]) << 16,a[15:0]+b[15:0]};
        5'b10100: res = {(a[31:24]+b[31:24]) << 24,(a[23:16]+b[23:16]) << 16,(a[15:8]+b[15:8]) << 8,a[7:0]+b[7:0]};
        5'b10101: res = {(a[31:24]-b[31:24]) << 24,(a[23:16]-b[23:16]) << 16,(a[15:8]-b[15:8]) << 8,a[7:0]-b[7:0]};
        5'b10110: res = {($signed(a[31:16]) >>> b[20:16]) << 16, $signed(a[15:0]) >> b[4:0]};
        5'b10111: res = {(a[31:16] >> b[20:16]) << 16, a[15:0] >> b[4:0]};
        5'b11000: res = {(a[31:16] << b[20:16]) << 16,a[15:0] << b[4:0]};
        5'b11001: res = {($signed(a[31:24]) >>> b[28:24]) << 24, ($signed(a[23:16]) >>> b[20:16]) << 16, ($signed(a[15:8]) >>> b[12:8]) << 8, $signed(a[7:0]) >>> b[4:0]};
        5'b11010: res = {((a[31:24]) >> b[28:24]) << 24, ((a[23:16]) >> b[20:16]) << 16, ((a[15:8]) >> b[12:8]) << 8, (a[7:0]) >> b[4:0]};
        5'b11011: res = {((a[31:24]) << b[28:24]) << 24, ((a[23:16]) << b[20:16]) << 16, ((a[15:8]) << b[12:8]) << 8, (a[7:0]) << b[4:0]};
        5'b11100: res = {($signed(a[31:16])*$signed(b[31:16])) << 16,$signed(a[15:0])+$signed(b[15:0])};
        5'b11101: res = {(a[31:16]*b[31:16]) << 16,a[15:0]*b[15:0]};
        5'b11110: res = {($signed(a[31:24])*$signed(b[31:24])) << 24,($signed(a[23:16])*$signed(b[23:16])) << 16,($signed(a[15:8])*$signed(b[15:8])) << 8,$signed(a[7:0])*$signed(b[7:0])};
        5'b11111: res = {(a[31:24]*b[31:24]) << 24,(a[23:16]*b[23:16]) << 16,(a[15:8]*b[15:8]) << 8,a[7:0]*b[7:0]};
        default: res = 32'd0;
    endcase
end
endmodule
