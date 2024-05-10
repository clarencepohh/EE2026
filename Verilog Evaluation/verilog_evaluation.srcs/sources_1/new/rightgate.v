`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.03.2024 14:59:41
// Design Name: 
// Module Name: rightgate
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


module rightgate(input CLOCK, sw10, 
                output reg rightGateStarted = 0,
                output reg [6:0] LEDout = 7'b0000000);

    wire clockp9hz;
    wire [2:0] count;

    flexible_clock(CLOCK, 55555554, clockp9hz);
    rightgatecounter(clockp9hz, rightGateStarted, count);

    always @ (posedge CLOCK) 
    begin
    
        if (sw10) begin
            rightGateStarted = 1;
            
            case (count)
                3'b000: begin
                    LEDout = 7'b0000001;
                end
            
                3'b001: begin
                    LEDout = 7'b0000011;
                end 
                        
                3'b010: begin
                    LEDout = 7'b0000111;
                end
                        
                3'b011: begin
                    LEDout = 7'b0001111;
                end
                        
                3'b100: begin
                    LEDout = 7'b0011111;
                end
                
                3'b101: begin
                    LEDout = 7'b0111111;
                end
                
                3'b110: begin
                    LEDout = 7'b1111111;
                end
                
                endcase
//        end else begin 
//            rightGateStarted = 0;
//            LEDout = 7'b0000000;
        end
    
    end

endmodule