`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.03.2024 15:31:57
// Design Name: 
// Module Name: taskCcounter
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


module taskCcounter(input leftGateStarted, rightGateStarted, clock, output reg [2:0] count);

    always @ (posedge clock) begin
        if (leftGateStarted && rightGateStarted) begin
            count = (count == 8 ) ? 0 : count + 1;
        end else begin
            count = 0;
        end
    end

endmodule
