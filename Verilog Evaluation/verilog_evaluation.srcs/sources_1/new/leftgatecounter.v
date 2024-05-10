`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.03.2024 14:50:25
// Design Name: 
// Module Name: leftgatecounter
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


module leftgatecounter(input clock, leftGateStarted, output reg [2:0] count);

    always @ (posedge clock) begin
        if (leftGateStarted) begin
            count <= (count == 4) ? 4 : count + 1;
        end else begin
            count <= 0;
        end
    
    end
endmodule
