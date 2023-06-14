`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.06.2022 15:00:08
// Design Name: 
// Module Name: ShiftRegisterA
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


module ShiftRegisterA(data_out,data_in,ld,clr,shift_in,shift,clk);

output reg [7:0] data_out;
input [9:0] data_in;
input [1:0] shift_in;
input ld,clr,shift,clk;  
reg [9:0] temp;

always @(posedge clk) begin
    if(clr) data_out<=0;
    else if(ld) data_out<=data_in[7:0];
    else if(shift) begin 
                        if(ld) data_out<={shift_in,data_out[7:2]};
                        else data_out<={data_out[7],data_out[7],data_out[7:2]};    
                   end 
end


endmodule
