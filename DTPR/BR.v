module BR(
    input [4:0]RA1,
    input [4:0]RA2,
    input WE,
    input [4:0]AW,
    input [31:0]DW,
    output reg [31:0]DR1,
    output reg [31:0]DR2
);

reg [31:0] memory [0:31];

initial
begin
    $readmemb("DATA.txt", memory);

end

always @*
begin
    DR1 = memory[RA1];
    DR2 = memory[RA2];

    if(WE)
    begin
        memory[AW] = DW;
    end
end

endmodule