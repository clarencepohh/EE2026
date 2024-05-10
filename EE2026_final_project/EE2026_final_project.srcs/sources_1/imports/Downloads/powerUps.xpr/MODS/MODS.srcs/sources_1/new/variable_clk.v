`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.03.2024 21:40:53
// Design Name: 
// Module Name: variable_clk
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


module variable_clk(
    input clk,
    input [31:0]m,
    output reg slow_clk
    );
    reg [31:0] count = 0;
    
    always @ (posedge clk)
    begin
       count <= (count == m) ? 0 : count + 1;
       slow_clk <= (count == 0) ? ~slow_clk : slow_clk;
    end 
endmodule
