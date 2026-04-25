module MEM(
    input WE,
    input RE,
    input [31:0] dir,
    input [31:0] wd,
    output reg [31:0] rd
);

    reg [31:0] memoria [0:31];

    initial begin
        memoria[0] = 32'd5;
        memoria[1] = 32'd15;
        memoria[2] = 32'd25;
        memoria[3] = 32'd35;
        memoria[4] = 32'd45;
        memoria[5] = 32'd55;
        memoria[6] = 32'd65;
        memoria[7] = 32'd75;
        memoria[8] = 32'd85;
    end

    always @(*) begin
        if (WE) 
            memoria[dir] = wd;
        if(RE)
            rd = memoria[dir];
    end

endmodule