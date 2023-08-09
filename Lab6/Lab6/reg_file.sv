`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/18/2022 11:51:39 AM
// Design Name: 
// Module Name: reg_file
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


module regfile(
    input rst,clk,wr_en,
    input [15:0] wr_data,
    input [2:0] rd0_addr,rd1_addr,wr_addr,
    output reg [15:0] rd0_data,rd1_data,
    reg [15:0] register [0:7]
    
    );
    
    
        assign rd0_data = register[rd0_addr];
        assign rd1_data = register[rd1_addr];
    always@(posedge clk)
    begin
    if (rst == 1)
    begin
        int i;
        for(i = 0; i < 8; i = i + 1)begin
            register[i] <= 16'b000000000000000;
        end 
    end
    if (wr_en == 1)
        begin
        register[wr_addr] = wr_data;
        end

    end

endmodule
