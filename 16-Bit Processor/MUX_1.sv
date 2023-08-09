`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/18/2022 12:20:43 PM
// Design Name: 
// Module Name: MUX_1
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


module TwoToOneMux(
    input sel_mux,
    input [15:0] a,b,
    output reg [15:0] out
    );
    
    always@(*) 
    begin
    
    if (sel_mux == 1)
    begin
        out = b;
    end
    else
    
    begin
        out = a;
    end
    end
endmodule
