`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.02.2024 21:27:03
// Design Name: 
// Module Name: taskC_cycler
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


module taskC_clockselector(input sw0, sw1, sw2, B_complete, clock, clock_2hz, clock_20hz, clock_200hz,
                           output reg selected_clock = 0);
    
    always @ (posedge clock) 
    begin
        if (B_complete) begin
            if (sw2) begin
                selected_clock <= clock_200hz;
            end else if (sw1) begin
                selected_clock <= clock_20hz;
            end else if (sw0) begin
                selected_clock <= clock_2hz;
            end else begin
                selected_clock <= 0;
            end
        end
    end

endmodule
