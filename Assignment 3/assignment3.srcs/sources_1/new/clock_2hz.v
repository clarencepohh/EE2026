`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.02.2024 21:31:25
// Design Name: 
// Module Name: clock_2hz
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


module clock_2hz(input CLOCK, output reg clock2);

    reg [31:0] COUNT = 0;
    
    always @ (posedge CLOCK) begin
       COUNT <= (COUNT == 24999999) ? 0 : COUNT + 1;
       clock2 <= (COUNT == 0) ? ~clock2 : clock2;
    end    
    
endmodule
