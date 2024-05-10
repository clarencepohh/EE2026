`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.02.2024 23:17:27
// Design Name: 
// Module Name: clock_10hz
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


module clock_10hz(input CLOCK, output reg clock10);

    reg [31:0] COUNT = 0;
    
    always @ (posedge CLOCK) begin
       
       COUNT <= (COUNT == 4999999) ? 0 : COUNT + 1;
       clock10 <= (COUNT == 0) ? ~clock10 : clock10;
        
    end    
    
endmodule
