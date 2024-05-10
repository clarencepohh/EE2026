`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.04.2024 19:49:17
// Design Name: 
// Module Name: soundCounter2
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
module soundCounter2(
    input CLOCK,
    output reg [5:0] COUNTER = 0
    );
    
    always @ (posedge CLOCK) begin
        COUNTER <= (COUNTER == 6)? 6 : COUNTER + 1;
    end
endmodule
