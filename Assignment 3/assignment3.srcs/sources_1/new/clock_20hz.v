`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.02.2024 21:35:45
// Design Name: 
// Module Name: clock_20hz
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


module clock_20hz(input CLOCK, output reg clock20);

    reg [31:0] COUNT = 0;
    
    always @ (posedge CLOCK) begin
       COUNT <= (COUNT == 2500000) ? 0 : COUNT + 1;
       clock20 <= (COUNT == 0) ? ~clock20 : clock20;
    end    
    
endmodule
