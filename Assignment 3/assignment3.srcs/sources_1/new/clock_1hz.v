`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.02.2024 22:02:44
// Design Name: 
// Module Name: clock_1hz
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


module clock_1hz(input CLOCK, output reg clock1);

    reg [31:0] COUNT = 0;
    
    always @ (posedge CLOCK) begin
       COUNT <= (COUNT == 49999999) ? 0 : COUNT + 1;
       clock1 <= (COUNT == 0) ? ~clock1 : clock1;
    end    
    
endmodule
