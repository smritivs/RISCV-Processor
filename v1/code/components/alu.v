
// alu.v - ALU module

module alu #(parameter WIDTH = 32) (
    input       [WIDTH-1:0] a, b,       // operands
    input       [3:0] alu_ctrl,         // ALU control
    output reg  [WIDTH-1:0] alu_out,    // ALU output
    output      zero,                   // zero flag
    output      ge                      // greater than or equal to flag
);

always @(a, b, alu_ctrl) begin
    case (alu_ctrl)
        4'b0000:  alu_out <= a + b;       // ADD
        4'b0001:  alu_out <= a + ~b + 1;  // SUB
        4'b0010:  alu_out <= a & b;       // AND
        4'b0011:  alu_out <= a | b;       // OR
        4'b0100:  alu_out <= a << b;      // Shift left
        4'b0101:  begin                   // SLT
                     if (a[31] != b[31]) alu_out <= a[31] ;// ? 0 : 1;
                     else alu_out <= a < b ? 1 : 0;
                  end
        4'b0110:  begin
                     alu_out <= a < (b[11:0]) ? 1 : 0;
                  end

        4'b0111:  begin
                     alu_out <= a ^ b;
                  end

        4'b1000:  begin
                     alu_out <= (a >> b[4:0]);

                  end

        4'b1001:  begin
                     alu_out <= ($signed(a) >>> $signed(b[4:0]));

                  end

        default: alu_out <= b;
    endcase
end

assign zero = (alu_out == 0) ? 1'b1 : 1'b0;
assign ge = ~alu_out[31];

endmodule

