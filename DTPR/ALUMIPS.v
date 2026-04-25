module ALUMIPS(
	input [31:0] A,
	input [31:0] B, 
	input [3:0]ALUct1, 
	output [31:0] R
	);

	wire [31:0] suma_w;
	wire [31:0] resta_w;
	wire [31:0] and_w;
	wire [31:0] or_w;
	wire [31:0] slt_w;

	S32_comportamental A1(.A_SUM(A), .B_SUM(B), .R_SUM(suma_w));
	R32_comportamental A2(.A_RES(A), .B_RES(B), .R_RES(resta_w));
	And32_comportamental A3(.A_AND(A), .B_AND(B), .R_AND(and_w));
	Or32_comportamental A4(.A_OR(A), .B_OR(B), .R_OR(or_w));
	Slt32_comportamental A5(.A_SLT(A), .B_SLT(B), .R_SLT(slt_w));
	
	mux5a1 MUX_ALU(
		.suma(suma_w),
		.resta(resta_w),
		._or(or_w),
		._and(and_w),
		.slt(slt_w),
		.ALUct1(ALUct1),
		.Resultado(R)
	);
	
endmodule
