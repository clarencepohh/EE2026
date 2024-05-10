`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.04.2024 12:25:44
// Design Name: 
// Module Name: renderDoubleJump
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


module renderDoubleJump(
    input clock,
    input [12:0]pixel_index,
    input [3:0]powerUps,
    output reg [15:0]oled_data
    );
    
    always @ (posedge clock) begin
        if (((pixel_index >= 3267) && (pixel_index <= 3293)) || pixel_index == 3363 || pixel_index == 3389 || pixel_index == 3459 || pixel_index == 3485 || pixel_index == 3555 || pixel_index == 3581 || pixel_index == 3651 || pixel_index == 3677 || pixel_index == 3747 || pixel_index == 3773 || pixel_index == 3843 || pixel_index == 3869 || pixel_index == 3939 || pixel_index == 3965 || pixel_index == 4035 || pixel_index == 4061 || pixel_index == 4131 || pixel_index == 4157 || pixel_index == 4227 || pixel_index == 4253 || pixel_index == 4323 || pixel_index == 4349 || pixel_index == 4419 || pixel_index == 4445 || pixel_index == 4515 || pixel_index == 4541 || pixel_index == 4611 || pixel_index == 4637 || pixel_index == 4707 || pixel_index == 4733 || pixel_index == 4803 || pixel_index == 4829 || pixel_index == 4899 || pixel_index == 4925 || pixel_index == 4995 || pixel_index == 5021 || pixel_index == 5091 || pixel_index == 5117 || pixel_index == 5187 || pixel_index == 5213 || pixel_index == 5283 || pixel_index == 5309 || pixel_index == 5379 || pixel_index == 5405 || pixel_index == 5475 || pixel_index == 5501 || pixel_index == 5571 || pixel_index == 5597 || (pixel_index >= 5667) && (pixel_index <= 5693)) oled_data = 16'b1111011110011110;
        else if (pixel_index == 3760 || ((pixel_index >= 3855) && (pixel_index <= 3857)) || ((pixel_index >= 3950) && (pixel_index <= 3954)) || ((pixel_index >= 4045) && (pixel_index <= 4047)) || ((pixel_index >= 4049) && (pixel_index <= 4051)) || ((pixel_index >= 4140) && (pixel_index <= 4142)) || ((pixel_index >= 4146) && (pixel_index <= 4148)) || ((pixel_index >= 4235) && (pixel_index <= 4237)) || ((pixel_index >= 4243) && (pixel_index <= 4245)) || ((pixel_index >= 4330) && (pixel_index <= 4332)) || ((pixel_index >= 4340) && (pixel_index <= 4342)) || ((pixel_index >= 4425) && (pixel_index <= 4427)) || pixel_index == 4432 || ((pixel_index >= 4437) && (pixel_index <= 4439)) || ((pixel_index >= 4520) && (pixel_index <= 4522)) || ((pixel_index >= 4527) && (pixel_index <= 4529)) || ((pixel_index >= 4534) && (pixel_index <= 4536)) || ((pixel_index >= 4616) && (pixel_index <= 4617)) || ((pixel_index >= 4622) && (pixel_index <= 4626)) || ((pixel_index >= 4631) && (pixel_index <= 4632)) || ((pixel_index >= 4717) && (pixel_index <= 4719)) || ((pixel_index >= 4721) && (pixel_index <= 4723)) || ((pixel_index >= 4812) && (pixel_index <= 4814)) || ((pixel_index >= 4818) && (pixel_index <= 4820)) || ((pixel_index >= 4907) && (pixel_index <= 4909)) || ((pixel_index >= 4915) && (pixel_index <= 4917)) || ((pixel_index >= 5002) && (pixel_index <= 5004)) || ((pixel_index >= 5012) && (pixel_index <= 5014)) || ((pixel_index >= 5097) && (pixel_index <= 5099)) || ((pixel_index >= 5109) && (pixel_index <= 5111)) || ((pixel_index >= 5193) && (pixel_index <= 5194)) || (pixel_index >= 5206) && (pixel_index <= 5207)) oled_data = 16'b0000011110011110;        
        else oled_data = 0;
    end
endmodule
