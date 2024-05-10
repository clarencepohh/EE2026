`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.03.2024 20:34:42
// Design Name: 
// Module Name: main
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


module main(input  CLOCK,
            input  [15:0] sw,
            input  btnu, btnd, btnl, btnr, btnc,
            output [3:0] AN,
            output [7:0] SEG,
            output [15:0] LED);
    
    wire clock2hz, taskBcomplete;
    wire [3:0] taskA_anout, taskC_anout;
    wire [7:0] taskA_segout, taskC_segout;
    wire [15:0] taskB_LEDout, taskC_LEDout;
    wire leftGateStarted, rightGateStarted, isHolding;
    
    reg [5:0] reg_to_use_remember_to_change_size = 5'b11111;
    
    flexible_clock(CLOCK, /* change desired count -> */ 24999999, clock2hz);    
    
    // task A
    taskAhandler(sw[0], sw[15], btnl, btnr, taskA_anout, taskA_segout);
    
    // task B 
    taskBhandler(CLOCK, sw[5], sw[10], leftGateStarted, rightGateStarted, taskB_LEDout);
    
    // task C 
    taskChandler(CLOCK, btnd, leftGateStarted, rightGateStarted, taskC_anout, taskC_segout, taskC_LEDout, isHolding);
    
    assign AN  = (leftGateStarted && rightGateStarted) ? taskC_anout  : taskA_anout;
    assign SEG = (leftGateStarted && rightGateStarted) ? taskC_segout : taskA_segout;
    assign LED = (isHolding) ? taskC_LEDout : taskB_LEDout;
    
endmodule
