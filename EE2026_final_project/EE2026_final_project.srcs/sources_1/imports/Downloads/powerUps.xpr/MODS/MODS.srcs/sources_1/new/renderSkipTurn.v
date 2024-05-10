`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.04.2024 12:25:44
// Design Name: 
// Module Name: renderSkipTurn
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


module renderSkipTurn(
    input clock,
    input [12:0]pixel_index,
    input [3:0]powerUps,
    output reg [15:0]oled_data
    );
    
    always @ (posedge clock) begin
        if (((pixel_index >= 3331) && (pixel_index <= 3356)) || pixel_index == 3427 || pixel_index == 3452 || pixel_index == 3523 || pixel_index == 3548 || pixel_index == 3619 || pixel_index == 3644 || pixel_index == 3715 || pixel_index == 3740 || pixel_index == 3811 || pixel_index == 3836 || pixel_index == 3907 || pixel_index == 3932 || pixel_index == 4003 || pixel_index == 4028 || pixel_index == 4099 || pixel_index == 4124 || pixel_index == 4195 || pixel_index == 4220 || pixel_index == 4291 || pixel_index == 4316 || pixel_index == 4387 || ((pixel_index >= 4394) && (pixel_index <= 4406)) || pixel_index == 4412 || pixel_index == 4483 || ((pixel_index >= 4490) && (pixel_index <= 4502)) || pixel_index == 4508 || pixel_index == 4579 || ((pixel_index >= 4586) && (pixel_index <= 4598)) || pixel_index == 4604 || pixel_index == 4675 || pixel_index == 4700 || pixel_index == 4771 || pixel_index == 4796 || pixel_index == 4867 || pixel_index == 4892 || pixel_index == 4963 || pixel_index == 4988 || pixel_index == 5059 || pixel_index == 5084 || pixel_index == 5155 || pixel_index == 5180 || pixel_index == 5251 || pixel_index == 5276 || pixel_index == 5347 || pixel_index == 5372 || pixel_index == 5443 || pixel_index == 5468 || pixel_index == 5539 || pixel_index == 5564 || pixel_index == 5635 || pixel_index == 5660 || (pixel_index >= 5731) && (pixel_index <= 5756)) oled_data = 16'b1111011110011110;
        else if (((pixel_index >= 3627) && (pixel_index <= 3628)) || ((pixel_index >= 3722) && (pixel_index <= 3723)) || ((pixel_index >= 3817) && (pixel_index <= 3818)) || ((pixel_index >= 3912) && (pixel_index <= 3913)) || ((pixel_index >= 4007) && (pixel_index <= 4008)) || ((pixel_index >= 4102) && (pixel_index <= 4103)) || ((pixel_index >= 4198) && (pixel_index <= 4199)) || ((pixel_index >= 4294) && (pixel_index <= 4295)) || ((pixel_index >= 4390) && (pixel_index <= 4391)) || ((pixel_index >= 4486) && (pixel_index <= 4487)) || ((pixel_index >= 4582) && (pixel_index <= 4583)) || ((pixel_index >= 4678) && (pixel_index <= 4679)) || ((pixel_index >= 4774) && (pixel_index <= 4775)) || ((pixel_index >= 4870) && (pixel_index <= 4871)) || ((pixel_index >= 4967) && (pixel_index <= 4968)) || ((pixel_index >= 5064) && (pixel_index <= 5065)) || ((pixel_index >= 5161) && (pixel_index <= 5162)) || ((pixel_index >= 5258) && (pixel_index <= 5259)) || (pixel_index >= 5355) && (pixel_index <= 5356)) oled_data = 16'b0101000000000000;
        else if (((pixel_index >= 3629) && (pixel_index <= 3636)) || ((pixel_index >= 3724) && (pixel_index <= 3733)) || ((pixel_index >= 3819) && (pixel_index <= 3830)) || ((pixel_index >= 3914) && (pixel_index <= 3927)) || ((pixel_index >= 4009) && (pixel_index <= 4024)) || ((pixel_index >= 4104) && (pixel_index <= 4121)) || ((pixel_index >= 4200) && (pixel_index <= 4217)) || ((pixel_index >= 4296) && (pixel_index <= 4313)) || ((pixel_index >= 4392) && (pixel_index <= 4393)) || ((pixel_index >= 4407) && (pixel_index <= 4409)) || ((pixel_index >= 4488) && (pixel_index <= 4489)) || ((pixel_index >= 4503) && (pixel_index <= 4505)) || ((pixel_index >= 4584) && (pixel_index <= 4585)) || ((pixel_index >= 4599) && (pixel_index <= 4601)) || ((pixel_index >= 4680) && (pixel_index <= 4697)) || ((pixel_index >= 4776) && (pixel_index <= 4793)) || ((pixel_index >= 4872) && (pixel_index <= 4889)) || ((pixel_index >= 4969) && (pixel_index <= 4984)) || ((pixel_index >= 5066) && (pixel_index <= 5079)) || ((pixel_index >= 5163) && (pixel_index <= 5174)) || ((pixel_index >= 5260) && (pixel_index <= 5269)) || (pixel_index >= 5357) && (pixel_index <= 5364)) oled_data = 16'b1111000000000000;
        else oled_data = 0;
    end
endmodule
