`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.06.2022 16:05:43
// Design Name: 
// Module Name: Radix4BoothMain
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


module Radix4BoothMain(OUT,clk,start,Q_in,M_in);

output reg [15:0] OUT;
input clk,start;
input [7:0] Q_in,M_in;

wire Q1,Q0,Qm1,ldA,shiftA,clrA,ldQ,shiftQ,clrQ,decr,ld_count,clrff,ldM,clrM,done,eqz;
wire [1:0] ALU_op;

DataPath DP(Q1,Q0,Qm1,eqz,ldA,shiftA,clrA,ldQ,shiftQ,clrQ,decr,ld_count,clrff,ldM,clrM,ALU_op,Q_in,M_in,clk);
ControlPath CP(ldA,shiftA,clrA,ldQ,shiftQ,clrQ,decr,ld_count,clrff,ldM,clrM,ALU_op,done,clk,start,Q1,Q0,Qm1,eqz);

always @(posedge done) begin
    OUT={DP.ALU_OUT[9:8],DP.A[5:0],DP.Q};
    $write("=%c",DP.ALU_OUT[9]?45:32);
    $display("%d\n",DP.ALU_OUT[9]?-{DP.ALU_OUT[9:8],DP.A[5:0],DP.Q}:{DP.ALU_OUT[9:8],DP.A[5:0],DP.Q});
end



endmodule
