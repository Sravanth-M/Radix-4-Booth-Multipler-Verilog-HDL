`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.06.2022 23:28:28
// Design Name: 
// Module Name: Radix4Booth_tb
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


module Radix4Booth_tb();

reg clk,start;
reg [7:0] Q_in,M_in;
wire [15:0] OUT;

Radix4BoothMain dut(OUT,clk,start,Q_in,M_in);

initial begin
    clk=0; start=0;
    #3 start=1;
    Q_in=8'b01111011;
    M_in=8'b01011010;
    $write(" %c",Q_in[7]?45:32);
    $write("%d x ",Q_in[7]?(-Q_in):Q_in);
    $write("%c",M_in[7]?45:32);
    $write("%d",M_in[7]?(-M_in):M_in);
    #200 $finish;   
end

always #5 clk=~clk;


endmodule
