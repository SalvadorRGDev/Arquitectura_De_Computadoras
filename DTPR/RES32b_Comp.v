module R32_comportamental(input [31:0]A_RES, input [31:0]B_RES, output [31:0]R_RES);

	assign R_RES = A_RES - B_RES;

endmodule
