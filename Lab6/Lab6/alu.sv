`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/11/2022 07:40:48 PM
// Design Name: 
// Module Name: alu
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


module alu(
    input [15:0] a,b,
    input [3:0] s,
    output reg [15:0] f,
    output reg ovf,
    output reg take_branch
    );
    
    
   
    
    always@(*)
    
    begin

        case(s)
          4'b0000:  begin
                    f = a + b;
                    ovf = f[15];
                    take_branch = 0;
                    end
                    
          4'b0001:  begin
                    f = ~b;
                    ovf = 0;
                    take_branch = 0;
                    end
                    
          4'b0010:  begin
                    f = a&b;
                    ovf = 0;
                    take_branch = 0;
                    end
                    
          4'b0011:  begin
                    f = a|b;
                    ovf = 0;
                    take_branch = 0;
                    end
                    
          4'b0100:  begin
                    f = a>>>b;
                    ovf = 0;
                    take_branch = 0;
                    end
                    
          4'b0101:  begin
                    f = a<<b;
                    ovf = 0;
                    take_branch = 0;
                    end
                    
          4'b0110:  begin
                    f = 0;
                    if (a == 0) take_branch = 1;
                    else take_branch = 0;
                    ovf = 0;
                    end
                    
          4'b0111:  begin
                    f = 0;
                    if (a != 0) take_branch = 1;
                    else take_branch = 0;
                    ovf = 0;
                    end
                    
          4'b1000:  begin
                    f = a^b;
                    ovf = 0;
                    take_branch = 0;
                    end
                    
          default : begin
                    f = 0;
                    ovf = 0;
                    take_branch = 0;
                    end
                    
          
        endcase
    end
    
endmodule
