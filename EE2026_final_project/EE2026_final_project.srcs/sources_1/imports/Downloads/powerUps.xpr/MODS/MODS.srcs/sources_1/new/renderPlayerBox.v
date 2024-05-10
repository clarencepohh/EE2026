`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.04.2024 23:41:03
// Design Name: 
// Module Name: renderPlayerBox
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


module renderPlayerBox(
    input clock,
    input [12:0]pixel_index,
    output reg [15:0]oled_data
    );
    
    always @ (posedge clock) begin
        if (((pixel_index >= 3748) && (pixel_index <= 3765)) || ((pixel_index >= 3844) && (pixel_index <= 3861)) || ((pixel_index >= 3940) && (pixel_index <= 3957)) || ((pixel_index >= 4036) && (pixel_index <= 4053)) || ((pixel_index >= 4132) && (pixel_index <= 4149)) || ((pixel_index >= 4228) && (pixel_index <= 4245)) || ((pixel_index >= 4324) && (pixel_index <= 4341)) || ((pixel_index >= 4420) && (pixel_index <= 4437)) || ((pixel_index >= 4516) && (pixel_index <= 4533)) || ((pixel_index >= 4612) && (pixel_index <= 4629)) || ((pixel_index >= 4708) && (pixel_index <= 4725)) || ((pixel_index >= 4804) && (pixel_index <= 4821)) || ((pixel_index >= 4900) && (pixel_index <= 4917)) || ((pixel_index >= 4996) && (pixel_index <= 5013)) || ((pixel_index >= 5092) && (pixel_index <= 5109)) || ((pixel_index >= 5188) && (pixel_index <= 5205)) || (pixel_index >= 5284) && (pixel_index <= 5301)) oled_data = 16'b1111000000000000;
        else if (((pixel_index >= 3772) && (pixel_index <= 3789)) || ((pixel_index >= 3868) && (pixel_index <= 3885)) || ((pixel_index >= 3964) && (pixel_index <= 3981)) || ((pixel_index >= 4060) && (pixel_index <= 4077)) || ((pixel_index >= 4156) && (pixel_index <= 4173)) || ((pixel_index >= 4252) && (pixel_index <= 4269)) || ((pixel_index >= 4348) && (pixel_index <= 4365)) || ((pixel_index >= 4444) && (pixel_index <= 4461)) || ((pixel_index >= 4540) && (pixel_index <= 4557)) || ((pixel_index >= 4636) && (pixel_index <= 4653)) || ((pixel_index >= 4732) && (pixel_index <= 4749)) || ((pixel_index >= 4828) && (pixel_index <= 4845)) || ((pixel_index >= 4924) && (pixel_index <= 4941)) || ((pixel_index >= 5020) && (pixel_index <= 5037)) || ((pixel_index >= 5116) && (pixel_index <= 5133)) || ((pixel_index >= 5212) && (pixel_index <= 5229)) || (pixel_index >= 5308) && (pixel_index <= 5325)) oled_data = 16'b0000011110011110;
        else if (((pixel_index >= 3795) && (pixel_index <= 3812)) || ((pixel_index >= 3891) && (pixel_index <= 3908)) || ((pixel_index >= 3987) && (pixel_index <= 4004)) || ((pixel_index >= 4083) && (pixel_index <= 4100)) || ((pixel_index >= 4179) && (pixel_index <= 4196)) || ((pixel_index >= 4275) && (pixel_index <= 4292)) || ((pixel_index >= 4371) && (pixel_index <= 4388)) || ((pixel_index >= 4467) && (pixel_index <= 4484)) || ((pixel_index >= 4563) && (pixel_index <= 4580)) || ((pixel_index >= 4659) && (pixel_index <= 4676)) || ((pixel_index >= 4755) && (pixel_index <= 4772)) || ((pixel_index >= 4851) && (pixel_index <= 4868)) || ((pixel_index >= 4947) && (pixel_index <= 4964)) || ((pixel_index >= 5043) && (pixel_index <= 5060)) || ((pixel_index >= 5139) && (pixel_index <= 5156)) || ((pixel_index >= 5235) && (pixel_index <= 5252)) || (pixel_index >= 5331) && (pixel_index <= 5348)) oled_data = 16'b0000011110000000;
        else if (((pixel_index >= 3819) && (pixel_index <= 3836)) || ((pixel_index >= 3915) && (pixel_index <= 3932)) || ((pixel_index >= 4011) && (pixel_index <= 4028)) || ((pixel_index >= 4107) && (pixel_index <= 4124)) || ((pixel_index >= 4203) && (pixel_index <= 4220)) || ((pixel_index >= 4299) && (pixel_index <= 4316)) || ((pixel_index >= 4395) && (pixel_index <= 4412)) || ((pixel_index >= 4491) && (pixel_index <= 4508)) || ((pixel_index >= 4587) && (pixel_index <= 4604)) || ((pixel_index >= 4683) && (pixel_index <= 4700)) || ((pixel_index >= 4779) && (pixel_index <= 4796)) || ((pixel_index >= 4875) && (pixel_index <= 4892)) || ((pixel_index >= 4971) && (pixel_index <= 4988)) || ((pixel_index >= 5067) && (pixel_index <= 5084)) || ((pixel_index >= 5163) && (pixel_index <= 5180)) || ((pixel_index >= 5259) && (pixel_index <= 5276)) || (pixel_index >= 5355) && (pixel_index <= 5372)) oled_data = 16'b1111011110000000;
        else oled_data = 0;
    end
endmodule
