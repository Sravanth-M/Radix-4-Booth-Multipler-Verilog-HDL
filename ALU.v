`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.06.2022 16:24:41
// Design Name: 
// Module Name: ALU
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


module ALU(OUT,IN1,IN2,ALU_op);

output reg [9:0] OUT;
reg [9:0] TEMP1,TEMP2;
input [7:0]IN1,IN2;
input [1:0]ALU_op;

always @(*) begin
    TEMP1={IN1[7],IN1[7],IN1};
    TEMP2={IN2[7],IN2[7],IN2};
    case(ALU_op)
        2'b00: OUT=TEMP1+TEMP2;
        2'b01: OUT=TEMP1-TEMP2;
        2'b10: OUT=TEMP1+(TEMP2<<1);
        2'b11: OUT=TEMP1-(TEMP2<<1);
    endcase
end

endmodule
