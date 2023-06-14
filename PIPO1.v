`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.06.2022 16:21:18
// Design Name: 
// Module Name: PIPO1
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


module PIPO1(OUT,IN,clk,ld,clr);

output reg [7:0]OUT;
input [7:0] IN;
input clk,ld,clr;

always @(posedge clk) begin
    if(clr) OUT<=0;
    else if(ld) OUT<=IN;
end

endmodule
