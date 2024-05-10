`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.03.2024 21:16:22
// Design Name: 
// Module Name: taskAhandler
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

/*
to display an 'A' on the display
 _
| |
|-|(.) - no DP
8'b10001000;
segment is active-low: '1' for off, '0' for on.
anode is active-low  : '1' for off, '0' for on.
*/

`define AN0_ON 4'b1110;
`define AN1_ON 4'b1101;
`define AN2_ON 4'b1011;
`define AN3_ON 4'b0111;
`define ANODES_OFF 4'b1111;

`define ANODE_DISPLAY 8'b11100010 // modify this for desired segment display
`define ANODE_OFF 8'b11111111

module taskAhandler(input sw0, sw15, btnl, btnr,
                    output [3:0] taskA_anout,
                    output [7:0] taskA_segout);
    
    assign taskA_anout[0] = 1;
    assign taskA_anout[1] = (sw0  && btnr ) ? 0 : 1;
    assign taskA_anout[2] = (sw15 && btnl ) ? 0 : 1;
    assign taskA_anout[3] = 1;
    
    assign taskA_segout = ( (sw0 && btnr) || (sw15 && btnl) ) ? `ANODE_DISPLAY : `ANODE_OFF;
    
endmodule
