`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.02.2024 22:10:43
// Design Name: 
// Module Name: led_A_handler
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


module led_A_handler(input basys_clock, clock_100hz, clock_10hz, clock_1hz, input [3:0] count, input sw0, sw1, sw2, 
                     output reg [10:0] LEDS = 0, output reg maxLED_reached = 0);
    
    always @ (posedge basys_clock) 
    begin
    
    if (!LEDS[10]) begin
        case(count)
        4'b0000: begin
        LEDS = 11'b00000000000;
        end
        
        4'b0001: begin
        LEDS = 11'b00000000001;
        end
        
        4'b0010: begin
        LEDS = 11'b00000000011;
        end
        
        4'b0011: begin
        LEDS = 11'b00000000111;
        end
        
        4'b0100: begin
        LEDS = 11'b00000001111;
        end
        
        4'b0101: begin
        LEDS = 11'b00000011111;
        end
        
        4'b0110: begin
        LEDS = 11'b00000111111;
        end
        
        4'b0111: begin
        LEDS = 11'b00001111111;
        end
        
        4'b1000: begin
        LEDS = 11'b00011111111;
        end
        
        4'b1001: begin
        LEDS = 11'b00111111111;
        end
        
        4'b1010: begin
        LEDS = 11'b01111111111;
        end
        
        4'b1011: begin
        LEDS = 11'b11111111111;
        maxLED_reached = 1;
        end
        
        endcase 
    end
         
    if (maxLED_reached && sw2) begin
        LEDS[2] <= clock_100hz;
        LEDS[1:0] <= 2'b11;
    end else if (maxLED_reached && sw1) begin
        LEDS[1] <= clock_10hz;
        LEDS[2] = 1;
        LEDS[0] = 1;
    end else if (maxLED_reached && sw0) begin
        LEDS[0] <= clock_1hz;
        LEDS[2:1] <= 2'b11;
    end else if (maxLED_reached) begin
        LEDS[2:0] <= 3'b111;
    end
    
end
    
    
endmodule
