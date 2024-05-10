`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.03.2024 03:07:48
// Design Name: 
// Module Name: variable_counter
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


module display_counter(
    input clock,
    input m,
    input startDisplay,
    output reg activate = 0
    );
    reg init = 0;
    reg[31:0] count;
    
    always @ (posedge clock) begin
        if (!startDisplay) begin
            count = 0;
            init = 0;
            activate = 0;
        end
        if (startDisplay && !init) begin
            init = 1;
        end
        if (init) begin
            count <= (count == m) ? m : count + 1;
        end
        if (count == m) begin
            activate = 1;
        end
    end
endmodule
