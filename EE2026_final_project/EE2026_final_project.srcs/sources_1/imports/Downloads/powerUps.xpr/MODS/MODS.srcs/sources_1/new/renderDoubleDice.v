`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.04.2024 12:25:44
// Design Name: 
// Module Name: renderDoubleDice
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


module renderDoubleDice(
    input clock,
    input [12:0]pixel_index,
    input [3:0]powerUps,
    output reg [15:0]oled_data
    );
    
    always @ (posedge clock) begin
        if (((pixel_index >= 3299) && (pixel_index <= 3325)) || pixel_index == 3395 || pixel_index == 3421 || pixel_index == 3491 || pixel_index == 3517 || pixel_index == 3587 || pixel_index == 3613 || pixel_index == 3683 || pixel_index == 3709 || pixel_index == 3779 || pixel_index == 3805 || pixel_index == 3875 || pixel_index == 3901 || pixel_index == 3971 || pixel_index == 3997 || pixel_index == 4067 || pixel_index == 4093 || pixel_index == 4163 || ((pixel_index >= 4165) && (pixel_index <= 4174)) || pixel_index == 4189 || pixel_index == 4259 || pixel_index == 4261 || ((pixel_index >= 4264) && (pixel_index <= 4267)) || pixel_index == 4270 || pixel_index == 4285 || pixel_index == 4355 || pixel_index == 4357 || ((pixel_index >= 4360) && (pixel_index <= 4363)) || pixel_index == 4366 || pixel_index == 4381 || pixel_index == 4451 || ((pixel_index >= 4453) && (pixel_index <= 4462)) || pixel_index == 4477 || pixel_index == 4547 || ((pixel_index >= 4549) && (pixel_index <= 4552)) || ((pixel_index >= 4555) && (pixel_index <= 4558)) || pixel_index == 4573 || pixel_index == 4643 || ((pixel_index >= 4645) && (pixel_index <= 4648)) || ((pixel_index >= 4651) && (pixel_index <= 4654)) || pixel_index == 4669 || pixel_index == 4739 || ((pixel_index >= 4741) && (pixel_index <= 4750)) || pixel_index == 4765 || pixel_index == 4835 || pixel_index == 4837 || ((pixel_index >= 4840) && (pixel_index <= 4843)) || pixel_index == 4846 || pixel_index == 4861 || pixel_index == 4931 || pixel_index == 4933 || ((pixel_index >= 4936) && (pixel_index <= 4939)) || pixel_index == 4942 || pixel_index == 4957 || pixel_index == 5027 || ((pixel_index >= 5029) && (pixel_index <= 5038)) || pixel_index == 5053 || pixel_index == 5123 || pixel_index == 5149 || pixel_index == 5219 || pixel_index == 5245 || pixel_index == 5315 || pixel_index == 5341 || pixel_index == 5411 || pixel_index == 5437 || pixel_index == 5507 || pixel_index == 5533 || pixel_index == 5603 || pixel_index == 5629 || (pixel_index >= 5699) && (pixel_index <= 5725)) oled_data = 16'b1111011110011110;
        else if (pixel_index == 4185 || pixel_index == 4280 || pixel_index == 4282 || pixel_index == 4375 || pixel_index == 4379 || pixel_index == 4465 || pixel_index == 4469 || pixel_index == 4475 || pixel_index == 4562 || pixel_index == 4564 || pixel_index == 4571 || pixel_index == 4659 || pixel_index == 4666 || pixel_index == 4754 || pixel_index == 4756 || pixel_index == 4761 || pixel_index == 4849 || pixel_index == 4853 || pixel_index == 4856 || pixel_index == 4951 || (pixel_index >= 5047) && (pixel_index <= 5051)) oled_data = 16'b1111011110000000;
        else oled_data = 0;
    end
endmodule
