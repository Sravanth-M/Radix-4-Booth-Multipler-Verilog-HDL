`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.06.2022 15:56:08
// Design Name: 
// Module Name: Counter
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


module Counter(count,ld_count,clk,decr);

output reg [2:0]count;
input clk,decr,ld_count;

always @(posedge clk) begin
    if(ld_count) count<=3'b100;
    else if(decr) count<=count-1;
    else count<=count;
end

endmodule
