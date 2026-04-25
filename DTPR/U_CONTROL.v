module U_CONTROL(
    input [5:0]OP,
    output reg MemToReg,
    output reg MemToRead,
    output reg MemToWrite,
    output reg [2:0]ALUOp,
    output reg RegWrite
);
    always @(*) begin
        case(OP)
        	6'b000000: begin
                	RegWrite    = 1'b1;
                	ALUOp       = 3'b010;
                	MemToRead   = 1'b0;
                	MemToWrite  = 1'b0;
                	MemToReg    = 1'b0;
            	end
		default: begin
                	RegWrite    = 1'b0;
                	ALUOp       = 3'b000;
                	MemToRead   = 1'b0;
                	MemToWrite  = 1'b0;
                	MemToReg    = 1'b0;
            	end
        endcase
    end

endmodule
