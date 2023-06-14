`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.06.2022 16:32:57
// Design Name: 
// Module Name: ShiftRegister
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


module ShiftRegister(data_out,data_in,ld,clr,shift_in,shift,clk);

output reg [7:0] data_out;
input [7:0] data_in;
input [1:0] shift_in;
input ld,clr,shift,clk;  

always @(posedge clk) begin
    if(clr) data_out<=0;
    else if(ld) data_out<=data_in;
    else if(shift) data_out<={shift_in,data_out[7:2]};
end


endmodule
