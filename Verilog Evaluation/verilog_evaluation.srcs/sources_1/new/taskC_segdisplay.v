`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.03.2024 15:25:02
// Design Name: 
// Module Name: taskC_segdisplay
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


`define ANODEFIRST   8'b10000011
`define ANODESECOND  8'b10100011
`define ANODETHIRD   8'b10000111
`define ANODEFOURTH  8'b10001011
`define ANODEFIFTH   8'b00010000
`define ANODESIXTH   8'b00001000
`define ANODESEVENTH 8'b00000111
`define ANODEEIGHT   8'b00000110

module taskC_segdisplay(input CLOCK, leftGateStarted, rightGateStarted, 
                        output reg [3:0] taskC_anout = 4'b1111, 
                        output reg [7:0] taskC_segout = 8'b11111111);
    
    wire clock1p25hz;
    
    wire [2:0] count ;
    flexible_clock(CLOCK, 39999999, clock1p25hz);
    
    taskCcounter (leftGateStarted, rightGateStarted, clock1p25hz, count); 
    
    always @ (posedge CLOCK) 
    begin
        case (count)
        3'b000: begin
            taskC_anout <= 4'b0111;
            taskC_segout <= `ANODEFIRST;
        end
    
        3'b001: begin
            taskC_anout <= 4'b1011;
            taskC_segout <= `ANODESECOND;
        end 
                
        3'b010: begin
            taskC_anout <= 4'b1101;
            taskC_segout <= `ANODETHIRD;
        end
                
        3'b011: begin
            taskC_anout <= 4'b1110;
            taskC_segout <= `ANODEFOURTH;
        end
                
        3'b100: begin
            taskC_anout <= 4'b0111;
            taskC_segout <= `ANODEFIFTH;
        end
        
        3'b101: begin
            taskC_anout <= 4'b1011; 
            taskC_segout <= `ANODESIXTH;
        end
        
        3'b110: begin
            taskC_anout <= 4'b1101;
            taskC_segout <= `ANODESEVENTH;
        end
        
        3'b111: begin
            taskC_anout <= 4'b1110;
            taskC_segout <= `ANODEEIGHT;
        end
        endcase
    
    end
                        
endmodule
