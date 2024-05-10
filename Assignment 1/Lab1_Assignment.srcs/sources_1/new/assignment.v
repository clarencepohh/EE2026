`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.01.2024 15:53:45
// Design Name: 
// Module Name: assignment
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


module assignment(input sw0, sw1, sw2, sw3, sw4, sw5, sw6, sw7, sw8, sw9,
    output LED0, LED1, LED2, LED3, LED4, LED5, LED6, LED7, LED8, LED9, LED15,
    output SEG0, SEG1, SEG2, SEG3, SEG4, SEG5, SEG6, DP, AN0, AN1, AN2, AN3
    );
    
    assign LED0 = sw0;
    assign LED1 = sw1;
    assign LED2 = sw2;
    assign LED3 = sw3;
    assign LED4 = sw4;
    assign LED5 = sw5;
    assign LED6 = sw6;
    assign LED7 = sw7;
    assign LED8 = sw8;
    assign LED9 = sw9;
    assign LED15 = (sw4 & sw5 & sw7) & ~(sw0 | sw1 | sw2 | sw3 | sw6 | sw8 | sw9);
    
    assign AN0 = (~(sw0 | sw1 | sw2 | sw3 | sw6 | sw8 | sw9) & (sw4 & sw5 & sw7));
    assign AN1 = ~(~(sw0 | sw1 | sw2 | sw3 | sw6 | sw8 | sw9) & (sw4 & sw5 & sw7));
    assign AN2 = 0;
    assign AN3 = ~(sw0 | sw1 | sw2 | sw3 | sw6 | sw8 | sw9) & (sw4 & sw5 & sw7);
    
    assign DP = 1;
    
    assign SEG0 = 1; 
    assign SEG1 = 0;
    assign SEG2 = ~(~sw0 & ~sw1 & ~sw2 & ~sw3 & sw4 & sw5 & ~sw6 & sw7 & ~sw8 & ~sw9);
    assign SEG3 = 0;
    assign SEG4 = 1;
    assign SEG5 = 0;
    assign SEG6 = 0;
endmodule
