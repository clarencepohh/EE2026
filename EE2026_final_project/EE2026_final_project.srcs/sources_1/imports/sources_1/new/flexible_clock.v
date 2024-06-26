`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.03.2024 22:55:38
// Design Name: 
// Module Name: flexible_clock
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


module flexible_clock(input CLOCK, 
                      input [31:0] desiredCount, 
                      output reg output_clock = 0);

    reg [31:0] count = 0;

    always @ (posedge CLOCK)
    begin
        count <= (count == desiredCount) ? 0 : count + 1;
        output_clock <= (count == 0) ? ~output_clock : output_clock;
    end 
    
    
endmodule
