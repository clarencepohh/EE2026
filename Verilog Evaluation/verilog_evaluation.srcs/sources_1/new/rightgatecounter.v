`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.03.2024 15:03:45
// Design Name: 
// Module Name: rightgatecounter
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


module rightgatecounter(input clock, rightGateStarted, output reg [2:0] count);

    always @ (posedge clock) begin
        if (rightGateStarted) begin
            count <= (count == 6) ? 6 : count + 1;
        end else begin
            count <= 0;
        end
    
    end
endmodule