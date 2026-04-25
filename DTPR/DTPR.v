module DTPR(input [31:0]inst, output [31:0] resultado);

    //Separacion de la intruccion de entrada de 32 bits.
    wire [5:0] op;
    wire [4:0] rs;
    wire [4:0] rt;
    wire [4:0] rd;
    wire [4:0] shamt;
    wire [5:0] funct;

    //Salidas del modulo "Unidad de Control".
    wire MemToReg;
    wire MemToRead;
    wire MemToWrite;
    wire [2:0]ALUOp;
    wire RegWrite;

    //Salida de "ALU Control".
    wire [3:0]Operation_ALU;

    //Entradas y salidas de la ALU.
    wire [31:0]op1;
    wire [31:0]op2;
    wire [31:0]res;

    //entrada y salida del MUX 2:1 final.
    wire [31:0] salida_rd;
    wire [31:0] final;

    //Se asigna el arreglo de bits correspondiente a cada variable.
    assign op    = inst[31:26];
    assign rs    = inst[25:21];
    assign rt    = inst[20:16];
    assign rd    = inst[15:11];
    assign shamt = inst[10:6];
    assign funct = inst[5:0];

    //Instanciado de los modulos correspondientes
    U_CONTROL U_C(
        .OP(op),
        .MemToReg(MemToReg),
        .MemToRead(MemToRead),
        .MemToWrite(MemToWrite),
        .ALUOp(ALUOp),
        .RegWrite(RegWrite)
    );

    BR banco_registros(
        .RA1(rs),
        .RA2(rt),
        .WE(RegWrite),
        .AW(rd),
        .DW(final),
        .DR1(op1),
        .DR2(op2)
    );

    Alu_Control ALU_Control(
        .funct(funct),
        .ALUOp(ALUOp),
        .Operation(Operation_ALU)
    );

    ALUMIPS alu(
        .A(op1),
        .B(op2),
        .ALUct1(Operation_ALU),
        .R(res)
    );

    MEM rom(
        .WE(MemToWrite),
        .RE(MemToRead),
        .dir(res),
        .wd(op2),
        .rd(salida_rd)
    );

    mux2a1 multiplexor2a1(
        .entrada1(res),
        .entrada2(salida_rd),
        .MemToReg(MemToReg),
        .Resultado(final)
    );

    assign resultado = final;

endmodule