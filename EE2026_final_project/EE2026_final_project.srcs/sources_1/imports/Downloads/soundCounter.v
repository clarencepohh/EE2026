`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.04.2024 23:55:22
// Design Name: 
// Module Name: soundCounter
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


module soundCounter(
    input CLOCK,
    output reg [5:0] COUNTER = 0
    );
    
    always @ (posedge CLOCK) begin
    
        COUNTER <= (COUNTER == 14)? 14 : COUNTER + 1;
    
    end
endmodule
