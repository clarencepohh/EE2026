`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.03.2024 11:32:04
// Design Name: 
// Module Name: debouncer
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


module debouncer(
    input clock,
    input btn,
    output reg debounce = 0
    );

    reg[31:0] count = 0;
    
    always @ (posedge clock) begin
        if (btn && !debounce) begin
            debounce <= 1;
        end
        if (debounce) begin
            if (count < 20000000) begin
                count <= count + 1;
            end
            else if (count == 20000000) begin
                debounce <= 0;
                count <= 0;
            end
        end
    end

endmodule
