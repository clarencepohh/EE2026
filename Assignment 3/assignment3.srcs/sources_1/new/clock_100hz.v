`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.02.2024 23:20:21
// Design Name: 
// Module Name: clock_100hz
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


module clock_100hz(input CLOCK, output reg clock100);

    reg [31:0] COUNT = 0;
    
    always @ (posedge CLOCK) begin
       
       COUNT <= (COUNT == 499999) ? 0 : COUNT + 1;
       clock100 <= (COUNT == 0) ? ~clock100 : clock100;
        
    end    
    
endmodule
