`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.02.2024 15:54:01
// Design Name: 
// Module Name: LSB_4_bit_adder
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


module LSB_4_bit_adder(input [3:0]A, [3:0]B, output [3:0]S, output C4);

    wire C0, C1, C2, C3;
    assign C0 = 0;
    
    one_bit_adder adder0(A[0], B[0], C0, S[0], C1);
    one_bit_adder adder1(A[1], B[1], C1, S[1], C2);
    one_bit_adder adder2(A[2], B[2], C2, S[2], C3);
    one_bit_adder adder3(A[3], B[3], C3, S[3], C4);
    
endmodule
