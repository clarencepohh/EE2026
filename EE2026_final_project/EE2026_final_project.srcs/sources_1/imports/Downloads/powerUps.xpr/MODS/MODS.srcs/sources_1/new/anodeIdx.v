`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.04.2024 23:48:01
// Design Name: 
// Module Name: anodeIdx
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


module anodeIdx(
    input clock,
    input choice,
    output reg [2:0]count
    );
    
    always @ (posedge clock) begin
        if (choice) begin
            count <= (count == 2) ? 0 : count + 1;
        end
        else begin
            count <= (count == 1) ? 0 : count + 1;
        end
    end
endmodule
