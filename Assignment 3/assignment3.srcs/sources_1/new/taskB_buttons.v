`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.02.2024 20:33:31
// Design Name: 
// Module Name: taskB_buttons
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


module taskB_buttons(input clock, BTNL, BTNR, BTNU, A_complete, 
                     output reg led15_control = 0, output reg B_complete = 0, output reg [7:0]segB = 8'b11111111, output reg [3:0]anB = 4'b1111);
    
    reg [3:0] step_num = 0;

    always @ (posedge clock) 
    begin
        if (A_complete && !B_complete) begin
            if (step_num == 4'b0000) begin
                step_num <= 4'b0001;
                anB <= 4'b1110;
                segB <= 8'b10101111; 
            end else if (step_num == 4'b0001 && BTNR) begin
                step_num <= 4'b0011;
                anB <= 4'b1101;
                segB <= 8'b11100011; 
            end else if (step_num == 4'b0011 && BTNU) begin
                step_num <= 4'b0111;
                anB <= 4'b1011;
                segB <= 8'b11001111; 
            end else if (step_num == 4'b0111 && BTNL) begin
                step_num <= 4'b1111;
                anB <= 4'b0111;
                segB <= 8'b11100011; 
            end else if (step_num == 4'b1111 && BTNU) begin
                B_complete <= 1;
                anB <= 4'b1101;
                segB <= 8'b10101111;
                led15_control <= 1;
            end
        end
    end
    
endmodule
