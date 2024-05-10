`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.02.2024 22:18:05
// Design Name: 
// Module Name: taskC_anodeswitcher
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


module taskC_anodeswitcher(input B_complete, clock, input [1:0] countC, 
                           output reg [7:0] taskC_seg, output reg [3:0] taskC_an);
    always @ (posedge clock) 
    begin
        case(countC) 
        2'b00: begin
            taskC_an <= 4'b1110;
            taskC_seg <= 8'b10101111; 
        end
        
        2'b01: begin
            taskC_an <= 4'b1101;
            taskC_seg <= 8'b11100011; 
        end
        
        2'b10: begin
            taskC_an <= 4'b1011;
            taskC_seg <= 8'b11001111; 
        end
        
        endcase
    
    end
endmodule
