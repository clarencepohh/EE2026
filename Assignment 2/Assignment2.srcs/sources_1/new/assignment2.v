`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.02.2024 15:34:02
// Design Name: 
// Module Name: assignment2
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


module assignment2(input [6:0]A, [6:0]B, input pb, output [6:0]S, [5:0]T, [3:0]an, [7:0]seg);

    assign an = 4'b1000;
    assign seg = 8'b10100001;
    wire LSBtoMSBcarry;
    wire [6:0] DR;
    wire [6:0] AR;
    wire discardedCarry;
    
    LSB_4_bit_adder LSB_adder(.A(A[3:0]), .B(B[3:0]), .S(DR[3:0]), .C4(LSBtoMSBcarry));
    MSB_3_bit_adder MSB_adder(.A(A[6:4]), .B(B[6:4]), .LSB_carry(LSBtoMSBcarry), .S(DR[6:4]), .C6(discardedCarry));
    
    assign AR = {3'b000, DR[6:3]};
    assign T[5:0] = pb ? 6'b111111 : 6'b000000;
    assign S = pb ? AR : DR;
endmodule
