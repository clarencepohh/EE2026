`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.04.2024 23:35:49
// Design Name: 
// Module Name: segementChoiceDisplay
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


module segementChoiceDisplay(
    input clock,
    input playerKilled,
    input choice,
    output [3:0]an,
    output [6:0]seg
    );
    
    wire [2:0]anCount;
    wire an_clk;
    
    variable_clk anodeClk(clock, 100000, an_clk);
    anodeIdx (an_clk, choice, anCount);
    
    assign an[0] = (playerKilled && anCount == 0) ? 0 : 1;
    assign an[1] = (playerKilled && anCount == 1) ? 0 : 1;
    assign an[2] = (playerKilled && anCount == 2) ? 0 : 1;
    assign an[3] = 1;
    
    assign seg[0] = ((choice && (anCount == 1)) || (choice && (anCount == 0)) || (!choice && (anCount == 1)) || (!choice && (anCount == 0))) ? 0 : 1;
    assign seg[1] = (anCount == 2 || (!choice && (anCount == 1)) || (!choice && (anCount == 0))) ? 0 : 1;
    assign seg[2] = (anCount == 2 || (choice && (anCount == 0)) || (!choice && (anCount == 1)) || (!choice && (anCount == 0))) ? 0 : 1;
    assign seg[3] = (anCount == 2 || (choice && (anCount == 1)) || (choice && (anCount == 0)) || (!choice && (anCount == 0))) ? 0 : 1;
    assign seg[4] = (anCount == 1 || (choice && (anCount == 1)) || (!choice && (anCount == 1)) || (!choice && (anCount == 0))) ? 0 : 1;
    assign seg[5] = (anCount == 2 || (choice && (anCount == 1)) || (choice && (anCount == 0)) || (!choice && (anCount == 1)) || (!choice && (anCount == 0))) ? 0 : 1;
    assign seg[6] = (anCount == 2 || (choice && (anCount == 1)) || (choice && (anCount == 0))) ? 0 : 1;
    
endmodule
