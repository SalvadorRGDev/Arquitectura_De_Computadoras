module Slt32_comportamental(input signed [31:0]A_SLT, input signed[31:0]B_SLT, output [31:0]R_SLT);

	assign R_SLT = (A_SLT < B_SLT) ? 32'b1 : 32'b0;

endmodule
