`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.02.2024 22:00:07
// Design Name: 
// Module Name: taskC_counter
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


module taskC_counter (input clock, output reg [1:0] COUNT = 0);
    
    always @ (posedge clock) begin
        COUNT <= (COUNT == 2'b10) ? 0 : COUNT + 1;
    end
    
endmodule
