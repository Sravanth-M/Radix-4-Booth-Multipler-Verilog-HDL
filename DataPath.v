`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.06.2022 23:10:07
// Design Name: 
// Module Name: DataPath
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


module DataPath(Q1,Q0,Qm1,eqz,ldA,shiftA,clrA,ldQ,shiftQ,clrQ,decr,ld_count,clrff,ldM,clrM,ALU_op,Q_in,M_in,clk);

output Q1,Q0,Qm1,eqz;
input ldA,shiftA,clrA,ldQ,shiftQ,clrQ,decr,ld_count,clrff,ldM,clrM,clk;
input [7:0] Q_in,M_in;
input [1:0]ALU_op;

wire [7:0] A,Q,M;
wire [9:0] ALU_OUT;
wire [2:0] count;

assign eqz=~|count;
assign Q1=Q[1];
assign Q0=Q[0];

ShiftRegisterA Areg(A,ALU_OUT,ldA,clrA,ALU_OUT[9:8],shiftA,clk);
ShiftRegister Qreg(Q,Q_in,ldQ,clrQ,{A[1],A[0]},shiftQ,clk);
PIPO1 Mreg(M,M_in,clk,ldM,clrM);
ALU Booth4ALU(ALU_OUT,A,M,ALU_op);
Counter count8(count,ld_count,clk,decr);
Dff Qm1ff(Qm1,Q[1],clk,clrff);

endmodule
