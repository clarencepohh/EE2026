`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.03.2024 16:17:27
// Design Name: 
// Module Name: pixel_index_to_cartesian
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


module pixel_index_to_cartesian(input [12:0] pixel_index,
                                output [7:0] x, output [6:0] y);

    assign x = pixel_index % 96;
    assign y = pixel_index / 96; 

endmodule
