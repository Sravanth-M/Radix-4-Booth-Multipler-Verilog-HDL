`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.06.2022 16:49:34
// Design Name: 
// Module Name: ControlPath
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


module ControlPath(ldA,shiftA,clrA,ldQ,shiftQ,clrQ,decr,ld_count,clrff,ldM,clrM,ALU_op,done,clk,start,Q1,Q0,Qm1,eqz);

output reg ldA,shiftA,clrA,ldQ,shiftQ,clrQ,decr,ld_count,clrff,ldM,clrM,done;
output reg [1:0] ALU_op;
input start,clk,Q1,Q0,Qm1,eqz;

parameter IDLE=4'b0000,LOAD=4'b0001,COMP=4'b0010,A1=4'b0011,A2=4'b0100,A3=4'b0101,A4=4'b0110,SHIFT=4'b0111,DONE=4'b1000;
reg [3:0]PS=0,NS;

always @(posedge clk) PS<=NS;

always @(PS) begin
    case(PS)
        IDLE:  begin ldA=0; shiftA=0; clrA=1; ldQ=0; shiftQ=0; clrQ=1; decr=0; ld_count=0; clrff=1; ldM=0; ALU_op=0; clrM=0; done=0; end
        LOAD:  begin ldQ=1; ldM=1; clrA=0; clrQ=0; clrff=0; ld_count=1; end
        COMP:  begin shiftA=0; shiftQ=0; decr=0; ldQ=0; ldM=0; ld_count=0; end
        A1:    begin ALU_op=0; ldA=1; decr=0; shiftA=0; shiftQ=0; end           
        A2:    begin ALU_op=1; ldA=1; decr=0; shiftA=0; shiftQ=0; end           
        A3:    begin ALU_op=2; ldA=1; decr=0; shiftA=0; shiftQ=0; end           
        A4:    begin ALU_op=3; ldA=1; decr=0; shiftA=0; shiftQ=0; end           
        SHIFT: begin shiftA=1; shiftQ=1; ldA=0; decr=1; end 
        DONE:  begin done=1; shiftA=0; shiftQ=0;  end  
        default: begin ldA=0; shiftA=0; clrA=0; ldQ=0; shiftQ=0; clrQ=0; decr=0; ld_count=0; clrff=0; ldM=0; ALU_op=0; clrM=0; done=0;   end              
    endcase
end

always @(PS or Q1 or Q0 or Qm1 or eqz) begin
    case(PS)
        IDLE:  begin 
                  if(start) NS=LOAD;
                  else NS=IDLE;
               end
        LOAD:  begin 
                  NS=COMP;                       
               end
        COMP:  begin 
                  if(({Q1,Q0,Qm1}==3'b000 || {Q1,Q0,Qm1}==3'b111) && !eqz) NS=SHIFT;           
                  else if(({Q1,Q0,Qm1}==3'b001 || {Q1,Q0,Qm1}==3'b010) && !eqz) NS=A1;
                  else if(({Q1,Q0,Qm1}==3'b101 || {Q1,Q0,Qm1}==3'b110) && !eqz) NS=A2;
                  else if(({Q1,Q0,Qm1}==3'b011) && !eqz) NS=A3;
                  else if(({Q1,Q0,Qm1}==3'b100) && !eqz) NS=A4; 
                  else if(eqz) NS=DONE;               
               end
        A1:    begin NS=SHIFT; end           
        A2:    begin NS=SHIFT; end           
        A3:    begin NS=SHIFT; end           
        A4:    begin NS=SHIFT; end           
        SHIFT: begin 
                  if (eqz) NS=DONE;
                  else NS=COMP;
               end 
        DONE:  begin NS=DONE;  end  
        default: begin NS=IDLE;   end              
    endcase    
end

endmodule
