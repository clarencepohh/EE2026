`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.03.2024 14:46:36
// Design Name: 
// Module Name: leftgate
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


module leftgate(input CLOCK, sw10, 
                output reg leftGateStarted = 0,
                output reg [4:0] LEDout = 5'b00000);

    wire clockp25hz;
    wire [2:0] count;

    flexible_clock(CLOCK, 111111110, clockp25hz);
    leftgatecounter(clockp25hz, leftGateStarted, count);

    always @ (posedge CLOCK) 
    begin
    
        if (sw10) begin
            leftGateStarted = 1;
            
            case (count)
                3'b000: begin
                    LEDout = 5'b10000;
                end
            
                3'b001: begin
                    LEDout = 5'b11000;
                end 
                        
                3'b010: begin
                    LEDout = 5'b11100;
                end
                        
                3'b011: begin
                    LEDout = 5'b11110;
                end
                        
                3'b100: begin
                    LEDout = 5'b11111;
                end
                endcase
//        end else begin 
//            leftGateStarted = 0;
//            LEDout = 5'b00000;
        end
    
    end

endmodule
