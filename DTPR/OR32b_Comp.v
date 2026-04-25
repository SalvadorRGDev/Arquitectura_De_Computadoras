module Or32_comportamental(input [31:0]A_OR, input [31:0]B_OR, output [31:0]R_OR);

	assign R_OR = A_OR | B_OR;

endmodule

