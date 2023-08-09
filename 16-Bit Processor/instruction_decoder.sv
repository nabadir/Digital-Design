`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/06/2022 12:00:51 PM
// Design Name: 
// Module Name: instruction_decoder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module instruction_decoder(
    input [6:0] immediate,
    input [5:0] nzimm,
    input [8:0] offset,
    input [3:0] opcode,
    output reg RegWrite,RegDst,ALUSrc1,ALUSrc2,MemWrite,MemToReg
    ,Regsrc,
    output reg [15:0] instr_i,
    output reg [3:0] ALUOp
    );
    
    always @(opcode)
    begin
    case(opcode)
    4'b0000 :
    begin
    ALUOp = 4'b0000; 
    RegDst  = 1'b0; ALUSrc1 = 1'b1; ALUSrc2 = 1'b1; MemWrite = 1'b0; MemToReg = 1'b1; Regsrc = 1'b0; RegWrite = 1'b1;     
    instr_i = immediate;
    end
    
    4'b0001 :
    begin
    ALUOp = 4'b0000;
    RegDst  = 1'b0; ALUSrc1 = 1'b1; ALUSrc2 = 1'b1; MemWrite = 1'b1; MemToReg = 1'b0; Regsrc = 1'b0; RegWrite = 1'b0; 
    instr_i = immediate; 
    end
    
    4'b0010 :
    begin
    ALUOp = 4'b0000;
    RegDst  = 1'b0; Regsrc <= 1'b1; ALUSrc1 = 1'b0; ALUSrc2 = 1'b0; MemWrite = 1'b0; MemToReg = 1'b0;  RegWrite <= 1'b1;    
    end
    
    4'b0011 :
    begin
    ALUOp = 4'b0000;
    RegDst  = 1'b0; ALUSrc1 = 1'b0; ALUSrc2 = 1'b1; MemWrite = 1'b0; MemToReg = 1'b0; Regsrc = 1'b1; RegWrite = 1'b1;   
    instr_i = nzimm; 
    end
    
    4'b0100 :
    begin
    ALUOp = 4'b0010;     
    RegDst  = 1'b0; ALUSrc1 = 1'b0; ALUSrc2 = 1'b0; MemWrite = 1'b0; MemToReg = 1'b0; Regsrc = 1'b1; RegWrite = 1'b1; 
    end
    
    4'b0101 :
    begin
    ALUOp = 4'b0010; 
    RegDst  = 1'b0; ALUSrc1 = 1'b0; ALUSrc2 = 1'b1; MemWrite = 1'b0; MemToReg = 1'b0; Regsrc = 1'b1; RegWrite = 1'b1; 
    instr_i = immediate;
    end
    
    4'b0110 :
    begin
    ALUOp = 4'b0011; 
    RegDst  = 1'b0; ALUSrc1 = 1'b0; ALUSrc2 = 1'b0; MemWrite = 1'b0; MemToReg = 1'b0; Regsrc = 1'b1; RegWrite = 1'b1; 
    end
    
    4'b0111 :
    begin
    ALUOp = 4'b1000;
    RegDst = 1'b0; ALUSrc1 = 1'b0; ALUSrc2 = 1'b0; MemWrite = 1'b0; MemToReg = 1'b0; Regsrc = 1'b1; RegWrite = 1'b1;  
    end
    
    4'b1000 :
    begin
    ALUOp = 4'b0100;
    RegDst  = 1'b0; ALUSrc1 = 1'b0; ALUSrc2 = 1'b1; MemWrite = 1'b0; MemToReg = 1'b0; Regsrc = 1'b1; RegWrite = 1'b1;
    instr_i = nzimm;
    end
    
    4'b1001 :
    begin
    RegWrite <= 1'b1; RegDst  <= 1'b0; ALUSrc1 <= 1'b0; ALUSrc2 <= 1'b1; MemWrite <= 1'b0; MemToReg <= 1'b0; Regsrc <= 1'b1;
    ALUOp <= 4'b0101;
    instr_i = nzimm; 
    end
    
    4'b1010 :
    begin
    ALUOp = 4'b0110;
    RegDst  = 1'b0; ALUSrc1 = 1'b0; ALUSrc2 = 1'b1; MemWrite = 1'b0; MemToReg = 1'b0; Regsrc = 1'b0; RegWrite = 1'b0;
    instr_i = offset; 
    end
    
    4'b1011 :
    begin
    ALUOp = 4'b0111;
    RegDst  = 1'b0; ALUSrc1 = 1'b0; ALUSrc2 = 1'b1; MemWrite = 1'b0; MemToReg = 1'b0; Regsrc = 1'b0; RegWrite = 1'b0; 
    instr_i = offset;  
    end
    
    endcase
    end
endmodule
