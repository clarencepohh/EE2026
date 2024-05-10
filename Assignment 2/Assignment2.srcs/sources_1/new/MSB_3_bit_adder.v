`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.02.2024 15:57:22
// Design Name: 
// Module Name: MSB_3_bit_adder
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


module MSB_3_bit_adder(input [6:4]A, [6:4]B, input LSB_carry, output [6:4]S, output C6);

    wire C4, C5;

    one_bit_adder adder4(A[4], B[4], LSB_carry, S[4], C4);
    one_bit_adder adder5(A[5], B[5], C4, S[5], C5);
    one_bit_adder adder6(A[6], B[6], C5, S[6], C6);
    
endmodule
