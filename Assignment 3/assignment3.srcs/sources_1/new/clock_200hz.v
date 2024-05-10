`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.02.2024 21:37:10
// Design Name: 
// Module Name: clock_200hz
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


module clock_200hz(input CLOCK, output reg clock200);

    reg [31:0] COUNT = 0;
    
    always @ (posedge CLOCK) begin
       COUNT <= (COUNT == 250000) ? 0 : COUNT + 1;
       clock200 <= (COUNT == 0) ? ~clock200 : clock200;
    end    
    
endmodule
