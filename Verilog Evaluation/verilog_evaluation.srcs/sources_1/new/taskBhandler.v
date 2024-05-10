`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.03.2024 21:55:31
// Design Name: 
// Module Name: taskBhandler
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


module taskBhandler(input CLOCK, sw5, sw10,
                    output leftGateStarted, rightGateStarted,
                    output [15:0] LEDout);
    
    wire [4:0] leftgate_LEDout;
    wire [6:0] rightgate_LEDout;
    
    leftgate(CLOCK, sw10, leftGateStarted, leftgate_LEDout); // 14, 13, 12, 11, 10
    rightgate(CLOCK, sw5, rightGateStarted, rightgate_LEDout); // 8, 7, 6, 5, 4, 3, 2

    assign LEDout[0] = 0;
    assign LEDout[1] = 0;
    assign LEDout[2] = rightgate_LEDout[0];
    assign LEDout[3] = rightgate_LEDout[1];
    assign LEDout[4] = rightgate_LEDout[2];
    assign LEDout[5] = rightgate_LEDout[3];
    assign LEDout[6] = rightgate_LEDout[4];
    assign LEDout[7] = rightgate_LEDout[5];
    assign LEDout[8] = rightgate_LEDout[6];
    assign LEDout[9] = 0;
    assign LEDout[10] = leftgate_LEDout[0];
    assign LEDout[11] = leftgate_LEDout[1];
    assign LEDout[12] = leftgate_LEDout[2];
    assign LEDout[13] = leftgate_LEDout[3];
    assign LEDout[14] = leftgate_LEDout[4];
    assign LEDout[15] = 0;
    
endmodule
