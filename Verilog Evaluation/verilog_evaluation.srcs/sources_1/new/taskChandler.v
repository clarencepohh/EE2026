`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.03.2024 23:26:22
// Design Name: 
// Module Name: taskChandler
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



`define ANODE_OFF 8'b11111111

module taskChandler(input CLOCK, btnd, leftGateStarted, rightGateStarted,
                    output [3:0] taskC_anout,
                    output [7:0] taskC_segout,
                    output reg [15:0] LEDout = 16'b0111110111111100,
                    output reg isHolding = 0);
      
    wire clock2p33, held4s;
    
    reg btnd_pressed = 0;
    
    flexible_clock(CLOCK, 42918454, clock2p33); // half of 2.33hz
    taskC_segdisplay(CLOCK, leftGateStarted, rightGateStarted, taskC_anout, taskC_segout);
    always @ (posedge CLOCK) 
    begin 
    
        if (btnd) begin
            btnd_pressed = 1;
            isHolding = 1;
        end else begin
            btnd_pressed = 0;
            isHolding = 0;
        end
      
            
        if (btnd_pressed) begin
            LEDout[0]  = clock2p33;
            LEDout[1]  = clock2p33;
            LEDout[15] = clock2p33;
        end else begin
            LEDout[0]  = 0;
            LEDout[1]  = 0;
            LEDout[15] = 0;
        end
    
    end
endmodule
