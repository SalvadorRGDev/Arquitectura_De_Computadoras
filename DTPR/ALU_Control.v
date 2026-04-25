module Alu_Control(
    input   [5:0]funct,
    input   [2:0]ALUOp,
    output reg [3:0]Operation
);
always @(*) begin
    Operation = 4'b0000;
    case(ALUOp)
        3'b010:
            begin
                case(funct)
                    6'b100100: Operation = 4'b0000;
                    6'b100101: Operation = 4'b0001;
                    6'b100000: Operation = 4'b0010;
                    6'b100010: Operation = 4'b0011;
                    6'b101010: Operation = 4'b0100;
                    default:   Operation = 4'b0000;
                endcase 
            end
    endcase
end

endmodule
