module mux2a1(
    input  [31:0] entrada1, entrada2,
    input  MemToReg,
    output reg [31:0] Resultado
);

always @(*) begin
    case (MemToReg)
        1'b0: Resultado = entrada1;
        1'b1: Resultado = entrada2;
        default: Resultado = 32'b0;
    endcase
end

endmodule
