`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.04.2024 23:25:05
// Design Name: 
// Module Name: counter2s
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


module counter2s (input CLOCK, reset,
                  output reg [2:0] COUNTER = 0);
    
    always @ (posedge CLOCK) begin
    
        if (reset == 0) begin 
            COUNTER <= (COUNTER == 2) ? 2 : COUNTER + 1; 
        end else begin
            COUNTER <= 0;
        end
       
    end
endmodule
