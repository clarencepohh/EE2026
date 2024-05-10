`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.03.2024 11:32:04
// Design Name: 
// Module Name: selectPowerUp
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


module selectPowerUp(
    input clock,
    input [3:0]turnActive,
    input sw,
    input btnL, btnR, btnC, btnD,
    input [12:0]pixel_index,
    output reg skipTurnSelected,
    output reg [1:0]confirm,
    output reg [2:0]box_idx,
    output reg [3:0]powerUps,
    output reg [2:0]enemySelected,
    output reg [15:0]oled_data,
    output skipFlag
    );
    
    wire [2:0]b_idx;
    wire [2:0]p_idx;
    wire [3:0]myPowerUps;
    wire [1:0]myConfirm;
    wire skipTurn;
    wire [2:0]enemyIdx;
    
    boxChooser(clock, turnActive, sw, btnL, btnR, btnC, btnD, skipTurn, p_idx, b_idx, myConfirm, myPowerUps, skipFlag);
        
    always @ (posedge clock) begin
        if (confirm != 2 && !skipTurnSelected) begin
            if (b_idx == 2) begin
                if (((pixel_index >= 3073) && (pixel_index <= 3103)) || pixel_index == 3169 || pixel_index == 3199 || pixel_index == 3265 || pixel_index == 3295 || pixel_index == 3361 || pixel_index == 3391 || pixel_index == 3457 || pixel_index == 3487 || pixel_index == 3553 || pixel_index == 3583 || pixel_index == 3649 || pixel_index == 3679 || pixel_index == 3745 || pixel_index == 3775 || pixel_index == 3841 || pixel_index == 3871 || pixel_index == 3937 || pixel_index == 3967 || pixel_index == 4033 || pixel_index == 4063 || pixel_index == 4129 || pixel_index == 4159 || pixel_index == 4225 || pixel_index == 4255 || pixel_index == 4321 || pixel_index == 4351 || pixel_index == 4417 || pixel_index == 4447 || pixel_index == 4513 || pixel_index == 4543 || pixel_index == 4609 || pixel_index == 4639 || pixel_index == 4705 || pixel_index == 4735 || pixel_index == 4801 || pixel_index == 4831 || pixel_index == 4897 || pixel_index == 4927 || pixel_index == 4993 || pixel_index == 5023 || pixel_index == 5089 || pixel_index == 5119 || pixel_index == 5185 || pixel_index == 5215 || pixel_index == 5281 || pixel_index == 5311 || pixel_index == 5377 || pixel_index == 5407 || pixel_index == 5473 || pixel_index == 5503 || pixel_index == 5569 || pixel_index == 5599 || pixel_index == 5665 || pixel_index == 5695 || pixel_index == 5761 || pixel_index == 5791 || (pixel_index >= 5857) && (pixel_index <= 5887)) oled_data <= 16'b0000011110000000;
                else oled_data <= 0;
            end
            if (b_idx == 1) begin
                if (((pixel_index >= 3105) && (pixel_index <= 3135)) || pixel_index == 3201 || pixel_index == 3231 || pixel_index == 3297 || pixel_index == 3327 || pixel_index == 3393 || pixel_index == 3423 || pixel_index == 3489 || pixel_index == 3519 || pixel_index == 3585 || pixel_index == 3615 || pixel_index == 3681 || pixel_index == 3711 || pixel_index == 3777 || pixel_index == 3807 || pixel_index == 3873 || pixel_index == 3903 || pixel_index == 3969 || pixel_index == 3999 || pixel_index == 4065 || pixel_index == 4095 || pixel_index == 4161 || pixel_index == 4191 || pixel_index == 4257 || pixel_index == 4287 || pixel_index == 4353 || pixel_index == 4383 || pixel_index == 4449 || pixel_index == 4479 || pixel_index == 4545 || pixel_index == 4575 || pixel_index == 4641 || pixel_index == 4671 || pixel_index == 4737 || pixel_index == 4767 || pixel_index == 4833 || pixel_index == 4863 || pixel_index == 4929 || pixel_index == 4959 || pixel_index == 5025 || pixel_index == 5055 || pixel_index == 5121 || pixel_index == 5151 || pixel_index == 5217 || pixel_index == 5247 || pixel_index == 5313 || pixel_index == 5343 || pixel_index == 5409 || pixel_index == 5439 || pixel_index == 5505 || pixel_index == 5535 || pixel_index == 5601 || pixel_index == 5631 || pixel_index == 5697 || pixel_index == 5727 || pixel_index == 5793 || pixel_index == 5823 || (pixel_index >= 5889) && (pixel_index <= 5919)) oled_data <= 16'b0000011110000000;
                else oled_data <= 0;
            end
            if (b_idx == 0) begin
                if (((pixel_index >= 3137) && (pixel_index <= 3166)) || pixel_index == 3233 || pixel_index == 3262 || pixel_index == 3329 || pixel_index == 3358 || pixel_index == 3425 || pixel_index == 3454 || pixel_index == 3521 || pixel_index == 3550 || pixel_index == 3617 || pixel_index == 3646 || pixel_index == 3713 || pixel_index == 3742 || pixel_index == 3809 || pixel_index == 3838 || pixel_index == 3905 || pixel_index == 3934 || pixel_index == 4001 || pixel_index == 4030 || pixel_index == 4097 || pixel_index == 4126 || pixel_index == 4193 || pixel_index == 4222 || pixel_index == 4289 || pixel_index == 4318 || pixel_index == 4385 || pixel_index == 4414 || pixel_index == 4481 || pixel_index == 4510 || pixel_index == 4577 || pixel_index == 4606 || pixel_index == 4673 || pixel_index == 4702 || pixel_index == 4769 || pixel_index == 4798 || pixel_index == 4865 || pixel_index == 4894 || pixel_index == 4961 || pixel_index == 4990 || pixel_index == 5057 || pixel_index == 5086 || pixel_index == 5153 || pixel_index == 5182 || pixel_index == 5249 || pixel_index == 5278 || pixel_index == 5345 || pixel_index == 5374 || pixel_index == 5441 || pixel_index == 5470 || pixel_index == 5537 || pixel_index == 5566 || pixel_index == 5633 || pixel_index == 5662 || pixel_index == 5729 || pixel_index == 5758 || pixel_index == 5825 || pixel_index == 5854 || (pixel_index >= 5921) && (pixel_index <= 5950)) oled_data <= 16'b0000011110000000;
                else oled_data <= 0;
            end
        end
        if (confirm != 2 && skipTurnSelected) begin
            if (p_idx == 0) begin
                if (((pixel_index >= 3554) && (pixel_index <= 3575)) || pixel_index == 3650 || pixel_index == 3671 || pixel_index == 3746 || pixel_index == 3767 || pixel_index == 3842 || pixel_index == 3863 || pixel_index == 3938 || pixel_index == 3959 || pixel_index == 4034 || pixel_index == 4055 || pixel_index == 4130 || pixel_index == 4151 || pixel_index == 4226 || pixel_index == 4247 || pixel_index == 4322 || pixel_index == 4343 || pixel_index == 4418 || pixel_index == 4439 || pixel_index == 4514 || pixel_index == 4535 || pixel_index == 4610 || pixel_index == 4631 || pixel_index == 4706 || pixel_index == 4727 || pixel_index == 4802 || pixel_index == 4823 || pixel_index == 4898 || pixel_index == 4919 || pixel_index == 4994 || pixel_index == 5015 || pixel_index == 5090 || pixel_index == 5111 || pixel_index == 5186 || pixel_index == 5207 || pixel_index == 5282 || pixel_index == 5303 || pixel_index == 5378 || pixel_index == 5399 || (pixel_index >= 5474) && (pixel_index <= 5495)) oled_data <= 16'b1111011110011110;
                else oled_data <= 0;
            end
            if (p_idx == 1) begin
                if (((pixel_index >= 3578) && (pixel_index <= 3599)) || pixel_index == 3674 || pixel_index == 3695 || pixel_index == 3770 || pixel_index == 3791 || pixel_index == 3866 || pixel_index == 3887 || pixel_index == 3962 || pixel_index == 3983 || pixel_index == 4058 || pixel_index == 4079 || pixel_index == 4154 || pixel_index == 4175 || pixel_index == 4250 || pixel_index == 4271 || pixel_index == 4346 || pixel_index == 4367 || pixel_index == 4442 || pixel_index == 4463 || pixel_index == 4538 || pixel_index == 4559 || pixel_index == 4634 || pixel_index == 4655 || pixel_index == 4730 || pixel_index == 4751 || pixel_index == 4826 || pixel_index == 4847 || pixel_index == 4922 || pixel_index == 4943 || pixel_index == 5018 || pixel_index == 5039 || pixel_index == 5114 || pixel_index == 5135 || pixel_index == 5210 || pixel_index == 5231 || pixel_index == 5306 || pixel_index == 5327 || pixel_index == 5402 || pixel_index == 5423 || (pixel_index >= 5498) && (pixel_index <= 5519)) oled_data <= 16'b1111011110011110;
                else oled_data <= 0;
            end
            if (p_idx == 2) begin
                if (((pixel_index >= 3601) && (pixel_index <= 3622)) || pixel_index == 3697 || pixel_index == 3718 || pixel_index == 3793 || pixel_index == 3814 || pixel_index == 3889 || pixel_index == 3910 || pixel_index == 3985 || pixel_index == 4006 || pixel_index == 4081 || pixel_index == 4102 || pixel_index == 4177 || pixel_index == 4198 || pixel_index == 4273 || pixel_index == 4294 || pixel_index == 4369 || pixel_index == 4390 || pixel_index == 4465 || pixel_index == 4486 || pixel_index == 4561 || pixel_index == 4582 || pixel_index == 4657 || pixel_index == 4678 || pixel_index == 4753 || pixel_index == 4774 || pixel_index == 4849 || pixel_index == 4870 || pixel_index == 4945 || pixel_index == 4966 || pixel_index == 5041 || pixel_index == 5062 || pixel_index == 5137 || pixel_index == 5158 || pixel_index == 5233 || pixel_index == 5254 || pixel_index == 5329 || pixel_index == 5350 || pixel_index == 5425 || pixel_index == 5446 || (pixel_index >= 5521) && (pixel_index <= 5542)) oled_data = 16'b1111011110011110;
                else oled_data = 0;
            end
            if (p_idx == 3) begin
                if (((pixel_index >= 3625) && (pixel_index <= 3646)) || pixel_index == 3721 || pixel_index == 3742 || pixel_index == 3817 || pixel_index == 3838 || pixel_index == 3913 || pixel_index == 3934 || pixel_index == 4009 || pixel_index == 4030 || pixel_index == 4105 || pixel_index == 4126 || pixel_index == 4201 || pixel_index == 4222 || pixel_index == 4297 || pixel_index == 4318 || pixel_index == 4393 || pixel_index == 4414 || pixel_index == 4489 || pixel_index == 4510 || pixel_index == 4585 || pixel_index == 4606 || pixel_index == 4681 || pixel_index == 4702 || pixel_index == 4777 || pixel_index == 4798 || pixel_index == 4873 || pixel_index == 4894 || pixel_index == 4969 || pixel_index == 4990 || pixel_index == 5065 || pixel_index == 5086 || pixel_index == 5161 || pixel_index == 5182 || pixel_index == 5257 || pixel_index == 5278 || pixel_index == 5353 || pixel_index == 5374 || pixel_index == 5449 || pixel_index == 5470 || (pixel_index >= 5545) && (pixel_index <= 5566)) oled_data <= 16'b1111011110011110;
                else oled_data = 0;
            end
        end
        box_idx <= b_idx;
        confirm <= myConfirm;
        skipTurnSelected <= skipTurn;
    end
    
    always @ (myPowerUps) begin
        powerUps <= myPowerUps;
    end
    
    always @ (p_idx) begin
        enemySelected <= p_idx;
    end
    
endmodule
